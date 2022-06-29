# install library using pip3 install mysql-connector mysql-connector-python
# For the first time, run this on mysql:
# CREATE USER 'manager' IDENTIFIED BY '1234';
# And grant the necessary privileges to manager
import mysql.connector

retaildb = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = 'JainvibhU@123',
    database = 'retail_Store'
)

cursor = retaildb.cursor()

print('---------------------------------------------------------------')
# Gives the deliveries pending for each delivery person
query1 = ("SELECT delivery_person_ssn, e.name, COUNT(id) FROM Deliveries, Employee e "
          "WHERE e.ssn = delivery_person_ssn "
          "GROUP BY delivery_person_ssn;" )
cursor.execute(query1)
for c in cursor:
    print(c)

print('---------------------------------------------------------------')
query2 = ('select * from _Customer where address like %s')
s = '%Spain'
cursor.execute(query2, (s,))
for p in cursor:
    print(p)

print('---------------------------------------------------------------')
# Ranking
# Ranks the employees on basis of decreasing order of their salaries
query3 = ("SELECT name, salary, RANK() OVER (ORDER BY salary DESC) "
           "AS salary_rank FROM Employee "
           "ORDER BY salary_rank;")
cursor.execute(query3)
for (name, sal, sal_rank) in cursor:
    print(name, '   ', sal,'    ', sal_rank)

print('---------------------------------------------------------------')
# Windowing
# Shows the total earnings after each day starting from the first day.
query4 = ("SELECT CAST(payment_date_time AS DATE), SUM(amount) OVER "
          "(ORDER BY CAST(payment_date_time AS DATE) ROWS UNBOUNDED PRECEDING) "
          "from Payments_Ledger;")
cursor.execute(query4)
for (date, net_sales) in cursor:
    print(date , " ", net_sales)
print('---------------------------------------------------------------')

cursor.close()
retaildb.close()