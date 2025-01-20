@interface UAStreamHandler
- (BOOL)dataHasMessage:(id)a3;
- (BOOL)shouldStop;
- (BOOL)shouldTryWrite;
- (BOOL)writeMessage:(id)a3 tag:(int64_t)a4;
- (BOOL)writeRawData:(id)a3;
- (NSData)inMessage;
- (NSError)streamError;
- (NSInputStream)inStream;
- (NSMutableArray)messageQueue;
- (NSMutableData)inData;
- (NSMutableData)outMessage;
- (NSMutableData)outputStreamData;
- (NSOutputStream)outStream;
- (UAStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 delegate:(id)a5;
- (UAStreamHandlerDelegate)delegate;
- (UATimedPowerAssertions)assertionForRead;
- (UATimedPowerAssertions)assertionForWrite;
- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4;
- (int64_t)byteIndex;
- (int64_t)bytesRead;
- (int64_t)handleSpaceAvailable;
- (int64_t)inMessageTag;
- (int64_t)outMessageTag;
- (int64_t)queueCount;
- (int64_t)totalBytesReceived;
- (int64_t)totalBytesSent;
- (int64_t)tryWriteMessage;
- (int64_t)tryWriteRawData;
- (unint64_t)inputState;
- (unint64_t)outputMode;
- (unsigned)inMessageLength;
- (void)_stop;
- (void)handleBytesAvailable;
- (void)handleMessageRead;
- (void)handleOpenCompleted;
- (void)processHeader;
- (void)setAssertionForRead:(id)a3;
- (void)setAssertionForWrite:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setBytesRead:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInData:(id)a3;
- (void)setInMessage:(id)a3;
- (void)setInMessageLength:(unsigned int)a3;
- (void)setInMessageTag:(int64_t)a3;
- (void)setInStream:(id)a3;
- (void)setInputState:(unint64_t)a3;
- (void)setMessageQueue:(id)a3;
- (void)setOutMessage:(id)a3;
- (void)setOutMessageTag:(int64_t)a3;
- (void)setOutStream:(id)a3;
- (void)setOutputMode:(unint64_t)a3;
- (void)setOutputStreamData:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setShouldTryWrite:(BOOL)a3;
- (void)setStreamError:(id)a3;
- (void)setTotalBytesReceived:(int64_t)a3;
- (void)setTotalBytesSent:(int64_t)a3;
- (void)start;
- (void)stop;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)tryStop;
@end

@implementation UAStreamHandler

- (UAStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UAStreamHandler;
  v11 = -[UAStreamHandler init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    -[UAStreamHandler setDelegate:](v11, "setDelegate:", v10);
    -[UAStreamHandler setInStream:](v12, "setInStream:", v8);
    -[UAStreamHandler setOutStream:](v12, "setOutStream:", v9);
    -[UAStreamHandler setInputState:](v12, "setInputState:", 0LL);
    -[UAStreamHandler setOutputMode:](v12, "setOutputMode:", 0LL);
    v13 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 5LL);
    -[UAStreamHandler setMessageQueue:](v12, "setMessageQueue:", v13);

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[UAStreamHandler setInData:](v12, "setInData:", v14);

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[UAStreamHandler setOutputStreamData:](v12, "setOutputStreamData:", v15);

    -[UAStreamHandler setByteIndex:](v12, "setByteIndex:", 0LL);
    -[UAStreamHandler setBytesRead:](v12, "setBytesRead:", 0LL);
    -[UAStreamHandler setTotalBytesSent:](v12, "setTotalBytesSent:", 0LL);
    -[UAStreamHandler setTotalBytesReceived:](v12, "setTotalBytesReceived:", 0LL);
    -[UAStreamHandler setInMessage:](v12, "setInMessage:", 0LL);
    -[UAStreamHandler setOutMessage:](v12, "setOutMessage:", 0LL);
    -[UAStreamHandler setStreamError:](v12, "setStreamError:", 0LL);
    -[UAStreamHandler setShouldStop:](v12, "setShouldStop:", 0LL);
  }

  return v12;
}

- (int64_t)queueCount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
  id v4 = [v3 count];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
  if (v5) {
    return (int64_t)v4 + 1;
  }
  else {
    return (int64_t)v4;
  }
}

- (void)start
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23.version) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[STREAM HAND] Starting Streams",  (uint8_t *)&v23,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
  id v6 = [v5 streamStatus];

  if (!v6)
  {
    os_log_t v7 = sub_100039584(@"pasteboard-server");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[STREAM HAND] Starting Input Stream",  (uint8_t *)&v23,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v9 scheduleInRunLoop:v10 forMode:NSDefaultRunLoopMode];

    v11 = (__CFReadStream *)objc_claimAutoreleasedReturnValue( -[UAStreamHandler inStream]( self,  "inStream",  0LL,  self,  &CFRetain,  &_CFRelease,  &CFCopyDescription));
    CFReadStreamSetClient(v11, 0x1BuLL, (CFReadStreamClientCallBack)sub_10002D4CC, &v23);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
    [v12 open];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
  id v14 = [v13 streamStatus];

  if (!v14)
  {
    os_log_t v15 = sub_100039584(@"pasteboard-server");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[STREAM HAND] Starting Output Stream",  (uint8_t *)&v23,  2u);
    }

    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v17 scheduleInRunLoop:v18 forMode:NSDefaultRunLoopMode];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    [v19 setDelegate:self];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    [v20 open];
  }

  v21 = -[UATimedPowerAssertions initWithName:delta:queue:]( objc_alloc(&OBJC_CLASS___UATimedPowerAssertions),  "initWithName:delta:queue:",  @"clipboardReadStream",  &_dispatch_main_q,  60.0);
  -[UAStreamHandler setAssertionForRead:](self, "setAssertionForRead:", v21);

  v22 = -[UATimedPowerAssertions initWithName:delta:queue:]( objc_alloc(&OBJC_CLASS___UATimedPowerAssertions),  "initWithName:delta:queue:",  @"clipboardWriteStream",  &_dispatch_main_q,  60.0);
  -[UAStreamHandler setAssertionForWrite:](self, "setAssertionForWrite:", v22);
}

- (void)stop
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Call to stop streams", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler assertionForRead](self, "assertionForRead"));
  [v5 releaseAssertion];

  -[UAStreamHandler setAssertionForWrite:](self, "setAssertionForWrite:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler assertionForWrite](self, "assertionForWrite"));
  [v6 releaseAssertion];

  -[UAStreamHandler setAssertionForWrite:](self, "setAssertionForWrite:", 0LL);
  -[UAStreamHandler setShouldStop:](self, "setShouldStop:", 1LL);
  -[UAStreamHandler tryStop](self, "tryStop");
}

- (void)tryStop
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[STREAM HAND] Trying to stop streams", v9, 2u);
  }

  if (-[UAStreamHandler shouldStop](self, "shouldStop"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
    if ([v5 length])
    {
LABEL_7:

      return;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
    if (v6)
    {

      goto LABEL_7;
    }

    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    id v8 = [v7 count];

    if (!v8) {
      -[UAStreamHandler _stop](self, "_stop");
    }
  }

- (void)_stop
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Stoping streams", v15, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
    [v6 close];

    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
    [v7 setDelegate:0];

    -[UAStreamHandler setInStream:](self, "setInStream:", 0LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    [v9 close];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    [v10 setDelegate:0];

    -[UAStreamHandler setOutStream:](self, "setOutStream:", 0LL);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
  char v12 = objc_opt_respondsToSelector(v11, "streamsDidClose:withError:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler streamError](self, "streamError"));
    [v13 streamsDidClose:self withError:v14];
  }

- (BOOL)writeRawData:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(@"pasteboard-server");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134217984;
    id v15 = [v4 length];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[STREAM HAND] Write raw data of length: %ld",  (uint8_t *)&v14,  0xCu);
  }

  unint64_t v7 = -[UAStreamHandler outputMode](self, "outputMode");
  if (v7 == 1)
  {
    os_log_t v11 = sub_100039584(@"pasteboard-server");
    char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[STREAM HAND] Cannot write raw data, in message mode",  (uint8_t *)&v14,  2u);
    }
  }

  else
  {
    if (!-[UAStreamHandler outputMode](self, "outputMode")) {
      -[UAStreamHandler setOutputMode:](self, "setOutputMode:", 2LL);
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
    [v8 appendData:v4];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    unsigned int v10 = [v9 hasSpaceAvailable];

    if (v10) {
      -[UAStreamHandler tryWriteRawData](self, "tryWriteRawData");
    }
  }

  return v7 != 1;
}

- (BOOL)writeMessage:(id)a3 tag:(int64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v22 = a4;
    __int16 v23 = 2048;
    id v24 = [v6 length];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[STREAM HAND] Write message tagged %ld of length: %ld",  buf,  0x16u);
  }

  unint64_t v9 = -[UAStreamHandler outputMode](self, "outputMode");
  if (v9 != 2)
  {
    if (!-[UAStreamHandler outputMode](self, "outputMode")) {
      -[UAStreamHandler setOutputMode:](self, "setOutputMode:", 1LL);
    }
    char v20 = 67;
    unsigned int v10 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v20,  1LL);
    char v19 = 1;
    -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", &v19, 1LL);
    *(_DWORD *)buf = bswap32(a4);
    -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", buf, 4LL);
    unsigned int v18 = bswap32([v6 length]);
    -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", &v18, 4LL);
    -[NSMutableData appendData:](v10, "appendData:", v6);
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    objc_sync_enter(v11);
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    [v12 addObject:v10];

    objc_sync_exit(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    if ([v13 hasSpaceAvailable])
    {
    }

    else
    {
      unsigned __int8 v16 = -[UAStreamHandler shouldTryWrite](self, "shouldTryWrite");

      if ((v16 & 1) == 0)
      {
LABEL_13:

        goto LABEL_14;
      }
    }

    -[UAStreamHandler tryWriteMessage](self, "tryWriteMessage");
    goto LABEL_13;
  }

  os_log_t v14 = sub_100039584(@"pasteboard-server");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[STREAM HAND] Cannot write message, in raw data mode",  buf,  2u);
  }

LABEL_14:
  return v9 != 2;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  os_log_t v7 = self;
  id v8 = v7;
  switch(a4)
  {
    case 1uLL:
      -[UAStreamHandler handleOpenCompleted](v7, "handleOpenCompleted");
      break;
    case 2uLL:
      -[UAStreamHandler handleBytesAvailable](v7, "handleBytesAvailable");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      if (-[UAStreamHandler handleSpaceAvailable](v7, "handleSpaceAvailable"))
      {
        unint64_t v9 = v8;
        uint64_t v10 = 0LL;
      }

      else
      {
        os_log_t v15 = sub_100039584(@"pasteboard-server");
        unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[STREAM HAND] Did not write anything, setting flag",  (uint8_t *)&v17,  2u);
        }

        unint64_t v9 = v8;
        uint64_t v10 = 1LL;
      }

      -[UAStreamHandler setShouldTryWrite:](v9, "setShouldTryWrite:", v10);
      break;
    case 8uLL:
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 streamError]);
      -[UAStreamHandler setStreamError:](v8, "setStreamError:", v11);

      os_log_t v12 = sub_100039584(@"pasteboard-server");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler streamError](v8, "streamError"));
        int v17 = 138543618;
        id v18 = v6;
        __int16 v19 = 2114;
        char v20 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[STREAM HAND] Received error on stream %{public}@: %{public}@",  (uint8_t *)&v17,  0x16u);
      }

      goto LABEL_11;
    default:
      if (a4 == 16) {
LABEL_11:
      }
        -[UAStreamHandler _stop](v8, "_stop");
      break;
  }
}

- (void)handleOpenCompleted
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
  if ((unint64_t)[v7 streamStatus] <= 1)
  {
  }

  else
  {
    os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    id v4 = [v3 streamStatus];

    if ((unint64_t)v4 >= 2)
    {
      os_log_t v5 = sub_100039584(@"pasteboard-server");
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Both Streams opened", buf, 2u);
      }
    }
  }

- (void)handleBytesAvailable
{
  if (!-[UAStreamHandler inputState](self, "inputState"))
  {
    uint64_t v3 = 10 - -[UAStreamHandler bytesRead](self, "bytesRead");
    goto LABEL_5;
  }

  if ((id)-[UAStreamHandler inputState](self, "inputState") != (id)2)
  {
    if ((id)-[UAStreamHandler inputState](self, "inputState") != (id)1) {
      return;
    }
    uint64_t v4 = -[UAStreamHandler inMessageLength](self, "inMessageLength");
    int64_t v5 = -[UAStreamHandler bytesRead](self, "bytesRead");
    uint64_t v6 = v4 - v5;
    uint64_t v3 = 0x10000LL;
    if (v4 == v5) {
      goto LABEL_11;
    }
    uint64_t v3 = v6;
LABEL_5:
    if (v3 < 1) {
      return;
    }
    goto LABEL_11;
  }

  uint64_t v3 = 0x10000LL;
LABEL_11:
  id v7 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inStream](self, "inStream"));
  uint64_t v9 = (uint64_t)[v8 read:v7 maxLength:v3];

  if (v9 >= 1)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
    [v10 appendBytes:v7 length:v9];

    -[UAStreamHandler setBytesRead:]( self,  "setBytesRead:",  (char *)-[UAStreamHandler bytesRead](self, "bytesRead") + v9);
    -[UAStreamHandler setTotalBytesReceived:]( self,  "setTotalBytesReceived:",  (char *)-[UAStreamHandler totalBytesReceived](self, "totalBytesReceived") + v9);
    if (-[UAStreamHandler inputState](self, "inputState"))
    {
      if ((id)-[UAStreamHandler inputState](self, "inputState") == (id)1)
      {
        int64_t v11 = -[UAStreamHandler bytesRead](self, "bytesRead");
        if (v11 == -[UAStreamHandler inMessageLength](self, "inMessageLength"))
        {
          -[UAStreamHandler handleMessageRead](self, "handleMessageRead");
        }

        else if (self->_bytesRead > self->_inMessageLength)
        {
          -[UAStreamHandler _stop](self, "_stop");
        }
      }
    }

    else if ((id)-[UAStreamHandler bytesRead](self, "bytesRead") == (id)10)
    {
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
      unsigned int v13 = -[UAStreamHandler dataHasMessage:](self, "dataHasMessage:", v12);

      if (v13) {
        -[UAStreamHandler processHeader](self, "processHeader");
      }
      else {
        -[UAStreamHandler setInputState:](self, "setInputState:", 2LL);
      }
    }

    if ((id)-[UAStreamHandler inputState](self, "inputState") == (id)2)
    {
      os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
      id v15 = [v14 copy];

      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
      [v16 setLength:0];

      int v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
      char v18 = objc_opt_respondsToSelector(v17, "streams:didReadRawData:");

      if ((v18 & 1) != 0)
      {
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
        [v19 streams:self didReadRawData:v15];
      }
    }

    char v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler assertionForRead](self, "assertionForRead"));
    [v20 updateTimeUntilAssertionRelease:60.0];
  }

- (void)processHeader
{
  id v3 = objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
  -[UAStreamHandler setInMessageTag:]( self,  "setInMessageTag:",  bswap32(*(_DWORD *)((char *)[v3 bytes] + 2)));

  id v4 = objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
  -[UAStreamHandler setInMessageLength:]( self,  "setInMessageLength:",  bswap32(*(_DWORD *)((char *)[v4 bytes] + 6)));

  -[UAStreamHandler setBytesRead:](self, "setBytesRead:", (char *)-[UAStreamHandler bytesRead](self, "bytesRead") - 10);
  -[UAStreamHandler setInputState:](self, "setInputState:", 1LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
  [v5 setLength:0];
}

- (BOOL)dataHasMessage:(id)a3
{
  id v3 = a3;
  int v4 = *(unsigned __int8 *)[v3 bytes];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];

  return v4 == 67 && v6[1] == 1;
}

- (void)handleMessageRead
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
  id v4 = [v3 copy];
  -[UAStreamHandler setInMessage:](self, "setInMessage:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inMessage](self, "inMessage"));
  objc_msgSend(v5, "streams:didReadMessage:withTag:", self, v6, -[UAStreamHandler inMessageTag](self, "inMessageTag"));

  -[UAStreamHandler setBytesRead:](self, "setBytesRead:", 0LL);
  -[UAStreamHandler setInMessageTag:](self, "setInMessageTag:", 0LL);
  -[UAStreamHandler setInMessageLength:](self, "setInMessageLength:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler inData](self, "inData"));
  [v7 setLength:0];

  -[UAStreamHandler setInputState:](self, "setInputState:", 0LL);
}

- (int64_t)handleSpaceAvailable
{
  if ((id)-[UAStreamHandler outputMode](self, "outputMode") == (id)1) {
    return -[UAStreamHandler tryWriteMessage](self, "tryWriteMessage");
  }
  if ((id)-[UAStreamHandler outputMode](self, "outputMode") == (id)2) {
    return -[UAStreamHandler tryWriteRawData](self, "tryWriteRawData");
  }
  return 0LL;
}

- (int64_t)tryWriteRawData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
    id v6 = objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
    id v7 = [v6 bytes];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
    int64_t v9 = (int64_t)objc_msgSend(v5, "write:maxLength:", v7, objc_msgSend(v8, "length"));

    os_log_t v10 = sub_100039584(@"pasteboard-server");
    int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 134217984;
      int64_t v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[STREAM HAND] Wrote %ld raw bytes to output stream",  (uint8_t *)&v21,  0xCu);
    }

    if (v9 >= 1)
    {
      -[UAStreamHandler setTotalBytesSent:]( self,  "setTotalBytesSent:",  (char *)-[UAStreamHandler totalBytesSent](self, "totalBytesSent") + v9);
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler trimFirstBytes:ofData:](self, "trimFirstBytes:ofData:", v9, v12));
      -[UAStreamHandler setOutputStreamData:](self, "setOutputStreamData:", v13);

      os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outputStreamData](self, "outputStreamData"));
      id v15 = [v14 length];

      if (!v15)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
        uint64_t v17 = objc_opt_respondsToSelector(v16, "streamsDidWriteRawDataBuffer:");

        if ((v17 & 1) != 0)
        {
          char v18 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
          [v18 streamsDidWriteRawDataBuffer:self];
        }
      }

      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler assertionForWrite](self, "assertionForWrite"));
      [v19 updateTimeUntilAssertionRelease:60.0];
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  -[UAStreamHandler tryStop](self, "tryStop");
  return v9;
}

- (int64_t)tryWriteMessage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
  if (v4)
  {
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    id v6 = [v5 count];

    if (!v6) {
      goto LABEL_17;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    objc_sync_enter(v8);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    -[UAStreamHandler setOutMessage:](self, "setOutMessage:", v10);

    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler messageQueue](self, "messageQueue"));
    [v11 removeObjectAtIndex:0];

    id v12 = objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
    -[UAStreamHandler setOutMessageTag:]( self,  "setOutMessageTag:",  bswap32(*(_DWORD *)((char *)[v12 bytes] + 2)));

    -[UAStreamHandler setByteIndex:](self, "setByteIndex:", 0LL);
    objc_sync_exit(v8);
  }

  id v13 = objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
  os_log_t v14 = (char *)[v13 bytes];

  int64_t v15 = -[UAStreamHandler byteIndex](self, "byteIndex");
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
  uint64_t v17 = (char *)[v16 length];
  int64_t v18 = -[UAStreamHandler byteIndex](self, "byteIndex");

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
  char v20 = v19;
  else {
    uint64_t v21 = (uint64_t)&v17[-v18];
  }
  int64_t v22 = (int64_t)[v19 write:&v14[v15] maxLength:v21];

  if (v22 < 1)
  {
    if (v22 < 0)
    {
      os_log_t v36 = sub_100039584(@"pasteboard-server");
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outStream](self, "outStream"));
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 streamError]);
        int v40 = 138543362;
        v41 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "[STREAM HAND] Error writing message: %{public}@",  (uint8_t *)&v40,  0xCu);
      }

      goto LABEL_24;
    }

    os_log_t v29 = sub_100039584(@"pasteboard-server");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "[STREAM HAND] Should not be writting 0 data to stream",  (uint8_t *)&v40,  2u);
    }

LABEL_17:
    int64_t v22 = 0LL;
    goto LABEL_25;
  }

  -[UAStreamHandler setByteIndex:](self, "setByteIndex:", (char *)-[UAStreamHandler byteIndex](self, "byteIndex") + v22);
  -[UAStreamHandler setTotalBytesSent:]( self,  "setTotalBytesSent:",  (char *)-[UAStreamHandler totalBytesSent](self, "totalBytesSent") + v22);
  int64_t v23 = -[UAStreamHandler byteIndex](self, "byteIndex");
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
  id v25 = [v24 length];

  if ((id)v23 != v25)
  {
    unint64_t v31 = -[UAStreamHandler byteIndex](self, "byteIndex");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler outMessage](self, "outMessage"));
    id v33 = [v32 length];

    os_log_t v34 = sub_100039584(@"pasteboard-server");
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "[STREAM HAND] We should not be writting more data than we have!",  (uint8_t *)&v40,  2u);
    }

- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", a3, (char *)objc_msgSend( v5,  "length") - a3));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v6));
  return v7;
}

- (NSInputStream)inStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInStream:(id)a3
{
}

- (NSOutputStream)outStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOutStream:(id)a3
{
}

- (NSError)streamError
{
  return (NSError *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setStreamError:(id)a3
{
}

- (UAStreamHandlerDelegate)delegate
{
  return (UAStreamHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableData)outputStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 48LL, 1);
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

- (int64_t)outMessageTag
{
  return self->_outMessageTag;
}

- (void)setOutMessageTag:(int64_t)a3
{
  self->_outMessageTag = a3;
}

- (NSMutableData)outMessage
{
  return (NSMutableData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOutMessage:(id)a3
{
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (int64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(int64_t)a3
{
  self->_bytesRead = a3;
}

- (int64_t)inMessageTag
{
  return self->_inMessageTag;
}

- (void)setInMessageTag:(int64_t)a3
{
  self->_inMessageTag = a3;
}

- (unsigned)inMessageLength
{
  return self->_inMessageLength;
}

- (void)setInMessageLength:(unsigned int)a3
{
  self->_inMessageLength = a3;
}

- (NSData)inMessage
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setInMessage:(id)a3
{
}

- (NSMutableData)inData
{
  return (NSMutableData *)objc_getProperty(self, a2, 112LL, 1);
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
  self->_inputState = a3;
}

- (unint64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputMode:(unint64_t)a3
{
  self->_outputMode = a3;
}

- (int64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (void)setTotalBytesSent:(int64_t)a3
{
  self->_totalBytesSent = a3;
}

- (int64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(int64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldTryWrite
{
  return self->_shouldTryWrite;
}

- (void)setShouldTryWrite:(BOOL)a3
{
  self->_shouldTryWrite = a3;
}

- (UATimedPowerAssertions)assertionForRead
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setAssertionForRead:(id)a3
{
}

- (UATimedPowerAssertions)assertionForWrite
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setAssertionForWrite:(id)a3
{
}

- (void).cxx_destruct
{
}

@end