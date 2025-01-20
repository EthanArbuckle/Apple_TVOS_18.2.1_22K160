@interface CSAudioFileLog
+ (id)sharedInstance;
- (CSAudioFileLog)init;
- (id)_audioLogDirectory;
- (id)_getOrCreateAudioLogDirectory;
- (id)_makeTimestampedAudioLogFilenameWithPrefix:(id)a3 suffix:(id)a4;
- (id)_nowString;
- (void)_closeAudioFile;
- (void)appendAudioData:(id)a3;
- (void)dealloc;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation CSAudioFileLog

- (CSAudioFileLog)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CSAudioFileLog;
  v2 = -[CSAudioFileLog init](&v16, "init");
  v4 = v2;
  if (v2)
  {
    id v5 = objc_msgSend((id)objc_opt_class(v2, v3), "description");
    id v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_object_s *)v4->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v9, v11);

    +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "utteranceFileASBD");
    *(_OWORD *)&v4->_asbd.mSampleRate = v13;
    *(_OWORD *)&v4->_asbd.mBytesPerPacket = v14;
    *(void *)&v4->_asbd.mBitsPerChannel = v15;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAudioFileLog;
  -[CSAudioFileLog dealloc](&v3, "dealloc");
}

- (void)_closeAudioFile
{
  audioFile = self->_audioFile;
  if (audioFile)
  {
    OSStatus v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      OSStatus v5 = v4;
      id v6 = (os_log_s *)CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        v8 = "-[CSAudioFileLog _closeAudioFile]";
        __int16 v9 = 1026;
        OSStatus v10 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Failure disposing audio file %{public}d",  (uint8_t *)&v7,  0x12u);
      }
    }

    self->_audioFile = 0LL;
  }

- (void)startRecording
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017760;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)appendAudioData:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000175C0;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopRecording
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000174EC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_audioLogDirectory
{
  if (qword_10027FC60 != -1) {
    dispatch_once(&qword_10027FC60, &stru_10022A2E8);
  }
  return (id)qword_10027FC58;
}

- (id)_getOrCreateAudioLogDirectory
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSAudioFileLog _audioLogDirectory](self, "_audioLogDirectory"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  if ((v4 & 1) != 0)
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v12 = 0LL;
    unsigned __int8 v7 = [v6 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v5 = v12;

    if ((v7 & 1) == 0)
    {
      id v8 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        OSStatus v10 = v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        __int128 v14 = "-[CSAudioFileLog _getOrCreateAudioLogDirectory]";
        __int16 v15 = 2114;
        objc_super v16 = v2;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Couldn't create CoreSpeech log directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      v2 = @"/tmp";
    }
  }

  return v2;
}

- (id)_nowString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

- (id)_makeTimestampedAudioLogFilenameWithPrefix:(id)a3 suffix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioFileLog _getOrCreateAudioLogDirectory](self, "_getOrCreateAudioLogDirectory"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CSAudioFileLog _nowString](self, "_nowString"));
  OSStatus v10 = (void *)v9;
  v11 = &stru_10022F858;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@%@%@",  v8,  v7,  v11,  v6));

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:@" " withString:@"_"]);
  return v13;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FC50 != -1) {
    dispatch_once(&qword_10027FC50, &stru_10022A2C8);
  }
  return (id)qword_10027FC48;
}

@end