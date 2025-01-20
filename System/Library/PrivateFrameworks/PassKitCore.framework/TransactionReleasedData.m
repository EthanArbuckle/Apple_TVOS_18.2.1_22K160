@interface TransactionReleasedData
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_propertySettersForReleasedData;
+ (id)databaseTable;
+ (id)releasedDataForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertReleasedData:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)releasedData;
@end

@implementation TransactionReleasedData

+ (id)databaseTable
{
  return @"honey";
}

+ (void)insertReleasedData:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [a1 deleteEntitiesForPaymentTransactionPID:a4 inDatabase:v8];
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v10, @"a");

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 documentType]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v11, @"document_type");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 privacyPolicyURL]);
  v13 = (void *)_SQLValueForURL(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v13, @"b");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 certificateData]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v14, @"c");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 merchantNameOverride]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v15, @"d");

  id v16 = [objc_alloc((Class)a1) initWithPropertyValues:v19 inDatabase:v8];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 elements]);
  +[TransactionReleasedDataElement insertReleasedDataElements:forPID:inDatabase:]( TransactionReleasedDataElement,  "insertReleasedDataElements:forPID:inDatabase:",  v17,  [v16 persistentID],  v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 application]);
  +[TransactionReleasedDataApplication insertReleasedDataApplication:forPID:inDatabase:]( TransactionReleasedDataApplication,  "insertReleasedDataApplication:forPID:inDatabase:",  v18,  [v16 persistentID],  v8);
}

+ (id)releasedDataForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 releasedData]);
  return v9;
}

- (id)releasedData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"document_type"));
  if (v3)
  {
    v4 = -[PKTransactionReleasedData initWithDocumentType:]( objc_alloc(&OBJC_CLASS___PKTransactionReleasedData),  "initWithDocumentType:",  v3);
    id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertySettersForReleasedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000ACCC;
    v17[3] = &unk_100638EF0;
    v17[4] = self;
    id v18 = v7;
    id v9 = v4;
    v19 = v9;
    id v10 = v7;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v8, v17);

    int64_t v11 = -[SQLiteEntity persistentID](self, "persistentID");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionReleasedDataElement releasedDataElementsForPID:inDatabase:]( &OBJC_CLASS___TransactionReleasedDataElement,  "releasedDataElementsForPID:inDatabase:",  v11,  v12));
    -[PKTransactionReleasedData setElements:](v9, "setElements:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionReleasedDataApplication releasedDataElementsForPID:inDatabase:]( &OBJC_CLASS___TransactionReleasedDataApplication,  "releasedDataElementsForPID:inDatabase:",  v11,  v12));
    -[PKTransactionReleasedData setApplication:](v9, "setApplication:", v14);
    v15 = v9;
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  +[TransactionReleasedDataElement deleteEntitiesForPID:inDatabase:]( TransactionReleasedDataElement,  "deleteEntitiesForPID:inDatabase:",  [v8 persistentID],  v6);
  +[TransactionReleasedDataApplication deleteEntitiesForPID:inDatabase:]( TransactionReleasedDataApplication,  "deleteEntitiesForPID:inDatabase:",  [v8 persistentID],  v6);

  [v8 deleteFromDatabase];
}

+ (id)_propertySettersForReleasedData
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_1006394A0;
  v4[1] = &stru_1006394C0;
  v3[2] = @"d";
  v4[2] = &stru_1006394E0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

@end