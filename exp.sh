start=`date +%s`

num_training_fns=(1000 10000 100000 1000000 10000000)


for j in ${num_training_fns[@]}
do
  for i in {1..5}
  do
    python main.py --datasource=sinusoid --logdir=logs/sine_numtf${j}/rs${i}/ --metatrain_iterations=70000 --norm=None --update_batch_size=10 --seed=${i} --num_funcs=${j}
  done
done

end=`date +%s`
runtime=$((end-start))
echo "The execution time of this experiment was: " $runtime
