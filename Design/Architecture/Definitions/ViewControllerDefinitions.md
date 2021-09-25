================================================================================

ViewControllerDefinitions.md
<br />29

Created by Tyler J. Otte on 9/25/21.
</br>-----------------------------------------------------------------------------------------------------------

This file is part of the 29 project. It determines which responsibilites are
best assigned and managed by the <br />view controllers.

Copyright (c) 2021, Tyler J. Otte.
Licensed under the GNU Affero General Public License v3.0.

See the full [license](https://github.com/TylerJOtte/29/LICENSE.txt) for more details.
<br />================================================================================

#  View Controller Definitions

*The following question is taken directly from Apple's [App Development with Swift](https://itunes.apple.com/us/book/app-development-with-swift/id1219117996?mt=11) textbook to help define <br />this application's view controllers.*

**1. What other actions (e.g., fetching, saving data, etc.) may be added to a specific view controller?**


### Hand Selection View Controller

- Properties
 * Outlets
  - An Instruction label
	- A collection of 52 PlayingCard views
	- Breakdown button
	- New Hand button
 * Variables
  - A Hand selection Controller
  - A HandRank Controller


- Methods
 * Configuration methods
  - Create model controllers
	- Display Instruction for selecting the cut PlayingCard
	- Unwind to a new Hand from breakdown scene
 * UI update methods
  - Display an Instruction
	- Display/hide cut PlayingCard label
	- Select/deselect Playingards
	- Deslect all Playingards, including cut PlayingCard
	- Display/hide new Hand & HandRank breakdown buttons
	- Respond to HandRank breakdown & new Hand buttons
 * Preparation methods
  - Prepare the HandRank count breakdown

### HandRank Breakdown View Controller

- Properties
 * Outlets
 * Collection of all possible combination titles
 * Collection of combination subtotal counts
 * Collection of combination total counts
 * Collection of card views under each combination title
 * Variables
   - A breakdownController


- Methods
 * Configurion methods
  - Display the HandRank titles
	- Display the HandRank's PlayingCard subtotals
	- Display the HandRank totals
	- Display each HandRank in breakdown
     * Reset the screen to display a new HandRank breakdown
     * Respond to back to results and new Hand buttons
