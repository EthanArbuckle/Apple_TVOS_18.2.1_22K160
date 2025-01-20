@interface PreorderQueueClient
- (BOOL)supportsItemKind:(id)a3;
- (NSSet)itemKinds;
- (void)dealloc;
- (void)setItemKinds:(id)a3;
@end

@implementation PreorderQueueClient

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PreorderQueueClient;
  -[XPCClient dealloc](&v3, "dealloc");
}

- (NSSet)itemKinds
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_1000D93D4;
  v10 = sub_1000D93E4;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D93F0;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setItemKinds:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D9490;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (BOOL)supportsItemKind:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D9578;
  block[3] = &unk_10034CCC0;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end