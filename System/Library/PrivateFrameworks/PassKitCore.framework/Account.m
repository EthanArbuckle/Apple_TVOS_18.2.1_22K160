@interface Account
+ (BOOL)hasAnyAccountInDatabase:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForPhysicalCardIdentifier:(id)a3;
+ (id)_predicateForVirtualCardIdentifier:(id)a3;
+ (id)_propertySettersForAccount;
+ (id)accountWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountWithPhysicalCardIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountsInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPreviousAccountIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 withType:(id)a4;
+ (id)databaseTable;
+ (id)deleteVirtualCardEncryptedDataForAccount:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateAccount:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllAccountsInDatabase:(id)a3;
- (Account)initWithAccount:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)account;
- (id)accountIdentifier;
- (id)previousAccountIdentifiers;
- (id)transactionSourceIdentifier;
- (unint64_t)feature;
- (unint64_t)state;
- (unint64_t)type;
- (void)_updateForAccount:(id)a3 persistentID:(int64_t)a4 database:(id)a5 deleteOnFailedMatch:(BOOL)a6;
- (void)updateWithAccount:(id)a3;
@end

@implementation Account

+ (id)accountsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v19 = @"pid";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1001AFC94;
  v16 = &unk_100639E18;
  id v17 = v4;
  id v18 = v7;
  id v9 = v7;
  id v10 = v4;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)accountWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 accountWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithAccount:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithAccount:v6 inDatabase:v7];
  }

  return v9;
}

- (Account)initWithAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 type], @"c");
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 state], @"d");
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 stateReason], @"i");
  -[NSMutableDictionary setBool:forKey:]( v8,  "setBool:forKey:",  [v7 blockAllAccountAccess],  @"block_all_account_access");
  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v7 blockNotifications], @"j");
  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v7 isCloudAccount], @"p");
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 accessLevel], @"e");
  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v7 accountStateDirty], @"f");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUpdated]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"g");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"a");

  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 feature], @"b");
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 accountBaseURL]);
  v13 = (void *)_SQLValueForURL(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"h");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudStoreZoneNames]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v15, @"cloud_store_zone_names");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 applyServiceURL]);
  id v17 = (void *)_SQLValueForURL(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v17, @"k");

  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v7 isSharedAccount], @"l");
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v18, @"m");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 previousAccountIdentifiers]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v21, @"n");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 paymentServicesBaseURL]);
  v23 = (void *)_SQLValueForURL(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v23, @"o");

  v24 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v7 additionalPushTopics]);
  id v26 =  +[AccountAdditionalPushTopics insertAccountAdditionalPushTopics:forAccountPID:inDatabase:]( &OBJC_CLASS___AccountAdditionalPushTopics,  "insertAccountAdditionalPushTopics:forAccountPID:inDatabase:",  v25,  -[SQLiteEntity persistentID](v24, "persistentID"),  v6);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 fetchPeriods]);
  id v28 =  +[AccountFetchPeriods insertOrUpdateAccountFetchPeriods:forAccountPID:inDatabase:]( &OBJC_CLASS___AccountFetchPeriods,  "insertOrUpdateAccountFetchPeriods:forAccountPID:inDatabase:",  v27,  -[SQLiteEntity persistentID](v24, "persistentID"),  v6);

  -[Account _updateForAccount:persistentID:database:deleteOnFailedMatch:]( v24,  "_updateForAccount:persistentID:database:deleteOnFailedMatch:",  v7,  -[SQLiteEntity persistentID](v24, "persistentID"),  v6,  0LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource insertTransactionSourceWithType:inDatabase:]( &OBJC_CLASS___TransactionSource,  "insertTransactionSourceWithType:inDatabase:",  3LL,  v6));

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v29 persistentID]));
  -[SQLiteEntity setValue:forProperty:](v24, "setValue:forProperty:", v30, @"transaction_source_pid");

  return v24;
}

+ (id)accountWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForVirtualCardIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 account]);
  return v9;
}

+ (id)accountWithPhysicalCardIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 account]);
  return v9;
}

+ (BOOL)hasAnyAccountInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v4 predicate:v5]);

  return v6 != 0LL;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPreviousAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteStringLikePredicate predicateWithProperty:matchingPattern:]( &OBJC_CLASS___SQLiteStringLikePredicate,  "predicateWithProperty:matchingPattern:",  @"n",  a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_source_pid",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withType:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (void)updateWithAccount:(id)a3
{
  id v4 = a3;
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v26, "setInteger:forKey:", [v4 type], @"c");
  -[NSMutableDictionary setInteger:forKey:](v26, "setInteger:forKey:", [v4 state], @"d");
  -[NSMutableDictionary setInteger:forKey:](v26, "setInteger:forKey:", [v4 stateReason], @"i");
  -[NSMutableDictionary setBool:forKey:]( v26,  "setBool:forKey:",  [v4 blockAllAccountAccess],  @"block_all_account_access");
  -[NSMutableDictionary setBool:forKey:](v26, "setBool:forKey:", [v4 blockNotifications], @"j");
  -[NSMutableDictionary setBool:forKey:](v26, "setBool:forKey:", [v4 isCloudAccount], @"p");
  -[NSMutableDictionary setInteger:forKey:](v26, "setInteger:forKey:", [v4 accessLevel], @"e");
  -[NSMutableDictionary setBool:forKey:](v26, "setBool:forKey:", [v4 accountStateDirty], @"f");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdated]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v6, @"g");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v7, @"a");

  -[NSMutableDictionary setInteger:forKey:](v26, "setInteger:forKey:", [v4 feature], @"b");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountBaseURL]);
  id v9 = (void *)_SQLValueForURL(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v9, @"h");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudStoreZoneNames]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v11, @"cloud_store_zone_names");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 applyServiceURL]);
  v13 = (void *)_SQLValueForURL(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v13, @"k");

  -[NSMutableDictionary setBool:forKey:](v26, "setBool:forKey:", [v4 isSharedAccount], @"l");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v14, @"m");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 previousAccountIdentifiers]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v17, @"n");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentServicesBaseURL]);
  v19 = (void *)_SQLValueForURL(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v26, "setObjectOrNull:forKey:", v19, @"o");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v26);
  int64_t v20 = -[SQLiteEntity persistentID](self, "persistentID");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountAdditionalPushTopics deleteAccountAdditionalPushTopicsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountAdditionalPushTopics,  "deleteAccountAdditionalPushTopicsForAccountPID:inDatabase:",  v20,  v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 additionalPushTopics]);
  id v23 =  +[AccountAdditionalPushTopics insertAccountAdditionalPushTopics:forAccountPID:inDatabase:]( &OBJC_CLASS___AccountAdditionalPushTopics,  "insertAccountAdditionalPushTopics:forAccountPID:inDatabase:",  v22,  v20,  v21);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchPeriods]);
  id v25 =  +[AccountFetchPeriods insertOrUpdateAccountFetchPeriods:forAccountPID:inDatabase:]( &OBJC_CLASS___AccountFetchPeriods,  "insertOrUpdateAccountFetchPeriods:forAccountPID:inDatabase:",  v24,  v20,  v21);

  -[Account _updateForAccount:persistentID:database:deleteOnFailedMatch:]( self,  "_updateForAccount:persistentID:database:deleteOnFailedMatch:",  v4,  v20,  v21,  1LL);
}

- (void)_updateForAccount:(id)a3 persistentID:(int64_t)a4 database:(id)a5 deleteOnFailedMatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  BOOL v85 = v6;
  switch((unint64_t)[v9 type])
  {
    case 1uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 details]);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v11 creditDetails]);
      if (v86)
      {
        +[CreditAccountDetails updateCreditAccountDetails:forAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountDetails,  "updateCreditAccountDetails:forAccountPID:inDatabase:",  v11,  a4,  v10);
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = (objc_class *)objc_opt_class(v11, v17);
          v19 = NSStringFromClass(v18);
          int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          *(_DWORD *)buf = 138543362;
          v108 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Details are not of class credit:%{public}@ , deleting exsiting details",  buf,  0xCu);
        }

        if (v6) {
          +[CreditAccountDetails deleteCreditAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountDetails,  "deleteCreditAccountDetailsForAccountPID:inDatabase:",  a4,  v10);
        }
      }

      int64_t v21 = a4;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedFeatures]);
      id v23 = [v22 countByEnumeratingWithState:&v99 objects:v106 count:16];
      if (!v23) {
        goto LABEL_22;
      }
      id v25 = v23;
      uint64_t v26 = *(void *)v100;
LABEL_16:
      uint64_t v27 = 0LL;
      while (1)
      {
        if (*(void *)v100 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void *)(*((void *)&v99 + 1) + 8 * v27);
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___PKCreditAccountFeatureDescriptor, v24);
        if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0) {
          break;
        }
        if (v25 == (id)++v27)
        {
          id v25 = [v22 countByEnumeratingWithState:&v99 objects:v106 count:16];
          if (!v25)
          {
LABEL_22:

            v30 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedFeatures]);
            +[CreditAccountFeatureDescriptor updateCreditAccountFeatureDescriptors:forAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "updateCreditAccountFeatureDescriptors:forAccountPID:inDatabase:",  v30,  v21,  v10);
            goto LABEL_74;
          }

          goto LABEL_16;
        }
      }

      uint64_t v31 = PKLogFacilityTypeGetObject(14LL);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Descriptors did not match PKCreditAccountFeatureDescriptor class.",  buf,  2u);
      }

      if (v85) {
        +[CreditAccountFeatureDescriptor deleteCreditAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "deleteCreditAccountFeatureDescriptorsForAccountPID:inDatabase:",  v21,  v10);
      }
      goto LABEL_75;
    case 2uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 details]);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v11 payLaterDetails]);
      if (v86)
      {
        id v12 =  +[PayLaterAccountDetails insertOrUpdateAccountDetails:forAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountDetails,  "insertOrUpdateAccountDetails:forAccountPID:inDatabase:",  v11,  a4,  v10);
      }

      else
      {
        uint64_t v33 = PKLogFacilityTypeGetObject(14LL);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (objc_class *)objc_opt_class(v11, v35);
          v37 = NSStringFromClass(v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          *(_DWORD *)buf = 138543362;
          v108 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Details are not of class payLater:%{public}@",  buf,  0xCu);
        }

        if (v6) {
          +[PayLaterAccountDetails deleteAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountDetails,  "deleteAccountDetailsForAccountPID:inDatabase:",  a4,  v10);
        }
      }

      int64_t v39 = a4;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      v40 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedFeatures]);
      id v41 = [v40 countByEnumeratingWithState:&v95 objects:v105 count:16];
      if (!v41) {
        goto LABEL_39;
      }
      id v43 = v41;
      uint64_t v44 = *(void *)v96;
      while (2)
      {
        for (i = 0LL; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v96 != v44) {
            objc_enumerationMutation(v40);
          }
          uint64_t v46 = *(void *)(*((void *)&v95 + 1) + 8LL * (void)i);
          uint64_t v47 = objc_opt_class(&OBJC_CLASS___PKPayLaterAccountFeatureDescriptor, v42);
          if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
          {

            uint64_t v48 = PKLogFacilityTypeGetObject(14LL);
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Descriptors did not match PKPayLaterAccountFeatureDescriptor class.",  buf,  2u);
            }

            if (v85) {
              +[PayLaterAccountFeatureDescriptor deletePayLaterAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountFeatureDescriptor,  "deletePayLaterAccountFeatureDescriptorsForAccountPID:inDatabase:",  v39,  v10);
            }
            goto LABEL_75;
          }
        }

        id v43 = [v40 countByEnumeratingWithState:&v95 objects:v105 count:16];
        if (v43) {
          continue;
        }
        break;
      }

- (id)account
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccount);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Account _propertySettersForAccount](&OBJC_CLASS___Account, "_propertySettersForAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001B170C;
  v35[3] = &unk_100639EE8;
  id v6 = v4;
  id v36 = v6;
  id v7 = v3;
  v37 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v35);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AccountAdditionalPushTopics accountAdditionalPushTopicsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountAdditionalPushTopics,  "accountAdditionalPushTopicsForAccountPID:inDatabase:",  v8,  v9));
  -[PKAccount setAdditionalPushTopics:](v7, "setAdditionalPushTopics:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AccountFetchPeriods accountFetchPeriodsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountFetchPeriods,  "accountFetchPeriodsForAccountPID:inDatabase:",  v8,  v9));
  -[PKAccount setFetchPeriods:](v7, "setFetchPeriods:", v11);
  switch((unint64_t)-[PKAccount type](v7, "type"))
  {
    case 1uLL:
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountDetails creditAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountDetails,  "creditAccountDetailsForAccountPID:inDatabase:",  v8,  v9));
      -[PKAccount setDetails:](v7, "setDetails:", v12);

      int64_t v13 = -[SQLiteEntity persistentID](self, "persistentID");
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[CreditAccountFeatureDescriptor creditAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "creditAccountFeatureDescriptorsForAccountPID:inDatabase:",  v13,  v14));

      -[PKAccount setSupportedFeatures:](v7, "setSupportedFeatures:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
      id v17 = [v16 integerValue];

      if (v17 == (id)1)
      {
        int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
        int64_t v20 = +[AccountUser countOfActivePrimaryUsersForAccountPID:inDatabase:]( &OBJC_CLASS___AccountUser,  "countOfActivePrimaryUsersForAccountPID:inDatabase:",  v18,  v19);

        -[PKAccount setCoOwner:](v7, "setCoOwner:", v20 > 1);
      }

      goto LABEL_8;
    case 2uLL:
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountDetails accountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountDetails,  "accountDetailsForAccountPID:inDatabase:",  v8,  v9));
      -[PKAccount setDetails:](v7, "setDetails:", v27);

      int64_t v28 = -[SQLiteEntity persistentID](self, "persistentID");
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[PayLaterAccountFeatureDescriptor payLaterAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountFeatureDescriptor,  "payLaterAccountFeatureDescriptorsForAccountPID:inDatabase:",  v28,  v23));
      goto LABEL_7;
    case 3uLL:
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[AppleBalanceAccountDetails accountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountDetails,  "accountDetailsForAccountPID:inDatabase:",  v8,  v9));
      -[PKAccount setDetails:](v7, "setDetails:", v21);

      int64_t v22 = -[SQLiteEntity persistentID](self, "persistentID");
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[AppleBalanceAccountFeatureDescriptor appleBalanceAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountFeatureDescriptor,  "appleBalanceAccountFeatureDescriptorsForAccountPID:inDatabase:",  v22,  v23));
      goto LABEL_7;
    case 4uLL:
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SavingsAccountDetails accountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___SavingsAccountDetails,  "accountDetailsForAccountPID:inDatabase:",  v8,  v9));
      -[PKAccount setDetails:](v7, "setDetails:", v25);

      int64_t v26 = -[SQLiteEntity persistentID](self, "persistentID");
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[SavingsAccountFeatureDescriptor savingsAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___SavingsAccountFeatureDescriptor,  "savingsAccountFeatureDescriptorsForAccountPID:inDatabase:",  v26,  v23));
LABEL_7:
      v15 = (void *)v24;

      -[PKAccount setSupportedFeatures:](v7, "setSupportedFeatures:", v15);
LABEL_8:

      break;
    default:
      break;
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](v7, "accountIdentifier"));

  if (v29)
  {
    v30 = v7;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(24LL);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Account does not have an account identifier",  (uint8_t *)v34,  2u);
    }

    v30 = 0LL;
  }

  return v30;
}

- (id)accountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a");
}

- (id)previousAccountIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@","]);

  if ([v3 count]) {
    id v4 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (unint64_t)state
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)feature
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)transactionSourceIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_source_pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withPersistentID:]( TransactionSource,  "anyInDatabase:withPersistentID:",  v3,  [v4 longLongValue]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  return v6;
}

+ (id)databaseTable
{
  return @"pears";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  v16 = v7;
  if (v7 == @"raspberries.b") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned int v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"raspberries.b");

    if (v8)
    {
LABEL_4:
      [v6 addObject:@"JOIN clementines ON clementines.a = pears.pid"];
      id v9 = @"JOIN raspberries ON raspberries.a = clementines.pid";
LABEL_5:
      [v6 addObject:v9];
      goto LABEL_6;
    }

    id v10 = v16;
    if (v10 == @"blackberries.b"
      || (id v11 = v10,
          unsigned __int8 v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"blackberries.b"),
          v11,
          (v12 & 1) != 0))
    {
      id v9 = @"JOIN blackberries ON blackberries.a = pears.pid";
      goto LABEL_5;
    }

    int64_t v13 = v11;
    if (v13 == @"transaction_source.identifier"
      || (id v14 = v13,
          unsigned int v15 = -[__CFString isEqualToString:]( v13,  "isEqualToString:",  @"transaction_source.identifier"),  v14,  v15))
    {
      id v9 = @"LEFT OUTER JOIN transaction_source ON transaction_source.pid = pears.transaction_source_pid";
      goto LABEL_5;
    }
  }

+ (void)deleteAccountsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllAccountsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

+ (void)deleteAccountWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 accountWithIdentifier:a3 inDatabase:a4]);
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (id)deleteVirtualCardEncryptedDataForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  int64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  int64_t v20 = sub_1001B1C58;
  int64_t v21 = sub_1001B1C68;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001B1C70;
  v12[3] = &unk_10063D3E8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  unsigned int v15 = &v17;
  sub_1002CCC5C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Account accountIdentifier](self, "accountIdentifier"));
  +[CreditAccountDetails deleteCreditAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountDetails,  "deleteCreditAccountDetailsForAccountPID:inDatabase:",  v3,  v4);
  +[PayLaterAccountDetails deleteAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountDetails,  "deleteAccountDetailsForAccountPID:inDatabase:",  v3,  v4);
  +[AppleBalanceAccountDetails deleteAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountDetails,  "deleteAccountDetailsForAccountPID:inDatabase:",  v3,  v4);
  +[SavingsAccountDetails deleteSavingsAccountDetailsForAccountPID:inDatabase:]( &OBJC_CLASS___SavingsAccountDetails,  "deleteSavingsAccountDetailsForAccountPID:inDatabase:",  v3,  v4);
  +[SavingsAccountStatement deleteSavingsAccountStatementsForAccount:inDatabase:]( &OBJC_CLASS___SavingsAccountStatement,  "deleteSavingsAccountStatementsForAccount:inDatabase:",  v5,  v4);
  +[CreditAccountFeatureDescriptor deleteCreditAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___CreditAccountFeatureDescriptor,  "deleteCreditAccountFeatureDescriptorsForAccountPID:inDatabase:",  v3,  v4);
  +[AccountEvent deleteAccountEventsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountEvent,  "deleteAccountEventsForAccountPID:inDatabase:",  v3,  v4);
  +[AccountAdditionalPushTopics deleteAccountAdditionalPushTopicsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountAdditionalPushTopics,  "deleteAccountAdditionalPushTopicsForAccountPID:inDatabase:",  v3,  v4);
  +[AccountFetchPeriods deleteAccountFetchPeriodsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountFetchPeriods,  "deleteAccountFetchPeriodsForAccountPID:inDatabase:",  v3,  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
  +[AccountPayment deleteScheduledPaymentsWithAccountIdentifier:inDatabase:]( &OBJC_CLASS___AccountPayment,  "deleteScheduledPaymentsWithAccountIdentifier:inDatabase:",  v6,  v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[AccountUser deleteAccountUsersForAccountPID:inDatabase:]( &OBJC_CLASS___AccountUser,  "deleteAccountUsersForAccountPID:inDatabase:",  v7,  v4);

  +[SharedAccountCloudStore deleteEntitiesForAccountPID:inDatabase:]( &OBJC_CLASS___SharedAccountCloudStore,  "deleteEntitiesForAccountPID:inDatabase:",  v3,  v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[AccountPendingFamilyMember deleteAccountPendingFamilyMembersForAccountPID:inDatabase:]( &OBJC_CLASS___AccountPendingFamilyMember,  "deleteAccountPendingFamilyMembersForAccountPID:inDatabase:",  v8,  v4);

  +[PhysicalCard deletePhysicalCardsForAccountPID:inDatabase:]( &OBJC_CLASS___PhysicalCard,  "deletePhysicalCardsForAccountPID:inDatabase:",  v3,  v4);
  +[AccountWebServiceEndpointMetadata deleteEntitiesForAccountPID:inDatabase:]( &OBJC_CLASS___AccountWebServiceEndpointMetadata,  "deleteEntitiesForAccountPID:inDatabase:",  v3,  v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[AccountPaymentFundingSource deletePaymentFundingSourcesForAccountPID:inDatabase:]( &OBJC_CLASS___AccountPaymentFundingSource,  "deletePaymentFundingSourcesForAccountPID:inDatabase:",  v9,  v4);

  +[TransactionSource deleteEntitiesInDatabase:forAccount:]( &OBJC_CLASS___TransactionSource,  "deleteEntitiesInDatabase:forAccount:",  v4,  self);
  +[AccountPromotion deleteAccountPromotionsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountPromotion,  "deleteAccountPromotionsForAccountPID:inDatabase:",  v3,  v4);
  +[AccountPromotionBehavior deleteAccountPromotionBehaviorForAccountPID:inDatabase:]( &OBJC_CLASS___AccountPromotionBehavior,  "deleteAccountPromotionBehaviorForAccountPID:inDatabase:",  v3,  v4);
  +[AccountEnhancedMerchant deleteAccountEnhancedMerchantsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountEnhancedMerchant,  "deleteAccountEnhancedMerchantsForAccountPID:inDatabase:",  v3,  v4);
  +[AccountEnhancedMerchantBehavior deleteAccountEnhancedMerchantBehaviorForAccountPID:inDatabase:]( &OBJC_CLASS___AccountEnhancedMerchantBehavior,  "deleteAccountEnhancedMerchantBehaviorForAccountPID:inDatabase:",  v3,  v4);
  +[CreditRecoveryPaymentPlan deleteCreditRecoveryPaymentPlansForAccountIdentifier:inDatabase:]( &OBJC_CLASS___CreditRecoveryPaymentPlan,  "deleteCreditRecoveryPaymentPlansForAccountIdentifier:inDatabase:",  v5,  v4);
  +[AccountEntityOrdering deleteAccountEntityOrderingsForAccountPID:inDatabase:]( &OBJC_CLASS___AccountEntityOrdering,  "deleteAccountEntityOrderingsForAccountPID:inDatabase:",  v3,  v4);
  unint64_t v10 = -[Account feature](self, "feature");
  switch(v10)
  {
    case 4uLL:
      +[AccountEndpointBackOff deleteEntriesForAccountType:accountPID:inDatabase:]( &OBJC_CLASS___AccountEndpointBackOff,  "deleteEntriesForAccountType:accountPID:inDatabase:",  4LL,  v3,  v4);
      +[AppleBalanceAccountFeatureDescriptor deleteAppleBalanceAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountFeatureDescriptor,  "deleteAppleBalanceAccountFeatureDescriptorsForAccountPID:inDatabase:",  v3,  v4);
      break;
    case 3uLL:
      +[AccountEndpointBackOff deleteEntriesForAccountType:accountPID:inDatabase:]( &OBJC_CLASS___AccountEndpointBackOff,  "deleteEntriesForAccountType:accountPID:inDatabase:",  3LL,  v3,  v4);
      +[PayLaterAccountFeatureDescriptor deletePayLaterAccountFeatureDescriptorsForAccountPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountFeatureDescriptor,  "deletePayLaterAccountFeatureDescriptorsForAccountPID:inDatabase:",  v3,  v4);
      +[PayLaterCardMagnitudes deleteMagnitudesForAccountIdentifier:inDatabase:]( &OBJC_CLASS___PayLaterCardMagnitudes,  "deleteMagnitudesForAccountIdentifier:inDatabase:",  v5,  v4);
      break;
    case 2uLL:
      +[AccountEndpointBackOff deleteEntriesForAccountType:accountPID:inDatabase:]( &OBJC_CLASS___AccountEndpointBackOff,  "deleteEntriesForAccountType:accountPID:inDatabase:",  2LL,  v3,  v4);
      break;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___Account;
  BOOL v11 = -[SQLiteEntity deleteFromDatabase](&v13, "deleteFromDatabase");

  return v11;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPhysicalCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"blackberries.b",  a3);
}

+ (id)_predicateForVirtualCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"raspberries.b",  a3);
}

+ (id)_propertySettersForAccount
{
  v3[0] = @"d";
  v3[1] = @"i";
  v4[0] = &stru_100649C50;
  v4[1] = &stru_100649C70;
  v3[2] = @"block_all_account_access";
  v3[3] = @"j";
  v4[2] = &stru_100649C90;
  v4[3] = &stru_100649CB0;
  v3[4] = @"p";
  v3[5] = @"c";
  v4[4] = &stru_100649CD0;
  v4[5] = &stru_100649CF0;
  v3[6] = @"e";
  v3[7] = @"a";
  v4[6] = &stru_100649D10;
  v4[7] = &stru_100649D30;
  v3[8] = @"b";
  v3[9] = @"f";
  v4[8] = &stru_100649D50;
  v4[9] = &stru_100649D70;
  v3[10] = @"g";
  v3[11] = @"h";
  v4[10] = &stru_100649D90;
  v4[11] = &stru_100649DB0;
  v3[12] = @"cloud_store_zone_names";
  v3[13] = @"k";
  v4[12] = &stru_100649DD0;
  v4[13] = &stru_100649DF0;
  v3[14] = @"l";
  v3[15] = @"m";
  v4[14] = &stru_100649E10;
  v4[15] = &stru_100649E30;
  v3[16] = @"n";
  v3[17] = @"o";
  v4[16] = &stru_100649E50;
  v4[17] = &stru_100649E70;
  v3[18] = @"transaction_source.identifier";
  v4[18] = &stru_100649E90;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  19LL));
}

@end