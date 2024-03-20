# Genetic-Cyrptogram-Solver
This program aims to solve a fixed cyrptogram for a Goerge Orwell quote by using a genetic algorithms.
First it assigns random letters to the numbers found in the cyrptogram and scores this "sentence" by how many words it forms by chance and if the words are in the top 1000 most common words in the english language. It perfrorms this operation 5000 times and takes the top 50 highest scoring sentences to populate the next gnereation after mutatating the alphabet-numbers pairings at random. 

There is further work to make this program take any cyptogram as an input and determine the answer, along with creating a better scoring system that incorporates how letters are proceeded and followed by other common letters.
