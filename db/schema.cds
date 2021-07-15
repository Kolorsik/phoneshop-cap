namespace my.phoneshop;

using { cuid, managed } from '@sap/cds/common';

entity Phones {
    key ID : Integer;
    title : String;
    producer : Association to Producers;
    price : Decimal(9, 2);
    stock : Integer;
    imageUrl : String @Core.IsURL;
}

entity Watches {
    key ID : Integer;
    title : String;
    producer : Association to Producers;
    price : Decimal(9, 2);
    stock : Integer;
    type : String enum { Mechanical; Electronic; SmartWatch; }
}

entity Producers {
    key ID : Integer;
    name : String;
    phones : Association to many Phones on phones.producer = $self;
}

entity Orders : cuid, managed {
    //items : Composition of many OrderItem on items.parent = $self;
    phone : Association to Phones;
    amount : Integer;
}

/*
entity OrderItem {
    parent :  Association to Orders;
    phone : Association to Phones;
    amount : Integer; 
}
*/