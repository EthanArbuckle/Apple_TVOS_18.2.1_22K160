@interface CSAdBlockerAssetDownloadMonitor
+ (id)sharedInstance;
- (CSAdBlockerAssetDownloadMonitor)init;
- (CSTrialAssetDownloadMonitor)monitor;
- (const)_notificationKey;
- (void)_didInstalledNewAdBlockerAsset;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setMonitor:(id)a3;
- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5;
@end

@implementation CSAdBlockerAssetDownloadMonitor

- (CSAdBlockerAssetDownloadMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAdBlockerAssetDownloadMonitor;
  v2 = -[CSAdBlockerAssetDownloadMonitor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[CSTrialAssetDownloadMonitor sharedInstance](&OBJC_CLASS___CSTrialAssetDownloadMonitor, "sharedInstance"));
    monitor = v3->_monitor;
    v3->_monitor = (CSTrialAssetDownloadMonitor *)v4;

    -[CSTrialAssetDownloadMonitor addObserver:](v3->_monitor, "addObserver:", v3);
    v3->_lastUpdatedAssetType = 0LL;
  }

  return v3;
}

- (const)_notificationKey
{
  return "com.apple.MobileAsset.AdBlockerAssets.ma.new-asset-installed";
}

- (void)_startMonitoringWithQueue:(id)a3
{
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    v5 = (dispatch_queue_s *)a3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001138B8;
    handler[3] = &unk_10022EA50;
    handler[4] = self;
    notify_register_dispatch( -[CSAdBlockerAssetDownloadMonitor _notificationKey](self, "_notificationKey"),  p_notifyToken,  v5,  handler);

    v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSAdBlockerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : AdBlocker Asset Download",  buf,  0xCu);
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
      int v5 = 136315138;
      v6 = "-[CSAdBlockerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : AdBlocker Asset Download",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_didInstalledNewAdBlockerAsset
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAdBlockerAssetDownloadMonitor _didInstalledNewAdBlockerAsset]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s New AdBlockerAsset is now installed",  buf,  0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001138AC;
  v4[3] = &unk_10022EED0;
  v4[4] = self;
  -[CSAdBlockerAssetDownloadMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  -[CSAdBlockerAssetDownloadMonitor notifyObserver:](self, "notifyObserver:", v4);
  [v4 CSAdBlockerAssetDownloadMonitor:self didInstallNewAsset:1 assetProviderType:self->_lastUpdatedAssetType];
}

- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (a5 == 4)
  {
    if (v6)
    {
      self->_lastUpdatedAssetType = 1LL;
      -[CSAdBlockerAssetDownloadMonitor _didInstalledNewAdBlockerAsset](self, "_didInstalledNewAdBlockerAsset");
    }
  }

  else
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[CSAdBlockerAssetDownloadMonitor trialAssetDownloadMonitorDelegate:didInstallNewAsset:assetType:]";
      __int16 v12 = 2048;
      unint64_t v13 = a5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s ERR: Delegate received for invalid Trial assetType:%lu",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (CSTrialAssetDownloadMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1002800E8 != -1) {
    dispatch_once(&qword_1002800E8, &stru_10022D880);
  }
  return (id)qword_1002800E0;
}

@end