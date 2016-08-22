# docker-caffe-cpu

安装基于CPU的caffe到ubuntu 14.04。

Dockerfile使用https://github.com/BVLC/caffe/blob/master/docker/standalone/cpu/Dockerfile

## 生成image

```bash
docker build -t caffe:cpu .
```
即可生成名为`caffe`、tag为`cpu`的image。

## 运行mnist

运行`./run_mnist.sh`将执行以下操作：

1. 下载mnist数据集，并生成lmdb

2. 将模型和lmdb导出到本地

3. 修改默认配置文件中的路径

4. 挂载本地目录`./mnist`到`/workspace`，并进行训练

## 运行其它实例

只需把相关模型和数据放在某个文件夹（如`./workdir`，solver为`./workdir/solver.prototxt`），运行以下命令即可训练：
```
docker run -ti --volume=$(pwd)/workdir:/workspace caffe:cpu caffe train --solver=solver.prototxt
```

## 可视化模型

```bash
docker run -ti --volume=$(pwd)/mnist:/workspace caffe:cpu bash -c "apt-get update; apt-get install -y graphviz; python /opt/caffe/python/draw_net.py lenet_train_test.prototxt net.png"
```
即可生成模型`mnist/lenet_train_test.prototxt`的可视化图`mnist/net.png`。
