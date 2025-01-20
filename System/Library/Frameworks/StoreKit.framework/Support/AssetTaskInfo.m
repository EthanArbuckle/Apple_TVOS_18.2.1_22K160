@interface AssetTaskInfo
+ (id)newTaskInfoForTask:(id)a3;
+ (id)taskInfoForTask:(id)a3;
+ (void)recordTaskInfo:(id)a3 forTask:(id)a4;
+ (void)removeAllTaskInfo;
+ (void)removeTaskInfo:(id)a3;
- (AssetPromise)promise;
- (AssetRequestProperties)properties;
- (AssetTaskInfo)initWithTask:(id)a3;
- (BOOL)ignoreAssetCache;
- (KeepAlive)keepAlive;
- (NSError)error;
- (NSProgress)progress;
- (NSString)configurationID;
- (NSString)logKey;
- (NSURLRequest)request;
- (NSURLSession)session;
- (NSURLSessionTask)task;
- (NSURLSessionTaskMetrics)metrics;
- (OS_nw_activity)networkActivity;
- (int64_t)action;
- (unint64_t)bytesReceived;
- (unint64_t)requestOffset;
- (unint64_t)signpostId;
- (void)setAction:(int64_t)a3;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setConfigurationID:(id)a3;
- (void)setError:(id)a3;
- (void)setIgnoreAssetCache:(BOOL)a3;
- (void)setKeepAlive:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setProgress:(id)a3;
- (void)setPromise:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestOffset:(unint64_t)a3;
- (void)setSession:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
@end

@implementation AssetTaskInfo

+ (id)newTaskInfoForTask:(id)a3
{
  id v4 = a3;
  v5 = -[AssetTaskInfo initWithTask:](objc_alloc(&OBJC_CLASS___AssetTaskInfo), "initWithTask:", v4);
  [a1 recordTaskInfo:v5 forTask:v4];

  return v5;
}

- (AssetTaskInfo)initWithTask:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AssetTaskInfo;
  v6 = -[AssetTaskInfo init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 originalRequest]);
    request = v7->_request;
    v7->_request = (NSURLRequest *)v8;
  }

  return v7;
}

+ (void)recordTaskInfo:(id)a3 forTask:(id)a4
{
  v15 = a3;
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EFB0);
  if (!qword_10032EFA8)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    v7 = (void *)qword_10032EFA8;
    qword_10032EFA8 = v6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v15 task]);

  if (v8)
  {
    v9 = (void *)qword_10032EFA8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v15 task]);
    [v9 removeObjectForKey:v10];
  }

  objc_super v11 = (void *)v15[17];
  v15[17] = v5;
  id v12 = v5;

  v13 = (void *)qword_10032EFA8;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v15 task]);
  [v13 setObject:v15 forKey:v14];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EFB0);
}

+ (void)removeAllTaskInfo
{
  v2 = (void *)qword_10032EFA8;
  qword_10032EFA8 = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EFB0);
}

+ (void)removeTaskInfo:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EFB0);
  v3 = (void *)qword_10032EFA8;
  if (qword_10032EFA8)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
    [v3 removeObjectForKey:v4];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EFB0);
}

+ (id)taskInfoForTask:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EFB0);
  if (qword_10032EFA8) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10032EFA8 objectForKey:v3]);
  }
  else {
    id v4 = 0LL;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EFB0);

  return v4;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(unint64_t)a3
{
  self->_bytesReceived = a3;
}

- (NSString)configurationID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConfigurationID:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)ignoreAssetCache
{
  return self->_ignoreAssetCache;
}

- (void)setIgnoreAssetCache:(BOOL)a3
{
  self->_ignoreAssetCache = a3;
}

- (KeepAlive)keepAlive
{
  return (KeepAlive *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setKeepAlive:(id)a3
{
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLogKey:(id)a3
{
}

- (NSURLSessionTaskMetrics)metrics
{
  return (NSURLSessionTaskMetrics *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setMetrics:(id)a3
{
}

- (OS_nw_activity)networkActivity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setNetworkActivity:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (AssetPromise)promise
{
  return (AssetPromise *)objc_loadWeakRetained((id *)&self->_promise);
}

- (void)setPromise:(id)a3
{
}

- (AssetRequestProperties)properties
{
  return (AssetRequestProperties *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setProperties:(id)a3
{
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (unint64_t)requestOffset
{
  return self->_requestOffset;
}

- (void)setRequestOffset:(unint64_t)a3
{
  self->_requestOffset = a3;
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSURLSessionTask)task
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 136LL, 1);
}

- (void).cxx_destruct
{
}

@end