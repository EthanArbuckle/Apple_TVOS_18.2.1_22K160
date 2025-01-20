@interface W5XPCConnection
- (BOOL)isAdvertising;
- (BOOL)isBrowsing;
- (NSArray)activeRequests;
- (NSArray)eventIDs;
- (NSSet)faultEventMonitoringPeers;
- (NSString)processName;
- (NSURL)additionalLog;
- (NSUUID)uuid;
- (NSXPCConnection)connection;
- (W5XPCConnection)initWithXPCConnection:(id)a3;
- (W5XPCConnectionDelegate)delegate;
- (id)__activeRequestWithUUID:(id)a3;
- (void)__logMessage:(id)a3 timestamped:(BOOL)a4;
- (void)cancelAllRequestsAndReply:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 OnPeer:(id)a4 OfType:(int64_t)a5 reply:(id)a6;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)collectLogs:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)collectLogsDiagnosticMode:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5;
- (void)log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5;
- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5;
- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4;
- (void)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5;
- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4;
- (void)queryLocalPeerAndReply:(id)a3;
- (void)queryPeerCacheAndReply:(id)a3;
- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3;
- (void)queryStatusForPeer:(id)a3 reply:(id)a4;
- (void)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5;
- (void)runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)runWiFiPerformanceLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startAdvertisingAndReply:(id)a3;
- (void)startBrowsingAndReply:(id)a3;
- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4;
- (void)startMonitoringEvents:(id)a3 reply:(id)a4;
- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)startPeerDiscoveryWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)stopAdvertisingAndReply:(id)a3;
- (void)stopBrowsingAndReply:(id)a3;
- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5;
- (void)stopMonitoringEvents:(id)a3 reply:(id)a4;
- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)stopPeerDiscoveryWithUUID:(id)a3 reply:(id)a4;
- (void)submitFaultEvent:(id)a3 reply:(id)a4;
- (void)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5;
@end

@implementation W5XPCConnection

- (W5XPCConnection)initWithXPCConnection:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___W5XPCConnection;
  v4 = -[W5XPCConnection init](&v16, "init");
  v5 = v4;
  if (!a3) {
    goto LABEL_12;
  }
  if (!v4) {
    goto LABEL_12;
  }
  v6 = (NSXPCConnection *)a3;
  v5->_connection = v6;
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(-[NSXPCConnection processIdentifier](v6, "processIdentifier"), buffer, 0x1000u) < 1) {
    goto LABEL_12;
  }
  v7 =  -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  buffer,  4LL);
  if (!v7) {
    goto LABEL_12;
  }
  v8 = (NSString *)-[NSString copy](-[NSString lastPathComponent](v7, "lastPathComponent"), "copy");
  v5->_processName = v8;
  if (!v8) {
    goto LABEL_12;
  }
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifivelocity.xpc-connection", 0LL);
  v5->_queue = (OS_dispatch_queue *)v9;
  if (!v9) {
    goto LABEL_12;
  }
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5->_mutableActiveRequests = v10;
  if (!v10) {
    goto LABEL_12;
  }
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5->_mutableEventIDs = v11;
  if (!v11
    || (v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet), (v5->_mutableFaultEventMonitoringPeers = v12) == 0LL)
    || (v13 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter), (v5->_formatter = v13) == 0LL)
    || (-[NSDateFormatter setDateFormat:](v13, "setDateFormat:", @"MM/dd/yy HH:mm:ss.SSS"),
        v14 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"),
        (v5->_uuid = v14) == 0LL))
  {
LABEL_12:

    return 0LL;
  }

  return v5;
}

- (void)dealloc
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___W5XPCConnection;
  -[W5XPCConnection dealloc](&v4, "dealloc");
}

- (NSArray)activeRequests
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  dispatch_queue_t v9 = sub_10007B184;
  v10 = sub_10007B194;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B1A0;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)eventIDs
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  dispatch_queue_t v9 = sub_10007B184;
  v10 = sub_10007B194;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B2A4;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)faultEventMonitoringPeers
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  dispatch_queue_t v9 = sub_10007B184;
  v10 = sub_10007B194;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B3A8;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBrowsing
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B478;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAdvertising
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B538;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSURL)additionalLog
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_10007B184;
  v10 = sub_10007B194;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B62C;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__activeRequestWithUUID:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  mutableActiveRequests = self->_mutableActiveRequests;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableActiveRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(mutableActiveRequests);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v8);
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v9, "uuid")))
        {
          id v5 = [v9 copy];
          return v5;
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mutableActiveRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return v5;
}

- (void)__logMessage:(id)a3 timestamped:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_additionalLogURL)
  {
    fileHandle = self->_fileHandle;
  }

  else
  {
    uint64_t v8 = (NSURL *)-[NSURL copy]( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  -[NSString stringByAppendingPathExtension:]( -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString")),  "stringByAppendingPathExtension:",  @"log")),  "copy");
    self->_additionalLogURL = v8;
    if (!v8) {
      return;
    }
    if (!-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  -[NSURL path](self->_additionalLogURL, "path"),  0LL,  0LL)) {
      return;
    }
    fileHandle =  +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  -[NSURL path](self->_additionalLogURL, "path"));
    self->_fileHandle = fileHandle;
    if (!fileHandle) {
      return;
    }
  }

  -[NSFileHandle seekToEndOfFile](fileHandle, "seekToEndOfFile");
  if (v4) {
    char v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@\n",  -[NSDateFormatter stringFromDate:]( self->_formatter,  "stringFromDate:",  +[NSDate date](&OBJC_CLASS___NSDate, "date")),  a3);
  }
  else {
    char v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n", a3, v10);
  }
  -[NSFileHandle writeData:]( self->_fileHandle,  "writeData:",  -[NSString dataUsingEncoding:](v9, "dataUsingEncoding:", 4LL));
}

- (void)startMonitoringEvents:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007BA28;
  block[3] = &unk_1000D1BD0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopMonitoringEvents:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007BBB8;
  block[3] = &unk_1000D1BD0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryLocalPeerAndReply:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007BD44;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)queryStatusForPeer:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007BDD4;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007BE68;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007BEFC;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007BF90;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C024;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007C0B8;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C150;
  block[3] = &unk_1000D2130;
  block[4] = a5;
  block[5] = a4;
  block[6] = self;
  void block[7] = a3;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007C374;
  v8[3] = &unk_1000D20E0;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  v8[8] = a4;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007C594;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007C628;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007C6B8;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C748;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007C7DC;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007C870;
  v6[3] = &unk_1000D1FC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)collectLogs:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C908;
  block[3] = &unk_1000D2130;
  block[4] = a5;
  block[5] = a4;
  block[6] = self;
  void block[7] = a3;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)collectLogsDiagnosticMode:(id)a3 uuid:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007CB2C;
  v6[3] = &unk_1000D1FC8;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)startPeerDiscoveryWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007CD4C;
  v6[3] = &unk_1000D1FC8;
  v6[4] = a4;
  v6[5] = self;
  v6[6] = a3;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)stopPeerDiscoveryWithUUID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007CF20;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007CFBC;
  v8[3] = &unk_1000D3170;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  *(double *)&v8[9] = a4;
  v8[8] = a7;
  dispatch_async(queue, v8);
}

- (void)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007D1C8;
  v8[3] = &unk_1000D3170;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  *(double *)&v8[9] = a4;
  v8[8] = a7;
  dispatch_async(queue, v8);
}

- (void)runWiFiPerformanceLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007D3C4;
  v6[3] = &unk_1000D1FC8;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D5C0;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)cancelAllRequestsAndReply:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007D788;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)cancelRequestWithUUID:(id)a3 OnPeer:(id)a4 OfType:(int64_t)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D9D0;
  block[3] = &unk_1000D31C0;
  void block[7] = a6;
  block[8] = a5;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007DA8C;
  v6[3] = &unk_1000D31E8;
  v6[4] = self;
  v6[5] = a3;
  BOOL v7 = a4;
  v6[6] = a5;
  dispatch_async(queue, v6);
}

- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007DB30;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007DC24;
  block[3] = &unk_1000D1BD0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)submitFaultEvent:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007DCE0;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007DD74;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryPeerCacheAndReply:(id)a3
{
}

- (void)startAdvertisingAndReply:(id)a3
{
}

- (void)startBrowsingAndReply:(id)a3
{
}

- (void)stopAdvertisingAndReply:(id)a3
{
}

- (void)stopBrowsingAndReply:(id)a3
{
}

- (W5XPCConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (W5XPCConnectionDelegate *)a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

@end