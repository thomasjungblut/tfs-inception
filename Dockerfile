FROM tensorflow/serving:1.8.0-devel-gpu

RUN pip install tensorflow==1.8.0

RUN git clone https://github.com/tensorflow/models.git && \
    ln -s /tensorflow-serving/models/research/inception/inception/ /tensorflow-serving/tensorflow_serving/example/inception && \
    touch /tensorflow-serving/models/research/inception/inception/__init__.py && \
    touch /tensorflow-serving/models/research/inception/inception/slim/__init__.py

RUN curl -O http://download.tensorflow.org/models/image/imagenet/inception-v3-2016-03-01.tar.gz && \
    tar xzf inception-v3-2016-03-01.tar.gz && \
    python /tensorflow-serving/tensorflow_serving/example/inception_saved_model.py --checkpoint_dir=inception-v3 --output_dir=/serving/inception-export
    
EXPOSE 9090
