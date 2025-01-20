@interface BalanceReminder
+ (id)_predicateForBalanceIdentifier:(id)a3;
+ (id)_predicateForBalanceReminder:(id)a3 passIdentifier:(id)a4;
+ (id)_predicateForBalanceReminder:(id)a3 passPID:(int64_t)a4;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)balanceReminderInDatabase:(id)a3 forBalanceIdentifier:(id)a4 passIdentifier:(id)a5;
+ (id)balanceReminderInDatabase:(id)a3 forQuery:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAnyInDatabase:(id)a3 forPassIdentifier:(id)a4;
- (BalanceReminder)initWithBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
- (id)balanceReminder;
- (void)updateWithBalanceReminder:(id)a3;
@end

@implementation BalanceReminder

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = balance_reminder.pass_pid"];
  }
}

+ (id)balanceReminderInDatabase:(id)a3 forBalanceIdentifier:(id)a4 passIdentifier:(id)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBalanceReminder:a4 passIdentifier:a5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 balanceReminderInDatabase:v8 forQuery:v10]);
  return v11;
}

+ (id)balanceReminderInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_1000E95F0;
  v20 = sub_1000E9600;
  id v21 = 0LL;
  v22[0] = @"threshold";
  v22[1] = @"enabled";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E9608;
  v12[3] = &unk_10063FD80;
  v14 = &v16;
  id v15 = a1;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[BalanceReminder _propertySetters](&OBJC_CLASS___BalanceReminder, "_propertySetters"));
  id v13 = v9;
  [v7 enumeratePersistentIDsAndProperties:v8 usingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (void)deleteAnyInDatabase:(id)a3 forPassIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertOrUpdateBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_1000E95F0;
  v33 = sub_1000E9600;
  id v34 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForBalanceReminder:passPID:", v11, objc_msgSend(v12, "persistentID")));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v13 predicate:v14]);

  v35 = @"pid";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  v25 = sub_1000E9918;
  v26 = &unk_1006432D8;
  v28 = &v29;
  id v17 = v13;
  id v27 = v17;
  [v15 enumeratePersistentIDsAndProperties:v16 usingBlock:&v23];

  uint64_t v18 = (void *)v30[5];
  if (v18)
  {
    objc_msgSend(v18, "updateWithBalanceReminder:", v10, v23, v24, v25, v26);
    id v19 = (id)v30[5];
  }

  else
  {
    id v20 = objc_alloc((Class)a1);
    id v19 = objc_msgSend( v20,  "initWithBalanceReminder:forBalanceIdentifier:pass:database:",  v10,  v11,  v12,  v17,  v23,  v24,  v25,  v26);
  }

  id v21 = v19;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (BalanceReminder)initWithBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v16 = [v11 persistentID];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v17, @"pass_pid");

    if (v12) {
      id v18 = v12;
    }
    else {
      id v18 = v15;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v18,  @"balance_identifier");

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 threshold]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v20, @"threshold");

    id v21 = [v13 isEnabled];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v22, @"enabled");

    v23 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);
    self = v23;

    uint64_t v24 = self;
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  return v24;
}

+ (id)databaseTable
{
  return @"balance_reminder";
}

+ (id)_predicateForBalanceReminder:(id)a3 passIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_msgSend((id)objc_opt_class(a1, v7), "_predicateForBalanceIdentifier:", v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:v8]);
    v15[0] = v10;
    v15[1] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate falsePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "falsePredicate"));
  }

  return v13;
}

+ (id)_predicateForBalanceReminder:(id)a3 passPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "_predicateForBalanceIdentifier:", v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v10));

  v15[0] = v9;
  v15[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  return v13;
}

+ (id)_predicateForBalanceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKPaymentBalanceStoredValueDefaultIdentifier;
  unsigned int v5 = [v3 isEqualToString:PKPaymentBalanceStoredValueDefaultIdentifier];
  if (!v3 || v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"balance_identifier"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"balance_identifier",  v4));
    v11[0] = v7;
    v11[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v9));
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"balance_identifier",  v3));
  }

  return v6;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

- (id)balanceReminder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentBalanceReminder);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[BalanceReminder _propertySetters](&OBJC_CLASS___BalanceReminder, "_propertySetters"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_1000E9F6C;
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

- (void)updateWithBalanceReminder:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v4, "isEnabled"), @"enabled");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 threshold]);

  [v6 setObjectOrNull:v5 forKey:@"threshold"];
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v6);
}

+ (id)_propertySetters
{
  v3[0] = @"threshold";
  v3[1] = @"enabled";
  v4[0] = &stru_100643318;
  v4[1] = &stru_100643338;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end