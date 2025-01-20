@interface ADSpeechLog
+ (id)buffersFromSpeechLogAtURL:(id)a3 isNarrowBand:(BOOL *)a4;
- (ADSpeechLog)init;
- (id)_dateFormatter;
- (id)_nowString;
- (void)appendSpeechPacket:(id)a3;
- (void)appendSpeechPackets:(id)a3;
- (void)beginNewSpeechLogWithFormat:(id)a3;
- (void)cancelCurrentSpeechLog;
- (void)endSpeechLog;
@end

@implementation ADSpeechLog

- (ADSpeechLog)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADSpeechLog;
  v2 = -[ADSpeechLog init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v4 = [v3 fileLoggingIsEnabled];

    if (!v4)
    {
      v9 = 0LL;
      goto LABEL_6;
    }

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("ADSpeechLogQueue", v6);
    logQueue = v2->_logQueue;
    v2->_logQueue = (OS_dispatch_queue *)v7;

    v2->_fd = -1;
  }

  v9 = v2;
LABEL_6:

  return v9;
}

- (id)_dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    dispatch_queue_attr_t v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    v6 = self->_dateFormatter;
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en-US"));
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", @"yyyy_MM_dd-HHmmss");
    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (id)_nowString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechLog _dateFormatter](self, "_dateFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringFromDate:v3]);

  return v4;
}

- (void)beginNewSpeechLogWithFormat:(id)a3
{
  id v4 = a3;
  logQueue = (dispatch_queue_s *)self->_logQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10017BBA0;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(logQueue, v7);
}

- (void)appendSpeechPacket:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    logQueue = (dispatch_queue_s *)self->_logQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10017BAEC;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(logQueue, v7);
  }
}

- (void)appendSpeechPackets:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[ADSpeechLog appendSpeechPacket:]( self,  "appendSpeechPacket:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)cancelCurrentSpeechLog
{
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017B924;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(logQueue, block);
}

- (void)endSpeechLog
{
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017B7AC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(logQueue, block);
}

- (void).cxx_destruct
{
}

+ (id)buffersFromSpeechLogAtURL:(id)a3 isNarrowBand:(BOOL *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
LABEL_21:
    __int128 v12 = 0LL;
    goto LABEL_26;
  }

  if (a4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);

    else {
      unsigned __int8 v9 = [v8 containsString:@"8000Hz"];
    }
    *a4 = v9;
  }

  id v10 = objc_claimAutoreleasedReturnValue([v6 path]);
  int v11 = open((const char *)[v10 fileSystemRepresentation], 0);

  if (v11 < 0)
  {
    v16 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v20 = v16;
      v21 = __error();
      v22 = strerror(*v21);
      *(_DWORD *)buf = 136315650;
      v27 = "+[ADSpeechLog buffersFromSpeechLogAtURL:isNarrowBand:]";
      __int16 v28 = 2114;
      v29 = v6;
      __int16 v30 = 2082;
      v31 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Error opening speech log at URL %{public}@ %{public}s",  buf,  0x20u);
    }

    goto LABEL_21;
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  while (1)
  {
    size_t v13 = 0LL;
    char v23 = 0x80;
    while (read(v11, &v23, 1uLL) == 1)
    {
      size_t v14 = v23 & 0x7F | (v13 << 7);
      size_t v13 = v14;
      if ((v23 & 0x80) == 0)
      {
        if (!v14) {
          goto LABEL_25;
        }
        goto LABEL_15;
      }
    }

    size_t v14 = v13;
    if (!v13) {
      goto LABEL_25;
    }
LABEL_15:
    if (v14 >= 0x401)
    {
      v17 = (os_log_s *)AFSiriLogContextSpeech;
      if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)v24 = 136315138;
      v25 = "+[ADSpeechLog buffersFromSpeechLogAtURL:isNarrowBand:]";
      v18 = "%s buffer not big enough";
      goto LABEL_28;
    }

    if (read(v11, buf, v14) != v14) {
      break;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, v14));
    [v12 addObject:v15];

    if (!v23) {
      goto LABEL_25;
    }
  }

  v17 = (os_log_s *)AFSiriLogContextSpeech;
  if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
    goto LABEL_25;
  }
  *(_DWORD *)v24 = 136315138;
  v25 = "+[ADSpeechLog buffersFromSpeechLogAtURL:isNarrowBand:]";
  v18 = "%s Read incorrect number of bytes";
LABEL_28:
  _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, v24, 0xCu);
LABEL_25:
  close(v11);
LABEL_26:

  return v12;
}

@end