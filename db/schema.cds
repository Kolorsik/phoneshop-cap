namespace my.phoneshop;

using { cuid, managed } from '@sap/cds/common';

entity Phones {
    key ID : Integer;
    title : String;
    producer : Association to Producers;
    price : Decimal(9, 2);
    stock : Integer;
}

entity Producers {
    key ID : Integer;
    name : String;
    phones : Association to many Phones on phones.producer = $self;
}

entity Orders : cuid, managed {
    phone : Association to Phones;
    amount : Integer;
}