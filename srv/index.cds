using from './catalog-service';
using from './stats-service';

annotate StatsService.OrderInfo with @(
    UI: {
        Identification: [ { Value: ID } ],
        SelectionFields: [ ID ],
        LineItem: [
            {Value: ID},
            {Value: phone_ID},
            {Value: phone.title},
            {Value: amount}
        ],
        HeaderInfo: {
            TypeName: '{i18n>Order}',
            TypeNamePlural: '{i18n>Orders}',
            Title: {Value: ID},
            Description: {Value: phone.title}
        }
    }
);


annotate CatalogService.Phones with @(
    UI: {
        Identification: [ {Value: title} ],
        SelectionFields: [ title ],
        LineItem: [
            {Value: ID},
            {Value: title},
            {Value: producer.name},
            {Value: producer_ID},
            {Value: stock},
            {Value: price}
        ],
        HeaderInfo: {
            TypeName: '{i18n>Phone}',
            TypeNamePlural: '{i18n>Phones}',
            Title: {Value: title},
            Description: {Value: producer.name}
        }
    }
);

annotate CatalogService.Phones with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    title @title:'{i18n>Title}';
    producer @title:'{i18n>ProducerID}';
    stock @title:'{i18n>Stock}';
    price @title:'{i18n>Price}';
}

annotate CatalogService.Producers with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    name @title:'{i18n>ProducerName}';
}