

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


# How to use our app
- here explain how to run the files

# Use Cases

"A use case diagram is a model of requirements of a system at a high level" Unhelkar, B. (2017) In order to show the requirements of our application we have made a use use diagram. These requirements are:
- enter a new transaction
- reverse a transaction (refund to card)
- check credit card Lunn code
- allow entry of card number, name, expiry date, cvv code 

In our case diagram there are 3 main actors: user, admin and the bank client. the admin be able to access the adminpage, which has infomation to refund the card as well as seethe different transactions that have been made by a user. The bank client should be able to interact with both the admin and the user in order to process the transactions and refund request made by each user.

Below is our use case diagram

<img width="651" alt="use case" src="https://user-images.githubusercontent.com/37887398/142621014-9b0cd1a5-d67e-4644-94bf-df69db07673e.png">

## List of features
| Actor | Use | Response |
| --- | --- | ---- |
| User | The user enters in the infomation to transfer to another account | the users amount enters is subtracted from their account and put onto the account that it has been sent to
| User | The user enters in their card details in order to request for the the refund| the form is submited to the admin page and waits for admin to approve before the refund is sent back to their card
| user | the user enters in the credit card details but using the pin pan or keyboard provided | 




| User | User enters their bank details one by one pressing green button on the keypad | User's bank details are being saved as an object ready to make a payment |
| User | User presses Initiate Transaction button | The desired amount is being transferred into the payee's account |
| User | User presses Refund Transaction button (optional) | Refund is being processed |
| Admin | Admin enters logging details in the input fields | Admin logs into the account to configure the device |
| Admin | Admin enters card details in the input fields and presses Change Card Details | Payee's card details is being saved in the properties file and it will be read on startup |
| Admin | Admin enters user details and presses Change User Details | New admin details are being saved in a properties file |
| Admin | Admin presses Logout or Go to Transaction Page button | New webpage appears ready to use for the user |

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

# UML Robustness Diagram
<img width="506" alt="Robustness diagram" src="https://user-images.githubusercontent.com/37887398/142621018-5a6e27b8-d16d-46dd-bd07-223f6607c952.png">

# References
Unhelkar, B. (2017) <i>Software Engineering with UML</i>. 1st edn. CRC Press. Available at: https://www.perlego.com/book/1554638/software-engineering-with-uml-pdf (Accessed: 25 September 2021).
