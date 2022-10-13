FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Oslo

# libRadtran version
ENV LRT_VERSION=2.0.4

# Install packages
RUN apt -y update && apt -y upgrade
RUN apt -y install apt-transport-https\
                bash \
                build-essential\
                build-essential\
                flex\
                gawk\
                gcc\
                gfortran\
                git\
                gsl-bin\
                libgsl-dbg\
                libgsl-dev\
                libnetcdf-dev\
                libpnetcdf-dev\
                linux-headers-generic\
                make\ 
                nano\
                net-tools\
                netcdf-bin\
                perl\
                pkg-config\
                python2\
                tzdata\
                wget

#COPY libRadtran-${LRT_VERSION}.tar.gz /libRadtran-${LRT_VERSION}.tar.gz
RUN wget http://www.libradtran.org/download/libRadtran-${LRT_VERSION}.tar.gz
                
# Unpack libRadtran
RUN gzip -d /libRadtran-${LRT_VERSION}.tar.gz
RUN tar -xvf /libRadtran-${LRT_VERSION}.tar

# Compile libRadtran
WORKDIR /libRadtran-${LRT_VERSION}
RUN chmod +x /libRadtran-${LRT_VERSION}/configure
RUN /libRadtran-${LRT_VERSION}/configure 

# libRadtran does not build cleanly, need to run make multiple times...
RUN make || true 
RUN make || true 
RUN make || true 

# Add libRadtran to path
ENV PATH="${PATH}:/libRadtran-${LRT_VERSION}/bin/"

#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
