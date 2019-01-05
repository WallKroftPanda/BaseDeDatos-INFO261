from flask import Flask
import json
from flask import request, jsonify
import mysql.connector

app = Flask(__name__)

connect = mysql.connector.connect(user="root",host="localhost",password="wallcroft18")
cursor = connect.cursor()
cursor.execute("USE Valdivia")

@app.route('/')
def hello():
    return '''
    <center>
    <h1>TEST smartAPI NOTEBOOK 4</h1>
    <p>TEST USO BASE DE DATOS EN MYSQL VALDIVIA</p>
    </center>
    '''

#Error handler

@app.errorhandler(404)
def page_not_found(e):mongoimport --db nb7-peliculas --collection movieDetails --drop --file <path/to/movieDetails.json>
    return "<center><h1>NOT FOUND MY LITTLE FRIEND</h1><center>",404

def generalOne(query, api_filter):
    query = query[:-4] + ';'

    print(query)
    print(api_filter)

    results = cursor.execute(query, api_filter)
    people = cursor.fetchall()
    filas = [x[0] for x in cursor.description]
    json_data=[]
    for result in people:
        json_data.append(dict(zip(filas, result)))
    return jsonify(json_data)

#ALL methods

@app.route('/Valdivia/1.0/PERSONA/all', methods=['GET'])
def apiSmart_all_P():
    result = cursor.execute("SELECT * FROM PERSONA;")
    lugares = cursor.fetchall()
    filas = [x[0] for x in cursor.description]
    json_info = []

    for result in lugares:
        json_info.append(dict(zip(filas,result)))
    return jsonify(json_info)

@app.route('/Valdivia/1.0/DESPLAZARSE/all', methods=['GET'])
def apiSmart_all_D():
    result = cursor.execute("SELECT * FROM DESPLAZARSE;")
    lugares = cursor.fetchall()
    filas = [x[0] for x in cursor.description]
    json_info = []

    for result in lugares:
        json_info.append(dict(zip(filas,result)))
    return jsonify(json_info)

@app.route('/Valdivia/1.0/LUGARDEINTERES/all', methods=['GET'])
def apiSmart_all_LGD():
    result = cursor.execute("SELECT * FROM LUGARDEINTERES;")
    lugares = cursor.fetchall()
    filas = [x[0] for x in cursor.description]
    json_info = []

    for result in lugares:
        json_info.append(dict(zip(filas,result)))
    return jsonify(json_info)

#FILTERS

@app.route('/Valdivia/1.0/PERSONA', methods=['GET'])
def api_P_filter():
    query_parameter = request.args

    edad_query = query_parameter.get('edad')
    id_query = query_parameter.get('id')
    nombre_query = query_parameter.get('nombre')
    query = 'SELECT edad,id,nombre FROM PERSONA WHERE'

    api_filter = []

    if edad_query:
        query+=' edad=%s AND'
        api_filter.append(edad_query)
    if id_query:
        query+=' id=%s AND'
        api_filter.append(id_query)
    if nombre_query:
        query+=' nombre=%s AND'
        api_filter.append(nombre_query)
    if not (edad_query):
        return page_not_found(404)
        
    return generalOne(query, api_filter)

@app.route('/Valdivia/1.0/DESPLAZARSE', methods=['GET'])
def api_D_filter():
    query_parameter = request.args

    idD_query = query_parameter.get('idD')
    latitud_query = query_parameter.get('latitud')
    longitud_query = query_parameter.get('longitud')
    id_rut_query = query_parameter.get('id_rut')
    fecha_query = query_parameter.get('fecha')
    query = 'SELECT * FROM DESPLAZARSE WHERE'

    api_filter = []

    if idD_query:
        query+=' idD=%s AND'
        api_filter.append(idD_query)
    if latitud_query:
        query+=' latitud=%s AND'
        api_filter.append(latitud_query)
    if longitud_query:
        query+=' longitud=%s AND'
        api_filter.append(longitud_query)
    if id_rut_query:
        query+=' id_rut=%s AND'
        api_filter.append(id_rut_query)
    if fecha_query:
        query+=' fecha=%s AND'
        api_filter.append(fecha_query)
    if not (idD_query):
        return page_not_found(404)
        
    return generalOne(query, api_filter)

@app.route('/Valdivia/1.0/LUGARDEINTERES', methods=['GET'])
def api_LDI_filter():
    query_parameter = request.args

    idLugar_query = query_parameter.get('idLugar')
    nombre_query = query_parameter.get('nombre')
    descripcion_query = query_parameter.get('descripcion')
    categoria_query = query_parameter.get('categoria')
    latitud_query = query_parameter.get('latitud')
    longitud_query = query_parameter.get('longitud')
    query = 'SELECT * FROM LUGARDEINTERES WHERE'

    api_filter = []

    if idLugar_query:
        query+=' idLugar=%s AND'
        api_filter.append(idLugar_query)
    if nombre_query:
        query+=' nombre=%s AND'
        api_filter.append(nombre_query)
    if descripcion_query:
        query+=' descripcion=%s AND'
        api_filter.append(descripcion_query)
    if categoria_query:
        query+=' categoria=%s AND'
        api_filter.append(categoria_query)
    if latitud_query:
        query+=' latitud=%s AND'
        api_filter.append(latitud_query)
    if longitud_query:
        query+=' longitud=%s AND'
        api_filter.append(longitud_query)
    if not (idLugar_query):
        return page_not_found(404)
        
    return generalOne(query, api_filter)


if __name__=='__main__':
    app.run(debug=True)