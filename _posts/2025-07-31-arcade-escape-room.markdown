---
layout: post
title: "Building an Arcade-Themed Escape Room at home"
date: 2025-07-31 12:00:00 +0000
tags: escape-room hardware retrogaming
published: true 
---

After years of building digital escape rooms, I decided to take the plunge and create a physical one right in my basement. The concept was ambitious: an evil self-aware AI taking over the real world through videogames, with players needing to find override codes hidden within classic games to stop it.

![prints](/images/posts/arcade-escaperoom/prints.jpg)

<!--more-->

## The Storyline: When AI Meets Retro Gaming

The premise was simple yet engaging: a malicious AI had begun infiltrating the real world through classic videogames. Players would need the help of a friendly assistant AI to gather override codes from various game cartridges scattered around the basement. The twist? Some of these games were "hacked" - modified to hide clues within their gameplay, this was giving the impression the AI was taking over the videogames. 

![Super mario hacked rom](/images/posts/arcade-escaperoom/super-mario.png)


The evil AI wasn't just a silent antagonist. Throughout the experience, it would make random, often hilarious comments through smart speakers placed around the room, creating an atmosphere of being watched and adding unexpected moments of levity to the tension.

<!-- more-->


## Game Structure

![Escape Room Graph](/images/posts/arcade-escaperoom/graph.jpg)


The escape room featured three distinct types of challenges that worked together to create a cohesive experience:

### 1. QR Clue Puzzles

Simple QR codes scattered around the room that provided cryptic hints:
- **Iron Man's Heart**: "The proof that Tony Stark has a heart" (leading players to find a key behind the Iron Man figure)
- **Pop the Balloons**: A direct instruction that led to finding sheet music hidden inside a balloon, this clue required you to wear some red-blue 3d glasses to read it. 


<img src="/images/posts/arcade-escaperoom/pop-baloons.png" alt="pop ballons hint" width="300">
<img src="/images/posts/arcade-escaperoom/pop-baloons-unlocked.png" alt="pop ballons unlocked" width="300">


### 2. Room Puzzles  
Interactive challenges accessed via QR codes that required exploring the physical space:
- **Wario's Hobby**: "What is Wario's hobby?" Answer: 32 (coordinates leading to gaming magazines)
- **One Piece Treasure**: "Find the One Piece" Answer: 356214 (manga volume sequence leading to "treasure under the sea")
- **Pinball Glitch**: "The glitch took over, but the score remains" (players had to read the score from the physical pinball machine)
- **Play epona song**: The player was required to play the epona song on a real piano in the room, following a previous note. 


![epona song](/images/posts/arcade-escaperoom/epona-song.png)

- **Build QR code with lego** FInd the missing lego piezes and complete the QR code with Lego!

![lego qr](/images/posts/arcade-escaperoom/lego-qr.png)


### 3. Game Cartridge Challenges

The most complex puzzles required deep knowledge of classic games and unlocked cipher fragments, these required people playing on differen consoles around the room, and the games were giving one part of the deactivation code:

![pop ballons hint](/images/posts/arcade-escaperoom/mario-cartridge.png)


**Mario Cart #1**: "How many goombas in level 1-3?" 
**Bubble Bobble Cart #2**: "How many enemies in level 16 for 2 players?" 
**Zelda Cart #3**: "↑ → ↑ ↑ ↑ ↑ ← ← Find the code" 
**Pang Cart #4**: "How many balls in level 1-12?" 
**Super Mario World Cart #5**: Hidden sequence puzzle 

![zelda](/images/posts/arcade-escaperoom/zelda.png)


### The Final Challenge
All cipher fragments combined to form the deactivation code , entered via keyboard shortcut (found in another hint) on the main glitch terminal to complete the override sequence. 


![code](/images/posts/arcade-escaperoom/code.png)


## Technical Implementation

### Smart Speaker Integration & AI Narrative
The experience was guided by "Jill," a benevolent AI assistant that spoke through Google Home speakers:

**Opening**: *"Greetings, players. I am Jill, your guide and ally. Something dangerous lurks in the arcade—a rogue AI called 'The Glitch.' It has awakened, hungry for power, and now it's spreading through every game, every screen, aiming to seize control of all technology…and humanity itself."*

**Progression**: Time warnings ("Only ten minutes left!"), encouragement, and even emergency extensions when players were close to solving it

**Victory**: Final Fantasy fanfare followed by: *"Congratulations, the glitch has been deactivated, you have saved the world. On behalf of Aperture Science, I relay their most sincere gratitude..."*

### Visual Effects
A glitching background GIF played continuously on screens throughout the room, reinforcing the "AI takeover" theme. When players solved puzzles correctly, the glitch effect would disappear, symbolizing their progress in fighting back against the AI.

Mutliple screens were spreaded around the room with the same glitchy screen 

![phones](/images/posts/arcade-escaperoom/phones.png)

### Physical Setup
The basement was transformed into a retro arcade with multiple game stations:
- **TV Console**: Controller locked in a box, batteries hidden around the room
- **Pinball Machine**: Displaying glitch effects with score visible on backglass  
- **Arcade Cabinet**: "INSERT COIN" message with piggy bank, requiring players to find coins
- **Piano**: With arrow stickers for playing sheet music sequences
- **Hidden Items**: Game cartridges in Mario blocks, treasure chests, balloon compartments, and between comic books

## The Player Experience

Players would scan QR codes with their phones to access each game's challenge. Wrong answers resulted in temporary lockouts (adding pressure), while correct solutions revealed both digital cipher fragments and clues to physical hiding spots around the basement.


The climax required assembling all the collected override codes into a final password, entered into the main terminal to "defeat" the evil AI and trigger the victory sequence.
