import requests from bs4 
import BeautifulSoup 
import json 
URL = 'https://lt.brcauto.eu/automobiliu-paieska/' 
req = requests.get(URL) 
soup = BeautifulSoup(req.text, 'lxml') 
pages = soup.find_all('li', class_='page-item')[-2] # biggest page -2 ">" we need only before the last 
cars_printed_counter = 0 
for number in range(1, int(pages.text)): 
req = requests.get(URL + '?page=' + str(number)) soup = BeautifulSoup(req.text, 'lxml') # if cars_printed_counter == 20: # break 
out = [] 
for single_car in soup.find_all('div', class_='cars-wrapper'): 
    if cars_printed_counter == 20: 
        break 
    Car_Title = single_car.find('h2', class_='cars__title') 
    Car_Specs = single_car.find('p', class_='cars__subtitle') 
    
    print('\nCar number:', cars_printed_counter + 1) 
    
    print(Car_Title.text) 
    print(Car_Specs.text) 
    
    car = {} 
    car["title"] = Car_Title.text 
    subs = Car_Specs.text.split(' | ') 
    car["year"] = subs[0] 
    car["fuel"] = subs[1].split(" ")[1]
    car["run"] = subs[3].split(" ")[0] car["type"] = subs[5] car["number"] = cars_printed_counter + 1 out.append(car) 
    cars_printed_counter += 1 

print(json.dumps(out)) 
with open("cars.json", "w") as f:
    f.write(json.dumps(out))