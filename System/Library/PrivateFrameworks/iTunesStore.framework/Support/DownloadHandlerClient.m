@interface DownloadHandlerClient
- (BOOL)sessionsNeedPowerAssertion;
- (BOOL)sessionsShouldBlockOtherDownloads;
- (DownloadHandlerClient)initWithInputConnection:(id)a3;
- (NSSet)disavowedSessionProperties;
- (NSSet)downloadPhasesToIgnore;
- (id)description;
- (id)resetDisavowedSessionProperties;
- (int64_t)handlerIdentifier;
- (void)addDisavowedSessionProperties:(id)a3;
- (void)dealloc;
- (void)setDownloadPhasesToIgnore:(id)a3;
- (void)setHandlerIdentifier:(int64_t)a3;
- (void)setSessionsNeedPowerAssertion:(BOOL)a3;
- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3;
@end

@implementation DownloadHandlerClient

- (DownloadHandlerClient)initWithInputConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadHandlerClient;
  result = -[XPCClient initWithInputConnection:](&v4, "initWithInputConnection:", a3);
  if (result)
  {
    result->_sessionsNeedPowerAssertion = 1;
    result->_sessionsShouldBlockOtherDownloads = 1;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadHandlerClient;
  -[XPCClient dealloc](&v3, "dealloc");
}

- (void)addDisavowedSessionProperties:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E0AC;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (NSSet)disavowedSessionProperties
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10001E1E8;
  v10 = sub_10001E1F8;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E204;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)downloadPhasesToIgnore
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10001E1E8;
  v10 = sub_10001E1F8;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E310;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)handlerIdentifier
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E3E8;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)resetDisavowedSessionProperties
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_10001E1E8;
  v10 = sub_10001E1F8;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E4D4;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)sessionsNeedPowerAssertion
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E5B8;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)sessionsShouldBlockOtherDownloads
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E674;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDownloadPhasesToIgnore:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E6F4;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setHandlerIdentifier:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E7A0;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setSessionsNeedPowerAssertion:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E81C;
  v4[3] = &unk_10034B328;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E89C;
  v4[3] = &unk_10034B328;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (id)description
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_10001E1E8;
  v10 = sub_10001E1F8;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E984;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end