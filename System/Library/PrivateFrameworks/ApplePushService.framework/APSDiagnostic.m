@interface APSDiagnostic
+ (id)sharedInstance;
- (APSDiagnostic)init;
- (void)promptTapToRadarWithURL:(id)a3;
@end

@implementation APSDiagnostic

+ (id)sharedInstance
{
  if (qword_10014E940 != -1) {
    dispatch_once(&qword_10014E940, &stru_10011FDE0);
  }
  return (id)qword_10014E938;
}

- (APSDiagnostic)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSDiagnostic;
  v2 = -[APSDiagnostic init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.aps.diagnostic-queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (dispatch_object_s *)v2->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v5, v7);
  }

  return v2;
}

- (void)promptTapToRadarWithURL:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086244;
  block[3] = &unk_10011E4F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end