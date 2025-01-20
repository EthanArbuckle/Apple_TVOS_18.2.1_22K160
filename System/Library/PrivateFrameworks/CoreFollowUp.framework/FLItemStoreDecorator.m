@interface FLItemStoreDecorator
- (FLItemStoreDecorator)initWithClientIdentifier:(id)a3;
- (id)_itemsMatchingPredicate:(id)a3 identifiers:(id)a4;
- (id)followUpItems;
- (id)itemsMatchingIdentifier:(id)a3;
- (id)itemsMatchingIdentifiers:(id)a3;
- (id)itemsMatchingPredicate:(id)a3;
@end

@implementation FLItemStoreDecorator

- (FLItemStoreDecorator)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FLItemStoreDecorator;
  v5 = -[FLItemStoreDecorator init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = v6;
  }

  return v5;
}

- (id)followUpItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator itemsMatchingPredicate:](self, "itemsMatchingPredicate:", v3));

  return v4;
}

- (id)itemsMatchingPredicate:(id)a3
{
  return -[FLItemStoreDecorator _itemsMatchingPredicate:identifiers:]( self,  "_itemsMatchingPredicate:identifiers:",  a3,  0LL);
}

- (id)itemsMatchingIdentifier:(id)a3
{
  if (!a3) {
    return &__NSArray0__struct;
  }
  id v8 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator itemsMatchingIdentifiers:](self, "itemsMatchingIdentifiers:", v5, v8));
  return v6;
}

- (id)itemsMatchingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[FLItemStoreDecorator _itemsMatchingPredicate:identifiers:]( self,  "_itemsMatchingPredicate:identifiers:",  v5,  v4));

  return v6;
}

- (id)_itemsMatchingPredicate:(id)a3 identifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 safeSelectFollowUpItemsWithUniqueIdentifiers:v6]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005048;
  v13[3] = &unk_100018670;
  v13[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fl_map:", v13));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 filteredArrayUsingPredicate:v7]);
  return v11;
}

- (void).cxx_destruct
{
}

@end