#!/bin/bash

repos=(
DrQA
OpenNMT
allennlp
awd-lstm-lm
block
cyclegan
densenet
diracnets
drn
examples/dcgan
examples/fast_neural_style
examples/imagenet
examples/mnist
examples/mnist_hogwild
examples/regression
examples/reinforcement_learning
examples/snli
examples/super_resolution
examples/time_sequence_prediction
examples/vae
examples/word_language_model
fairseq
generative_collections
optnet
pyro
pytorch-a2c-ppo-acktr
pytorch-a3c
qpth
tensorly
torchMoji
tutorials
vqa
)


declare -A enabled
enabled=(
[DrQA]=false
[OpenNMT]=false
[allennlp]=false
[awd-lstm-lm]=false
[block]=true # true
[cyclegan]=true # true
[densenet]=true # true
[diracnets]=false # investigate 
[drn]=false 
[examples/dcgan]=true # true
[examples/fast_neural_style]=false
[examples/imagenet]=false
[examples/mnist]=true # true 
[examples/mnist_hogwild]=false # investigate
[examples/regression]=true # true
[examples/reinforcement_learning]=true # true
[examples/snli]=true # true
[examples/super_resolution]=true # true
[examples/time_sequence_prediction]=true # true
[examples/vae]=true # true
[examples/word_language_model]=true # true
[fairseq]=true # true
[generative_collections]=false
[optnet]=false
[pyro]=false
[pytorch-a2c-ppo-acktr]=false
[pytorch-a3c]=false
[qpth]=false
[tensorly]=false
[torchMoji]=false
[tutorials]=false
[vqa]=false
)

examples_commit=e11e079
declare -A repo_commits
repo_commits=(
[DrQA]=aaaaaa
[OpenNMT]=aaaaaa
[allennlp]=6cb107c
[awd-lstm-lm]=bf0742c
[block]=67289be
[cyclegan]=7a5e2cd
[densenet]=d1cd5e1
[diracnets]=8e85151
[drn]=4bd4024
[examples/dcgan]=$examples_commit
[examples/fast_neural_style]=$examples_commit
[examples/imagenet]=$examples_commit
[examples/mnist]=$examples_commit
[examples/mnist_hogwild]=$examples_commit
[examples/regression]=$examples_commit
[examples/reinforcement_learning]=$examples_commit
[examples/snli]=$examples_commit
[examples/super_resolution]=$examples_commit
[examples/time_sequence_prediction]=$examples_commit
[examples/vae]=$examples_commit
[examples/word_language_model]=$examples_commit
[fairseq]=ee36a6f
[generative_collections]=aaaaaa
[optnet]=aaaaaa
[pyro]=aaaaaa
[pytorch-a2c-ppo-acktr]=aaaaaa
[pytorch-a3c]=aaaaaa
[qpth]=aaaaaa
[tensorly]=aaaaaa
[torchMoji]=aaaaaa
[tutorials]=aaaaaa
[vqa]=aaaaaa
)

declare -A failures
failures=(
[DrQA]=disabled
[OpenNMT]=disabled
[allennlp]=disabled
[awd-lstm-lm]=disabled
[block]=disabled
[cyclegan]=disabled
[densenet]=disabled
[diracnets]=disabled
[drn]=disabled
[examples/dcgan]=disabled
[examples/fast_neural_style]=disabled
[examples/imagenet]=disabled
[examples/mnist]=disabled
[examples/mnist_hogwild]=disabled
[examples/regression]=disabled
[examples/reinforcement_learning]=disabled
[examples/snli]=disabled
[examples/super_resolution]=disabled
[examples/time_sequence_prediction]=disabled
[examples/vae]=disabled
[examples/word_language_model]=disabled
[fairseq]=disabled
[generative_collections]=disabled
[optnet]=disabled
[pyro]=disabled
[pytorch-a2c-ppo-acktr]=disabled
[pytorch-a3c]=disabled
[qpth]=disabled
[tensorly]=disabled
[torchMoji]=disabled
[tutorials]=disabled
[vqa]=disabled
)

declare -A timings
timings=(
[DrQA]=disabled
[OpenNMT]=disabled
[allennlp]=disabled
[awd-lstm-lm]=disabled
[block]=disabled
[cyclegan]=disabled
[densenet]=disabled
[diracnets]=disabled
[drn]=disabled
[examples/dcgan]=disabled
[examples/fast_neural_style]=disabled
[examples/imagenet]=disabled
[examples/mnist]=disabled
[examples/mnist_hogwild]=disabled
[examples/regression]=disabled
[examples/reinforcement_learning]=disabled
[examples/snli]=disabled
[examples/super_resolution]=disabled
[examples/time_sequence_prediction]=disabled
[examples/vae]=disabled
[examples/word_language_model]=disabled
[fairseq]=disabled
[generative_collections]=disabled
[optnet]=disabled
[pyro]=disabled
[pytorch-a2c-ppo-acktr]=disabled
[pytorch-a3c]=disabled
[qpth]=disabled
[tensorly]=disabled
[torchMoji]=disabled
[tutorials]=disabled
[vqa]=disabled
)

