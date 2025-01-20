@interface ADAudioFileWriter
+ (id)_generateTemporaryFileURL;
+ (id)_savedAudioFilesDirectory;
- (ADAudioFileWriter)init;
- (ADAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5;
- (ADAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5;
- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6;
- (void)_close;
- (void)_delete;
- (void)appendAudioData:(id)a3;
- (void)cancel;
- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
@end

@implementation ADAudioFileWriter

- (ADAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5
{
  return (ADAudioFileWriter *)-[ADAudioFileWriter _initWithType:pathGenerator:xorFileHandle:priority:]( self,  "_initWithType:pathGenerator:xorFileHandle:priority:",  a3,  a4,  0LL,  *(void *)&a5);
}

- (ADAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5
{
  return (ADAudioFileWriter *)-[ADAudioFileWriter _initWithType:pathGenerator:xorFileHandle:priority:]( self,  "_initWithType:pathGenerator:xorFileHandle:priority:",  a3,  0LL,  a4,  *(void *)&a5);
}

- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6
{
  id v11 = a4;
  id v12 = a5;
  if (!a3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, self, @"ADAudioFileWriter.m", 59, @"Invalid parameter not satisfying: %@", @"type != AFAudioFileTypeNone" object file lineNumber description];
  }

  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ADAudioFileWriter;
  v13 = -[ADAudioFileWriter init](&v28, "init");
  if (v13)
  {
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(v15, (dispatch_qos_class_t)a6, 0);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);

    dispatch_queue_t v18 = dispatch_queue_create("AudioFileWriterQueue", v17);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    v20 = (dispatch_queue_s *)v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006A4CC;
    block[3] = &unk_1004FBA38;
    v24 = v13;
    int64_t v27 = a3;
    id v25 = v12;
    id v26 = v11;
    dispatch_async(v20, block);
  }

  return v13;
}

- (ADAudioFileWriter)init
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADAudioFileWriter;
  -[ADAudioFileWriter dealloc](&v3, "dealloc");
}

- (void)_close
{
  audioFile = self->_audioFile;
  if (audioFile)
  {
    OSStatus v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      OSStatus v5 = v4;
      v6 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        v8 = "-[ADAudioFileWriter _close]";
        __int16 v9 = 1026;
        OSStatus v10 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Failure disposing audio file %{public}d",  (uint8_t *)&v7,  0x12u);
      }
    }

    self->_audioFile = 0LL;
  }

- (void)_delete
{
  if (self->_url)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    url = self->_url;
    id v9 = 0LL;
    unsigned __int8 v5 = [v3 removeItemAtURL:url error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      int v7 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[ADAudioFileWriter _delete]";
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Error removing item at URL %{public}@",  buf,  0x16u);
      }
    }

    v8 = self->_url;
    self->_url = 0LL;
  }

- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  __int128 v5 = *(_OWORD *)&a3->mBytesPerPacket;
  __int128 v12 = *(_OWORD *)&a3->mSampleRate;
  __int128 v13 = v5;
  uint64_t v14 = *(void *)&a3->mBitsPerChannel;
  id v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    dispatch_queue_attr_t v16 = "-[ADAudioFileWriter configureWithAudioStreamBasicDescription:]";
    __int16 v17 = 1040;
    int v18 = 4;
    __int16 v19 = 2080;
    v20 = (char *)&v12 + 8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Configuring with asbd %.4s", buf, 0x1Cu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069FF8;
  block[3] = &unk_1004EEEA0;
  void block[4] = self;
  block[5] = a2;
  __int128 v9 = v12;
  __int128 v10 = v13;
  uint64_t v11 = v14;
  dispatch_async(queue, block);
}

- (void)appendAudioData:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100069E84;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100069C10;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)cancel
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069BE8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)_generateTemporaryFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _savedAudioFilesDirectory]);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"SavedAudioFile"]);

  return v3;
}

+ (id)_savedAudioFilesDirectory
{
  if (qword_100578088 != -1) {
    dispatch_once(&qword_100578088, &stru_1004F5FA0);
  }
  return (id)qword_100578080;
}

@end