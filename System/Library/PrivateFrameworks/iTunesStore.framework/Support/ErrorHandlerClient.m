@interface ErrorHandlerClient
- (NSSet)failureTypes;
- (id)popAllSessions;
- (id)popSessionWithIdentifier:(int64_t)a3;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)setFailureTypes:(id)a3;
@end

@implementation ErrorHandlerClient

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ErrorHandlerClient;
  -[XPCClient dealloc](&v3, "dealloc");
}

- (void)addSession:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10015A900;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (NSSet)failureTypes
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10015AA60;
  v10 = sub_10015AA70;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015AA7C;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)popAllSessions
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10015AA60;
  v10 = sub_10015AA70;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015AB88;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)popSessionWithIdentifier:(int64_t)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  v10 = sub_10015AA60;
  uint64_t v11 = sub_10015AA70;
  uint64_t v12 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ACA4;
  block[3] = &unk_10034F808;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setFailureTypes:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10015AD80;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

@end