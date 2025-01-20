@interface ADBluetoothManager
+ (id)sharedInstance;
- (id)_init;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithRecordingInfo:(id)a3;
- (id)deviceWithUID:(id)a3;
- (id)headGestureConfigurationForBTAddress:(id)a3;
- (id)wirelessSplitterSession;
- (void)getConnectedDevicesWithCompletion:(id)a3;
- (void)getPairedDevicesWithCompletion:(id)a3;
- (void)prewarmDeviceWithIdentifier:(id)a3;
@end

@implementation ADBluetoothManager

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADBluetoothManager;
  v2 = -[ADBluetoothManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___ADMobileBluetoothDeviceDataSource);
    mbDataSource = v2->_mbDataSource;
    v2->_mbDataSource = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___ADCoreBluetoothV2DeviceSource);
    cbDataSource = v2->_cbDataSource;
    v2->_cbDataSource = v5;
  }

  return v2;
}

- (void)prewarmDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
    if (v5) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADBluetoothManager deviceWithUID:](self, "deviceWithUID:", v5));
    }
    else {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADBluetoothManager deviceWithAddress:](self, "deviceWithAddress:", v8));
    }
    v7 = v6;
    [v6 prewarm];

    id v4 = v8;
  }
}

- (id)deviceWithRecordingInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 headsetAddress]);

  if (v5)
  {
    v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v14 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 headsetAddress]);
      int v17 = 136315394;
      v18 = "-[ADBluetoothManager deviceWithRecordingInfo:]";
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Recording Headset with Bluetooth Address: %@",  (uint8_t *)&v17,  0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 headsetAddress]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ADBluetoothManager deviceWithAddress:](self, "deviceWithAddress:", v7));
    goto LABEL_5;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 source]);
  unsigned int v11 = [v10 isEqualToString:SASStartSpeechAudioSourceBluetoothDoAPDeviceValue];

  if (!v11) {
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteDeviceUID]);

  v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315394;
    v18 = "-[ADBluetoothManager deviceWithRecordingInfo:]";
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Recording DoAP Headset with Bluetooth UID: %@",  (uint8_t *)&v17,  0x16u);
    if (v7) {
      goto LABEL_9;
    }
LABEL_11:
    v9 = 0LL;
    goto LABEL_12;
  }

  if (!v7) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ADBluetoothManager deviceWithUID:](self, "deviceWithUID:", v7));
LABEL_5:
  v9 = (void *)v8;

LABEL_12:
  return v9;
}

- (id)deviceWithAddress:(id)a3
{
  id v4 = a3;
  v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
  if (v5)
  {
    v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[ADBluetoothManager deviceWithAddress:]";
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s This SPI should not be called with a CBUUID: %@",  (uint8_t *)&v11,  0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADBluetoothManager deviceWithUID:](self, "deviceWithUID:", v5));
  }

  else
  {
    id v8 = v4;
    if ((unint64_t)[v8 length] >= 0x12)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 substringToIndex:17]);

      id v8 = (id)v9;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCoreBluetoothV2DeviceSource deviceWithAddress:](self->_cbDataSource, "deviceWithAddress:", v8));
  }

  return v7;
}

- (id)deviceWithUID:(id)a3
{
  return -[ADCoreBluetoothV2DeviceSource deviceWithUID:](self->_cbDataSource, "deviceWithUID:", a3);
}

- (id)headGestureConfigurationForBTAddress:(id)a3
{
  return -[ADCoreBluetoothV2DeviceSource headGestureConfigurationForBTAddress:]( self->_cbDataSource,  "headGestureConfigurationForBTAddress:",  a3);
}

- (void)getConnectedDevicesWithCompletion:(id)a3
{
}

- (void)getPairedDevicesWithCompletion:(id)a3
{
}

- (id)wirelessSplitterSession
{
  return -[ADMobileBluetoothDeviceDataSource wirelessSplitterSession](self->_mbDataSource, "wirelessSplitterSession");
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100578618 != -1) {
    dispatch_once(&qword_100578618, &stru_1004FCDF8);
  }
  return (id)qword_100578610;
}

@end