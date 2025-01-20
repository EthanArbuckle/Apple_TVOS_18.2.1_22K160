@interface LSRSpeechAssets
+ (id)assetConfigParameters:(id)a3;
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4;
- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 clientID:(id)a4 regionId:(id)a5 mainAssetConfig:(id)a6;
- (id)installedHammerConfigFileForLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5;
- (id)installedLanguageDetectorAssetWithClientID:(id)a3;
- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
@end

@implementation LSRSpeechAssets

- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  if (a4)
  {
    v5 = (void (**)(id, void *))a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedLanguagesForAssetType:a3]);

    v8 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      uint64_t v10 = SFEntitledAssetTypeToString(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v12 = 136315650;
      v13 = "-[LSRSpeechAssets installedLanguagesForAssetType:completion:]";
      __int16 v14 = 2112;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Installed languages for %@: %@",  (uint8_t *)&v12,  0x20u);
    }

    v5[2](v5, v7);
  }

- (id)installedHammerConfigFileForLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5
{
  id v7 = a3;
  if (a4 == 7)
  {
    id v8 = 0LL;
  }

  else
  {
    id v9 = a5;
    id v10 = [[SFEntitledAssetConfig alloc] initWithLanguage:v7 assetType:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 installedAssetWithConfig:v10 regionId:0 shouldSubscribe:1 subscriberId:v9 expiration:0]);

    if ([v12 length])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  1LL));
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v13]);

      id v15 = [[_EARSpeechModelInfo alloc] initWithConfig:v14];
      if (v15)
      {
        id v8 = v14;
      }

      else
      {
        v17 = (os_log_s *)SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_FAULT))
        {
          int v19 = 136315394;
          v20 = "-[LSRSpeechAssets installedHammerConfigFileForLanguage:assetType:clientID:]";
          __int16 v21 = 2112;
          id v22 = v14;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "%s Failed to read Hammer config file at path: %@",  (uint8_t *)&v19,  0x16u);
        }

        id v8 = 0LL;
      }
    }

    else
    {
      __int16 v16 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315394;
        v20 = "-[LSRSpeechAssets installedHammerConfigFileForLanguage:assetType:clientID:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s No Hammer asset found for language: %@",  (uint8_t *)&v19,  0x16u);
      }

      id v8 = 0LL;
    }
  }

  return v8;
}

- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 clientID:(id)a4 regionId:(id)a5 mainAssetConfig:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [[SFEntitledAssetConfig alloc] initWithLanguage:v10 assetType:5];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 installedAssetWithConfig:v14 regionId:v11 shouldSubscribe:1 subscriberId:v13 expiration:0]);

  if ([v16 length])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  5LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v17]);

    if (-[LSRSpeechAssets _geoLMCompatibleWithMainAsset:geoAssetConfig:]( self,  "_geoLMCompatibleWithMainAsset:geoAssetConfig:",  v12,  v18))
    {
      id v19 = v18;
    }

    else
    {
      __int16 v21 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_FAULT))
      {
        int v23 = 136315395;
        v24 = "-[LSRSpeechAssets installedGeoLMRegionSpecificAssetForLanguage:clientID:regionId:mainAssetConfig:]";
        __int16 v25 = 2113;
        id v26 = v11;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "%s GeoLM: Region specific asset for %{private}@ is incompatible with the main asset.",  (uint8_t *)&v23,  0x16u);
      }

      id v19 = 0LL;
    }
  }

  else
  {
    v20 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315651;
      v24 = "-[LSRSpeechAssets installedGeoLMRegionSpecificAssetForLanguage:clientID:regionId:mainAssetConfig:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2113;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s GeoLM: No region specific asset found for language: %@, regionId: %{private}@",  (uint8_t *)&v23,  0x20u);
    }

    id v19 = 0LL;
  }

  return v19;
}

- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[_EARSpeechModelInfo alloc] initWithConfig:v5];
  id v8 = [[_EARSpeechModelInfo alloc] initWithConfig:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 version]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 version]);
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) != 0)
  {

    BOOL v12 = 1;
  }

  else
  {
    id v13 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 version]);
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 version]);
      int v17 = 136316162;
      v18 = "-[LSRSpeechAssets _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s GeoLM: model-info.version doesn't match. mainASRModelInfo.version=%@ geoLMModelInfo.version=%@ mainAssetConfi g=%@ geoAssetConfig=%@",  (uint8_t *)&v17,  0x34u);
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (id)installedLanguageDetectorAssetWithClientID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:kSFSpeechRecognizerCustomLIDAssetPathKey]);

  if (v5 && [v5 length] && SFIsInternalInstall())
  {
    id v6 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "-[LSRSpeechAssets installedLanguageDetectorAssetWithClientID:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Custom Language Detection asset path: %@",  (uint8_t *)&v12,  0x16u);
    }

    id v7 = v5;
  }

  else
  {
    id v8 = [[SFEntitledAssetConfig alloc] initWithLanguage:@"en-US" assetType:6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    id v7 = (id)objc_claimAutoreleasedReturnValue( [v9 installedAssetWithConfig:v8 regionId:0 shouldSubscribe:1 subscriberId:v3 expiration:0]);

    id v10 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "-[LSRSpeechAssets installedLanguageDetectorAssetWithClientID:]";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Language Detection asset path: %@",  (uint8_t *)&v12,  0x16u);
    }
  }

  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___LSRSpeechAssets, a2) == a1) {
    SFLogInitIfNeeded();
  }
}

+ (id)sharedInstance
{
  if (qword_10005D4B0 != -1) {
    dispatch_once(&qword_10005D4B0, &stru_100051B38);
  }
  return (id)qword_10005D4A8;
}

+ (id)assetConfigParameters:(id)a3
{
  id v3 = a3;
  v4 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v3);
  if (v4)
  {
    id v13 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  &v13));
    id v6 = v13;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = v5;
    }

    else
    {
      id v9 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v15 = "+[LSRSpeechAssets assetConfigParameters:]";
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Failed to parse json config file:%@",  buf,  0x16u);
      }

      id v10 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v11 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "+[LSRSpeechAssets assetConfigParameters:]";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to read json file: %@",  buf,  0x16u);
    }

    id v10 = 0LL;
  }

  return v10;
}

@end