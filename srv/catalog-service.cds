using my.phoneshop as my from '../db/schema';

service CatalogService {
    @Capabilities : { Insertable: true, Updatable: true, Deletable: true, Readable: true }
    entity Phones as projection on my.Phones;
    entity Producers as projection on my.Producers;
    entity Orders as projection on my.Orders;
    entity Watches as projection on my.Watches;
}