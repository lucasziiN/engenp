clear
clc

% Define the today vector containing student purchases
today = [10234, 20567, 10234, 40123, 50834, 20567, 10234, 60789, 70145, 40123, 90189, 60789, 70145, 10234, 60789, 50834, 31092, 40123, 50834, 31092, 20567, 40123, 90189, 31092, 50834, 31092, 90189, 60789, 90189, 70145];

% Display the length of the today vector
disp("The length of the today vector is: " + length(today));

% Prompt the user to input a purchase number
purchase_number = input("Enter your purchase number: ");

% Check if the purchase number is in the today vector and display the result
if ismember(purchase_number, today)
    fprintf("%d has made a purchase today.\n ", purchase_number);
else
    fprintf("%d has not made a purchase today.\n ", purchase_number);
end

% Initialize variables to count the number of times the purchase_number appears in today vector
count = 0;
indices = [];

% Loop through the today vector and increment the count if purchase_number is found
for i = 1:length(today)
    if purchase_number == today(i)
        count = (count+1);
        indices(count) = i;
    end
end

% Display the number of purchases and indices of the purchase_number in today vector
fprintf("%d has made %d purchases today.\n", purchase_number, count);
fprintf("%d has made the following purchases: \n", purchase_number);
disp(indices);

% Initialize an empty array to store unique students (student IDs)
students = [];

% Loop through the today vector and add unique student IDs to the students array
for i = 1:length(today)
    if ~ismember(today(i), students) 
        students = [students today(i)];
    end
end

% Display the unique students array
disp(students);

% Initialize an empty array to store the number of purchases per student
purchases = [];

% Loop through the students array and count their purchases in the today vector
for i = 1:length(students)
    count = 0;
    for j = 1:length(today)
        if students(i) == today(j)
            count = count+1;
        end
    end
    % Add the count to the purchases array
    purchases = [purchases, count];
    
    % Display if the student made an even or odd number of purchases
    if mod(purchases(i),2) == 0
        fprintf("%d has made an even number of purchases\n", students(i));
    else
        fprintf("%d has made an odd number of purchases\n", students(i));
    end
end

% Initialize variables to store the total amount spent and total amount spent per student
total_spent = 0;
total_spent_per_student = [];

% Loop through the students array and calculate the total amount spent per student
for i = 1:length(students)
    total_spent = purchases(i)*5;
    total_spent_per_student = [total_spent_per_student, total_spent];
    
    % Display the total amount spent per student
    fprintf("Student %d has spent $%.2f today.\n", students(i), total_spent_per_student(i));
end
