@interface AccountServicingEvent
+ (BOOL)hasServicingEventsWithStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountServicing;
+ (id)databaseTable;
+ (id)insertServicingEvent:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)servicingEventsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteServicingEventWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)amount;
- (id)currencyAmountWithIntegerValue:(int64_t)a3;
- (id)partiallyApprovedAmount;
- (id)servicingEvent;
@end

@implementation AccountServicingEvent

+ (id)servicingEventsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002507A8;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (BOOL)hasServicingEventsWithStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"g",  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  LOBYTE(a1) = [v9 exists];

  return (char)a1;
}

+ (id)insertServicingEvent:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v10 setObjectOrNull:v11 forKey:@"b"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 amount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  [v10 setObjectOrNull:v15 forKey:@"c"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 amount]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currency]);
  [v10 setObjectOrNull:v17 forKey:@"d"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "status"), @"g");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "activityType"), @"e");
  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 activityIdentifier]);
  [v10 setObjectOrNull:v18 forKey:@"f"];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 reasonCode]);
  [v10 setObjectOrNull:v19 forKey:@"h"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 openDate]);
  v21 = (void *)_SQLValueForDate(v20);
  [v10 setObjectOrNull:v21 forKey:@"i"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdatedDate]);
  v23 = (void *)_SQLValueForDate(v22);
  [v10 setObjectOrNull:v23 forKey:@"j"];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v24 forKey:@"a"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 claimIdentifier]);
  [v10 setObjectOrNull:v25 forKey:@"k"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v9 linkedCaseIdentifiers]);
  id v27 = _SQLValueForStringArray(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v10 setObjectOrNull:v28 forKey:@"l"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 statusDetails]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 statusReasons]);
  id v31 = _SQLValueForStringArray(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v10 setObjectOrNull:v32 forKey:@"m"];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v29 customerResponseByDate]);
  v34 = (void *)_SQLValueForDate(v33);
  [v10 setObjectOrNull:v34 forKey:@"n"];

  v35 = (void *)objc_claimAutoreleasedReturnValue([v29 merchantResponseByDate]);
  v36 = (void *)_SQLValueForDate(v35);
  [v10 setObjectOrNull:v36 forKey:@"o"];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v29 evidenceDocumentTypes]);
  id v38 = _SQLValueForStringArray(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  [v10 setObjectOrNull:v39 forKey:@"p"];

  v40 = (void *)objc_claimAutoreleasedReturnValue([v29 resolutionReason]);
  [v10 setObjectOrNull:v40 forKey:@"q"];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v29 partiallyApprovedAmount]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 amount]);
  uint64_t v43 = PKCurrencyDecimalToStorageInteger(v42);

  [v10 setLongLong:v43 forKey:@"r"];
  v44 = (void *)objc_claimAutoreleasedReturnValue([v29 resolutionDate]);
  v45 = (void *)_SQLValueForDate(v44);
  [v10 setObjectOrNull:v45 forKey:@"s"];

  id v46 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v46;
}

- (id)servicingEvent
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountServicingEvent);
  id v4 = objc_alloc_init(&OBJC_CLASS___PKAccountServicingEventStatusDetails);
  -[PKAccountServicingEvent setStatusDetails:](v3, "setStatusDetails:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AccountServicingEvent _propertySettersForAccountServicing]( &OBJC_CLASS___AccountServicingEvent,  "_propertySettersForAccountServicing"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100250E00;
  v11[3] = &unk_100638EF0;
  id v12 = v5;
  v7 = v3;
  id v13 = v7;
  uint64_t v14 = self;
  id v8 = v5;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v6, v11);

  id v9 = v7;
  return v9;
}

- (id)currencyAmountWithIntegerValue:(int64_t)a3
{
  uint64_t v4 = PKCurrencyStorageIntegerToCurrencyDecimal(a3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"));
    unsigned __int8 v8 = [v5 isEqualToNumber:v7];

    id v9 = 0LL;
    if ((v8 & 1) == 0 && v6) {
      id v9 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  v5,  v6,  0LL);
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)amount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[AccountServicingEvent currencyAmountWithIntegerValue:]( self,  "currencyAmountWithIntegerValue:",  [v3 longLongValue]));

  return v4;
}

- (id)partiallyApprovedAmount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"r"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[AccountServicingEvent currencyAmountWithIntegerValue:]( self,  "currencyAmountWithIntegerValue:",  [v3 longLongValue]));

  return v4;
}

+ (void)deleteServicingEventWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"tomatoes";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAccountServicing
{
  v3[0] = @"b";
  v3[1] = @"g";
  v4[0] = &stru_10064F548;
  v4[1] = &stru_10064F568;
  v3[2] = @"e";
  v3[3] = @"f";
  v4[2] = &stru_10064F588;
  v4[3] = &stru_10064F5A8;
  v3[4] = @"h";
  v3[5] = @"i";
  v4[4] = &stru_10064F5C8;
  v4[5] = &stru_10064F5E8;
  v3[6] = @"j";
  v3[7] = @"k";
  v4[6] = &stru_10064F608;
  v4[7] = &stru_10064F628;
  v3[8] = @"l";
  v3[9] = @"m";
  v4[8] = &stru_10064F648;
  v4[9] = &stru_10064F668;
  v3[10] = @"n";
  v3[11] = @"o";
  v4[10] = &stru_10064F688;
  v4[11] = &stru_10064F6A8;
  v3[12] = @"p";
  v3[13] = @"q";
  v4[12] = &stru_10064F6C8;
  v4[13] = &stru_10064F6E8;
  v3[14] = @"s";
  v4[14] = &stru_10064F708;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  15LL));
}

@end