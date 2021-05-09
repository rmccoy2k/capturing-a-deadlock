                    /*************************************************************
				            ****DEADLOCKS****
                    *************************************************************/

                                         --=====================
				         --USE the SQL2 Database
				         --=====================


T1: b

Select * from TableOne
Select * from TableTwo

 --Session - Transaction #1
 --As we execute the update, T1 has an exclusive lock (X) on TableOne

BEGIN TRAN
UPDATE TableOne 
SET FNAME = 'MARY'
WHERE ID = 	1

/*When executing this update, it is blocked because T2 has exclusive 
  lock (X) on TableTwo */

BEGIN TRAN
UPDATE TableTwo 
SET FNAME = 'SAM'
WHERE ID = 	1

COMMIT TRANSACTION


T2:

Select * from TableOne
Select * from TableTwo

--Session2 - Transaction #2
--As we execute the update, T2 has an exclusive lock (X) on TableTwo


BEGIN TRAN
UPDATE TableTwo 
SET FNAME = 'RANDOLPH'
WHERE ID = 	1

--When executing this update, it is blocked because T2 has exclusive lock (X) on TableOne

BEGIN TRAN
UPDATE TableOne 
SET FNAME = 'BOB'
WHERE ID = 	1

COMMIT TRANSACTION

SP_WHO2
