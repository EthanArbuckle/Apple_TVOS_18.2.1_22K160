@interface SOSDictionaryUpdate
- (BOOL)hasChanged:(__CFDictionary *)a3;
- (OS_dispatch_queue)queue;
- (SOSDictionaryUpdate)init;
- (void)dealloc;
- (void)onqueueFreeHashBuff;
- (void)reset;
- (void)setQueue:(id)a3;
@end

@implementation SOSDictionaryUpdate

- (SOSDictionaryUpdate)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SOSDictionaryUpdate;
  v2 = -[SOSDictionaryUpdate init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->currentHashBuf = 0LL;
    dispatch_queue_t v4 = dispatch_queue_create("SOSDictionaryUpdate", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SOSDictionaryUpdate;
  -[SOSDictionaryUpdate dealloc](&v3, "dealloc");
}

- (void)onqueueFreeHashBuff
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSDictionaryUpdate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  currentHashBuf = self->currentHashBuf;
  if (currentHashBuf)
  {
    free(currentHashBuf);
    self->currentHashBuf = 0LL;
  }

- (BOOL)hasChanged:(__CFDictionary *)a3
{
  dispatch_queue_t v4 = sub_1001AB8DC(a3);
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSDictionaryUpdate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001ABAB0;
  block[3] = &unk_1002939C8;
  block[5] = &v8;
  block[6] = v4;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)reset
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSDictionaryUpdate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AB8D4;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end