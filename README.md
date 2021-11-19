<img width="651" alt="use case" src="https://user-images.githubusercontent.com/37887398/142621014-9b0cd1a5-d67e-4644-94bf-df69db07673e.png">
<img width="506" alt="Robustness diagram" src="https://user-images.githubusercontent.com/37887398/142621018-5a6e27b8-d16d-46dd-bd07-223f6607c952.png">
# Web based point of sales application
## Our Task
In this application we will create a web based point of sale application which allows users to enter thier credit card details in order to create a transaction. It should also have the option to refund a transaction, given that the admin accepts the transaction. 

# Project Plan
## Task Assignment
All members of our group were given specific tasks to complete such as web design and implemenation.

| Hannah-Ann                              |  Cristian-Anton     | David               | 
| ----------------------------------------| ---------------------| --------------------
| Setting up Project Plan                 | Backend(admin login) | Backend(TRANSACTIONS)
| Use Cases and list of features          |                      | Unit Tests 
| UML Class Diagram.                      |                      |
| UML Robustness Diagram                  |                      |
| Frontend (html, css, javascript and jsp)|                      |
| Markdown.                               |                      |
| Test Plan                               | 

Further detail of the implementation and issue are noted in the project section on this repositary.

# Use Cases

"A use case diagram is a model of requirements of a system at a high level" Unhelkar, B. (2017)


Below is our use case diagram

# List of features

# Test Plan
| T2 | The user clicks the 'here' link | when clicked the link provided it should direct to the home page | passed

| Test Number | Case | Expected Reaction | Outcome |
| --- | --- | ----| --- |
| T1 | The user enters the localhost url | when connected successfully user should be brought to a redirection page which takes you to the main interaction page, if not then should have an error message | passed |
| T2 | The user clicks the 'here' link | when clicked the link provided it should direct to the home page | passed
| T3 |  The user clicks buttons on the home page  | when clicked user should be directed to the appropriate page | passed
| T2 | The admin enters correct admin details| when clicked the link provided it should direct to the home page | passed
| T4 | The user submits the new transaction/refund request and the form does not go through unless all inputs are filled in| when submitted if empty required field is shown | Passed |
| T5 | The user submits the transaction form with incorrect details| form should not submit, should show error message | failed
| T6 | The user submits tranaction form with correct details | form should submit sucessfully | failed
| T7 | The user submits form with the amount which meets her bank account |should tell the user they do not have enough to make this transaction | failed 

# UML Class Diagram


# UML Robustness Diagram

# References
Unhelkar, B. (2017) <i>Software Engineering with UML</i>. 1st edn. CRC Press. Available at: https://www.perlego.com/book/1554638/software-engineering-with-uml-pdf (Accessed: 25 September 2021).
