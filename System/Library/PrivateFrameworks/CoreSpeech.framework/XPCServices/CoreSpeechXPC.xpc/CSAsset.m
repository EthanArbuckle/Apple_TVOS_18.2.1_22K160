@interface CSAsset
+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5;
- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4;
- (id)RTModelWithFallbackLanguage:(id)a3;
- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4;
- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5;
- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4;
- (id)_sha1:(id)a3;
- (id)_sha256:(id)a3;
- (id)_splitBlobsByPhraseType:(id)a3;
- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3;
- (id)createRTModelWithLocale:(id)a3;
- (id)hearstRTModelLocaleMap;
- (id)jarvisRTModelLocaleMap;
- (id)latestHearstRTModelWithRequestOptions:(id)a3;
- (id)localeMapWithName:(id)a3;
- (id)remoraRTModelLocaleMap;
- (id)rtModelLocaleMapWithModelType:(int64_t)a3;
- (id)rtModelWithRequestOptions:(id)a3;
@end

@implementation CSAsset

- (id)createRTModelWithLocale:(id)a3
{
  v4 = (__CFString *)a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
  v6 = &ASAttributeCompatibilityVersion_ptr;
  if (v5
    && (v7 = (void *)v5,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](self, "path")),
        v8,
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"config_rtv2.txt"]);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:@"config_rt.txt"]);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:@"config.txt"]);

    int v15 = CSHasAOP();
    v16 = v14;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v18 = [v17 fileExistsAtPath:v10 isDirectory:0];

      v16 = v10;
      if ((v18 & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned __int8 v20 = [v19 fileExistsAtPath:v12 isDirectory:0];

        v16 = v12;
        if ((v20 & 1) == 0)
        {
          v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          BOOL v22 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          v16 = v14;
          if (v22)
          {
            int v38 = 136315650;
            v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
            __int16 v40 = 2114;
            v41 = 0LL;
            __int16 v42 = 2114;
            v43 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@",  (uint8_t *)&v38,  0x20u);
            v16 = v14;
          }
        }
      }
    }

    v23 = v16;
    v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315394;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      v41 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Creating RT blob using: %{public}@",  (uint8_t *)&v38,  0x16u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[VTBlobBuilder getBlobWithConfigFilename:rootDirectory:]( &OBJC_CLASS___VTBlobBuilder,  "getBlobWithConfigFilename:rootDirectory:",  v23,  v25));

    v27 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (v26)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315394;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        __int16 v40 = 2114;
        v41 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s CorealisRT model creation done successfully : %{public}@",  (uint8_t *)&v38,  0x16u);
      }

      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSAsset assetHashInResourcePath:](self, "assetHashInResourcePath:", v23));
    }

    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v38 = 136315138;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to create CorealisRT model",  (uint8_t *)&v38,  0xCu);
      }

      v28 = 0LL;
    }

    v6 = &ASAttributeCompatibilityVersion_ptr;

    if (v26)
    {
      uint64_t v35 = objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
      if (v35)
      {
        v36 = (void *)v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](self, "path"));

        if (v37) {
          goto LABEL_21;
        }
      }
    }
  }

  else
  {
    v28 = 0LL;
    v26 = 0LL;
  }

  v29 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Defaulting to en_US CorealisRT model",  (uint8_t *)&v38,  0xCu);
  }

  uint64_t v30 = objc_claimAutoreleasedReturnValue([v6[54] getDefaultBlob]);

  v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v30)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315138;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s Default CorealisRT model creation done successfully",  (uint8_t *)&v38,  0xCu);
    }

    v28 = @"nohash";
    v26 = (void *)v30;
LABEL_21:
    v32 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315650;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      v41 = v4;
      __int16 v42 = 2114;
      v43 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s RT Model queried - %{public}@ %{public}@",  (uint8_t *)&v38,  0x20u);
    }

    v33 = -[CSVoiceTriggerRTModel initWithData:hash:locale:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModel),  "initWithData:hash:locale:",  v26,  v28,  v4);

    goto LABEL_27;
  }

  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Failed to create default CorealisRT model",  (uint8_t *)&v38,  0xCu);
  }

  v33 = 0LL;
LABEL_27:

  return v33;
}

- (id)RTModelWithFallbackLanguage:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset createRTModelWithLocale:](self, "createRTModelWithLocale:", v4));

  return v5;
}

- (id)latestHearstRTModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary")),
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"rtblobs"]),
        v8,
        v7,
        v6,
        !v8))
  {
    v25 = 0LL;
    goto LABEL_23;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rtblobs"]);
  v29 = self;
  id v30 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]( self,  "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:",  v4,  v10,  1LL));

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v12)
  {
    unint64_t v14 = 0LL;
    unint64_t v32 = 0LL;
    int v15 = 0LL;
    goto LABEL_20;
  }

  id v13 = v12;
  unint64_t v14 = 0LL;
  unint64_t v32 = 0LL;
  int v15 = 0LL;
  uint64_t v16 = *(void *)v35;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v18 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"majorVersion"]);
      unint64_t v20 = [v19 unsignedIntValue];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"minorVersion"]);
      unint64_t v22 = [v21 unsignedIntValue];

      if (v14 < v20)
      {
        unint64_t v14 = v20;
LABEL_14:
        id v24 = v18;

        unint64_t v32 = v22;
        int v15 = v24;
        continue;
      }

      if (v14 == v20 && v32 < v22) {
        goto LABEL_14;
      }
    }

    id v13 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  }

  while (v13);
LABEL_20:

  v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v39 = "-[CSAsset(RTModel) latestHearstRTModelWithRequestOptions:]";
    __int16 v40 = 1024;
    int v41 = v14;
    __int16 v42 = 1024;
    int v43 = v32;
    __int16 v44 = 2113;
    v45 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s latestMajorVersion = %d, LatestMinorVersion = %d rtBlob = %{private}@",  buf,  0x22u);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100010C04;
  v33[3] = &unk_10001C9E8;
  v33[4] = v14;
  v33[5] = v32;
  id v4 = v30;
  v27 = -[CSVoiceTriggerRTModelRequestOptions initWithCSRTModelRequestOptions:builder:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions),  "initWithCSRTModelRequestOptions:builder:",  v30,  v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _buildRTModelWithBlobConfig:requestOptions:]( v29,  "_buildRTModelWithBlobConfig:requestOptions:",  v15,  v27));

LABEL_23:
  return v25;
}

- (id)rtModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryModelType]);
  id v6 = [v5 integerValue];

  if (v6) {
    v7 = @"adkblobs";
  }
  else {
    v7 = @"rtblobs";
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary")),
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]),
        v11,
        v10,
        v9,
        v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v7]);

    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _rtModelWithRequestOptions:accessoryBlobs:]( self,  "_rtModelWithRequestOptions:accessoryBlobs:",  v4,  v13));
  }

  else
  {
    int v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      unsigned __int8 v18 = "-[CSAsset(RTModel) rtModelWithRequestOptions:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s corespeech.json doesn't contains rtblobs",  (uint8_t *)&v17,  0xCu);
    }

    unint64_t v14 = 0LL;
  }

  return v14;
}

- (id)hearstRTModelLocaleMap
{
  return -[CSAsset localeMapWithName:](self, "localeMapWithName:", @"rtlocalemap");
}

- (id)jarvisRTModelLocaleMap
{
  return -[CSAsset localeMapWithName:](self, "localeMapWithName:", @"jarvislocalemap");
}

- (id)remoraRTModelLocaleMap
{
  return -[CSAsset localeMapWithName:](self, "localeMapWithName:", @"adklocalemap");
}

- (id)rtModelLocaleMapWithModelType:(int64_t)a3
{
  if (a3 == 1) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset remoraRTModelLocaleMap](self, "remoraRTModelLocaleMap"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset hearstRTModelLocaleMap](self, "hearstRTModelLocaleMap"));
  }
  return v3;
}

- (id)localeMapWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  if (v5)
  {
    id v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v4]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      char isKindOfClass = objc_opt_isKindOfClass(v11, v12);

      if ((isKindOfClass & 1) != 0)
      {
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v4]);

        goto LABEL_9;
      }
    }

    else
    {
    }
  }

  uint64_t v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315394;
    v19 = "-[CSAsset(RTModel) localeMapWithName:]";
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Locale map for %{public}@ is not available on asset",  (uint8_t *)&v18,  0x16u);
  }

  int v15 = 0LL;
LABEL_9:

  return v15;
}

- (id)_sha1:(id)a3
{
  id v3 = a3;
  CC_SHA1([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), md);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 40LL));
  for (uint64_t i = 0LL; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (id)_sha256:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 32LL));
  id v5 = v3;
  id v6 = [v5 bytes];
  CC_LONG v7 = [v5 length];

  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  return v8;
}

- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"blob"]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v8]);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

    id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        int v43 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Reading blob from : %{public}@",  buf,  0x16u);
      }

      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v10));
      if (v14)
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _sha1:](self, "_sha1:", v14));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", 0, 20));

        int v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _sha256:](self, "_sha256:", v14));
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"signature"]);
        __int128 v37 = (void *)v16;
        if (v16)
        {
          uint64_t v17 = v16;
          int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v17]);

          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v21 = [v20 fileExistsAtPath:v19];

          if (v21) {
            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v19));
          }
          else {
            __int128 v36 = 0LL;
          }
        }

        else
        {
          __int128 v36 = 0LL;
        }

        uint64_t v25 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cert"]);
        __int128 v35 = (void *)v25;
        if (v25)
        {
          uint64_t v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath", v25));
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v26]);

          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v30 = [v29 fileExistsAtPath:v28];

          if (v30) {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v28));
          }
          else {
            v31 = 0LL;
          }
        }

        else
        {
          v31 = 0LL;
        }

        unint64_t v32 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModel);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v7 siriLocale]);
        v23 = -[CSVoiceTriggerRTModel initWithData:hash:locale:digest:signature:certificate:]( v32,  "initWithData:hash:locale:digest:signature:certificate:",  v14,  v39,  v33,  v38,  v36,  v31);
      }

      else
      {
        id v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
          __int16 v42 = 2114;
          int v43 = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Blob is nil : %{public}@",  buf,  0x16u);
        }

        v23 = 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        int v43 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s blob file is not exists at %{public}@",  buf,  0x16u);
      }

      v23 = 0LL;
    }
  }

  else
  {
    unint64_t v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s blob file name is not exists",  buf,  0xCu);
    }

    v23 = 0LL;
  }

  return v23;
}

- (id)_splitBlobsByPhraseType:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"phraseType"]);
        unsigned __int8 v12 = (void *)v11;
        if (v11) {
          id v13 = (__CFString *)v11;
        }
        else {
          id v13 = @"HSOnly";
        }
        unint64_t v14 = v13;

        int v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v14));
        if (!v15)
        {
          int v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, v14);
        }

        -[NSMutableArray addObject:](v15, "addObject:", v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v7);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)j);
        unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v21));
        id v23 = [v22 sortedArrayUsingComparator:&stru_10001CA28];

        if (v23) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, v21);
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v18);
  }

  return v4;
}

- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _splitBlobsByPhraseType:](self, "_splitBlobsByPhraseType:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 userSelectedPhraseType]);
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSAsset _userSelectedPhraseTypeToRTModelPhraseType:]( self,  "_userSelectedPhraseTypeToRTModelPhraseType:",  v10));

  if (-[CSAsset _allowMultiPhrase:forceSkipEngineVersionCheck:]( self,  "_allowMultiPhrase:forceSkipEngineVersionCheck:",  v8,  v5))
  {
    if (!v11)
    {
      unsigned __int8 v12 = 0LL;
      goto LABEL_8;
    }
  }

  else
  {
    id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      id v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
      __int16 v18 = 1024;
      *(_DWORD *)uint64_t v19 = 0;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Falling back to HSOnly phrase - Multi-phrase allowed: %d, request options: %@",  (uint8_t *)&v16,  0x1Cu);
    }

    uint64_t v11 = @"HSOnly";
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
LABEL_8:
  unint64_t v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315651;
    id v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
    __int16 v18 = 2113;
    *(void *)uint64_t v19 = v11;
    *(_WORD *)&v19[8] = 2113;
    *(void *)&v19[10] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Selected phrase type: %{private}@ accessory RTBlobs: %{private}@",  (uint8_t *)&v16,  0x20u);
  }

  return v12;
}

- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]( self,  "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:",  v6,  a4,  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 engineMajorVersion]);
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 engineMinorVersion]);
  unsigned int v11 = [v10 unsignedIntValue];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    id v24 = self;
    id v25 = v6;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"majorVersion"]);
        unsigned int v18 = [v17 unsignedIntValue];

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"minorVersion"]);
        unsigned int v20 = [v19 unsignedIntValue];

        if (v18 == v9 && v11 >= v20)
        {
          id v6 = v25;
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _buildRTModelWithBlobConfig:requestOptions:]( v24,  "_buildRTModelWithBlobConfig:requestOptions:",  v16,  v25));
          goto LABEL_15;
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    unint64_t v22 = 0LL;
    id v6 = v25;
  }

  else
  {
    unint64_t v22 = 0LL;
  }

- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryInfo]);
  unsigned int v7 = [v6 supportsJustSiri];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 engineMajorVersion]);
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 engineMinorVersion]);
  unsigned int v11 = [v10 unsignedIntValue];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (a4) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  unsigned int v15 = [v5 allowMph];

  char v16 = v7 & v14 & v15;
  id v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    unsigned int v20 = "-[CSAsset(RTModel) _allowMultiPhrase:forceSkipEngineVersionCheck:]";
    __int16 v21 = 1024;
    int v22 = v7 & v14 & v15;
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 1024;
    unsigned int v28 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Multi-phrase keyword detection (%d): Accessory supports multi-phrase: %d, engine support multi-phrase: %d, devi ce allows multi-phrase: %d",  (uint8_t *)&v19,  0x24u);
  }

  return v16;
}

- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3
{
  if ([a3 unsignedIntegerValue] == (id)1) {
    return @"HSJS";
  }
  else {
    return @"HSOnly";
  }
}

+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 unsignedIntegerValue];
  id v11 = [v8 unsignedIntegerValue];
  id v12 = [v9 unsignedIntegerValue];

  int v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    int v19 = "+[CSAsset(RTModel) supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Incoming Major version:%@, Incoming Minor version:%@",  (uint8_t *)&v18,  0x20u);
  }

  if (v10) {
    BOOL v14 = v11 == 0LL;
  }
  else {
    BOOL v14 = 1;
  }
  char v15 = !v14;
  else {
    BOOL v16 = 0;
  }

  return v16;
}

@end