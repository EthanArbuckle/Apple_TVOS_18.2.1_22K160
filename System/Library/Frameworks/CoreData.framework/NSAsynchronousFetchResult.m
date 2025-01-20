@interface NSAsynchronousFetchResult
- (NSArray)finalResult;
- (NSAsynchronousFetchRequest)fetchRequest;
- (id)initForFetchRequest:(id)a3 withContext:(id)a4 andProgress:(id)a5 completetionBlock:(id)a6;
- (uint64_t)setFinalResult:(uint64_t)result;
- (void)dealloc;
- (void)setOperationError:(id)a3;
@end

@implementation NSAsynchronousFetchResult

- (id)initForFetchRequest:(id)a3 withContext:(id)a4 andProgress:(id)a5 completetionBlock:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSAsynchronousFetchResult;
  v7 = -[NSPersistentStoreAsynchronousResult initWithContext:andProgress:completetionBlock:]( &v9,  sel_initWithContext_andProgress_completetionBlock_,  a4,  a5,  a6);
  if (v7) {
    v7->_fetchRequest = (NSAsynchronousFetchRequest *)a3;
  }
  return v7;
}

- (NSArray)finalResult
{
  return self->_finalResult;
}

- (uint64_t)setFinalResult:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 56);
    if (v4 != a2)
    {

      *(void *)(v3 + 56) = a2;
    }

    return objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "fetchRequest"), "_setAsyncResultHandle:", 0);
  }

  return result;
}

- (void)setOperationError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSAsynchronousFetchResult;
  -[NSPersistentStoreAsynchronousResult setOperationError:](&v4, sel_setOperationError_, a3);
  -[NSFetchRequest _setAsyncResultHandle:]( -[NSAsynchronousFetchRequest fetchRequest](self->_fetchRequest, "fetchRequest"),  "_setAsyncResultHandle:",  0LL);
}

- (void)dealloc
{
  self->_fetchRequest = 0LL;
  self->_finalResult = 0LL;
  id intermediateResultCallback = self->_intermediateResultCallback;
  if (intermediateResultCallback)
  {
    _Block_release(intermediateResultCallback);
    self->_id intermediateResultCallback = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSAsynchronousFetchResult;
  -[NSPersistentStoreAsynchronousResult dealloc](&v4, sel_dealloc);
}

- (NSAsynchronousFetchRequest)fetchRequest
{
  return (NSAsynchronousFetchRequest *)objc_getProperty(self, a2, 48LL, 1);
}

@end