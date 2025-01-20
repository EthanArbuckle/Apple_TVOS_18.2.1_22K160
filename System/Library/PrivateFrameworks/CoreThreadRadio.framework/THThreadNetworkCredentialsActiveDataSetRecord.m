@interface THThreadNetworkCredentialsActiveDataSetRecord
+ (id)activeDataSetRecordFromKeychainDictionary:(id)a3;
+ (id)computedUniqueIdentifierForBorderAgent:(id)a3 network:(id)a4 keychainAccessGroup:(id)a5;
+ (id)computedUniqueIdentifierForNetwork:(id)a3 keychainAccessGroup:(id)a4;
+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:(id)a3 count:(int)a4;
+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 count:(int)a4 clientKeychainAccessGroup:(id)a5;
+ (id)keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:(id)a3;
+ (id)keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4;
+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:(id)a3;
+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifier:(id)a3;
+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:(id)a3;
+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:(id)a3;
+ (id)keyChainQueryForDeleteNumberOfActiveDataSetOperationWithKeychainAccessGroup:(id)a3 count:(int)a4;
+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:(id)a3;
+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4;
+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:(id)a3;
+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:(id)a3;
+ (id)keyChainQueryForFetchAllActiveDataSetRecordsOperation;
+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:(id)a3;
+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:(id)a3;
- (id)computedUniqueIdentifier;
- (id)computedUniqueIdentifierWithBorderAgent;
- (id)keyChainItemRepresentationForActiveDataSetRecordAddOperation;
- (id)keyChainItemRepresentationForActiveDataSetRecordUpdateOperation;
- (id)keyChainQueryForActiveDataSetRecordUpdateOperation;
@end

@implementation THThreadNetworkCredentialsActiveDataSetRecord

+ (id)computedUniqueIdentifierForNetwork:(id)a3 keychainAccessGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &unk_10022BE30, 0x10u);
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 networkName]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
      CC_LONG v9 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifierForNetwork:keychainAccessGroup:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "computedUniqueIdentifierForNetwork:keychainAccessGroup:",  v8,  @"com.apple.thread.dataset"));

      return v9;
    }
  }

  else
  {
  }

  id v10 = sub_1001768B4(1);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1001761E0(self, v11);
  }

  CC_LONG v9 = 0LL;
  return v9;
}

+ (id)computedUniqueIdentifierForBorderAgent:(id)a3 network:(id)a4 keychainAccessGroup:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &unk_10022BE30, 0x10u);
  id v10 = v7;
  id v11 = [v10 UTF8String];
  CC_LONG v12 = [v10 lengthOfBytesUsingEncoding:4];

  CC_SHA256_Update(&c, v11, v12);
  id v13 = objc_claimAutoreleasedReturnValue([v8 networkName]);
  id v14 = [v13 UTF8String];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 networkName]);
  CC_SHA256_Update(&c, v14, (CC_LONG)[v15 lengthOfBytesUsingEncoding:4]);

  id v16 = objc_claimAutoreleasedReturnValue([v8 extendedPANID]);
  id v17 = [v16 bytes];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 extendedPANID]);

  CC_SHA256_Update(&c, v17, (CC_LONG)[v18 length]);
  id v19 = objc_claimAutoreleasedReturnValue([v9 discriminatorId]);
  id v20 = [v19 bytes];
  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 discriminatorId]);

  CC_SHA256_Update(&c, v20, (CC_LONG)[v21 length]);
  CC_SHA256_Final(md, &c);
  __int128 v25 = *(_OWORD *)md;
  BYTE6(v25) = md[6] & 0xF | 0x50;
  BYTE8(v25) = md[8] & 0x3F | 0x80;
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v25);
}

- (id)computedUniqueIdentifierWithBorderAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 networkName]);
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  if (!v7)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }

  id v8 = (void *)v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord borderAgent](self, "borderAgent"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 discriminatorId]);
  if (!v10)
  {

    goto LABEL_7;
  }

  id v11 = (void *)v10;
  CC_LONG v12 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord keychainAccessGroup](self, "keychainAccessGroup"));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord borderAgent](self, "borderAgent"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord keychainAccessGroup](self, "keychainAccessGroup"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifierForBorderAgent:network:keychainAccessGroup:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "computedUniqueIdentifierForBorderAgent:network:keychainAccessGroup:",  v13,  v14,  v15));

    return v16;
  }

+ (id)activeDataSetRecordFromKeychainDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  }
  else {
    uint64_t v8 = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrServer]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    CC_LONG v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrServer]);
  }
  else {
    CC_LONG v12 = 0LL;
  }

  id v13 = sub_10017401C(v12);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrProtocol]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0) {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrProtocol]);
  }
  else {
    v18 = 0LL;
  }

  id v19 = sub_10017401C(v18);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrSecurityDomain]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v21);
  v83 = (void *)v8;
  v84 = (void *)v14;
  if ((objc_opt_isKindOfClass(v20, v22) & 1) == 0)
  {

    v23 = 0LL;
    goto LABEL_18;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrSecurityDomain]);

  if (!v23)
  {
LABEL_18:
    __int128 v25 = 0LL;
    goto LABEL_19;
  }

  v24 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v23);
  __int128 v25 = v24;
  if (v8 && v14 && v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSData, v27);
    if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0) {
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
    }
    else {
      v29 = 0LL;
    }

    id v85 = 0LL;
    id v34 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___THThreadNetworkCredentials, v33),  v29,  &v85);
    v35 = (THThreadNetworkCredentials *)objc_claimAutoreleasedReturnValue(v34);
    id v80 = v85;
    if (!v35)
    {
      id v36 = sub_1001768B4(1);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10017670C();
      }

      v38 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials);
      LOBYTE(v72) = 0;
      v35 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:]( v38,  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:",  0LL,  0LL,  0LL,  kTHNetworkChannel_None,  0LL,  0LL,  0LL,  v72);
    }

    v39 = v35;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentials credentialsDataSet](v35, "credentialsDataSet"));

    v81 = v39;
    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentials credentialsDataSet](v39, "credentialsDataSet"));

      if (!v41)
      {
        id v50 = sub_1001768B4(1);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_1001765FC();
        }
        goto LABEL_42;
      }

      if (!v82)
      {
        id v42 = sub_1001768B4(1);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_100176670(v43);
        }
LABEL_42:
        v31 = 0LL;
        v51 = v80;
LABEL_67:

        goto LABEL_22;
      }
    }

    else
    {
      id v44 = sub_1001768B4(1);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100176588();
      }

      v46 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsDataSet),  "initWithDataSetArray:userInfo:",  0LL,  0LL);
      -[THThreadNetworkCredentials setCredentialsDataSet:](v39, "setCredentialsDataSet:", v46);
    }

    v43 = (os_log_s *)[[THThreadNetwork alloc] initWithName:v83 extendedPANID:v84];
    if (!v43)
    {
      id v52 = sub_1001768B4(1);
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      v51 = v80;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        sub_1001763CC();
      }
      v31 = 0LL;
      goto LABEL_66;
    }

    v79 = (os_log_s *)[[THThreadNetworkBorderAgent alloc] initWithBaDiscrId:v82];
    if (!v79)
    {
      id v53 = sub_1001768B4(1);
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        sub_100176440();
      }
      v31 = 0LL;
      v51 = v80;
      goto LABEL_65;
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:"));
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSDate, v48);
    if ((objc_opt_isKindOfClass(v47, v49) & 1) != 0) {
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
    }
    else {
      v78 = 0LL;
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:"));
    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSDate, v55);
    if ((objc_opt_isKindOfClass(v54, v56) & 1) != 0) {
      v75 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
    }
    else {
      v75 = 0LL;
    }
    v76 = v43;

    v57 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrPath]);
    uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSString, v58);
    if ((objc_opt_isKindOfClass(v57, v59) & 1) != 0)
    {
      uint64_t v60 = objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrPath]);

      v51 = v80;
      v77 = (void *)v60;
      if (v60)
      {
        v61 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord);
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentials credentialsDataSet](v81, "credentialsDataSet"));
        v31 = -[THThreadNetworkCredentialsActiveDataSetRecord initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( v61,  "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creation Date:lastModificationDate:",  v79,  v73,  v76,  v81,  v25,  v60,  v78,  v75);

        v62 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifier]( v31,  "computedUniqueIdentifier"));
        if (([v62 isEqual:v25] & 1) == 0)
        {
          id v63 = sub_1001768B4(1);
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_1001764E8(v31, (uint64_t)v62, v74);
          }
        }

LABEL_64:
        v43 = v76;

LABEL_65:
LABEL_66:

        goto LABEL_67;
      }
    }

    else
    {

      v51 = v80;
    }

    id v64 = sub_1001768B4(1);
    v77 = (void *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_ERROR)) {
      sub_1001764B4((os_log_s *)v77, v65, v66, v67, v68, v69, v70, v71);
    }
    v31 = 0LL;
    goto LABEL_64;
  }

- (id)keyChainItemRepresentationForActiveDataSetRecordAddOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForActiveDataSetRecordUpdateOperation]( self,  "keyChainQueryForActiveDataSetRecordUpdateOperation"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsActiveDataSetRecord keyChainItemRepresentationForActiveDataSetRecordUpdateOperation]( self,  "keyChainItemRepresentationForActiveDataSetRecordUpdateOperation"));
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
    v20[2] = @"com.apple.thread.dataset";
    v20[3] = kSecAttrViewHintHome;
    v19[4] = kSecAttrAccessible;
    v19[5] = kSecAttrDescription;
    v20[4] = kSecAttrAccessibleAlways;
    v20[5] = @"Thread network credentials Active Data Set Record";
    v19[6] = kSecAttrPath;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord keychainAccessGroup](self, "keychainAccessGroup"));
    v20[6] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  7LL));
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

- (id)keyChainQueryForActiveDataSetRecordUpdateOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifier]( self,  "computedUniqueIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 networkName]);
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 extendedPANID]);
  if (!v8)
  {

LABEL_7:
    goto LABEL_8;
  }

  id v9 = (void *)v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord borderAgent](self, "borderAgent"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 discriminatorId]);

  if (v11 && v3)
  {
    v26[0] = kSecClass;
    v26[1] = kSecAttrSynchronizable;
    v27[0] = kSecClassInternetPassword;
    v27[1] = kSecAttrSynchronizableAny;
    v27[2] = kSecAttrViewHintHome;
    v26[2] = kSecAttrSyncViewHint;
    v26[3] = kSecAttrAccount;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v12 networkName]);
    v27[3] = v25;
    v26[4] = kSecAttrServer;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord network](self, "network"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 extendedPANID]);
    id v15 = sub_1001744E8(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v27[4] = v16;
    v26[5] = kSecAttrProtocol;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord borderAgent](self, "borderAgent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 discriminatorId]);
    id v19 = sub_1001744E8(v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v27[5] = v20;
    v26[6] = kSecAttrSecurityDomain;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
    v27[6] = v21;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  7LL));

    goto LABEL_11;
  }

- (id)keyChainItemRepresentationForActiveDataSetRecordUpdateOperation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsActiveDataSetRecord credentials](self, "credentials"));
  id v7 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  &v7));
  id v4 = v7;

  CFStringRef v8 = kSecValueData;
  id v9 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  return v5;
}

+ (id)keyChainQueryForFetchAllActiveDataSetRecordsOperation
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrSyncViewHint;
  v3[3] = kSecReturnData;
  v4[2] = kSecAttrViewHintHome;
  v4[3] = &__kCFBooleanTrue;
  v3[4] = kSecReturnAttributes;
  v3[5] = kSecMatchLimit;
  v4[4] = &__kCFBooleanTrue;
  v4[5] = kSecMatchLimitAll;
  v3[6] = kSecAttrAccessGroup;
  v4[6] = @"com.apple.thread.dataset";
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:(id)a3
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

+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:(id)a3
{
  v7[0] = kSecAttrServer;
  id v3 = sub_1001744E8(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8[0] = v4;
  v8[1] = kSecClassInternetPassword;
  v7[1] = kSecClass;
  v7[2] = kSecAttrSynchronizable;
  v8[2] = kSecAttrSynchronizableAny;
  v8[3] = kSecAttrViewHintHome;
  v7[3] = kSecAttrSyncViewHint;
  v7[4] = kSecReturnData;
  v8[4] = &__kCFBooleanTrue;
  v8[5] = &__kCFBooleanTrue;
  v7[5] = kSecReturnAttributes;
  v7[6] = kSecMatchLimit;
  void v7[7] = kSecAttrAccessGroup;
  v8[6] = kSecMatchLimitAll;
  v8[7] = @"com.apple.thread.dataset";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  8LL));

  return v5;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:(id)a3
{
  v8[0] = kSecAttrProtocol;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 discriminatorId]);
  id v4 = sub_1001744E8(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[0] = v5;
  v9[1] = kSecClassInternetPassword;
  v8[1] = kSecClass;
  v8[2] = kSecAttrSynchronizable;
  v9[2] = kSecAttrSynchronizableAny;
  v9[3] = kSecAttrViewHintHome;
  v8[3] = kSecAttrSyncViewHint;
  v8[4] = kSecReturnData;
  v9[4] = &__kCFBooleanTrue;
  v9[5] = &__kCFBooleanTrue;
  v8[5] = kSecReturnAttributes;
  v8[6] = kSecMatchLimit;
  v8[7] = kSecAttrAccessGroup;
  v9[6] = kSecMatchLimitAll;
  v9[7] = @"com.apple.thread.dataset";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  8LL));

  return v6;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:(id)a3
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
  v10[8] = kSecAttrAccessGroup;
  v11[7] = kSecMatchLimitAll;
  v11[8] = @"com.apple.thread.dataset";
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  9LL));

  return v8;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4
{
  v15[0] = kSecAttrProtocol;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 discriminatorId]);
  id v7 = sub_1001744E8(v6);
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v16[0] = v8;
  v15[1] = kSecAttrAccount;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 networkName]);
  v16[1] = v9;
  v15[2] = kSecAttrServer;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedPANID]);

  id v11 = sub_1001744E8(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v16[2] = v12;
  v16[3] = kSecClassInternetPassword;
  v15[3] = kSecClass;
  v15[4] = kSecAttrSynchronizable;
  v16[4] = kSecAttrSynchronizableAny;
  v16[5] = kSecAttrViewHintHome;
  v15[5] = kSecAttrSyncViewHint;
  v15[6] = kSecReturnData;
  v16[6] = &__kCFBooleanTrue;
  v16[7] = &__kCFBooleanTrue;
  v15[7] = kSecReturnAttributes;
  v15[8] = kSecMatchLimit;
  v15[9] = kSecAttrAccessGroup;
  v16[8] = kSecMatchLimitAll;
  v16[9] = @"com.apple.thread.dataset";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  10LL));

  return v13;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:(id)a3
{
  v6[0] = kSecAttrPath;
  v6[1] = kSecClass;
  v7[0] = a3;
  v7[1] = kSecClassInternetPassword;
  v6[2] = kSecAttrSynchronizable;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  v6[4] = kSecReturnData;
  v6[5] = kSecReturnAttributes;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[6] = kSecMatchLimit;
  void v6[7] = kSecAttrAccessGroup;
  v7[6] = kSecMatchLimitAll;
  void v7[7] = @"com.apple.thread.dataset";
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  8LL));

  return v4;
}

+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifier:(id)a3
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

+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:(id)a3
{
  v8[0] = kSecAttrProtocol;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 discriminatorId]);
  id v4 = sub_1001744E8(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[0] = v5;
  v9[1] = kSecClassInternetPassword;
  v8[1] = kSecClass;
  v8[2] = kSecAttrSynchronizable;
  v8[3] = kSecAttrSyncViewHint;
  v9[2] = kSecAttrSynchronizableAny;
  v9[3] = kSecAttrViewHintHome;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

+ (id)keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4
{
  v15[0] = kSecAttrProtocol;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 discriminatorId]);
  id v7 = sub_1001744E8(v6);
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v16[0] = v8;
  v15[1] = kSecAttrAccount;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 networkName]);
  v16[1] = v9;
  v15[2] = kSecAttrServer;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedPANID]);

  id v11 = sub_1001744E8(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v16[2] = v12;
  v16[3] = kSecClassInternetPassword;
  v15[3] = kSecClass;
  v15[4] = kSecAttrSynchronizable;
  v15[5] = kSecAttrSyncViewHint;
  v16[4] = kSecAttrSynchronizableAny;
  v16[5] = kSecAttrViewHintHome;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  6LL));

  return v13;
}

+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v10[0] = a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecAttrSecurityDomain;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  void v9[4] = kSecAttrSyncViewHint;
  v9[5] = kSecReturnData;
  v10[5] = &__kCFBooleanTrue;
  v10[6] = &__kCFBooleanTrue;
  v9[6] = kSecReturnAttributes;
  v9[7] = kSecMatchLimit;
  v10[7] = kSecMatchLimitAll;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  8LL));

  return v7;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v12[0] = a4;
  v11[0] = kSecAttrPath;
  v11[1] = kSecAttrProtocol;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 discriminatorId]);
  id v7 = sub_1001744E8(v6);
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v12[2] = kSecClassInternetPassword;
  v11[2] = kSecClass;
  v11[3] = kSecAttrSynchronizable;
  v12[3] = kSecAttrSynchronizableAny;
  v12[4] = kSecAttrViewHintHome;
  v11[4] = kSecAttrSyncViewHint;
  v11[5] = kSecReturnData;
  v12[5] = &__kCFBooleanTrue;
  v12[6] = &__kCFBooleanTrue;
  v11[6] = kSecReturnAttributes;
  v11[7] = kSecMatchLimit;
  v12[7] = kSecMatchLimitAll;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  8LL));

  return v9;
}

+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v10[0] = a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecAttrSecurityDomain;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  void v9[4] = kSecAttrSyncViewHint;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  5LL));

  return v7;
}

+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v12[0] = a4;
  v11[0] = kSecAttrPath;
  v11[1] = kSecAttrProtocol;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 discriminatorId]);
  id v7 = sub_1001744E8(v6);
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v12[2] = kSecClassInternetPassword;
  v11[2] = kSecClass;
  v11[3] = kSecAttrSynchronizable;
  v11[4] = kSecAttrSyncViewHint;
  v12[3] = kSecAttrSynchronizableAny;
  v12[4] = kSecAttrViewHintHome;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  5LL));

  return v9;
}

+ (id)keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:(id)a3
{
  v10[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 networkName]);
  v11[0] = v4;
  v10[1] = kSecAttrServer;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 extendedPANID]);

  id v6 = sub_1001744E8(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[1] = v7;
  v11[2] = kSecClassInternetPassword;
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v11[3] = kSecAttrSynchronizableAny;
  v11[4] = kSecAttrViewHintHome;
  v10[4] = kSecAttrSyncViewHint;
  void v10[5] = kSecReturnData;
  void v11[5] = &__kCFBooleanTrue;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = kSecReturnAttributes;
  v10[7] = kSecMatchLimit;
  void v10[8] = kSecAttrAccessGroup;
  v11[7] = kSecMatchLimitOne;
  void v11[8] = @"com.apple.thread.dataset";
  CFStringRef v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  9LL));

  return v8;
}

+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 count:(int)a4 clientKeychainAccessGroup:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v16[0] = kSecAttrAccount;
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 networkName]);
  v17[0] = v9;
  v16[1] = kSecAttrServer;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 extendedPANID]);

  id v11 = sub_1001744E8(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v17[1] = v12;
  v17[2] = v7;
  v16[2] = kSecAttrPath;
  v16[3] = kSecClass;
  v17[3] = kSecClassInternetPassword;
  v17[4] = kSecAttrSynchronizableAny;
  v16[4] = kSecAttrSynchronizable;
  v16[5] = kSecAttrSyncViewHint;
  v17[5] = kSecAttrViewHintHome;
  v17[6] = &__kCFBooleanTrue;
  void v16[6] = kSecReturnData;
  v16[7] = kSecReturnAttributes;
  v17[7] = &__kCFBooleanTrue;
  v16[8] = kSecMatchLimit;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  v16[9] = kSecAttrAccessGroup;
  v17[8] = v13;
  v17[9] = @"com.apple.thread.dataset";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  10LL));

  return v14;
}

+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecClass;
  v10[0] = a3;
  v10[1] = kSecClassInternetPassword;
  v9[2] = kSecAttrSynchronizable;
  v9[3] = kSecAttrSyncViewHint;
  v10[2] = kSecAttrSynchronizableAny;
  v10[3] = kSecAttrViewHintHome;
  void v9[4] = kSecReturnData;
  void v9[5] = kSecReturnAttributes;
  v10[4] = &__kCFBooleanTrue;
  void v10[5] = &__kCFBooleanTrue;
  v9[6] = kSecMatchLimit;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v9[7] = kSecAttrAccessGroup;
  v10[6] = v6;
  v10[7] = @"com.apple.thread.dataset";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  8LL));

  return v7;
}

+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v13[0] = kSecAttrAccount;
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 networkName]);
  v14[0] = v7;
  v13[1] = kSecAttrServer;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);

  id v9 = sub_1001744E8(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14[1] = v10;
  v14[2] = v5;
  v13[2] = kSecAttrPath;
  v13[3] = kSecClass;
  v14[3] = kSecClassInternetPassword;
  v14[4] = kSecAttrSynchronizableAny;
  v13[4] = kSecAttrSynchronizable;
  v13[5] = kSecAttrSyncViewHint;
  v13[6] = kSecAttrAccessGroup;
  v14[5] = kSecAttrViewHintHome;
  v14[6] = @"com.apple.thread.dataset";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  7LL));

  return v11;
}

+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:(id)a3
{
  v10[0] = kSecAttrAccount;
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 networkName]);
  v11[0] = v4;
  v10[1] = kSecAttrServer;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 extendedPANID]);

  id v6 = sub_1001744E8(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[1] = v7;
  v11[2] = kSecClassInternetPassword;
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v11[3] = kSecAttrSynchronizableAny;
  v11[4] = kSecAttrViewHintHome;
  v10[4] = kSecAttrSyncViewHint;
  void v10[5] = kSecAttrAccessGroup;
  void v11[5] = @"com.apple.thread.dataset";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  6LL));

  return v8;
}

+ (id)keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:(id)a3
{
  v6[0] = kSecAttrPath;
  v6[1] = kSecClass;
  v7[0] = a3;
  v7[1] = kSecClassInternetPassword;
  v6[2] = kSecAttrSynchronizable;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  void v6[4] = kSecAttrAccessGroup;
  void v7[4] = @"com.apple.thread.dataset";
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  5LL));

  return v4;
}

+ (id)keyChainQueryForDeleteNumberOfActiveDataSetOperationWithKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecClass;
  v10[0] = a3;
  v10[1] = kSecClassInternetPassword;
  v9[2] = kSecAttrSynchronizable;
  v9[3] = kSecAttrSyncViewHint;
  v10[2] = kSecAttrSynchronizableAny;
  v10[3] = kSecAttrViewHintHome;
  void v9[4] = kSecMatchLimit;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  void v9[5] = kSecAttrAccessGroup;
  v10[4] = v6;
  void v10[5] = @"com.apple.thread.dataset";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  6LL));

  return v7;
}

  ;
}

@end