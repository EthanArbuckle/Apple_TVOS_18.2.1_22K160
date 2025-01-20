@interface PeerPaymentEncryptionCertificate
+ (id)_commonDictionaryForPeerPaymentEncryptionCertificate:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForDestination:(unint64_t)a3;
+ (id)_propertySettersForPeerPaymentEncryptionCertificate;
+ (id)databaseTable;
+ (id)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 inDatabase:(id)a4;
+ (void)deleteEncryptionCertificatesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentEncryptionCertificate)initWithPeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentEncryptionCertificate;
- (void)updateWithPeerPaymentEncryptionCertificate:(id)a3;
@end

@implementation PeerPaymentEncryptionCertificate

+ (id)databaseTable
{
  return @"cinnamon";
}

- (PeerPaymentEncryptionCertificate)initWithPeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForPeerPaymentEncryptionCertificate:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (void)insertOrUpdatePeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v16[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForDestination:", objc_msgSend(v8, "destination")));
  v16[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v13]);
  if (v14)
  {
    id v15 = v14;
    [v14 updateWithPeerPaymentEncryptionCertificate:v8];
  }

  else
  {
    id v15 = [objc_alloc((Class)a1) initWithPeerPaymentEncryptionCertificate:v8 forPeerPaymentAccountPID:a4 inDatabase:v9];
  }
}

- (void)updateWithPeerPaymentEncryptionCertificate:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForPeerPaymentEncryptionCertificate:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (void)deleteEncryptionCertificatesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDestination:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peerPaymentEncryptionCertificate]);
  return v9;
}

- (id)peerPaymentEncryptionCertificate
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentEncryptionCertificate);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentEncryptionCertificate");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10017B9A4;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForDestination:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_propertySettersForPeerPaymentEncryptionCertificate
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100647AC8;
  v4[1] = &stru_100647AE8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100647B08;
  v4[3] = &stru_100647B28;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (id)_commonDictionaryForPeerPaymentEncryptionCertificate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 destination]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 encryptionScheme]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 certificatesVersion]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 encryptionCertificates]);
  id v9 = _SQLValueForEncryptionCertificates(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

  return v4;
}

@end