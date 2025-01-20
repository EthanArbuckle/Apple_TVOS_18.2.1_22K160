@interface IDSDaemonCapabilities
+ (id)sharedInstance;
- (IDSDaemonCapabilities)init;
- (MGNotificationTokenStruct)MGVeniceChangedToken;
- (int)supportedServicesToken;
- (void)_deferredUpdateCapabilities;
- (void)_listenForMGChanges;
- (void)_setupTokens;
- (void)_updateCapabilities;
- (void)carrierBundleInformationDidChange;
- (void)dealloc;
- (void)setMGVeniceChangedToken:(MGNotificationTokenStruct *)a3;
- (void)setSupportedServicesToken:(int)a3;
@end

@implementation IDSDaemonCapabilities

+ (id)sharedInstance
{
  if (qword_1009C0618 != -1) {
    dispatch_once(&qword_1009C0618, &stru_1008FE000);
  }
  return (id)qword_1009C0620;
}

- (IDSDaemonCapabilities)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSDaemonCapabilities;
  v2 = -[IDSDaemonCapabilities init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
    [v3 addListener:v2];

    -[IDSDaemonCapabilities _setupTokens](v2, "_setupTokens");
    -[IDSDaemonCapabilities _listenForMGChanges](v2, "_listenForMGChanges");
    -[IDSDaemonCapabilities _updateCapabilities](v2, "_updateCapabilities");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSDaemonCapabilities;
  -[IDSDaemonCapabilities dealloc](&v3, "dealloc");
}

- (void)_updateCapabilities
{
  unsigned int v3 = sub_10020B740(@"AllowiMessage", (id)1);
  unsigned int v4 = sub_10020B740(@"AllowsFaceTimeAudio", 0LL);
  int v5 = MGGetBoolAnswer(@"green-tea");
  int v6 = MGGetBoolAnswer(@"venice");
  int v7 = v6;
  int v8 = v4 | v5 ^ 1;
  uint64_t v9 = v3 | 2LL;
  if ((v8 & 1) == 0) {
    uint64_t v9 = v3;
  }
  uint64_t v10 = v9 | 4;
  if (v6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v3;
  }
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = @"NO";
    if (v3) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    int v20 = 138413058;
    v21 = v14;
    if ((v7 & v8) != 0) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    __int16 v22 = 2112;
    v23 = v15;
    if (v7) {
      v13 = @"YES";
    }
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Posting iMessage allowed value from IDSDaemonCapabilities { allowiMessage: %@, allowFaceTimeAudio: %@, allowFaceTi meMultiway: %@, supportedServicesFlags: %llu }",  (uint8_t *)&v20,  0x2Au);
  }

  notify_set_state(self->_supportedServicesToken, v11);
  v17 = (const char *)IMUserScopedNotification(FTServiceStatusNotifyRegister, v16);
  notify_post(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTServiceStatus sharedInstance](&OBJC_CLASS___FTServiceStatus, "sharedInstance"));
  [v18 _reload];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  [v19 _updateCapabilities];
}

- (void)_listenForMGChanges
{
  if (!-[IDSDaemonCapabilities MGVeniceChangedToken](self, "MGVeniceChangedToken"))
  {
    unsigned int v4 = @"venice";
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10020B970;
    v3[3] = &unk_1008FE028;
    v3[4] = self;
    -[IDSDaemonCapabilities setMGVeniceChangedToken:]( self,  "setMGVeniceChangedToken:",  MGRegisterForUpdates( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL),  0LL,  0LL,  v3));
  }

- (void)_setupTokens
{
  unsigned int v3 = (const char *)IMUserScopedNotification(FTServiceStatusNotifyRegister, a2);
  notify_register_check(v3, &self->_supportedServicesToken);
}

- (void)carrierBundleInformationDidChange
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "IDSDaemonCapabilities received bundle info did change callback -- updating capabilities",  v4,  2u);
  }

  -[IDSDaemonCapabilities _deferredUpdateCapabilities](self, "_deferredUpdateCapabilities");
}

- (void)_deferredUpdateCapabilities
{
  dispatch_time_t v3 = dispatch_time(0LL, 1000000000LL);
  uint64_t v5 = im_primary_queue(v3, v4);
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10020BB74;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_after(v3, v6, block);
}

- (int)supportedServicesToken
{
  return self->_supportedServicesToken;
}

- (void)setSupportedServicesToken:(int)a3
{
  self->_supportedServicesToken = a3;
}

- (MGNotificationTokenStruct)MGVeniceChangedToken
{
  return self->_MGVeniceChangedToken;
}

- (void)setMGVeniceChangedToken:(MGNotificationTokenStruct *)a3
{
  self->_MGVeniceChangedToken = a3;
}

@end