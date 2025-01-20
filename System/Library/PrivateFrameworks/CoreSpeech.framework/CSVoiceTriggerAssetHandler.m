@interface CSVoiceTriggerAssetHandler
+ (id)assetHandlerFactoryWithDisableOnDeviceCompilation:(BOOL)a3;
+ (id)sharedHandler;
+ (id)sharedHandlerDisabledOnDeviceCompilation;
- (CSVoiceTriggerAssetHandler)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (id)defaultFallbackModelIfNil:(id)a3;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)notifyObservers:(id)a3 endpointId:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSVoiceTriggerAssetHandler

- (CSVoiceTriggerAssetHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerAssetHandler;
  v2 = -[CSVoiceTriggerAssetHandler init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerAssetHandler", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }

  return v2;
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn( "-[CSVoiceTriggerAssetHandler getVoiceTriggerAssetWithEndpointId:completion:]",  "CSVoiceTriggerAssetHandler.m",  98,  "NO");
}

- (id)defaultFallbackModelIfNil:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    id v6 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetHandler defaultFallbackModelIfNil:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework",  (uint8_t *)&v9,  0xCu);
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue( +[CSAsset defaultFallBackAssetForVoiceTrigger]( &OBJC_CLASS___CSAsset,  "defaultFallBackAssetForVoiceTrigger"));
  }

  v7 = v5;

  return v7;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004AB48;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004AB3C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyObservers:(id)a3 endpointId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A9A8;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedHandler
{
  if (qword_10027FD88 != -1) {
    dispatch_once(&qword_10027FD88, &stru_10022B198);
  }
  return (id)qword_10027FD80;
}

+ (id)sharedHandlerDisabledOnDeviceCompilation
{
  if (qword_10027FD98 != -1) {
    dispatch_once(&qword_10027FD98, &stru_10022B1B8);
  }
  return (id)qword_10027FD90;
}

+ (id)assetHandlerFactoryWithDisableOnDeviceCompilation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v5 = [v4 isVoiceTriggerAssetOverridingEnabled];

  if (v5) {
    id v6 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerAssetHandlerFromFile);
  }
  else {
    id v6 = -[CSVoiceTriggerAssetHandlerMac initWithDisableOnDeviceCompilation:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerAssetHandlerMac),  "initWithDisableOnDeviceCompilation:",  v3);
  }
  return v6;
}

@end