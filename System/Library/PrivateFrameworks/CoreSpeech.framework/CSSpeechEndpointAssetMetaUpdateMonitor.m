@interface CSSpeechEndpointAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSSpeechEndpointAssetMetaUpdateMonitor)init;
- (void)_didReceiveNewSpeechEndpointAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSpeechEndpointAssetMetaUpdateMonitor

- (CSSpeechEndpointAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSpeechEndpointAssetMetaUpdateMonitor;
  result = -[CSSpeechEndpointAssetMetaUpdateMonitor init](&v3, "init");
  if (result) {
    result->_notifyToken = -1;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (dispatch_queue_s *)a3;
  v6 = v4;
  if (self->_notifyToken == -1)
  {
    if ((CSIsWatch(v4, v5) & 1) != 0)
    {
      v7 = "com.apple.MobileAsset.SpeechEndpointAssetsWatch.ma.cached-metadata-updated";
    }

    else
    {
      uint64_t v8 = CSIsTV();
      if ((v8 & 1) != 0)
      {
        v7 = "com.apple.MobileAsset.SpeechEndpointAssetsTV.ma.cached-metadata-updated";
      }

      else if ((CSIsOSX(v8, v9) & 1) != 0)
      {
        v7 = "com.apple.MobileAsset.SpeechEndpointMacOSAssets.ma.cached-metadata-updated";
      }

      else if (+[CSUtils shouldUseHorsemanSpeechEndpointAssets]( &OBJC_CLASS___CSUtils,  "shouldUseHorsemanSpeechEndpointAssets"))
      {
        v7 = "com.apple.MobileAsset.SpeechEndpointMarshAssets.ma.cached-metadata-updated";
      }

      else
      {
        v7 = "com.apple.MobileAsset.SpeechEndpointAssets.ma.cached-metadata-updated";
      }
    }

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000C3FA8;
    handler[3] = &unk_10022EA50;
    handler[4] = self;
    notify_register_dispatch(v7, &self->_notifyToken, v6, handler);
    v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      __int16 v14 = 2080;
      v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : speech endpoint asset meta update with key %s",  buf,  0x16u);
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
    v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : speech endpoint asset meta update",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_didReceiveNewSpeechEndpointAssetMetaData
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _didReceiveNewSpeechEndpointAssetMetaData]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s New speech endpoint asset is available",  buf,  0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C3F9C;
  v4[3] = &unk_10022EED0;
  v4[4] = self;
  -[CSSpeechEndpointAssetMetaUpdateMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  -[CSSpeechEndpointAssetMetaUpdateMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector( v4,  "CSSpeechEndpointAssetMetaUpdateMonitor:didReceiveNewSpeechEndpointAssetMetaData:") & 1) != 0) {
    [v4 CSSpeechEndpointAssetMetaUpdateMonitor:self didReceiveNewSpeechEndpointAssetMetaData:1];
  }
}

+ (id)sharedInstance
{
  if (qword_10027FF90 != -1) {
    dispatch_once(&qword_10027FF90, &stru_10022C928);
  }
  return (id)qword_10027FF88;
}

@end