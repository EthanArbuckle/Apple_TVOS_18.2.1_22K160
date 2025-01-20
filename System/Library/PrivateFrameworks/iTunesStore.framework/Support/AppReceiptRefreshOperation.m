@interface AppReceiptRefreshOperation
- (AppReceiptRefreshOperation)initWithOptions:(id)a3;
- (BOOL)_handleResponse:(id)a3 forApp:(id)a4 options:(id)a5;
- (BOOL)_preformMigrationCheckForApp:(id)a3;
- (BOOL)_refreshReceiptForApplication:(id)a3 withOptions:(id)a4 vppState:(int64_t)a5 error:(id *)a6;
- (id)_optionsWithVPPState:(int64_t)a3;
- (id)_postBodyDataWithApplication:(id)a3 options:(id)a4 vppState:(int64_t)a5 error:(id *)a6;
- (id)receiptExpirationDateForProxy:(id)a3;
- (void)run;
- (void)setResultsBlock:(id)a3;
@end

@implementation AppReceiptRefreshOperation

- (AppReceiptRefreshOperation)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = -[AppReceiptRefreshOperation init](self, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___AppReceiptOperationResult);
    operationResult = v5->_operationResult;
    v5->_operationResult = v6;

    if (v4)
    {
      v8 = (AppReceiptRefreshOperationOptions *)[v4 copy];
      options = v5->_options;
      v5->_options = v8;
    }

    else
    {
      v10 = objc_alloc_init(&OBJC_CLASS___AppReceiptRefreshOperationOptions);
      v11 = v5->_options;
      v5->_options = v10;

      -[AppReceiptRefreshOperationOptions setAuthenticationPromptStyle:]( v5->_options,  "setAuthenticationPromptStyle:",  1000LL);
      -[AppReceiptRefreshOperationOptions setPerformSinfMirartionCheckBeforeFailing:]( v5->_options,  "setPerformSinfMirartionCheckBeforeFailing:",  1LL);
    }
  }

  return v5;
}

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___FamilyCircleOperation);
  if (-[AppReceiptRefreshOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  0LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleOperation familyCircle](v3, "familyCircle"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleOperation familyCircle](v3, "familyCircle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allITunesIdentifiers]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
      v8 = (NSArray *)[v7 mutableCopy];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeAccount]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);

      if (v11) {
        -[NSArray removeObject:](v8, "removeObject:", v11);
      }
      familyAccountIDs = self->_familyAccountIDs;
      self->_familyAccountIDs = v8;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppReceiptRefreshOperationOptions bundleIdentifier](self->_options, "bundleIdentifier"));
  if (v13)
  {
    v14 = objc_autoreleasePoolPush();
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v13));
    if (v15
      || (v15 = (void *)objc_claimAutoreleasedReturnValue( +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:]( &OBJC_CLASS___AppExtensionSupport,  "supportedProxyExtensionForBundleIdentifier:",  v13))) != 0LL)
    {
      -[AppReceiptRefreshOperation _refreshReceiptForApplication:withOptions:vppState:error:]( self,  "_refreshReceiptForApplication:withOptions:vppState:error:",  v15,  self->_options,  (int)+[SSPurchaseReceipt vppStateFlagsWithProxy:]( &OBJC_CLASS___SSPurchaseReceipt,  "vppStateFlagsWithProxy:",  v15),  0LL);
    }

    objc_autoreleasePoolPop(v14);
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URLBagForContext:v16]);

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 valueForKey:@"receipt-max-lookup-count"]);
    v20 = (void *)v19;
    else {
      uint64_t v21 = 10LL;
    }
    v28[0] = 0LL;
    v28[1] = v28;
    v28[2] = 0x2020000000LL;
    v28[3] = 0LL;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000D43E8;
    v27[3] = &unk_10034DE90;
    v27[5] = v28;
    v27[6] = v21;
    v27[4] = self;
    [v22 enumerateApplicationsOfType:0 block:v27];

    _Block_object_dispose(v28, 8);
  }

  -[AppReceiptRefreshOperation lock](self, "lock");
  v23 = self->_operationResult;
  v24 = (void (**)(id, AppReceiptOperationResult *))objc_retainBlock(self->_resultsBlock);
  operationResult = self->_operationResult;
  self->_operationResult = 0LL;

  id resultsBlock = self->_resultsBlock;
  self->_id resultsBlock = 0LL;

  -[AppReceiptRefreshOperation unlock](self, "unlock");
  if (v24) {
    v24[2](v24, v23);
  }
}

- (void)setResultsBlock:(id)a3
{
  id v6 = a3;
  -[AppReceiptRefreshOperation lock](self, "lock");
  if (self->_resultsBlock != v6)
  {
    id v4 = [v6 copy];
    id resultsBlock = self->_resultsBlock;
    self->_id resultsBlock = v4;
  }

  -[AppReceiptRefreshOperation unlock](self, "unlock");
}

- (id)receiptExpirationDateForProxy:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSPurchaseReceipt receiptPathForProxy:](&OBJC_CLASS___SSPurchaseReceipt, "receiptPathForProxy:", a3));
  if (v3)
  {
    id v4 = -[SSPurchaseReceipt initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___SSPurchaseReceipt),  "initWithContentsOfFile:",  v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSPurchaseReceipt expirationDate](v4, "expirationDate"));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)_handleResponse:(id)a3 forApp:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"status"]);
  v12 = v11;
  if (!v11 || ![v11 integerValue])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"receipt"]);
    unint64_t v19 = (unint64_t)[v10 receiptFlags];
    if (![v13 length])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v24) {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v39 = [v24 shouldLog];
      else {
        LODWORD(v40) = v39;
      }
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        uint64_t v40 = v40;
      }
      else {
        v40 &= 2u;
      }
      if (!(_DWORD)v40) {
        goto LABEL_105;
      }
      int v82 = 138543618;
      id v83 = (id)objc_opt_class(self);
      __int16 v84 = 2114;
      id v85 = v9;
      id v41 = v83;
      v42 = (void *)_os_log_send_and_compose_impl( v40,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  2LL,  "[%{public}@]: No new receipt for %{public}@",  &v82,  22);

      if (!v42) {
        goto LABEL_106;
      }
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v42,  4LL));
      free(v42);
      SSFileLog(v24, @"%@");
      goto LABEL_105;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    unsigned __int8 v21 = +[AppReceipt writeReceipt:forBundleIdentifier:style:]( &OBJC_CLASS___AppReceipt,  "writeReceipt:forBundleIdentifier:style:",  v13,  v20,  (v19 >> 2) & 1);

    if ((v21 & 1) != 0)
    {
      -[AppReceiptOperationResult addRefreshed:](self->_operationResult, "addRefreshed:", v9);
      unsigned __int8 v22 = +[SSPurchaseReceipt vppStateFlagsWithProxy:]( &OBJC_CLASS___SSPurchaseReceipt,  "vppStateFlagsWithProxy:",  v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"revoked"]);
      v24 = v23;
      if (v23)
      {
        if ([v23 BOOLValue])
        {
          if (!-[AppReceiptRefreshOperationOptions performSinfMirartionCheckBeforeFailing]( self->_options,  "performSinfMirartionCheckBeforeFailing")
            || ([v9 hasMIDBasedSINF] & 1) != 0
            || (v22 & 8) == 0)
          {
LABEL_34:
            -[AppReceiptOperationResult addRevoked:](self->_operationResult, "addRevoked:", v9, v66);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v31) {
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            unsigned int v32 = -[os_log_s shouldLog](v31, "shouldLog");
            else {
              LODWORD(v33) = v32;
            }
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v31, "OSLogObject"));
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v33 = v33;
            }
            else {
              v33 &= 2u;
            }
            if ((_DWORD)v33)
            {
              id v75 = v10;
              v35 = (void *)objc_opt_class(self);
              id v79 = v35;
              v36 = (void *)objc_claimAutoreleasedReturnValue([v9 itemName]);
              id v37 = [v13 length];
              int v82 = 138544130;
              id v83 = v35;
              __int16 v84 = 2114;
              id v85 = v36;
              __int16 v86 = 2114;
              id v87 = v9;
              __int16 v88 = 2048;
              id v89 = v37;
              LODWORD(v67) = 42;
              v38 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[%{public}@]: Rewrote a Revoked receipt for app: [%{public}@] [%{public}@] [%ld bytes]",  &v82,  v67);

              if (!v38)
              {
                id v10 = v75;
                goto LABEL_105;
              }

              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
              free(v38);
              SSFileLog(v31, @"%@");
              id v10 = v75;
            }

            goto LABEL_104;
          }

          unsigned int v78 = -[AppReceiptRefreshOperation _preformMigrationCheckForApp:](self, "_preformMigrationCheckForApp:", v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v25) {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          v26 = v25;
          LODWORD(v27) = [v25 shouldLog];
          v74 = v26;
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v27 = v27;
          }
          else {
            v27 &= 2u;
          }
          if ((_DWORD)v27)
          {
            v70 = v28;
            v29 = (void *)objc_opt_class(self);
            id v72 = v29;
            v68 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
            int v82 = 138543874;
            id v83 = v29;
            __int16 v84 = 2114;
            id v85 = v68;
            __int16 v86 = 1024;
            LODWORD(v87) = v78;
            v30 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v70,  0LL,  "[%{public}@]: Attempted VPP migration of server revoked app with bundleIdentifier: %{public} @ with result: %d",  &v82,  28);

            if (!v30) {
              goto LABEL_33;
            }
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
            free(v30);
            v66 = v28;
            SSFileLog(v74, @"%@");
          }

LABEL_33:
          if ((v78 & 1) == 0) {
            goto LABEL_34;
          }
LABEL_106:
          LOBYTE(v18) = 1;
          goto LABEL_107;
        }

        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v31) {
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v62 = -[os_log_s shouldLog](v31, "shouldLog");
        else {
          LODWORD(v63) = v62;
        }
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v31, "OSLogObject"));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v63 = v63;
        }
        else {
          v63 &= 2u;
        }
        if (!(_DWORD)v63)
        {
LABEL_104:

          goto LABEL_105;
        }

        v64 = (void *)objc_opt_class(self);
        id v81 = v64;
        int v82 = 138543874;
        id v83 = v64;
        __int16 v84 = 2114;
        id v85 = v9;
        __int16 v86 = 2048;
        id v87 = [v13 length];
        v61 = (void *)_os_log_send_and_compose_impl( v63,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[%{public}@]: Rewrote the receipt for app: [%{public}@] [%ld bytes]",  &v82,  32);
        goto LABEL_102;
      }

      if ((v22 & 8) == 0) {
        goto LABEL_106;
      }
      if (!-[AppReceiptRefreshOperationOptions performSinfMirartionCheckBeforeFailing]( self->_options,  "performSinfMirartionCheckBeforeFailing")
        || ([v9 hasMIDBasedSINF] & 1) != 0)
      {
LABEL_83:
        -[AppReceiptOperationResult addRevoked:](self->_operationResult, "addRevoked:", v9, v66);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v31) {
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v54 = -[os_log_s shouldLog](v31, "shouldLog");
        else {
          int v55 = v54;
        }
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v31, "OSLogObject"));
        BOOL v56 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        int v57 = v55 & 2;
        if (v56) {
          int v57 = v55;
        }
        if (!v57) {
          goto LABEL_104;
        }
        unsigned int v77 = v57;
        v58 = (void *)objc_opt_class(self);
        id v81 = v58;
        v59 = (void *)objc_claimAutoreleasedReturnValue([v9 itemName]);
        id v60 = [v13 length];
        int v82 = 138413058;
        id v83 = v58;
        __int16 v84 = 2114;
        id v85 = v59;
        __int16 v86 = 2114;
        id v87 = v9;
        __int16 v88 = 2048;
        id v89 = v60;
        LODWORD(v67) = 42;
        v61 = (void *)_os_log_send_and_compose_impl( v77,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[%@]: Rewrote a Revoked receipt for app: [%{public}@] [%{public}@] [%ld bytes]",  &v82,  v67);

LABEL_102:
        if (v61)
        {
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v61,  4LL));
          free(v61);
          SSFileLog(v31, @"%@");
          goto LABEL_104;
        }

- (BOOL)_preformMigrationCheckForApp:(id)a3
{
  return 0;
}

- (id)_optionsWithVPPState:(int64_t)a3
{
  if ((a3 & 2) != 0)
  {
    id v3 = -[AppReceiptRefreshOperationOptions copy](self->_options, "copy");
    objc_msgSend(v3, "setReceiptFlags:", (unint64_t)objc_msgSend(v3, "receiptFlags") | 8);
    id v4 = v3;
    uint64_t v5 = 0LL;
LABEL_6:
    [v4 setNeedsAuthentication:v5];
    return v3;
  }

  if ((a3 & 0x40000000) != 0)
  {
    id v3 = -[AppReceiptRefreshOperationOptions copy](self->_options, "copy");
    objc_msgSend(v3, "setReceiptFlags:", (unint64_t)objc_msgSend(v3, "receiptFlags") & 0xFFFFFFFFFFFFFFF7);
    id v4 = v3;
    uint64_t v5 = 1LL;
    goto LABEL_6;
  }

  id v3 = 0LL;
  return v3;
}

- (id)_postBodyDataWithApplication:(id)a3 options:(id)a4 vppState:(int64_t)a5 error:(id *)a6
{
  char v6 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (([v10 receiptFlags] & 4) != 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_activeiTunesAccount"));

    v13 = -[SSAccount initWithBackingAccount:](objc_alloc(&OBJC_CLASS___SSAccount), "initWithBackingAccount:", v16);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_DSID"));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    v13 = (SSAccount *)objc_claimAutoreleasedReturnValue([v12 activeAccount]);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 purchaserDSID]);
  }

  if (v14) {
    BOOL v17 = v13 == 0LL;
  }
  else {
    BOOL v17 = 1;
  }
  id v81 = self;
  int v82 = v13;
  id v83 = v10;
  if (!v17)
  {
    familyAccountIDs = self->_familyAccountIDs;
    if (familyAccountIDs)
    {
      if (-[NSArray containsObject:](familyAccountIDs, "containsObject:", v14))
      {
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 storeFront]);
        char v20 = objc_opt_respondsToSelector(v19, "stringValue");

        if ((v20 & 1) != 0)
        {
          unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v9 storeFront]);
          unsigned int v80 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
        }

        else
        {
          unsigned int v80 = 0LL;
        }

        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount storeFrontIdentifier](v13, "storeFrontIdentifier"));
        id v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v22 integerValue]));

        uint64_t v23 = objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](v13, "uniqueIdentifier"));
        unsigned int v78 = (void *)v23;
        if (!v23 || !v80 || (v24 = (void *)v23, ![v79 isEqualToString:v80]))
        {
          unsigned int v77 = v9;
          v34 = v14;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v26) {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v35 = [v26 shouldLog];
          else {
            unsigned int v36 = v35;
          }
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v38 = v36;
          }
          else {
            uint64_t v38 = v36 & 2;
          }
          if ((_DWORD)v38)
          {
            unsigned int v39 = (void *)objc_opt_class(self);
            id v75 = v39;
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v77 bundleIdentifier]);
            int v86 = 138544386;
            id v87 = v39;
            __int16 v88 = 2114;
            id v89 = v34;
            __int16 v90 = 2114;
            v91 = v40;
            __int16 v92 = 2114;
            v93 = v80;
            __int16 v94 = 2114;
            v95 = v79;
            id v41 = (void *)_os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "[%{public}@]: Using app account: %{public}@ item with bundleID: %{public}@ due to different item storeFront: %{public}@ primary account storeFront: %{public}@",  &v86,  52);

            if (v41)
            {
              v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
              free(v41);
              id v73 = v42;
              SSFileLog(v26, @"%@");
            }

            id v25 = v34;
          }

          else
          {

            id v25 = v34;
          }

          id v9 = v77;
          goto LABEL_42;
        }

        id v25 = [v24 copy];

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v26) {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v27 = [v26 shouldLog];
        else {
          unsigned int v28 = v27;
        }
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v30 = v28;
        }
        else {
          uint64_t v30 = v28 & 2;
        }
        if ((_DWORD)v30)
        {
          v31 = (void *)objc_opt_class(self);
          id v76 = v31;
          unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
          int v86 = 138544130;
          id v87 = v31;
          __int16 v88 = 2114;
          id v89 = v25;
          __int16 v90 = 2114;
          v91 = v32;
          __int16 v92 = 2114;
          v93 = v79;
          uint64_t v33 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[%{public}@]: Using family primary account: %{public}@ to restore bundleID: %{public}@ storeFront: %{public}@",  &v86,  42);

          if (!v33)
          {
LABEL_42:

            unsigned int v14 = v25;
            id v10 = v83;
            goto LABEL_43;
          }

          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
          free(v33);
          id v73 = v29;
          SSFileLog(v26, @"%@");
        }

        goto LABEL_42;
      }
    }
  }

- (BOOL)_refreshReceiptForApplication:(id)a3 withOptions:(id)a4 vppState:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v59 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[AppReceiptRefreshOperation _postBodyDataWithApplication:options:vppState:error:]( self,  "_postBodyDataWithApplication:options:vppState:error:",  v10,  v11,  a5,  &v59));
  id v13 = v59;
  if (v12)
  {
    int v57 = a6;
    id v14 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    objc_msgSend(v14, "setNeedsAuthentication:", objc_msgSend(v11, "needsAuthentication"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v14 setDataProvider:v15];
    v16 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setAllowedRetryCount:](v16, "setAllowedRetryCount:", 0LL);
    BOOL v56 = v12;
    -[SSMutableURLRequestProperties setHTTPBody:](v16, "setHTTPBody:", v12);
    -[SSMutableURLRequestProperties setHTTPMethod:](v16, "setHTTPMethod:", @"POST");
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v11 URLBagKey]);
    -[SSMutableURLRequestProperties setURLBagKey:](v16, "setURLBagKey:", v17);

    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v16,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 targetAccount]);

    unint64_t v19 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
    if (v18) {
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v11 targetAccount]);
    }
    else {
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 purchaserDSID]);
    }
    unsigned __int8 v22 = (void *)v20;
    uint64_t v23 = -[SSMutableAuthenticationContext initWithAccountIdentifier:](v19, "initWithAccountIdentifier:", v20);

    -[SSMutableAuthenticationContext setPromptStyle:]( v23,  "setPromptStyle:",  [v11 authenticationPromptStyle]);
    if (([v11 receiptFlags] & 4) != 0)
    {
      -[SSMutableAuthenticationContext setAccountScope:](v23, "setAccountScope:", 1LL);
      -[SSMutableURLRequestProperties setURLBagType:](v16, "setURLBagType:", 1LL);
    }

    int v55 = v23;
    [v14 setAuthenticationContext:v23];
    [v14 setRequestProperties:v16];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v24) {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v25) = [v24 shouldLog];
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      unsigned int v27 = (void *)objc_opt_class(self);
      int v60 = 138543618;
      v61 = v27;
      __int16 v62 = 2114;
      id v63 = v10;
      id v53 = v13;
      id v28 = v11;
      v29 = v16;
      uint64_t v30 = self;
      id v31 = v14;
      id v32 = v10;
      uint64_t v33 = v15;
      id v34 = v27;
      unsigned int v35 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[%{public}@]: Updating receipt for: %{public}@",  &v60,  22);

      uint64_t v15 = v33;
      id v10 = v32;
      id v14 = v31;
      self = v30;
      v16 = v29;
      id v11 = v28;
      id v13 = v53;

      if (!v35)
      {
LABEL_20:

        id v58 = v13;
        unsigned int v36 = -[AppReceiptRefreshOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v14,  &v58);
        id v37 = v58;

        if (v36)
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v15 output]);
          unsigned __int8 v39 = -[AppReceiptRefreshOperation _handleResponse:forApp:options:]( self,  "_handleResponse:forApp:options:",  v38,  v10,  v11);

          if ((v39 & 1) != 0)
          {
            BOOL v21 = 1;
            a6 = v57;
            goto LABEL_41;
          }
        }

        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v50));
        if (!v40) {
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        id v54 = v14;
        LODWORD(v41) = [v40 shouldLog];
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          uint64_t v41 = v41;
        }
        else {
          v41 &= 2u;
        }
        if ((_DWORD)v41)
        {
          unsigned int v43 = (void *)objc_opt_class(self);
          int v60 = 138543874;
          v61 = v43;
          __int16 v62 = 2114;
          id v44 = v10;
          id v63 = v10;
          __int16 v64 = 2114;
          id v65 = v37;
          v45 = v15;
          id v46 = v43;
          LODWORD(v52) = 32;
          id v47 = (void *)_os_log_send_and_compose_impl( v41,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  16LL,  "[%{public}@]: Receipt refresh failed for: %{public}@, error: %{public}@",  &v60,  v52);

          uint64_t v15 = v45;
          if (!v47)
          {
LABEL_35:

            v48 = (void *)objc_claimAutoreleasedReturnValue(-[AppReceiptOperationResult resultingError](self->_operationResult, "resultingError"));
            if (v48)
            {
              BOOL v21 = 0;
              a6 = v57;
              id v10 = v44;
            }

            else
            {
              id v10 = v44;
              if (!v37) {
                id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  100LL,  0LL));
              }
              -[AppReceiptOperationResult setResultingError:](self->_operationResult, "setResultingError:", v37, v51);
              BOOL v21 = 0;
              a6 = v57;
            }

            id v14 = v54;
LABEL_41:

            id v13 = v37;
            v12 = v56;
            if (!a6) {
              goto LABEL_44;
            }
            goto LABEL_42;
          }

          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v47,  4LL));
          free(v47);
          int v51 = v42;
          SSFileLog(v40, @"%@");
        }

        else
        {
          id v44 = v10;
        }

        goto LABEL_35;
      }

      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
      free(v35);
      unsigned int v50 = v26;
      SSFileLog(v24, @"%@");
    }

    goto LABEL_20;
  }

  BOOL v21 = 0;
  if (!a6) {
    goto LABEL_44;
  }
LABEL_42:
  if (!v21) {
    *a6 = v13;
  }
LABEL_44:

  return v21;
}

- (void).cxx_destruct
{
}

@end