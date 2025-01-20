@interface NFC
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForNFC;
+ (id)_propertyValuesForNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5;
+ (id)anyInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateNFCPayload:(id)a3 forPass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6;
- (NFC)initWithNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6;
- (id)nfcPayload;
- (void)updateNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5;
@end

@implementation NFC

+ (id)databaseTable
{
  return @"nfc";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  else {
    return 0LL;
  }
}

- (NFC)initWithNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = objc_msgSend( (id)objc_opt_class(self, v13),  "_propertyValuesForNFCPayload:pass:computedPayloadState:",  v12,  v11,  a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v15, v10);
  return v16;
}

+ (void)insertOrUpdateNFCPayload:(id)a3 forPass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "anyInDatabase:forPassPID:", v11, objc_msgSend(v10, "persistentID")));
  uint64_t v13 = v12;
  if (v12) {
    [v12 updateNFCPayload:v14 pass:v10 computedPayloadState:a5];
  }
  else {
}
  }

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPass:(id)a3
{
  return objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID"));
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (id)nfcPayload
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKNFCPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFC _propertySettersForNFC](&OBJC_CLASS___NFC, "_propertySettersForNFC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002D83C0;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  uint64_t v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  v9 = v6;

  return v9;
}

- (void)updateNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = objc_msgSend( (id)objc_opt_class(self, v10),  "_propertyValuesForNFCPayload:pass:computedPayloadState:",  v9,  v8,  a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue(v11);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v12);
}

+ (id)_propertyValuesForNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 message]);
  [v9 setObjectOrNull:v10 forKey:@"message"];

  id v11 = [v8 persistentID];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
  [v9 setObject:v12 forKey:@"pass_pid"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptionPublicKeyData]);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptionPublicKeyData]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hexEncoding]);
    [v9 setObject:v15 forKey:@"encryption_public_key"];
  }

  objc_msgSend(v9, "setBool:forKey:", objc_msgSend(v7, "requiresAuthentication"), @"requires_authentication");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  [v9 setObject:v16 forKey:@"a"];

  id v17 = [v9 copy];
  return v17;
}

+ (id)_propertySettersForNFC
{
  v3[0] = @"message";
  v3[1] = @"encryption_public_key";
  v4[0] = &stru_100653F10;
  v4[1] = &stru_100653F30;
  v3[2] = @"requires_authentication";
  v3[3] = @"a";
  v4[2] = &stru_100653F50;
  v4[3] = &stru_100653F70;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end