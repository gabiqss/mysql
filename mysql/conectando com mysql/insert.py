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

        query = "INSERT INTO alunos (nome, cpf) VALUES (%s, %s)"

        data_to_insert = ('chico', '456')

        cursor.execute(query, data_to_insert)

        connection.commit()

        print('dados inseridos com sucesso')
            
except mysql.connector.Error as e:
    print('erro ao conectar ou inserir dados:', e)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print('conexão encerrada')