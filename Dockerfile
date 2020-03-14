FROM debian:10

RUN apt-get update && apt-get install -y ansible ansible-tower-cli vim sshpass python3 python3-pip unzip curl git
RUN echo "set mouse-=a" >> /root/.vimrc
RUN sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
RUN echo -e 'y\n' | ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
RUN curl -L -O https://github.com/oracle/oci-cli/releases/download/v2.8.1/oci-cli-2.8.1.zip
RUN unzip oci-cli-2.8.1.zip
RUN cd oci-cli && \
    pip3 install oci_cli-*-py2.py3-none-any.whl
CMD bash
