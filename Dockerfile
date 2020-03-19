FROM debian:10

RUN apt-get update && apt-get install -y ansible ansible-tower-cli vim sshpass python3 python3-pip unzip curl git
RUN echo "set mouse-=a" >> /root/.vimrc
RUN sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
RUN echo -e 'y\n' | ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
RUN curl -o install.sh -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh && \
    chmod +x install.sh && \
    ./install.sh --accept-all-defaults
CMD bash
