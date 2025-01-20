@interface ESStoreAudioData
- (BOOL)_moveAudioToVarMobile:(id)a3;
- (BOOL)_saveAudioToCache:(id)a3;
- (BOOL)hasData;
- (BOOL)hasRecognizedAnything;
- (BOOL)isSamplingForDictation;
- (BOOL)isSpeakerCodeUsed;
- (ESSelfHelper)selfLogger;
- (ESStoreAudioData)initWithUUIDString:(id)a3 language:(id)a4 task:(id)a5 codec:(id)a6 samplingRate:(unint64_t)a7 inferenceSpeakerCode:(id)a8 numTrainedFrames:(id)a9 trainingNnetVersion:(id)a10 isSpeakerCodeUsed:(BOOL)a11 isSamplingForDictation:(BOOL)a12 selfLogger:(id)a13;
- (NSMutableData)audioPackets;
- (NSMutableDictionary)audioMetadata;
- (NSNumber)numTrainedFrames;
- (NSNumber)trainingNnetVersion;
- (NSString)UUIDString;
- (NSString)codec;
- (NSString)currentAudioFilePath;
- (NSString)inferenceSpeakerCode;
- (NSString)language;
- (NSString)logPrefix;
- (NSString)task;
- (double)collectedAudioDurationMS;
- (id)_createAudioFilePath;
- (id)_createCachesDirectoryIfItDoesNotExist;
- (unint64_t)samplingRate;
- (void)_cleanupCacheAndReset:(id)a3;
- (void)_deleteItemAtPath:(id)a3;
- (void)_logAudioSampledEventsWithStatus:(int64_t)a3 error:(id)a4 customReasonForFailure:(int64_t)a5;
- (void)_saveAudioMetadataToFilePath:(id)a3;
- (void)addAudioPacket:(id)a3;
- (void)cleanupCacheAndReset;
- (void)dealloc;
- (void)markRecognition;
- (void)saveAudioToDisk;
- (void)setAudioMetadata:(id)a3;
- (void)setAudioPackets:(id)a3;
- (void)setCodec:(id)a3;
- (void)setCollectedAudioDurationMS:(double)a3;
- (void)setCurrentAudioFilePath:(id)a3;
- (void)setHasRecognizedAnything:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLogPrefix:(id)a3;
- (void)setSamplingRate:(unint64_t)a3;
- (void)setSelfLogger:(id)a3;
- (void)setTask:(id)a3;
- (void)setUUIDString:(id)a3;
@end

@implementation ESStoreAudioData

- (ESStoreAudioData)initWithUUIDString:(id)a3 language:(id)a4 task:(id)a5 codec:(id)a6 samplingRate:(unint64_t)a7 inferenceSpeakerCode:(id)a8 numTrainedFrames:(id)a9 trainingNnetVersion:(id)a10 isSpeakerCodeUsed:(BOOL)a11 isSamplingForDictation:(BOOL)a12 selfLogger:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v40 = a5;
  id v39 = a6;
  id v20 = a8;
  id v21 = a9;
  id v38 = a10;
  id v37 = a13;
  if ([v18 length])
  {
    v41.receiver = self;
    v41.super_class = (Class)&OBJC_CLASS___ESStoreAudioData;
    v22 = -[ESStoreAudioData init](&v41, "init");
    v23 = v22;
    if (v22)
    {
      -[ESStoreAudioData setUUIDString:](v22, "setUUIDString:", v18);
      -[ESStoreAudioData setLanguage:](v23, "setLanguage:", v19);
      objc_storeStrong((id *)&v23->_task, a5);
      objc_storeStrong((id *)&v23->_codec, a6);
      v23->_samplingRate = a7;
      v24 = (NSString *)[v20 copy];
      inferenceSpeakerCode = v23->_inferenceSpeakerCode;
      v23->_inferenceSpeakerCode = v24;

      objc_storeStrong((id *)&v23->_numTrainedFrames, a9);
      objc_storeStrong((id *)&v23->_trainingNnetVersion, a10);
      v23->_isSpeakerCodeUsed = a11;
      v26 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      audioPackets = v23->_audioPackets;
      v23->_audioPackets = v26;

      v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      audioMetadata = v23->_audioMetadata;
      v23->_audioMetadata = v28;

      v23->_isSamplingForDictation = a12;
      objc_storeStrong((id *)&v23->_selfLogger, a13);
      v30 = (id *)&OBJC_CLASS___AFAssistantSamplingUtilities_ptr;
      if (v23->_isSamplingForDictation) {
        v30 = (id *)&OBJC_CLASS___AFDictationSamplingUtilities_ptr;
      }
      uint64_t v31 = objc_claimAutoreleasedReturnValue([*v30 component]);
      logPrefix = v23->_logPrefix;
      v23->_logPrefix = (NSString *)v31;
    }

    self = v23;
    v33 = self;
  }

  else
  {
    v34 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[ESStoreAudioData initWithUUIDString:language:task:codec:samplingRate:inferenceSpeakerCode:numTrainedFrames"
            ":trainingNnetVersion:isSpeakerCodeUsed:isSamplingForDictation:selfLogger:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s Sampling: Error while initializing ESStoreAudioData because uuid is invalid.",  buf,  0xCu);
    }

    v33 = 0LL;
  }

  return v33;
}

- (BOOL)hasData
{
  return -[NSMutableData length](self->_audioPackets, "length") != 0;
}

- (void)addAudioPacket:(id)a3
{
  if (self->_collectedAudioDurationMS <= 60000.0)
  {
    audioPackets = self->_audioPackets;
    id v5 = a3;
    -[NSMutableData appendData:](audioPackets, "appendData:", v5);
    unint64_t v6 = (unint64_t)[v5 length];

    self->_collectedAudioDurationMS = self->_collectedAudioDurationMS
                                    + (double)(v6 >> 1) / (double)self->_samplingRate * 1000.0;
  }

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (void)saveAudioToDisk
{
  if (!self->_hasRecognizedAnything || !-[ESStoreAudioData hasData](self, "hasData"))
  {
    id v5 = (os_log_s *)AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    logPrefix = self->_logPrefix;
    int v9 = 136315394;
    v10 = "-[ESStoreAudioData saveAudioToDisk]";
    __int16 v11 = 2112;
    v12 = logPrefix;
    v7 = "%s %@ Sampling: Won't save audio because - has not recognized anything or has no data.";
    goto LABEL_12;
  }

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[ESStoreAudioData _createAudioFilePath](self, "_createAudioFilePath"));
  currentAudioFilePath = self->_currentAudioFilePath;
  self->_currentAudioFilePath = v3;

  if (!self->_currentAudioFilePath)
  {
    id v5 = (os_log_s *)AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    unint64_t v6 = self->_logPrefix;
    int v9 = 136315394;
    v10 = "-[ESStoreAudioData saveAudioToDisk]";
    __int16 v11 = 2112;
    v12 = v6;
    v7 = "%s %@ Sampling: Won't save audio because - _currentAudioFilePath is null";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0x16u);
    return;
  }

  if (-[ESStoreAudioData _saveAudioToCache:](self, "_saveAudioToCache:"))
  {
    if (-[ESStoreAudioData _moveAudioToVarMobile:](self, "_moveAudioToVarMobile:", self->_currentAudioFilePath)) {
      -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( self,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  1LL,  0LL,  0LL);
    }
  }

- (void)cleanupCacheAndReset
{
}

- (void)_deleteItemAtPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_isSamplingForDictation) {
      id v5 = &OBJC_CLASS___AFDictationSamplingUtilities;
    }
    else {
      id v5 = &OBJC_CLASS___AFAssistantSamplingUtilities;
    }
    id v8 = [v5 deleteItemAtFilePath:v4];
  }

  else
  {
    unint64_t v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      int v9 = 136315394;
      v10 = "-[ESStoreAudioData _deleteItemAtPath:]";
      __int16 v11 = 2112;
      v12 = logPrefix;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: invalid filePath or it is null.",  (uint8_t *)&v9,  0x16u);
    }
  }
}

- (void)_cleanupCacheAndReset:(id)a3
{
  id v4 = a3;
  -[ESStoreAudioData _deleteItemAtPath:](self, "_deleteItemAtPath:", v4);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  audioPackets = self->_audioPackets;
  self->_audioPackets = v5;

  self->_collectedAudioDurationMS = 0.0;
  v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    logPrefix = self->_logPrefix;
    int v9 = 136315650;
    v10 = "-[ESStoreAudioData _cleanupCacheAndReset:]";
    __int16 v11 = 2112;
    v12 = logPrefix;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s %@ Sampling: Done with cleanup of audioFile=%@ and reset of variables.",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ESStoreAudioData;
  -[ESStoreAudioData dealloc](&v3, "dealloc");
}

- (BOOL)_saveAudioToCache:(id)a3
{
  id v4 = a3;
  audioPackets = self->_audioPackets;
  id v12 = 0LL;
  unsigned __int8 v6 = -[NSMutableData writeToFile:options:error:]( audioPackets,  "writeToFile:options:error:",  v4,  0x40000000LL,  &v12);
  id v7 = v12;
  id v8 = (os_log_s *)AFSiriLogContextSpeech;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 136315650;
      id v14 = "-[ESStoreAudioData _saveAudioToCache:]";
      __int16 v15 = 2112;
      v16 = logPrefix;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s %@ Sampling: Successfully saved audio file to cache dir, path=%@",  buf,  0x20u);
    }
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = self->_logPrefix;
      *(_DWORD *)buf = 136315650;
      id v14 = "-[ESStoreAudioData _saveAudioToCache:]";
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: Failed to save audio to cache dir. Error: %@",  buf,  0x20u);
    }

    -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( self,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  0LL,  v7,  0LL);
  }

  return v6;
}

- (BOOL)_moveAudioToVarMobile:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathComponents]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);

  if (v6)
  {
    if (self->_isSamplingForDictation) {
      id v7 = (id *)&OBJC_CLASS___AFDictationSamplingUtilities_ptr;
    }
    else {
      id v7 = (id *)&OBJC_CLASS___AFAssistantSamplingUtilities_ptr;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*v7 samplingDateAsString]);
    if (v8)
    {
      if (self->_isSamplingForDictation) {
        int v9 = (id *)&OBJC_CLASS___AFDictationSamplingUtilities_ptr;
      }
      else {
        int v9 = (id *)&OBJC_CLASS___AFAssistantSamplingUtilities_ptr;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue([*v9 createSamplingDirectory]);
      if (v10)
      {
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v8]);
        id v14 = (void *)v12;
        if (self->_isSamplingForDictation && (AFIsInternalInstall(v12, v13) & 1) == 0)
        {
          buf[0] = 0;
        }

        uint64_t v16 = AFCreateDirectoryWithPath(v14);
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (v17)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v6]);
          id v39 = 0LL;
          unsigned __int8 v19 = [v11 moveItemAtPath:v4 toPath:v18 error:&v39];
          id v38 = v39;
          id v20 = (os_log_s *)AFSiriLogContextSpeech;
          if ((v19 & 1) != 0)
          {
            id v37 = v11;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
            {
              logPrefix = self->_logPrefix;
              *(_DWORD *)buf = 136315650;
              objc_super v41 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
              __int16 v42 = 2112;
              v43 = logPrefix;
              __int16 v44 = 2112;
              id v45 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s %@ Sampling: Successfully moved audio file to var/mobile/Library dir, path=%@",  buf,  0x20u);
            }

            v22 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingPathExtension]);
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  v22));

            v24 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v23]);
            -[ESStoreAudioData _saveAudioMetadataToFilePath:](self, "_saveAudioMetadataToFilePath:", v24);

            __int16 v11 = v37;
            v25 = v38;
          }

          else
          {
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
            {
              v36 = self->_logPrefix;
              *(_DWORD *)buf = 136315650;
              objc_super v41 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
              __int16 v42 = 2112;
              v43 = v36;
              __int16 v44 = 2112;
              id v45 = v38;
              _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: Error while moving file from cache directory to var/mobile/Library - %@",  buf,  0x20u);
            }

            v30 = self;
            v25 = v38;
            -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( v30,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  0LL,  v38,  0LL);
          }
        }

        else
        {
          v29 = (os_log_s *)AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            v35 = self->_logPrefix;
            *(_DWORD *)buf = 136315906;
            objc_super v41 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
            __int16 v42 = 2112;
            v43 = v35;
            __int16 v44 = 2112;
            id v45 = v10;
            __int16 v46 = 2112;
            v47 = v8;
            _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: Error while creating dated Sampled directory in %@ with date - %@",  buf,  0x2Au);
          }

          -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( self,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  0LL,  0LL,  4LL);
          unsigned __int8 v19 = 0;
        }
      }

      else
      {
        v28 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          v34 = self->_logPrefix;
          *(_DWORD *)buf = 136315394;
          objc_super v41 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
          __int16 v42 = 2112;
          v43 = v34;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: Error while creating Sampled directory in /var/mobile",  buf,  0x16u);
        }

        -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( self,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  0LL,  0LL,  3LL);
        unsigned __int8 v19 = 0;
      }
    }

    else
    {
      v27 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        v33 = self->_logPrefix;
        *(_DWORD *)buf = 136315394;
        objc_super v41 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
        __int16 v42 = 2112;
        v43 = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: currentSamplingDate is nil",  buf,  0x16u);
      }

      -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( self,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  0LL,  0LL,  2LL);
      unsigned __int8 v19 = 0;
    }
  }

  else
  {
    v26 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v32 = self->_logPrefix;
      *(_DWORD *)buf = 136315394;
      objc_super v41 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
      __int16 v42 = 2112;
      v43 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: audioFileToBeMoved is nil",  buf,  0x16u);
    }

    -[ESStoreAudioData _logAudioSampledEventsWithStatus:error:customReasonForFailure:]( self,  "_logAudioSampledEventsWithStatus:error:customReasonForFailure:",  0LL,  0LL,  1LL);
    unsigned __int8 v19 = 0;
  }

  return v19;
}

- (void)_saveAudioMetadataToFilePath:(id)a3
{
  id v4 = a3;
  if (self->_isSamplingForDictation) {
    id v5 = @"dictationUIInteractionIdentifier";
  }
  else {
    id v5 = @"interactionIdentifier";
  }
  -[NSMutableDictionary setObject:forKey:](self->_audioMetadata, "setObject:forKey:", self->_UUIDString, v5);
  -[NSMutableDictionary setObject:forKey:]( self->_audioMetadata,  "setObject:forKey:",  self->_language,  @"language");
  -[NSMutableDictionary setObject:forKey:](self->_audioMetadata, "setObject:forKey:", self->_task, @"task");
  audioMetadata = self->_audioMetadata;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_samplingRate));
  -[NSMutableDictionary setObject:forKey:](audioMetadata, "setObject:forKey:", v7, @"samplingRate");

  -[NSMutableDictionary setObject:forKey:](self->_audioMetadata, "setObject:forKey:", self->_codec, @"codec");
  if (-[NSString length](self->_inferenceSpeakerCode, "length")) {
    -[NSMutableDictionary setObject:forKey:]( self->_audioMetadata,  "setObject:forKey:",  self->_inferenceSpeakerCode,  @"inferenceSpeakerCode");
  }
  numTrainedFrames = self->_numTrainedFrames;
  if (numTrainedFrames) {
    -[NSMutableDictionary setObject:forKey:]( self->_audioMetadata,  "setObject:forKey:",  numTrainedFrames,  @"numTrainedFrames");
  }
  trainingNnetVersion = self->_trainingNnetVersion;
  if (trainingNnetVersion) {
    -[NSMutableDictionary setObject:forKey:]( self->_audioMetadata,  "setObject:forKey:",  trainingNnetVersion,  @"trainingNnetVersion");
  }
  v10 = self->_audioMetadata;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isSpeakerCodeUsed));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, @"isSpeakerCodeUsed");

  selfLogger = self->_selfLogger;
  if (selfLogger)
  {
    uint64_t v13 = self->_audioMetadata;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ESSelfHelper asrId](selfLogger, "asrId"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v15, @"asrSelfComponentIdentifier");
  }

  if ((-[NSMutableDictionary writeToFile:atomically:]( self->_audioMetadata,  "writeToFile:atomically:",  v4,  1LL) & 1) == 0)
  {
    uint64_t v16 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      int v18 = 136315650;
      unsigned __int8 v19 = "-[ESStoreAudioData _saveAudioMetadataToFilePath:]";
      __int16 v20 = 2112;
      id v21 = logPrefix;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: Error while writing audio metadata dict to plist - %@",  (uint8_t *)&v18,  0x20u);
    }
  }
}

- (id)_createAudioFilePath
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[ESStoreAudioData _createCachesDirectoryIfItDoesNotExist]( self,  "_createCachesDirectoryIfItDoesNotExist"));
  if (v3)
  {
    id v4 = (id *)&OBJC_CLASS___AFAssistantSamplingUtilities_ptr;
    if (self->_isSamplingForDictation) {
      id v4 = (id *)&OBJC_CLASS___AFDictationSamplingUtilities_ptr;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*v4 samplingDateAsString]);
    if (v5)
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v6 timeIntervalSince1970];
      double v8 = v7;

      int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.0f",  *(void *)&v8));
      audioMetadata = self->_audioMetadata;
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
      -[NSMutableDictionary setObject:forKey:](audioMetadata, "setObject:forKey:", v11, @"samplingTimestamp");

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@_%@.pcm",  self->_UUIDString,  v5,  v9));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v12]);
    }

    else
    {
      id v14 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 136315394;
        int v18 = "-[ESStoreAudioData _createAudioFilePath]";
        __int16 v19 = 2112;
        __int16 v20 = logPrefix;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: currentSamplingDateString is null",  buf,  0x16u);
      }

      uint64_t v13 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)_createCachesDirectoryIfItDoesNotExist
{
  objc_super v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  unsigned __int8 v6 = (id *)&OBJC_CLASS___AFAssistantSamplingUtilities_ptr;
  if (self->_isSamplingForDictation) {
    unsigned __int8 v6 = (id *)&OBJC_CLASS___AFDictationSamplingUtilities_ptr;
  }
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*v6 sampledCachesSubDirectoryPath]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v7]);

  uint64_t v9 = AFCreateDirectoryWithPath(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (void)_logAudioSampledEventsWithStatus:(int64_t)a3 error:(id)a4 customReasonForFailure:(int64_t)a5
{
  id v8 = a4;
  if (self->_isSamplingForDictation)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    v34[0] = self->_UUIDString;
    v33[0] = @"dictationUIInteractionIdentifier";
    v33[1] = @"unixTime";
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSince1970];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v34[1] = v11;
    v33[2] = @"samplingDate";
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities samplingDateAsString]( &OBJC_CLASS___AFDictationSamplingUtilities,  "samplingDateAsString"));
    uint64_t v13 = (void *)v12;
    if (v12) {
      id v14 = (const __CFString *)v12;
    }
    else {
      id v14 = &stru_1000415D8;
    }
    v34[2] = v14;
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
    uint64_t v16 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v15);

    if (a3)
    {
      if (a3 == 1) {
        __int16 v17 = @"success";
      }
      else {
        __int16 v17 = &stru_1000415D8;
      }
    }

    else
    {
      if (v8)
      {
        int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 code]));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v18,  @"errorCode");

        uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 domain]);
        __int16 v20 = (void *)v19;
        if (v19) {
          id v21 = (const __CFString *)v19;
        }
        else {
          id v21 = &stru_1000415D8;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v21,  @"errorDomain");

        uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
        id v23 = (void *)v22;
        if (v22) {
          v24 = (const __CFString *)v22;
        }
        else {
          v24 = @"UNDEFINED";
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v24,  @"description");

        v25 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:NSUnderlyingErrorKey]);

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v26 code]));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v27,  @"underlyingErrorCode");

          uint64_t v28 = objc_claimAutoreleasedReturnValue([v26 domain]);
          v29 = (void *)v28;
          if (v28) {
            v30 = (const __CFString *)v28;
          }
          else {
            v30 = &stru_1000415D8;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v30,  @"underlyingErrorDomain");
        }
      }

      else
      {
        switch(a5)
        {
          case 1LL:
            uint64_t v31 = @"Audio file to be moved nil";
            goto LABEL_31;
          case 2LL:
            uint64_t v31 = @"Sampling Date is nil";
            goto LABEL_31;
          case 3LL:
            uint64_t v31 = @"Unable to create sampling directory";
            goto LABEL_31;
          case 4LL:
            uint64_t v31 = @"Unable to create dated directory";
LABEL_31:
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v31,  @"description");
            break;
          default:
            break;
        }
      }

      __int16 v17 = @"failed";
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, @"status");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v32 logEventWithType:2224 context:v16];
  }

  else if (a3)
  {
    if (a3 == 1) {
      -[ESSelfHelper logSampledAudioFileStoredSuccessfully](self->_selfLogger, "logSampledAudioFileStoredSuccessfully");
    }
  }

  else
  {
    -[ESSelfHelper logSampledAudioFileStoredWithError:customFailureReason:]( self->_selfLogger,  "logSampledAudioFileStoredWithError:customFailureReason:",  v8,  a5);
  }
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (NSString)codec
{
  return self->_codec;
}

- (void)setCodec:(id)a3
{
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(unint64_t)a3
{
  self->_samplingRate = a3;
}

- (NSMutableData)audioPackets
{
  return self->_audioPackets;
}

- (void)setAudioPackets:(id)a3
{
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (void)setHasRecognizedAnything:(BOOL)a3
{
  self->_hasRecognizedAnything = a3;
}

- (NSString)inferenceSpeakerCode
{
  return self->_inferenceSpeakerCode;
}

- (NSNumber)numTrainedFrames
{
  return self->_numTrainedFrames;
}

- (NSNumber)trainingNnetVersion
{
  return self->_trainingNnetVersion;
}

- (BOOL)isSpeakerCodeUsed
{
  return self->_isSpeakerCodeUsed;
}

- (BOOL)isSamplingForDictation
{
  return self->_isSamplingForDictation;
}

- (ESSelfHelper)selfLogger
{
  return self->_selfLogger;
}

- (void)setSelfLogger:(id)a3
{
}

- (NSMutableDictionary)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
}

- (double)collectedAudioDurationMS
{
  return self->_collectedAudioDurationMS;
}

- (void)setCollectedAudioDurationMS:(double)a3
{
  self->_collectedAudioDurationMS = a3;
}

- (NSString)currentAudioFilePath
{
  return self->_currentAudioFilePath;
}

- (void)setCurrentAudioFilePath:(id)a3
{
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void)setLogPrefix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end