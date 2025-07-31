---
layout: post
title: "Building an Arcade-Themed Escape Room at home"
date: 2025-07-31 12:00:00 +0000
tags: escape-room arduino hardware retrogaming ai
published: false 
---

After years of building digital escape rooms, I decided to take the plunge and create a physical one right in my basement. The concept was ambitious: an evil self-aware AI taking over the real world through videogames, with players needing to find override codes hidden within classic games to stop it.

![Escape Room Graph](../arcade-escaperoom/graph.jpg)

## The Storyline: When AI Meets Retro Gaming

The premise was simple yet engaging: a malicious AI had begun infiltrating the real world through classic videogames. Players would need the help of a friendly assistant AI to gather override codes from various game cartridges scattered around the basement. The twist? Some of these games were "hacked" - modified to hide clues within their gameplay, this was giving the impression the AI was taking over the videogames. 

TODO add gif about glitchy rom

The evil AI wasn't just a silent antagonist. Throughout the experience, it would make random, often hilarious comments through smart speakers placed around the room, creating an atmosphere of being watched and adding unexpected moments of levity to the tension.

<!-- more-->

TODO add graph about the game

## Game Cartridges and Hidden Clues

Each game cartridge came with its own QR code that led to a custom web interface. These weren't just static puzzles - they were interactive challenges that required knowledge of the original games:

### Super Mario Bros Challenge
One of the most creative puzzles involved asking players: "How many goombas are in level 1-3?" The correct answer (3) would reveal a glitch cypher fragment and a physical clue: "Look in the Mario's block, inside the lid."


### Real world puzzles 

TODO 

## Technical Implementation

### Smart Speaker Integration
The evil AI's personality came to life through pre-recorded audio files played via smart speakers:
- Welcome messages and story setup
- Time warnings ("10 minutes left!", "2 minutes left!")
- Victory fanfare when codes were entered correctly
- Random taunts and comments to maintain atmosphere

### Visual Effects
A glitching background GIF played continuously on screens throughout the room, reinforcing the "AI takeover" theme. When players solved puzzles correctly, the glitch effect would disappear, symbolizing their progress in fighting back against the AI.

Mutliple screens were spreaded around the room with the same glitchy screen 

TODO add glitchy screen gif 

### Physical Elements
Beyond the digital components, the room included:
- Actual game cartridge replicas with hidden compartments
- QR codes disguised as retro gaming elements
- Physical clues that connected to the digital puzzles
- A final override terminal where all collected codes needed to be entered

## The Player Experience

Players would scan QR codes with their phones to access each game's challenge. Wrong answers resulted in temporary lockouts (adding pressure), while correct solutions revealed both digital cipher fragments and clues to physical hiding spots around the basement.

TODO add gameplay video  or photos

The climax required assembling all the collected override codes into a final password, entered into the main terminal to "defeat" the evil AI and trigger the victory sequence.

## Lessons Learned

Building a physical escape room taught me several valuable lessons:

1. **Atmosphere is everything** - The smart speaker commentary and glitch effects created immersion that pure puzzles couldn't achieve alone
2. **Mix digital and physical** - The best moments came when players had to move between screens and physical objects

