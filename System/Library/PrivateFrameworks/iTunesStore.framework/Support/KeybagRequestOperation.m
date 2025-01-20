@interface KeybagRequestOperation
- (KeybagRequestOperation)initWithKeybagRequest:(id)a3 client:(id)a4;
- (KeybagRequestOperation)initWithKeybagRequest:(id)a3 clientIdentifierHeader:(id)a4 userAgent:(id)a5;
- (NSArray)claimedBundleIdentifiers;
- (void)_getDownloaderIdentifier:(id *)a3 purchaserIdentifier:(id *)a4 forApplication:(id)a5;
- (void)run;
@end

@implementation KeybagRequestOperation

- (KeybagRequestOperation)initWithKeybagRequest:(id)a3 clientIdentifierHeader:(id)a4 userAgent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___KeybagRequestOperation;
  v12 = -[KeybagRequestOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientIdentifierHeader, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong((id *)&v13->_userAgent, a5);
  }

  return v13;
}

- (KeybagRequestOperation)initWithKeybagRequest:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___KeybagRequestOperation;
  id v9 = -[KeybagRequestOperation init](&v15, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 clientIdentifierHeader]);
    clientIdentifierHeader = v9->_clientIdentifierHeader;
    v9->_clientIdentifierHeader = (NSString *)v10;

    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 userAgent]);
    userAgent = v9->_userAgent;
    v9->_userAgent = (NSString *)v12;
  }

  return v9;
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSKeybagRequest contentIdentifier](self->_request, "contentIdentifier"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v6 = 0LL;
    goto LABEL_17;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v3));
  v6 = v5;
  if (!v5)
  {
LABEL_17:
    int v20 = 1;
    goto LABEL_34;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemID]);
  id v8 = [v7 integerValue];

  if (v8) {
    goto LABEL_33;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    unsigned int v11 = v10;
  }
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 & 2;
  }
  if ((_DWORD)v13)
  {
    v14 = (void *)objc_opt_class(self);
    request = self->_request;
    id v16 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSKeybagRequest contentIdentifier](request, "contentIdentifier"));
    *(_DWORD *)v68 = 138412546;
    *(void *)&v68[4] = v14;
    *(_WORD *)&v68[12] = 2112;
    *(void *)&v68[14] = v17;
    v18 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Attempting claim before authorization for contentID: %@",  v68,  22);

    if (v18)
    {
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      v44 = v19;
      SSFileLog(v9, @"%@");
    }
  }

  else
  {
  }

  *(void *)v68 = 0LL;
  *(void *)&v68[8] = v68;
  *(void *)&v68[16] = 0x3032000000LL;
  v69 = sub_100046FE8;
  v70 = sub_100046FF8;
  id v71 = 0LL;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_100046FE8;
  v62 = sub_100046FF8;
  id v63 = 0LL;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  char v57 = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100047000;
  v49[3] = &unk_10034BEE8;
  v51 = v68;
  v52 = &v58;
  v53 = &v54;
  v21 = dispatch_semaphore_create(0LL);
  v50 = v21;
  +[AppStoreUtility checkClaimsEstablishingActiveAccounts:ignoringPreviousClaimAttempts:completionBlock:]( &OBJC_CLASS___AppStoreUtility,  "checkClaimsEstablishingActiveAccounts:ignoringPreviousClaimAttempts:completionBlock:",  1LL,  1LL,  v49);
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  if (!*((_BYTE *)v55 + 24))
  {
    claimedBundleIdentifiers = (NSArray *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedDaemonConfig]( &OBJC_CLASS___SSLogConfig,  "sharedDaemonConfig"));
    if (!claimedBundleIdentifiers) {
      claimedBundleIdentifiers = (NSArray *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v24) = -[NSArray shouldLog](claimedBundleIdentifiers, "shouldLog", v44);
    unsigned int v25 = -[NSArray shouldLogToDisk](claimedBundleIdentifiers, "shouldLogToDisk");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSArray OSLogObject](claimedBundleIdentifiers, "OSLogObject"));
    v27 = v26;
    if (v25) {
      LODWORD(v24) = v24 | 2;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      v28 = (void *)objc_opt_class(self);
      uint64_t v29 = v59[5];
      int v64 = 138412546;
      v65 = v28;
      __int16 v66 = 2112;
      uint64_t v67 = v29;
      id v30 = v28;
      LODWORD(v45) = 22;
      v31 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%@: Could not claim apps: %@",  &v64,  v45);

      if (!v31) {
        goto LABEL_32;
      }
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
      free(v31);
      v44 = v27;
      SSFileLog(claimedBundleIdentifiers, @"%@");
    }

    goto LABEL_32;
  }

  v22 = (NSArray *)[*(id *)(*(void *)&v68[8] + 40) copy];
  claimedBundleIdentifiers = self->_claimedBundleIdentifiers;
  self->_claimedBundleIdentifiers = v22;
LABEL_32:

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(v68, 8);
LABEL_33:
  int v20 = 0;
LABEL_34:
  v32 = objc_alloc_init(&OBJC_CLASS___AuthorizeMachineOperation);
  -[AuthorizeMachineOperation setClientIdentifierHeader:]( v32,  "setClientIdentifierHeader:",  self->_clientIdentifierHeader);
  -[AuthorizeMachineOperation setReason:](v32, "setReason:", @"refetch");
  -[AuthorizeMachineOperation setShouldAddKeysToKeyBag:](v32, "setShouldAddKeysToKeyBag:", 1LL);
  -[AuthorizeMachineOperation setUserAgent:](v32, "setUserAgent:", self->_userAgent);
  if (v20)
  {
    id v33 = (id)objc_claimAutoreleasedReturnValue(-[SSKeybagRequest accountID](self->_request, "accountID"));
    id v34 = 0LL;
  }

  else
  {
    id v47 = 0LL;
    id v48 = 0LL;
    -[KeybagRequestOperation _getDownloaderIdentifier:purchaserIdentifier:forApplication:]( self,  "_getDownloaderIdentifier:purchaserIdentifier:forApplication:",  &v48,  &v47,  v6);
    id v33 = v48;
    id v34 = v47;
  }

  -[AuthorizeMachineOperation setAccountIdentifier:](v32, "setAccountIdentifier:", v33, v44);
  if (([v34 isEqualToNumber:v33] & 1) == 0)
  {
    -[AuthorizeMachineOperation setFamilyMemberAccountIdentifier:](v32, "setFamilyMemberAccountIdentifier:", v34);
    -[AuthorizeMachineOperation setReason:](v32, "setReason:", @"family");
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v35) {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v36 = [v35 shouldLog];
  else {
    LODWORD(v37) = v36;
  }
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
    uint64_t v37 = v37;
  }
  else {
    v37 &= 2u;
  }
  if (!(_DWORD)v37) {
    goto LABEL_52;
  }
  v39 = (void *)objc_opt_class(self);
  *(_DWORD *)v68 = 138412802;
  *(void *)&v68[4] = v39;
  *(_WORD *)&v68[12] = 2112;
  *(void *)&v68[14] = v33;
  *(_WORD *)&v68[22] = 2112;
  v69 = (uint64_t (*)(uint64_t, uint64_t))v34;
  id v40 = v39;
  LODWORD(v45) = 32;
  v41 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  1LL,  "%@: Running authorize operation for account ID: %@, family account ID: %@",  v68,  v45);

  if (v41)
  {
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
    free(v41);
    SSFileLog(v35, @"%@");
LABEL_52:
  }

  id v46 = 0LL;
  id v42 = -[KeybagRequestOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v32, &v46);
  id v43 = v46;

  -[KeybagRequestOperation setError:](self, "setError:", v43);
  -[KeybagRequestOperation setSuccess:](self, "setSuccess:", v42);
}

- (void)_getDownloaderIdentifier:(id *)a3 purchaserIdentifier:(id *)a4 forApplication:(id)a5
{
  id v17 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SSKeybagRequest accountID](self->_request, "accountID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v17 familyID]);
  if ([v9 longLongValue])
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v17 downloaderDSID]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v17 purchaserDSID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    uint64_t v13 = v12;
    if (v10 && v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 accountWithUniqueIdentifier:v10]);
      if (v14)
      {
        id v15 = v10;

        id v16 = v11;
        id v8 = v16;
      }

      else
      {
        id v15 = v8;
      }
    }

    else
    {
      id v15 = v8;
    }

    if (a3) {
      goto LABEL_12;
    }
  }

  else
  {
    id v15 = v8;
    if (a3) {
LABEL_12:
    }
      *a3 = v15;
  }

  if (a4) {
    *a4 = v8;
  }
}

- (NSArray)claimedBundleIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 120LL, 1);
}

- (void).cxx_destruct
{
}

@end