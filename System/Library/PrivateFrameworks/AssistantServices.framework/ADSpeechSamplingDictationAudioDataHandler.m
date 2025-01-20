@interface ADSpeechSamplingDictationAudioDataHandler
- (ADDictationSessionTracker)sessionTracker;
- (ADSpeechSamplingDictationAudioDataHandler)initWithAudioDataFolders:(id)a3;
- (AFDictationOptions)dictationOptions;
- (BOOL)adSpeechSessionEnded;
- (BOOL)adWaitingForAudioFile;
- (BOOL)shouldStopAddingSamples;
- (NSDictionary)audioMetadataDict;
- (NSMutableArray)audioDataFolders;
- (NSString)audioFilePath;
- (NSString)folderPath;
- (OS_dispatch_queue)queue;
- (int64_t)maxChunkSize;
- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4;
- (void)addAudioSamplesOnQueue:(id)a3;
- (void)dealloc;
- (void)sendAudioDataToServer;
- (void)setAdSpeechSessionEnded:(BOOL)a3;
- (void)setAudioDataFolders:(id)a3;
- (void)setAudioFilePath:(id)a3;
- (void)setAudioMetadataDict:(id)a3;
- (void)setDictationOptions:(id)a3;
- (void)setFolderPath:(id)a3;
- (void)setMaxChunkSize:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSessionTracker:(id)a3;
- (void)setShouldStopAddingSamples:(BOOL)a3;
@end

@implementation ADSpeechSamplingDictationAudioDataHandler

- (ADSpeechSamplingDictationAudioDataHandler)initWithAudioDataFolders:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_22;
  }
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___ADSpeechSamplingDictationAudioDataHandler;
  self = -[ADSpeechSamplingDictationAudioDataHandler init](&v48, "init");
  if (self)
  {
    id v43 = v4;
    v5 = (NSMutableArray *)[v4 mutableCopy];
    audioDataFolders = self->_audioDataFolders;
    self->_audioDataFolders = v5;

    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_audioDataFolders, "objectAtIndex:", 0LL));
    folderPath = self->_folderPath;
    self->_folderPath = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v10 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:self->_folderPath error:0]);

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v13)
    {
      id v14 = v13;
      v15 = 0LL;
      uint64_t v16 = *(void *)v45;
      do
      {
        v17 = v12;
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(v17);
          }
          v19 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pathExtension]);
          unsigned int v21 = [v20 isEqual:@"pcm"];

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v10->_folderPath,  "stringByAppendingPathComponent:",  v19));
            if (+[AFSamplingUtilities isFileOlderThanAgeInSeconds:filePath:samplingComponent:]( &OBJC_CLASS___AFSamplingUtilities,  "isFileOlderThanAgeInSeconds:filePath:samplingComponent:",  v22,  @"Dictation",  900.0))
            {
              id v23 = v19;

              v15 = v23;
            }
          }
        }

        id v12 = v17;
        id v14 = [v17 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }

      while (v14);
    }

    else
    {
      v15 = 0LL;
    }

    self = v10;
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v10->_folderPath, "stringByAppendingPathComponent:", v15));
    audioFilePath = v10->_audioFilePath;
    v10->_audioFilePath = (NSString *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByDeletingPathExtension]);

    id v28 = sub_10024D7B0(v10->_folderPath, (uint64_t)v27, 0LL);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    audioMetadataDict = v10->_audioMetadataDict;
    v10->_audioMetadataDict = (NSDictionary *)v29;

    if (v10->_audioMetadataDict)
    {
      v31 = objc_alloc_init(&OBJC_CLASS___ADDictationSessionTracker);
      sessionTracker = v10->_sessionTracker;
      v10->_sessionTracker = v31;

      v33 = objc_alloc_init(&OBJC_CLASS___AFDictationOptions);
      dictationOptions = v10->_dictationOptions;
      v10->_dictationOptions = v33;

      dispatch_queue_attr_t v35 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v36 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v35);
      dispatch_queue_t v37 = dispatch_queue_create("com.apple.siri.speech.sampling.upload", v36);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v37;

      id v4 = v43;
      goto LABEL_18;
    }

    v40 = (os_log_s *)AFSiriLogContextSpeech;
    id v4 = v43;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v42 = v10->_folderPath;
      *(_DWORD *)buf = 136315650;
      v50 = "-[ADSpeechSamplingDictationAudioDataHandler initWithAudioDataFolders:]";
      __int16 v51 = 2112;
      v52 = v42;
      __int16 v53 = 2112;
      v54 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Audio metadata dict is nil for %@ - %@",  buf,  0x20u);
    }

LABEL_22:
    v39 = 0LL;
    goto LABEL_23;
  }

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[ADSpeechSamplingDictationAudioDataHandler dealloc]";
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Dictation Sampling: dealloc - done with %p",  buf,  0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADSpeechSamplingDictationAudioDataHandler;
  -[ADSpeechSamplingDictationAudioDataHandler dealloc](&v4, "dealloc");
}

- (void)sendAudioDataToServer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024F244;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addAudioSamplesOnQueue:(id)a3
{
  id v4 = a3;
  v5 = 0LL;
  int64_t v6 = 0LL;
  *(void *)&__int128 v7 = 136315906LL;
  __int128 v23 = v7;
  while (1)
  {
    v8 = v5;
    id v26 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDataUpToLength:error:", 0x8000, &v26, v23));
    id v9 = v26;

    if (!v5 || v9) {
      break;
    }
    if (![v5 length]) {
      goto LABEL_13;
    }
    v10 = (os_log_s *)AFSiriLogContextSpeech;
    if (self->_shouldStopAddingSamples)
    {
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v28 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
        __int16 v29 = 2048;
        int64_t v30 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Stopping adding audio samples after adding %ld bytes since _shouldStopAddingSamples was set",  buf,  0x16u);
      }

      id v9 = 0LL;
LABEL_19:
      [v4 closeFile];
      v18 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v28 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Failed reading audio file and adding audio samples.",  buf,  0xCu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      [v19 cancelSpeechForDelegate:self];

      goto LABEL_22;
    }

    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v10;
      id v13 = [v5 length];
      int64_t maxChunkSize = self->_maxChunkSize;
      *(_DWORD *)buf = v23;
      id v28 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
      __int16 v29 = 2048;
      int64_t v30 = (int64_t)v13;
      __int16 v31 = 2048;
      uint64_t v32 = 0x8000LL;
      __int16 v33 = 2048;
      int64_t v34 = maxChunkSize;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Dictation Sampling: Sending audio data of size: %ld, chunkSize: %ld, maxChunkSize: %ld",  buf,  0x2Au);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v11 addRecordedSpeechSampleData:v5 delegate:self];

    v6 += (int64_t)[v5 length];
    if (v6 >= self->_maxChunkSize)
    {
      dispatch_time_t v20 = dispatch_time(0LL, 5000000000LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10024F238;
      block[3] = &unk_1004FD968;
      block[4] = self;
      id v25 = v4;
      dispatch_after(v20, v22, block);

      goto LABEL_22;
    }
  }

  if (v9)
  {
    v15 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
      __int16 v29 = 2112;
      int64_t v30 = (int64_t)v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Error while reading file - %@",  buf,  0x16u);
    }

    goto LABEL_19;
  }

- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024F108;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024EFE0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4
{
  id v5 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10024E5FC;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (BOOL)adWaitingForAudioFile
{
  return 0;
}

- (BOOL)adSpeechSessionEnded
{
  return self->adSpeechSessionEnded;
}

- (void)setAdSpeechSessionEnded:(BOOL)a3
{
  self->adSpeechSessionEnded = a3;
}

- (NSMutableArray)audioDataFolders
{
  return self->_audioDataFolders;
}

- (void)setAudioDataFolders:(id)a3
{
}

- (NSString)folderPath
{
  return self->_folderPath;
}

- (void)setFolderPath:(id)a3
{
}

- (NSString)audioFilePath
{
  return self->_audioFilePath;
}

- (void)setAudioFilePath:(id)a3
{
}

- (NSDictionary)audioMetadataDict
{
  return self->_audioMetadataDict;
}

- (void)setAudioMetadataDict:(id)a3
{
}

- (ADDictationSessionTracker)sessionTracker
{
  return self->_sessionTracker;
}

- (void)setSessionTracker:(id)a3
{
}

- (AFDictationOptions)dictationOptions
{
  return self->_dictationOptions;
}

- (void)setDictationOptions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)shouldStopAddingSamples
{
  return self->_shouldStopAddingSamples;
}

- (void)setShouldStopAddingSamples:(BOOL)a3
{
  self->_shouldStopAddingSamples = a3;
}

- (int64_t)maxChunkSize
{
  return self->_maxChunkSize;
}

- (void)setMaxChunkSize:(int64_t)a3
{
  self->_int64_t maxChunkSize = a3;
}

- (void).cxx_destruct
{
}

@end