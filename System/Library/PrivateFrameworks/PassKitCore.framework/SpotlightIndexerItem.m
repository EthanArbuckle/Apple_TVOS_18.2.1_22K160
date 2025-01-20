@interface SpotlightIndexerItem
+ (BOOL)hasFutureActionableItemsInDatabase:(id)a3;
+ (BOOL)updateWithIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 inDatabase:(id)a6;
+ (SpotlightIndexerItem)itemWithUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForActionableItems;
+ (id)_predicateForActionableItemsInTheFuture;
+ (id)_predicateForDomainIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForNoErrorsOrNoRecentErrors;
+ (id)_predicateForRecentErrors;
+ (id)_predicateForStatus:(unint64_t)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForIndexerItem;
+ (id)allIndexedItemsOfType:(unint64_t)a3 inDatabase:(id)a4;
+ (id)batchOfActionableItemsInDatabase:(id)a3 withCount:(unint64_t)a4;
+ (id)databaseTable;
+ (id)itemCountsOfType:(unint64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateWithIdentifier:(id)a3 domainIdentifier:(id)a4 searchableItemData:(id)a5 type:(unint64_t)a6 status:(unint64_t)a7 error:(id)a8 inDatabase:(id)a9;
+ (void)updateItemsWithDomainIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 error:(id)a6 inDatabase:(id)a7;
- (NSData)searchableItemData;
- (NSDate)lastModifiedDate;
- (NSString)domainIdentifier;
- (NSString)errorDomain;
- (NSString)uniqueIdentifier;
- (SpotlightIndexerItem)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)status;
- (unint64_t)tryCount;
- (unint64_t)type;
- (void)setDomainIdentifier:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSearchableItemData:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTryCount:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SpotlightIndexerItem

+ (id)databaseTable
{
  return @"index_item";
}

- (SpotlightIndexerItem)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SpotlightIndexerItem;
  v4 = -[SQLiteEntity initWithPersistentID:inDatabase:](&v15, "initWithPersistentID:inDatabase:", a3, a4);
  v6 = v4;
  if (v4)
  {
    id v7 = objc_msgSend((id)objc_opt_class(v4, v5), "_propertySettersForIndexerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100308E98;
    v12[3] = &unk_100639EE8;
    v13 = v6;
    id v14 = v8;
    id v10 = v8;
    -[SQLiteEntity getValuesForProperties:withApplier:](v13, "getValuesForProperties:withApplier:", v9, v12);
  }

  return v6;
}

+ (BOOL)updateWithIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  v18[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a4]);
  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v14]);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    [v15 setValue:v16 forProperty:@"status"];
  }

  return v15 != 0LL;
}

+ (void)insertOrUpdateWithIdentifier:(id)a3 domainIdentifier:(id)a4 searchableItemData:(id)a5 type:(unint64_t)a6 status:(unint64_t)a7 error:(id)a8 inDatabase:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100309174;
  v24[3] = &unk_100655FA8;
  id v25 = v15;
  id v26 = a9;
  unint64_t v31 = a6;
  unint64_t v32 = a7;
  id v27 = v16;
  id v28 = v18;
  id v29 = v17;
  id v30 = a1;
  id v19 = v17;
  id v20 = v18;
  id v21 = v16;
  id v22 = v26;
  id v23 = v15;
  sub_1002CCC5C((uint64_t)v22, v24);
}

+ (void)updateItemsWithDomainIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 error:(id)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDomainIdentifier:v12]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryWithDatabase:predicate:", v14));
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v33 = @"identifier";
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100309684;
  v30[3] = &unk_10063C0D0;
  id v18 = v16;
  unint64_t v31 = v18;
  v24 = v15;
  [v15 enumeratePersistentIDsAndProperties:v17 usingBlock:v30];

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v19 = v18;
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v26,  v32,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      id v23 = 0LL;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        [a1 insertOrUpdateWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * (void)v23) domainIdentifier:v12 searchableItemData:0 type:a4 status:a5 error:v13 inDatabase:v14];
        id v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v26,  v32,  16LL);
    }

    while (v21);
  }
}

+ (SpotlightIndexerItem)itemWithUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return (SpotlightIndexerItem *)v8;
}

+ (id)batchOfActionableItemsInDatabase:(id)a3 withCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActionableItems]);
  id v25 = @"last_error_domain";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v24 = @"ASC";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:a4]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForIndexerItem]);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100309910;
  v19[3] = &unk_100638F18;
  id v20 = v6;
  id v21 = v11;
  uint64_t v22 = v12;
  id v23 = a1;
  id v14 = v12;
  id v15 = v11;
  id v16 = v6;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:v19];

  id v17 = -[NSMutableSet copy](v14, "copy");
  return v17;
}

+ (id)allIndexedItemsOfType:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:2]);
  v29[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a3]);
  v29[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  __int128 v28 = @"last_error_domain";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  __int128 v27 = @"ASC";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v6 predicate:v10 orderingProperties:v11 orderingDirections:v12 limit:0]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForIndexerItem]);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100309BDC;
  v22[3] = &unk_100638F18;
  id v23 = v6;
  id v24 = v14;
  id v25 = v15;
  id v26 = a1;
  id v17 = v15;
  id v18 = v14;
  id v19 = v6;
  [v13 enumeratePersistentIDsAndProperties:v16 usingBlock:v22];

  id v20 = -[NSMutableSet copy](v17, "copy");
  return v20;
}

+ (BOOL)hasFutureActionableItemsInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecentErrors]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:1]);

  LOBYTE(v4) = (uint64_t)[v6 countOfEntities] > 0;
  return (char)v4;
}

+ (id)itemCountsOfType:(unint64_t)a3 inDatabase:(id)a4
{
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_100309DA4;
  v11 = &unk_100642030;
  id v14 = a1;
  unint64_t v15 = a3;
  id v12 = a4;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v13;
  id v5 = v12;
  sub_1002CCC5C((uint64_t)v5, &v8);
  id v6 = -[NSMutableDictionary copy](v4, "copy", v8, v9, v10, v11);

  return v6;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForDomainIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"domain_identifier",  a3);
}

+ (id)_predicateForStatus:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  v3));

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)_predicateForNoErrorsOrNoRecentErrors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"last_error_domain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"action_try_count",  &off_100690710));
  id v4 = sub_10030A234();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)_SQLValueForDate(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"last_modified_date",  v6));

  v15[0] = v3;
  v15[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"last_error_domain"));
  v15[2] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  v14[0] = v10;
  v14[1] = v2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v11));

  return v12;
}

+ (id)_predicateForRecentErrors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"action_try_count",  &off_100690710));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanValue:",  @"action_try_count",  &off_100690728));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"action_try_count"));
  v15[0] = v4;
  id v5 = sub_10030A234();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)_SQLValueForDate(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"last_modified_date",  v7));
  v15[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  v14[0] = v2;
  v14[1] = v3;
  void v14[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  return v12;
}

+ (id)_predicateForActionableItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:0]);
  v12[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:3]);
  v12[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNoErrorsOrNoRecentErrors]);
  v11[0] = v6;
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForActionableItemsInTheFuture
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:0]);
  v12[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatus:3]);
  v12[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNoErrorsOrNoRecentErrors]);
  v11[0] = v6;
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_propertySettersForIndexerItem
{
  v3[0] = @"identifier";
  v3[1] = @"domain_identifier";
  v4[0] = &stru_100656010;
  v4[1] = &stru_100656030;
  v3[2] = @"status";
  v3[3] = @"type";
  v4[2] = &stru_100656050;
  v4[3] = &stru_100656070;
  v3[4] = @"action_try_count";
  v3[5] = @"last_error_code";
  v4[4] = &stru_100656090;
  v4[5] = &stru_1006560B0;
  v3[6] = @"last_error_domain";
  v3[7] = @"last_modified_date";
  v4[6] = &stru_1006560D0;
  v4[7] = &stru_1006560F0;
  v3[8] = @"searchable_item";
  v4[8] = &stru_100656110;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_uniqueIdentifier,  @"identifier");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_domainIdentifier,  @"domain_identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_status));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"status");

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_type));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"type");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_tryCount));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"action_try_count");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_errorCode));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"last_error_code");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_errorDomain,  @"last_error_domain");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastModifiedDate,  @"last_modified_date");
  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)tryCount
{
  return self->_tryCount;
}

- (void)setTryCount:(unint64_t)a3
{
  self->_tryCount = a3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (NSData)searchableItemData
{
  return self->_searchableItemData;
}

- (void)setSearchableItemData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end