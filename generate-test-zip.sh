for i in {1..10}; do dd if=/dev/urandom of=file_$i.bin bs=10M count=10; done

zip files.zip file_*.bin

rm -rf file_*.bin