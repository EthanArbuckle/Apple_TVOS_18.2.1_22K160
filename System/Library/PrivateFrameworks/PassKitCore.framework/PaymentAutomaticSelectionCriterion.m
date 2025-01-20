@interface PaymentAutomaticSelectionCriterion
+ (id)_criteriaInDatabase:(id)a3 forPredicate:(id)a4;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySettersForCriterion;
+ (id)criteriaInDatabase:(id)a3 forPaymentApplication:(id)a4;
+ (id)criteriaInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertCriteria:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentAutomaticSelectionCriterion)initWithCriterion:(id)a3 forPaymentApplication:(id)a4 database:(id)a5;
@end

@implementation PaymentAutomaticSelectionCriterion

+ (id)databaseTable
{
  return @"payment_automatic_selection_criterion";
}

+ (id)criteriaInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplication:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _criteriaInDatabase:v6 forPredicate:v7]);

  return v8;
}

+ (id)criteriaInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _criteriaInDatabase:v6 forPredicate:v7]);

  return v8;
}

+ (id)_criteriaInDatabase:(id)a3 forPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForCriterion]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_1003A4F0C;
  v20 = &unk_100638F18;
  id v24 = a1;
  id v21 = v9;
  id v22 = v6;
  v12 = v8;
  v23 = v12;
  id v13 = v6;
  id v14 = v9;
  [v11 enumeratePersistentIDsAndProperties:v10 usingBlock:&v17];
  if (-[NSMutableSet count](v12, "count", v17, v18, v19, v20)) {
    id v15 = -[NSMutableSet copy](v12, "copy");
  }
  else {
    id v15 = 0LL;
  }

  return v15;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplication:a4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertCriteria:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1003A5214;
    v16[3] = &unk_100640EE0;
    id v17 = v8;
    id v21 = a1;
    id v18 = v9;
    id v19 = v10;
    v20 = v11;
    v12 = v11;
    sub_1002CCC5C((uint64_t)v19, v16);
    if (-[NSMutableArray count](v12, "count")) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }
    id v14 = v13;
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (PaymentAutomaticSelectionCriterion)initWithCriterion:(id)a3 forPaymentApplication:(id)a4 database:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v13 = [v9 persistentID];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v13));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v14,  @"payment_application_pid");

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 type]);
    v16 = (void *)v15;
    if (v15) {
      id v17 = (void *)v15;
    }
    else {
      id v17 = v12;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, @"type");

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 mask]);
    id v19 = (void *)v18;
    if (v18) {
      v20 = (void *)v18;
    }
    else {
      v20 = v12;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v20, @"mask");

    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsExpress]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v21,  @"supports_express");

    id v22 = [v10 supportsInSessionExpress];
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v23,  @"supports_in_session_express");

    id v24 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
    self = v24;

    v25 = self;
  }

  else
  {
    v25 = 0LL;
  }

  return v25;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = -[SQLiteEntity persistentID](v2, "persistentID");
  +[PaymentAutomaticSelectionTCI deleteEntitiesInDatabase:forPaymentAutomaticSelectionCriterionPID:]( &OBJC_CLASS___PaymentAutomaticSelectionTCI,  "deleteEntitiesInDatabase:forPaymentAutomaticSelectionCriterionPID:",  v3,  v4);
  +[PaymentAutomaticSelectionReaderId deleteEntitiesInDatabase:forPaymentAutomaticSelectionCriterionPID:]( &OBJC_CLASS___PaymentAutomaticSelectionReaderId,  "deleteEntitiesInDatabase:forPaymentAutomaticSelectionCriterionPID:",  v3,  v4);
  +[ASCAssociatedReaderID deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:inDatabase:]( &OBJC_CLASS___ASCAssociatedReaderID,  "deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:inDatabase:",  v4,  v3);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PaymentAutomaticSelectionCriterion;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

+ (id)_propertySettersForCriterion
{
  v3[0] = @"type";
  v3[1] = @"mask";
  v4[0] = &stru_10065A780;
  v4[1] = &stru_10065A7A0;
  v3[2] = @"supports_express";
  v3[3] = @"supports_in_session_express";
  v4[2] = &stru_10065A7C0;
  v4[3] = &stru_10065A7E0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end