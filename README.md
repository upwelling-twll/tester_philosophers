
# Where to Clone the Tester Repository

Clone the tester's repository into your project directory. In other words, the "tester_philosopher" folder should be in the same directory as your ./philosopher program.
    
    |
    |- /philosopher (your project directory) 
        |- /tester_philosopher (this tester repo) 
        |- ./philosopher (your executable)


# How to use 

In the tester directory run "bash test.sh" script. The program does not need any arguments.

# How to Specify Tester Parameters
**Full test option** means running each test case n times and ensuring that at least 50% of the tries end as expected.
Use flag **-f n** to run full test (n = number of runs, can be any value):
      
      bash test.sh -f 6

**Meals / turns to eat** You can change the number of turns (turns_to_eat) each philosopher will eat. To change this parameter, open the test.sh script: navigate to cd test/test.sh and change the value of the turns variable.
![image](https://github.com/upwelling-twll/test_philosophers/assets/92473270/2f1867f3-f972-4ab4-90d7-8041e6bbea34)

# Logs of the Tests

To check your program's output, open the /test/test_logs directory. You will find two directories:
        
    /die: contains the output of failed test cases from the /test/test_input_die.txt file.
    /not_die: contains the output of failed test cases from the /test/test_input_not_die.txt file.

# Adding Your Own Test Cases

You can add new combinations of arguments to any of the input files. Open the /test_input_not_die.txt or /test_input_die.txt file and add a new line to it.

Follow this logic:

    If your test case corresponds to the death of one of the philosophers, add this case to the /test_input_die.txt file.
    If your test case provides enough time for philosophers to survive, so none must die, add this case to the /test_input_not_die.txt file.

# Reading the Output

Example:

    ../test/test_input/test_input_die.txt ' 4 310 200 100 20' OK

 OK means that your program's output contained a line with "die". Since it was expected that at least one philosopher should die with these arguments, the output is OK.

    ' 31 600 200 200 20' KO Philosophers expected to die

KO means that your program's output did not contain any line with "die", but it was expected that at least one philosopher would die.

![image](https://github.com/upwelling-twll/test_philosophers/assets/92473270/42111e49-e0b0-4889-a30c-7865f974e064)


