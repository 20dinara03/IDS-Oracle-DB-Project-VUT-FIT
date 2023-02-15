create table Category
(
    id   serial
        constraint "Category_pk"
            primary key,
    name char(512) not null
);

create table Product
(
    id           serial
        constraint "Product_pk"
            primary key,
    name         char(512) not null,
    price        float4    not null,
    category_id  integer   not null
        constraint "Product_Category_id_fkey"
            references Category,
    description  text,
    img_path     char(512),
    restock_date date    default NULL,
    store_count  integer default 0,
    order_count  integer default 0,
    stars        float4  default 0
);

create table BillingAddress
(
    id         serial
        constraint "BillingAddress_pk"
            primary key,
    country    char(512) not null,
    zip        char(512) not null,
    city       char(512) not null,
    street     char(512) not null,
    house      char(512) not null,
    apartment  char(512)
);

create table Role
(
    id   serial
        constraint "Role_pk"
            primary key,
    name char(512) not null
);

create table "User"
(
    id          serial
        constraint "User_pk"
            primary key,
    name        char(512) not null,
    password    char(512) not null,
    second_name char(512),
    email       char(512) not null,
    stuff       boolean   default false,
    deleted     boolean   default false
);

create table UserAddress
(
    id         serial
        constraint "UserAddress_pk"
            primary key,
    user_id    integer   not null
        constraint "UserAddress_User_id_fkey"
            references "User",
    address_id integer   not null
        constraint "UserAddress_Address_id_fkey"
            references BillingAddress
);

create table UserRole
(
    id     serial
        constraint "UserRole_pk"
            primary key,
    user_id integer   not null
        constraint "UserRole_User_id_fkey"
            references "User",
    role_id integer   not null
        constraint "UserRole_Role_id_fkey"
            references Role
);


create table Review
(
    id          serial
        constraint "Review_pk"
            primary key,
    product_id  integer   not null
        constraint "Review_Product_id_fkey"
            references Product,
    user_id     integer   not null
        constraint "Review_User_id_fkey"
            references "User",
    stars       integer   not null,
    description text
);

create table CartItem
(
    id         serial
        constraint "CartItem_pk"
            primary key,
    product_id integer   not null
        constraint "CartItem_Product_id_fkey"
            references Product,
    user_id    integer   not null
        constraint "CartItem_User_id_fkey"
            references "User",
    quantity   integer   not null
);

create table "Order"
(
    id          serial
        constraint "Order_pk"
            primary key,
    user_id     integer   not null
        constraint "Order_User_id_fkey"
            references "User",
    total_price float4    not null,
    address_id  integer   not null
        constraint "Order_Address_id_fkey"
            references BillingAddress,
    status      char(512) not null
);

create table OrderItem
(
    id         serial
        constraint "OrderItem_pk"
            primary key,
    order_id   integer   not null
        constraint "OrderItem_Order_id_fkey"
            references "Order",
    product_id integer   not null
        constraint "OrderItem_Product_id_fkey"
            references Product,
    quantity      integer   not null
);
