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

        query = "UPDATE alunos SET cpf = %s WHERE cpf = 456"

        data_to_update = [123]

        cursor.execute(query, data_to_update)

        connection.commit()

        print('dados atualizados com sucesso')
            
except mysql.connector.Error as e:
    print('erro ao conectar ou inserir dados:', e)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print('conexão encerrada')