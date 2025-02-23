@interface UARPServiceUARPControllerManager
+ (id)instance;
- (BOOL)_createUARPLogPath;
- (BOOL)getAndRemoveFromUARPTransportDict:(id)a3;
- (BOOL)registerUARPService:(id)a3 withUARPAccessory:(id)a4 withUARPAssetID:(id)a5;
- (BOOL)relayAACPUARP:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)startTapToRadar;
- (BOOL)tapToRadarIsOngoing;
- (BOOL)unregisterUARPService:(id)a3 withUARPAccessory:(id)a4;
- (NSMutableDictionary)uarpAACPTransportAvailability;
- (NSString)uarpLogPath;
- (UARPController)uarpController;
- (UARPServiceUARPControllerManager)init;
- (id)_getUARPLogPath;
- (id)uarpServiceForAccessoryUuid:(id)a3;
- (void)addUARPTransportDict:(id)a3 UARPAACPSupported:(id)a4;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)setOpportunisticConnection:(BOOL)a3 forAccessoryUUID:(id)a4;
- (void)setUarpAACPTransportAvailability:(id)a3;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stopTapToRadar;
@end

@implementation UARPServiceUARPControllerManager

+ (id)instance
{
  if (qword_100070CB0 != -1) {
    dispatch_once(&qword_100070CB0, &stru_10005D5A0);
  }
  return (id)qword_100070CA8;
}

- (UARPServiceUARPControllerManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPServiceUARPControllerManager;
  v2 = -[UARPServiceUARPControllerManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = [+[NSMutableDictionary dictionary] autorelease];
    uarpAccessoryUARPServiceMap = v2->uarpAccessoryUARPServiceMap;
    v2->uarpAccessoryUARPServiceMap = (NSMutableDictionary *)v3;

    v5 = objc_opt_new(&OBJC_CLASS___UARPController);
    uarpController = v2->_uarpController;
    v2->_uarpController = v5;

    -[UARPController setDelegate:](v2->_uarpController, "setDelegate:", v2);
    -[UARPController startPersonalizationHelperService:entitlement:]( v2->_uarpController,  "startPersonalizationHelperService:entitlement:",  @"com.apple.uarppersonalization.btleserver",  @"com.apple.uarppersonalization.btleserver");
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager _getUARPLogPath](v2, "_getUARPLogPath"));
    uarpLogPath = v2->_uarpLogPath;
    v2->_uarpLogPath = (NSString *)v7;

    -[UARPServiceUARPControllerManager _createUARPLogPath](v2, "_createUARPLogPath");
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uarpAACPTransportAvailability = v2->_uarpAACPTransportAvailability;
    v2->_uarpAACPTransportAvailability = v9;

    v2->_tapToRadarIsOngoing = 0;
  }

  return v2;
}

- (BOOL)registerUARPService:(id)a3 withUARPAccessory:(id)a4 withUARPAssetID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
  unsigned __int8 v12 = [v11 addAccessory:v9 assetID:v10];

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C658();
    }
    goto LABEL_8;
  }

  v13 = -[UARPServiceUARPControllerManager uarpController];
  unsigned __int8 v14 = [v13 accessoryReachable:v9];

  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C5F8();
    }
LABEL_8:
    BOOL v17 = 0;
    goto LABEL_9;
  }

  uarpAccessoryUARPServiceMap = self->uarpAccessoryUARPServiceMap;
  v16 = [v9 uuid];
  -[NSMutableDictionary setObject:forKey:](uarpAccessoryUARPServiceMap, "setObject:forKey:", v8, v16);

  BOOL v17 = 1;
LABEL_9:

  return v17;
}

- (BOOL)unregisterUARPService:(id)a3 withUARPAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [self uarpController];
    unsigned __int8 v9 = [v8 accessoryUnreachable:v7];

    if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C764();
    }
    id v10 = [self uarpController];
    unsigned __int8 v11 = [v10 removeAccessory:v7];

    if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C704();
    }
    uarpAccessoryUARPServiceMap = self->uarpAccessoryUARPServiceMap;
    v13 = [v7 uuid];
    -[NSMutableDictionary removeObjectForKey:](uarpAccessoryUARPServiceMap, "removeObjectForKey:", v13);
  }

  else
  {
    unsigned __int8 v14 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003C6D4(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  return 1;
}

- (id)uarpServiceForAccessoryUuid:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->uarpAccessoryUARPServiceMap, "objectForKey:", a3);
}

- (id)_getUARPLogPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@/Logs/Bluetooth/UARPLogs", v5);

  return v6;
}

- (BOOL)_createUARPLogPath
{
  uint64_t v3 = (void *)[NSFileManager defaultManager];
  uarpLogPath = self->_uarpLogPath;
  id v7 = 0LL;
  [v3 createDirectoryAtPath:uarpLogPath withIntermediateDirectories:1 attributes:0 error:&v7];
  id v5 = v7;

  if (v5 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003C7C4();
  }

  return v5 == 0LL;
}

- (void)addUARPTransportDict:(id)a3 UARPAACPSupported:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003C824(v8, v6);
  }
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[UARPServiceUARPControllerManager uarpAACPTransportAvailability]( self,  "uarpAACPTransportAvailability"));
  [v9 setObject:v7 forKey:v6];
}

- (BOOL)getAndRemoveFromUARPTransportDict:(id)a3
{
  id v4 = a3;
  id v5 = [self->_uarpAACPTransportAvailability objectForKey:v4];

  id v6 = (void *)qword_100070CC8;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_10003C934(v6, v4);
    }
    id v8 = [self uarpAACPTransportAvailability];
    unsigned __int8 v9 = (void *)[v8 objectForKey:v4];
    BOOL v10 = v9 != 0LL;

    -[NSMutableDictionary removeObjectForKey:](self->_uarpAACPTransportAvailability, "removeObjectForKey:", v4);
  }

  else
  {
    if (v7) {
      sub_10003C8AC(v6, v4);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)relayAACPUARP:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003C9BC(v9, v7, v8);
  }
  BOOL v10 = [self uarpServiceForAccessoryUuid:v7];
  [v10 recvDataOverAACP:v8];

  return 1;
}

- (void)setOpportunisticConnection:(BOOL)a3 forAccessoryUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "setOpportunisticConnection - isOpportunistic %u, uuid %@",  (uint8_t *)v10,  0x12u);
  }

  id v8 = -[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:v6];
  unsigned __int8 v9 = v8;
  if (v4) {
    [v8 decOpportunisticConnection];
  }
  else {
    [v8 incOpportunisticConnection];
  }
}

- (BOOL)startTapToRadar
{
  uint64_t v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    id v5 = [self uarpLogPath];
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "startTapToRadar - URL %@",  (uint8_t *)&v11,  0xCu);
  }

  self->_tapToRadarIsOngoing = 1;
  id v6 = [self uarpController];
  id v7 = [self uarpLogPath];
  id v8 = [NSURL fileURLWithPath:v7 isDirectory:1LL];
  unsigned __int8 v9 = [v6 startTapToRadar:v8];

  return v9;
}

- (void)stopTapToRadar
{
  uint64_t v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopTapToRadar", v5, 2u);
  }

  self->_tapToRadarIsOngoing = 0;
  BOOL v4 = [self uarpController];
  [v4 stopTapToRadar];
}

- (BOOL)tapToRadarIsOngoing
{
  return self->_tapToRadarIsOngoing;
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003CA6C((uint64_t)v7, v9, v8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E530;
  block[3] = &unk_10005D5C8;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(&_dispatch_main_q, block);

  return 1;
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "assetAvailablityUpdateForAccessoryID - accessory:%@ assetID:%@",  buf,  0x16u);
  }

  if ([v7 updateAvailabilityStatus] == (id)4)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    unsigned __int8 v10 = [v9 downloadAvailableFirmwareUpdate:v6 assetID:v7 withUserIntent:1];

    if ((v10 & 1) == 0)
    {
      id v11 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003CB00(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }

  else if ([v7 updateAvailabilityStatus] == (id)3)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    id v32 = v6;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    unsigned int v21 = [v19 stageFirmwareUpdateOnAccessoryList:v20 withUserIntent:1];

    if (v21)
    {
      v22 = [v6 uuid];
      v23 = [self uarpServiceForAccessoryUuid:v22];
      [v23 incOpportunisticConnection];
    }

    else
    {
      v24 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003CB30(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138413058;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    __int16 v18 = 2048;
    unint64_t v19 = a6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "firmwareStagingProgress - accessory:%@ assetID:%@ %lu/%lu",  (uint8_t *)&v12,  0x2Au);
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "firmwareStagingComplete - accessory:%@ assetID:%@ status:%s",  buf,  0x20u);
  }

  if (!a5)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[UARPServiceUARPControllerManager uarpController](self, "uarpController"));
    id v14 = v8;
    id v13 = [NSArray arrayWithObjects:&v14, 1LL];
    [v12 applyStagedFirmwareOnAccessoryList:v13 withUserIntent:1];
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2080;
    uint64_t v14 = UARPFirmwareApplicationStatusToString(a4);
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "stagedFirmwareApplicationComplete - accessory:%@ status:%s",  (uint8_t *)&v11,  0x16u);
  }

  id v9 = [v6 uuid];
  id v10 = [self uarpServiceForAccessoryUuid:v9];
  [v10 decOpportunisticConnection];
}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = a4;
    id v12 = [v8 uuid];
    __int16 v13 = [v11 tag];

    int v16 = 138413058;
    __int16 v17 = v12;
    __int16 v18 = 1024;
    unsigned int v19 = [v13 tag];
    __int16 v20 = 2080;
    uint64_t v21 = UARPFirmwareStagingCompletionStatusToString(a5);
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "assetSolicitationComplete: Accessory %@ returning asset tag 0x%08x status %s (%lu)",  (uint8_t *)&v16,  0x26u);
  }

  uint64_t v14 = (void *)[v8 uuid];
  id v15 = [self uarpServiceForAccessoryUuid:v14];
  [v15 assetSolicitationComplete];
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "queryCompleteForAccessory: HW Fusing type updated for accessory %@",  (uint8_t *)&v17,  0xCu);
  }

  id v12 = (void *)[v8 uuid];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:]( self,  "uarpServiceForAccessoryUuid:",  v12));
  char v14 = objc_opt_respondsToSelector(v13, "queryCompleteForAccessory:hwFusingType:error:");

  if ((v14 & 1) != 0)
  {
    id v15 = [v8 uuid];
    int v16 = (void *)objc_claimAutoreleasedReturnValue( -[UARPServiceUARPControllerManager uarpServiceForAccessoryUuid:]( self,  "uarpServiceForAccessoryUuid:",  v15));
    [v16 queryCompleteForAccessory:v8 hwFusingType:v9 error:v10];
  }
}

- (UARPController)uarpController
{
  return self->_uarpController;
}

- (NSString)uarpLogPath
{
  return self->_uarpLogPath;
}

- (NSMutableDictionary)uarpAACPTransportAvailability
{
  return self->_uarpAACPTransportAvailability;
}

- (void)setUarpAACPTransportAvailability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end