@interface SDCompanionStream
- (BOOL)clientReceived;
- (BOOL)clientSent;
- (BOOL)initiator;
- (BOOL)networkBufferSpaceAvailable;
- (BOOL)shouldStop;
- (NSData)authorData;
- (NSFileHandle)fileHandle;
- (NSInputStream)clientInputStream;
- (NSMutableData)clientStreamData;
- (NSMutableData)networkStreamData;
- (NSNetServiceBrowser)netServiceBrowser;
- (NSOutputStream)clientOutputStream;
- (NSString)identifier;
- (OS_dispatch_queue)readQueue;
- (OS_dispatch_queue)writeQueue;
- (SDCompanionStream)initWithAuthorData:(id)a3 streamHandler:(id)a4;
- (SDCompanionStream)initWithStreamHandler:(id)a3;
- (SDCompanionStreamDelegate)delegate;
- (SDStreamHandler)streamHandler;
- (id)streamsRequestHandler;
- (int)setBufferSize:(int)a3 socket:(int)a4;
- (int64_t)readFromClient;
- (int64_t)wroteToClient;
- (void)dealloc;
- (void)getStreamsWithCompletionHandler:(id)a3;
- (void)handleOpenedStream;
- (void)handleStreamRequest:(id)a3;
- (void)handleStreamResponse:(id)a3;
- (void)logClientReceived;
- (void)logClientSent;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)notifyStreamRequestWithError:(id)a3;
- (void)readClientStream;
- (void)sendInitialRequest;
- (void)sendInitialResponse:(BOOL)a3;
- (void)setAuthorData:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientInputStream:(id)a3;
- (void)setClientOutputStream:(id)a3;
- (void)setClientReceived:(BOOL)a3;
- (void)setClientSent:(BOOL)a3;
- (void)setClientStreamData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setNetServiceBrowser:(id)a3;
- (void)setNetworkBufferSpaceAvailable:(BOOL)a3;
- (void)setNetworkStreamData:(id)a3;
- (void)setReadFromClient:(int64_t)a3;
- (void)setReadQueue:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamsRequestHandler:(id)a3;
- (void)setWriteQueue:(id)a3;
- (void)setWroteToClient:(int64_t)a3;
- (void)start;
- (void)startBrowser;
- (void)stop;
- (void)stopIfReady;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)streamHandler:(id)a3 bufferSpaceChanged:(BOOL)a4;
- (void)streamHandler:(id)a3 didReceiveMessage:(id)a4;
- (void)streamHandler:(id)a3 didReceiveStreamData:(id)a4;
- (void)streamHandlerDidClose:(id)a3 withError:(id)a4;
- (void)switchToStreaming;
- (void)writeClientStream;
- (void)writeNetworkStream;
@end

@implementation SDCompanionStream

- (SDCompanionStream)initWithStreamHandler:(id)a3
{
  return -[SDCompanionStream initWithAuthorData:streamHandler:](self, "initWithAuthorData:streamHandler:", 0LL, a3);
}

- (SDCompanionStream)initWithAuthorData:(id)a3 streamHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SDCompanionStream;
  v9 = -[SDCompanionStream init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorData, a3);
    objc_storeStrong((id *)&v10->_streamHandler, a4);
    *(_WORD *)&v10->_initiator = 0;
    v10->_clientSent = 0;
    identifier = v10->_identifier;
    v10->_identifier = 0LL;

    v10->_clientReceived = 0;
    netServiceBrowser = v10->_netServiceBrowser;
    v10->_netServiceBrowser = 0LL;

    v10->_networkBufferSpaceAvailable = 1;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    clientStreamData = v10->_clientStreamData;
    v10->_clientStreamData = (NSMutableData *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    networkStreamData = v10->_networkStreamData;
    v10->_networkStreamData = (NSMutableData *)v15;

    v10->_readFromClient = 0LL;
    v10->_wroteToClient = 0LL;
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDCompanionStream;
  -[SDCompanionStream dealloc](&v3, "dealloc");
}

- (void)start
{
}

- (void)stop
{
  v2 = self;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream streamHandler](v2, "streamHandler"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream streamHandler](v2, "streamHandler"));
    [v4 stop];
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientInputStream](v2, "clientInputStream"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientInputStream](v2, "clientInputStream"));
    [v6 close];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientInputStream](v2, "clientInputStream"));
    [v7 setDelegate:0];

    -[SDCompanionStream setClientInputStream:](v2, "setClientInputStream:", 0LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientOutputStream](v2, "clientOutputStream"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientOutputStream](v2, "clientOutputStream"));
    [v9 close];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream clientOutputStream](v2, "clientOutputStream"));
    [v10 setDelegate:0];

    -[SDCompanionStream setClientOutputStream:](v2, "setClientOutputStream:", 0LL);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream netServiceBrowser](v2, "netServiceBrowser"));

  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream netServiceBrowser](v2, "netServiceBrowser"));
    [v14 stop];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream netServiceBrowser](v2, "netServiceBrowser"));
    [v15 setDelegate:0];

    id v16 = -[SDCompanionStream setNetServiceBrowser:](v2, "setNetServiceBrowser:", 0LL);
    uint64_t v18 = streams_log(v16, v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Stopped net service browser", buf, 2u);
    }
  }

  uint64_t v20 = streams_log(v12, v13);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Client streams closed", v25, 2u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream streamHandler](v2, "streamHandler"));
  if (v22) {
    goto LABEL_16;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream delegate](v2, "delegate"));
  char v24 = objc_opt_respondsToSelector(v23, "companionStreamClosedStreams:");

  if ((v24 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream delegate](v2, "delegate"));
    [v22 companionStreamClosedStreams:v2];
LABEL_16:
  }
}

- (void)stopIfReady
{
  if (self->_shouldStop && !-[NSMutableData length](self->_networkStreamData, "length")) {
    -[SDCompanionStream stop](self, "stop");
  }
}

- (void)setBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 hasPrefix:@"com.apple."];
  if ((_DWORD)v5)
  {
    -[SDStreamHandler setBundleID:](self->_streamHandler, "setBundleID:", v4);
  }

  else
  {
    uint64_t v7 = streams_log(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Third party app client", v9, 2u);
    }
  }
}

- (void)getStreamsWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id streamsRequestHandler = self->_streamsRequestHandler;
  self->_id streamsRequestHandler = v4;

  -[SDCompanionStream sendInitialRequest](self, "sendInitialRequest");
  -[SDCompanionStream startBrowser](self, "startBrowser");
  self->_initiator = 1;
}

- (void)startBrowser
{
  if (!self->_netServiceBrowser)
  {
    objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSNetServiceBrowser);
    netServiceBrowser = self->_netServiceBrowser;
    self->_netServiceBrowser = v3;

    -[NSNetServiceBrowser setDelegate:](self->_netServiceBrowser, "setDelegate:", self);
    -[NSNetServiceBrowser _setIncludesAWDL:](self->_netServiceBrowser, "_setIncludesAWDL:", 1LL);
    id v5 = -[NSNetServiceBrowser searchForServicesOfType:inDomain:]( self->_netServiceBrowser,  "searchForServicesOfType:inDomain:",  @"_continuity._tcp.",  @"local.");
    uint64_t v7 = streams_log(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Started net service browser", v9, 2u);
    }
  }

- (void)sendInitialRequest
{
  uint64_t v3 = streams_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending initial request", buf, 2u);
  }

  v11[0] = @"StreamMessageType";
  v11[1] = @"StreamMessageVersion";
  v12[0] = &off_1005F7A20;
  v12[1] = &off_1005F7A38;
  v11[2] = @"RequestAuthorData";
  v12[2] = self->_authorData;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  uint64_t v6 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v6, "encodeObject:forKey:", v5, NSKeyedArchiveRootObjectKey);
  streamHandler = self->_streamHandler;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v6, "encodedData"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100130A88;
  v9[3] = &unk_1005CB4E8;
  v9[4] = self;
  -[SDStreamHandler sendMessage:withCompletionHandler:](streamHandler, "sendMessage:withCompletionHandler:", v8, v9);
}

- (void)sendInitialResponse:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = streams_log(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending initial streams response (accepted = %@)",  buf,  0xCu);
  }

  v16[0] = &off_1005F7A50;
  v15[0] = @"StreamMessageType";
  v15[1] = @"StreamMessageVersion";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
  v16[1] = v8;
  v15[2] = @"CompanionStreamConnectResponse";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  v16[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));

  v11 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v11, "encodeObject:forKey:", v10, NSKeyedArchiveRootObjectKey);
  streamHandler = self->_streamHandler;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v11, "encodedData"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100130DA0;
  v14[3] = &unk_1005CB4E8;
  v14[4] = self;
  -[SDStreamHandler sendMessage:withCompletionHandler:](streamHandler, "sendMessage:withCompletionHandler:", v13, v14);
}

- (void)switchToStreaming
{
  uint64_t v3 = streams_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Switched from messages to Streams", v5, 2u);
  }

  -[SDStreamHandler setUsingMessages:](self->_streamHandler, "setUsingMessages:", 0LL);
  -[SDCompanionStream writeNetworkStream](self, "writeNetworkStream");
}

- (void)notifyStreamRequestWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  if (self->_streamsRequestHandler)
  {
    if (v4)
    {
      uint64_t v7 = streams_log(v4, v5);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001327C8();
      }

      (*((void (**)(void))self->_streamsRequestHandler + 2))();
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream fileHandle](self, "fileHandle"));
      if (v12)
      {
        (*((void (**)(void))self->_streamsRequestHandler + 2))();
      }

      else
      {
        uint64_t v13 = streams_log(0LL, v11);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10013279C();
        }

        id streamsRequestHandler = (void (**)(id, void, void *))self->_streamsRequestHandler;
        NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
        uint64_t v20 = @"Could not create streams";
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  94LL,  v16));
        streamsRequestHandler[2](streamsRequestHandler, 0LL, v17);
      }
    }

    id v10 = self->_streamsRequestHandler;
    self->_id streamsRequestHandler = 0LL;
LABEL_16:

    goto LABEL_17;
  }

  if (self->_initiator)
  {
    uint64_t v9 = streams_log(v4, v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "No handler for stream request",  v18,  2u);
    }

    goto LABEL_16;
  }

- (NSFileHandle)fileHandle
{
  if (self->_fileHandle || self->_clientInputStream || self->_clientOutputStream)
  {
    uint64_t v3 = streams_log(self, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Requested fileHandle more than once.",  (uint8_t *)&v22,  2u);
    }
  }

  else
  {
    *(void *)sock = 0LL;
    uint64_t v6 = socketpair(1, 1, 0, sock);
    if ((_DWORD)v6)
    {
      uint64_t v8 = streams_log(v6, v7);
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100132858(v4);
      }
    }

    else
    {
      uint64_t v9 = -[SDCompanionStream setBufferSize:socket:](self, "setBufferSize:socket:", 0x4000LL, sock[0]);
      if ((_DWORD)v9)
      {
        uint64_t v9 = -[SDCompanionStream setBufferSize:socket:](self, "setBufferSize:socket:", 0x4000LL, sock[1]);
        if ((_DWORD)v9)
        {
          uint64_t v11 = objc_alloc(&OBJC_CLASS___NSFileHandle);
          uint64_t v12 = -[NSFileHandle initWithFileDescriptor:](v11, "initWithFileDescriptor:", sock[0]);
          fileHandle = self->_fileHandle;
          self->_fileHandle = v12;

          CFWriteStreamRef writeStream = 0LL;
          CFReadStreamRef readStream = 0LL;
          CFStreamCreatePairWithSocket(0LL, sock[1], &readStream, &writeStream);
          v14 = kCFStreamPropertyShouldCloseNativeSocket;
          CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
          CFWriteStreamSetProperty(writeStream, v14, kCFBooleanTrue);
          clientInputStream = self->_clientInputStream;
          self->_clientInputStream = (NSInputStream *)readStream;

          id v16 = self->_clientInputStream;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
          -[NSInputStream scheduleInRunLoop:forMode:](v16, "scheduleInRunLoop:forMode:", v17, NSDefaultRunLoopMode);

          v22.version = 0LL;
          v22.info = self;
          v22.retain = (void *(__cdecl *)(void *))&_CFRetain;
          v22.release = (void (__cdecl *)(void *))&_CFRelease;
          v22.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
          CFReadStreamSetClient( (CFReadStreamRef)self->_clientInputStream,  0x1BuLL,  (CFReadStreamClientCallBack)sub_100131328,  &v22);
          -[NSInputStream open](self->_clientInputStream, "open");
          clientOutputStream = self->_clientOutputStream;
          self->_clientOutputStream = (NSOutputStream *)writeStream;

          NSErrorUserInfoKey v19 = self->_clientOutputStream;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
          -[NSOutputStream scheduleInRunLoop:forMode:](v19, "scheduleInRunLoop:forMode:", v20, NSDefaultRunLoopMode);

          -[NSOutputStream setDelegate:](self->_clientOutputStream, "setDelegate:", self);
          -[NSOutputStream open](self->_clientOutputStream, "open");
          return self->_fileHandle;
        }
      }

      uint64_t v21 = streams_log(v9, v10);
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10013282C();
      }
    }
  }

  return self->_fileHandle;
}

- (int)setBufferSize:(int)a3 socket:(int)a4
{
  int v6 = a3;
  int result = setsockopt(a4, 0xFFFF, 4097, &v6, 4u);
  if ((result & 0x80000000) == 0)
  {
    int result = setsockopt(a4, 0xFFFF, 4098, &v6, 4u);
    if (result >= 0) {
      return 1;
    }
  }

  return result;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v5 = a4;
  uint64_t v8 = streams_log(v5, v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Browser found net service = %@",  (uint8_t *)&v10,  0xCu);
  }
}

- (void)streamHandler:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v23 = 0LL;
  uint64_t v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  &v23);

  id v7 = v23;
  uint64_t v8 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___NSString));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v10, objc_opt_class(&OBJC_CLASS___NSData), 0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:]( v6,  "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:",  v9,  v12,  NSKeyedArchiveRootObjectKey));
  uint64_t v15 = v13;
  if (v13)
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"StreamMessageType"]);
    uint64_t v18 = v16;
    if (v16)
    {
      id v19 = -[os_log_s integerValue](v16, "integerValue");
      if (v19 == (id)1)
      {
        -[SDCompanionStream handleStreamResponse:](self, "handleStreamResponse:", v15);
      }

      else if (!v19)
      {
        -[SDCompanionStream handleStreamRequest:](self, "handleStreamRequest:", v15);
      }
    }

    else
    {
      uint64_t v21 = streams_log(0LL, v17);
      CFStreamClientContext v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100132938();
      }
    }
  }

  else
  {
    uint64_t v20 = streams_log(0LL, v14);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001328D4();
    }
  }
}

- (void)handleStreamRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = streams_log(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received request to create streams", buf, 2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestAuthorData"]);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SFCompanionService serviceFromAuthorData:]( &OBJC_CLASS___SFCompanionService,  "serviceFromAuthorData:",  v8));
    uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    identifier = self->_identifier;
    self->_identifier = v10;

    if (v9)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDCompanionStream fileHandle](self, "fileHandle"));
      if (v15)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v17 = objc_opt_respondsToSelector( WeakRetained,  "continuationStream:connectedToService:withFileHandle:acceptHandler:");

        if ((v17 & 1) != 0)
        {
          id v18 = objc_loadWeakRetained((id *)&self->_delegate);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_100131830;
          v23[3] = &unk_1005CB008;
          v23[4] = self;
          [v18 continuationStream:self connectedToService:v9 withFileHandle:v15 acceptHandler:v23];
        }
      }

      else
      {
        uint64_t v21 = streams_log(0LL, v14);
        CFStreamClientContext v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100132990();
        }

        -[SDCompanionStream sendInitialResponse:](self, "sendInitialResponse:", 0LL);
      }
    }

    else
    {
      uint64_t v19 = streams_log(v12, v13);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100132964();
      }

      -[SDCompanionStream sendInitialResponse:](self, "sendInitialResponse:", 0LL);
    }
  }
}

- (void)handleStreamResponse:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CompanionStreamConnectResponse"]);
  uint64_t v6 = streams_log(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v4 BOOLValue];
    uint64_t v9 = @"NO";
    if (v8) {
      uint64_t v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received response to create stream (accepted = %@)",  buf,  0xCu);
  }

  if ([v4 BOOLValue])
  {
    -[SDCompanionStream switchToStreaming](self, "switchToStreaming");
    -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", 0LL);
  }

  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    uint64_t v13 = @"Connection refused";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  61LL,  v10));
    -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", v11);

    -[SDCompanionStream stop](self, "stop");
  }
}

- (void)streamHandler:(id)a3 bufferSpaceChanged:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v6 = -[SDCompanionStream networkBufferSpaceAvailable](self, "networkBufferSpaceAvailable", a3);
  -[SDCompanionStream setNetworkBufferSpaceAvailable:](self, "setNetworkBufferSpaceAvailable:", v4);
  if (v4 && (v6 & 1) == 0)
  {
    if (-[NSInputStream hasBytesAvailable](self->_clientInputStream, "hasBytesAvailable")) {
      -[SDCompanionStream readClientStream](self, "readClientStream");
    }
  }

- (void)streamHandler:(id)a3 didReceiveStreamData:(id)a4
{
  if (-[NSMutableData length](self->_networkStreamData, "length") > 0x20000) {
    -[SDStreamHandler setShouldReadNetwork:](self->_streamHandler, "setShouldReadNetwork:", 0LL);
  }
  -[SDCompanionStream writeClientStream](self, "writeClientStream");
}

- (void)streamHandlerDidClose:(id)a3 withError:(id)a4
{
  id v5 = a4;
  uint64_t v7 = streams_log(v5, v6);
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Stream handler closed with error = %@",  buf,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v10 = [v9 wirelessEnabled];

  if (!v10)
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    char v17 = @"Could not create connection, wireless not enabled";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    NSErrorDomain v12 = NSPOSIXErrorDomain;
    uint64_t v13 = 50LL;
LABEL_8:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  v13,  v11));
    -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", v14);

    goto LABEL_9;
  }

  if (!v5)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    uint64_t v19 = @"Connection lost";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    NSErrorDomain v12 = NSPOSIXErrorDomain;
    uint64_t v13 = 51LL;
    goto LABEL_8;
  }

  -[SDCompanionStream notifyStreamRequestWithError:](self, "notifyStreamRequestWithError:", v5);
LABEL_9:
  -[SDStreamHandler setDelegate:](self->_streamHandler, "setDelegate:", 0LL);
  streamHandler = self->_streamHandler;
  self->_streamHandler = 0LL;

  self->_shouldStop = 1;
  -[SDCompanionStream stopIfReady](self, "stopIfReady");
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v8 = v6;
  switch(a4)
  {
    case 1uLL:
      -[SDCompanionStream handleOpenedStream](self, "handleOpenedStream");
      break;
    case 2uLL:
      id v11 = [v6 isEqual:self->_clientInputStream];
      if (!(_DWORD)v11)
      {
        uint64_t v16 = streams_log(v11, v12);
        char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1001329BC();
        }
        goto LABEL_17;
      }

      -[SDCompanionStream readClientStream](self, "readClientStream");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      id v13 = [v6 isEqual:self->_clientOutputStream];
      if ((_DWORD)v13)
      {
        -[SDCompanionStream writeClientStream](self, "writeClientStream");
      }

      else
      {
        uint64_t v18 = streams_log(v13, v14);
        char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Received NSStreamEventHasSpaceAvailable on a stream other than an output stream",  buf,  2u);
        }

- (void)handleOpenedStream
{
  if (-[NSInputStream streamStatus](self->_clientInputStream, "streamStatus") == (id)2
    && -[NSOutputStream streamStatus](self->_clientOutputStream, "streamStatus") == (id)2)
  {
    uint64_t v4 = streams_log(2LL, v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client Streams Opened", v6, 2u);
    }
  }

- (void)writeClientStream
{
  if (!-[NSOutputStream hasSpaceAvailable](self->_clientOutputStream, "hasSpaceAvailable")
    || !-[NSMutableData length](self->_networkStreamData, "length"))
  {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    if (![v22 enableStreamDebugging])
    {

      return;
    }

    unsigned __int8 v16 = -[NSOutputStream hasSpaceAvailable](self->_clientOutputStream, "hasSpaceAvailable");

    if ((v16 & 1) != 0) {
      return;
    }
    uint64_t v19 = streams_log(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Queueing client write, no space available",  buf,  2u);
    }

    goto LABEL_20;
  }

  uint64_t v3 = -[NSOutputStream write:maxLength:]( self->_clientOutputStream,  "write:maxLength:",  -[NSMutableData bytes](self->_networkStreamData, "bytes"),  -[NSMutableData length](self->_networkStreamData, "length"));
  uint64_t v5 = v3;
  if (v3 < 1)
  {
    uint64_t v21 = streams_log(v3, v4);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100132A68();
    }
LABEL_20:

    return;
  }

  if (!self->_clientReceived) {
    -[SDCompanionStream logClientReceived](self, "logClientReceived");
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableData subdataWithRange:]( self->_networkStreamData,  "subdataWithRange:",  v5,  (char *)-[NSMutableData length](self->_networkStreamData, "length") - v5));
  uint64_t v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v6));
  networkStreamData = self->_networkStreamData;
  self->_networkStreamData = v7;

  if (-[NSMutableData length](self->_networkStreamData, "length") < 0x18000) {
    -[SDStreamHandler setShouldReadNetwork:](self->_streamHandler, "setShouldReadNetwork:", 1LL);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v10 = [v9 enableStreamDebugging];

  if (v10)
  {
    self->_wroteToClient += v5;
    uint64_t v13 = streams_log(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int64_t wroteToClient = self->_wroteToClient;
      *(_DWORD *)buf = 134217984;
      int64_t v24 = wroteToClient;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Total written to client = %ld", buf, 0xCu);
    }
  }

  -[SDCompanionStream stopIfReady](self, "stopIfReady");
}

- (void)readClientStream
{
  BOOL v3 = -[SDCompanionStream networkBufferSpaceAvailable](self, "networkBufferSpaceAvailable");
  if (v3)
  {
    bzero(buf, 0x4000uLL);
    uint64_t v5 = -[NSInputStream read:maxLength:](self->_clientInputStream, "read:maxLength:", buf, 0x4000LL);
    if (v5 < 1)
    {
      uint64_t v18 = streams_log(v5, v6);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100132ACC();
      }
      goto LABEL_13;
    }

    uint64_t v7 = v5;
    if (!self->_clientSent) {
      -[SDCompanionStream logClientSent](self, "logClientSent");
    }
    clientStreamData = self->_clientStreamData;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, v7));
    -[NSMutableData appendData:](clientStreamData, "appendData:", v9);

    -[SDCompanionStream writeNetworkStream](self, "writeNetworkStream");
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    LODWORD(v9) = [v10 enableStreamDebugging];

    if ((_DWORD)v9)
    {
      self->_readFromClient += v7;
      uint64_t v13 = streams_log(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int64_t readFromClient = self->_readFromClient;
        int v19 = 134217984;
        int64_t v20 = readFromClient;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Total read from client = %ld",  (uint8_t *)&v19,  0xCu);
      }

- (void)writeNetworkStream
{
  if (-[NSMutableData length](self->_clientStreamData, "length"))
  {
    uint64_t v11 = self->_clientStreamData;
    BOOL v3 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    clientStreamData = self->_clientStreamData;
    self->_clientStreamData = v3;

    -[SDStreamHandler writeToStreamWithData:](self->_streamHandler, "writeToStreamWithData:", v11);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v6 = [v5 enableStreamDebugging];

    if (v6)
    {
      uint64_t v9 = streams_log(v7, v8);
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100132AF8();
      }
    }
  }

- (void)logClientSent
{
  self->_clientSent = 1;
  uint64_t v2 = streams_log(self, a2);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client has written data", v4, 2u);
  }
}

- (void)logClientReceived
{
  self->_clientReceived = 1;
  uint64_t v2 = streams_log(self, a2);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client has read data", v4, 2u);
  }
}

- (SDCompanionStreamDelegate)delegate
{
  return (SDCompanionStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SDStreamHandler)streamHandler
{
  return (SDStreamHandler *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setStreamHandler:(id)a3
{
}

- (NSData)authorData
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAuthorData:(id)a3
{
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)clientSent
{
  return self->_clientSent;
}

- (void)setClientSent:(BOOL)a3
{
  self->_clientSent = a3;
}

- (BOOL)clientReceived
{
  return self->_clientReceived;
}

- (void)setClientReceived:(BOOL)a3
{
  self->_clientReceived = a3;
}

- (BOOL)networkBufferSpaceAvailable
{
  return self->_networkBufferSpaceAvailable;
}

- (void)setNetworkBufferSpaceAvailable:(BOOL)a3
{
  self->_networkBufferSpaceAvailable = a3;
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return (NSNetServiceBrowser *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setNetServiceBrowser:(id)a3
{
}

- (NSInputStream)clientInputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setClientInputStream:(id)a3
{
}

- (NSOutputStream)clientOutputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setClientOutputStream:(id)a3
{
}

- (OS_dispatch_queue)writeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setWriteQueue:(id)a3
{
}

- (NSMutableData)networkStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setNetworkStreamData:(id)a3
{
}

- (OS_dispatch_queue)readQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setReadQueue:(id)a3
{
}

- (NSMutableData)clientStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setClientStreamData:(id)a3
{
}

- (int64_t)readFromClient
{
  return self->_readFromClient;
}

- (void)setReadFromClient:(int64_t)a3
{
  self->_int64_t readFromClient = a3;
}

- (int64_t)wroteToClient
{
  return self->_wroteToClient;
}

- (void)setWroteToClient:(int64_t)a3
{
  self->_int64_t wroteToClient = a3;
}

- (id)streamsRequestHandler
{
  return objc_getProperty(self, a2, 128LL, 1);
}

- (void)setStreamsRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end