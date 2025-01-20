@interface AccountStatementMetadata
+ (id)_commonDictionaryForStatementMetadata:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForStatementIdentifier:(id)a3;
+ (id)_predicateForStatementIdentifier:(id)a3 accountIdentifier:(id)a4;
+ (id)_propertySettersForAccountStatementTransactionMetadata;
+ (id)_statementMetadataWithQuery:(id)a3;
+ (id)accountStatementMetadataForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 forPID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 forStatementIdentifier:(id)a4 accountIdentifier:(id)a5;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountStatementMetadata:(id)a3 inDatabase:(id)a4;
+ (id)latestStatementIdentifierThatNeedsMetadataProcessingForAccountIdentifier:(id)a3 tableName:(id)a4 statementIdentifierColumn:(id)a5 accountIdentifierColumn:(id)a6 openingDateColumn:(id)a7 maxProcessedAttemptCount:(int64_t)a8 inDatabase:(id)a9;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)openingDate:(id *)a3 closingDate:(id *)a4 statementIdentifier:(id)a5 accountIdentifier:(id)a6 accountType:(unint64_t)a7 inDatabase:(id)a8;
- (AccountStatementMetadata)initWithStatementMetadata:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)accountStatementMetadata;
- (id)statementIdentifier;
- (int64_t)reportCount;
- (unint64_t)accountType;
- (void)markStatementMetadataItems:(id)a3 processed:(BOOL)a4 error:(unint64_t)a5;
- (void)updateWithAccountStatementMetadata:(id)a3;
- (void)updateWithReport:(id)a3 reportDate:(id)a4;
@end

@implementation AccountStatementMetadata

+ (id)databaseTable
{
  return @"account_statement_metadata";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pears.c"
    || v7 && (unsigned int v8 = [@"pears.c" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.a = account_statement_metadata.account_identifier"];
  }
}

- (AccountStatementMetadata)initWithStatementMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_commonDictionaryForStatementMetadata:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
}

+ (id)insertOrUpdateAccountStatementMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 statementIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v7 forStatementIdentifier:v8 accountIdentifier:v9]);

  if (v10) {
    [v10 updateWithAccountStatementMetadata:v6];
  }
  else {
    id v10 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v11)), "initWithStatementMetadata:inDatabase:", v6, v7);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10010A2D4;
  v18[3] = &unk_10063FDF8;
  id v12 = v10;
  id v19 = v12;
  id v20 = v6;
  id v21 = v7;
  id v22 = a1;
  id v13 = v7;
  id v14 = v6;
  sub_1002CCC5C((uint64_t)v13, v18);
  v15 = v21;
  id v16 = v12;

  return v16;
}

+ (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementIdentifier:a3 accountIdentifier:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v10]);

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountStatementMetadataItem deleteAccountStatementMetadataItemsForStatementMetadataPID:inDatabase:]( &OBJC_CLASS___AccountStatementMetadataItem,  "deleteAccountStatementMetadataItemsForStatementMetadataPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AccountStatementMetadata;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)anyInDatabase:(id)a3 forStatementIdentifier:(id)a4 accountIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementIdentifier:a4 accountIdentifier:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)anyInDatabase:(id)a3 forPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)accountStatementMetadataForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _statementMetadataWithQuery:v8]);
  return v9;
}

+ (id)_statementMetadataWithQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10010A780;
  id v10 = &unk_10063BCB0;
  id v11 = a3;
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = v3;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  if (-[NSMutableArray count](v3, "count", v7, v8, v9, v10)) {
    id v5 = -[NSMutableArray copy](v3, "copy");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)latestStatementIdentifierThatNeedsMetadataProcessingForAccountIdentifier:(id)a3 tableName:(id)a4 statementIdentifierColumn:(id)a5 accountIdentifierColumn:(id)a6 openingDateColumn:(id)a7 maxProcessedAttemptCount:(int64_t)a8 inDatabase:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = objc_alloc_init(&OBJC_CLASS___PDSQLiteDatabaseBinding);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    SELECT DISTINCT        %@ AS statement_identifier    FROM        %@    LEFT JOIN       account_statement_metadata       ON account_statement_metadata.statement_identifier = %@       AND account_statement_metadata.account_identifier = ?       AND account_statement_metadata.account_identifier = %@    LEFT JOIN       account_statement_metadata_item       ON account_statement_metadata_item.account_statement_metadata_pid = account_statement_metadata.pid    WHERE        account_statement_metadata.statement_identifier IS NULL        OR account_statement_metadata_item.has_been_processed = 0        OR account_statement_metadata_item.has_been_processed IS NULL        AND       (           account_statement_metadata_item.processed_attempt_count < ?            OR account_statement_metadata_item.processed_attempt_count IS NULL       )        AND       (           account_statement_metadata.has_been_processed = 0            OR account_statement_metadata.has_been_processed IS NULL       )    ORDER BY %@ DESC    LIMIT 1    ",  v16,  v15,  v16,  v17,  v18));
  -[PDSQLiteDatabaseBinding addTextBinding:](v20, "addTextBinding:", v14);
  -[PDSQLiteDatabaseBinding addIntBinding:](v20, "addIntBinding:", a8);
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_10010A9E8;
  v36 = sub_10010A9F8;
  id v37 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10010AA00;
  v27[3] = &unk_1006445C0;
  id v22 = v19;
  id v28 = v22;
  id v23 = v21;
  id v29 = v23;
  v24 = v20;
  v30 = v24;
  v31 = &v32;
  sub_1002CCC5C((uint64_t)v22, v27);
  id v25 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v25;
}

- (void)updateWithAccountStatementMetadata:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForStatementMetadata:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

- (void)markStatementMetadataItems:(id)a3 processed:(BOOL)a4 error:(unint64_t)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010ABFC;
  v9[3] = &unk_1006445E8;
  id v10 = self;
  id v11 = a3;
  BOOL v14 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v10, "database"));
  unint64_t v13 = a5;
  id v7 = v12;
  id v8 = v11;
  sub_1002CCC5C((uint64_t)v7, v9);
}

- (void)updateWithReport:(id)a3 reportDate:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010AD64;
  v10[3] = &unk_10063E468;
  v10[4] = self;
  id v11 = a4;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v7 = v13;
  id v8 = v6;
  id v9 = v11;
  sub_1002CCC5C((uint64_t)v7, v10);
}

- (id)accountStatementMetadata
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "_propertySettersForAccountStatementTransactionMetadata");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___PKAccountStatementMetadata);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010AF6C;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v4;
  id v7 = v5;
  id v17 = v7;
  id v8 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v6, v15);

  int64_t v9 = -[SQLiteEntity persistentID](self, "persistentID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AccountStatementMetadataItem accountStatementMetadataItemsForStatementMetadataPID:inDatabase:]( &OBJC_CLASS___AccountStatementMetadataItem,  "accountStatementMetadataItemsForStatementMetadataPID:inDatabase:",  v9,  v10));
  -[PKAccountStatementMetadata setItems:](v7, "setItems:", v11);

  id v12 = v17;
  id v13 = v7;

  return v13;
}

- (unint64_t)accountType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pears.c"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)statementIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"statement_identifier");
}

- (id)accountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"account_identifier");
}

- (int64_t)reportCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"report_count"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (void)openingDate:(id *)a3 closingDate:(id *)a4 statementIdentifier:(id)a5 accountIdentifier:(id)a6 accountType:(unint64_t)a7 inDatabase:(id)a8
{
  id v19 = a5;
  id v13 = a6;
  id v14 = a8;
  if (a7 == 4)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SavingsAccountStatement anyInDatabase:withStatementIdentifier:accountIdentifier:]( &OBJC_CLASS___SavingsAccountStatement,  "anyInDatabase:withStatementIdentifier:accountIdentifier:",  v14,  v19,  v13));
LABEL_5:
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 openingDate]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 closingDate]);

    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (a7 == 1)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountStatement creditAccountStatementWithIdentifier:inDatabase:]( &OBJC_CLASS___CreditAccountStatement,  "creditAccountStatementWithIdentifier:inDatabase:",  v19,  v14));
    goto LABEL_5;
  }

  id v18 = 0LL;
  id v17 = 0LL;
  if (a3) {
LABEL_6:
  }
    *a3 = v17;
LABEL_7:
  if (a4) {
    *a4 = v18;
  }
}

+ (id)_predicateForStatementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"statement_identifier",  a3);
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_identifier",  a3);
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForStatementIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a4]);
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStatementIdentifier:v6]);

  v12[1] = v8;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_propertySettersForAccountStatementTransactionMetadata
{
  v3[0] = @"statement_identifier";
  v3[1] = @"account_identifier";
  v4[0] = &stru_100644628;
  v4[1] = &stru_100644648;
  v3[2] = @"opening_date";
  v3[3] = @"closing_date";
  v4[2] = &stru_100644668;
  v4[3] = &stru_100644688;
  v3[4] = @"has_been_processed";
  v3[5] = @"last_report_date";
  v4[4] = &stru_1006446A8;
  v4[5] = &stru_1006446C8;
  v3[6] = @"report_count";
  v3[7] = @"pears.c";
  v4[6] = &stru_1006446E8;
  v4[7] = &stru_100644708;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)_commonDictionaryForStatementMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"account_identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 statementIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"statement_identifier");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastReportDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"last_report_date");

  id v9 = [v3 reportCount];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"report_count");

  return v4;
}

@end