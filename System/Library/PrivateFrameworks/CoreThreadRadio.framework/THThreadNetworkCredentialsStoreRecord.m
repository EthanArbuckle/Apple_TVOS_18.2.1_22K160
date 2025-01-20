@interface THThreadNetworkCredentialsStoreRecord
+ (id)computedUniqueIdentifierForNetwork:(id)a3 keychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteAllCredentialsRecord;
+ (id)keyChainQueryForDeleteOperationForUniqueIdentifier:(id)a3;
+ (id)keyChainQueryForFetchAllOperation;
+ (id)keyChainQueryForFetchOneOperationForUniqueIdentifier:(id)a3;
+ (id)keyChainQueryForFetchOperationForNetwork:(id)a3;
+ (id)recordFromKeychainDictionary:(id)a3;
- (id)computedUniqueIdentifier;
- (id)keyChainItemRepresentationForAddOperation;
- (id)keyChainItemRepresentationForUpdateOperation;
- (id)keyChainQueryForUpdateOperation;
@end

@implementation THThreadNetworkCredentialsStoreRecord

+ (id)computedUniqueIdentifierForNetwork:(id)a3 keychainAccessGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &unk_10022BEAA, 0x10u);
  id v7 = v5;
  id v8 = [v7 UTF8String];
  CC_LONG v9 = [v7 lengthOfBytesUsingEncoding:4];

  CC_SHA256_Update(&c, v8, v9);
  id v10 = objc_claimAutoreleasedReturnValue([v6 networkName]);
  id v11 = [v10 UTF8String];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 networkName]);
  CC_SHA256_Update(&c, v11, (CC_LONG)[v12 lengthOfBytesUsingEncoding:4]);

  id v13 = objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  id v14 = [v13 bytes];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);

  CC_SHA256_Update(&c, v14, (CC_LONG)[v15 length]);
  CC_SHA256_Final(md, &c);
  __int128 v19 = *(_OWORD *)md;
  BYTE6(v19) = md[6] & 0xF | 0x50;
  BYTE8(v19) = md[8] & 0x3F | 0x80;
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v19);
}

- (id)computedUniqueIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 networkName]);
  if (!v4) {
    goto LABEL_6;
  }
  id v5 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  if (!v7)
  {

LABEL_6:
    goto LABEL_7;
  }

  id v8 = (void *)v7;
  CC_LONG v9 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord keychainAccessGroup](self, "keychainAccessGroup"));

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord keychainAccessGroup](self, "keychainAccessGroup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsStoreRecord computedUniqueIdentifierForNetwork:keychainAccessGroup:]( &OBJC_CLASS___THThreadNetworkCredentialsStoreRecord,  "computedUniqueIdentifierForNetwork:keychainAccessGroup:",  v10,  v11));

    return v12;
  }

+ (id)recordFromKeychainDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  }
  else {
    id v8 = 0LL;
  }

  CC_LONG v9 = (NSData *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrServer]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    id v13 = 0LL;
    v12 = 0LL;
    goto LABEL_8;
  }

  v12 = (NSData *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrServer]);

  if (v12)
  {
    CC_LONG v9 = v12;
    v12 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v9,  0LL);
    id v13 = v9;
LABEL_8:

    goto LABEL_9;
  }

  id v13 = 0LL;
LABEL_9:
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrSecurityDomain]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) == 0)
  {

    v17 = 0LL;
    goto LABEL_17;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrSecurityDomain]);

  if (!v17)
  {
LABEL_17:
    __int128 v19 = 0LL;
    goto LABEL_18;
  }

  v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v17);
  __int128 v19 = v18;
  if (v8 && v12 && v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSData, v21);
    v59 = v4;
    if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0) {
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
    }
    else {
      v23 = 0LL;
    }

    id v63 = 0LL;
    id v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___THThreadNetworkCredentials, v27),  v23,  &v63);
    v29 = (THThreadNetworkCredentials *)objc_claimAutoreleasedReturnValue(v28);
    id v58 = v63;
    if (!v29)
    {
      id v30 = sub_1001768B4(1);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10019BD68();
      }

      v32 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials);
      LOBYTE(v54) = 0;
      v29 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:]( v32,  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:",  0LL,  0LL,  0LL,  kTHNetworkChannel_None,  0LL,  0LL,  0LL,  v54);
    }

    id v60 = [[THThreadNetwork alloc] initWithName:v8 extendedPANID:v12];
    v61 = v29;
    if (!v60)
    {
      id v36 = sub_1001768B4(1);
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_10019BC44();
      }
      v25 = 0LL;
      v37 = v58;
      goto LABEL_50;
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDate, v34);
    if ((objc_opt_isKindOfClass(v33, v35) & 1) != 0) {
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
    }
    else {
      v62 = 0LL;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
    uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSDate, v39);
    if ((objc_opt_isKindOfClass(v38, v40) & 1) != 0) {
      v57 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
    }
    else {
      v57 = 0LL;
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrPath]);
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString, v42);
    if ((objc_opt_isKindOfClass(v41, v43) & 1) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrPath]);

      v37 = v58;
      if (v44)
      {
        v25 = -[THThreadNetworkCredentialsStoreRecord initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreRecord),  "initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:",  v60,  v61,  v19,  v44,  v62,  v57);
        v56 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreRecord computedUniqueIdentifier]( v25,  "computedUniqueIdentifier"));
        if (([v56 isEqual:v19] & 1) == 0)
        {
          id v45 = sub_1001768B4(1);
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
            sub_10019BCBC(v25, (uint64_t)v56, v55);
          }
        }

LABEL_49:
        uint64_t v4 = v59;
LABEL_50:

        goto LABEL_21;
      }
    }

    else
    {

      v37 = v58;
    }

    id v46 = sub_1001768B4(1);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR)) {
      sub_1001764B4((os_log_s *)v44, v47, v48, v49, v50, v51, v52, v53);
    }
    v25 = 0LL;
    goto LABEL_49;
  }

- (id)keyChainItemRepresentationForAddOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreRecord keyChainQueryForUpdateOperation]( self,  "keyChainQueryForUpdateOperation"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreRecord keyChainItemRepresentationForUpdateOperation]( self,  "keyChainItemRepresentationForUpdateOperation"));
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [v3 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    v19[0] = kSecAttrIsInvisible;
    v19[1] = kSecAttrSynchronizable;
    v20[0] = &__kCFBooleanTrue;
    v20[1] = &__kCFBooleanTrue;
    v19[2] = kSecAttrAccessGroup;
    v19[3] = kSecAttrSyncViewHint;
    v20[2] = @"com.apple.thread.network";
    v20[3] = kSecAttrViewHintHome;
    v19[4] = kSecAttrAccessible;
    v19[5] = kSecAttrDescription;
    v20[4] = kSecAttrAccessibleAlways;
    v20[5] = @"Thread network credentials";
    v19[6] = kSecAttrPath;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord keychainAccessGroup](self, "keychainAccessGroup"));
    v20[6] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  7LL));
    [v6 addEntriesFromDictionary:v8];

    id v9 = [v6 copy];
  }

  else
  {
    id v10 = sub_1001768B4(1);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_100176780((os_log_s *)v6, v11, v12, v13, v14, v15, v16, v17);
    }
    id v9 = 0LL;
  }

  return v9;
}

- (id)keyChainQueryForUpdateOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord computedUniqueIdentifier](self, "computedUniqueIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 networkName]);
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 extendedPANID]);

    if (v8 && v3)
    {
      v19[0] = kSecClass;
      v19[1] = kSecAttrSynchronizable;
      v20[0] = kSecClassInternetPassword;
      v20[1] = kSecAttrSynchronizableAny;
      v20[2] = kSecAttrViewHintHome;
      v19[2] = kSecAttrSyncViewHint;
      v19[3] = kSecAttrAccount;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 networkName]);
      v20[3] = v10;
      v19[4] = kSecAttrServer;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord network](self, "network"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 extendedPANID]);
      id v13 = sub_1001744E8(v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v20[4] = v14;
      v19[5] = kSecAttrSecurityDomain;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
      v20[5] = v15;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  6LL));

      goto LABEL_9;
    }
  }

  else
  {
  }

  id v17 = sub_1001768B4(1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
    sub_10019BDE0(self, (uint64_t)v3, (os_log_s *)v9);
  }
  uint64_t v16 = 0LL;
LABEL_9:

  return v16;
}

- (id)keyChainItemRepresentationForUpdateOperation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreRecord credentials](self, "credentials"));
  id v7 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  &v7));
  id v4 = v7;

  CFStringRef v8 = kSecValueData;
  id v9 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  return v5;
}

+ (id)keyChainQueryForFetchOneOperationForUniqueIdentifier:(id)a3
{
  v6[0] = kSecAttrSecurityDomain;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  v6[3] = kSecAttrSyncViewHint;
  v6[4] = kSecReturnData;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[5] = kSecReturnAttributes;
  v6[6] = kSecMatchLimit;
  v7[6] = kSecMatchLimitAll;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  7LL));

  return v4;
}

+ (id)keyChainQueryForFetchAllOperation
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrSyncViewHint;
  v3[3] = kSecReturnData;
  v3[4] = kSecReturnAttributes;
  v3[5] = kSecMatchLimit;
  v4[2] = kSecAttrViewHintHome;
  v4[3] = &__kCFBooleanTrue;
  v4[4] = &__kCFBooleanTrue;
  v4[5] = kSecMatchLimitAll;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

+ (id)keyChainQueryForFetchOperationForNetwork:(id)a3
{
  v10[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 networkName]);
  v11[0] = v4;
  v10[1] = kSecAttrServer;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 extendedPANID]);

  id v6 = sub_1001744E8(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[1] = v7;
  v11[2] = kSecClassInternetPassword;
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v11[3] = kSecAttrSynchronizableAny;
  v11[4] = kSecAttrViewHintHome;
  v10[4] = kSecAttrSyncViewHint;
  v10[5] = kSecReturnData;
  v11[5] = &__kCFBooleanTrue;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = kSecReturnAttributes;
  v10[7] = kSecMatchLimit;
  v11[7] = kSecMatchLimitAll;
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  8LL));

  return v8;
}

+ (id)keyChainQueryForDeleteOperationForUniqueIdentifier:(id)a3
{
  v6[0] = kSecAttrSecurityDomain;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));

  return v4;
}

+ (id)keyChainQueryForDeleteAllCredentialsRecord
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrAccessGroup;
  v3[3] = kSecAttrSyncViewHint;
  v4[2] = @"com.apple.thread.network";
  v4[3] = kSecAttrViewHintHome;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end