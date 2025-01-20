@interface RestoreDownloadsOperation
+ (BOOL)shouldSuppressTermsAndConditionsDialogs;
+ (void)resetShouldSuppressTermsAndConditionsDialogs;
+ (void)setShouldSuppressTermsAndConditionsDialogs:(BOOL)a3;
- (BOOL)_isErrorCancelFailure:(id)a3;
- (BOOL)_isErrorSoftFail:(id)a3;
- (BOOL)_preflightAccountWithID:(id)a3 isFamily:(BOOL)a4 error:(id *)a5;
- (BOOL)_shouldAuthenticateForCancelRetry;
- (BOOL)_shouldAutomaticallyRetryAfterSoftFailError:(id)a3;
- (BOOL)_updateDownloadEntity:(id)a3 withTransaction:(id)a4 storeDownload:(id)a5 accountID:(id)a6;
- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6;
- (NSArray)errors;
- (NSOrderedSet)downloadIdentifiers;
- (NSString)restoreReason;
- (RestoreDownloadsOperation)initWithDownloadIdentifiers:(id)a3 restoreReason:(id)a4;
- (id)_accountIDForAccountName:(id)a3 error:(id *)a4;
- (id)_copyDownloadSessionPropertiesForItem:(id)a3 download:(id)a4;
- (id)_newDownloadWithStoreDownload:(id)a3;
- (id)_newRestoreItemsWithDownloadIDs:(id)a3;
- (id)_softFailRestoreItem:(id)a3 download:(id)a4 withRestoreState:(int64_t)a5 error:(id)a6;
- (int64_t)_downloadRestoreStateForError:(id)a3;
- (void)_applyResponses:(id)a3 withTransaction:(id)a4;
- (void)_establishPrimaryAccount;
- (void)_hardFailRestoreItem:(id)a3 download:(id)a4 transaction:(id)a5 error:(id)a6;
- (void)_scheduleAutomaticRetry;
- (void)_scheduleCancelRetry;
- (void)dealloc;
- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)restorePodcastItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
@end

@implementation RestoreDownloadsOperation

- (RestoreDownloadsOperation)initWithDownloadIdentifiers:(id)a3 restoreReason:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RestoreDownloadsOperation;
  v6 = -[RestoreDownloadsOperation init](&v8, "init");
  if (v6)
  {
    v6->_downloadIDs = (NSOrderedSet *)[a3 copy];
    v6->_restoreReason = (NSString *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RestoreDownloadsOperation;
  -[RestoreDownloadsOperation dealloc](&v3, "dealloc");
}

+ (void)resetShouldSuppressTermsAndConditionsDialogs
{
}

+ (void)setShouldSuppressTermsAndConditionsDialogs:(BOOL)a3
{
  objc_super v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    objc_super v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"RestoreSuppressTermsAndConditions", *v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(@"RestoreSuppressTermsAndConditions");
}

+ (BOOL)shouldSuppressTermsAndConditionsDialogs
{
  return CFPreferencesGetAppBooleanValue(@"RestoreSuppressTermsAndConditions", kSSUserDefaultsIdentifier, 0LL) != 0;
}

- (NSOrderedSet)downloadIdentifiers
{
  return self->_downloadIDs;
}

- (NSArray)errors
{
  objc_super v3 = (NSArray *)-[NSMutableArray copy](self->_errors, "copy");
  -[RestoreDownloadsOperation unlock](self, "unlock");
  return v3;
}

- (NSString)restoreReason
{
  return self->_restoreReason;
}

- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6
{
  v6 = a6;
  v7 = a4;
  id v53 = 0LL;
  uint64_t v54 = 0LL;
  unint64_t v52 = 0LL;
  if (self->_cancelRetryAlertState == 1)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3, a4, a5);
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v55 = 138543362;
      uint64_t v56 = objc_opt_class(self);
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%{public}@: Skipping authentication after cancel retry was cancelled",  &v55,  12);
      if (v13)
      {
        v14 = (void *)v13;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        SSFileLog(v9, @"%@");
      }
    }

    BOOL v15 = 0;
    uint64_t v54 = SSError(SSErrorDomain, 16LL, 0LL, 0LL);
LABEL_47:
    v35 = a3;
    goto LABEL_48;
  }

  unsigned int v17 = -[NSString isEqualToString:](self->_restoreReason, "isEqualToString:", @"cancel-retry");
  uint64_t v50 = SSErrorDomain;
  if (!v17) {
    goto LABEL_29;
  }
LABEL_15:
  if (self->_cancelRetryAlertState) {
    goto LABEL_29;
  }
  id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v18) {
    id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v19 = objc_msgSend(v18, "shouldLog", v44);
  else {
    LODWORD(v20) = v19;
  }
  v21 = (os_log_s *)[v18 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    uint64_t v20 = v20;
  }
  else {
    v20 &= 2u;
  }
  if ((_DWORD)v20)
  {
    uint64_t v22 = objc_opt_class(self);
    int v55 = 138543362;
    uint64_t v56 = v22;
    LODWORD(v46) = 12;
    uint64_t v23 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%{public}@: Prompting user for restore cancel retry",  &v55,  v46);
    if (v23)
    {
      v24 = (void *)v23;
      v25 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
      free(v24);
      v45 = v25;
      SSFileLog(v18, @"%@");
    }
  }

  if (-[RestoreDownloadsOperation _shouldAuthenticateForCancelRetry](self, "_shouldAuthenticateForCancelRetry", v45))
  {
    self->_cancelRetryAlertState = 2LL;
    while (1)
    {
LABEL_29:
      v51.receiver = self;
      v51.super_class = (Class)&OBJC_CLASS___RestoreDownloadsOperation;
      unsigned int v26 = -[RestoreDownloadsOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( &v51,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  &v53,  &v52,  a5,  &v54,  v44);
      if (((v26 | v17 ^ 1) & 1) != 0)
      {
        BOOL v15 = v26;
        goto LABEL_46;
      }

      id v27 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v27) {
        id v27 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v28 = [v27 shouldLog];
      else {
        LODWORD(v29) = v28;
      }
      v30 = (os_log_s *)[v27 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v29 = v29;
      }
      else {
        v29 &= 2u;
      }
      if ((_DWORD)v29)
      {
        uint64_t v31 = objc_opt_class(self);
        int v55 = 138543362;
        uint64_t v56 = v31;
        LODWORD(v46) = 12;
        uint64_t v32 = _os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%{public}@: User cancelled auth during cancel retry",  &v55,  v46);
        if (v32)
        {
          v33 = (void *)v32;
          v34 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v32, 4LL);
          free(v33);
          v44 = v34;
          SSFileLog(v27, @"%@");
        }
      }

      self->_cancelRetryAlertState = 0LL;

      id v53 = 0LL;
      if (v17) {
        goto LABEL_15;
      }
    }

    BOOL v15 = 0;
LABEL_46:
    v7 = a4;
    v6 = a6;
    goto LABEL_47;
  }

  id v37 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v37) {
    id v37 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v38 = [v37 shouldLog];
  else {
    LODWORD(v39) = v38;
  }
  v40 = (os_log_s *)[v37 OSLogObject];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v39 = v39;
  }
  else {
    v39 &= 2u;
  }
  v7 = a4;
  v6 = a6;
  v35 = a3;
  if ((_DWORD)v39)
  {
    uint64_t v41 = objc_opt_class(self);
    int v55 = 138543362;
    uint64_t v56 = v41;
    LODWORD(v46) = 12;
    uint64_t v42 = _os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  0LL,  "%{public}@: User cancelled cancel retry",  &v55,  v46);
    if (v42)
    {
      v43 = (void *)v42;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v42, 4LL);
      free(v43);
      SSFileLog(v37, @"%@");
    }
  }

  self->_cancelRetryAlertState = 1LL;
  BOOL v15 = 0;
  uint64_t v54 = SSError(v50, 16LL, 0LL, 0LL);
LABEL_48:
  if (v35)
  {
    id *v35 = v53;
    if (!v7) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  if (v7) {
LABEL_50:
  }
    unint64_t *v7 = v52;
LABEL_51:
  if (v6) {
    id *v6 = (id)v54;
  }
  return v15;
}

- (void)run
{
  v173 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v184 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v174 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v185 = +[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore");
  self->_hadAutoRetrySoftFailure = 0;
  self->_hadCancelFailure = 0;
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    unsigned int v5 = v4;
  }
  v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 & 2;
  }
  if ((_DWORD)v7)
  {
    uint64_t v8 = objc_opt_class(self);
    NSUInteger v9 = -[NSOrderedSet count](self->_downloadIDs, "count");
    *(_DWORD *)v221 = 138543618;
    *(void *)&v221[4] = v8;
    *(_WORD *)&v221[12] = 2048;
    *(void *)&v221[14] = v9;
    uint64_t v10 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  2LL,  "%{public}@: Attempting restore for %lu download(s)",  v221,  22);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      uint64_t v163 = (uint64_t)v12;
      SSFileLog(v3, @"%@");
    }
  }

  v175 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v172 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v169 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___FamilyCircleOperation);
  if (-[RestoreDownloadsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v13,  0LL)
    && -[FamilyCircleOperation familyCircle](v13, "familyCircle"))
  {
    -[RestoreDownloadsOperation _establishPrimaryAccount](self, "_establishPrimaryAccount");
    id v14 = [v185 activeAccount];
    id v15 = objc_msgSend( objc_msgSend( -[SSFamilyCircle allITunesIdentifiers]( -[FamilyCircleOperation familyCircle](v13, "familyCircle"),  "allITunesIdentifiers"),  "allObjects"),  "mutableCopy");
    id v16 = objc_msgSend( objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"),  "uniqueIdentifier");
    if (v16) {
      [v15 removeObject:v16];
    }
    char v171 = 1;
  }

  else
  {
    id v15 = 0LL;
    id v14 = 0LL;
    char v171 = 0;
  }

  id v17 = -[RestoreDownloadsOperation _newRestoreItemsWithDownloadIDs:]( self,  "_newRestoreItemsWithDownloadIDs:",  self->_downloadIDs);
  __int128 v212 = 0u;
  __int128 v213 = 0u;
  __int128 v214 = 0u;
  __int128 v215 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v212 objects:v220 count:16];
  v188 = self;
  id v183 = v15;
  if (!v18)
  {
    id v21 = v14;
    goto LABEL_112;
  }

  id v19 = v18;
  id v20 = *(id *)v213;
  uint64_t v168 = SSErrorDomain;
  uint64_t v189 = SSDownloadPhaseDownloading;
  id v21 = v14;
  id obj = *(id *)v213;
  id v176 = v17;
  do
  {
    uint64_t v22 = 0LL;
    id v181 = v19;
    do
    {
      if (*(id *)v213 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v23 = *(void **)(*((void *)&v212 + 1) + 8LL * (void)v22);
      char IsPodcastKind = SSDownloadKindIsPodcastKind(objc_msgSend(v23, "downloadKind", v163));
      uint64_t v211 = 0LL;
      if ((IsPodcastKind & 1) == 0 && ![v23 storeAccountID])
      {
        id v25 = [v23 storeAccountAppleID];
        if (v25)
        {
          id v26 = -[RestoreDownloadsOperation _accountIDForAccountName:error:]( self,  "_accountIDForAccountName:error:",  v25,  &v211);
          goto LABEL_42;
        }

        if ((v171 & 1) == 0)
        {
          -[RestoreDownloadsOperation _establishPrimaryAccount](self, "_establishPrimaryAccount");
          id v21 = [v185 activeAccount];
        }

        if (v21)
        {
          id v27 = v21;
          id v28 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v28) {
            id v28 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v29 = [v28 shouldLog];
          else {
            unsigned int v30 = v29;
          }
          uint64_t v31 = (os_log_s *)[v28 OSLogObject];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v32 = v30;
          }
          else {
            uint64_t v32 = v30 & 2;
          }
          if ((_DWORD)v32)
          {
            uint64_t v33 = objc_opt_class(self);
            id v34 = [v23 downloadIdentifier];
            *(_DWORD *)v221 = 138543618;
            *(void *)&v221[4] = v33;
            self = v188;
            *(_WORD *)&v221[12] = 2048;
            *(void *)&v221[14] = v34;
            LODWORD(v167) = 22;
            uint64_t v35 = _os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%{public}@: Falling back to primary account to restore download: %lld",  v221,  v167);
            if (v35)
            {
              v36 = (void *)v35;
              id v37 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL);
              free(v36);
              uint64_t v163 = (uint64_t)v37;
              SSFileLog(v28, @"%@");
            }
          }

          id v21 = v27;
          objc_msgSend(v23, "setStoreAccountAppleID:", objc_msgSend(v27, "accountName", v163));
          id v26 = [v27 uniqueIdentifier];
          char v171 = 1;
          id v19 = v181;
          id v15 = v183;
          id v20 = obj;
LABEL_42:
          [v23 setStoreAccountID:v26];
        }

        else
        {
          char v171 = 1;
        }

        unint64_t v38 = (unint64_t)[v23 storeAccountID];
        if (!(v38 | v211)) {
          uint64_t v211 = SSError(v168, 119LL, 0LL, 0LL);
        }
      }

      id v39 = [v23 storeAccountID];
      if (v39) {
        BOOL v40 = v21 == 0LL;
      }
      else {
        BOOL v40 = 1;
      }
      if (!v40)
      {
        id v41 = v39;
        if ([v15 containsObject:v39])
        {
          [v23 setStoreOriginalPurchaserAccountID:v41];
          objc_msgSend(v23, "setStoreAccountID:", objc_msgSend(v21, "uniqueIdentifier"));
        }
      }

      uint64_t v210 = 0LL;
      if ((IsPodcastKind & 1) != 0)
      {
        if ([v23 isEligibleForRestore:&v210])
        {
          -[NSMutableArray addObject:](v174, "addObject:", v23);
          goto LABEL_106;
        }

- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  unsigned int v5 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a4, 0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B2B28;
  v6[3] = &unk_10034B9E0;
  v6[4] = self;
  v6[5] = v5;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingTransactionBlock:",  v6);
}

- (void)restorePodcastItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B2BB8;
  v4[3] = &unk_10034B9E0;
  v4[4] = a4;
  v4[5] = self;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", a3),  "modifyUsingTransactionBlock:",  v4);
}

- (id)_accountIDForAccountName:(id)a3 error:(id *)a4
{
  id v57 = 0LL;
  id v58 = 0LL;
  -[RestoreDownloadsOperation lock](self, "lock");
  if (!self->_accountIDsByAppleID)
  {
    id v7 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "accounts");
    self->_accountIDsByAppleID = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          id v13 = [v12 uniqueIdentifier];
          id v14 = [v12 accountName];
          if (v13) {
            BOOL v15 = v14 == 0LL;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            -[NSMutableDictionary setObject:forKey:](self->_accountIDsByAppleID, "setObject:forKey:", v13, v14);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v53 objects:v67 count:16];
      }

      while (v9);
    }
  }

  id v16 = -[NSMutableDictionary objectForKey:](self->_accountIDsByAppleID, "objectForKey:", a3);
  -[RestoreDownloadsOperation unlock](self, "unlock");
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSError);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    id v57 = v16;
  }

  else
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
    {
      id v58 = v16;
    }

    else if (!v16)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___SSMutableAuthenticationContext);
      -[SSMutableAuthenticationContext setAccountName:](v19, "setAccountName:", a3);
      -[SSMutableAuthenticationContext setAccountNameEditable:](v19, "setAccountNameEditable:", 1LL);
      -[SSMutableAuthenticationContext setCanCreateNewAccount:](v19, "setCanCreateNewAccount:", 0LL);
      -[SSMutableAuthenticationContext setPersistsAcrossDeviceLock:](v19, "setPersistsAcrossDeviceLock:", 1LL);
      -[SSMutableAuthenticationContext setPromptStyle:](v19, "setPromptStyle:", 1001LL);
      id v20 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v20) {
        id v20 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v21 = [v20 shouldLog];
      else {
        LODWORD(v22) = v21;
      }
      uint64_t v23 = (os_log_s *)[v20 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v22 = v22;
      }
      else {
        v22 &= 2u;
      }
      if ((_DWORD)v22)
      {
        uint64_t v24 = objc_opt_class(self);
        int v59 = 138543618;
        uint64_t v60 = v24;
        __int16 v61 = 2112;
        id v62 = a3;
        uint64_t v25 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%{public}@: Attempting to resolve unknown Apple ID: %@",  &v59,  22);
        if (v25)
        {
          id v26 = (void *)v25;
          id v27 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v25, 4LL);
          free(v26);
          uint64_t v50 = v27;
          SSFileLog(v20, @"%@");
        }
      }

      if (-[RestoreDownloadsOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  &v58,  0LL,  v19,  &v57,  v50)
        && (id v28 = +[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"),
            id v29 = objc_msgSend(objc_msgSend(v28, "accountWithUniqueIdentifier:", v58), "accountName"),
            [v29 length]))
      {
        id v30 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v30) {
          id v30 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v31 = [v30 shouldLog];
        else {
          LODWORD(v32) = v31;
        }
        uint64_t v33 = (os_log_s *)[v30 OSLogObject];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v32 = v32;
        }
        else {
          v32 &= 2u;
        }
        if ((_DWORD)v32)
        {
          uint64_t v34 = objc_opt_class(self);
          int v59 = 138544130;
          uint64_t v60 = v34;
          __int16 v61 = 2114;
          id v62 = a3;
          __int16 v63 = 2114;
          id v64 = v29;
          __int16 v65 = 2114;
          id v66 = v58;
          LODWORD(v52) = 42;
          uint64_t v35 = _os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%{public}@: Resolved AppleID: %{public}@ to AppleID: %{public}@ and DSID: %{public}@",  &v59,  v52);
          if (v35)
          {
            v36 = (void *)v35;
            id v37 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL);
            free(v36);
            uint64_t v51 = v37;
            SSFileLog(v30, @"%@");
          }
        }

        -[NSMutableDictionary setObject:forKey:](self->_accountIDsByAppleID, "setObject:forKey:", v58, a3, v51);
        accountIDsByAppleID = self->_accountIDsByAppleID;
        id v39 = v58;
        id v40 = v29;
      }

      else
      {
        id v41 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v41) {
          id v41 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v42 = [v41 shouldLog];
        else {
          LODWORD(v43) = v42;
        }
        id v44 = (os_log_s *)[v41 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          uint64_t v43 = v43;
        }
        else {
          v43 &= 2u;
        }
        if ((_DWORD)v43)
        {
          uint64_t v45 = objc_opt_class(self);
          int v59 = 138543874;
          uint64_t v60 = v45;
          __int16 v61 = 2114;
          id v62 = a3;
          __int16 v63 = 2114;
          id v64 = v57;
          LODWORD(v52) = 32;
          uint64_t v46 = _os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v44,  16LL,  "%{public}@: Could not resolve AppleID: %{public}@ error: %{public}@",  &v59,  v52);
          if (v46)
          {
            unsigned int v47 = (void *)v46;
            v48 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL);
            free(v47);
            uint64_t v51 = v48;
            SSFileLog(v41, @"%@");
          }
        }

        id v39 = v57;
        if (!v57)
        {
          id v39 = (id)SSError(SSErrorDomain, 100LL, 0LL, 0LL);
          id v57 = v39;
        }

        accountIDsByAppleID = self->_accountIDsByAppleID;
        id v40 = a3;
      }

      -[NSMutableDictionary setObject:forKey:](accountIDsByAppleID, "setObject:forKey:", v39, v40, v51);
    }
  }

  if (a4) {
    *a4 = v57;
  }
  return v58;
}

- (void)_applyResponses:(id)a3 withTransaction:(id)a4
{
  id v4 = a4;
  id v91 = [a4 database];
  id v86 = +[DownloadHandlerManager handlerManager](&OBJC_CLASS___DownloadHandlerManager, "handlerManager");
  unsigned int v77 = -[NSString isEqualToString:](self->_restoreReason, "isEqualToString:", @"cancel-retry");
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  id obj = a3;
  id v79 = [a3 countByEnumeratingWithState:&v103 objects:v116 count:16];
  if (v79)
  {
    uint64_t v78 = *(void *)v104;
    uint64_t v88 = SSErrorDomain;
    uint64_t v81 = SSDownloadPhaseCanceled;
    id v87 = v4;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v104 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = v7;
        id v8 = *(void **)(*((void *)&v103 + 1) + 8 * v7);
        v94 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v9 = [v8 serverResponse];
        id v85 = [v9 userIdentifier];
        id v84 = [v9 error];
        int64_t v90 = -[RestoreDownloadsOperation _downloadRestoreStateForError:](self, "_downloadRestoreStateForError:");
        unsigned int v82 = v9;
        id v10 = [v9 downloads];
        __int128 v99 = 0u;
        __int128 v100 = 0u;
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v99 objects:v115 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v100;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v100 != v13) {
                objc_enumerationMutation(v10);
              }
              BOOL v15 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
              id v16 = -[NSNumber initWithItemIdentifier:]( [NSNumber alloc],  "initWithItemIdentifier:",  [v15 itemIdentifier]);
              -[NSMutableDictionary setObject:forKey:](v94, "setObject:forKey:", v15, v16);
            }

            id v12 = [v10 countByEnumeratingWithState:&v99 objects:v115 count:16];
          }

          while (v12);
        }

        id v17 = objc_msgSend(v8, "requestItems", v72, v75);
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        id v89 = v17;
        id v93 = [v17 countByEnumeratingWithState:&v95 objects:v114 count:16];
        if (v93)
        {
          uint64_t v92 = *(void *)v96;
          unsigned int v18 = v77;
          if (v90 != 3) {
            unsigned int v18 = 0;
          }
          unsigned int v83 = v18;
          do
          {
            for (j = 0LL; j != v93; j = (char *)j + 1)
            {
              if (*(void *)v96 != v92) {
                objc_enumerationMutation(v89);
              }
              id v20 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)j);
              unsigned int v21 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v20 downloadIdentifier],  v91);
              id v22 = [v20 storeItemID];
              id v23 = -[NSMutableDictionary objectForKey:](v94, "objectForKey:", v22);
              if (v23)
              {
                uint64_t v24 = v23;
                if (SSDownloadKindIsSoftwareKind([v23 kind])
                  && (id v25 = [v24 requiredDeviceCapabilities]) != 0)
                {
                  unsigned int v26 = -[ISDevice checkCapabilities:withMismatches:]( +[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"),  "checkCapabilities:withMismatches:",  v25,  0LL);
                }

                else
                {
                  unsigned int v26 = 1;
                }

                if (SSDownloadKindIsBookToShimKind(objc_msgSend(v24, "kind", v72)))
                {
                  id v27 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                  if (!v27) {
                    id v27 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                  }
                  unsigned int v28 = [v27 shouldLog];
                  else {
                    unsigned int v29 = v28;
                  }
                  id v30 = (os_log_s *)[v27 OSLogObject];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
                    uint64_t v31 = v29;
                  }
                  else {
                    uint64_t v31 = v29 & 2;
                  }
                  if ((_DWORD)v31)
                  {
                    uint64_t v32 = objc_opt_class(self);
                    id v33 = -[DownloadEntity persistentID](v21, "persistentID");
                    int v108 = 138543874;
                    uint64_t v109 = v32;
                    __int16 v110 = 2048;
                    id v111 = v33;
                    __int16 v112 = 2114;
                    id v113 = v22;
                    LODWORD(v75) = 32;
                    uint64_t v34 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%{public}@: Forwarding download: %lld itemID: %{public}@ to bookassetd",  &v108,  v75);
                    if (v34)
                    {
                      uint64_t v35 = (void *)v34;
                      v36 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL);
                      free(v35);
                      uint64_t v72 = (uint64_t)v36;
                      SSFileLog(v27, @"%@");
                    }
                  }

                  objc_msgSend( v24,  "setRequestPersistentID:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend(v20, "downloadIdentifier", v72)));
                  v107 = v24;
                  +[BookAssetDaemonUtility sendRestoreDownloads:withReason:]( &OBJC_CLASS___BookAssetDaemonUtility,  "sendRestoreDownloads:withReason:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v107, 1LL),  @"restoring books");
                  id v4 = v87;
                }

                else if (v26)
                {
                  -[RestoreDownloadsOperation _updateDownloadEntity:withTransaction:storeDownload:accountID:]( self,  "_updateDownloadEntity:withTransaction:storeDownload:accountID:",  v21,  v4,  v24,  v85);
                  goto LABEL_99;
                }

                id v45 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                if (!v45) {
                  id v45 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                }
                unsigned int v46 = [v45 shouldLog];
                else {
                  unsigned int v47 = v46;
                }
                v48 = (os_log_s *)[v45 OSLogObject];
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
                  uint64_t v49 = v47;
                }
                else {
                  uint64_t v49 = v47 & 2;
                }
                if ((_DWORD)v49)
                {
                  uint64_t v50 = objc_opt_class(self);
                  id v51 = -[DownloadEntity persistentID](v21, "persistentID");
                  int v108 = 138543874;
                  uint64_t v109 = v50;
                  __int16 v110 = 2048;
                  id v111 = v51;
                  __int16 v112 = 2112;
                  id v113 = v22;
                  LODWORD(v75) = 32;
                  uint64_t v52 = _os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v48,  0LL,  "%{public}@: Cancelling forwarded book download: %lld itemID: %@",  &v108,  v75);
                  if (v52)
                  {
                    __int128 v53 = (void *)v52;
                    __int128 v54 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v52,  4LL);
                    free(v53);
                    uint64_t v72 = (uint64_t)v54;
                    SSFileLog(v45, @"%@");
                  }
                }

                objc_msgSend( v4,  "unionChangeset:",  -[DownloadEntity failWithError:](v21, "failWithError:", SSError(v88, 150, 0, 0)));
              }

              else if (v90)
              {
                id v37 = -[RestoreDownloadsOperation _copyDownloadSessionPropertiesForItem:download:]( self,  "_copyDownloadSessionPropertiesForItem:download:",  v20,  v21);
                if ([v86 canOpenSessionWithProperties:v37])
                {
                  id v38 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                  if (!v38) {
                    id v38 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                  }
                  unsigned int v39 = objc_msgSend(v38, "shouldLog", v72);
                  id v40 = (os_log_s *)[v38 OSLogObject];
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
                    uint64_t v41 = v39;
                  }
                  else {
                    uint64_t v41 = v39 & 2;
                  }
                  if ((_DWORD)v41)
                  {
                    uint64_t v42 = objc_opt_class(self);
                    int v108 = 138543618;
                    uint64_t v109 = v42;
                    __int16 v110 = 2114;
                    id v111 = v20;
                    LODWORD(v75) = 22;
                    uint64_t v43 = _os_log_send_and_compose_impl( v41,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  0LL,  "%{public}@: Restore failed for item: %{public}@",  &v108,  v75);
                    if (v43)
                    {
                      id v44 = (void *)v43;
                      +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v43,  4LL);
                      free(v44);
                      SSFileLog(v38, @"%@");
                    }
                  }

                  uint64_t v73 = objc_opt_class(self);
                  SSDebugLog(1LL, @"[%@]: Restore failed for item: %@");
                  -[DownloadEntity setValue:forProperty:]( v21,  "setValue:forProperty:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v90, v73, v20),  @"download_state.restore_state");
                }

                else if (v90 == 1)
                {
                  id v63 = [v20 error];
                  if (v22 && !v63) {
                    id v63 = [v82 errorForItemIdentifier:v22];
                  }
                  if (v63) {
                    id v64 = v63;
                  }
                  else {
                    id v64 = v84;
                  }
                  -[RestoreDownloadsOperation _hardFailRestoreItem:download:transaction:error:]( self,  "_hardFailRestoreItem:download:transaction:error:",  v20,  v21,  v4,  v64,  v72);
                }

                else if (v83)
                {
                  id v65 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                  if (!v65) {
                    id v65 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                  }
                  unsigned int v66 = objc_msgSend(v65, "shouldLog", v72);
                  uint64_t v67 = (os_log_s *)[v65 OSLogObject];
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT)) {
                    uint64_t v68 = v66;
                  }
                  else {
                    uint64_t v68 = v66 & 2;
                  }
                  if ((_DWORD)v68)
                  {
                    uint64_t v69 = objc_opt_class(self);
                    int v108 = 138543618;
                    uint64_t v109 = v69;
                    __int16 v110 = 2114;
                    id v111 = v20;
                    LODWORD(v75) = 22;
                    uint64_t v70 = _os_log_send_and_compose_impl( v68,  0LL,  0LL,  0LL,  &_mh_execute_header,  v67,  0LL,  "%{public}@: Restore cancel retry failed for item: %{public}@",  &v108,  v75);
                    if (v70)
                    {
                      id v71 = (void *)v70;
                      +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v70,  4LL);
                      free(v71);
                      SSFileLog(v65, @"%@");
                    }
                  }

                  uint64_t v74 = objc_opt_class(self);
                  SSDebugLog(1LL, @"[%@]: Restore cancel retry failed for item: %@");
                  objc_msgSend( v4,  "finishDownloadWithID:finalPhase:",  -[DownloadEntity persistentID](v21, "persistentID", v74, v20),  v81);
                }

                else
                {
                  objc_msgSend( v4,  "unionChangeset:",  -[RestoreDownloadsOperation _softFailRestoreItem:download:withRestoreState:error:]( self,  "_softFailRestoreItem:download:withRestoreState:error:",  v20,  v21,  v90,  v84));
                }
              }

              else
              {
                id v55 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                if (!v55) {
                  id v55 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                }
                unsigned int v56 = objc_msgSend(v55, "shouldLog", v72);
                else {
                  unsigned int v57 = v56;
                }
                id v58 = (os_log_s *)[v55 OSLogObject];
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
                  uint64_t v59 = v57;
                }
                else {
                  uint64_t v59 = v57 & 2;
                }
                if ((_DWORD)v59)
                {
                  uint64_t v60 = objc_opt_class(self);
                  int v108 = 138543618;
                  uint64_t v109 = v60;
                  __int16 v110 = 2114;
                  id v111 = v20;
                  LODWORD(v75) = 22;
                  uint64_t v61 = _os_log_send_and_compose_impl( v59,  0LL,  0LL,  0LL,  &_mh_execute_header,  v58,  0LL,  "%{public}@: Restore transient failed item: %{public}@",  &v108,  v75);
                  if (v61)
                  {
                    id v62 = (void *)v61;
                    +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v61,  4LL);
                    free(v62);
                    SSFileLog(v55, @"%@");
                  }
                }

                uint64_t v72 = objc_opt_class(self);
                uint64_t v75 = v20;
                SSDebugLog(1LL, @"[%@]: Restore transient failed for item: %@");
              }

- (id)_copyDownloadSessionPropertiesForItem:(id)a3 download:(id)a4
{
  unsigned int v5 = (DownloadSessionProperties *)[a3 downloadSessionProperties];
  if (!v5)
  {
    v12[0] = @"client_id";
    v12[1] = @"handler_id";
    [a4 getValues:&v10 forProperties:v12 count:2];
    v6 = objc_alloc(&OBJC_CLASS___DownloadSessionProperties);
    uint64_t v7 = v10;
    if (v11) {
      id v8 = [v11 longLongValue];
    }
    else {
      id v8 = 0LL;
    }
    unsigned int v5 = -[DownloadSessionProperties initWithClientIdentifier:handlerIdentifier:]( v6,  "initWithClientIdentifier:handlerIdentifier:",  v7,  v8);
    -[DownloadSessionProperties setDownloadPhase:](v5, "setDownloadPhase:", SSDownloadPhaseDownloading);
  }

  return v5;
}

- (int64_t)_downloadRestoreStateForError:(id)a3
{
  if (-[RestoreDownloadsOperation _isErrorCancelFailure:](self, "_isErrorCancelFailure:")) {
    return 3LL;
  }
  if (-[RestoreDownloadsOperation _isErrorSoftFail:](self, "_isErrorSoftFail:", a3)) {
    return 2LL;
  }
  return !a3 || (SSErrorIsNetworkError(a3, v6) & 1) == 0;
}

- (void)_establishPrimaryAccount
{
  if (!objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"))
  {
    id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v4 = [v3 shouldLog];
    else {
      LODWORD(v5) = v4;
    }
    uint64_t v6 = (os_log_s *)[v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v5 = v5;
    }
    else {
      v5 &= 2u;
    }
    if ((_DWORD)v5)
    {
      int v10 = 138543362;
      uint64_t v11 = objc_opt_class(self);
      uint64_t v7 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: Attempt to establish primary account",  &v10,  12);
      if (v7)
      {
        id v8 = (void *)v7;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
        free(v8);
        SSFileLog(v3, @"%@");
      }
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___SSMutableAuthenticationContext);
    -[SSMutableAuthenticationContext setAccountNameEditable:](v9, "setAccountNameEditable:", 1LL);
    -[SSMutableAuthenticationContext setCanCreateNewAccount:](v9, "setCanCreateNewAccount:", 0LL);
    -[SSMutableAuthenticationContext setPersistsAcrossDeviceLock:](v9, "setPersistsAcrossDeviceLock:", 1LL);
    -[SSMutableAuthenticationContext setPromptStyle:](v9, "setPromptStyle:", 1001LL);
    -[RestoreDownloadsOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  0LL,  0LL,  v9,  0LL);
  }

- (void)_hardFailRestoreItem:(id)a3 download:(id)a4 transaction:(id)a5 error:(id)a6
{
  id v11 = [a4 persistentID];
  if (SSDownloadKindIsPodcastKind([a4 downloadKind])
    && (id v12 = [a6 domain], objc_msgSend(v12, "isEqualToString:", SSServerErrorDomain))
    && [a6 code] == (id)3701)
  {
    id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v13) {
      id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    id v16 = (os_log_s *)[v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v28 = 138543618;
      uint64_t v29 = objc_opt_class(self);
      __int16 v30 = 2114;
      id v31 = a3;
      uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%{public}@: Podcast not found on server for item: %{public}@",  &v28,  22);
      if (v17)
      {
        unsigned int v18 = (void *)v17;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
        free(v18);
        SSFileLog(v13, @"%@");
      }
    }

    uint64_t v26 = objc_opt_class(self);
    id v27 = a3;
    id v19 = @"[%@]: Podcast not found on server for item: %@";
  }

  else
  {
    id v20 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    id v23 = (os_log_s *)[v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      int v28 = 138543874;
      uint64_t v29 = objc_opt_class(self);
      __int16 v30 = 2114;
      id v31 = a3;
      __int16 v32 = 2114;
      id v33 = a6;
      uint64_t v24 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%{public}@: Restore hard failed item: %{public}@ error: %{public}@",  &v28,  32);
      if (v24)
      {
        id v25 = (void *)v24;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
        free(v25);
        SSFileLog(v20, @"%@");
      }
    }

    id v27 = a3;
    uint64_t v26 = objc_opt_class(self);
    id v19 = @"[%@]: Restore hard failed item: %@ error: %@";
  }

  SSDebugLog(1LL, v19);
  objc_msgSend(a5, "finishDownloadWithID:finalPhase:", v11, SSDownloadPhaseCanceled, v26, v27);
}

- (BOOL)_isErrorCancelFailure:(id)a3
{
  if ((ISErrorIsEqual(a3, SSErrorDomain, 16LL) & 1) != 0) {
    return 1;
  }
  else {
    return ISErrorIsEqual(a3, SSServerErrorDomain, 3038LL);
  }
}

- (BOOL)_isErrorSoftFail:(id)a3
{
  id v4 = [a3 domain];
  if (([v4 isEqualToString:SSServerErrorDomain] & 1) != 0
    || ([v4 isEqualToString:NSURLErrorDomain] & 1) != 0
    || ([v4 isEqualToString:kCFErrorDomainCFNetwork] & 1) != 0)
  {
LABEL_4:
    LOBYTE(v5) = 1;
    return v5;
  }

  if ([v4 isEqualToString:SSErrorDomain])
  {
    uint64_t v6 = (char *)[a3 code];
    if ((unint64_t)(v6 - 109) <= 0x17 && ((1LL << (v6 - 109)) & 0x800003) != 0
      || v6 == (char *)16
      || v6 == (char *)2)
    {
      goto LABEL_4;
    }

    LOBYTE(v5) = 0;
  }

  else
  {
    unsigned int v5 = [v4 isEqualToString:NSCocoaErrorDomain];
    if (v5) {
      LOBYTE(v5) = ((unint64_t)[a3 code] & 0xFFFFFFFFFFFFFF00) == 3840;
    }
  }

  return v5;
}

- (id)_newDownloadWithStoreDownload:(id)a3
{
  id v3 = -[Download initWithStoreDownload:](objc_alloc(&OBJC_CLASS___Download), "initWithStoreDownload:", a3);
  -[Download setValue:forProperty:]( v3,  "setValue:forProperty:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"is_from_store");
  -[Download setValue:forProperty:](v3, "setValue:forProperty:", &off_10036D758, @"priority");
  -[Download setValue:forProperty:]( v3,  "setValue:forProperty:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"suppress_error_dialogs");
  id v4 = objc_alloc_init(&OBJC_CLASS___SSNetworkConstraints);
  [v4 disableCellularNetworkTypes];
  -[Download unionNetworkConstraints:](v3, "unionNetworkConstraints:", v4);

  return v3;
}

- (id)_newRestoreItemsWithDownloadIDs:(id)a3
{
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = +[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase");
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000B4DA4;
  v30[3] = &unk_10034B990;
  v30[4] = a3;
  v30[5] = v5;
  [v7 readUsingTransactionBlock:v30];
  id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)[v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if ((_DWORD)v10)
  {
    uint64_t v12 = objc_opt_class(self);
    id v13 = -[NSMutableArray count](v6, "count");
    *(_DWORD *)__int16 v32 = 138543618;
    *(void *)&v32[4] = v12;
    __int16 v33 = 2048;
    id v34 = v13;
    uint64_t v14 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%{public}@: Loading restore data size for %lu items",  v32,  22);
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      id v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
      free(v15);
      uint64_t v24 = v16;
      SSFileLog(v8, @"%@");
    }
  }

  if (-[NSMutableArray count](v6, "count", v24))
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v6);
          }
          unsigned int v21 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v22 = [v21 bundleID];
          if (v22)
          {
            *(void *)__int16 v32 = 0LL;
            objc_msgSend( v21,  "setHasRestoreData:",  +[RestoreBackupOperation restoreDataExistsForApplicationWithBundleID:size:]( RestoreBackupOperation,  "restoreDataExistsForApplicationWithBundleID:size:",  v22,  v32));
            [v21 setRestoreDataSize:*(void *)v32];
          }
        }

        id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
      }

      while (v18);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000B5398;
    v25[3] = &unk_10034D7F0;
    v25[4] = v6;
    [v7 modifyUsingTransactionBlock:v25];
  }

  return v5;
}

- (BOOL)_preflightAccountWithID:(id)a3 isFamily:(BOOL)a4 error:(id *)a5
{
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 1;
  uint64_t v38 = 0LL;
  unsigned int v39 = &v38;
  uint64_t v40 = 0x3052000000LL;
  uint64_t v41 = sub_1000B5A18;
  uint64_t v42 = sub_1000B5A28;
  uint64_t v43 = 0LL;
  id v9 = +[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore");
  uint64_t v10 = v9;
  if (a4) {
    id v11 = [v9 activeAccount];
  }
  else {
    id v11 = [v9 accountWithUniqueIdentifier:a3];
  }
  uint64_t v12 = v11;
  if (objc_msgSend(objc_msgSend(v11, "accountName"), "length"))
  {
    if (([v10 isExpired] & 1) != 0
      || ([v12 isAuthenticated] & 1) == 0)
    {
      id v13 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v12);
      -[SSMutableAuthenticationContext setAccountNameEditable:](v13, "setAccountNameEditable:", 1LL);
      -[SSMutableAuthenticationContext setAllowsSilentAuthentication:](v13, "setAllowsSilentAuthentication:", 1LL);
      -[SSMutableAuthenticationContext setCanCreateNewAccount:](v13, "setCanCreateNewAccount:", 0LL);
      -[SSMutableAuthenticationContext setPersistsAcrossDeviceLock:](v13, "setPersistsAcrossDeviceLock:", 1LL);
      -[SSMutableAuthenticationContext setPromptStyle:](v13, "setPromptStyle:", 1001LL);
      id v14 = [[SSAuthenticateRequest alloc] initWithAuthenticationContext:v13];
      id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v16) = [v15 shouldLog];
      unsigned int v17 = [v15 shouldLogToDisk];
      id v18 = (os_log_s *)[v15 OSLogObject];
      uint64_t v19 = v18;
      if (v17) {
        LODWORD(v16) = v16 | 2;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        uint64_t v16 = v16;
      }
      else {
        v16 &= 2u;
      }
      if ((_DWORD)v16)
      {
        uint64_t v20 = objc_opt_class(self);
        int v48 = 138543618;
        uint64_t v49 = v20;
        __int16 v50 = 2114;
        id v51 = v12;
        uint64_t v21 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  2LL,  "%{public}@: Preflight account: %{public}@",  &v48,  22);
        if (v21)
        {
          id v22 = (void *)v21;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
          free(v22);
          SSFileLog(v15, @"%@");
        }
      }

      id v23 = dispatch_semaphore_create(0LL);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1000B5A34;
      v37[3] = &unk_10034D818;
      v37[6] = &v38;
      v37[4] = v23;
      v37[5] = &v44;
      [v14 startWithAuthenticateResponseBlock:v37];
      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v23);
    }
  }

  else
  {
    id v24 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v24) {
      id v24 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v25) = [v24 shouldLog];
    unsigned int v26 = [v24 shouldLogToDisk];
    __int128 v27 = (os_log_s *)[v24 OSLogObject];
    __int128 v28 = v27;
    if (v26) {
      LODWORD(v25) = v25 | 2;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      uint64_t v29 = objc_opt_class(self);
      int v48 = 138543618;
      uint64_t v49 = v29;
      __int16 v50 = 2114;
      id v51 = a3;
      uint64_t v30 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  1LL,  "%{public}@: Cannot restore without an AppleID for account: %{public}@",  &v48,  22);
      if (v30)
      {
        id v31 = (void *)v30;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
        free(v31);
        SSFileLog(v24, @"%@");
      }
    }

    id v32 = (id)SSError(SSErrorDomain, 114LL, 0LL, 0LL);
    v39[5] = (uint64_t)v32;
    *((_BYTE *)v45 + 24) = 0;
  }

  __int16 v33 = v39;
  if (a5) {
    *a5 = (id)v39[5];
  }
  id v34 = (id)v33[5];
  char v35 = *((_BYTE *)v45 + 24);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  return v35;
}

- (void)_scheduleAutomaticRetry
{
  id v3 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"RestoreSoftFailRetryCount", kSSUserDefaultsIdentifier, 0LL);
  if (AppIntegerValue <= 4)
  {
    CFIndex v5 = AppIntegerValue;
    id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v6) {
      id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    id v9 = (os_log_s *)[v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      uint64_t v10 = objc_opt_class(self);
      CFIndex v11 = v5 + 1;
      int v16 = 138543874;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      CFIndex v19 = v5 + 1;
      __int16 v20 = 2048;
      uint64_t v21 = 0x40AC200000000000LL;
      uint64_t v12 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Schedule restore soft-fail retry #%ld in %.0f seconds",  &v16,  32);
      if (v12)
      {
        id v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        SSFileLog(v6, @"%@");
      }
    }

    else
    {
      CFIndex v11 = v5 + 1;
    }

    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v14, XPC_ACTIVITY_DELAY, 3600LL);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    id v15 = -[BackgroundTaskRequest initWithBackgroundTaskAgentJob:]( objc_alloc(&OBJC_CLASS___BackgroundTaskRequest),  "initWithBackgroundTaskAgentJob:",  v14);
    -[BackgroundTaskRequest setRequestIdentifier:]( v15,  "setRequestIdentifier:",  @"com.apple.itunesstored.RetrySoftFailedRestoreDownloads");
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addBackgroundTaskWithRequest:", v15);

    CFPreferencesSetAppValue( @"RestoreSoftFailRetryCount",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11),  v3);
    CFPreferencesAppSynchronize(v3);
    xpc_release(v14);
  }

- (void)_scheduleCancelRetry
{
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v11 = 138543618;
    uint64_t v12 = objc_opt_class(self);
    __int16 v13 = 2048;
    uint64_t v14 = 0x40F5180000000000LL;
    uint64_t v7 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: Schedule restore cancel retry in %.0f seconds",  &v11,  22);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
      free(v8);
      SSFileLog(v3, @"%@");
    }
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v9, XPC_ACTIVITY_DELAY, 3600LL);
  xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  uint64_t v10 = -[BackgroundTaskRequest initWithBackgroundTaskAgentJob:]( objc_alloc(&OBJC_CLASS___BackgroundTaskRequest),  "initWithBackgroundTaskAgentJob:",  v9);
  -[BackgroundTaskRequest setRequestIdentifier:]( v10,  "setRequestIdentifier:",  @"com.apple.itunesstored.RetryCanceledRestoreDownloads");
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addBackgroundTaskWithRequest:", v10);

  xpc_release(v9);
}

- (BOOL)_shouldAuthenticateForCancelRetry
{
  id v3 = objc_alloc(&OBJC_CLASS___ISDialog);
  unsigned int v4 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"RESTORE_CANCEL_RETRY_TITLE",  &stru_10035EB18,  0LL);
  uint64_t v5 = -[ISDialog initWithTitle:message:]( v3,  "initWithTitle:message:",  v4,  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"RESTORE_CANCEL_RETRY_BODY",  &stru_10035EB18,  0LL));
  id v6 = +[ISDialogButton buttonWithTitle:]( &OBJC_CLASS___ISDialogButton,  "buttonWithTitle:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"RESTORE_CANCEL_RETRY_DELETE_BUTTON",  &stru_10035EB18,  0LL));
  uint64_t v7 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v6,  +[ISDialogButton buttonWithTitle:]( &OBJC_CLASS___ISDialogButton,  "buttonWithTitle:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog)),  "localizedStringForKey:value:table:",  @"RESTORE_CANCEL_RETRY_DOWNLOAD_BUTTON",  &stru_10035EB18,  0LL)),  0LL);
  -[ISDialog setButtons:](v5, "setButtons:", v7);
  BOOL v8 = 1;
  -[ISDialog setDefaultButtonIndex:](v5, "setDefaultButtonIndex:", 1LL);
  -[ISDialog setDismissOnLock:](v5, "setDismissOnLock:", 0LL);
  -[ISDialog setShouldDismissAfterUnlock:](v5, "setShouldDismissAfterUnlock:", 0LL);
  xpc_object_t v9 = +[ISDialogOperation operationWithDialog:](&OBJC_CLASS___ISDialogOperation, "operationWithDialog:", v5);
  -[RestoreDownloadsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v9, 0LL);

  id v10 = -[ISDialogOperation selectedButton](v9, "selectedButton");
  if (v10) {
    return v10 == -[NSArray objectAtIndex:](v7, "objectAtIndex:", 1LL);
  }
  return v8;
}

- (BOOL)_shouldAutomaticallyRetryAfterSoftFailError:(id)a3
{
  id v4 = [a3 domain];
  if ([v4 isEqualToString:NSURLErrorDomain])
  {
    LOBYTE(v5) = 1;
  }

  else if ([v4 isEqualToString:SSServerErrorDomain])
  {
    LOBYTE(v5) = [a3 code] != (id)3038;
  }

  else
  {
    LODWORD(v5) = [v4 isEqualToString:SSErrorDomain];
    if ((_DWORD)v5)
    {
      uint64_t v5 = (char *)[a3 code];
      else {
        LOBYTE(v5) = 0;
      }
    }
  }

  return (char)v5;
}

- (id)_softFailRestoreItem:(id)a3 download:(id)a4 withRestoreState:(int64_t)a5 error:(id)a6
{
  id v11 = [a4 failWithError:a6];
  id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    LODWORD(v14) = v13;
  }
  id v15 = (os_log_s *)[v12 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v14 = v14;
  }
  else {
    v14 &= 2u;
  }
  if ((_DWORD)v14)
  {
    int v24 = 138543874;
    uint64_t v25 = objc_opt_class(self);
    __int16 v26 = 2114;
    id v27 = a3;
    __int16 v28 = 2114;
    id v29 = a6;
    uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%{public}@: Soft failed item: %{public}@ error: %{public}@",  &v24,  32);
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
      free(v17);
      SSFileLog(v12, @"%@");
    }
  }

  id v23 = a3;
  uint64_t v22 = objc_opt_class(self);
  BOOL v18 = 1;
  SSDebugLog(1LL, @"[%@]: Soft failed item: %@ error: %@");
  if (!self->_hadAutoRetrySoftFailure) {
    BOOL v18 = -[RestoreDownloadsOperation _shouldAutomaticallyRetryAfterSoftFailError:]( self,  "_shouldAutomaticallyRetryAfterSoftFailError:",  a6,  v22,  v23,  a6);
  }
  self->_hadAutoRetrySoftFailure = v18;
  BOOL v20 = a5 == 3 || self->_hadCancelFailure;
  self->_hadCancelFailure = v20;
  return v11;
}

- (BOOL)_updateDownloadEntity:(id)a3 withTransaction:(id)a4 storeDownload:(id)a5 accountID:(id)a6
{
  id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    unsigned int v12 = v11;
  }
  unsigned int v13 = (os_log_s *)[v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 & 2;
  }
  if ((_DWORD)v14)
  {
    int v24 = 138544386;
    uint64_t v25 = objc_opt_class(self);
    __int16 v26 = 2048;
    id v27 = [a3 persistentID];
    __int16 v28 = 2048;
    id v29 = [a5 itemIdentifier];
    __int16 v30 = 2114;
    id v31 = [a5 artistName];
    __int16 v32 = 2114;
    id v33 = [a5 title];
    uint64_t v15 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%{public}@: Updating download %lld with restore metadata for item: [%llu, %{public}@, %{public}@]",  &v24,  52);
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      uint64_t v17 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v15, 4LL);
      free(v16);
      uint64_t v22 = v17;
      SSFileLog(v10, @"%@");
    }
  }

  id v18 = -[RestoreDownloadsOperation _newDownloadWithStoreDownload:](self, "_newDownloadWithStoreDownload:", a5, v22);
  CFIndex v19 = v18;
  if (a6) {
    [v18 setValue:a6 forProperty:@"store_account_id"];
  }
  unsigned int v20 = objc_msgSend( a4,  "updateDownloadEntityWithIdentifier:withDownload:",  objc_msgSend(a3, "persistentID"),  v19);
  if (v20) {
    objc_msgSend( a5,  "writeToFile:options:error:",  objc_msgSend( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  objc_msgSend(a3, "persistentID"),  objc_msgSend(a5, "kind"),  1),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist"),  0,  0);
  }

  return v20;
}

@end