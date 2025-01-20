@interface AccountEnhancedMerchantProgramIdentifier
+ (id)_accountEnhancedMerchantProgramIdentifiersWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_insertEnhancedMerchantProgramIdentifier:(id)a3 forEnhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForEnhancedMerchantPID:(int64_t)a3;
+ (id)_propertyValuesForProgramIdentifier:(id)a3 enhancedMerchantPID:(int64_t)a4;
+ (id)accountEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateEnhancedMerchantProgramIdentifiers:(id)a3 enhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountEnhancedMerchantProgramIdentifier)initWithProgramIdentifier:(id)a3 forEnhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation AccountEnhancedMerchantProgramIdentifier

+ (id)databaseTable
{
  return @"mirabelle";
}

- (AccountEnhancedMerchantProgramIdentifier)initWithProgramIdentifier:(id)a3 forEnhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AccountEnhancedMerchantProgramIdentifier _propertyValuesForProgramIdentifier:enhancedMerchantPID:]( &OBJC_CLASS___AccountEnhancedMerchantProgramIdentifier,  "_propertyValuesForProgramIdentifier:enhancedMerchantPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)accountEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEnhancedMerchantPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountEnhancedMerchantProgramIdentifiersWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)_accountEnhancedMerchantProgramIdentifiersWithPredicate:(id)a3 inDatabase:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a4 predicate:a3]);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v12 = @"b";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001D0438;
  v10[3] = &unk_10063C0D0;
  v11 = v5;
  v7 = v5;
  [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v10];

  id v8 = -[NSMutableSet copy](v7, "copy");
  return v8;
}

+ (void)insertOrUpdateEnhancedMerchantProgramIdentifiers:(id)a3 enhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:a4 inDatabase:v9];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 =  objc_msgSend( a1,  "_insertEnhancedMerchantProgramIdentifier:forEnhancedMerchantPID:inDatabase:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)v14),  a4,  v9,  (void)v16);
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

+ (id)_insertEnhancedMerchantProgramIdentifier:(id)a3 forEnhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithProgramIdentifier:v9 forEnhancedMerchantPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForEnhancedMerchantPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForEnhancedMerchantPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForProgramIdentifier:(id)a3 enhancedMerchantPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  [v6 setObjectOrNull:v5 forKey:@"b"];
  id v8 = [v6 copy];

  return v8;
}

@end