@interface DoAPClientService
+ (id)UUID;
- (BOOL)isEventIndicatorNotificationEnabled;
- (BOOL)isSendDataNotificationEnabled;
- (BOOL)isStartStreamingNotificationEnabled;
- (BOOL)isStopStreamingNotificationEnabled;
- (CBCharacteristic)EventIndicatorCharacteristic;
- (CBCharacteristic)SelectedCodecCharacteristic;
- (CBCharacteristic)SendDataCharacteristic;
- (CBCharacteristic)StartStreamingCharacteristic;
- (CBCharacteristic)StopStreamingCharacteristic;
- (CBCharacteristic)SupportedCodecsCharacteristic;
- (DoAPClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSMutableArray)codecList;
- (NSMutableArray)doapDevices;
- (id)uuidToString:(id)a3;
- (void)createDoAPDevice;
- (void)dealloc;
- (void)destroyDoAPDevice;
- (void)doapDeviceDidStop;
- (void)eventIndicator:(id)a3;
- (void)handleInputData:(id)a3 targetDevice:(id)a4;
- (void)notifyDidStartIfEverythingReady;
- (void)parseTLVCodecList:(char *)a3 dataLength:(unsigned __int8)a4 streamID:(unsigned __int16)a5;
- (void)parseTLVCodecValue:(char *)a3 dataLength:(unsigned __int8)a4 codecStruct:(id *)a5;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)selectCodec:(id)a3;
- (void)setCodecList:(id)a3;
- (void)setDoapDevices:(id)a3;
- (void)setEventIndicatorCharacteristic:(id)a3;
- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4;
- (void)setIsEventIndicatorNotificationEnabled:(BOOL)a3;
- (void)setIsSendDataNotificationEnabled:(BOOL)a3;
- (void)setIsStartStreamingNotificationEnabled:(BOOL)a3;
- (void)setIsStopStreamingNotificationEnabled:(BOOL)a3;
- (void)setNotificationEnabled:(id)a3;
- (void)setSelectedCodecCharacteristic:(id)a3;
- (void)setSendDataCharacteristic:(id)a3;
- (void)setStartStreamingCharacteristic:(id)a3;
- (void)setStopStreamingCharacteristic:(id)a3;
- (void)setSupportedCodecsCharacteristic:(id)a3;
- (void)start;
- (void)startStreaming:(id)a3;
- (void)stop;
- (void)stopStreaming:(id)a3;
- (void)writeData:(id)a3 forCharacteristic:(id)a4 withResponse:(BOOL)a5;
@end

@implementation DoAPClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDDoAPServiceString);
}

- (DoAPClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DoAPClientService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v12, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1LL);
    -[ClientService setPriority:](v6, "setPriority:", 3LL);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    codecList = v6->_codecList;
    v6->_codecList = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    doapDevices = v6->_doapDevices;
    v6->_doapDevices = v9;

    v6->_isStartStreamingNotificationEnabled = 0;
    v6->_isStopStreamingNotificationEnabled = 0;
    v6->_isSendDataNotificationEnabled = 0;
    v6->_isEventIndicatorNotificationEnabled = 0;
  }

  return v6;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DoAPClientService;
  -[ClientService start](&v12, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSupportedCodecsCharacteristicString));
  v13[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSelectedCodecCharacteristicString));
  v13[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStartStreamingCharacteristicString));
  v13[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStopStreamingCharacteristicString));
  v13[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDSendDataCharacteristicString));
  v13[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDEventIndicatorCharacteristicString));
  v13[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 6LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  [v10 discoverCharacteristics:v9 forService:v11];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DoAPClientService;
  -[ClientService stop](&v3, "stop");
}

- (void)dealloc
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DoAPClientService;
  -[DoAPClientService dealloc](&v4, "dealloc");
}

- (void)parseTLVCodecValue:(char *)a3 dataLength:(unsigned __int8)a4 codecStruct:(id *)a5
{
  if (a4)
  {
    unsigned int v6 = a4;
    int v8 = 0;
    unint64_t v9 = a4;
    while (2)
    {
      unsigned int v10 = a3[v8];
      unsigned __int8 v11 = v8 + 2;
      switch(a3[v8])
      {
        case 1:
          if (v6 <= v11)
          {
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
              sub_10003B430();
            }
          }

          else
          {
            unsigned __int8 v12 = v8 + 3;
            unsigned __int16 v13 = a3[(v8 + 2)];
            a5->unsigned int var1 = v13;
            if (v6 > (v8 + 3))
            {
              v8 += 4;
              a5->unsigned int var1 = v13 | (a3[v12] << 8);
              uint64_t v14 = qword_100070CC8;
              if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_39;
              }
              unsigned int var1 = a5->var1;
              *(_DWORD *)buf = 67109120;
              unsigned int v39 = var1;
              v16 = (os_log_s *)v14;
              v17 = "kDoAPCodecAttributeIDSampleFrequency %u";
              goto LABEL_38;
            }

            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
              sub_10003B3D0();
            }
          }

          break;
        case 2:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var2 = a3[v11];
            uint64_t v19 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var2 = a5->var2;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var2;
            v16 = (os_log_s *)v19;
            v17 = "kDoAPCodecAttributeIDChannel %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B490();
          }
          break;
        case 3:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var3 = a3[v11];
            uint64_t v21 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var3 = a5->var3;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var3;
            v16 = (os_log_s *)v21;
            v17 = "kDoAPCodecAttributeIDAllocMethod %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B4F0();
          }
          break;
        case 4:
          if ((unint64_t)(v8 + 2) + 4 < v9)
          {
            v8 += 6;
            uint64_t v23 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var4 = a5->var4;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var4;
            v16 = (os_log_s *)v23;
            v17 = "kDoAPCodecAttributeIDBitrate %u";
            goto LABEL_38;
          }

          v37 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B550(v6, (v8 + 2), v37);
          }
          break;
        case 5:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var5 = a3[v11];
            uint64_t v25 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var5 = a5->var5;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var5;
            v16 = (os_log_s *)v25;
            v17 = "kDoAPCodecAttributeIDBlocks %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B5C8();
          }
          break;
        case 6:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var6 = a3[v11];
            uint64_t v27 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var6 = a5->var6;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var6;
            v16 = (os_log_s *)v27;
            v17 = "kDoAPCodecAttributeIDSubbands %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B628();
          }
          break;
        case 7:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var7 = a3[v11];
            uint64_t v29 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var7 = a5->var7;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var7;
            v16 = (os_log_s *)v29;
            v17 = "kDoAPCodecAttributeIDMinBitpool %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B688();
          }
          break;
        case 8:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var8 = a3[v11];
            uint64_t v31 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var8 = a5->var8;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var8;
            v16 = (os_log_s *)v31;
            v17 = "kDoAPCodecAttributeIDMaxBitpool %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B6E8();
          }
          break;
        case 9:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var9 = a3[v11];
            uint64_t v33 = qword_100070CC8;
            if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var9 = a5->var9;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var9;
            v16 = (os_log_s *)v33;
            v17 = "kDoAPCodecAttributeIDObjectType %u";
            goto LABEL_38;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B748();
          }
          break;
        case 10:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var10 = a3[v11];
            uint64_t v35 = qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
            {
              unsigned int var10 = a5->var10;
              *(_DWORD *)buf = 67109120;
              unsigned int v39 = var10;
              v16 = (os_log_s *)v35;
              v17 = "kDoAPCodecAttributeIDVBR %u";
LABEL_38:
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, buf, 8u);
            }

            goto LABEL_39;
          }

          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
            sub_10003B7A8();
          }
          break;
        default:
          v18 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error wrong DoAP attributeID %u",  buf,  8u);
          }

          v8 += 2;
LABEL_39:
          break;
      }

      break;
    }
  }

- (void)parseTLVCodecList:(char *)a3 dataLength:(unsigned __int8)a4 streamID:(unsigned __int16)a5
{
  if (a4)
  {
    uint64_t v5 = a5;
    unsigned int v6 = a4;
    int v9 = 0;
    while (1)
    {
      __int128 v15 = 0uLL;
      int v16 = 0;
      LOBYTE(v15) = a3[v9];
      unsigned int v10 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "DoAPCodecType %u", buf, 8u);
      }

      int v11 = v9 + 2;
      uint64_t v12 = a3[v9 + 1];
      -[DoAPClientService parseTLVCodecValue:dataLength:codecStruct:]( self,  "parseTLVCodecValue:dataLength:codecStruct:",  &a3[(v9 + 2)],  v12,  &v15);
      unsigned __int16 v13 = -[DoAPCodec initWithID:](objc_alloc(&OBJC_CLASS___DoAPCodec), "initWithID:", v5);
      *(_OWORD *)buf = v15;
      int v18 = v16;
      -[DoAPCodec addCodec:](v13, "addCodec:", buf);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
      [v14 addObject:v13];

      int v9 = v12 + v11;
    }

    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003B808();
    }
  }

- (void)createDoAPDevice
{
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v27 value]);
  if (!v3
    || !-[DoAPClientService isStartStreamingNotificationEnabled](self, "isStartStreamingNotificationEnabled")
    || !-[DoAPClientService isStopStreamingNotificationEnabled](self, "isStopStreamingNotificationEnabled")
    || !-[DoAPClientService isSendDataNotificationEnabled](self, "isSendDataNotificationEnabled"))
  {

    return;
  }

  unsigned __int8 v4 = -[DoAPClientService isEventIndicatorNotificationEnabled](self, "isEventIndicatorNotificationEnabled");

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    id v7 = [v6 length];

    if ((unint64_t)v7 >= 7)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
      id v9 = objc_claimAutoreleasedReturnValue([v8 value]);
      unsigned int v10 = (unsigned __int8 *)[v9 bytes];

      unsigned int v13 = *v10;
      int v11 = (unsigned __int16 *)(v10 + 1);
      unsigned int v12 = v13;
      uint64_t v14 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
      {
        sub_10003B8A4(v12, v14);
        if (!v12) {
          return;
        }
      }

      else if (!v12)
      {
        return;
      }

      int v15 = 0;
      do
      {
        uint64_t v16 = *v11;
        v17 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "DoAP StreamID 0x%02x", buf, 8u);
        }

        uint64_t v18 = *((unsigned __int8 *)v11 + 2);
        uint64_t v19 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v18;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "DoAPCodec list length is %u",  buf,  8u);
        }

        int v11 = (unsigned __int16 *)((char *)v11 + 3);
        if ((_DWORD)v18)
        {
          -[DoAPClientService parseTLVCodecList:dataLength:streamID:]( self,  "parseTLVCodecList:dataLength:streamID:",  v11,  v18,  v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[DoAPDevice doapDeviceWithCodecs:streamID:]( &OBJC_CLASS___DoAPDevice,  "doapDeviceWithCodecs:streamID:",  v20,  v16));

          if (v21)
          {
            [v21 setService:self];
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            [v21 setPeripheral:v22];

            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
            [v23 addObject:v21];

            [v21 start];
          }

          else
          {
            uint64_t v25 = (os_log_s *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
              sub_10003B868(&v28, v29, v25);
            }
          }

          int v11 = (unsigned __int16 *)((char *)v11 + v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
          [v26 removeAllObjects];
        }

        else
        {
          v24 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v31 = v16;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "DoAP Error No codeclist for streamID%u",  buf,  8u);
          }
        }

        ++v15;
      }

      while (v12 > v15);
    }
  }

- (void)destroyDoAPDevice
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unsigned int v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) stop];
        unsigned int v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)notifyDidStartIfEverythingReady
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      __int128 v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) state] != 2)
        {

          return;
        }

        __int128 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  __int128 v8 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DoAPService didStart", v9, 2u);
  }

  -[ClientService notifyDidStart](self, "notifyDidStart");
}

- (void)setNotificationEnabled:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStartStreamingCharacteristicString));
  unsigned int v5 = [v12 isEqual:v4];

  if (v5)
  {
    -[DoAPClientService setIsStartStreamingNotificationEnabled:](self, "setIsStartStreamingNotificationEnabled:", 1LL);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStopStreamingCharacteristicString));
    unsigned int v7 = [v12 isEqual:v6];

    if (v7)
    {
      -[DoAPClientService setIsStopStreamingNotificationEnabled:](self, "setIsStopStreamingNotificationEnabled:", 1LL);
    }

    else
    {
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSendDataCharacteristicString));
      unsigned int v9 = [v12 isEqual:v8];

      if (v9)
      {
        -[DoAPClientService setIsSendDataNotificationEnabled:](self, "setIsSendDataNotificationEnabled:", 1LL);
      }

      else
      {
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDEventIndicatorCharacteristicString));
        unsigned int v11 = [v12 isEqual:v10];

        if (v11) {
          -[DoAPClientService setIsEventIndicatorNotificationEnabled:]( self,  "setIsEventIndicatorNotificationEnabled:",  1LL);
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  unsigned int v9 = v8;
  if (a5) {
    goto LABEL_2;
  }
  v51 = v8;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a4 characteristics]);
  id v10 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v10)
  {
    id v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v56;
    uint64_t v53 = CBUUIDSupportedCodecsCharacteristicString;
    uint64_t v52 = CBUUIDSelectedCodecCharacteristicString;
    uint64_t v50 = CBUUIDStartStreamingCharacteristicString;
    uint64_t v48 = CBUUIDSendDataCharacteristicString;
    uint64_t v49 = CBUUIDStopStreamingCharacteristicString;
    uint64_t v47 = CBUUIDEventIndicatorCharacteristicString;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v14);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic", v47));
        if (v16)
        {
        }

        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v53));
          unsigned int v19 = [v17 isEqual:v18];

          if (v19)
          {
            -[DoAPClientService setSupportedCodecsCharacteristic:](self, "setSupportedCodecsCharacteristic:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);

            if (!v20) {
              [v51 readValueForCharacteristic:v15];
            }
            goto LABEL_38;
          }
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SelectedCodecCharacteristic](self, "SelectedCodecCharacteristic"));
        if (v21)
        {
        }

        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v52));
          unsigned int v24 = [v22 isEqual:v23];

          if (v24)
          {
            -[DoAPClientService setSelectedCodecCharacteristic:](self, "setSelectedCodecCharacteristic:", v15);
            goto LABEL_38;
          }
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
        if (v25)
        {
        }

        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v50));
          unsigned int v28 = [v26 isEqual:v27];

          if (v28)
          {
            -[DoAPClientService setStartStreamingCharacteristic:](self, "setStartStreamingCharacteristic:", v15);
            if ((v12 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
        if (v29)
        {
        }

        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
          int v31 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v49));
          unsigned int v32 = [v30 isEqual:v31];

          if (v32)
          {
            -[DoAPClientService setStopStreamingCharacteristic:](self, "setStopStreamingCharacteristic:", v15);
            if ((v12 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
        if (v33)
        {
        }

        else
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v48));
          unsigned int v36 = [v34 isEqual:v35];

          if (v36)
          {
            -[DoAPClientService setSendDataCharacteristic:](self, "setSendDataCharacteristic:", v15);
            if ((v12 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));
        if (v37)
        {
        }

        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
          unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v47));
          unsigned int v40 = [v38 isEqual:v39];

          if (v40)
          {
            -[DoAPClientService setEventIndicatorCharacteristic:](self, "setEventIndicatorCharacteristic:", v15);
            if ((v12 & 1) != 0) {
              goto LABEL_22;
            }
LABEL_21:
            [v51 discoverDescriptorsForCharacteristic:v15];
LABEL_22:
            char v12 = 1;
          }
        }

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a4;
  if (!a5)
  {
    int v9 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));

    if (v9)
    {
      if (v10 != v8)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
        char v12 = v8;
        if ((id)v11 != v8)
        {
          uint64_t v13 = (void *)v11;
          uint64_t v14 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
          int v15 = v8;
          if ((id)v14 != v8)
          {
            uint64_t v16 = (void *)v14;
            uint64_t v17 = objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
            if ((id)v17 != v8)
            {
              uint64_t v18 = (void *)v17;
              id v19 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

              if (v19 != v8) {
                goto LABEL_2;
              }
              goto LABEL_20;
            }

            int v15 = v16;
          }

          char v12 = v13;
        }

LABEL_20:
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[DataInputStream inputStreamWithData:byteOrder:]( &OBJC_CLASS___DataInputStream,  "inputStreamWithData:byteOrder:",  v29,  1LL));

        unsigned __int16 v66 = 0;
        __int128 v56 = v30;
        [v30 readUint16:&v66];
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
        id v31 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
        if (!v31) {
          goto LABEL_37;
        }
        id v32 = v31;
        uint64_t v33 = *(void *)v63;
        while (1)
        {
          for (i = 0LL; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v63 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v35 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            unsigned int v36 = [v35 streamID];
            int v37 = v66;
            id v38 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));

            if (v38 != v8)
            {
              id v39 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));

              if (v39 != v8)
              {
                unsigned int v40 = self;
                id v41 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

                if (v41 == v8
                  && (v42 = (void *)objc_claimAutoreleasedReturnValue([v8 value]),
                      id v43 = [v42 length],
                      v42,
                      (unint64_t)v43 >= 3))
                {
                  id v44 = objc_claimAutoreleasedReturnValue([v8 value]);
                  v45 = (unsigned __int8 *)[v44 bytes];

                  int v46 = v45[2];
                  self = v40;
                  if (v46 != 3 && v36 != v37) {
                    continue;
                  }
                }

                else
                {
                  self = v40;
                  if (v36 != v37) {
                    continue;
                  }
                }
              }
            }
          }

          id v32 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
          if (!v32)
          {
LABEL_37:

            goto LABEL_2;
          }
        }
      }

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)qword_100070CC8;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
    {
      char v12 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService uuidToString:](self, "uuidToString:", v13));
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "DoAP Error starting notifications on %@ characteristic: %@",  (uint8_t *)&v16,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003BA20(v11, v9);
    }
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    -[DoAPClientService setNotificationEnabled:](self, "setNotificationEnabled:", v15);

    -[DoAPClientService createDoAPDevice](self, "createDoAPDevice");
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    goto LABEL_2;
  }
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
  uint64_t v11 = v9;
  if ((id)v10 != v9)
  {
    char v12 = (void *)v10;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
    uint64_t v14 = v9;
    if ((id)v13 != v9)
    {
      int v15 = (void *)v13;
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
      if ((id)v16 != v9)
      {
        uint64_t v17 = (void *)v16;
        id v18 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

        if (v18 != v9) {
          goto LABEL_2;
        }
        goto LABEL_11;
      }

      uint64_t v14 = v15;
    }

    uint64_t v11 = v12;
  }

LABEL_11:
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "descriptors", self));
  id v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v39;
    while (2)
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v38 + 1) + 8 * (void)i) UUID]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDClientCharacteristicConfigurationString));
        unsigned __int8 v26 = [v24 isEqual:v25];

        if ((v26 & 1) != 0)
        {

          id v28 = (void *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
            sub_10003BB70(v28, v9);
          }
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v37 StartStreamingCharacteristic]);

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([v37 StartStreamingCharacteristic]);
            [v8 setNotifyValue:1 forCharacteristic:v30];
          }

          id v31 = (void *)objc_claimAutoreleasedReturnValue([v37 StopStreamingCharacteristic]);

          if (v31)
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v37 StopStreamingCharacteristic]);
            [v8 setNotifyValue:1 forCharacteristic:v32];
          }

          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v37 SendDataCharacteristic]);

          if (v33)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v37 SendDataCharacteristic]);
            [v8 setNotifyValue:1 forCharacteristic:v34];
          }

          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v37 EventIndicatorCharacteristic]);

          if (v35)
          {
            unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v37 EventIndicatorCharacteristic]);
            [v8 setNotifyValue:1 forCharacteristic:v36];
          }

          goto LABEL_2;
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  uint64_t v27 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003BAC0(v27, v9);
  }
LABEL_2:
}

- (void)doapDeviceDidStop
{
  id v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPService didStop", buf, 2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_5:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:

    id v9 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remove all DoAP devices", buf, 2u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
    [v10 removeAllObjects];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
    [v4 removeAllObjects];
  }
}

- (void)selectCodec:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService SelectedCodecCharacteristic](self, "SelectedCodecCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:]( self,  "writeData:forCharacteristic:withResponse:",  v4,  v5,  0LL);
}

- (void)startStreaming:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:]( self,  "writeData:forCharacteristic:withResponse:",  v4,  v5,  0LL);
}

- (void)stopStreaming:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:]( self,  "writeData:forCharacteristic:withResponse:",  v4,  v5,  0LL);
}

- (void)eventIndicator:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:]( self,  "writeData:forCharacteristic:withResponse:",  v4,  v5,  0LL);
}

- (void)writeData:(id)a3 forCharacteristic:(id)a4 withResponse:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
  {
    sub_10003BC10();
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (!a5)
  {
LABEL_3:
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    [v10 writeValue:v8 forCharacteristic:v9 type:1];
  }

- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DoAPService setHighPriorityLink %d",  (uint8_t *)v9,  8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  [v8 setHighPriorityStream:v4 duration:v6];
}

- (void)handleInputData:(id)a3 targetDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_claimAutoreleasedReturnValue([v5 value]);
  id v8 = (unsigned __int8 *)[v7 bytes];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  unsigned int v10 = [v9 length];

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStartStreamingCharacteristicString));
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {
    [v6 handleStartStreaming];
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStopStreamingCharacteristicString));
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
      if (v10 < 3)
      {
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
          sub_10003BC48();
        }
      }

      else
      {
        [v6 handleStopStreaming:v8[2]];
      }
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSendDataCharacteristicString));
      unsigned int v19 = [v17 isEqual:v18];

      if (v19)
      {
        if (v10 > 4)
        {
          uint64_t v24 = *(unsigned __int16 *)(v8 + 3);
          unsigned int v25 = v10 - 5;
          unsigned __int8 v26 = (os_log_s *)qword_100070CC8;
          if (v25 == (_DWORD)v24)
          {
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
              sub_10003BD08((uint64_t)v8, v24, v26);
            }
            [v6 handleAudioData:v8 + 5 dataLength:v24];
          }

          else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
          {
            sub_10003BD8C();
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
        {
          sub_10003BCA8();
        }
      }

      else
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDEventIndicatorCharacteristicString));
        unsigned int v22 = [v20 isEqual:v21];

        if (v22)
        {
          if (v10 < 3)
          {
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
              sub_10003BDF8();
            }
          }

          else
          {
            if (v10 <= 4) {
              uint64_t v23 = 0LL;
            }
            else {
              uint64_t v23 = (char *)(v8 + 4);
            }
            [v6 handleEventIndicator:v8[2] eventValue:v23];
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
        {
          sub_10003BE58();
        }
      }
    }
  }
}

- (id)uuidToString:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSupportedCodecsCharacteristicString));
  unsigned __int8 v5 = [v3 isEqual:v4];

  if ((v5 & 1) != 0)
  {
    id v6 = @"SupportedCodecs";
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSelectedCodecCharacteristicString));
    unsigned __int8 v8 = [v3 isEqual:v7];

    if ((v8 & 1) != 0)
    {
      id v6 = @"SelectedCodec";
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStartStreamingCharacteristicString));
      unsigned __int8 v10 = [v3 isEqual:v9];

      if ((v10 & 1) != 0)
      {
        id v6 = @"StartStreaming";
      }

      else
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDStopStreamingCharacteristicString));
        unsigned __int8 v12 = [v3 isEqual:v11];

        if ((v12 & 1) != 0)
        {
          id v6 = @"StopStreaming";
        }

        else
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSendDataCharacteristicString));
          unsigned __int8 v14 = [v3 isEqual:v13];

          if ((v14 & 1) != 0)
          {
            id v6 = @"SendData";
          }

          else
          {
            int v15 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDEventIndicatorCharacteristicString));
            unsigned int v16 = [v3 isEqual:v15];

            if (v16) {
              id v6 = @"EventIndicator";
            }
            else {
              id v6 = @"Invalid UUID";
            }
          }
        }
      }
    }
  }

  return (id)v6;
}

- (CBCharacteristic)SupportedCodecsCharacteristic
{
  return self->_SupportedCodecsCharacteristic;
}

- (void)setSupportedCodecsCharacteristic:(id)a3
{
}

- (CBCharacteristic)SelectedCodecCharacteristic
{
  return self->_SelectedCodecCharacteristic;
}

- (void)setSelectedCodecCharacteristic:(id)a3
{
}

- (CBCharacteristic)StartStreamingCharacteristic
{
  return self->_StartStreamingCharacteristic;
}

- (void)setStartStreamingCharacteristic:(id)a3
{
}

- (CBCharacteristic)StopStreamingCharacteristic
{
  return self->_StopStreamingCharacteristic;
}

- (void)setStopStreamingCharacteristic:(id)a3
{
}

- (CBCharacteristic)SendDataCharacteristic
{
  return self->_SendDataCharacteristic;
}

- (void)setSendDataCharacteristic:(id)a3
{
}

- (CBCharacteristic)EventIndicatorCharacteristic
{
  return self->_EventIndicatorCharacteristic;
}

- (void)setEventIndicatorCharacteristic:(id)a3
{
}

- (NSMutableArray)codecList
{
  return self->_codecList;
}

- (void)setCodecList:(id)a3
{
}

- (NSMutableArray)doapDevices
{
  return self->_doapDevices;
}

- (void)setDoapDevices:(id)a3
{
}

- (BOOL)isStartStreamingNotificationEnabled
{
  return self->_isStartStreamingNotificationEnabled;
}

- (void)setIsStartStreamingNotificationEnabled:(BOOL)a3
{
  self->_isStartStreamingNotificationEnabled = a3;
}

- (BOOL)isStopStreamingNotificationEnabled
{
  return self->_isStopStreamingNotificationEnabled;
}

- (void)setIsStopStreamingNotificationEnabled:(BOOL)a3
{
  self->_isStopStreamingNotificationEnabled = a3;
}

- (BOOL)isSendDataNotificationEnabled
{
  return self->_isSendDataNotificationEnabled;
}

- (void)setIsSendDataNotificationEnabled:(BOOL)a3
{
  self->_isSendDataNotificationEnabled = a3;
}

- (BOOL)isEventIndicatorNotificationEnabled
{
  return self->_isEventIndicatorNotificationEnabled;
}

- (void)setIsEventIndicatorNotificationEnabled:(BOOL)a3
{
  self->_isEventIndicatorNotificationEnabled = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end