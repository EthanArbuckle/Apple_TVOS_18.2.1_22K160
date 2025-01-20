@interface UCStreamCoderV2
- (BOOL)remoteHasFiles;
- (BOOL)returnInfoEarly;
- (NSDictionary)auxStateInfo;
- (NSFileHandle)receivingDataFile;
- (NSFileHandle)sendingDataFile;
- (NSMutableArray)archiveQueue;
- (NSMutableArray)objects;
- (NSMutableArray)requestedArchives;
- (NSMutableDictionary)archivePackagers;
- (NSMutableDictionary)uuidItemMap;
- (NSProgress)progress;
- (OS_dispatch_semaphore)itemsLockedSem;
- (OS_dispatch_source)heartBeatTrigger;
- (UADispatchWatchdog)watchdog;
- (UASharedPasteboardInfoWrapper)receivedInfo;
- (UASharedPasteboardInfoWrapper)sendingInfo;
- (UAStreamHandler)streamHandler;
- (UCFilePackager)filePackager;
- (UCStreamCoderV2)initWithInputStream:(id)a3 outputStream:(id)a4;
- (id)fetchDataForType:(id)a3;
- (id)fileRecvHandler;
- (id)infoRecvHandler;
- (id)packMessage:(id)a3;
- (id)sendErrorHandler;
- (id)unpackMessage:(id)a3;
- (int64_t)bytesReceived;
- (int64_t)expectedLength;
- (int64_t)state;
- (int64_t)totalSendSize;
- (unint64_t)streamStartTime;
- (void)calculateTimeRemaining;
- (void)cancelReceive;
- (void)completedReceivingPasteboardWithError:(id)a3;
- (void)dealloc;
- (void)filePackagerError:(id)a3;
- (void)handleHeartbeat:(id)a3;
- (void)handlePasteboardAuxInfoReceived:(id)a3;
- (void)handlePasteboardDataRequest:(id)a3;
- (void)handlePasteboardDataResponse:(id)a3;
- (void)handlePasteboardFileRequest:(id)a3;
- (void)handlePasteboardFileResponse:(id)a3;
- (void)handlePasteboardInfoRequest:(id)a3;
- (void)handlePasteboardInfoResponse:(id)a3;
- (void)packager:(id)a3 gotData:(id)a4 forPacket:(int64_t)a5;
- (void)processPasteboardInfo:(id)a3;
- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7;
- (void)receivedPasteboardInfo:(id)a3 withError:(id)a4;
- (void)recvStop:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeReceivedItems:(id)a3;
- (void)sendCompletedWithError:(id)a3;
- (void)sendFileArchiveRequest;
- (void)sendHeartbeat;
- (void)sendPasteboard:(id)a3 withCompletion:(id)a4;
- (void)sendPasteboardDataRequest;
- (void)sendPasteboardDataResponse;
- (void)sendPasteboardInfoRequest;
- (void)sendPasteboardInfoResponse;
- (void)sendStopWithError:(int64_t)a3;
- (void)sendTotalSendSize;
- (void)setArchivePackagers:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setAuxStateInfo:(id)a3;
- (void)setBytesReceived:(int64_t)a3;
- (void)setExpectedLength:(int64_t)a3;
- (void)setFilePackager:(id)a3;
- (void)setFileRecvHandler:(id)a3;
- (void)setHeartBeatTrigger:(id)a3;
- (void)setInfoRecvHandler:(id)a3;
- (void)setItemsLockedSem:(id)a3;
- (void)setObjects:(id)a3;
- (void)setProgress:(id)a3;
- (void)setReceivedInfo:(id)a3;
- (void)setReceivingDataFile:(id)a3;
- (void)setRemoteHasFiles:(BOOL)a3;
- (void)setRequestedArchives:(id)a3;
- (void)setReturnInfoEarly:(BOOL)a3;
- (void)setSendErrorHandler:(id)a3;
- (void)setSendingDataFile:(id)a3;
- (void)setSendingInfo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamStartTime:(unint64_t)a3;
- (void)setTotalSendSize:(int64_t)a3;
- (void)setUuidItemMap:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)storeObject:(id)a3;
- (void)streams:(id)a3 didReadMessage:(id)a4 withTag:(int64_t)a5;
- (void)streams:(id)a3 didWriteMessageWithTag:(int64_t)a4;
- (void)streamsDidClose:(id)a3 withError:(id)a4;
@end

@implementation UCStreamCoderV2

- (UCStreamCoderV2)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___UCStreamCoderV2;
  v8 = -[UCStreamCoderV2 init](&v28, "init");
  if (v8)
  {
    v9 = -[UAStreamHandler initWithInputStream:outputStream:delegate:]( objc_alloc(&OBJC_CLASS___UAStreamHandler),  "initWithInputStream:outputStream:delegate:",  v6,  v7,  v8);
    -[UCStreamCoderV2 setStreamHandler:](v8, "setStreamHandler:", v9);

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[UCStreamCoderV2 setArchivePackagers:](v8, "setArchivePackagers:", v10);

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[UCStreamCoderV2 setArchiveQueue:](v8, "setArchiveQueue:", v11);

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[UCStreamCoderV2 setRequestedArchives:](v8, "setRequestedArchives:", v12);

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[UCStreamCoderV2 setUuidItemMap:](v8, "setUuidItemMap:", v13);

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[UCStreamCoderV2 setObjects:](v8, "setObjects:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](v8, "streamHandler"));
    [v15 start];

    -[UCStreamCoderV2 setState:](v8, "setState:", 0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    [v16 pasteboardStreamWatchdogTimeout];
    double v18 = v17;

    objc_initWeak(&location, v8);
    v19 = objc_alloc(&OBJC_CLASS___UADispatchWatchdog);
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    v24 = sub_1000111B4;
    v25 = &unk_1000BCE50;
    objc_copyWeak(&v26, &location);
    v20 = -[UADispatchWatchdog initWithName:timeout:block:]( v19,  "initWithName:timeout:block:",  @"UC Stream Watchdog",  &v22,  v18);
    -[UCStreamCoderV2 setWatchdog:](v8, "setWatchdog:", v20, v22, v23, v24, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[CODERV2] dealloc", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  [v5 stop];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UCStreamCoderV2;
  -[UCStreamCoderV2 dealloc](&v6, "dealloc");
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    os_log_t v5 = sub_100039584(@"pasteboard-server");
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_100011488(self->_state);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = sub_100011488(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      v12 = v8;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[CODERV2] State: %@ -> %@",  (uint8_t *)&v11,  0x16u);
    }

    self->_state = a3;
  }

- (void)storeObject:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 objects](self, "objects"));
  objc_sync_enter(v4);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 objects](self, "objects"));
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObject:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 objects](self, "objects"));
  objc_sync_enter(v4);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 objects](self, "objects"));
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)streamsDidClose:(id)a3 withError:(id)a4
{
  id v5 = a4;
  os_log_t v6 = sub_100039584(@"pasteboard-server");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Streams closed: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](self, "receivedInfo"));
  -[UCStreamCoderV2 receivedPasteboardInfo:withError:](self, "receivedPasteboardInfo:withError:", v8, v5);

  -[UCStreamCoderV2 completedReceivingPasteboardWithError:](self, "completedReceivingPasteboardWithError:", v5);
  -[UCStreamCoderV2 sendCompletedWithError:](self, "sendCompletedWithError:", v5);
}

- (void)streams:(id)a3 didReadMessage:(id)a4 withTag:(int64_t)a5
{
  id v7 = a4;
  os_log_t v8 = sub_100039584(@"pasteboard-server");
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = sub_100011864(a5);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Reveived message for tag %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v12 poke];

  switch(a5)
  {
    case 3LL:
      -[UCStreamCoderV2 handlePasteboardInfoRequest:](self, "handlePasteboardInfoRequest:", v7);
      break;
    case 4LL:
      -[UCStreamCoderV2 handlePasteboardInfoResponse:](self, "handlePasteboardInfoResponse:", v7);
      break;
    case 5LL:
      -[UCStreamCoderV2 handlePasteboardDataRequest:](self, "handlePasteboardDataRequest:", v7);
      break;
    case 6LL:
      -[UCStreamCoderV2 handlePasteboardDataResponse:](self, "handlePasteboardDataResponse:", v7);
      break;
    case 7LL:
      -[UCStreamCoderV2 handlePasteboardFileRequest:](self, "handlePasteboardFileRequest:", v7);
      break;
    case 8LL:
      -[UCStreamCoderV2 handlePasteboardFileResponse:](self, "handlePasteboardFileResponse:", v7);
      break;
    case 9LL:
      -[UCStreamCoderV2 handlePasteboardAuxInfoReceived:](self, "handlePasteboardAuxInfoReceived:", v7);
      break;
    case 10LL:
      -[UCStreamCoderV2 handleHeartbeat:](self, "handleHeartbeat:", v7);
      break;
    default:
      break;
  }
}

- (void)streams:(id)a3 didWriteMessageWithTag:(int64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = sub_100011864(a4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v33 = 138543362;
    v34 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Did write tag %{public}@",  (uint8_t *)&v33,  0xCu);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v11 poke];

  int64_t v12 = -[UCStreamCoderV2 state](self, "state");
  if (v12 == 2)
  {
    uint64_t v13 = 3LL;
  }

  else
  {
    if (v12 != 5) {
      goto LABEL_8;
    }
    uint64_t v13 = 1LL;
  }

  -[UCStreamCoderV2 setState:](self, "setState:", v13);
LABEL_8:
  if (a4)
  {
    if (a4 == 8)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](self, "archiveQueue"));
      objc_sync_enter(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](self, "archiveQueue"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

      if (v23)
      {
        os_log_t v24 = sub_100039584(@"pasteboard-server");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          int v33 = 138543362;
          v34 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Requesting delivery for %{public}@",  (uint8_t *)&v33,  0xCu);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archivePackagers](self, "archivePackagers"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);

        unsigned int v28 = [v27 deliverNextPacket];
        os_log_t v29 = sub_100039584(@"pasteboard-server");
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          int v33 = 67109120;
          LODWORD(v34) = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Req result: %d",  (uint8_t *)&v33,  8u);
        }
      }

      else
      {
        os_log_t v31 = sub_100039584(@"pasteboard-server");
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "[CODERV2] Done sending archive chunks",  (uint8_t *)&v33,  2u);
        }

        -[UCStreamCoderV2 setState:](self, "setState:", 1LL);
      }

      objc_sync_exit(v21);
    }

    else if (a4 == 6)
    {
      os_log_t v14 = sub_100039584(@"pasteboard-server");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[CODERV2] Did write data chunk",  (uint8_t *)&v33,  2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 filePackager](self, "filePackager"));
      unsigned __int8 v17 = [v16 deliverNextPacket];

      if ((v17 & 1) == 0)
      {
        os_log_t v18 = sub_100039584(@"pasteboard-server");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "[CODERV2] Done writting pasteboard data chunks",  (uint8_t *)&v33,  2u);
        }

        -[UCStreamCoderV2 setState:](self, "setState:", 1LL);
      }
    }
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
    [v20 stop];
  }
}

- (void)sendStopWithError:(int64_t)a3
{
  os_log_t v5 = sub_100039584(@"pasteboard-server");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CODERV2] Stopping", v11, 2u);
  }

  -[UCStreamCoderV2 setState:](self, "setState:", 8LL);
  if (a3)
  {
    int64_t v12 = @"error";
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    uint64_t v13 = v7;
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", v8));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
    [v10 writeMessage:v9 tag:0];
  }

- (void)recvStop:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", a3));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"error"]);
  id v6 = [v5 integerValue];

  os_log_t v7 = objc_alloc(&OBJC_CLASS___NSError);
  os_log_t v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", UAContinuityErrorDomain, v6, 0LL);
  os_log_t v9 = sub_100039584(@"pasteboard-server");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Received stop message with error: %@",  (uint8_t *)&v12,  0xCu);
  }

  -[UCStreamCoderV2 receivedPasteboardInfo:withError:](self, "receivedPasteboardInfo:withError:", 0LL, v8);
  -[UCStreamCoderV2 completedReceivingPasteboardWithError:](self, "completedReceivingPasteboardWithError:", v8);
  -[UCStreamCoderV2 sendCompletedWithError:](self, "sendCompletedWithError:", v8);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  [v11 stop];
}

- (void)handlePasteboardInfoRequest:(id)a3
{
  id v4 = a3;
  -[UCStreamCoderV2 setState:](self, "setState:", 4LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", v4));

  -[UCStreamCoderV2 sendPasteboardInfoResponse](self, "sendPasteboardInfoResponse");
}

- (void)handlePasteboardDataRequest:(id)a3
{
  id v4 = a3;
  -[UCStreamCoderV2 setState:](self, "setState:", 4LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", v4));

  -[UCStreamCoderV2 sendPasteboardDataResponse](self, "sendPasteboardDataResponse");
}

- (void)handlePasteboardFileRequest:(id)a3
{
  id v4 = a3;
  -[UCStreamCoderV2 setState:](self, "setState:", 4LL);
  v38 = self;
  v36 = v4;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", v4));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"uuid"]);
  os_log_t v5 = sub_100039584(@"pasteboard-server");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[CODERV2] Archvie requested for UUID: %@",  buf,  0xCu);
  }

  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archivePackagers](self, "archivePackagers"));
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  unsigned __int8 v9 = [v8 containsObject:v39];

  if ((v9 & 1) != 0) {
    goto LABEL_15;
  }
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingInfo](self, "sendingInfo"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pbinfo]);
  id obj = (id)objc_claimAutoreleasedReturnValue([v11 items]);

  id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v12)
  {
    char v13 = 0;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 types]);
        os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);
        unsigned int v19 = [v18 containsObject:@"public.file-url"];

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v16 types]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"public.file-url"]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
          unsigned __int8 v24 = [v23 isEqualToString:v39];

          v13 |= v24;
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v12);

    if ((v13 & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 requestedArchives](v38, "requestedArchives"));
      objc_sync_enter(v25);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 requestedArchives](v38, "requestedArchives"));
      [v26 addObject:v39];

      objc_sync_exit(v25);
LABEL_15:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](v38, "archiveQueue"));
      objc_sync_enter(v27);
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](v38, "archiveQueue"));
      [v28 addObject:v39];

      os_log_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](v38, "archiveQueue"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);

      if ([v30 isEqualToString:v39])
      {
        os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archivePackagers](v38, "archivePackagers"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v39]);
        [v32 deliverNextPacket];

        os_log_t v33 = sub_100039584(@"pasteboard-server");
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Delivering file packets for UUID: %@",  buf,  0xCu);
        }
      }

      objc_sync_exit(v27);
      goto LABEL_23;
    }
  }

  else
  {
  }

  os_log_t v35 = sub_100039584(@"pasteboard-server");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v47 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_ERROR,  "[CODERV2] File requested with invalid UUID: %{public}@",  buf,  0xCu);
  }

- (void)handlePasteboardInfoResponse:(id)a3
{
  id v4 = a3;
  -[UCStreamCoderV2 setState:](self, "setState:", 7LL);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  if (v6)
  {
    os_log_t v7 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v6,  0LL);
    id v8 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v7,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfoWrapper),  NSKeyedArchiveRootObjectKey);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[UCStreamCoderV2 setReceivedInfo:](self, "setReceivedInfo:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
    [v10 setCompletedUnitCount:0];

    os_log_t v11 = sub_100039584(@"pasteboard-server");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Received pasteboard info, requesting data",  (uint8_t *)&v18,  2u);
    }

    -[UCStreamCoderV2 sendPasteboardDataRequest](self, "sendPasteboardDataRequest");
    char v13 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](self, "receivedInfo"));
    -[UCStreamCoderV2 processPasteboardInfo:](self, "processPasteboardInfo:", v13);
  }

  else
  {
    uint64_t v14 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = @"Invalid message header";
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    os_log_t v7 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  -122LL,  v15));

    -[UCStreamCoderV2 receivedPasteboardInfo:withError:](self, "receivedPasteboardInfo:withError:", 0LL, v7);
    -[UCStreamCoderV2 completedReceivingPasteboardWithError:](self, "completedReceivingPasteboardWithError:", v7);
    os_log_t v16 = sub_100039584(@"pasteboard-server");
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      unsigned int v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[CODERV2] Error receiving pasteboard info: %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    -[UCStreamCoderV2 sendStopWithError:](self, "sendStopWithError:", 0LL);
  }
}

- (void)handlePasteboardDataResponse:(id)a3
{
  id v4 = a3;
  -[UCStreamCoderV2 setState:](self, "setState:", 7LL);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetNum"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"totalNum"]);
    *(_DWORD *)buf = 138543618;
    id v27 = v9;
    __int16 v28 = 2114;
    os_log_t v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Received pasteboard data response (%{public}@/%{public}@)",  buf,  0x16u);
  }

  -[UCStreamCoderV2 setBytesReceived:]( self,  "setBytesReceived:",  (char *)[v6 length] + -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
  objc_msgSend(v11, "setCompletedUnitCount:", -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));

  -[UCStreamCoderV2 calculateTimeRemaining](self, "calculateTimeRemaining");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivingDataFile](self, "receivingDataFile"));
  id v23 = 0LL;
  unsigned __int8 v13 = [v12 writeData:v6 error:&v23];
  id v14 = v23;

  if ((v13 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetNum"]);
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"totalNum"]);

    if (v15 == v16)
    {
      if (-[UCStreamCoderV2 returnInfoEarly](self, "returnInfoEarly"))
      {
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](self, "receivedInfo"));
        -[UCStreamCoderV2 receivedPasteboardInfo:withError:](self, "receivedPasteboardInfo:withError:", v17, 0LL);
      }

      if (-[UCStreamCoderV2 remoteHasFiles](self, "remoteHasFiles")) {
        -[UCStreamCoderV2 sendFileArchiveRequest](self, "sendFileArchiveRequest");
      }
      else {
        -[UCStreamCoderV2 completedReceivingPasteboardWithError:](self, "completedReceivingPasteboardWithError:", 0LL);
      }
    }
  }

  else
  {
    os_log_t v18 = sub_100039584(@"pasteboard-server");
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[CODERV2] Error writing data to file: %{public}@",  buf,  0xCu);
    }

    uint64_t v20 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
    id v25 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  -128LL,  v21));

    -[UCStreamCoderV2 completedReceivingPasteboardWithError:](self, "completedReceivingPasteboardWithError:", v22);
    -[UCStreamCoderV2 sendStopWithError:](self, "sendStopWithError:", 0LL);
  }
}

- (void)handlePasteboardFileResponse:(id)a3
{
  id v4 = a3;
  -[UCStreamCoderV2 setState:](self, "setState:", 7LL);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data"]);
  os_log_t v7 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"uuid"]);
  unsigned __int8 v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetNum"]);
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"totalNum"]);
  if (sub_1000397F4((int)[v10 intValue], (int)objc_msgSend(v11, "intValue")))
  {
    [v10 floatValue];
    float v13 = v12;
    [v11 floatValue];
    float v15 = v14;
    os_log_t v16 = sub_100039584(@"pasteboard-server");
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"uuid"]);
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetNum"]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"totalNum"]);
      *(_DWORD *)buf = 138413058;
      v40 = v18;
      __int16 v41 = 2048;
      uint64_t v42 = (uint64_t)((float)(v13 / v15) * 100.0);
      __int16 v43 = 2114;
      __int128 v44 = v19;
      __int16 v45 = 2114;
      v46 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Received pasteboard file response %@ %ld%% (%{public}@/%{public}@)",  buf,  0x2Au);
    }
  }

  -[UCStreamCoderV2 setBytesReceived:]( self,  "setBytesReceived:",  (char *)[v6 length] + -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
  objc_msgSend(v21, "setCompletedUnitCount:", -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));

  -[UCStreamCoderV2 calculateTimeRemaining](self, "calculateTimeRemaining");
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  [v22 writeArchiveData:v6 forItem:v9];

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetNum"]);
  NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"totalNum"]);

  if (v23 == v24)
  {
    os_log_t v25 = sub_100039584(@"pasteboard-server");
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "[CODERV2] Received all data for archive: %@",  buf,  0xCu);
    }

    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    [v28 finishWritingArchiveForUUID:v9];

    os_log_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 fileURLForPasteboardItem:v9]);

    os_log_t v31 = objc_alloc(&OBJC_CLASS___UCExtractor);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
    os_log_t v33 = -[UCExtractor initWithDestinationURL:forArchiveUUID:](v31, "initWithDestinationURL:forArchiveUUID:", v30, v32);

    -[UCStreamCoderV2 storeObject:](self, "storeObject:", v33);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100012E84;
    v35[3] = &unk_1000BCE78;
    v36 = v9;
    v37 = self;
    v38 = v33;
    v34 = v33;
    -[UCExtractor extractArchiveWithCompletion:](v34, "extractArchiveWithCompletion:", v35);
  }
}

- (void)handlePasteboardAuxInfoReceived:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 unpackMessage:](self, "unpackMessage:", a3));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"totalSize"]);
  if (v5)
  {
    os_log_t v6 = sub_100039584(@"pasteboard-server");
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[CODERV2] Total expected data length: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    -[UCStreamCoderV2 setExpectedLength:](self, "setExpectedLength:", [v5 integerValue]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(v5, "integerValue"));
  }
}

- (void)handleHeartbeat:(id)a3
{
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending heartbeat", v7, 2u);
  }

  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v6 poke];
}

- (void)sendPasteboardInfoRequest
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", &off_1000C4648));
  -[UCStreamCoderV2 setState:](self, "setState:", 2LL);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  [v3 writeMessage:v4 tag:3];
}

- (void)sendPasteboardInfoResponse
{
  os_log_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingInfo](self, "sendingInfo"));

  if (v4)
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingInfo](self, "sendingInfo"));
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  0LL));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"data");
  }

  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", v3));
  os_log_t v8 = sub_100039584(@"pasteboard-server");
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending pasteboard info", v11, 2u);
  }

  -[UCStreamCoderV2 setState:](self, "setState:", 5LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  [v10 writeMessage:v7 tag:4];
}

- (void)sendPasteboardDataRequest
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Sending pasteboard data request",  v7,  2u);
  }

  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", &off_1000C4670));
  -[UCStreamCoderV2 setState:](self, "setState:", 2LL);
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  [v6 writeMessage:v5 tag:5];
}

- (void)sendFileArchiveRequest
{
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](self, "receivedInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pbinfo]);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);

  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v28;
    *(void *)&__int128 v7 = 138543362LL;
    __int128 v26 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v5);
        }
        os_log_t v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        float v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "types", v26));
        float v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
        unsigned int v14 = [v13 containsObject:@"public.file-url"];

        if (v14)
        {
          float v15 = (void *)objc_claimAutoreleasedReturnValue([v11 types]);
          os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"public.file-url"]);
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
          os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);

          os_log_t v19 = sub_100039584(@"pasteboard-server");
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            v34 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "[CODERV2] Requesting archive for UUID: %{public}@",  buf,  0xCu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
          v22 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v18);
          [v21 createTmpArchiveFileWithUUID:v22];

          v31[0] = @"supportsCompression";
          v31[1] = @"uuid";
          v32[0] = &__kCFBooleanFalse;
          v32[1] = v18;
          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
          NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", v23));
          -[UCStreamCoderV2 setState:](self, "setState:", 2LL);
          os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
          [v25 writeMessage:v24 tag:7];
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }

    while (v8);
  }
}

- (void)sendPasteboardDataResponse
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Building file packager to send pasteboard data",  v12,  2u);
  }

  os_log_t v5 = objc_alloc(&OBJC_CLASS___UCFilePackager);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingDataFile](self, "sendingDataFile"));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingInfo](self, "sendingInfo"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pbinfo]);
  uint64_t v9 = -[UCFilePackager initWithFile:fileSize:packetSize:options:receiver:]( v5,  "initWithFile:fileSize:packetSize:options:receiver:",  v6,  [v8 dataSize],  0x10000,  0,  self);
  -[UCStreamCoderV2 setFilePackager:](self, "setFilePackager:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 filePackager](self, "filePackager"));
  [v10 setTag:6];

  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 filePackager](self, "filePackager"));
  [v11 deliverNextPacket];

  -[UCStreamCoderV2 setState:](self, "setState:", 6LL);
}

- (void)sendTotalSendSize
{
  __int128 v7 = @"totalSize";
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[UCStreamCoderV2 totalSendSize](self, "totalSendSize")));
  id v8 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  [v6 writeMessage:v5 tag:9];
}

- (void)sendHeartbeat
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending heartbeat", v8, 2u);
  }

  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v5 poke];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([@"UCHB" dataUsingEncoding:1]);
  [v6 writeMessage:v7 tag:10];
}

- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  -[UCStreamCoderV2 setRemoteHasFiles:](self, "setRemoteHasFiles:", 0LL);
  -[UCStreamCoderV2 setReturnInfoEarly:](self, "setReturnInfoEarly:", v7);
  -[UCStreamCoderV2 setReceivingDataFile:](self, "setReceivingDataFile:", v15);

  -[UCStreamCoderV2 setProgress:](self, "setProgress:", v14);
  -[UCStreamCoderV2 setInfoRecvHandler:](self, "setInfoRecvHandler:", v13);

  -[UCStreamCoderV2 setFileRecvHandler:](self, "setFileRecvHandler:", v12);
  -[UCStreamCoderV2 setStreamStartTime:](self, "setStreamStartTime:", mach_absolute_time());
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  -[UCStreamCoderV2 setItemsLockedSem:](self, "setItemsLockedSem:", v16);

  os_log_t v17 = sub_100039584(@"pasteboard-server");
  os_log_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v19 = @"NO";
    if (v7) {
      os_log_t v19 = @"YES";
    }
    int v21 = 138543362;
    v22 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Requesting pasteboard info, will return info early: %{public}@",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v20 start];

  -[UCStreamCoderV2 sendPasteboardInfoRequest](self, "sendPasteboardInfoRequest");
}

- (void)cancelReceive
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
  -[UCStreamCoderV2 receivedPasteboardInfo:withError:](self, "receivedPasteboardInfo:withError:", 0LL, v4);
  -[UCStreamCoderV2 completedReceivingPasteboardWithError:](self, "completedReceivingPasteboardWithError:", v4);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v3 cancel];
}

- (void)receivedPasteboardInfo:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 itemsLockedSem](self, "itemsLockedSem"));
  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL);
    if (dispatch_semaphore_wait(v8, v9))
    {
      os_log_t v10 = sub_100039584(@"pasteboard-server");
      os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[CODERV2] Timout waiting for item lock sememphore",  buf,  2u);
      }
    }

    -[UCStreamCoderV2 setItemsLockedSem:](self, "setItemsLockedSem:", 0LL);
  }

  id v12 = self;
  objc_sync_enter(v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 infoRecvHandler](v12, "infoRecvHandler"));

  if (v13)
  {
    if (v7)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](v12, "receivedInfo"));
      -[UCStreamCoderV2 removeReceivedItems:](v12, "removeReceivedItems:", v14);
    }

    os_log_t v15 = sub_100039584(@"pasteboard-server");
    dispatch_semaphore_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[CODERV2] Calling received info handler",  v21,  2u);
    }

    os_log_t v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 infoRecvHandler](v12, "infoRecvHandler"));
    ((void (**)(void, id, id))v17)[2](v17, v6, v7);

    -[UCStreamCoderV2 setInfoRecvHandler:](v12, "setInfoRecvHandler:", 0LL);
  }

  else
  {
    os_log_t v18 = sub_100039584(@"pasteboard-server");
    os_log_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "[CODERV2] Skipping call to received info handler",  v20,  2u);
    }
  }

  objc_sync_exit(v12);
}

- (void)completedReceivingPasteboardWithError:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](self, "receivedInfo"));
  -[UCStreamCoderV2 receivedPasteboardInfo:withError:](self, "receivedPasteboardInfo:withError:", v5, v4);

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 fileRecvHandler](v6, "fileRecvHandler"));

  if (v7)
  {
    if (v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 receivedInfo](v6, "receivedInfo"));
      -[UCStreamCoderV2 removeReceivedItems:](v6, "removeReceivedItems:", v8);
    }

    os_log_t v9 = sub_100039584(@"pasteboard-server");
    os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[CODERV2] Calling pasteboard received handler",  buf,  2u);
    }

    os_log_t v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[UCStreamCoderV2 fileRecvHandler]( v6,  "fileRecvHandler"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](v6, "streamHandler"));
    ((void (**)(void, UCStreamCoderV2 *, id, id))v11)[2]( v11,  v6,  [v12 totalBytesReceived],  v4);

    -[UCStreamCoderV2 setFileRecvHandler:](v6, "setFileRecvHandler:", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    [v13 cleanupArchiveDir];
  }

  else
  {
    os_log_t v14 = sub_100039584(@"pasteboard-server");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_semaphore_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_INFO,  "[CODERV2] Skipping call to pasteboard received handler",  v16,  2u);
    }
  }

  objc_sync_exit(v6);
  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](v6, "watchdog"));
  [v15 cancel];
}

- (void)removeReceivedItems:(id)a3
{
  id v20 = a3;
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v20 pbinfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v20 pbinfo]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v6]);

      os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 types]);
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
      unsigned int v12 = [v11 containsObject:@"public.file-url"];

      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 types]);
        os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"public.file-url"]);
        os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);

        dispatch_semaphore_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
        [v16 cleanupForItem:v15];
      }

      ++v6;
      os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue([v20 pbinfo]);
      os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 items]);
      id v19 = [v18 count];
    }

    while ((unint64_t)v19 > v6);
  }
}

- (void)processPasteboardInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pbinfo]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    *(void *)&__int128 v8 = 67109378LL;
    __int128 v35 = v8;
    do
    {
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pbinfo", v35));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 items]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v9]);

      os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 types]);
      os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
      unsigned int v16 = [v15 containsObject:@"public.file-url"];

      if (v16)
      {
        os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 types]);
        os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"public.file-url"]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);

        os_log_t v20 = sub_100039584(@"pasteboard-server");
        int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
          *(_DWORD *)buf = v35;
          int v39 = v9;
          __int16 v40 = 2112;
          __int16 v41 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Item %d has public.file-url with uuid: %@",  buf,  0x12u);
        }

        uint64_t v10 = (v10 + 1);

        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
        [v23 createTmpArchiveFileWithUUID:v19];

        -[UCStreamCoderV2 setRemoteHasFiles:](self, "setRemoteHasFiles:", 1LL);
        NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
        os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 uuidItemMap](self, "uuidItemMap"));
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
        [v25 setObject:v24 forKeyedSubscript:v26];

        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_1000143FC;
        v36[3] = &unk_1000BCE98;
        int v37 = v9;
        [v27 obtainLockForItem:v19 completion:v36];
      }

      ++v9;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v4 pbinfo]);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 items]);
      id v30 = [v29 count];
    }

    while ((unint64_t)v30 > v9);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  [v31 setUserInfoObject:v32 forKey:@"numFiles"];

  os_log_t v33 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 itemsLockedSem](self, "itemsLockedSem"));
  v34 = v33;
  if (v33) {
    dispatch_semaphore_signal(v33);
  }
}

- (void)calculateTimeRemaining
{
  double v3 = (double)+[UADiagnosticUtils absoluteToNSec:]( &OBJC_CLASS___UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - -[UCStreamCoderV2 streamStartTime](self, "streamStartTime"))
     / 1000000000.0;
  double v4 = (double)-[UCStreamCoderV2 bytesReceived](self, "bytesReceived") / v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  [v5 setUserInfoObject:v6 forKey:NSProgressThroughputKey];

  int64_t v7 = -[UCStreamCoderV2 expectedLength](self, "expectedLength");
  double v8 = (double)(v7 - -[UCStreamCoderV2 bytesReceived](self, "bytesReceived")) / v4;
  qword_1000DE280 = *(void *)&v8;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v9 pasteboardUITimeRemainingDelay];
  double v11 = v10;

  if (v3 > v11)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 progress](self, "progress"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_1000DE280));
    [v13 setUserInfoObject:v12 forKey:NSProgressEstimatedTimeRemainingKey];
  }

- (void)sendPasteboard:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v69 = a4;
  v75 = self;
  -[UCStreamCoderV2 setSendingInfo:](self, "setSendingInfo:", v6);
  v70 = v6;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pbinfo]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataFile]);
  -[UCStreamCoderV2 setSendingDataFile:](self, "setSendingDataFile:", v8);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v70 pbinfo]);
  -[UCStreamCoderV2 setTotalSendSize:]( self,  "setTotalSendSize:",  (char *)[v9 dataSize] + -[UCStreamCoderV2 totalSendSize](self, "totalSendSize"));

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingInfo](self, "sendingInfo"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pbinfo]);
  [v11 setDataFile:0];

  -[UCStreamCoderV2 setSendErrorHandler:](self, "setSendErrorHandler:", v69);
  objc_initWeak(&location, self);
  unsigned int v12 = &_dispatch_main_q;
  dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
  -[UCStreamCoderV2 setHeartBeatTrigger:](self, "setHeartBeatTrigger:", v13);

  os_log_t v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 heartBeatTrigger](self, "heartBeatTrigger"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001500C;
  handler[3] = &unk_1000BCE50;
  objc_copyWeak(&v86, &location);
  dispatch_source_set_event_handler(v14, handler);

  os_log_t v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 heartBeatTrigger](self, "heartBeatTrigger"));
  dispatch_source_set_timer(v15, 0LL, 0x12A05F200uLL, 0x12A05F200uLL);

  unsigned int v16 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 heartBeatTrigger](self, "heartBeatTrigger"));
  dispatch_activate(v16);

  os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](self, "watchdog"));
  [v17 start];

  os_log_t v18 = sub_100039584(@"pasteboard-server");
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Setup to send pasteboard, waiting",  buf,  2u);
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingInfo](self, "sendingInfo"));
  int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pbinfo]);
  id obj = (id)objc_claimAutoreleasedReturnValue([v21 items]);

  id v22 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v22)
  {
    uint64_t v72 = *(void *)v82;
    while (2)
    {
      id v73 = v22;
      for (i = 0LL; i != v73; i = (char *)i + 1)
      {
        if (*(void *)v82 != v72) {
          objc_enumerationMutation(obj);
        }
        NSErrorUserInfoKey v24 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
        os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 types]);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allKeys]);
        unsigned int v27 = [v26 containsObject:@"public.file-url"];

        if (v27)
        {
          os_log_t v28 = sub_100039584(@"pasteboard-server");
          __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Sending pasteboard with files",  buf,  2u);
          }

          id v30 = (void *)objc_claimAutoreleasedReturnValue([v24 types]);
          os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"public.file-url"]);
          v74 = (void *)objc_claimAutoreleasedReturnValue([v31 uuid]);

          v32 = (void *)objc_claimAutoreleasedReturnValue([v24 types]);
          os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"public.file-url"]);
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 fetchDataForType:](v75, "fetchDataForType:", v33));

          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v24 types]);
          v36 = (void *)objc_claimAutoreleasedReturnValue( [v35 objectForKeyedSubscript:@"com.apple.security.sandbox-extension-dict"]);
          int v37 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 fetchDataForType:](v75, "fetchDataForType:", v36));

          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithDataRepresentation:relativeToURL:]( &OBJC_CLASS___NSURL,  "URLWithDataRepresentation:relativeToURL:",  v34,  0LL));
          int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v37,  0LL,  0LL,  0LL));
          if (v39)
          {
            __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 path]);
            __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v40]);
            os_log_t v42 = sub_100039584(@"pasteboard-server");
            __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v89 = (uint64_t)v41;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Got extension data: %@",  buf,  0xCu);
            }

            if (v41 && (id v44 = v41, [v44 bytes])) {
              uint64_t v45 = sandbox_extension_consume([v44 bytes]);
            }
            else {
              uint64_t v45 = -1LL;
            }
            os_log_t v46 = sub_100039584(@"pasteboard-server");
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v89 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Got extension id: %lld",  buf,  0xCu);
            }
          }

          else
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue([v38 path]);
            v49 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
            v50 = (void *)objc_claimAutoreleasedReturnValue([v49 fileURLForCloneItems]);
            v51 = (void *)objc_claimAutoreleasedReturnValue([v50 path]);
            unsigned int v52 = [v48 hasPrefix:v51];

            if (!v52)
            {
              os_log_t v67 = sub_100039584(@"pasteboard-server");
              v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "[CODERV2] Error getting sandbox info",  buf,  2u);
              }

              -[UCStreamCoderV2 sendStopWithError:](v75, "sendStopWithError:", -122LL);
              goto LABEL_38;
            }

            os_log_t v53 = sub_100039584(&stru_1000BE738);
            __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "[CODERV2] Archiving item in our clone dir, no need for sandbox ext",  buf,  2u);
            }

            uint64_t v45 = -1LL;
          }

          os_log_t v54 = sub_100039584(@"pasteboard-server");
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v89 = (uint64_t)v38;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "[CODERV2] Starting to archive %@",  buf,  0xCu);
          }

          v56 = objc_alloc(&OBJC_CLASS___UCArchiver);
          v57 = (void *)objc_claimAutoreleasedReturnValue([v74 UUIDString]);
          v58 = -[UCArchiver initWithURL:typeUUID:](v56, "initWithURL:typeUUID:", v38, v57);

          -[UCStreamCoderV2 storeObject:](v75, "storeObject:", v58);
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472LL;
          v76[2] = sub_100015038;
          v76[3] = &unk_1000BCEC0;
          v76[4] = v75;
          id v59 = v38;
          id v77 = v59;
          id v60 = v74;
          id v78 = v60;
          uint64_t v80 = v45;
          v61 = v58;
          v79 = v61;
          -[UCArchiver archiveURLWithCompletion:](v61, "archiveURLWithCompletion:", v76);
        }
      }

      id v22 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 objects](v75, "objects"));
  BOOL v63 = [v62 count] == 0;

  if (v63)
  {
    os_log_t v64 = sub_100039584(@"pasteboard-server");
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[UCStreamCoderV2 totalSendSize](v75, "totalSendSize")));
      *(_DWORD *)buf = 138412290;
      uint64_t v89 = (uint64_t)v66;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEBUG,  "[CODERV2] No files to archive, total send size: %@",  buf,  0xCu);
    }

    -[UCStreamCoderV2 sendTotalSendSize](v75, "sendTotalSendSize");
  }

  -[UCStreamCoderV2 setState:](v75, "setState:", 1LL);
LABEL_38:
  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);
}

- (void)sendCompletedWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendErrorHandler](v5, "sendErrorHandler"));

  if (v6)
  {
    os_log_t v7 = sub_100039584(@"pasteboard-server");
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[CODERV2] Calling pasteboard sent handler",  buf,  2u);
    }

    unint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[UCStreamCoderV2 sendErrorHandler]( v5,  "sendErrorHandler"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](v5, "streamHandler"));
    ((void (**)(void, UCStreamCoderV2 *, id, id))v9)[2](v9, v5, [v10 totalBytesSent], v4);

    -[UCStreamCoderV2 setSendErrorHandler:](v5, "setSendErrorHandler:", 0LL);
  }

  else
  {
    os_log_t v11 = sub_100039584(@"pasteboard-server");
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[CODERV2] Skipping call to pasteboard sent handler",  v16,  2u);
    }
  }

  objc_sync_exit(v5);

  dispatch_source_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 watchdog](v5, "watchdog"));
  [v13 cancel];

  os_log_t v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 heartBeatTrigger](v5, "heartBeatTrigger"));
  os_log_t v15 = v14;
  if (v14)
  {
    dispatch_source_cancel(v14);
    -[UCStreamCoderV2 setHeartBeatTrigger:](v5, "setHeartBeatTrigger:", 0LL);
  }

  -[UCStreamCoderV2 setState:](v5, "setState:", 8LL);
}

- (void)packager:(id)a3 gotData:(id)a4 forPacket:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 tag];
  os_log_t v11 = sub_100039584(@"pasteboard-server");
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 67109376;
    *(_DWORD *)v32 = a5;
    *(_WORD *)&v32[4] = 2048;
    *(void *)&v32[6] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Got data from packager, packet #: %d, tag: %ld",  (uint8_t *)&v31,  0x12u);
  }

  if ([v8 totalPacketCount] == (id)a5)
  {
    os_log_t v13 = sub_100039584(@"pasteboard-server");
    os_log_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
      int v31 = 134218242;
      *(void *)v32 = v10;
      *(_WORD *)&v32[8] = 2114;
      *(void *)&v32[10] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Finished sending packages: %ld / %{public}@",  (uint8_t *)&v31,  0x16u);
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 filePackager](self, "filePackager"));
    BOOL v17 = v16 == v8;

    if (v17)
    {
      -[UCStreamCoderV2 setFilePackager:](self, "setFilePackager:", 0LL);
    }

    else
    {
      os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);

      if (v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](self, "archiveQueue"));
        objc_sync_enter(v19);
        os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archivePackagers](self, "archivePackagers"));
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
        [v20 setObject:0 forKeyedSubscript:v21];

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 archiveQueue](self, "archiveQueue"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
        [v22 removeObject:v23];

        objc_sync_exit(v19);
      }
    }
  }

  if (v10)
  {
    NSErrorUserInfoKey v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, @"packetNum");

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 totalPacketCount]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v26, @"totalNum");

    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v9, @"data");
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);

    if (v27)
    {
      os_log_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v28, @"uuid");
    }

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 packMessage:](self, "packMessage:", v24));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 streamHandler](self, "streamHandler"));
    [v30 writeMessage:v29 tag:v10];
  }
}

- (void)filePackagerError:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(@"pasteboard-server");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CODERV2] Error from packager: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  -[UCStreamCoderV2 sendStopWithError:](self, "sendStopWithError:", -122LL);
  -[UCStreamCoderV2 sendCompletedWithError:](self, "sendCompletedWithError:", v4);
}

- (id)packMessage:(id)a3
{
  return (id)_UACopyPackedDataForObject(a3, 0LL);
}

- (id)unpackMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bytes];
  id v5 = [v3 length];

  return (id)_UACopyUnpackedObjectFromData(v4, v5, 0LL);
}

- (id)fetchDataForType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingDataFile](self, "sendingDataFile"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingDataFile](self, "sendingDataFile"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 offset]);
  objc_msgSend(v6, "seekToFileOffset:", objc_msgSend(v7, "unsignedLongLongValue"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingDataFile](self, "sendingDataFile"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readDataOfLength:", objc_msgSend(v4, "size")));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UCStreamCoderV2 sendingDataFile](self, "sendingDataFile"));
  [v10 seekToFileOffset:0];

  objc_sync_exit(v5);
  return v9;
}

- (UAStreamHandler)streamHandler
{
  return (UAStreamHandler *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStreamHandler:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (NSDictionary)auxStateInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAuxStateInfo:(id)a3
{
}

- (NSMutableArray)objects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setObjects:(id)a3
{
}

- (UADispatchWatchdog)watchdog
{
  return (UADispatchWatchdog *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setWatchdog:(id)a3
{
}

- (OS_dispatch_source)heartBeatTrigger
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setHeartBeatTrigger:(id)a3
{
}

- (id)infoRecvHandler
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setInfoRecvHandler:(id)a3
{
}

- (id)fileRecvHandler
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFileRecvHandler:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)receivedInfo
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setReceivedInfo:(id)a3
{
}

- (NSFileHandle)receivingDataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setReceivingDataFile:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(int64_t)a3
{
  self->_bytesReceived = a3;
}

- (BOOL)remoteHasFiles
{
  return self->_remoteHasFiles;
}

- (void)setRemoteHasFiles:(BOOL)a3
{
  self->_remoteHasFiles = a3;
}

- (BOOL)returnInfoEarly
{
  return self->_returnInfoEarly;
}

- (void)setReturnInfoEarly:(BOOL)a3
{
  self->_returnInfoEarly = a3;
}

- (OS_dispatch_semaphore)itemsLockedSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setItemsLockedSem:(id)a3
{
}

- (NSMutableDictionary)uuidItemMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setUuidItemMap:(id)a3
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

- (int64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(int64_t)a3
{
  self->_expectedLength = a3;
}

- (id)sendErrorHandler
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setSendErrorHandler:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)sendingInfo
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSendingInfo:(id)a3
{
}

- (NSFileHandle)sendingDataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setSendingDataFile:(id)a3
{
}

- (UCFilePackager)filePackager
{
  return (UCFilePackager *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setFilePackager:(id)a3
{
}

- (NSMutableDictionary)archivePackagers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setArchivePackagers:(id)a3
{
}

- (NSMutableArray)archiveQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setArchiveQueue:(id)a3
{
}

- (NSMutableArray)requestedArchives
{
  return (NSMutableArray *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setRequestedArchives:(id)a3
{
}

- (int64_t)totalSendSize
{
  return self->_totalSendSize;
}

- (void)setTotalSendSize:(int64_t)a3
{
  self->_totalSendSize = a3;
}

- (void).cxx_destruct
{
}

@end