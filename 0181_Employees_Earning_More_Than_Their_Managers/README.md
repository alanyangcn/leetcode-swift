# 181 超过经理收入的员工

Employee 表包含所有员工，他们的经理也属于员工。每个员工都有一个 Id，此外还有一列对应员工的经理的 Id。


| Id | Name  | Salary | ManagerId |
| --- | --- | --- | --- |
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |

给定 Employee 表，编写一个 SQL 查询，该查询可以获取收入超过他们经理的员工的姓名。在上面的表格中，Joe 是唯一一个收入超过他的经理的员工。

## 方法 1：使用 **_WHERE_** 语句

如下面表格所示，表格里存有每个雇员经理的信息，我们也许需要从这个表里获取两次信息。
```
SELECT *
FROM Employee AS a, Employee AS b
;
```
* 注意：关键词 'AS' 是可选的
![a](./0181_01.png)

前 3 列来自表格 a ，后 3 列来自表格 b

从两个表里使用 Select 语句可能会导致产生 **_笛卡尔乘积_** 。在这种情况下，输出会产生 4*4=16 个记录。然而我们只对雇员工资高于经理的人感兴趣。所以我们应该用 WHERE 语句加 2 个判断条件。
```
SELECT
    *
FROM
    Employee AS a,
    Employee AS b
WHERE
    a.ManagerId = b.Id
        AND a.Salary > b.Salary
;
```
![a](./0181_02.png)

由于我们只需要输出雇员的名字，所以我们修改一下上面的代码，得到最终解法：

```
SELECT
    a.Name AS 'Employee'
FROM
    Employee AS a,
    Employee AS b
WHERE
    a.ManagerId = b.Id
        AND a.Salary > b.Salary
;

```
## 方法 2：使用 **_JOIN_** 语句

实际上， JOIN 是一个更常用也更有效的将表连起来的办法，我们使用 ON 来指明条件。

```
SELECT
     a.NAME AS Employee
FROM Employee AS a JOIN Employee AS b
     ON a.ManagerId = b.Id
     AND a.Salary > b.Salary
;
```
