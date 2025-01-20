@interface TransportRestrictedModeService
- (TransportRestrictedModeService)initWithNotificationQueue:(id)a3;
- (int)entryPoint_onDaemonStarted;
- (int)entryPoint_onDaemonStarted_inBaseSystem;
- (int)entryPoint_onXPCEventWithName:(id)a3;
- (int)fetchFromKextAndSaveToFileWithKey:(unsigned int)a3;
- (int)loadFromFileAndPushToKextWithKey:(unsigned int)a3;
- (int)onDeviceLostStatusChanged;
- (int)onKextNotificationArrivedWithPropertyName:(id)a3;
- (int)onManagedConfigurationChanged;
- (int)onSaveData:(id *)a3;
- (int)onScheduleWakeup:(id *)a3;
- (int)prepareDataDir;
- (int)purgeLegacyFiles;
- (int)sendNotificationACKWithPropertyName:(id)a3;
- (void)cancelAlarm;
- (void)entryPoint_onAlarm;
- (void)handleXPCEventWithName:(id)a3;
- (void)setAlarm:(double)a3;
- (void)start;
@end

@implementation TransportRestrictedModeService

- (TransportRestrictedModeService)initWithNotificationQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransportRestrictedModeService;
  v3 = -[DaemonService initWithNotificationQueue:](&v9, "initWithNotificationQueue:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DaemonService notificationQueue](v3, "notificationQueue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000030B4;
    handler[3] = &unk_1000182D0;
    v8 = v4;
    xpc_set_event_stream_handler("com.apple.alarm", v5, handler);
  }

  return v4;
}

- (void)start
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    v4 = "ACMTRM-D";
    __int16 v5 = 2080;
    v6 = "-[TransportRestrictedModeService start]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, .\n",  (uint8_t *)&v3,  0x16u);
  }

  if (sub_100002398()) {
    -[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]( self,  "entryPoint_onDaemonStarted_inBaseSystem");
  }
  else {
    -[TransportRestrictedModeService entryPoint_onDaemonStarted](self, "entryPoint_onDaemonStarted");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    v4 = "ACMTRM-D";
    __int16 v5 = 2080;
    v6 = "-[TransportRestrictedModeService start]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, .\n",  (uint8_t *)&v3,  0x16u);
  }

- (void)handleXPCEventWithName:(id)a3
{
}

- (int)prepareDataDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/root/Library/TRM/"];

  if ((v3 & 1) != 0) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v7 = 0LL;
  [v4 createDirectoryAtPath:@"/var/root/Library/TRM/" withIntermediateDirectories:1 attributes:0 error:&v7];
  uint64_t v5 = v7;

  if (!v5) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v9 = "ACMTRM-D";
    __int16 v10 = 2080;
    v11 = "-[TransportRestrictedModeService prepareDataDir]";
    __int16 v12 = 2048;
    uint64_t v13 = -5LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  buf,  0x20u);
  }

  return -5;
}

- (int)purgeLegacyFiles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/var/root/Library/TRM/analytics"));
  [v2 removeItemAtPath:v3 error:0];

  return 0;
}

- (int)entryPoint_onDaemonStarted_inBaseSystem
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "ACMTRM-D";
    __int16 v6 = 2080;
    uint64_t v7 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, .\n",  (uint8_t *)&v4,  0x16u);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "ACMTRM-D";
    __int16 v6 = 2080;
    uint64_t v7 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: acmd started in BaseSystem, handing control over to kext.\n",  (uint8_t *)&v4,  0x16u);
  }

  int v2 = ACMKernelControl(33, 0LL, 0LL, 0LL);
  if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    uint64_t v5 = "ACMTRM-D";
    __int16 v6 = 2080;
    uint64_t v7 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted_inBaseSystem]";
    __int16 v8 = 2048;
    uint64_t v9 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v4,  0x20u);
  }

  return v2;
}

- (int)entryPoint_onDaemonStarted
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "ACMTRM-D";
    __int16 v15 = 2080;
    v16 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, .\n",  buf,  0x16u);
  }

  unsigned int v3 = -[TransportRestrictedModeService prepareDataDir](self, "prepareDataDir");
  if (v3
    || (unsigned int v3 = -[TransportRestrictedModeService purgeLegacyFiles](self, "purgeLegacyFiles")) != 0
    || (unsigned int v3 = -[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]( self,  "loadFromFileAndPushToKextWithKey:",  1LL)) != 0 || (unsigned int v3 = -[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]( self,  "loadFromFileAndPushToKextWithKey:",  2LL)) != 0 || (unsigned int v3 = -[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]( self,  "loadFromFileAndPushToKextWithKey:",  3LL)) != 0 || (unsigned int v3 = -[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]( self,  "loadFromFileAndPushToKextWithKey:",  4LL)) != 0)
  {
    int v8 = v3;
LABEL_17:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "ACMTRM-D";
      __int16 v15 = 2080;
      v16 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted]";
      __int16 v17 = 2048;
      v18 = (const char *)v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  buf,  0x20u);
    }

    return v8;
  }

  __int16 v10 = 1;
  int v4 = sub_1000022D0();
  char v11 = v4;
  int v5 = sub_100002334();
  char v12 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v14 = "ACMTRM-D";
    __int16 v15 = 2080;
    v16 = "-[TransportRestrictedModeService entryPoint_onDaemonStarted]";
    __int16 v6 = "YES";
    __int16 v17 = 2080;
    if (v4) {
      uint64_t v7 = "YES";
    }
    else {
      uint64_t v7 = "NO";
    }
    v18 = "YES";
    if (!v5) {
      __int16 v6 = "NO";
    }
    __int16 v19 = 2080;
    v20 = "NO";
    __int16 v21 = 2080;
    v22 = v7;
    __int16 v23 = 2080;
    v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: acmd started, handing control over to kext (TRM allowed by ManagedConfiguration: %s, disabled by AppleSetu p: %s, isInternalBuild: %s, isUSBTypeCSupported: %s).\n",  buf,  0x3Eu);
  }

  int v8 = ACMKernelControl(3, &v10, 4uLL, 0LL);
  if (v8) {
    goto LABEL_17;
  }
  return v8;
}

- (int)entryPoint_onXPCEventWithName:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "ACMTRM-D";
    __int16 v10 = 2080;
    char v11 = "-[TransportRestrictedModeService entryPoint_onXPCEventWithName:]";
    __int16 v12 = 2080;
    id v13 = [v4 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, eventName=%s.\n",  (uint8_t *)&v8,  0x20u);
  }

  if (![v4 isEqualToString:@"ACMTRMEvent_SaveData"]
    && ![v4 isEqualToString:@"ACMTRMEvent_CheckAppleSetup"])
  {
    if ([v4 isEqualToString:@"AppleSetupCookieChanged"]
      && (sub_100002398() & 1) == 0)
    {
      unsigned int v5 = sub_100003A58((uint64_t)"cookie");
      goto LABEL_8;
    }

- (int)sendNotificationACKWithPropertyName:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "ACMTRM-D";
    __int16 v15 = 2080;
    v16 = "-[TransportRestrictedModeService sendNotificationACKWithPropertyName:]";
    __int16 v17 = 2080;
    id v18 = [v3 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: [COM] SENDING ACK %s.\n",  buf,  0x20u);
  }

  char v19 = 0;
  id v4 = v3;
  strncpy((char *)buf, (const char *)[v4 UTF8String], 0x3FuLL);
  int v5 = 0;
  if (ACMKernelControl(7, buf, 0x40uLL, 0LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      int v8 = "ACMTRM-D";
      __int16 v9 = 2080;
      __int16 v10 = "-[TransportRestrictedModeService sendNotificationACKWithPropertyName:]";
      __int16 v11 = 2048;
      uint64_t v12 = -5LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v7,  0x20u);
    }

    int v5 = -5;
  }

  return v5;
}

- (int)onKextNotificationArrivedWithPropertyName:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000250C(v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (![v6 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      id v13 = "ACMTRM-D";
      __int16 v14 = 2080;
      __int16 v15 = "-[TransportRestrictedModeService onKextNotificationArrivedWithPropertyName:]";
      __int16 v16 = 2080;
      id v17 = [v4 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: [COM] IGNORING EMPTY %s.\n",  (uint8_t *)&v12,  0x20u);
    }

    goto LABEL_14;
  }

  if ([v6 length] != (id)12)
  {
    int v10 = -5;
    goto LABEL_19;
  }

  int v7 = (int *)[v6 bytes];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "ACMTRM-D";
    __int16 v14 = 2080;
    __int16 v15 = "-[TransportRestrictedModeService onKextNotificationArrivedWithPropertyName:]";
    __int16 v16 = 2080;
    id v17 = [v4 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: [COM] PROCESSING %s.\n",  (uint8_t *)&v12,  0x20u);
  }

  int v8 = *v7;
  if (*v7 == 3)
  {
    unsigned int v9 = sub_100003A58((uint64_t)"kext");
    if (v9) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }

  if (v8 == 2)
  {
    unsigned int v9 = -[TransportRestrictedModeService onSaveData:](self, "onSaveData:", v7);
    if (v9) {
      goto LABEL_9;
    }
LABEL_13:
    -[TransportRestrictedModeService sendNotificationACKWithPropertyName:]( self,  "sendNotificationACKWithPropertyName:",  v4);
LABEL_14:
    int v10 = 0;
    goto LABEL_15;
  }

  if (v8 == 1)
  {
    unsigned int v9 = -[TransportRestrictedModeService onScheduleWakeup:](self, "onScheduleWakeup:", v7);
    if (v9)
    {
LABEL_9:
      int v10 = v9;
      goto LABEL_19;
    }

    goto LABEL_13;
  }

  int v10 = -3;
LABEL_19:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "ACMTRM-D";
    __int16 v14 = 2080;
    __int16 v15 = "-[TransportRestrictedModeService onKextNotificationArrivedWithPropertyName:]";
    __int16 v16 = 2048;
    id v17 = (id)v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v12,  0x20u);
  }

- (int)onManagedConfigurationChanged
{
  int v2 = byte_10001C350;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315906;
    id v3 = "NO";
    int v6 = "ACMTRM-D";
    __int16 v7 = 2080;
    int v8 = "-[TransportRestrictedModeService onManagedConfigurationChanged]";
    __int16 v9 = 2080;
    if (!v2) {
      id v3 = "YES";
    }
    uint64_t v10 = (uint64_t)"YES";
    __int16 v11 = 2080;
    int v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: TRM allowed by ManagedConfiguration: %s (willPublish=%s).\n",  (uint8_t *)&v5,  0x2Au);
  }

  if ((v2 & 1) != 0) {
    return 0;
  }
  int v5 = 1;
  LOBYTE(v6) = 1;
  int result = ACMKernelControl(6, &v5, 5uLL, 0LL);
  if (result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315650;
      int v6 = "ACMTRM-D";
      __int16 v7 = 2080;
      int v8 = "-[TransportRestrictedModeService onManagedConfigurationChanged]";
      __int16 v9 = 2048;
      uint64_t v10 = -5LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v5,  0x20u);
    }

    return -5;
  }

  else
  {
    byte_10001C350 = 1;
  }

  return result;
}

- (int)onDeviceLostStatusChanged
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315650;
    id v4 = "ACMTRM-D";
    __int16 v5 = 2080;
    int v6 = "-[TransportRestrictedModeService onDeviceLostStatusChanged]";
    __int16 v7 = 2080;
    int v8 = "NO";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: lostModeIsActive = %s.\n",  (uint8_t *)&v3,  0x20u);
  }

  return 0;
}

- (int)onScheduleWakeup:(id *)a3
{
  unint64_t v3 = *(void *)(&a3->var0 + 1);
  if (v3) {
    -[TransportRestrictedModeService setAlarm:](self, "setAlarm:", (double)v3);
  }
  else {
    -[TransportRestrictedModeService cancelAlarm](self, "cancelAlarm");
  }
  return 0;
}

- (int)loadFromFileAndPushToKextWithKey:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    id v17 = "ACMTRM-D";
    __int16 v18 = 2080;
    char v19 = "-[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]";
    __int16 v20 = 1024;
    LODWORD(v21) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, key=%u.\n",  (uint8_t *)&v16,  0x1Cu);
  }

  unsigned int v4 = a3 - 1;
  if (a3 - 1 <= 3)
  {
    __int16 v5 = (&off_100018310)[v4];
    int v6 = (&off_1000182F0)[v4];
    id v7 = sub_100002530((uint64_t)v5);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    __int16 v9 = v8;
    if (!v8 || ![v8 length])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315650;
        id v17 = "ACMTRM-D";
        __int16 v18 = 2080;
        char v19 = "-[TransportRestrictedModeService loadFromFileAndPushToKextWithKey:]";
        __int16 v20 = 2080;
        uint64_t v21 = (uint64_t)v5;
        id v13 = "%s: %s: '%s' not loaded.\n";
        uint32_t v14 = 32;
        goto LABEL_11;
      }

- (int)fetchFromKextAndSaveToFileWithKey:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint32_t v14 = "ACMTRM-D";
    __int16 v15 = 2080;
    int v16 = "-[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]";
    __int16 v17 = 1024;
    LODWORD(v18) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, key=%u.\n",  (uint8_t *)&v13,  0x1Cu);
  }

  unsigned int v4 = a3 - 1;
  if (a3 - 1 > 3)
  {
    int v11 = -5;
  }

  else
  {
    __int16 v5 = (&off_100018310)[v4];
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (&off_100018330)[v4]));
    id v7 = sub_10000250C(v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (!v8 || ![v8 length])
    {
LABEL_9:

      return 0;
    }

    int v9 = sub_100002634(v5, v8, 0);
    if (!v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        unsigned int v10 = [v8 length];
        int v13 = 136315906;
        uint32_t v14 = "ACMTRM-D";
        __int16 v15 = 2080;
        int v16 = "-[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]";
        __int16 v17 = 2080;
        __int16 v18 = v5;
        __int16 v19 = 1024;
        unsigned int v20 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: '%s' saved (len=%u).\n",  (uint8_t *)&v13,  0x26u);
      }

      goto LABEL_9;
    }

    int v11 = v9;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint32_t v14 = "ACMTRM-D";
    __int16 v15 = 2080;
    int v16 = "-[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]";
    __int16 v17 = 2048;
    __int16 v18 = (const char *)v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v13,  0x20u);
  }

  return v11;
}

- (int)onSaveData:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    unsigned int var1 = a3->var1;
    int v9 = 136315650;
    unsigned int v10 = "ACMTRM-D";
    __int16 v11 = 2080;
    unsigned int v12 = "-[TransportRestrictedModeService onSaveData:]";
    __int16 v13 = 1024;
    LODWORD(v14) = var1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, (gen=%u).\n",  (uint8_t *)&v9,  0x1Cu);
  }

  unsigned int v6 = -[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]( self,  "fetchFromKextAndSaveToFileWithKey:",  1LL);
  if (v6
    || (unsigned int v6 = -[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]( self,  "fetchFromKextAndSaveToFileWithKey:",  2LL)) != 0 || (unsigned int v6 = -[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]( self,  "fetchFromKextAndSaveToFileWithKey:",  3LL)) != 0)
  {
    int v7 = v6;
  }

  else
  {
    int v7 = -[TransportRestrictedModeService fetchFromKextAndSaveToFileWithKey:]( self,  "fetchFromKextAndSaveToFileWithKey:",  4LL);
    if (!v7) {
      return v7;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    unsigned int v10 = "ACMTRM-D";
    __int16 v11 = 2080;
    unsigned int v12 = "-[TransportRestrictedModeService onSaveData:]";
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v9,  0x20u);
  }

  return v7;
}

- (void)setAlarm:(double)a3
{
  unint64_t v4 = (unint64_t)a3;
  unint64_t v5 = sub_100002294();
  unint64_t v6 = v5 + 30;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = "NO";
    int v9 = 136316418;
    unsigned int v10 = "ACMTRM-D";
    __int16 v11 = 2080;
    unsigned int v12 = "-[TransportRestrictedModeService setAlarm:]";
    if (v6 < v4) {
      int v7 = "YES";
    }
    __int16 v13 = 2048;
    unint64_t v14 = v4;
    __int16 v15 = 2080;
    int v16 = v7;
    __int16 v17 = 2048;
    unint64_t v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = 30LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: requestedAlarmTime=%llu willSchedule=%s (now=%llu threshold=%llus).\n",  (uint8_t *)&v9,  0x3Eu);
  }

  if (v6 < v4)
  {
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_date(v8, "Date", (uint64_t)(a3 * 1000000000.0));
    xpc_set_event("com.apple.alarm", "com.apple.acmd.alarm", v8);
  }

- (void)cancelAlarm
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    unint64_t v3 = "ACMTRM-D";
    __int16 v4 = 2080;
    unint64_t v5 = "-[TransportRestrictedModeService cancelAlarm]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, .\n",  (uint8_t *)&v2,  0x16u);
  }

  xpc_set_event("com.apple.alarm", "com.apple.acmd.alarm", 0LL);
}

- (void)entryPoint_onAlarm
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    unint64_t v3 = "ACMTRM-D";
    __int16 v4 = 2080;
    unint64_t v5 = "-[TransportRestrictedModeService entryPoint_onAlarm]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called, wake-up alarm triggered.\n",  (uint8_t *)&v2,  0x16u);
  }

  ACMKernelControl(30, 0LL, 0LL, 0LL);
}

@end