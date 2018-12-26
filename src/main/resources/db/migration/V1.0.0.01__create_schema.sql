--
--    Copyright 2016-2018 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

create table supplier (
    suppid int not null,
    name text,
    status text not null,
    addr1 text,
    addr2 text,
    city text,
    state text,
    zip text,
    phone text,
    primary key (suppid)
);

create table signon (
    username text not null,
    password text not null,
    primary key (username)
);

create table account (
    userid text not null,
    email text not null,
    firstname text not null,
    lastname text not null,
    status text,
    addr1 text not null,
    addr2 text,
    city text not null,
    state text not null,
    zip text not null,
    country text not null,
    phone text not null,
    primary key (userid)
);

create table profile (
    userid text not null,
    langpref text not null,
    favcategory text,
    mylistopt int,
    banneropt int,
    primary key (userid)
);

create table bannerdata (
    favcategory text not null,
    bannername text,
    primary key (favcategory)
);

create table orders (
    orderid int not null,
    userid text not null,
    orderdate timestamp not null,
    shipaddr1 text not null,
    shipaddr2 text,
    shipcity text not null,
    shipstate text not null,
    shipzip text not null,
    shipcountry text not null,
    billaddr1 text not null,
    billaddr2 text,
    billcity text not null,
    billstate text not null,
    billzip text not null,
    billcountry text not null,
    courier text not null,
    totalprice text not null,
    billtofirstname text not null,
    billtolastname text not null,
    shiptofirstname text not null,
    shiptolastname text not null,
    creditcard text not null,
    exprdate text not null,
    cardtype text not null,
    locale text not null,
    primary key (orderid)
);

create table orderstatus (
    orderid int not null,
    linenum int not null,
    timestamp date not null,
    status text not null,
    primary key (orderid, linenum)
);

create table orderlines (
    orderid int not null,
    linenum int not null,
    itemid text not null,
    quantity int not null,
    unitprice text not null,
    primary key (orderid, linenum)
);

create table category (
    catid text not null,
    name text,
    descn text,
    primary key (catid)
);

create table product (
    productid text not null,
    category text not null,
    name text,
    descn text,
    primary key (productid)
);

create index productCat on product (category);
create index productName on product (name);

create table item (
    itemid text not null,
    productid text not null,
    listprice text,
    unitcost text,
    supplier int,
    status text,
    attr1 text,
    attr2 text,
    attr3 text,
    attr4 text,
    attr5 text,
    primary key (itemid)
);

create index itemProd on item (productid);

create table inventory (
    itemid text not null,
    qty int not null,
    primary key (itemid)
);

CREATE TABLE sequence(
    name text not null,
    nextid int not null,
    primary key (name)
);
