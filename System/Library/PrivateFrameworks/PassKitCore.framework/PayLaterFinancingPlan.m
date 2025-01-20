@interface PayLaterFinancingPlan
+ (id)_financingPlansWithQuery:(id)a3;
+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3;
+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3 planIdentifier:(id)a4;
+ (id)_predicateForInstallmentEndDueDate:(id)a3;
+ (id)_predicateForInstallmentEndPayoffDate:(id)a3;
+ (id)_predicateForInstallmentStartDueDate:(id)a3;
+ (id)_predicateForInstallmentStartPayoffDate:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPlanIdentifier:(id)a3;
+ (id)_predicateForState:(unint64_t)a3;
+ (id)_predicateForStateReason:(unint64_t)a3;
+ (id)_predicateForStateReasonList:(id)a3;
+ (id)_predicateForStates:(id)a3;
+ (id)_predicateForTransactionEndDate:(id)a3;
+ (id)_predicateForTransactionStartDate:(id)a3;
+ (id)_propertySettersForPayLaterFinancingPlan;
+ (id)_propertyValuesForPayLaterFinancingPlan:(id)a3;
+ (id)anyInDatabase:(id)a3 withPlanIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPlanPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)financingPlanIdentifiersForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 limit:(int64_t)a7 inDatabase:(id)a8;
+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 stateReasons:(id)a4 inDatabase:(id)a5;
+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 installmentDueOrPaidDateStart:(id)a7 installmentDueOrPaidDateEnd:(id)a8 limit:(int64_t)a9 inDatabase:(id)a10;
+ (id)financingPlansIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdatePayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterFinancingPlans:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)totalPendingAmountForFinancingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (int64_t)countOfFinancingPlansForEndpointMetadataPID:(int64_t)a3 financingPlanStates:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterFinancingPlanWithIdentifier:(id)a3 forAccountEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlansForAccountEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlan)initWithPayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
- (id)financingPlan;
- (id)planIdentifier;
- (void)updateWithPayLaterFinancingPlan:(id)a3;
@end

@implementation PayLaterFinancingPlan

+ (id)databaseTable
{
  return @"huckleberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v26 = v7;
  if (v7 == @"pears.a") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = [@"pears.a" isEqualToString:v7];

    if ((v8 & 1) != 0)
    {
LABEL_4:
      v9 = @"JOIN salmonberry ON salmonberry.pid = huckleberry.a";
      v10 = @"JOIN pears ON pears.pid = salmonberry.a";
LABEL_5:
      [v6 addObject:v10];
LABEL_13:
      [v6 addObject:v9];
      goto LABEL_14;
    }

    v11 = v26;
    if (v11 == @"marionberry.m") {
      goto LABEL_12;
    }
    v12 = v11;
    unsigned __int8 v13 = [@"marionberry.m" isEqualToString:v11];

    if ((v13 & 1) != 0) {
      goto LABEL_12;
    }
    v14 = v12;
    if (v14 == @"marionberry.g"
      || (v15 = v14,
          unsigned __int8 v16 = [@"marionberry.g" isEqualToString:v14],
          v15,
          (v16 & 1) != 0)
      || (v17 = v15, v17 == @"marionberry.gc")
      || (v18 = v17,
          unsigned __int8 v19 = [@"marionberry.gc" isEqualToString:v17],
          v18,
          (v19 & 1) != 0))
    {
LABEL_12:
      v9 = @"JOIN marionberry ON marionberry.a = huckleberry.pid";
      goto LABEL_13;
    }

    v20 = v18;
    if (v20 == @"jostaberry.f"
      || (v21 = v20,
          unsigned __int8 v22 = [@"jostaberry.f" isEqualToString:v20],
          v21,
          (v22 & 1) != 0)
      || (v23 = v21, v23 == @"jostaberry.j")
      || (v24 = v23,
          unsigned int v25 = [@"jostaberry.j" isEqualToString:v23],
          v24,
          v25))
    {
      [v6 addObject:@"JOIN jostaberry ON jostaberry.a = asparagus.pid"];
      v9 = @"JOIN marionberry ON marionberry.a = huckleberry.pid";
      v10 = @"JOIN asparagus ON asparagus.a = huckleberry.pid";
      goto LABEL_5;
    }
  }

- (PayLaterFinancingPlan)initWithPayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterFinancingPlan:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a4 planIdentifier:v10]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v11]);

  if (v12) {
    [v12 updateWithPayLaterFinancingPlan:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlan:v8 forEndpointMetadataPID:a4 inDatabase:v9];
  }
  id v13 = [v12 persistentID];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 planSummary]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 planSummary]);
    id v16 =  +[PayLaterFinancingPlanSummary insertOrUpdatePayLaterFinancingPlanSummary:forFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanSummary,  "insertOrUpdatePayLaterFinancingPlanSummary:forFinancingPlanPID:inDatabase:",  v15,  v13,  v9);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 merchant]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 merchant]);
    id v19 =  +[PayLaterMerchant insertOrUpdatePayLaterMerchant:forFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterMerchant,  "insertOrUpdatePayLaterMerchant:forFinancingPlanPID:inDatabase:",  v18,  v13,  v9);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 scheduleSummary]);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 scheduleSummary]);
    id v22 =  +[PayLaterFinancingPlanScheduleSummary insertOrUpdatePayLaterFinancingPlanScheduleSummary:forFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanScheduleSummary,  "insertOrUpdatePayLaterFinancingPlanScheduleSummary:forFinancingPlanPID:inDatabase:",  v21,  v13,  v9);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v8 fundingSource]);

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 fundingSource]);
    +[PayLaterFinancingPlanFundingSource insertOrUpdateFinancingPlanFundingSource:forPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanFundingSource,  "insertOrUpdateFinancingPlanFundingSource:forPlanPID:inDatabase:",  v24,  v13,  v9);
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v8 termsDetails]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 termsDetails]);
    id v27 =  +[PayLaterFinancingPlanTermsDetails insertOrUpdatePayLaterFinancingPlanTermsDetails:forFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanTermsDetails,  "insertOrUpdatePayLaterFinancingPlanTermsDetails:forFinancingPlanPID:inDatabase:",  v26,  v13,  v9);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 disputes]);
  id v29 =  +[PayLaterFinancingPlanDispute insertOrUpdateFinancingPlanDisputes:forFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanDispute,  "insertOrUpdateFinancingPlanDisputes:forFinancingPlanPID:inDatabase:",  v28,  v13,  v9);

  return v12;
}

+ (id)insertOrUpdatePayLaterFinancingPlans:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
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
        id v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertOrUpdatePayLaterFinancingPlan:forEndpointMetadataPID:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  a4,  v9,  (void)v19));
        if (v16) {
          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }

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

- (void)updateWithPayLaterFinancingPlan:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterFinancingPlan:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  uint64_t v14 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v13 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _financingPlansWithQuery:v10]);
  return v11;
}

+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 installmentDueOrPaidDateStart:(id)a7 installmentDueOrPaidDateEnd:(id)a8 limit:(int64_t)a9 inDatabase:(id)a10
{
  id v42 = a10;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v40 = a4;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentStartDueDate:v17]);
  v47[0] = v20;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentStartPayoffDate:v17]);

  v47[1] = v21;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v22));

  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentEndDueDate:v16]);
  v46[0] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentEndPayoffDate:v16]);

  v46[1] = v24;
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v25));

  id v27 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  v45[0] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionStartDate:v19]);

  v45[1] = v28;
  id v29 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionEndDate:v18]);

  v45[2] = v29;
  v45[3] = v39;
  v45[4] = v26;
  v30 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStates:v40]);

  v45[5] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 6LL));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v31));

  v44 = @"marionberry.m";
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  v43 = @"DESC";
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  LOBYTE(v38) = 1;
  v35 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v42 predicate:v32 orderingProperties:v33 orderingDirections:v34 limit:a9 groupingProperties:0 returnsDistinctEntities:v38]);

  v36 = (void *)objc_claimAutoreleasedReturnValue([a1 _financingPlansWithQuery:v35]);
  return v36;
}

+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 stateReasons:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  v21[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStateReasonList:v9]);

  v21[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  __int128 v20 = @"marionberry.m";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v19 = @"DESC";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v13 orderingProperties:v14 orderingDirections:v15]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _financingPlansWithQuery:v16]);
  return v17;
}

+ (id)financingPlanIdentifiersForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 limit:(int64_t)a7 inDatabase:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  v33[0] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionStartDate:v16]);

  v33[1] = v19;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionEndDate:v15]);

  v33[2] = v20;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStates:v17]);

  v33[3] = v21;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 4LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v14 predicate:v23 orderingProperties:&__NSArray0__struct orderingDirections:&__NSArray0__struct limit:a7]);

  v32 = @"b";
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100043248;
  v30[3] = &unk_10063C0D0;
  id v27 = v24;
  v31 = v27;
  [v25 enumeratePersistentIDsAndProperties:v26 usingBlock:v30];

  if (-[NSMutableSet count](v27, "count")) {
    id v28 = -[NSMutableSet copy](v27, "copy");
  }
  else {
    id v28 = 0LL;
  }

  return v28;
}

+ (int64_t)countOfFinancingPlansForEndpointMetadataPID:(int64_t)a3 financingPlanStates:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStates:v9]);

  v17[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v13]);
  id v15 = [v14 countOfEntities];

  return (int64_t)v15;
}

+ (id)financingPlansIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForState:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_10004348C;
  id v16 = &unk_10063BCB0;
  id v17 = v6;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v18 = v9;
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

+ (id)totalPendingAmountForFinancingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  v23[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStates:&off_100690EF0]);
  v23[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1000436F0;
  __int128 v20 = sub_100043700;
  id v21 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  v22[0] = @"marionberry.g";
  v22[1] = @"marionberry.gc";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100043708;
  v15[3] = &unk_10063C0F8;
  v15[4] = &v16;
  [v11 enumerateProperties:v12 usingBlock:v15];

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

+ (id)_financingPlansWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterFinancingPlan]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObject:@"marionberry.m"]);

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_1000438EC;
  id v17 = &unk_100638F18;
  id v18 = v5;
  id v19 = (id)objc_claimAutoreleasedReturnValue([v4 database]);
  __int128 v20 = v8;
  id v21 = a1;
  id v9 = v8;
  id v10 = v19;
  id v11 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:&v14];

  id v12 = -[NSMutableArray copy](v9, "copy", v14, v15, v16, v17);
  return v12;
}

+ (id)anyInDatabase:(id)a3 withPlanIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPlanIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPlanPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deletePayLaterFinancingPlansForAccountEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deletePayLaterFinancingPlanWithIdentifier:(id)a3 forAccountEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a4 planIdentifier:a3]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v10]);

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = -[SQLiteEntity persistentID](v2, "persistentID");
  +[PayLaterFinancingPlanSummary deletePayLaterFinancingPlanSummaryForFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanSummary,  "deletePayLaterFinancingPlanSummaryForFinancingPlanPID:inDatabase:",  v4,  v3);
  +[PayLaterMerchant deletePayLaterMerchantForFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterMerchant,  "deletePayLaterMerchantForFinancingPlanPID:inDatabase:",  v4,  v3);
  +[PayLaterFinancingPlanScheduleSummary deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanScheduleSummary,  "deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:inDatabase:",  v4,  v3);
  +[PayLaterFinancingPlanFundingSource deleteFinancingPlanFundingSourceForPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanFundingSource,  "deleteFinancingPlanFundingSourceForPlanPID:inDatabase:",  v4,  v3);
  +[PayLaterFinancingPlanDispute deleteFinancingPlanDisputesForFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanDispute,  "deleteFinancingPlanDisputesForFinancingPlanPID:inDatabase:",  v4,  v3);
  +[PayLaterFinancingPlanTermsDetails deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanTermsDetails,  "deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:inDatabase:",  v4,  v3);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterFinancingPlan;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

- (id)financingPlan
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterFinancingPlan);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterFinancingPlan");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100043FF0;
  v25[3] = &unk_100638EF0;
  v25[4] = self;
  id v26 = v6;
  id v8 = v3;
  id v27 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v25);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v11 = -[SQLiteEntity persistentID](self, "persistentID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlanSummary anyInDatabase:forFinancingPlanPID:]( &OBJC_CLASS___PayLaterFinancingPlanSummary,  "anyInDatabase:forFinancingPlanPID:",  v10,  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 planSummary]);

  -[PKPayLaterFinancingPlan setPlanSummary:](v8, "setPlanSummary:", v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterMerchant anyInDatabase:forFinancingPlanPID:]( &OBJC_CLASS___PayLaterMerchant,  "anyInDatabase:forFinancingPlanPID:",  v10,  v11));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 payLaterMerchant]);

  -[PKPayLaterFinancingPlan setMerchant:](v8, "setMerchant:", v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlanScheduleSummary anyInDatabase:forFinancingPlanPID:]( &OBJC_CLASS___PayLaterFinancingPlanScheduleSummary,  "anyInDatabase:forFinancingPlanPID:",  v10,  v11));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 scheduleSummary]);

  -[PKPayLaterFinancingPlan setScheduleSummary:](v8, "setScheduleSummary:", v17);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlanFundingSource anyInDatabase:forPlanPID:]( &OBJC_CLASS___PayLaterFinancingPlanFundingSource,  "anyInDatabase:forPlanPID:",  v10,  v11));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fundingSource]);
  -[PKPayLaterFinancingPlan setFundingSource:](v8, "setFundingSource:", v19);

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlanDispute financingPlanDisputesForFinancingPlanPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingPlanDispute,  "financingPlanDisputesForFinancingPlanPID:inDatabase:",  v11,  v10));
  -[PKPayLaterFinancingPlan setDisputes:](v8, "setDisputes:", v20);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingPlanTermsDetails anyInDatabase:forFinancingPlanPID:]( &OBJC_CLASS___PayLaterFinancingPlanTermsDetails,  "anyInDatabase:forFinancingPlanPID:",  v10,  v11));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 termsDetails]);

  -[PKPayLaterFinancingPlan setTermsDetails:](v8, "setTermsDetails:", v22);
  v23 = v8;

  return v23;
}

- (id)planIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b");
}

+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3 planIdentifier:(id)a4
{
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPlanIdentifier:a4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountEndpointMetadataPID:a3]);
  v11[0] = v6;
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPlanIdentifier:(id)a3
{
  return +[SQLiteStringLikePredicate predicateWithProperty:matchingPattern:]( &OBJC_CLASS___SQLiteStringLikePredicate,  "predicateWithProperty:matchingPattern:",  @"b",  a3);
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_predicateForStates:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForState:",  objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v10),  "integerValue",  (void)v15)));
          -[NSMutableArray addObject:](v5, "addObject:", v11);

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    id v12 = -[NSMutableArray copy](v5, "copy");
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v12));
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v13;
}

+ (id)_predicateForStateReasonList:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForStateReason:",  objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v10),  "integerValue",  (void)v15)));
          -[NSMutableArray addObject:](v5, "addObject:", v11);

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    id v12 = -[NSMutableArray copy](v5, "copy");
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v12));
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v13;
}

+ (id)_predicateForState:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  v3));

  return v4;
}

+ (id)_predicateForStateReason:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"h",  v3));

  return v4;
}

+ (id)_predicateForTransactionStartDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"marionberry.m",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForTransactionEndDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"marionberry.m",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForInstallmentStartDueDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"jostaberry.f",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForInstallmentEndDueDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"jostaberry.f",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForInstallmentStartPayoffDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"jostaberry.j",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForInstallmentEndPayoffDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"jostaberry.j",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_propertyValuesForPayLaterFinancingPlan:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 planIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 productType], @"c");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);
  id v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 state], @"e");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 planChannel], @"f");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 stateReason], @"h");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 requiresGenericMessaging],  @"i");
  id v8 = [v3 isCancellable];

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v8, @"j");
  id v9 = -[NSMutableDictionary copy](v4, "copy");

  return v9;
}

+ (id)_propertySettersForPayLaterFinancingPlan
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10063C138;
  v4[1] = &stru_10063C158;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10063C178;
  v4[3] = &stru_10063C198;
  v3[4] = @"f";
  v3[5] = @"h";
  v4[4] = &stru_10063C1B8;
  v4[5] = &stru_10063C1D8;
  v3[6] = @"i";
  v3[7] = @"j";
  v4[6] = &stru_10063C1F8;
  v4[7] = &stru_10063C218;
  v3[8] = @"pears.a";
  v4[8] = &stru_10063C238;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
}

@end