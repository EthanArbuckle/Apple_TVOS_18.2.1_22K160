@interface UAPBStreamCoderV1
- (BOOL)infoSent;
- (BOOL)isSendMode;
- (BOOL)receivedDelem;
- (NSData)currentSendData;
- (NSFileHandle)dataFile;
- (NSFileHandle)file;
- (NSMutableData)receivedData;
- (NSProgress)progress;
- (NSTimer)backupTimer;
- (UAPBStreamCoderV1)initWithInputStream:(id)a3 outputStream:(id)a4;
- (UASharedPasteboardInfoWrapper)recvRap;
- (UASharedPasteboardInfoWrapper)sendRap;
- (UAStreamHandler)streamHandler;
- (id)headerForData:(id)a3;
- (id)recvHandler;
- (id)sendErrorHandler;
- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4;
- (int64_t)byteIndex;
- (int64_t)bytesReceived;
- (int64_t)expectedLength;
- (unint64_t)dataSent;
- (unint64_t)state;
- (unint64_t)streamStartTime;
- (unint64_t)timeRemaining;
- (unint64_t)totalBytesReceived;
- (void)cancelReceive;
- (void)dealloc;
- (void)processReceivedData;
- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7;
- (void)receivedDataBack:(id)a3;
- (void)sendNextChunk;
- (void)sendPasteboard:(id)a3 withCompletion:(id)a4;
- (void)setBackupTimer:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setBytesReceived:(int64_t)a3;
- (void)setCurrentSendData:(id)a3;
- (void)setDataFile:(id)a3;
- (void)setDataSent:(unint64_t)a3;
- (void)setExpectedLength:(int64_t)a3;
- (void)setFile:(id)a3;
- (void)setInfoSent:(BOOL *)a3;
- (void)setIsSendMode:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setReceivedDelem:(BOOL)a3;
- (void)setRecvHandler:(id)a3;
- (void)setRecvRap:(id)a3;
- (void)setSendErrorHandler:(id)a3;
- (void)setSendRap:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamStartTime:(unint64_t)a3;
- (void)setTimeRemaining:(unint64_t)a3;
- (void)setTotalBytesReceived:(unint64_t)a3;
- (void)shutdownTimerFired:(id)a3;
- (void)streamDoneWithInfo:(id)a3 error:(id)a4;
- (void)streams:(id)a3 didReadRawData:(id)a4;
- (void)streamsDidClose:(id)a3 withError:(id)a4;
- (void)streamsDidWriteRawDataBuffer:(id)a3;
@end

@implementation UAPBStreamCoderV1

- (UAPBStreamCoderV1)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UAPBStreamCoderV1;
  v8 = -[UAPBStreamCoderV1 init](&v11, "init");
  if (v8)
  {
    v9 = -[UAStreamHandler initWithInputStream:outputStream:delegate:]( objc_alloc(&OBJC_CLASS___UAStreamHandler),  "initWithInputStream:outputStream:delegate:",  v6,  v7,  v8);
    -[UAPBStreamCoderV1 setStreamHandler:](v8, "setStreamHandler:", v9);
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UAPBStreamCoderV1;
  -[UAPBStreamCoderV1 dealloc](&v4, "dealloc");
}

- (void)streams:(id)a3 didReadRawData:(id)a4
{
  id v6 = a4;
  if (-[UAPBStreamCoderV1 isSendMode](self, "isSendMode"))
  {
    -[UAPBStreamCoderV1 receivedDataBack:](self, "receivedDataBack:", v6);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    [v5 appendData:v6];

    -[UAPBStreamCoderV1 setBytesReceived:]( self,  "setBytesReceived:",  (char *)[v6 length] + -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived"));
    -[UAPBStreamCoderV1 setTotalBytesReceived:]( self,  "setTotalBytesReceived:",  (char *)[v6 length] + -[UAPBStreamCoderV1 totalBytesReceived](self, "totalBytesReceived"));
    -[UAPBStreamCoderV1 processReceivedData](self, "processReceivedData");
  }
}

- (void)streamsDidWriteRawDataBuffer:(id)a3
{
  if (-[UAPBStreamCoderV1 isSendMode](self, "isSendMode", a3)) {
    -[UAPBStreamCoderV1 sendNextChunk](self, "sendNextChunk");
  }
}

- (void)streamsDidClose:(id)a3 withError:(id)a4
{
  id v7 = a4;
  unsigned __int8 v5 = -[UAPBStreamCoderV1 isSendMode](self, "isSendMode");
  id v6 = v7;
  if (v7 && (v5 & 1) == 0)
  {
    -[UAPBStreamCoderV1 streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v7);
    id v6 = v7;
  }
}

- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  os_log_t v15 = sub_100039584(@"pasteboard-streams");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Starting to receive pasteboard",  (uint8_t *)buf,  2u);
  }

  -[UAPBStreamCoderV1 setProgress:](self, "setProgress:", v12);
  objc_initWeak(buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10005D3B8;
  v21[3] = &unk_1000BDF60;
  id v17 = v13;
  id v22 = v17;
  id v18 = v14;
  id v23 = v18;
  objc_copyWeak(&v24, buf);
  -[UAPBStreamCoderV1 setRecvHandler:](self, "setRecvHandler:", v21);
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  -[UAPBStreamCoderV1 setReceivedData:](self, "setReceivedData:", v19);

  -[UAPBStreamCoderV1 setFile:](self, "setFile:", v11);
  -[UAPBStreamCoderV1 setState:](self, "setState:", 0LL);
  -[UAPBStreamCoderV1 setExpectedLength:](self, "setExpectedLength:", 7LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
  [v20 start];

  -[UAPBStreamCoderV1 setStreamStartTime:](self, "setStreamStartTime:", mach_absolute_time());
  objc_destroyWeak(&v24);

  objc_destroyWeak(buf);
}

- (void)cancelReceive
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CODER_V1] Input stream canceled", v6, 2u);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
  -[UAPBStreamCoderV1 streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v5);
}

- (void)streamDoneWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if ((id)-[UAPBStreamCoderV1 state](v8, "state") != (id)3)
  {
    os_log_t v9 = sub_100039584(@"pasteboard-server");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Done with input stream: %@, %@",  (uint8_t *)&v15,  0x16u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](v8, "streamHandler"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([@"PBDONE" dataUsingEncoding:4]);
    [v11 writeRawData:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](v8, "streamHandler"));
    [v13 stop];

    id v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 recvHandler](v8, "recvHandler"));
    ((void (**)(void, id, id))v14)[2](v14, v6, v7);

    -[UAPBStreamCoderV1 setState:](v8, "setState:", 3LL);
  }

  objc_sync_exit(v8);
}

- (void)processReceivedData
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    int v83 = 134217984;
    id v84 = [v5 length];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[CODER_V1] Processing Received data with length: %ld",  (uint8_t *)&v83,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
  id v7 = [v6 length];

  if (!v7) {
    return;
  }
  unint64_t v8 = -[UAPBStreamCoderV1 state](self, "state");
  if (v8 == 2)
  {
    if (-[UAPBStreamCoderV1 receivedDelem](self, "receivedDelem"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 progress](self, "progress"));
      objc_msgSend(v21, "setCompletedUnitCount:", -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived"));

      double v22 = (double)+[UADiagnosticUtils absoluteToNSec:]( &OBJC_CLASS___UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - -[UAPBStreamCoderV1 streamStartTime](self, "streamStartTime"))
          / 1000000000.0;
      double v23 = (double)-[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived") / v22;
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 progress](self, "progress"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
      [v24 setUserInfoObject:v25 forKey:NSProgressThroughputKey];

      int64_t v26 = -[UAPBStreamCoderV1 expectedLength](self, "expectedLength");
      double v27 = (double)(v26 - -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived")) / v23;
      qword_1000DE458 = *(void *)&v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v28 pasteboardUITimeRemainingDelay];
      double v30 = v29;

      if (v22 > v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 progress](self, "progress"));
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_1000DE458));
        [v31 setUserInfoObject:v32 forKey:NSProgressEstimatedTimeRemainingKey];

LABEL_27:
      }
    }

    else
    {
      id v42 = objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
      v43 = (const char *)[v42 bytes];

      if (strncmp(v43, "===", 3uLL))
      {
        os_log_t v44 = sub_100039584(@"pasteboard-server");
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v83) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "[CODER_V1] Error, malformed data received. Did not receive correct delimiter",  (uint8_t *)&v83,  2u);
        }

        uint64_t v46 = UAContinuityErrorDomain;
        NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
        v88 = @"Invalid delimiter before pb data";
        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v46,  -122LL,  v47));

        -[UAPBStreamCoderV1 streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v31);
        goto LABEL_27;
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 progress](self, "progress"));
      objc_msgSend(v65, "setTotalUnitCount:", -[UAPBStreamCoderV1 expectedLength](self, "expectedLength"));

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 progress](self, "progress"));
      objc_msgSend(v66, "setCompletedUnitCount:", -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived"));

      os_log_t v67 = sub_100039584(@"pasteboard-server");
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v83) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Started receiving data file",  (uint8_t *)&v83,  2u);
      }

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 trimFirstBytes:ofData:](self, "trimFirstBytes:ofData:", 3LL, v69));
      -[UAPBStreamCoderV1 setReceivedData:](self, "setReceivedData:", v70);

      -[UAPBStreamCoderV1 setReceivedDelem:](self, "setReceivedDelem:", 1LL);
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    id v72 = [v71 length];

    if (v72)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 file](self, "file"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
      [v73 writeData:v74];

      v75 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
      [v75 setLength:0];
    }

    os_log_t v76 = sub_100039584(@"pasteboard-server");
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      int64_t v78 = -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived");
      int64_t v79 = -[UAPBStreamCoderV1 expectedLength](self, "expectedLength");
      int v83 = 134218240;
      id v84 = (id)v78;
      __int16 v85 = 2048;
      int64_t v86 = v79;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_INFO,  "[CODER_V1] Recived %ld of %ld",  (uint8_t *)&v83,  0x16u);
    }

    uint64_t v80 = -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived");
    if (v80 >= -[UAPBStreamCoderV1 expectedLength](self, "expectedLength"))
    {
      os_log_t v81 = sub_100039584(@"pasteboard-server");
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v83) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Received data file",  (uint8_t *)&v83,  2u);
      }

      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 recvRap](self, "recvRap"));
      id v18 = self;
      v19 = v17;
      v20 = 0LL;
      goto LABEL_50;
    }

    return;
  }

  if (v8 != 1)
  {
    if (v8) {
      return;
    }
    id v9 = objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    v10 = (char *)[v9 bytes];

    int v11 = strncmp(v10, "===", 3uLL);
    os_log_t v12 = sub_100039584(@"pasteboard-server");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v83) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[CODER_V1] Error, malformed data received. Have not received message header.",  (uint8_t *)&v83,  2u);
      }

      uint64_t v15 = UAContinuityErrorDomain;
      NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
      v92 = @"Invalid message header";
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  -122LL,  v16));

      id v18 = self;
      v19 = 0LL;
      v20 = v17;
LABEL_50:
      -[UAPBStreamCoderV1 streamDoneWithInfo:error:](v18, "streamDoneWithInfo:error:", v19, v20);
      goto LABEL_51;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v83) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "[CODER_V1] Receiving Header Info",  (uint8_t *)&v83,  2u);
    }

    -[UAPBStreamCoderV1 setExpectedLength:](self, "setExpectedLength:", (*(_DWORD *)(v10 + 3) + 3));
    -[UAPBStreamCoderV1 setState:](self, "setState:", 1LL);
    -[UAPBStreamCoderV1 setBytesReceived:]( self,  "setBytesReceived:",  (char *)-[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived") - 7);
    -[UAPBStreamCoderV1 setReceivedDelem:](self, "setReceivedDelem:", 0LL);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    v54 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 trimFirstBytes:ofData:](self, "trimFirstBytes:ofData:", 7LL, v17));
    -[UAPBStreamCoderV1 setReceivedData:](self, "setReceivedData:", v54);
LABEL_38:

LABEL_51:
    return;
  }

  os_log_t v33 = sub_100039584(@"pasteboard-server");
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v83) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "[CODER_V1] Receiving Header",  (uint8_t *)&v83,  2u);
  }

  id v35 = objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
  v36 = (const char *)[v35 bytes];

  if (!strncmp(v36, "===", 3uLL))
  {
    os_log_t v48 = sub_100039584(@"pasteboard-server");
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v83) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Started receiving header",  (uint8_t *)&v83,  2u);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 trimFirstBytes:ofData:](self, "trimFirstBytes:ofData:", 3LL, v50));
    -[UAPBStreamCoderV1 setReceivedData:](self, "setReceivedData:", v51);

    -[UAPBStreamCoderV1 setReceivedDelem:](self, "setReceivedDelem:", 1LL);
    -[UAPBStreamCoderV1 setExpectedLength:]( self,  "setExpectedLength:",  (char *)-[UAPBStreamCoderV1 expectedLength](self, "expectedLength") - 3);
    -[UAPBStreamCoderV1 setBytesReceived:]( self,  "setBytesReceived:",  (char *)-[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived") - 3);
  }

  else if (!-[UAPBStreamCoderV1 receivedDelem](self, "receivedDelem"))
  {
    os_log_t v37 = sub_100039584(@"pasteboard-server");
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v83) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "[CODER_V1] Error, malformed data received. Did not receive correct delimiter",  (uint8_t *)&v83,  2u);
    }

    uint64_t v39 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    v90 = @"Invalid delimiter before pbinfo";
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v39,  -122LL,  v40));

    -[UAPBStreamCoderV1 streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v41);
  }

  uint64_t v52 = -[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived");
  if (v52 >= -[UAPBStreamCoderV1 expectedLength](self, "expectedLength"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v53,  "subdataWithRange:",  0,  -[UAPBStreamCoderV1 expectedLength](self, "expectedLength")));

    v54 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v17,  0LL);
    id v55 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v54,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfoWrapper),  NSKeyedArchiveRootObjectKey);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    -[UAPBStreamCoderV1 setRecvRap:](self, "setRecvRap:", v56);

    -[UAPBStreamCoderV1 setState:](self, "setState:", 2LL);
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 recvRap](self, "recvRap"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v57 pbinfo]);
    -[UAPBStreamCoderV1 setExpectedLength:](self, "setExpectedLength:", (char *)[v58 dataSize] + 3);

    -[UAPBStreamCoderV1 setBytesReceived:]( self,  "setBytesReceived:",  (_BYTE *)-[UAPBStreamCoderV1 bytesReceived](self, "bytesReceived") - (_BYTE *)[v17 length]);
    -[UAPBStreamCoderV1 setReceivedDelem:](self, "setReceivedDelem:", 0LL);
    -[NSKeyedUnarchiver finishDecoding](v54, "finishDecoding");
    id v59 = [v17 length];
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 receivedData](self, "receivedData"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 trimFirstBytes:ofData:](self, "trimFirstBytes:ofData:", v59, v60));
    -[UAPBStreamCoderV1 setReceivedData:](self, "setReceivedData:", v61);

    os_log_t v62 = sub_100039584(@"pasteboard-server");
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 recvRap](self, "recvRap"));
      int v83 = 138412290;
      id v84 = v64;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Received Header: %@",  (uint8_t *)&v83,  0xCu);
    }

    goto LABEL_38;
  }

- (void)sendPasteboard:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  -[UAPBStreamCoderV1 setIsSendMode:](self, "setIsSendMode:", 1LL);
  id v35 = v6;
  -[UAPBStreamCoderV1 setSendRap:](self, "setSendRap:", v6);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  val = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 sendRap](self, "sendRap"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pbinfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);

  id v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 types]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
        unsigned int v16 = [v15 containsObject:@"public.file-url"];

        if (v16)
        {
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 types]);
          id v18 = [v17 mutableCopy];

          [v18 removeObjectForKey:@"public.file-url"];
          [v18 removeObjectForKey:@"com.apple.security.sandbox-extension-dict"];
          [v18 removeObjectForKey:@"com.apple.finder.noderef"];
          [v13 setTypes:v18];
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }

    while (v10);
  }

  objc_initWeak(&location, val);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10005E69C;
  v37[3] = &unk_1000BDF88;
  id v19 = v34;
  id v38 = v19;
  objc_copyWeak(&v39, &location);
  -[UAPBStreamCoderV1 setSendErrorHandler:](val, "setSendErrorHandler:", v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v35 pbinfo]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 dataFile]);
  -[UAPBStreamCoderV1 setDataFile:](val, "setDataFile:", v21);

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 sendRap](val, "sendRap"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pbinfo]);
  [v23 setDataFile:0];

  -[UAPBStreamCoderV1 setDataSent:](val, "setDataSent:", 0LL);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 sendRap](val, "sendRap"));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v24,  1LL,  0LL));

  os_log_t v26 = sub_100039584(@"pasteboard-server");
  double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 sendRap](val, "sendRap"));
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Sending pboard info: %@",  buf,  0xCu);
  }

  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 headerForData:](val, "headerForData:", v25));
  -[UAPBStreamCoderV1 setCurrentSendData:](val, "setCurrentSendData:", v29);

  double v30 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](val, "streamHandler"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 currentSendData](val, "currentSendData"));
  [v30 writeRawData:v31];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 currentSendData](val, "currentSendData"));
  -[UAPBStreamCoderV1 setDataSent:]( val,  "setDataSent:",  (char *)[v32 length] + -[UAPBStreamCoderV1 dataSent](val, "dataSent"));

  -[UAPBStreamCoderV1 setCurrentSendData:](val, "setCurrentSendData:", 0LL);
  os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](val, "streamHandler"));
  [v33 start];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)sendNextChunk
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 dataFile](self, "dataFile"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 readDataOfLength:0x10000]);

  -[UAPBStreamCoderV1 setDataSent:]( self,  "setDataSent:",  (char *)[v4 length] + -[UAPBStreamCoderV1 dataSent](self, "dataSent"));
  id v5 = [v4 length];
  os_log_t v6 = sub_100039584(@"pasteboard-server");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134217984;
      id v13 = [v4 length];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[CODER_V1] Queuing next chunk to send: %ld",  (uint8_t *)&v12,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
    [v9 writeRawData:v4];
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CODER_V1] Done queuing chunks, starting shutdown timer",  (uint8_t *)&v12,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "shutdownTimerFired:",  0LL,  0LL,  30.0));
    -[UAPBStreamCoderV1 setBackupTimer:](self, "setBackupTimer:", v10);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 backupTimer](self, "backupTimer"));
    [v9 addTimer:v11 forMode:NSRunLoopCommonModes];
  }
}

- (void)receivedDataBack:(id)a3
{
  id v4 = a3;
  id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);

  os_log_t v6 = sub_100039584(@"pasteboard-server");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    unint64_t v18 = (unint64_t)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Got data back: %@",  (uint8_t *)&v17,  0xCu);
  }

  os_log_t v8 = sub_100039584(@"pasteboard-server");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = -[UAPBStreamCoderV1 dataSent](self, "dataSent");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
    id v12 = [v11 totalBytesSent];
    int v17 = 134218240;
    unint64_t v18 = v10;
    __int16 v19 = 2048;
    id v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Data sent: %ld - %ld",  (uint8_t *)&v17,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
  [v13 stop];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 backupTimer](self, "backupTimer"));
  [v14 invalidate];

  uint64_t v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 sendErrorHandler](self, "sendErrorHandler"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
  ((void (**)(void, id, void))v15)[2](v15, [v16 totalBytesSent], 0);
}

- (void)shutdownTimerFired:(id)a3
{
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[OUT STREAM] Stream Timer Fired, shutting down",  v9,  2u);
  }

  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
  [v6 stop];

  id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 sendErrorHandler](self, "sendErrorHandler"));
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAPBStreamCoderV1 streamHandler](self, "streamHandler"));
  ((void (**)(void, id, void))v7)[2](v7, [v8 totalBytesSent], 0);
}

- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4
{
  id v5 = a4;
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", a3, (char *)objc_msgSend( v5,  "length") - a3));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v6));
  return v7;
}

- (id)headerForData:(id)a3
{
  id v3 = a3;
  os_log_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  unsigned int v6 = [v3 length];
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", "===", 3LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v6, 4LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", "===", 3LL);
  -[NSMutableData appendData:](v4, "appendData:", v3);

  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", "===", 3LL);
  return v4;
}

- (UAStreamHandler)streamHandler
{
  return (UAStreamHandler *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStreamHandler:(id)a3
{
}

- (BOOL)isSendMode
{
  return self->_isSendMode;
}

- (void)setIsSendMode:(BOOL)a3
{
  self->_isSendMode = a3;
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFile:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (id)recvHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRecvHandler:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)recvRap
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRecvRap:(id)a3
{
}

- (NSMutableData)receivedData
{
  return (NSMutableData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setReceivedData:(id)a3
{
}

- (unint64_t)streamStartTime
{
  return self->_streamStartTime;
}

- (void)setStreamStartTime:(unint64_t)a3
{
  self->_streamStartTime = a3;
}

- (unint64_t)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(unint64_t)a3
{
  self->_timeRemaining = a3;
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(int64_t)a3
{
  self->_bytesReceived = a3;
}

- (int64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(int64_t)a3
{
  self->_expectedLength = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)receivedDelem
{
  return self->_receivedDelem;
}

- (void)setReceivedDelem:(BOOL)a3
{
  self->_receivedDelem = a3;
}

- (unint64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(unint64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (UASharedPasteboardInfoWrapper)sendRap
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setSendRap:(id)a3
{
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDataFile:(id)a3
{
}

- (id)sendErrorHandler
{
  return objc_getProperty(self, a2, 128LL, 1);
}

- (void)setSendErrorHandler:(id)a3
{
}

- (NSData)currentSendData
{
  return (NSData *)objc_getProperty(self, a2, 136LL, 1);
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
  return (NSTimer *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setBackupTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end