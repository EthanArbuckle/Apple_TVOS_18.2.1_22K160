@interface PaymentRewardsRedemption
+ (BOOL)rewardsRedemptionExistForPaymentHash:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForOlderThanDate:(id)a3;
+ (id)_predicateForPaymentHash:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_predicateForStatus:(unint64_t)a3;
+ (id)_propertySettersForRewardsRedemption;
+ (id)databaseTable;
+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPass:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)rewardsRedemptionWithPaymentHash:(id)a3 inDatabase:(id)a4;
+ (id)rewardsRedemptionsForPass:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 inDatabase:(id)a5;
+ (void)deleteFailedRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsRedemptionsForPass:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsRedemptionsForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4;
+ (void)pruneRewardsRedemptionsInDatabase:(id)a3;
+ (void)pruneRewardsRedemptionsUsingReferenceDate:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentRewardsRedemption)initWithPaymentRewardsRedemption:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5;
- (id)paymentRewardsRedemption;
@end

@implementation PaymentRewardsRedemption

+ (id)databaseTable
{
  return @"dark_chocolate";
}

+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v9, a4));
  if (v10) {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 insertOrUpdateRewardsRedemption:v8 withPass:v10 inDatabase:v9]);
  }
  else {
    v11 = 0LL;
  }

  return v11;
}

+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentHash]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 rewardsRedemptionWithPaymentHash:v11 inDatabase:v10]);
    v13 = v12;
    if (v12
      && [v12 hasOriginalTransactionDetails]
      && ([v8 hasOriginalTransactionDetails] & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 details]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 originalTransaction]);
      [v8 setOriginalTransactionDetails:v15];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 createdAt]);
    if (v16) {
      [v8 setCreatedAt:v16];
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentHash:v11]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v17]);

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1001BDAB0;
    v31[3] = &unk_10063BE98;
    id v19 = v10;
    id v32 = v19;
    [v18 enumeratePersistentIDsUsingBlock:v31];
    [v18 deleteAllEntities];
    id v20 = [objc_alloc((Class)a1) initWithPaymentRewardsRedemption:v8 paymentPass:v9 inDatabase:v19];
    v21 = v20;
    if (v20)
    {
      id v22 = v9;
      id v23 = [v20 persistentID];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1001BDAC8;
      v27[3] = &unk_100647810;
      id v28 = v8;
      id v30 = v23;
      id v9 = v22;
      id v29 = v19;
      sub_1002CCC5C((uint64_t)v29, v27);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Can't store PaymentRewardsRedemption without paymentHash",  buf,  2u);
    }

    v21 = 0LL;
  }

  return v21;
}

+ (BOOL)rewardsRedemptionExistForPaymentHash:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentHash:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [v8 exists];
  return (char)v7;
}

+ (id)rewardsRedemptionWithPaymentHash:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentHash:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentRewardsRedemption]);
  return v9;
}

+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v10, v8));
    if (v11)
    {
      id v12 = [v9 mutableCopy];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", &stru_10064A8D8));
      [v12 unionSet:v13];

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", &stru_10064A8F8));
      [v12 unionSet:v14];

      v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:v11]);
      v27[0] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"f",  v12));
      v27[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v18]);
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1001BDE84;
      v24[3] = &unk_10063BCB0;
      id v25 = v10;
      v26 = v20;
      v21 = v20;
      [v19 enumeratePersistentIDsUsingBlock:v24];
      id v22 = -[NSMutableArray copy](v21, "copy");
    }

    else
    {
      id v22 = &__NSArray0__struct;
    }
  }

  else
  {
    id v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)rewardsRedemptionsForPass:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [a1 pruneRewardsRedemptionsInDatabase:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:v9]);

  v25[0] = @"h";
  v25[1] = @"g";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  v24 = @"DESC";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v10 orderingProperties:v11 orderingDirections:v12 limit:a4]);

  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_1001BE094;
  v21 = &unk_10063BCB0;
  id v22 = v8;
  id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v14 = v23;
  id v15 = v8;
  [v13 enumeratePersistentIDsUsingBlock:&v18];
  id v16 = -[NSMutableArray copy](v14, "copy", v18, v19, v20, v21);

  return v16;
}

+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v8, a3));
  if (v9) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 rewardsRedemptionsForPass:v9 limit:a4 inDatabase:v8]);
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (void)pruneRewardsRedemptionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [a1 pruneRewardsRedemptionsUsingReferenceDate:v5 inDatabase:v4];
}

+ (void)pruneRewardsRedemptionsUsingReferenceDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v8 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v8, "setDay:", -1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingComponents:v8 toDate:v7 options:0]);
  [a1 deleteFailedRewardsRedemptionsOlderThan:v9 inDatabase:v6];
  id v10 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setMonth:](v10, "setMonth:", -1LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingComponents:v10 toDate:v7 options:0]);

  [a1 deleteRewardsRedemptionsOlderThan:v11 inDatabase:v6];
}

+ (void)deleteRewardsRedemptionsForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteRewardsRedemptionsForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:"));
  if (v5) {
    [a1 deleteRewardsRedemptionsForPass:v5 inDatabase:v6];
  }
}

+ (void)deleteFailedRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:4]);
  v17[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:5]);
  v17[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:0]);
  v17[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v10));
  v18[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForOlderThanDate:v6]);

  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v16 predicate:v14]);
  [v15 deleteAllEntities];
}

+ (void)deleteRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForOlderThanDate:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentRewardsRedemptionDetails deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:inDatabase:]( &OBJC_CLASS___PaymentRewardsRedemptionDetails,  "deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PaymentRewardsRedemption;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

- (id)paymentRewardsRedemption
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentRewardsRedemption);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForRewardsRedemption");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001BE790;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v6;
  id v8 = v3;
  v17 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v15);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentRewardsRedemptionDetails paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:inDatabase:]( &OBJC_CLASS___PaymentRewardsRedemptionDetails,  "paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:inDatabase:",  v10,  v11));

  -[PKPaymentRewardsRedemption setDetails:](v8, "setDetails:", v12);
  v13 = v8;

  return v13;
}

+ (id)_predicateForPaymentPass:(id)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPaymentHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:collatingStrategy:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:collatingStrategy:",  @"f",  a3,  1LL,  1LL);
}

+ (id)_predicateForStatus:(unint64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v3));

  return v4;
}

+ (id)_predicateForOlderThanDate:(id)a3
{
  int64_t v3 = (void *)_SQLValueForDate(a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"g",  v3));

  return v4;
}

+ (id)_propertySettersForRewardsRedemption
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064A938;
  v4[1] = &stru_10064A958;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10064A978;
  v4[3] = &stru_10064A998;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10064A9B8;
  v4[5] = &stru_10064A9D8;
  v3[6] = @"h";
  v4[6] = &stru_10064A9F8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

- (PaymentRewardsRedemption)initWithPaymentRewardsRedemption:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"pass_pid");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"b");

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 balanceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"c");

  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", [v10 status], @"d");
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 statusLink]);
  v17 = (void *)_SQLValueForURL(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v17, @"e");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v18, @"f");

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 updatedAt]);
  id v20 = (void *)_SQLValueForDate(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v20, @"g");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 createdAt]);
  id v22 = (void *)_SQLValueForDate(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v22, @"h");

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PaymentRewardsRedemption;
  id v23 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v25, "initWithPropertyValues:inDatabase:", v11, v8);

  return v23;
}

@end