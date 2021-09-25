================================================================================

ModelDefinitions.md
<br />29

Created by Tyler J. Otte on 9/25/21.
</br>-----------------------------------------------------------------------------------------------------------

This file is part of the 29 project. It determines all the necessary information the application needs, and how <br />to group it into model objects.

Copyright (c) 2021, Tyler J. Otte.
Licensed under the GNU Affero General Public License v3.0.

See the full [license](https://github.com/TylerJOtte/29/LICENSE.txt) for more details.
<br />================================================================================

# Model Definitions

*The following questions are taken directly from Apple's [App Development with Swift](https://itunes.apple.com/us/book/app-development-with-swift/id1219117996?mt=11) textbook to help define <br /> this application's models.*

## Grouping Considerations

**1. What are the primary types of data that the app will work with?**

- Integers
- Characters
- Strings
- Booleans
- Instructions
- PlayingCardDeck
- CribbageHand

**2. What data will the user input into the app?**

- 5 unique PlayingCards from a standard Deck w/o Jokers
  * 1 cut PlayingCard
  * 4 Hand PlayingCards


- Scene change requests
  * View HandRank breakdown scene
  * Return to results screen
  * Create new CribbageHand scene (i.e., reset)

**3. What data will your app display?**

- Instructions to guide the user
- 52 PlayingCards w/o Jokers (Suits only)
- 13 character Ranks
- The user's selected CribbageHand Cards
- The CribbageHand's count
- The CribbageHand's HandRanks that produced the count

**4. Where will the app get the data?**

- Instructions - HandSelectionController
- PlayingCardDeck - HandSelectionController
- CribbageHand - HandSelectionController
- PlayingCards - PlayingCardDeck
- Ranks - PlayingCardDeck
- Suit - PlayingCardDeck
- Selected CribbageHand Cards - User
- Count - CribbageHand
- HandRanks that produced the count - CribbageHand

**5. What APIs or frameworks will the app access?**

- Standard UIKit for displaying default iOS elements
- Forge framework for Instructions, PlayingCardDeck and CribbageHand

**8. How does the data relate to other data?**

- When PlayingCard selected
   * It is removed from the PlayingCardDeck
   * It is added to the CribbageHand
   * Instructions change if it's the cut PlayingCard or CribbageHand is full


- When PlayingCard is deselected
    * It is added back into the PlayingCardDeck
    * It is removed from the CribbageHand
    * Instructions change if it's the cut PlayingCard or CribbageHand isn't full


- Potential for future:

  * Game
    - 1 PlayingCardDeck (no Jokers)
    - 0..11 Players
    - 1..3 Instructions
  * Player
    - 1..* Rounds
  * Round
     - 1 CribbageHand

**7. How will you persist, or save, the data?**

- The user has no needs to save data intentionally for the time being.
  Potentially in future updates, <br /> there could be a feature that saves
  multiple Rounds for multiple Players.

- Data will persist when the app is in a suspended state (i.e., it will revert
	to the user's last action <br />state when reopened).

- No data will persist when the app quits as an intentional design to allow hard
  resets by the user.

## Related Data

**1. If have two types of related data, consider the relationship. How can you   access all the data you <br />need from the data you already have?**

- The Deck and Hand models can be extended from the same interface, but
  implemented <br /> differently according to the needs of each.

## Model Types

All model types needed are defined in the Forge framework.
