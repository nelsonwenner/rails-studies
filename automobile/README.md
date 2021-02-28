## :bulb: About
Auto race classification API, in which the classifications are separated by race and season/championship, receiving files for each race performed.

## :mag_right: Database diagram
![backend-challenge-automobile](https://user-images.githubusercontent.com/40550247/109307337-3bf28180-781f-11eb-824a-c28991f73fa5.png)

## :dart: ToDo
  - Main points
    - [x] Import race file defining race date;
    - [x] Auto register pilot by name;
    - [x] Auto register car by number;
    - [x] Auto register season defined by the year of the race;
  - General rules
    - [x] The car is identified by the car number;
    - [ ] A car can have different drivers in different races;
    - [ ] The same pilot can drive different cars in different races;
    - [ ] A race season is defined by the year of the race date;
    - [ ] There should not be more than one car with the same number;
    - [ ] There should not be more than one pilot with the same name;
    - [ ] There should be no more than one result per driver in the race;
    - [ ] Only one run per day is allowed;
    - [ ] There will only be 14 drivers / cars per race;
    - [ ] In a race, drivers / cars may have abandoned the race, so he may have a shorter total lap time than the first place.
