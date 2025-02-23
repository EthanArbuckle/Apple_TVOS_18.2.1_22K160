@interface CSSpeakerRecognitionAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSSpeakerRecognitionAssetMetaUpdateMonitor)init;
- (const)_asssetMetaUpdatedKey;
- (void)_didReceiveSpeakerRecognitionAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSpeakerRecognitionAssetMetaUpdateMonitor

- (CSSpeakerRecognitionAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSpeakerRecognitionAssetMetaUpdateMonitor;
  result = -[CSSpeakerRecognitionAssetMetaUpdateMonitor init](&v3, "init");
  if (result) {
    result->_notifyToken = -1;
  }
  return result;
}

- (const)_asssetMetaUpdatedKey
{
  return "com.apple.MobileAsset.SpeakerRecognitionAssets.ma.cached-metadata-updated";
}

- (void)_startMonitoringWithQueue:(id)a3
{
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    v5 = (dispatch_queue_s *)a3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100009930;
    handler[3] = &unk_10022EA50;
    handler[4] = self;
    notify_register_dispatch( -[CSSpeakerRecognitionAssetMetaUpdateMonitor _asssetMetaUpdatedKey](self, "_asssetMetaUpdatedKey"),  p_notifyToken,  v5,  handler);

    v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpeakerRecognitionAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : SpeakerRecognition Asset meta update",  buf,  0xCu);
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
      v6 = "-[CSSpeakerRecognitionAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : SpeakerRecognition Asset meta update",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_didReceiveSpeakerRecognitionAssetMetaData
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSpeakerRecognitionAssetMetaUpdateMonitor _didReceiveSpeakerRecognitionAssetMetaData]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s New Speaker Recognition asset metadata is available",  buf,  0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100009924;
  v4[3] = &unk_10022EED0;
  v4[4] = self;
  -[CSSpeakerRecognitionAssetMetaUpdateMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  -[CSSpeakerRecognitionAssetMetaUpdateMonitor notifyObserver:](self, "notifyObserver:", v4);
  [v4 CSSpeakerRecognitionAssetMetaUpdateMonitor:self didReceiveNewSpeakerRecognitionAssetMetaData:1];
}

+ (id)sharedInstance
{
  if (qword_10027FBC0 != -1) {
    dispatch_once(&qword_10027FBC0, &stru_10022A060);
  }
  return (id)qword_10027FBB8;
}

@end