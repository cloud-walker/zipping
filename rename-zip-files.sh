start_time=$(date +%s)

unzip files.zip -d unzipped_files

count=1
for file in unzipped_files/*; do
  # Get the file extension
  extension="${file##*.}"
  
  # Get the base name without the directory
  base_name=$(basename "$file" .$extension)
  
  # Rename the file with a progressive number
  mv "$file" "unzipped_files/${base_name}_$count.$extension"
  
  count=$((count + 1))
done

cd unzipped_files
zip ../renamed_files.zip *
cd ..

rm -r unzipped_files

end_time=$(date +%s)

# Calcola la differenza
elapsed_time=$((end_time - start_time))

echo "Process completed in $elapsed_time seconds. The new zip file is renamed_files.zip"