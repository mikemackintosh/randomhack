FROM ubuntu:14.04
MAINTAINER Mike Mackintosh <m@zyp.io>

# Update Apt
RUN apt-get update

# Setup and run OpenVPN
RUN apt-get -y install openvpn git vtun
ADD ./contrib/openvpn/* /etc/openvpn/

# Clone Nikto and symlink
RUN git clone https://github.com/sullo/nikto /opt/nikto

# Setup entrypoint
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ['bash']
