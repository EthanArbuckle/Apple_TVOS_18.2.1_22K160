@interface BKHIDStudyLogEventProcessor
+ (BOOL)shouldCreateStudyLogger;
- (BKHIDStudyLogEventProcessor)initWithContext:(id)a3;
- (BKIOHIDService)gyroService;
- (BKIOHIDServiceMatcher)gyroMatcher;
- (BKSLocalDefaults)localDefaults;
- (BOOL)isButtonLoggingEnabled;
- (OS_dispatch_queue)matcherQueue;
- (SLGLog)keyboardLog;
- (SLGTimedLogger)cameraLog;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setButtonLoggingEnabled:(BOOL)a3;
- (void)setCameraLog:(id)a3;
- (void)setGyroMatcher:(id)a3;
- (void)setGyroService:(id)a3;
- (void)setKeyboardLog:(id)a3;
- (void)setLocalDefaults:(id)a3;
- (void)setMatcherQueue:(id)a3;
@end

@implementation BKHIDStudyLogEventProcessor

- (BKHIDStudyLogEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  if (+[BKHIDStudyLogEventProcessor shouldCreateStudyLogger]( &OBJC_CLASS___BKHIDStudyLogEventProcessor,  "shouldCreateStudyLogger"))
  {
    v22.receiver = self;
    v22.super_class = [BKHIDStudyLogEventProcessor class];
    BKHIDStudyLogEventProcessor *v5 = [[BKHIDStudyLogEventProcessor alloc] init];
    if (v5)
    {
      uint64_t v6 = [BKSDefaults localDefaults];
      localDefaults = v5->_localDefaults;
      v5->_localDefaults = (BKSLocalDefaults *)v6;

      uint64_t v8 = [SLGLog sharedInstance];
      keyboardLog = v5->_keyboardLog;
      v5->_keyboardLog = (SLGLog *)v8;

      dispatch_queue_t v10 = dispatch_queue_create("BKHIDEventStudyLoggerMatcherQueue", 0LL);
      matcherQueue = v5->_matcherQueue;
      v5->_matcherQueue = (OS_dispatch_queue *)v10;

      v12 = [v4 serviceMatcherDataProvider];
      BKIOHIDServiceMatcher *v13 = [[BKIOHIDServiceMatcher alloc] initWithUsagePage:65280LL usage:9LL builtIn:1LL dataProvider:v12];
      gyroMatcher = v5->_gyroMatcher;
      v5->_gyroMatcher = v13;

      [v5->_gyroMatcher startObserving:v5 queue:v5->_matcherQueue];
      SLGTimedLogger *v15 = [[SLGTimedLogger alloc] init];
      SLGActivatableLogger *v16 = [[SLGActivatableLogger alloc] init];
      v17 = [SLGLog sharedInstance];
      id v18 = [v16 initWithLogger:v17];
      SLGTimedLogger *v19 = [[SLGTimedLogger alloc] initWithLogger:v15 duration:1.0];
      cameraLog = v5->_cameraLog;
      v5->_cameraLog = v19;

      [v5->_cameraLog setActivationHandler:^() {
stru_1000B5638();
}];
      [v5->_cameraLog setDeactivationHandler:&stru_1000B5658];
    }
  }

  else
  {

    v5 = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  [v3 superclass] = [BKHIDStudyLogEventProcessor class];
  [v3 dealloc];
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v6 = *a3;
  int Type = IOHIDEventGetType(*a3, a2);
  switch(Type)
  {
    case 20:
      localDefaults = self->_localDefaults;
      v19 = self->_cameraLog;
      if ((-[BKSLocalDefaults disableStudyLogGyroLogging](localDefaults, "disableStudyLogGyroLogging") & 1) == 0)
      {
        v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472LL;
        v34 = sub_100008CFC;
        v35 = &unk_1000B56D8;
        v36 = v6;
        v20 = @"com.apple.backboard.hid.gyro";
LABEL_16:
        [v19 logBlock:v32 domain:v20];
      }

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  BKIOHIDService *v5 = [a4 firstObject];
  gyroService = self->_gyroService;
  self->_gyroService = v5;

  [self->_gyroService addDisappearanceObserver:self queue:self->_matcherQueue];
  v7 = self->_gyroService;
  id v8 = [NSNumber numberWithDouble:100000.0];
  [v7 setProperty:v8 forKey:@"ReportInterval"];
}

- (void)serviceDidDisappear:(id)a3
{
  gyroService = self->_gyroService;
  self->_gyroService = 0LL;
}

- (BOOL)isButtonLoggingEnabled
{
  return self->_buttonLoggingEnabled;
}

- (void)setButtonLoggingEnabled:(BOOL)a3
{
  self->_buttonLoggingEnabled = a3;
}

- (SLGLog)keyboardLog
{
  return self->_keyboardLog;
}

- (void)setKeyboardLog:(id)a3
{
}

- (SLGTimedLogger)cameraLog
{
  return self->_cameraLog;
}

- (void)setCameraLog:(id)a3
{
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setLocalDefaults:(id)a3
{
}

- (BKIOHIDServiceMatcher)gyroMatcher
{
  return self->_gyroMatcher;
}

- (void)setGyroMatcher:(id)a3
{
}

- (BKIOHIDService)gyroService
{
  return self->_gyroService;
}

- (void)setGyroService:(id)a3
{
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMatcherQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)shouldCreateStudyLogger
{
  SLGLog *v2 = [SLGLog sharedInstance];
  unsigned int v3 = [v2 isEnabled];

  if (v3)
  {
    id v4 = sub_10003F124();
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "StudyLog is enabled", v7, 2u);
    }
  }

  return v3;
}

@end