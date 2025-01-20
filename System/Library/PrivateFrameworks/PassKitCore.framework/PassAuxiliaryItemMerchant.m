@interface PassAuxiliaryItemMerchant
+ (id)_predicateForAuxiliaryItemIdentifier:(id)a3;
+ (id)_predicateForMapsBrandPersistentID:(int64_t)a3;
+ (id)_predicateForMapsMerchantPersistentID:(int64_t)a3;
+ (id)_predicateForPassPersistentID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7;
+ (id)itemIdentifiersForPassPersisentID:(int64_t)a3 inDatabase:(id)a4;
+ (id)merchantForPassAuxiliaryItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAllPassAuxiliaryItemMerchantsForPassPersisentID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5;
- (id)initPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7;
@end

@implementation PassAuxiliaryItemMerchant

+ (id)databaseTable
{
  return @"cardiff";
}

+ (id)insertPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initPassAuxiliaryItemMerchantForItemIdentifier:v13 passPersistentID:a4 mapsBrandPersistentID:a5 mapsMerchantPersistentID:a6 inDatabase:v12];

  return v14;
}

- (id)initPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_1002D7478;
  v31 = sub_1002D7488;
  id v32 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002D7490;
  v19[3] = &unk_100653EA8;
  id v14 = v12;
  int64_t v24 = a4;
  int64_t v25 = a5;
  int64_t v26 = a6;
  id v20 = v14;
  v23 = &v27;
  v15 = self;
  v21 = v15;
  id v16 = v13;
  id v22 = v16;
  sub_1002CCC5C((uint64_t)v16, v19);
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

+ (void)deletePassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAuxiliaryItemIdentifier:a3]);
  v22[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPersistentID:a4]);
  v22[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v12]);
  v21[0] = @"c";
  v21[1] = @"d";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1002D76E4;
  v19 = &unk_10063C0D0;
  id v20 = v8;
  id v15 = v8;
  [v13 enumeratePersistentIDsAndProperties:v14 usingBlock:&v16];

  objc_msgSend(v13, "deleteAllEntities", v16, v17, v18, v19);
}

+ (void)deleteAllPassAuxiliaryItemMerchantsForPassPersisentID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPersistentID:a3]);
  id v16 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  v15[0] = @"c";
  v15[1] = @"d";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002D78EC;
  v13[3] = &unk_10063C0D0;
  id v14 = v6;
  id v12 = v6;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v13];

  [v10 deleteAllEntities];
}

+ (id)merchantForPassAuxiliaryItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  int64_t v25 = sub_1002D7478;
  int64_t v26 = sub_1002D7488;
  id v27 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAuxiliaryItemIdentifier:v8]);
  v29[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPersistentID:a4]);
  v29[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v13]);
  v28[0] = @"c";
  v28[1] = @"d";
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002D7B94;
  v19[3] = &unk_100653ED0;
  id v16 = v9;
  id v20 = v16;
  v21 = &v22;
  [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:v19];

  id v17 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v17;
}

+ (id)itemIdentifiersForPassPersisentID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1002D7478;
  v19 = sub_1002D7488;
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPersistentID:a3]);
  uint64_t v22 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  v21 = @"b";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002D7E74;
  v14[3] = &unk_10063E828;
  v14[4] = &v15;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];

  id v12 = [(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v12;
}

+ (id)_predicateForAuxiliaryItemIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForPassPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForMapsBrandPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v3));

  return v4;
}

+ (id)_predicateForMapsMerchantPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v3));

  return v4;
}

@end