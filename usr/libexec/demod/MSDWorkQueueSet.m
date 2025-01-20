@interface MSDWorkQueueSet
+ (id)sharedInstance;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)backgroundDownloadQueue;
- (OS_dispatch_queue)contentDownloadConcurrentQueue;
- (OS_dispatch_queue)demoUpdateQueue;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)pollingQueue;
- (void)setBackgroundDownloadQueue:(id)a3;
- (void)setContentDownloadConcurrentQueue:(id)a3;
- (void)setDemoUpdateQueue:(id)a3;
- (void)setMessageQueue:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPollingQueue:(id)a3;
@end

@implementation MSDWorkQueueSet

+ (id)sharedInstance
{
  if (qword_100125308 != -1) {
    dispatch_once(&qword_100125308, &stru_1000F9B48);
  }
  return (id)qword_100125300;
}

- (OS_dispatch_queue)demoUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDemoUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (OS_dispatch_queue)pollingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPollingQueue:(id)a3
{
}

- (OS_dispatch_queue)backgroundDownloadQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBackgroundDownloadQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)contentDownloadConcurrentQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setContentDownloadConcurrentQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end