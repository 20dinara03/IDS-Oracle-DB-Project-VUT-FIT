DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table Category
    (
       id   NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "Category_pk"
                primary key,
        name char(512) not null unique
             CONSTRAINT alphabetic_category_name CHECK (REGEXP_LIKE(name, ''^[^0-9]*$''))
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;


DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table Product
    (
        id           NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "Product_pk"
                primary key,
        name         char(512) not null unique,
        price        float    not null
              CONSTRAINT price_positive CHECK (price > 0),
        category_id  integer   not null
            constraint "Product_Category_id_fkey"
                references Category,
        description  varchar2(1024),
        img_path     char(512),
        restock_date date    default NULL,
        store_count  integer default 0,
        order_count  integer default 0,
        stars        float  default 0
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table BillingAddress
    (
        id         NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "BillingAddress_pk"
                primary key,
        country    char(512) not null,
        zip        number not null
             CONSTRAINT zip_is_numbers CHECK (REGEXP_LIKE(zip, ''^[[:digit:]]+$'')),
        city       char(512) not null,
        street     char(512) not null,
        house      char(512) not null,
        apartment  char(512)
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table Role
    (
        id   NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "Role_pk"
                primary key,
        name char(512) not null unique
          CONSTRAINT alphabetic_role_name CHECK (REGEXP_LIKE(name, ''^[^0-9]*$''))
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table "User"
    (
        id          NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "User_pk"
                primary key,
        name        char(512) not null
          CONSTRAINT alphabetic_user_name CHECK (REGEXP_LIKE(name, ''^[^0-9]*$'')),
        password    char(512) not null,
        second_name char(512),
        email       char(512) not null unique,
        stuff       NUMBER(1)   default 0,
        deleted     NUMBER(1)   default 0
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table UserAddress
    (
        -- I hope i do not need to create constraint check fot IDs
        id         NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "UserAddress_pk"
                primary key,
        user_id    integer   not null
            constraint "UserAddress_User_id_fkey"
                references "User",
        address_id integer   not null
            constraint "UserAddress_Address_id_fkey"
                references BillingAddress
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table UserRole
    (
        -- I hope i do not need to create constraint check fot IDs
        id     NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "UserRole_pk"
                primary key,
        user_id integer   not null
            constraint "UserRole_User_id_fkey"
                references "User",
        role_id integer   not null
            constraint "UserRole_Role_id_fkey"
                references Role
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table Review
    (
        id          NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "Review_pk"
                primary key,
        product_id  integer   not null
            constraint "Review_Product_id_fkey"
                references Product,
        user_id     integer   not null
            constraint "Review_User_id_fkey"
                references "User",
        stars       integer   not null
              CONSTRAINT review_stars_positive CHECK (stars > 0),
        description varchar2(1024)
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table CartItem
    (
        id         NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "CartItem_pk"
                primary key,
        product_id integer   not null
            constraint "CartItem_Product_id_fkey"
                references Product,
        user_id    integer   not null
            constraint "CartItem_User_id_fkey"
                references "User",
        quantity   integer   not null
              CONSTRAINT cartItem_quantity_positive CHECK (quantity > 0)
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table Employee
    (
        id          NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "Employee_pk"
                primary key,
        user_id     integer   not null
            constraint "Employee_User_id_fkey"
                references "User",
        position    char(512) not null
          CONSTRAINT alphabetic_employee_position CHECK (REGEXP_LIKE(position, ''^[^0-9]*$''))
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table admin
    (
        -- I hope i do not need to create constraint check fot IDs
        id          NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "admin_pk"
                primary key,
        employee_id     integer   not null
            constraint "admin_Employee_id_fkey"
                references Employee
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table Payment
    (
        id          NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "OrderProcessing_pk"
                primary key,
        user_id integer   not null
            constraint "Payment_User_id_fkey"
                references "User",
        account_number char(512) not null,
        expiration_date date not null,
        created_at date not null,
        is_payed NUMBER(1) default 0,
        total_price float not null
              CONSTRAINT payment_totalPrice_positive CHECK (total_price > 0)
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table "Order"
    (
        id          NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "Order_pk"
                primary key,
        user_id     integer   not null
            constraint "Order_User_id_fkey"
                references "User",
        address_id  integer   not null
            constraint "Order_Address_id_fkey"
                references BillingAddress,
        payment_id  integer   not null
            constraint "Order_Payment_id_fkey"
                references Payment,
        status      char(512) not null,
        processed_by integer
            constraint "OrderProcessing_Employee_id_fkey"
                references Employee,
        shipped_by integer
            constraint "OrderShipping_Employee_id_fkey"
                references Employee,
        total_price float not null
              CONSTRAINT order_totalPrice_positive CHECK (total_price > 0)
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;

DECLARE
    sql_stmt clob ;
BEGIN
    sql_stmt:='create table OrderItem
    (
        id         NUMBER GENERATED BY DEFAULT AS IDENTITY
            constraint "OrderItem_pk"
                primary key,
        order_id   integer   not null
            constraint "OrderItem_Order_id_fkey"
                references "Order",
        product_id integer   not null
            constraint "OrderItem_Product_id_fkey"
                references Product,
        quantity      integer   not null
            CONSTRAINT orderItem_quantity_positive CHECK (quantity > 0)
    )';
    EXECUTE IMMEDIATE sql_stmt;

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL;
            ELSE
                RAISE;
            END IF;
END;
