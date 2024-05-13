- av1mp4 goodcrush ```bash
find . -name "*" -exec bash -c 'ffmpeg -i "$1" -vf "fps=30" -ab 128k -c:v libaom-av1 -crf 30 -strict experimental -c:a aac "./out/${1%.*}.mp4"' _ {} \;```
 - noHup av1mp4: ```nohup bash -c 'find . -name "*" -exec ffmpeg -i {} -vf "fps=30" -ab 128k -c:v libaom-av1 -crf 30 -strict experimental -c:a aac -y "/mnt/XL/application_data/fileBrowser/misc/yta_min/{}.mp4" \;' &```
 - SuperCrush video: `ffmpeg -i shrek.webm -vf "fps=3,scale=128:-1:flags=lanczos" -lossless 0 -compression_level 6 -q:v 0 -loop 0 -an outshrek.webp`
 - SuperCrush SLP(good for longplay): `ffmpeg -i ~/Downloads/xyz.mkv -y -vf "fps=30" -lossless 0 -compression_level 6 -q:v 0 -c:v libvpx-vp9 -loop 0 ~/Desktop/xyz.webm`
 - **Good enough vid crush** `-vf "fps=30" -vcodec libwebp -c:v libvpx-vp9`
 - Crush Picture: `find . -name "*" -exec convert {} -strip -quality 86 {}.webp \;`
 - mp4 compatibility crush `ffmpeg -hwaccel auto -i yourvid.any -c:v libx264 -pix_fmt yuv420p -profile:v baseline -level 3.0 -crf 22 -vf scale=-2:720 -preset medium -c:a aac -strict experimental -movflags +faststart -threads 0 output.mp4`
