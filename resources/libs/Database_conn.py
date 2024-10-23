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

def execute_db_operation(conn, sql_query, operation_type='query'):
    """
    Executa operações no banco de dados

    Args:
        conn: Conexão com banco
        sql_query: Query a ser executada
        operation_type: Tipo de operação - query para Select / execute para insert/update/delete

    Returns:
        - Para query - Retorna os resultados
        - Para execute - Retorna o número de linhas afetadas
    """

    try:
        cur = conn.cursor()
        cur.execute(sql_query)

        if operation_type.lower() == 'query':
            result = cur.fetchall()
        else:
            result = cur.rowcount
            conn.commit()

        cur.close()
        return result
    
    except Exception as e:
        print(f"Erro ao executar operação: {e}")
        if operation_type.lower() != 'query':
            conn.rollback()
        return None
    finally:
        if cur and not cur.closed:
            cur.close()
