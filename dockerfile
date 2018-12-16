FROM ubuntu:18.04
RUN apt-get update && apt-get install apt-transport-https curl lsb-release software-properties-common -y && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
    --keyserver packages.microsoft.com \
    --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
RUN apt-get update && apt-get install apt-transport-https ca-certificates curl software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#RUN apt-key fingerprint 0EBFCD88 \
#    --pub   4096R/0EBFCD88 2017-02-22 \
#    --Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
#    --uid                  Docker Release (CE deb) <docker@docker.com> \
#    --sub   4096R/F273FCD8 2017-02-22
RUN apt-get update && apt-get install azure-cli kubectl docker-ce yarn -y 
#RUN apt-get update && apt-get install azure-cli kubectl -yla -a