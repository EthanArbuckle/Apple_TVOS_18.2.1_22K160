@interface MissingRemoteAssetsItem
+ (id)_predicateForMaximumRetriesCount:(unint64_t)a3;
+ (id)_predicateForUniqueID:(id)a3;
+ (id)_propertySettersForItem;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrReplaceMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4;
+ (id)itemsInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4;
+ (unint64_t)itemsCountInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4;
+ (void)incrementDownloadRetriesCountForUniqueID:(id)a3 inDataBase:(id)a4;
+ (void)removeMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4;
- (id)initMissingRemoteAssetsItemWithUniqueID:(id)a3 inDatabase:(id)a4;
@end

@implementation MissingRemoteAssetsItem

+ (id)insertOrReplaceMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v8)),  "initMissingRemoteAssetsItemWithUniqueID:inDatabase:",  v7,  v6);

  return v9;
}

+ (unint64_t)itemsCountInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMaximumRetriesCount:a4]);
  unint64_t v8 = +[SQLiteEntity countInDatabase:predicate:]( &OBJC_CLASS___MissingRemoteAssetsItem,  "countInDatabase:predicate:",  v6,  v7);

  return v8;
}

+ (id)itemsInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMaximumRetriesCount:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___MissingRemoteAssetsItem,  "queryWithDatabase:predicate:",  v6,  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForItem]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10005E0BC;
  v17[3] = &unk_100639BF0;
  id v20 = a1;
  id v18 = v10;
  id v12 = v7;
  id v19 = v12;
  id v13 = v10;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  id v15 = v12;

  return v15;
}

+ (void)incrementDownloadRetriesCountForUniqueID:(id)a3 inDataBase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE %@ SET %@ = %@ + 1 WHERE %@ = '%@'",  v8,  @"download_retries_count",  @"download_retries_count",  @"unique_id",  v7));

  sub_1002CCA50((BOOL)v6, v9);
}

+ (void)removeMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForUniqueID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (id)initMissingRemoteAssetsItemWithUniqueID:(id)a3 inDatabase:(id)a4
{
  v11 = @"unique_id";
  id v12 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  id v9 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v9;
}

+ (id)databaseTable
{
  return @"missing_remote_assets";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___MissingRemoteAssetsItem, a2) == a3) {
    return @"pid";
  }
  else {
    return 0LL;
  }
}

+ (id)_predicateForMaximumRetriesCount:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"download_retries_count",  v3));

  return v4;
}

+ (id)_predicateForUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"unique_id",  a3);
}

+ (id)_propertySettersForItem
{
  v3[0] = @"unique_id";
  v3[1] = @"download_retries_count";
  v4[0] = &stru_10063D270;
  v4[1] = &stru_10063D290;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end