clear
clc

% Define the today vector containing ticket usage data
today = [ 30121, 29517, 25089, 31075, 31578, 29517, 32162, 39901, 31474, 30782, 36013, 39901, 31474, 32162, 39901, 32587, 37621, 29517, 38194, 33056, 31075, 30121, 36013, 25089, 37621, 39901, 38194, 32162, 30782, 33056 ]; 

% Display the today vector
disp(today);

% Calculate the gate usage
gate_usage = length(today);

% Prompt the user to input a ticket number
num_ticket = input("Enter your ticket number: ");

% Check if the ticket number is in the today vector and display the result
if ismember(num_ticket, today)
    fprintf("User %d has used their ticket today \n", num_ticket);
else
    fprintf("User %d has not used their ticket today \n", num_ticket);
end

% Initialize variables to store user usage and count
user_usage = [];
count = 0;

% Loop through the today vector and increment the count if num_ticket is found
for i = 1:gate_usage
    if num_ticket == today(i)
        count = count+1;
        user_usage(count) = i;
    else
    end
end

% Display the number of times the ticket was used and the indices
fprintf("User %d has used their ticket %d times today \n", num_ticket, count);
fprintf("User %d has used their tickets in indices: \n", num_ticket);
disp(user_usage);

% Determine if the user is inside or outside the platform based on the number of times their ticket was used
if mod(count, 2)==0
    fprintf("User %d is outside the platform\n", num_ticket);
else
    fprintf("User %d is inside the platform\n", num_ticket);
end

% Initialize an empty array to store unique passengers (ticket numbers)
passengers = [];

% Loop through the today vector and add unique ticket numbers to the passengers array
for i = 1:gate_usage
    if ~ismember(today(i), passengers)
        passengers = [passengers today(i)];
    end
end

% Initialize an empty array to store the status of each passenger
status = [strings(1, length(passengers))];

% Loop through the passengers array and determine their status (inside or outside the platform)
for i = 1:length(passengers)
    count = 0;
    for j = 1:gate_usage
        if passengers(i) == today(j)
            count = count+1;
        end
    end
    % Assign the status based on the count (even or odd)
    if mod(count, 2) == 0
        status(i) = "Out";
    else
        status(i) = "In";
    end
end

% Display a message indicating the status of each person
fprintf('The status of each person is:\n');
% Display the vector of status strings
disp(status);
