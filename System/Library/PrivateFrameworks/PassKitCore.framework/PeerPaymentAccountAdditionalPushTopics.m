@interface PeerPaymentAccountAdditionalPushTopics
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccountAdditionalPushTopics;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentAccountAdditionalPushTopics)initWithPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForPushTopics:(id)a3;
- (id)peerPaymentAccountAdditionalPushTopics;
- (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3;
@end

@implementation PeerPaymentAccountAdditionalPushTopics

+ (id)databaseTable
{
  return @"peer_payment_account_additional_push_topics";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentAccount, a2) == a3) {
    return @"peer_payment_account_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)peerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peerPaymentAccountAdditionalPushTopics]);
  return v9;
}

- (PeerPaymentAccountAdditionalPushTopics)initWithPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PeerPaymentAccountAdditionalPushTopics _commonDictionaryForPushTopics:]( self,  "_commonDictionaryForPushTopics:",  a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v9 setObjectOrNull:v10 forKey:@"peer_payment_account_pid"];

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);
  return v11;
}

+ (id)insertPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentAccountAdditionalPushTopics:v9 forPeerPaymentAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updatePeerPaymentAccountAdditionalPushTopics:v12];
  }
  else {
    id v11 =  +[PeerPaymentAccountAdditionalPushTopics insertPeerPaymentAccountAdditionalPushTopics:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountAdditionalPushTopics,  "insertPeerPaymentAccountAdditionalPushTopics:forPeerPaymentAccountPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[PeerPaymentAccountAdditionalPushTopics _commonDictionaryForPushTopics:]( self,  "_commonDictionaryForPushTopics:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_account_pid",  v3));

  return v4;
}

- (id)_commonDictionaryForPushTopics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 preferences]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"preferences");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedAccounts]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"associated_accounts");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"requests");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 endpoint]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"endpoint");

  return v4;
}

+ (id)_propertySettersForPeerPaymentAccountAdditionalPushTopics
{
  v3[0] = @"preferences";
  v3[1] = @"associated_accounts";
  v4[0] = &stru_1006509D8;
  v4[1] = &stru_1006509F8;
  v3[2] = @"requests";
  v3[3] = @"endpoint";
  v4[2] = &stru_100650A18;
  v4[3] = &stru_100650A38;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

- (id)peerPaymentAccountAdditionalPushTopics
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAdditionalPushTopics);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentAccountAdditionalPushTopics");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10026F808;
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