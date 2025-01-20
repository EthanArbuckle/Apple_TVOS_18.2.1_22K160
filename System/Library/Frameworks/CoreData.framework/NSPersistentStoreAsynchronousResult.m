@interface NSPersistentStoreAsynchronousResult
- (BOOL)_isCancelled;
- (NSError)operationError;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStoreAsynchronousResult)initWithContext:(id)a3 andProgress:(id)a4 completetionBlock:(id)a5;
- (NSProgress)progress;
- (void)_cancelProgress;
- (void)cancel;
- (void)dealloc;
- (void)setOperationError:(id)a3;
@end

@implementation NSPersistentStoreAsynchronousResult

- (NSPersistentStoreAsynchronousResult)initWithContext:(id)a3 andProgress:(id)a4 completetionBlock:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSPersistentStoreAsynchronousResult;
  v8 = -[NSPersistentStoreAsynchronousResult init](&v11, sel_init);
  if (v8)
  {
    v8->_requestProgress = (NSProgress *)a4;
    v8->_requestContext = (NSManagedObjectContext *)a3;
    if (a5) {
      v9 = _Block_copy(a5);
    }
    else {
      v9 = 0LL;
    }
    v8->_requestCompletionBlock = v9;
    v8->_flags = 0;
  }

  return v8;
}

- (void)dealloc
{
  self->_requestProgress = 0LL;
  self->_requestError = 0LL;

  self->_requestContext = 0LL;
  id requestCompletionBlock = self->_requestCompletionBlock;
  if (requestCompletionBlock)
  {
    _Block_release(requestCompletionBlock);
    self->_id requestCompletionBlock = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPersistentStoreAsynchronousResult;
  -[NSPersistentStoreAsynchronousResult dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  p_flags = &self->_flags;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_flags);
  while (__stlxr(v3 + 1, (unsigned int *)p_flags));
  -[NSProgress cancel](-[NSPersistentStoreAsynchronousResult progress](self, "progress"), "cancel");
}

- (void)_cancelProgress
{
  p_flags = &self->_flags;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_flags);
  while (__stlxr(v3 + 1, (unsigned int *)p_flags));
}

- (BOOL)_isCancelled
{
  p_flags = &self->_flags;
  do
    signed int v3 = __ldxr((unsigned int *)p_flags);
  while (__stxr(v3, (unsigned int *)p_flags));
  return v3 > 0;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSError)operationError
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOperationError:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24LL, 1);
}

@end