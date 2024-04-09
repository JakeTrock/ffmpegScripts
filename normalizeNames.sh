directory="./out"

# Loop over all files in the directory
for file in "$directory"/*.*; do
    # Get the filename without path
    filename=$(basename "$file")
    
    # Get the filename before the first dot
    filename_no_ext="${filename%%.*}"
    
    # Change the extension to mp4
    new_filename="${filename_no_ext}.mp4"
    
    # Rename the file
    mv "$file" "$directory/$new_filename"
done
