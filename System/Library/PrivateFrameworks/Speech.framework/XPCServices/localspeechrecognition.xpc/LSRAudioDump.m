@interface LSRAudioDump
+ (id)dumpDirectory;
+ (id)filenameForTaskIdentifier:(id)a3;
+ (id)urlForTaskIdentifier:(id)a3;
+ (void)initialize;
- (LSRAudioDump)initWithTaskIdentifier:(id)a3;
- (void)appendBytes:(id)a3;
- (void)close;
- (void)dealloc;
- (void)discard;
@end

@implementation LSRAudioDump

- (LSRAudioDump)initWithTaskIdentifier:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___LSRAudioDump;
  id v5 = -[LSRAudioDump init](&v30, "init");
  if (!v5)
  {
LABEL_14:
    v19 = (LSRAudioDump *)v5;
    goto LABEL_15;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[LSRAudioDump urlForTaskIdentifier:](&OBJC_CLASS___LSRAudioDump, "urlForTaskIdentifier:", v4));
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSRAudioDump dumpDirectory](&OBJC_CLASS___LSRAudioDump, "dumpDirectory"));
  [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];

  OSStatus v10 = AudioFileCreateWithURL(*((CFURLRef *)v5 + 1), 0x57415645u, &SupportedASBD, 1u, (AudioFileID *)v5 + 2);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v10,  0LL));
    v12 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      uint64_t v15 = *((void *)v5 + 1);
      *(_DWORD *)buf = 136315650;
      v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
      __int16 v33 = 2112;
      v34 = v14;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      v16 = "%s Failed to create audio dump file. Error: %@, URL: %@";
LABEL_17:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);

      goto LABEL_7;
    }

    goto LABEL_7;
  }

  OSStatus v17 = ExtAudioFileWrapAudioFileID(*((AudioFileID *)v5 + 2), 1u, (ExtAudioFileRef *)v5 + 3);
  if (!v17)
  {
    OSStatus v20 = ExtAudioFileWriteAsync(*((ExtAudioFileRef *)v5 + 3), 0, 0LL);
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v20,  0LL));
      v22 = (void *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        v27 = v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
        uint64_t v29 = *((void *)v5 + 1);
        *(_DWORD *)buf = 136315650;
        v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
        __int16 v33 = 2112;
        v34 = v28;
        __int16 v35 = 2112;
        uint64_t v36 = v29;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to prewarm dump file. Error: %@, URL: %@",  buf,  0x20u);
      }
    }

    v23 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)*((void *)v5 + 1);
      *(_DWORD *)buf = 136315394;
      v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
      __int16 v33 = 2112;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Created audio file at: %@", buf, 0x16u);
    }

    goto LABEL_14;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v17,  0LL));
  v18 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    v13 = v18;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    uint64_t v26 = *((void *)v5 + 1);
    *(_DWORD *)buf = 136315650;
    v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2112;
    uint64_t v36 = v26;
    v16 = "%s Failed to extend audio dump file. Error: %@, URL: %@";
    goto LABEL_17;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSRAudioDump;
  -[LSRAudioDump dealloc](&v3, "dealloc");
}

- (void)appendBytes:(id)a3
{
  if (self->_extendedFile)
  {
    id v4 = a3;
    UInt32 v5 = [v4 length];
    id v6 = v4;
    id v7 = [v6 bytes];

    ioData.mNumberBuffers = 1;
    ioData.mBuffers[0].mNumberChannels = 1;
    ioData.mBuffers[0].mDataByteSize = v5;
    ioData.mBuffers[0].mData = v7;
    OSStatus v8 = ExtAudioFileWriteAsync(self->_extendedFile, v5 / SupportedASBD.mBytesPerFrame, &ioData);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v8,  0LL));
      OSStatus v10 = (void *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
        url = self->_url;
        *(_DWORD *)buf = 136315650;
        v16 = "-[LSRAudioDump appendBytes:]";
        __int16 v17 = 2112;
        v18 = v12;
        __int16 v19 = 2112;
        OSStatus v20 = url;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to write to dump file. Error: %@, URL: %@",  buf,  0x20u);
      }
    }
  }

- (void)close
{
  extendedFile = self->_extendedFile;
  if (extendedFile) {
    ExtAudioFileDispose(extendedFile);
  }
  fileID = self->_fileID;
  if (fileID) {
    AudioFileClose(fileID);
  }
  UInt32 v5 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    url = self->_url;
    int v7 = 136315394;
    OSStatus v8 = "-[LSRAudioDump close]";
    __int16 v9 = 2112;
    OSStatus v10 = url;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Closed audio dump file at: %@",  (uint8_t *)&v7,  0x16u);
  }

- (void)discard
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v3 removeItemAtURL:self->_url error:0];
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___LSRAudioDump, a2) == a1) {
    SFLogInitIfNeeded();
  }
}

+ (id)urlForTaskIdentifier:(id)a3
{
  id v4 = a3;
  UInt32 v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSRAudioDump dumpDirectory](&OBJC_CLASS___LSRAudioDump, "dumpDirectory"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 filenameForTaskIdentifier:v4]);

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v6]);
  return v7;
}

+ (id)dumpDirectory
{
  v2 = NSHomeDirectory();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByAppendingPathComponent:@"Library/Caches/com.apple.speech.localspeechrecognition/lsr_audio_dumps"]);

  UInt32 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  return v5;
}

+ (id)filenameForTaskIdentifier:(id)a3
{
  id v3 = a3;
  gettimeofday(&v7, 0LL);
  localtime_r(&v7.tv_sec, &v8);
  id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%04d%02d%02d-%02d%02d%02d.%d.wav",  v3,  (v8.tm_year + 1900),  (v8.tm_mon + 1),  v8.tm_mday,  v8.tm_hour,  v8.tm_min,  v8.tm_sec,  getpid());
  UInt32 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end