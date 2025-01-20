@interface CSVoiceTriggerAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSVoiceTriggerAssetMetaUpdateMonitor)init;
- (const)_asssetMetaUpdatedKey;
- (void)_didReceiveNewVoiceTriggerAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifyNewVoiceTriggerAssetMetaDataUpdated;
@end

@implementation CSVoiceTriggerAssetMetaUpdateMonitor

- (CSVoiceTriggerAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerAssetMetaUpdateMonitor;
  result = -[CSVoiceTriggerAssetMetaUpdateMonitor init](&v3, "init");
  if (result)
  {
    result->_notifyToken = -1;
    result->_gibraltarMacNotifyToken = -1;
    result->_darwinNotifyToken = -1;
  }

  return result;
}

- (void)notifyNewVoiceTriggerAssetMetaDataUpdated
{
}

- (const)_asssetMetaUpdatedKey
{
  unsigned int v2 = +[CSUtils supportMphAssets](&OBJC_CLASS___CSUtils, "supportMphAssets");
  uint64_t v3 = CSIsIPad();
  if ((_DWORD)v3)
  {
    v5 = "com.apple.MobileAsset.VoiceTriggerHSAssetsIPad.ma.cached-metadata-updated";
    v6 = "com.apple.MobileAsset.VoiceTriggerAssetsIPad.ma.cached-metadata-updated";
    goto LABEL_5;
  }

  uint64_t v7 = CSIsWatch(v3, v4);
  if ((_DWORD)v7)
  {
    v5 = "com.apple.MobileAsset.VoiceTriggerHSAssetsWatch.ma.cached-metadata-updated";
    v6 = "com.apple.MobileAsset.VoiceTriggerAssetsWatch.ma.cached-metadata-updated";
LABEL_5:
    if (v2) {
      return v6;
    }
    else {
      return v5;
    }
  }

  uint64_t v10 = CSIsHorseman(v7, v8);
  if ((v10 & 1) != 0) {
    return "com.apple.MobileAsset.VoiceTriggerAssetsMarsh.ma.cached-metadata-updated";
  }
  if ((CSIsOSX(v10, v11) & 1) != 0) {
    return "com.apple.MobileAsset.VoiceTriggerAssetsASMac.ma.cached-metadata-updated";
  }
  uint64_t v12 = CSIsTV();
  if ((v12 & 1) != 0) {
    return "com.apple.MobileAsset.VoiceTriggerAssetsTV.ma.cached-metadata-updated";
  }
  int v14 = CSIsIOS(v12, v13);
  v15 = "com.apple.MobileAsset.VoiceTriggerHSAssets.ma.cached-metadata-updated";
  if (v2) {
    v15 = "com.apple.MobileAsset.VoiceTriggerAssets.ma.cached-metadata-updated";
  }
  if (v14) {
    return v15;
  }
  else {
    return "com.apple.MobileAsset.VoiceTriggerAssets.ma.cached-metadata-updated";
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000C2C58;
    handler[3] = &unk_10022EA50;
    handler[4] = self;
    notify_register_dispatch( -[CSVoiceTriggerAssetMetaUpdateMonitor _asssetMetaUpdatedKey](self, "_asssetMetaUpdatedKey"),  &self->_notifyToken,  v4,  handler);
    v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : VoiceTrigger Asset meta update",  buf,  0xCu);
    }
  }

  uint64_t v6 = CSIsGibraltarMac();
  if ((_DWORD)v6)
  {
    p_gibraltarMacNotifyToken = &self->_gibraltarMacNotifyToken;
    if (self->_gibraltarMacNotifyToken == -1)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000C2C60;
      v13[3] = &unk_10022EA50;
      v13[4] = self;
      notify_register_dispatch( "com.apple.MobileAsset.VoiceTriggerAssetsMac.ma.cached-metadata-updated",  p_gibraltarMacNotifyToken,  v4,  v13);
      uint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      uint64_t v6 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v6)
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : Gibraltar VoiceTrigger Asset meta update",  buf,  0xCu);
      }
    }
  }

  uint64_t v9 = CSIsOSX(v6, p_gibraltarMacNotifyToken);
  if (((v9 & 1) != 0 || CSIsIOS(v9, v10)) && self->_darwinNotifyToken == -1)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000C2C68;
    v12[3] = &unk_10022EA50;
    v12[4] = self;
    notify_register_dispatch( "com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay.ma.cached-metadata-updated",  &self->_darwinNotifyToken,  v4,  v12);
    uint64_t v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : Studio Display VoiceTrigger Asset meta update",  buf,  0xCu);
    }
  }
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    uint64_t v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : VoiceTrigger Asset meta update",  (uint8_t *)&v10,  0xCu);
    }
  }

  uint64_t gibraltarMacNotifyToken = CSIsGibraltarMac();
  if ((_DWORD)gibraltarMacNotifyToken)
  {
    uint64_t gibraltarMacNotifyToken = self->_gibraltarMacNotifyToken;
    if ((_DWORD)gibraltarMacNotifyToken != -1)
    {
      notify_cancel(gibraltarMacNotifyToken);
      self->_uint64_t gibraltarMacNotifyToken = -1;
      uint64_t v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      uint64_t gibraltarMacNotifyToken = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)gibraltarMacNotifyToken)
      {
        int v10 = 136315138;
        uint64_t v11 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _stopMonitoring]";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : Gibraltar VoiceTrigger Asset meta update",  (uint8_t *)&v10,  0xCu);
      }
    }
  }

  if ((CSIsOSX(gibraltarMacNotifyToken, v6) & 1) != 0 || CSIsIOS())
  {
    int darwinNotifyToken = self->_darwinNotifyToken;
    if (darwinNotifyToken != -1)
    {
      notify_cancel(darwinNotifyToken);
      self->_int darwinNotifyToken = -1;
      uint64_t v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _stopMonitoring]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : Studio Display VoiceTrigger Asset meta update",  (uint8_t *)&v10,  0xCu);
      }
    }
  }

- (void)_didReceiveNewVoiceTriggerAssetMetaData
{
  uint64_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _didReceiveNewVoiceTriggerAssetMetaData]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s New VoiceTrigger asset metadata is available",  buf,  0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C2C4C;
  v4[3] = &unk_10022EED0;
  v4[4] = self;
  -[CSVoiceTriggerAssetMetaUpdateMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  -[CSVoiceTriggerAssetMetaUpdateMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector(v4, "CSVoiceTriggerAssetMetaUpdateMonitor:didReceiveNewVoiceTriggerAssetMetaData:") & 1) != 0) {
    [v4 CSVoiceTriggerAssetMetaUpdateMonitor:self didReceiveNewVoiceTriggerAssetMetaData:1];
  }
}

+ (id)sharedInstance
{
  if (qword_10027FF70 != -1) {
    dispatch_once(&qword_10027FF70, &stru_10022C898);
  }
  return (id)qword_10027FF68;
}

@end