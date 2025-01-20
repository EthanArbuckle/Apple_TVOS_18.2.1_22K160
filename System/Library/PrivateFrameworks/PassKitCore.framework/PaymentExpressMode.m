@interface PaymentExpressMode
+ (id)_expressModesInDatabase:(id)a3 forPredicate:(id)a4;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)expressModesInDatabase:(id)a3 forPaymentApplication:(id)a4;
+ (id)expressModesInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)insertExpressModes:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (PaymentExpressMode)initWithExpressMode:(id)a3 forPaymentApplication:(id)a4 database:(id)a5;
- (id)expressMode;
@end

@implementation PaymentExpressMode

+ (id)databaseTable
{
  return @"payment_express_mode";
}

+ (id)expressModesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplication:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _expressModesInDatabase:v6 forPredicate:v7]);

  return v8;
}

+ (id)expressModesInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _expressModesInDatabase:v6 forPredicate:v7]);

  return v8;
}

+ (id)_expressModesInDatabase:(id)a3 forPredicate:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:a4]);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v13 = @"express_mode";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022EFE0;
  v11[3] = &unk_10063C0D0;
  v12 = v5;
  v7 = v5;
  [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v11];

  if (-[NSMutableSet count](v7, "count")) {
    v8 = v7;
  }
  else {
    v8 = 0LL;
  }
  v9 = v8;

  return v9;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplication:a4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertExpressModes:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v16);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithExpressMode:forPaymentApplication:database:", v17, v9, v10, (void)v23);
        if (v19) {
          -[NSMutableArray addObject:](v11, "addObject:", v19);
        }

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v14);
  }

  if (-[NSMutableArray count](v11, "count")) {
    v20 = v11;
  }
  else {
    v20 = 0LL;
  }
  v21 = v20;

  return v21;
}

+ (id)_predicateForPaymentApplication:(id)a3
{
  if (a3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPaymentApplicationPID:", objc_msgSend(a3, "persistentID")));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate falsePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "falsePredicate"));
  }
  return v3;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

- (PaymentExpressMode)initWithExpressMode:(id)a3 forPaymentApplication:(id)a4 database:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v13 = [v9 persistentID];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v13));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v14,  @"payment_application_pid");

    if (v10) {
      id v15 = v10;
    }
    else {
      id v15 = v12;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, @"express_mode");

    v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
    self = v16;

    uint64_t v17 = self;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return v17;
}

- (id)expressMode
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10022F4FC;
  v11 = sub_10022F50C;
  id v12 = 0LL;
  id v13 = @"express_mode";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10022F514;
  v6[3] = &unk_10064DD98;
  v6[4] = &v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end