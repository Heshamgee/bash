#!/bin/bash
#this script displays various information to the screen 

echo "hello hesham"

#assign a value to a variable 
WORD="script"

#Display that value using the variable .
echo "$WORD"

# Demonstrate that single quotes cause variables to not get expanded . 
echo "$WORD" 

#combine the variable with hard-coded text 
echo "this is a shell $WORD " 

#Display the contents of the variable using an alternative syntax 
echo "this is a shell ${WORD}"
#append text to the variabl . 
echo "${WORD}ing is fun!"

#create a new variable 
ENDING="ed"

#combine the two variables 
echo "this is ${WORD}${ENDING}. "

#CHANGE the value stored in the ending variable . (REassignment)
ENDING="ing"
echo "${WORD}${ENDING} IS FUN ! "

#REassignment value to ending 
ENDING="you are going to write many sccripts in this class! "
echo $ENDING