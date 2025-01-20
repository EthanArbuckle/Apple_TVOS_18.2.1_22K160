@interface MADStateHandler
+ (id)sharedStateHandler;
- (MADStateHandler)init;
- (unint64_t)currentTimeoutRiskAndStartTime:(id *)a3;
- (void)addBreadcrumb:(id)a3;
- (void)dumpBreadcrumps;
- (void)enterKnownTimeoutRisk:(unint64_t)a3;
- (void)exitKnownTimeoutRisk;
@end

@implementation MADStateHandler

- (MADStateHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MADStateHandler;
  v2 = -[MADStateHandler init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.MADStateHandler", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    breadcrumbs = v2->_breadcrumbs;
    v2->_breadcrumbs = v5;

    timeoutRiskEntryTime = v2->_timeoutRiskEntryTime;
    v2->_knownRiskState = 0LL;
    v2->_timeoutRiskEntryTime = 0LL;
  }

  return v2;
}

+ (id)sharedStateHandler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100123F14;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6728 != -1) {
    dispatch_once(&qword_1001E6728, block);
  }
  return (id)qword_1001E6720;
}

- (void)addBreadcrumb:(id)a3
{
  v17[1] = (__uint64_t)&v18;
  id v4 = a3;
  v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v18);

  pthread_threadid_np(0LL, v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  if (qword_1001E6730 != -1) {
    dispatch_once(&qword_1001E6730, &stru_1001BE078);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001E6738 stringFromDate:v6]);
  __uint64_t v8 = v17[0];
  uint64_t v9 = qos_class_self();
  uint64_t v10 = VCPMAQoSDescription(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Thread 0x%-8llx QoS %@ %@",  v7,  v8,  v11,  v5));

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001240A8;
  block[3] = &unk_1001B9E00;
  block[4] = self;
  id v16 = v12;
  id v14 = v12;
  dispatch_sync(queue, block);
}

- (void)dumpBreadcrumps
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124148;
  block[3] = &unk_1001BC6A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)enterKnownTimeoutRisk:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100124380;
  v4[3] = &unk_1001BDC90;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)exitKnownTimeoutRisk
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124418;
  block[3] = &unk_1001BC6A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (unint64_t)currentTimeoutRiskAndStartTime:(id *)a3
{
  uint64_t v7 = 0LL;
  __uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001244C4;
  block[3] = &unk_1001BE058;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void).cxx_destruct
{
}

@end