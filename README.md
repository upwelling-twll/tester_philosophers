**Where to clone tester repository**
Clone this tester`s repo into yur project directory. Otherwords, "test" folder have to be into the same folder as your ./phiosopher program.

|
|
|- \philosopher (your project directory)
             |
             |- \test (tester repo)
             |- \.philosopher (your executable)

**How to use**
Into the test directory run "test.sh"
Program does not need any arguments.

**How to specify tester parameters**
You can change number of turns (turns_to_eat) each philosophers will eat. To change this parameter open test.sh script:
cd test/test.sh
and change the value of turns variable:
![image](https://github.com/upwelling-twll/test_philosophers/assets/92473270/2f1867f3-f972-4ab4-90d7-8041e6bbea34)

**Logs of the tests**
To check your program`s output open /test/test_logs directory. You will find two directories: /die and /not_die
/die directory - is for the output of failed test cases from /test/test_input_die.txt file
/not_die directory - is for the output of failed test cases from /test/test_input_not_die.txt file

**Adding your own test cases**
You can add new compinations of arguments to any of the input fiels. You need only to open the /test_input_not_die.txt or /test_input_die.txt file and add a new line to it.
You better folow the logic - if your test case correspond to the death of one of the phiosphers, you should add this case to  /test_input_die.txt file; if your test case provides enouth time for philosophers to survive, so none must die - add this case to the /test_input_not_die.txt file.

**Understanding the output**
../test/test_input/test_input_die.txt
' 4 310 200 100 20' **OK**
OK here means, that your programm`s output had any line containing "die" as it was expected for this arguments that at least one philospher should die

' 31 600 200 200 20' **KO** Philosophers expected to die
KO means that your program`s output did not have any line containing "die" word, but it was expected that at least one philosopher would die.

![image](https://github.com/upwelling-twll/test_philosophers/assets/92473270/42111e49-e0b0-4889-a30c-7865f974e064)


