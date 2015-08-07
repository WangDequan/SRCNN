caffe.reset_all();
clear; close all;
%% settings
folder = 'examples/SRCNN/';
model = [folder 'SRCNN_mat.prototxt'];
weights = [folder 'SRCNN_iter_500.caffemodel'];
savepath = [folder 'x3.mat'];
layers = 3;

%% load model using mat_caffe
net = caffe.Net(model,weights,'test');

%% reshap parameters
weights_conv = cell(layers,1);

for idx = 1 : layers
    conv_filters = net.layers(['conv' num2str(idx)]).params(1).get_data();
    [~,fsize,channel,fnum] = size(conv_filters);

    if channel == 1
        weights = single(ones(fsize^2, fnum));
    else
        weights = single(ones(channel, fsize^2, fnum));
    end
    
    for i = 1 : channel
        for j = 1 : fnum
             temp = conv_filters(:,:,i,j);
             if channel == 1
                weights(:,j) = temp(:);
             else
                weights(i,:,j) = temp(:);
             end
        end
    end

    weights_conv{idx} = weights;
end

%% save parameters
weights_conv1 = weights_conv{1};
weights_conv2 = weights_conv{2};
weights_conv3 = weights_conv{3};
biases_conv1 = net.layers('conv1').params(2).get_data();
biases_conv2 = net.layers('conv2').params(2).get_data();
biases_conv3 = net.layers('conv3').params(2).get_data();

save(savepath,'weights_conv1','biases_conv1','weights_conv2','biases_conv2','weights_conv3','biases_conv3');

