---
layout: post
title: "NFC Floppy Disk Game Launcher: When Retro Meets Modern"
date: 2025-07-25 10:00:00 +0000
comments: true
categories: [Arduino, NFC, Retro Gaming, Hardware Hacking]
---

Remember the satisfying *click* of inserting a floppy disk and waiting for your favorite game to load? What if you could recreate that nostalgic experience while launching modern game collections? That's exactly what I built with my NFC Floppy Disk Game Launcher - a system that transforms vintage floppy disks into smart game cartridges using NFC technology.

<!-- more -->

## The Concept

The idea is beautifully simple: take an old floppy disk drive, gut the internals, and replace them with an Arduino and NFC reader. Attach NFC stickers inside floppy disks, and suddenly you have physical "game cartridges" that can launch any game or application when inserted.

{% video http://localhost:4000/images/posts/nfc-floppy/demo.mp4 400 600 %}

This project bridges the gap between physical and digital gaming, creating a tactile experience that modern gaming has largely lost. Each floppy disk becomes a unique key to unlock specific games, scripts, or applications.

## Hardware Components

The beauty of this project lies in its simplicity. You'll need:

- **Arduino Uno** (or compatible microcontroller)
- **MFRC522 NFC/RFID module** (13.56MHz)
- **Old floppy disk drive** (for the housing)
- **NFC stickers/tags** (ISO 14443A compatible)
- **Floppy disks** (as many as you want games)
- **Connecting wires** and basic soldering supplies

{% img center /images/posts/nfc-floppy/mfrc522.png 600 400 'Hardware Components' %}

<!-- more -->

### The MFRC522 Module

The heart of the system is the MFRC522 NFC module. This little board operates at 13.56MHz and supports ISO/IEC 14443 Type A cards, MIFARE, and NTAG formats. With a typical reading range of 1-3cm, it's perfect for detecting tags inside floppy disks.

**Pin Configuration:**
- VCC → 3.3V (important: not 5V!)
- GND → Ground  
- RST → Digital Pin 9
- SS → Digital Pin 10
- MOSI → Pin 11 (SPI)
- MISO → Pin 12 (SPI)
- SCK → Pin 13 (SPI)

## The Build Process

### Step 1: Prepare the Floppy Drive

First, I carefully disassembled an old 3.5" floppy drive, removing all the mechanical components while preserving the outer shell. The goal is to maintain the authentic look and feel of inserting a floppy disk.


### Step 2: Mount the NFC Reader

The MFRC522 module needs to be positioned where it can reliably read NFC tags inside inserted floppy disks. After some experimentation, I noticed the metalic shell for the floppy disk reader was interfering with the readings, so I had to fully remove all the mechanical parts. Because of that, I had to replicat ethe insertion mechanism, I did this with Lego !

{% video http://localhost:4000/images/posts/nfc-floppy/lego-reader.mp4 400 600 %}

### Step 3: Arduino Integration

Then I connected the NFC reader to the Arduino, and the Arduino is connected it via USB to the computer for both power and serial communication.


## The Software

The system consists of two main components: Arduino firmware and a Python script running on the computer.

### Arduino Code

The Arduino continuously polls for NFC tags and sends their unique identifiers via serial communication:

```cpp
#include <SPI.h>
#include <MFRC522.h>
#include <Wire.h>

#define SS_PIN 10
#define RST_PIN 9

MFRC522 mfrc522(SS_PIN, RST_PIN);

void setup() {
  Serial.begin(9600);
  SPI.begin();
  mfrc522.PCD_Init();
  Serial.println("NFC Floppy Reader Ready");
}

void loop() {
  if (!mfrc522.PICC_IsNewCardPresent()) {
    return;
  }
  
  if (!mfrc522.PICC_ReadCardSerial()) {
    return;
  }
  
  // Send UID via serial
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? "0" : "");
    Serial.print(mfrc522.uid.uidByte[i], HEX);
  }
  Serial.println();
  
  mfrc522.PICC_HaltA();
  delay(1000);
}
```

### Python Game Launcher

The Python script monitors the serial port and maps NFC tag IDs to specific games or applications:

```python
import serial
import subprocess

# Mapping NFC tag UIDs to games/applications
rfid_to_game = {
    "04a1b2c3": "wine ~/.wine/drive_c/Games/DoomII/doom2.exe",
    "05d4e5f6": "/usr/games/dosbox ~/Games/Commander_Keen/keen.exe",
    "06g7h8i9": "steam steam://rungameid/12345",
    "07j8k9l0": "/home/user/scripts/launch_emulator.sh"
}

try:
    arduino = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
    print("Connected to NFC Floppy Reader")
    
    while True:
        if arduino.in_waiting > 0:
            tag_id = arduino.readline().decode('utf-8').strip().lower()
            
            if tag_id in rfid_to_game:
                print(f"Launching game for tag: {tag_id}")
                subprocess.run(rfid_to_game[tag_id], shell=True)
            else:
                print(f"Unknown tag: {tag_id}")
                
except KeyboardInterrupt:
    print("Shutting down...")
finally:
    arduino.close()
```

## Creating Game Disks

The most fun part is creating the game collection! I simply attached the NFC tag on the back of the floppy disk, without removing the internal magnetic disk. Each disk gets:

1. **Custom label** designed to match the original game
2. **NFC sticker** positioned for reliable reading
3. **Registry entry** in the Python script


I created disks for classics like:
- **Starcraft** - Wine launcher for the Windows version
- **Theme hospital** - DOSBox integration  
- **Custom scripts** - Microsoft Paint, etc.

## The Experience

The final result is magical. You hear the familiar mechanical sound of inserting a floppy disk, followed by your game launching instantly.

{% img center /images/posts/nfc-floppy/final.jpg 600 400 'Floppy Drive Disassembly' %}

The tactile experience brings back memories while the instant loading provides modern convenience. Friends visiting are always amazed - it looks like retro gaming but works better than the originals ever did.

## Technical Deep Dive

### NFC vs RFID Choice

I chose the MFRC522 module specifically for its 13.56MHz frequency and ISO 14443A support. This provides:
- **Reliable reading** through the plastic floppy disk case
- **Fast detection** (typically under 100ms)
- **Good range** (1-3cm works perfectly for this application)
- **Standard protocol** compatible with many NFC tags

### Communication Protocol

The serial communication is intentionally simple:
- **9600 baud** for reliable, error-free transmission
- **Hexadecimal UID** format for easy parsing
- **Newline-terminated** messages for clean Python processing

### Error Handling

The current implementation includes basic error handling:
- **Tag collision** detection (multiple tags present)
- **Serial timeout** management
- **Unknown tag** logging
- **Graceful shutdown** on interruption

## Future Enhancements

There are several directions this project could evolve:

### Hardware Improvements
- **LED indicators** for better user feedback
- **Sound effects** to enhance the retro experience  
- **Multiple readers** for a full retro computer setup
- **Custom PCB** for more professional integration

### Software Features
- **GUI configuration** for easier game mapping
- **Automatic game detection** from file associations
- **Usage statistics** and favorite games tracking
- **Network integration** for multiplayer game coordination

### Gaming Integration
- **Save state management** tied to specific disks
- **Achievement systems** tracked per physical disk
- **Multiplayer coordination** (different disks for different players)
- **Game collections** (one disk launches a curated game menu)

## Why This Matters

This project represents something important in our increasingly digital world: the value of physical interaction with our digital content. While we've gained incredible convenience with digital libraries, we've lost the ritual and intentionality of choosing what to play.

With physical game disks, you're forced to make a deliberate choice. You handle the disk, read the label, and commit to that experience. It slows down the decision-making process in a way that actually enhances the gaming experience.

## Building Your Own

The complete source code is available on [GitHub](https://github.com/rephus/nfc-floppy-disk-reader). The project is designed to be easily reproducible with common components.

**Total cost:** Under $30 in components
**Build time:** 4-5 hours  
**Skill level:** Beginner-friendly (basic Arduino and Python knowledge helpful)

The most time-consuming part is actually creating the custom disk labels , and building the mechanical parts in Lego - but that's also the most rewarding part!

## Conclusion

The NFC Floppy Disk Game Launcher proves that sometimes the best new ideas come from combining old and new technologies in unexpected ways. It creates a bridge between the tactile satisfaction of retro gaming and the convenience of modern digital libraries.

More importantly, it demonstrates that innovation doesn't always mean adding complexity - sometimes it means thoughtfully removing it. By stripping away the mechanical complexity of floppy drives while preserving their physical interaction model, we get the best of both worlds.

Whether you're a retro gaming enthusiast, an Arduino hobbyist, or just someone who misses the physicality of old computing, this project offers a fun way to bring some of that tactile magic back to modern gaming.

*Have you built something similar? I'd love to see your take on physical digital media! Share your projects in the comments below.*

---

**Resources:**
- [Complete source code on GitHub](https://github.com/rephus/nfc-floppy-disk-reader)
- [MFRC522 Arduino library](https://github.com/miguelbalboa/rfid)
- [PySerial documentation](https://pyserial.readthedocs.io/)