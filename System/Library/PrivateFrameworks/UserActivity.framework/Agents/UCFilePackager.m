@interface UCFilePackager
- (BOOL)deliverNextPacket;
- (NSDictionary)options;
- (NSFileHandle)file;
- (NSMutableArray)queuedPackets;
- (NSString)uuid;
- (OS_dispatch_queue)fetchQ;
- (OS_dispatch_semaphore)nextPacketReady;
- (UCFilePackager)initWithFile:(id)a3 fileSize:(int64_t)a4 packetSize:(int64_t)a5 options:(id)a6 receiver:(id)a7;
- (UCFilePacketReceiver)receiver;
- (int64_t)currentPacketNumber;
- (int64_t)nextPacketNumber;
- (int64_t)nextPacketToDeliver;
- (int64_t)packetPreLoadCount;
- (int64_t)packetSize;
- (int64_t)tag;
- (int64_t)totalPacketCount;
- (void)checkShouldFetch;
- (void)prepNextPacket;
- (void)setCurrentPacketNumber:(int64_t)a3;
- (void)setFetchQ:(id)a3;
- (void)setFile:(id)a3;
- (void)setNextPacketNumber:(int64_t)a3;
- (void)setNextPacketReady:(id)a3;
- (void)setNextPacketToDeliver:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setPacketPreLoadCount:(int64_t)a3;
- (void)setPacketSize:(int64_t)a3;
- (void)setQueuedPackets:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTotalPacketCount:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation UCFilePackager

- (UCFilePackager)initWithFile:(id)a3 fileSize:(int64_t)a4 packetSize:(int64_t)a5 options:(id)a6 receiver:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___UCFilePackager;
  v15 = -[UCFilePackager init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    -[UCFilePackager setFile:](v15, "setFile:", v12);
    -[UCFilePackager setOptions:](v16, "setOptions:", v13);
    -[UCFilePackager setPacketSize:](v16, "setPacketSize:", a5);
    -[UCFilePackager setTotalPacketCount:](v16, "setTotalPacketCount:", vcvtpd_s64_f64((double)a4 / (double)a5));
    -[UCFilePackager setCurrentPacketNumber:](v16, "setCurrentPacketNumber:", 0LL);
    -[UCFilePackager setNextPacketNumber:](v16, "setNextPacketNumber:", 1LL);
    -[UCFilePackager setNextPacketToDeliver:](v16, "setNextPacketToDeliver:", 1LL);
    dispatch_queue_t v17 = dispatch_queue_create("UCFilePackagerReadQ", 0LL);
    -[UCFilePackager setFetchQ:](v16, "setFetchQ:", v17);

    dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
    -[UCFilePackager setNextPacketReady:](v16, "setNextPacketReady:", v18);

    -[UCFilePackager setPacketPreLoadCount:](v16, "setPacketPreLoadCount:", 2LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[UCFilePackager packetPreLoadCount](v16, "packetPreLoadCount")));
    -[UCFilePackager setQueuedPackets:](v16, "setQueuedPackets:", v19);

    -[UCFilePackager setReceiver:](v16, "setReceiver:", v14);
    -[UCFilePackager checkShouldFetch](v16, "checkShouldFetch");
  }

  return v16;
}

- (BOOL)deliverNextPacket
{
  int64_t v3 = -[UCFilePackager nextPacketToDeliver](self, "nextPacketToDeliver");
  int64_t v4 = -[UCFilePackager totalPacketCount](self, "totalPacketCount");
  if (v3 <= v4)
  {
    if (sub_1000397F4( (int)-[UCFilePackager nextPacketToDeliver](self, "nextPacketToDeliver"),  (int)-[UCFilePackager totalPacketCount](self, "totalPacketCount")))
    {
      os_log_t v5 = sub_100039584(@"pasteboard-server");
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v12 = -[UCFilePackager nextPacketToDeliver](self, "nextPacketToDeliver");
        __int16 v13 = 1024;
        unsigned int v14 = -[UCFilePackager totalPacketCount](self, "totalPacketCount");
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[Packager] Queuing delivery block %d/%d",  buf,  0xEu);
      }
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000319D4;
    block[3] = &unk_1000BCC58;
    block[4] = self;
    dispatch_async(v8, block);
  }

  return v3 <= v4;
}

- (void)prepNextPacket
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = -[UCFilePackager nextPacketNumber](v2, "nextPacketNumber");
  if (v3 <= -[UCFilePackager totalPacketCount](v2, "totalPacketCount"))
  {
    uint64_t v4 = -[UCFilePackager nextPacketNumber](v2, "nextPacketNumber");
    -[UCFilePackager setNextPacketNumber:]( v2,  "setNextPacketNumber:",  (char *)-[UCFilePackager nextPacketNumber](v2, "nextPacketNumber") + 1);
  }

  else
  {
    uint64_t v4 = -1LL;
  }

  objc_sync_exit(v2);

  if (v4 >= 1)
  {
    os_log_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UCFilePackager fetchQ](v2, "fetchQ"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100031D54;
    v6[3] = &unk_1000BD7B0;
    v6[4] = v2;
    v6[5] = v4;
    dispatch_async(v5, v6);
  }

- (void)checkShouldFetch
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UCFilePackager queuedPackets](self, "queuedPackets"));
  objc_sync_enter(v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UCFilePackager queuedPackets](self, "queuedPackets"));
  id v5 = [v4 count];
  unint64_t v6 = -[UCFilePackager packetPreLoadCount](self, "packetPreLoadCount");

  objc_sync_exit(v3);
}

- (int64_t)totalPacketCount
{
  return self->_totalPacketCount;
}

- (void)setTotalPacketCount:(int64_t)a3
{
  self->_totalPacketCount = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (UCFilePacketReceiver)receiver
{
  return (UCFilePacketReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFile:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOptions:(id)a3
{
}

- (int64_t)packetSize
{
  return self->_packetSize;
}

- (void)setPacketSize:(int64_t)a3
{
  self->_packetSize = a3;
}

- (int64_t)packetPreLoadCount
{
  return self->_packetPreLoadCount;
}

- (void)setPacketPreLoadCount:(int64_t)a3
{
  self->_packetPreLoadCount = a3;
}

- (NSMutableArray)queuedPackets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setQueuedPackets:(id)a3
{
}

- (int64_t)nextPacketNumber
{
  return self->_nextPacketNumber;
}

- (void)setNextPacketNumber:(int64_t)a3
{
  self->_nextPacketNumber = a3;
}

- (int64_t)nextPacketToDeliver
{
  return self->_nextPacketToDeliver;
}

- (void)setNextPacketToDeliver:(int64_t)a3
{
  self->_nextPacketToDeliver = a3;
}

- (int64_t)currentPacketNumber
{
  return self->_currentPacketNumber;
}

- (void)setCurrentPacketNumber:(int64_t)a3
{
  self->_currentPacketNumber = a3;
}

- (OS_dispatch_queue)fetchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setFetchQ:(id)a3
{
}

- (OS_dispatch_semaphore)nextPacketReady
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setNextPacketReady:(id)a3
{
}

- (void).cxx_destruct
{
}

@end