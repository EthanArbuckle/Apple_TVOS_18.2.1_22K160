@interface ADHeadphonesAnnouncementRequestCapabilityProvider
- (id)_headphonesMonitor;
- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3;
- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3;
@end

@implementation ADHeadphonesAnnouncementRequestCapabilityProvider

- (id)_headphonesMonitor
{
  return +[AFSiriHeadphonesMonitor sharedMonitor](&OBJC_CLASS___ADSiriHeadphonesMonitor, "sharedMonitor");
}

- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3
{
}

- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[AFHeadphonesAnnouncementRequestCapabilityProvider currentlyRoutedHeadphonesBTAddress]( self,  "currentlyRoutedHeadphonesBTAddress"));
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[ADHeadphonesAnnouncementRequestCapabilityProvider fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:]";
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s BTAddress for currently routed headset: %@",  buf,  0x16u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003412A0;
  v9[3] = &unk_1004FCFD8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  +[ADCoreBluetoothManager fetchCBUUIDForConnectedDeviceWithAddress:completion:]( &OBJC_CLASS___ADCoreBluetoothManager,  "fetchCBUUIDForConnectedDeviceWithAddress:completion:",  v8,  v9);
}

@end