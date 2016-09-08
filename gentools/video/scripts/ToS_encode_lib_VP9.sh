#!/bin/bash

# =================================================================================================
# Generic functions
# =================================================================================================
function VP9_encode () {
	codec="VP9"

	# Manage setup parameters
	source ./ToS_encode_opts.sh

	echo "- Prepare commands"
	case "$options" in
		"DASH" )
			echo "    + DASH is ON - NOT MANAGED FOR NOW"
			exit 1
			;;
		* )
			echo "    + No supplementary options set (No DASH)"
			extraOptions=""
			commentExtension=""
			;;
	esac

	# // processing
	maxNbCpu=8
	maxNbThreads=${maxNbCpu}

	# Barcode
	case "$barCodeOption" in
		"NOBARCODE" )
			echo "    + Barcode is OFF"
#			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --cpu-used=${maxNbCpu} --threads=${maxNbThreads} --target-bitrate=$videoBitRate --limit=$maxVideoBitRate --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --end-usage=vbr --passes=2 --bit-depth=${extraOptionsBits}"
#full			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --cpu-used=0 --threads=${maxNbThreads} --target-bitrate=$videoBitRate --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --end-usage=cbr --passes=2 --bit-depth=${extraOptionsBits}"
#1			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -t 30 -ss 150 -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --cpu-used=0 --threads=${maxNbThreads} --target-bitrate=$videoBitRate --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --end-usage=cbr --passes=2 --bit-depth=${extraOptionsBits}"
#2			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -t 30 -ss 150 -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --cpu-used=0 --threads=${maxNbThreads} --target-bitrate=$videoBitRate --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --end-usage=cbr --passes=2 --bit-depth=${extraOptionsBits} --undershoot-pct=95 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000"
#3			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -t 30 -ss 150 -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=0 --target-bitrate=$videoBitRate --end-usage=cbr --undershoot-pct=95 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000 --drop-frame=70 --fps=30000/1001 -v --kf-min-dist=0 --kf-max-dist=360 --static-thresh=0 --min-q=4 --max-q=63 --bit-depth=${extraOptionsBits}"
#4			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -t 60 -ss 150 -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=0 --target-bitrate=$videoBitRate --end-usage=cbr --undershoot-pct=95 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000 --drop-frame=70 --fps=30000/1001 -v --kf-min-dist=0 --kf-max-dist=360 --static-thresh=0 --min-q=4 --max-q=63 --bit-depth=${extraOptionsBits}"
#5			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio -t 30 -ss 150 -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=0 --target-bitrate=$videoBitRate --end-usage=cbr --undershoot-pct=95 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000 --drop-frame=70 --fps=30000/1001 -v --kf-min-dist=0 --kf-max-dist=360 --static-thresh=0 --min-q=4 --max-q=63"
#6			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=2 --target-bitrate=200 --end-usage=cbr --undershoot-pct=100 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000 --drop-frame=70 --fps=30000/1001 -v --kf-min-dist=0 --kf-max-dist=360 --static-thresh=0 --min-q=4 --max-q=63 --bit-depth=${extraOptionsBits}"
#7			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=2 --target-bitrate=200 --end-usage=cbr --undershoot-pct=100 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000 --drop-frame=70 --fps=30000/1001 -v --kf-min-dist=0 --kf-max-dist=360 --static-thresh=0 --min-q=4 --max-q=63 --bit-depth=${extraOptionsBits} --minsection-pct=0 --maxsection-pct=200"
#8			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=2 --target-bitrate=$videoBitRate --end-usage=cbr --undershoot-pct=100 --buf-sz=6000 --buf-initial-sz=4000 --buf-optimal-sz=5000 --drop-frame=70 --fps=30000/1001 -v --kf-min-dist=0 --kf-max-dist=360 --static-thresh=0 --min-q=4 --max-q=63 --bit-depth=${extraOptionsBits}"
#9			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=2 --target-bitrate=$videoBitRate --end-usage=vbr --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=120 --minsection-pct=80 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --passes=2 --bit-depth=${extraOptionsBits}"
#10			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=2 --target-bitrate=$videoBitRate --end-usage=vbr --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=100 --minsection-pct=90 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --passes=2 --bit-depth=${extraOptionsBits}"

##			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderH264 -c:v libvpx-vp9 -maxrate ${maxVideoBitRate}k -b:v  -threads=${maxNbThreads} -bufsize ${vbvBuffSize}k -speed 1 -threads 8 "
#11		commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=2 --target-bitrate=$videoBitRate --end-usage=vbr --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=100 --minsection-pct=90 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --passes=2 --bit-depth=${extraOptionsBits} --profile=2"
######TO BE USED		commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=0 --target-bitrate=$videoBitRate --end-usage=vbr --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=100 --minsection-pct=90 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --passes=2 --bit-depth=${extraOptionsBits} --profile=2"
## LINE TO BE USED FOR 360p?
#		commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=0 --target-bitrate=$videoBitRate --end-usage=vbr --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=100 --minsection-pct=90 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --passes=2 --bit-depth=${extraOptionsBits} --profile=0"
		commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -i $inputAudio               -filter_complex '[0:v]drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 1 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --threads=${maxNbThreads} --passes=2 --good --cpu-used=0 --target-bitrate=$videoBitRate --end-usage=vbr --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=100 --minsection-pct=90 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --passes=2 --profile=0"
			# Faire vbr avec min/max section %

#			--frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --bit-depth=${extraOptionsBits}"
#	vbvBuffSize=$maxVideoBitRate
#--vbv-maxrate $maxVideoBitRate ${extraOptions} --vbv-bufsize $vbvBuffSize
			;;
		"BARCODE" )
			echo "    + Barcode is ON"
#			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -loop 1 -r $fps -i ${inputDir}/${barcodeFolder}/frame%d.png -i $inputAudio -filter_complex '[1:v]scale=iw*0.75:-1[barcode];[0:v][barcode]overlay=\(W-w\)/2:\(H-h\)/2:shortest=1,drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 2 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --cpu-used=0 --threads=${maxNbThreads} --target-bitrate=$videoBitRate --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --end-usage=vbr --passes=2 --bit-depth=${extraOptionsBits}"
			commandLineParams="$videoEncoderVP9_1 -y -i $inputVideo -loop 1 -r $fps -i ${inputDir}/${barcodeFolder}/frame%d.png -i $inputAudio -filter_complex '[1:v]scale=iw*0.75:-1[barcode];[0:v][barcode]overlay=\(W-w\)/2:\(H-h\)/2:shortest=1,drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextTop:x=w/6:y=h/4-ascent/2:enable=lt\(t\\,5\),drawtext=fontfile=${inputDir}/IntelClear_Rg.ttf:fontsize=40:fontcolor=white:textfile=$inputTextBottom:x=w/6:y=h*.75-ascent/2:enable=lt\(t\\,5\),crop=min\(iw\\,ih*\(16/9\)\):ow/\(16/9\),scale=${outputResolution}[outv]' -sws_flags lanczos -map '[outv]' -map 2 -r $fps -f yuv4mpegpipe -pix_fmt yuv420p -an - | $videoEncoderVP9_2 --codec=vp9 --cpu-used=0 --threads=${maxNbThreads} --target-bitrate=$videoBitRate --frame-parallel=1 --tile-columns=$tileColumn --auto-alt-ref=1 --lag-in-frames=24 --kf-max-dist=150 --kf-min-dist=0 --maxsection-pct=300 --minsection-pct=60 --static-thresh=0 --min-q=0 --max-q=63 --arnr-maxframes=7 --arnr-strength=5 --arnr-type=3 --end-usage=cbr --passes=2 --bit-depth=${extraOptionsBits}"
			;;
		* )
			echo "ERROR - Wrong parameter for barcode: $barCodeOption"
			exit 1
			;;
	esac

	# Build final command line
	commandLine1="$commandLineParams --pass=1 --fpf=${tempDir}/${outputFileName}.log -o ${outputDir}/${outputFileName}.vp9 -"
	commandLine2="$commandLineParams --pass=2 --fpf=${tempDir}/${outputFileName}.log -o ${outputDir}/${outputFileName}.vp9 -"
	commandLine3="$videoPostProcessVP9 -y -i ${outputDir}/${outputFileName}.vp9 -i $inputAudio -map 0 -map 1:a -c:v copy -c:a libvorbis -b:a $audioBitRate ${outputDir}/${outputFileName}.webm"
	commandLine4=""
	commandLine5="extractVideoInfo '${outputDir}/${outputFileName}.webm'"

	# Process commands
	source ./ToS_encode_exec.sh
}
