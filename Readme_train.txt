***********************************************************************************************************


Training code for "Learning a Deep Convolutional Network for Image Super-Resolution" (ECCV 2014) 
and "Image Super-Resolution Using Deep Convolutional Networks" (TPAMI 2015)
by Chao Dong (ndc.forward@gmail.com)



***********************************************************************************************************



Usage:


1. Place the "SRCNN" folder into "($Caffe_Dir)/examples/"



2. Open MATLAB and direct to ($Caffe_Dir)/example/SRCNN, run 
"generate_train.m" and "generate_test.m" to generate training and test data.



3. To train our SRCNN, run
./build/tools/caffe train --solver examples/SRCNN/SRCNN_solver.prototxt



4. After training, you can extract parameters from the caffe model and save them in the format that can be used in our test package (SRCNN_v1). To do this, you need to install mat-caffe first, then open MATLAB and direct to ($Caffe_Dir) and run "saveFilters.m". The "($Caffe_Dir)/examples/SRCNN/x3.mat" will be there for you.
