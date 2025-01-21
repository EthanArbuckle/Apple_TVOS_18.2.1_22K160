@interface UARPService
+ (id)UUID;
- (BOOL)isSendingData;
- (BOOL)uarpOverAACP;
- (CBCharacteristic)uarpDataControlPointCharacteristic;
- (NSMutableArray)txDataQueue;
- (NSMutableData)recvDataMessage;
- (NSURL)loggingSuperbinaryURL;
- (UARPAccessory)uarpAccessory;
- (UARPAssetID)uarpAssetID;
- (UARPService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (id)_createPacket:(unint64_t)a3 payloadOffset:(unint64_t)a4 payloadLength:(unint64_t)a5 payload:(id)a6;
- (id)_extractPayload:(id)a3;
- (id)_packetizeData:(id)a3;
- (int64_t)opportunisticRefCount;
- (unint64_t)maxPayloadSize;
- (unsigned)_extractHeader:(id)a3;
- (void)_parseRecvdAACPData:(id)a3;
- (void)_parseRecvdData:(id)a3;
- (void)_prepareForFirmwareDownload;
- (void)assetSolicitationComplete;
- (void)decOpportunisticConnection;
- (void)incOpportunisticConnection;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)recvDataOverAACP:(id)a3;
- (void)sendData:(id)a3;
- (void)setIsSendingData:(BOOL)a3;
- (void)setLoggingSuperbinaryURL:(id)a3;
- (void)setMaxPayloadSize:(unint64_t)a3;
- (void)setOpportunisticRefCount:(int64_t)a3;
- (void)setRecvDataMessage:(id)a3;
- (void)setTxDataQueue:(id)a3;
- (void)setUarpAccessory:(id)a3;
- (void)setUarpAssetID:(id)a3;
- (void)setUarpDataControlPointCharacteristic:(id)a3;
- (void)setUarpOverAACP:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation UARPService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDUnifiedAccessoryRestoreProtocolServiceString);
}

- (UARPService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UARPService;
  id v7 = a4;
  v8 = -[ClientService initWithManager:peripheral:service:](&v16, "initWithManager:peripheral:service:", a3, v7, a5);
  v9 = v8;
  if (v8) {
    -[ClientService setIsPrimary:](v8, "setIsPrimary:", 1LL, v16.receiver, v16.super_class);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance",  v16.receiver,  v16.super_class));
  v11 = (void *)[v7 identifier];

  -[UARPService setUarpOverAACP:](v9, "setUarpOverAACP:", [v10 getAndRemoveFromUARPTransportDict:v11]);
  v12 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    unsigned int v14 = -[UARPService uarpOverAACP](v9, "uarpOverAACP");
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "UARPService: setting uarpOverAACP to %u",  buf,  8u);
  }

  return v9;
}

- (void)start
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting UARP procedure", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UARPService;
  -[ClientService start](&v15, "start");
  v4 = [UARPServiceUARPControllerManager instance];
  if (([v4 tapToRadarIsOngoing] & 1) == 0)
  {

    goto LABEL_7;
  }

  v5 = [LoggingManager instance];
  v6 = [self peripheral];
  id v7 = [v6 identifier];
  unsigned int v8 = [v5 wasUUIDRequestedForLogRetrieval:v7];

  if (!v8)
  {
LABEL_7:
    v9 = [CattManager instance];
    v10 = [self peripheral];
    [v9 setOpportunisticConnection:v10];
    goto LABEL_8;
  }

  v9 = [CattManager instance];
  v10 = [self peripheral];
  [v9 removeOpportunisticConnection:v10];
LABEL_8:

  v11 = [CBUUID UUIDWithString:CBUUIDUARPDataControlPointCharacteristicString];
  v17 = v11;
  v12 = [NSArray arrayWithObjects:count:&v17, 1LL];

  v13 = [self peripheral];
  unsigned int v14 = (void *)[self service];
  [v13 discoverCharacteristics:v12 forService:v14];
}

- (void)stop
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping UARP procedure", buf, 2u);
  }

  v4 = [UARPServiceUARPControllerManager instance];
  v5 = -[UARPService uarpAccessory];
  [v4 unregisterUARPService:self withUARPAccessory:v5];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPService;
  -[ClientService stop](&v6, "stop");
}

- (void)_prepareForFirmwareDownload
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_prepareForFirmwareDownload", v10, 2u);
  }

  v4 = -[ClientService peripheral];
  v5 = (char *)[v4 maximumWriteValueLengthForType:0];

  -[UARPService setMaxPayloadSize:](self, "setMaxPayloadSize:", v5 - 1);
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[UARPService setTxDataQueue:](self, "setTxDataQueue:", v6);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  -[UARPService setRecvDataMessage:](self, "setRecvDataMessage:", v7);

  unsigned int v8 = (void *)[self peripheral];
  v9 = [self uarpDataControlPointCharacteristic];
  [v8 setNotifyValue:1 forCharacteristic:v9];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  if (-[UARPService uarpOverAACP](self, "uarpOverAACP"))
  {
    v5 = [BTLEXpcServer instance];
    v29[0] = @"kUARPDeviceUUID";
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    id v7 = [v6 identifier];
    unsigned int v8 = (void *)[v7 UUIDString];
    v29[1] = @"kUARPData";
    v30[0] = v8;
    v30[1] = v4;
    v9 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v5 sendMsg:@"UARPDataOverAACP" args:v9];
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService _packetizeData:](self, "_packetizeData:", v4));
    v10 = [self txDataQueue];
    [v10 addObjectsFromArray:v5];

    if (-[UARPService isSendingData](self, "isSendingData"))
    {
LABEL_9:

      goto LABEL_10;
    }

    -[UARPService setIsSendingData:](self, "setIsSendingData:", 1LL);
    v11 = -[UARPService txDataQueue];
    v12 = [v11 firstObject];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService txDataQueue](self, "txDataQueue"));
    [v13 removeObjectAtIndex:0];

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpDataControlPointCharacteristic](self, "uarpDataControlPointCharacteristic"));
    [v14 writeValue:v12 forCharacteristic:v15 type:0];
  }

  objc_super v16 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v5 = [self peripheral];
    unsigned int v18 = (void *)[v5 identifier];
    v19 = [v18 UUIDString];
    id v20 = [v4 length];
    unsigned int v21 = -[UARPService uarpOverAACP](self, "uarpOverAACP");
    v22 = "GATT";
    int v23 = 138412802;
    v24 = v19;
    if (v21) {
      v22 = "AACP";
    }
    __int16 v25 = 2048;
    id v26 = v20;
    __int16 v27 = 2080;
    v28 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "sendData - peripheral:%@ length:%lu profile: %s",  (uint8_t *)&v23,  0x20u);

    goto LABEL_9;
  }

- (void)recvDataOverAACP:(id)a3
{
}

- (id)_packetizeData:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v6 = -[UARPService maxPayloadSize](self, "maxPayloadSize");
  if (v6 >= (unint64_t)[v4 length])
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 0LL;
    do
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[UARPService _createPacket:payloadOffset:payloadLength:payload:]( self,  "_createPacket:payloadOffset:payloadLength:payload:",  0LL,  v7,  -[UARPService maxPayloadSize](self, "maxPayloadSize"),  v4));
      -[NSMutableArray addObject:](v5, "addObject:", v8);
      v7 += -[UARPService maxPayloadSize](self, "maxPayloadSize");

      v9 = (char *)-[UARPService maxPayloadSize](self, "maxPayloadSize") + v7;
    }

    while (v9 < [v4 length]);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPService _createPacket:payloadOffset:payloadLength:payload:]( self,  "_createPacket:payloadOffset:payloadLength:payload:",  1,  v7,  (char *)[v4 length] - v7,  v4));
  -[NSMutableArray addObject:](v5, "addObject:", v10);

  return v5;
}

- (id)_createPacket:(unint64_t)a3 payloadOffset:(unint64_t)a4 payloadLength:(unint64_t)a5 payload:(id)a6
{
  unint64_t v13 = a3;
  id v8 = a6;
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  v10 = [NSData dataWithBytes:&v13 length:1LL];
  -[NSMutableData appendData:](v9, "appendData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", a4, a5));

  -[NSMutableData appendData:](v9, "appendData:", v11);
  return v9;
}

- (void)_parseRecvdAACPData:(id)a3
{
  id v4 = a3;
  v5 = -[UARPService recvDataMessage];
  [v5 appendData:v4];

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance"));
  uint64_t v7 = (void *)[v6 uarpController];
  id v8 = [self uarpAccessory];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
  [v7 recvDataFromAccessory:v8 data:v9 error:0];

  id v10 = [self recvDataMessage];
  [v10 setLength:0];
}

- (void)_parseRecvdData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[UARPService _extractHeader:](self, "_extractHeader:", v4);
  id v12 = [self _extractPayload:v4];

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
  [v6 appendData:v12];

  if ((v5 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance"));
    id v8 = (void *)[v7 uarpController];
    v9 = [self uarpAccessory];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService recvDataMessage](self, "recvDataMessage"));
    [v8 recvDataFromAccessory:v9 data:v10 error:0];

    v11 = -[UARPService recvDataMessage];
    [v11 setLength:0];
  }
}

- (unsigned)_extractHeader:(id)a3
{
  unsigned __int8 v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subdataWithRange:", 0, 1));
  [v3 getBytes:&v6 length:1];
  unsigned __int8 v4 = v6;

  return v4;
}

- (id)_extractPayload:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 1, (char *)objc_msgSend(v3, "length") - 1));

  return v4;
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didDiscoverCharacteristicsForService - peripheral:%@ service:%@ error:%@",  buf,  0x20u);
  }

  if (!v10)
  {
    id v23 = v9;
    id v24 = v8;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v12 = [v9 characteristics];
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      uint64_t v16 = CBUUIDUARPDataControlPointCharacteristicString;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          unsigned int v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          v19 = [self uarpDataControlPointCharacteristic];
          if (v19)
          {
          }

          else
          {
            id v20 = [v18 UUID];
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v16));
            unsigned int v22 = [v20 isEqual:v21];

            if (v22)
            {
              -[UARPService setUarpDataControlPointCharacteristic:](self, "setUarpDataControlPointCharacteristic:", v18);
              -[UARPService _prepareForFirmwareDownload](self, "_prepareForFirmwareDownload");
            }
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v14);
    }

    -[ClientService notifyDidStart](self, "notifyDidStart");
    id v9 = v23;
    id v8 = v24;
    id v10 = 0LL;
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003DAD4((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
    unsigned int v18 = (void *)[self txDataQueue];
    [v18 removeAllObjects];

    -[UARPService setIsSendingData:](self, "setIsSendingData:", 0LL);
  }

  else
  {
    v19 = [self txDataQueue];
    id v20 = [v19 firstObject];

    if (v20)
    {
      unsigned int v21 = (void *)[self txDataQueue];
      [v21 removeObjectAtIndex:0];

      if (-[UARPService uarpOverAACP](self, "uarpOverAACP"))
      {
        unsigned int v22 = +[BTLEXpcServer instance](&OBJC_CLASS___BTLEXpcServer, "instance");
        v40[0] = @"kUARPDeviceUUID";
        id v23 = -[ClientService peripheral];
        id v24 = [v23 identifier];
        __int128 v25 = (void *)[v24 UUIDString];
        v40[1] = @"kUARPData";
        v41[0] = v25;
        v41[1] = v20;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
        [v22 sendMsg:@"UARPDataOverAACP" args:v26];
      }

      else
      {
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        id v23 = [self uarpDataControlPointCharacteristic];
        [v22 writeValue:v20 forCharacteristic:v23 type:0];
      }

      __int128 v27 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v28 = v27;
        id v29 = [v20 length];
        unsigned int v30 = -[UARPService uarpOverAACP](self, "uarpOverAACP");
        id v31 = "GATT";
        int v32 = 138413058;
        __int16 v34 = 2048;
        id v33 = v20;
        if (v30) {
          id v31 = "AACP";
        }
        id v35 = v29;
        __int16 v36 = 2112;
        uint64_t v37 = 0LL;
        __int16 v38 = 2080;
        v39 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "didWriteValueForCharacteristic - peripheral:%@ length:%lu error:%@ profile:%s",  (uint8_t *)&v32,  0x2Au);
      }
    }

    else
    {
      -[UARPService setIsSendingData:](self, "setIsSendingData:", 0LL);
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003DB38((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  else
  {
    unsigned int v18 = (void *)[v9 value];
    -[UARPService _parseRecvdData:](self, "_parseRecvdData:", v18);
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v43 = v8;
    __int16 v44 = 2112;
    id v45 = v9;
    __int16 v46 = 2112;
    id v47 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didUpdateNotificationStateForCharacteristic - peripheral:%@ characteristic:%@ error:%@",  buf,  0x20u);
  }

  if (!v10)
  {
    uint64_t v12 = (void *)[self manager];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDDeviceInformationServiceString));
    uint64_t v14 = (void *)[v12 clientServiceForUUID:v13];

    id v15 = [UARPAccessoryHardwareBluetooth initWithVendorIDSource:1 vendorID:[v14 vendorID] productID:[v14 productID] productVersion:[v14 productVersion]];
    uint64_t v16 = objc_alloc(&OBJC_CLASS___UARPAccessory);
    uint64_t v17 = (void *)[v8 identifier];
    unsigned int v18 = -[UARPAccessory initWithHardwareID:uuid:](v16, "initWithHardwareID:uuid:", v15, v17);
    -[UARPService setUarpAccessory:](self, "setUarpAccessory:", v18);

    v19 = -[UARPService uarpAccessory];
    [v19 setAutoDownloadAllowed:1];

    id v20 = [self uarpAccessory];
    if (v20)
    {
      unsigned int v21 = -[UARPAssetID initWithLocationType:remoteURL:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:remoteURL:",  3LL,  0LL);
      -[UARPService setUarpAssetID:](self, "setUarpAssetID:", v21);

      unsigned int v22 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v22;
        id v24 = -[UARPService uarpAccessory];
        __int128 v25 = (void *)[self uarpAssetID];
        *(_DWORD *)buf = 138412546;
        id v43 = v24;
        __int16 v44 = 2112;
        id v45 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Created uarpAccessory:%@ uarpAssetID:%@",  buf,  0x16u);
      }

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance"));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
      __int128 v28 = (void *)[self uarpAssetID];
      unsigned int v29 = [v26 registerUARPService:self withUARPAccessory:v27 withUARPAssetID:v28];

      if (v29)
      {
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        id v31 = [v30 identifier];
        int v32 = (void *)[v31 UUIDString];
        id v33 = [NSString stringWithFormat:@"log_%@.uarp", v32];

        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance"));
        id v35 = [v34 uarpLogPath];
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v35,  1LL));
        uint64_t v37 = [v36 URLByAppendingPathComponent:v33 isDirectory:0];
        p_loggingSuperbinaryURL = (uint64_t *)&self->_loggingSuperbinaryURL;
        v39 = (void *)*p_loggingSuperbinaryURL;
        uint64_t *p_loggingSuperbinaryURL = v37;

        v40 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
          sub_10003DBDC(p_loggingSuperbinaryURL, v40);
        }
      }
    }

    else
    {
      v41 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003DB9C(v41);
      }
    }
  }
}

- (void)incOpportunisticConnection
{
  if (!-[UARPService opportunisticRefCount](self, "opportunisticRefCount"))
  {
    id v3 = [CattManager instance];
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    [v3 removeOpportunisticConnection:v4];
  }

  -[UARPService setOpportunisticRefCount:]( self,  "setOpportunisticRefCount:",  (char *)-[UARPService opportunisticRefCount](self, "opportunisticRefCount") + 1);
  unsigned __int8 v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = v5;
    int64_t v7 = -[UARPService opportunisticRefCount](self, "opportunisticRefCount");
    id v8 = [self uarpAccessory];
    int v9 = 134218242;
    int64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "incOpportunisticConnection refCount:%ld %@",  (uint8_t *)&v9,  0x16u);
  }

- (void)decOpportunisticConnection
{
  id v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = v3;
    int64_t v5 = -[UARPService opportunisticRefCount](self, "opportunisticRefCount");
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[UARPService uarpAccessory](self, "uarpAccessory"));
    int v9 = 134218242;
    int64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "decOpportunisticConnection refCount:%ld %@",  (uint8_t *)&v9,  0x16u);
  }

  if (-[UARPService opportunisticRefCount](self, "opportunisticRefCount") <= 0)
  {
    int64_t v7 = [CattManager instance];
    id v8 = [self peripheral];
    [v7 setOpportunisticConnection:v8];

    -[UARPService setOpportunisticRefCount:](self, "setOpportunisticRefCount:", 0LL);
  }

- (void)assetSolicitationComplete
{
  v2 = [NSFileManager defaultManager];
  v40 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v3 = [UARPServiceUARPControllerManager instance];
  unsigned __int8 v4 = (void *)[v3 uarpLogPath];
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL));

  __int16 v44 = [v5 URLByAppendingPathComponent:@"temp" isDirectory:1];
  v39 = v5;
  if (sub_10000BB10()) {
    uint64_t v6 = [NSURL fileURLWithPath:@"/private/var/log/" isDirectory:1];
  }
  else {
    uint64_t v6 = [v5 URLByDeletingLastPathComponent];
  }
  v42 = (void *)v6;
  [v2 removeItemAtURL:v44 error:0];
  [v2 createDirectoryAtURL:v44 withIntermediateDirectories:1 attributes:0 error:0];
  id v7 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_loggingSuperbinaryURL];
  id v51 = 0LL;
  __int16 v38 = v7;
  [v7 decomposeToURL:v44 error:&v51];
  id v8 = v51;
  if (v8)
  {
    int v9 = v8;
    int64_t v10 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003DC50((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  uint64_t v17 = (void *)[v44 path];
  unsigned int v18 = (void *)[v2 contentsOfDirectoryAtPath:v17 error:0];

  v19 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    buf.tm_sec = 138412290;
    *(void *)&buf.tm_min = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "assetSolicitationComplete: Moving files to directory %@",  (uint8_t *)&buf,  0xCu);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v18;
  id v20 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
        memset(&buf, 0, sizeof(buf));
        time_t v46 = 0LL;
        time_t v46 = time(0LL);
        localtime_r(&v46, &buf);
        __int128 v25 = (void *)-[ClientService peripheral](self, "peripheral");
        __int128 v26 = (void *)[v25 identifier];
        __int128 v27 = (void *)[v26 UUIDString];
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AccessoryUARP_%@_%04d-%02d-%02d-%02d-%02d-%02d_%@",  v27,  (buf.tm_year + 1900),  (buf.tm_mon + 1),  buf.tm_mday,  buf.tm_hour,  buf.tm_min,  buf.tm_sec,  v24));

        unsigned int v29 = (void *)[v44 URLByAppendingPathComponent:v24 isDirectory:0];
        unsigned int v30 = (void *)[v42 URLByAppendingPathComponent:v28 isDirectory:0];
        [v2 removeItemAtURL:v30 error:0];
        id v31 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v52 = 138412546;
          v53 = v29;
          __int16 v54 = 2112;
          v55 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "assetSolicitationComplete: Moving %@ to %@",  v52,  0x16u);
        }

        id v45 = 0LL;
        [v2 moveItemAtURL:v29 toURL:v30 error:&v45];
        id v32 = v45;
        if (v32)
        {
          id v33 = v32;
          __int16 v34 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v52 = 138412290;
            v53 = v33;
            _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "assetSolicitationComplete: moveItemAtURL error %@",  v52,  0xCu);
          }
        }

        else
        {
          id v33 = [v30 path];
          -[NSMutableSet addObject:](v40, "addObject:", v33);
        }
      }

      id v21 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    }

    while (v21);
  }

  id v35 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    loggingSuperbinaryURL = self->_loggingSuperbinaryURL;
    buf.tm_sec = 138412290;
    *(void *)&buf.tm_min = loggingSuperbinaryURL;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "assetSolicitationComplete: Adding superbinary LOGS asset %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v37 = (void *)[self->_loggingSuperbinaryURL path];
  -[NSMutableSet addObject:](v40, "addObject:", v37);

  -[UARPService decOpportunisticConnection](self, "decOpportunisticConnection");
}

- (CBCharacteristic)uarpDataControlPointCharacteristic
{
  return self->_uarpDataControlPointCharacteristic;
}

- (void)setUarpDataControlPointCharacteristic:(id)a3
{
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (BOOL)isSendingData
{
  return self->_isSendingData;
}

- (void)setIsSendingData:(BOOL)a3
{
  self->_isSendingData = a3;
}

- (NSMutableArray)txDataQueue
{
  return self->_txDataQueue;
}

- (void)setTxDataQueue:(id)a3
{
}

- (NSMutableData)recvDataMessage
{
  return self->_recvDataMessage;
}

- (void)setRecvDataMessage:(id)a3
{
}

- (UARPAccessory)uarpAccessory
{
  return self->_uarpAccessory;
}

- (void)setUarpAccessory:(id)a3
{
}

- (UARPAssetID)uarpAssetID
{
  return self->_uarpAssetID;
}

- (void)setUarpAssetID:(id)a3
{
}

- (NSURL)loggingSuperbinaryURL
{
  return self->_loggingSuperbinaryURL;
}

- (void)setLoggingSuperbinaryURL:(id)a3
{
}

- (int64_t)opportunisticRefCount
{
  return self->_opportunisticRefCount;
}

- (void)setOpportunisticRefCount:(int64_t)a3
{
  self->_opportunisticRefCount = a3;
}

- (BOOL)uarpOverAACP
{
  return self->_uarpOverAACP;
}

- (void)setUarpOverAACP:(BOOL)a3
{
  self->_uarpOverAACP = a3;
}

- (void).cxx_destruct
{
}

@end