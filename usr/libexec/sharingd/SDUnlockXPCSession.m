@interface SDUnlockXPCSession
- (BOOL)checkEntitlementWithHandler:(id)a3;
- (NSString)bundleID;
- (SDUnlockXPCSesssionDelegate)delegate;
- (SFAutoUnlockDevice)enableDevice;
- (SFUnlockClientProtocol)clientProxy;
- (void)attemptAutoUnlockForSiriWithClientProxy:(id)a3;
- (void)attemptAutoUnlockWithClientProxy:(id)a3;
- (void)attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:(id)a3;
- (void)authPromptInfoWithCompletionHandler:(id)a3;
- (void)autoUnlockStateWithCompletionHandler:(id)a3;
- (void)cancelAutoUnlock;
- (void)cancelAutoUnlock:(BOOL)a3;
- (void)cancelEnablingAutoUnlockForDevice:(id)a3;
- (void)clearPhoneAutoUnlockNotification:(BOOL)a3;
- (void)completeAutoUnlockWithNotification:(BOOL)a3;
- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4;
- (void)donateDeviceUnlockedWithMask:(BOOL)a3;
- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3;
- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4 clientProxy:(id)a5;
- (void)enableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 passcode:(id)a6 sessionID:(id)a7;
- (void)invalidate;
- (void)notifyDelegate;
- (void)prewarmAutoUnlock;
- (void)repairCloudPairing;
- (void)requestRelock;
- (void)session:(id)a3 didBeginAttemptWithDevice:(id)a4;
- (void)session:(id)a3 didCompleteUnlockWithDevice:(id)a4;
- (void)session:(id)a3 didEnableWithDevice:(id)a4;
- (void)session:(id)a3 didFailToEnableDevice:(id)a4 error:(id)a5;
- (void)session:(id)a3 didFailUnlockWithResults:(id)a4 error:(id)a5 incrementedAttempt:(BOOL)a6;
- (void)session:(id)a3 didReceiveKeyDeviceLocked:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableDevice:(id)a3;
@end

@implementation SDUnlockXPCSession

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v4 cancelEnablingAllDevices];

    -[SDUnlockXPCSession cancelAutoUnlock:](self, "cancelAutoUnlock:", 0LL);
  }

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)repairCloudPairing
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v2 repairCloudPairing];
}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession bundleID](self, "bundleID"));
    id location = 0LL;
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100086504;
    v9[3] = &unk_1005CCC58;
    id v10 = v4;
    objc_copyWeak(&v11, &location);
    [v6 eligibleDevicesRequestFromBundleID:v5 withCompletionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v14 = @"This process does not have permission to perform this action";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  111LL,  v7));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v8);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4 clientProxy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    -[SDUnlockXPCSession setEnableDevice:](self, "setEnableDevice:", v8);
    -[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v10);

    uint64_t v12 = auto_unlock_log(v11);
    NSErrorUserInfoKey v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Adding observer for enabling device %@",  (uint8_t *)&v18,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v14 registerObserver:self];

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v15 enableAutoUnlockWithDevice:v8 passcode:v9];
  }

  else
  {
    uint64_t v16 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = @"This process does not have permission to perform this action";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  111LL,  v17));

    [v10 failedToEnableDevice:v8 error:v15];
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  id v5 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v4 cancelEnablingAutoUnlockForDevice:v5];
  }
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", v7))
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100086894;
    v9[3] = &unk_1005CCC80;
    id v10 = v7;
    objc_copyWeak(&v11, &location);
    [v8 disableAutoUnlockForDevice:v6 completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)prewarmAutoUnlock
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v2 prewarmAutoUnlock];
}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v4 donateDeviceUnlockedWithMask:v3];
}

- (void)clearPhoneAutoUnlockNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v4 clearPhoneAutoUnlockNotification:v3];
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v4 completeAutoUnlockWithNotification:v3];
}

- (void)attemptAutoUnlockWithClientProxy:(id)a3
{
  id v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    uint64_t v5 = auto_unlock_log(-[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v4));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Adding observer for auto unlock attempt %@",  (uint8_t *)&v11,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v7 registerObserver:self];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v8 attemptAutoUnlockForType:1];
  }

  else
  {
    uint64_t v9 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v14 = @"This process does not have permission to perform this action";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  111LL,  v10));

    [v4 failedUnlockWithError:v8];
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:(id)a3
{
  id v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    uint64_t v5 = auto_unlock_log(-[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v4));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Adding observer for auto unlock attempt without notifying watch %@",  (uint8_t *)&v11,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v7 registerObserver:self];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v8 attemptAutoUnlockWithoutNotifyingWatch];
  }

  else
  {
    uint64_t v9 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v14 = @"This process does not have permission to perform this action";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  111LL,  v10));

    [v4 failedUnlockWithError:v8];
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)attemptAutoUnlockForSiriWithClientProxy:(id)a3
{
  id v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    uint64_t v5 = auto_unlock_log(-[SDUnlockXPCSession setClientProxy:](self, "setClientProxy:", v4));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Adding observer for auto unlock attempt for Siri %@",  (uint8_t *)&v11,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v7 registerObserver:self];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v8 attemptAutoUnlockForSiri];
  }

  else
  {
    uint64_t v9 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v14 = @"This process does not have permission to perform this action";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  111LL,  v10));

    [v4 failedUnlockWithError:v8];
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)cancelAutoUnlock
{
  BOOL v3 = -[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL);
  if (v3)
  {
    -[SDUnlockXPCSession cancelAutoUnlock:](self, "cancelAutoUnlock:", 1LL);
  }

  else
  {
    uint64_t v4 = auto_unlock_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Cancel Auto Unlock: This process does not have permission to perform this action",  v6,  2u);
    }

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

- (void)cancelAutoUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v5 cancelAutoUnlock];

  if (v3) {
    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)requestRelock
{
  BOOL v3 = -[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL);
  if (v3)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
    [v6 requestRelock];
  }

  else
  {
    uint64_t v4 = auto_unlock_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Request relock Auto Unlock: This process does not have permission to perform this action",  buf,  2u);
    }

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v5 autoUnlockStateWithCompletionHandler:v4];

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

  else
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v10 = @"This process does not have permission to perform this action";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  111LL,  v7));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v8);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:", 0LL))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v5 authPromptInfoWithCompletionHandler:v4];

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

  else
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v10 = @"This process does not have permission to perform this action";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  111LL,  v7));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v8);

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }

- (void)notifyDelegate
{
  if ((objc_opt_respondsToSelector(self->_delegate, "unlockSessionDidFinish:") & 1) != 0) {
    -[SDUnlockXPCSesssionDelegate unlockSessionDidFinish:](self->_delegate, "unlockSessionDidFinish:", self);
  }
}

- (void)session:(id)a3 didReceiveKeyDeviceLocked:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  [v6 keyDeviceLocked:v5];
}

- (void)session:(id)a3 didEnableWithDevice:(id)a4
{
  id v11 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession enableDevice](self, "enableDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    [v9 enabledDevice:v11];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v10 unregisterObserver:self];

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)session:(id)a3 didFailToEnableDevice:(id)a4 error:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession enableDevice](self, "enableDevice"));
  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    [v12 failedToEnableDevice:v14 error:v7];

    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
    [v13 unregisterObserver:self];

    -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
  }
}

- (void)session:(id)a3 didBeginAttemptWithDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    int v10 = 138412290;
    unsigned int v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Began: Calling client proxy %@",  (uint8_t *)&v10,  0xCu);
  }

  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  [v9 beganAttemptWithDevice:v5];
}

- (void)session:(id)a3 didCompleteUnlockWithDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
    int v11 = 138412290;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Completed: Calling client proxy %@",  (uint8_t *)&v11,  0xCu);
  }

  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  [v9 completedUnlockWithDevice:v5];

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v10 unregisterObserver:self];

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)session:(id)a3 didFailUnlockWithResults:(id)a4 error:(id)a5 incrementedAttempt:(BOOL)a6
{
  id v7 = a5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession clientProxy](self, "clientProxy"));
  [v8 failedUnlockWithError:v7];

  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v9 unregisterObserver:self];

  -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
}

- (void)enableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 passcode:(id)a6 sessionID:(id)a7
{
  uint64_t v8 = authentications_log(self, a2, a3, a4, a5, a6, a7);
  NSErrorUserInfoKey v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "enableUsingClientProxy type:%lu",  (uint8_t *)&v10,  0xCu);
  }
}

- (BOOL)checkEntitlementWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v6 = [v5 _connectionHasEntitlement:@"com.apple.private.sharing.unlock-manager"];

  if ((v6 & 1) != 0)
  {
    uint64_t v9 = auto_unlock_log(v7);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockXPCSession bundleID](self, "bundleID"));
      int v17 = 138412290;
      int v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client bundle ID: %@", (uint8_t *)&v17, 0xCu);
    }
  }

  else
  {
    uint64_t v12 = paired_unlock_log(v7, v8);
    NSErrorUserInfoKey v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100087B44(self, v13);
    }

    if (v4)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v20 = @"This process does not have permission to perform this action";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SFUnlockErrorDomian",  111LL,  v14));
      v4[2](v4, 0LL, v15);

      -[SDUnlockXPCSession notifyDelegate](self, "notifyDelegate");
    }
  }

  return v6;
}

- (NSString)bundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _xpcConnection]);
    id v6 = sub_1001167C0(v5);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);

    if (!v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"application-identifier"]);
    }

    uint64_t v9 = self->_bundleID;
    self->_bundleID = v7;

    bundleID = self->_bundleID;
  }

  return bundleID;
}

- (SDUnlockXPCSesssionDelegate)delegate
{
  return (SDUnlockXPCSesssionDelegate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (SFUnlockClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (SFAutoUnlockDevice)enableDevice
{
  return self->_enableDevice;
}

- (void)setEnableDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end