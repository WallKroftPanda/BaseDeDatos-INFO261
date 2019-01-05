#2
#Estructura propuesta:
#{
#   'ID_ciudad':{algun_valor},    
#   'temperatura':{algun_valor},    
#   'temperatura_mínima':{algun_valor},
#   'temperatura_máxima':{algun_valor},
#   'presion_en_tierra':{algun_valor},
#   'presion_nivel_del_mar':{algun_valor},
#   'presion_atmosferica':{algun_valor},
#   'humedad':{algun_valor}
#}
#3
#Trabajo practico 1 notebook 5
import pymongo as pm
import requests
import pandas as pd
from pymongo import MongoClient

URL = "https://samples.openweathermap.org/data/2.5/history/city?q=Valdivia,CL&appid=b1b15e88fa797225412429c1c50c122a1"

r = requests.get(url = URL)

cliente = MongoClient('localhost',27017)

db = cliente['alguna_base_de_datos_en_mongo']

collection = db['Datos_del_aire']


data = r.json()
city_id = data["city_id"]
extracto = data["list"]
for i in range(0,2):
    documento = extracto[i]
    documento = documento["main"]
    insercion = {"ID_ciudad":city_id"temperatura":documento["temp"],"temperatura_mínima":documento["temp_min"],"temperatura_máxima":documento["temp_max"],"presion_en_tierra":documento["grnd_level"],"presion_nivel_del_mar":documento["sea_level"],"presion_atmosferica":documento["pressure"],"humedad":documento["humidity"]}
    print(insercion)
    collection.insert(insercion)


