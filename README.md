# GUESS-GAME
An 8-bit dedicated processor to play a guessing game. Two inputs are required to play the game. lo_button and hi_button.

-   If the lo_button is pressed, that means the guess is too low, Low boundary becomes the current Guess. 
-   Otherwise if the hi_button is pressed, that means the guess is too high, and the High boundary becomes the current Guess
-   The loop is then repeated with the calculation of the new Guess

![Alogirithm](images/02.png?raw=true "Algorithm")
    





![Datapath](images/01.png?raw=true "Datapath")