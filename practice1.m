%Practice for test 2
disp("Cardax electronic door lock system for R-Block")

%setting today vector
Today = [12212
17617
16968
13375
11378
17617
12062
19891
15574
10582
16212
19800
15574
12062
19891
17617
12222
19800
11274
10582
16212
19800
15574
12062
19891
17617
19891
11274
12222
19891];

%display vector today
disp(Today)

%convert from column vector to row vector
today_row = Today'

%display how many times door was used today
disp("The door was used " + length(Today) + " times today ");

user_number = input("Enter a Cardax number: ");
if ismember(user_number, today_row)
    fprintf("User %d has used the door today \n", user_number);
else
    fprintf("User %d has not used the door today \n", user_number);
end

%initialise counter variable and vector to store the indices
count = 0;
indices = [];

%loop through the vector and store the indices where the Cardax number appears
for i = 1:length(Today)
    if today_row(i) == user_number
        count = count + 1;
        indices(count) = i;
    end
end

%display the number of times the person used the door
fprintf("User %d has used the door %d times today \n", user_number, count)

%display the vector of indices
fprintf('The user number %d appeared at the following indices:\n', user_number);
disp(indices);

if mod(count,2) == 0
    fprintf("%d is Outside the building\n", user_number);
else
    fprintf("%d is Inside the building\n", user_number);
end

%initialise vector to store number of people
people = [];

% Loop through the vector and add unique user numbers to the people vector
for i = 1:length(Today)
    if ~ismember(Today(i), people)
        people = [people Today(i)];
    end
end

% Display the vector of unique Cardax numbers
%
fprintf('The following Cardax numbers used the door today:\n');
disp(people);
num_people = length(people);

% Initialize the status vector as a row vector of empty strings
status = [strings(1, length(people))];

%loop through each person in the people vector
for i = 1:length(people)
    %set count variable to 0
    count = 0;
    %loop through each user number in the Today vector
    for j = 1:length(Today)
        %check if the current Cardax number matches the current person
        if people(i) == Today(j)
            %if there is a match, increment the count variable
            count = count + 1;
        end
    end
    %determine whether the person is In or Out based on the count variable
    if mod(count, 2) == 0
        status(i) = "Out";
    else
        status(i) = "In";
    end
end

%display a message indicating the status of each person
fprintf('The status of each person is:\n');
%display the vector of status strings
disp(status);

for i = 1:length(status)
    if status(i) == "Out"
        fprintf("%d is out the building\n",people(i));
    elseif status(i) == "In"
        fprintf("%d is in the building\n", people(i));
    end
end