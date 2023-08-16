import mysql.connector

config = {
    "user": "root",
    "password": "aluno",
    "host": "localhost", #ou host do seu servidor mysql
    "database": "alunos" #schema
}

try:
    connection = mysql.connector.connect(**config)
    if connection.is_connected():
        print('conexão bem-sucedida')

        cursor = connection.cursor()

        query = "SELECT * FROM alunos"

        cursor.execute(query)

        results = cursor.fetchall()

        for i in results:
            print(i)
            
except mysql.connector.Error as e:
    print('erro ao conectar:', e)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print('conexão encerrada')