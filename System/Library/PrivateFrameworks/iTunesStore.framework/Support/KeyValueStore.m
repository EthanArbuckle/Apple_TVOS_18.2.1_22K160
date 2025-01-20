@interface KeyValueStore
+ (id)defaultKeyValueStore;
+ (void)getValuesWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)removeAccountWithMessage:(id)a3 connection:(id)a4;
+ (void)removeAllValuesWithMessage:(id)a3 connection:(id)a4;
+ (void)removeValuesWithMessage:(id)a3 connection:(id)a4;
+ (void)setValuesWithMessage:(id)a3 connection:(id)a4;
- (KeyValueStore)init;
- (id)valueForDomain:(id)a3 key:(id)a4;
- (void)_getValuesWithMessage:(id)a3 connection:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
- (void)_removeAccountWithMessage:(id)a3 connection:(id)a4;
- (void)_removeAllValuesWithMessage:(id)a3 connection:(id)a4;
- (void)_removeValuesWithMessage:(id)a3 connection:(id)a4;
- (void)_setValuesWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
@end

@implementation KeyValueStore

- (KeyValueStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KeyValueStore;
  v2 = -[KeyValueStore init](&v4, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.KeyValueStore", 0LL);
    v2->_keyValueStore = objc_alloc_init(&OBJC_CLASS___SSKeyValueStore);
  }

  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KeyValueStore;
  -[KeyValueStore dealloc](&v4, "dealloc");
}

+ (id)defaultKeyValueStore
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153DC4;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3540 != -1) {
    dispatch_once(&qword_1003A3540, block);
  }
  return (id)qword_1003A3538;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
}

- (id)valueForDomain:(id)a3 key:(id)a4
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = sub_100153EF4;
  v16 = sub_100153F04;
  uint64_t v17 = 0LL;
  v7 = dispatch_semaphore_create(0LL);
  keyValueStore = self->_keyValueStore;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100153F10;
  v11[3] = &unk_10034FBA8;
  v11[4] = v7;
  v11[5] = &v12;
  -[SSKeyValueStore getValueForDomain:key:usingBlock:](keyValueStore, "getValueForDomain:key:usingBlock:", a3, a4, v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

+ (void)getValuesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[KeyValueStore defaultKeyValueStore](&OBJC_CLASS___KeyValueStore, "defaultKeyValueStore");
  else {
    [v6 _handleMessage:a3 connection:a4 withReplyBlock:0];
  }
}

+ (void)observeXPCServer:(id)a3
{
}

+ (void)removeAccountWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)removeAllValuesWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)removeValuesWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)setValuesWithMessage:(id)a3 connection:(id)a4
{
}

- (void)_getValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001541B4;
  v4[3] = &unk_10034FC20;
  v4[4] = a3;
  v4[5] = self;
  -[KeyValueStore _handleMessage:connection:withReplyBlock:]( self,  "_handleMessage:connection:withReplyBlock:",  a3,  a4,  v4);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154430;
  block[3] = &unk_10034AF28;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015451C;
  block[3] = &unk_10034E028;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_removeAccountWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001545E4;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  -[KeyValueStore _handleMessage:connection:withBlock:](self, "_handleMessage:connection:withBlock:", a3, a4, v4);
}

- (void)_removeAllValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001546B0;
  v4[3] = &unk_10034FC20;
  v4[4] = a4;
  v4[5] = self;
  -[KeyValueStore _handleMessage:connection:withReplyBlock:]( self,  "_handleMessage:connection:withReplyBlock:",  a3,  a4,  v4);
}

- (void)_removeValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100154810;
  v4[3] = &unk_10034F298;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  -[KeyValueStore _handleMessage:connection:withReplyBlock:]( self,  "_handleMessage:connection:withReplyBlock:",  a3,  a4,  v4);
}

- (void)_setValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001549A8;
  v4[3] = &unk_10034F298;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  -[KeyValueStore _handleMessage:connection:withReplyBlock:]( self,  "_handleMessage:connection:withReplyBlock:",  a3,  a4,  v4);
}

@end