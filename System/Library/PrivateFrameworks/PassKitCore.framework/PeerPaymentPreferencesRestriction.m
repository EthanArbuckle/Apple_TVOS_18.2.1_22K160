@interface PeerPaymentPreferencesRestriction
+ (id)_peerPaymentPreferencesRestrictionsWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPreferencesRestriction;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPeferencesRestrictions:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentPreferencesRestriction)initWithPeerPaymentPreferencesRestriction:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentPreferencesRestriction;
@end

@implementation PeerPaymentPreferencesRestriction

+ (id)databaseTable
{
  return @"peer_payment_preferences_restriction";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentPreferences, a2) == a3) {
    return @"peer_payment_preferences_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertPeerPaymentPeferencesRestrictions:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v15);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend( v17,  "initWithPeerPaymentPreferencesRestriction:forPeerPaymentPreferencesPID:inDatabase:",  v16,  a4,  v9,  (void)v21);
        if (v18) {
          -[NSMutableSet addObject:](v10, "addObject:", v18);
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  id v19 = -[NSMutableSet copy](v10, "copy");
  return v19;
}

+ (void)deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPreferencesPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPreferencesPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentPreferencesRestrictionsWithQuery:v8]);
  return v9;
}

- (PeerPaymentPreferencesRestriction)initWithPeerPaymentPreferencesRestriction:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:]( v10,  "setObjectOrNull:forKey:",  v11,  @"peer_payment_preferences_pid");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v12, @"alt_dsid");

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 sendRestrictionType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v13, @"restriction_type");

  id v14 = [v9 receiveRestrictionType];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v15, @"a");

  uint64_t v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v16;
}

+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_preferences_pid",  v3));

  return v4;
}

- (id)peerPaymentPreferencesRestriction
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPreferencesRestriction);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentPreferencesRestriction");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002E612C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_peerPaymentPreferencesRestrictionsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPeerPaymentPreferencesRestriction]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002E6274;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[NSMutableSet copy](v8, "copy");
  return v10;
}

+ (id)_propertySettersForPeerPaymentPreferencesRestriction
{
  v3[0] = @"alt_dsid";
  v3[1] = @"restriction_type";
  v4[0] = &stru_1006546A8;
  v4[1] = &stru_1006546C8;
  v3[2] = @"a";
  v4[2] = &stru_1006546E8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end