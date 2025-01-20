@interface ADServerFallbackConfigManager
+ (id)sharedInstance;
- (ADServerFallbackConfigManager)init;
- (BOOL)_shouldDisableServerFallbackABForDomainDirected:(BOOL)a3;
- (BOOL)assistantSyncDisabled;
- (BOOL)shouldDisableAssistantSync;
- (BOOL)shouldDisableServerFallbackDomain;
- (BOOL)shouldDisableServerFallbackNL;
- (OS_dispatch_queue)queue;
- (id)updateHandler;
- (void)_populateConfiguration;
- (void)_registerUpdateHandler;
- (void)setQueue:(id)a3;
- (void)setShouldDisableAssistantSync:(BOOL)a3;
- (void)setShouldDisableServerFallbackDomain:(BOOL)a3;
- (void)setShouldDisableServerFallbackNL:(BOOL)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation ADServerFallbackConfigManager

- (ADServerFallbackConfigManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADServerFallbackConfigManager;
  v2 = -[ADServerFallbackConfigManager init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", 115LL));
    siriUnderstandingClient = v2->_siriUnderstandingClient;
    v2->_siriUnderstandingClient = (TRIClient *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("ADServerFallbackConfigManager", v6);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    -[ADServerFallbackConfigManager _registerUpdateHandler](v2, "_registerUpdateHandler");
    v9 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001277B8;
    block[3] = &unk_1004FD940;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (BOOL)assistantSyncDisabled
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001277A4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_registerUpdateHandler
{
  char v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADServerFallbackConfigManager _registerUpdateHandler]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Registering update handler for ADServerFallbackConfigManager",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001276C4;
  v7[3] = &unk_1004FCD88;
  objc_copyWeak(&v8, (id *)buf);
  v4 = objc_retainBlock(v7);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;

  id v6 =  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]( self->_siriUnderstandingClient,  "addUpdateHandlerForNamespaceName:queue:usingBlock:",  @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION",  self->_queue,  self->_updateHandler);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_populateConfiguration
{
  self->_BOOL shouldDisableServerFallbackDomain = -[ADServerFallbackConfigManager _shouldDisableServerFallbackABForDomainDirected:]( self,  "_shouldDisableServerFallbackABForDomainDirected:",  1LL);
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v3 setShouldDisableServerFallbackDomain:self->_shouldDisableServerFallbackDomain];

  v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL shouldDisableServerFallbackDomain = self->_shouldDisableServerFallbackDomain;
    int v15 = 136315394;
    v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    __int16 v17 = 1024;
    LODWORD(v18) = shouldDisableServerFallbackDomain;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Updating value for _shouldDisableServerFallbackDomain config-> %d",  (uint8_t *)&v15,  0x12u);
  }

  self->_BOOL shouldDisableServerFallbackNL = -[ADServerFallbackConfigManager _shouldDisableServerFallbackABForDomainDirected:]( self,  "_shouldDisableServerFallbackABForDomainDirected:",  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v6 setShouldDisableServerFallbackNL:self->_shouldDisableServerFallbackNL];

  dispatch_queue_t v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL shouldDisableServerFallbackNL = self->_shouldDisableServerFallbackNL;
    int v15 = 136315394;
    v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    __int16 v17 = 1024;
    LODWORD(v18) = shouldDisableServerFallbackNL;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Updating value for _shouldDisableServerFallbackNL config-> %d",  (uint8_t *)&v15,  0x12u);
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient levelForFactor:withNamespaceName:]( self->_siriUnderstandingClient,  "levelForFactor:withNamespaceName:",  @"disableAssistantSync",  @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION"));
  v10 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = @"YES";
    int v15 = 136315906;
    v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    if (!v9) {
      v11 = @"NO";
    }
    __int16 v17 = 2112;
    v18 = @"disableAssistantSync";
    __int16 v19 = 2112;
    v20 = @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION";
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Getting level information from trial for factor = %@, namespace = %@, level is not nil = %@",  (uint8_t *)&v15,  0x2Au);
  }

  self->_unsigned int shouldDisableAssistantSync = 0;
  if (v9)
  {
    if ([v9 levelOneOfCase] == 10)
    {
      unsigned int shouldDisableAssistantSync = [v9 BOOLeanValue];
      self->_unsigned int shouldDisableAssistantSync = shouldDisableAssistantSync;
    }

    else
    {
      unsigned int shouldDisableAssistantSync = self->_shouldDisableAssistantSync;
    }
  }

  else
  {
    unsigned int shouldDisableAssistantSync = 0;
  }

  objc_super v13 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    __int16 v17 = 1024;
    LODWORD(v18) = shouldDisableAssistantSync;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Updating value for _shouldDisableAssistantSync config-> %d",  (uint8_t *)&v15,  0x12u);
    unsigned int shouldDisableAssistantSync = self->_shouldDisableAssistantSync;
  }

  if (shouldDisableAssistantSync)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v14 setIsSyncDisabledForFullUoDDevices:1];
  }
}

- (BOOL)_shouldDisableServerFallbackABForDomainDirected:(BOOL)a3
{
  v4 = @"disableFallbackNL";
  if (a3) {
    v4 = @"disableFallbackDomain";
  }
  dispatch_queue_attr_t v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient levelForFactor:withNamespaceName:]( self->_siriUnderstandingClient,  "levelForFactor:withNamespaceName:",  v5,  @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION"));
  dispatch_queue_t v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v8 = @"YES";
    int v11 = 136315906;
    v12 = "-[ADServerFallbackConfigManager _shouldDisableServerFallbackABForDomainDirected:]";
    if (!v6) {
      id v8 = @"NO";
    }
    __int16 v13 = 2112;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION";
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Getting level information from trial for factor = %@, namespace = %@, level is not nil = %@",  (uint8_t *)&v11,  0x2Au);
  }

  if (v6)
  {
    else {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)shouldDisableServerFallbackNL
{
  return self->_shouldDisableServerFallbackNL;
}

- (void)setShouldDisableServerFallbackNL:(BOOL)a3
{
  self->_BOOL shouldDisableServerFallbackNL = a3;
}

- (BOOL)shouldDisableServerFallbackDomain
{
  return self->_shouldDisableServerFallbackDomain;
}

- (void)setShouldDisableServerFallbackDomain:(BOOL)a3
{
  self->_BOOL shouldDisableServerFallbackDomain = a3;
}

- (BOOL)shouldDisableAssistantSync
{
  return self->_shouldDisableAssistantSync;
}

- (void)setShouldDisableAssistantSync:(BOOL)a3
{
  self->_unsigned int shouldDisableAssistantSync = a3;
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
  if (qword_100577EC8 != -1) {
    dispatch_once(&qword_100577EC8, &stru_1004F22A8);
  }
  return (id)qword_100577EC0;
}

@end