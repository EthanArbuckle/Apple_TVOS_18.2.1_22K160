@interface SDAppleIDAgent
+ (id)sharedAgent;
- (BOOL)_wasIdentityLinkedOnce;
- (BOOL)_wasOldAgentIdentityQueried;
- (BOOL)eduModeEnabled;
- (SDAppleIDAgent)init;
- (__SecIdentity)_copyIdentityForAppleID:(id)a3;
- (__SecIdentity)copyIdentityForAppleID:(id)a3;
- (id)_accountForAppleID:(id)a3;
- (id)_detailedDescription;
- (id)_metaInfoValueForKey:(id)a3;
- (id)_statusInfo;
- (id)accountForAppleID:(id)a3;
- (id)accountStatusForAppleID:(id)a3;
- (id)detailedDescription;
- (id)myAccount;
- (id)statusInfo;
- (id)validationRecordInfoForAppleID:(id)a3;
- (id)verifiedIdentityForCertificateChain:(id)a3 emailOrPhone:(id)a4 error:(id *)a5;
- (id)verifiedIdentityForEmailOrPhone:(id)a3;
- (int)_ensureEduModeDevicesAreCleanedUp;
- (int)_performKeyVerificationForIdentity:(id)a3;
- (int)_performKeychainCount;
- (int64_t)_accountState;
- (unint64_t)_keychainCleanupTag;
- (void)_activate;
- (void)_addObservers;
- (void)_checkIfAppleIDCertificateChainIsValidForIdentity:(id)a3 completion:(id)a4;
- (void)_cleanUpAccount:(id)a3;
- (void)_clearAccount;
- (void)_ensurePeriodicVerifyTimerStarted;
- (void)_ensurePeriodicVerifyTimerStopped;
- (void)_ensurePushStarted;
- (void)_ensurePushStopped;
- (void)_ensureThrottledRetryTimerStartedWithSuggestedDelay:(unint64_t)a3;
- (void)_ensureThrottledRetryTimerStopped;
- (void)_handleAccountIdentifierValidationRecordMismatch;
- (void)_handleAppleIDChangedNotification;
- (void)_handleAppleIDSignedInNotification;
- (void)_handleAppleIDSignedOutNotification;
- (void)_handleCertificateStatusUpdate:(int64_t)a3 forAppleID:(id)a4;
- (void)_handleFindPersonResponse:(id)a3 forRequest:(id)a4 emailOrPhone:(id)a5 withError:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)_handleInfoResponse:(id)a3 forAppleID:(id)a4 infoRequest:(id)a5 certificateSerialNumber:(id)a6 withError:(id)a7 completion:(id)a8;
- (void)_handleKeyBagFirstUnlockNotification;
- (void)_handleKeyVerificationFailure;
- (void)_handlePeriodicVerifyTimerFired;
- (void)_handleReceivedCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5;
- (void)_handleReceivedIdentity:(id)a3 forAppleID:(id)a4 identityRequest:(id)a5 withError:(id)a6 completion:(id)a7;
- (void)_handleServerTaskCompletionWithError:(id)a3;
- (void)_handleThrottledRetryTimerFired;
- (void)_handleUILockStatusChange;
- (void)_handleUILockStatusChangedNotification;
- (void)_handleUntrustedAppleIDCertificateChainForIdentity:(id)a3;
- (void)_invalidate;
- (void)_performOtherTaskWithInfo:(id)a3 completion:(id)a4;
- (void)_performServerTaskWithInfo:(id)a3 completion:(id)a4;
- (void)_personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_prefsChanged;
- (void)_removeObservers;
- (void)_requestIdentityForAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5 withCompletion:(id)a6;
- (void)_requestInfoForAppleID:(id)a3 completion:(id)a4;
- (void)_setCurrentAppleIDContactInfo:(id)a3 validationRecord:(id)a4;
- (void)_setCurrentAppleIDIdentity:(id)a3;
- (void)_setMetaInfoValue:(id)a3 forKey:(id)a4;
- (void)_update;
- (void)_updateAppleID;
- (void)_updateMyInfo;
- (void)_verifyState;
- (void)_verifyStateWithDelay:(double)a3;
- (void)activate;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)handleAppleIDChangedNotification;
- (void)handleAppleIDSignedInNotification;
- (void)handleAppleIDSignedOutNotification;
- (void)handleKeyBagFirstUnlockNotification;
- (void)handleUILockStatusChangedNotification;
- (void)invalidate;
- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4;
- (void)personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)prefsChanged;
- (void)queryVerifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestWithInfo:(id)a3 completion:(id)a4;
- (void)verifiedIdentityForEmailOrPhone:(id)a3 completion:(id)a4;
- (void)verifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation SDAppleIDAgent

- (SDAppleIDAgent)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SDAppleIDAgent;
  v2 = -[SDAppleIDAgent init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    uint64_t v7 = SFMainQueue(v5, v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    findPersonRequests = v2->_findPersonRequests;
    v2->_findPersonRequests = (NSMutableArray *)v10;

    pushEnvironment = v2->_pushEnvironment;
    v2->_pushEnvironment = (NSString *)@"production";
  }

  return v2;
}

- (void)dealloc
{
  if (self->_pushConnection)
  {
    v2 = (SDAppleIDAgent *)FatalErrorF("Push connection still active during dealloc", a2);
    -[SDAppleIDAgent eduModeEnabled](v2, v3);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___SDAppleIDAgent;
    -[SDAppleIDAgent dealloc](&v4, "dealloc");
  }

- (BOOL)eduModeEnabled
{
  return 0;
}

- (id)_accountForAppleID:(id)a3
{
  return -[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", a3);
}

- (int64_t)_accountState
{
  if (self->_appleID)
  {
    SEL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned __int8 v4 = [v3 deviceWasUnlockedOnce];

    if ((v4 & 1) != 0)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](self, "_accountForAppleID:", self->_appleID));
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);

        if (v7)
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
          if (v8)
          {
            v9 = v8;
            id v10 = [v8 copyCertificate];
            if (v10)
            {
              v11 = v10;
              id v12 = [v9 copyIntermediateCertificate];
              if (v12)
              {
                v13 = v12;
                id v14 = [v9 copyPrivateKey];
                if (v14)
                {
                  if ([v9 certificateExpired])
                  {
                    if (dword_1006435F8 <= 60
                      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
                    {
                      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _accountState]", 60LL, "Certificate expired\n");
                    }

                    int64_t v17 = 5LL;
                  }

                  else if ([v9 isInvalid])
                  {
                    if (dword_1006435F8 <= 60
                      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
                    {
                      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  60LL,  "Identity object for %{mask} is invalid\n",  self->_appleID);
                    }

                    int64_t v17 = 2LL;
                  }

                  else
                  {
                    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 validationRecord]);
                    unsigned int v16 = [v15 isInvalid];

                    if (v16)
                    {
                      if (dword_1006435F8 <= 30
                        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
                      {
                        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  30LL,  "Validation Record for %{mask} is invalid\n",  self->_appleID);
                      }

                      int64_t v17 = 3LL;
                    }

                    else
                    {
                      int64_t v17 = 1LL;
                    }
                  }
                }

                else
                {
                  if (dword_1006435F8 <= 60
                    && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
                  {
                    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  60LL,  "No private key for %{mask}\n",  self->_appleID);
                  }

                  int64_t v17 = 11LL;
                }

                CFRelease(v11);
                CFRelease(v13);
                if (v14) {
                  CFRelease(v14);
                }
              }

              else
              {
                if (dword_1006435F8 <= 60
                  && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
                {
                  LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  60LL,  "No intermediate certificate for %{mask}\n",  self->_appleID);
                }

                CFRelease(v11);
                int64_t v17 = 12LL;
              }
            }

            else
            {
              if (dword_1006435F8 <= 60
                && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
              {
                LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  60LL,  "No certificate for %{mask}\n",  self->_appleID);
              }

              int64_t v17 = 6LL;
            }

            goto LABEL_15;
          }

          if (self->_identityRequest)
          {
            if (dword_1006435F8 <= 30
              && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
            {
              LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  30LL,  "No identity object for %{mask}. A request is in progress\n",  self->_appleID);
            }

            v9 = 0LL;
            int64_t v17 = 4LL;
            goto LABEL_15;
          }

          if (dword_1006435F8 <= 30
            && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
          {
            LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  30LL,  "No identity object for %{mask}\n",  self->_appleID);
          }
        }

        else if (dword_1006435F8 <= 60 {
               && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
        }
        {
          LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  60LL,  "No altDSID for %{mask}, probably because it doesn't have the identity object.\n",  self->_appleID);
        }

        v9 = 0LL;
        int64_t v17 = 10LL;
        goto LABEL_15;
      }

      if (dword_1006435F8 <= 60
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _accountState]",  60LL,  "No account info for apple ID %{mask}\n",  self->_appleID);
      }

      v9 = 0LL;
      uint64_t v6 = 0LL;
      int64_t v17 = 9LL;
    }

    else
    {
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _accountState]", 30LL, "Device not unlocked yet\n");
      }

      v9 = 0LL;
      uint64_t v6 = 0LL;
      int64_t v17 = 14LL;
    }
  }

  else
  {
    if (dword_1006435F8 <= 50
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 50LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _accountState]", 50LL, "User not signed in\n");
    }

    v9 = 0LL;
    uint64_t v6 = 0LL;
    int64_t v17 = 13LL;
  }

- (void)_activate
{
}

- (void)_addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleAppleIDSignedInNotification" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
  [v3 addObserver:self selector:"handleAppleIDSignedOutNotification" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];
  [v3 addObserver:self selector:"handleAppleIDChangedNotification" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"handleUILockStatusChangedNotification" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
  [v3 addObserver:self selector:"handleKeyBagFirstUnlockNotification" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];
}

- (void)_invalidate
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = self->_findPersonRequests;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)i), "invalidate", (void)v16);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_findPersonRequests, "removeAllObjects");
  identityRequest = self->_identityRequest;
  if (identityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](identityRequest, "invalidate");
    v9 = self->_identityRequest;
    self->_identityRequest = 0LL;
  }

  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    -[SDAppleIDServerTask invalidate](infoRequest, "invalidate");
    v11 = self->_infoRequest;
    self->_infoRequest = 0LL;
  }

  testIdentityRequest = self->_testIdentityRequest;
  if (testIdentityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](testIdentityRequest, "invalidate");
    v13 = self->_testIdentityRequest;
    self->_testIdentityRequest = 0LL;

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _invalidate]",  30LL,  "Invalidated certificate request\n",  (void)v16);
    }
  }

  -[SDAppleIDAgent _ensurePushStopped](self, "_ensurePushStopped", (void)v16);
  -[SDAppleIDAgent _ensurePeriodicVerifyTimerStopped](self, "_ensurePeriodicVerifyTimerStopped");
  -[SDAppleIDAgent _ensureThrottledRetryTimerStopped](self, "_ensureThrottledRetryTimerStopped");
  task = self->_task;
  if (task)
  {
    -[SDAppleIDServerTask invalidate](task, "invalidate");
    v15 = self->_task;
    self->_task = 0LL;

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _invalidate]", 30LL, "Invalidated server task\n");
    }
  }

- (void)_cleanUpAccount:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 certificateToken]);

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v13 certificateTokenCreationDate]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:259200.0]);

      uint64_t v7 = objc_claimAutoreleasedReturnValue([v13 certificateTokenCreationDate]);
      if (!v7
        || (uint64_t v8 = (void *)v7,
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
            id v10 = [v9 compare:v5],
            v9,
            v8,
            v10 == (id)1))
      {
        if (dword_1006435F8 <= 60
          && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
        {
          LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _cleanUpAccount:]",  60LL,  "Certificate token is missing or stale, setting it to nil\n");
        }

        [v13 setCertificateToken:0];
        [v13 setPrivateKeyPersistentReference:0];
        dbManager = self->_dbManager;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 appleID]);
        -[SDAppleIDDatabaseManager setCertificateToken:privateKeyPersistentReference:forAppleID:]( dbManager,  "setCertificateToken:privateKeyPersistentReference:forAppleID:",  0LL,  0LL,  v12);
      }
    }
  }

  else
  {
    id v5 = 0LL;
  }
}

- (void)_clearAccount
{
  identityRequest = self->_identityRequest;
  if (identityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](identityRequest, "invalidate");
    id v4 = self->_identityRequest;
    self->_identityRequest = 0LL;
  }

  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    -[SDAppleIDServerTask invalidate](infoRequest, "invalidate");
    uint64_t v6 = self->_infoRequest;
    self->_infoRequest = 0LL;
  }

  -[SDAppleIDDatabaseManager removeAppleID:](self->_dbManager, "removeAppleID:", self->_appleID);
  -[SDAppleIDDatabaseManager clearPersonInfoCache](self->_dbManager, "clearPersonInfoCache");
  -[SDAppleIDAgent _ensureThrottledRetryTimerStopped](self, "_ensureThrottledRetryTimerStopped");
  sub_1000ED47C();
}

- (__SecIdentity)_copyIdentityForAppleID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager identityForAppleID:](self->_dbManager, "identityForAppleID:", a3));
  id v4 = (__SecIdentity *)[v3 copyIdentity];

  return v4;
}

- (void)_ensurePushStarted
{
  if (!self->_pushConnection)
  {
    if (self->_agentEnabled)
    {
      unsigned int v3 = -[NSString isEqualToString:](self->_pushEnvironment, "isEqualToString:", @"production");
      id v4 = &off_100643668;
      if (!v3) {
        id v4 = &off_100643670;
      }
      uint64_t v5 = (*v4)();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      uint64_t v7 = (APSConnection *)[objc_alloc(off_100643678()) initWithEnvironmentName:v6 namedDelegatePort:@"com.apple.coreservices.appleid.aps" queue:self->_dispatchQueue];
      pushConnection = self->_pushConnection;
      self->_pushConnection = v7;

      -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
      v9 = self->_pushConnection;
      v11 = @"com.apple.idmsauthagent";
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
      -[APSConnection setEnabledTopics:](v9, "setEnabledTopics:", v10);

      -[APSConnection requestTokenForTopic:identifier:]( self->_pushConnection,  "requestTokenForTopic:identifier:",  @"com.apple.idmsauthagent",  0LL);
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _ensurePushStarted]",  30LL,  "Started push agent with environment %@\n",  v6);
      }
    }

    else if (dword_1006435F8 <= 30 {
           && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    }
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _ensurePushStarted]", 30LL, "AIA disabled\n");
    }
  }

- (id)_detailedDescription
{
  v157[0] = 0LL;
  NSAppendPrintF(v157, "-- SDAppleIDAgent --\n");
  id v3 = v157[0];
  id v156 = v3;
  NSAppendPrintF(&v156, "Creation Date:                       %@\n", self->_creationDate);
  id v4 = v156;

  id v155 = v4;
  if (self->_agentEnabled) {
    uint64_t v5 = "yes";
  }
  else {
    uint64_t v5 = "no";
  }
  NSAppendPrintF(&v155, "Enabled:                             %s\n", v5);
  id v6 = v155;

  id v154 = v6;
  NSAppendPrintF(&v154, "Push Environment:                    %@\n", self->_pushEnvironment);
  id v7 = v154;

  if (self->_agentEnabled)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAppleIDDatabaseManager accountForAppleID:]( self->_dbManager,  "accountForAppleID:",  self->_appleID));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
    id v153 = v7;
    NSAppendPrintF(&v153, "Apple ID:                            %@\n", self->_appleID);
    id v10 = v153;

    id v152 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 contactInfo]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstName]);
    NSAppendPrintF(&v152, "First Name:                          %@\n", v12);
    id v13 = v152;

    id v151 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 contactInfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastName]);
    NSAppendPrintF(&v151, "Last Name:                           %@\n", v15);
    id v16 = v151;

    id v150 = v16;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    NSAppendPrintF(&v150, "AltDSID:                             %@\n", v17);
    id v18 = v150;

    id v149 = v18;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 data]);
    if (v20) {
      v21 = "yes";
    }
    else {
      v21 = "no";
    }
    NSAppendPrintF(&v149, "Validation Record (VR) Available:    %s\n", v21);
    id v22 = v149;

    id v148 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 altDSID]);
    NSAppendPrintF(&v148, "VR AltDSID:                          %@\n", v24);
    id v25 = v148;

    id v147 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 validStartDate]);
    NSAppendPrintF(&v147, "VR Valid Start Date:                 %@\n", v27);
    id v28 = v147;

    id v146 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    NSAppendPrintF(&v146, "VR Suggested Valid Duration:         %ld\n", [v29 suggestedValidDuration]);
    id v30 = v146;

    id v145 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 nextCheckDate]);
    NSAppendPrintF(&v145, "VR Next Check Date:                  %@\n", v32);
    id v33 = v145;

    id v144 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    else {
      v35 = "no";
    }
    NSAppendPrintF(&v144, "VR Needs Update:                     %s\n", v35);
    id v36 = v144;

    id v143 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    else {
      v38 = "no";
    }
    NSAppendPrintF(&v143, "VR Invalid:                          %s\n", v38);
    id v39 = v143;

    id v142 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v8 contactInfo]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 validatedEmailAddresses]);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "componentsJoinedByString:", @", "));
    NSAppendPrintF(&v142, "Validated Email Addresses:           %@\n", v42);
    id v43 = v142;

    id v141 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 validatedEmailHashes]);
    uint64_t v46 = SFShortHashArrayDescription(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    NSAppendPrintF(&v141, "Validated Email Hashes:              %@\n", v47);
    id v48 = v141;

    id v140 = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue([v8 contactInfo]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 validatedPhoneNumbers]);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "componentsJoinedByString:", @", "));
    NSAppendPrintF(&v140, "Validated Phone Numbers:             %@\n", v51);
    id v52 = v140;

    id v139 = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 validatedPhoneHashes]);
    uint64_t v55 = SFShortHashArrayDescription(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    NSAppendPrintF(&v139, "Validated Phone Hashes:              %@\n", v56);
    id v57 = v139;

    id v138 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue([v8 privateKeyPersistentReference]);
    v59 = "yes";
    if (!v58) {
      v59 = "no";
    }
    NSAppendPrintF(&v138, "Temporary Private Key Reference:     %s\n", v59);
    id v60 = v138;

    id v137 = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue([v9 privateKeyPersistentReference]);
    if (v61) {
      v62 = "yes";
    }
    else {
      v62 = "no";
    }
    NSAppendPrintF(&v137, "Private Key Persistent Reference:    %s\n", v62);
    id v63 = v137;

    id v136 = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue([v9 certificatePersistentReference]);
    if (v64) {
      v65 = "yes";
    }
    else {
      v65 = "no";
    }
    NSAppendPrintF(&v136, "Certificate Available:               %s\n", v65);
    id v66 = v136;

    id v135 = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue([v9 accountIdentifier]);
    NSAppendPrintF(&v135, "Certificate Account Identifier (AI): %@\n", v67);
    id v68 = v135;

    id v134 = v68;
    v69 = (void *)objc_claimAutoreleasedReturnValue([v9 certificateExpirationDate]);
    NSAppendPrintF(&v134, "Certificate Expiration Date:         %@\n", v69);
    id v70 = v134;

    id v133 = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue([v9 serialNumber]);
    NSAppendPrintF(&v133, "Certificate Serial Number:           %@\n", v71);
    id v72 = v133;

    id v132 = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue([v8 certificateToken]);
    NSAppendPrintF(&v132, "Certificate Token:                   %@\n", v73);
    id v74 = v132;

    v75 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
    if (v75 && v9)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue([v8 validationRecord]);
      v77 = (void *)objc_claimAutoreleasedReturnValue([v76 altDSID]);

      if (v77)
      {
        id v130 = v74;
        id v52 = (id)objc_claimAutoreleasedReturnValue([v9 accountIdentifier]);
        else {
          v78 = "no";
        }
        NSAppendPrintF(&v130, "Certificate AI and VR AltDSID match: %s\n", v78);
        id v79 = v130;

        id v74 = v52;
      }

      else
      {
        id v131 = v74;
        NSAppendPrintF(&v131, "VR AltDSID is nil\n");
        id v79 = v131;
      }

      id v74 = v79;
    }

    id v129 = v74;
    v80 = (void *)objc_claimAutoreleasedReturnValue([v9 intermediateCertificatePersistentReference]);
    if (v80) {
      v81 = "yes";
    }
    else {
      v81 = "no";
    }
    NSAppendPrintF(&v129, "Intermediate Certificate Available:  %s\n", v81);
    id v82 = v129;

    id v128 = v82;
    v83 = (void *)objc_claimAutoreleasedReturnValue([v9 intermediateCertificateExpirationDate]);
    NSAppendPrintF(&v128, "Intermediate Cert. Expiration Date:  %@\n", v83);
    id v84 = v128;

    id v127 = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue([v9 intermediateCertificateSerialNumber]);
    NSAppendPrintF(&v127, "Intermediate Cert. Serial Number:    %@\n", v85);
    id v86 = v127;

    id v126 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue([v9 certificatePersistentReference]);
    if (v87)
    {
      id v52 = (id)objc_claimAutoreleasedReturnValue([v9 privateKeyPersistentReference]);
      if (v52) {
        v88 = "yes";
      }
      else {
        v88 = "no";
      }
    }

    else
    {
      v88 = "no";
    }

    NSAppendPrintF(&v126, "Identity Available:                  %s\n", v88);
    id v89 = v126;

    if (v87) {
    id v125 = v89;
    }
    else {
      v90 = "no";
    }
    NSAppendPrintF(&v125, "Identity Invalid:                    %s\n", v90);
    id v91 = v125;

    id v124 = v91;
    else {
      v92 = "no";
    }
    NSAppendPrintF(&v124, "Identity Needs Renewal:              %s\n", v92);
    id v93 = v124;

    id v123 = v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    else {
      v95 = "no";
    }
    NSAppendPrintF(&v123, "Device Unlocked Once:                %s\n", v95);
    id v96 = v123;

    id v122 = v96;
    if (-[SDAppleIDAgent _wasOldAgentIdentityQueried](self, "_wasOldAgentIdentityQueried")) {
      v97 = "yes";
    }
    else {
      v97 = "no";
    }
    NSAppendPrintF(&v122, "Old Agent Identity Queried:          %s\n", v97);
    id v98 = v122;

    uint64_t v99 = CFGetInt64( -[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"OldAgentIdentityWasUsed"),  0LL);
    id v121 = v98;
    if (v99) {
      v100 = "yes";
    }
    else {
      v100 = "no";
    }
    NSAppendPrintF(&v121, "Old Agent Identity Used:             %s\n", v100);
    id v101 = v121;

    if (v99)
    {
      id v120 = v101;
      v102 = (void *)objc_claimAutoreleasedReturnValue( -[SDAppleIDAgent _metaInfoValueForKey:]( self,  "_metaInfoValueForKey:",  @"OldAgentCertificateSN"));
      NSAppendPrintF(&v120, "Old Agent Certificate Serial Number: %@\n", v102);
      id v103 = v120;

      id v101 = v103;
    }

    id v119 = v101;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"LastSignInDate"));
    NSAppendPrintF(&v119, "Last Sign In Date:                   %@\n", v104);
    id v105 = v119;

    id v118 = v105;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"LastSignOutDate"));
    NSAppendPrintF(&v118, "Last Sign Out Date:                  %@\n", v106);
    id v107 = v118;

    id v117 = v107;
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"LastSignOutAppleID"));
    NSAppendPrintF(&v117, "Last Apple ID To Sign Out:           %@\n", v108);
    id v109 = v117;

    id v116 = v109;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"LastAllGoodDate"));
    NSAppendPrintF(&v116, "Last All Good Date:                  %@\n", v110);
    id v111 = v116;

    id v115 = v111;
    unint64_t v112 = -[SDAppleIDAgent _accountState](self, "_accountState");
    if (v112 > 0xE) {
      v113 = @"?";
    }
    else {
      v113 = *(&off_1005CE850 + v112);
    }
    NSAppendPrintF(&v115, "Account state:                       %@\n", v113);
    id v7 = v115;
  }

  return v7;
}

- (void)_checkIfAppleIDCertificateChainIsValidForIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = 201203;
    id v9 = [v6 copyCertificate];
    id v10 = [v6 copyIntermediateCertificate];
    v11 = v10;
    if (v9)
    {
      if (v10)
      {
        v20[0] = v9;
        v20[1] = v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
        dispatchQueue = self->_dispatchQueue;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_100106764;
        v18[3] = &unk_1005CE5A0;
        v18[4] = self;
        id v19 = v7;
        SFAppleIDVerifyCertificateChain(v12, dispatchQueue, v18);

LABEL_5:
        CFRelease(v9);
        goto LABEL_6;
      }

      int v8 = 201222;
    }
  }

  else
  {
    id v9 = 0LL;
    v11 = 0LL;
    int v8 = -6705;
  }

  if (v7)
  {
    id v14 = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001067C0;
    block[3] = &unk_1005CE5C8;
    id v16 = v7;
    int v17 = v8;
    dispatch_async(v14, block);
  }

  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
  if (v11) {
    CFRelease(v11);
  }
}

- (int)_ensureEduModeDevicesAreCleanedUp
{
  if (-[SDAppleIDAgent eduModeEnabled](self, "eduModeEnabled"))
  {
    id v3 = self->_appleID;
    if (!-[SDAppleIDAgent _keychainCleanupTag](self, "_keychainCleanupTag"))
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100106898;
      block[3] = &unk_1005CBF30;
      uint64_t v10 = 0LL;
      id v3 = v3;
      int v8 = v3;
      id v9 = self;
      dispatch_async(v5, block);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return 0;
}

- (void)_ensurePushStopped
{
  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    -[APSConnection shutdown](pushConnection, "shutdown");
    -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", 0LL);
    id v4 = self->_pushConnection;
    self->_pushConnection = 0LL;

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _ensurePushStopped]", 30LL, "Invalidated push agent\n");
    }
  }

- (void)_ensurePeriodicVerifyTimerStarted
{
  if (!self->_periodicVerifyTimer)
  {
    if (self->_agentEnabled)
    {
      id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      periodicVerifyTimer = self->_periodicVerifyTimer;
      self->_periodicVerifyTimer = v3;

      uint64_t v5 = self->_periodicVerifyTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100106C38;
      handler[3] = &unk_1005CB2F8;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
      SFDispatchTimerSet(self->_periodicVerifyTimer, 0.0, 3600.0, -4.0);
      dispatch_resume((dispatch_object_t)self->_periodicVerifyTimer);
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted]",  30LL,  "Started periodic verify timer\n");
      }
    }

    else if (dword_1006435F8 <= 30 {
           && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    }
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted]", 30LL, "AIA disabled\n");
    }
  }

- (void)_ensurePeriodicVerifyTimerStopped
{
  periodicVerifyTimer = self->_periodicVerifyTimer;
  if (periodicVerifyTimer)
  {
    id v4 = periodicVerifyTimer;
    dispatch_source_cancel(v4);
    uint64_t v5 = self->_periodicVerifyTimer;
    self->_periodicVerifyTimer = 0LL;

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _ensurePeriodicVerifyTimerStopped]",  30LL,  "Stopped periodic verify timer\n");
    }
  }

- (void)_ensureThrottledRetryTimerStartedWithSuggestedDelay:(unint64_t)a3
{
  if (self->_throttledRetryTimer)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]",  30LL,  "Throttled retry already scheduled\n");
    }

    goto LABEL_34;
  }

  if (!self->_agentEnabled)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]",  30LL,  "AIA disabled\n");
    }

- (void)_ensureThrottledRetryTimerStopped
{
  throttledRetryTimer = self->_throttledRetryTimer;
  if (throttledRetryTimer)
  {
    unint64_t v4 = throttledRetryTimer;
    dispatch_source_cancel(v4);
    uint64_t v5 = self->_throttledRetryTimer;
    self->_throttledRetryTimer = 0LL;

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _ensureThrottledRetryTimerStopped]",  30LL,  "Stopped throttled retry timer\n");
    }
  }

- (void)_handleAccountIdentifierValidationRecordMismatch
{
  if (self->_appleID)
  {
    -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0LL);
    -[SDAppleIDAgent _setCurrentAppleIDContactInfo:validationRecord:]( self,  "_setCurrentAppleIDContactInfo:validationRecord:",  0LL,  0LL);
    -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 30.0);
  }

  else if (dword_1006435F8 <= 90 {
         && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 90LL)))
  }
  {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleAccountIdentifierValidationRecordMismatch]",  90LL,  "Apple ID isn't set\n");
  }

- (void)_handleAppleIDChangedNotification
{
}

- (void)_handleAppleIDSignedInNotification
{
  if (self->_agentEnabled)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _handleAppleIDSignedInNotification]", 30LL, "Apple ID signed in\n");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v3, @"LastSignInDate");

    -[SDAppleIDAgent _updateAppleID](self, "_updateAppleID");
    sub_1000ED47C();
    -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 15.0);
  }

- (void)_handleAppleIDSignedOutNotification
{
  if (self->_agentEnabled)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleAppleIDSignedOutNotification]",  30LL,  "Apple ID signed out\n");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v3, @"LastSignOutDate");

    -[SDAppleIDAgent _setMetaInfoValue:forKey:]( self,  "_setMetaInfoValue:forKey:",  self->_appleID,  @"LastSignOutAppleID");
    -[SDAppleIDAgent _clearAccount](self, "_clearAccount");
    appleID = self->_appleID;
    self->_appleID = 0LL;

    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }

- (void)_handleCertificateStatusUpdate:(int64_t)a3 forAppleID:(id)a4
{
  id v13 = a4;
  if (([v13 isEqualToString:self->_appleID] & 1) == 0)
  {
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]",  60LL,  "### Apple ID %{mask} not currently signed in, cannot handle certifcate status \n",  v13);
    }

    goto LABEL_39;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", v13));
  if (!v6)
  {
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]",  60LL,  "### No account for %{mask}, cannot handle certificate status\n",  v13);
    }

- (void)_handleFindPersonResponse:(id)a3 forRequest:(id)a4 emailOrPhone:(id)a5 withError:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)a7);
  v40 = (void (**)(void, void, void))v16;
  if (!v16)
  {
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    id v20 = 0LL;
    v21 = 0LL;
LABEL_26:
    id v22 = 0LL;
    goto LABEL_12;
  }

  if (v15)
  {
    id v20 = v15;
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    v21 = 0LL;
    id v16 = 0LL;
    goto LABEL_26;
  }

  id v18 = 0LL;
  uint64_t v19 = 4294960534LL;
  id v20 = 0LL;
  v21 = 0LL;
  id v16 = 0LL;
  id v22 = 0LL;
  if (v13 && v14)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v22, @"MatchedValue", TypeID, 0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    id v46 = v14;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
    id v43 = 0LL;
    uint64_t v19 = sub_100171AD0(v25, 1, &v43);
    id v18 = v43;

    if ((_DWORD)v19)
    {
      id v20 = 0LL;
      id v16 = 0LL;
      goto LABEL_12;
    }

    if (!v18 || [v18 count] != (id)1)
    {
      id v20 = 0LL;
      id v16 = 0LL;
LABEL_32:
      uint64_t v19 = 4294960534LL;
      goto LABEL_12;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
    unsigned __int8 v27 = [v21 isEqualToString:v26];

    if ((v27 & 1) != 0)
    {
      [v22 setObject:v14 forKeyedSubscript:@"MatchedValue"];
      id v16 = [[SFAppleIDPersonInfo alloc] initWithDictionary:v22];
      if (v16)
      {
        -[SDAppleIDDatabaseManager addPersonInfoToCache:](self->_dbManager, "addPersonInfoToCache:", v16);
        uint64_t v19 = 0LL;
        id v20 = 0LL;
        goto LABEL_12;
      }

      id v20 = 0LL;
      goto LABEL_32;
    }

    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleFindPersonResponse:forRequest:emailOrPhone:withError:queue:completion:]",  60LL,  "Find person response matched value doesn't match the request\n");
    }

    id v20 = 0LL;
    id v16 = 0LL;
    uint64_t v19 = 4294960584LL;
  }

- (void)_handleInfoResponse:(id)a3 forAppleID:(id)a4 infoRequest:(id)a5 certificateSerialNumber:(id)a6 withError:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = (SDAppleIDServerTask *)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v62 = v16;
  if (!v15)
  {
    NSErrorDomain v43 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v44 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    id v46 = (void *)v45;
    v47 = @"?";
    if (v45) {
      v47 = (const __CFString *)v45;
    }
    v77 = v47;
    id v48 = &v77;
    v49 = &v76;
    goto LABEL_46;
  }

  if (v18)
  {
    id v30 = v18;
LABEL_47:
    id v20 = 0LL;
    goto LABEL_35;
  }

  if (!v14)
  {
    NSErrorDomain v43 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
    v50 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v51 = objc_claimAutoreleasedReturnValue(v50);
    id v46 = (void *)v51;
    id v52 = @"?";
    if (v51) {
      id v52 = (const __CFString *)v51;
    }
    v75 = v52;
    id v48 = &v75;
    v49 = &v74;
LABEL_46:
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v49,  1LL));
    id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v43,  -6705LL,  v53));

    goto LABEL_47;
  }

  if (self->_infoRequest != v16)
  {
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]",  60LL,  "Outdated info request received, ignoring\n");
    }

    id v20 = 0LL;
    id v23 = 0LL;
    id v30 = 0LL;
    goto LABEL_36;
  }

  if (!v17 || ([v17 isEqualToString:&stru_1005E3958] & 1) != 0)
  {
    id v20 = 0LL;
LABEL_8:
    uint64_t v21 = 0LL;
    goto LABEL_9;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v14, @"CertificateSerialNumber", TypeID, 0LL);
  v34 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  id v20 = v34;
  if (v34 && ([v34 isEqualToString:v17] & 1) == 0)
  {
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]",  60LL,  "Response certSN %@ is different than the requested %@\n",  v20,  v17);
    }

    NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
    uint64_t v36 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(201207LL, 0LL, 0LL));
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    id v38 = (void *)v37;
    id v39 = @"?";
    if (v37) {
      id v39 = (const __CFString *)v37;
    }
    v73 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
    NSErrorDomain v41 = NSOSStatusErrorDomain;
    uint64_t v42 = 201207LL;
    goto LABEL_34;
  }

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v14, @"CertificateStatus", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  if (!(Int64Ranged << 32))
  {
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]",  60LL,  "No certificate status returned by server\n");
    }

    goto LABEL_8;
  }

  uint64_t v21 = (int)Int64Ranged;
LABEL_9:
  -[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]( self,  "_handleCertificateStatusUpdate:forAppleID:",  v21,  v15);
  id v22 = [[SFAppleIDContactInfo alloc] initWithDictionary:v14];
  if (!v22)
  {
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    v54 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960534LL, 0LL, 0LL));
    uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);
    id v38 = (void *)v55;
    v56 = @"?";
    if (v55) {
      v56 = (const __CFString *)v55;
    }
    v71 = v56;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
    NSErrorDomain v41 = NSOSStatusErrorDomain;
    uint64_t v42 = -6762LL;
LABEL_34:
    id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v41,  v42,  v40));

LABEL_35:
    id v23 = 0LL;
    goto LABEL_36;
  }

  id v23 = v22;
  id v24 = [[SFAppleIDValidationRecord alloc] initWithDictionary:v14];
  if (v24)
  {
    id v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 data]);
    dispatchQueue = self->_dispatchQueue;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_1001081A8;
    v63[3] = &unk_1005CE5F0;
    v63[4] = self;
    id v64 = v15;
    id v28 = v25;
    id v65 = v28;
    id v23 = v23;
    id v66 = v23;
    id v67 = v19;
    uint64_t v29 = dispatchQueue;
    id v18 = 0LL;
    SFAppleIDParseValidationRecordData(v26, v29, v63);

    id v30 = 0LL;
    goto LABEL_12;
  }

  NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
  id v57 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960534LL, 0LL, 0LL));
  uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);
  v61 = (void *)v58;
  v59 = @"?";
  if (v58) {
    v59 = (const __CFString *)v58;
  }
  v69 = v59;
  id v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
  id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6762LL,  v60));

LABEL_36:
  id v28 = 0LL;
LABEL_12:
  -[SDAppleIDServerTask invalidate](self->_infoRequest, "invalidate");
  infoRequest = self->_infoRequest;
  self->_infoRequest = 0LL;

  if (v30)
  {
    if (dword_1006435F8 <= 90
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 90LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]",  90LL,  "### Info request failed with error %@\n",  v30);
    }

    if (v19) {
      (*((void (**)(id, id))v19 + 2))(v19, v30);
    }
  }
}

- (void)_handleKeyBagFirstUnlockNotification
{
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleKeyBagFirstUnlockNotification]",  30LL,  "Key Bag First Unlock notification\n");
  }
  -[SDAppleIDAgent _handleUILockStatusChange](self, "_handleUILockStatusChange");
}

- (void)_handleKeyVerificationFailure
{
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleKeyVerificationFailure]",  30LL,  "Handling key verification failure\n");
  }
  -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0LL);
  -[SDAppleIDAgent _setCurrentAppleIDContactInfo:validationRecord:]( self,  "_setCurrentAppleIDContactInfo:validationRecord:",  0LL,  0LL);
  -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 30.0);
}

- (void)_handleServerTaskCompletionWithError:(id)a3
{
  id v9 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SDAppleIDDatabaseManager setLastConnectionDate:](self->_dbManager, "setLastConnectionDate:", v4);
  id v5 = v9;
  if (v9)
  {
    if (dword_1006435F8 <= 60)
    {
      if (dword_1006435F8 != -1 || (v6 = _LogCategory_Initialize(&dword_1006435F8, 60LL), id v5 = v9, v6))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleServerTaskCompletionWithError:]",  60LL,  "### Server task failed with error %@\n",  v5);
        id v5 = v9;
      }
    }

    if (NSErrorToOSStatus(v5) != -6723
      && NSErrorToOSStatus(v9) != 201224
      && NSErrorToOSStatus(v9) != 201225
      && NSErrorToOSStatus(v9) != 201226
      && NSErrorToOSStatus(v9) != 201229)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
      uint64_t Int64 = CFDictionaryGetInt64(v7, SFAppleIDErrorUserInfoRetryDelaySecondsKey, 0LL);

      -[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]( self,  "_ensureThrottledRetryTimerStartedWithSuggestedDelay:",  Int64);
    }
  }

  else
  {
    -[SDAppleIDDatabaseManager setLastSuccessfulConnectionDate:]( self->_dbManager,  "setLastSuccessfulConnectionDate:",  v4);
    sub_1000ED47C();
    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }
}

- (void)_handleUILockStatusChangedNotification
{
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleUILockStatusChangedNotification]",  30LL,  "UI Lock Status Change notification\n");
  }
  -[SDAppleIDAgent _handleUILockStatusChange](self, "_handleUILockStatusChange");
}

- (void)_handleUILockStatusChange
{
  if (self->_agentEnabled)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v4 = [v3 deviceWasUnlockedOnce];

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      id v5 = "no";
      if (v4) {
        id v5 = "yes";
      }
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleUILockStatusChange]",  30LL,  "Handling UI Lock status change. Device was unlocked once: %s\n",  v5);
    }

    if (v4)
    {
      if (self->_throttledRetryTimer)
      {
        if (dword_1006435F8 <= 30
          && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
        {
          LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleUILockStatusChange]",  30LL,  "Throttled retry already scheduled\n");
        }
      }

      else
      {
        -[SDAppleIDAgent _verifyState](self, "_verifyState");
      }
    }
  }

- (void)_handleUntrustedAppleIDCertificateChainForIdentity:(id)a3
{
  id v9 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", self->_appleID));
  id v5 = v4;
  if (v4)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
      unsigned int v8 = [v7 isEqual:v9];

      if (v8)
      {
        -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0LL);
        -[SDAppleIDAgent _verifyState](self, "_verifyState");
      }
    }

    else if (dword_1006435F8 <= 30 {
           && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    }
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleUntrustedAppleIDCertificateChainForIdentity:]",  30LL,  "No identity for %{mask}\n",  self->_appleID);
    }
  }

  else if (dword_1006435F8 <= 30 {
         && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
  }
  {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleUntrustedAppleIDCertificateChainForIdentity:]",  30LL,  "Unable to get account for %{mask}\n",  self->_appleID);
  }
}

- (void)_handleReceivedCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8 && v10 && v9)
  {
    -[SDAppleIDDatabaseManager setCertificateToken:privateKeyPersistentReference:forAppleID:]( self->_dbManager,  "setCertificateToken:privateKeyPersistentReference:forAppleID:",  v10,  v8,  v9);
    sub_1000ED47C();
  }
}

- (void)_handleReceivedIdentity:(id)a3 forAppleID:(id)a4 identityRequest:(id)a5 withError:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (SDAppleIDIdentityRequest *)a5;
  id v15 = a6;
  id v16 = (void (**)(id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v15)
  {
    id v17 = v15;
    goto LABEL_7;
  }

  if (!v12)
  {
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    id v19 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = (void *)v20;
    id v22 = @"?";
    if (v20) {
      id v22 = (const __CFString *)v20;
    }
    uint64_t v32 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    NSErrorDomain v24 = NSOSStatusErrorDomain;
    uint64_t v25 = -6705LL;
    goto LABEL_17;
  }

  if (([v13 isEqualToString:self->_appleID] & 1) == 0)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v26 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960587LL, 0LL, 0LL));
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    uint64_t v21 = (void *)v27;
    id v28 = @"?";
    if (v27) {
      id v28 = (const __CFString *)v27;
    }
    id v30 = v28;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    NSErrorDomain v24 = NSOSStatusErrorDomain;
    uint64_t v25 = -6709LL;
LABEL_17:
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  v25,  v23));

    goto LABEL_7;
  }

  if (self->_identityRequest == v14)
  {
    -[SDAppleIDDatabaseManager setCertificateToken:privateKeyPersistentReference:forAppleID:]( self->_dbManager,  "setCertificateToken:privateKeyPersistentReference:forAppleID:",  0LL,  0LL,  v13);
    -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", v12);
  }

  else if (dword_1006435F8 <= 60 {
         && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
  }
  {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleReceivedIdentity:forAppleID:identityRequest:withError:completion:]",  60LL,  "Outdated identity request received, ignoring\n");
  }

  id v17 = 0LL;
LABEL_7:
  -[SDAppleIDIdentityRequest invalidate](self->_identityRequest, "invalidate");
  identityRequest = self->_identityRequest;
  self->_identityRequest = 0LL;

  if (v16) {
    v16[2](v16, v17);
  }
}

- (void)_handlePeriodicVerifyTimerFired
{
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handlePeriodicVerifyTimerFired]",  30LL,  "Periodic verify timer fired\n");
  }
  if (self->_throttledRetryTimer)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handlePeriodicVerifyTimerFired]",  30LL,  "Throttled retry scheduled, ignoring periodic verify\n");
    }
  }

  else
  {
    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }

- (void)_handleThrottledRetryTimerFired
{
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _handleThrottledRetryTimerFired]",  30LL,  "Throttled retry timer fired\n");
  }
  -[SDAppleIDAgent _ensureThrottledRetryTimerStopped](self, "_ensureThrottledRetryTimerStopped");
  -[SDAppleIDAgent _verifyState](self, "_verifyState");
}

- (unint64_t)_keychainCleanupTag
{
  return CFGetInt64( -[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"KeychainCleanupTag"),  0LL);
}

- (id)_metaInfoValueForKey:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_agentMetaInfo, "objectForKeyedSubscript:", a3);
}

- (int)_performKeyVerificationForIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SDAppleIDAgent _metaInfoValueForKey:]( self,  "_metaInfoValueForKey:",  @"LastKeyVerificationDate"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v7 = v6;
    if (v5 && ([v6 timeIntervalSinceDate:v5], v8 <= 86400.0))
    {
      if (dword_1006435F8 <= 30)
      {
        if (dword_1006435F8 != -1 || (v19 = v8, v18 = _LogCategory_Initialize(&dword_1006435F8, 30LL), double v8 = v19, v18)) {
          LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performKeyVerificationForIdentity:]",  30LL,  "Skipping key verification. Last one peformed %g seconds ago.\n",  v8);
        }
      }

      LODWORD(v10) = 0;
    }

    else
    {
      uint64_t v9 = mach_absolute_time();
      id v10 = [v4 verifyKeys];
      uint64_t v11 = mach_absolute_time();
      if ((_DWORD)v10)
      {
        if (dword_1006435F8 <= 30
          && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
        {
          LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performKeyVerificationForIdentity:]",  30LL,  "Verify keys failed with err=%#m\n",  v10);
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
        SFMetricsLogUnexpectedEvent(2LL, (int)v10, v12);
      }

      v21[0] = &off_1005F79A8;
      v20[0] = @"operation";
      v20[1] = @"durationMs";
      id v13 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  UpTicksToMilliseconds(v11 - v9));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v21[1] = v14;
      void v20[2] = @"success";
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (_DWORD)v10 == 0));
      v21[2] = v15;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
      SFMetricsLog(@"com.apple.sharing.OperationDuration", v16);

      -[SDAppleIDAgent _setMetaInfoValue:forKey:]( self,  "_setMetaInfoValue:forKey:",  v7,  @"LastKeyVerificationDate");
    }
  }

  else
  {
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _performKeyVerificationForIdentity:]", 60LL, "### No identity\n");
    }

    LODWORD(v10) = 0;
    id v5 = 0LL;
    id v7 = 0LL;
  }

  return (int)v10;
}

- (int)_performKeychainCount
{
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v18 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"LastKeychainCountDate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = v4;
  if (v3)
  {
    [v4 timeIntervalSinceDate:v3];
    if (v6 <= 259200.0)
    {
LABEL_14:
      LODWORD(v8) = 0;
      goto LABEL_15;
    }
  }

  uint64_t v7 = mach_absolute_time();
  uint64_t v8 = SFAppleIDCertificateAndKeyCounts(&v20, &v19, &v18);
  uint64_t v9 = mach_absolute_time();
  if (!(_DWORD)v8)
  {
    uint64_t v10 = v9;
    v21[0] = @"certCount";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20));
    v22[0] = v11;
    v21[1] = @"privKeyCount";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
    v22[1] = v12;
    v21[2] = @"pubKeyCount";
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v18));
    v22[2] = v13;
    void v21[3] = @"latencyMs";
    id v14 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", UpTicksToMilliseconds(v10 - v7));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v22[3] = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
    SFMetricsLog(@"com.apple.sharing.AIAKeychainCount", v16);

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performKeychainCount]",  30LL,  "Certs: %d, private keys: %d, public keys: %d\n",  v20,  v19,  v18);
    }

    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v5, @"LastKeychainCountDate");
    goto LABEL_14;
  }

  if (dword_1006435F8 <= 60 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performKeychainCount]",  60LL,  "### SDAppleIDCertificateAndKeyCounts failed with err=%#m.\n",  v8);
  }
LABEL_15:

  return v8;
}

- (void)_performOtherTaskWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"requestType"]);
  if (![v8 isEqualToString:@"createAndFetchCert"])
  {
    if ([v8 isEqualToString:@"triggerPush"])
    {
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 30LL, "Trigger push\n");
      }

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100109B20;
      block[3] = &unk_1005CB830;
      void block[4] = self;
      id v37 = v7;
      dispatch_async(dispatchQueue, block);
      uint64_t v18 = v37;
    }

    else if ([v8 isEqualToString:@"triggerVerify"])
    {
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 30LL, "Trigger verify\n");
      }

      -[SDAppleIDAgent _handlePeriodicVerifyTimerFired](self, "_handlePeriodicVerifyTimerFired");
      if (!v7) {
        goto LABEL_35;
      }
      uint64_t v19 = (dispatch_queue_s *)self->_dispatchQueue;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100109B70;
      v34[3] = &unk_1005CE278;
      id v35 = v7;
      dispatch_async(v19, v34);
      uint64_t v18 = v35;
    }

    else
    {
      if (![v8 isEqualToString:@"removeAppleID"])
      {
        if ([v8 isEqualToString:@"setMetaInfo"])
        {
          if (dword_1006435F8 <= 30
            && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
          {
            LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]",  30LL,  "Set Meta Info Request\n");
          }

          uint64_t v21 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"key"]);
          if (v21)
          {
            id v16 = (void *)v21;
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"value"]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            unsigned int v23 = [v15 isEqual:v22];

            if (v23)
            {

              id v15 = 0LL;
            }

            -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v15, v16);
            if (v7)
            {
              NSErrorDomain v24 = (dispatch_queue_s *)self->_dispatchQueue;
              v30[0] = _NSConcreteStackBlock;
              v30[1] = 3221225472LL;
              v30[2] = sub_100109BA0;
              v30[3] = &unk_1005CE278;
              id v31 = v7;
              dispatch_async(v24, v30);
            }

            goto LABEL_36;
          }
        }

        else if (dword_1006435F8 <= 90 {
               && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 90LL)))
        }
        {
          LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]",  90LL,  "### Unsupported request type %@\n",  v8);
        }

        uint64_t v9 = 0LL;
LABEL_46:
        int v25 = -6705;
        if (!v7)
        {
LABEL_48:
          id v15 = 0LL;
          id v16 = 0LL;
          id v14 = 0LL;
          goto LABEL_37;
        }

- (void)_performServerTaskWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v45 = a4;
  uint64_t v67 = 0LL;
  NSErrorUserInfoKey v68 = &v67;
  uint64_t v69 = 0x2020000000LL;
  int v70 = 0;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  uint64_t v66 = 0LL;
  uint64_t v59 = 0LL;
  id v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  uint64_t v62 = 0LL;
  NSErrorDomain v43 = v6;
  NSErrorUserInfoKey v44 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"requestType"]);
  if ([v44 isEqualToString:@"createCert"])
  {
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appleID"]);
    if (v7)
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
      if (v8)
      {
        dispatch_semaphore_t v9 = v8;
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472LL;
        v54[2] = sub_10010A620;
        v54[3] = &unk_1005CE640;
        v56 = &v67;
        id v57 = &v63;
        uint64_t v58 = &v59;
        id v12 = v9;
        uint64_t v55 = v12;
        SFAppleIDCreateKeyPair(v7, v11, v54);

        dispatch_time_t v13 = dispatch_time(0LL, 15000000000LL);
        if (dispatch_semaphore_wait(v12, v13))
        {
          if (dword_1006435F8 <= 50
            && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 50LL)))
          {
            LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performServerTaskWithInfo:completion:]",  50LL,  "CreateCSIdentity semaphore timed out\n");
          }

          goto LABEL_6;
        }

        id v14 = v68;
        if (*((_DWORD *)v68 + 6))
        {
LABEL_6:
          v40 = 0LL;
          NSErrorDomain v41 = 0LL;
          id v38 = 0LL;
          id v39 = 0LL;
          id v15 = 0LL;
          id v16 = 0LL;
          uint64_t v42 = 0LL;
          id v17 = 0LL;
LABEL_24:
          uint64_t v21 = 0LL;
          uint64_t v19 = 0LL;
          goto LABEL_36;
        }

        if (v60[3] && v64[3])
        {
          v53[1] = 0LL;
          int v25 = SFAppleIDCreateCertificateRequestPEMStringForKeyPair(v7);
          id v26 = 0LL;
          id v17 = v26;
          id v14 = v68;
          *((_DWORD *)v68 + 6) = v25;
          if (v25)
          {
            v40 = 0LL;
            NSErrorDomain v41 = 0LL;
            id v38 = 0LL;
            id v39 = 0LL;
            id v15 = 0LL;
            id v16 = 0LL;
            uint64_t v42 = 0LL;
            goto LABEL_24;
          }

          if (v26)
          {
            v75 = @"csr";
            id v76 = v26;
            id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
            v40 = 0LL;
            NSErrorDomain v41 = 0LL;
            id v38 = 0LL;
            id v39 = 0LL;
            uint64_t v20 = 0LL;
            id v16 = 0LL;
            uint64_t v42 = 0LL;
            uint64_t v21 = 0LL;
LABEL_32:
            uint64_t v19 = 0LL;
            goto LABEL_33;
          }

          v40 = 0LL;
          NSErrorDomain v41 = 0LL;
          id v38 = 0LL;
          id v39 = 0LL;
          id v15 = 0LL;
          id v16 = 0LL;
          uint64_t v42 = 0LL;
        }

        else
        {
          v40 = 0LL;
          NSErrorDomain v41 = 0LL;
          id v38 = 0LL;
          id v39 = 0LL;
          id v15 = 0LL;
          id v16 = 0LL;
          uint64_t v42 = 0LL;
          id v17 = 0LL;
        }

        uint64_t v21 = 0LL;
        uint64_t v19 = 0LL;
        goto LABEL_64;
      }

      v40 = 0LL;
      NSErrorDomain v41 = 0LL;
      id v38 = 0LL;
      id v39 = 0LL;
      id v15 = 0LL;
      id v12 = 0LL;
      id v16 = 0LL;
      uint64_t v42 = 0LL;
      id v17 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v19 = 0LL;
      id v14 = v68;
      int v37 = -6728;
LABEL_53:
      *((_DWORD *)v14 + 6) = v37;
      goto LABEL_36;
    }

    goto LABEL_57;
  }

  if (![v44 isEqualToString:@"fetchCert"])
  {
    if ([v44 isEqualToString:@"getMyInfo"])
    {
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appleID"]);
      if (v7)
      {
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"certificateSN"]);
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"vrid"]);
        id v16 = (void *)v22;
        if (v21) {
          unsigned int v23 = v21;
        }
        else {
          unsigned int v23 = &stru_1005E3958;
        }
        v71[0] = @"serialNumber";
        v71[1] = @"clientAidvrId";
        if (v22) {
          NSErrorDomain v24 = (const __CFString *)v22;
        }
        else {
          NSErrorDomain v24 = &stru_1005E3958;
        }
        v72[0] = v23;
        v72[1] = v24;
        uint64_t v20 = 2LL;
        id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  2LL));
        v40 = 0LL;
        NSErrorDomain v41 = 0LL;
        id v38 = 0LL;
        id v39 = 0LL;
        id v12 = 0LL;
        uint64_t v42 = 0LL;
        id v17 = 0LL;
        goto LABEL_32;
      }

      goto LABEL_57;
    }

    if ([v44 isEqualToString:@"findPerson"])
    {
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"emails"]);
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"phones"]);
      NSErrorDomain v41 = (void *)v27;
      if (__PAIR128__((unint64_t)v42, v27) != 0)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        if (v42)
        {
          v53[0] = 0LL;
          int v28 = sub_100171AD0(v42, 0, v53);
          id v29 = v53[0];
          id v14 = v68;
          *((_DWORD *)v68 + 6) = v28;
          id v39 = v29;
          if (v28)
          {
            id v38 = 0LL;
LABEL_48:
            id v15 = 0LL;
            id v12 = 0LL;
            id v16 = 0LL;
            id v17 = 0LL;
            uint64_t v21 = 0LL;
            uint64_t v19 = 0LL;
            id v7 = 0LL;
            goto LABEL_36;
          }

          if (!v29)
          {
            id v38 = 0LL;
            id v39 = 0LL;
            goto LABEL_71;
          }

          [v40 setObject:v29 forKeyedSubscript:@"emails"];
        }

        else
        {
          id v39 = 0LL;
        }

        if (!v41)
        {
          id v38 = 0LL;
LABEL_56:
          id v7 = self->_appleID;
          id v15 = v40;
          id v12 = 0LL;
          id v16 = 0LL;
          id v17 = 0LL;
          uint64_t v21 = 0LL;
          uint64_t v19 = 0LL;
          uint64_t v20 = 3LL;
          v40 = v15;
          goto LABEL_33;
        }

        id v52 = 0LL;
        int v35 = sub_100171AD0(v41, 0, &v52);
        id v36 = v52;
        id v14 = v68;
        *((_DWORD *)v68 + 6) = v35;
        id v38 = v36;
        if (v35) {
          goto LABEL_48;
        }
        if (v36)
        {
          [v40 setObject:v36 forKeyedSubscript:@"phones"];
          goto LABEL_56;
        }

        id v38 = 0LL;
LABEL_71:
        id v15 = 0LL;
        id v12 = 0LL;
        id v16 = 0LL;
        id v17 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v19 = 0LL;
        id v7 = 0LL;
LABEL_64:
        int v37 = -6762;
        goto LABEL_53;
      }
    }

    else if (dword_1006435F8 <= 90 {
           && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 90LL)))
    }
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _performServerTaskWithInfo:completion:]",  90LL,  "### Unsupported request type %@\n",  v44);
    }

    v40 = 0LL;
    NSErrorDomain v41 = 0LL;
    id v38 = 0LL;
    id v39 = 0LL;
    id v15 = 0LL;
    id v12 = 0LL;
    id v16 = 0LL;
    uint64_t v42 = 0LL;
    id v17 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v19 = 0LL;
    id v7 = 0LL;
LABEL_52:
    id v14 = v68;
    int v37 = -6705;
    goto LABEL_53;
  }

  id v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appleID"]);
  if (!v7)
  {
LABEL_57:
    v40 = 0LL;
    NSErrorDomain v41 = 0LL;
    id v38 = 0LL;
    id v39 = 0LL;
    id v15 = 0LL;
    id v12 = 0LL;
    id v16 = 0LL;
    uint64_t v42 = 0LL;
    id v17 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_52;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"certificateToken"]);
  uint64_t v19 = (void *)v18;
  if (!v18)
  {
    v40 = 0LL;
    NSErrorDomain v41 = 0LL;
    id v38 = 0LL;
    id v39 = 0LL;
    id v15 = 0LL;
    id v12 = 0LL;
    id v16 = 0LL;
    uint64_t v42 = 0LL;
    id v17 = 0LL;
    uint64_t v21 = 0LL;
    goto LABEL_52;
  }

  v73 = @"certificateToken";
  uint64_t v74 = v18;
  uint64_t v20 = 1LL;
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
  v40 = 0LL;
  NSErrorDomain v41 = 0LL;
  id v38 = 0LL;
  id v39 = 0LL;
  id v12 = 0LL;
  id v16 = 0LL;
  uint64_t v42 = 0LL;
  id v17 = 0LL;
  uint64_t v21 = 0LL;
LABEL_33:
  task = self->_task;
  if (task)
  {
    -[SDAppleIDServerTask invalidate](task, "invalidate");
    id v31 = self->_task;
    self->_task = 0LL;
  }

  uint64_t v32 = -[SDAppleIDServerTask initWithType:appleID:info:]( objc_alloc(&OBJC_CLASS___SDAppleIDServerTask),  "initWithType:appleID:info:",  v20,  v7,  v15);
  id v33 = self->_task;
  self->_task = v32;

  -[SDAppleIDServerTask setDispatchQueue:](self->_task, "setDispatchQueue:", self->_dispatchQueue);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10010A64C;
  v49[3] = &unk_1005CE668;
  v49[4] = self;
  uint64_t v51 = v20;
  id v50 = v45;
  -[SDAppleIDServerTask setResponseHandler:](self->_task, "setResponseHandler:", v49);

  -[SDAppleIDServerTask activate](self->_task, "activate");
  *((_DWORD *)v68 + 6) = 0;
LABEL_36:
  if (v45 && *((_DWORD *)v68 + 6))
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010A6FC;
    block[3] = &unk_1005CE690;
    id v47 = v45;
    id v48 = &v67;
    dispatch_async(dispatchQueue, block);
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v67, 8);
}

- (void)_personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v12 = self->_dispatchQueue;
    if (v12)
    {
      if (v9) {
        goto LABEL_6;
      }
    }

    else
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v26 handleFailureInMethod:a2 object:self file:@"SDAppleIDAgent.m" lineNumber:1784 description:@"inQueue and _dispatchQueue both nil."];

      id v12 = 0LL;
      if (v9) {
        goto LABEL_6;
      }
    }

- (void)_prefsChanged
{
  int v17 = 0;
  if (-[SDAppleIDAgent eduModeEnabled](self, "eduModeEnabled"))
  {
    if (dword_1006435F8 <= 40
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 40LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _prefsChanged]", 40LL, "Device is in edu mode, agent disabled \n");
    }

    BOOL v5 = 0;
  }

  else
  {
    uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"aiaEnabled", &v17);
    if (v17) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = Int64 == 0;
    }
    BOOL v5 = !v4;
  }

  if (self->_agentEnabled != v5)
  {
    if (dword_1006435F8 <= 40
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 40LL)))
    {
      id v6 = "yes";
      if (v5) {
        id v7 = "no";
      }
      else {
        id v7 = "yes";
      }
      if (!v5) {
        id v6 = "no";
      }
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _prefsChanged]", 40LL, "Agent Enabled: %s -> %s\n", v7, v6);
    }

    self->_agentEnabled = v5;
    *(_WORD *)&self->_updatePush = 257;
  }

  uint64_t v8 = CFPrefs_GetInt64(@"com.apple.Sharing", @"aiaLinkIdentityEnabled", &v17);
  if (v17) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  BOOL v10 = !v9;
  if (self->_linkIdentityEnabled != v10)
  {
    if (dword_1006435F8 <= 40
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 40LL)))
    {
      id v11 = "yes";
      if (v10) {
        id v12 = "no";
      }
      else {
        id v12 = "yes";
      }
      if (!v10) {
        id v11 = "no";
      }
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _prefsChanged]",  40LL,  "Agent Link Identity Enabled: %s -> %s\n",  v12,  v11);
    }

    self->_linkIdentityEnabled = v10;
    self->_updatePeriodicVerifyTimer = 1;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  id v14 = (__CFString *)CFPrefs_CopyTypedValue(@"com.apple.Sharing", @"aiaPushEnvironment", TypeID, &v17);
  id v15 = v14;
  if (v17)
  {

    id v15 = @"production";
  }

  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v15, "lowercaseString"));

  if ((-[__CFString isEqualToString:](v16, "isEqualToString:", @"production") & 1) == 0
    && (-[__CFString isEqualToString:](v16, "isEqualToString:", @"development") & 1) == 0)
  {

    id v16 = @"production";
  }

  if ((-[__CFString isEqualToString:](v16, "isEqualToString:", self->_pushEnvironment) & 1) == 0)
  {
    if (dword_1006435F8 <= 40
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 40LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _prefsChanged]",  40LL,  "Agent Push Environment: %@ -> %@\n",  self->_pushEnvironment,  v16);
    }

    objc_storeStrong((id *)&self->_pushEnvironment, v16);
    self->_updatePush = 1;
  }

  -[SDAppleIDAgent _update](self, "_update");
}

- (void)_removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)_requestInfoForAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    NSErrorDomain v22 = NSOSStatusErrorDomain;
    uint64_t v23 = -6705LL;
LABEL_29:
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v23,  0LL));
    BOOL v9 = 0LL;
    id v11 = 0LL;
    id v16 = 0LL;
    uint64_t v13 = 0LL;
    goto LABEL_30;
  }

  if (self->_infoRequest)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _requestInfoForAppleID:completion:]",  30LL,  "Info request already in progress\n");
    }

    NSErrorDomain v22 = NSOSStatusErrorDomain;
    uint64_t v23 = 201225LL;
    goto LABEL_29;
  }

  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _requestInfoForAppleID:completion:]",  30LL,  "Request info for %{mask}\n",  v6);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", v6));
  BOOL v9 = v8;
  if (v8)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 serialNumber]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 validationRecord]);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  }

  else
  {
    id v11 = 0LL;
    uint64_t v13 = 0LL;
  }

  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = &stru_1005E3958;
  }
  v40[0] = @"serialNumber";
  v40[1] = @"clientAidvrId";
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = &stru_1005E3958;
  }
  v41[0] = v14;
  v41[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
  int v17 = -[SDAppleIDServerTask initWithType:appleID:info:]( objc_alloc(&OBJC_CLASS___SDAppleIDServerTask),  "initWithType:appleID:info:",  2LL,  v6,  v16);
  -[SDAppleIDServerTask setDispatchQueue:](v17, "setDispatchQueue:", self->_dispatchQueue);
  if (v17)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10010B5C0;
    v33[3] = &unk_1005CE6B8;
    v33[4] = self;
    id v34 = v6;
    id v18 = v17;
    id v35 = v18;
    id v11 = v11;
    id v36 = v11;
    id v37 = v7;
    -[SDAppleIDServerTask setResponseHandler:](v18, "setResponseHandler:", v33);

    infoRequest = self->_infoRequest;
    self->_infoRequest = v18;
    uint64_t v20 = v18;

    -[SDAppleIDServerTask activate](self->_infoRequest, "activate");
    id v21 = 0LL;
LABEL_18:

    goto LABEL_19;
  }

  NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
  NSErrorDomain v24 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960534LL, 0LL, 0LL));
  uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
  id v26 = (void *)v25;
  uint64_t v27 = @"?";
  if (v25) {
    uint64_t v27 = (const __CFString *)v25;
  }
  id v39 = v27;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
  id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6762LL,  v28));

LABEL_30:
  if (v7 && v21)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010B650;
    block[3] = &unk_1005CC1B0;
    id v32 = (SDAppleIDServerTask *)v7;
    id v21 = v21;
    id v31 = v21;
    dispatch_async(dispatchQueue, block);

    uint64_t v20 = v32;
    goto LABEL_18;
  }

- (void)_requestIdentityForAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (!self->_identityRequest)
    {
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        id v14 = "yes";
        if (!v12) {
          id v14 = "no";
        }
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:]",  30LL,  "Request identity for %{mask}, certificate token %@, private key persistent ref %s\n",  v10,  v11,  v14);
      }

      id v15 = objc_alloc(&OBJC_CLASS___SDAppleIDIdentityRequest);
      if (v11 && v12)
      {
        id v16 = -[SDAppleIDIdentityRequest initWithAppleID:certificateToken:privateKeyPersistentReference:]( v15,  "initWithAppleID:certificateToken:privateKeyPersistentReference:",  v10,  v11,  v12);
      }

      else
      {
        id v16 = -[SDAppleIDIdentityRequest initWithAppleID:](v15, "initWithAppleID:", v10);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_10010BA94;
        v39[3] = &unk_1005CE6E0;
        v39[4] = self;
        id v40 = v10;
        -[SDAppleIDIdentityRequest setCertificateTokenHandler:](v16, "setCertificateTokenHandler:", v39);
      }

      -[SDAppleIDIdentityRequest setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10010BB1C;
      v35[3] = &unk_1005CE708;
      v35[4] = self;
      id v36 = v10;
      int v17 = v16;
      id v37 = v17;
      id v38 = v13;
      -[SDAppleIDIdentityRequest setResponseHandler:](v17, "setResponseHandler:", v35);

      identityRequest = self->_identityRequest;
      self->_identityRequest = v17;
      uint64_t v19 = v17;

      -[SDAppleIDIdentityRequest activate](self->_identityRequest, "activate");
      id v20 = 0LL;
      goto LABEL_14;
    }

    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:]",  30LL,  "Identity request already in progress\n");
    }

    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    id v28 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(201224LL, 0LL, 0LL));
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    uint64_t v23 = (void *)v29;
    id v30 = @"?";
    if (v29) {
      id v30 = (const __CFString *)v29;
    }
    uint64_t v42 = v30;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    NSErrorDomain v26 = NSOSStatusErrorDomain;
    uint64_t v27 = 201224LL;
  }

  else
  {
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    id v21 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = (void *)v22;
    NSErrorDomain v24 = @"?";
    if (v22) {
      NSErrorDomain v24 = (const __CFString *)v22;
    }
    NSErrorUserInfoKey v44 = v24;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    NSErrorDomain v26 = NSOSStatusErrorDomain;
    uint64_t v27 = -6705LL;
  }

  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  v27,  v25));

  if (v13 && v20)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010BBA8;
    block[3] = &unk_1005CC1B0;
    id v34 = (SDAppleIDIdentityRequest *)v13;
    id v20 = v20;
    id v33 = v20;
    dispatch_async(dispatchQueue, block);

    uint64_t v19 = v34;
LABEL_14:
  }
}

- (void)_setCurrentAppleIDIdentity:(id)a3
{
}

- (void)_setCurrentAppleIDContactInfo:(id)a3 validationRecord:(id)a4
{
}

- (void)_setMetaInfoValue:(id)a3 forKey:(id)a4
{
}

- (id)_statusInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager statusInfo](self->_dbManager, "statusInfo"));
    [v3 addEntriesFromDictionary:v4];

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAppleIDAgent _accountState](self, "_accountState")));
    [v3 setObject:v5 forKeyedSubscript:@"AccountState"];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _detailedDescription](self, "_detailedDescription"));
    [v3 setObject:v6 forKeyedSubscript:@"AgentDescription"];

    id v7 = v3;
  }

  return v3;
}

- (void)_update
{
  if (self->_updatePush)
  {
    -[SDAppleIDAgent _ensurePushStopped](self, "_ensurePushStopped");
    -[SDAppleIDAgent _ensurePushStarted](self, "_ensurePushStarted");
    self->_updatePush = 0;
  }

  if (self->_updatePeriodicVerifyTimer)
  {
    -[SDAppleIDAgent _ensurePeriodicVerifyTimerStopped](self, "_ensurePeriodicVerifyTimerStopped");
    -[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted](self, "_ensurePeriodicVerifyTimerStarted");
    self->_updatePeriodicVerifyTimer = 0;
  }

- (void)_updateAppleID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 myAppleID]);

  p_appleID = &self->_appleID;
  appleID = self->_appleID;
  if (appleID) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = obj == 0LL;
  }
  if (!v6 || (unsigned __int8 v7 = -[NSString isEqualToString:](appleID, "isEqualToString:"), v8 = obj, (v7 & 1) == 0))
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _updateAppleID]",  30LL,  "Apple ID changed from %{mask} to %{mask}\n",  *p_appleID,  obj);
    }

    if (*p_appleID) {
      -[SDAppleIDAgent _clearAccount](self, "_clearAccount");
    }
    objc_storeStrong((id *)&self->_appleID, obj);
    uint64_t v8 = obj;
  }
}

- (void)_updateMyInfo
{
  if (self->_appleID)
  {
    -[SDAppleIDAgent _setCurrentAppleIDContactInfo:validationRecord:]( self,  "_setCurrentAppleIDContactInfo:validationRecord:",  0LL,  0LL);
    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }

  else if (dword_1006435F8 <= 60 {
         && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
  }
  {
    LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _updateMyInfo]", 60LL, "AppleID is nil, unable to updated my info\n");
  }

- (void)_verifyState
{
  if (!self->_agentEnabled)
  {
LABEL_68:
    BOOL v5 = 0LL;
    goto LABEL_69;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v4 = [v3 deviceWasUnlockedOnce];

  if ((v4 & 1) == 0)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _verifyState]", 30LL, "Device not unlocked yet\n");
    }

    goto LABEL_68;
  }

  if (self->_dbManager)
  {
    BOOL v5 = 0LL;
    goto LABEL_12;
  }

  BOOL v6 = (SDAppleIDDatabaseManager *)objc_claimAutoreleasedReturnValue( +[SDAppleIDDatabaseManager sharedManager]( &OBJC_CLASS___SDAppleIDDatabaseManager,  "sharedManager"));
  dbManager = self->_dbManager;
  self->_dbManager = v6;

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager metaInfo](self->_dbManager, "metaInfo"));
  uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  agentMetaInfo = self->_agentMetaInfo;
  self->_agentMetaInfo = v8;

  id v10 = self->_agentMetaInfo;
  if (!v10)
  {
LABEL_69:
    id v11 = 0LL;
    goto LABEL_66;
  }

  if (v5) {
    -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v5);
  }
LABEL_12:
  -[SDAppleIDAgent _updateAppleID](self, "_updateAppleID");
  if (!self->_appleID)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _verifyState]",  30LL,  "My AppleID is nil, user probably not signed in\n");
    }

    goto LABEL_69;
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:"));
  if (!v11)
  {
    -[SDAppleIDDatabaseManager addAppleID:](self->_dbManager, "addAppleID:", self->_appleID);
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", self->_appleID));
    if (!v11)
    {
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _verifyState]",  30LL,  "Unable to get account for %{mask}\n",  self->_appleID);
      }

      goto LABEL_69;
    }
  }

  -[SDAppleIDAgent _cleanUpAccount:](self, "_cleanUpAccount:", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);

  if (!v12)
  {
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _verifyState]", 30LL, "Account doesn't have an identity object\n");
    }

    appleID = self->_appleID;
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateToken]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v11 privateKeyPersistentReference]);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10010C680;
    v49[3] = &unk_1005CB3E8;
    v49[4] = self;
    id v39 = v49;
    goto LABEL_34;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
  if ([v13 isInvalid])
  {

LABEL_18:
    if (dword_1006435F8 <= 30
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
    {
      LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent _verifyState]", 30LL, "Identity is invalid or needs renewal\n");
    }

    appleID = self->_appleID;
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateToken]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v11 privateKeyPersistentReference]);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10010C6EC;
    v48[3] = &unk_1005CB3E8;
    v48[4] = self;
    id v39 = v48;
LABEL_34:
    -[SDAppleIDAgent _requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:]( self,  "_requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:",  appleID,  v37,  v38,  v39);

    goto LABEL_66;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
  unsigned int v15 = [v14 needsRenewal];

  if (v15) {
    goto LABEL_18;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
  unsigned int v17 = -[SDAppleIDAgent _performKeyVerificationForIdentity:](self, "_performKeyVerificationForIdentity:", v16);

  if (!v17)
  {
    -[SDAppleIDAgent _performKeychainCount](self, "_performKeychainCount");
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);

    if (!v18)
    {
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _verifyState]",  30LL,  "Account doesn't have a validation record\n");
      }

      id v40 = self->_appleID;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10010C758;
      v47[3] = &unk_1005CB3E8;
      v47[4] = self;
      NSErrorUserInfoKey v41 = v47;
      goto LABEL_37;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);
    if ([v19 needsUpdate])
    {

LABEL_25:
      if (dword_1006435F8 <= 30
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _verifyState]",  30LL,  "Validation Record needs update or is invalid\n");
      }

      id v40 = self->_appleID;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_10010C7C4;
      v46[3] = &unk_1005CB3E8;
      v46[4] = self;
      NSErrorUserInfoKey v41 = v46;
LABEL_37:
      -[SDAppleIDAgent _requestInfoForAppleID:completion:](self, "_requestInfoForAppleID:completion:", v40, v41);
      goto LABEL_66;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);
    unsigned int v21 = [v20 isInvalid];

    if (v21) {
      goto LABEL_25;
    }
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 accountIdentifier]);
    if (v23)
    {
      NSErrorDomain v24 = (void *)v23;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 altDSID]);
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        NSErrorUserInfoKey v43 = v5;
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 accountIdentifier]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);
        uint64_t v42 = v22;
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 altDSID]);
        unsigned __int8 v32 = [v29 hasSuffix:v31];

        BOOL v5 = v43;
        if ((v32 & 1) != 0)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 data]);
          dispatchQueue = self->_dispatchQueue;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_10010C830;
          v44[3] = &unk_1005CE758;
          v44[4] = self;
          id v11 = v11;
          id v45 = v11;
          SFAppleIDParseValidationRecordData(v34, dispatchQueue, v44);

          goto LABEL_66;
        }

        goto LABEL_61;
      }
    }

LABEL_61:
    if (dword_1006435F8 <= 60
      && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 60LL)))
    {
      LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent _verifyState]",  60LL,  "### Certificate account identifier does not match altDSID in the validation record\n");
    }

    -[SDAppleIDAgent _handleAccountIdentifierValidationRecordMismatch]( self,  "_handleAccountIdentifierValidationRecordMismatch");
    goto LABEL_66;
  }

  -[SDAppleIDAgent _handleKeyVerificationFailure](self, "_handleKeyVerificationFailure");
LABEL_66:
}

- (void)_verifyStateWithDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010CD08;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_after(v4, &_dispatch_main_q, block);
}

- (BOOL)_wasIdentityLinkedOnce
{
  return CFGetInt64( -[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"IdentityLinkedOnce"),  0LL) != 0;
}

- (BOOL)_wasOldAgentIdentityQueried
{
  return CFGetInt64( -[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", @"OldAgentIdentityQueried"),  0LL) != 0;
}

- (id)accountForAppleID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](v5, "_accountForAppleID:", v4));
  objc_sync_exit(v5);

  if (dword_1006435F8 <= 30
    && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 8388638LL)))
  {
    LogPrintF(&dword_1006435F8, "-[SDAppleIDAgent accountForAppleID:]", 8388638LL, "Account for %{mask}:\n%@\n", v4, v6);
  }

  return v6;
}

- (id)accountStatusForAppleID:(id)a3
{
  id v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  BOOL v6 = v4->_appleID;
  objc_sync_exit(v4);

  unsigned int v7 = -[NSString isEqualToString:](v6, "isEqualToString:", v5);
  if (v7) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent statusInfo](v4, "statusInfo"));
  }
  else {
    uint64_t v8 = 0LL;
  }
  return v8;
}

- (void)activate
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _activate](obj, "_activate");
  objc_sync_exit(obj);
}

- (void)verifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  BOOL v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  id v11 = v10;
  dispatchQueue = v9;
  if (!v9) {
    dispatchQueue = self->_dispatchQueue;
  }
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10010D04C;
    v14[3] = &unk_1005CE780;
    id v15 = v8;
    id v16 = v11;
    id v13 = dispatchQueue;
    -[SDAppleIDAgent queryVerifiedIdentityForEmailOrPhone:queue:completion:]( self,  "queryVerifiedIdentityForEmailOrPhone:queue:completion:",  v15,  v13,  v14);
  }
}

- (void)verifiedIdentityForEmailOrPhone:(id)a3 completion:(id)a4
{
}

- (id)verifiedIdentityForEmailOrPhone:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unsigned int v21 = sub_10010D2BC;
  uint64_t v22 = sub_10010D2CC;
  id v23 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  if (v5)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    id v14 = sub_10010D2D4;
    id v15 = &unk_1005CE7A8;
    unsigned int v17 = &v18;
    id v8 = v5;
    id v16 = v8;
    -[SDAppleIDAgent verifiedIdentityForEmailOrPhone:queue:completion:]( self,  "verifiedIdentityForEmailOrPhone:queue:completion:",  v4,  v7,  &v12);

    dispatch_time_t v9 = dispatch_time(0LL, 15000000000LL);
    if (dispatch_semaphore_wait(v8, v9))
    {
      if (dword_1006435F8 <= 50
        && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 50LL)))
      {
        LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent verifiedIdentityForEmailOrPhone:]",  50LL,  "CreateCSIdentity semaphore timed out\n",  v12,  v13,  v14,  v15);
      }
    }
  }

  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)verifiedIdentityForCertificateChain:(id)a3 emailOrPhone:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  int v40 = 0;
  if (![v7 count])
  {
    NSErrorDomain v15 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    id v16 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = (void *)v17;
    uint64_t v19 = @"?";
    if (v17) {
      uint64_t v19 = (const __CFString *)v17;
    }
    id v50 = v19;
    uint64_t v20 = &v50;
    unsigned int v21 = &v49;
    goto LABEL_14;
  }

  if (!v8)
  {
    NSErrorDomain v15 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    uint64_t v22 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    uint64_t v18 = (void *)v23;
    NSErrorDomain v24 = @"?";
    if (v23) {
      NSErrorDomain v24 = (const __CFString *)v23;
    }
    id v48 = v24;
    uint64_t v20 = &v48;
    unsigned int v21 = &v47;
LABEL_14:
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v21,  1LL));
    NSErrorDomain v26 = v15;
    uint64_t v27 = -6705LL;
LABEL_22:
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  v27,  v25));
    id v11 = 0LL;
    goto LABEL_26;
  }

  if ((SFAppleIDVerifyCertificateChainSync(v7, &v40) & 1) == 0)
  {
    uint64_t v28 = v40;
    if (!v40)
    {
      id v12 = 0LL;
      id v13 = 0LL;
      id v11 = 0LL;
      goto LABEL_7;
    }

    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    uint64_t v29 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v40, 0LL, 0LL));
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    uint64_t v18 = (void *)v30;
    id v31 = @"?";
    if (v30) {
      id v31 = (const __CFString *)v30;
    }
    id v46 = v31;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    NSErrorDomain v26 = NSOSStatusErrorDomain;
    uint64_t v27 = v28;
    goto LABEL_22;
  }

  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);

  if (!v9)
  {
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    unsigned __int8 v32 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960534LL, 0LL, 0LL));
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    uint64_t v18 = (void *)v33;
    id v34 = @"?";
    if (v33) {
      id v34 = (const __CFString *)v33;
    }
    NSErrorUserInfoKey v44 = v34;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    NSErrorDomain v26 = NSOSStatusErrorDomain;
    uint64_t v27 = -6762LL;
    goto LABEL_22;
  }

  id v39 = 0LL;
  uint64_t v10 = SFAppleIDCommonNameForCertificate(v9, &v39);
  id v11 = v39;
  int v40 = v10;
  if (!(_DWORD)v10)
  {
    id v12 = -[SDAppleIDVerifiedIdentity initWithAccountIdentifier:emailOrPhone:]( objc_alloc(&OBJC_CLASS___SDAppleIDVerifiedIdentity),  "initWithAccountIdentifier:emailOrPhone:",  v11,  v8);
    id v13 = 0LL;
    goto LABEL_7;
  }

  uint64_t v35 = (int)v10;
  NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
  id v36 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v10, 0LL, 0LL));
  uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
  uint64_t v18 = (void *)v37;
  id v38 = @"?";
  if (v37) {
    id v38 = (const __CFString *)v37;
  }
  uint64_t v42 = v38;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v35,  v25));
LABEL_26:

  id v12 = 0LL;
  if (a5 && v13)
  {
    id v13 = v13;
    id v12 = 0LL;
    *a5 = v13;
  }

- (__SecIdentity)copyIdentityForAppleID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = -[SDAppleIDAgent _copyIdentityForAppleID:](v5, "_copyIdentityForAppleID:", v4);
  objc_sync_exit(v5);

  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent copyIdentityForAppleID:]",  30LL,  "SecIdentity for %{mask}:\n%@\n",  v4,  v6);
  }

  return v6;
}

- (void)queryVerifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  dispatch_time_t v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  id v11 = v10;
  dispatchQueue = v9;
  if (!v9) {
    dispatchQueue = self->_dispatchQueue;
  }
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10010D998;
    v14[3] = &unk_1005CE7D0;
    id v15 = v8;
    id v16 = v11;
    id v13 = dispatchQueue;
    -[SDAppleIDAgent personInfoWithEmailOrPhone:queue:completion:]( self,  "personInfoWithEmailOrPhone:queue:completion:",  v15,  v13,  v14);
  }
}

- (id)detailedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _detailedDescription](v2, "_detailedDescription"));
  objc_sync_exit(v2);

  return v3;
}

- (void)invalidate
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _invalidate](obj, "_invalidate");
  objc_sync_exit(obj);
}

- (id)myAccount
{
  if (self->_appleID)
  {
    id v3 = self;
    objc_sync_enter(v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](v3, "_accountForAppleID:", self->_appleID));
    objc_sync_exit(v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
}

- (void)personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  -[SDAppleIDAgent _personInfoWithEmailOrPhone:queue:completion:]( v10,  "_personInfoWithEmailOrPhone:queue:completion:",  v11,  v8,  v9);
  objc_sync_exit(v10);
}

- (void)prefsChanged
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _prefsChanged](obj, "_prefsChanged");
  objc_sync_exit(obj);
}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"requestType"]);
  if (([v8 isEqualToString:@"createCert"] & 1) != 0
    || ([v8 isEqualToString:@"fetchCert"] & 1) != 0
    || ([v8 isEqualToString:@"getMyInfo"] & 1) != 0
    || [v8 isEqualToString:@"findPerson"])
  {
    -[SDAppleIDAgent _performServerTaskWithInfo:completion:](v7, "_performServerTaskWithInfo:completion:", v9, v6);
  }

  else
  {
    -[SDAppleIDAgent _performOtherTaskWithInfo:completion:](v7, "_performOtherTaskWithInfo:completion:", v9, v6);
  }

  objc_sync_exit(v7);
}

+ (id)sharedAgent
{
  if (qword_100657120 != -1) {
    dispatch_once(&qword_100657120, &stru_1005CE7F0);
  }
  return gSDAppleIDAgent;
}

- (id)statusInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _statusInfo](v2, "_statusInfo"));
  objc_sync_exit(v2);

  return v3;
}

- (id)validationRecordInfoForAppleID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](v5, "_accountForAppleID:", v4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 validationRecord]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
    [v6 setValue:v9 forKey:@"AppleIDAccountValidationRecordData"];

    id v10 = v6;
  }

  objc_sync_exit(v5);

  return v6;
}

- (void)handleAppleIDChangedNotification
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleAppleIDChangedNotification](obj, "_handleAppleIDChangedNotification");
  objc_sync_exit(obj);
}

- (void)handleAppleIDSignedInNotification
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleAppleIDSignedInNotification](obj, "_handleAppleIDSignedInNotification");
  objc_sync_exit(obj);
}

- (void)handleAppleIDSignedOutNotification
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleAppleIDSignedOutNotification](obj, "_handleAppleIDSignedOutNotification");
  objc_sync_exit(obj);
}

- (void)handleKeyBagFirstUnlockNotification
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleKeyBagFirstUnlockNotification](obj, "_handleKeyBagFirstUnlockNotification");
  objc_sync_exit(obj);
}

- (void)handleUILockStatusChangedNotification
{
  id obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleUILockStatusChangedNotification](obj, "_handleUILockStatusChangedNotification");
  objc_sync_exit(obj);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDAppleIDAgent/didReceiveToken",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0LL;
  state.opaque[1] = 0LL;
  os_activity_scope_enter(v13, &state);
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent connection:didReceiveToken:forTopic:identifier:]",  30LL,  "Received push token '%.6@...', topic '%@', identifier '%@'\n",  v10,  v11,  v12);
  }
  os_activity_scope_leave(&state);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDAppleIDAgent/didReceivePublicToken",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0LL;
  state.opaque[1] = 0LL;
  os_activity_scope_enter(v7, &state);
  if (dword_1006435F8 <= 30 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 30LL))) {
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent connection:didReceivePublicToken:]",  30LL,  "Received public push token '%.6@...'\n",  v6);
  }
  os_activity_scope_leave(&state);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDAppleIDAgent/didReceiveIncomingMessage",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0LL;
  state.opaque[1] = 0LL;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1006435F8 <= 50 && (dword_1006435F8 != -1 || _LogCategory_Initialize(&dword_1006435F8, 50LL)))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    LogPrintF( &dword_1006435F8,  "-[SDAppleIDAgent connection:didReceiveIncomingMessage:]",  50LL,  "Received push notification topic '%@'\n",  v9);
  }

  id v10 = self;
  objc_sync_enter(v10);
  -[SDAppleIDAgent _updateMyInfo](v10, "_updateMyInfo");
  objc_sync_exit(v10);

  os_activity_scope_leave(&state);
}

- (void).cxx_destruct
{
}

@end