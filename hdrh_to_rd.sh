path=/home/anton/azul/New_config_latency_runs/Oracle/
FILES=$path*.hdr

START=0
END=2

out_path=/home/anton/azul/New_config_latency_runs/Oracle_over_2/

mkdir -p $out_path

begining_cut=200
len=200
piece=$(expr $len / $END)

for f in $FILES; do 
	fullname=$(basename "$f")
	extension="${fullname##*.}"
	filename="${fullname%.*}"
	echo "Processing $filename";
	echo "Processing $extension"; 
	start_time=$(expr $begining_cut - $piece)
	end_time=$(expr $begining_cut)
	for (( c=$START; c<=$END-1; c++ )) do

		start_time=$(expr $start_time + $piece)
		end_time=$(expr $start_time + $piece)
		new_name=$start_time"_"$end_time"_"$filename
		echo $start_time
		echo $end_time
		java -jar /home/anton/azul/NetBeansProjects/Test/dist/SummarizeHistogramLogRange.jar -s $start_time -e $end_time -ip $path -if $fullname -v -of $out_path$new_name.rd
	done
done


