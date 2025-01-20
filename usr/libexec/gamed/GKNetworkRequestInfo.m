@interface GKNetworkRequestInfo
- (GKNetworkRequestInfo)init;
- (NSMutableDictionary)currentTasks;
- (NSMutableDictionary)pendingRequests;
- (id)description;
- (void)setCurrentTasks:(id)a3;
- (void)setPendingRequests:(id)a3;
@end

@implementation GKNetworkRequestInfo

- (GKNetworkRequestInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKNetworkRequestInfo;
  v2 = -[GKNetworkRequestInfo init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    currentTasks = v2->_currentTasks;
    v2->_currentTasks = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestInfo currentTasks](self, "currentTasks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestInfo pendingRequests](self, "pendingRequests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The current tasks are: %@ the pending tasks are:%@",  v3,  v4));

  return v5;
}

- (NSMutableDictionary)currentTasks
{
  return self->_currentTasks;
}

- (void)setCurrentTasks:(id)a3
{
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end