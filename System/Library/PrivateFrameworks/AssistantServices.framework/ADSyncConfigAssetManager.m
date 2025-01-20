@interface ADSyncConfigAssetManager
+ (id)sharedInstance;
- (ADSyncConfigAssetManager)init;
- (BOOL)_getBooleanValueForFactor:(id)a3;
- (BOOL)assistantSyncDisabledForEnUS;
- (BOOL)disableAssistantSyncForEnUS;
- (BOOL)disableAssistantSyncForInactiveDevices;
- (BOOL)isInactiveDeviceSyncDisabled;
- (BOOL)isMediaEntitySyncDisabled;
- (OS_dispatch_queue)queue;
- (id)_initWithTriClient:(id)a3;
- (id)updateHandler;
- (int64_t)_getIntValueForFactor:(id)a3;
- (int64_t)inactiveDeviceThreshold;
- (void)_populateConfiguration;
- (void)_registerUpdateHandler;
- (void)setDisableAssistantSyncForEnUS:(BOOL)a3;
- (void)setDisableAssistantSyncForInactiveDevices:(BOOL)a3;
- (void)setInactiveDeviceThreshold:(int64_t)a3;
- (void)setIsMediaEntitySyncDisabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation ADSyncConfigAssetManager

- (ADSyncConfigAssetManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", 133LL));
  v4 = -[ADSyncConfigAssetManager _initWithTriClient:](self, "_initWithTriClient:", v3);

  return v4;
}

- (id)_initWithTriClient:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADSyncConfigAssetManager;
  v6 = -[ADSyncConfigAssetManager init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("ADSyncConfigAssetManager", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    -[ADSyncConfigAssetManager _registerUpdateHandler](v7, "_registerUpdateHandler");
    v12 = (dispatch_queue_s *)v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10033D5EC;
    block[3] = &unk_1004FD940;
    v15 = v7;
    dispatch_async(v12, block);
  }

  return v7;
}

- (void)_registerUpdateHandler
{
  v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ADSyncConfigAssetManager _registerUpdateHandler]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Checking for sync config", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10033D50C;
  v12[3] = &unk_1004FCD88;
  objc_copyWeak(&v13, (id *)buf);
  v4 = objc_retainBlock(v12);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;

  client = self->_client;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](&OBJC_CLASS___TRINamespace, "namespaceNameFromId:", 1280LL));
  id v8 =  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]( client,  "addUpdateHandlerForNamespaceName:queue:usingBlock:",  v7,  self->_queue,  self->_updateHandler);

  v9 = self->_client;
  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](&OBJC_CLASS___TRINamespace, "namespaceNameFromId:", 424LL));
  id v11 =  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]( v9,  "addUpdateHandlerForNamespaceName:queue:usingBlock:",  v10,  self->_queue,  self->_updateHandler);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_populateConfiguration
{
  BOOL v3 = -[ADSyncConfigAssetManager _getBooleanValueForFactor:]( self,  "_getBooleanValueForFactor:",  @"disable_enUS_sync.enablement_status");
  self->_disableAssistantSyncForEnUS = v3;
  v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
    __int16 v20 = 1024;
    LODWORD(v21) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Updating value for disabling assistant sync config for enUS -> %d",  (uint8_t *)&v18,  0x12u);
  }

  BOOL v5 = -[ADSyncConfigAssetManager _getBooleanValueForFactor:]( self,  "_getBooleanValueForFactor:",  @"disable_inactive_sync.enablement_status");
  self->_disableAssistantSyncForInactiveDevices = v5;
  v6 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
    __int16 v20 = 1024;
    LODWORD(v21) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Updating value for inactive device sync config -> %d",  (uint8_t *)&v18,  0x12u);
  }

  int64_t v7 = -[ADSyncConfigAssetManager _getIntValueForFactor:]( self,  "_getIntValueForFactor:",  @"disable_inactive_sync.threshold");
  self->_inactiveDeviceThreshold = v7;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
    __int16 v20 = 2048;
    v21 = (const __CFString *)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Updating value for inactive device sync threshold -> %lld",  (uint8_t *)&v18,  0x16u);
  }

  if (self->_disableAssistantSyncForEnUS)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v9 setIsSyncDisabledForFullUoDDevices:1];
  }

  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient levelForFactor:withNamespaceName:]( self->_client,  "levelForFactor:withNamespaceName:",  @"siri_audio.media_entity_sync.disablement_status",  @"SIRI_AUDIO_DISABLE_MEDIA_ENTITY_SYNC"));
  id v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 BOOLeanValue];
    self->_BOOL isMediaEntitySyncDisabled = v12;
    id v13 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315650;
      v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
      __int16 v20 = 2112;
      v21 = @"siri_audio.media_entity_sync.disablement_status";
      __int16 v22 = 1024;
      unsigned int v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Updating sync config: %@ -> %d",  (uint8_t *)&v18,  0x1Cu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v15 = v14;
    BOOL isMediaEntitySyncDisabled = self->_isMediaEntitySyncDisabled;
  }

  else
  {
    v17 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
      __int16 v20 = 2112;
      v21 = @"siri_audio.media_entity_sync.disablement_status";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Level not found, clearing config: %@",  (uint8_t *)&v18,  0x16u);
    }

    self->_BOOL isMediaEntitySyncDisabled = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v15 = v14;
    BOOL isMediaEntitySyncDisabled = 0LL;
  }

  [v14 setIsMediaEntitySyncDisabledSyncConfig:isMediaEntitySyncDisabled];
}

- (BOOL)_getBooleanValueForFactor:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient levelForFactor:withNamespaceName:]( self->_client,  "levelForFactor:withNamespaceName:",  v4,  @"SIRI_MEMORY_SYNC_CONFIG"));
  v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 BOOLeanValue];
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADSyncConfigAssetManager _getBooleanValueForFactor:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Level not found, clearing value for factor name %@",  (uint8_t *)&v10,  0x16u);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (int64_t)_getIntValueForFactor:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient levelForFactor:withNamespaceName:]( self->_client,  "levelForFactor:withNamespaceName:",  v4,  @"SIRI_MEMORY_SYNC_CONFIG"));
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 longValue];
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADSyncConfigAssetManager _getIntValueForFactor:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Level not found, clearing value for factor name %@",  (uint8_t *)&v10,  0x16u);
    }

    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (BOOL)isMediaEntitySyncDisabled
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033D4F8;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)assistantSyncDisabledForEnUS
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033D4E4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInactiveDeviceSyncDisabled
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033D4D0;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)inactiveDeviceThreshold
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033D4BC;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsMediaEntitySyncDisabled:(BOOL)a3
{
  self->_BOOL isMediaEntitySyncDisabled = a3;
}

- (BOOL)disableAssistantSyncForEnUS
{
  return self->_disableAssistantSyncForEnUS;
}

- (void)setDisableAssistantSyncForEnUS:(BOOL)a3
{
  self->_disableAssistantSyncForEnUS = a3;
}

- (BOOL)disableAssistantSyncForInactiveDevices
{
  return self->_disableAssistantSyncForInactiveDevices;
}

- (void)setDisableAssistantSyncForInactiveDevices:(BOOL)a3
{
  self->_disableAssistantSyncForInactiveDevices = a3;
}

- (void)setInactiveDeviceThreshold:(int64_t)a3
{
  self->_inactiveDeviceThreshold = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100578608 != -1) {
    dispatch_once(&qword_100578608, &stru_1004FCD60);
  }
  return (id)qword_100578600;
}

@end