@interface AccountStatementMetadataItem
+ (BOOL)allItemsAreProcessedForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_commonDictionaryForStatementMetadataItem:(id)a3;
+ (id)_metadataItemsWithQuery:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForStatementMetadataPID:(int64_t)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForAccountStatementMetadataItem;
+ (id)_queryforItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 forStatementMetadataPID:(int64_t)a4 identifier:(id)a5 type:(unint64_t)a6;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountStatementMetadataItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)markItems:(id)a3 asProcessed:(BOOL)a4 error:(unint64_t)a5 forStatementMetadataPID:(int64_t)a6 inDatabase:(id)a7;
+ (void)updateReportDate:(id)a3 forItems:(id)a4 forStatementMetadataPID:(int64_t)a5 inDatabase:(id)a6;
- (AccountStatementMetadataItem)initWithStatementMetadataItem:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)identifier;
- (int64_t)reportCount;
- (unint64_t)accountType;
- (unint64_t)type;
- (void)markMetadataItemAsProcessed:(BOOL)a3 error:(unint64_t)a4;
- (void)updateReportDate:(id)a3;
- (void)updateWithStatementMetadataItem:(id)a3;
@end

@implementation AccountStatementMetadataItem

+ (id)databaseTable
{
  return @"account_statement_metadata_item";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"account_statement_metadata.account_identifier"
    || v7
    && (unsigned int v8 = [@"account_statement_metadata.account_identifier" isEqualToString:v7],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN account_statement_metadata ON account_statement_metadata.pid = account_statement_metadata_item.account_statement_metadata_pid"];
  }
}

- (AccountStatementMetadataItem)initWithStatementMetadataItem:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForStatementMetadataItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  [v12 setUnsignedLongLong:a4 forKey:@"account_statement_metadata_pid"];
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);

  return v13;
}

+ (id)insertOrUpdateAccountStatementMetadataItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        id v17 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "anyInDatabase:forStatementMetadataPID:identifier:type:",  v9,  a4,  v16,  objc_msgSend(v15, "type")));

        if (v17) {
          [v17 updateWithStatementMetadataItem:v15];
        }
        else {
          id v17 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v18)),  "initWithStatementMetadataItem:forStatementMetadataPID:inDatabase:",  v15,  a4,  v9);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        -[NSMutableSet pk_safelyAddObject:](v31, "pk_safelyAddObject:", v19);

        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v17);
      }

      id v12 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v12);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v31, "allObjects"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"identifier",  v20));

  v37[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementMetadataPID:a4]);
  v37[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v24]);
  if (([v25 deleteAllEntities] & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Failed to delete obsolete statement account metadata items",  buf,  2u);
    }
  }

  id v28 = -[NSMutableArray copy](v10, "copy");

  return v28;
}

+ (void)deleteAccountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementMetadataPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AccountStatementMetadataItem;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

+ (id)anyInDatabase:(id)a3 forStatementMetadataPID:(int64_t)a4 identifier:(id)a5 type:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementMetadataPID:a4]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForIdentifier:", v10, v12));

  v19[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a6]);
  v19[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v11 predicate:v16]);
  return v17;
}

+ (id)accountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementMetadataPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _metadataItemsWithQuery:v8]);
  return v9;
}

+ (id)_metadataItemsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountStatementMetadataItem]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1002374E0;
  v16 = &unk_100638F18;
  id v17 = v4;
  id v18 = v5;
  v19 = v6;
  id v20 = a1;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  [v10 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  id v11 = -[NSMutableArray copy](v8, "copy", v13, v14, v15, v16);
  return v11;
}

+ (BOOL)allItemsAreProcessedForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementMetadataPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v16 = @"has_been_processed";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100237818;
  v11[3] = &unk_10063C0F8;
  v11[4] = &v12;
  [v8 enumerateProperties:v9 usingBlock:v11];

  LOBYTE(v9) = *((_BYTE *)v13 + 24) == 0;
  _Block_object_dispose(&v12, 8);

  return (char)v9;
}

- (void)updateWithStatementMetadataItem:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForStatementMetadataItem:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

- (void)markMetadataItemAsProcessed:(BOOL)a3 error:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100237930;
  v8[3] = &unk_10064E600;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  sub_1002CCC5C((uint64_t)v7, v8);
}

- (void)updateReportDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100237B08;
  v7[3] = &unk_1006455C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1002CCC5C((uint64_t)v5, v7);
}

+ (void)markItems:(id)a3 asProcessed:(BOOL)a4 error:(unint64_t)a5 forStatementMetadataPID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v14 = (id)objc_claimAutoreleasedReturnValue([a1 _queryforItems:a3 forStatementMetadataPID:a6 inDatabase:v12]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100237C58;
  v15[3] = &unk_10064E628;
  id v16 = v12;
  id v17 = a1;
  BOOL v19 = a4;
  unint64_t v18 = a5;
  id v13 = v12;
  [v14 enumeratePersistentIDsUsingBlock:v15];
}

+ (void)updateReportDate:(id)a3 forItems:(id)a4 forStatementMetadataPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v14 = (id)objc_claimAutoreleasedReturnValue([a1 _queryforItems:a4 forStatementMetadataPID:a5 inDatabase:v11]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100237DA8;
  v15[3] = &unk_100643FD8;
  id v17 = v10;
  id v18 = a1;
  id v16 = v11;
  id v12 = v10;
  id v13 = v11;
  [v14 enumeratePersistentIDsUsingBlock:v15];
}

+ (id)_queryforItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  int64_t v25 = a4;
  id v7 = a3;
  id v26 = a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        id v12 = v8;
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", v25));
        char v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v14]);
        v33[0] = v15;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForType:", objc_msgSend(v13, "type")));
        v33[1] = v16;
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));

        id v8 = v12;
        -[NSMutableArray safelyAddObject:](v12, "safelyAddObject:", v18);
      }

      id v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v10);
  }

  BOOL v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementMetadataPID:v25]);
  -[NSMutableArray safelyAddObject:](v19, "safelyAddObject:", v20);

  if (-[NSMutableArray count](v8, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v8));
    -[NSMutableArray safelyAddObject:](v19, "safelyAddObject:", v21);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19,  v25));
  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v26 predicate:v22]);

  return v23;
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (id)accountIdentifier
{
  return -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"account_statement_metadata.account_identifier");
}

- (unint64_t)accountType
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"account_statement_metadata_pid"));
  id v4 = [v3 longValue];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AccountStatementMetadata anyInDatabase:forPID:]( &OBJC_CLASS___AccountStatementMetadata,  "anyInDatabase:forPID:",  v5,  v4));

  id v7 = [v6 accountType];
  return (unint64_t)v7;
}

- (unint64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (int64_t)reportCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"report_count"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (id)_predicateForStatementMetadataPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_statement_metadata_pid",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForType:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_propertySettersForAccountStatementMetadataItem
{
  v3[0] = @"identifier";
  v3[1] = @"originator_altdsid";
  v4[0] = &stru_10064E668;
  v4[1] = &stru_10064E688;
  v3[2] = @"type";
  v3[3] = @"account_event_type";
  v4[2] = &stru_10064E6A8;
  v4[3] = &stru_10064E6C8;
  v3[4] = @"zone_name";
  v3[5] = @"has_been_processed";
  v4[4] = &stru_10064E6E8;
  v4[5] = &stru_10064E708;
  v3[6] = @"processed_attempt_count";
  v3[7] = @"last_processed_date";
  v4[6] = &stru_10064E728;
  v4[7] = &stru_10064E748;
  v3[8] = @"last_report_date";
  v3[9] = @"report_count";
  v4[8] = &stru_10064E768;
  v4[9] = &stru_10064E788;
  v3[10] = @"error";
  v4[10] = &stru_10064E7A8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
}

+ (id)_commonDictionaryForStatementMetadataItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"zone_name");

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"type");

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 accountEventType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"account_event_type");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 originatorAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"originator_altdsid");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 lastReportDate]);
  id v11 = (void *)_SQLValueForDate(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"last_report_date");

  id v12 = [v3 reportCount];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"report_count");

  return v4;
}

@end