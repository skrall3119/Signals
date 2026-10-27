# Signals

### A native iOS music-theory explorer built with Swift and UIKit

Signals turns a root note and musical mode into a visual reference for scales and chords. It also includes screens for comparing chords across parallel modes and exploring dominant relationships, plus an experimental chord-progression generator.

The project's central challenge is translating music-theory rules into code: moving through a twelve-semitone pitch space while preserving note-letter order and calculating sharps and flats.

## Features

- **Seven musical modes:** Ionian, Dorian, Phrygian, Lydian, Mixolydian, Aeolian, and Locrian.
- **Scale construction** from whole-step and half-step interval patterns.
- **Diatonic chord labels** using major, minor, and diminished suffixes.
- **Parallel-mode comparison** to explore borrowed-chord possibilities from the same root.
- **Dominant-chord exploration** on a dedicated screen.
- **Experimental four-chord progressions** generated from the selected scale.
- **Native UIKit interaction** with a mode picker, text input, and storyboard-based screens.

## Technical overview

| Area | Implementation |
| --- | --- |
| Language | Swift; project configured for Swift 5 |
| Interface | UIKit, storyboards, IBOutlet/IBAction connections |
| Configured deployment target | iOS 13.1 |
| Core logic | Array rotation, interval traversal, modular arithmetic, accidental calculation |
| Dependencies | Apple frameworks; no third-party dependency setup is present |

### How scale generation works

1. Start with the major-scale interval pattern: `W W H W W W H`.
2. Rotate that pattern to select a mode.
3. Advance through pitch positions using two semitones for a whole step and one for a half step.
4. Advance the note letter independently, then calculate the sharps or flats needed to reach the target pitch.
5. Rotate the chord-quality pattern to label the scale's diatonic chords.

For example, the C Ionian reference is:

| Degree | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Note | C | D | E | F | G | A | B |
| Chord | C | Dm | Em | F | G | Am | B° |

This approach constructs scales from interval rules rather than maintaining a separate hard-coded scale for every root.

## Code worth exploring

- [Music-theory helpers](Signals/Handler.swift) — interval-pattern rotation, scale construction, pitch-distance calculations, and accidental handling.
- [Main screen](Signals/ViewController.swift) — mode selection, scale/chord display, and progression generation.
- [Parallel-mode comparison](Signals/BorrowedController.swift) — reuse of the scale-building logic across all seven modes.
- [Dominant exploration](Signals/DominantController.swift) — chord and dominant-reference presentation.
- [Storyboard](Signals/Base.lproj/Main.storyboard) — native screen layouts and interface connections.

## Getting started

1. On a Mac with Xcode installed, clone the repository:
   ```bash
   git clone https://github.com/skrall3119/Signals.git
   ```
2. Open `Signals.xcodeproj`.
3. Select the Signals scheme and an available iPhone simulator.
4. Build and run. For a physical device, configure your development team and signing settings in Xcode.

The project is configured for Swift 5 and an iOS 13.1 deployment target. Building with a current Xcode release may require project-setting updates; a current build has not been verified for this documentation.

## Try it

- Enter `C`, select Ionian, and generate the scale and chords.
- Switch to Dorian and compare the changed notes and chord qualities.
- Open the borrowed-chord screen to compare the seven modes on the same root.
- Explore the dominant screen and experimental progression generator.

Use uppercase note letters. The accidental parser recognizes `#` and the musical flat symbol `♭`, rather than a lowercase `b`.

## Project status and next steps

Signals is a portfolio prototype focused on music-theory calculations and native iOS interfaces. Scale generation is the core feature; progression and dominant output need further musical validation.

Areas for continued development:

- Validate empty and malformed note input before performing calculations.
- Add unit tests covering all modes, accidental spellings, and pitch wraparound.
- Correct progression chord qualities across modes and improve dominant spelling for altered notes.
- Separate calculation logic from UIKit display helpers to simplify testing.
- Add accessibility and layout checks across device sizes.

No automated test target is present in the repository. The example above is a reference for expected behavior, not a claim of a passing test suite.

## Author

[Alex Janci](https://github.com/skrall3119)
