@interface TVAppCachePurgeTask
- (TVAggregateAppCachePurgeRequest)purgeRequest;
- (TVAppCachePurgeTask)init;
- (TVAppCachePurgeTask)initWithPurgeRequest:(id)a3;
- (TVAppCachePurgeTaskDelegate)delegate;
- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4;
- (int64_t)purgeableAmountWithUrgency:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TVAppCachePurgeTask

- (TVAppCachePurgeTask)init
{
  return -[TVAppCachePurgeTask initWithPurgeRequest:](self, "initWithPurgeRequest:", 0LL);
}

- (TVAppCachePurgeTask)initWithPurgeRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVAppCachePurgeTask;
  v6 = -[TVAppCachePurgeTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_purgeRequest, a3);
  }

  return v7;
}

- (int64_t)purgeableAmountWithUrgency:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePurgeTask purgeRequest](self, "purgeRequest"));
  id v6 = [v5 urgency];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePurgeTask purgeRequest](self, "purgeRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cacheURL]);
  id v11 = objc_msgSend(v8, "tvcd_sizeOfFileAtURL:", v10);

  return (int64_t)v11;
}

- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePurgeTask purgeRequest](self, "purgeRequest", a3));
  id v7 = [v6 urgency];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePurgeTask purgeRequest](self, "purgeRequest"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cacheURL]);
  id v8 = objc_msgSend(v9, "tvcd_sizeOfFileAtURL:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePurgeTask purgeRequest](self, "purgeRequest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cacheURL]);
  id v21 = 0LL;
  unsigned int v15 = [v12 removeItemAtURL:v14 error:&v21];
  id v16 = v21;

  if (v15)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[TVAppCachePurgeTask delegate](self, "delegate"));
    v18 = (void *)v17;
    if (v17 && (objc_opt_respondsToSelector(v17, "appCachePurgeTask:didPurgeAmount:atUrgency:") & 1) != 0) {
      [v18 appCachePurgeTask:self didPurgeAmount:v8 atUrgency:a4];
    }
  }

  else
  {
    id v19 = sub_100007290();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      sub_1000077D8(self, (uint64_t)v16, (os_log_s *)v18);
    }
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

- (TVAggregateAppCachePurgeRequest)purgeRequest
{
  return self->_purgeRequest;
}

- (TVAppCachePurgeTaskDelegate)delegate
{
  return (TVAppCachePurgeTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end