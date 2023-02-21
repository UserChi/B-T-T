Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time. This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

Specification
Requirements

    You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
    Deposits, withdrawal.
    Account statement (date, amount, balance) printing.
    Data can be kept in memory (it doesn't need to be stored to a database or anything).

Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00

Thought Process
 I decided to use Ruby for this task since it is my stronger language and I wanted to complete this in a day and a bit so I had time to review it before i send it for submission.
 
 I thought of the most basic way I could solve this task and then created an excildraw from there to try build on my idea.
 Since I was using Ruby I simply just separatd everything into two classes: Account and Statment. Then creating methods for each class.