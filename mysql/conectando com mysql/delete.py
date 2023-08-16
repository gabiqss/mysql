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

        query = ("DELETE FROM alunos WHERE cpf = 123")

        cursor.execute(query)

        connection.commit()

        print('dados apagados com sucesso')
            
except mysql.connector.Error as e:
    if connection.is_connected():
        connection.rollback()
    print('erro ao conectar ou apagar dados:', e)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print('conexão encerrada')