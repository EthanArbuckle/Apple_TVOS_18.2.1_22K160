@interface EAFirmwareUpdater
+ (id)appProtocolStringWithEAID:(id)a3;
+ (id)bootloaderProtocolStringWithEAID:(id)a3;
+ (id)findAccessoryWithProtocolString:(id)a3 serialNum:(id)a4;
+ (id)getEAFirmwareRevisionActive:(id)a3 forProtocol:(id)a4;
+ (id)getEAFirmwareRevisionPending:(id)a3 forProtocol:(id)a4;
+ (id)multiAssetAppProtocolStringWithEAID:(id)a3;
- (BOOL)closeEASession;
- (BOOL)excludeUniqueAccessoryCheck;
- (BOOL)findAccessory;
- (BOOL)forceSilentUpdate;
- (BOOL)isDeploymentAllowed:(id)a3;
- (BOOL)isMultiAssetSession;
- (BOOL)isRestartRequired;
- (BOOL)isSleepWakeRequired;
- (BOOL)isUrgentUpdate;
- (BOOL)overrideProtocol;
- (BOOL)skipDFUMode;
- (BOOL)stitchManifestInSuperBinary:(id)a3 withManifest:(id)a4 withId:(unsigned int)a5;
- (BOOL)updateRequiresPersonalization;
- (BOOL)updateRequiresSuperBinary;
- (EAAccessory)accessory;
- (EAFirmwareUpdater)initWithDeviceClass:(id)a3 assetType:(id)a4 skipDFU:(BOOL)a5 byteEscape:(BOOL)a6 skipReconnect:(BOOL)a7 skipVersionCheck:(BOOL)a8 options:(id)a9 serialNum:(id)a10;
- (EASession)session;
- (NSDictionary)manifestIDs;
- (NSNumber)cumulativeCloak;
- (NSNumber)cumulativeProgressPercent;
- (NSNumber)cumulativeTimeTaken;
- (NSNumber)currentSessionTimeTaken;
- (NSNumber)resumeCount;
- (NSNumber)resumedFromPercentNum;
- (NSString)appProtocol;
- (NSString)bootloaderProtocol;
- (NSString)currentFirmwareVersionOnAcc;
- (NSString)firmwareBundleFilename;
- (NSString)firmwareVersionAvailable;
- (NSString)modelNumber;
- (NSString)multiAssetAppProtocol;
- (NSString)name;
- (NSString)protocolString;
- (NSString)serialNumber;
- (NSString)transportType;
- (NSURL)firmwareBundleURL;
- (id)applyCompletion;
- (id)applyFirmware:(id)a3 progress:(id)a4 update:(id)a5 personalization:(id)a6;
- (id)assetWithMaxVersion:(id)a3;
- (id)createEndOfUpdateEventDict:(id)a3 error:(id)a4;
- (id)flushOutput;
- (id)getDeviceClassName;
- (id)openSession;
- (id)queryPredicate;
- (id)supportedProtocolForAccessory:(id)a3;
- (id)validateAsset;
- (id)validateAssetAttributes:(id)a3;
- (id)writeData:(id)a3;
- (unsigned)getPersonalizationID;
- (unsigned)getWhitelistedPersonalizationFields;
- (void)_accessoryDidConnect:(id)a3;
- (void)_accessoryDidDisconnect:(id)a3;
- (void)closeSession;
- (void)dealloc;
- (void)firmwareUpdateComplete:(id)a3 error:(id)a4;
- (void)handleFirmwareUpdateStatus:(id)a3;
- (void)handleInputData;
- (void)handleSessionError:(unsigned int)a3 message:(id)a4;
- (void)logStatusString:(id)a3;
- (void)personalizationResponse:(id)a3 error:(id)a4;
- (void)processPersonalizationInfoFromAccessory:(id)a3;
- (void)reconnectTimerDidFire:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAppProtocol:(id)a3;
- (void)setApplyCompletion:(id)a3;
- (void)setBootloaderProtocol:(id)a3;
- (void)setCloseEASession:(BOOL)a3;
- (void)setCumulativeCloak:(id)a3;
- (void)setCumulativeProgressPercent:(id)a3;
- (void)setCumulativeTimeTaken:(id)a3;
- (void)setCurrentFirmwareVersionOnAcc:(id)a3;
- (void)setCurrentSessionTimeTaken:(id)a3;
- (void)setExcludeUniqueAccessoryCheck:(BOOL)a3;
- (void)setFirmwareBundle:(id)a3;
- (void)setFirmwareBundleFilename:(id)a3;
- (void)setFirmwareBundleURL:(id)a3;
- (void)setFirmwareLocalURL:(id)a3;
- (void)setFirmwareURL:(id)a3 withManifest:(id)a4 signature:(id)a5 certificate:(id)a6 hash:(id)a7;
- (void)setFirmwareVersionAvailable:(id)a3;
- (void)setForceSilentUpdate:(BOOL)a3;
- (void)setIsMultiAssetSession:(BOOL)a3;
- (void)setManifestIDs:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setMultiAssetAppProtocol:(id)a3;
- (void)setName:(id)a3;
- (void)setOverrideProtocol:(BOOL)a3;
- (void)setProtocolString:(id)a3;
- (void)setResumeCount:(id)a3;
- (void)setResumedFromPercentNum:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSession:(id)a3;
- (void)setSkipDFUMode:(BOOL)a3;
- (void)setTransportType:(id)a3;
- (void)startReconnectTimer:(int)a3;
- (void)stopReconnectTimer;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)updateComplete:(id)a3 error:(id)a4;
- (void)updateProgress:(double)a3;
@end

@implementation EAFirmwareUpdater

+ (id)bootloaderProtocolStringWithEAID:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.accessory.updater",  @"dfu",  a3);
}

+ (id)appProtocolStringWithEAID:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.accessory.updater",  @"app",  a3);
}

+ (id)multiAssetAppProtocolStringWithEAID:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.accessory.updater",  @"app.multiasset",  a3);
}

+ (id)getEAFirmwareRevisionActive:(id)a3 forProtocol:(id)a4
{
  id v4 = 0LL;
  if (a3)
  {
    if (a4)
    {
      id v4 = [a3 firmwareRevisionActive];
      unsigned int v7 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2084");
      unsigned __int8 v8 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2096");
      if ((objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A3184") & 1) != 0
        || (v8 & 1) != 0
        || v7)
      {
        if ([a3 protocolDetails]
          && objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4))
        {
          id v9 = objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4);
          id v4 = [v9 objectForKey:EAProtocolFirmwareVersionActiveKey];
          NSLog( @"%s(): fwRevisionActive=%@ forProtocol=%@",  "+[EAFirmwareUpdater getEAFirmwareRevisionActive:forProtocol:]",  v4,  a4);
        }

        else
        {
          NSLog( @"%s() EAAccessory has no protocolDetails=%@ for protocol",  "+[EAFirmwareUpdater getEAFirmwareRevisionActive:forProtocol:]",  [a3 protocolDetails],  a4);
        }
      }
    }
  }

  return v4;
}

+ (id)getEAFirmwareRevisionPending:(id)a3 forProtocol:(id)a4
{
  id v4 = 0LL;
  if (a3)
  {
    if (a4)
    {
      id v4 = [a3 firmwareRevisionPending];
      unsigned int v7 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2084");
      unsigned __int8 v8 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2096");
      if ((objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A3184") & 1) != 0
        || (v8 & 1) != 0
        || v7)
      {
        if ([a3 protocolDetails]
          && objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4))
        {
          id v9 = objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4);
          id v4 = [v9 objectForKey:EAProtocolFirmwareVersionPendingKey];
          NSLog( @"%s(): fwRevisionPending=%@ forProtocol=%@",  "+[EAFirmwareUpdater getEAFirmwareRevisionPending:forProtocol:]",  v4,  a4);
        }

        else
        {
          NSLog( @"%s() EAAccessory has no protocolDetails=%@ for protocol",  "+[EAFirmwareUpdater getEAFirmwareRevisionPending:forProtocol:]",  [a3 protocolDetails],  a4);
        }
      }
    }
  }

  return v4;
}

+ (id)findAccessoryWithProtocolString:(id)a3 serialNum:(id)a4
{
  if (a3)
  {
    v6 = +[EAAccessoryManager sharedAccessoryManager](&OBJC_CLASS___EAAccessoryManager, "sharedAccessoryManager");
    if (v6)
    {
      unsigned int v7 = -[EAAccessoryManager connectedAccessories](v6, "connectedAccessories");
      if (v7)
      {
        unsigned __int8 v8 = v7;
        if (-[NSArray count](v7, "count"))
        {
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
          if (v9)
          {
            id v10 = v9;
            obj = v8;
            uint64_t v21 = *(void *)v27;
            do
            {
              for (i = 0LL; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(obj);
                }
                v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
                id v13 = [v12 protocolStrings];
                if (v13)
                {
                  v14 = v13;
                  __int128 v24 = 0u;
                  __int128 v25 = 0u;
                  __int128 v22 = 0u;
                  __int128 v23 = 0u;
                  id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
                  if (v15)
                  {
                    id v16 = v15;
                    uint64_t v17 = *(void *)v23;
LABEL_13:
                    uint64_t v18 = 0LL;
                    while (1)
                    {
                      if (*(void *)v23 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      if ([*(id *)(*((void *)&v22 + 1) + 8 * v18) rangeOfString:a3] != (id)0x7FFFFFFFFFFFFFFFLL
                        && (!a4
                         || (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v12, "serialNumber")) & 1) != 0))
                      {
                        break;
                      }

                      if (v16 == (id)++v18)
                      {
                        id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
                        if (v16) {
                          goto LABEL_13;
                        }
                        goto LABEL_23;
                      }
                    }

                    if (v12) {
                      return v12;
                    }
                  }
                }

- (EAFirmwareUpdater)initWithDeviceClass:(id)a3 assetType:(id)a4 skipDFU:(BOOL)a5 byteEscape:(BOOL)a6 skipReconnect:(BOOL)a7 skipVersionCheck:(BOOL)a8 options:(id)a9 serialNum:(id)a10
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___EAFirmwareUpdater;
  id v15 = -[EAFirmwareUpdater initWithAssetType:](&v27, "initWithAssetType:", a4);
  if (!v15) {
    goto LABEL_14;
  }
  if (([a3 hasPrefix:@"com.apple.MobileAccessoryUpdater.EA"] & 1) == 0
    && ([a3 hasPrefix:@"com.apple.UARP.EA"] & 1) == 0)
  {
    NSLog( @"%s: Invalid deviceClass base = %@\n",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  a3);
    goto LABEL_14;
  }

  id v16 = [a3 rangeOfString:@"dfu"];
  id v17 = [a3 rangeOfString:@"app"];
  id v18 = [a3 rangeOfString:@"app.multiasset"];
  id v19 = v18;
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL && v17 == (id)0x7FFFFFFFFFFFFFFFLL && v18 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog( @"%s: Invalid deviceClass extension = %@\n",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  a3);
    goto LABEL_14;
  }

  id v20 = [a3 componentsSeparatedByString:@"."];
  if ([v20 count] != (id)7 && objc_msgSend(v20, "count") != (id)8)
  {
    NSLog( @"%s: Invalid deviceClass components = %@\n",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  a3);
    goto LABEL_14;
  }

  id v21 = [v20 lastObject];
  if (!v21)
  {
    NSLog( @"%s: Invalid deviceClass eaID string = %@\n",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  a3);
    goto LABEL_14;
  }

  id v22 = v21;
  v15->_overrideProtocol = 0;
  v15->_firmwareUpdateIsUrgent = 0;
  v15->_firmwareUpdateComplete = 0;
  v15->_isExpectingReconnect = 0;
  v15->_forceSilentUpdate = 0;
  v15->_skipDFUMode = a5;
  v15->_skipVersionCheck = a8;
  v15->_closeEASession = 0;
  v15->_excludeUniqueAccessoryCheck = 0;
  v15->_reconnectTimer = 0LL;
  v15->_progressHandler = 0LL;
  v15->_applyCompletion = 0LL;
  v15->_personalizationRequestHandler = 0LL;
  v15->_updateHandler = 0LL;
  v15->_currentFirmwareVersionOnAcc = 0LL;
  v15->_firmwareVersionAvailable = 0LL;
  v15->_outputData = 0LL;
  pthread_mutex_init(&v15->_flushOutputLock, 0LL);
  v15->_currentSessionTimeTaken = (NSNumber *)&off_100034C80;
  v15->_cumulativeBytesDownloaded = (NSNumber *)&off_100034C80;
  v15->_totalBytesForCompleteUpdate = (NSNumber *)&off_100034C80;
  v15->_cumulativeProgressPercent = (NSNumber *)&off_100034C80;
  v15->_cumulativeTimeTaken = (NSNumber *)&off_100034C80;
  v15->_cumulativeCloakTime = (NSNumber *)&off_100034C80;
  v15->_resumeCount = (NSNumber *)&off_100034C80;
  -[EAFirmwareUpdater setBootloaderProtocol:]( v15,  "setBootloaderProtocol:",  [(id)objc_opt_class(v15) bootloaderProtocolStringWithEAID:v22]);
  -[EAFirmwareUpdater setAppProtocol:]( v15,  "setAppProtocol:",  [(id)objc_opt_class(v15) appProtocolStringWithEAID:v22]);
  -[EAFirmwareUpdater setMultiAssetAppProtocol:]( v15,  "setMultiAssetAppProtocol:",  [(id)objc_opt_class(v15) multiAssetAppProtocolStringWithEAID:v22]);
  v15->_manifestIDs = 0LL;
  v15->_manifestList = 0LL;
  v15->_manifestIndex = 0;
  v15->_serialNumber = (NSString *)[a10 copy];
  if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        -[EAFirmwareUpdater log:format:]( v15,  "log:format:",  5LL,  @"%s: huh? Unknown session type in device class %@",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  a3);
LABEL_14:
        __int128 v23 = v15;
        return 0LL;
      }

      -[EAFirmwareUpdater setProtocolString:](v15, "setProtocolString:", v15->_appProtocol);
      v15->_isMultiAssetSession = 0;
      v15->_byteEscape = a6;
      int v24 = 468;
      a6 = a7;
    }

    else
    {
      -[EAFirmwareUpdater setProtocolString:](v15, "setProtocolString:", v15->_bootloaderProtocol);
      v15->_isMultiAssetSession = 0;
      int v24 = 467;
    }
  }

  else
  {
    -[EAFirmwareUpdater setProtocolString:](v15, "setProtocolString:", v15->_multiAssetAppProtocol);
    a6 = 0;
    v15->_isMultiAssetSession = 1;
    v15->_skipDFUMode = 1;
    int v24 = 467;
  }

  v15->MobileAssetUpdater_opaque[v24] = a6;
  v15->_deviceClass = (NSString *)a3;
  v15->_deviceOptions = (NSDictionary *)a9;
  dispatch_sync(&_dispatch_main_q, &stru_10002D5B8);
  -[EAAccessoryManager registerForLocalNotifications]( +[EAAccessoryManager sharedAccessoryManager](&OBJC_CLASS___EAAccessoryManager, "sharedAccessoryManager"),  "registerForLocalNotifications");
  -[EAAccessoryManager setShouldAllowInternalProtocols:]( +[EAAccessoryManager sharedAccessoryManager](&OBJC_CLASS___EAAccessoryManager, "sharedAccessoryManager"),  "setShouldAllowInternalProtocols:",  1LL);
  +[EAAccessoryManager registerCapabilities:](&OBJC_CLASS___EAAccessoryManager, "registerCapabilities:", 64LL);
  if (!-[EAFirmwareUpdater findAccessory](v15, "findAccessory"))
  {
    NSLog( @"%s: No EAAccessory found matching protocol = %@\n",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  v15->_protocolString);
    goto LABEL_14;
  }

  v15->_overrideProtocol = -[NSString hasSuffix:]( -[EAFirmwareUpdater protocolString](v15, "protocolString"),  "hasSuffix:",  @"-override");
  if (!v15->_serialNumber) {
    v15->_serialNumber = (NSString *)-[NSString copy]( -[EAAccessory serialNumber]( -[EAFirmwareUpdater accessory](v15, "accessory"),  "serialNumber"),  "copy");
  }
  v15->_modelNumber = (NSString *)-[NSString copy]( -[EAAccessory modelNumber]( -[EAFirmwareUpdater accessory](v15, "accessory"),  "modelNumber"),  "copy");
  v15->_name = (NSString *)-[NSString copy]( -[EAAccessory name](-[EAFirmwareUpdater accessory](v15, "accessory"), "name"),  "copy");
  deviceOptions = v15->_deviceOptions;
  if (deviceOptions) {
    LOBYTE(deviceOptions) = objc_msgSend( -[NSDictionary objectForKey:]( deviceOptions,  "objectForKey:",  @"closeEASession"),  "BOOLValue");
  }
  v15->_closeEASession = (char)deviceOptions;
  NSLog( @"%s: _accessory = %@\n",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",  v15->_accessory);
  -[EAFirmwareUpdater log:format:]( v15,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"deviceClass=%@ protocolString=%@ isMultiAssetSession=%d byteEscape=%d skipDFU=%d",  v15->_deviceClass,  -[EAFirmwareUpdater protocolString](v15, "protocolString"),  v15->_isMultiAssetSession,  v15->_byteEscape,  v15->_skipDFUMode));
  -[EAFirmwareUpdater log:format:]( v15,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"appProtocol=%@ bootloaderProtocol=%@ multiAssetAppProtocol=%@",  -[EAFirmwareUpdater appProtocol](v15, "appProtocol"),  -[EAFirmwareUpdater bootloaderProtocol](v15, "bootloaderProtocol"),  -[EAFirmwareUpdater multiAssetAppProtocol](v15, "multiAssetAppProtocol")));
  return v15;
}

- (void)dealloc
{
  appProtocol = self->_appProtocol;
  if (appProtocol) {

  }
  bootloaderProtocol = self->_bootloaderProtocol;
  if (bootloaderProtocol) {

  }
  multiAssetAppProtocol = self->_multiAssetAppProtocol;
  if (multiAssetAppProtocol) {

  }
  protocolString = self->_protocolString;
  if (protocolString) {

  }
  iAUPServer = self->_iAUPServer;
  if (iAUPServer) {

  }
  manifestIDs = self->_manifestIDs;
  if (manifestIDs) {

  }
  manifestList = self->_manifestList;
  if (manifestList) {

  }
  buildIdentities = self->_buildIdentities;
  if (buildIdentities) {

  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {

  }
  pthread_mutex_destroy(&self->_flushOutputLock);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___EAFirmwareUpdater;
  -[EAFirmwareUpdater dealloc](&v12, "dealloc");
}

- (void)setFirmwareLocalURL:(id)a3
{
  if (!self->_iAUPServer)
  {
    v5 = -[iAUPServer initInstanceWithByteEscape:]( objc_alloc(&OBJC_CLASS___iAUPServer),  "initInstanceWithByteEscape:",  self->_byteEscape);
    self->_iAUPServer = v5;
    -[iAUPServer setDelegate:](v5, "setDelegate:", self);
  }

  v6 = -[FirmwareBundle initWithURL:hashData:signatureData:certData:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithURL:hashData:signatureData:certData:",  a3,  0LL,  0LL,  0LL);
  -[iAUPServer setFirmwareBundle:](self->_iAUPServer, "setFirmwareBundle:", v6);

  unsigned int v7 = -[NSString componentsSeparatedByString:](self->_protocolString, "componentsSeparatedByString:", @".");
  if (v7) {
    id v8 = objc_msgSend(-[NSArray lastObject](v7, "lastObject"), "intValue");
  }
  else {
    id v8 = 0LL;
  }
  -[FirmwareBundle setProductIDCode:]( -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"),  "setProductIDCode:",  v8);
}

- (BOOL)findAccessory
{
  if (!-[EAFirmwareUpdater accessory](self, "accessory")) {
    -[EAFirmwareUpdater setAccessory:]( self,  "setAccessory:",  objc_msgSend( (id)objc_opt_class(self),  "findAccessoryWithProtocolString:serialNum:",  -[EAFirmwareUpdater protocolString](self, "protocolString"),  self->_serialNumber));
  }
  return -[EAFirmwareUpdater accessory](self, "accessory") != 0LL;
}

- (void)startReconnectTimer:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater startReconnectTimer:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"_isExpectingReconnect=%d reconnectType=%d",  self->_isExpectingReconnect,  v3));
  if (self->_reconnectTimer) {
    -[EAFirmwareUpdater stopReconnectTimer](self, "stopReconnectTimer");
  }
  self->_isExpectingReconnect = v3;
  self->_reconnectTimer =  +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "reconnectTimerDidFire:",  0LL,  0LL,  90.0);
  -[NSRunLoop addTimer:forMode:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "addTimer:forMode:",  self->_reconnectTimer,  NSDefaultRunLoopMode);
  objc_sync_exit(self);
}

- (void)setManifestIDs:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  self->_manifestIDs = v4;
  self->_manifestList = -[NSDictionary allKeys](v4, "allKeys");
  self->_manifestIndex = 0;
}

- (void)stopReconnectTimer
{
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater stopReconnectTimer]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"_isExpectingReconnect=%d",  self->_isExpectingReconnect));
  self->_isExpectingReconnect = 0;
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    -[NSTimer invalidate](reconnectTimer, "invalidate");

    self->_reconnectTimer = 0LL;
  }

  objc_sync_exit(self);
}

- (void)reconnectTimerDidFire:(id)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t isExpectingReconnect = self->_isExpectingReconnect;
  v6 = -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self, "accessory"), "modelNumber");
  NSUInteger v7 = -[EAAccessory connectionID](-[EAFirmwareUpdater accessory](self, "accessory"), "connectionID");
  id v8 = objc_msgSend( (id)objc_opt_class(self),  "getEAFirmwareRevisionActive:forProtocol:",  -[EAFirmwareUpdater accessory](self, "accessory"),  self->_protocolString);
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5,  @"%s %@",  "-[EAFirmwareUpdater reconnectTimerDidFire:]",   -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"Timed out waiting for accessory to reconnect _isExpectingReconnect=%d accessory=[%@:%lu:FWvA%@:FWvP%@]",  isExpectingReconnect,  v6,  v7,  v8,  objc_msgSend( (id)objc_opt_class(self),  "getEAFirmwareRevisionPending:forProtocol:",  -[EAFirmwareUpdater accessory](self, "accessory"),  self->_protocolString)));
  objc_sync_enter(self);
  if (-[EAFirmwareUpdater accessory](self, "accessory"))
  {
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s() self.accessory is valid. Ignoring fired timer ",  "-[EAFirmwareUpdater reconnectTimerDidFire:]");
  }

  else
  {
    if (self->_isExpectingReconnect == 2) {
      int v9 = 3;
    }
    else {
      int v9 = 0;
    }
    self->_uint64_t isExpectingReconnect = v9;
    -[EAFirmwareUpdater _accessoryDidDisconnect:](self, "_accessoryDidDisconnect:", 0LL);
  }

  objc_sync_exit(self);
}

- (void)setFirmwareURL:(id)a3 withManifest:(id)a4 signature:(id)a5 certificate:(id)a6 hash:(id)a7
{
  if (!self->_iAUPServer)
  {
    id v13 = -[iAUPServer initInstanceWithByteEscape:]( objc_alloc(&OBJC_CLASS___iAUPServer),  "initInstanceWithByteEscape:",  self->_byteEscape);
    self->_iAUPServer = v13;
    -[iAUPServer setDelegate:](v13, "setDelegate:", self);
  }

  v14 = -[FirmwareBundle initWithURL:hashData:signatureData:certData:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithURL:hashData:signatureData:certData:",  a3,  a7,  a5,  a6);
  -[iAUPServer setFirmwareBundle:](self->_iAUPServer, "setFirmwareBundle:", v14);
  -[FirmwareBundle setBuildManifest:]( -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"),  "setBuildManifest:",  a4);

  id v15 = -[NSString componentsSeparatedByString:](self->_protocolString, "componentsSeparatedByString:", @".");
  if (v15) {
    id v16 = objc_msgSend(-[NSArray lastObject](v15, "lastObject"), "intValue");
  }
  else {
    id v16 = 0LL;
  }
  -[FirmwareBundle setProductIDCode:]( -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"),  "setProductIDCode:",  v16);
}

- (void)setFirmwareBundle:(id)a3
{
  iAUPServer = self->_iAUPServer;
  if (!iAUPServer)
  {
    v6 = -[iAUPServer initInstanceWithByteEscape:]( objc_alloc(&OBJC_CLASS___iAUPServer),  "initInstanceWithByteEscape:",  self->_byteEscape);
    self->_iAUPServer = v6;
    -[iAUPServer setDelegate:](v6, "setDelegate:", self);
    iAUPServer = self->_iAUPServer;
  }

  -[iAUPServer setFirmwareBundle:](iAUPServer, "setFirmwareBundle:", a3);
}

- (void)setAccessory:(id)a3
{
  if (self->_accessory != a3)
  {
    id v18 = [(id)objc_opt_class(self) getEAFirmwareRevisionPending:self->_accessory forProtocol:self->_protocolString];
    id v17 = [(id)objc_opt_class(self) getEAFirmwareRevisionActive:self->_accessory forProtocol:self->_protocolString];
    v5 = objc_alloc(&OBJC_CLASS___NSString);
    v6 = -[EAAccessory modelNumber](self->_accessory, "modelNumber");
    NSUInteger v7 = -[EAAccessory connectionID](self->_accessory, "connectionID");
    id v8 = [a3 modelNumber];
    id v9 = [a3 connectionID];
    id v10 = [(id)objc_opt_class(self) getEAFirmwareRevisionActive:a3 forProtocol:self->_protocolString];
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5,  @"%s %@",  "-[EAFirmwareUpdater setAccessory:]",   -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"old=[%@:%lu:FWvA%@:FWvP%@] new=[%@:%lu:FWvA%@:FWvP%@] ",  v6,  v7,  v17,  v18,  v8,  v9,  v10,  [(id)objc_opt_class(self) getEAFirmwareRevisionPending:a3 forProtocol:self->_protocolString]));
    accessory = self->_accessory;
    if (accessory)
    {
      -[EAAccessory setDelegate:](accessory, "setDelegate:", 0LL);
    }

    self->_accessory = (EAAccessory *)a3;
    if (!a3) {
      goto LABEL_15;
    }
    id v12 = a3;
    -[EAFirmwareUpdater setProtocolString:]( self,  "setProtocolString:",  -[EAFirmwareUpdater supportedProtocolForAccessory:](self, "supportedProtocolForAccessory:", self->_accessory));
    if (!-[EAFirmwareUpdater protocolString](self, "protocolString")) {
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"No supported protocol string");
    }
    if (-[EAFirmwareUpdater isMultiAssetSession](self, "isMultiAssetSession"))
    {
LABEL_14:
      -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater setAccessory:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @" - FW Version: %llu.%llu.%llu (%@)",  self->_firmwareVersionMajor,  self->_firmwareVersionMinor,  self->_firmwareVersionRelease,  -[EAFirmwareUpdater protocolString](self, "protocolString")));
      -[EAFirmwareUpdater setCurrentFirmwareVersionOnAcc:]( self,  "setCurrentFirmwareVersionOnAcc:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu.%llu.%llu",  self->_firmwareVersionMajor,  self->_firmwareVersionMinor,  self->_firmwareVersionRelease));
LABEL_15:
      -[EAFirmwareUpdater setSession:](self, "setSession:", 0LL);
      return;
    }

    id v13 = [(id)objc_opt_class(self) getEAFirmwareRevisionPending:self->_accessory forProtocol:self->_protocolString];
    id v14 = [(id)objc_opt_class(self) getEAFirmwareRevisionActive:self->_accessory forProtocol:self->_protocolString];
    if (v13) {
      id v14 = v13;
    }
    if (v14)
    {
      id v15 = [v14 componentsSeparatedByString:@"."];
      if (v15)
      {
        id v16 = v15;
        if ([v15 count] == (id)3)
        {
          self->_firmwareVersionMajor = (unint64_t)objc_msgSend( objc_msgSend(v16, "objectAtIndex:", 0),  "longLongValue");
          self->_firmwareVersionMinor = (unint64_t)objc_msgSend( objc_msgSend(v16, "objectAtIndex:", 1),  "longLongValue");
          self->_firmwareVersionRelease = (unint64_t)objc_msgSend( objc_msgSend(v16, "objectAtIndex:", 2),  "longLongValue");
          -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater setAccessory:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @" - FW Version: %llu.%llu.%llu",  self->_firmwareVersionMajor,  self->_firmwareVersionMinor,  self->_firmwareVersionRelease));
          goto LABEL_14;
        }
      }
    }
  }

- (void)setSession:(id)a3
{
  session = self->_session;
  if (session != a3)
  {
    if (session)
    {
      id v10 = a3;
      v5 = -[EASession inputStream](session, "inputStream");
      if (v5)
      {
        v6 = v5;
        -[NSInputStream close](v5, "close");
        -[NSInputStream removeFromRunLoop:forMode:]( v6,  "removeFromRunLoop:forMode:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  NSDefaultRunLoopMode);
      }

      NSUInteger v7 = -[EASession outputStream](self->_session, "outputStream");
      if (v7)
      {
        id v8 = v7;
        -[NSOutputStream close](v7, "close");
        -[NSOutputStream removeFromRunLoop:forMode:]( v8,  "removeFromRunLoop:forMode:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  NSDefaultRunLoopMode);
      }

      a3 = v10;
    }

    self->_session = (EASession *)a3;
    if (a3) {
      id v9 = a3;
    }
  }

- (id)supportedProtocolForAccessory:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id result = -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol");
  if (result)
  {
    id result = -[EAFirmwareUpdater appProtocol](self, "appProtocol");
    if (result)
    {
      id result = [a3 protocolStrings];
      if (result)
      {
        id v6 = result;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v11 = 0u;
        __int128 v12 = 0u;
        id result = [result countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (result)
        {
          id v7 = result;
          uint64_t v8 = *(void *)v12;
          while (2)
          {
            id v9 = 0LL;
            do
            {
              if (*(void *)v12 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v9);
              if (-[EAFirmwareUpdater isMultiAssetSession](self, "isMultiAssetSession"))
              {
                if (objc_msgSend( v10,  "rangeOfString:options:",  -[EAFirmwareUpdater multiAssetAppProtocol](self, "multiAssetAppProtocol"),  1) != (id)0x7FFFFFFFFFFFFFFFLL) {
                  return -[EAFirmwareUpdater multiAssetAppProtocol](self, "multiAssetAppProtocol");
                }
              }

              else
              {
                if (objc_msgSend( v10,  "rangeOfString:options:",  -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol"),  1) != (id)0x7FFFFFFFFFFFFFFFLL) {
                  return -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol");
                }
                if (objc_msgSend( v10,  "rangeOfString:options:",  -[EAFirmwareUpdater appProtocol](self, "appProtocol"),  1) != (id)0x7FFFFFFFFFFFFFFFLL) {
                  return -[EAFirmwareUpdater appProtocol](self, "appProtocol");
                }
              }

              id v9 = (char *)v9 + 1;
            }

            while (v7 != v9);
            id result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            id v7 = result;
            if (result) {
              continue;
            }
            break;
          }
        }
      }
    }
  }

  return result;
}

- (id)queryPredicate
{
  if (-[EAFirmwareUpdater isMultiAssetSession](self, "isMultiAssetSession")
    || !-[NSString isEqualToString:]( -[EAFirmwareUpdater protocolString](self, "protocolString"),  "isEqualToString:",  -[EAFirmwareUpdater appProtocol](self, "appProtocol")))
  {
    return 0LL;
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007CA0;
  v4[3] = &unk_10002D5E0;
  v4[4] = self;
  v4[5] = 2LL;
  return +[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v4);
}

- (id)assetWithMaxVersion:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  id v6 = 0LL;
  unsigned __int128 v23 = 0uLL;
  id v7 = 0LL;
  id v22 = 0LL;
  uint64_t v8 = *(void *)v26;
  id obj = a3;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
      id v11 = objc_msgSend(v10, "attributes", v22);
      if (v11)
      {
        __int128 v12 = v11;
        id v13 = [v11 objectForKey:@"FirmwareVersionMajor"];
        if (v13)
        {
          id v14 = [v13 unsignedLongLongValue];
          id v15 = [v12 objectForKey:@"FirmwareVersionMinor"];
          if (v15)
          {
            id v16 = [v15 unsignedLongLongValue];
            id v17 = [v12 objectForKey:@"FirmwareVersionRelease"];
            if (v17)
            {
              id v18 = [v17 unsignedLongLongValue];
              id v19 = [v12 objectForKey:@"FormatVersion"];
              if (v19)
              {
                id v20 = [v19 unsignedLongLongValue];
                if (v20 >= v6
                  && (v14 > v7 || v14 == v7 && __PAIR128__((unint64_t)v16, (unint64_t)v18) > v23))
                {
                  id v6 = v20;
                  *(void *)&unsigned __int128 v23 = v18;
                  *((void *)&v23 + 1) = v16;
                  id v7 = v14;
                  id v22 = v10;
                }
              }
            }
          }
        }
      }
    }

    id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }

  while (v5);
  return v22;
}

- (id)validateAssetAttributes:(id)a3
{
  if (!a3) {
    return sub_1000081A8(0LL, 3, (uint64_t)@"No asset attributes", v3, v4, v5, v6, v7, v18);
  }
  -[EAFirmwareUpdater setFirmwareBundleFilename:]( self,  "setFirmwareBundleFilename:",  [a3 objectForKey:@"FirmwareBundle"]);
  if (-[EAFirmwareUpdater firmwareBundleFilename](self, "firmwareBundleFilename"))
  {
    id v15 = [a3 objectForKey:@"ForceSilentUpdate"];
    if (v15) {
      id v16 = [v15 BOOLValue];
    }
    else {
      id v16 = 0LL;
    }
    -[EAFirmwareUpdater setForceSilentUpdate:](self, "setForceSilentUpdate:", v16);
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater validateAssetAttributes:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"EA FUD Plugin: forceSilentUpdate=%d",  -[EAFirmwareUpdater forceSilentUpdate](self, "forceSilentUpdate")));
    self->_firmwareVersionAvailable = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.%@.%@",  [a3 objectForKeyedSubscript:@"FirmwareVersionMajor"],  objc_msgSend(a3, "objectForKeyedSubscript:", @"FirmwareVersionMinor"),  objc_msgSend(a3, "objectForKeyedSubscript:", @"FirmwareVersionRelease"));
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater validateAssetAttributes:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Firmware version available = %@",  self->_firmwareVersionAvailable));
  }

  else
  {
    sub_1000081A8( 0LL,  4,  (uint64_t)@"No firmware bundle filename in asset: %@",  v10,  v11,  v12,  v13,  v14,  (uint64_t)@"FirmwareBundle");
  }

  return 0LL;
}

- (BOOL)isDeploymentAllowed:(id)a3
{
  id v3 = [a3 objectForKey:@"DeploymentList"];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  id v5 = [[UARPAssetID alloc] initWithLocationType:3 remoteURL:0];
  [v5 processUARPDeploymentRules:v4];
  LOBYTE(v4) = [v5 deploymentAllowed];

  return (char)v4;
}

- (id)validateAsset
{
  if (!-[EAFirmwareUpdater asset](self, "asset"))
  {
    v43 = @"NoAsset";
    int v44 = 2;
LABEL_53:
    __int128 v28 = sub_1000081A8(0LL, v44, (uint64_t)v43, v3, v4, v5, v6, v7, (uint64_t)v47);
LABEL_55:
    uint64_t v14 = 0LL;
    goto LABEL_19;
  }

  uint64_t v8 = (FirmwareBundle *)objc_msgSend(-[EAFirmwareUpdater asset](self, "asset"), "getLocalFileUrl");
  uint64_t v14 = v8;
  if (!v8)
  {
    v45 = @"No local URL for asset";
    int v46 = 5;
LABEL_59:
    __int128 v28 = sub_1000081A8(0LL, v46, (uint64_t)v45, v9, v10, v11, v12, v13, (uint64_t)v47);
    goto LABEL_19;
  }

  id v15 =  -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"validating MobileAsset [localURL=%@] attributes=%@\n",  v8,  objc_msgSend(-[EAFirmwareUpdater asset](self, "asset"), "attributes"));
  v47 = (NSURL *)"-[EAFirmwareUpdater validateAsset]";
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"%s %@");
  -[EAFirmwareUpdater setFirmwareBundleURL:]( self,  "setFirmwareBundleURL:",  objc_msgSend( -[FirmwareBundle URLByAppendingPathComponent:]( v14,  "URLByAppendingPathComponent:",  -[EAFirmwareUpdater firmwareBundleFilename](self, "firmwareBundleFilename")),  "filePathURL"));
  if (!-[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL"))
  {
    v43 = @"Couldn't build firmware update URL";
    int v44 = 4;
    goto LABEL_53;
  }

  if (!-[NSFileManager isReadableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isReadableFileAtPath:",  -[NSURL path](-[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL"), "path")))
  {
    v47 = -[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL");
    v43 = @"No firmware bundle: %@";
    int v44 = 6;
    goto LABEL_53;
  }

  if (!-[EAFirmwareUpdater updateRequiresSuperBinary](self, "updateRequiresSuperBinary"))
  {
    __int128 v28 = 0LL;
    goto LABEL_55;
  }

  id v16 = -[FirmwareBundle initWithBundlePath:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithBundlePath:",  -[NSURL path](-[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL"), "path"));
  uint64_t v14 = v16;
  if (!v16)
  {
    v45 = @"Couldn't read firmware bundle";
LABEL_58:
    int v46 = 4;
    goto LABEL_59;
  }

  if (!-[FirmwareBundle firmwareImage](v16, "firmwareImage")
    && -[FirmwareBundle firmwareLocalURL](v14, "firmwareLocalURL"))
  {
    -[FirmwareBundle loadFirmwareImage](v14, "loadFirmwareImage");
  }

  id v17 = -[NSData bytes](-[FirmwareBundle firmwareImage](v14, "firmwareImage"), "bytes");
  uint64_t v18 = parseSuperBinaryAndPayloadHeaders( v17,  -[NSData length](-[FirmwareBundle firmwareImage](v14, "firmwareImage"), "length"));
  if (!v18)
  {
    v45 = @"Couldn't parse SuperBinary header";
    goto LABEL_58;
  }

  id v19 = (unsigned __int16 *)v18;
  if (*(_WORD *)(v18 + 16))
  {
    unint64_t v20 = 0LL;
    id v21 = (char *)(v18 + 20);
    while (1)
    {
      id v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c%c%c",  *v21,  v21[1],  v21[2],  v21[3]);
      if (!v22) {
        break;
      }
      if (-[NSString isEqualToString:](v22, "isEqualToString:", @"sbmd"))
      {
        v30 = &v17[*((unsigned int *)v21 + 3)];
        while (metadataTLVGetNext( v30,  &v17[*((_DWORD *)v21 + 4) + *((_DWORD *)v21 + 3)],  &v53,  &v52,  &v51,  &v50))
        {
          if (v53 - 1 > 1)
          {
            v36 = objc_alloc(&OBJC_CLASS___NSString);
            v37 =  -[NSString initWithFormat:]( v36,  "initWithFormat:",  @"Warning: Unsupported TLV type found in metadata: %d",  v53);
            v48 = "-[EAFirmwareUpdater validateAsset]";
            -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"%s %@");
          }

          else
          {
            if (v52 < 4)
            {
              v42 = @"TLV length not large enough to support Version";
              goto LABEL_47;
            }

            unint64_t v31 = *v51;
            unint64_t v32 = v51[1];
            unint64_t v49 = *((unsigned __int16 *)v51 + 1);
            if (v53 == 2 && !self->_skipVersionCheck)
            {
              v39 =  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Checking Curr FW Version=%llu.%llu.%llu >= Min FW Version=%llu.%llu.%llu",  self->_firmwareVersionMajor,  self->_firmwareVersionMinor,  self->_firmwareVersionRelease,  v31,  v32,  v49);
              v48 = "-[EAFirmwareUpdater validateAsset]";
              -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"%s %@");
              unint64_t firmwareVersionMajor = self->_firmwareVersionMajor;
              if (firmwareVersionMajor <= v31)
              {
                if (firmwareVersionMajor != v31
                  || (unint64_t firmwareVersionMinor = self->_firmwareVersionMinor, firmwareVersionMinor <= v32)
                  && (firmwareVersionMinor != v32 || v49 > self->_firmwareVersionRelease))
                {
                  v42 = @"Current FW Version does not meet MinRequiredVersion";
                  goto LABEL_47;
                }
              }
            }

            else
            {
              v33 =  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Checking Curr FW Version=%llu.%llu.%llu >= LastUrgent FW Version=%llu.%llu.%llu",  self->_firmwareVersionMajor,  self->_firmwareVersionMinor,  self->_firmwareVersionRelease,  v31,  v32,  v49);
              v48 = "-[EAFirmwareUpdater validateAsset]";
              -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"%s %@");
              unint64_t v34 = self->_firmwareVersionMajor;
              if (v34 >= v31)
              {
                if (v34 == v31)
                {
                  unint64_t v38 = self->_firmwareVersionMinor;
                  BOOL v35 = v38 < v32 || v38 == v32 && v49 > self->_firmwareVersionRelease;
                }

                else
                {
                  BOOL v35 = 0;
                }
              }

              else
              {
                BOOL v35 = 1;
              }

              self->_firmwareUpdateIsUrgent = v35;
            }
          }

          v30 = v50;
          if (!v50) {
            break;
          }
        }

- (BOOL)updateRequiresSuperBinary
{
  return objc_msgSend( -[NSDictionary objectForKey:]( self->_deviceOptions,  "objectForKey:",  @"UpdateRequiresSuperBinary"),  "BOOLValue");
}

- (BOOL)updateRequiresPersonalization
{
  return objc_msgSend( -[NSDictionary objectForKey:]( self->_deviceOptions,  "objectForKey:",  @"NeedsPersonalization"),  "BOOLValue");
}

- (id)getDeviceClassName
{
  return -[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"DeviceClassName");
}

- (unsigned)getWhitelistedPersonalizationFields
{
  if (-[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"WhitelistedPersonalizationFields")) {
    return objc_msgSend( -[NSDictionary objectForKey:]( self->_deviceOptions,  "objectForKey:",  @"WhitelistedPersonalizationFields"),  "unsignedIntValue");
  }
  else {
    return -1;
  }
}

- (BOOL)isRestartRequired
{
  iAUPServer = self->_iAUPServer;
  if (iAUPServer) {
    LOBYTE(iAUPServer) = -[iAUPServer restartRequired](iAUPServer, "restartRequired");
  }
  return (char)iAUPServer;
}

- (BOOL)isSleepWakeRequired
{
  iAUPServer = self->_iAUPServer;
  if (iAUPServer) {
    LOBYTE(iAUPServer) = -[iAUPServer sleepWakeRequired](iAUPServer, "sleepWakeRequired");
  }
  return (char)iAUPServer;
}

- (BOOL)isUrgentUpdate
{
  if (self->_firmwareUpdateIsUrgent) {
    return 1;
  }
  else {
    return -[iAUPServer urgentUpdate](self->_iAUPServer, "urgentUpdate");
  }
}

- (void)processPersonalizationInfoFromAccessory:(id)a3
{
  id v54 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  unint64_t v62 = 0LL;
  if (!a3)
  {
    v45 = @"Invalid Info from Accessory";
LABEL_88:
    int v46 = sub_1000081A8(0LL, 21, (uint64_t)v45, v5, v6, v7, v8, v9, (uint64_t)v51);
    uint64_t v11 = 0LL;
    id v19 = 0LL;
    char v44 = 1;
    goto LABEL_109;
  }

  if (!self->_personalizationRequestHandler)
  {
    v45 = @"Invalid _personalizationRequestHandler";
    goto LABEL_88;
  }

  v51 = @"PersonalizationRequest";
  -[EAFirmwareUpdater protocolString](self, "protocolString");
  id v10 = [[FudPersonalizationRequest alloc] initWithName:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@")];
  if (!v10)
  {
    v45 = @"Failed to init FudPersonalizationRequest";
    goto LABEL_88;
  }

  uint64_t v11 = v10;
  if (-[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"PersonalizationResponseFormat"))
  {
    objc_msgSend( v11,  "setResponseFormat:",  objc_msgSend( -[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"PersonalizationResponseFormat"),  "unsignedIntValue"));
    if ([v11 responseFormat] >= 3)
    {
      v47 = @"Invalid Response format specified";
    }

    else
    {
      if ([v11 responseFormat] == 1
        && -[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"PersonalizationResponseAlign"))
      {
        objc_msgSend( v11,  "setResponseAlignment:",  (unsigned __int16)objc_msgSend( -[NSDictionary objectForKey:]( self->_deviceOptions,  "objectForKey:",  @"PersonalizationResponseAlign"),  "unsignedIntValue"));
      }

      if (self->_manifestIDs)
      {
        unint64_t manifestIndex = self->_manifestIndex;
        if (-[NSArray count](self->_manifestList, "count") > manifestIndex)
        {
          manifestList = self->_manifestList;
          ++self->_manifestIndex;
          objc_msgSend( v11,  "setRequestPrefix:",  -[NSArray objectAtIndexedSubscript:](manifestList, "objectAtIndexedSubscript:"));
        }
      }

      if ([a3 objectForKey:@"BoardID"])
      {
        objc_msgSend( v11,  "setBoardID:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"BoardID"), "unsignedIntValue"));
        if ([a3 objectForKey:@"ChipID"])
        {
          objc_msgSend( v11,  "setChipID:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"ChipID"), "unsignedIntValue"));
          if ([a3 objectForKey:@"ECID"])
          {
            if ([v11 requestPrefix]
              && objc_msgSend(objc_msgSend(v11, "requestPrefix"), "isEqualToString:", @"Baobab"))
            {
              uint64_t v61 = 0LL;
              unint64_t v62 = bswap64((unint64_t)objc_msgSend( objc_msgSend(a3, "objectForKey:", @"ECID"),  "unsignedLongValue"));
              id v19 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v61,  8LL);
              -[NSMutableData appendBytes:length:](v19, "appendBytes:length:", &v62, 8LL);
              [v11 setExtEcID:v19];
            }

            else
            {
              objc_msgSend( v11,  "setEcID:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"ECID"), "unsignedLongValue"));
              id v19 = 0LL;
            }

            [v11 setGlobalSigning:0];
          }

          else
          {
            [v11 setGlobalSigning:1];
            id v19 = 0LL;
          }

          if ([a3 objectForKey:@"securityDomain"])
          {
            objc_msgSend( v11,  "setSecurityDomain:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"securityDomain"), "unsignedIntValue"));
            if ([a3 objectForKey:@"productionMode"])
            {
              objc_msgSend( v11,  "setProductionMode:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"productionMode"), "BOOLValue"));
              if ([a3 objectForKey:@"securityMode"])
              {
                uint64_t v25 = (NSNull *)[a3 objectForKey:@"securityMode"];
                if (v25 != +[NSNull null](&OBJC_CLASS___NSNull, "null")) {
                  objc_msgSend( v11,  "setSecurityMode:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"securityMode"), "BOOLValue"));
                }
                if ([a3 objectForKey:@"nonceHash"])
                {
                  if ([v11 requestPrefix]
                    && objc_msgSend( objc_msgSend(v11, "requestPrefix"),  "isEqualToString:",  @"Baobab"))
                  {
                    uint64_t v26 = -[NSData initWithBytes:length:]( [NSData alloc],  "initWithBytes:length:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"nonceHash"), "bytes"),  16);
                    [v11 setNonceHash:v26];

                    uint64_t v27 =  -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"Truncating nonceHash=%@\n",  [v11 nonceHash]);
                    v51 = "-[EAFirmwareUpdater processPersonalizationInfoFromAccessory:]";
                    -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"%s %@");
                  }

                  else
                  {
                    objc_msgSend(v11, "setNonceHash:", objc_msgSend(a3, "objectForKey:", @"nonceHash"));
                  }

                  __int128 v28 = (NSNull *)[a3 objectForKey:@"chipEpoch"];
                  if (v28 != +[NSNull null](&OBJC_CLASS___NSNull, "null")
                    && (![v11 requestPrefix]
                     || (objc_msgSend( objc_msgSend(v11, "requestPrefix"),  "isEqualToString:",  @"DMC") & 1) == 0))
                  {
                    objc_msgSend( v11,  "setChipEpoch:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"chipEpoch"), "unsignedIntValue"));
                  }

                  if ([a3 objectForKey:@"enableMixMatch"])
                  {
                    objc_msgSend( v11,  "setEnableMixMatch:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"enableMixMatch"), "BOOLValue"));
                    if (-[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL")
                      || -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"))
                    {
                      if (![v11 responseFormat])
                      {
                        buildIdentities = self->_buildIdentities;
                        if (buildIdentities)
                        {
                          __int128 v29 = 0LL;
LABEL_50:
                          memset(v60, 0, sizeof(v60));
                          unsigned int v53 = self;
                          unsigned int v52 = v29;
                          if (-[NSArray countByEnumeratingWithState:objects:count:]( buildIdentities,  "countByEnumeratingWithState:objects:count:",  v60,  v66,  16LL)
                            && (id v34 = [**((id **)&v60[0] + 1) objectForKey:@"Manifest"],
                                __int128 v56 = 0u,
                                __int128 v57 = 0u,
                                __int128 v58 = 0u,
                                __int128 v59 = 0u,
                                (id v35 = [v34 countByEnumeratingWithState:&v56 objects:v65 count:16]) != 0))
                          {
                            id v36 = v35;
                            id v37 = 0LL;
                            uint64_t v38 = *(void *)v57;
                            while (2)
                            {
                              for (i = 0LL; i != v36; i = (char *)i + 1)
                              {
                                if (*(void *)v57 != v38) {
                                  objc_enumerationMutation(v34);
                                }
                                v40 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
                                if (v37) {

                                }
                                id v41 = [v34 objectForKey:v40];
                                if (!v41)
                                {
                                  id v37 = 0LL;
LABEL_84:
                                  self = v53;
                                  goto LABEL_76;
                                }

                                v42 = v41;
                                if ([v11 requestPrefix]
                                  && !objc_msgSend(v40, "hasPrefix:", objc_msgSend(v11, "requestPrefix")))
                                {
                                  id v37 = 0LL;
                                }

                                else
                                {
                                  id v37 = [[FudPersonalizationObjectInfo alloc] initWithTag:v40];
                                  if (!v37) {
                                    goto LABEL_84;
                                  }
                                  objc_msgSend(v37, "setDigest:", objc_msgSend(v42, "objectForKey:", @"Digest"));
                                  if ([v42 objectForKey:@"Trusted"]) {
                                    objc_msgSend( v37,  "setTrusted:",  objc_msgSend(objc_msgSend(v42, "objectForKey:", @"Trusted"), "BOOLValue"));
                                  }
                                  objc_msgSend(v37, "setEffectiveProductionMode:", objc_msgSend(v11, "productionMode"));
                                  [v54 addObject:v37];
                                }
                              }

                              id v36 = [v34 countByEnumeratingWithState:&v56 objects:v65 count:16];
                              if (v36) {
                                continue;
                              }
                              break;
                            }
                          }

                          else
                          {
                            id v37 = 0LL;
                          }

                          objc_msgSend(v11, "setObjectList:", objc_msgSend(v54, "copy"));
                          else {
                            v43 = 0LL;
                          }
                          self = v53;
                          [v11 setPayload:v43];
LABEL_76:
                          (*((void (**)(void))self->_personalizationRequestHandler + 2))();
                          char v44 = 0;
                          if (!v19) {
                            goto LABEL_78;
                          }
                          goto LABEL_77;
                        }
                      }

                      __int128 v29 = -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle");
                      if (v29
                        || (v30 = -[FirmwareBundle initWithBundlePath:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithBundlePath:",  -[NSURL path]( -[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL"),  "path")),  -[iAUPServer setFirmwareBundle:](self->_iAUPServer, "setFirmwareBundle:", v30),  v30,  (__int128 v29 = -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle")) != 0LL))
                      {
                        if (-[FirmwareBundle buildManifest](v29, "buildManifest"))
                        {
                          if (!-[FirmwareBundle firmwareImage](v29, "firmwareImage")
                            && -[FirmwareBundle firmwareLocalURL](v29, "firmwareLocalURL"))
                          {
                            -[FirmwareBundle loadFirmwareImage](v29, "loadFirmwareImage");
                          }

                          if (-[FirmwareBundle firmwareImage](v29, "firmwareImage"))
                          {
                            unint64_t v31 = -[NSDictionary objectForKey:]( -[FirmwareBundle buildManifest](v29, "buildManifest"),  "objectForKey:",  @"BuildIdentities");
                            self->_buildIdentities = v31;
                            if (v31)
                            {
                              unint64_t v32 = v31;
                              buildIdentities = self->_buildIdentities;
                              goto LABEL_50;
                            }

                            v48 = @"Unable to find BuildIdentities in firmwareBundle.buildManifest";
                          }

                          else
                          {
                            v48 = @"Unable to find firmwareImage from MobileAsset";
                          }
                        }

                        else
                        {
                          v48 = @"Unable to find BuildManifest.plist";
                        }
                      }

                      else
                      {
                        v48 = @"Unable to allocate FirmwareBundle object";
                      }
                    }

                    else
                    {
                      v48 = @"No firmware bundle URL";
                    }

                    int v49 = 6;
                    goto LABEL_106;
                  }

                  v48 = @"Missing kManifestPropertyKeyEnableMixMatch from Accessory";
                }

                else
                {
                  v48 = @"Missing kManifestPropertyKeyNonceHash from Accessory";
                }
              }

              else
              {
                v48 = @"Missing kManifestPropertyKeySecurityMode from Accessory";
              }
            }

            else
            {
              v48 = @"Missing kManifestPropertyKeyProductionMode from Accessory";
            }
          }

          else
          {
            v48 = @"Missing kManifestPropertyKeySecurityDomain from Accessory";
          }

          int v49 = 21;
LABEL_106:
          int v46 = sub_1000081A8(0LL, v49, (uint64_t)v48, v20, v21, v22, v23, v24, (uint64_t)v51);
          goto LABEL_107;
        }

        v47 = @"PersonalizationInfo: Missing kManifestPropertyKeyChipID from Accessory";
      }

      else
      {
        v47 = @"PersonalizationInfo: Missing kManifestPropertyKeyBoardID from Accessory";
      }
    }
  }

  else
  {
    v47 = @"No Response format specified";
  }

  int v46 = sub_1000081A8(0LL, 21, (uint64_t)v47, v12, v13, v14, v15, v16, (uint64_t)@"PersonalizationRequest");
  id v19 = 0LL;
LABEL_107:
  if (!v46)
  {
    id v37 = 0LL;
    goto LABEL_76;
  }

  char v44 = 0;
LABEL_109:
  eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009358;
  block[3] = &unk_10002D608;
  block[4] = self;
  dispatch_async(eaNotificationDispatchQueue, block);
  v63 = @"Event";
  v64 = @"com.apple.fud.updateFailed";
  -[EAFirmwareUpdater updateComplete:error:]( self,  "updateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL),  v46);
  id v37 = 0LL;
  if (v19) {
LABEL_77:
  }

LABEL_78:
  if (v37) {

  }
  if ((v44 & 1) == 0) {
}
  }

- (BOOL)stitchManifestInSuperBinary:(id)a3 withManifest:(id)a4 withId:(unsigned int)a5
{
  uint64_t v7 = @"Error null data to stitchManifestInSuperBinary";
  if (!a3 || !a4) {
    goto LABEL_18;
  }
  uint64_t v10 = parseSuperBinaryAndPayloadHeaders([a3 bytes], objc_msgSend(a3, "length"));
  if (!v10)
  {
    uint64_t v7 = @"Error could not parse SuperBinary headers";
LABEL_18:
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, v7, *(void *)&a5);
    BOOL v16 = 0;
    uint64_t v15 = 0LL;
    goto LABEL_11;
  }

  uint64_t v11 = (unsigned __int16 *)v10;
  if (*(_WORD *)(v10 + 16))
  {
    id v19 = self;
    unsigned __int8 v12 = 0;
    while (1)
    {
      int v13 = v12;
      uint64_t v14 = (uint64_t)&v11[10 * v12 + 10];
      uint64_t v15 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v14,  4LL,  4LL);
      if (-[NSString isEqualToString:](v15, "isEqualToString:", @"IM4M"))
      {
        if ((*(_DWORD *)&v11[10 * v13 + 12] & a5) != 0) {
          break;
        }
      }

      unsigned __int8 v12 = v13 + 1;
    }

    if ((unint64_t)[a4 length] > *(unsigned int *)&v11[10 * v13 + 18])
    {
      uint64_t v18 = @"Error manifest too large for SuperBinary payload";
    }

    else
    {
      if (updateSuperBinaryPayload( [a3 mutableBytes],  objc_msgSend(a3, "length"),  v14,  objc_msgSend(a4, "bytes"),  objc_msgSend(a4, "length")))
      {
        BOOL v16 = 1;
        goto LABEL_10;
      }

      uint64_t v18 = @"Error could not update Manifest size in SuperBinary header";
    }

    -[EAFirmwareUpdater log:format:](v19, "log:format:", 5LL, v18);
    BOOL v16 = 0;
    goto LABEL_10;
  }

- (void)personalizationResponse:(id)a3 error:(id)a4
{
  if (!a3 || a4)
  {
    eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009770;
    block[3] = &unk_10002D630;
    block[4] = self;
    void block[5] = a4;
    block[6] = a3;
    dispatch_async(eaNotificationDispatchQueue, block);
    goto LABEL_7;
  }

  unsigned int v6 = objc_msgSend( -[NSDictionary objectForKey:]( self->_deviceOptions,  "objectForKey:",  @"PersonalizationResponseFormat"),  "unsignedIntValue");
  if (-[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"))
  {
    uint64_t v7 = -[FirmwareBundle productIDCode]( -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"),  "productIDCode");
    if (v6) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    if (v6) {
      goto LABEL_13;
    }
  }

  if (self->_buildIdentities)
  {
    unsigned int v10 = objc_msgSend( -[NSDictionary objectForKey:]( self->_manifestIDs,  "objectForKey:",  -[NSArray objectAtIndexedSubscript:]( self->_manifestList,  "objectAtIndexedSubscript:",  self->_manifestIndex - 1)),  "intValue");
    if (-[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"))
    {
      uint64_t v11 = v10 << 24;
      uint64_t v9 = -[NSMutableData initWithData:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithData:",  -[FirmwareBundle firmwareImage]( -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"),  "firmwareImage"));
      if (!-[EAFirmwareUpdater stitchManifestInSuperBinary:withManifest:withId:]( self,  "stitchManifestInSuperBinary:withManifest:withId:",  v9,  a3,  v11))
      {
        int v13 = @"Failed to stitched signed manifest into SuperBinary";
        goto LABEL_18;
      }

      unsigned __int8 v12 = -[FirmwareBundle initWithData:hashData:signatureData:certData:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithData:hashData:signatureData:certData:",  v9,  0LL,  0LL,  0LL);
      goto LABEL_14;
    }

    -[EAFirmwareUpdater handleSessionError:message:]( self,  "handleSessionError:message:",  15LL,  @"No FW bundle to stitch manifest");
LABEL_7:
    uint64_t v9 = 0LL;
    goto LABEL_19;
  }

- (void)handleSessionError:(unsigned int)a3 message:(id)a4
{
  uint64_t v9 = sub_1000081A8(0LL, a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7, v11[0]);
  eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = (uint64_t)sub_10000994C;
  v11[3] = (uint64_t)&unk_10002D608;
  v11[4] = (uint64_t)self;
  dispatch_async(eaNotificationDispatchQueue, v11);
  unsigned __int8 v12 = @"Event";
  int v13 = @"com.apple.fud.updateFailed";
  -[EAFirmwareUpdater updateComplete:error:]( self,  "updateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL),  v9);
}

- (id)applyFirmware:(id)a3 progress:(id)a4 update:(id)a5 personalization:(id)a6
{
  self->_applyCompletion = _Block_copy(a3);
  self->_progressHandler = _Block_copy(a4);
  self->_updateHandler = _Block_copy(a5);
  uint64_t v11 = _Block_copy(a6);
  self->_personalizationRequestHandler = v11;
  if (!self->_applyCompletion
    || !self->_progressHandler
    || (self->_updateHandler ? (BOOL v12 = v11 == 0LL) : (BOOL v12 = 1), v12))
  {
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Invalid handlers passed"));
    return 0LL;
  }

  iAUPServer = self->_iAUPServer;
  if (!iAUPServer)
  {
    uint64_t v14 = -[iAUPServer initInstanceWithByteEscape:]( objc_alloc(&OBJC_CLASS___iAUPServer),  "initInstanceWithByteEscape:",  self->_byteEscape);
    self->_iAUPServer = v14;
    if (!v14)
    {
      v33 = @"Can't create iAUPServer";
      int v34 = 17;
      goto LABEL_36;
    }

    -[iAUPServer setDelegate:](v14, "setDelegate:", self);
    iAUPServer = self->_iAUPServer;
  }

  -[iAUPServer setAckAppReentry:](iAUPServer, "setAckAppReentry:", self->_closeEASession);
  if (-[EAFirmwareUpdater isMultiAssetSession](self, "isMultiAssetSession")
    || -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"))
  {
    goto LABEL_26;
  }

  if (!-[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL"))
  {
    v33 = @"No firmware bundle URL";
LABEL_35:
    int v34 = 6;
    goto LABEL_36;
  }

  uint64_t v20 = -[FirmwareBundle initWithBundlePath:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithBundlePath:",  -[NSURL path](-[EAFirmwareUpdater firmwareBundleURL](self, "firmwareBundleURL"), "path"));
  if (!v20)
  {
    v33 = @"Unable to allocated FirmwareBundle object";
    goto LABEL_35;
  }

  uint64_t v21 = v20;
  uint64_t v22 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v23 = "nil";
  if (-[FirmwareBundle firmwareImage](v21, "firmwareImage")) {
    uint64_t v24 = "valid";
  }
  else {
    uint64_t v24 = "nil";
  }
  id v25 = (id)-[FirmwareBundle firmwareImageSize](v21, "firmwareImageSize");
  if (-[FirmwareBundle hash](v21, "hash")) {
    uint64_t v26 = "valid";
  }
  else {
    uint64_t v26 = "nil";
  }
  if (-[FirmwareBundle signature](v21, "signature")) {
    uint64_t v27 = "valid";
  }
  else {
    uint64_t v27 = "nil";
  }
  if (-[FirmwareBundle certificate](v21, "certificate")) {
    uint64_t v23 = "valid";
  }
  __int128 v28 =  -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"FirmwareBundle created [image=%s imageSize=%d hash=%s signature=%s cert=%s productID=%d baseAddress=%d]\n",  v24,  v25,  v26,  v27,  v23,  -[FirmwareBundle productIDCode](v21, "productIDCode"),  -[FirmwareBundle firmwareImageBaseAddress](v21, "firmwareImageBaseAddress"));
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"%s %@");
  -[iAUPServer setFirmwareBundle:](self->_iAUPServer, "setFirmwareBundle:", v21);

LABEL_26:
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_accessoryDidConnect:",  EAAccessoryDidConnectNotification,  0LL);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "_accessoryDidDisconnect:",  EAAccessoryDidDisconnectNotification,  0LL);
  __int128 v29 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater", 0LL);
  self->_eaNotificationDispatchQueue = v29;
  if (v29)
  {
    -[iAUPServer setDispatchQ:](self->_iAUPServer, "setDispatchQ:", v29);
    eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009D5C;
    block[3] = &unk_10002D608;
    block[4] = self;
    dispatch_async(eaNotificationDispatchQueue, block);
    return 0LL;
  }

  v33 = @"Unable to allocate dispatch queue for EA notifications";
  int v34 = 19;
LABEL_36:
  unint64_t v31 = sub_1000081A8( 0LL,  v34,  (uint64_t)v33,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]");
  if (v31)
  {
    id v36 = @"Event";
    id v37 = @"com.apple.fud.updateFailed";
    -[EAFirmwareUpdater updateComplete:error:]( self,  "updateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL),  v31);
  }

  return v31;
}

- (id)openSession
{
  if (-[EAFirmwareUpdater accessory](self, "accessory"))
  {
    if (-[EAFirmwareUpdater protocolString](self, "protocolString"))
    {
      NSLog(@"accessory = %@\n", -[EAFirmwareUpdater accessory](self, "accessory"));
      NSLog(@"protocolString = %@\n", -[EAFirmwareUpdater protocolString](self, "protocolString"));
      uint64_t v8 = -[EASession initWithAccessory:forProtocol:]( objc_alloc(&OBJC_CLASS___EASession),  "initWithAccessory:forProtocol:",  -[EAFirmwareUpdater accessory](self, "accessory"),  -[EAFirmwareUpdater protocolString](self, "protocolString"));
      if (v8)
      {
        uint64_t v9 = v8;
        -[EAFirmwareUpdater setSession:](self, "setSession:", v8);

        unsigned int v10 = -[EASession inputStream](self->_session, "inputStream");
        if (v10)
        {
          uint64_t v11 = v10;
          -[NSInputStream setDelegate:](v10, "setDelegate:", self);
          -[NSInputStream scheduleInRunLoop:forMode:]( v11,  "scheduleInRunLoop:forMode:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  NSDefaultRunLoopMode);
          -[NSInputStream open](v11, "open");
          BOOL v12 = -[EASession outputStream](self->_session, "outputStream");
          if (v12)
          {
            int v13 = v12;
            -[NSOutputStream setDelegate:](v12, "setDelegate:", self);
            -[NSOutputStream scheduleInRunLoop:forMode:]( v13,  "scheduleInRunLoop:forMode:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  NSDefaultRunLoopMode);
            -[NSOutputStream open](v13, "open");
            return 0LL;
          }

          uint64_t v15 = @"EASession has no output stream";
        }

        else
        {
          uint64_t v15 = @"EASession has no input stream";
        }

        int v16 = 15;
      }

      else
      {
        uint64_t v15 = @"Unable to allocate new session";
        int v16 = 14;
      }
    }

    else
    {
      uint64_t v15 = @"No protocol string";
      int v16 = 13;
    }
  }

  else
  {
    uint64_t v15 = @"No accessory";
    int v16 = 12;
  }

  return sub_1000081A8(0LL, v16, (uint64_t)v15, v3, v4, v5, v6, v7, v17);
}

- (void)closeSession
{
  if (self->_session)
  {
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater closeSession]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Closing EA Session=%@",  self->_session));
    uint64_t v3 = -[EASession inputStream](self->_session, "inputStream");
    if (v3)
    {
      uint64_t v4 = v3;
      -[NSInputStream close](v3, "close");
      -[NSInputStream removeFromRunLoop:forMode:]( v4,  "removeFromRunLoop:forMode:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  NSDefaultRunLoopMode);
    }

    uint64_t v5 = -[EASession outputStream](self->_session, "outputStream");
    if (v5)
    {
      uint64_t v6 = v5;
      -[NSOutputStream close](v5, "close");
      -[NSOutputStream removeFromRunLoop:forMode:]( v6,  "removeFromRunLoop:forMode:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  NSDefaultRunLoopMode);
    }

    self->_session = 0LL;
  }

- (id)writeData:(id)a3
{
  if (a3)
  {
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5,  @"%s %@",  "-[EAFirmwareUpdater writeData:]",   -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"- writing %u bytes",  [a3 length]));
    if (!-[EAFirmwareUpdater isMultiAssetSession](self, "isMultiAssetSession") && !self->_closeEASession)
    {
      unsigned int v10 = [a3 bytes];
      uint64_t v11 = 3LL;
      if (!self->_byteEscape) {
        uint64_t v11 = 4LL;
      }
      if (v10[v11] == 65 && !self->_skipReconnect) {
        -[EAFirmwareUpdater startReconnectTimer:](self, "startReconnectTimer:", 2LL);
      }
    }

    outputData = self->_outputData;
    if (outputData)
    {
      -[NSMutableData appendData:](outputData, "appendData:", a3);
      return -[EAFirmwareUpdater flushOutput](self, "flushOutput");
    }

    int v13 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", a3);
    self->_outputData = v13;
    if (v13) {
      return -[EAFirmwareUpdater flushOutput](self, "flushOutput");
    }
    uint64_t v14 = @"Couldn't allocate NSMutableData object to store bytes to be written";
    int v15 = 16;
  }

  else
  {
    uint64_t v14 = @"No data to write";
    int v15 = 18;
  }

  return sub_1000081A8(0LL, v15, (uint64_t)v14, v3, v4, v5, v6, v7, v17);
}

- (void)logStatusString:(id)a3
{
}

- (void)updateProgress:(double)a3
{
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](a3);
  }
}

- (id)createEndOfUpdateEventDict:(id)a3 error:(id)a4
{
  id v7 = [a3 objectForKey:@"Event"];
  if (!v7)
  {
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"Event = NULL");
    uint64_t v23 = 0LL;
    goto LABEL_23;
  }

  uint64_t v8 = v7;
  if (self->_updateStartTime)
  {
    -[NSDate timeIntervalSinceDate:]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceDate:",  self->_updateStartTime);
    double v10 = v9;
    self->_currentSessionTimeTaken = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v9);
  }

  else
  {
    double v10 = 0.0;
  }

  id v11 = objc_msgSend( -[iAUPServer getNumberOfBytesDownloadedInCurrentSession]( self->_iAUPServer,  "getNumberOfBytesDownloadedInCurrentSession"),  "unsignedIntValue");
  id v12 = v11;
  if (v10 == 0.0) {
    uint64_t v26 = (NSNumber *)&off_100034C80;
  }
  else {
    uint64_t v26 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  ((double)(8 * (_DWORD)v11) / v10));
  }
  uint64_t v13 = -[NSNumber unsignedIntValue](self->_cumulativeBytesDownloaded, "unsignedIntValue") + v12;
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"_cumulativeBytesDownloaded = %d (= %d earlier + %d current session)",  v13,  -[NSNumber unsignedIntValue](self->_cumulativeBytesDownloaded, "unsignedIntValue"),  v12);
  self->_cumulativeBytesDownloaded = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v13);
  if (-[NSNumber unsignedIntValue](self->_totalBytesForCompleteUpdate, "unsignedIntValue"))
  {
    -[NSNumber floatValue](self->_totalBytesForCompleteUpdate, "floatValue");
    uint64_t v15 = (float)((float)((float)v13 / v14) * 100.0);
    self->_cumulativeProgressPercent = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v15);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"_totalBytesForCompleteUpdate = %d, So _cumulativeProgressPercent = %d [ = (%d / %d) * 100 ]",  -[NSNumber unsignedIntValue](self->_totalBytesForCompleteUpdate, "unsignedIntValue"),  v15,  v13,  -[NSNumber unsignedIntValue](self->_totalBytesForCompleteUpdate, "unsignedIntValue"));
  self->_cumulativeTimeTaken = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSNumber unsignedIntValue](self->_currentSessionTimeTaken, "unsignedIntValue")
                               + -[NSNumber unsignedIntValue](self->_cumulativeTimeTaken, "unsignedIntValue"));
  self->_cumulativeCloakTime = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSNumber unsignedIntValue](self->_currentSessionCloakTime, "unsignedIntValue")
                               + -[NSNumber unsignedIntValue](self->_cumulativeCloakTime, "unsignedIntValue"));
  int v16 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSNumber unsignedIntValue](self->_resumeCount, "unsignedIntValue") + 1);
  if (a4)
  {
    uint64_t v17 = v26;
    if ([a4 userInfo]
      && objc_msgSend(objc_msgSend(a4, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey))
    {
      uint64_t v18 = (const __CFString *)objc_msgSend(objc_msgSend(a4, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    }

    else
    {
      uint64_t v18 = @"Unknown";
    }
  }

  else
  {
    uint64_t v18 = @"Unknown";
    uint64_t v17 = v26;
  }

  cumulativeProgressPercent = self->_cumulativeProgressPercent;
  v27[0] = @"cumulativeProgressPercent";
  v27[1] = @"currentSessionTimeTaken";
  currentSessionTimeTaken = self->_currentSessionTimeTaken;
  v28[0] = cumulativeProgressPercent;
  v28[1] = currentSessionTimeTaken;
  cumulativeTimeTaken = self->_cumulativeTimeTaken;
  v27[2] = @"cumulativeTimeTaken";
  v27[3] = @"cumulativeCloakingTime";
  cumulativeCloakTime = self->_cumulativeCloakTime;
  v28[2] = cumulativeTimeTaken;
  v28[3] = cumulativeCloakTime;
  v27[4] = @"averageBitRate";
  v27[5] = @"totalSessionCount";
  v28[4] = v17;
  v28[5] = v16;
  v27[6] = @"error";
  v28[6] = v18;
  uint64_t v23 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  7LL));
  if (([v8 isEqualToString:@"com.apple.fud.updateCompleted"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"com.apple.fud.updateInterrupted"])
    {
      uint64_t v24 = @"interruptedState";
LABEL_22:
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", @"FailureStateApply", v24);
      goto LABEL_23;
    }

    if ([v8 isEqualToString:@"com.apple.fud.updateFailed"])
    {
      uint64_t v24 = @"failureState";
      goto LABEL_22;
    }
  }

- (void)handleFirmwareUpdateStatus:(id)a3
{
  if (a3)
  {
    id v5 = [a3 objectForKey:@"Event"];
    if (([v5 isEqualToString:@"com.apple.fud.updateStarted"] & 1) != 0
      || [v5 isEqualToString:@"com.apple.fud.updateResumed"])
    {
      self->_updateStartTime = +[NSDate date](&OBJC_CLASS___NSDate, "date");
      self->_cumulativeBytesDownloaded = (NSNumber *)[a3 objectForKeyedSubscript:@"totalBytesDownloadedSoFar"];
      self->_totalBytesForCompleteUpdate = (NSNumber *)[a3 objectForKeyedSubscript:@"totalBytesForCompleteUpdate"];
      -[NSNumber floatValue](self->_cumulativeBytesDownloaded, "floatValue");
      float v7 = v6;
      -[NSNumber floatValue](self->_totalBytesForCompleteUpdate, "floatValue");
      self->_resumedFromPercentNum = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (float)((float)(v7 / v8) * 100.0));
      self->_resumeCount = (NSNumber *)[a3 objectForKeyedSubscript:@"resumeCount"];
      self->_cumulativeCloakTime = (NSNumber *)[a3 objectForKeyedSubscript:@"cumulativeCloakTime"];
      self->_cumulativeTimeTaken = (NSNumber *)[a3 objectForKeyedSubscript:@"cumulativeUpdateTime"];
      v13[0] = @"Event";
      v13[1] = @"transportType";
      v14[0] = v5;
      v14[1] = @"EATransport";
      resumedFromPercentNum = self->_resumedFromPercentNum;
      v13[2] = @"resumingFromPercent";
      v13[3] = @"resumeCount";
      resumeCount = self->_resumeCount;
      v14[2] = resumedFromPercentNum;
      v14[3] = resumeCount;
      id v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL);
    }

    else
    {
      id v11 = 0LL;
    }

    updateHandler = (void (**)(id, NSDictionary *))self->_updateHandler;
    if (updateHandler) {
      updateHandler[2](updateHandler, v11);
    }
  }

- (void)firmwareUpdateComplete:(id)a3 error:(id)a4
{
  if (a4)
  {
    -[EAFirmwareUpdater updateComplete:error:](self, "updateComplete:error:", a3);
  }

  else
  {
    self->_firmwareUpdateComplete = 1;
    if (self->_isMultiAssetSession
      || -[iAUPServer iAUPVersion](self->_iAUPServer, "iAUPVersion") == 2
      || self->_closeEASession)
    {
      -[EAFirmwareUpdater updateComplete:error:](self, "updateComplete:error:", a3, 0LL);
      eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000AB68;
      block[3] = &unk_10002D608;
      block[4] = self;
      dispatch_async(eaNotificationDispatchQueue, block);
    }
  }

- (unsigned)getPersonalizationID
{
  manifestList = self->_manifestList;
  if (!manifestList)
  {
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"Error: _manifestList = NULL n");
    return 1;
  }

  if (!self->_manifestIDs) {
    return 1;
  }
  unint64_t manifestIndex = self->_manifestIndex;
  if (-[NSArray count](manifestList, "count") <= manifestIndex) {
    return 1;
  }
  return objc_msgSend( -[NSDictionary objectForKey:]( self->_manifestIDs,  "objectForKey:",  -[NSArray objectAtIndexedSubscript:]( self->_manifestList,  "objectAtIndexedSubscript:",  self->_manifestIndex)),  "intValue") | 1;
}

- (void)updateComplete:(id)a3 error:(id)a4
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"error=%@", a4);
  -[EAFirmwareUpdater stopReconnectTimer](self, "stopReconnectTimer");
  eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AE28;
  block[3] = &unk_10002D608;
  block[4] = self;
  dispatch_async(eaNotificationDispatchQueue, block);
  if (!self->_applyCompletion) {
    goto LABEL_16;
  }
  if (a3)
  {
    id v8 = -[EAFirmwareUpdater createEndOfUpdateEventDict:error:](self, "createEndOfUpdateEventDict:error:", a3, a4);
    if (objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"Event"),  "isEqualToString:",  @"com.apple.fud.updateInterrupted"))
    {
      id v9 = [a4 userInfo];
      uint64_t v10 = 1LL;
    }

    else
    {
      if (!objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"Event"),  "isEqualToString:",  @"com.apple.fud.updateFailed"))
      {
        id v11 = 0LL;
        goto LABEL_10;
      }

      id v9 = [a4 userInfo];
      uint64_t v10 = 4LL;
    }

    id v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain",  v10,  v9);
  }

  else
  {
    id v11 = 0LL;
    id v8 = 0LL;
  }

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"stream %@ event none", a3);
      break;
    case 1uLL:
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"stream %@ event open completed", a3);
      break;
    case 2uLL:
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"stream %@ event bytes available", a3);
      eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
      if (eaNotificationDispatchQueue)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472LL;
        v8[2] = sub_10000AF88;
        v8[3] = &unk_10002D608;
        v8[4] = self;
        float v6 = v8;
        goto LABEL_10;
      }

      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"stream %@ event space available", a3);
      eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
      if (eaNotificationDispatchQueue)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000AF90;
        block[3] = &unk_10002D608;
        block[4] = self;
        float v6 = block;
LABEL_10:
        dispatch_async(eaNotificationDispatchQueue, v6);
      }

      break;
    case 8uLL:
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"stream %@ event error", a3);
      break;
    default:
      if (a4 == 16) {
        -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"stream %@ event end encountered", a3);
      }
      break;
  }

- (id)flushOutput
{
  p_flushOutputLock = &self->_flushOutputLock;
  pthread_mutex_lock(&self->_flushOutputLock);
  if (-[EAFirmwareUpdater accessory](self, "accessory"))
  {
    session = self->_session;
    if (session)
    {
      uint64_t v10 = -[EASession outputStream](session, "outputStream");
      if (v10)
      {
        id v11 = v10;
        if (-[NSOutputStream hasSpaceAvailable](v10, "hasSpaceAvailable"))
        {
          while (-[NSMutableData length](self->_outputData, "length"))
          {
            uint64_t v12 = -[NSOutputStream write:maxLength:]( v11,  "write:maxLength:",  -[NSMutableData bytes](self->_outputData, "bytes"),  -[NSMutableData length](self->_outputData, "length"));
            if (v12 == -1)
            {
              uint64_t v15 = @"Failure attempting to write to NSOutputStream";
              int v16 = 16;
              goto LABEL_13;
            }

            if (v12 >= 1) {
              -[NSMutableData replaceBytesInRange:withBytes:length:]( self->_outputData,  "replaceBytesInRange:withBytes:length:",  0LL,  v12,  0LL,  0LL);
            }
            if (!-[NSOutputStream hasSpaceAvailable](v11, "hasSpaceAvailable")) {
              goto LABEL_10;
            }
          }
        }

        goto LABEL_10;
      }

      uint64_t v15 = @"No output stream on session";
      int v16 = 15;
    }

    else
    {
      uint64_t v15 = @"No session";
      int v16 = 14;
    }

- (void)handleInputData
{
  if (self->_iAUPServer)
  {
    session = self->_session;
    if (session)
    {
      uint64_t v4 = -[EASession inputStream](session, "inputStream");
      if (v4)
      {
        uint64_t v5 = v4;
        if (-[NSInputStream hasBytesAvailable](v4, "hasBytesAvailable"))
        {
          do
          {
            uint64_t v6 = -[NSInputStream read:maxLength:](v5, "read:maxLength:", v9, 128LL);
            -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"read %d bytes\n", v6);
            if (v6 >= 1)
            {
              uint64_t v7 = v9;
              do
              {
                unsigned int v8 = *v7++;
                -[iAUPServer processInByte:](self->_iAUPServer, "processInByte:", v8);
                --v6;
              }

              while (v6);
            }
          }

          while (-[NSInputStream hasBytesAvailable](v5, "hasBytesAvailable"));
        }
      }
    }
  }

- (void)_accessoryDidConnect:(id)a3
{
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3052000000LL;
  v22[3] = sub_10000B5D8;
  v22[4] = sub_10000B5E8;
  v22[5] = 0LL;
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater _accessoryDidConnect:]",  -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"notification=%@", a3));
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater _accessoryDidConnect:]",   -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"_isExpectingReconnect=%d _isMultiAssetSession=%d current=[%@:%lu:FWvA%@:FWvP%@] ",  self->_isExpectingReconnect,  self->_isMultiAssetSession,  -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self, "accessory"), "modelNumber"),  -[EAAccessory connectionID](-[EAFirmwareUpdater accessory](self, "accessory"), "connectionID"),  -[EAAccessory firmwareRevisionActive]( -[EAFirmwareUpdater accessory](self, "accessory"),  "firmwareRevisionActive"),  -[EAAccessory firmwareRevisionPending]( -[EAFirmwareUpdater accessory](self, "accessory"),  "firmwareRevisionPending")));
  if (a3)
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
    if (v5)
    {
      id v6 = -[EAFirmwareUpdater supportedProtocolForAccessory:](self, "supportedProtocolForAccessory:", v5);
      if (v6)
      {
        unsigned __int8 v7 = objc_msgSend(objc_msgSend(v5, "serialNumber"), "isEqualToString:", self->_serialNumber);
        if (self->_excludeUniqueAccessoryCheck) {
          char v8 = 1;
        }
        else {
          char v8 = v7;
        }
        if ((v8 & 1) == 0)
        {
          -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5,  @"%s %@",  "-[EAFirmwareUpdater _accessoryDidConnect:]",   -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%s: notification tracking different accessory, expected serial# %@ got %@",  "-[EAFirmwareUpdater _accessoryDidConnect:]",  self->_serialNumber,  [v5 serialNumber]));
          goto LABEL_20;
        }

        int isExpectingReconnect = self->_isExpectingReconnect;
        -[EAFirmwareUpdater stopReconnectTimer](self, "stopReconnectTimer");
        if (objc_msgSend( v6,  "isEqualToString:",  -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol")))
        {
          if (isExpectingReconnect == 1)
          {
            eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
            if (eaNotificationDispatchQueue)
            {
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472LL;
              v21[2] = sub_10000B5F4;
              v21[3] = &unk_10002D658;
              v21[4] = self;
              v21[5] = v5;
              id v11 = v21;
LABEL_16:
              dispatch_async(eaNotificationDispatchQueue, v11);
              goto LABEL_20;
            }

- (void)_accessoryDidDisconnect:(id)a3
{
  -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s %@",  "-[EAFirmwareUpdater _accessoryDidDisconnect:]",  -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"notification=%@", a3));
  if (self->_eaNotificationDispatchQueue)
  {
    objc_sync_enter(self);
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
    -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5,  @"%s %@",  "-[EAFirmwareUpdater _accessoryDidDisconnect:]",   -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"_isExpectingReconnect=%d _isMultiAssetSession=%d disconnecting=[%@:%lu:FWvA%@:FWvP%@] current=[%@:%lu:FWvA%@:FWP%@]",  self->_isExpectingReconnect,  self->_isMultiAssetSession,  [v5 modelNumber],  objc_msgSend(v5, "connectionID"),  objc_msgSend(v5, "firmwareRevisionActive"),  objc_msgSend(v5, "firmwareRevisionPending"),  -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self, "accessory"), "modelNumber"),  -[EAAccessory connectionID](-[EAFirmwareUpdater accessory](self, "accessory"), "connectionID"),  -[EAAccessory firmwareRevisionActive]( -[EAFirmwareUpdater accessory](self, "accessory"),  "firmwareRevisionActive"),  -[EAAccessory firmwareRevisionPending]( -[EAFirmwareUpdater accessory](self, "accessory"),  "firmwareRevisionPending")));
    eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B8C4;
    block[3] = &unk_10002D658;
    block[4] = v5;
    void block[5] = self;
    dispatch_async(eaNotificationDispatchQueue, block);
    objc_sync_exit(self);
  }

- (EAAccessory)accessory
{
  return self->_accessory;
}

- (EASession)session
{
  return self->_session;
}

- (NSString)protocolString
{
  return self->_protocolString;
}

- (void)setProtocolString:(id)a3
{
}

- (BOOL)overrideProtocol
{
  return self->_overrideProtocol;
}

- (void)setOverrideProtocol:(BOOL)a3
{
  self->_overrideProtocol = a3;
}

- (NSString)bootloaderProtocol
{
  return self->_bootloaderProtocol;
}

- (void)setBootloaderProtocol:(id)a3
{
}

- (NSString)appProtocol
{
  return self->_appProtocol;
}

- (void)setAppProtocol:(id)a3
{
}

- (NSString)multiAssetAppProtocol
{
  return self->_multiAssetAppProtocol;
}

- (void)setMultiAssetAppProtocol:(id)a3
{
}

- (NSString)firmwareBundleFilename
{
  return self->_updateBundleFilename;
}

- (void)setFirmwareBundleFilename:(id)a3
{
}

- (NSURL)firmwareBundleURL
{
  return self->_updateBundleURL;
}

- (void)setFirmwareBundleURL:(id)a3
{
}

- (id)applyCompletion
{
  return self->_applyCompletion;
}

- (void)setApplyCompletion:(id)a3
{
}

- (BOOL)forceSilentUpdate
{
  return self->_forceSilentUpdate;
}

- (void)setForceSilentUpdate:(BOOL)a3
{
  self->_forceSilentUpdate = a3;
}

- (BOOL)skipDFUMode
{
  return self->_skipDFUMode;
}

- (void)setSkipDFUMode:(BOOL)a3
{
  self->_skipDFUMode = a3;
}

- (BOOL)isMultiAssetSession
{
  return self->_isMultiAssetSession;
}

- (void)setIsMultiAssetSession:(BOOL)a3
{
  self->_isMultiAssetSession = a3;
}

- (BOOL)closeEASession
{
  return self->_closeEASession;
}

- (void)setCloseEASession:(BOOL)a3
{
  self->_closeEASession = a3;
}

- (BOOL)excludeUniqueAccessoryCheck
{
  return self->_excludeUniqueAccessoryCheck;
}

- (void)setExcludeUniqueAccessoryCheck:(BOOL)a3
{
  self->_excludeUniqueAccessoryCheck = a3;
}

- (NSString)currentFirmwareVersionOnAcc
{
  return self->_currentFirmwareVersionOnAcc;
}

- (void)setCurrentFirmwareVersionOnAcc:(id)a3
{
}

- (NSString)firmwareVersionAvailable
{
  return self->_firmwareVersionAvailable;
}

- (void)setFirmwareVersionAvailable:(id)a3
{
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (NSNumber)resumedFromPercentNum
{
  return self->_resumedFromPercentNum;
}

- (void)setResumedFromPercentNum:(id)a3
{
}

- (NSNumber)resumeCount
{
  return self->_resumeCount;
}

- (void)setResumeCount:(id)a3
{
}

- (NSNumber)cumulativeProgressPercent
{
  return self->_cumulativeProgressPercent;
}

- (void)setCumulativeProgressPercent:(id)a3
{
}

- (NSNumber)cumulativeTimeTaken
{
  return self->_cumulativeTimeTaken;
}

- (void)setCumulativeTimeTaken:(id)a3
{
}

- (NSNumber)cumulativeCloak
{
  return self->_cumulativeCloak;
}

- (void)setCumulativeCloak:(id)a3
{
}

- (NSNumber)currentSessionTimeTaken
{
  return self->_currentSessionTimeTaken;
}

- (void)setCurrentSessionTimeTaken:(id)a3
{
}

- (NSDictionary)manifestIDs
{
  return self->_manifestIDs;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end