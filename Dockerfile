#
#  Docker container with Python 3 version of Tensorflow accompanied by Jupyter and Cryptomon API stuff.
#

FROM erroneousboat/tensorflow-python3-jupyter
MAINTAINER https://cryptomon.io "cryptomonio@gmail.com"

# Install dependencies
RUN apt-get update && \
 apt-get update -qq && apt-get install -y -qq vim zip unzip git && \
 pip3 install sklearn requests

# Pull Cryptomon Git repos
RUN git clone https://github.com/cryptomon-io/api-client /notebooks/API_Client
RUN git clone https://github.com/cryptomon-io/mlrp-and-kneighborsregressor /notebooks/MLPR_and_KNeighborsRegressor
RUN git clone https://github.com/cryptomon-io/cnn-custom-indicators /notebooks/CNN_Custom_Indicators
RUN git clone https://github.com/cryptomon-io/whale-moves-indicator /notebooks/Whale_Moves_Indicator

# Run the command on container startup
CMD /bin/sh /run_jupyter.sh;

WORKDIR /notebooks
