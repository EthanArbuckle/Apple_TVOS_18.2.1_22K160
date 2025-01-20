@interface CommutePlanReminder
+ (id)_predicateForCommutePlanReminder:(id)a3 passIdentifier:(id)a4;
+ (id)_predicateForCommutePlanReminder:(id)a3 passPID:(int64_t)a4;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)commutePlanReminderInDatabase:(id)a3 forCommutePlanIdentifier:(id)a4 passIdentifier:(id)a5;
+ (id)commutePlanReminderInDatabase:(id)a3 forQuery:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAnyInDatabase:(id)a3 forPassIdentifier:(id)a4;
- (CommutePlanReminder)initWithCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
- (id)commutePlanReminder;
- (void)updateWithCommutePlanReminder:(id)a3;
@end

@implementation CommutePlanReminder

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = commute_plan_reminder.pass_pid"];
  }
}

+ (id)commutePlanReminderInDatabase:(id)a3 forCommutePlanIdentifier:(id)a4 passIdentifier:(id)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCommutePlanReminder:a4 passIdentifier:a5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 commutePlanReminderInDatabase:v8 forQuery:v10]);
  return v11;
}

+ (id)commutePlanReminderInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10028F298;
  v20 = sub_10028F2A8;
  id v21 = 0LL;
  v22 = @"time_interval";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10028F2B0;
  v12[3] = &unk_10063FD80;
  v14 = &v16;
  id v15 = a1;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[CommutePlanReminder _propertySetters](&OBJC_CLASS___CommutePlanReminder, "_propertySetters"));
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

+ (id)insertOrUpdateCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10028F298;
  v33 = sub_10028F2A8;
  id v34 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForCommutePlanReminder:passPID:", v11, objc_msgSend(v12, "persistentID")));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v13 predicate:v14]);

  v35 = @"pid";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  v25 = sub_10028F5C0;
  v26 = &unk_1006432D8;
  v28 = &v29;
  id v17 = v13;
  id v27 = v17;
  [v15 enumeratePersistentIDsAndProperties:v16 usingBlock:&v23];

  uint64_t v18 = (void *)v30[5];
  if (v18)
  {
    objc_msgSend(v18, "updateWithCommutePlanReminder:", v10, v23, v24, v25, v26);
    id v19 = (id)v30[5];
  }

  else
  {
    id v20 = objc_alloc((Class)a1);
    id v19 = objc_msgSend( v20,  "initWithCommutePlanReminder:forCommutePlanIdentifier:pass:database:",  v10,  v11,  v12,  v17,  v23,  v24,  v25,  v26);
  }

  id v21 = v19;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (CommutePlanReminder)initWithCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v15 = [v11 persistentID];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, @"pass_pid");

    -[NSMutableDictionary setObjectOrNull:forKey:]( v14,  "setObjectOrNull:forKey:",  v12,  @"commute_plan_identifier");
    [v13 timeInterval];
    double v18 = v17;

    -[NSMutableDictionary setDouble:forKey:](v14, "setDouble:forKey:", @"time_interval", v18);
    id v19 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);

    self = v19;
    id v20 = self;
  }

  else
  {
    id v20 = 0LL;
  }

  return v20;
}

+ (id)databaseTable
{
  return @"commute_plan_reminder";
}

+ (id)_predicateForCommutePlanReminder:(id)a3 passIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"commute_plan_identifier",  v6));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"commute_plan_identifier"));
    }
    id v10 = (void *)v8;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:v7]);
    v14[0] = v10;
    v14[1] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate falsePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "falsePredicate"));
  }

  return v9;
}

+ (id)_predicateForCommutePlanReminder:(id)a3 passPID:(int64_t)a4
{
  if (a3) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"commute_plan_identifier",  a3));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"commute_plan_identifier"));
  }
  id v6 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v7));

  v12[0] = v6;
  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

- (id)commutePlanReminder
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentCommutePlanReminder);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CommutePlanReminder _propertySetters](&OBJC_CLASS___CommutePlanReminder, "_propertySetters"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10028FAB0;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)updateWithCommutePlanReminder:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v4 timeInterval];
  double v6 = v5;

  [v7 setDouble:@"time_interval" forKey:v6];
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_propertySetters
{
  v3 = @"time_interval";
  id v4 = &stru_1006518E8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end