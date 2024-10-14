from faker import Faker

faker = Faker('pt_BR')

def get_fake_account():
    account = {
        "name": faker.name(),
        "email": faker.email(),
        "document": faker.cpf()
    }
    return account