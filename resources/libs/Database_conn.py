import psycopg2

def set_connection():

    try:
        conn = psycopg2.connect(
            host='smartbit-db-1',
            port='5432',
            database='smartbit',
            user='postgres',
            password='QAx@123',
            client_encoding='utf8'
        )

        return conn
         
    except UnicodeDecodeError as e:
        print(f"Erro de decodificação: {e}")
    
    except  Exception as ex:
        print(f"Outros erros:{ex}")
    return None

def close_connection(conn):
    if conn:
        conn.close()
