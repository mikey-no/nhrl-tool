Reference File Signature Tool
=====

**Aims**

Provide a tool to query the NSRL File Signature information (https://www.nist.gov/srd/nist-special-database-28)

**Requirements**

***Provide:***

1.	A store for NSRL File signatures
2.	That provides a mechnaism to query the dataset to determine if a file signature has seen before
3.	As above for bulk file signatures comparisons
4.  To provide NSRL information about file signatures
5.  Be agnostic of the COTS or Open solutions undoubtable avalible to ensure the roadmap ramains under my control

**Further Work**

1. Make the code run more reliable - current un handled parse error (file name with single quote causes and error)
2. Maket the code run more quickly
3. Fully test (whatever this means)
4. Confirm if the database table structure is correct I added an addtional field to each table for id for my own primary key

**Build**
The applications is built using the following:

* Java
 - Apache Commons CSV

* Postgres

* Built on Ubuntu 18.04


**Build notes**


**Licence**

Not for commercial use. 
No warrenty expressed or implied
Author: mikey-no
