[![Docker Repository on Quay](https://quay.io/repository/thomasjungblut/tfs-inception/status "Docker Repository on Quay")](https://quay.io/repository/thomasjungblut/tfs-inception)

# Tensorflow Serving

This docker image contains Tensorflow Serving (TFS) 1.8 with GPU support and a ready to run inceptionv3 model. 

The resulting image can be used in conjunction with the helm chart from [Tensorflow Inception Model Chart
](https://github.com/kubernetes/charts/tree/master/incubator/tensorflow-inception). 


With plain docker you can run via:

```bash
docker run -i --expose=9000 quay.io/thomasjungblut/tfs-inception tensorflow_model_server --port=9000 --model_name=inception --model_base_path=/serving/inception-export
```

For GPU support you can either use `nvidia-docker` or the `nvidia` runtime.

