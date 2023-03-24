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

categories = [Category(name="Electronics"), Category(name="Books"), Category(name="Home & Garden"), Category(name="Toys"), Category(name="Clothing"), Category(name="Food & Drinks"), Category(name="Beauty & Personal Care"), Category(name="Sports & Outdoors"), Category(name="Music"), Category(name="Pets")]
products = [Product(name="Smartphone", price=499.99, category_id=1, description="High-quality smartphone with advanced features", img_path="https://example.com/smartphone.jpg"), Product(name="Novel", price=15.99, category_id=2, description="Fictional book with compelling storyline", img_path="https://example.com/novel.jpg"), Product(name="Sofa", price=799.99, category_id=3, description="Comfortable and stylish sofa for your living room", img_path="https://example.com/sofa.jpg"), Product(name="Action Figure", price=29.99, category_id=4, description="Collectible action figure from popular movie franchise", img_path="https://example.com/action-figure.jpg"), Product(name="T-Shirt", price=19.99, category_id=5, description="Casual and trendy t-shirt for everyday wear", img_path="https://example.com/t-shirt.jpg"), Product(name="Chocolate", price=4.99, category_id=6, description="Premium chocolate made from high-quality cocoa beans", img_path="https://example.com/chocolate.jpg"), Product(name="Shampoo", price=9.99, category_id=7, description="Natural and nourishing shampoo for all hair types", img_path="https://example.com/shampoo.jpg"), Product(name="Yoga Mat", price=39.99, category_id=8, description="Non-slip yoga mat for comfortable and safe practice", img_path="https://example.com/yoga-mat.jpg"), Product(name="Vinyl Record", price=29.99, category_id=9, description="Classic vinyl record of a timeless album", img_path="https://example.com/vinyl-record.jpg"), Product(name="Dog Food", price=24.99, category_id=10, description="High-quality and nutritious dog food for all breeds and sizes", img_path="https://example.com/dog-food.jpg")]
billing_addresses =  [BillingAddress(country="United States", zip="10001", city="New York", street="Broadway", house="123"), BillingAddress(country="Canada", zip="M5V 1Z4", city="Toronto", street="Queen Street West", house="456"), BillingAddress(country="United Kingdom", zip="SW1A 1AA", city="London", street="Buckingham Palace Road", house="789"), BillingAddress(country="Germany", zip="10117", city="Berlin", street="Unter den Linden", house="1011"), BillingAddress(country="Japan", zip="100-0004", city="Chiyoda", street="Tokyo Station", house="1213")]
roles = [Role(name="Admin"), Role(name="Employee"), Role(name="User")]
users = [User(name="John", password="johndoe123", second_name="Doe", email="johndoe@example.com", stuff=False), User(name="Jane", password="janedoe456", second_name="Doe", email="janedoe@example.com", stuff=True), User(name="Bob", password="bobsmith789", second_name="Smith", email="bobsmith@example.com", stuff=False), User(name="Alice", password="alicebrown012", second_name="Brown", email="alicebrown@example.com", stuff=True), User(name="David", password="davidmiller345", second_name="Miller", email="davidmiller@example.com", stuff=False)]
user_roles = [UserRole(user_id=1, role_id=3), UserRole(user_id=2, role_id=2), UserRole(user_id=3, role_id=3), UserRole(user_id=4, role_id=1), UserRole(user_id=5, role_id=3)]
reviews = [Review(product_id=3, user_id=10, stars=4, description="This product exceeded my expectations!"),Review(product_id=7, user_id=2, stars=2, description="Not worth the price."),Review(product_id=12, user_id=46, stars=5, description="Amazing product, highly recommended!"),Review(product_id=35, user_id=22, stars=3, description="Decent product, but not the best."),Review(product_id=48, user_id=18, stars=1, description="Terrible quality, do not buy!"),Review(product_id=23, user_id=7, stars=4, description="Great value for the price."),Review(product_id=9, user_id=15, stars=5, description="Best product I've ever used!")]
cart_items = [CartItem(product_id=7, user_id=10, quantity=2),CartItem(product_id=15, user_id=21, quantity=1),CartItem(product_id=35, user_id=3, quantity=3),CartItem(product_id=2, user_id=46, quantity=5),CartItem(product_id=19, user_id=7, quantity=2),CartItem(product_id=9, user_id=15, quantity=1),CartItem(product_id=27, user_id=33, quantity=4)]
orders = [Order(user_id=5, total_price=123.45, address_id=8, status="Pending"),Order(user_id=22, total_price=67.89, address_id=33, status="Shipped"),Order(user_id=47, total_price=321.98, address_id=14, status="Delivered"),Order(user_id=10, total_price=76.54, address_id=45, status="Cancelled"),Order(user_id=34, total_price=54.32, address_id=26, status="Pending"),Order(user_id=19, total_price=98.76, address_id=17, status="Shipped"),Order(user_id=2, total_price=234.56, address_id=40, status="Delivered")]
order_items = [OrderItem(order_id=1, product_id=3, quantity=2),OrderItem(order_id=2, product_id=1, quantity=1),OrderItem(order_id=3, product_id=7, quantity=3),OrderItem(order_id=4, product_id=9, quantity=2),OrderItem(order_id=5, product_id=2, quantity=1),OrderItem(order_id=6, product_id=5, quantity=3),OrderItem(order_id=7, product_id=8, quantity=2),OrderItem(order_id=8, product_id=4, quantity=1),OrderItem(order_id=9, product_id=6, quantity=3),OrderItem(order_id=10, product_id=2, quantity=2)]


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
