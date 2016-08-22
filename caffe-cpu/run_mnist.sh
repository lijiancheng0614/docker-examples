docker stop caffe-temp
docker rm caffe-temp
docker run -ti --name caffe-temp caffe:cpu bash -c "/opt/caffe/data/mnist/get_mnist.sh; cd /opt/caffe; ./examples/mnist/create_mnist.sh"
docker cp caffe-temp:/opt/caffe/examples/mnist .
sed -ig 's/examples\/mnist\///g' mnist/lenet_train_test.prototxt
sed -ig 's/examples\/mnist\///g' mnist/lenet_solver.prototxt
sed -ig '$s/GPU/CPU/g' mnist/lenet_solver.prototxt
docker rm caffe-temp
docker run -ti --name caffe-temp --volume=$(pwd)/mnist:/workspace caffe:cpu caffe train --solver=lenet_solver.prototxt
docker rm caffe-temp
