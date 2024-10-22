import psycopg2

def set_connection_db():
    try:
        conn = psycopg2.connect(
            host='localhost',
            port='5432',
            database='smartbit',
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

def query(conn, sql_query):
    try:
        cur = conn.cursor()
        cur.execute(sql_query)
        results = cur.fetchall()
        cur.close()
        return results
    except Exception as e:
        print(f"Erro ao executar query: {e}")
        return None
