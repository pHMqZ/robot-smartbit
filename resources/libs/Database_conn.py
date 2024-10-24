import psycopg2


def set_connection_db():
    try:
        conn = psycopg2.connect(
            host='localhost',
            port='5432',
            dbname='smartbit',  # Mudou de 'database' para 'dbname'
            user='postgres',
            password='QAx@123',
            client_encoding='utf8'
        )
        print("Conexão OK PY")
        return conn  
    except UnicodeDecodeError as e:
        print(f"Erro de decodificação: {e}")
        return None
    except  Exception as ex:
        print(f"Outros erros:{ex}")
        return None

def check_connection(conn):
    if conn is None:
        raise ValueError("Nenhuma conexão foi estabelecida")
    if conn.closed != 0:
        raise ValueError("A conexão está fechada")
    print("Conexão está ativa e aberta")
    return True

def close_connection_db(conn):
    if conn and not conn.closed:
        conn.close()
        print("Conexão fechada")
    else:
        print("Nenhuma conexão para fechar ou conexão já fechada")

def execute(sql_query):
    conn = set_connection_db()

    cur = conn.cursor()
    cur.execute(sql_query)
    conn.commit()
    conn.close()

def insert_account(account):
    query=f"""
    INSERT INTO accounts(email, name, cpf)
	VALUES ('{account["email"]}','{account["name"]}','{account["cpf"]}');
    """
    execute(query)

def delete_user_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"

    execute(query)


