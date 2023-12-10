# Podcast Transcriptions

This project contains the transcription files for the podcasts I am listening to.

All podcast audio files are being transcribed with [whisper-autotranscription](https://github.com/autonompost/whisper-autotranscription) with medium model setting. Podcast audio files are being downloaded with [podgrab](https://github.com/akhilrex/podgrab). All audio file names are being sanetized with `detox`.

## Podcasts in this project

I rarely listen to all episodes of a podcast. If you request a podcast that is listed under _Incomplete_, I will potentially add all transcipts here.

### Complete Podcasts

- [Future Histories German/English](./podcasts/futurehistories)
- [Corvus Corax](./podcasts/corvuscorax)
- [Critical Infinity Shorts](./podcasts/CriticalInfinityShorts)

### Incomplete Podcasts

- [Jung&Naiv](./podcasts/JungUndNaiv)
- [Piratensender Powerplay](./podcasts/PiratensenderPowerplay)
- [DemystifySci](https://demystifysci.com/)
- [Wunderbar Together German](https://www.wunderbartogetherpodcast.de/)
- [Theories of Everything with Curt Jaimungal](https://theoriesofeverything.org/)
- [Zwischen Zwei Deckeln](https://zwischenzweideckeln.de/)
- [Lex Fridman](https://lexfridman.com/podcast)
- [Sein Und Streit](https://www.deutschlandfunkkultur.de/sein-und-streit-100.html)
- [Dissens](https://dissenspodcast.de/)
- [Songs & Argumente](https://www.youtube.com/channel/UCEvYBeQ1Rm1NV2HOD4FnKfQ)
- [morf mit Meinung](https://www.youtube.com/channel/UCHZMZyHHpciQLfhT5Zvt5kA)
- [Alternativlos](https://alternativlos.org/)
- [This Machine Kills](https://soundcloud.com/thismachinekillspod)

## Obsidian and Audio Notes

If you are [Obsidian](https://obsidian.md) User and want to use the plugin [obsidian-audio-notes](https://github.com/jjmaldonis/obsidian-audio-notes) you will find ready to use notes with embedded Metadata for this plugin.

- [ ] fix a unclear problem with loading the .srt files without having to redit the metadata block. see [transcript does not automatically show when creating audio-notes from a template](https://github.com/jjmaldonis/obsidian-audio-notes/issues/24)
- [ ] TODO create a script that lets you replace the path inside the audio notes


## Roadmap

- [ ] Summaries for all podcast complete text transcripts
- [ ] English<->German tranlations of complete text transcripts with DeepL Pro
- [ ] Once the DeepL Write API is available also create sanetized versions of complete text transcripts
