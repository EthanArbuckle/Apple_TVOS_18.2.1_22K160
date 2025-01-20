@interface PaymentApplicationMerchantSupport
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)fetchSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertCountryCodes:(id)a3 supported:(BOOL)a4 withPaymentApplication:(id)a5 inDatabase:(id)a6;
+ (id)predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)predicateForSupported:(BOOL)a3;
+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplication:(id)a4;
+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)supportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)supportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)unsupportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)unsupportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (void)deleteSupportedCountryCodes:(BOOL)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)updateSupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)updateUnsupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
- (PaymentApplicationMerchantSupport)initWithMerchantCountryCode:(id)a3 supported:(BOOL)a4 forPaymentApplication:(id)a5 database:(id)a6;
@end

@implementation PaymentApplicationMerchantSupport

+ (id)databaseTable
{
  return @"payment_application_merchant_support";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentApplication, a2) == a3) {
    return @"payment_application_pid";
  }
  else {
    return 0LL;
  }
}

- (PaymentApplicationMerchantSupport)initWithMerchantCountryCode:(id)a3 supported:(BOOL)a4 forPaymentApplication:(id)a5 database:(id)a6
{
  if (a5)
  {
    BOOL v8 = a4;
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v15 = [v11 persistentID];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v16,  @"payment_application_pid");

    if (v12) {
      id v17 = v12;
    }
    else {
      id v17 = v14;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v17,  @"merchant_country_code");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, @"supported");

    v19 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v10);
    self = v19;

    v20 = self;
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

+ (id)supportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "supportedCountryCodesForPaymentApplicationPID:inDatabase:",  objc_msgSend(a3, "persistentID"),  v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)unsupportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "unsupportedCountryCodesForPaymentApplicationPID:inDatabase:",  objc_msgSend(a3, "persistentID"),  v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)supportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  return _[a1 fetchSupportedCountries:1 forPaymentApplicationPID:a3 inDatabase:a4];
}

+ (id)unsupportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  return _[a1 fetchSupportedCountries:0 forPaymentApplicationPID:a3 inDatabase:a4];
}

+ (id)fetchSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSupportedCountries:v6 forPaymentApplicationPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v9]);

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v18 = @"merchant_country_code";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D9CA8;
  v16[3] = &unk_10063C0D0;
  v13 = v11;
  id v17 = v13;
  [v10 enumeratePersistentIDsAndProperties:v12 usingBlock:v16];

  if (-[NSMutableArray count](v13, "count")) {
    id v14 = -[NSMutableArray copy](v13, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (void)deleteEntitiesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 deleteSupportedCountryCodes:1 forPaymentApplication:v7 inDatabase:v6];
  [a1 deleteSupportedCountryCodes:0 forPaymentApplication:v7 inDatabase:v6];
}

+ (void)updateSupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D9E74;
  v12[3] = &unk_10063FDF8;
  id v13 = a4;
  id v14 = a5;
  id v15 = v8;
  id v16 = a1;
  id v9 = v8;
  id v10 = v14;
  id v11 = v13;
  sub_1002CCC5C((uint64_t)v10, v12);
}

+ (void)updateUnsupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D9F84;
  v12[3] = &unk_10063FDF8;
  id v13 = a4;
  id v14 = a5;
  id v15 = v8;
  id v16 = a1;
  id v9 = v8;
  id v10 = v14;
  id v11 = v13;
  sub_1002CCC5C((uint64_t)v10, v12);
}

+ (void)deleteSupportedCountryCodes:(BOOL)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 predicateForSupportedCountries:v6 forPaymentApplication:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentApplicationMerchantSupport,  "queryWithDatabase:predicate:",  v8,  v10));

  [v9 deleteAllEntities];
}

+ (id)insertCountryCodes:(id)a3 supported:(BOOL)a4 withPaymentApplication:(id)a5 inDatabase:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 && [v10 count])
  {
    id v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v23 = v10;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        v18 = 0LL;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [objc_alloc((Class)a1) initWithMerchantCountryCode:*(void *)(*((void *)&v24 + 1) + 8 * (void)v18) supported:v8 forPaymentApplication:v11 database:v12];
          if (v19) {
            -[NSMutableArray addObject:](v13, "addObject:", v19);
          }

          v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v16);
    }

    if (-[NSMutableArray count](v13, "count")) {
      v20 = v13;
    }
    else {
      v20 = 0LL;
    }
    v21 = v20;

    id v10 = v23;
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplication:(id)a4
{
  if (a4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "predicateForSupportedCountries:forPaymentApplicationPID:",  a3,  objc_msgSend(a4, "persistentID")));
  }
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate falsePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "falsePredicate", a3));
  }
  return v4;
}

+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPaymentApplicationPID:a4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSupported:v4]);
  v11[0] = v6;
  v11[1] = v7;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

+ (id)predicateForSupported:(BOOL)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"supported",  v3));

  return v4;
}

@end