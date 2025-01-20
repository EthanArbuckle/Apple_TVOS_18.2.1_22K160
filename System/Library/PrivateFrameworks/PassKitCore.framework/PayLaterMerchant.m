@interface PayLaterMerchant
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_predicateForNoMapsMatch;
+ (id)_predicateForRequiresMerchantReprocessing:(BOOL)a3;
+ (id)_predicateForTransactionDate:(id)a3 withinWindow:(double)a4;
+ (id)_propertySettersForPayLaterMerchant;
+ (id)_propertyValuesForPayLaterMerchant:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterFinancingPlansRequiringMerchantCleanupInDatabase:(id)a3 transactionDateWithinWindow:(double)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterMerchantForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterMerchant)initWithPayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)payLaterMerchant;
- (void)udpdateProcessedPayLaterMerchant:(id)a3;
- (void)updateWithPayLaterMerchant:(id)a3;
@end

@implementation PayLaterMerchant

+ (id)databaseTable
{
  return @"boysenberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlan, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"marionberry.m"
    || v7 && (unsigned int v8 = [@"marionberry.m" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN huckleberry ON huckleberry.pid = boysenberry.a"];
    [v6 addObject:@"JOIN marionberry ON marionberry.a = huckleberry.pid"];
  }
}

- (PayLaterMerchant)initWithPayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterMerchant:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterMerchant:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1002D5C54;
  v25 = sub_1002D5C64;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v26 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002D5C6C;
  v15[3] = &unk_100645878;
  v18 = &v21;
  id v11 = v8;
  id v16 = v11;
  id v19 = a1;
  int64_t v20 = a4;
  id v12 = v9;
  id v17 = v12;
  sub_1002CCC5C((uint64_t)v12, v15);
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)udpdateProcessedPayLaterMerchant:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002D5E7C;
  v7[3] = &unk_1006455C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1002CCC5C((uint64_t)v5, v7);
}

- (void)updateWithPayLaterMerchant:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterMerchant:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)payLaterFinancingPlansRequiringMerchantCleanupInDatabase:(id)a3 transactionDateWithinWindow:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRequiresMerchantReprocessing:1]);
  -[NSMutableArray addObject:](v7, "addObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNoMapsMatch]);
  -[NSMutableArray addObject:](v7, "addObject:", v9);

  if (a4 > 0.0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionDate:v10 withinWindow:a4]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"x"));
    v30[0] = v11;
    v30[1] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v13));
    -[NSMutableArray addObject:](v7, "addObject:", v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v15]);
  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v29 = @"a";
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  v25 = sub_1002D630C;
  id v26 = &unk_100653B40;
  id v27 = v6;
  id v19 = v17;
  v28 = v19;
  id v20 = v6;
  [v16 enumerateProperties:v18 usingBlock:&v23];

  if (-[NSMutableArray count](v19, "count", v23, v24, v25, v26)) {
    id v21 = -[NSMutableArray copy](v19, "copy");
  }
  else {
    id v21 = 0LL;
  }

  return v21;
}

+ (id)_predicateForTransactionDate:(id)a3 withinWindow:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:-a4]);

  id v9 = (void *)_SQLValueForDate(v7);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"marionberry.m",  v9));
  -[NSMutableArray addObject:](v6, "addObject:", v10);

  id v11 = (void *)_SQLValueForDate(v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"marionberry.m",  v11));
  -[NSMutableArray addObject:](v6, "addObject:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));
  return v13;
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deletePayLaterMerchantForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PayLaterMerchant;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

- (id)payLaterMerchant
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterMerchant);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterMerchant");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002D66C8;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForRequiresMerchantReprocessing:(BOOL)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"w",  v3));

  return v4;
}

+ (id)_predicateForNoMapsMatch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"u"));
  v7[0] = v2;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"v"));
  v7[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v4));

  return v5;
}

+ (id)_propertyValuesForPayLaterMerchant:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 merchantIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 merchantCategoryCode],  @"c");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 merchantCategory], @"d");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 fallbackCategory], @"p");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 rawName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"e");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 rawCANL]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"f");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 rawCity]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"g");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 rawState]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"h");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 rawCountry]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"i");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"j");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 city]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"k");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 state]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"l");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 zipcode]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"m");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 country]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"n");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 authNetworkData]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"s");

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 clearingNetworkData]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"t");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 industryCode], @"r");
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 industryCategory]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"q");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 cleanConfidence], @"o");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 adamIdentifier], @"y");
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 webMerchantName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"z");

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 webMerchantIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"aa");

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 originURL]);
  v22 = (void *)_SQLValueForURL(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"bb");

  id v23 = -[NSMutableDictionary copy](v4, "copy");
  return v23;
}

+ (id)_propertySettersForPayLaterMerchant
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100653B80;
  v4[1] = &stru_100653BA0;
  v3[2] = @"d";
  v3[3] = @"p";
  v4[2] = &stru_100653BC0;
  v4[3] = &stru_100653BE0;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_100653C00;
  v4[5] = &stru_100653C20;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_100653C40;
  v4[7] = &stru_100653C60;
  v3[8] = @"i";
  v3[9] = @"j";
  v4[8] = &stru_100653C80;
  v4[9] = &stru_100653CA0;
  v3[10] = @"k";
  v3[11] = @"l";
  v4[10] = &stru_100653CC0;
  v4[11] = &stru_100653CE0;
  v3[12] = @"m";
  v3[13] = @"n";
  v4[12] = &stru_100653D00;
  v4[13] = &stru_100653D20;
  v3[14] = @"s";
  v3[15] = @"t";
  v4[14] = &stru_100653D40;
  v4[15] = &stru_100653D60;
  v3[16] = @"q";
  v3[17] = @"r";
  v4[16] = &stru_100653D80;
  v4[17] = &stru_100653DA0;
  v3[18] = @"w";
  v3[19] = @"x";
  v4[18] = &stru_100653DC0;
  v4[19] = &stru_100653DE0;
  v3[20] = @"o";
  v3[21] = @"y";
  v4[20] = &stru_100653E00;
  v4[21] = &stru_100653E20;
  v3[22] = @"z";
  v3[23] = @"aa";
  v4[22] = &stru_100653E40;
  v4[23] = &stru_100653E60;
  v3[24] = @"bb";
  v4[24] = &stru_100653E80;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  25LL));
}

@end