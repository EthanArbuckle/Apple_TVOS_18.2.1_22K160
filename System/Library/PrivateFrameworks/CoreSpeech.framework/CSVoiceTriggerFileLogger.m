@interface CSVoiceTriggerFileLogger
- (BOOL)_shouldLogDeviceId:(id)a3;
- (BOOL)_shouldSkipLogging:(id)a3;
- (BOOL)fileLoggingEnabled;
- (BOOL)geckoLoggingEnabled;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerFileLogger)init;
- (CSVoiceTriggerFileLogger)initWithSpeechManager:(id)a3 fileLoggingEnabled:(BOOL)a4 geckoLoggingEnabled:(BOOL)a5;
- (OS_dispatch_queue)queue;
- (id)_audioLogDirectory;
- (id)_geckoLogDirectory;
- (id)_metaFilenameWithRootDir:(id)a3 prefix:(id)a4 deviceId:(id)a5;
- (id)_timeStampString;
- (void)_clearOldGeckoLoggingFiles;
- (void)_clearOldLoggingFiles;
- (void)_logGeckoWithFilePrefix:(id)a3 WithResult:(id)a4;
- (void)_logSelfTriggerAudioWithPrefix:(id)a3 result:(id)a4;
- (void)_logVTResult:(id)a3 metaFilePath:(id)a4 audioFilePath:(id)a5 completion:(id)a6;
- (void)_writeDictionary:(id)a3 toPath:(id)a4;
- (void)selfTriggerDetector:(id)a3 didDetectNearMiss:(id)a4;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setFileLoggingEnabled:(BOOL)a3;
- (void)setGeckoLoggingEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectSpeakerReject:(id)a3;
@end

@implementation CSVoiceTriggerFileLogger

- (CSVoiceTriggerFileLogger)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = [v3 fileLoggingIsEnabled];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v6 = -[CSVoiceTriggerFileLogger initWithSpeechManager:fileLoggingEnabled:geckoLoggingEnabled:]( self,  "initWithSpeechManager:fileLoggingEnabled:geckoLoggingEnabled:",  0,  v4,  (uint64_t)[v5 geckoLoggingLevel] > 0);

  return v6;
}

- (CSVoiceTriggerFileLogger)initWithSpeechManager:(id)a3 fileLoggingEnabled:(BOOL)a4 geckoLoggingEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFileLogger;
  v9 = -[CSVoiceTriggerFileLogger init](&v15, "init");
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("VoiceTrigger audio logging queue", 0LL);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    if (v8) {
      v12 = (CSSpeechManager *)v8;
    }
    else {
      v12 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    }
    speechManager = v9->_speechManager;
    v9->_speechManager = v12;

    -[CSVoiceTriggerFileLogger setFileLoggingEnabled:](v9, "setFileLoggingEnabled:", v6);
    -[CSVoiceTriggerFileLogger setGeckoLoggingEnabled:](v9, "setGeckoLoggingEnabled:", v5);
  }

  return v9;
}

- (id)_audioLogDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 voiceTriggerAudioLogDirectory]);

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0LL;
  }

  else
  {
    id v11 = 0LL;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v9 = v7;
        dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v13 = "-[CSVoiceTriggerFileLogger _audioLogDirectory]";
        __int16 v14 = 2114;
        objc_super v15 = v4;
        __int16 v16 = 2114;
        v17 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      id v4 = @"/tmp";
    }
  }

  return v4;
}

- (id)_geckoLogDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 geckoAudioLogDirectory]);

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0LL;
  }

  else
  {
    NSFileAttributeKey v19 = NSFileProtectionKey;
    NSFileProtectionType v20 = NSFileProtectionCompleteUnlessOpen;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v12 = 0LL;
    unsigned __int8 v7 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v12];
    id v5 = v12;

    if ((v7 & 1) == 0)
    {
      id v8 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v10 = v8;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        __int16 v14 = "-[CSVoiceTriggerFileLogger _geckoLogDirectory]";
        __int16 v15 = 2114;
        __int16 v16 = v4;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      id v4 = 0LL;
    }
  }

  return v4;
}

- (id)_timeStampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

- (id)_metaFilenameWithRootDir:(id)a3 prefix:(id)a4 deviceId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFileLogger _timeStampString](self, "_timeStampString"));
  id v12 = (void *)v11;
  if (v8) {
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@%@%@",  v11,  v8,  v9,  @".json");
  }
  else {
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v11,  v9,  @".json",  v17);
  }
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v14]);
  return v15;
}

- (void)_writeDictionary:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v13 = 0LL;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  3LL,  &v13));
    id v8 = v13;
    if (v8)
    {
      id v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[CSVoiceTriggerFileLogger _writeDictionary:toPath:]";
        __int16 v16 = 2114;
        uint64_t v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Error writing out event info meta: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      [v7 writeToFile:v6 atomically:0];
    }
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "-[CSVoiceTriggerFileLogger _writeDictionary:toPath:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s No meta data to write, skip",  buf,  0xCu);
    }
  }
}

- (BOOL)_shouldLogDeviceId:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource]);
  unsigned __int8 v4 = [v3 isEqualToString:kVTEIFirstPassTriggeredFromRemora];

  return v4;
}

- (BOOL)_shouldSkipLogging:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource]);
  unsigned __int8 v4 = [v3 isEqualToString:kVTEIFirstPassTriggeredFromDarwin];

  return v4;
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled"))
  {
    id v14 = v15;
LABEL_8:
    id v15 = v14;
    -[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:]( self,  "_logGeckoWithFilePrefix:WithResult:",  @"-triggered",  v14);
    goto LABEL_9;
  }

  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v15))
  {
    unsigned int v7 = -[CSVoiceTriggerFileLogger _shouldLogDeviceId:](self, "_shouldLogDeviceId:", v15);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory"));
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0LL;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:]( self,  "_metaFilenameWithRootDir:prefix:deviceId:",  v8,  @"-triggered",  v9));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"]);
    id v12 = [v15 mutableCopy];
    [v12 setObject:v11 forKey:kVTEICaptureFilePath];
    id v13 = v12;

    -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:]( self,  "_logVTResult:metaFilePath:audioFilePath:completion:",  v13,  v10,  v11,  &stru_10022E088);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

    id v14 = v13;
    goto LABEL_8;
  }

- (void)_logVTResult:(id)a3 metaFilePath:(id)a4 audioFilePath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kVTEIAudioProviderUUID]);
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10012E094;
  v21[3] = &unk_10022E0B0;
  v21[4] = self;
  id v22 = v14;
  id v23 = v10;
  id v24 = v12;
  id v25 = v11;
  id v26 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  id v20 = v14;
  dispatch_async(queue, v21);
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled"))
  {
    id v14 = v15;
LABEL_8:
    id v15 = v14;
    -[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:]( self,  "_logGeckoWithFilePrefix:WithResult:",  @"-almost",  v14);
    goto LABEL_9;
  }

  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v15))
  {
    unsigned int v7 = -[CSVoiceTriggerFileLogger _shouldLogDeviceId:](self, "_shouldLogDeviceId:", v15);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory"));
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0LL;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:]( self,  "_metaFilenameWithRootDir:prefix:deviceId:",  v8,  @"-almost",  v9));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"]);
    id v12 = [v15 mutableCopy];
    [v12 setObject:v11 forKey:kVTEICaptureFilePath];
    id v13 = v12;

    -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:]( self,  "_logVTResult:metaFilePath:audioFilePath:completion:",  v13,  v10,  v11,  &stru_10022E0D0);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

    id v14 = v13;
    goto LABEL_8;
  }

- (void)_logGeckoWithFilePrefix:(id)a3 WithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = CSIsIOS(v7, v8);
  if (((v9 & 1) != 0 || CSIsHorseman(v9, v10))
    && -[CSVoiceTriggerFileLogger geckoLoggingEnabled](self, "geckoLoggingEnabled")
    && !-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v7))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFileLogger _geckoLogDirectory](self, "_geckoLogDirectory"));
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:]( self,  "_metaFilenameWithRootDir:prefix:deviceId:",  v11,  v6,  0LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"]);
      id v14 = [v7 mutableCopy];
      [v14 setObject:v13 forKey:kVTEICaptureFilePath];
      id v15 = v14;

      -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:]( self,  "_logVTResult:metaFilePath:audioFilePath:completion:",  v15,  v12,  v13,  &stru_10022E0F0);
      -[CSVoiceTriggerFileLogger _clearOldGeckoLoggingFiles](self, "_clearOldGeckoLoggingFiles");

      id v7 = v15;
    }

    else
    {
      id v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315138;
        id v18 = "-[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to get Gecko log directory",  (uint8_t *)&v17,  0xCu);
      }
    }
  }
}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
  id v10 = a3;
  if (!-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled"))
  {
    id v9 = v10;
    goto LABEL_5;
  }

  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v10))
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:]( self,  "_metaFilenameWithRootDir:prefix:deviceId:",  v4,  @"-rejected",  0LL));

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"]);
    id v7 = [v10 mutableCopy];
    [v7 setObject:v6 forKey:kVTEICaptureFilePath];
    id v8 = v7;

    -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:]( self,  "_logVTResult:metaFilePath:audioFilePath:completion:",  v8,  v5,  v6,  &stru_10022E110);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

    id v9 = v8;
LABEL_5:
    id v10 = v9;
    -[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:]( self,  "_logGeckoWithFilePrefix:WithResult:",  @"-rejected",  v9);
  }
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5 = a4;
  if (-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled")) {
    -[CSVoiceTriggerFileLogger _logSelfTriggerAudioWithPrefix:result:]( self,  "_logSelfTriggerAudioWithPrefix:result:",  @"-selfTrigger",  v5);
  }
}

- (void)selfTriggerDetector:(id)a3 didDetectNearMiss:(id)a4
{
  id v7 = a4;
  if (-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled")
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences")),
        unsigned int v6 = [v5 isSelfTriggerNearMissAudioLoggingEnabled],
        v5,
        v6))
  {
    -[CSVoiceTriggerFileLogger _logSelfTriggerAudioWithPrefix:result:]( self,  "_logSelfTriggerAudioWithPrefix:result:",  @"-selfTriggerNearMiss",  v7);
  }
}

- (void)_logSelfTriggerAudioWithPrefix:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:]( self,  "_metaFilenameWithRootDir:prefix:deviceId:",  v8,  v6,  0LL));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kVTEIAudioProviderUUID]);
    id v12 = [v7 mutableCopy];
    [v12 setObject:v10 forKey:kVTEICaptureFilePath];
    id v13 = v12;

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012DE84;
    block[3] = &unk_10022E138;
    id v19 = v13;
    id v20 = self;
    id v21 = v11;
    id v22 = v10;
    id v23 = v9;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    id v7 = v13;
    dispatch_async(queue, block);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");
  }
}

- (void)_clearOldLoggingFiles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  +[CSAudioFileManager pruneNumberOfLogFilesTo:]( CSAudioFileManager,  "pruneNumberOfLogFilesTo:",  [v2 maxNumLoggingFiles]);

  +[CSConfig daysBeforeRemovingLogFiles](&OBJC_CLASS___CSConfig, "daysBeforeRemovingLogFiles");
  +[CSAudioFileManager removeLogFilesOlderThanNDays:](&OBJC_CLASS___CSAudioFileManager, "removeLogFilesOlderThanNDays:");
  +[CSConfig daysBeforeRemovingLogFiles](&OBJC_CLASS___CSConfig, "daysBeforeRemovingLogFiles");
  +[CSAudioFileManager removeRemoteP2PLogFilesOlderThanNDays:]( &OBJC_CLASS___CSAudioFileManager,  "removeRemoteP2PLogFilesOlderThanNDays:");
}

- (void)_clearOldGeckoLoggingFiles
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v4 geckoAudioLogDirectory]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2));
  +[CSConfig daysBeforeRemovingLogFiles](&OBJC_CLASS___CSConfig, "daysBeforeRemovingLogFiles");
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:]( &OBJC_CLASS___CSUtils,  "removeLogFilesInDirectory:matchingPattern:beforeDays:",  v3,  @".*");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (BOOL)fileLoggingEnabled
{
  return self->_fileLoggingEnabled;
}

- (void)setFileLoggingEnabled:(BOOL)a3
{
  self->_fileLoggingEnabled = a3;
}

- (BOOL)geckoLoggingEnabled
{
  return self->_geckoLoggingEnabled;
}

- (void)setGeckoLoggingEnabled:(BOOL)a3
{
  self->_geckoLoggingEnabled = a3;
}

- (void).cxx_destruct
{
}

@end