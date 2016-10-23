## Introduction

This project is ruby project for building document line based index given a known dictionary.


## Requirements

Given a document and dictionary text files as input, output each line where each word in the dictionary appears. For example, given a dictionary composed of the following words: *programming*, *programs*, *easy*, *by*, *and*, *be*, *to* and a document composed of the following content:

Line 1: Good programming is not learned from
Line 2: generalities, but by seeing how significant
Line 3: programs can be made clean, easy to
Line 4: read, easy to maintain and modify,
Line 5: human-engineered, efficient, and reliable,
Line 6: by the application of common sense and
Line 7: by the use of good programming practices.

The expected output is:

and 4 5 6
be 3
by  2  6  7
easy  3  4
human-engineered 5
programming  1  7
programs  3
to  3  4

Note that the words in the output are on alphabetic order. A word is a sequence of letters and numbers starting with a letter.


## Running

Assuming Ruby is installed, to run the application, on the root folder, simply run:

```
../root$ ruby main.rb document.txt dictionary.txt
```

The output should be shown on the terminal.


## Input

Input should be formatted as described in the problem description and provided as a text (.txt) to the application.


## License

Apache 2.0, you know the drill ;)
