function train_duke(opts)

net = opts.net;

command = strcat(opts.python3, ' train.py' , ...
    sprintf(' --train_set %s', net.train_set), ...
    sprintf(' --model_name %s', net.model_name), ...
    sprintf(' --initial_checkpoint %s', net.initial_checkpoint), ...
    sprintf(' --image_root %s', net.image_root), ...
    sprintf(' --experiment_root %s', net.experiment_root), ...
    sprintf(' --embedding_dim %d', net.embedding_dim), ...
    sprintf(' --batch_p %d', net.batch_p), ...
    sprintf(' --batch_k %d', net.batch_k), ...
    sprintf(' --pre_crop_height %d --pre_crop_width %d', net.pre_crop_height, net.pre_crop_width), ...
    sprintf(' --net_input_height %d --net_input_width %d', net.input_height, net.input_width), ...
    sprintf(' --margin %s', net.margin), ...
    sprintf(' --metric %s', net.metric), ...
    sprintf(' --loss %s', net.loss), ...
    sprintf(' --learning_rate %ld', net.learning_rate), ...
    sprintf(' --train_iterations %d',net.train_iterations), ...
    sprintf(' --hard_pool_size %d',net.hard_pool_size), ...
    sprintf(' --decay_start_iteration %d', net.decay_start_iteration), ...
    sprintf(' --checkpoint_frequency %d', net.checkpoint_frequency));

if net.augment
    command = [command, ' --augment'];
end

if net.resume
    command = [command, ' --resume'];
end

if net.hard_pool_size > 0
    command = [command, ' --train_embeddings ', net.train_embeddings];
end

cur_dir = pwd;
cd src/triplet-reid  
system(command);
cd(cur_dir)