@interface ADPostSiriEngagementService
- (ADPostSiriEngagementService)init;
- (ActivityDispatcher)_getActivityDispatcher;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)setActivityDispatcher:(id)a3;
@end

@implementation ADPostSiriEngagementService

- (ADPostSiriEngagementService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADPostSiriEngagementService;
  v2 = -[ADPostSiriEngagementService init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[ADService setIdentifier:](v3, "setIdentifier:", v6);
  }

  return v3;
}

- (ActivityDispatcher)_getActivityDispatcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027640C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  if (qword_100578308 != -1) {
    dispatch_once(&qword_100578308, block);
  }
  return self->_activityDispatcher;
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)setActivityDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end