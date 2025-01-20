@interface UASharedPasteboardOutputStreamManager
- (BOOL)infoSent;
- (NSData)currentSendData;
- (NSFileHandle)dataFile;
- (NSInputStream)inStream;
- (NSOutputStream)stream;
- (NSSet)typesToSend;
- (NSTimer)backupTimer;
- (UASharedPasteboardInfoWrapper)pbwrapper;
- (UASharedPasteboardOutputStreamManager)initWithOutputStream:(id)a3 inputStream:(id)a4 pasteboard:(id)a5;
- (id)headerForData:(id)a3;
- (id)sendErrorHandler;
- (int64_t)byteIndex;
- (unint64_t)dataSent;
- (void)sendTypes:(id)a3 completionHandler:(id)a4;
- (void)setBackupTimer:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setCurrentSendData:(id)a3;
- (void)setDataFile:(id)a3;
- (void)setDataSent:(unint64_t)a3;
- (void)setInStream:(id)a3;
- (void)setInfoSent:(BOOL *)a3;
- (void)setPbwrapper:(id)a3;
- (void)setSendErrorHandler:(id)a3;
- (void)setStream:(id)a3;
- (void)setTypesToSend:(id)a3;
- (void)shutdownStream;
- (void)shutdownTimerFired:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation UASharedPasteboardOutputStreamManager

- (UASharedPasteboardOutputStreamManager)initWithOutputStream:(id)a3 inputStream:(id)a4 pasteboard:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___UASharedPasteboardOutputStreamManager;
  v11 = -[UASharedPasteboardOutputStreamManager init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    -[UASharedPasteboardOutputStreamManager setStream:](v11, "setStream:", v8);
    -[UASharedPasteboardOutputStreamManager setInStream:](v12, "setInStream:", v9);
    -[UASharedPasteboardOutputStreamManager setPbwrapper:](v12, "setPbwrapper:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager pbwrapper](v12, "pbwrapper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pbinfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataFile]);
    -[UASharedPasteboardOutputStreamManager setDataFile:](v12, "setDataFile:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager pbwrapper](v12, "pbwrapper"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pbinfo]);
    [v17 setDataFile:0];
  }

  return v12;
}

- (void)sendTypes:(id)a3 completionHandler:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  -[UASharedPasteboardOutputStreamManager setDataSent:](self, "setDataSent:", 0LL);
  -[UASharedPasteboardOutputStreamManager setTypesToSend:](self, "setTypesToSend:", v6);
  -[UASharedPasteboardOutputStreamManager setSendErrorHandler:](self, "setSendErrorHandler:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager pbwrapper](self, "pbwrapper"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));

  os_log_t v10 = sub_100039584(@"pasteboard-server");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager pbwrapper](self, "pbwrapper"));
    int v25 = 138412290;
    v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Sending pboard info: %@",  (uint8_t *)&v25,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager headerForData:](self, "headerForData:", v9));
  -[UASharedPasteboardOutputStreamManager setCurrentSendData:](self, "setCurrentSendData:", v13);

  os_log_t v14 = sub_100039584(@"pasteboard-server");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = @"All";
    if (v6) {
      v16 = v6;
    }
    int v25 = 138412290;
    v26 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[OUT STREAM] Starting to send types: %@",  (uint8_t *)&v25,  0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager stream](self, "stream"));
  [v17 setDelegate:self];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager inStream](self, "inStream"));
  [v18 setDelegate:self];

  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager stream](self, "stream"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v19 scheduleInRunLoop:v20 forMode:NSRunLoopCommonModes];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager stream](self, "stream"));
  [v21 open];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager inStream](self, "inStream"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v22 scheduleInRunLoop:v23 forMode:NSRunLoopCommonModes];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager inStream](self, "inStream"));
  [v24 open];
}

- (id)headerForData:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  unsigned int v6 = [v3 length];
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", "===", 3LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v6, 4LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", "===", 3LL);
  -[NSMutableData appendData:](v4, "appendData:", v3);

  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", "===", 3LL);
  return v4;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager stream](self, "stream"));
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (a4 == 8)
    {
      os_log_t v41 = sub_100039584(@"pasteboard-server");
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v51 = 8LL;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "[OUT STREAM] Unexpected event code: %lu",  buf,  0xCu);
      }

      -[UASharedPasteboardOutputStreamManager shutdownStream](self, "shutdownStream");
      v35 = (void (**)(id, unint64_t, uint64_t))objc_claimAutoreleasedReturnValue( -[UASharedPasteboardOutputStreamManager sendErrorHandler]( self,  "sendErrorHandler"));
      unint64_t v43 = -[UASharedPasteboardOutputStreamManager dataSent](self, "dataSent");
      uint64_t v44 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -127LL,  0LL));
LABEL_25:
      v40 = (void (**)(void, void, void))v44;
      v35[2](v35, v43, v44);
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }

    if (a4 == 4)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager currentSendData](self, "currentSendData"));
      if (!v9
        || (os_log_t v10 = (void *)v9,
            unint64_t v11 = -[UASharedPasteboardOutputStreamManager byteIndex](self, "byteIndex"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager currentSendData](self, "currentSendData")),
            id v13 = [v12 length],
            v12,
            v10,
            v11 >= (unint64_t)v13))
      {
        os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager dataFile](self, "dataFile"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 readDataOfLength:0x10000]);
        -[UASharedPasteboardOutputStreamManager setCurrentSendData:](self, "setCurrentSendData:", v15);

        -[UASharedPasteboardOutputStreamManager setByteIndex:](self, "setByteIndex:", 0LL);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager currentSendData](self, "currentSendData"));
        id v17 = [v16 length];

        if (!v17)
        {
          os_log_t v45 = sub_100039584(@"pasteboard-server");
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Done sending pasteboard, waiting for end of stream",  buf,  2u);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "shutdownTimerFired:",  0LL,  0LL,  30.0));
          -[UASharedPasteboardOutputStreamManager setBackupTimer:](self, "setBackupTimer:", v47);

          v35 = (void (**)(id, unint64_t, uint64_t))objc_claimAutoreleasedReturnValue( +[NSRunLoop mainRunLoop]( &OBJC_CLASS___NSRunLoop,  "mainRunLoop"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager backupTimer](self, "backupTimer"));
          [v35 addTimer:v48 forMode:NSRunLoopCommonModes];

          goto LABEL_27;
        }
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager currentSendData](self, "currentSendData"));
      id v19 = [v18 length];

      if (v19)
      {
        id v20 = objc_claimAutoreleasedReturnValue( -[UASharedPasteboardOutputStreamManager currentSendData]( self, "currentSendData"));
        id v21 = [v20 bytes];

        v22 = (char *)-[UASharedPasteboardOutputStreamManager byteIndex](self, "byteIndex") + (void)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager currentSendData](self, "currentSendData"));
        id v24 = [v23 length];

        int64_t v25 = -[UASharedPasteboardOutputStreamManager byteIndex](self, "byteIndex");
        else {
          uint64_t v26 = (uint64_t)v24 - v25;
        }
        v27 = (char *)[v6 write:v22 maxLength:v26];
        if (v27 != (char *)-1LL)
        {
          v28 = v27;
          -[UASharedPasteboardOutputStreamManager setDataSent:]( self,  "setDataSent:",  &v27[-[UASharedPasteboardOutputStreamManager dataSent](self, "dataSent")]);
          -[UASharedPasteboardOutputStreamManager setByteIndex:]( self,  "setByteIndex:",  &v28[-[UASharedPasteboardOutputStreamManager byteIndex](self, "byteIndex")]);
          goto LABEL_28;
        }

        -[UASharedPasteboardOutputStreamManager shutdownStream](self, "shutdownStream");
        v35 = (void (**)(id, unint64_t, uint64_t))objc_claimAutoreleasedReturnValue( -[UASharedPasteboardOutputStreamManager sendErrorHandler]( self,  "sendErrorHandler"));
        unint64_t v43 = -[UASharedPasteboardOutputStreamManager dataSent](self, "dataSent");
        uint64_t v44 = objc_claimAutoreleasedReturnValue([v6 streamError]);
        goto LABEL_25;
      }
    }
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager inStream](self, "inStream"));
    unsigned int v30 = [v6 isEqual:v29];

    if (v30 && (a4 == 16 || a4 == 2))
    {
      unint64_t v31 = (unint64_t)[v6 read:v49 maxLength:10];
      if ((v31 & 0x8000000000000000LL) == 0)
      {
        unint64_t v32 = v31;
        v33 = objc_alloc(&OBJC_CLASS___NSString);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v49, v32));
        v35 = -[NSString initWithData:encoding:](v33, "initWithData:encoding:", v34, 4LL);

        os_log_t v36 = sub_100039584(@"pasteboard-server");
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v51 = (uint64_t)v35;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Got data back: %@",  buf,  0xCu);
        }

        os_log_t v38 = sub_100039584(@"pasteboard-server");
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Stream End Encountered, shutting down",  buf,  2u);
        }

        -[UASharedPasteboardOutputStreamManager shutdownStream](self, "shutdownStream");
        v40 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[UASharedPasteboardOutputStreamManager sendErrorHandler]( self,  "sendErrorHandler"));
        v40[2](v40, -[UASharedPasteboardOutputStreamManager dataSent](self, "dataSent"), 0LL);
        goto LABEL_26;
      }
    }
  }

- (void)shutdownTimerFired:(id)a3
{
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Stream Timer Fired, shutting down",  v7,  2u);
  }

  -[UASharedPasteboardOutputStreamManager shutdownStream](self, "shutdownStream");
  id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[UASharedPasteboardOutputStreamManager sendErrorHandler]( self,  "sendErrorHandler"));
  v6[2](v6, -[UASharedPasteboardOutputStreamManager dataSent](self, "dataSent"), 0LL);
}

- (void)shutdownStream
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager backupTimer](self, "backupTimer"));
  [v3 invalidate];

  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager stream](self, "stream"));
  [v4 close];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager stream](self, "stream"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v5 removeFromRunLoop:v6 forMode:NSRunLoopCommonModes];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager inStream](self, "inStream"));
  [v7 close];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardOutputStreamManager inStream](self, "inStream"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v9 removeFromRunLoop:v8 forMode:NSRunLoopCommonModes];
}

- (NSOutputStream)stream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStream:(id)a3
{
}

- (NSInputStream)inStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInStream:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)pbwrapper
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPbwrapper:(id)a3
{
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDataFile:(id)a3
{
}

- (NSSet)typesToSend
{
  return (NSSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTypesToSend:(id)a3
{
}

- (id)sendErrorHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSendErrorHandler:(id)a3
{
}

- (NSData)currentSendData
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCurrentSendData:(id)a3
{
}

- (int64_t)byteIndex
{
  return self->_byteIndex;
}

- (void)setByteIndex:(int64_t)a3
{
  self->_byteIndex = a3;
}

- (BOOL)infoSent
{
  return self->_infoSent;
}

- (void)setInfoSent:(BOOL *)a3
{
  self->_infoSent = a3;
}

- (unint64_t)dataSent
{
  return self->_dataSent;
}

- (void)setDataSent:(unint64_t)a3
{
  self->_dataSent = a3;
}

- (NSTimer)backupTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setBackupTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end