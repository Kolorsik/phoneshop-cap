using my.phoneshop as my from '../db/schema';

service StatsService {
    entity OrderInfo as projection on my.Orders excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy,
    };
    @readonly entity Phones as projection on my.Phones;
    @readonly entity Producers as projection on my.Producers;
}