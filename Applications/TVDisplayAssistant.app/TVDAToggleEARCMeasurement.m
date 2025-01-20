@interface TVDAToggleEARCMeasurement
+ (id)_timeoutError;
+ (id)_unknownError;
- (BOOL)enableEARC;
- (BSWatchdog)watchdog;
- (NSString)measurementTitle;
- (TVDAToggleEARCMeasurement)initWithEARCEnableIntention:(BOOL)a3;
- (id)completionBlock;
- (int64_t)eARCStatus;
- (void)_callCompletionIfNeededWithStatus:(int64_t)a3 error:(id)a4;
- (void)_handleTimeout;
- (void)cancel;
- (void)dealloc;
- (void)eARCStatusChanged:(int64_t)a3;
- (void)measureWithCompletion:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setWatchdog:(id)a3;
@end

@implementation TVDAToggleEARCMeasurement

- (TVDAToggleEARCMeasurement)initWithEARCEnableIntention:(BOOL)a3
{
  SEL v18 = a2;
  BOOL v17 = a3;
  v19 = 0LL;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVDAToggleEARCMeasurement;
  v19 = -[TVDAToggleEARCMeasurement init](&v16, "init");
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    v19->_enableEARC = v17;
    v19->_eARCStatus = -1LL;
    objc_initWeak(&from, v19);
    v8 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    v6 = &_dispatch_main_q;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_1000065B0;
    v13 = &unk_1000287B0;
    objc_copyWeak(&v14, &from);
    v7 = -[BSWatchdog initWithTimeout:queue:completion:](v8, "initWithTimeout:queue:completion:", v6, &v9, 15.0);
    watchdog = v19->_watchdog;
    v19->_watchdog = v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
  }

  v5 = v19;
  objc_storeStrong((id *)&v19, 0LL);
  return v5;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  -[BSWatchdog invalidate](self->_watchdog, "invalidate");
  v2 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
  -[PBSEARCConfigurator removeEARCObserver:](v2, "removeEARCObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVDAToggleEARCMeasurement;
  -[TVDAToggleEARCMeasurement dealloc](&v3, "dealloc");
}

- (NSString)measurementTitle
{
  return (NSString *)@"Checking (e)ARC";
}

- (void)measureWithCompletion:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_retainBlock(location[0]);
  id completionBlock = v9->_completionBlock;
  v9->_id completionBlock = v3;

  id v7 = sub_10001A69C();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_100006858((uint64_t)v10, v9->_enableEARC);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, v6, "DA setting (e)ARC to: %d", v10, 8u);
  }

  objc_storeStrong(&v7, 0LL);
  v5 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
  -[PBSEARCConfigurator addEARCObserver:](v5, "addEARCObserver:", v9);
  -[PBSEARCConfigurator enableEARC:](v5, "enableEARC:", v9->_enableEARC);
  -[BSWatchdog start](v9->_watchdog, "start");
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cancel
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = sub_10001A69C();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v5;
    sub_100002910(v4);
    _os_log_impl((void *)&_mh_execute_header, log, type, "DA cancelled eARC, triggering time out path", v4, 2u);
  }

  objc_storeStrong(location, 0LL);
  -[TVDAToggleEARCMeasurement _handleTimeout](v7, "_handleTimeout");
}

- (void)_handleTimeout
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = sub_10001A69C();
  char v18 = 1;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v18;
    sub_100002910(v17);
    _os_log_impl((void *)&_mh_execute_header, log, type, "DA time out toggling (e)ARC", v17, 2u);
  }

  objc_storeStrong(location, 0LL);
  int v11 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
  v12 = (char *)-[PBSEARCConfigurator eARCStatus](v11, "eARCStatus");

  objc_super v16 = v12;
  id v15 = 0LL;
  if (v12)
  {
    if (v12 == (char *)1)
    {
      id v6 = +[TVDAToggleEARCMeasurement _timeoutError](&OBJC_CLASS___TVDAToggleEARCMeasurement, "_timeoutError");
      id v7 = v15;
      id v15 = v6;
    }

    else if ((unint64_t)(v12 - 2) <= 1)
    {
      if (!v20->_enableEARC)
      {
        id v4 = +[TVDAToggleEARCMeasurement _unknownError](&OBJC_CLASS___TVDAToggleEARCMeasurement, "_unknownError");
        os_log_type_t v5 = v15;
        id v15 = v4;
      }
    }

    else
    {
      id v8 = +[TVDAToggleEARCMeasurement _unknownError](&OBJC_CLASS___TVDAToggleEARCMeasurement, "_unknownError");
      v9 = v15;
      id v15 = v8;
    }
  }

  else if (v20->_enableEARC)
  {
    id v2 = +[TVDAToggleEARCMeasurement _unknownError](&OBJC_CLASS___TVDAToggleEARCMeasurement, "_unknownError");
    id v3 = v15;
    id v15 = v2;
  }

  -[TVDAToggleEARCMeasurement _callCompletionIfNeededWithStatus:error:]( v20,  "_callCompletionIfNeededWithStatus:error:",  v16,  v15,  &v15);
  objc_storeStrong(v10, 0LL);
}

- (void)_callCompletionIfNeededWithStatus:(int64_t)a3 error:(id)a4
{
  objc_super v16 = self;
  SEL v15 = a2;
  id v14 = (void *)a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  objc_initWeak(&v12, v16);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100006C88;
  id v8 = &unk_1000287D8;
  objc_copyWeak(v11, &v12);
  v9 = v16;
  v11[1] = v14;
  id v10 = location;
  BSDispatchMain(&v4);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&v12);
  objc_storeStrong(&location, 0LL);
}

+ (id)_timeoutError
{
  v8[2] = a1;
  v8[1] = (id)a2;
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
  v8[0] = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"(e)ARC toggle timed out on state %ld",  -[PBSEARCConfigurator eARCStatus](v4, "eARCStatus"));

  int v5 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v9 = NSLocalizedFailureReasonErrorKey;
  id v10 = v8[0];
  int v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL);
  id v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"com.apple.TVDisplayAssistant.errors",  842004LL);

  objc_storeStrong(v8, 0LL);
  return v7;
}

+ (id)_unknownError
{
  id v4 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v3 = PBSDisplayManagerErrorDomain;
  NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
  id v8 = @"Failed to toggle (e)ARC";
  int v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL);
  int v6 = -[NSError initWithDomain:code:userInfo:](v4, "initWithDomain:code:userInfo:", v3, 832004LL);

  return v6;
}

- (void)eARCStatusChanged:(int64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  uint64_t v10 = a3;
  os_log_t oslog = (os_log_t)sub_10001A69C();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    sub_1000072F8((uint64_t)v13, v10);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "DA saw an (e)ARC status change to %ld", v13, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  id location = 0LL;
  if (v10 == -1) {
    goto LABEL_12;
  }
  if (v10)
  {
    if ((unint64_t)(v10 - 2) <= 1 && !v12->_enableEARC)
    {
LABEL_12:
      id v5 = +[TVDAToggleEARCMeasurement _unknownError](&OBJC_CLASS___TVDAToggleEARCMeasurement, "_unknownError");
      id v6 = location;
      id location = v5;
    }
  }

  else if (v12->_enableEARC)
  {
    id v3 = +[TVDAToggleEARCMeasurement _unknownError](&OBJC_CLASS___TVDAToggleEARCMeasurement, "_unknownError");
    id v4 = location;
    id location = v3;
  }

  if (v10 != 1) {
    -[TVDAToggleEARCMeasurement _callCompletionIfNeededWithStatus:error:]( v12,  "_callCompletionIfNeededWithStatus:error:",  v10,  location);
  }
  objc_storeStrong(&location, 0LL);
}

- (BOOL)enableEARC
{
  return self->_enableEARC;
}

- (int64_t)eARCStatus
{
  return self->_eARCStatus;
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end