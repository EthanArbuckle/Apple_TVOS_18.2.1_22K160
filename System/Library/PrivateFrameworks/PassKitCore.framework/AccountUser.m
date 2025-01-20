@interface AccountUser
+ (id)_accountUsersWithQuery:(id)a3;
+ (id)_predicateForAccessLevel:(unint64_t)a3;
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_predicateForAltDSID:(id)a3;
+ (id)_predicateForAltDSID:(id)a3 accountPID:(id)a4;
+ (id)_predicateForAppleID:(id)a3;
+ (id)_predicateForLikeAddressableHandle:(id)a3;
+ (id)_propertySettersForAccountUser;
+ (id)_propertyValuesForAccountUser:(id)a3;
+ (id)_transactionSourceIdentifiersForAccountUserPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)accountUserForAccountPID:(id)a3 handle:(id)a4 inDatabase:(id)a5;
+ (id)accountUsersByAccountIdentifierInDatabase:(id)a3;
+ (id)accountUsersForAccountPID:(id)a3 accessLevel:(unint64_t)a4 inDatabase:(id)a5;
+ (id)accountUsersForAccountPID:(id)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 withAltDSID:(id)a4 accountPID:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateAccountUsers:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (int64_t)countOfActivePrimaryUsersForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountUserWithAltDSID:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (void)deleteAccountUsersForAccountPID:(id)a3 inDatabase:(id)a4;
- (AccountUser)initWithAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (BOOL)isCurrentUser;
- (id)accountIdentifier;
- (id)accountUser;
- (id)altDSID;
- (id)transactionSourceIdentifier;
- (void)updateWithAccountUser:(id)a3;
@end

@implementation AccountUser

+ (id)databaseTable
{
  return @"gooseberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___TransactionSource, v4) == a3) {
    return @"transaction_source_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v13 = v7;
  if (v7 == @"transaction_source.identifier") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = [@"transaction_source.identifier" isEqualToString:v7];

    if ((v8 & 1) != 0)
    {
LABEL_4:
      v9 = @"LEFT OUTER JOIN transaction_source ON transaction_source.pid = gooseberry.transaction_source_pid";
LABEL_5:
      [v6 addObject:v9];
      goto LABEL_6;
    }

    v10 = v13;
    if (v10 == @"pears.a"
      || (v11 = v10, unsigned int v12 = [@"pears.a" isEqualToString:v10], v11, v12))
    {
      v9 = @"JOIN pears ON pears.pid = gooseberry.a";
      goto LABEL_5;
    }
  }

- (AccountUser)initWithAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForAccountUser:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 mutableCopy];

  [v14 setObjectOrNull:v9 forKey:@"a"];
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_1002CFA8C;
  v31 = sub_1002CFA9C;
  id v32 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002CFAA4;
  v21[3] = &unk_10064F3A0;
  v26 = &v27;
  v15 = self;
  v22 = v15;
  id v16 = v14;
  id v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v18 = v8;
  id v25 = v18;
  sub_1002CCC5C((uint64_t)v17, v21);
  v19 = (AccountUser *)(id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

+ (id)insertOrUpdateAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:v11 accountPID:v9]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v12]);

  if (v13) {
    [v13 updateWithAccountUser:v8];
  }
  else {
    id v13 = [objc_alloc((Class)a1) initWithAccountUser:v8 forAccountPID:v9 inDatabase:v10];
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v13 persistentID]));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 supportedFeatures]);
  +[CreditAccountFeatureDescriptor updateCreditAccountFeatureDescriptors:forAccountUserPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "updateCreditAccountFeatureDescriptors:forAccountUserPID:inDatabase:",  v15,  v14,  v10);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 preferences]);
  id v17 =  +[AccountUserPreferences insertOrUpdateAccountUserPreferences:forAccountUserPID:inDatabase:]( &OBJC_CLASS___AccountUserPreferences,  "insertOrUpdateAccountUserPreferences:forAccountUserPID:inDatabase:",  v16,  v14,  v10);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 notificationSettings]);
  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v13 persistentID]));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[AccountUserNotificationSettings anyInDatabase:forAccountUserPID:]( &OBJC_CLASS___AccountUserNotificationSettings,  "anyInDatabase:forAccountUserPID:",  v10,  v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountUserNotificationSettings]);
    v22 = v21;
    if (v21) {
      id v23 = v21;
    }
    else {
      id v23 = (id)objc_claimAutoreleasedReturnValue( +[PKAccountUserNotificationSettings defaultNotificationSettings]( &OBJC_CLASS___PKAccountUserNotificationSettings,  "defaultNotificationSettings"));
    }
    id v18 = v23;
  }

  id v24 =  +[AccountUserNotificationSettings insertOrUpdateAccountUserNotificationSettings:forAccountUserPID:inDatabase:]( &OBJC_CLASS___AccountUserNotificationSettings,  "insertOrUpdateAccountUserNotificationSettings:forAccountUserPID:inDatabase:",  v18,  v14,  v10);

  return v13;
}

+ (id)insertOrUpdateAccountUsers:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  id v12 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", v11);
  v28 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", v11);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue([a1 insertOrUpdateAccountUser:v18 forAccountPID:v9 inDatabase:v10]);
        if (v19)
        {
          -[NSMutableSet addObject:](v28, "addObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 altDSID]);
          -[NSMutableSet pk_safelyAddObject:](v12, "pk_safelyAddObject:", v20);
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v15);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"c",  v12));
  v33[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v9]);
  v33[1] = v22;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));

  id v25 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v24]);
  [v25 deleteAllEntities];
  id v26 = -[NSMutableSet copy](v28, "copy");

  return v26;
}

+ (id)accountUsersForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountUsersWithQuery:v8]);
  return v9;
}

+ (id)accountUsersForAccountPID:(id)a3 accessLevel:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v16[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccessLevel:a4]);
  v16[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v12]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountUsersWithQuery:v13]);

  return v14;
}

+ (id)accountUserForAccountPID:(id)a3 handle:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppleID:v9]);
  v23[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLikeAddressableHandle:v9]);

  v23[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v10]);
  v22[0] = v15;
  v22[1] = v14;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));

  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v17]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountUsersWithQuery:v18]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 anyObject]);

  return v20;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_source_pid",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withAltDSID:(id)a4 accountPID:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v10]);
  v17[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:v8]);

  v17[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v14]);

  return v15;
}

+ (id)accountUsersByAccountIdentifierInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT DISTINCT %@.pid, %@ FROM %@, %@ WHERE %@.%@ = %@.pid",  v5,  @"pears.a",  v6,  v7,  v8,  @"a",  v9));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002D0694;
  v15[3] = &unk_1006452B8;
  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v18 = a1;
  id v16 = v4;
  id v11 = v17;
  id v12 = v4;
  sub_1002CCDBC((uint64_t)v12, v10, v15);
  id v13 = -[NSMutableDictionary copy](v11, "copy");

  return v13;
}

+ (int64_t)countOfActivePrimaryUsersForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002D0850;
  v8[3] = &unk_100645740;
  v8[4] = &v9;
  v8[5] = a3;
  sub_1002CCDD0((uint64_t)v5, @"SELECT d FROM gooseberry WHERE a = ? AND b = ?", 1, v8);
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (void)deleteAccountUsersForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAccountUserWithAltDSID:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:a3 accountPID:a4]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v10]);

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v2, "persistentID")));
  +[CreditAccountFeatureDescriptor deleteCreditAccountFeatureDescriptorsForAccountUserPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "deleteCreditAccountFeatureDescriptorsForAccountUserPID:inDatabase:",  v4,  v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AccountUserPreferences anyInDatabase:forAccountUserPID:]( &OBJC_CLASS___AccountUserPreferences,  "anyInDatabase:forAccountUserPID:",  v3,  v4));
  [v5 deleteFromDatabase];

  +[TransactionSource deleteEntitiesInDatabase:forAccountUser:]( &OBJC_CLASS___TransactionSource,  "deleteEntitiesInDatabase:forAccountUser:",  v3,  v2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AccountUserNotificationSettings anyInDatabase:forAccountUserPID:]( &OBJC_CLASS___AccountUserNotificationSettings,  "anyInDatabase:forAccountUserPID:",  v3,  v4));
  [v6 deleteFromDatabase];

  v8.receiver = v2;
  v8.super_class = (Class)&OBJC_CLASS___AccountUser;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v8, "deleteFromDatabase");

  return (char)v2;
}

- (id)accountUser
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountUser);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountUser");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1002D0D3C;
  v25[3] = &unk_100638EF0;
  v25[4] = self;
  id v8 = v6;
  id v26 = v8;
  uint64_t v9 = v3;
  uint64_t v27 = v9;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v25);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](self, "persistentID")));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountFeatureDescriptor creditAccountFeatureDescriptorsForAccountUserPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "creditAccountFeatureDescriptorsForAccountUserPID:inDatabase:",  v11,  v10));
  -[PKAccountUser setSupportedFeatures:](v9, "setSupportedFeatures:", v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AccountUserPreferences anyInDatabase:forAccountUserPID:]( &OBJC_CLASS___AccountUserPreferences,  "anyInDatabase:forAccountUserPID:",  v10,  v11));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountUserPreferences]);

  -[PKAccountUser setPreferences:](v9, "setPreferences:", v14);
  -[PKAccountUser setCurrentUser:](v9, "setCurrentUser:", -[AccountUser isCurrentUser](self, "isCurrentUser"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AccountUserNotificationSettings anyInDatabase:forAccountUserPID:]( &OBJC_CLASS___AccountUserNotificationSettings,  "anyInDatabase:forAccountUserPID:",  v10,  v11));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountUserNotificationSettings]);
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[PKAccountUserNotificationSettings defaultNotificationSettings]( &OBJC_CLASS___PKAccountUserNotificationSettings,  "defaultNotificationSettings"));
  }
  v19 = v18;

  -[PKAccountUser setNotificationSettings:](v9, "setNotificationSettings:", v19);
  id v21 = objc_msgSend( (id)objc_opt_class(self, v20),  "_transactionSourceIdentifiersForAccountUserPID:inDatabase:",  -[SQLiteEntity persistentID](self, "persistentID"),  v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[PKAccountUser setTransactionSourceIdentifiers:](v9, "setTransactionSourceIdentifiers:", v22);
  id v23 = v9;

  return v23;
}

- (id)transactionSourceIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_source_pid"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withPersistentID:]( TransactionSource,  "anyInDatabase:withPersistentID:",  v3,  [v4 longLongValue]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  return v6;
}

- (id)accountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pears.a");
}

- (id)altDSID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c");
}

- (BOOL)isCurrentUser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  char v3 = PKAltDSIDIsCurrentUser(v2);

  return v3;
}

- (void)updateWithAccountUser:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForAccountUser:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 appleID]);

  id v9 = [v8 length];
  if (!v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Error: there is no appleID defined on the account user. Using the last cached value",  v14,  2u);
    }

    id v12 = [v7 mutableCopy];
    [v12 removeObjectForKey:@"i"];
    [v12 removeObjectForKey:@"j"];
    id v13 = [v12 copy];

    v7 = v13;
  }

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForAltDSID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  a3);
}

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForAccessLevel:(unint64_t)a3
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForAppleID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i",  a3);
}

+ (id)_predicateForLikeAddressableHandle:(id)a3
{
  return +[SQLiteStringLikePredicate predicateWithProperty:matchingPattern:]( &OBJC_CLASS___SQLiteStringLikePredicate,  "predicateWithProperty:matchingPattern:",  @"j",  a3);
}

+ (id)_predicateForAltDSID:(id)a3 accountPID:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAltDSID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v6]);

  v12[0] = v7;
  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_accountUsersWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountUser]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1002D1210;
  id v16 = &unk_100638F18;
  id v17 = v5;
  id v18 = v4;
  v19 = v6;
  id v20 = a1;
  id v8 = v6;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  id v11 = -[NSMutableSet copy](v8, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)_transactionSourceIdentifiersForAccountUserPID:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = -[SQLiteEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___AccountUser),  "initWithPersistentID:inDatabase:",  a3,  v5);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v7, "valueForProperty:", @"transaction_source.identifier"));
  if (v8) {
    -[NSMutableSet addObject:](v6, "addObject:", v8);
  }
  id v23 = (void *)v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v7, "valueForProperty:", @"pears.a"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v5,  v9));

  v22 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 previousAccountIdentifiers]);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v5,  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v15)));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[AccountUser altDSID](v7, "altDSID"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[AccountUser anyInDatabase:withAltDSID:accountPID:]( AccountUser,  "anyInDatabase:withAltDSID:accountPID:",  v5,  v17,  [v16 persistentID]));

        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 transactionSourceIdentifier]);
        if (v19) {
          -[NSMutableSet addObject:](v6, "addObject:", v19);
        }

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }

  if (-[NSMutableSet count](v6, "count")) {
    id v20 = -[NSMutableSet copy](v6, "copy");
  }
  else {
    id v20 = 0LL;
  }

  return v20;
}

+ (id)_propertyValuesForAccountUser:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 accessLevel], @"b");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 identityStatus], @"k");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"c");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 accountState], @"d");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 firstName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"e");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"f");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 appleID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"i");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 addressableHandles]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"j");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 isDirty], @"g");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);

  id v13 = (void *)_SQLValueForDate(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"h");

  id v14 = -[NSMutableDictionary copy](v4, "copy");
  return v14;
}

+ (id)_propertySettersForAccountUser
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100653898;
  v4[1] = &stru_1006538B8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_1006538D8;
  v4[3] = &stru_1006538F8;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100653918;
  v4[5] = &stru_100653938;
  v3[6] = @"h";
  v3[7] = @"pears.a";
  v4[6] = &stru_100653958;
  v4[7] = &stru_100653978;
  v3[8] = @"i";
  v3[9] = @"k";
  v4[8] = &stru_100653998;
  v4[9] = &stru_1006539B8;
  v3[10] = @"j";
  v4[10] = &stru_1006539D8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
}

@end