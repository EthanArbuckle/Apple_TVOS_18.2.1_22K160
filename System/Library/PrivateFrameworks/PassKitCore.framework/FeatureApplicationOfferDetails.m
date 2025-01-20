@interface FeatureApplicationOfferDetails
+ (id)_predicateForApplicationPID:(int64_t)a3;
+ (id)_propertySettersForFeatureApplicationOfferDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureApplicationOfferDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertFeatureApplicationOfferDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationOfferDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateFeatureApplicationOfferDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
- (FeatureApplicationOfferDetails)initWithFeatureApplicationOfferDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)featureApplicationOfferDetails;
- (void)updateWithFeatureApplicationOfferDetails:(id)a3;
@end

@implementation FeatureApplicationOfferDetails

+ (id)databaseTable
{
  return @"fig";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return @"a";
}

- (FeatureApplicationOfferDetails)initWithFeatureApplicationOfferDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"a");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 offerTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v12, @"b");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 expiryDate]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v13, @"c");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 creditLimit]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v15, @"d");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 annualFee]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringValue]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v17, @"e");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 aprForPurchase]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v19, @"f");

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v20, @"g");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 balance]);
  uint64_t v22 = PKCurrencyDecimalToStorageNumber(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v23, @"h");

  v24 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  v25 = v24;

  return v25;
}

+ (id)insertFeatureApplicationOfferDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithFeatureApplicationOfferDetails:v9 forApplicationPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteFeatureApplicationOfferDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)featureApplicationOfferDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 featureApplicationOfferDetails]);
  return v9;
}

+ (void)updateFeatureApplicationOfferDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithFeatureApplicationOfferDetails:v12];
  }
  else {
    id v11 =  +[FeatureApplicationOfferDetails insertFeatureApplicationOfferDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationOfferDetails,  "insertFeatureApplicationOfferDetails:forApplicationPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithFeatureApplicationOfferDetails:(id)a3
{
  id v4 = a3;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 offerTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 expiryDate]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v6, @"c");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 creditLimit]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 annualFee]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v10, @"e");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 aprForPurchase]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v12, @"f");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyCode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v13, @"g");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 balance]);
  uint64_t v15 = PKCurrencyDecimalToStorageNumber(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v16, @"h");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v17);
}

+ (id)_predicateForApplicationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForFeatureApplicationOfferDetails
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10063D2D0;
  v4[1] = &stru_10063D2F0;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10063D310;
  v4[3] = &stru_10063D330;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10063D350;
  v4[5] = &stru_10063D370;
  v3[6] = @"h";
  v4[6] = &stru_10063D390;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

- (id)featureApplicationOfferDetails
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKFeatureApplicationOfferDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForFeatureApplicationOfferDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10005EE88;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  uint64_t v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

@end