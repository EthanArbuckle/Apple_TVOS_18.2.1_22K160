@interface CSOnDeviceMAAssetCachedIrPurger
+ (id)purgeCachedIrForMAAsset:(id)a3 cachedIrDir:(id)a4;
@end

@implementation CSOnDeviceMAAssetCachedIrPurger

+ (id)purgeCachedIrForMAAsset:(id)a3 cachedIrDir:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([a3 getCSAssetOfType:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSOnDeviceCompilationUtils getCachedIrsFromCSAsset:cachedIrDir:]( &OBJC_CLASS___CSOnDeviceCompilationUtils,  "getCachedIrsFromCSAsset:cachedIrDir:",  v7,  v6));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      v20 = v7;
      v21 = v6;
      id v11 = 0LL;
      uint64_t v12 = *(void *)v24;
      do
      {
        v13 = 0LL;
        v14 = v11;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v20, v21));
          id v22 = v14;
          [v16 removeItemAtPath:v15 error:&v22];
          id v11 = v22;

          v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v28 = "+[CSOnDeviceMAAssetCachedIrPurger purgeCachedIrForMAAsset:cachedIrDir:]";
            __int16 v29 = 2112;
            id v30 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s purging cachedIr with error: %@",  buf,  0x16u);
          }

          v13 = (char *)v13 + 1;
          v14 = v11;
        }

        while (v10 != v13);
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }

      while (v10);
      v7 = v20;
      v6 = v21;
    }

    else
    {
      id v11 = 0LL;
    }
  }

  else
  {
    uint64_t v18 = CSErrorDomain;
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"input nil"));
    v33 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  114LL,  v8));
  }

  return v11;
}

@end