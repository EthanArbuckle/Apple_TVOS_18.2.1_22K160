@interface PeerPaymentPreferencesProfileAppearance
+ (id)_peerPaymentProfileAppearanceWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPreferencesProfileAppearance;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentPreferencesProfileAppearance)initWithPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentPreferencesProfileAppearance;
@end

@implementation PeerPaymentPreferencesProfileAppearance

+ (id)databaseTable
{
  return @"paprika";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentPreferences, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)insertPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentPreferencesProfileAppearance:v9 forPeerPaymentPreferencesPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPreferencesPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPreferencesPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentProfileAppearanceWithQuery:v8]);
  return v9;
}

- (PeerPaymentPreferencesProfileAppearance)initWithPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"a");

  -[NSMutableDictionary setBool:forKey:](v10, "setBool:forKey:", [v9 shareLastName], @"b");
  id v12 = [v9 shareProfilePicture];

  -[NSMutableDictionary setBool:forKey:](v10, "setBool:forKey:", v12, @"c");
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  return v13;
}

+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

- (id)peerPaymentPreferencesProfileAppearance
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPreferencesProfileAppearance);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentPreferencesProfileAppearance");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100395A98;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)_peerPaymentProfileAppearanceWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPeerPaymentPreferencesProfileAppearance]);
  id v6 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPreferencesProfileAppearance);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100395BE0;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[PKPeerPaymentPreferencesProfileAppearance copy](v8, "copy");
  return v10;
}

+ (id)_propertySettersForPeerPaymentPreferencesProfileAppearance
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100659A30;
  v4[1] = &stru_100659A50;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end