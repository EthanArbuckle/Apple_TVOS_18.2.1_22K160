@interface AccountEnhancedMerchant
+ (id)_anyInDatabase:(id)a3 withPrivateIdentifier:(id)a4 accountPID:(int64_t)a5;
+ (id)_enhancedMerchantsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_insertAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForPrivateIdentifier:(id)a3;
+ (id)_predicateForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4;
+ (id)_propertySettersForAccountEnhancedMerchant;
+ (id)_propertyValuesForEnhancedMerchant:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountEnhancedMerchantForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)populateAssociatedProgramIdentifiersForEnhancedMerchant:(id)a3 enhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountEnhancedMerchant)initWithAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountEnhancedMerchant;
- (void)_updateWithAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4;
- (void)updateWithEnhancedMerchantProgramIdentifiers:(id)a3;
@end

@implementation AccountEnhancedMerchant

+ (id)databaseTable
{
  return @"quince";
}

- (AccountEnhancedMerchant)initWithAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[AccountEnhancedMerchant _propertyValuesForEnhancedMerchant:accountPID:]( &OBJC_CLASS___AccountEnhancedMerchant,  "_propertyValuesForEnhancedMerchant:accountPID:",  v9,  a4));
  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 enhancedRewardsProgramIdentifiers]);

  -[AccountEnhancedMerchant updateWithEnhancedMerchantProgramIdentifiers:]( v12,  "updateWithEnhancedMerchantProgramIdentifiers:",  v13);
  return v12;
}

+ (id)accountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _enhancedMerchantsWithPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)_enhancedMerchantsWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _queryForPredicate:a3 database:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountEnhancedMerchant]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_10024AAD8;
  v19 = &unk_100638F18;
  id v20 = v8;
  id v21 = v6;
  id v22 = v9;
  id v23 = a1;
  id v11 = v9;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  id v14 = objc_msgSend(v11, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)_anyInDatabase:(id)a3 withPrivateIdentifier:(id)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPrivateIdentifier:a4 accountPID:a5]);
  if (v9) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);
  }
  else {
    v10 = 0LL;
  }

  return v10;
}

+ (id)accountEnhancedMerchantForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:a5 withPrivateIdentifier:a3 accountPID:a4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountEnhancedMerchant]);

  return v6;
}

+ (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteAccountEnhancedMerchantsForAccountPID:a4 inDatabase:v9];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend( a1,  "insertOrUpdateAccountEnhancedMerchant:accountPID:inDatabase:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v14),  a4,  v9,  (void)v15);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

+ (void)insertOrUpdateAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 privateIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:v8 withPrivateIdentifier:v9 accountPID:a4]);

  if (v10) {
    [v10 _updateWithAccountEnhancedMerchant:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountEnhancedMerchant:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountEnhancedMerchant:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 privateIdentifier]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _anyInDatabase:v8 withPrivateIdentifier:v9 accountPID:a4]);

  [v10 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountEnhancedMerchantProgramIdentifier deleteEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:inDatabase:]( &OBJC_CLASS___AccountEnhancedMerchantProgramIdentifier,  "deleteEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AccountEnhancedMerchant;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

- (void)_updateWithAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[AccountEnhancedMerchant _propertyValuesForEnhancedMerchant:accountPID:]( &OBJC_CLASS___AccountEnhancedMerchant,  "_propertyValuesForEnhancedMerchant:accountPID:",  v6,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 enhancedRewardsProgramIdentifiers]);

  -[AccountEnhancedMerchant updateWithEnhancedMerchantProgramIdentifiers:]( self,  "updateWithEnhancedMerchantProgramIdentifiers:",  v7);
}

+ (id)_predicateForPrivateIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3));
  }
  else {
    return 0LL;
  }
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPrivateIdentifier:a3]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v8 = (void *)v7;
  id v9 = 0LL;
  if (v6 && v7)
  {
    v12[0] = v6;
    v12[1] = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
  }

  return v9;
}

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  uint64_t v13 = @"c";
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v12 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  return v10;
}

+ (id)_propertySettersForAccountEnhancedMerchant
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064F0F8;
  v4[1] = &stru_10064F118;
  v3[2] = @"d";
  v3[3] = @"ea";
  v4[2] = &stru_10064F138;
  v4[3] = &stru_10064F158;
  v3[4] = @"eb";
  v3[5] = @"f";
  v4[4] = &stru_10064F178;
  v4[5] = &stru_10064F198;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_10064F1B8;
  v4[7] = &stru_10064F1D8;
  v3[8] = @"i";
  v3[9] = @"j";
  v4[8] = &stru_10064F1F8;
  v4[9] = &stru_10064F218;
  v3[10] = @"k";
  v3[11] = @"l";
  v4[10] = &stru_10064F238;
  v4[11] = &stru_10064F258;
  v3[12] = @"ma";
  v3[13] = @"mb";
  v4[12] = &stru_10064F278;
  v4[13] = &stru_10064F298;
  v3[14] = @"n";
  v3[15] = @"o";
  v4[14] = &stru_10064F2B8;
  v4[15] = &stru_10064F2D8;
  v3[16] = @"p";
  v3[17] = @"q";
  v4[16] = &stru_10064F2F8;
  v4[17] = &stru_10064F318;
  v3[18] = @"r";
  v3[19] = @"s";
  v4[18] = &stru_10064F338;
  v4[19] = &stru_10064F358;
  v3[20] = @"t";
  v4[20] = &stru_10064F378;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  21LL));
}

- (id)accountEnhancedMerchant
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKAccountEnhancedMerchant);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountEnhancedMerchant");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10024B9D4;
  v17[3] = &unk_100638EF0;
  v17[4] = self;
  id v18 = v6;
  id v8 = v3;
  v19 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v17);

  id v11 = (void *)objc_opt_class(self, v10);
  int64_t v12 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  [v11 populateAssociatedProgramIdentifiersForEnhancedMerchant:v8 enhancedMerchantPID:v12 inDatabase:v13];

  id v14 = v19;
  __int128 v15 = v8;

  return v15;
}

- (void)updateWithEnhancedMerchantProgramIdentifiers:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountEnhancedMerchantProgramIdentifier insertOrUpdateEnhancedMerchantProgramIdentifiers:enhancedMerchantPID:inDatabase:]( &OBJC_CLASS___AccountEnhancedMerchantProgramIdentifier,  "insertOrUpdateEnhancedMerchantProgramIdentifiers:enhancedMerchantPID:inDatabase:",  v4,  v5,  v6);
}

+ (void)populateAssociatedProgramIdentifiersForEnhancedMerchant:(id)a3 enhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5
{
  id v10 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AccountEnhancedMerchantProgramIdentifier accountEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:inDatabase:]( &OBJC_CLASS___AccountEnhancedMerchantProgramIdentifier,  "accountEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:inDatabase:",  a4,  a5));
  if ([v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  [v10 setEnhancedRewardsProgramIdentifiers:v9];
}

+ (id)_propertyValuesForEnhancedMerchant:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 privateIdentifier]);
  [v6 setObjectOrNull:v8 forKey:@"b"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  [v6 setObjectOrNull:v9 forKey:@"c"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 detailedDescription]);
  [v6 setObjectOrNull:v10 forKey:@"d"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 logoImage]);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 imageForScaleFactor:2]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteURL]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
  [v6 setObjectOrNull:v14 forKey:@"ea"];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 logoImage]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 imageForScaleFactor:3]);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteURL]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 absoluteString]);
  [v6 setObjectOrNull:v18 forKey:@"eb"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 adamID]);
  [v6 setObjectOrNull:v19 forKey:@"f"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 brandMUIDsAsJSONString]);
  [v6 setObjectOrNull:v20 forKey:@"g"];

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 excludedMUIDsAsJSONString]);
  [v6 setObjectOrNull:v21 forKey:@"h"];

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 website]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
  [v6 setObjectOrNull:v23 forKey:@"i"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v5 loyaltyPassURL]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 absoluteString]);
  [v6 setObjectOrNull:v25 forKey:@"j"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentIdentifiersAsJSONString]);
  [v6 setObjectOrNull:v26 forKey:@"k"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v5 disclosures]);
  [v6 setObjectOrNull:v27 forKey:@"l"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v5 iconImage]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 imageForScaleFactor:2]);

  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 remoteURL]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 absoluteString]);
  [v6 setObjectOrNull:v31 forKey:@"ma"];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v5 iconImage]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 imageForScaleFactor:3]);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 remoteURL]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 absoluteString]);
  [v6 setObjectOrNull:v35 forKey:@"mb"];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsSearchText]);
  [v6 setObjectOrNull:v36 forKey:@"n"];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentSheetRewardsText]);
  [v6 setObjectOrNull:v37 forKey:@"o"];

  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "suppressPaymentSheetRewardsHint"), @"p");
  v38 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentSheetMerchantRewardsText]);
  [v6 setObjectOrNull:v38 forKey:@"q"];

  v39 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentSheetOverrideStart]);
  v40 = (void *)_SQLValueForDate(v39);
  [v6 setObjectOrNull:v40 forKey:@"r"];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentSheetOverrideEnd]);
  v42 = (void *)_SQLValueForDate(v41);
  [v6 setObjectOrNull:v42 forKey:@"s"];

  v43 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsSearchStringsAsJSONString]);
  [v6 setObjectOrNull:v43 forKey:@"t"];

  id v44 = [v6 copy];
  return v44;
}

@end