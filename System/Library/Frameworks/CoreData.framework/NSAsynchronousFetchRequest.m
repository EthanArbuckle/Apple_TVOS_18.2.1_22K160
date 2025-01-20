@interface NSAsynchronousFetchRequest
- (NSAsynchronousFetchRequest)initWithFetchRequest:(NSFetchRequest *)request completionBlock:(void *)blk;
- (NSFetchRequest)fetchRequest;
- (NSInteger)estimatedResultCount;
- (NSPersistentStoreAsynchronousFetchResultCompletionBlock)completionBlock;
- (id)description;
- (unint64_t)requestType;
- (void)dealloc;
- (void)setEstimatedResultCount:(NSInteger)estimatedResultCount;
@end

@implementation NSAsynchronousFetchRequest

- (NSAsynchronousFetchRequest)initWithFetchRequest:(NSFetchRequest *)request completionBlock:(void *)blk
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSAsynchronousFetchRequest;
  v6 = -[NSAsynchronousFetchRequest init](&v9, sel_init);
  if (v6)
  {
    v6->_fetchRequest = request;
    if (blk) {
      v7 = _Block_copy(blk);
    }
    else {
      v7 = 0LL;
    }
    v6->_requestCompletionBlock = v7;
    if (-[NSFetchRequest affectedStores](request, "affectedStores")) {
      -[NSPersistentStoreRequest setAffectedStores:]( v6,  "setAffectedStores:",  -[NSFetchRequest affectedStores](request, "affectedStores"));
    }
  }

  return v6;
}

- (unint64_t)requestType
{
  return 1LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAsynchronousFetchRequest;
  return (id)[NSString stringWithFormat:@"%@ with fetch request %@", -[NSAsynchronousFetchRequest description](&v3, sel_description), self->_fetchRequest];
}

- (void)dealloc
{
  self->_fetchRequest = 0LL;
  id requestCompletionBlock = self->_requestCompletionBlock;
  if (requestCompletionBlock)
  {
    _Block_release(requestCompletionBlock);
    self->_id requestCompletionBlock = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSAsynchronousFetchRequest;
  -[NSPersistentStoreRequest dealloc](&v4, sel_dealloc);
}

- (NSFetchRequest)fetchRequest
{
  return (NSFetchRequest *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSPersistentStoreAsynchronousFetchResultCompletionBlock)completionBlock
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (NSInteger)estimatedResultCount
{
  return self->_estimatedResultCount;
}

- (void)setEstimatedResultCount:(NSInteger)estimatedResultCount
{
  self->_estimatedResultCount = estimatedResultCount;
}

@end