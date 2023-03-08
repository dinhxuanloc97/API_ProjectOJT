Create database ProjectOJT_API;
use ProjectOJT_API;
    create table Tag (
        tagId int,
        tagName nvarchar(50) not null ,
        tagStatus bit
    );
    create  table catalog(
        catalogId int primary key auto_increment,
        catalogName nvarchar(50) not null ,
        catalogStatus bit
    );
    create table tag(
        tagId int primary key  auto_increment,
        tagName nvarchar(100),
        tagStatus bit
    );
    create table product (
        productId int primary key auto_increment,
        productName nvarchar(200) not null ,
        productAuthor nvarchar(200) not null ,
        productImg text,
        productTitle text,
        productQuantity int,
        productPrice float,
        productStatus bit,
        productDate datetime,
        productLanguage nvarchar(100) not null ,
        productCompany nvarchar(200) ,
        catalogId int not null ,
        foreign key (catalogId) references catalog(catalogId)
    );
    create table tagProduct(
        tagId int ,
        productId int ,
        foreign key (tagId) references  tag(tagId),
        foreign key (productId) references product(productId)
    );
    create table user(
        userId int primary key not null ,
        userName nvarchar(200) unique ,
        dateUser datetime,
        pass nvarchar(100),
        phone nvarchar(100),
        address nvarchar(200),
        email nvarchar(200) unique ,
        userStatus bit
    );
    create table roles(
        roleId int primary key ,
        roleName nvarchar(255)
    );

    create table userRole(
      userId int,
      roleId int,
      foreign key (userId) references user(userId),
      foreign key (roleId) references roles(roleId)
    );
    create table orders(
        orderId int primary key not null ,
        orderStatus bit,
        totalOrder float,
        userId int not null ,
        orderDate datetime,
        foreign key (userId) references user(userId)

    );
    create table orderDetail(
        detailId int primary key not null ,
        detailQuantity int ,
        price int,
        priceDetail int ,
        productId int ,
        orderId int,
        foreign key (productId) references product(productId),
        foreign key (orderId) references orders(orderId)
    );
    create table comment (
        commentId int not null ,
        content text,
        productId int,
        userId int,
        foreign key (productId) references product(productId),
        foreign key (userId) references user(userId)
    );
    create table start (
                         startId int not null ,
                         startChoose int,
                         productId int,
                         userId int,
                         foreign key (productId) references product(productId),
                         foreign key (userId) references user(userId)
    );
    create table wishlist(
    userId int ,
    productId int,
    foreign key (productId) references product(productId),
    foreign key (userId) references user(userId)
    );




