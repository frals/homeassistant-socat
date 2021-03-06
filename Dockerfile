FROM "homeassistant/home-assistant:latest"
LABEL maintainer="frals"

RUN mkdir /runwatch
COPY runwatch/run.sh /runwatch/run.sh

# Monitor HomeAssistant
COPY runwatch/200.home-assistant.enabled.sh /runwatch/200.home-assistant.enabled.sh

# Install socat
RUN apt update
RUN apt install -y --no-install-recommends apt-utils 
RUN apt install -y --no-install-recommends socat

# Monitor socat
COPY runwatch/100.socat-zwave.enabled.sh /runwatch/100.socat-zwave.enabled.sh

# clear apt stuff


CMD [ "bash","/runwatch/run.sh" ]
