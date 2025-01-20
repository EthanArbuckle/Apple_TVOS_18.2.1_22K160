@interface MSDMailProcessor
+ (id)sharedInstance;
- (BOOL)ack:(BOOL)a3;
- (BOOL)demodReady;
- (BOOL)fullKeysSent;
- (BOOL)isAllowedRequest:(id)a3 relayNeeded:(BOOL)a4;
- (BOOL)processRequest:(id)a3;
- (BOOL)updateManifestInfo:(id)a3 error:(id *)a4;
- (BOOL)waitingForCommand;
- (MSDMailProcessor)init;
- (MSDTargetDevice)device;
- (NSTimer)pingTimer;
- (id)fullKeyList;
- (id)pingWithType:(unint64_t)a3;
- (id)reducedKeyList;
- (int64_t)pingIntervalToUse;
- (unint64_t)convertPingType:(unint64_t)a3;
- (unint64_t)pingInterval;
- (unint64_t)queuedPingType;
- (void)handlePingTimerTicking:(id)a3;
- (void)pingAndProcess:(unint64_t)a3 waitForCompletion:(BOOL)a4;
- (void)reportBundleInstallCompleted;
- (void)reportCachingHubFailed;
- (void)reportS3ServerFailed;
- (void)sendImmediateDeviceInfoPing;
- (void)sendPushNotificationPing;
- (void)setDemodReady:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setFullKeysSent:(BOOL)a3;
- (void)setPingInterval:(unint64_t)a3;
- (void)setPingTimer:(id)a3;
- (void)setQueuedPingType:(unint64_t)a3;
- (void)setWaitingForCommand:(BOOL)a3;
- (void)start;
- (void)startPeriodicPing;
@end

@implementation MSDMailProcessor

+ (id)sharedInstance
{
  if (qword_100125568 != -1) {
    dispatch_once(&qword_100125568, &stru_1000FA858);
  }
  return (id)qword_100125560;
}

- (MSDMailProcessor)init
{
  id v3 = sub_10003AA3C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDMailProcessor init", buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDMailProcessor;
  v5 = -[MSDMailProcessor init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDMailProcessor setDemodReady:](v5, "setDemodReady:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    -[MSDMailProcessor setDevice:](v6, "setDevice:", v7);

    v8 = v6;
  }

  return v6;
}

- (void)start
{
  id v3 = sub_10003AA3C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDMailProcessor start", v11, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 hubHostName]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 hubPort]);

    if (v9)
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPushNotificationHandler sharedInstance]( &OBJC_CLASS___MSDPushNotificationHandler,  "sharedInstance"));
      [v10 enablePushNotifications];

      -[MSDMailProcessor setPingInterval:](self, "setPingInterval:", 30LL);
      -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 1LL, 0LL);
      -[MSDMailProcessor startPeriodicPing](self, "startPeriodicPing");
    }
  }

  else
  {
  }

- (void)reportCachingHubFailed
{
}

- (void)reportS3ServerFailed
{
}

- (void)reportBundleInstallCompleted
{
}

- (void)sendPushNotificationPing
{
}

- (void)sendImmediateDeviceInfoPing
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[MSDMailProcessor sendImmediateDeviceInfoPing]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s - Sending immediate device info ping.",  (uint8_t *)&v5,  0xCu);
  }

  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 8LL, 0LL);
}

- (void)startPeriodicPing
{
  id v3 = sub_10003AA3C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hubHostName]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hubPort]);
    *(_DWORD *)buf = 136315650;
    v12 = "-[MSDMailProcessor startPeriodicPing]";
    __int16 v13 = 2114;
    v14 = v6;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: serverAddress is %{public}@, serverPort is %{public}@.",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D0EC;
  block[3] = &unk_1000F96A8;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)handlePingTimerTicking:(id)a3
{
}

- (unint64_t)pingInterval
{
  return self->_pingInterval;
}

- (void)setPingInterval:(unint64_t)a3
{
  unint64_t pingInterval = self->_pingInterval;
  self->_unint64_t pingInterval = a3;
  id v5 = sub_10003AA3C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = self->_pingInterval;
    int v8 = 134217984;
    unint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Ping interval changed to %tu",  (uint8_t *)&v8,  0xCu);
  }

  if (pingInterval) {
    -[MSDMailProcessor startPeriodicPing](self, "startPeriodicPing");
  }
}

- (BOOL)waitingForCommand
{
  return self->_waitingForCommand;
}

- (void)setWaitingForCommand:(BOOL)a3
{
  if (self->_waitingForCommand != a3)
  {
    BOOL v3 = a3;
    self->_waitingForCommand = a3;
    unint64_t v5 = -[MSDMailProcessor pingIntervalToUse](self, "pingIntervalToUse");
    unint64_t v6 = -[MSDMailProcessor pingInterval](self, "pingInterval");
    if (v3)
    {
      if (v6 <= v5) {
        return;
      }
LABEL_6:
      -[MSDMailProcessor setPingInterval:](self, "setPingInterval:", v5);
      return;
    }

    if (v6 != v5) {
      goto LABEL_6;
    }
  }

- (void)pingAndProcess:(unint64_t)a3 waitForCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v5 = a3;
  if ((-[MSDMailProcessor queuedPingType](self, "queuedPingType") & a3) == 0)
  {
    if ((v5 & 8) != 0) {
      unint64_t v5 = 1LL;
    }
    -[MSDMailProcessor setQueuedPingType:]( self,  "setQueuedPingType:",  -[MSDMailProcessor queuedPingType](self, "queuedPingType") | v5);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007D400;
    v11[3] = &unk_1000FA880;
    v11[4] = self;
    v11[5] = v5;
    unint64_t v7 = objc_retainBlock(v11);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    unint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 pollingQueue]);
    id v10 = v9;
    if (v4) {
      dispatch_sync(v9, v7);
    }
    else {
      dispatch_async(v9, v7);
    }
  }

- (id)pingWithType:(unint64_t)a3
{
  id v5 = sub_10003AA3C();
  unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10009F274();
  }

  if (a3 - 1 <= 1)
  {
    if (-[MSDMailProcessor fullKeysSent](self, "fullKeysSent")) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor reducedKeyList](self, "reducedKeyList"));
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor fullKeyList](self, "fullKeyList"));
    }
    v12 = (void *)v7;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v86 = v12;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceInformationForPing:v12]);

    if (!v9)
    {
      id v63 = sub_10003AA3C();
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_10009EE6C(self, v64);
      }

      v18 = 0LL;
      __int16 v15 = 0LL;
      v34 = 0LL;
      v32 = 0LL;
      unint64_t v9 = 0LL;
      goto LABEL_51;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"InternalStatus"]);
    __int16 v15 = v14;
    if (v14
      && [v14 intValue] != 199
      && !-[MSDMailProcessor demodReady](self, "demodReady"))
    {
      -[MSDMailProcessor setDemodReady:](self, "setDemodReady:", 1LL);
      -[MSDMailProcessor setPingInterval:]( self,  "setPingInterval:",  -[MSDMailProcessor pingIntervalToUse](self, "pingIntervalToUse"));
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 hubSuppliedSettings]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"PingFrequency"]);

    if (v18
      && (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v19), (objc_opt_isKindOfClass(v18, v20) & 1) != 0)
      && [v18 unsignedIntegerValue])
    {
      id v21 = [v18 integerValue];
    }

    else
    {
      id v21 = -[MSDMailProcessor pingInterval](self, "pingInterval");
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v21));
    [v9 setObject:v22 forKey:@"MSDPingFrequency"];

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MSDMailProcessor convertPingType:](self, "convertPingType:", a3)));
    [v9 setObject:v23 forKey:@"MSDDemoPingType"];
    goto LABEL_25;
  }

  if (a3 == 32)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v24 getS3ServerFailureEventForPing]);

    if (v9)
    {
      id v10 = self;
      uint64_t v11 = 32LL;
      goto LABEL_24;
    }

    id v78 = sub_10003AA3C();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_10009F204(v70, v79, v80, v81, v82, v83, v84, v85);
    }
LABEL_72:

    v18 = 0LL;
    __int16 v15 = 0LL;
    v34 = 0LL;
    v32 = 0LL;
    unint64_t v9 = 0LL;
    v86 = 0LL;
    goto LABEL_51;
  }

  if (a3 == 16)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getCachingHubFailureEventForPing]);

    if (v9)
    {
      id v10 = self;
      uint64_t v11 = 16LL;
LABEL_24:
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MSDMailProcessor convertPingType:](v10, "convertPingType:", v11)));
      [v9 setObject:v23 forKey:@"MSDDemoPingType"];
      v18 = 0LL;
      __int16 v15 = 0LL;
      v86 = 0LL;
LABEL_25:

      goto LABEL_26;
    }

    id v69 = sub_10003AA3C();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_10009F194(v70, v71, v72, v73, v74, v75, v76, v77);
    }
    goto LABEL_72;
  }

  v18 = 0LL;
  __int16 v15 = 0LL;
  unint64_t v9 = 0LL;
  v86 = 0LL;
LABEL_26:
  if ((os_variant_has_internal_content("com.apple.mobilestoredemod") & 1) != 0)
  {
    id v25 = sub_10003A95C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10009F134();
    }
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"MSDExistingAccounts"]);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"iCloudRecoveryKey"]);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MSDExistingAccounts"]);
    [v28 setObject:@"<redacted>" forKeyedSubscript:@"iCloudRecoveryKey"];

    id v29 = sub_10003A95C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10009F134();
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MSDExistingAccounts"]);
    [v31 setObject:v26 forKeyedSubscript:@"iCloudRecoveryKey"];
  }

  v32 = objc_alloc_init(&OBJC_CLASS___MSDPingRequest);
  -[MSDPingRequest setRequestInfo:](v32, "setRequestInfo:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 handleRequestSync:v32]);

  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 error]);
  if (v35)
  {
    id v62 = sub_10003A95C();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_10009F0AC(v34, v53);
    }
    goto LABEL_50;
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v34 data]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v34 statusCode]);
  unsigned int v38 = [v37 intValue];

  if (!v36)
  {
    id v52 = sub_10003AA3C();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_10009EEF8(v53, v54, v55, v56, v57, v58, v59, v60);
    }
LABEL_50:

LABEL_51:
    id v49 = 0LL;
    id v47 = 0LL;
    v36 = 0LL;
LABEL_54:
    v51 = 0LL;
    goto LABEL_55;
  }

  if (a3 == 1 && (v38 & 0xFFFFFFFB) == 0xC8)
  {
    -[MSDMailProcessor setFullKeysSent:](self, "setFullKeysSent:", 1LL);
    if ([v15 intValue] == 20 || objc_msgSend(v15, "intValue") == 100)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", @"MSDExistingAccounts", v86));
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"iCloudCDPState"]);

      id v41 = [v40 integerValue];
      if (v41 == [&off_100106570 integerValue])
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 iCloudAccountRecoveryKey]);

        if (v43)
        {
          id v44 = sub_10003A95C();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "iCloud account recovery key successfully uploaded. Removing local copy...",  buf,  2u);
          }

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          [v46 saveiCloudAccountRecoveryKey:0];
        }
      }
    }
  }

  if (!objc_msgSend(v36, "length", v86))
  {
    id v49 = 0LL;
LABEL_53:
    id v47 = 0LL;
    goto LABEL_54;
  }

  id v87 = 0LL;
  id v47 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v36,  0LL,  &v87));
  id v49 = v87;
  if (!v47)
  {
    id v65 = sub_10003AA3C();
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_10009EF68(v49, (uint64_t)v36, v66);
    }

    goto LABEL_53;
  }

  uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary, v48);
  if ((objc_opt_isKindOfClass(v47, v50) & 1) == 0)
  {
    id v67 = sub_10003AA3C();
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_10009F03C();
    }

    goto LABEL_54;
  }

  id v47 = v47;
  v51 = v47;
LABEL_55:

  return v51;
}

- (BOOL)ack:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___MSDAckRequest);
  -[MSDAckRequest setStatus:](v4, "setStatus:", v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handleRequestSync:v4]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  LOBYTE(v5) = v7 == 0LL;

  return (char)v5;
}

- (id)fullKeyList
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"UniqueDeviceID",  @"MSDTotalStorageAvailable",  @"MSDPricingRequestUpdate",  @"BatteryCurrentCapacity",  @"BatteryIsCharging",  @"ExternalPowerSourceConnected",  @"MSDDemoContentStatus",  @"MSDDemoManualUpdateState",  @"MSDNetworkInterfacesEnabled",  @"MSDCurrentWiFiSSID",  @"MSDPersistentWiFiSSID",  @"MSDCellularConfiguration",  @"MSDHubSuppliedSettingsID",  @"MSDApnsKey",  @"MinOSVersionAvailable",  @"ProductVersion",  @"BuildVersion",  @"MSDDemoProductDescription",  @"MSDDemoLastRebootTime",  @"MSDDemoLastRevertTime",  @"MSDLastShallowRefreshTime",  @"MSDDemoSystemLanguage",  @"MSDDemoSystemRegion",  @"MSDDemoPreferencesLanguage",  @"MSDDemoPreferencesRegion",  @"IdleDuration",  0LL);
}

- (id)reducedKeyList
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"UniqueDeviceID",  @"MSDPricingRequestUpdate",  @"BatteryCurrentCapacity",  @"BatteryIsCharging",  @"ExternalPowerSourceConnected",  @"MSDDemoContentStatus",  @"MSDTotalStorageAvailable",  @"MSDDemoManualUpdateState",  @"MSDNetworkInterfacesEnabled",  @"MSDCurrentWiFiSSID",  @"MSDPersistentWiFiSSID",  @"MSDCellularConfiguration",  @"MSDHubSuppliedSettingsID",  @"MSDApnsKey",  @"MinOSVersionAvailable",  @"MSDLastShallowRefreshTime",  @"MSDDemoSystemLanguage",  @"MSDDemoSystemRegion",  @"MSDDemoPreferencesLanguage",  @"MSDDemoPreferencesRegion",  @"IdleDuration",  0LL);
}

- (BOOL)processRequest:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Command"]);
    BOOL v6 = -[MSDMailProcessor isAllowedRequest:relayNeeded:](self, "isAllowedRequest:relayNeeded:", v4, 0LL);
    -[MSDMailProcessor ack:](self, "ack:", v6);
    if (!v6)
    {
      id v102 = sub_10003AA3C();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_10009F3C0();
      }
      __int16 v13 = 0LL;
      id v15 = 0LL;
      v12 = 0LL;
      v119 = 0LL;
      goto LABEL_110;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Duration"]);
    v119 = v7;
    if (v7 && (int v8 = v7, (uint64_t)[v7 integerValue] >= 1))
    {
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)[v8 integerValue]));
      [v9 timeIntervalSinceReferenceDate];
      uint64_t v11 = (int)v10;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ContentType"]);
    if ([v12 containsObject:@"Demo"])
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ManifestInfo"]);
      id v120 = 0LL;
      unsigned __int8 v14 = -[MSDMailProcessor updateManifestInfo:error:](self, "updateManifestInfo:error:", v13, &v120);
      id v15 = v120;
      if ((v14 & 1) == 0)
      {
        id v103 = sub_10003A95C();
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10009F334(v15, v61);
        }
        goto LABEL_110;
      }

      v118 = v13;
      unsigned int v16 = 1;
    }

    else
    {
      v118 = 0LL;
      id v15 = 0LL;
      unsigned int v16 = 0;
    }

    else {
      uint64_t v18 = v16;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"BackgroundDownloadOnly"]);
    unsigned int v20 = [v19 BOOLValue];

    if ([v5 isEqualToString:@"UpdateContent"] && !v20
      || [v5 isEqualToString:@"UpdateOS"])
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 setCompletionTime:v11 reserveTimeForCleanup:1]);

      if (v22)
      {
        id v15 = (id)v22;
LABEL_71:
        __int16 v13 = v118;
LABEL_111:
        BOOL v17 = 0;
        goto LABEL_62;
      }

      id v15 = 0LL;
    }

    if (([v5 isEqualToString:@"ChangePingFrequency"] & 1) != 0
      || ([v5 isEqualToString:@"ChangeSettings"] & 1) != 0
      || ([v5 isEqualToString:@"HoldPowerAssertion"] & 1) != 0
      || ([v5 isEqualToString:@"LiftPowerAssertion"] & 1) != 0)
    {
      goto LABEL_117;
    }

    if ((([v5 isEqualToString:@"UpdateContent"] ^ 1 | v20) & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"OnlyInstallCriticalComponents"]);

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"OnlyInstallCriticalComponents"]);
        unsigned int v116 = [v24 BOOLValue];
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v25 setCriticalUpdatePrioritized:v116];
      }
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v27 = [v26 saveOperationRequest:v5 requestFlag:v18 completeBy:v11];

    if ((v27 & 1) != 0)
    {
LABEL_117:
      if ([v5 isEqualToString:@"UpdateContent"])
      {
        if ((v18 & 4) != 0)
        {
          id v38 = sub_10003A95C();
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Account update.", buf, 2u);
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          [v31 switchModeImmediately:2];
          goto LABEL_59;
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 manifestPath]);
        [v28 removeItemAtPath:v30 error:0];

        if (v20)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBackgroundDownload sharedInstance](&OBJC_CLASS___MSDBackgroundDownload, "sharedInstance"));
          [v31 kickOffBackgroundDownload];
          goto LABEL_59;
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
        [v40 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v41 setWaitingForCommand:0];

        -[MSDMailProcessor setWaitingForCommand:](self, "setWaitingForCommand:", 0LL);
        if ((v18 & 2) != 0)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          unsigned int v43 = [v42 mode];

          if (v43 == 5)
          {
            id v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            [v44 switchModeImmediately:2];
          }
        }

        v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
        if (([v45 macOS] & 1) == 0)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
          if (([v46 iOS] & 1) == 0)
          {

            goto LABEL_57;
          }
        }

        if ((_DWORD)v18 == 2)
        {
          id v47 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
          BOOL v17 = 1;
          [v47 setSwitchModeAfterCompletion:1];

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
          [v36 updateStage:17];
          goto LABEL_38;
        }

- (BOOL)isAllowedRequest:(id)a3 relayNeeded:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Command"]);
  if ([v6 isEqualToString:@"UpdateContent"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"ContentType"]);
    if ([v7 containsObject:@"Account"])
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      unsigned __int8 v9 = [v8 canStartAccountContentUpdate];
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"BackgroundDownloadOnly"]);
      unsigned int v12 = [v11 BOOLValue];

      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      int v8 = v13;
      if (v12) {
        unsigned __int8 v9 = [v13 canStartBackgroundDownload];
      }
      else {
        unsigned __int8 v9 = [v13 canStartContentUpdate];
      }
    }

    BOOL v14 = v9;

    goto LABEL_21;
  }

  if ([v6 isEqualToString:@"StopBackgroundDownload"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v10 = [v7 canStopBackgroundDownload];
LABEL_20:
    BOOL v14 = v10;
LABEL_21:

    goto LABEL_22;
  }

  if ([v6 isEqualToString:@"UpdateOS"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v10 = [v7 canStartOSUpdate];
    goto LABEL_20;
  }

  if ([v6 isEqualToString:@"TurnSnapshotON"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v10 = [v7 canLockSnapshot];
    goto LABEL_20;
  }

  if ([v6 isEqualToString:@"TurnSnapshotOFF"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v10 = [v7 canUnlockSnapshot];
    goto LABEL_20;
  }

  if ([v6 isEqualToString:@"RevertSnapshot"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v10 = [v7 canRevertSnapshot];
    goto LABEL_20;
  }

  if ([v6 isEqualToString:@"Virgin"])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"ObliterateDevice"]);
    id v16 = [v15 BOOLValue];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    unsigned __int8 v10 = [v7 canUnenrollWithObliteration:v16 consultDeviceOptions:0];
    goto LABEL_20;
  }

  if (([v6 isEqualToString:@"Restart"] & 1) != 0
    || ([v6 isEqualToString:@"ChangeSettings"] & 1) != 0)
  {
    BOOL v14 = 1;
  }

  else
  {
    if (([v6 isEqualToString:@"Shutdown"] & 1) == 0
      && ([v6 isEqualToString:@"HoldPowerAssertion"] & 1) == 0
      && ([v6 isEqualToString:@"LiftPowerAssertion"] & 1) == 0
      && ([v6 isEqualToString:@"MigrateToNewHub"] & 1) == 0
      && ([v6 isEqualToString:@"ChangePingFrequency"] & 1) == 0)
    {
      [v6 isEqualToString:@"ConfigScreenSaver"];
    }

    BOOL v14 = 0;
  }

- (int64_t)pingIntervalToUse
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hubSuppliedSettings]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PingFrequency"]);

  if (-[MSDMailProcessor waitingForCommand](self, "waitingForCommand"))
  {
    int64_t v7 = 30LL;
  }

  else if (v5 {
         && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v6), (objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  }
         && [v5 unsignedIntegerValue])
  {
    int64_t v7 = (int64_t)[v5 integerValue];
  }

  else
  {
    int64_t v7 = 600LL;
  }

  return v7;
}

- (BOOL)updateManifestInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileDownloadCredentials sharedInstance]( &OBJC_CLASS___MSDFileDownloadCredentials,  "sharedInstance"));
  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543362;
    id v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "receiveDict:%{public}@", (uint8_t *)&v28, 0xCu);
  }

  if (![v5 count])
  {
    id v17 = sub_10003A95C();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10009F450(v18, v19, v20, v21, v22, v23, v24, v25);
    }

    sub_100087610(a4, 3727740937LL, (uint64_t)@"No suitable demo content found.");
    unsigned __int8 v10 = 0LL;
    goto LABEL_15;
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Ready"]);
  if (!v10
    || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) == 0)
    || ([v10 BOOLValue] & 1) == 0)
  {
    sub_100087610(a4, 3727740939LL, (uint64_t)@"Hub still downloading contents. Please wait.");
LABEL_15:
    id v12 = 0LL;
    goto LABEL_16;
  }

  id v12 = [v5 mutableCopy];
  [v12 removeObjectForKey:@"Ready"];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = [v13 count];

  if (!v14)
  {
    id v26 = sub_10003A95C();
    unsigned __int8 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10009F4C0();
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    goto LABEL_16;
  }

  if (([v6 updateWithResponseFromGetManifestInfo:v12] & 1) == 0)
  {
LABEL_16:
    BOOL v15 = 0;
    goto LABEL_10;
  }

  BOOL v15 = 1;
LABEL_10:

  return v15;
}

- (unint64_t)convertPingType:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
  unsigned int v5 = [v4 isNPIDevice];

  if (v5) {
    return a3 | 0x40;
  }
  else {
    return a3;
  }
}

- (NSTimer)pingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPingTimer:(id)a3
{
}

- (BOOL)fullKeysSent
{
  return self->_fullKeysSent;
}

- (void)setFullKeysSent:(BOOL)a3
{
  self->_fullKeysSent = a3;
}

- (unint64_t)queuedPingType
{
  return self->_queuedPingType;
}

- (void)setQueuedPingType:(unint64_t)a3
{
  self->_queuedPingType = a3;
}

- (BOOL)demodReady
{
  return self->_demodReady;
}

- (void)setDemodReady:(BOOL)a3
{
  self->_demodReady = a3;
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end