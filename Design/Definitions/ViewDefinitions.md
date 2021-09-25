================================================================================

View Definitions.md
<br />29

Created by Tyler J. Otte on 9/25/21.
</br>-----------------------------------------------------------------------------------------------------------

This file is part of the 29 project. It determines the necessary information needed to create the view <br />hierarchy.

Copyright (c) 2021, Tyler J. Otte.
Licensed under the GNU Affero General Public License v3.0.

See the full [license](https://github.com/TylerJOtte/29/LICENSE.txt) for more details.
<br />================================================================================

#  View Definitions

*The following questions are taken directly from Apple's [App Development with Swift](https://itunes.apple.com/us/book/app-development-with-swift/id1219117996?mt=11) textbook to help <br /> define this application's views.*

## Workflow/Navigation Hierarchy

**1. Does your workflow prototype provide access to every feature?**

- Yes

**2. What view objects will you use for each scene?**

- Hand Selection Scene
	* Stack views
	* Image views
	* Labels

- HandRank Breadown Scene
	* Table view
	* Image views
	* Labels

**3.What other options might you consider?**

- Hand Selection Scene
	* Collection views
	* Text views

- HandRank Breakdown Scene
	* Stack views
	* Scroll views

**4. What model objects will be displayed on each scene?**

- Hand Selection Scene
 * Stack views
	 - PlayingCardDeck
	 - CribbageHand PlayingCard selections
 * Image views
	 - Suits
	 - Icons
 * Labels
	 - Messages (Instructions/count)
	 - Character Ranks
	 - Cut PlayingCard character marker
	 - New Hand & Breakdown buttons


- HandRank Breadown Scene
 * Table view
  - HandRank titles
  - HandRank breakown PlayingCards
	- Total bar
 * Image views
	- Cut PlayingCard
	- HandRanks
 * Labels
	- Scene title
	- Back to Results & New Hand buttons
	- HandRank titles
	- Counts

**5. What ​configure​ or ​updateUI​ methods will you need for each view?**

- Hand Selection Scene
 * Stack views
  - configure - remove cards from CribbageHand and add back into PlayingCardDeck
  - updateUI - Highlight/unhighlight PlayingCards and add/remove "C" from cut    
	  PlayingCard
 * Labels
  - configure - display first Instruction & character rRnks
  - updateUI - display next Instruction/count, cut PlayingCard marker, and New
	  <br /> Hand/Breakdown buttons


- HandRank Breadown Scene
 * Table view
  - configure - combination titles/PlayingCards, & total bar
 * Labels
	- configure - scene title, Back to My Count/New Hand buttons, & counts

**6. What subviews will need to be updated with the model data displayed on the view?**
- See previous answer / TBD
