@interface AccountPaymentReminder
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountPaymentReminder;
+ (id)databaseTable;
+ (id)insertPaymentReminder:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentRemindersWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentReminderWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)paymentReminder;
@end

@implementation AccountPaymentReminder

+ (id)paymentRemindersWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002E94FC;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertPaymentReminder:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 minimumDue]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  [v10 setObjectOrNull:v13 forKey:@"b"];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyCode]);
  [v10 setObjectOrNull:v14 forKey:@"c"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentDueDate]);
  uint64_t v16 = (void *)_SQLValueForDate(v15);
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v17 forKey:@"a"];

  id v18 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v18;
}

- (id)paymentReminder
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountPaymentReminder);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountPaymentReminder _propertySettersForAccountPaymentReminder]( &OBJC_CLASS___AccountPaymentReminder,  "_propertySettersForAccountPaymentReminder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002E9794;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (void)deletePaymentReminderWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"rambutans";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAccountPaymentReminder
{
  v3[0] = @"c";
  v3[1] = @"b";
  v4[0] = &stru_1006548B0;
  v4[1] = &stru_1006548D0;
  v3[2] = @"d";
  v4[2] = &stru_1006548F0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end