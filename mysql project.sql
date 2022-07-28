create database bank_loan;
use bank_loan;


-- 1. Year wise loan amount stats

select year(issue_d) as year, sum(loan_amnt) as Total_loan
from finance_1
group by year
order by year;

-- 2. Grade and Sub grade wise revol_bal

select f1.grade, f1.sub_grade, sum(f2.revol_bal) as revol_bal
from finance_1 as f1
inner join finance_2 as f2
on f1.id=f2.id
group by f1.grade, f1.sub_grade
order by f1.grade, f1.sub_grade;

-- 3. Total Payment for Verified Status Vs Total Payment for Non Verified Status

select f1.verification_status, format(sum(f2.total_pymnt),2) as Sum_Total_Payment
from finance_1 as f1
inner join finance_2 as f2
on f1.id = f2.id
where f1.verification_status = "Verified" or f1.verification_status = "Not Verified"
group by f1.verification_status;


-- 4. State wise and month wise loan status

Select addr_state as state, year(last_credit_pull_d) as year, loan_status, sum(loan_amnt)
from finance_1 as f1
inner join finance_2 as f2
on f1.id = f2.id
group by addr_state, year(last_credit_pull_d ), loan_status
order by addr_state, year(last_credit_pull_d ), loan_status;


-- 5. Home Ownership Vs Last payment date stats
select f1.home_ownership, sum(f2.last_pymnt_amnt) as last_pymnt_amnt, max(f2.last_pymnt_d) as last_pymnt_d
from finance_1 as f1
inner join finance_2 as f2
on f1.id = f2.id
group by f1.home_ownership
order by f1.home_ownership;



