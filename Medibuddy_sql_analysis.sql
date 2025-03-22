USE medibuddy;
select * from insurance_data_price;
select * from personal_details;

#1.Does gender impact policy extension?
SELECT sex, COUNT(*) AS Policy_Count, AVG(charges_INR) AS Avg_Charges
FROM insurance_data_price IC
JOIN personal_details PD ON IC.Policy_no = PD.Policy_no
GROUP BY sex;

#2.What is the average amount of money spent per policy cover?
SELECT AVG(charges_INR) AS Avg_Policy_Cost 
FROM insurance_data_price;

#3.Should the company offer separate policies based on geographic location?
SELECT region, COUNT(*) AS Policy_Count, AVG(charges_INR) AS Avg_Charges
FROM insurance_data_price IC
JOIN personal_details PD ON IC.Policy_no = PD.Policy_no
GROUP BY region
ORDER BY Avg_Charges DESC;

#4.Does the number of dependents affect the claim amount?
SELECT children, AVG(charges_INR) AS Avg_Charges
FROM insurance_data_price IC
JOIN personal_details PD ON IC.Policy_no = PD.Policy_no
GROUP BY children
ORDER BY children;

#5.Does BMI influence the insurance claim amount?
SELECT 
    CASE 
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Healthy'
        WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS BMI_Category,
    AVG(charges_INR) AS Avg_Charges
FROM insurance_data_price
GROUP BY BMI_Category;

#6.Does smoking status impact insurance claims?
SELECT smoker, AVG(charges_INR) AS Avg_Charges
FROM insurance_data_price IC
JOIN personal_details PD on IC.Policy_no=PD.Policy_no
GROUP BY smoker;

#7.Does age create a barrier for claims?
SELECT age, AVG(charges_INR) AS Avg_Charges
FROM insurance_data_price
GROUP BY age
ORDER BY age;

#8.Can BMI-based discounts be considered?
SELECT bmi, charges_INR, 
    (CASE 
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Eligible for Discount'
        ELSE 'No Discount'
    END) AS Discount_Eligibility
FROM insurance_data_price;





