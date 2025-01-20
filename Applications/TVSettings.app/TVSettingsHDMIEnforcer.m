@interface TVSettingsHDMIEnforcer
- (AVOutputDeviceDiscoverySession)discoverySession;
- (BOOL)didDisableEARC;
- (BOOL)didDiscoverHDMI;
- (BOOL)isCurrentOutputDeviceHDMI;
- (BOOL)setHDMICancelled;
- (HMMediaDestination)preferredMediaDestination;
- (NSArray)preferredOutputDevices;
- (NSMutableArray)availablePreferredOutputDevices;
- (NSString)mediaDestinationDeviceID;
- (TVSettingsHDMIEnforcer)initWithCompletion:(id)a3;
- (double)enforcementTimeout;
- (id)completion;
- (id)currentOutputDevices;
- (void)_updateAvailableOutputDevices:(id)a3;
- (void)cancel;
- (void)completeWithError:(id)a3;
- (void)disableEARC;
- (void)disableOdeon;
- (void)discoverySessionDidChangeAvailableOutputDevices;
- (void)eARCStatusChanged:(int64_t)a3;
- (void)enforceHDMIOutput;
- (void)finishWaitingForEARCToDisable;
- (void)finishWaitingForHMDI;
- (void)outputDevicesDidChange;
- (void)reenableEARCIfNecessary;
- (void)relinquishHDMIEnforcement;
- (void)setAvailablePreferredOutputDevices:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDidDisableEARC:(BOOL)a3;
- (void)setDidDiscoverHDMI:(BOOL)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setMediaDestinationDeviceID:(id)a3;
- (void)setPreferredMediaDestination:(id)a3;
- (void)setPreferredOutputDevices:(id)a3;
- (void)setSetHDMICancelled:(BOOL)a3;
- (void)startWaitingForHDMI;
@end

@implementation TVSettingsHDMIEnforcer

- (TVSettingsHDMIEnforcer)initWithCompletion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsHDMIEnforcer;
  v5 = -[TVSettingsHDMIEnforcer init](&v11, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = v6;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B36A0;
    block[3] = &unk_10018E440;
    v10 = v5;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v5;
}

- (id)currentOutputDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVOutputContext sharedAudioPresentationOutputContext]( &OBJC_CLASS___AVOutputContext,  "sharedAudioPresentationOutputContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 outputDevices]);

  return v3;
}

- (double)enforcementTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHDMIEnforcer preferredMediaDestination](self, "preferredMediaDestination"));
  if (v2) {
    double v3 = 20.0;
  }
  else {
    double v3 = 5.0;
  }

  return v3;
}

- (BOOL)isCurrentOutputDeviceHDMI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHDMIEnforcer currentOutputDevices](self, "currentOutputDevices"));
  if ([v2 count] == (id)1)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
    if ([v3 deviceType] == (id)4)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
      BOOL v5 = [v4 deviceSubType] == (id)8;
    }

    else
    {
      BOOL v5 = 0;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)enforceHDMIOutput
{
  if (-[TVSettingsHDMIEnforcer isCurrentOutputDeviceHDMI](self, "isCurrentOutputDeviceHDMI"))
  {
    id v3 = sub_1000B3B30();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "HDMI is already the selected output device. No need to enforce.",  buf,  2u);
    }

    -[TVSettingsHDMIEnforcer completeWithError:](self, "completeWithError:", 0LL);
  }

  else
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
    id v6 = (char *)[v5 eARCStatus] - 1;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHDMIEnforcer currentOutputDevices](self, "currentOutputDevices"));
    -[TVSettingsHDMIEnforcer setPreferredOutputDevices:](self, "setPreferredOutputDevices:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localAccessory]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hmAccessory]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 audioDestinationController]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 destination]);
    -[TVSettingsHDMIEnforcer setPreferredMediaDestination:](self, "setPreferredMediaDestination:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHDMIEnforcer preferredMediaDestination](self, "preferredMediaDestination"));
    if (v13)
    {
      v30 = v6;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v14 = v7;
      id v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v32;
        while (2)
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 airPlayProperties]);
            unsigned int v21 = objc_msgSend(v20, "tvs_BOOLForKey:defaultValue:", @"IsLocalDevice", 0);

            if (![v19 deviceType])
            {
              unsigned int v22 = [v19 deviceSubType] == (id)15 ? v21 : 0;
              if (v22 == 1)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceID]);
                -[TVSettingsHDMIEnforcer setMediaDestinationDeviceID:](self, "setMediaDestinationDeviceID:", v23);

                goto LABEL_20;
              }
            }
          }

          id v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

- (void)startWaitingForHDMI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3BC8;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)finishWaitingForHMDI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3E64;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)cancel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3F68;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)completeWithError:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B4034;
  v4[3] = &unk_10018E468;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)disableOdeon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B40DC;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)disableEARC
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B42F4;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)finishWaitingForEARCToDisable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
  [v3 removeEARCObserver:self];

  -[NSTimer invalidate](self->_waitForEARCTimeout, "invalidate");
  waitForEARCTimeout = self->_waitForEARCTimeout;
  self->_waitForEARCTimeout = 0LL;

  -[TVSettingsHDMIEnforcer disableOdeon](self, "disableOdeon");
}

- (void)reenableEARCIfNecessary
{
  if (self->_didDisableEARC)
  {
    id v3 = sub_1000B3B30();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Re-enabling eARC...", v6, 2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
    [v5 enableEARC:1];

    self->_didDisableEARC = 0;
  }

- (void)eARCStatusChanged:(int64_t)a3
{
  id v5 = sub_1000B3B30();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "eARC status changed to %ld", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B46F8;
  v7[3] = &unk_10018EE18;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(&_dispatch_main_q, v7);
}

- (void)discoverySessionDidChangeAvailableOutputDevices
{
  id v3 = sub_1000B3B30();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[AVOutputDeviceDiscoverySession availableOutputDevices]( self->_discoverySession,  "availableOutputDevices"));
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Available Output Devices Did Change: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[AVOutputDeviceDiscoverySession availableOutputDevices]( self->_discoverySession,  "availableOutputDevices"));
  -[TVSettingsHDMIEnforcer _updateAvailableOutputDevices:](self, "_updateAvailableOutputDevices:", v6);
}

- (void)_updateAvailableOutputDevices:(id)a3
{
  id v5 = [a3 copy];
  id v6 = v5;
  if (!self->_didDiscoverHDMI)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000B4958;
    v20[3] = &unk_1001938A8;
    v20[4] = self;
    [v5 enumerateObjectsUsingBlock:v20];
  }

  id v7 = sub_1000B3B30();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating Preferred Available Output Devices",  buf,  2u);
  }

  int64_t v9 = self;
  objc_sync_enter(v9);
  availablePreferredOutputDevices = v9->_availablePreferredOutputDevices;
  v9->_availablePreferredOutputDevices = 0LL;

  objc_super v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v12 = v9->_availablePreferredOutputDevices;
  v9->_availablePreferredOutputDevices = v11;

  preferredOutputDevices = v9->_preferredOutputDevices;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B4A84;
  v15[3] = &unk_1001938F8;
  id v14 = v6;
  id v16 = v14;
  uint64_t v17 = v9;
  SEL v18 = a2;
  -[NSArray enumerateObjectsUsingBlock:](preferredOutputDevices, "enumerateObjectsUsingBlock:", v15);

  objc_sync_exit(v9);
}

- (void)outputDevicesDidChange
{
  id v3 = sub_1000B3B30();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHDMIEnforcer currentOutputDevices](self, "currentOutputDevices"));
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Output Devices Did Change: %{public}@",  buf,  0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4E14;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)relinquishHDMIEnforcement
{
  id v3 = sub_1000B3B30();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Relinquishing HDMI Enforcement...", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4EFC;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (AVOutputDeviceDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (NSArray)preferredOutputDevices
{
  return self->_preferredOutputDevices;
}

- (void)setPreferredOutputDevices:(id)a3
{
}

- (NSMutableArray)availablePreferredOutputDevices
{
  return self->_availablePreferredOutputDevices;
}

- (void)setAvailablePreferredOutputDevices:(id)a3
{
}

- (HMMediaDestination)preferredMediaDestination
{
  return self->_preferredMediaDestination;
}

- (void)setPreferredMediaDestination:(id)a3
{
}

- (NSString)mediaDestinationDeviceID
{
  return self->_mediaDestinationDeviceID;
}

- (void)setMediaDestinationDeviceID:(id)a3
{
}

- (BOOL)didDiscoverHDMI
{
  return self->_didDiscoverHDMI;
}

- (void)setDidDiscoverHDMI:(BOOL)a3
{
  self->_didDiscoverHDMI = a3;
}

- (BOOL)setHDMICancelled
{
  return self->_setHDMICancelled;
}

- (void)setSetHDMICancelled:(BOOL)a3
{
  self->_setHDMICancelled = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)didDisableEARC
{
  return self->_didDisableEARC;
}

- (void)setDidDisableEARC:(BOOL)a3
{
  self->_didDisableEARC = a3;
}

- (void).cxx_destruct
{
}

@end