using CatalogService from '../../srv/cat-service';

annotate CatalogService.Books with @(UI : {
    HeaderInfo          : {
        TypeName       : 'Book',
        TypeNamePlural : 'Books',
    },
    LineItem            : [
        {
            Value : title,
            Label : 'Title'
        },
        {Value : author, },
        {
            Value : descr,
            Label : 'Description'
        },
        {Value : genre, },
        {
            Value : id,
            ![@UI.Hidden]
        }
    ],
    SelectionFields     : [
        author,
        genre
    ],
    PresentationVariant : {
        Text           : 'Default',
        SortOrder      : [{Property : title}],
        Visualizations : ['@UI.LineItem']
    },
});
