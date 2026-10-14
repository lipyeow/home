# Hymns

Hymn lyrics with ukulele chords. Each hymn lives in a plain-text file named
`Lyrics-<Title>-<Key>[-variant].txt`, with chord lines written above the lyric lines.
Some hymns come in more than one key. Variant suffixes include `-2col` (two-column
layout), `-v2`/`-v3` (revisions) and `-full` (all verses).

Committed files are the hymns that have a published YouTube video. See
**[published.md](published.md)** for the list of published hymns and when each one
was first committed.

## Other files

- `map.py`: transposes the chord lines of a lyrics file from one key to another (G → C by default).
- `shortlist.txt`: candidate hymns to record next. Entries marked with `-` are done.
