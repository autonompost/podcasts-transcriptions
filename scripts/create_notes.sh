#!/usr/bin/env bash

# set some variables
basedir="/Users/baum/git/podcasts-transcriptions_automation"
tmpdir="$basedir/tmp"
podcastdir="$basedir/podcasts/futurehistories"
audiopath="podcasts/futurehistories/audio"
episodesdir="$basedir/podcasts/futurehistories/episodes"
episodespath="podcasts/futurehistories/episodes"
transcriptdir="podcasts/futurehistories/transcripts"
tmpldir="$basedir/templates"

for f in $(ls -1 $episodesdir/S*md); do
  export curfile=$(grep -E "^# " $f | sed 's/^# //g')
  export shownotesfile="$episodespath/$(basename $f)"
  export curepisode=$(echo $curfile | awk '{print $1}')
  curepisodefile=$(ls -1 ${podcastdir}/audio | grep $curepisode)
  curtranscriptfile=$(ls -1 ${podcastdir}/transcripts| grep $curepisode | grep srt)
  curcompletefile=$(ls -1 ${podcastdir}/transcripts| grep $curepisode | grep txt)
  export completefile="podcasts/futurehistories/episodes/complete/FH_Complete_${filename}.md"
  export audiofile="$audiopath/$curepisodefile"
  export transcriptfile="$transcriptdir/$curtranscriptfile"
  filename=$(echo $curfile | tr '[:space:]' '_' | tr -d '|' | sed 's/_$//g; s/[\(\)&\/]//g; s/__/_/g' )
  tags=$(cat $f | sed -n '/Keywords/,$p' | sed '/Keywords/d' | sed 's/,//g; s/\n//g' | grep -Ev "^$")
  if [ ! -f $tmpdir/${filename}.md ]; then
    cp $tmpldir/audio-notes-template.md $tmpdir/${filename}.md
    echo $tags >> $tmpdir/${filename}.md
    PATTERN="$curfile" perl -pi -e 's/TITLEHEADER/$ENV{PATTERN}/g' $tmpdir/${filename}.md
    PATTERN="$audiofile" perl -pi -e 's/AUDIOPATH/$ENV{PATTERN}/g' $tmpdir/${filename}.md
    PATTERN="$transcriptfile" perl -pi -e 's/TRANSCRIPTPATH/$ENV{PATTERN}/g' $tmpdir/${filename}.md
    PATTERN="$shownotesfile" perl -pi -e 's/SHOWNOTESANCHOR/$ENV{PATTERN}/g' $tmpdir/${filename}.md
    PATTERN="$completefile" perl -pi -e 's/COMPLETEANCHOR/$ENV{PATTERN}/g' $tmpdir/${filename}.md
  fi
  if [ ! -f "$tmpdir/FH_Complete_${filename}.md" ]; then
    cp $tmpldir/FH_Complete_Template.md "$tmpdir/FH_Complete_${filename}.md"
    cat $podcastdir/transcripts/$curcompletefile | perl -pe 's/\n/ /g' >> "$tmpdir/FH_Complete_${filename}.md"
    echo "" >> "$tmpdir/FH_Complete_${filename}.md"
    echo "" >> "$tmpdir/FH_Complete_${filename}.md"
    echo "Episode Keywords:" >> "$tmpdir/FH_Complete_${filename}.md"
    echo "" >> "$tmpdir/FH_Complete_${filename}.md"
    echo $tags >> "$tmpdir/FH_Complete_${filename}.md"
    PATTERN="$curfile" perl -pi -e 's/COMPLETEANCHOR/$ENV{PATTERN}/g' "$tmpdir/FH_Complete_${filename}.md"
  fi
done


