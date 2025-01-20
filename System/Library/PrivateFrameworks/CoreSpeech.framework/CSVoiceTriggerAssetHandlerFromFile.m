@interface CSVoiceTriggerAssetHandlerFromFile
- (CSVoiceTriggerAssetHandlerFromFile)init;
- (CSVoiceTriggerAssetHandlerFromFile)initWithDisableOnDeviceCompilation:(BOOL)a3;
- (void)getPreinstallVoiceTriggerAssetForCurrentLocale:(id)a3;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
@end

@implementation CSVoiceTriggerAssetHandlerFromFile

- (CSVoiceTriggerAssetHandlerFromFile)initWithDisableOnDeviceCompilation:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerAssetHandlerFromFile;
  v4 = -[CSVoiceTriggerAssetHandler init](&v8, "init");
  if (v4)
  {
    if (!a3)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[CSOnDeviceCompilationHandler sharedHandler](&OBJC_CLASS___CSOnDeviceCompilationHandler, "sharedHandler"));
      onDeviceCompilationHandler = v4->_onDeviceCompilationHandler;
      v4->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v5;
    }

    -[CSVoiceTriggerAssetHandlerFromFile start](v4, "start");
  }

  return v4;
}

- (CSVoiceTriggerAssetHandlerFromFile)init
{
  return -[CSVoiceTriggerAssetHandlerFromFile initWithDisableOnDeviceCompilation:]( self,  "initWithDisableOnDeviceCompilation:",  0LL);
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fakeVoiceTriggerAssetPath]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByDeletingLastPathComponent]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v12 = [v11 fileExistsAtPath:v9];

  if (v12) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  0LL,  v10,  @"override-asset",  2LL));
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[CSAsset defaultFallBackAssetForVoiceTrigger](&OBJC_CLASS___CSAsset, "defaultFallBackAssetForVoiceTrigger"));
  }
  v14 = (void *)v13;
  if (v13)
  {
    onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
    if (onDeviceCompilationHandler)
    {
      id v18 = 0LL;
      -[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:]( onDeviceCompilationHandler,  "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:",  v14,  0LL,  v6,  &v18);
      id v16 = v18;
      v17 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CSVoiceTriggerAssetHandlerFromFile getVoiceTriggerAssetWithEndpointId:completion:]";
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Compile cached asset to onDevice CacheIr with error: %@",  buf,  0x16u);
      }
    }
  }

  if (v7) {
    v7[2](v7, v14, 0LL);
  }
}

- (void)getPreinstallVoiceTriggerAssetForCurrentLocale:(id)a3
{
}

- (void).cxx_destruct
{
}

@end