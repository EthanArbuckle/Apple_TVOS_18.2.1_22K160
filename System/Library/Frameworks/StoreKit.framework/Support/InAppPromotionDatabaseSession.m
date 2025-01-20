@interface InAppPromotionDatabaseSession
- (InAppPromotionDatabaseSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5;
@end

@implementation InAppPromotionDatabaseSession

- (InAppPromotionDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___InAppPromotionDatabaseSession;
  v6 = -[InAppPromotionDatabaseSession init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  a4,  1LL));
  if ([v7 count])
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"product_id",  v9));

    v24[0] = v8;
    v24[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

    v8 = (void *)v12;
  }

  v23[0] = @"product_id";
  v23[1] = @"promo_order";
  v23[2] = @"visibility";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](self, "connection"));
  v22 = @"promo_order";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:orderingProperties:]( &OBJC_CLASS___InAppPromotionDatabaseEntity,  "queryOnConnection:predicate:orderingProperties:",  v15,  v8,  v16));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100006358;
  v20[3] = &unk_1002E6970;
  id v18 = v14;
  id v21 = v18;
  [v17 enumeratePersistentIDsAndProperties:v13 usingBlock:v20];

  return v18;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end