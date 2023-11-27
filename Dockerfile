FROM alpine/socat

# Install Python and pip
USER root
RUN apk --update add python3 py3-pip \
    && adduser -D -u 1000 jenkins \
    && addgroup jenkins docker
USER jenkins

# Set the default Python version
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Optionally, you can install additional Python packages
# RUN pip3 install some-package another-package

CMD ["socat", "tcp-listen:2375,fork,reuseaddr", "unix-connect:/var/run/docker.sock"]
