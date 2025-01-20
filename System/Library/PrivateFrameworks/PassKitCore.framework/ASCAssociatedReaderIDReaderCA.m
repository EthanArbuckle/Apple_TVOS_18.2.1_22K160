@interface ASCAssociatedReaderIDReaderCA
+ (id)_objectsWithQuery:(id)a3;
+ (id)_predicateForAssociatedReaderIDPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)associatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAssociatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedReaderIDReaderCA:(id)a3 associatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5;
- (ASCAssociatedReaderIDReaderCA)initWithObject:(id)a3 forAssociatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5;
- (id)associatedReaderID;
- (void)updateWithObject:(id)a3;
@end

@implementation ASCAssociatedReaderIDReaderCA

- (ASCAssociatedReaderIDReaderCA)initWithObject:(id)a3 forAssociatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesFor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"associated_reader_id_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesFor:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)databaseTable
{
  return @"associated_reader_id_reader_ca";
}

+ (id)associatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedReaderIDPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _objectsWithQuery:v8]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);

  return v10;
}

+ (void)deleteAssociatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedReaderIDPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)insertOrUpdateAssociatedReaderIDReaderCA:(id)a3 associatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedReaderIDPID:a4]);
  v14 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  v13 = (ASCAssociatedReaderIDReaderCA *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v12]);

  if (v13) {
    -[ASCAssociatedReaderIDReaderCA updateWithObject:](v13, "updateWithObject:", v8);
  }
  else {
    v13 = -[ASCAssociatedReaderIDReaderCA initWithObject:forAssociatedReaderIDPID:inDatabase:]( objc_alloc(&OBJC_CLASS___ASCAssociatedReaderIDReaderCA),  "initWithObject:forAssociatedReaderIDPID:inDatabase:",  v8,  a4,  v9);
  }
}

+ (id)_objectsWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10016794C;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

- (id)associatedReaderID
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKASCAssociatedReaderIDReaderCA);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100167AA0;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForAssociatedReaderIDPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"associated_reader_id_pid",  v3));

  return v4;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 publicKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"public_key");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 attestation]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"attestation");

  return v4;
}

+ (id)_propertySetters
{
  v3[0] = @"public_key";
  v3[1] = @"attestation";
  v4[0] = &stru_100646FF0;
  v4[1] = &stru_100647010;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end