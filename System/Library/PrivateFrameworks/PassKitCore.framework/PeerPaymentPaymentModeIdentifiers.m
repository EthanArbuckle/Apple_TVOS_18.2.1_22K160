@interface PeerPaymentPaymentModeIdentifiers
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPaymentModeIdentifiers;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentPaymentModeIdentifiers)initWithPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForPaymentModeIdentifiers:(id)a3;
- (id)peerPaymentPaymentModeIdentifiers;
- (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3;
@end

@implementation PeerPaymentPaymentModeIdentifiers

+ (id)databaseTable
{
  return @"nutmeg";
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

+ (id)peerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peerPaymentPaymentModeIdentifiers]);
  return v9;
}

- (PeerPaymentPaymentModeIdentifiers)initWithPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PeerPaymentPaymentModeIdentifiers _commonDictionaryForPaymentModeIdentifiers:]( self,  "_commonDictionaryForPaymentModeIdentifiers:",  a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v9 setObjectOrNull:v10 forKey:@"a"];

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);
  return v11;
}

+ (id)insertPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentPaymentModeIdentifiers:v9 forPeerPaymentAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updatePeerPaymentPaymentModeIdentifiers:v12];
  }
  else {
    id v11 =  +[PeerPaymentPaymentModeIdentifiers insertPeerPaymentPaymentModeIdentifiers:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPaymentModeIdentifiers,  "insertPeerPaymentPaymentModeIdentifiers:forPeerPaymentAccountPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[PeerPaymentPaymentModeIdentifiers _commonDictionaryForPaymentModeIdentifiers:]( self,  "_commonDictionaryForPaymentModeIdentifiers:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

- (id)_commonDictionaryForPaymentModeIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceTap]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");
  return v4;
}

+ (id)_propertySettersForPeerPaymentPaymentModeIdentifiers
{
  id v3 = @"b";
  id v4 = &stru_100643BD0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)peerPaymentPaymentModeIdentifiers
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPaymentModeIdentifiers);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentPaymentModeIdentifiers");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F29F8;
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