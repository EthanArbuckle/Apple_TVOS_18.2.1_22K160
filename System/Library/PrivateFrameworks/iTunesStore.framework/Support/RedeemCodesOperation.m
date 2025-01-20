@interface RedeemCodesOperation
- (BOOL)_canPerformExtendedBiometricActions;
- (BOOL)_didUserCancelWithError:(id)a3;
- (BOOL)_fetchRedeemCodeMetadataWithError:(id *)a3;
- (BOOL)_processDictionary:(id)a3 dialog:(id *)a4 error:(id *)a5;
- (BOOL)_useLegacyRedeem;
- (BOOL)cameraRecognized;
- (BOOL)headless;
- (NSArray)redeemCodes;
- (NSDictionary)params;
- (NSString)logCorrelationKey;
- (NSString)userAgent;
- (RedeemCodesOperation)initWithRedeemCodes:(id)a3;
- (SSAuthenticationContext)authenticationContext;
- (SSRedeemCodesResponse)redeemResponse;
- (id)_authenticateAppleAccount:(id)a3 withTitle:(id)a4 error:(id *)a5;
- (id)_installedExternalVersionForRedeemCodeMetadata:(id)a3;
- (id)_newURLRequestPropertiesForCode:(id)a3;
- (id)_newURLRequestPropertiesForServiceActionButton:(id)a3;
- (void)_postNotificationWithResponse:(id)a3;
- (void)_runHeadless;
- (void)_runNonHeadless;
- (void)operation:(id)a3 selectedButton:(id)a4;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setCameraRecognized:(BOOL)a3;
- (void)setHeadless:(BOOL)a3;
- (void)setLogCorrelationKey:(id)a3;
- (void)setParams:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation RedeemCodesOperation

- (RedeemCodesOperation)initWithRedeemCodes:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RedeemCodesOperation;
  v5 = -[RedeemCodesOperation init](&v14, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___ISBiometricStore);
    biometricStore = v5->_biometricStore;
    v5->_biometricStore = v6;

    v8 = (NSArray *)[v4 copy];
    redeemCodes = v5->_redeemCodes;
    v5->_redeemCodes = v8;

    v5->_headless = 1;
    uint64_t v10 = AMSGenerateLogCorrelationKey();
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    logCorrelationKey = v5->_logCorrelationKey;
    v5->_logCorrelationKey = (NSString *)v11;
  }

  return v5;
}

- (SSAuthenticationContext)authenticationContext
{
  v3 = self->_authenticationContext;
  -[RedeemCodesOperation unlock](self, "unlock");
  return v3;
}

- (NSArray)redeemCodes
{
  return self->_redeemCodes;
}

- (SSRedeemCodesResponse)redeemResponse
{
  v3 = self->_redeemResponse;
  -[RedeemCodesOperation unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  -[RedeemCodesOperation lock](self, "lock");
  if (self->_authenticationContext != v6)
  {
    id v4 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](v6, "copy");
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }

  -[RedeemCodesOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  v6 = (NSString *)a3;
  -[RedeemCodesOperation lock](self, "lock");
  if (self->_userAgent != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }

  -[RedeemCodesOperation unlock](self, "unlock");
}

- (NSString)userAgent
{
  v3 = self->_userAgent;
  -[RedeemCodesOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  if (self->_headless) {
    -[RedeemCodesOperation _runHeadless](self, "_runHeadless");
  }
  else {
    -[RedeemCodesOperation _runNonHeadless](self, "_runNonHeadless");
  }
}

- (void)operation:(id)a3 selectedButton:(id)a4
{
}

- (id)_authenticateAppleAccount:(id)a3 withTitle:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_altDSID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_personID"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v10 longLongValue]));

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 username]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  objc_super v14 = (SSAccount *)objc_claimAutoreleasedReturnValue([v13 accountWithAltDSID:v9 uniqueIdentifier:v11 accountName:v12]);

  if (!v14)
  {
    objc_super v14 = objc_alloc_init(&OBJC_CLASS___SSAccount);
    -[SSAccount setAccountName:](v14, "setAccountName:", v12);
    -[SSAccount setAltDSID:](v14, "setAltDSID:", v9);
    -[SSAccount setUniqueIdentifier:](v14, "setUniqueIdentifier:", v11);
  }

  v67 = (void *)v12;
  v68 = (void *)v11;
  v70 = v9;
  v15 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v14);
  -[SSMutableAuthenticationContext setCanSetActiveAccount:](v15, "setCanSetActiveAccount:", 0LL);
  -[SSMutableAuthenticationContext setPromptStyle:](v15, "setPromptStyle:", 1LL);
  -[SSMutableAuthenticationContext setPromptTitle:](v15, "setPromptTitle:", v7);

  -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v15,  "setValue:forHTTPHeaderField:",  @"1",  SSHTTPHeaderXAppleAllowLiteAccountConversion);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v16) {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v17 = [v16 shouldLog];
  else {
    unsigned int v18 = v17;
  }
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = v18 & 2;
  }
  v65 = self;
  v66 = v14;
  if (!(_DWORD)v20) {
    goto LABEL_14;
  }
  v21 = (void *)objc_opt_class(self);
  id v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](self, "logCorrelationKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount hashedDescription](v14, "hashedDescription"));
  int v71 = 138543874;
  v72 = v21;
  __int16 v73 = 2114;
  v74 = v23;
  __int16 v75 = 2114;
  v76 = v24;
  v25 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%{public}@: [%{public}@] The server told us to redeem the code again using the iCloud account. iCloudA ccount = %{public}@",  &v71,  32);

  if (v25)
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
    free(v25);
    v60 = v19;
    SSFileLog(v16, @"%@");
LABEL_14:
  }

  id v26 = objc_alloc_init(&OBJC_CLASS___SSPromise);
  id v27 = [[SSAuthenticateRequest alloc] initWithAuthenticationContext:v15];
  v28 = (void *)objc_claimAutoreleasedReturnValue([v26 completionHandlerAdapter]);
  [v27 startWithAuthenticateResponseBlock:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v26 resultWithError:0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 error]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 domain]);
  uint64_t v32 = SSErrorDomain;
  if ([v31 isEqualToString:SSErrorDomain] && objc_msgSend(v30, "code") == (id)140)
  {

    goto LABEL_20;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "domain", v60));
  if ([v33 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {
    id v34 = [v30 code];

    if (v34 == (id)-7003LL)
    {
LABEL_20:
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v60));
      if (!v35) {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v36 = [v35 shouldLog];
      else {
        unsigned int v37 = v36;
      }
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v39 = v37;
      }
      else {
        uint64_t v39 = v37 & 2;
      }
      if ((_DWORD)v39)
      {
        uint64_t v63 = v32;
        v40 = v15;
        v41 = v29;
        id v42 = v27;
        id v43 = v26;
        v44 = (void *)objc_opt_class(v65);
        id v62 = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](v65, "logCorrelationKey"));
        int v71 = 138543874;
        v72 = v44;
        id v26 = v43;
        id v27 = v42;
        v29 = v41;
        v15 = v40;
        uint64_t v32 = v63;
        __int16 v73 = 2114;
        v74 = v45;
        __int16 v75 = 2114;
        v76 = v30;
        LODWORD(v61) = 32;
        v46 = (void *)_os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "%{public}@: [%{public}@] The user cancelled the redeem. error = %{public}@",  &v71,  v61);

        v9 = v70;
        if (!v46)
        {
LABEL_47:

          uint64_t v57 = SSError(v32, 16LL, 0LL, 0LL);
          v47 = v30;
          v30 = (void *)objc_claimAutoreleasedReturnValue(v57);
          v55 = v67;
          goto LABEL_51;
        }

        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
        free(v46);
        v60 = v38;
        SSFileLog(v35, @"%@");
      }

      else
      {
        v9 = v70;
      }

      goto LABEL_47;
    }
  }

  else
  {
  }

  if (!v30)
  {
    v55 = v67;
    v56 = v68;
    goto LABEL_52;
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v47) {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v48 = [v47 shouldLog];
  else {
    LODWORD(v49) = v48;
  }
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 OSLogObject]);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
    uint64_t v49 = v49;
  }
  else {
    v49 &= 2u;
  }
  if ((_DWORD)v49)
  {
    id v64 = v27;
    v51 = (void *)objc_opt_class(v65);
    id v52 = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](v65, "logCorrelationKey"));
    int v71 = 138543874;
    v72 = v51;
    __int16 v73 = 2114;
    v74 = v53;
    __int16 v75 = 2114;
    v76 = v30;
    LODWORD(v61) = 32;
    v54 = (void *)_os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v50,  16LL,  "%{public}@: [%{public}@] Failed to authenticate the iCloud account. The redeem will fail. error = %{public}@",  &v71,  v61);

    if (!v54)
    {
      v9 = v70;
      v55 = v67;
      id v27 = v64;
      goto LABEL_51;
    }

    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v54,  4LL));
    free(v54);
    v60 = v50;
    SSFileLog(v47, @"%@");
    v9 = v70;
    v55 = v67;
    id v27 = v64;
  }

  else
  {
    v55 = v67;
  }

LABEL_51:
  v56 = v68;
LABEL_52:
  if (a5) {
    *a5 = v30;
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "authenticatedAccount", v60));

  return v58;
}

- (void)_runHeadless
{
  v80 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v79 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v91 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation userAgent](self, "userAgent"));
  v84 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation authenticationContext](self, "authenticationContext"));
  id v5 = [v4 mutableCopy];

  v89 = v5;
  v90 = (void *)v3;
  uint64_t v88 = SSHTTPHeaderUserAgent;
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v3);
  v6 = &ACSLocateCachingServer_ptr;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    unsigned int v9 = v8;
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 & 2;
  }
  if (!(_DWORD)v11) {
    goto LABEL_12;
  }
  uint64_t v12 = (void *)objc_opt_class(v84);
  id v13 = v12;
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](v84, "logCorrelationKey"));
  NSUInteger v15 = -[NSArray count](v84->_redeemCodes, "count");
  int v98 = 138543874;
  v99 = v12;
  __int16 v100 = 2114;
  v101 = v14;
  __int16 v102 = 2048;
  NSUInteger v103 = v15;
  v16 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%{public}@: [%{public}@] Redeeming %lu codes headless",  &v98,  32);

  if (v16)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
    free(v16);
    int v71 = v10;
    SSFileLog(v7, @"%@");
LABEL_12:
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  unsigned int v17 = (id *)v84;
  obj = v84->_redeemCodes;
  unsigned int v18 = v80;
  id v87 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v94,  v106,  16LL);
  if (!v87) {
    goto LABEL_61;
  }
  v19 = &selRef_initWithDelayedGoto_;
  uint64_t v75 = kISDialogKey;
  uint64_t v76 = SSServerErrorDomain;
  uint64_t v20 = &selRef_accountCacheDatabase;
  uint64_t v85 = SSErrorDomain;
  uint64_t v86 = *(void *)v95;
  do
  {
    v21 = 0LL;
    v77 = v19[203];
    v78 = v20[305];
    do
    {
      if (*(void *)v95 != v86) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(*((void *)&v94 + 1) + 8LL * (void)v21);
      v92 = objc_autoreleasePoolPush();
      id v23 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
      [v23 setAuthenticationContext:v89];
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
      [v23 setDataProvider:v24];

      objc_msgSend( v23,  "setNeedsAuthentication:",  objc_msgSend(v17, "_canPerformExtendedBiometricActions") ^ 1);
      v25 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
      -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v25,  "setValue:forRequestParameter:",  v22,  @"certId");
      -[SSMutableURLRequestProperties setURLBagKey:](v25, "setURLBagKey:", @"p2-headless-redemption");
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", v90, v88);
      [v23 setRequestProperties:v25];
      id v93 = 0LL;
      LOBYTE(v24) = [v17 runSubOperation:v23 returningError:&v93];
      id v26 = v93;
      if ((v24 & 1) != 0)
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 dataProvider]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 output]);

        v29 = v28;
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0)
        {
          v81 = v28;
          id v31 = v28;
          uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 objectForKey:@"failureType"]);
          v33 = (void *)v32;
          BOOL v82 = v32 == 0;
          if (v32)
          {
            if ((objc_opt_respondsToSelector(v32, v77) & 1) != 0) {
              id v34 = [v33 integerValue];
            }
            else {
              id v34 = 0LL;
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", @"customerMessage", v71));
            uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v41, v42) & 1) == 0)
            {
              id v43 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v75]);
              uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0)
              {
                v74 = -[ISDialog initWithDialogDictionary:]( objc_alloc(&OBJC_CLASS___ISDialog),  "initWithDialogDictionary:",  v43);
                uint64_t v73 = objc_claimAutoreleasedReturnValue(-[ISDialog title](v74, "title"));

                v41 = (void *)v73;
              }
            }

            uint64_t v45 = SSError(v76, v34, v41, 0LL);
            uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);

            id v26 = (id)v46;
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", @"cancel-purchase-batch", v71));
          if ((objc_opt_respondsToSelector(v47, v78) & 1) != 0) {
            unsigned int v35 = [v47 BOOLValue];
          }
          else {
            unsigned int v35 = 0;
          }

          unsigned int v18 = v80;
          v29 = v81;
          int v40 = v82;
        }

        else
        {
          id v31 = 0LL;
          unsigned int v35 = 0;
          int v40 = 1;
        }

        -[NSMutableDictionary setObject:forKey:](v91, "setObject:forKey:", v31, v22);
        unsigned int v36 = v92;
        if (v40)
        {
          unsigned int v17 = (id *)v84;
          if (v31)
          {
            -[RedeemCodesOperation _postNotificationWithResponse:](v84, "_postNotificationWithResponse:", v31);
            v38 = v79;
            id v39 = v31;
            goto LABEL_42;
          }
        }

        else
        {
          unsigned int v17 = (id *)v84;
        }
      }

      else
      {
        -[NSMutableDictionary setObject:forKey:](v91, "setObject:forKey:", 0LL, v22);
        unsigned int v35 = 0;
        id v31 = 0LL;
        unsigned int v36 = v92;
      }

      if (v26)
      {
        v35 |= ISErrorIsEqual(v26, v85, 16LL);
      }

      else
      {
        uint64_t v37 = SSError(v85, 100LL, 0LL, 0LL);
        id v26 = (id)objc_claimAutoreleasedReturnValue(v37);
      }

      v38 = v18;
      id v39 = v26;
LABEL_42:
      -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v39, v22, v71);

      objc_autoreleasePoolPop(v36);
      if (v35)
      {
        v6 = &ACSLocateCachingServer_ptr;
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v49) {
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v50 = [v49 shouldLog];
        else {
          unsigned int v51 = v50;
        }
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 OSLogObject]);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v53 = v51;
        }
        else {
          uint64_t v53 = v51 & 2;
        }
        if ((_DWORD)v53)
        {
          v54 = (void *)objc_opt_class(v17);
          id v55 = v54;
          v56 = (void *)objc_claimAutoreleasedReturnValue([v17 logCorrelationKey]);
          int v98 = 138543618;
          v99 = v54;
          __int16 v100 = 2114;
          v101 = v56;
          LODWORD(v72) = 22;
          uint64_t v57 = (void *)_os_log_send_and_compose_impl( v53,  0LL,  0LL,  0LL,  &_mh_execute_header,  v52,  0LL,  "%{public}@: [%{public}@] Canceled redeem batch",  &v98,  v72);

          if (!v57)
          {
LABEL_60:

            goto LABEL_61;
          }

          id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v57,  4LL));
          free(v57);
          int v71 = v52;
          SSFileLog(v49, @"%@");
        }

        goto LABEL_60;
      }

      v21 = (char *)v21 + 1;
    }

    while (v87 != v21);
    id v48 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v94,  v106,  16LL);
    v6 = &ACSLocateCachingServer_ptr;
    id v87 = v48;
    v19 = &selRef_initWithDelayedGoto_;
    uint64_t v20 = &selRef_accountCacheDatabase;
  }

  while (v48);
LABEL_61:

  v58 = (void *)objc_claimAutoreleasedReturnValue([v6[459] sharedDaemonConfig]);
  if (!v58) {
    v58 = (void *)objc_claimAutoreleasedReturnValue([v6[459] sharedConfig]);
  }
  unsigned int v59 = objc_msgSend(v58, "shouldLog", v71);
  else {
    LODWORD(v60) = v59;
  }
  uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v58 OSLogObject]);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v60 = v60;
  }
  else {
    v60 &= 2u;
  }
  if ((_DWORD)v60)
  {
    id v62 = (void *)objc_opt_class(v17);
    id v63 = v62;
    id v64 = (void *)objc_claimAutoreleasedReturnValue([v17 logCorrelationKey]);
    id v65 = -[NSMutableDictionary count](v79, "count");
    v66 = v80;
    id v67 = -[NSMutableDictionary count](v80, "count");
    int v98 = 138544130;
    v99 = v62;
    __int16 v100 = 2114;
    v101 = v64;
    __int16 v102 = 2048;
    NSUInteger v103 = (NSUInteger)v65;
    unsigned int v17 = (id *)v84;
    __int16 v104 = 2048;
    id v105 = v67;
    LODWORD(v72) = 42;
    v68 = (void *)_os_log_send_and_compose_impl( v60,  0LL,  0LL,  0LL,  &_mh_execute_header,  v61,  0LL,  "%{public}@: [%{public}@] Redeemed %lu codes with %lu failures",  &v98,  v72);

    if (v68)
    {
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v68,  4LL));
      free(v68);
      SSFileLog(v58, @"%@");
      goto LABEL_73;
    }
  }

  else
  {
    v66 = v80;
LABEL_73:
  }

  [v17 lock];
  v69 = objc_alloc_init(&OBJC_CLASS___SSRedeemCodesResponse);
  id v70 = v17[20];
  v17[20] = v69;

  [v17[20] setCodeResponses:v91];
  [v17[20] setFailedCodes:v66];
  [v17[20] setRedeemedCodes:v79];
  [v17 unlock];
  [v17 setSuccess:1];
}

- (void)_runNonHeadless
{
  v106 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int16 v104 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v108 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation userAgent](self, "userAgent"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation authenticationContext](self, "authenticationContext"));
  id v5 = (SSMutableAuthenticationContext *)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(&OBJC_CLASS___SSMutableAuthenticationContext);
  }
  v115 = v5;
  -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v5,  "setValue:forHTTPHeaderField:",  v3,  SSHTTPHeaderUserAgent);
  v114 = self;
  v101 = (void *)v3;
  if (!-[RedeemCodesOperation _useLegacyRedeem](self, "_useLegacyRedeem"))
  {
    id v102 = 0LL;
LABEL_27:
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      id v26 = (void *)objc_opt_class(v114);
      id v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](v114, "logCorrelationKey"));
      NSUInteger v29 = -[NSArray count](v114->_redeemCodes, "count");
      int v134 = 138543874;
      v135 = v26;
      __int16 v136 = 2114;
      v137 = v28;
      __int16 v138 = 2048;
      NSUInteger v139 = v29;
      uint64_t v30 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%{public}@: [%{public}@] Redeeming %lu codes",  &v134,  32,  v101);

      if (!v30)
      {
LABEL_39:

        __int128 v127 = 0u;
        __int128 v128 = 0u;
        __int128 v125 = 0u;
        __int128 v126 = 0u;
        id v31 = (id *)v114;
        obj = v114->_redeemCodes;
        id v109 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v125,  v142,  16LL);
        if (!v109) {
          goto LABEL_94;
        }
        uint64_t v107 = *(void *)v126;
        uint64_t v103 = SSErrorDomain;
        while (1)
        {
          uint64_t v32 = 0LL;
          do
          {
            if (*(void *)v126 != v107) {
              objc_enumerationMutation(obj);
            }
            uint64_t v111 = v32;
            v113 = *(void **)(*((void *)&v125 + 1) + 8 * v32);
            context = objc_autoreleasePoolPush();
            id v33 = 0LL;
            id v34 = 0LL;
            id v35 = 0LL;
            while (1)
            {

              id v36 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
              [v36 setAuthenticationContext:v115];
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[RedeemCodesProtocolDataProvider provider]( &OBJC_CLASS___RedeemCodesProtocolDataProvider,  "provider"));
              [v37 setShouldProcessDialogs:0];
              [v36 setDataProvider:v37];
              id v117 = [v31 _newURLRequestPropertiesForCode:v113];
              objc_msgSend(v36, "setRequestProperties:");
              id v124 = 0LL;
              unsigned int v38 = [v31 runSubOperation:v36 returningError:&v124];
              id v33 = v124;
              if (v38)
              {
                id v39 = (void *)objc_claimAutoreleasedReturnValue([v36 dataProvider]);
                int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 output]);

                uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
                {
                  id v34 = v40;
                  id v122 = v33;
                  id v123 = 0LL;
                  unsigned int v42 = -[RedeemCodesOperation _processDictionary:dialog:error:]( v114,  "_processDictionary:dialog:error:",  v34,  &v123,  &v122);
                  id v35 = v123;
                  id v43 = v122;

                  unsigned int v44 = v42;
                  id v45 = v43;
                  id v31 = (id *)v114;
                  id v33 = v45;
                }

                else
                {
                  unsigned int v44 = 0;
                  id v35 = 0LL;
                  id v34 = 0LL;
                  id v31 = (id *)v114;
                }
              }

              else
              {
                unsigned int v44 = 0;
                id v35 = 0LL;
                id v34 = 0LL;
              }

              uint64_t v46 = v37;
              uint64_t v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dialogButton", v99));
              id v48 = v31[15];
              v31[15] = (id)v47;

              unsigned int v112 = v44;
              if (v44 || [v33 code] != (id)3580) {
                break;
              }
              uint64_t v49 = v35;
              id v116 = v34;
              unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue( +[SSVAppleAccountStore sharedAccountStore]( &OBJC_CLASS___SSVAppleAccountStore,  "sharedAccountStore"));
              unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue([v50 primaryAppleAccount]);

              id v52 = v33;
              uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v33 userInfo]);
              v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
              id v121 = 0LL;
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v31 _authenticateAppleAccount:v51 withTitle:v54 error:&v121]);
              id v56 = v121;

              if (v55)
              {
                id v57 = v52;
                id v52 = (void *)objc_claimAutoreleasedReturnValue([v55 uniqueIdentifier]);
                -[SSMutableAuthenticationContext setRequiredUniqueIdentifier:]( v115,  "setRequiredUniqueIdentifier:",  v52);
              }

              else
              {

                uint64_t v49 = 0LL;
                id v57 = v56;
              }

              id v31 = (id *)v114;
              id v34 = v116;
              id v35 = v49;
              id v33 = v57;
              if (!v55) {
                goto LABEL_59;
              }
            }

LABEL_59:
            unsigned int v58 = v112 != 0;
            if (v35 && [v35 kind] != (id)1)
            {
              unsigned int v59 = (void *)objc_claimAutoreleasedReturnValue( +[ISDialogOperation operationWithDialog:]( &OBJC_CLASS___ISDialogOperation,  "operationWithDialog:",  v35));
              [v59 setDelegate:v31];
              id v120 = v33;
              [v31 runSubOperation:v59 returningError:&v120];
              id v60 = v120;

              id v33 = v60;
              id v31 = (id *)v114;
            }

            id v61 = v31[15];
            if (v61)
            {
              if ([v61 actionType] == 10)
              {
                id v62 = [v31 _newURLRequestPropertiesForServiceActionButton:v31[15]];
                id v63 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
                [v63 setAuthenticationContext:v115];
                id v64 = (void *)objc_claimAutoreleasedReturnValue( +[DaemonProtocolDataProvider provider]( &OBJC_CLASS___DaemonProtocolDataProvider,  "provider"));
                [v63 setDataProvider:v64];

                [v63 setRequestProperties:v62];
                id v119 = v33;
                LODWORD(v64) = [v31 runSubOperation:v63 returningError:&v119];
                id v65 = v119;

                if ((_DWORD)v64)
                {
                  v66 = (void *)objc_claimAutoreleasedReturnValue([v63 dataProvider]);
                  id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 output]);

                  uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                  if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0)
                  {
                    id v69 = v67;

                    id v118 = v65;
                    unsigned int v58 = [v31 _processDictionary:v69 dialog:0 error:&v118];
                    id v70 = v118;

                    id v34 = v69;
                    id v65 = v70;
                    id v31 = (id *)v114;
                  }
                }

                char v71 = 0;
                id v33 = v65;
              }

              else
              {
                [v31[15] performDefaultActionForDialog:v35];
                char v71 = 1;
              }
            }

            else
            {
              char v71 = 0;
            }

            -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v34, v113);
            if (v58 && v34)
            {
              [v31 _postNotificationWithResponse:v34];
              -[NSMutableDictionary setObject:forKey:](v104, "setObject:forKey:", v34, v113);
              goto LABEL_92;
            }

            if (v33)
            {
              if ((v71 & 1) == 0) {
                goto LABEL_78;
              }
            }

            else
            {
              uint64_t v72 = SSError(v103, 100LL, 0LL, 0LL);
              id v33 = (id)objc_claimAutoreleasedReturnValue(v72);
              if ((v71 & 1) == 0)
              {
LABEL_78:
              }
            }

            uint64_t v73 = SSErrorBySettingUserInfoValue(v33, @"hideError", &__kCFBooleanTrue);
            uint64_t v74 = objc_claimAutoreleasedReturnValue(v73);

            id v33 = (id)v74;
LABEL_80:
            -[NSMutableDictionary setObject:forKey:](v106, "setObject:forKey:", v33, v113);
            uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v75) {
              uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v76) = [v75 shouldLog];
            v77 = (os_log_s *)objc_claimAutoreleasedReturnValue([v75 OSLogObject]);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              uint64_t v76 = v76;
            }
            else {
              v76 &= 2u;
            }
            if (!(_DWORD)v76) {
              goto LABEL_90;
            }
            v78 = (void *)objc_opt_class(v31);
            id v79 = v33;
            id v80 = v78;
            v81 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](v114, "logCorrelationKey"));
            uint64_t v82 = AMSLogableError(v79);
            v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
            int v134 = 138544130;
            v135 = v78;
            __int16 v136 = 2114;
            v137 = v81;
            __int16 v138 = 2112;
            id v31 = (id *)v114;
            NSUInteger v139 = (NSUInteger)v113;
            __int16 v140 = 2114;
            id v141 = v83;
            LODWORD(v100) = 42;
            v84 = (void *)_os_log_send_and_compose_impl( v76,  0LL,  0LL,  0LL,  &_mh_execute_header,  v77,  16LL,  "%{public}@: [%{public}@] Redeem operation failed for code: %@, error: %{public}@",  &v134,  v100);

            id v33 = v79;
            if (v84)
            {
              v77 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v84,  4LL));
              free(v84);
              v99 = v77;
              SSFileLog(v75, @"%@");
LABEL_90:
            }

LABEL_92:
            objc_autoreleasePoolPop(context);
            uint64_t v32 = v111 + 1;
          }

          while ((id)(v111 + 1) != v109);
          id v109 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v125,  v142,  16LL);
          if (!v109) {
            goto LABEL_94;
          }
        }
      }

      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
      free(v30);
      v99 = v25;
      SSFileLog(v22, @"%@");
    }

    goto LABEL_39;
  }

  id v133 = 0LL;
  unsigned __int8 v6 = -[RedeemCodesOperation _fetchRedeemCodeMetadataWithError:](self, "_fetchRedeemCodeMetadataWithError:", &v133);
  id v102 = v133;
  if ((v6 & 1) != 0) {
    goto LABEL_27;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    unsigned int v9 = v8;
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 & 2;
  }
  if ((_DWORD)v11)
  {
    uint64_t v12 = (void *)objc_opt_class(v114);
    id v13 = v12;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation logCorrelationKey](v114, "logCorrelationKey"));
    uint64_t v15 = AMSLogableError(v102);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v134 = 138543874;
    v135 = v12;
    __int16 v136 = 2114;
    v137 = v14;
    __int16 v138 = 2114;
    NSUInteger v139 = (NSUInteger)v16;
    unsigned int v17 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%{public}@: [%{public}@] Fetch redeem code metadata failed with error: %{public}@",  &v134,  32,  v101);

    if (!v17) {
      goto LABEL_17;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    v99 = v10;
    SSFileLog(v7, @"%@");
  }

LABEL_17:
  if (v102)
  {
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v130 = 0u;
    __int128 v129 = 0u;
    obj = v114->_redeemCodes;
    id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v129,  v143,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v130;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v130 != v20) {
            objc_enumerationMutation(obj);
          }
          -[NSMutableDictionary setObject:forKey:]( v106,  "setObject:forKey:",  v102,  *(void *)(*((void *)&v129 + 1) + 8LL * (void)i),  v99);
        }

        id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v129,  v143,  16LL);
      }

      while (v19);
    }

- (BOOL)_processDictionary:(id)a3 dialog:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"status"]);
  if ((objc_opt_respondsToSelector(v8, "integerValue") & 1) == 0)
  {
    BOOL v10 = 0;
    goto LABEL_19;
  }

  uint64_t v9 = (uint64_t)[v8 integerValue];
  BOOL v10 = v9 >= 0;
  if (v9 < 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"userPresentableErrorMessage"]);

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
      id v13 = v11;
    }
    else {
      id v13 = 0LL;
    }
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"errorNumber"]);

    if ((objc_opt_respondsToSelector(v8, "integerValue") & 1) != 0)
    {
      id v14 = [v8 integerValue];
      if (!a5) {
        goto LABEL_15;
      }
    }

    else
    {
      id v14 = 0LL;
      if (!a5)
      {
LABEL_15:

        goto LABEL_16;
      }
    }

    if (v14) {
      uint64_t v15 = (uint64_t)v14;
    }
    else {
      uint64_t v15 = 100LL;
    }
    uint64_t v16 = SSError(SSErrorDomain, v15, v13, 0LL);
    *a5 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_15;
  }

- (id)_newURLRequestPropertiesForCode:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"guid");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"code");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"application/json",  @"response-content-type");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_cameraRecognized));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  @"cameraRecognizedCode");

  if (-[RedeemCodesOperation _useLegacyRedeem](self, "_useLegacyRedeem"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_redeemMetadataByCode, "valueForKey:", v4));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[RedeemCodesOperation _installedExternalVersionForRedeemCodeMetadata:]( self,  "_installedExternalVersionForRedeemCodeMetadata:",  v9));
    if (v10) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v10,  @"installed-version");
    }
  }

  if (self->_params) {
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:");
  }
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  0LL));
  -[SSMutableURLRequestProperties setHTTPBody:](v11, "setHTTPBody:", v12);

  -[SSMutableURLRequestProperties setHTTPMethod:](v11, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v11, "setURLBagKey:", @"redeemCodeSrv");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation userAgent](self, "userAgent"));
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  v13,  SSHTTPHeaderUserAgent);

  return v11;
}

- (id)_newURLRequestPropertiesForServiceActionButton:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionary]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"url"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    unsigned int v8 = 0LL;
    goto LABEL_5;
  }

  unsigned int v8 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
  if (!v8)
  {
LABEL_5:
    uint64_t v11 = 0LL;
    goto LABEL_6;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionary]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"dialogData"]);

  uint64_t v11 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v10,  0LL,  0LL));
  -[SSMutableURLRequestProperties setHTTPBody:](v11, "setHTTPBody:", v12);

  -[SSMutableURLRequestProperties setHTTPMethod:](v11, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation userAgent](self, "userAgent"));
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  v13,  SSHTTPHeaderUserAgent);

LABEL_6:
  return v11;
}

- (BOOL)_canPerformExtendedBiometricActions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[SSAuthenticationContext requiredUniqueIdentifier]( self->_authenticationContext,  "requiredUniqueIdentifier"));
  unsigned __int8 v4 = -[ISBiometricStore canPerformExtendedBiometricActionsForAccountIdentifier:]( self->_biometricStore,  "canPerformExtendedBiometricActionsForAccountIdentifier:",  v3);
  -[RedeemCodesOperation unlock](self, "unlock");

  return v4;
}

- (BOOL)_didUserCancelWithError:(id)a3
{
  return ISErrorIsEqual(a3, SSErrorDomain, 16LL);
}

- (BOOL)_fetchRedeemCodeMetadataWithError:(id *)a3
{
  id v105 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v124 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation userAgent](self, "userAgent"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RedeemCodesOperation authenticationContext](self, "authenticationContext"));
  id v6 = [v5 mutableCopy];

  uint64_t v7 = SSHTTPHeaderUserAgent;
  id v119 = (void *)v4;
  [v6 setValue:v4 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  __int128 v127 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  uint64_t v109 = v7;
  LODWORD(v9) = [v8 shouldLog];
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  id v121 = self;
  if (!(_DWORD)v9) {
    goto LABEL_11;
  }
  uint64_t v11 = (void *)objc_opt_class(self);
  redeemCodes = v121->_redeemCodes;
  id v13 = v11;
  int v143 = 138543618;
  v144 = v11;
  self = v121;
  __int16 v145 = 2050;
  NSUInteger v146 = -[NSArray count](redeemCodes, "count");
  id v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%{public}@: Fetching metadata for %{public}lu codes",  &v143,  22);

  if (v14)
  {
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    v101 = v10;
    SSFileLog(v8, @"%@");
LABEL_11:
  }

  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v138 = 0u;
  __int128 v139 = 0u;
  obj = self->_redeemCodes;
  id v108 = v6;
  uint64_t v15 = &ACSLocateCachingServer_ptr;
  id v117 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v138,  v150,  16LL);
  if (!v117)
  {
    id v110 = 0LL;
    char v107 = 1;
    goto LABEL_65;
  }

  id v110 = 0LL;
  char v107 = 1;
  uint64_t v114 = SSVRedeemCodeMetadataQueryParameterRedeemCode;
  uint64_t v115 = *(void *)v139;
  uint64_t v113 = SSVRedeemCodeMetadataURLBagKey;
  uint64_t v106 = SSErrorDomain;
  uint64_t v16 = v109;
  while (2)
  {
    for (i = 0LL; i != v117; i = (char *)i + 1)
    {
      if (*(void *)v139 != v115) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v138 + 1) + 8LL * (void)i);
      id v19 = objc_autoreleasePoolPush();
      id v20 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
      [v20 setAuthenticationContext:v6];
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
      [v20 setDataProvider:v21];

      objc_msgSend( v20,  "setNeedsAuthentication:",  -[RedeemCodesOperation _canPerformExtendedBiometricActions]( self,  "_canPerformExtendedBiometricActions") ^ 1);
      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
      -[SSMutableURLRequestProperties setValue:forRequestParameter:](v22, "setValue:forRequestParameter:", v18, v114);
      -[SSMutableURLRequestProperties setURLBagKey:](v22, "setURLBagKey:", v113);
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](v22, "setValue:forHTTPHeaderField:", v119, v16);
      id v122 = v22;
      [v20 setRequestProperties:v22];
      id v137 = 0LL;
      LODWORD(v22) = -[RedeemCodesOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v20,  &v137);
      id v23 = v137;
      id v125 = v23;
      if ((_DWORD)v22)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 dataProvider]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 output]);

        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0)
        {
          unsigned int v29 = 0;
          goto LABEL_48;
        }

        id v120 = v19;
        id v27 = v25;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"failureType"]);
        if (v28)
        {
        }

        else
        {
          id v38 = [[SSVRedeemCodeMetadata alloc] initWithRedeemCodeDictionary:v27];
          if (v38)
          {
            id v39 = v38;
            -[NSMutableDictionary setObject:forKey:](v105, "setObject:forKey:", v38, v18);
            __int128 v135 = 0u;
            __int128 v136 = 0u;
            __int128 v133 = 0u;
            __int128 v134 = 0u;
            int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 items]);
            id v41 = [v40 countByEnumeratingWithState:&v133 objects:v149 count:16];
            if (v41)
            {
              id v42 = v41;
              uint64_t v43 = *(void *)v134;
              do
              {
                for (j = 0LL; j != v42; j = (char *)j + 1)
                {
                  if (*(void *)v134 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend( *(id *)(*((void *)&v133 + 1) + 8 * (void)j),  "itemIdentifier",  v101)));
                  -[NSMutableArray addObject:](v127, "addObject:", v45);
                }

                id v42 = [v40 countByEnumeratingWithState:&v133 objects:v149 count:16];
              }

              while (v42);
            }

            unsigned int v29 = 0;
            v25 = v27;
LABEL_45:
            id v6 = v108;
            uint64_t v16 = v109;
LABEL_46:

            goto LABEL_47;
          }
        }

        unsigned int v29 = 0;
        v25 = v27;
        goto LABEL_46;
      }

      unsigned int v29 = -[RedeemCodesOperation _didUserCancelWithError:](self, "_didUserCancelWithError:", v23);
      if (v29)
      {
        uint64_t v30 = SSError(v106, 16LL, 0LL, 0LL);
        id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

        uint64_t v32 = SSErrorBySettingUserInfoValue(v31, @"hideError", &__kCFBooleanTrue);
        id v110 = (id)objc_claimAutoreleasedReturnValue(v32);

        char v107 = 0;
      }

      id v120 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v101));
      if (!v25) {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v33) = [v25 shouldLog];
      id v27 = (id)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v33 = v33;
      }
      else {
        v33 &= 2u;
      }
      if (!(_DWORD)v33) {
        goto LABEL_46;
      }
      id v34 = (void *)objc_opt_class(v121);
      id v111 = v34;
      uint64_t v35 = AMSLogableError(v125);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      int v143 = 138543874;
      v144 = v34;
      __int16 v145 = 2112;
      NSUInteger v146 = (NSUInteger)v18;
      __int16 v147 = 2114;
      v148 = v36;
      LODWORD(v103) = 32;
      uint64_t v37 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%{public}@: Failed to fetch metadata for redeem code: %@, error: %{public}@",  &v143,  v103);

      if (v37)
      {
        id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v37,  4LL));
        free(v37);
        v101 = (os_log_s *)v27;
        SSFileLog(v25, @"%@");
        goto LABEL_45;
      }

      id v6 = v108;
      uint64_t v16 = v109;
LABEL_47:
      id v19 = v120;
LABEL_48:

      objc_autoreleasePoolPop(v19);
      if (v29)
      {
        uint64_t v15 = &ACSLocateCachingServer_ptr;
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v46) {
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        LODWORD(v47) = objc_msgSend(v46, "shouldLog", v101);
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v46 OSLogObject]);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v47 = v47;
        }
        else {
          v47 &= 2u;
        }
        if ((_DWORD)v47)
        {
          uint64_t v49 = (void *)objc_opt_class(v121);
          int v143 = 138543362;
          v144 = v49;
          id v50 = v49;
          LODWORD(v103) = 12;
          unsigned int v51 = (void *)_os_log_send_and_compose_impl( v47,  0LL,  0LL,  0LL,  &_mh_execute_header,  v48,  0LL,  "%{public}@: Canceled redeem metadata batch",  &v143,  v103);

          if (!v51)
          {
LABEL_63:

            self = v121;
            goto LABEL_65;
          }

          id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v51,  4LL));
          free(v51);
          v101 = v48;
          SSFileLog(v46, @"%@");
        }

        goto LABEL_63;
      }

      self = v121;
    }

    uint64_t v15 = &ACSLocateCachingServer_ptr;
    id v117 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v138,  v150,  16LL);
    if (v117) {
      continue;
    }
    break;
  }

- (id)_installedExternalVersionForRedeemCodeMetadata:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 items]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v5 itemIdentifier]));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_installedExternalVersionByiTunesIdentifier, "objectForKey:", v6));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)_useLegacyRedeem
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  uint64_t v4 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v3);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100152F40;
  v20[3] = &unk_10034AC30;
  id v5 = dispatch_semaphore_create(0LL);
  v21 = v5;
  -[ISLoadURLBagOperation setCompletionBlock:](v4, "setCompletionBlock:", v20);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v6 addOperation:v4];

  dispatch_time_t v7 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v5, v7))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      uint64_t v12 = (void *)objc_opt_class(self);
      int v22 = 138543362;
      id v23 = v12;
      id v13 = v12;
      id v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%{public}@: Failed to fetch bag.",  &v22,  12);

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      id v19 = v11;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_14;
  }

- (void)_postNotificationWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v26 = 138543362;
    id v27 = (id)objc_opt_class(self);
    id v9 = v27;
    uint64_t v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  2LL,  "%{public}@: Sending redeem succeeded notification",  &v26,  12);

    if (!v10) {
      goto LABEL_13;
    }
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    v21 = v8;
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  id v23 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v23));

  id v12 = v23;
  if (!v12)
  {
    uint64_t v24 = @"response";
    v25 = v11;
    id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, kSSPurchaseRequestSucceededNotification, 0LL, v13, 1u);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[EventDispatcher eventDispatcher](&OBJC_CLASS___EventDispatcher, "eventDispatcher"));
    [v16 postEventWithName:SSEventNamePurchaseSucceeded userInfo:v13];
    goto LABEL_26;
  }

  id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedStoreServicesConfig]( &OBJC_CLASS___SSLogConfig,  "sharedStoreServicesConfig"));
  if (!v13) {
    id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v14 = -[__CFDictionary shouldLog](v13, "shouldLog", v21);
  else {
    LODWORD(v15) = v14;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary OSLogObject](v13, "OSLogObject"));
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if (!(_DWORD)v15) {
    goto LABEL_26;
  }
  BOOL v17 = (void *)objc_opt_class(self);
  int v26 = 138543618;
  id v27 = v17;
  __int16 v28 = 2114;
  id v29 = v12;
  id v18 = v17;
  LODWORD(v22) = 22;
  id v19 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  16LL,  "%{public}@: Failed to archive response. Error = %{public}@",  &v26,  v22);

  if (v19)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v13, @"%@");
LABEL_26:
  }
}

- (BOOL)headless
{
  return self->_headless;
}

- (void)setHeadless:(BOOL)a3
{
  self->_headless = a3;
}

- (BOOL)cameraRecognized
{
  return self->_cameraRecognized;
}

- (void)setCameraRecognized:(BOOL)a3
{
  self->_cameraRecognized = a3;
}

- (NSString)logCorrelationKey
{
  return self->_logCorrelationKey;
}

- (void)setLogCorrelationKey:(id)a3
{
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end