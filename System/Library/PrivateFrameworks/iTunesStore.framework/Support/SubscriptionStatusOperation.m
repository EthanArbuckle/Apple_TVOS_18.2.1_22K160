@interface SubscriptionStatusOperation
- (BOOL)_carrierBundleStatusIsValidForCachedStatus:(id)a3;
- (BOOL)allowsBypassOfPrivacyAcknowledgement;
- (BOOL)authenticatesIfNecessary;
- (NSString)localizedAuthenticationReason;
- (NSString)reason;
- (SSAuthenticationContext)authenticationContext;
- (id)_getInitialStatus:(id *)a3;
- (id)_loadStatusOnce:(id *)a3;
- (id)statusBlock;
- (int64_t)carrierBundleProvisioningStyle;
- (void)_cacheAccountEligibilityWithStatus:(id)a3;
- (void)run;
- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3;
- (void)setAuthenticatesIfNecessary:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setCarrierBundleProvisioningStyle:(int64_t)a3;
- (void)setLocalizedAuthenticationReason:(id)a3;
- (void)setReason:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation SubscriptionStatusOperation

- (BOOL)allowsBypassOfPrivacyAcknowledgement
{
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  -[SubscriptionStatusOperation unlock](self, "unlock");
  return allowsBypassOfPrivacyAcknowledgement;
}

- (BOOL)authenticatesIfNecessary
{
  BOOL authenticatesIfNecessary = self->_authenticatesIfNecessary;
  -[SubscriptionStatusOperation unlock](self, "unlock");
  return authenticatesIfNecessary;
}

- (SSAuthenticationContext)authenticationContext
{
  id v3 = -[SSAuthenticationContext copy](self->_authenticationContext, "copy");
  -[SubscriptionStatusOperation unlock](self, "unlock");
  return (SSAuthenticationContext *)v3;
}

- (int64_t)carrierBundleProvisioningStyle
{
  int64_t carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  -[SubscriptionStatusOperation unlock](self, "unlock");
  return carrierBundleProvisioningStyle;
}

- (NSString)localizedAuthenticationReason
{
  id v3 = -[NSString copy](self->_localizedAuthenticationReason, "copy");
  -[SubscriptionStatusOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)reason
{
  id v3 = -[NSString copy](self->_reason, "copy");
  -[SubscriptionStatusOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3
{
  self->_BOOL allowsBypassOfPrivacyAcknowledgement = a3;
  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (void)setAuthenticatesIfNecessary:(BOOL)a3
{
  self->_BOOL authenticatesIfNecessary = a3;
  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  -[SubscriptionStatusOperation lock](self, "lock");
  if (self->_authenticationContext != v6)
  {
    v4 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](v6, "copy");
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }

  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (void)setCarrierBundleProvisioningStyle:(int64_t)a3
{
  self->_int64_t carrierBundleProvisioningStyle = a3;
  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (void)setLocalizedAuthenticationReason:(id)a3
{
  v6 = (NSString *)a3;
  -[SubscriptionStatusOperation lock](self, "lock");
  if (self->_localizedAuthenticationReason != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    localizedAuthenticationReason = self->_localizedAuthenticationReason;
    self->_localizedAuthenticationReason = v4;
  }

  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (void)setReason:(id)a3
{
  v6 = (NSString *)a3;
  -[SubscriptionStatusOperation lock](self, "lock");
  if (self->_reason != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    reason = self->_reason;
    self->_reason = v4;
  }

  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (void)setStatusBlock:(id)a3
{
  id v6 = a3;
  -[SubscriptionStatusOperation lock](self, "lock");
  if (self->_statusBlock != v6)
  {
    id v4 = [v6 copy];
    id statusBlock = self->_statusBlock;
    self->_id statusBlock = v4;
  }

  -[SubscriptionStatusOperation unlock](self, "unlock");
}

- (id)statusBlock
{
  id v3 = [self->_statusBlock copy];
  -[SubscriptionStatusOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)run
{
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  id v4 = (void (**)(id, void *, uint64_t, void *))[self->_statusBlock copy];
  int v5 = MKBDeviceUnlockedSinceBoot(-[SubscriptionStatusOperation unlock](self, "unlock"));
  if ((+[SSDevice deviceIsAppleWatch](&OBJC_CLASS___SSDevice, "deviceIsAppleWatch") & 1) != 0
    || (+[SSDevice deviceIsAudioAccessory](&OBJC_CLASS___SSDevice, "deviceIsAudioAccessory") & 1) != 0)
  {
    unsigned int v6 = 0;
  }

  else
  {
    unsigned int v25 = +[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:]( &OBJC_CLASS___SSPrivacyController,  "shouldDisplayPrivacyLinkWithIdentifier:",  SSPrivacyIdentifierMusicStore);
    unsigned int v6 = v25;
    BOOL v26 = allowsBypassOfPrivacyAcknowledgement || v25 == 0;
    if (!v26)
    {
      uint64_t v27 = SSErrorDomain;
      uint64_t v28 = SSError(SSErrorDomain, 154LL, @"Privacy link needs to be displayed first", 0LL);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v28);
      uint64_t v29 = SSErrorWithUnderlyingError(v17, v27, 107LL, @"Aborted fetching subscription status", 0LL);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
      if (!v19) {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v30 = [v19 shouldLog];
      else {
        LODWORD(v31) = v30;
      }
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v31 = v31;
      }
      else {
        v31 &= 2u;
      }
      if (!(_DWORD)v31) {
        goto LABEL_39;
      }
      int v66 = 138543362;
      id v67 = (id)objc_opt_class(self);
      id v23 = v67;
      uint64_t v24 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%{public}@: Aborted fetching subscription status because privacy link needs to be displayed first.",  &v66,  12);
      goto LABEL_37;
    }
  }

  if (v5 <= 0)
  {
    uint64_t v15 = SSErrorDomain;
    uint64_t v16 = SSError(SSErrorDomain, 158LL, @"Device must be unlocked after boot first", 0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = SSErrorWithUnderlyingError(v17, v15, 107LL, @"Aborted fetching subscription status", 0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = [v19 shouldLog];
    else {
      LODWORD(v21) = v20;
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v21;
    }
    else {
      v21 &= 2u;
    }
    if (!(_DWORD)v21) {
      goto LABEL_39;
    }
    int v66 = 138543362;
    id v67 = (id)objc_opt_class(self);
    id v23 = v67;
    uint64_t v24 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%{public}@: Aborted fetching subscription status because device has not been unlocked since boot.",  &v66,  12);
LABEL_37:
    v32 = (void *)v24;

    if (!v32)
    {
LABEL_40:

      goto LABEL_41;
    }

    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
    free(v32);
    v60 = v22;
    SSFileLog(v19, @"%@");
LABEL_39:

    goto LABEL_40;
  }

  id v65 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionStatusOperation _getInitialStatus:](self, "_getInitialStatus:", &v65));
  id v8 = v65;
  if (v7)
  {
    if ((v6 & 1) == 0) {
      -[SubscriptionStatusOperation _cacheAccountEligibilityWithStatus:]( self,  "_cacheAccountEligibilityWithStatus:",  v7);
    }
    if (!MGGetBoolAnswer(@"cellular-data"))
    {
      [v7 setCarrierBundlingStatus:2];
      BOOL v34 = 0;
      uint64_t v35 = 1LL;
      goto LABEL_43;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSVTelephonyController sharedController](&OBJC_CLASS___SSVTelephonyController, "sharedController"));
    unsigned __int8 v10 = [v9 isPhoneNumberAccessRestricted];

    if ((v10 & 1) != 0) {
      goto LABEL_90;
    }
    id v11 = [v7 carrierBundlingStatus];
    int64_t v12 = -[SubscriptionStatusOperation carrierBundleProvisioningStyle](self, "carrierBundleProvisioningStyle");
    if (v12 == 1)
    {
      BOOL v14 = 0;
      if (v11 != (id)1 && v11 != (id)4) {
        BOOL v14 = [v7 accountStatus] != (id)3;
      }
      if ([v7 carrierBundlingStatus] == (id)4)
      {
        BOOL v13 = [v7 accountStatus] == 0;
        goto LABEL_70;
      }
    }

    else
    {
      if (v12 == 2)
      {
        BOOL v13 = 0;
        BOOL v14 = 1;
        goto LABEL_70;
      }

      BOOL v14 = 0;
    }

    BOOL v13 = 0;
LABEL_70:
    id v50 = +[SSVSubscriptionStatusCoordinator copyStatusFromUserDefaults]( &OBJC_CLASS___SSVSubscriptionStatusCoordinator,  "copyStatusFromUserDefaults");
    if (v50
      && -[SubscriptionStatusOperation _carrierBundleStatusIsValidForCachedStatus:]( self,  "_carrierBundleStatusIsValidForCachedStatus:",  v50))
    {
      if (v11 != (id)1 && v11 != (id)4) {
        objc_msgSend(v7, "setCarrierBundlingStatus:", objc_msgSend(v50, "carrierBundlingStatus"));
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 cellularOperatorName]);
      [v7 setCellularOperatorName:v51];

      v52 = (void *)objc_claimAutoreleasedReturnValue([v50 phoneNumber]);
      [v7 setPhoneNumber:v52];

      v53 = (void *)objc_claimAutoreleasedReturnValue([v50 sessionIdentifier]);
      [v7 setSessionIdentifier:v53];
    }

    if (v13)
    {
      int v36 = 1;
      BOOL v34 = v14;
LABEL_44:
      v37 = objc_alloc_init(&OBJC_CLASS___CarrierBundlingEligibilityOperation);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionStatusOperation reason](self, "reason"));
      unsigned int v39 = [v38 isEqualToString:SSVSubscriptionStatusRequestReasonDeepLink];

      if (v39) {
        -[CarrierBundlingEligibilityOperation setDeepLink:](v37, "setDeepLink:", 1LL);
      }
      id v64 = 0LL;
      unsigned int v40 = -[SubscriptionStatusOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v37,  &v64);
      id v41 = v64;
      v42 = v41;
      if (!v40)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v41 domain]);
        [v7 setCarrierBundlingStatus:0];
        if (v36) {
          v4[2](v4, v7, 1LL, v42);
        }
LABEL_89:

        if (((v36 | !v34) & 1) != 0)
        {
LABEL_91:
          v55 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
          v57 = (void *)objc_claimAutoreleasedReturnValue([v56 activeAccount]);
          v58 = (void *)objc_claimAutoreleasedReturnValue([v57 uniqueIdentifier]);

          if (!v58 || v55 == v58)
          {
            if ((v6 & 1) != 0)
            {
LABEL_100:

              uint64_t v33 = 1LL;
              goto LABEL_101;
            }
          }

          else if (!v55 || ((v6 | [v55 isEqualToNumber:v58] ^ 1) & 1) != 0)
          {
            goto LABEL_100;
          }

          id v59 = +[SSVSubscriptionStatusCoordinator copyStatusFromUserDefaults]( &OBJC_CLASS___SSVSubscriptionStatusCoordinator,  "copyStatusFromUserDefaults");
          +[SSVSubscriptionStatusCoordinator updateUserDefaultsWithStatus:]( &OBJC_CLASS___SSVSubscriptionStatusCoordinator,  "updateUserDefaultsWithStatus:",  v7);
          if (([v7 isEqualToStatus:v59] & 1) == 0) {
            +[SSVSubscriptionStatusCoordinator sendChangeNotification]( &OBJC_CLASS___SSVSubscriptionStatusCoordinator,  "sendChangeNotification");
          }

          goto LABEL_100;
        }

- (void)_cacheAccountEligibilityWithStatus:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountWithUniqueIdentifier:v5]);
    if (!v7)
    {
LABEL_19:

      goto LABEL_20;
    }

    if ([v4 accountStatus] == (id)3) {
      id v8 = &__kCFBooleanTrue;
    }
    else {
      id v8 = &__kCFBooleanFalse;
    }
    [v7 setEligibility:v8 forServiceType:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
    if (!v9) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    int64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      BOOL v13 = (void *)objc_opt_class(self);
      id v18 = v13;
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v7 accountName]);
      uint64_t v15 = SSHashIfNeeded();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v19 = 138543618;
      unsigned int v20 = v13;
      __int16 v21 = 2114;
      v22 = v16;
      v17 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%{public}@: Setting subscription status on an account. Saving %{public}@.",  &v19,  22);

      if (!v17)
      {
LABEL_18:

        [v6 saveAccount:v7 verifyCredentials:0 completion:0];
        goto LABEL_19;
      }

      int64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_18;
  }

- (BOOL)_carrierBundleStatusIsValidForCachedStatus:(id)a3
{
  id v5 = a3;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSVTelephonyController sharedController](&OBJC_CLASS___SSVTelephonyController, "sharedController"));
  unsigned int v7 = [v6 isPhoneNumberAccessRestricted];

  if (v7)
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2 object:self file:@"SubscriptionStatusOperation.m" lineNumber:360 description:@"Phone number access is restricted."];
  }

  unint64_t v8 = (unint64_t)[v5 carrierBundlingStatus];
  unsigned __int8 v9 = 0;
  if (v8 <= 4 && ((1LL << v8) & 0x16) != 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 phoneNumber]);

    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 phoneNumber]);
    if (v11 == v12) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = [v11 isEqualToString:v12];
    }
  }

  return v9;
}

- (id)_getInitialStatus:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionStatusOperation authenticationContext](self, "authenticationContext"));
  id v5 = v4;
  if (v4) {
    BOOL v6 = (unint64_t)[v4 promptStyle] < 2;
  }
  else {
    BOOL v6 = -[SubscriptionStatusOperation authenticatesIfNecessary](self, "authenticatesIfNecessary");
  }
  id v7 = 0LL;
  unint64_t v8 = 0LL;
  char v9 = 1;
  while (1)
  {
    unsigned int v10 = v8;
    uint64_t v11 = v7;
    int64_t v12 = objc_autoreleasePoolPush();
    id v23 = v7;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionStatusOperation _loadStatusOnce:](self, "_loadStatusOnce:", &v23));
    id v7 = v23;

    if (!v8 || !v6) {
      break;
    }
    if ((([v8 accountStatus] == (id)1) & v9) == 0)
    {
      objc_autoreleasePoolPop(v12);
      goto LABEL_20;
    }

    BOOL v14 = (SSMutableAuthenticationContext *)[v5 mutableCopy];
    if (!v14)
    {
      uint64_t v15 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeAccount]);
      BOOL v14 = -[SSMutableAuthenticationContext initWithAccount:](v15, "initWithAccount:", v17);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSMutableAuthenticationContext reasonDescription](v14, "reasonDescription"));

    if (!v18)
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue( -[SubscriptionStatusOperation localizedAuthenticationReason]( self,  "localizedAuthenticationReason"));
      -[SSMutableAuthenticationContext setReasonDescription:](v14, "setReasonDescription:", v19);
    }

    -[SSMutableAuthenticationContext setCanCreateNewAccount:](v14, "setCanCreateNewAccount:", 0LL);
    -[SSMutableAuthenticationContext setPromptStyle:](v14, "setPromptStyle:", 1LL);
    unsigned __int8 v20 = -[SubscriptionStatusOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  0LL,  0LL,  v14,  0LL);

    objc_autoreleasePoolPop(v12);
    char v9 = 0;
    if ((v20 & 1) == 0) {
      goto LABEL_20;
    }
  }

  objc_autoreleasePoolPop(v12);
  if (a3 && !v8) {
    *a3 = v7;
  }
LABEL_20:

  return v8;
}

- (id)_loadStatusOnce:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);

  id v8 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v8 setCanSendGUIDParameter:0];
  char v9 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v8 setDataProvider:v9];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionStatusOperation authenticationContext](self, "authenticationContext"));
  [v8 setAuthenticationContext:v10];
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueDeviceIdentifier]);

  if (v13) {
    -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v11,  "setValue:forRequestParameter:",  v13,  @"guid");
  }
  -[SSMutableURLRequestProperties setURLBagKey:](v11, "setURLBagKey:", @"getSubscriptionStatusSrv");

  [v8 setRequestProperties:v11];
  id v25 = 0LL;
  unsigned int v14 = -[SubscriptionStatusOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v8,  &v25);
  id v15 = v25;
  if (!v14)
  {
    id v22 = 0LL;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 dataProvider]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 output]);

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"failureType"]);
    unsigned __int8 v20 = v19;
    if (v19)
    {
      uint64_t v21 = SSError(SSServerErrorDomain, [v19 integerValue], 0, 0);
      id v22 = 0LL;
      id v23 = v15;
      id v15 = (id)objc_claimAutoreleasedReturnValue(v21);
    }

    else
    {
      id v22 = objc_alloc_init(&OBJC_CLASS___SSVSubscriptionStatus);
      [v22 setValuesUsingStatusDictionary:v17];
      id v23 = (id)objc_claimAutoreleasedReturnValue([v8 authenticatedAccountDSID]);
      if (!v23)
      {
        id v23 = (id)objc_claimAutoreleasedReturnValue([v10 requiredUniqueIdentifier]);
        if (!v23) {
          id v23 = v7;
        }
      }

      [v22 setAccountIdentifier:v23];
    }
  }

  else
  {
    id v22 = 0LL;
  }

  if (a3)
  {
LABEL_16:
    if (!v22) {
      *a3 = v15;
    }
  }

- (void).cxx_destruct
{
}

@end