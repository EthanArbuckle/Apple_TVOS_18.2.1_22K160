@interface PeerPaymentPreferences
+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPreferences;
+ (id)anyInDatabase:(id)a3 forPeerPaymentAccount:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPeferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PeerPaymentPreferences)initWithPeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5;
- (id)_dictionaryForPeerPaymentPreferences:(id)a3 forPeerPaymentAccountPID:(int64_t)a4;
- (id)peerPaymentPreferences;
- (void)updatePeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4;
@end

@implementation PeerPaymentPreferences

+ (id)databaseTable
{
  return @"peer_payment_preferences";
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

+ (id)insertPeerPaymentPeferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPeerPaymentPreferences:v10 forPeerPaymentAccount:v9 inDatabase:v8];

  return v11;
}

- (PeerPaymentPreferences)initWithPeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PeerPaymentPreferences _dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:]( self,  "_dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:",  v9,  [a4 persistentID]));
  id v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  id v12 = -[SQLiteEntity persistentID](v11, "persistentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 restrictions]);
  id v14 =  +[PeerPaymentPreferencesRestriction insertPeerPaymentPeferencesRestrictions:forPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesRestriction,  "insertPeerPaymentPeferencesRestrictions:forPeerPaymentPreferencesPID:inDatabase:",  v13,  v12,  v8);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 notifications]);
  id v16 =  +[PeerPaymentPreferencesNotification insertPeerPaymentPeferencesNotifications:forPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesNotification,  "insertPeerPaymentPeferencesNotifications:forPeerPaymentPreferencesPID:inDatabase:",  v15,  v12,  v8);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 profileAppearance]);
  id v18 =  +[PeerPaymentPreferencesProfileAppearance insertPeerPaymentPreferencesProfileAppearance:forPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesProfileAppearance,  "insertPeerPaymentPreferencesProfileAppearance:forPeerPaymentPreferencesPID:inDatabase:",  v17,  v12,  v8);

  return v11;
}

- (void)updatePeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4
{
  id v6 = a3;
  id v25 = (id)objc_claimAutoreleasedReturnValue( -[PeerPaymentPreferences _dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:]( self,  "_dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:",  v6,  [a4 persistentID]));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v25);
  int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPreferencesRestriction deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesRestriction,  "deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:inDatabase:",  v7,  v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 restrictions]);
  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 =  +[PeerPaymentPreferencesRestriction insertPeerPaymentPeferencesRestrictions:forPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesRestriction,  "insertPeerPaymentPeferencesRestrictions:forPeerPaymentPreferencesPID:inDatabase:",  v9,  v10,  v11);

  int64_t v13 = -[SQLiteEntity persistentID](self, "persistentID");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPreferencesNotification deletePeerPaymentPreferencesNotificationsForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesNotification,  "deletePeerPaymentPreferencesNotificationsForPeerPaymentPreferencesPID:inDatabase:",  v13,  v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 notifications]);
  int64_t v16 = -[SQLiteEntity persistentID](self, "persistentID");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v18 =  +[PeerPaymentPreferencesNotification insertPeerPaymentPeferencesNotifications:forPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesNotification,  "insertPeerPaymentPeferencesNotifications:forPeerPaymentPreferencesPID:inDatabase:",  v15,  v16,  v17);

  int64_t v19 = -[SQLiteEntity persistentID](self, "persistentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPreferencesProfileAppearance deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesProfileAppearance,  "deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:inDatabase:",  v19,  v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 profileAppearance]);
  int64_t v22 = -[SQLiteEntity persistentID](self, "persistentID");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v24 =  +[PeerPaymentPreferencesProfileAppearance insertPeerPaymentPreferencesProfileAppearance:forPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesProfileAppearance,  "insertPeerPaymentPreferencesProfileAppearance:forPeerPaymentPreferencesPID:inDatabase:",  v21,  v22,  v23);
}

+ (id)anyInDatabase:(id)a3 forPeerPaymentAccount:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPeerPaymentAccountPID:", objc_msgSend(a4, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_account_pid",  v3));

  return v4;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPreferencesRestriction deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesRestriction,  "deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:inDatabase:",  v3,  v4);

  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPreferencesNotification deletePeerPaymentPreferencesNotificationsForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesNotification,  "deletePeerPaymentPreferencesNotificationsForPeerPaymentPreferencesPID:inDatabase:",  v5,  v6);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PeerPaymentPreferences;
  return -[SQLiteEntity deleteFromDatabase](&v8, "deleteFromDatabase");
}

- (id)peerPaymentPreferences
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPreferences);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentPreferences");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_1002C0F60;
  id v24 = &unk_100639EE8;
  id v25 = v6;
  objc_super v8 = v3;
  v26 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, &v21);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID", v21, v22, v23, v24);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentPreferencesNotification peerPaymentPeferencesNotificationsForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesNotification,  "peerPaymentPeferencesNotificationsForPeerPaymentPreferencesPID:inDatabase:",  v10,  v11));

  -[PKPeerPaymentPreferences setNotifications:](v8, "setNotifications:", v12);
  int64_t v13 = -[SQLiteEntity persistentID](self, "persistentID");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentPreferencesRestriction peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesRestriction,  "peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:inDatabase:",  v13,  v14));

  -[PKPeerPaymentPreferences setRestrictions:](v8, "setRestrictions:", v15);
  int64_t v16 = -[SQLiteEntity persistentID](self, "persistentID");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentPreferencesProfileAppearance peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPreferencesProfileAppearance,  "peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:inDatabase:",  v16,  v17));

  -[PKPeerPaymentPreferences setProfileAppearance:](v8, "setProfileAppearance:", v18);
  int64_t v19 = v8;

  return v19;
}

- (id)_dictionaryForPeerPaymentPreferences:(id)a3 forPeerPaymentAccountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v7, @"peer_payment_account_pid");

  -[NSMutableDictionary setBool:forKey:]( v6,  "setBool:forKey:",  [v5 requiresConfirmation],  @"requires_confirmation");
  -[NSMutableDictionary setBool:forKey:]( v6,  "setBool:forKey:",  [v5 canReceiveFormalPaymentRequests],  @"can_receive_formal_payment_requests");
  -[NSMutableDictionary setBool:forKey:](v6, "setBool:forKey:", [v5 isDirty], @"dirty");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lastUpdated]);

  id v9 = (void *)_SQLValueForDate(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v9, @"last_updated_date");

  return v6;
}

+ (id)_propertySettersForPeerPaymentPreferences
{
  v3[0] = @"requires_confirmation";
  v3[1] = @"can_receive_formal_payment_requests";
  v4[0] = &stru_100652FA0;
  v4[1] = &stru_100652FC0;
  v3[2] = @"dirty";
  v3[3] = @"last_updated_date";
  v4[2] = &stru_100652FE0;
  v4[3] = &stru_100653000;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end