@interface TVHMediaCategoriesDataSource
- (NSArray)indexTitles;
- (NSOrderedSet)mediaCategoryTypes;
- (NSOrderedSet)sectionIdentifiers;
- (NSString)description;
- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate;
- (TVHMediaCategoriesDataSource)init;
- (id)_mediaCategoryTypeAtIndexPath:(id)a3;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)mediaCategoryTypeForItemIdentifier:(id)a3;
- (id)mediaCategoryTypeStringAtIndexPath:(id)a3;
- (id)mediaCategoryTypeStringForItemIdentifier:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (void)setDiffableDataSourceContentProviderDelegate:(id)a3;
- (void)setMediaCategoryTypes:(id)a3;
@end

@implementation TVHMediaCategoriesDataSource

- (TVHMediaCategoriesDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHMediaCategoriesDataSource;
  v2 = -[TVHMediaCategoriesDataSource init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet"));
    mediaCategoryTypes = v2->_mediaCategoryTypes;
    v2->_mediaCategoryTypes = (NSOrderedSet *)v3;
  }

  return v2;
}

- (void)setMediaCategoryTypes:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaCategoryTypes");
    id v4 = 0LL;
  }

  if ((-[NSOrderedSet isEqual:](self->_mediaCategoryTypes, "isEqual:", v4) & 1) == 0)
  {
    v5 = (NSOrderedSet *)[v8 copy];
    mediaCategoryTypes = self->_mediaCategoryTypes;
    self->_mediaCategoryTypes = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaCategoriesDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
    [v7 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:1 itemIdentifiersOfAmendedItems:0];
  }
}

- (id)mediaCategoryTypeForItemIdentifier:(id)a3
{
  return a3;
}

- (id)mediaCategoryTypeStringForItemIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHMediaCategoryToDisplayNameValueTransformer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v3]);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)mediaCategoryTypeStringAtIndexPath:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaCategoriesDataSource _mediaCategoryTypeAtIndexPath:]( self,  "_mediaCategoryTypeAtIndexPath:",  a3));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHMediaCategoryToDisplayNameValueTransformer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v3]);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (NSOrderedSet)sectionIdentifiers
{
  return +[NSOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithObject:",  @"MediaCategoryTypesSection");
}

- (id)sectionTitleAIndex:(unint64_t)a3
{
  return 0LL;
}

- (NSArray)indexTitles
{
  return 0LL;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0LL;
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaCategoriesDataSource mediaCategoryTypes](self, "mediaCategoryTypes"));
  id v5 = [v3 appendObject:v4 withName:@"mediaCategoryTypes"];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHMediaCategoryToDisplayNameValueTransformer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaCategoriesDataSource mediaCategoryTypes](self, "mediaCategoryTypes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 array]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100088E3C;
  v14[3] = &unk_1000FF850;
  id v15 = v6;
  id v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", v14));

  id v11 = [v3 appendObject:v10 withName:@"MediaCategoryTypeStrings"];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v12;
}

- (id)_mediaCategoryTypeAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = [v4 item];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaCategoriesDataSource mediaCategoryTypes](self, "mediaCategoryTypes"));
    if (v6 >= [v7 count]) {
      id v5 = 0LL;
    }
    else {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v6]);
    }
  }

  return v5;
}

- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate
{
  return (TVHDiffableDataSourceContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_diffableDataSourceContentProviderDelegate);
}

- (void)setDiffableDataSourceContentProviderDelegate:(id)a3
{
}

- (NSOrderedSet)mediaCategoryTypes
{
  return self->_mediaCategoryTypes;
}

- (void).cxx_destruct
{
}

@end