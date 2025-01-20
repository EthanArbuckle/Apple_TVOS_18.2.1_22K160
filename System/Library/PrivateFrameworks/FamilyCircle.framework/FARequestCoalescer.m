@interface FARequestCoalescer
+ (FARequestCoalescer)sharedInstance;
- (FARequestCoalescer)init;
- (NSMutableDictionary)inFlightRequests;
- (OS_dispatch_queue)coalesceQueue;
- (id)performBlockForKey:(id)a3 force:(BOOL)a4 block:(id)a5;
- (void)setCoalesceQueue:(id)a3;
- (void)setInFlightRequests:(id)a3;
@end

@implementation FARequestCoalescer

+ (FARequestCoalescer)sharedInstance
{
  if (qword_100052728 != -1) {
    dispatch_once(&qword_100052728, &stru_100041EB8);
  }
  return (FARequestCoalescer *)(id)qword_100052720;
}

- (FARequestCoalescer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FARequestCoalescer;
  v2 = -[FARequestCoalescer init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("FACoalescedRequest Queue", v4);
    coalesceQueue = v2->_coalesceQueue;
    v2->_coalesceQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    inFlightRequests = v2->_inFlightRequests;
    v2->_inFlightRequests = v7;
  }

  return v2;
}

- (id)performBlockForKey:(id)a3 force:(BOOL)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100013EEC;
  v15[3] = &unk_100041F30;
  v15[4] = self;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  v13 = -[AAFPromise initWithBlock:](v10, "initWithBlock:", v15);

  return v13;
}

- (OS_dispatch_queue)coalesceQueue
{
  return self->_coalesceQueue;
}

- (void)setCoalesceQueue:(id)a3
{
}

- (NSMutableDictionary)inFlightRequests
{
  return self->_inFlightRequests;
}

- (void)setInFlightRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end