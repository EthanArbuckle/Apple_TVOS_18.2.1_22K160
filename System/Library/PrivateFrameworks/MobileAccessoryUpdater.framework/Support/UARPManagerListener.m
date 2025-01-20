@interface UARPManagerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (UARPManagerListener)initWithManager:(id)a3 dispatchQueue:(id)a4;
- (void)addAccessoryID:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5 reply:(id)a6;
- (void)changeAssetLocation:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5 reply:(id)a6;
- (void)checkForUpdate:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3 reply:(id)a4;
- (void)downloadFirmwareForAccessoryID:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5 reply:(id)a6;
- (void)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4 reply:(id)a5;
- (void)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3 reply:(id)a4;
- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)firmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)getAssetIDForAccessoryID:(id)a3 reply:(id)a4;
- (void)getAttestationCertificates:(id)a3 assetID:(id)a4 reply:(id)a5;
- (void)getAttestationCertificates:(id)a3 reply:(id)a4;
- (void)getSandboxExtensionTokenForAssetID:(id)a3 reply:(id)a4;
- (void)getSupplementalAssetNameForAccessoryID:(id)a3 reply:(id)a4;
- (void)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5 reply:(id)a6;
- (void)getSupportedAccessories:(id)a3 reply:(id)a4;
- (void)manifestPropertiesReceivedForAccessoryID:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)personalizationVectorForAccessoryID:(id)a3 assetTag:(id)a4 reply:(id)a5;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)removeAccessoryID:(id)a3 reply:(id)a4;
- (void)requestConsent:(id)a3 reply:(id)a4;
- (void)revokeConsentRequest:(id)a3 reply:(id)a4;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5 reply:(id)a6;
@end

@implementation UARPManagerListener

- (UARPManagerListener)initWithManager:(id)a3 dispatchQueue:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UARPManagerListener;
  v6 = -[UARPManagerListener init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_manager = (UARPManager *)a3;
    v6->_internalQueue = (OS_dispatch_queue *)a4;
    v6->_xpcLog = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accessoryupdater.uarp");
    v7->_listener = v8;
    -[NSXPCListener setDelegate:](v8, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_listener, "resume");
  }

  return v7;
}

- (void)dealloc
{
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPManagerListener;
  -[UARPManagerListener dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000220C0;
  block[3] = &unk_100075548;
  block[4] = self;
  block[5] = a4;
  block[6] = &v8;
  dispatch_sync(internalQueue, block);
  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v5 = [a3 valueForEntitlement:@"com.apple.accessoryupdater.uarp"];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v5, v6) & 1) != 0 && ([v5 BOOLValue])
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    BOOL v7 = os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      sub_100048410(a3);
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5 reply:(id)a6
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    v15 = "-[UARPManagerListener addAccessoryID:assetID:sandboxExtensionToken:reply:]";
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", (uint8_t *)&v14, 0x20u);
  }

  int64_t v12 = -[UARPManager addAccessory:assetID:sandboxExtensionToken:]( self->_manager,  "addAccessory:assetID:sandboxExtensionToken:",  a3,  a4,  a5);
  if (v12) {
    v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v12,  0LL);
  }
  else {
    v13 = 0LL;
  }
  (*((void (**)(id, NSError *))a6 + 2))(a6, v13);
}

- (void)removeAccessoryID:(id)a3 reply:(id)a4
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    char v11 = "-[UARPManagerListener removeAccessoryID:reply:]";
    __int16 v12 = 2112;
    id v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@", (uint8_t *)&v10, 0x16u);
  }

  int64_t v8 = -[UARPManager removeAccessory:](self->_manager, "removeAccessory:", a3);
  if (v8) {
    v9 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v8,  0LL);
  }
  else {
    v9 = 0LL;
  }
  (*((void (**)(id, NSError *))a4 + 2))(a4, v9);
}

- (void)changeAssetLocation:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5 reply:(id)a6
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    v15 = "-[UARPManagerListener changeAssetLocation:assetID:sandboxExtensionToken:reply:]";
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", (uint8_t *)&v14, 0x20u);
  }

  int64_t v12 = -[UARPManager changeAssetLocation:assetID:sandboxExtensionToken:]( self->_manager,  "changeAssetLocation:assetID:sandboxExtensionToken:",  a3,  a4,  a5);
  if (v12) {
    id v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v12,  0LL);
  }
  else {
    id v13 = 0LL;
  }
  (*((void (**)(id, NSError *))a6 + 2))(a6, v13);
}

- (void)downloadFirmwareForAccessoryID:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    v15 = "-[UARPManagerListener downloadFirmwareForAccessoryID:assetID:userIntent:reply:]";
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a4;
    __int16 v20 = 2112;
    v21 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7);
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@ %@, userIntent=%@",  (uint8_t *)&v14,  0x2Au);
  }

  int64_t v12 = -[UARPManager downloadFirmwareForAccessory:assetID:userIntent:]( self->_manager,  "downloadFirmwareForAccessory:assetID:userIntent:",  a3,  a4,  v7);
  if (v12) {
    id v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v12,  0LL);
  }
  else {
    id v13 = 0LL;
  }
  (*((void (**)(id, NSError *))a6 + 2))(a6, v13);
}

- (void)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4 reply:(id)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "-[UARPManagerListener downloadReleaseNotesForAccessoryID:assetID:reply:]";
    __int16 v14 = 2112;
    id v15 = a3;
    __int16 v16 = 2112;
    id v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", (uint8_t *)&v12, 0x20u);
  }

  int64_t v10 = -[UARPManager downloadReleaseNotesForAccessoryID:assetID:]( self->_manager,  "downloadReleaseNotesForAccessoryID:assetID:",  a3,  a4);
  if (v10) {
    char v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v10,  0LL);
  }
  else {
    char v11 = 0LL;
  }
  (*((void (**)(id, NSError *))a5 + 2))(a5, v11);
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[UARPManagerListener firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:]";
    __int16 v14 = 2112;
    id v15 = a3;
    __int16 v16 = 2112;
    id v17 = a4;
    __int16 v18 = 2048;
    unint64_t v19 = a5;
    __int16 v20 = 2048;
    unint64_t v21 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@ %@, bytesSent=%lu, bytesTotal=%lu",  (uint8_t *)&v12,  0x34u);
  }

  -[UARPManager firmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:]( self->_manager,  "firmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:",  a3,  a4,  a5,  a6);
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    char v11 = "-[UARPManagerListener stagingCompleteForAccessoryID:assetID:status:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2112;
    id v15 = a4;
    __int16 v16 = 2080;
    uint64_t v17 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@ %@ status=%s",  (uint8_t *)&v10,  0x2Au);
  }

  -[UARPManager stagingCompleteForAccessoryID:assetID:status:]( self->_manager,  "stagingCompleteForAccessoryID:assetID:status:",  a3,  a4,  a5);
}

- (void)firmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    char v11 = "-[UARPManagerListener firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, bytesSent=%lu, bytesTotal=%lu",  (uint8_t *)&v10,  0x2Au);
  }

  -[UARPManager firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:]( self->_manager,  "firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:",  a3,  a4,  a5);
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    char v11 = "-[UARPManagerListener progressForUARPConsent:bytesSent:bytesTotal:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, bytesSent=%lu, bytesTotal=%lu",  (uint8_t *)&v10,  0x2Au);
  }

  -[UARPManager progressForUARPConsent:bytesSent:bytesTotal:]( self->_manager,  "progressForUARPConsent:bytesSent:bytesTotal:",  a3,  a4,  a5);
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    char v11 = "-[UARPManagerListener progressForUARPConsentInPostLogout:bytesSent:bytesTotal:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, bytesSent=%lu, bytesTotal=%lu",  (uint8_t *)&v10,  0x2Au);
  }

  -[UARPManager progressForUARPConsentInPostLogout:bytesSent:bytesTotal:]( self->_manager,  "progressForUARPConsentInPostLogout:bytesSent:bytesTotal:",  a3,  a4,  a5);
}

- (void)checkForUpdate:(id)a3 reply:(id)a4
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    char v11 = "-[UARPManagerListener checkForUpdate:reply:]";
    __int16 v12 = 2112;
    id v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@", (uint8_t *)&v10, 0x16u);
  }

  int64_t v8 = -[UARPManager checkForUpdate:](self->_manager, "checkForUpdate:", a3);
  if (v8) {
    v9 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v8,  0LL);
  }
  else {
    v9 = 0LL;
  }
  (*((void (**)(id, NSError *))a4 + 2))(a4, v9);
}

- (void)personalizationVectorForAccessoryID:(id)a3 assetTag:(id)a4 reply:(id)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v12 = 136315650;
    *(void *)&v12[4] = "-[UARPManagerListener personalizationVectorForAccessoryID:assetTag:reply:]";
    __int16 v13 = 2112;
    id v14 = a3;
    __int16 v15 = 1024;
    unsigned int v16 = [a4 unsignedIntValue];
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@, assetTag 0x%08x", v12, 0x1Cu);
  }

  *(_DWORD *)__int16 v12 = 0;
  int64_t v10 = -[UARPManager personalizationVectorForAccessoryID:assetTag:outVector:]( self->_manager,  "personalizationVectorForAccessoryID:assetTag:outVector:",  a3,  objc_msgSend(a4, "unsignedIntValue", *(void *)v12),  v12);
  if (v10) {
    char v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v10,  0LL);
  }
  else {
    char v11 = 0LL;
  }
  (*((void (**)(id, NSError *, void))a5 + 2))(a5, v11, *(unsigned int *)v12);
}

- (void)manifestPropertiesReceivedForAccessoryID:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    char v11 = "-[UARPManagerListener manifestPropertiesReceivedForAccessoryID:assetTag:properties:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2112;
    id v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, assetTag 0x%08x %@",  (uint8_t *)&v10,  0x26u);
  }

  -[UARPManager manifestPropertiesReceivedForAccessoryID:assetTag:properties:]( self->_manager,  "manifestPropertiesReceivedForAccessoryID:assetTag:properties:",  a3,  v6,  a5);
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    char v11 = "-[UARPManagerListener sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2112;
    id v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", (uint8_t *)&v10, 0x20u);
  }

  -[UARPManager sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:]( self->_manager,  "sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:",  a3,  a4,  a5);
}

- (void)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5 reply:(id)a6
{
  int64_t v7 = -[UARPManager updateProperty:value:forAccessory:]( self->_manager,  "updateProperty:value:forAccessory:",  a3,  a4,  a5);
  if (v7) {
    int64_t v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v7,  0LL);
  }
  else {
    int64_t v8 = 0LL;
  }
  (*((void (**)(id, NSError *))a6 + 2))(a6, v8);
}

- (void)getAssetIDForAccessoryID:(id)a3 reply:(id)a4
{
  id v7 = -[UARPManager copyAssetIDForAccessoryID:](self->_manager, "copyAssetIDForAccessoryID:");
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "-[UARPManagerListener getAssetIDForAccessoryID:reply:]";
    __int16 v11 = 2112;
    id v12 = a3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, returning %@",  (uint8_t *)&v9,  0x20u);
  }

  (*((void (**)(id, id))a4 + 2))(a4, v7);
}

- (void)getSupplementalAssetNameForAccessoryID:(id)a3 reply:(id)a4
{
  id v7 = -[UARPManager getSupplementalAssetNameForAccessoryID:](self->_manager, "getSupplementalAssetNameForAccessoryID:");
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "-[UARPManagerListener getSupplementalAssetNameForAccessoryID:reply:]";
    __int16 v11 = 2112;
    id v12 = a3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, returning %@",  (uint8_t *)&v9,  0x20u);
  }

  (*((void (**)(id, id))a4 + 2))(a4, v7);
}

- (void)getSupportedAccessories:(id)a3 reply:(id)a4
{
  id v7 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  BOOL v8 = -[UARPManager getFetchedSupportedAccessories:forProductGroup:]( self->_manager,  "getFetchedSupportedAccessories:forProductGroup:",  v7,  a3);
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
  {
    id v10 = [v7 count];
    __int16 v11 = @"NO";
    __int16 v13 = "-[UARPManagerListener getSupportedAccessories:reply:]";
    __int16 v14 = 2048;
    int v12 = 136315906;
    id v15 = v10;
    __int16 v16 = 2112;
    if (v8) {
      __int16 v11 = @"YES";
    }
    id v17 = a3;
    __int16 v18 = 2112;
    unint64_t v19 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_ERROR,  "RECEIVED %s: returning %lu records for %@ isComplete %@",  (uint8_t *)&v12,  0x2Au);
  }

  (*((void (**)(id, id, BOOL))a4 + 2))(a4, v7, v8);
}

- (void)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5 reply:(id)a6
{
  int64_t v7 = -[UARPManager getSupportedAccessories:assetID:batchRequest:]( self->_manager,  "getSupportedAccessories:assetID:batchRequest:",  a3,  a4,  a5);
  if (v7) {
    BOOL v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v7,  0LL);
  }
  else {
    BOOL v8 = 0LL;
  }
  (*((void (**)(id, NSError *))a6 + 2))(a6, v8);
}

- (void)getAttestationCertificates:(id)a3 reply:(id)a4
{
  id v7 = -[UARPManager getAttestationCertificates:](self->_manager, "getAttestationCertificates:");
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[UARPManagerListener getAttestationCertificates:reply:]";
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: returning %@ for %@",  (uint8_t *)&v9,  0x20u);
  }

  (*((void (**)(id, id))a4 + 2))(a4, v7);
}

- (void)getAttestationCertificates:(id)a3 assetID:(id)a4 reply:(id)a5
{
  int64_t v6 = -[UARPManager getAttestationCertificates:assetID:](self->_manager, "getAttestationCertificates:assetID:", a3, a4);
  if (v6) {
    id v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v6,  0LL);
  }
  else {
    id v7 = 0LL;
  }
  (*((void (**)(id, NSError *))a5 + 2))(a5, v7);
}

- (void)requestConsent:(id)a3 reply:(id)a4
{
  int64_t v5 = -[UARPManager requestConsent:](self->_manager, "requestConsent:", a3);
  if (v5) {
    int64_t v6 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v5,  0LL);
  }
  else {
    int64_t v6 = 0LL;
  }
  (*((void (**)(id, NSError *))a4 + 2))(a4, v6);
}

- (void)revokeConsentRequest:(id)a3 reply:(id)a4
{
  int64_t v5 = -[UARPManager revokeConsentRequest:](self->_manager, "revokeConsentRequest:", a3);
  if (v5) {
    int64_t v6 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v5,  0LL);
  }
  else {
    int64_t v6 = 0LL;
  }
  (*((void (**)(id, NSError *))a4 + 2))(a4, v6);
}

- (void)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3 reply:(id)a4
{
  int64_t v5 = -[UARPManager enableTRMSystemAuthenticationForRegistryEntryID:]( self->_manager,  "enableTRMSystemAuthenticationForRegistryEntryID:",  a3);
  if (v5) {
    int64_t v6 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v5,  0LL);
  }
  else {
    int64_t v6 = 0LL;
  }
  (*((void (**)(id, NSError *))a4 + 2))(a4, v6);
}

- (void)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3 reply:(id)a4
{
  int64_t v5 = -[UARPManager disableTRMSystemAuthenticationForRegistryEntryID:]( self->_manager,  "disableTRMSystemAuthenticationForRegistryEntryID:",  a3);
  if (v5) {
    int64_t v6 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  v5,  0LL);
  }
  else {
    int64_t v6 = 0LL;
  }
  (*((void (**)(id, NSError *))a4 + 2))(a4, v6);
}

- (void)getSandboxExtensionTokenForAssetID:(id)a3 reply:(id)a4
{
  id v7 = +[UARPSandboxExtension readWriteTokenStringWithURL:]( UARPSandboxExtension,  "readWriteTokenStringWithURL:",  [a3 localURL]);
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[UARPManagerListener getSandboxExtensionTokenForAssetID:reply:]";
    __int16 v11 = 2112;
    id v12 = a3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@, returning %@",  (uint8_t *)&v9,  0x20u);
  }

  (*((void (**)(id, id))a4 + 2))(a4, v7);
}

@end