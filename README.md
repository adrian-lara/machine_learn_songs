# [MachineLearnSongs](https://machine-learn-songs.herokuapp.com/)

[I presented this app at Turing School of Software & Design's January 2018 Demo Night.](https://youtu.be/3KwJGlrPuSM?t=1710) This presentation included a demo and a high-level overview of the application.

### General

MachineLearnSongs uses a hand-rolled machine learning algorithm to predict the probabilities of a user liking and disliking songs via Spotify.

Users play a song separately on Spotify, and upon signing in to MachineLearnSongs, the user is able to "Like", "Dislike", and get a prediction for the currently playing song.  Once a song is liked or disliked, that preference and the song's audio features (consumed from Spotify's API) are saved to a PostgreSQL database. When the user navigates to the the "Predict" page, a machine learning algorithm, which is coded to execute a Gaussian Naive Bayes classification, uses the user's previous song "likes" and "dislikes" to calculate the percentage chance that a user will like or dislike the currently playing song.

![alt text](https://github.com/adrian-lara/machine_learn_songs/blob/master/public/Screen%20Shot%202018-01-24%20at%201.07.26%20AM.png "Prediction Page")

### Technical Details

### API

[Spotify API](https://developer.spotify.com/web-api/)

User's authenticate via their Spotify account. The users's currently playing songs and corresponding song audio-features are both consumed.

### Machine Learning Component

This application applies the [Gaussian Naive Bayes classifier](https://en.wikipedia.org/wiki/Naive_Bayes_classifier#Gaussian_naive_Bayes). Refer to [presentation](https://youtu.be/3KwJGlrPuSM?t=1710) (also) linked above for a high-level explanation of how the algorithm works.
