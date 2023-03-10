# Beerbox

Developing an order management system to optimize the work efficiency and overall workflow at Bluebox.

## Definition of the Product

Order management systems in restaurants have a huge impact on efficiency and workflow.
The local student center Bluebox contains a bar managed by students.
As the current operating system is only a website sending unorganized orders to the printer behind the bar counter, our project idea is to optimize this process for a better overview and smoother workflow for the staff.

This will be achieved by an application running on a device like a tablet, located at the bar counter. The customer will still access the ordering website via QR-code on his table.
The benefits of digitalizing the system lay primarily in an optimized overview for orders in general, but also by providing extra information like waiting time.

## MVP

Due to the limited project time, the focus is on realizing an MVP.
This contains that the staff needs to see and be able to process orders. Furthermore, it is required that the staff has a GUI with a time-synchronized table overview displaying the number of orders per table.
On the customers' side, for now, it is only necessary to send an item order corresponding to the customers' table.
Until further information, regarding the current system, is gathered, the focus of the project is the application side which is accessible from the staff and not the customer.

For further specifications see the wiki in the origin repository.

## How to Start
The application has two entry points:
- Customerside: lib/view/customer/main.dart
- Staffside: lib/view/staff/main.dart

In order to execute the main's an emulator has to get defined for execution.
Currently, the execution is only secured in windows and android environments.

It is recommended to use the IntelliJ Flutter extension for further execution and development.

For further description check out the project wiki.