@interface TaskQueue
+ (id)networkQueue;
- (NSArray)tasks;
- (NSString)name;
- (TaskQueue)init;
- (int64_t)maxConcurrentOperationCount;
- (int64_t)qualityOfService;
- (void)addTask:(id)a3;
- (void)addTaskWithBlock:(id)a3;
- (void)addTasks:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)cancelAllTasks;
- (void)setMaxConcurrentOperationCount:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setUnderlyingQueue:(id)a3;
- (void)waitUntilAllTasksAreFinished;
@end

@implementation TaskQueue

+ (id)networkQueue
{
  if (qword_10032DED0 != -1) {
    dispatch_once(&qword_10032DED0, &stru_1002E6E90);
  }
  return (id)qword_10032DEC8;
}

- (TaskQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TaskQueue;
  v2 = -[TaskQueue init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", @"com.apple.storekit.TaskQueue");
  }

  return v2;
}

- (int64_t)maxConcurrentOperationCount
{
  return -[NSOperationQueue maxConcurrentOperationCount](self->_operationQueue, "maxConcurrentOperationCount");
}

- (void)setMaxConcurrentOperationCount:(int64_t)a3
{
}

- (void)setUnderlyingQueue:(id)a3
{
}

- (NSString)name
{
  return -[NSOperationQueue name](self->_operationQueue, "name");
}

- (void)setName:(id)a3
{
}

- (NSArray)tasks
{
  return -[NSOperationQueue operations](self->_operationQueue, "operations");
}

- (int64_t)qualityOfService
{
  return -[NSOperationQueue qualityOfService](self->_operationQueue, "qualityOfService");
}

- (void)setQualityOfService:(int64_t)a3
{
}

- (void)addTask:(id)a3
{
}

- (void)addTasks:(id)a3 waitUntilFinished:(BOOL)a4
{
}

- (void)addTaskWithBlock:(id)a3
{
}

- (void)cancelAllTasks
{
}

- (void)waitUntilAllTasksAreFinished
{
}

- (void).cxx_destruct
{
}

@end