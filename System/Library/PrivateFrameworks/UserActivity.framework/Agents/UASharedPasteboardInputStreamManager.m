@interface UASharedPasteboardInputStreamManager
- (BOOL)receivedDelem;
- (NSFileHandle)file;
- (NSInputStream)stream;
- (NSMutableData)receivedData;
- (NSOutputStream)outStream;
- (NSProgress)progress;
- (NSSet)typesToReceive;
- (UASharedPasteboardInfoWrapper)pbwrapper;
- (UASharedPasteboardInputStreamManager)initWithInputStream:(id)a3 outputStream:(id)a4 dataFile:(id)a5;
- (id)handler;
- (int64_t)bytesReceived;
- (int64_t)expectedLength;
- (unint64_t)absoluteToNSec:(unint64_t)a3;
- (unint64_t)state;
- (unint64_t)streamStartTime;
- (unint64_t)timeRemaining;
- (void)cancel;
- (void)receiveTypes:(id)a3 withProgress:(id)a4 completionHandler:(id)a5;
- (void)setBytesReceived:(int64_t)a3;
- (void)setExpectedLength:(int64_t)a3;
- (void)setFile:(id)a3;
- (void)setHandler:(id)a3;
- (void)setOutStream:(id)a3;
- (void)setPbwrapper:(id)a3;
- (void)setProgress:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setReceivedDelem:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStream:(id)a3;
- (void)setStreamStartTime:(unint64_t)a3;
- (void)setTimeRemaining:(unint64_t)a3;
- (void)setTypesToReceive:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)streamDoneWithInfo:(id)a3 error:(id)a4;
@end

@implementation UASharedPasteboardInputStreamManager

- (UASharedPasteboardInputStreamManager)initWithInputStream:(id)a3 outputStream:(id)a4 dataFile:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UASharedPasteboardInputStreamManager;
  v11 = -[UASharedPasteboardInputStreamManager init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[UASharedPasteboardInputStreamManager setStream:](v11, "setStream:", v8);
    -[UASharedPasteboardInputStreamManager setOutStream:](v12, "setOutStream:", v9);
    -[UASharedPasteboardInputStreamManager setFile:](v12, "setFile:", v10);
  }

  return v12;
}

- (void)receiveTypes:(id)a3 withProgress:(id)a4 completionHandler:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  -[UASharedPasteboardInputStreamManager setProgress:](self, "setProgress:", a4);
  -[UASharedPasteboardInputStreamManager setTypesToReceive:](self, "setTypesToReceive:", v8);
  -[UASharedPasteboardInputStreamManager setHandler:](self, "setHandler:", v9);

  -[UASharedPasteboardInputStreamManager setState:](self, "setState:", 0LL);
  -[UASharedPasteboardInputStreamManager setExpectedLength:](self, "setExpectedLength:", 7LL);
  os_log_t v10 = sub_100039584(@"pasteboard-server");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"All";
    if (v8) {
      v12 = v8;
    }
    int v21 = 138412290;
    v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[IN STREAM] Starting to receive types: %@",  (uint8_t *)&v21,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](self, "stream"));
  [v13 setDelegate:self];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager outStream](self, "outStream"));
  [v14 setDelegate:self];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](self, "stream"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v15 scheduleInRunLoop:v16 forMode:NSRunLoopCommonModes];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](self, "stream"));
  [v17 open];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager outStream](self, "outStream"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v18 scheduleInRunLoop:v19 forMode:NSRunLoopCommonModes];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager outStream](self, "outStream"));
  [v20 open];

  -[UASharedPasteboardInputStreamManager setStreamStartTime:](self, "setStreamStartTime:", mach_absolute_time());
}

- (void)cancel
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Input stream canceled", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
  -[UASharedPasteboardInputStreamManager streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v5);
}

- (void)streamDoneWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ((id)-[UASharedPasteboardInputStreamManager state](v8, "state") != (id)3)
  {
    os_log_t v9 = sub_100039584(@"pasteboard-server");
    os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Done with input stream", v20, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager outStream](v8, "outStream"));
    id v12 = objc_claimAutoreleasedReturnValue([@"PBDONE" dataUsingEncoding:4]);
    objc_msgSend(v11, "write:maxLength:", objc_msgSend(v12, "bytes"), 6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](v8, "stream"));
    [v13 close];

    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](v8, "stream"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v14 removeFromRunLoop:v15 forMode:NSRunLoopCommonModes];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager outStream](v8, "outStream"));
    [v16 close];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager outStream](v8, "outStream"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v17 removeFromRunLoop:v18 forMode:NSRunLoopCommonModes];

    v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager handler](v8, "handler"));
    ((void (**)(void, id, id))v19)[2](v19, v6, v7);

    -[UASharedPasteboardInputStreamManager setState:](v8, "setState:", 3LL);
  }

  objc_sync_exit(v8);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager progress](self, "progress"));
  unsigned int v8 = [v7 isCancelled];

  if (v8)
  {
    os_log_t v9 = sub_100039584(@"pasteboard-server");
    os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[IN STREAM] Paste cancelled, closing stream",  buf,  2u);
    }

    -[UASharedPasteboardInputStreamManager cancel](self, "cancel");
    goto LABEL_68;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](self, "stream"));
  unsigned int v12 = [v6 isEqual:v11];

  if (!v12) {
    goto LABEL_68;
  }
  if (a4 == 16)
  {
    os_log_t v27 = sub_100039584(@"pasteboard-server");
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Stream End Encountered", buf, 2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -127LL,  0LL));
    goto LABEL_28;
  }

  if (a4 == 8)
  {
    os_log_t v30 = sub_100039584(@"pasteboard-server");
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](self, "stream"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 streamError]);
      *(_DWORD *)buf = 138412290;
      v89 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[IN STREAM] Stream Event Error: %@", buf, 0xCu);
    }

    uint64_t v34 = UAContinuityErrorDomain;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager stream](self, "stream", NSUnderlyingErrorKey));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 streamError]);
    v85 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v34,  -127LL,  v37));

LABEL_28:
    -[UASharedPasteboardInputStreamManager streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v29);

    goto LABEL_68;
  }

  if (a4 != 2) {
    goto LABEL_68;
  }
  int64_t v13 = -[UASharedPasteboardInputStreamManager expectedLength](self, "expectedLength");
  int64_t v14 = -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived");
  if (v13 - v14 >= 0x10000) {
    uint64_t v15 = 0x10000LL;
  }
  else {
    uint64_t v15 = v13 - v14;
  }
  if (v13 - v14 <= 0) {
    uint64_t v16 = 0x10000LL;
  }
  else {
    uint64_t v16 = v15;
  }
  v17 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v18 = (char *)objc_msgSend(v6, "read:maxLength:", v17);
  -[UASharedPasteboardInputStreamManager setBytesReceived:]( self,  "setBytesReceived:",  &v18[-[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived")]);
  unint64_t v19 = -[UASharedPasteboardInputStreamManager state](self, "state");
  if (v19 == 2)
  {
    if (-[UASharedPasteboardInputStreamManager receivedDelem](self, "receivedDelem"))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager progress](self, "progress"));
      objc_msgSend( v41,  "setCompletedUnitCount:",  -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived"));

      double v42 = (double)-[UASharedPasteboardInputStreamManager absoluteToNSec:]( self,  "absoluteToNSec:",  mach_absolute_time()
                    - -[UASharedPasteboardInputStreamManager streamStartTime](self, "streamStartTime"))
          / 1000000000.0;
      double v43 = (double)-[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived") / v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager progress](self, "progress"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v43));
      [v44 setUserInfoObject:v45 forKey:NSProgressThroughputKey];

      int64_t v46 = -[UASharedPasteboardInputStreamManager expectedLength](self, "expectedLength");
      double v47 = (double)(v46 - -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived")) / v43;
      qword_1000DE428 = *(void *)&v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v48 pasteboardUITimeRemainingDelay];
      double v50 = v49;

      if (v42 > v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager progress](self, "progress"));
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_1000DE428));
        [v51 setUserInfoObject:v52 forKey:NSProgressEstimatedTimeRemainingKey];
      }

      v26 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v17,  v18,  0LL));
    }

    else
    {
      if (strncmp(v17, "===", 3uLL))
      {
        os_log_t v53 = sub_100039584(@"pasteboard-server");
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "[IN STREAM] Error, malformed data received. Did not receive correct delimiter",  buf,  2u);
        }

        uint64_t v55 = UAContinuityErrorDomain;
        NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
        v87 = @"Invalid delimiter before pb data";
        v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v55,  -122LL,  v56));

        -[UASharedPasteboardInputStreamManager streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v57);
        v26 = 0LL;
        goto LABEL_61;
      }

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager progress](self, "progress"));
      objc_msgSend( v77,  "setTotalUnitCount:",  -[UASharedPasteboardInputStreamManager expectedLength](self, "expectedLength"));

      v78 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager progress](self, "progress"));
      objc_msgSend( v78,  "setCompletedUnitCount:",  -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived"));

      os_log_t v79 = sub_100039584(@"pasteboard-server");
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "[IN STREAM] Started receiving data file",  buf,  2u);
      }

      v26 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v17 + 3,  v18 - 3,  0LL));
      -[UASharedPasteboardInputStreamManager setReceivedDelem:](self, "setReceivedDelem:", 1LL);
    }

    if (!v26)
    {
LABEL_62:
      uint64_t v81 = -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived");
      if (v81 < -[UASharedPasteboardInputStreamManager expectedLength](self, "expectedLength"))
      {
LABEL_67:

        goto LABEL_68;
      }

      os_log_t v82 = sub_100039584(@"pasteboard-server");
      v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "[IN STREAM] Received data file", buf, 2u);
      }

      v75 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager pbwrapper](self, "pbwrapper"));
      -[UASharedPasteboardInputStreamManager streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", v75, 0LL);
LABEL_66:

      goto LABEL_67;
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager file](self, "file"));
    [v57 writeData:v26];
LABEL_61:

    goto LABEL_62;
  }

  if (v19 == 1)
  {
    os_log_t v38 = sub_100039584(@"pasteboard-server");
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "[IN STREAM] Receiving Header", buf, 2u);
    }

    if (!strncmp(v17, "===", 3uLL))
    {
      os_log_t v58 = sub_100039584(@"pasteboard-server");
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "[IN STREAM] Started receiving header",  buf,  2u);
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager receivedData](self, "receivedData"));
      [v60 appendBytes:v17 + 3 length:v18 - 3];

      -[UASharedPasteboardInputStreamManager setReceivedDelem:](self, "setReceivedDelem:", 1LL);
    }

    else if (-[UASharedPasteboardInputStreamManager receivedDelem](self, "receivedDelem"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager receivedData](self, "receivedData"));
      [v40 appendBytes:v17 length:v18];
    }

    else
    {
      os_log_t v62 = sub_100039584(@"pasteboard-server");
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "[IN STREAM] Error, malformed data received. Did not receive correct delimiter",  buf,  2u);
      }

      uint64_t v64 = UAContinuityErrorDomain;
      NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
      v91 = @"Invalid delimiter before pbinfo";
      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v64,  -122LL,  v65));

      -[UASharedPasteboardInputStreamManager streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v66);
    }

    v67 = -[UASharedPasteboardInputStreamManager bytesReceived](self, "bytesReceived");
    v68 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager receivedData](self, "receivedData"));
    v26 = -[NSKeyedUnarchiver initForReadingFromData:error:](v68, "initForReadingFromData:error:", v69, 0LL);

    id v70 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v26,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfoWrapper),  NSKeyedArchiveRootObjectKey);
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    -[UASharedPasteboardInputStreamManager setPbwrapper:](self, "setPbwrapper:", v71);

    -[UASharedPasteboardInputStreamManager setState:](self, "setState:", 2LL);
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager pbwrapper](self, "pbwrapper"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v72 pbinfo]);
    -[UASharedPasteboardInputStreamManager setExpectedLength:]( self,  "setExpectedLength:",  (char *)[v73 dataSize] + 3);

    -[UASharedPasteboardInputStreamManager setBytesReceived:](self, "setBytesReceived:", 0LL);
    -[UASharedPasteboardInputStreamManager setReceivedDelem:](self, "setReceivedDelem:", 0LL);
    -[NSKeyedUnarchiver finishDecoding](v26, "finishDecoding");
    os_log_t v74 = sub_100039584(@"pasteboard-server");
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInputStreamManager pbwrapper](self, "pbwrapper"));
      *(_DWORD *)buf = 138412290;
      v89 = v76;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v75,  OS_LOG_TYPE_DEFAULT,  "[IN STREAM] Received Header: %@",  buf,  0xCu);
    }

    goto LABEL_66;
  }

  if (v19) {
    goto LABEL_68;
  }
  int v20 = strncmp(v17, "===", 3uLL);
  os_log_t v21 = sub_100039584(@"pasteboard-server");
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "[IN STREAM] Error, malformed data received. Have not received message header.",  buf,  2u);
    }

    uint64_t v24 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
    v93 = @"Invalid message header";
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
    v26 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  -122LL,  v25));

    -[UASharedPasteboardInputStreamManager streamDoneWithInfo:error:](self, "streamDoneWithInfo:error:", 0LL, v26);
    goto LABEL_67;
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[IN STREAM] Receiving Header Info", buf, 2u);
  }

  -[UASharedPasteboardInputStreamManager setExpectedLength:]( self,  "setExpectedLength:",  (*(_DWORD *)(v17 + 3) + 3));
  -[UASharedPasteboardInputStreamManager setState:](self, "setState:", 1LL);
  -[UASharedPasteboardInputStreamManager setBytesReceived:](self, "setBytesReceived:", 0LL);
  v61 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  -[UASharedPasteboardInputStreamManager setReceivedData:](self, "setReceivedData:", v61);

  -[UASharedPasteboardInputStreamManager setReceivedDelem:](self, "setReceivedDelem:", 0LL);
LABEL_68:
}

- (unint64_t)absoluteToNSec:(unint64_t)a3
{
  unsigned int v4 = dword_1000DE434;
  if (!dword_1000DE434)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000DE430);
    unsigned int v4 = dword_1000DE434;
  }

  return dword_1000DE430 * a3 / v4;
}

- (NSInputStream)stream
{
  return (NSInputStream *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStream:(id)a3
{
}

- (NSOutputStream)outStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOutStream:(id)a3
{
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFile:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setHandler:(id)a3
{
}

- (NSSet)typesToReceive
{
  return (NSSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTypesToReceive:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)pbwrapper
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPbwrapper:(id)a3
{
}

- (NSMutableData)receivedData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72LL, 1);
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

- (void).cxx_destruct
{
}

@end