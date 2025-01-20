@interface CSAdBlockerAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSAdBlockerAssetMetaUpdateMonitor)init;
- (const)_asssetMetaUpdatedKey;
- (void)_didReceiveNewAdBlockerAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSAdBlockerAssetMetaUpdateMonitor

- (CSAdBlockerAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAdBlockerAssetMetaUpdateMonitor;
  result = -[CSAdBlockerAssetMetaUpdateMonitor init](&v3, "init");
  if (result) {
    result->_notifyToken = -1;
  }
  return result;
}

- (const)_asssetMetaUpdatedKey
{
  return "com.apple.MobileAsset.AdBlockerAssets.ma.cached-metadata-updated";
}

- (void)_startMonitoringWithQueue:(id)a3
{
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    v5 = (dispatch_queue_s *)a3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10013FCC0;
    handler[3] = &unk_10022EA50;
    handler[4] = self;
    notify_register_dispatch( -[CSAdBlockerAssetMetaUpdateMonitor _asssetMetaUpdatedKey](self, "_asssetMetaUpdatedKey"),  p_notifyToken,  v5,  handler);

    v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSAdBlockerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : AdBlocker Asset meta update",  buf,  0xCu);
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
      v6 = "-[CSAdBlockerAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : AdBlocker Asset meta update",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_didReceiveNewAdBlockerAssetMetaData
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAdBlockerAssetMetaUpdateMonitor _didReceiveNewAdBlockerAssetMetaData]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s New AdBlocker asset metadata is available",  buf,  0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013FCB4;
  v4[3] = &unk_10022EED0;
  v4[4] = self;
  -[CSAdBlockerAssetMetaUpdateMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  -[CSAdBlockerAssetMetaUpdateMonitor notifyObserver:](self, "notifyObserver:", v4);
  [v4 CSAdBlockerMetaUpdateMonitor:self didReceiveNewAdBlockerAssetMetaData:1];
}

+ (id)sharedInstance
{
  if (qword_100280200 != -1) {
    dispatch_once(&qword_100280200, &stru_10022E858);
  }
  return (id)qword_1002801F8;
}

@end