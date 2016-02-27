---
layout: page
title: "Piano Legend"
comments: false
sidebar: true
sharing: true
footer: true
---

## Description

It is a musical simulator, similar to Guitar Hero, but focused towards a different musical instrument: the piano.

<img src="/projects/piano-legend/main.png" class="screenshot" />

## Game mechanics

The game mechanics consist in the performance of piano works using a MIDI controller, a PC keyboard, or a mouse. The game screen shows a visual aid with the keys to press at every moment, in two different manners: normal mode (with colorful bands representing each note, by position, and it’s duration by it’s length, in a Guitar Hero fashion), or score mode (which shows the music in traditional musical notation).

<img src="/projects/piano-legend/game-guitar.png" class="screenshot" />
<img src="/projects/piano-legend/game-sheet.png" class="screenshot" />

The game gives the user a score while playing, depending on it’s precision striking the keys. This score is accumulative, and it gets boosted with multipliers if no mistakes are made (in a way similar to Guitar Hero’s score system). User scores can be stored locally or remotely, and being this second the case, they can be accessed by other users remotely .

## Game modes

Several game modes are offered, all based on the same engine:

* __Practice mode__, which offers the player a series of classical piano works of progressive difficulty, with performance tips for each of them. It pretends to be a learning tool to train the player in the usage of the instrument.

<img src="/projects/piano-legend/practice.png" class="screenshot" />

* __Main game__, in which the user can perform custom songs provided by him or her. Adding new songs to the game is as easy as having a standard MIDI file containing the desired music, and copying it to a folder inside the game installation. Alternatively,  users can upload custom songs, which will be accessible by any other user that plays the game in the mode with connectivity.

<img src="/projects/piano-legend/selection.png" class="screenshot" />

* __Free mode__, in which no songs are offered, but simply a piano interface in which the user can play at will.

## Additional info

The game has been fully implemented in Java, making an extensive use of it’s MIDI library, and the SDL library Java port. All songs in the game are simple standard MIDI files, that the game can incorporate without any additional modification. For this to be possible, a complex analysis system of MIDI information in the files had to be designed, in order to extract note and duration information from a low level format that only indicates pulsations and releases of keys.

<img src="/projects/piano-legend/options.png" class="screenshot" />

Additionaly, an options system allows for user configuration of certain parameters, including game language (as the game is designed for easy localization, via locale files).

This game was built as my bachelors degree’s thesis, and was defended on June 2012, being awarded with honors.
