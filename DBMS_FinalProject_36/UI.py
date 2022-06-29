import sys
from token import ENDMARKER
import mysql.connector as conn
from mysql.connector import Error
from tkinter import *
from PIL import ImageTk, Image
from tkinter import scrolledtext

try:
        connection = conn.connect(host='localhost',
                                database='retail_store',
                                user='root',
                                password='JainvibhU@123')

        pointer = connection.cursor()   
except Error:
        print("error while connecting", Error)
        exit(0)
        
class DBMS:
    def __init__(self, root):
        
        self.title=Label(root,text="Online Retail Store",font=("times new roman",40,"bold"),bg='darkgreen',fg='white').place(x=0,y=0,relwidth=1,height=60)
        LeftMenu=Frame(root,bd=2,relief=RIDGE)
        LeftMenu.place(x=0,y=60,width=150,height=500)
        
        self.menulabel=Label(LeftMenu,text="Menu",font=("times new roman",30),bg="#009227").pack(side=TOP,fill=X)
        
        self.customer_button=Button(LeftMenu,text="Customer",command=self.result1,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.Items_button=Button(LeftMenu,text="Items",command=self.result2,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        
        self.Employee_button=Button(LeftMenu,text="Employee",command=self.result3,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        
        self.Deliveries_button=Button(LeftMenu,text="Deliveries",command=self.result4,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        
        self.PaymentLEdger_button=Button(LeftMenu,text="PaymentLedger",command=self.result5,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.Cart_button=Button(LeftMenu,text="Cart",command=self.result6,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.Exit_button=Button(LeftMenu,text="Exit",command=self.exitt,font=("times new roman",20,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        
        
        self.result = scrolledtext.ScrolledText(root, width = 100, height = 13, font = ("Times New Roman",12))
        self.result.grid(column = 0, pady = 10, padx = 10)
        self.result.place(x = 150, y = 550)
        self.inputtext=Label(root, text = 'Input Here ---> ', font = "Helvetica 12 bold italic").place(x=160,y=75)
        
        self.input = Entry(bd = 1)
        self.input.place(x = 300, y = 75)
        
        
        RightMenu=Frame(root,bd=2,relief=RIDGE)
        RightMenu.place(x=800,y=60,width=400,height=480)
        self.menulabel=Label(RightMenu,text="Features",font=("times new roman",30),bg="#009227").pack(side=TOP,fill=X)
        
        self.query1=Button(RightMenu,text="1. Phone number of Customer ='Edurado Keys' ",command=self.query1,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query2=Button(RightMenu,text="2. Items bought by Tony Savage ",command=self.query2,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query3=Button(RightMenu,text="3. Employee with same Name ",command=self.query3,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query4=Button(RightMenu,text="4. Count Distinct Customer for Deliveries ",command=self.query4,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query5=Button(RightMenu,text="5. Update quatity by -3 of Item ID =1 ",command=self.query5,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query6=Button(RightMenu,text="6. Pending Deliveries for deleviery man ",command=self.query6,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query7=Button(RightMenu,text="7. Russian customers with cart value greater than 500  ",command=self.query7,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query8=Button(RightMenu,text="8. Ranking of Items  ",command=self.query8,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query9=Button(RightMenu,text="9. Customer Buying more that 1 items ",command=self.query9,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query10=Button(RightMenu,text="10. 2nd largest Amount from Ledger ",command=self.query10,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query11=Button(RightMenu,text="11. Increase Salary by 5 % ",command=self.query11,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        self.query12=Button(RightMenu,text="12. Items purschased in Payment Ledger : - 1 ",command=self.query12,font=("times new roman",12,"bold"),bg="white",bd=3,cursor="hand2").pack(side=TOP,fill=X)
        
        
        self.adding_customer=Button(root, text='Add Customer',command=self.addcustomer,fg = "black", bg = "white", font = "Helvetica 12 bold italic").place(x=190,y=120)
        self.adding_customer=Button(root, text='Update Customer',command=self.updatecustomer,fg = "black", bg = "white", font = "Helvetica 12 bold italic").place(x=330,y=120)
        
        self.deliveriespending=Button(root, text='EQ-1 Deliveries Pending',command=self.pending,fg = "black", bg = "white", font = "Helvetica 12 bold italic").place(x=200,y=180)
        self.spanish=Button(root, text='EQ-2 Spanish Customers',command=self.spanish,fg = "black", bg = "white", font = "Helvetica 12 bold italic").place(x=300,y=230)
        
        self.salarybased=Button(root, text='EQ-3 Salary Based Ranking',command=self.salarybaseed,fg = "black", bg = "white", font = "Helvetica 12 bold italic").place(x=400,y=300)
        
        self.earning=Button(root, text='EQ-4 Total Earning after Each Day',command=self.earning,fg = "black", bg = "white", font = "Helvetica 12 bold italic").place(x=500,y=380)
      
    def salarybaseed(self):
        
        self.result.delete('1.0',END)
        q="SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM Employee ORDER BY salary_rank"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Name , Salary  \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def earning(self):
        self.result.delete('1.0',END)
        q="SELECT CAST(payment_date_time AS DATE), SUM(amount) OVER (ORDER BY CAST(payment_date_time AS DATE) ROWS UNBOUNDED PRECEDING) from Payments_Ledger"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Date , Earning  \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
        
    def pending(self):
        self.result.delete('1.0',END)
        q="SELECT delivery_person_ssn, e.name, COUNT(id) FROM Deliveries, Employee e WHERE e.ssn = delivery_person_ssn GROUP BY delivery_person_ssn;"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Delivery Person SSN , Employee ID\n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def spanish(self):
        self.result.delete('1.0',END)
        q="select * from _Customer where address like %s"
        s = '%Spain'
        pointer.execute(q,(s,))
        result = pointer.fetchall()
        
        ans = " ID, Name, Phone Number , Address \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
        
        
    def query1(self):
        self.result.delete('1.0',END)
        q="select phone_number from _Customer where name = 'Eduardo Keys'"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Phone Number  : "
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query2(self):
        self.result.delete('1.0',END)
        q="select Item_ID from Cart where id = (select id from _Customer where name = 'Tony Savage')"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Item_ID : "
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query3(self):
        self.result.delete('1.0',END)
        q="SELECT name , COUNT(name)FROM employee Group By name having COUNT(name) > 1 "
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Name       Count   \n "
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
    def query4(self):
        self.result.delete('1.0',END)
        q="select COUNT(Distinct Customer_ID) from Deliveries"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Count :  "
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query5(self):
        
        self.result.delete('1.0',END)
        q="UPDATE Items SET quantity = quantity - 3 where ID = 1"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = " Items with ID = 1  - > quatity updated successfully by -3  .. Please check at Items to confirm ...  " 
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query6(self):
        self.result.delete('1.0',END)
        q="SELECT d.id, c.id, c.name, c.address FROM _customer c, deliveries d WHERE d.Delivery_person_SSN='114-50-0232' and c.id = d.customer_id"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Delivery.ID , CUstomer.ID , CUstomer.name, Customer .Address \n  "
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query7(self):
        self.result.delete('1.0',END)
        q="CREATE VIEW Russian_Customers AS SELECT _customer.id, _customer.name,_customer.phone_number,cart.Net_Price FROM Cart,_Customer WHERE (_customer.address like '%Russia') and cart.id = _customer.id and (cart.Net_Price >= 500 ) "					
        pointer.execute(q)
        
        r = "Select * from Russian_Customers"
        pointer.execute(r)
        result = pointer.fetchall()
        d= "drop view Russian_Customers"
        pointer.execute(d)        
        ans = "Customer_ID , Customer_Name , CUstomer_Phone No , Price of Cart \n  "
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query8(self):
        self.result.delete('1.0',END)
        q="SELECT items.name, items.net_price,suppliers.name as supplier_name,RANK() over (ORDER BY net_price ASC ) as item_rank FROM items,suppliers where items.id=suppliers.item_id"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Items Name , Item Net Price , Supplier Name , Rank\n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query9(self):
        self.result.delete('1.0',END)
        q="SELECT distinct t1.id  from Cart t1 , Cart t2 WHERE  t1.id = t2.id and t1.Item_ID <> t2.Item_ID ORder by t1.id ASC"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Customers ID : - \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query10(self):
        self.result.delete('1.0',END)
        q="SELECT p1.ID,p1.amount from payments_ledger p1 WHERE 2 = (SELECT count(distinct amount) from payments_ledger p2 WHERE p2.amount > p1.amount )"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Payment Id , Payment Amount :  \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query11(self):
        self.result.delete('1.0',END)
        q="Update Employee SET salary = salary + (salary * 5.0 /100.0 ) "
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Salaries Updated Succesfully ...!! \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
        
    def query12(self):
        self.result.delete('1.0',END)
        q="select items.name from items where items.id=(Select cart.Item_ID from Cart where cart.id = (Select payments_ledger.Customer_ID from payments_ledger where payments_ledger.id='1'))"
        pointer.execute(q)
        result = pointer.fetchall()
        
        ans = "Items in Payment Ledger :- 1   :    \n"
                
        for value in result:
            ans=ans+str(value)+"\n"
        
        self.result.insert(END, ans)
    
    def updatecustomer(self):
        id,name,phone,addressss = self.input.get().split(',')
        q="Update _Customer SET name ='" +name +"' ,phone_number = '" +phone+ "',address='"+addressss+"' where ID = "+id
        pointer.execute(q)
        connection.commit()
        result = "Updated successfully..!!!!"
        self.input.delete(0,END)
        self.result.delete('1.0',END)
        self.result.insert(END, result)
        
    
        
    def addcustomer(self):
        id,name,phone,addressss = self.input.get().split(',')
        q = "insert into _Customer(ID, name, phone_number,address) values('" + id + "','" + name + "'," + phone + ",'" + addressss+"');"
        pointer.execute(q)
        connection.commit()
        print("executed successfully")
        self.input.delete(0,END)
        
    def exitt(self):
        pointer.close()
        connection.close()
        exit(0)
    
    def result1(self):
        self.result.delete('1.0',END)
        q="Select * From _Customer"
        pointer.execute(q)
        result = pointer.fetchall()
        ans="ID , name , phone_number , address\n"
        
        for value in result:
            ans=ans+str(value)+"\n"

        self.result.insert(END, ans)
        
    def result2(self):
        self.result.delete('1.0',END)
        q="Select * From Items"
        pointer.execute(q)
        result = pointer.fetchall()
        ans="ID, name, price , discount , quantity , tax , delivery_charge , net_price\n"
        
        for value in result:
            ans=ans+str(value)+"\n"

        self.result.insert(END, ans)
        
    def result3(self):
        self.result.delete('1.0',END)
        q="Select * From Employee"
        pointer.execute(q)
        result = pointer.fetchall()
        ans=" ID , name , DateofJoining , Job Title, Salary , Address \n"
        
        for value in result:
            ans=ans+str(value)+"\n"

        self.result.insert(END, ans)
        
    def result4(self):
        self.result.delete('1.0',END)
        q="Select * From Deliveries"
        pointer.execute(q)
        result = pointer.fetchall()
        ans=" ID , Customer_ID , Delivery_Person_SSn , Item_Id , Delivery_Date \n"
        
        for value in result:
            ans=ans+str(value)+"\n"

        self.result.insert(END, ans)
           
    def result5(self):
        self.result.delete('1.0',END)
        q="Select * From Payments_Ledger"
        pointer.execute(q)
        result = pointer.fetchall()
        ans=" ID , Customer_ID , Payment_Date_Time , Amount \n"
        
        for value in result:
            ans=ans+str(value)+"\n"

        self.result.insert(END, ans)
        
    def result6(self):
        self.result.delete('1.0',END)
        q="Select * From Cart"
        pointer.execute(q)
        result = pointer.fetchall()
        ans= " ID , Item_ID , Quantity , Net_Price \n"
        
        for value in result:
            ans=ans+str(value)+"\n"

        self.result.insert(END, ans)




        
        
root=Tk()

canv = Canvas(root, width = 1200, height = 800, bg='white')
canv.grid(row = 2, column = 3)

mywin = DBMS(root)

root.title('Online Retail Store')

root.mainloop()