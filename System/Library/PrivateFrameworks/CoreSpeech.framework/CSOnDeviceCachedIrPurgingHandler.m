@interface CSOnDeviceCachedIrPurgingHandler
+ (id)sharedHandler;
- (CSOnDeviceCachedIrPurgingHandler)init;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_cleanUpOnDeviceCompilationPath;
- (void)_purgeCachedIrFilesWithAsset:(id)a3;
- (void)cleanUpCachedIrDir;
- (void)dealloc;
- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
- (void)startRegistration;
- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
@end

@implementation CSOnDeviceCachedIrPurgingHandler

- (CSOnDeviceCachedIrPurgingHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSOnDeviceCachedIrPurgingHandler;
  v2 = -[CSOnDeviceCachedIrPurgingHandler init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, -2);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("CSOnDeviceCachedIrPurgingHandler", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  [v3 unregisterObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
  [v4 unregisterObserver:self];

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSOnDeviceCachedIrPurgingHandler;
  -[CSOnDeviceCachedIrPurgingHandler dealloc](&v6, "dealloc");
}

- (void)startRegistration
{
  dispatch_queue_attr_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[CSOnDeviceCachedIrPurgingHandler startRegistration]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s onDevice cached purgedHandler starts",  (uint8_t *)&v7,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerAssetHandler sharedHandler](&OBJC_CLASS___CSVoiceTriggerAssetHandler, "sharedHandler"));
  [v4 registerObserver:self];

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttSiriMitigationAssetHandler sharedHandler]( &OBJC_CLASS___CSAttSiriMitigationAssetHandler,  "sharedHandler"));
  [v5 registerObserver:self];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  [v6 addObserver:self];
}

- (void)cleanUpCachedIrDir
{
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSOnDeviceCachedIrPurgingHandler voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s received notification to purge voice trigger asset with endPoint id: %@",  (uint8_t *)&v10,  0x16u);
  }

  -[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:](self, "_purgeCachedIrFilesWithAsset:", v8);
}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSOnDeviceCachedIrPurgingHandler mitigationAssetHandler:endpointId:didChangeCachedAsset:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s received notification to purge mitigation asset with endPoint id: %@",  (uint8_t *)&v10,  0x16u);
  }

  -[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:](self, "_purgeCachedIrFilesWithAsset:", v8);
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[CSOnDeviceCachedIrPurgingHandler CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s VoiceTrigger is disabled, clean up cached ir path",  (uint8_t *)&v8,  0xCu);
    }

    -[CSOnDeviceCachedIrPurgingHandler _cleanUpOnDeviceCompilationPath](self, "_cleanUpOnDeviceCompilationPath");
  }
}

- (void)_cleanUpOnDeviceCompilationPath
{
}

- (void)_purgeCachedIrFilesWithAsset:(id)a3
{
  id v4 = a3;
  if ((CSIsHorseman(v4, v5) & 1) != 0)
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s purging for specific device is not handled here",  buf,  0xCu);
    }
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100148268;
    block[3] = &unk_10022F100;
    id v9 = v4;
    dispatch_async(queue, block);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedHandler
{
  if (qword_100280248 != -1) {
    dispatch_once(&qword_100280248, &stru_10022EB78);
  }
  return (id)qword_100280240;
}

@end