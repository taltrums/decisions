# decisions
## Introduction
An app that lets large group of people decide what can be the best possible choice. For Example – Choosing a movie to watch, Deciding where to go for food etc. This will help the users is particular group to choose the best viable option while maintaining the diversity of the group/community.

## Conceptual design
- Users sign in on the app, create their group/get added to an existing group, inside the group they  decide if they want to go out for a movie/watch a movie online together etc. User needs to start a decision maker regarding their choice of movie, the app then decides using an algorithm to find the most suitable movie out of all there selections to suggest a movie to the group to watch.

- Similarly this can be used for deciding restaurants for eating out, etc

- After the users have decided the particular decision redirect the admin user to the booking site (where the user will be able to select the desired movie and book the tickets).

- Decision Maker will be decided randomly among the group, to enforce or reject the particular decision. If the Decision Maker rejects next time a new Decision Maker will be given the choice to enforce or reject.

- In particular a group will have three tries to make the decision.