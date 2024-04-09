dir1=./originals
dir2=./out

# Find all video files in both directories
videos_dir1=$(find "$dir1" -type f -iname "*.mp4" -o -iname "*.mov")
videos_dir2=$(find "$dir2" -type f -iname "*.mp4" -o -iname "*.mov")

# Get the number of videos in each directory
num_videos_dir1=$(echo "$videos_dir1" | wc -l)
num_videos_dir2=$(echo "$videos_dir2" | wc -l)

# Check if the number of videos is the same in both directories
if [ "$num_videos_dir1" -ne "$num_videos_dir2" ]; then
    echo "Number of videos in $dir1: $num_videos_dir1"
    echo "Number of videos in $dir2: $num_videos_dir2"
    
    # Print the different videos if the number of videos are not the same
#    diff <(basename -a $videos_dir1 | cut -d. -f1) <(basename -a $videos_dir2 | cut -d. -f1)
#    exit 1
fi

# Loop through each video in dir1
while IFS= read -r video; do
    # Get the basename of the video file
    filename=$(basename "$video")
    filename_no_ext=$(basename "$video" | cut -d. -f1)
    
    # Get duration of the video in dir1
    duration_dir1=$(ffprobe -v error -select_streams v:0 -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video")
    
    # Get the corresponding video in dir2
    video_dir2=$(find "$dir2" -type f -iname "${filename_no_ext}.*")
    # Get duration of the video in dir2
    duration_dir2=$(ffprobe -v error -select_streams v:0 -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video")
    # Compare durations
    if [ "$duration_dir1" != "$duration_dir2" ]; then
        echo "Duration mismatch for video: $filename"
        echo "  Duration in $dir1: $duration_dir1 seconds"
        echo "  Duration in $dir2: $duration_dir2 seconds"
    fi
done <<< "$videos_dir1"
