from faker import Faker
from dataclasses import dataclass, asdict

fake = Faker()


@dataclass
class Category:
    name: str

    def __str__(self):
        return self.name


@dataclass
class Product:
    name: str
    price: float
    category_id: int
    description: str
    img_path: str


@dataclass
class BillingAddress:
    country: str
    zip: str
    city: str
    street: str
    house: str


@dataclass
class Role:
    name: str


@dataclass
class User:
    name: str
    password: str
    second_name: str
    email: str
    stuff: bool = False


@dataclass
class UserRole:
    user_id: int
    role_id: int


@dataclass
class Review:
    product_id: int
    user_id: int
    stars: int
    description: str


@dataclass
class CartItem:
    product_id: int
    user_id: int
    quantity: int


@dataclass
class Order:
    user_id: int
    total_price: float
    address_id: int
    status: str


@dataclass
class OrderItem:
    order_id: int
    product_id: int
    quantity: int
    

MAX = 50

categories = [Category(name=fake.word()) for _ in range(10)]
products = [Product(name=fake.word(), price=fake.pyfloat(), category_id=fake.random_int(min=1, max=10), description=fake.text(), img_path=fake.image_url()) for _ in range(MAX)]
billing_addresses = [BillingAddress(country=fake.country(), zip=fake.postcode(), city=fake.city(), street=fake.street_name(), house=fake.building_number()) for _ in range(MAX)]
roles = [Role(name=fake.word()) for _ in range(10)]
users = [User(name=fake.first_name(), password=fake.password(), second_name=fake.last_name(), email=fake.email(), stuff=fake.boolean()) for _ in range(MAX)]
user_roles = [UserRole(user_id=fake.random_int(min=1, max=50), role_id=fake.random_int(min=1, max=10)) for _ in range(MAX)]
reviews = [Review(product_id=fake.random_int(min=1, max=50), user_id=fake.random_int(min=1, max=50), stars=fake.random_int(min=1, max=5), description=fake.text()) for _ in range(MAX)]
cart_items = [CartItem(product_id=fake.random_int(min=1, max=50), user_id=fake.random_int(min=1, max=50), quantity=fake.random_int(min=1, max=10)) for _ in range(MAX)]
orders = [Order(user_id=fake.random_int(min=1, max=50), total_price=fake.pyfloat(), address_id=fake.random_int(min=1, max=50), status=fake.word()) for _ in range(MAX)]
order_items = [OrderItem(order_id=fake.random_int(min=1, max=50), product_id=fake.random_int(min=1, max=50), quantity=fake.random_int(min=1, max=10)) for _ in range(MAX)]


# to SQL
def to_sql(table_class, data):
    for i in data:
        print("INSERT INTO {table_name} ({fields}) VALUES (\'{value}\');".format(
            table_name=table_class.__name__,
            fields=",".join([f for f in asdict(i).keys()]),
            value='\',\''.join([str(d) for _, d in asdict(i).items()])))


def to_sql2(table_class, data):
    for i in data:
        print("INSERT INTO {table_name} ({fields}) VALUES (\'{value}\');".format(
            table_name=table_class,
            fields=",".join([f for f in asdict(i).keys()]),
            value='\',\''.join([str(d) for _, d in asdict(i).items()])))


to_sql(Category, categories)
to_sql(Product, products)
to_sql(BillingAddress, billing_addresses)
to_sql(Role, roles)
to_sql2("\"User\"", users)
to_sql(UserRole, user_roles)
to_sql(Review, reviews)
to_sql(CartItem, cart_items)
to_sql2("\"Order\"", orders)
to_sql(OrderItem, order_items)
