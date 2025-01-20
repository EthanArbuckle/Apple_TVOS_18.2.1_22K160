@interface SDStreamHandler
- (BOOL)bufferSpaceAvailable;
- (BOOL)checkedCert;
- (BOOL)evaluateCert;
- (BOOL)isClient;
- (BOOL)loggedTransfer;
- (BOOL)registeredStreams;
- (BOOL)shouldReadNetwork;
- (BOOL)shouldStop;
- (BOOL)usingMessages;
- (NSData)inMessage;
- (NSDate)timeOpened;
- (NSDate)timeToOpen;
- (NSError)streamError;
- (NSInputStream)inputStream;
- (NSMutableArray)messageQueue;
- (NSMutableData)inData;
- (NSMutableData)outMessage;
- (NSMutableData)outputStreamData;
- (NSMutableDictionary)handlers;
- (NSOutputStream)outputStream;
- (NSString)bundleID;
- (NSTimer)openTimer;
- (SDStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 isClient:(BOOL)a5;
- (SDStreamHandlerDelegate)delegate;
- (id)headerWithLength:(unsigned int)a3;
- (id)messageWithData:(id)a3;
- (id)trimHeader:(id)a3;
- (int64_t)byteIndex;
- (int64_t)bytesRead;
- (int64_t)readFromNetwork;
- (int64_t)wroteToNetwork;
- (unint64_t)inputState;
- (unsigned)inMessageLength;
- (unsigned)parseHeader:(id)a3;
- (void)_stop;
- (void)applySSLSettings:(id)a3;
- (void)dealloc;
- (void)handleBytesAvailable;
- (void)handleBytesForMessage;
- (void)handleBytesForStream;
- (void)handleHeaderRead;
- (void)handleMessageRead;
- (void)handleMessageWritten:(id)a3;
- (void)handleOpenedStream:(id)a3;
- (void)handleSpaceAvailable;
- (void)handleSpaceForMessage;
- (void)handleSpaceForStream;
- (void)invalidateOpenTimer;
- (void)logTransfer;
- (void)openTimerFired:(id)a3;
- (void)resetReadState;
- (void)sendMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)sendMessage:(id)a3 withErrorHandler:(id)a4;
- (void)setBufferSpaceAvailable:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setBytesRead:(int64_t)a3;
- (void)setCheckedCert:(BOOL)a3;
- (void)setClient:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setInData:(id)a3;
- (void)setInMessage:(id)a3;
- (void)setInMessageLength:(unsigned int)a3;
- (void)setInputState:(unint64_t)a3;
- (void)setInputStream:(id)a3;
- (void)setLoggedTransfer:(BOOL)a3;
- (void)setMessageQueue:(id)a3;
- (void)setOpenTimer:(id)a3;
- (void)setOutMessage:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setOutputStreamData:(id)a3;
- (void)setReadFromNetwork:(int64_t)a3;
- (void)setRegisteredStreams:(BOOL)a3;
- (void)setShouldReadNetwork:(BOOL)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setStreamError:(id)a3;
- (void)setTCPProperties:(id)a3;
- (void)setTimeOpened:(id)a3;
- (void)setTimeToOpen:(id)a3;
- (void)setUsingMessages:(BOOL)a3;
- (void)setWroteToNetwork:(int64_t)a3;
- (void)start;
- (void)startOpenTimer;
- (void)stop;
- (void)stopIfReady;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeToStreamWithData:(id)a3;
@end

@implementation SDStreamHandler

- (SDStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 isClient:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SDStreamHandler;
  v11 = -[SDStreamHandler init](&v29, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputStream, a3);
    objc_storeStrong((id *)&v12->_outputStream, a4);
    v12->_client = a5;
    v12->_byteIndex = 0LL;
    v12->_bytesRead = 0LL;
    bundleID = v12->_bundleID;
    v12->_bundleID = (NSString *)&stru_1005E3958;

    inMessage = v12->_inMessage;
    v12->_inMessage = 0LL;

    v12->_shouldStop = 0;
    openTimer = v12->_openTimer;
    v12->_openTimer = 0LL;

    outMessage = v12->_outMessage;
    v12->_outMessage = 0LL;

    v12->_checkedCert = 0;
    streamError = v12->_streamError;
    v12->_streamError = 0LL;

    v12->_inMessageLength = 0;
    *(_WORD *)&v12->_registeredStreams = 256;
    *(_WORD *)&v12->_shouldReadNetwork = 257;
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    inData = v12->_inData;
    v12->_inData = v18;

    v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    messageQueue = v12->_messageQueue;
    v12->_messageQueue = v20;

    v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    handlers = v12->_handlers;
    v12->_handlers = v22;

    v24 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    outputStreamData = v12->_outputStreamData;
    v12->_outputStreamData = v24;

    v12->_inputState = 0LL;
    timeToOpen = v12->_timeToOpen;
    v12->_timeToOpen = 0LL;

    timeOpened = v12->_timeOpened;
    v12->_timeOpened = 0LL;

    v12->_loggedTransfer = 0;
    v12->_wroteToNetwork = 0LL;
    v12->_readFromNetwork = 0LL;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v3 = streams_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Deallocating Stream Handler", buf, 0xCu);
  }

  -[SDStreamHandler _stop](self, "_stop");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDStreamHandler;
  -[SDStreamHandler dealloc](&v5, "dealloc");
}

- (void)start
{
  if (!-[NSInputStream streamStatus](self->_inputStream, "streamStatus"))
  {
    -[SDStreamHandler applySSLSettings:](self, "applySSLSettings:", self->_inputStream);
    inputStream = self->_inputStream;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    -[NSInputStream scheduleInRunLoop:forMode:](inputStream, "scheduleInRunLoop:forMode:", v4, NSDefaultRunLoopMode);

    -[NSInputStream setProperty:forKey:]( self->_inputStream,  "setProperty:forKey:",  &__kCFBooleanFalse,  kCFStreamPropertyAutoErrorOnSystemChange);
    -[NSInputStream setProperty:forKey:]( self->_inputStream,  "setProperty:forKey:",  &__kCFBooleanTrue,  kCFStreamPropertyIndefiniteConnection);
    if (!self->_client) {
      -[NSInputStream setProperty:forKey:]( self->_inputStream,  "setProperty:forKey:",  &off_1005F7978,  _kCFStreamPropertySSLClientSideAuthentication);
    }
    -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", self);
    -[NSInputStream open](self->_inputStream, "open");
  }

  if (!-[NSOutputStream streamStatus](self->_outputStream, "streamStatus"))
  {
    -[SDStreamHandler applySSLSettings:](self, "applySSLSettings:", self->_outputStream);
    outputStream = self->_outputStream;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    -[NSOutputStream scheduleInRunLoop:forMode:](outputStream, "scheduleInRunLoop:forMode:", v6, NSDefaultRunLoopMode);

    -[NSOutputStream setProperty:forKey:]( self->_outputStream,  "setProperty:forKey:",  &__kCFBooleanFalse,  kCFStreamPropertyAutoErrorOnSystemChange);
    -[NSOutputStream setProperty:forKey:]( self->_outputStream,  "setProperty:forKey:",  &__kCFBooleanTrue,  kCFStreamPropertyIndefiniteConnection);
    if (!self->_client) {
      -[NSInputStream setProperty:forKey:]( self->_inputStream,  "setProperty:forKey:",  &off_1005F7978,  _kCFStreamPropertySSLClientSideAuthentication);
    }
    -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", self);
    -[NSOutputStream open](self->_outputStream, "open");
  }

  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  timeToOpen = self->_timeToOpen;
  self->_timeToOpen = v7;

  if (!self->_registeredStreams)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
    [v9 registerConnectedStreams];

    self->_registeredStreams = 1;
  }

  id v10 = -[SDStreamHandler startOpenTimer](self, "startOpenTimer");
  uint64_t v12 = streams_log(v10, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating network streams", v14, 2u);
  }
}

- (void)stop
{
  if (-[SDStreamHandler usingMessages](self, "usingMessages"))
  {
    -[SDStreamHandler _stop](self, "_stop");
  }

  else
  {
    self->_shouldStop = 1;
    -[SDStreamHandler stopIfReady](self, "stopIfReady");
  }

- (void)stopIfReady
{
  if (self->_shouldStop && !-[NSMutableData length](self->_outputStreamData, "length")) {
    -[SDStreamHandler _stop](self, "_stop");
  }
}

- (void)_stop
{
  if (self->_inputStream)
  {
    uint64_t v3 = streams_log(self, a2);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ Closing input stream",  (uint8_t *)&v20,  0xCu);
    }

    -[NSInputStream close](self->_inputStream, "close");
    -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", 0LL);
    inputStream = self->_inputStream;
    self->_inputStream = 0LL;
  }

  outputStream = self->_outputStream;
  if (outputStream)
  {
    -[NSOutputStream close](outputStream, "close");
    id v7 = -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", 0LL);
    uint64_t v9 = streams_log(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ Closing output stream",  (uint8_t *)&v20,  0xCu);
    }

    uint64_t v11 = self->_outputStream;
    self->_outputStream = 0LL;
  }

  if (self->_registeredStreams)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
    [v12 unregisterConnectedStreams];

    self->_registeredStreams = 0;
  }

  id v13 = -[SDStreamHandler logTransfer](self, "logTransfer");
  uint64_t v15 = streams_log(v13, v14);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Network streams closed", (uint8_t *)&v20, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v18 = objc_opt_respondsToSelector(WeakRetained, "streamHandlerDidClose:withError:");

  if ((v18 & 1) != 0)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 streamHandlerDidClose:self withError:self->_streamError];
  }

- (BOOL)shouldReadNetwork
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL shouldReadNetwork = v2->_shouldReadNetwork;
  objc_sync_exit(v2);

  return shouldReadNetwork;
}

- (void)setShouldReadNetwork:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL shouldReadNetwork = v3;
  if (v3
    && -[NSInputStream hasBytesAvailable](obj->_inputStream, "hasBytesAvailable")
    && !-[SDStreamHandler usingMessages](obj, "usingMessages"))
  {
    -[SDStreamHandler handleBytesForStream](obj, "handleBytesForStream");
  }

  objc_sync_exit(obj);
}

- (void)logTransfer
{
  int64_t wroteToNetwork = self->_wroteToNetwork;
  int64_t readFromNetwork = self->_readFromNetwork;
  if (self->_timeOpened)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 timeIntervalSinceDate:self->_timeOpened];
    double v7 = v6;
  }

  else
  {
    double v7 = 0.0;
  }

  if (!self->_loggedTransfer)
  {
    uint64_t v8 = readFromNetwork + wroteToNetwork;
    BOOL v9 = !self->_bundleID || v8 == 0;
    if (!v9 && v7 != 0.0)
    {
      uint64_t v10 = streams_log(self, a2);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", &stru_1005E3958);
        char v13 = v12;
        if (v12) {
          bundleID = self->_bundleID;
        }
        else {
          bundleID = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", bundleID = %@",  self->_bundleID));
        }
        *(_DWORD *)buf = 134218498;
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        double v18 = v7;
        __int16 v19 = 2112;
        int v20 = bundleID;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stream Stats: total bytes transferred = %ld, duration = %g%@",  buf,  0x20u);
        if ((v13 & 1) == 0) {
      }
        }

      sub_10002FDEC((__CFString *)self->_bundleID, v8, v7);
      self->_loggedTransfer = 1;
    }
  }

- (void)startOpenTimer
{
  uint64_t v3 = streams_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = 30;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting open timer with timeout = %d",  (uint8_t *)v7,  8u);
  }

  objc_super v5 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "openTimerFired:",  0LL,  0LL,  30.0));
  openTimer = self->_openTimer;
  self->_openTimer = v5;
}

- (void)openTimerFired:(id)a3
{
  id v4 = -[NSInputStream streamStatus](self->_inputStream, "streamStatus", a3);
  if (!v4
    || (id v4 = -[NSInputStream streamStatus](self->_inputStream, "streamStatus"), v4 == (id)1)
    || (id v4 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus")) == 0LL
    || (id v4 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus"), v4 == (id)1))
  {
    uint64_t v6 = streams_log(v4, v5);
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = -[NSInputStream streamStatus](self->_inputStream, "streamStatus");
      unsigned int v9 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
      *(_DWORD *)buf = 67109376;
      unsigned int v17 = v8;
      __int16 v18 = 1024;
      unsigned int v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Open timer fired with input stream status = %d, output stream status = %d, closing streams",  buf,  0xEu);
    }

    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    uint64_t v15 = @"Connection timed out";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v11 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  60LL,  v10));
    streamError = self->_streamError;
    self->_streamError = v11;

    -[SDStreamHandler _stop](self, "_stop");
  }

  openTimer = self->_openTimer;
  self->_openTimer = 0LL;
}

- (void)invalidateOpenTimer
{
  if (self->_openTimer)
  {
    uint64_t v3 = streams_log(self, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Streams invalidating open timer", v6, 2u);
    }

    -[NSTimer invalidate](self->_openTimer, "invalidate");
    openTimer = self->_openTimer;
    self->_openTimer = 0LL;
  }

- (void)applySSLSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v6 = [v5 disableContinuityTLS];

  if ((v6 & 1) == 0)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v8 = [v7 copyMyAppleIDSecIdentity];

    if (v8)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      id v12 = [v11 copyMyAppleIDIntermediateCertificate];

      if (v12)
      {
        v29[0] = v8;
        v29[1] = v12;
        char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v29,  2LL));
        v27[0] = kCFStreamSSLLevel;
        v27[1] = kCFStreamSSLCertificates;
        v28[0] = kCFStreamSocketSecurityLevelTLSv1;
        v28[1] = v13;
        v27[2] = kCFStreamSSLValidatesCertificateChain;
        v27[3] = kCFStreamSSLIsServer;
        if (self->_client) {
          CFBooleanRef v14 = kCFBooleanFalse;
        }
        else {
          CFBooleanRef v14 = kCFBooleanTrue;
        }
        v28[2] = kCFBooleanFalse;
        v28[3] = v14;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  4LL));
        uint64_t v17 = streams_log(v15, v16);
        __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Applying tls settings", v26, 2u);
        }

        [v4 setProperty:v15 forKey:kCFStreamPropertySSLSettings];
        CFRelease(v12);
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 myAppleID]);
        SFMetricsLogUnexpectedEvent(7LL, 1LL, v22);

        uint64_t v25 = streams_log(v23, v24);
        char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000EB4F0();
        }
      }

      CFRelease(v8);
    }

    else
    {
      uint64_t v19 = streams_log(v9, v10);
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000EB4C4();
      }
    }
  }
}

- (BOOL)evaluateCert
{
  v2 = (__SecTrust *)-[NSInputStream propertyForKey:]( self->_inputStream,  "propertyForKey:",  kCFStreamPropertySSLPeerTrust);
  if (v2)
  {
    id v4 = sub_100035290(v2);
    if (-[__CFArray count](v4, "count"))
    {
      int v45 = 0;
      uint64_t v6 = SFAppleIDVerifyCertificateChainSync(v4, &v45);
      if ((_DWORD)v6) {
        BOOL v8 = v45 == 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (!v8)
      {
        uint64_t v9 = streams_log(v6, v7);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000EB634((uint64_t)&v45, v10, v11, v12, v13, v14, v15, v16);
        }
        BOOL v17 = 0;
        goto LABEL_32;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0LL));

      id v44 = 0LL;
      int v22 = SFAppleIDCommonNameForCertificate(v21, &v44);
      uint64_t v23 = (os_log_s *)v44;
      uint64_t v10 = v23;
      int v45 = v22;
      if (v22)
      {
        uint64_t v25 = streams_log(v23, v24);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000EB5CC((uint64_t)&v45, v26, v27, v28, v29, v30, v31, v32);
        }
        BOOL v17 = 0;
        goto LABEL_31;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 myAppleIDCommonName]);

      if (-[os_log_s length](v26, "length"))
      {
        id v35 = -[os_log_s isEqualToString:](v10, "isEqualToString:", v26);
        int v36 = (int)v35;
        uint64_t v38 = streams_log(v35, v37);
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        v40 = v39;
        if (v36)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Accounts match", v43, 2u);
          }

          BOOL v17 = 1;
          goto LABEL_30;
        }

        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_1000EB5A0();
        }
      }

      else
      {
        uint64_t v41 = streams_log(0LL, v34);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_1000EB574();
        }
      }

      BOOL v17 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }

    uint64_t v19 = streams_log(0LL, v5);
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000EB548();
    }
  }

  else
  {
    uint64_t v18 = streams_log(0LL, v3);
    id v4 = (__CFArray *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000EB51C();
    }
  }

  BOOL v17 = 0;
LABEL_33:

  return v17;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  BOOL v8 = v6;
  switch(a4)
  {
    case 1uLL:
      -[SDStreamHandler handleOpenedStream:](self, "handleOpenedStream:", v6);
      break;
    case 2uLL:
      -[SDStreamHandler handleBytesAvailable](self, "handleBytesAvailable");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      -[SDStreamHandler handleSpaceAvailable](self, "handleSpaceAvailable");
      break;
    case 8uLL:
      uint64_t v11 = streams_log(v6, v7);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000EB69C(v8);
      }

      uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue([v8 streamError]);
      streamError = self->_streamError;
      self->_streamError = v13;

      goto LABEL_12;
    default:
      if (a4 == 16)
      {
        uint64_t v9 = streams_log(v6, v7);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Stream end encountered, closing streams",  v15,  2u);
        }

LABEL_12:
        -[SDStreamHandler _stop](self, "_stop");
      }

      break;
  }
}

- (void)setTCPProperties:(id)a3
{
  int v17 = -1;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 propertyForKey:kCFStreamPropertySocketNativeHandle]);
  [v3 getBytes:&v17 length:4];
  if (v17 < 0)
  {
    uint64_t v9 = streams_log(v17, v4);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000EB780((uint64_t)&v17, v8, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_7;
  }

  int v16 = 0x4000;
  uint64_t v5 = setsockopt(v17, 6, 513, &v16, 4u);
  if ((_DWORD)v5 == -1)
  {
    uint64_t v7 = streams_log(v5, v6);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000EB714();
    }
LABEL_7:
  }
}

- (void)handleOpenedStream:(id)a3
{
  id v4 = a3;
  if ((unint64_t)-[NSInputStream streamStatus](self->_inputStream, "streamStatus") >= 2)
  {
    id v5 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
    if ((unint64_t)v5 >= 2)
    {
      uint64_t v7 = streams_log(v5, v6);
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Network streams opened",  (uint8_t *)&v18,  2u);
      }

      if (!self->_timeOpened)
      {
        uint64_t v11 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        timeOpened = self->_timeOpened;
        self->_timeOpened = v11;
      }

      if (self->_timeToOpen)
      {
        uint64_t v13 = streams_log(v9, v10);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v15 timeIntervalSinceDate:self->_timeToOpen];
          int v18 = 134217984;
          uint64_t v19 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Time to open streams = %f",  (uint8_t *)&v18,  0xCu);
        }

        timeToOpen = self->_timeToOpen;
        self->_timeToOpen = 0LL;
      }

      -[SDStreamHandler invalidateOpenTimer](self, "invalidateOpenTimer");
    }
  }
}

- (void)handleBytesAvailable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ([v3 disableContinuityTLS])
  {

LABEL_5:
    if (-[SDStreamHandler usingMessages](self, "usingMessages")) {
      -[SDStreamHandler handleBytesForMessage](self, "handleBytesForMessage");
    }
    else {
      -[SDStreamHandler handleBytesForStream](self, "handleBytesForStream");
    }
    return;
  }

  unsigned __int8 v4 = -[SDStreamHandler checkedCert](self, "checkedCert");

  if ((v4 & 1) != 0) {
    goto LABEL_5;
  }
  -[SDStreamHandler setCheckedCert:](self, "setCheckedCert:", 1LL);
  BOOL v5 = -[SDStreamHandler evaluateCert](self, "evaluateCert");
  if (v5) {
    goto LABEL_5;
  }
  uint64_t v7 = streams_log(v5, v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000EB7E8();
  }

  -[SDStreamHandler _stop](self, "_stop");
}

- (void)handleSpaceAvailable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ([v3 disableContinuityTLS])
  {

LABEL_5:
    if (-[SDStreamHandler usingMessages](self, "usingMessages")) {
      -[SDStreamHandler handleSpaceForMessage](self, "handleSpaceForMessage");
    }
    else {
      -[SDStreamHandler handleSpaceForStream](self, "handleSpaceForStream");
    }
    return;
  }

  unsigned __int8 v4 = -[SDStreamHandler checkedCert](self, "checkedCert");

  if ((v4 & 1) != 0) {
    goto LABEL_5;
  }
  -[SDStreamHandler setCheckedCert:](self, "setCheckedCert:", 1LL);
  BOOL v5 = -[SDStreamHandler evaluateCert](self, "evaluateCert");
  if (v5) {
    goto LABEL_5;
  }
  uint64_t v7 = streams_log(v5, v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000EB7E8();
  }

  -[SDStreamHandler _stop](self, "_stop");
}

- (void)writeToStreamWithData:(id)a3
{
  if (self->_bufferSpaceAvailable && -[NSMutableData length](self->_outputStreamData, "length") > 0x20000)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector(WeakRetained, "streamHandler:bufferSpaceChanged:");

    if ((v5 & 1) != 0)
    {
      self->_bufferSpaceAvailable = 0;
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 streamHandler:self bufferSpaceChanged:0];
    }
  }

  if (-[SDStreamHandler usingMessages](self, "usingMessages")
    || !-[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v8 = [v7 enableStreamDebugging];

    if (v8)
    {
      uint64_t v11 = streams_log(v9, v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No space available on network output stream, queuing stream data",  v13,  2u);
      }
    }
  }

  else
  {
    -[SDStreamHandler handleSpaceForStream](self, "handleSpaceForStream");
  }

- (void)handleBytesForStream
{
  BOOL v3 = -[SDStreamHandler shouldReadNetwork](self, "shouldReadNetwork");
  if (v3)
  {
    bzero(buf, 0x8000uLL);
    uint64_t v5 = -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", buf, 0x8000LL);
    if (v5 < 1)
    {
      uint64_t v16 = streams_log(v5, v6);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000EB86C();
      }
    }

    else
    {
      uint64_t v7 = v5;
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, v5));
      if (v9)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v11 = objc_opt_respondsToSelector(WeakRetained, "streamHandler:didReceiveStreamData:");

        if ((v11 & 1) != 0)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_delegate);
          [v14 streamHandler:self didReceiveStreamData:v9];
        }

        else
        {
          uint64_t v18 = streams_log(v12, v13);
          id v14 = (id)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
            sub_1000EB840();
          }
        }
      }

      else
      {
        uint64_t v17 = streams_log(0LL, v8);
        id v14 = (id)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
          sub_1000EB814();
        }
      }

      self->_readFromNetwork += v7;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      unsigned int v20 = [v19 enableStreamDebugging];

      if (v20)
      {
        uint64_t v23 = streams_log(v21, v22);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int64_t readFromNetwork = self->_readFromNetwork;
          int v26 = 134217984;
          int64_t v27 = readFromNetwork;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Total read from network = %ld",  (uint8_t *)&v26,  0xCu);
        }
      }
    }
  }

  else
  {
    uint64_t v15 = streams_log(v3, v4);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client buffer full, waiting to read from network",  buf,  2u);
    }
  }
}

- (void)handleSpaceForStream
{
  if (-[NSMutableData length](self->_outputStreamData, "length"))
  {
    uint64_t v3 = -[NSOutputStream write:maxLength:]( self->_outputStream,  "write:maxLength:",  -[NSMutableData bytes](self->_outputStreamData, "bytes"),  -[NSMutableData length](self->_outputStreamData, "length"));
    uint64_t v5 = v3;
    if (v3 < 1)
    {
      uint64_t v24 = streams_log(v3, v4);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000EB898();
      }
    }

    else
    {
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableData subdataWithRange:]( self->_outputStreamData,  "subdataWithRange:",  v3,  (char *)-[NSMutableData length](self->_outputStreamData, "length") - v3));
      uint64_t v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v6));
      outputStreamData = self->_outputStreamData;
      self->_outputStreamData = v7;

      if (!self->_bufferSpaceAvailable && -[NSMutableData length](self->_outputStreamData, "length") >> 15 <= 2)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v10 = objc_opt_respondsToSelector(WeakRetained, "streamHandler:bufferSpaceChanged:");

        if ((v10 & 1) != 0)
        {
          self->_bufferSpaceAvailable = 1;
          id v11 = objc_loadWeakRetained((id *)&self->_delegate);
          [v11 streamHandler:self bufferSpaceChanged:1];
        }
      }

      self->_wroteToNetwork += v5;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      unsigned int v13 = [v12 enableStreamDebugging];

      if (v13)
      {
        uint64_t v16 = streams_log(v14, v15);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int64_t wroteToNetwork = self->_wroteToNetwork;
          int v25 = 134217984;
          int64_t v26 = wroteToNetwork;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Total written to network = %ld",  (uint8_t *)&v25,  0xCu);
        }
      }

      -[SDStreamHandler stopIfReady](self, "stopIfReady");
    }
  }

  else
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v20 = [v19 enableStreamDebugging];

    if (!v20) {
      return;
    }
    uint64_t v23 = streams_log(v21, v22);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No output stream data to write to network",  (uint8_t *)&v25,  2u);
    }
  }
}

- (void)sendMessage:(id)a3 withErrorHandler:(id)a4
{
  uint64_t v4 = streams_log(self, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000EB908();
  }
}

- (void)sendMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (-[SDStreamHandler usingMessages](self, "usingMessages"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDStreamHandler messageWithData:](self, "messageWithData:", v6));
    if (!v9)
    {
      uint64_t v14 = streams_log(0LL, v8);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000EB934();
      }

      if (v7)
      {
        NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
        uint64_t v23 = @"Could not create message payload";
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  91LL,  v16));
        v7[2](v7, 0LL, v17);
      }

      goto LABEL_8;
    }

    -[NSMutableArray addObject:](self->_messageQueue, "addObject:", v9);
    id v10 = [v7 copy];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_handlers, "setObject:forKeyedSubscript:", v10, v9);

    BOOL v11 = -[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable");
    if (v11)
    {
      -[SDStreamHandler handleSpaceForMessage](self, "handleSpaceForMessage");
LABEL_8:

      goto LABEL_9;
    }

    uint64_t v18 = streams_log(v11, v12);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No space available on network output stream, queuing message",  (uint8_t *)&v19,  2u);
    }

- (id)messageWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStreamHandler headerWithLength:](self, "headerWithLength:", [v4 length]));
  [v5 appendData:v4];

  return v5;
}

- (id)headerWithLength:(unsigned int)a3
{
  char v7 = 1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", &v7, 1LL));
  unsigned int v6 = bswap32(a3);
  [v4 appendBytes:&v6 length:4];
  return v4;
}

- (void)handleBytesForMessage
{
  unint64_t inputState = self->_inputState;
  if (inputState)
  {
    if (inputState != 1)
    {
      uint64_t v20 = streams_log(self, a2);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000EB960();
      }

      return;
    }

    int64_t bytesRead = self->_bytesRead;
    int64_t v5 = bytesRead + 0x8000;
    int64_t inMessageLength = self->_inMessageLength;
    size_t v7 = inMessageLength - bytesRead;
    if (v5 <= inMessageLength) {
      size_t v8 = 0x8000LL;
    }
    else {
      size_t v8 = v7;
    }
  }

  else
  {
    size_t v8 = 5LL;
  }

  uint64_t v9 = &buf[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  bzero(v9, v8);
  uint64_t v10 = -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", v9, v8);
  unint64_t v12 = v10;
  if (v10 < 1)
  {
    uint64_t v22 = streams_log(v10, v11);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if ((v12 & 0x8000000000000000LL) != 0)
    {
      if (v24) {
        sub_1000EB9B8();
      }

      goto LABEL_34;
    }

    if (v24) {
      sub_1000EBA24();
    }
  }

  else
  {
    id v13 = -[NSMutableData appendBytes:length:](self->_inData, "appendBytes:length:", v9, v10);
    self->_bytesRead += v12;
    uint64_t v15 = streams_log(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v17 = self->_bytesRead;
      unsigned int v18 = self->_inMessageLength;
      __int16 v19 = v18
          ? (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" , expected = %d",  self->_inMessageLength))
          : &stru_1005E3958;
      *(_DWORD *)buf = 134218498;
      unint64_t v33 = v12;
      __int16 v34 = 2048;
      int64_t v35 = v17;
      __int16 v36 = 2112;
      uint64_t v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Read chunk = %ld, total = %ld%@", buf, 0x20u);
      if (v18) {
    }
      }

    unint64_t v27 = self->_inputState;
    if (v12 >= 5 && !v27)
    {
      id v25 = -[SDStreamHandler handleHeaderRead](self, "handleHeaderRead");
      unint64_t v27 = self->_inputState;
    }

    if (v27 == 1)
    {
      int64_t v28 = self->_bytesRead;
      int64_t v29 = self->_inMessageLength;
      if (v28 == v29)
      {
        -[SDStreamHandler handleMessageRead](self, "handleMessageRead");
        return;
      }

      if (v28 > v29)
      {
        uint64_t v30 = streams_log(v25, v26);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_1000EB98C();
        }

LABEL_34:
        -[SDStreamHandler _stop](self, "_stop");
      }
    }
  }

- (void)handleHeaderRead
{
  self->_unsigned int inMessageLength = -[SDStreamHandler parseHeader:](self, "parseHeader:", self->_inData);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStreamHandler trimHeader:](self, "trimHeader:", self->_inData));
  id v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v3));
  inData = self->_inData;
  self->_inData = v4;

  self->_bytesRead -= 5LL;
  self->_unint64_t inputState = 1LL;
  uint64_t v8 = streams_log(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int inMessageLength = self->_inMessageLength;
    v11[0] = 67109120;
    v11[1] = inMessageLength;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Expected message length = %d",  (uint8_t *)v11,  8u);
  }
}

- (void)handleMessageRead
{
  uint64_t v3 = (NSData *)-[NSMutableData copy](self->_inData, "copy");
  inMessage = self->_inMessage;
  self->_inMessage = v3;

  -[SDStreamHandler resetReadState](self, "resetReadState");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained streamHandler:self didReceiveMessage:self->_inMessage];
}

- (void)resetReadState
{
  self->_int64_t bytesRead = 0LL;
  self->_unsigned int inMessageLength = 0;
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  inData = self->_inData;
  self->_inData = v3;

  self->_unint64_t inputState = 0LL;
}

- (void)handleSpaceForMessage
{
  if (-[NSMutableArray count](self->_messageQueue, "count"))
  {
    p_outMessage = &self->_outMessage;
    outMessage = self->_outMessage;
    if (!outMessage)
    {
      uint64_t v6 = (NSMutableData *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_messageQueue,  "objectAtIndexedSubscript:",  0LL));
      uint64_t v7 = self->_outMessage;
      self->_outMessage = v6;

      outMessage = self->_outMessage;
    }

    p_byteIndex = &self->_byteIndex;
    uint64_t v9 = (char *)-[NSMutableData mutableBytes](outMessage, "mutableBytes") + self->_byteIndex;
    NSUInteger v10 = -[NSMutableData length](self->_outMessage, "length");
    NSUInteger v11 = v10;
    if (v10 - self->_byteIndex >= 0x8000) {
      size_t v12 = 0x8000LL;
    }
    else {
      size_t v12 = v10 - *p_byteIndex;
    }
    id v13 = (char *)&v43 - (((_DWORD)v12 + 15) & 0x1FFF0);
    bzero(v13, v12);
    memcpy(v13, v9, v12);
    uint64_t v14 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", v13, v12);
    uint64_t v16 = v14;
    if (v14 >= 1)
    {
      id v17 = (id)(*p_byteIndex + v14);
      int64_t *p_byteIndex = (int64_t)v17;
      id v18 = -[NSMutableData length](*p_outMessage, "length");
      if (v17 == v18)
      {
        uint64_t v20 = streams_log(v18, v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          NSUInteger v50 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Finished writing message of size = %lu",  buf,  0xCu);
        }

        -[SDStreamHandler handleMessageWritten:](self, "handleMessageWritten:", 0LL);
        return;
      }

      unint64_t v30 = *p_byteIndex;
      NSUInteger v31 = -[NSMutableData length](*p_outMessage, "length");
      if (v30 <= v31) {
        return;
      }
      uint64_t v33 = streams_log(v31, v32);
      __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1000EBA50(&self->_byteIndex, (id *)&self->_outMessage, v34);
      }

      NSErrorDomain v27 = NSPOSIXErrorDomain;
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      v48 = @"Wrote more bytes than message contained";
      int64_t v28 = &v48;
      int64_t v29 = &v47;
LABEL_23:
      int64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v29,  1LL,  v43,  v44));
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  94LL,  v35));
      -[SDStreamHandler handleMessageWritten:](self, "handleMessageWritten:", v36);

      return;
    }

    uint64_t v24 = streams_log(v14, v15);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if ((v16 & 0x8000000000000000LL) == 0)
    {
      if (v26) {
        sub_1000EBB50();
      }

      NSErrorDomain v27 = NSPOSIXErrorDomain;
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      id v44 = @"Zero bytes written for message";
      int64_t v28 = &v44;
      int64_t v29 = &v43;
      goto LABEL_23;
    }

    if (v26) {
      sub_1000EBAE4();
    }

    uint64_t v37 = *__error();
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    uint64_t v38 = __error();
    v39 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", strerror(*v38));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v46 = v40;
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v37,  v41));
    -[SDStreamHandler handleMessageWritten:](self, "handleMessageWritten:", v42);
  }

  else
  {
    uint64_t v22 = streams_log(0LL, v3);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No messages to write in queue", buf, 2u);
    }
  }

- (void)handleMessageWritten:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_handlers, "objectForKeyedSubscript:", self->_outMessage));
  uint64_t v7 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4 == 0LL, v4);
    -[NSMutableDictionary removeObjectForKey:](self->_handlers, "removeObjectForKey:", self->_outMessage);
  }

  else
  {
    uint64_t v8 = streams_log(0LL, v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000EBB7C();
    }
  }

  outMessage = self->_outMessage;
  self->_outMessage = 0LL;

  -[NSMutableArray removeObjectAtIndex:](self->_messageQueue, "removeObjectAtIndex:", 0LL);
  self->_byteIndex = 0LL;
}

- (unsigned)parseHeader:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bytes];
  if (*v4 == 1)
  {
    unsigned int v6 = bswap32(*(_DWORD *)((char *)[v3 bytes] + 1));
  }

  else
  {
    uint64_t v7 = streams_log(v4, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000EBBA8();
    }

    unsigned int v6 = -1;
  }

  return v6;
}

- (id)trimHeader:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 5, (char *)objc_msgSend(v3, "length") - 5));

  return v4;
}

- (BOOL)usingMessages
{
  return self->_usingMessages;
}

- (void)setUsingMessages:(BOOL)a3
{
  self->_usingMessages = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (SDStreamHandlerDelegate)delegate
{
  return (SDStreamHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSInputStream)inputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOutputStream:(id)a3
{
}

- (BOOL)checkedCert
{
  return self->_checkedCert;
}

- (void)setCheckedCert:(BOOL)a3
{
  self->_checkedCert = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)registeredStreams
{
  return self->_registeredStreams;
}

- (void)setRegisteredStreams:(BOOL)a3
{
  self->_registeredStreams = a3;
}

- (BOOL)bufferSpaceAvailable
{
  return self->_bufferSpaceAvailable;
}

- (void)setBufferSpaceAvailable:(BOOL)a3
{
  self->_bufferSpaceAvailable = a3;
}

- (NSTimer)openTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setOpenTimer:(id)a3
{
}

- (BOOL)isClient
{
  return self->_client;
}

- (void)setClient:(BOOL)a3
{
  self->_client = a3;
}

- (NSError)streamError
{
  return (NSError *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setStreamError:(id)a3
{
}

- (NSMutableData)outputStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOutputStreamData:(id)a3
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

- (NSMutableData)outMessage
{
  return (NSMutableData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOutMessage:(id)a3
{
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setHandlers:(id)a3
{
}

- (int64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(int64_t)a3
{
  self->_int64_t bytesRead = a3;
}

- (unsigned)inMessageLength
{
  return self->_inMessageLength;
}

- (void)setInMessageLength:(unsigned int)a3
{
  self->_unsigned int inMessageLength = a3;
}

- (NSData)inMessage
{
  return (NSData *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setInMessage:(id)a3
{
}

- (NSMutableData)inData
{
  return (NSMutableData *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setInData:(id)a3
{
}

- (unint64_t)inputState
{
  return self->_inputState;
}

- (void)setInputState:(unint64_t)a3
{
  self->_unint64_t inputState = a3;
}

- (BOOL)loggedTransfer
{
  return self->_loggedTransfer;
}

- (void)setLoggedTransfer:(BOOL)a3
{
  self->_loggedTransfer = a3;
}

- (int64_t)wroteToNetwork
{
  return self->_wroteToNetwork;
}

- (void)setWroteToNetwork:(int64_t)a3
{
  self->_int64_t wroteToNetwork = a3;
}

- (int64_t)readFromNetwork
{
  return self->_readFromNetwork;
}

- (void)setReadFromNetwork:(int64_t)a3
{
  self->_int64_t readFromNetwork = a3;
}

- (NSDate)timeOpened
{
  return (NSDate *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setTimeOpened:(id)a3
{
}

- (NSDate)timeToOpen
{
  return (NSDate *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setTimeToOpen:(id)a3
{
}

- (void).cxx_destruct
{
}

@end