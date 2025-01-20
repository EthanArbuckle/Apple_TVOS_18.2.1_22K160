@interface ServerAuthenticationOperation
- (BOOL)_copyAccountIdentifier:(id *)a3 returningError:(id *)a4;
- (BOOL)_copySelectedButton:(id *)a3 returningError:(id *)a4;
- (BOOL)_isLocalizationAlreadyConfiguredForAuthContext:(id)a3;
- (BOOL)_shouldAuthenticateForButton:(id)a3;
- (BOOL)_shouldSkipInitialDialog:(id)a3;
- (BOOL)performsButtonAction;
- (ISDialog)dialog;
- (ISDialogButton)performedButton;
- (ISDialogButton)selectedButton;
- (NSNumber)authenticatedAccountDSID;
- (NSURL)redirectURL;
- (SSAuthenticationContext)authenticationContext;
- (ServerAuthenticationOperation)init;
- (ServerAuthenticationOperation)initWithDialog:(id)a3;
- (id)_copyAuthenticationContext;
- (id)_copyButtonToSkipDialog:(id)a3;
- (unint64_t)authenticatedAccountCredentialSource;
- (void)_handleSelectedButton:(id)a3;
- (void)run;
- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setPerformsButtonAction:(BOOL)a3;
@end

@implementation ServerAuthenticationOperation

- (ServerAuthenticationOperation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_13;
  }
  v7 = (void *)objc_opt_class(self);
  id v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSStackShot generateSymbolicatedStackShot]( &OBJC_CLASS___SSStackShot,  "generateSymbolicatedStackShot"));
  int v14 = 138543618;
  v15 = v7;
  __int16 v16 = 2114;
  v17 = v9;
  v10 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: Creating an ServerAuthenticationOperation. callStack = %{public}@",  &v14,  22);

  if (v10)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    v12 = v6;
    SSFileLog(v3, @"%@");
LABEL_13:
  }

LABEL_15:
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ServerAuthenticationOperation;
  result = -[ServerAuthenticationOperation init](&v13, "init", v12);
  if (result) {
    result->_performsButtonAction = 1;
  }
  return result;
}

- (ServerAuthenticationOperation)initWithDialog:(id)a3
{
  id v5 = a3;
  v6 = -[ServerAuthenticationOperation init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dialog, a3);
  }

  return v7;
}

- (NSNumber)authenticatedAccountDSID
{
  v3 = self->_authenticatedAccountDSID;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  v3 = self->_authenticationContext;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (ISDialog)dialog
{
  v3 = self->_dialog;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (ISDialogButton)performedButton
{
  v3 = self->_performedButton;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)performsButtonAction
{
  BOOL performsButtonAction = self->_performsButtonAction;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return performsButtonAction;
}

- (NSURL)redirectURL
{
  v3 = self->_redirectURL;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (ISDialogButton)selectedButton
{
  v3 = self->_selectedButton;
  -[ServerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  -[ServerAuthenticationOperation lock](self, "lock");
  if (self->_authenticationContext != v6)
  {
    unsigned int v4 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](v6, "copy");
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }

  -[ServerAuthenticationOperation unlock](self, "unlock");
}

- (void)setPerformsButtonAction:(BOOL)a3
{
  self->_BOOL performsButtonAction = a3;
  -[ServerAuthenticationOperation unlock](self, "unlock");
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  if (-[ServerAuthenticationOperation _shouldSkipInitialDialog:](self, "_shouldSkipInitialDialog:", v3))
  {
    id v4 = -[ServerAuthenticationOperation _copyButtonToSkipDialog:](self, "_copyButtonToSkipDialog:", v3);
    id v5 = 0LL;
  }

  else
  {
    id v26 = 0LL;
    id v27 = 0LL;
    unsigned int v6 = -[ServerAuthenticationOperation _copySelectedButton:returningError:]( self,  "_copySelectedButton:returningError:",  &v27,  &v26);
    id v4 = v27;
    id v5 = v26;
    if (!v6)
    {
      v12 = 0LL;
      uint64_t v11 = 0LL;
LABEL_31:

      goto LABEL_32;
    }
  }

  if (v4)
  {
    if (-[ServerAuthenticationOperation _shouldAuthenticateForButton:](self, "_shouldAuthenticateForButton:", v4))
    {
      id v24 = v5;
      id v25 = 0LL;
      unsigned int v7 = -[ServerAuthenticationOperation _copyAccountIdentifier:returningError:]( self,  "_copyAccountIdentifier:returningError:",  &v25,  &v24);
      id v8 = v25;
      id v9 = v25;
      id v10 = v24;

      if (v7)
      {
        -[ServerAuthenticationOperation lock](self, "lock");
        objc_storeStrong((id *)&self->_authenticatedAccountDSID, v8);
        -[ServerAuthenticationOperation unlock](self, "unlock");
        -[ServerAuthenticationOperation _handleSelectedButton:](self, "_handleSelectedButton:", v4);
        uint64_t v11 = 1LL;
LABEL_30:
        v12 = v4;
        -[ServerAuthenticationOperation lock](self, "lock", v23);
        objc_storeStrong((id *)&self->_selectedButton, v4);
        -[ServerAuthenticationOperation unlock](self, "unlock");
        id v4 = v9;
        id v5 = v10;
        goto LABEL_31;
      }

      if (ISErrorIsEqual(v10, ISErrorDomain, 16LL))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v3 buttons]);
        id v4 = (id)objc_claimAutoreleasedReturnValue([v22 firstObject]);

        if (-[ServerAuthenticationOperation performsButtonAction](self, "performsButtonAction")) {
          [v4 performDefaultActionForDialog:v3];
        }
      }

      else
      {
        id v4 = 0LL;
      }

- (BOOL)_copyAccountIdentifier:(id *)a3 returningError:(id *)a4
{
  id v6 = -[ServerAuthenticationOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  unsigned int v7 = &ACSLocateCachingServer_ptr;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 & 2;
  }
  if ((_DWORD)v12)
  {
    objc_super v13 = (void *)objc_opt_class(self);
    id v14 = v13;
    uint64_t v15 = AMSLogKey();
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation redirectURL](self, "redirectURL"));
    int v36 = 138543874;
    v37 = v13;
    __int16 v38 = 2114;
    id v39 = v16;
    __int16 v40 = 2114;
    v41 = v17;
    id v18 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[%{public}@]: [%{public}@] Performing authentication. redirectURL = %{public}@.",  &v36,  32);

    unsigned int v7 = &ACSLocateCachingServer_ptr;
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      v31 = v19;
      SSFileLog(v8, @"%@");
    }
  }

  else
  {
  }

  id v34 = 0LL;
  id v35 = 0LL;
  unsigned __int8 v20 = -[ServerAuthenticationOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  &v35,  0LL,  v6,  &v34);
  id v21 = v35;
  id v22 = v34;
  if ((v20 & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v7[459] sharedAccountsAuthenticationConfig]);
    if (!v23) {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v7[459] sharedConfig]);
    }
    unsigned int v24 = objc_msgSend(v23, "shouldLog", v31);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v24 & 2;
    }
    if ((_DWORD)v26)
    {
      id v27 = (void *)objc_opt_class(self);
      int v36 = 138543618;
      v37 = v27;
      __int16 v38 = 2112;
      id v39 = v22;
      id v28 = v27;
      LODWORD(v32) = 22;
      v29 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%{public}@: Could not authenticate. error = %@",  &v36,  v32);

      if (!v29)
      {
LABEL_25:

        goto LABEL_26;
      }

      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
      free(v29);
      SSFileLog(v23, @"%@");
    }

    goto LABEL_25;
  }

- (id)_copyAuthenticationContext
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation authenticationContext](self, "authenticationContext"));
  id v4 = (SSMutableAuthenticationContext *)[v3 mutableCopy];

  if (!v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
    id v4 = -[SSMutableAuthenticationContext initWithAccount:](v5, "initWithAccount:", v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  unsigned int v9 = [v8 authorizationIsForced];

  if (v9) {
    -[SSMutableAuthenticationContext setPromptStyle:](v4, "setPromptStyle:", 1LL);
  }
  unsigned int v10 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  @"serverDialog",  @"why",  @"true",  @"createSession",  0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSMutableAuthenticationContext requestParameters](v4, "requestParameters"));
  if (v11) {
    -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v11);
  }
  -[SSMutableAuthenticationContext setRequestParameters:](v4, "setRequestParameters:", v10);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  if (!v12) {
    goto LABEL_62;
  }
  objc_super v13 = (void *)v12;
  unsigned __int8 v14 = -[ServerAuthenticationOperation _isLocalizationAlreadyConfiguredForAuthContext:]( self,  "_isLocalizationAlreadyConfiguredForAuthContext:",  v4);

  if ((v14 & 1) != 0) {
    goto LABEL_62;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 title]);
  id v17 = [v16 length];

  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 title]);
    -[SSMutableAuthenticationContext setPromptTitle:](v4, "setPromptTitle:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = [v19 shouldLog];
    else {
      unsigned int v21 = v20;
    }
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v21 & 2;
    }
    if ((_DWORD)v23)
    {
      v69 = v11;
      unsigned int v24 = v10;
      id v25 = v15;
      uint64_t v26 = (void *)objc_opt_class(self);
      id v66 = v26;
      uint64_t v27 = SSHashIfNeeded(v18);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      int v77 = 138543618;
      v78 = v26;
      uint64_t v15 = v25;
      unsigned int v10 = v24;
      uint64_t v11 = v69;
      __int16 v79 = 2114;
      v80 = v28;
      LODWORD(v65) = 22;
      v29 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "%{public}@: Appending server-driven title: %{public}@",  &v77,  v65);

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
        free(v29);
        v63 = v30;
        SSFileLog(v19, @"%@");
      }
    }

    else
    {
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "message", v63));
  id v32 = [v31 length];

  if (!v32) {
    goto LABEL_36;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue([v15 message]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SSMutableAuthenticationContext accountName](v4, "accountName"));
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SSPaymentSheet stringWithFormattedUsernameForString:username:]( &OBJC_CLASS___SSPaymentSheet,  "stringWithFormattedUsernameForString:username:",  v33,  v34));

  -[SSMutableAuthenticationContext setReasonDescription:](v4, "setReasonDescription:", v35);
  int v36 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
  if (!v36) {
    int v36 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v37 = [v36 shouldLog];
  __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
    uint64_t v39 = v37;
  }
  else {
    uint64_t v39 = v37 & 2;
  }
  if (!(_DWORD)v39) {
    goto LABEL_34;
  }
  __int16 v40 = (void *)objc_opt_class(self);
  id v67 = v40;
  uint64_t v41 = SSHashIfNeeded(v35);
  v70 = v35;
  v42 = v15;
  v43 = (void *)objc_claimAutoreleasedReturnValue(v41);
  int v77 = 138543618;
  v78 = v40;
  __int16 v79 = 2114;
  v80 = v43;
  LODWORD(v65) = 22;
  v44 = (void *)_os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  1LL,  "%{public}@: Appending server-driven reason: %{public}@",  &v77,  v65);

  uint64_t v15 = v42;
  id v35 = v70;

  if (v44)
  {
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
    free(v44);
    v64 = v38;
    SSFileLog(v36, @"%@");
LABEL_34:
  }

LABEL_36:
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "buttons", v64));
  id v46 = [v45 count];

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v15 buttons]);
  id v48 = [v47 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (!v48) {
    goto LABEL_60;
  }
  id v49 = v48;
  uint64_t v50 = *(void *)v73;
  while (2)
  {
    for (i = 0LL; i != v49; i = (char *)i + 1)
    {
      if (*(void *)v73 != v50) {
        objc_enumerationMutation(v47);
      }
      v52 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
      if ([v52 actionType] && objc_msgSend(v52, "actionType") != 5)
      {
        v71 = v15;
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 title]);
        -[SSMutableAuthenticationContext setOkButtonLabel:](v4, "setOkButtonLabel:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
        if (!v54) {
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v55 = [v54 shouldLog];
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 OSLogObject]);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO)) {
          uint64_t v57 = v55;
        }
        else {
          uint64_t v57 = v55 & 2;
        }
        if ((_DWORD)v57)
        {
          v58 = (void *)objc_opt_class(self);
          id v68 = v58;
          uint64_t v59 = SSHashIfNeeded(v53);
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          int v77 = 138543618;
          v78 = v58;
          __int16 v79 = 2114;
          v80 = v60;
          LODWORD(v65) = 22;
          v61 = (void *)_os_log_send_and_compose_impl( v57,  0LL,  0LL,  0LL,  &_mh_execute_header,  v56,  1LL,  "%{public}@: Appending server-driven buy button label: %{public}@",  &v77,  v65);

          uint64_t v15 = v71;
          if (!v61)
          {
LABEL_59:

            goto LABEL_60;
          }

          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v61,  4LL));
          free(v61);
          SSFileLog(v54, @"%@");
        }

        else
        {
          uint64_t v15 = v71;
        }

        goto LABEL_59;
      }
    }

    id v49 = [v47 countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v49) {
      continue;
    }
    break;
  }

- (id)_copyButtonToSkipDialog:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 buttons]);
  uint64_t v5 = (uint64_t)[v4 count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5;
    unsigned int v7 = 0LL;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v6 - 1]);
      if ([v8 actionType])
      {
        id v9 = v8;

        unsigned int v7 = v9;
      }

      if ([v8 actionType] == 1)
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 subtarget]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
        unsigned int v12 = [v11 containsString:@"signup"];

        if (!v12 || v6 <= 1) {
          goto LABEL_12;
        }
      }

      else
      {

        if (v6 < 2) {
          goto LABEL_12;
        }
      }

      --v6;
    }
  }

  unsigned int v7 = 0LL;
LABEL_12:

  return v7;
}

- (BOOL)_copySelectedButton:(id *)a3 returningError:(id *)a4
{
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1000A2AF8;
  unsigned int v24 = sub_1000A2B08;
  id v25 = 0LL;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  id v8 = -[DaemonDialogOperation initWithDialog:](objc_alloc(&OBJC_CLASS___DaemonDialogOperation), "initWithDialog:", v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation authenticationContext](self, "authenticationContext"));
  -[DaemonDialogOperation setDisplaysOnLockscreen:]( v8,  "setDisplaysOnLockscreen:",  [v9 displaysOnLockScreen]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000A2B10;
  v16[3] = &unk_10034D408;
  id v18 = &v20;
  id v10 = v7;
  id v17 = v10;
  v19 = &v26;
  -[DaemonDialogOperation setOutputBlock:](v8, "setOutputBlock:", v16);
  id v15 = 0LL;
  -[ServerAuthenticationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v8, &v15);
  id v11 = v15;
  unsigned int v12 = v11;
  if (a4) {
    *a4 = v11;
  }
  if (a3) {
    *a3 = (id) v21[5];
  }
  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v13;
}

- (void)_handleSelectedButton:(id)a3
{
  id v5 = a3;
  id v6 = -[ServerAuthenticationOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  if ([v5 actionType] == 1
    && (([v6 shouldFollowAccountButtons] & 1) != 0 || objc_msgSend(v5, "urlType") != (id)1))
  {
    -[ServerAuthenticationOperation lock](self, "lock");
    unsigned __int8 v14 = (NSURL *)objc_claimAutoreleasedReturnValue([v5 parameter]);
    redirectURL = self->_redirectURL;
    self->_redirectURL = v14;

LABEL_20:
    -[ServerAuthenticationOperation unlock](self, "unlock");
    goto LABEL_21;
  }

  if (!-[ServerAuthenticationOperation performsButtonAction](self, "performsButtonAction"))
  {
    -[ServerAuthenticationOperation lock](self, "lock");
    objc_storeStrong((id *)&self->_performedButton, a3);
    goto LABEL_20;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
  if (!v7) {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if (!(_DWORD)v9) {
    goto LABEL_16;
  }
  int v16 = 138543362;
  id v17 = (id)objc_opt_class(self);
  id v11 = v17;
  unsigned int v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%{public}@: Performing default action instead of redirecting",  &v16,  12);

  if (v12)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v7, @"%@");
LABEL_16:
  }

  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  [v5 performDefaultActionForDialog:v13];

LABEL_21:
}

- (BOOL)_isLocalizationAlreadyConfiguredForAuthContext:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 okButtonLabel]);
  if (v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 promptTitle]);
    if (v6)
    {
      BOOL v5 = 1;
    }

    else
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 reasonDescription]);
      BOOL v5 = v7 != 0LL;
    }
  }

  return v5;
}

- (BOOL)_shouldAuthenticateForButton:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServerAuthenticationOperation dialog](self, "dialog"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 buttons]);

  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSkipInitialDialog:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)CFPreferencesCopyAppValue(@"Password", kSSUserDefaultsIdentifier);
  if ([v5 length])
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
    if (!v6) {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if (!(_DWORD)v8) {
      goto LABEL_15;
    }
    *(_DWORD *)id v35 = 138543362;
    *(void *)&v35[4] = objc_opt_class(self);
    id v10 = *(id *)&v35[4];
    uint64_t v11 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Skipping explanation because of password default",  v35,  12,  *(_OWORD *)v35);
    goto LABEL_12;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if ([v15 length])
  {
  }

  else
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
    id v17 = [v16 length];

    if (!v17)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
      if (!v6) {
        id v6 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v26 = [v6 shouldLog];
      else {
        LODWORD(v27) = v26;
      }
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v27 = v27;
      }
      else {
        v27 &= 2u;
      }
      if (!(_DWORD)v27) {
        goto LABEL_15;
      }
      *(_DWORD *)id v35 = 138543362;
      *(void *)&v35[4] = objc_opt_class(self);
      id v10 = *(id *)&v35[4];
      uint64_t v11 = _os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Skipping explanation as strings are empty",  v35,  12,  *(_OWORD *)v35);
LABEL_12:
      unsigned int v12 = (void *)v11;
      goto LABEL_13;
    }
  }

  if ([v4 kind] != (id)1)
  {
    if ([v4 authorizationIsForced])
    {
      BOOL v13 = 0;
      goto LABEL_18;
    }

    id v6 = -[ServerAuthenticationOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
    if (+[SSAccountStore isExpiredForTokenType:]( SSAccountStore,  "isExpiredForTokenType:",  [v6 tokenType])) {
      goto LABEL_62;
    }
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 requiredUniqueIdentifier]);
    id v25 = (void *)(v24
                 ? objc_claimAutoreleasedReturnValue([v23 accountWithUniqueIdentifier:v24])
                 : objc_claimAutoreleasedReturnValue([v23 activeAccount]));
    uint64_t v28 = v25;
    unsigned int v29 = [v25 isAuthenticated];

    if (!v29)
    {
LABEL_62:
      BOOL v13 = 0;
      goto LABEL_17;
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
    if (!v9) {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v30 = -[os_log_s shouldLog](v9, "shouldLog");
    else {
      LODWORD(v31) = v30;
    }
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v9, "OSLogObject"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v31 = v31;
    }
    else {
      v31 &= 2u;
    }
    if ((_DWORD)v31)
    {
      *(_DWORD *)id v35 = 138543362;
      *(void *)&v35[4] = objc_opt_class(self);
      id v33 = *(id *)&v35[4];
      id v34 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "%{public}@: Skipping dialog because we are authenticated and not forced",  v35,  12);

      if (!v34) {
        goto LABEL_15;
      }
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
      free(v34);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_15;
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsAuthenticationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsAuthenticationConfig"));
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v18 = [v6 shouldLog];
  else {
    LODWORD(v19) = v18;
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v19 = v19;
  }
  else {
    v19 &= 2u;
  }
  if (!(_DWORD)v19) {
    goto LABEL_15;
  }
  uint64_t v20 = (void *)objc_opt_class(self);
  id v10 = v20;
  uint64_t v21 = AMSLogKey();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  *(_DWORD *)id v35 = 138543618;
  *(void *)&v35[4] = v20;
  *(_WORD *)&v35[12] = 2114;
  *(void *)&v35[14] = v22;
  unsigned int v12 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: [%{public}@] Skipping explanation because of consolidated auth dialogs",  v35,  22);

LABEL_13:
  if (v12)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v6, @"%@");
LABEL_15:
  }

  BOOL v13 = 1;
LABEL_17:

LABEL_18:
  return v13;
}

- (unint64_t)authenticatedAccountCredentialSource
{
  return self->_authenticatedAccountCredentialSource;
}

- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3
{
  self->_authenticatedAccountCredentialSource = a3;
}

- (void).cxx_destruct
{
}

@end