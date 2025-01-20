@interface MCUEAPlugin
- (CoreTelephonyClient)coreTelephonyClient;
- (MCUEAPlugin)init;
- (id)_descriptionForContext:(id)a3;
- (id)_positionLabelForContext:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)install;
- (void)preferredDataSimChanged:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation MCUEAPlugin

- (id)_descriptionForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin coreTelephonyClient](self, "coreTelephonyClient"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin coreTelephonyClient](self, "coreTelephonyClient"));
    id v20 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getPhoneNumber:v4 error:&v20]);
    id v8 = v20;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin coreTelephonyClient](self, "coreTelephonyClient"));
    id v19 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getSimLabel:v4 error:&v19]);
    id v11 = v19;

    if (v8) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 MCVerboseDescription]);
    }
    else {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v7));
    }
    v14 = (__CFString *)v12;
    if (v11) {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 MCVerboseDescription]);
    }
    else {
      uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v10));
    }
    v13 = (__CFString *)v15;
  }

  else
  {
    v13 = @"CoreTelephony client not initialized";
    v14 = @"CoreTelephony client not initialized";
  }

  v21[0] = @"Position";
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin _positionLabelForContext:](self, "_positionLabelForContext:", v4));
  v22[0] = v16;
  v22[1] = v14;
  v21[1] = @"Phone Number";
  v21[2] = @"Sim Label";
  v22[2] = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));

  return v17;
}

- (id)_positionLabelForContext:(id)a3
{
  v3 = (char *)[a3 slotID];
  id v4 = @"unknown";
  if (v3 == (_BYTE *)&dword_0 + 2) {
    id v4 = @"2";
  }
  if (v3 == (_BYTE *)&dword_0 + 1) {
    return @"1";
  }
  else {
    return v4;
  }
}

- (MCUEAPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCUEAPlugin;
  v2 = -[MCUEAPlugin init](&v6, "init");
  if (v2)
  {
    MCLoggingInitialize();
    v3 = (os_log_s *)_MCLogObjects[3];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "MCUEAPlugin initialized.", v5, 2u);
    }
  }

  return v2;
}

- (void)install
{
  v3 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: starting", buf, 2u);
  }

  id v4 = -[CoreTelephonyClient initWithQueue:]( objc_alloc(&OBJC_CLASS___CoreTelephonyClient),  "initWithQueue:",  &_dispatch_main_q);
  -[MCUEAPlugin setCoreTelephonyClient:](self, "setCoreTelephonyClient:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin coreTelephonyClient](self, "coreTelephonyClient"));
  [v5 setDelegate:self];

  objc_super v6 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: created CoreTelephonyClient", v12, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_2208,  @"com.apple.mobile.keybagd.lock_status",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v8 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "MCUEAinstall: registered for lock status change notification",  v11,  2u);
  }

  v9 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: done", v10, 2u);
  }

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)_MCLogObjects[3];
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin _positionLabelForContext:](self, "_positionLabelForContext:", v6));
    *(_DWORD *)uint64_t v15 = 138543618;
    *(void *)&v15[4] = v10;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "MCUEA-CT: simStatusDidChange, %{public}@, status=%{public}@",  v15,  0x16u);
  }

  if ([v7 isEqualToString:kCTSIMSupportSIMStatusReady])
  {
    id v11 = (os_log_s *)_MCLogObjects[3];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      uint64_t v12 = "MCUEA-CT: SIM is now ready.";
LABEL_9:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v12, v15, 2u);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  unsigned int v13 = [v7 isEqualToString:kCTSIMSupportSIMStatusNotInserted];
  id v11 = (os_log_s *)_MCLogObjects[3];
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[3], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      uint64_t v12 = "MCUEA-CT: SIM has been removed.";
      goto LABEL_9;
    }

- (void)carrierBundleChange:(id)a3
{
  v3 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "MCUEA-CT: New carrier bundle detected.", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v4 checkCarrierProfile];
}

- (void)preferredDataSimChanged:(id)a3
{
  v5 = (void *)_MCLogObjects[3];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCUEAPlugin _descriptionForContext:](self, "_descriptionForContext:", a3));
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "MCUEA-CT: User data preference changed to: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v8 checkCarrierProfile];
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end