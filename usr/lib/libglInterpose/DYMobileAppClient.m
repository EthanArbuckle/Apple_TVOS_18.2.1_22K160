@interface DYMobileAppClient
- (DYMobileAppClient)initWithTransport:(id)a3;
- (void)_handleDidEnterBackground:(id)a3;
- (void)_handleWillEnterForeground:(id)a3;
- (void)dealloc;
@end

@implementation DYMobileAppClient

- (DYMobileAppClient)initWithTransport:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DYMobileAppClient;
  v3 = -[DYMobileAppClient initWithTransport:](&v8, "initWithTransport:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = *(dispatch_queue_s **)&v3->super.DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__globalSyncQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __39__DYMobileAppClient_initWithTransport___block_invoke;
    block[3] = &unk_1F94A8;
    block[4] = v4;
    dispatch_async(v5, block);
  }

  return v4;
}

id __39__DYMobileAppClient_initWithTransport___block_invoke(uint64_t a1)
{
  return -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  *(void *)(a1 + 32),  "_handleWillEnterForeground:",  UIApplicationWillEnterForegroundNotification,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYMobileAppClient;
  -[DYMobileAppClient dealloc](&v3, "dealloc");
}

- (void)_handleDidEnterBackground:(id)a3
{
  id v4 = objc_msgSend( [DYTransportMessage alloc],  "initWithKind:attributes:objectPayload:",  1544,  0,  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  -[DYMobileAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", v4, 0LL);
}

- (void)_handleWillEnterForeground:(id)a3
{
  id v4 = objc_msgSend( [DYTransportMessage alloc],  "initWithKind:attributes:objectPayload:",  1544,  0,  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  -[DYMobileAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", v4, 0LL);
}

@end