@interface WLDRateLimiter
- (BOOL)_claimToken;
- (WLDRateLimiter)init;
- (WLDRateLimiter)initWithRate:(unint64_t)a3 burst:(unint64_t)a4;
- (unint64_t)burst;
- (unint64_t)rate;
- (void)_addToken;
- (void)setBurst:(unint64_t)a3;
- (void)setRate:(unint64_t)a3;
@end

@implementation WLDRateLimiter

- (WLDRateLimiter)init
{
  return 0LL;
}

- (WLDRateLimiter)initWithRate:(unint64_t)a3 burst:(unint64_t)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___WLDRateLimiter;
  v6 = -[WLDRateLimiter init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    v6->_rate = a3;
    v6->_burst = a4;
    v6->_tokens = a4;
    dispatch_queue_t v8 = dispatch_queue_create("WLDRateLimiterAccess", 0LL);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
    timer = v7->_timer;
    v7->_timer = (OS_dispatch_source *)v10;

    dispatch_source_set_timer((dispatch_source_t)v7->_timer, 0LL, 1000000000 * v7->_rate, 0LL);
    objc_initWeak(&location, v7);
    v12 = (dispatch_source_s *)v7->_timer;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __37__WLDRateLimiter_initWithRate_burst___block_invoke;
    v14[3] = &unk_10003CA78;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v12, v14);
    dispatch_resume((dispatch_object_t)v7->_timer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __37__WLDRateLimiter_initWithRate_burst___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _addToken];
    id WeakRetained = v2;
  }
}

- (void)setRate:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __26__WLDRateLimiter_setRate___block_invoke;
  v4[3] = &unk_10003D8E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

void __26__WLDRateLimiter_setRate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 != *(void *)(v2 + 8))
  {
    *(void *)(v2 + 8) = v1;
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(dispatch_source_s **)(v3 + 32);
    if (v4) {
      dispatch_source_set_timer(v4, 0LL, 1000000000LL * *(void *)(v3 + 8), 0LL);
    }
  }

- (unint64_t)rate
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __22__WLDRateLimiter_rate__block_invoke;
  v5[3] = &unk_10003D908;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__WLDRateLimiter_rate__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 8LL);
  return result;
}

- (void)setBurst:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __27__WLDRateLimiter_setBurst___block_invoke;
  v4[3] = &unk_10003D8E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __27__WLDRateLimiter_setBurst___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 16)) {
    *(void *)(v2 + 16) = v1;
  }
  return result;
}

- (unint64_t)burst
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __23__WLDRateLimiter_burst__block_invoke;
  v5[3] = &unk_10003D908;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__WLDRateLimiter_burst__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 16LL);
  return result;
}

- (void)_addToken
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __27__WLDRateLimiter__addToken__block_invoke;
  block[3] = &unk_10003D480;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __27__WLDRateLimiter__addToken__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  unint64_t v2 = *(void *)(v1 + 24);
  if (v2 < *(void *)(v1 + 16)) {
    *(void *)(v1 + 24) = v2 + 1;
  }
  return result;
}

- (BOOL)_claimToken
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __29__WLDRateLimiter__claimToken__block_invoke;
  v5[3] = &unk_10003D930;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__WLDRateLimiter__claimToken__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2)
  {
    *(void *)(v1 + 24) = v2 - 1;
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

- (void).cxx_destruct
{
}

@end