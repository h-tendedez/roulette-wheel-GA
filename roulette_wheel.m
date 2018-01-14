% Pass through the fitness, chromosomes and population.
function [selectedParent] = roulette_wheel(fitnessStorage, chrome, population)

% The mean of the fitnesses
sumOfFitness = sum(fitnessStorage);

% Random number generator (between 0-1)
randomNum = rand(1);

% Probabilities 
probability = zeros(1, population);

% Location of Selected Parent 
selectedParentLocation = 0;

% Work out probabilities for roulette selection
for i = 1:length(fitnessStorage)  
    for j = 1:size(fitnessStorage,1)
        probability(i) = fitnessStorage(i) / sumOfFitness;
    end
end

% Starting probability sum
sumProb = 0;

for i = 1:length(probability) 
    
    sumProb = sumProb + probability(i);
   
     if(randomNum <= sumProb) 
         
         selectedParentLocation = i;
         
         selectedParent = chrome(selectedParentLocation, :);
         
        break
  
     end

end
