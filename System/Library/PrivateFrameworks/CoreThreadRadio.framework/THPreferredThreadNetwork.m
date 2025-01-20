@interface THPreferredThreadNetwork
+ (id)keyChainQueryForDeleteAllPreferredNetworks;
+ (id)keyChainQueryForDeletePreferredNetworkRecord:(id)a3;
+ (id)keyChainQueryForDeletePreferredNetworkRecordForNetworkSignature:(id)a3;
+ (id)keyChainQueryForDeletePreferredNetworkRecordOperationForNetworkName:(id)a3;
+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperation;
+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:(int)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetwork:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:(id)a3;
+ (id)preferredNetworkFromKeychainDictionary:(id)a3;
- (id)DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation;
- (id)DEBUGkeyChainQueryForpreferredNetworkUpdateOperation;
- (id)keyChainItemRepresentationForpreferredNetworkAddOperation;
- (id)keyChainItemRepresentationForpreferredNetworkUpdateOperation;
- (id)keyChainQueryForpreferredNetworkUpdateOperation;
@end

@implementation THPreferredThreadNetwork

+ (id)preferredNetworkFromKeychainDictionary:(id)a3
{
  id v3 = a3;
  context = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAccount]);
  }
  else {
    v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrServer]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrServer]);
  }
  else {
    v11 = 0LL;
  }

  v12 = sub_10017401C(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrPort]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrPort]);
  }
  else {
    v17 = 0LL;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrProtocol]);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v19);
  if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0) {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrProtocol]);
  }
  else {
    v21 = 0LL;
  }

  v91 = v17;
  v22 = sub_10017401C(v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v90 = v21;
  v24 = sub_10017401C(v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAuthenticationType]);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
  if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0) {
    v93 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrAuthenticationType]);
  }
  else {
    v93 = 0LL;
  }

  if (v7 && v13 && v23 && v25)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrSecurityDomain]);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString, v30);
    if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0)
    {
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrSecurityDomain]);

      if (v32) {
        goto LABEL_30;
      }
    }

    else
    {
    }

    id v35 = sub_1001768B4(1);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10019ED48();
    }

    v32 = (os_log_s *)&stru_1002B93F8;
LABEL_30:
    v89 = v13;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrLabel]);
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString, v38);
    if ((objc_opt_isKindOfClass(v37, v39) & 1) != 0)
    {
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrLabel]);

      if (v40)
      {
LABEL_37:
        v43 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
        uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSData, v44);
        v86 = v11;
        if ((objc_opt_isKindOfClass(v43, v45) & 1) != 0) {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
        }
        else {
          v46 = 0LL;
        }

        id v94 = 0LL;
        id v48 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord, v47),  v46,  &v94);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        id v85 = v94;
        id v50 = sub_1001768B4(1);
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        v52 = v51;
        v88 = v49;
        if (v49)
        {
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue([v49 network]);
            v54 = v40;
            v55 = (void *)objc_claimAutoreleasedReturnValue([v53 networkName]);
            *(_DWORD *)buf = 136315650;
            v96 = "+[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:]";
            __int16 v97 = 1024;
            int v98 = 107;
            __int16 v99 = 2112;
            v100 = v55;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%s: %d : credentials dataset record is present for preferred network entry : %@",  buf,  0x1Cu);

            v40 = v54;
            v13 = v89;
          }
        }

        else if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          sub_10019EC58();
        }

        v87 = v7;
        id v56 = [[THThreadNetwork alloc] initWithName:v7 extendedPANID:v13];
        if (v56)
        {
          v57 = (os_log_s *)[[THNetworkSignature alloc] initWithSignatures:v23 ipv6NwSignature:v25 wifSSID:v32 wifiPassword:v40];
          if (v57)
          {
            v84 = v40;
            v58 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
            uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSDate, v59);
            if ((objc_opt_isKindOfClass(v58, v60) & 1) != 0) {
              v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrCreationDate]);
            }
            else {
              v61 = 0LL;
            }

            v79 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
            uint64_t v81 = objc_opt_class(&OBJC_CLASS___NSDate, v80);
            if ((objc_opt_isKindOfClass(v79, v81) & 1) != 0) {
              v82 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecAttrModificationDate]);
            }
            else {
              v82 = 0LL;
            }

            v34 = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork),  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v56,  v57,  v88,  v61,  v82,  v93);
            v40 = v84;
          }

          else
          {
            id v71 = sub_1001768B4(1);
            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
              sub_10019EC24(v61, v72, v73, v74, v75, v76, v77, v78);
            }
            v34 = 0LL;
          }

          v70 = v85;
        }

        else
        {
          id v62 = sub_1001768B4(1);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          v70 = v85;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            sub_10019EBF0(v57, v63, v64, v65, v66, v67, v68, v69);
          }
          v34 = 0LL;
        }

        v11 = v86;
        v7 = v87;
        v13 = v89;
        goto LABEL_62;
      }
    }

    else
    {
    }

    id v41 = sub_1001768B4(1);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10019ECD0();
    }

    v40 = &stru_1002B93F8;
    goto LABEL_37;
  }

  id v33 = sub_1001768B4(1);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_10019EDC0();
  }
  v34 = 0LL;
LABEL_62:

  objc_autoreleasePoolPop(context);
  return v34;
}

- (id)DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[THPreferredThreadNetwork DEBUGkeyChainQueryForpreferredNetworkUpdateOperation]( self,  "DEBUGkeyChainQueryForpreferredNetworkUpdateOperation"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( -[THPreferredThreadNetwork keyChainItemRepresentationForpreferredNetworkUpdateOperation]( self,  "keyChainItemRepresentationForpreferredNetworkUpdateOperation"));
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [v3 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    v18[0] = kSecAttrIsInvisible;
    v18[1] = kSecAttrSynchronizable;
    v19[0] = &__kCFBooleanTrue;
    v19[1] = &__kCFBooleanTrue;
    v18[2] = kSecAttrAccessGroup;
    v18[3] = kSecAttrSyncViewHint;
    v19[2] = @"com.apple.preferred.network";
    v19[3] = kSecAttrViewHintHome;
    v18[4] = kSecAttrAccessible;
    v18[5] = kSecAttrDescription;
    v19[4] = kSecAttrAccessibleAlways;
    v19[5] = @"Preferred Thread network Record";
    v18[6] = kSecAttrPath;
    v19[6] = @"com.apple.preferred.network";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  7LL));
    [v6 addEntriesFromDictionary:v7];

    id v8 = [v6 copy];
  }

  else
  {
    id v9 = sub_1001768B4(1);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10019EE38((os_log_s *)v6, v10, v11, v12, v13, v14, v15, v16);
    }
    id v8 = 0LL;
  }

  return v8;
}

- (id)DEBUGkeyChainQueryForpreferredNetworkUpdateOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 networkName]);
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  if (!v7)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }

  id v8 = (void *)v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 ipv4NwSignature]);
  if (!v10)
  {

    goto LABEL_7;
  }

  uint64_t v11 = (void *)v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 ipv6NwSignature]);

  if (v13)
  {
    v32[0] = kSecClass;
    v32[1] = kSecAttrSynchronizable;
    v33[0] = kSecClassInternetPassword;
    v33[1] = kSecAttrSynchronizableAny;
    v33[2] = kSecAttrViewHintHome;
    v32[2] = kSecAttrSyncViewHint;
    v32[3] = kSecAttrAccount;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v14 networkName]);
    v33[3] = v31;
    v32[4] = kSecAttrServer;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v30 extendedPANID]);
    id v15 = sub_1001744E8(v29);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v33[4] = v16;
    v32[5] = kSecAttrPort;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 ipv4NwSignature]);
    id v19 = sub_1001744E8(v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v33[5] = v20;
    v32[6] = kSecAttrProtocol;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 ipv6NwSignature]);
    id v23 = sub_1001744E8(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v33[6] = v24;
    v32[7] = kSecAttrAuthenticationType;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork userInfo](self, "userInfo"));
    v33[7] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  8LL));

    goto LABEL_12;
  }

- (id)keyChainItemRepresentationForpreferredNetworkAddOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[THPreferredThreadNetwork keyChainQueryForpreferredNetworkUpdateOperation]( self,  "keyChainQueryForpreferredNetworkUpdateOperation"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( -[THPreferredThreadNetwork keyChainItemRepresentationForpreferredNetworkUpdateOperation]( self,  "keyChainItemRepresentationForpreferredNetworkUpdateOperation"));
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [v3 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    v18[0] = kSecAttrIsInvisible;
    v18[1] = kSecAttrSynchronizable;
    v19[0] = &__kCFBooleanTrue;
    v19[1] = &__kCFBooleanTrue;
    v18[2] = kSecAttrAccessGroup;
    v18[3] = kSecAttrSyncViewHint;
    v19[2] = @"com.apple.preferred.network";
    v19[3] = kSecAttrViewHintHome;
    v18[4] = kSecAttrAccessible;
    v18[5] = kSecAttrDescription;
    v19[4] = kSecAttrAccessibleAlways;
    v19[5] = @"Preferred Thread network Record";
    v18[6] = kSecAttrPath;
    v19[6] = @"com.apple.preferred.network";
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  7LL));
    [v6 addEntriesFromDictionary:v7];

    id v8 = [v6 copy];
  }

  else
  {
    id v9 = sub_1001768B4(1);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10019EF20((os_log_s *)v6, v10, v11, v12, v13, v14, v15, v16);
    }
    id v8 = 0LL;
  }

  return v8;
}

- (id)keyChainQueryForpreferredNetworkUpdateOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 networkName]);
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  if (!v7)
  {
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }

  id v8 = (void *)v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 ipv4NwSignature]);
  if (!v10)
  {
LABEL_10:

    goto LABEL_11;
  }

  uint64_t v11 = (void *)v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 ipv6NwSignature]);
  if (!v13)
  {
LABEL_9:

    goto LABEL_10;
  }

  uint64_t v14 = (void *)v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 wifiSSID]);
  if (!v16)
  {

    goto LABEL_9;
  }

  v55 = (void *)v16;
  uint64_t v59 = v15;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v53 wifiPassword]);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork userInfo](self, "userInfo"));
    BOOL v57 = v18 == 0LL;
  }

  else
  {
    BOOL v57 = 1;
  }

  if (!v57)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 wifiSSID]);
    if ([v24 length])
    {
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 wifiPassword]);
      id v27 = [v26 length];

      if (!v27)
      {
        v63[0] = kSecClass;
        v63[1] = kSecAttrSynchronizable;
        v64[0] = kSecClassInternetPassword;
        v64[1] = kSecAttrSynchronizableAny;
        v64[2] = kSecAttrViewHintHome;
        v63[2] = kSecAttrSyncViewHint;
        v63[3] = kSecAttrAccount;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
        uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v20 networkName]);
        v64[3] = v60;
        v63[4] = kSecAttrServer;
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
        id v56 = (void *)objc_claimAutoreleasedReturnValue([v58 extendedPANID]);
        id v39 = sub_1001744E8(v56);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v64[4] = v40;
        v63[5] = kSecAttrPort;
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 ipv4NwSignature]);
        id v43 = sub_1001744E8(v42);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v64[5] = v44;
        v63[6] = kSecAttrProtocol;
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 ipv6NwSignature]);
        id v47 = sub_1001744E8(v46);
        id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        v64[6] = v48;
        v63[7] = kSecAttrAuthenticationType;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork userInfo](self, "userInfo"));
        v64[7] = v49;
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  8LL));

        goto LABEL_23;
      }
    }

    v61[0] = kSecClass;
    v61[1] = kSecAttrSynchronizable;
    v62[0] = kSecClassInternetPassword;
    v62[1] = kSecAttrSynchronizableAny;
    v62[2] = kSecAttrViewHintHome;
    v61[2] = kSecAttrSyncViewHint;
    v61[3] = kSecAttrAccount;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v20 networkName]);
    v62[3] = v60;
    v61[4] = kSecAttrServer;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](self, "network"));
    id v56 = (void *)objc_claimAutoreleasedReturnValue([v58 extendedPANID]);
    id v28 = sub_1001744E8(v56);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v62[4] = v54;
    v61[5] = kSecAttrPort;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v52 ipv4NwSignature]);
    id v29 = sub_1001744E8(v51);
    id v50 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v62[5] = v50;
    v61[6] = kSecAttrProtocol;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 ipv6NwSignature]);
    id v32 = sub_1001744E8(v31);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v62[6] = v33;
    v61[7] = kSecAttrSecurityDomain;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 wifiSSID]);
    v62[7] = v35;
    v61[8] = kSecAttrLabel;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork networkSignature](self, "networkSignature"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 wifiPassword]);
    v62[8] = v37;
    v61[9] = kSecAttrAuthenticationType;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork userInfo](self, "userInfo"));
    v62[9] = v38;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  10LL));

LABEL_23:
    goto LABEL_16;
  }

- (id)keyChainItemRepresentationForpreferredNetworkUpdateOperation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork credentialsDataSetRecord](self, "credentialsDataSetRecord"));
  id v7 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  &v7));
  id v4 = v7;

  CFStringRef v8 = kSecValueData;
  id v9 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  return v5;
}

+ (id)keyChainQueryForDeletePreferredNetworkRecordOperationForNetworkName:(id)a3
{
  v12[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
  v13[0] = v5;
  v12[1] = kSecAttrServer;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
  id v8 = sub_1001744E8(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[1] = v9;
  v13[2] = kSecClassInternetPassword;
  v12[2] = kSecClass;
  v12[3] = kSecAttrSynchronizable;
  v13[3] = kSecAttrSynchronizableAny;
  v13[4] = @"com.apple.preferred.network";
  v12[4] = kSecAttrAccessGroup;
  v12[5] = kSecAttrSyncViewHint;
  v13[5] = kSecAttrViewHintHome;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  6LL));

  return v10;
}

+ (id)keyChainQueryForDeleteAllPreferredNetworks
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrAccessGroup;
  v3[3] = kSecAttrSyncViewHint;
  v4[2] = @"com.apple.preferred.network";
  v4[3] = kSecAttrViewHintHome;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperation
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrSynchronizable;
  v4[0] = kSecClassInternetPassword;
  v4[1] = kSecAttrSynchronizableAny;
  v3[2] = kSecAttrAccessGroup;
  v3[3] = kSecAttrSyncViewHint;
  v4[2] = @"com.apple.preferred.network";
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

+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:(int)a3
{
  v6[0] = kSecClass;
  v6[1] = kSecAttrSynchronizable;
  v7[0] = kSecClassInternetPassword;
  v7[1] = kSecAttrSynchronizableAny;
  v6[2] = kSecAttrAccessGroup;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = @"com.apple.preferred.network";
  v7[3] = kSecAttrViewHintHome;
  v6[4] = kSecAttrAccessible;
  v6[5] = kSecReturnData;
  v7[4] = kSecAttrAccessibleAlways;
  v7[5] = &__kCFBooleanTrue;
  v7[6] = &__kCFBooleanTrue;
  v6[6] = kSecReturnAttributes;
  v6[7] = kSecMatchLimit;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a3));
  v7[7] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  8LL));

  return v4;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetwork:(id)a3
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
  v11[4] = @"com.apple.preferred.network";
  v10[4] = kSecAttrAccessGroup;
  v10[5] = kSecAttrSyncViewHint;
  v10[6] = kSecReturnData;
  v10[7] = kSecReturnAttributes;
  v10[8] = kSecMatchLimit;
  v11[5] = kSecAttrViewHintHome;
  v11[6] = &__kCFBooleanTrue;
  v11[7] = &__kCFBooleanTrue;
  v11[8] = kSecMatchLimitAll;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  9LL));

  return v8;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
  id v5 = [v4 length];

  if (v5)
  {
    v26[0] = kSecAttrPort;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
    id v7 = sub_1001744E8(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v27[0] = v8;
    v26[1] = kSecAttrSecurityDomain;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
    v27[1] = v9;
    v26[2] = kSecAttrLabel;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiPassword]);
    v27[2] = v10;
    v27[3] = kSecClassInternetPassword;
    v26[3] = kSecClass;
    v26[4] = kSecAttrSynchronizable;
    v27[4] = kSecAttrSynchronizableAny;
    v27[5] = @"com.apple.preferred.network";
    v26[5] = kSecAttrAccessGroup;
    v26[6] = kSecAttrSyncViewHint;
    v26[7] = kSecReturnData;
    v26[8] = kSecReturnAttributes;
    v26[9] = kSecMatchLimit;
    v27[6] = kSecAttrViewHintHome;
    v27[7] = &__kCFBooleanTrue;
    v27[8] = &__kCFBooleanTrue;
    v27[9] = kSecMatchLimitAll;
    uint64_t v11 = v27;
    uint64_t v12 = v26;
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
    id v14 = [v13 length];

    if (!v14)
    {
      v22[0] = kSecAttrPort;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
      id v18 = sub_1001744E8(v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v23[0] = v8;
      v22[1] = kSecAttrProtocol;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
      id v19 = sub_1001744E8(v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v23[1] = v10;
      v22[2] = kSecAttrSecurityDomain;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
      v23[2] = v20;
      v22[3] = kSecAttrLabel;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiPassword]);
      v23[3] = v21;
      v23[4] = kSecClassInternetPassword;
      v22[4] = kSecClass;
      v22[5] = kSecAttrSynchronizable;
      v23[5] = kSecAttrSynchronizableAny;
      v23[6] = @"com.apple.preferred.network";
      v22[6] = kSecAttrAccessGroup;
      v22[7] = kSecAttrSyncViewHint;
      v22[8] = kSecReturnData;
      v22[9] = kSecReturnAttributes;
      v22[10] = kSecMatchLimit;
      v23[7] = kSecAttrViewHintHome;
      v23[8] = &__kCFBooleanTrue;
      v23[9] = &__kCFBooleanTrue;
      v23[10] = kSecMatchLimitAll;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  11LL));

      goto LABEL_6;
    }

    v24[0] = kSecAttrProtocol;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
    id v15 = sub_1001744E8(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v25[0] = v8;
    v24[1] = kSecAttrSecurityDomain;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
    v25[1] = v9;
    v24[2] = kSecAttrLabel;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiPassword]);
    v25[2] = v10;
    v25[3] = kSecClassInternetPassword;
    v24[3] = kSecClass;
    v24[4] = kSecAttrSynchronizable;
    v25[4] = kSecAttrSynchronizableAny;
    v25[5] = @"com.apple.preferred.network";
    v24[5] = kSecAttrAccessGroup;
    v24[6] = kSecAttrSyncViewHint;
    v24[7] = kSecReturnData;
    v24[8] = kSecReturnAttributes;
    v24[9] = kSecMatchLimit;
    v25[6] = kSecAttrViewHintHome;
    v25[7] = &__kCFBooleanTrue;
    v25[8] = &__kCFBooleanTrue;
    v25[9] = kSecMatchLimitAll;
    uint64_t v11 = v25;
    uint64_t v12 = v24;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  10LL));
LABEL_6:

  return v16;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:(id)a3
{
  v6[0] = kSecAttrSecurityDomain;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 wifiSSID]);
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = @"com.apple.preferred.network";
  v6[3] = kSecAttrAccessGroup;
  v6[4] = kSecAttrSyncViewHint;
  v6[5] = kSecReturnData;
  v6[6] = kSecReturnAttributes;
  v6[7] = kSecMatchLimit;
  v7[4] = kSecAttrViewHintHome;
  v7[5] = &__kCFBooleanTrue;
  v7[6] = &__kCFBooleanTrue;
  v7[7] = kSecMatchLimitAll;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  8LL));

  return v4;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:(id)a3
{
  v6[0] = kSecAttrLabel;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 wifiSSID]);
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = @"com.apple.preferred.network";
  v6[3] = kSecAttrAccessGroup;
  v6[4] = kSecAttrSyncViewHint;
  v6[5] = kSecReturnData;
  v6[6] = kSecReturnAttributes;
  v6[7] = kSecMatchLimit;
  v7[4] = kSecAttrViewHintHome;
  v7[5] = &__kCFBooleanTrue;
  v7[6] = &__kCFBooleanTrue;
  v7[7] = kSecMatchLimitAll;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  8LL));

  return v4;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
  id v5 = [v4 length];

  if (v5)
  {
    v24[0] = kSecAttrPort;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
    id v7 = sub_1001744E8(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v25[0] = v8;
    v25[1] = kSecClassInternetPassword;
    v24[1] = kSecClass;
    v24[2] = kSecAttrSynchronizable;
    v25[2] = kSecAttrSynchronizableAny;
    v25[3] = @"com.apple.preferred.network";
    v24[3] = kSecAttrAccessGroup;
    v24[4] = kSecAttrSyncViewHint;
    v24[5] = kSecReturnData;
    v24[6] = kSecReturnAttributes;
    v24[7] = kSecMatchLimit;
    v25[4] = kSecAttrViewHintHome;
    v25[5] = &__kCFBooleanTrue;
    v25[6] = &__kCFBooleanTrue;
    v25[7] = kSecMatchLimitAll;
    id v9 = v25;
    uint64_t v10 = v24;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
    id v12 = [v11 length];

    if (!v12)
    {
      v20[0] = kSecAttrPort;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
      id v16 = sub_1001744E8(v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v21[0] = v8;
      v20[1] = kSecAttrProtocol;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
      id v18 = sub_1001744E8(v17);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v21[1] = v19;
      v21[2] = kSecClassInternetPassword;
      v20[2] = kSecClass;
      v20[3] = kSecAttrSynchronizable;
      v21[3] = kSecAttrSynchronizableAny;
      v21[4] = @"com.apple.preferred.network";
      v20[4] = kSecAttrAccessGroup;
      v20[5] = kSecAttrSyncViewHint;
      v20[6] = kSecReturnData;
      v20[7] = kSecReturnAttributes;
      v20[8] = kSecMatchLimit;
      v21[5] = kSecAttrViewHintHome;
      v21[6] = &__kCFBooleanTrue;
      v21[7] = &__kCFBooleanTrue;
      v21[8] = kSecMatchLimitAll;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  9LL));

      goto LABEL_6;
    }

    v22[0] = kSecAttrProtocol;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
    id v13 = sub_1001744E8(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v23[0] = v8;
    v23[1] = kSecClassInternetPassword;
    v22[1] = kSecClass;
    v22[2] = kSecAttrSynchronizable;
    v23[2] = kSecAttrSynchronizableAny;
    v23[3] = @"com.apple.preferred.network";
    v22[3] = kSecAttrAccessGroup;
    v22[4] = kSecAttrSyncViewHint;
    v22[5] = kSecReturnData;
    v22[6] = kSecReturnAttributes;
    v22[7] = kSecMatchLimit;
    v23[4] = kSecAttrViewHintHome;
    v23[5] = &__kCFBooleanTrue;
    v23[6] = &__kCFBooleanTrue;
    v23[7] = kSecMatchLimitAll;
    id v9 = v23;
    uint64_t v10 = v22;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v10,  8LL));
LABEL_6:

  return v14;
}

+ (id)keyChainQueryForDeletePreferredNetworkRecord:(id)a3
{
  v22[0] = kSecAttrAccount;
  id v3 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v21 networkName]);
  v23[0] = v20;
  v22[1] = kSecAttrServer;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v19 extendedPANID]);
  id v4 = sub_1001744E8(v18);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v23[1] = v5;
  v22[2] = kSecAttrPort;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 ipv4NwSignature]);
  id v8 = sub_1001744E8(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v23[2] = v9;
  v22[3] = kSecAttrProtocol;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 ipv6NwSignature]);
  id v12 = sub_1001744E8(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v23[3] = v13;
  v22[4] = kSecAttrSecurityDomain;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 wifiSSID]);
  v23[4] = v15;
  v23[5] = kSecClassInternetPassword;
  v22[5] = kSecClass;
  v22[6] = kSecAttrSynchronizable;
  v23[6] = kSecAttrSynchronizableAny;
  v23[7] = @"com.apple.preferred.network";
  v22[7] = kSecAttrAccessGroup;
  void v22[8] = kSecAttrSyncViewHint;
  void v23[8] = kSecAttrViewHintHome;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  9LL));

  return v16;
}

+ (id)keyChainQueryForDeletePreferredNetworkRecordForNetworkSignature:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
  if (![v4 length]) {
    goto LABEL_6;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
  if (![v5 length])
  {

LABEL_6:
    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
  id v7 = [v6 length];

  if (v7)
  {
    v31[0] = kSecAttrPort;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv4NwSignature]);
    id v9 = sub_1001744E8(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v32[0] = v10;
    v31[1] = kSecAttrProtocol;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 ipv6NwSignature]);
    id v12 = sub_1001744E8(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v32[1] = v13;
    v31[2] = kSecAttrSecurityDomain;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
    v32[2] = v14;
    v32[3] = kSecClassInternetPassword;
    v31[3] = kSecClass;
    v31[4] = kSecAttrSynchronizable;
    v32[4] = kSecAttrSynchronizableAny;
    v32[5] = @"com.apple.preferred.network";
    v31[5] = kSecAttrAccessGroup;
    v31[6] = kSecAttrSyncViewHint;
    v32[6] = kSecAttrViewHintHome;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  7LL));

LABEL_13:
    goto LABEL_14;
  }

@end