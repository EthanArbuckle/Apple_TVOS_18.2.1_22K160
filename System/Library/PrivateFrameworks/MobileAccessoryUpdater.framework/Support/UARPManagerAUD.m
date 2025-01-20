@interface UARPManagerAUD
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)handleXPCStreamEvent:(id)a3;
- (BOOL)isBusy;
- (UARPManagerAUD)initWithQueue:(id)a3;
- (id)personalizationHelperQueryPendingTssRequests:(id)a3;
- (int64_t)addAccessory:(id)a3 assetID:(id)a4;
- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)removeAccessory:(id)a3;
- (int64_t)requestConsent:(id)a3;
- (int64_t)revokeConsentRequest:(id)a3;
- (void)assetAvailabilityUpdateForAccessory:(id)a3 assetID:(id)a4;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dealloc;
- (void)dumpState;
- (void)firmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)firmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)handlePeriodicLaunch;
- (void)notifyAttestationCertificatesAvailable:(id)a3 forSubjectKeyIdentifer:(id)a4;
- (void)personalizationHelperTssResponse:(id)a3 updaterName:(id)a4;
- (void)postConsentUpdateCompleteNotification:(id)a3 success:(BOOL)a4;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)start:(BOOL)a3;
- (void)supplementalAssetAvailabilityUpdateForAccessory:(id)a3 assetName:(id)a4;
- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
@end

@implementation UARPManagerAUD

- (UARPManagerAUD)initWithQueue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPManagerAUD;
  v4 = -[UARPManager init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)a3;
    v4->_listener = -[UARPManagerListener initWithManager:dispatchQueue:]( objc_alloc(&OBJC_CLASS___UARPManagerListener),  "initWithManager:dispatchQueue:",  v4,  v4->_dispatchQueue);
    v5->_observerListener = 0LL;
    if (MGGetBoolAnswer(@"InternalBuild", v6)) {
      v5->_observerListener = -[UARPObserverListener initWithManager:dispatchQueue:]( objc_alloc(&OBJC_CLASS___UARPObserverListener),  "initWithManager:dispatchQueue:",  v5,  v5->_dispatchQueue);
    }
    v5->_updaterManager = -[UARPUpdaterServiceManager initWithQueue:]( objc_alloc(&OBJC_CLASS___UARPUpdaterServiceManager),  "initWithQueue:",  v5->_dispatchQueue);
    v5->_personalizationManager = -[UARPPersonalizationManager initWithMachServiceName:entitlement:delegate:queue:]( objc_alloc(&OBJC_CLASS___UARPPersonalizationManager),  "initWithMachServiceName:entitlement:delegate:queue:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.uarppersonalization"),  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.uarppersonalization"),  v5,  v5->_dispatchQueue);
    v5->_standaloneCommandListener = -[UARPStandaloneCommandManagerListener initWithManager:dispatchQueue:]( objc_alloc(&OBJC_CLASS___UARPStandaloneCommandManagerListener),  "initWithManager:dispatchQueue:",  v5,  v5->_dispatchQueue);
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPManagerAUD;
  -[UARPManager dealloc](&v3, "dealloc");
}

- (void)assetAvailabilityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026C9C;
  block[3] = &unk_100074F50;
  block[4] = a3;
  dispatch_sync(dispatchQueue, block);
}

- (void)supplementalAssetAvailabilityUpdateForAccessory:(id)a3 assetName:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[UARPManagerAUD supplementalAssetAvailabilityUpdateForAccessory:assetName:]";
    __int16 v11 = 2112;
    id v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RECEIVED %s Asset Name is %@",  buf,  0x16u);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026DB8;
  block[3] = &unk_100074F50;
  block[4] = a3;
  dispatch_sync(dispatchQueue, block);
}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026E2C;
  block[3] = &unk_100074F50;
  block[4] = a4;
  dispatch_sync(dispatchQueue, block);
}

- (void)notifyAttestationCertificatesAvailable:(id)a3 forSubjectKeyIdentifer:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026EE4;
  block[3] = &unk_100074F50;
  block[4] = a4;
  dispatch_sync(dispatchQueue, block);
}

- (void)start:(BOOL)a3
{
  if (a3)
  {
    objc_msgSend( +[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"),  "removeAllActiveAccessories");
    sub_1000039D4(0LL, 0);
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002700C;
    v7[3] = &unk_100074F50;
    v7[4] = self;
    v5 = v7;
  }

  else
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100027020;
    v6[3] = &unk_100074F50;
    v6[4] = self;
    v5 = v6;
  }

  dispatch_sync(dispatchQueue, v5);
}

- (BOOL)handleXPCStreamEvent:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UARPManagerAUD handleXPCStreamEvent:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x2020000000LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027150;
  block[3] = &unk_100075858;
  void block[5] = a3;
  block[6] = &buf;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v6 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);
  _Block_object_dispose(&buf, 8);
  return v6;
}

- (void)handlePeriodicLaunch
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002721C;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dumpState
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy.MM.dd_kk-mm-ssZ");
  objc_msgSend( +[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"),  "dumpToFile:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/fud_uarp_db_state_%@.txt",  sub_10003BF64(),  -[NSDateFormatter stringFromDate:](v3, "stringFromDate:", +[NSDate date](NSDate, "date"))));
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPManagerAUD;
  -[UARPManager dumpState](&v4, "dumpState");
}

- (int64_t)requestConsent:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[UARPManagerAUD requestConsent:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v6,  0xCu);
  }

  if (!-[UARPUpdaterServiceManager consentDisabledForUARPConsent:sendConsent:]( self->_updaterManager,  "consentDisabledForUARPConsent:sendConsent:",  a3,  1LL)) {
    return (int64_t)-[UARPConsent requestConsent:](self->_consentManager, "requestConsent:", a3);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004A108(a3);
  }
  notify_post("com.apple.uarp.disabledConsent.start");
  return 0LL;
}

- (void)postConsentUpdateCompleteNotification:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  uint32_t v5 = notify_register_check("com.apple.uarp.disabledConsent.complete", &out_token);
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004A180(v6);
    }
  }

  else
  {
    notify_set_state(out_token, v4);
    notify_post("com.apple.uarp.disabledConsent.complete");
  }

- (int64_t)revokeConsentRequest:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[UARPManagerAUD revokeConsentRequest:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v6,  0xCu);
  }

  if (!-[UARPUpdaterServiceManager consentDisabledForUARPConsent:sendConsent:]( self->_updaterManager,  "consentDisabledForUARPConsent:sendConsent:",  a3,  0LL)) {
    return (int64_t)-[UARPConsent revokeConsentRequest:](self->_consentManager, "revokeConsentRequest:", a3);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004A20C(a3);
  }
  -[UARPManagerAUD postConsentUpdateCompleteNotification:success:]( self,  "postConsentUpdateCompleteNotification:success:",  a3,  0LL);
  return 0LL;
}

- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[UARPManagerAUD enableTRMSystemAuthenticationForRegistryEntryID:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v6,  0xCu);
  }

  return -[UARPUpdaterServiceManager enableTRMSystemAuthenticationForRegistryEntryID:]( self->_updaterManager,  "enableTRMSystemAuthenticationForRegistryEntryID:",  a3) ^ 1;
}

- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[UARPManagerAUD disableTRMSystemAuthenticationForRegistryEntryID:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v6,  0xCu);
  }

  return -[UARPUpdaterServiceManager disableTRMSystemAuthenticationForRegistryEntryID:]( self->_updaterManager,  "disableTRMSystemAuthenticationForRegistryEntryID:",  a3) ^ 1;
}

- (void)consentReceived:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    objc_super v8 = "-[UARPManagerAUD consentReceived:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  buf,  0xCu);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000277E8;
  v6[3] = &unk_1000754A8;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    objc_super v8 = "-[UARPManagerAUD consentReceivedPostLogoutMode:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  buf,  0xCu);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000278E8;
  v6[3] = &unk_1000754A8;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
}

- (void)firmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[UARPManagerAUD firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v9,  0xCu);
  }

  -[UARPConsent firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:]( self->_consentManager,  "firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:",  a3,  a4,  a5);
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[UARPManagerAUD progressForUARPConsent:bytesSent:bytesTotal:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = -[UARPConsent updateCompleteForUARPConsent:bytesSent:bytesTotal:]( self->_consentManager,  "updateCompleteForUARPConsent:bytesSent:bytesTotal:",  a3,  a4,  a5);
  if (-[UARPUpdaterServiceManager bypassProgressForUARPConsent:sendConsent:]( self->_updaterManager,  "bypassProgressForUARPConsent:sendConsent:",  a3,  v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004A284(a3);
      if (!(_DWORD)v9) {
        return;
      }
    }

    else if (!(_DWORD)v9)
    {
      return;
    }

    if ([a3 installerProgressError]) {
      -[UARPManagerAUD postConsentUpdateCompleteNotification:success:]( self,  "postConsentUpdateCompleteNotification:success:",  a3,  0LL);
    }
  }

  else
  {
    -[UARPConsent progressForUARPConsent:bytesSent:bytesTotal:]( self->_consentManager,  "progressForUARPConsent:bytesSent:bytesTotal:",  a3,  a4,  a5);
  }

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[UARPManagerAUD progressForUARPConsentInPostLogout:bytesSent:bytesTotal:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v9,  0xCu);
  }

  if (-[UARPUpdaterServiceManager consentDisabledForUARPConsent:sendConsent:]( self->_updaterManager,  "consentDisabledForUARPConsent:sendConsent:",  a3,  0LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004A308(a3);
    }
    if (-[UARPConsent updateCompleteForUARPConsentInPostLogout:bytesSent:bytesTotal:]( self->_consentManager,  "updateCompleteForUARPConsentInPostLogout:bytesSent:bytesTotal:",  a3,  a4,  a5)) {
      -[UARPManagerAUD postConsentUpdateCompleteNotification:success:]( self,  "postConsentUpdateCompleteNotification:success:",  a3,  1LL);
    }
  }

  else
  {
    -[UARPConsent progressForUARPConsentInPostLogout:bytesSent:bytesTotal:]( self->_consentManager,  "progressForUARPConsentInPostLogout:bytesSent:bytesTotal:",  a3,  a4,  a5);
  }

- (BOOL)isBusy
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100027D10;
  v5[3] = &unk_1000751E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[UARPManagerAUD dynamicAssetSolicitation:modelNumber:notifyService:]",  v10,  2u);
  }

  return -[UARPUpdaterServiceManager dynamicAssetSolicitation:modelNumber:notifyService:]( self->_updaterManager,  "dynamicAssetSolicitation:modelNumber:notifyService:",  a3,  a4,  a5);
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[UARPManagerAUD dynamicAssetSolicitation:modelNumbers:notifyService:]",  v10,  2u);
  }

  return -[UARPUpdaterServiceManager dynamicAssetSolicitation:modelNumbers:notifyService:]( self->_updaterManager,  "dynamicAssetSolicitation:modelNumbers:notifyService:",  a3,  a4,  a5);
}

- (id)personalizationHelperQueryPendingTssRequests:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperQueryPendingTssRequests:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s",  (uint8_t *)&v7,  0xCu);
  }

  id v5 = -[UARPUpdaterServiceManager queryPendingTssRequestsForUpdater:]( self->_updaterManager,  "queryPendingTssRequestsForUpdater:",  a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperQueryPendingTssRequests:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: pending responses %@",  (uint8_t *)&v7,  0x16u);
  }

  return v5;
}

- (void)personalizationHelperTssResponse:(id)a3 updaterName:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperTssResponse:updaterName:]";
    __int16 v9 = 2112;
    id v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: tss response for updater %@",  (uint8_t *)&v7,  0x16u);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperTssResponse:updaterName:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: tss response %@",  (uint8_t *)&v7,  0x16u);
  }

  -[UARPUpdaterServiceManager tssResponse:updaterName:](self->_updaterManager, "tssResponse:updaterName:", a3, a4);
}

- (int64_t)addAccessory:(id)a3 assetID:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v10 = "-[UARPManagerAUD addAccessory:assetID:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  buf,  0xCu);
  }

  -[UARPObserverListener addAccessoryID:assetID:](self->_observerListener, "addAccessoryID:assetID:", a3, a4);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPManagerAUD;
  return -[UARPManager addAccessory:assetID:](&v8, "addAccessory:assetID:", a3, a4);
}

- (int64_t)removeAccessory:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    objc_super v8 = "-[UARPManagerAUD removeAccessory:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  buf,  0xCu);
  }

  -[UARPObserverListener removeAccessoryID:](self->_observerListener, "removeAccessoryID:", a3);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPManagerAUD;
  return -[UARPManager removeAccessory:](&v6, "removeAccessory:", a3);
}

- (void)firmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[UARPManagerAUD firmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v11,  0xCu);
  }

  -[UARPObserverListener firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:]( self->_observerListener,  "firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:",  a3,  a4,  a5,  a6);
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[UARPManagerAUD stagingCompleteForAccessoryID:assetID:status:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: RECEIVED",  (uint8_t *)&v9,  0xCu);
  }

  -[UARPObserverListener stagingCompleteForAccessoryID:assetID:status:]( self->_observerListener,  "stagingCompleteForAccessoryID:assetID:status:",  a3,  a4,  a5);
}

  ;
}

@end