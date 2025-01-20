@interface PayLaterInstallment
+ (id)_installmentsForQuery:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForEndDueDate:(id)a3;
+ (id)_predicateForFinancingPlanStates:(id)a3;
+ (id)_predicateForInstallmentIdentifier:(id)a3;
+ (id)_predicateForInstallmentStatus:(unint64_t)a3;
+ (id)_predicateForInstallmentStatuses:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 installmentIdentifier:(id)a4;
+ (id)_predicateForStartDueDate:(id)a3;
+ (id)_propertySettersForPayLaterInstallment;
+ (id)_propertyValuesForPayLaterInstallment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)financingPlanIdentifiersThatContainInstallmentWithStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)financingPlanInstallmentsTotalDueForAccountIdentifier:(id)a3 fromDaysInFuture:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterInstallments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)payoffDateQueryWithInstallmentPID:(int64_t)a3 bindings:(id)a4;
+ (id)upcomingInstallmentsForAccountIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterInstallmentWithIdentifier:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 startDate:(id *)a5 endDate:(id *)a6 inDatabase:(id)a7;
+ (void)updatePayoffDateForInstallmentPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterInstallment)initWithPayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_currentBalance;
- (id)_totalAmount;
- (id)planIdentifier;
- (void)updateWithPayLaterInstallment:(id)a3;
@end

@implementation PayLaterInstallment

+ (id)databaseTable
{
  return @"jostaberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlanScheduleSummary, a2) == a3) {
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
  v15 = v7;
  if (v7 == @"pears.a") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned int v8 = [@"pears.a" isEqualToString:v7];

    if (v8)
    {
LABEL_4:
      [v6 addObject:@"JOIN pears ON pears.pid = salmonberry.a"];
      [v6 addObject:@"JOIN salmonberry ON salmonberry.pid = huckleberry.a"];
LABEL_5:
      [v6 addObject:@"JOIN huckleberry ON huckleberry.pid = asparagus.a"];
      [v6 addObject:@"JOIN asparagus ON asparagus.pid = jostaberry.a"];
      goto LABEL_6;
    }

    v9 = v15;
    if (v9 == @"huckleberry.e") {
      goto LABEL_5;
    }
    v10 = v9;
    unsigned __int8 v11 = [@"huckleberry.e" isEqualToString:v9];

    if ((v11 & 1) != 0) {
      goto LABEL_5;
    }
    v12 = v10;
    if (v12 == @"huckleberry.b") {
      goto LABEL_5;
    }
    v13 = v12;
    unsigned int v14 = [@"huckleberry.b" isEqualToString:v12];

    if (v14) {
      goto LABEL_5;
    }
  }

- (PayLaterInstallment)initWithPayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterInstallment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 installmentIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a4 installmentIdentifier:v10]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v11]);

  if (v12) {
    [v12 updateWithPayLaterInstallment:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterInstallment:v9 forScheduleSummaryPID:a4 inDatabase:v8];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 appliedPayments]);

  id v14 =  +[PayLaterAppliedPayment insertOrUpdatePayLaterAppliedPayments:forInstallmentPID:inDatabase:]( PayLaterAppliedPayment,  "insertOrUpdatePayLaterAppliedPayments:forInstallmentPID:inDatabase:",  v13,  [v12 persistentID],  v8);
  objc_msgSend(a1, "updatePayoffDateForInstallmentPID:inDatabase:", objc_msgSend(v12, "persistentID"), v8);

  return v12;
}

+ (id)insertOrUpdatePayLaterInstallments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterInstallmentsForScheduleSummaryPID:a4 inDatabase:v9];
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertOrUpdatePayLaterInstallment:forScheduleSummaryPID:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  a4,  v9,  (void)v19));
        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v16);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  id v17 = -[NSMutableArray copy](v10, "copy");
  return v17;
}

- (void)updateWithPayLaterInstallment:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterInstallment:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)financingPlanIdentifiersThatContainInstallmentWithStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentStatus:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10024E610;
  v16 = &unk_10063BCB0;
  id v17 = v6;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v18 = v9;
  id v10 = v6;
  [v8 enumeratePersistentIDsUsingBlock:&v13];
  if (-[NSMutableSet count](v9, "count", v13, v14, v15, v16)) {
    id v11 = -[NSMutableSet copy](v9, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)payLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  uint64_t v14 = @"f";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v13 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _installmentsForQuery:v10]);
  return v11;
}

+ (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 startDate:(id *)a5 endDate:(id *)a6 inDatabase:(id)a7
{
  id v10 = a3;
  id v26 = a4;
  id v11 = a7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:v10]);
  v47[0] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanStates:v26]);
  v47[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_10024EB34;
  v39 = sub_10024EB44;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10024EB34;
  v33 = sub_10024EB44;
  id v34 = 0LL;
  v46 = @"f";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  v45 = @"DESC";
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v11 predicate:v15 orderingProperties:v16 orderingDirections:v17 limit:1]);

  v44 = @"f";
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10024EB4C;
  v28[3] = &unk_10063E828;
  v28[4] = &v29;
  [v18 enumeratePersistentIDsAndProperties:v19 usingBlock:v28];

  v43 = @"f";
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  v42 = @"ASC";
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v11 predicate:v15 orderingProperties:v20 orderingDirections:v21 limit:1]);

  v41 = @"f";
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10024EBCC;
  v27[3] = &unk_10063E828;
  v27[4] = &v35;
  [v22 enumeratePersistentIDsAndProperties:v23 usingBlock:v27];

  if (a5) {
    *a5 = (id) v36[5];
  }
  if (a6) {
    *a6 = (id) v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

+ (id)financingPlanInstallmentsTotalDueForAccountIdentifier:(id)a3 fromDaysInFuture:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  0.0));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  0.0));
    [v9 timeIntervalSinceDate:v10];
    uint64_t v12 = (uint64_t)v11;

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v15 = (uint64_t)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT jostaberry.d, jostaberry.dc FROM jostaberry JOIN pears ON pears.pid = salmonberry.a JOIN salmonberry ON salmonberry.pid = huckleberry.a JOIN huckleberry ON huckleberry.pid = asparagus.a JOIN asparagus ON asparagus.pid = jostaberry.a WHERE pears.a=%@ AND (huckleberry.e=%ld OR huckleberry.e=%ld) AND jostaberry.d > 0 AND (jostaberry.h=%ld OR jostaberry.h=%ld) AND jostaberry.f < (STRFTIME('%%s', DATETIME(%ld + %ld, 'unixepoch', 'localtime', '%ld Day')) - %ld)",  v7,  1LL,  4LL,  1LL,  4LL,  v15,  v12,  a4,  v12));
    uint64_t v20 = 0LL;
    __int128 v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = sub_10024EB34;
    v24 = sub_10024EB44;
    id v25 = 0LL;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10024EDF8;
    v19[3] = &unk_1006456F8;
    v19[4] = &v20;
    sub_1002CCDBC((uint64_t)v8, v16, v19);
    id v17 = (id)v21[5];
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

+ (id)upcomingInstallmentsForAccountIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v43[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentStatuses:&off_1006910D0]);
  v43[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanStates:&off_1006910E8]);
  v43[2] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanValue:",  @"d",  &off_1006904D0));
  v43[3] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 4LL));
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v42 = @"f";
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
  v41 = @"ASC";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
  id v34 = (void *)v13;
  uint64_t v35 = v7;
  uint64_t v16 = objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v7 predicate:v13 orderingProperties:v14 orderingDirections:v15 limit:a4]);

  v33 = (void *)v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _installmentsForQuery:v16]);
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v20 = v17;
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 planIdentifier]);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v26));
        if (!v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlan anyInDatabase:withPlanIdentifier:]( &OBJC_CLASS___PayLaterFinancingPlan,  "anyInDatabase:withPlanIdentifier:",  v35,  v26));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v28 financingPlan]);

          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v27, v26);
        }

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 installmentIdentifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v27, v29);
      }

      id v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v22);
  }

  if ([v20 count] && -[NSMutableDictionary count](v19, "count")) {
    id v30 = [[PKAccountServicePayLaterFinancingPlanQueryInstallments alloc] initWithInstallment:v20 installmentIdentifierToFinancingPlan:v19];
  }
  else {
    id v30 = 0LL;
  }

  return v30;
}

+ (id)_installmentsForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterInstallment]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10024F3A4;
  v15[3] = &unk_100646948;
  __int128 v19 = v7;
  id v20 = a1;
  id v16 = v5;
  id v17 = v6;
  id v18 = v4;
  id v9 = v7;
  id v10 = v4;
  id v11 = v6;
  id v12 = v5;
  [v10 enumeratePersistentIDsAndProperties:v8 usingBlock:v15];

  id v13 = -[NSMutableArray copy](v9, "copy");
  return v13;
}

+ (void)deletePayLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deletePayLaterInstallmentWithIdentifier:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a4 installmentIdentifier:a3]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v10]);

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterAppliedPayment deletePayLaterAppliedPaymentsForInstallmentPID:inDatabase:]( &OBJC_CLASS___PayLaterAppliedPayment,  "deletePayLaterAppliedPaymentsForInstallmentPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterInstallment;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

- (id)_totalAmount
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"cc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_currentBalance
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"dc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)planIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"huckleberry.b");
}

+ (id)payoffDateQueryWithInstallmentPID:(int64_t)a3 bindings:(id)a4
{
  id v5 = a4;
  [v5 addIntBinding:3];
  if (a3)
  {
    [v5 addIntBinding:a3];
    uint64_t v6 = @"AND jostaberry.pid = ?";
  }

  else
  {
    uint64_t v6 = &stru_100662310;
  }

  [v5 addIntBinding:1];
  [v5 addIntBinding:2];
  [v5 addIntBinding:3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"     SELECT       MAX(pineberry.f) AS payoff_date, jostaberry.pid AS installment_pid    FROM       jostaberry       JOIN          oregano          ON oregano.a = jostaberry.pid       JOIN          pineberry          ON pineberry.b = oregano.c    WHERE       %@       %@       %@    GROUP BY       pineberry.a    ",  @"jostaberry.h = ?",  v6,  @"AND pineberry.d IN (?, ?, ?)"));

  return v7;
}

+ (void)updatePayoffDateForInstallmentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___PDSQLiteDatabaseBinding);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a3]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyInDatabase:predicate:]( &OBJC_CLASS___PayLaterInstallment,  "anyInDatabase:predicate:",  v6,  v8));

  if (v9)
  {
    id v11 = objc_msgSend((id)objc_opt_class(a1, v10), "payoffDateQueryWithInstallmentPID:bindings:", a3, v7);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v20[0] = 0LL;
    v20[1] = v20;
    v20[2] = 0x3032000000LL;
    v20[3] = sub_10024EB34;
    v20[4] = sub_10024EB44;
    id v21 = 0LL;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10024FA84;
    v14[3] = &unk_10064F428;
    id v15 = v6;
    id v13 = v12;
    id v16 = v13;
    id v17 = v7;
    __int128 v19 = v20;
    id v18 = v9;
    sub_1002CCC5C((uint64_t)v15, v14);

    _Block_object_dispose(v20, 8);
  }
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 installmentIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScheduleSummaryPID:a3]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentIdentifier:v6]);

  v12[0] = v7;
  v12[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForInstallmentStatus:(unint64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"h",  v3));

  return v4;
}

+ (id)_predicateForInstallmentStatuses:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"h",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9),  (void)v13));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v11;
}

+ (id)_predicateForInstallmentIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pears.a",  a3);
}

+ (id)_predicateForFinancingPlanStates:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"huckleberry.e",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9),  (void)v13));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v11;
}

+ (id)_predicateForStartDueDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate(a3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"f",  v3));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForEndDueDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate(a3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"f",  v3));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_propertyValuesForPayLaterInstallment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 amount]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"c");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"cc");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"d");

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"dc");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 dueDate]);
  __int128 v19 = (void *)_SQLValueForDate(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"f");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 status], @"h");
  id v20 = [v3 interval];

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v20, @"i");
  id v21 = -[NSMutableDictionary copy](v4, "copy");

  return v21;
}

+ (id)_propertySettersForPayLaterInstallment
{
  v3[0] = @"b";
  v3[1] = @"h";
  v4[0] = &stru_10064F468;
  v4[1] = &stru_10064F488;
  v3[2] = @"f";
  v3[3] = @"i";
  v4[2] = &stru_10064F4A8;
  v4[3] = &stru_10064F4C8;
  v3[4] = @"j";
  v3[5] = @"huckleberry.b";
  v4[4] = &stru_10064F4E8;
  v4[5] = &stru_10064F508;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end