@interface PeerPaymentEncryptionCertificatesVersions
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForEncryptionCertificatesVersions;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentEncryptionCertificatesVersions)initWithPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForEncryptionCertificatesVersions:(id)a3;
- (id)peerPaymentEncryptionCertificatesVersions;
- (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3;
@end

@implementation PeerPaymentEncryptionCertificatesVersions

+ (id)databaseTable
{
  return @"allspice";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentAccount, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)peerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peerPaymentEncryptionCertificatesVersions]);
  return v9;
}

- (PeerPaymentEncryptionCertificatesVersions)initWithPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PeerPaymentEncryptionCertificatesVersions _commonDictionaryForEncryptionCertificatesVersions:]( self,  "_commonDictionaryForEncryptionCertificatesVersions:",  a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v9 setObjectOrNull:v10 forKey:@"a"];

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);
  return v11;
}

+ (id)insertPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentEncryptionCertificatesVersions:v9 forPeerPaymentAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updatePeerPaymentEncryptionCertificatesVersions:v12];
  }
  else {
    id v11 =  +[PeerPaymentEncryptionCertificatesVersions insertPeerPaymentEncryptionCertificatesVersions:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificatesVersions,  "insertPeerPaymentEncryptionCertificatesVersions:forPeerPaymentAccountPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[PeerPaymentEncryptionCertificatesVersions _commonDictionaryForEncryptionCertificatesVersions:]( self,  "_commonDictionaryForEncryptionCertificatesVersions:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

- (id)_commonDictionaryForEncryptionCertificatesVersions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = [v3 recipientData];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  return v4;
}

+ (id)_propertySettersForEncryptionCertificatesVersions
{
  id v3 = @"b";
  id v4 = &stru_100642008;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)peerPaymentEncryptionCertificatesVersions
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentEncryptionCertificatesVersions);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForEncryptionCertificatesVersions");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000D90E8;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

@end