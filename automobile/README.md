<h1 align="center">
  Backend Challenge - Automobiles
</h1>

## :bulb: About
Auto race classification API, in which the classifications are separated by race and season/championship, receiving files for each race performed. Challenge instructions [BACKEND_CHALLENGE](BACKEND_CHALLENGE.md).

## :mag_right: Database diagram
<div align="center">
  <img alt="backend-challenge-automobile" src="https://user-images.githubusercontent.com/40550247/109307337-3bf28180-781f-11eb-824a-c28991f73fa5.png" />
</div>

## :dart: ToDo
  - Main points
    - [x] Import race file defining race date;
    - [x] Auto register pilot by name;
    - [x] Auto register car by number;
    - [x] Auto register season defined by the year of the race;
    - [ ] Calculate points;
    - [ ] Display ranking by race and season.
  
  - General rules
    - [x] The car is identified by the car number;
    - [x] A car can have different pilots in different races;
    - [x] The same pilot can drive different cars in different races;
    - [x] A race season is defined by the year of the race date;
    - [x] There should not be more than one car with the same number;
    - [x] There should not be more than one pilot with the same name;
    - [ ] There should be no more than one result per driver in the race;
    - [ ] Only one run per day is allowed;
    - [x] There will only be 14 pilots / cars per race;
    - [ ] In a race, pilots / cars may have abandoned the race, so he may have a shorter total lap time than the first place.

  - Scoring rules
    - [ ] +1 point for the fastest lap, ignoring the one who does not complete the race, passing the point to the next with the fastest lap and who has completed the race;
    - [ ] +1 point for pole, ignoring the one who does not complete the race, passing the point to the next placed on the starting grid who has completed the race;
    - [ ] +12 points for first place;
    - [ ] +10 points for second place;
    - [ ] +8 points for third place;
    - [ ] +6 points for fourth place;
    - [ ] +4 points for fifth place;
    - [ ] +2 points for sixth place;
    - [ ] +1 points for other riders who have completed all laps;
    - [ ] Those who have not completed all laps, do not score (including extra points for fastest lap and pole);

  - Race tiebreaker rules
    1. Best lap time;
    2. Average speed;

  - Tiebreaker rules of the season
    1. Greater number of victories;
    2. Greater number of second places;
    3. Higher number of third places;
    4. Best place in the last race;
