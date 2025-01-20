@interface THFrozenThreadNetwork
+ (id)frozenThreadNetworkFromKeychainDictionary:(id)a3;
+ (id)keyChainQueryForDeleteFrozenThreadNetworkRecordOperation:(id)a3;
+ (id)keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation;
+ (id)keyChainQueryForFetchFrozenThreadNetworkRecordsOperation;
+ (id)keyChainQueryForFrozenThreadNetworkRecordOperationForCredentialsDataSet:(id)a3;
- (id)keyChainItemRepresentationForFrozenThreadNetworkAddOperation;
- (id)keyChainQueryForFrozenThreadNetworkUpdateOperation;
@end

@implementation THFrozenThreadNetwork

+ (id)frozenThreadNetworkFromKeychainDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {

    goto LABEL_8;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);

  if (!v8)
  {
LABEL_8:
    id v9 = 0LL;
    goto LABEL_9;
  }

  id v9 = v8;
  v10 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v9,  0LL);

  if (v10)
  {
    v11 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsDataSet),  "initWithDataSetArray:userInfo:",  v10,  0LL);
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate, v13);
      if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0) {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
      }
      else {
        v15 = 0LL;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDate, v22);
      if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0) {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
      }
      else {
        v24 = 0LL;
      }

      v17 = -[THFrozenThreadNetwork initWithCredentialsDataSet:creationDate:lastModificationDate:]( objc_alloc(&OBJC_CLASS___THFrozenThreadNetwork),  "initWithCredentialsDataSet:creationDate:lastModificationDate:",  v11,  v15,  v24);
    }

    else
    {
      id v19 = sub_1001768B4(1);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100172714();
      }

      v17 = 0LL;
    }

    goto LABEL_12;
  }

- (id)keyChainItemRepresentationForFrozenThreadNetworkAddOperation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[THFrozenThreadNetwork keyChainQueryForFrozenThreadNetworkUpdateOperation]( self,  "keyChainQueryForFrozenThreadNetworkUpdateOperation"));
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 mutableCopy];
    v9[0] = kSecAttrIsInvisible;
    v9[1] = kSecAttrSynchronizable;
    v10[0] = &__kCFBooleanTrue;
    v10[1] = &__kCFBooleanTrue;
    v9[2] = kSecAttrAccessGroup;
    v9[3] = kSecAttrSyncViewHint;
    v10[2] = @"com.apple.frozen.network";
    v10[3] = kSecAttrViewHintHome;
    v9[4] = kSecAttrAccessible;
    v9[5] = kSecAttrDescription;
    v10[4] = kSecAttrAccessibleAlways;
    v10[5] = @"Frozen Thread network Record";
    v9[6] = kSecAttrPath;
    v10[6] = @"com.apple.frozen.network";
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  7LL));
    [v4 addEntriesFromDictionary:v5];

    id v6 = [v4 copy];
  }

  else
  {
    id v7 = sub_1001768B4(1);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_100172788((os_log_t)v4);
    }
    id v6 = 0LL;
  }

  return v6;
}

- (id)keyChainQueryForFrozenThreadNetworkUpdateOperation
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[THFrozenThreadNetwork credentialsDataSet](self, "credentialsDataSet"));
  if (v3
    && (id v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFrozenThreadNetwork credentialsDataSet](self, "credentialsDataSet")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataSetArray]),
        v6,
        v5,
        v4,
        v6))
  {
    v14[0] = kSecClass;
    v14[1] = kSecAttrSynchronizable;
    v15[0] = kSecClassInternetPassword;
    v15[1] = kSecAttrSynchronizableAny;
    v15[2] = kSecAttrViewHintHome;
    v14[2] = kSecAttrSyncViewHint;
    v14[3] = kSecAttrAccount;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[THFrozenThreadNetwork credentialsDataSet](self, "credentialsDataSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataSetArray]);
    id v9 = sub_1001721AC(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v15[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4LL));
  }

  else
  {
    id v12 = sub_1001768B4(1);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100172804();
    }
    v11 = 0LL;
  }

  return v11;
}

+ (id)keyChainQueryForDeleteFrozenThreadNetworkRecordOperation:(id)a3
{
  v9[0] = kSecAttrAccount;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 credentialsDataSet]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSetArray]);
  id v5 = sub_1001721AC(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = v6;
  v10[1] = kSecClassInternetPassword;
  v9[1] = kSecClass;
  v9[2] = kSecAttrSynchronizable;
  v10[2] = kSecAttrSynchronizableAny;
  v10[3] = @"com.apple.frozen.network";
  v9[3] = kSecAttrAccessGroup;
  v9[4] = kSecAttrSyncViewHint;
  v10[4] = kSecAttrViewHintHome;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  5LL));

  return v7;
}

+ (id)keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrAccessGroup;
  v3[3] = kSecAttrSyncViewHint;
  v4[2] = @"com.apple.frozen.network";
  v4[3] = kSecAttrViewHintHome;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (id)keyChainQueryForFetchFrozenThreadNetworkRecordsOperation
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrAccessGroup;
  v3[3] = kSecAttrSyncViewHint;
  v4[2] = @"com.apple.frozen.network";
  v4[3] = kSecAttrViewHintHome;
  void v3[4] = kSecAttrAccessible;
  v3[5] = kSecReturnData;
  v3[6] = kSecReturnAttributes;
  v3[7] = kSecMatchLimit;
  void v4[4] = kSecAttrAccessibleAlways;
  v4[5] = &__kCFBooleanTrue;
  v4[6] = &__kCFBooleanTrue;
  v4[7] = kSecMatchLimitAll;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)keyChainQueryForFrozenThreadNetworkRecordOperationForCredentialsDataSet:(id)a3
{
  v9[0] = kSecAttrAccount;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 credentialsDataSet]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSetArray]);
  id v5 = sub_1001721AC(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = v6;
  v10[1] = kSecClassInternetPassword;
  v9[1] = kSecClass;
  v9[2] = kSecAttrSynchronizable;
  v10[2] = kSecAttrSynchronizableAny;
  v10[3] = kSecAttrSynchronizableAny;
  v9[3] = kSecAttrSynchronizable;
  v9[4] = kSecAttrAccessGroup;
  v10[4] = @"com.apple.frozen.network";
  void v10[5] = kSecAttrViewHintHome;
  void v9[5] = kSecAttrSyncViewHint;
  v9[6] = kSecReturnData;
  v10[6] = &__kCFBooleanTrue;
  void v10[7] = &__kCFBooleanTrue;
  void v9[7] = kSecReturnAttributes;
  v9[8] = kSecMatchLimit;
  v10[8] = kSecMatchLimitAll;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  9LL));

  return v7;
}

@end