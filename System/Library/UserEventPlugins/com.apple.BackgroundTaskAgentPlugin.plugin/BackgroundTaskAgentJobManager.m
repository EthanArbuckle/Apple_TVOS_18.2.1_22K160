@interface BackgroundTaskAgentJobManager
- (BOOL)areNetworkingRequirementsMetForJob:(id)a3 withCurrentDeviceState:(id *)a4;
- (BOOL)hasPendingJobs;
- (BOOL)validateAndAddDefaults:(id)a3;
- (BackgroundTaskAgentJobManager)initWithUserEventAgentProvider:(void *)a3;
- (BackgroundTaskAgentMonitor)monitor;
- (__CFDictionary)jobList;
- (void)BackgroundTaskAgentMonitoredConditionChangedWithTimeChange:(double *)a3;
- (void)addJobToQueue:(id)a3 withToken:(__CFNumber *)a4;
- (void)adjustTime:(double)a3;
- (void)cancelJobWithToken:(unint64_t)a3;
- (void)cancelTimer;
- (void)dealloc;
- (void)evalJobConditions:(id)a3 withCurrentDeviceState:(id *)a4 andStoreJobStatusIn:(id *)a5;
- (void)getCurrentDeviceState:(id *)a3;
- (void)hardTimerFired:(id)a3;
- (void)hasJobStatusChanged:(id)a3 withToken:(__CFNumber *)a4 withCurrentDeviceState:(id *)a5 withPointerToExpiredJobs:(__CFDictionary *)a6;
- (void)newJob:(id)a3 withToken:(unint64_t)a4;
- (void)pcTimerFired:(id)a3;
- (void)postClientNotificationForJob:(id)a3 withToken:(__CFNumber *)a4;
- (void)printCurrentDeviceState:(id *)a3;
- (void)printJob:(id)a3 withToken:(__CFNumber *)a4 withPrefix:(const char *)a5 withLogLevel:(int)a6 withJobStatus:(BOOL)a7;
- (void)printJobListwithPrefix:(const char *)a3 withLogLevel:(int)a4 withJobStatus:(BOOL)a5;
- (void)processJobList;
- (void)processJobListImmediately;
- (void)processPendingJobs:(id)a3;
- (void)removeJob:(id)a3 withToken:(__CFNumber *)a4;
- (void)scheduleTimerIfNecessary;
- (void)setHasPendingJobs:(BOOL)a3;
- (void)userEventAgentProvider;
@end

@implementation BackgroundTaskAgentJobManager

- (BackgroundTaskAgentJobManager)initWithUserEventAgentProvider:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BackgroundTaskAgentJobManager;
  v4 = -[BackgroundTaskAgentJobManager init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    v4->_userEventAgentProvider = a3;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
    v5->_jobList = Mutable;
    if (Mutable)
    {
      v7 = objc_alloc(&OBJC_CLASS___BackgroundTaskAgentMonitor);
      xpc_event_provider_get_queue();
    }

    if (bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "initWithUserEventAgentProvider: CFDictionaryCreateMutable returned NULL => jobList allocation failure");
    }
    if (_logToFile) {
      BOOL v8 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "initWithUserEventAgentProvider: CFDictionaryCreateMutable returned NULL => jobList allocation failure");
    }

    return 0LL;
  }

  return v5;
}

- (void)processPendingJobs:(id)a3
{
  if (-[BackgroundTaskAgentJobManager hasPendingJobs](self, "hasPendingJobs", a3)) {
    -[BackgroundTaskAgentJobManager processJobListImmediately](self, "processJobListImmediately");
  }
}

- (void)newJob:(id)a3 withToken:(unint64_t)a4
{
  unint64_t valuePtr = a4;
  v11[0] = *(_OWORD *)"<unknown>";
  memset(&v11[1], 0, 112);
  xpc_get_event_name("com.apple.backgroundtaskagent", a4, v11);
  if (a3)
  {
    CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
    if (-[BackgroundTaskAgentJobManager validateAndAddDefaults:](self, "validateAndAddDefaults:", a3))
    {
      -[BackgroundTaskAgentJobManager addJobToQueue:withToken:](self, "addJobToQueue:withToken:", a3, v7);
      -[BackgroundTaskAgentJobManager processJobList](self, "processJobList");
    }

    else
    {
      -[BackgroundTaskAgentJobManager postClientNotificationForJob:withToken:]( self,  "postClientNotificationForJob:withToken:",  a3,  v7);
    }

    -[BackgroundTaskAgentMonitor debugPrintMonitorStatus]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "debugPrintMonitorStatus");
    v9[0] = @"event";
    v9[1] = @"token";
    v10[0] = @"add";
    v10[1] = v7;
    v9[2] = @"name";
    v10[2] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11);
    v9[3] = @"client";
    v10[3] = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName"));
    PLLogRegisteredEvent( 6LL,  @"BTA Job",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL),  0LL);
    CFRelease(v7);
  }

  else
  {
    if (bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "NewJob(%s, %llu): newJob is NULL",  (const char *)v11,  a4);
    }
    if (_logToFile && bta_logfile_asl_handle) {
      asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 3, "NewJob(%s, %llu): newJob is NULL", (const char *)v11, a4);
    }
  }

- (void)cancelJobWithToken:(unint64_t)a3
{
  unint64_t v6 = a3;
  CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberSInt64Type, &v6);
  if (!CFDictionaryContainsKey(-[BackgroundTaskAgentJobManager jobList](self, "jobList"), v4)) {
    goto LABEL_4;
  }
  Value = (OS_xpc_object *)CFDictionaryGetValue(-[BackgroundTaskAgentJobManager jobList](self, "jobList"), v4);
  v7[0] = @"event";
  v7[1] = @"token";
  v8[0] = @"remove";
  v8[1] = v4;
  v7[2] = @"client";
  v8[2] = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(Value, "BackgroundTaskAgentClientName"));
  PLLogRegisteredEvent( 6LL,  @"BTA Job",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL),  0LL);
  -[BackgroundTaskAgentJobManager removeJob:withToken:](self, "removeJob:withToken:", Value, v4);
  if (self->_nextHardDeadlineJob == Value || self->_nextSoftDeadlineJob == Value) {
LABEL_4:
  }
    -[BackgroundTaskAgentJobManager processJobList](self, "processJobList");
  CFRelease(v4);
}

- (void)dealloc
{
  if (self->_jobList)
  {
    if (CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList")) >= 1)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1FCC;
      v4[3] = &unk_C4B8;
      v4[4] = self;
      -[__CFDictionary enumerateKeysAndObjectsUsingBlock:]( -[BackgroundTaskAgentJobManager jobList](self, "jobList"),  "enumerateKeysAndObjectsUsingBlock:",  v4);
    }

    CFRelease(self->_jobList);
  }

  -[BackgroundTaskAgentJobManager cancelTimer](self, "cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BackgroundTaskAgentJobManager;
  -[BackgroundTaskAgentJobManager dealloc](&v3, "dealloc");
}

- (BOOL)validateAndAddDefaults:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowStartTime);
  if (v6 < Current + -300.0)
  {
    CFNumberRef v7 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      string = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log(v7, 0LL, 3, "validateAndAddDefaults(%s): Start Time (%.1f) Less Than Now (%.1f)", string, v6, Current);
    }

    v9 = (__asl_object_s *)bta_logfile_asl_handle;
    if (_logToFile) {
      BOOL v10 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
      asl_log(v9, 0LL, 3, "validateAndAddDefaults(%s): Start Time (%.1f) Less Than Now (%.1f)");
    }

- (void)addJobToQueue:(id)a3 withToken:(__CFNumber *)a4
{
  if (CFDictionaryContainsKey(-[BackgroundTaskAgentJobManager jobList](self, "jobList"), a4))
  {
    if (_logToConsole) {
      BOOL v7 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "addJobToQueue: Job Request with current token already present in job list, so removing it and adding the new one in its place.");
    }
    if (_logToFile) {
      BOOL v8 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "addJobToQueue: Job Request with current token already present in job list, so removing it and adding the new one in its place.");
    }
    -[BackgroundTaskAgentJobManager removeJob:withToken:]( self,  "removeJob:withToken:",  CFDictionaryGetValue(-[BackgroundTaskAgentJobManager jobList](self, "jobList"), a4),  a4);
  }

  xpc_retain(a3);
  CFDictionaryAddValue(-[BackgroundTaskAgentJobManager jobList](self, "jobList"), a4, a3);
}

- (void)printCurrentDeviceState:(id *)a3
{
  if (_logToFile | _logToConsole)
  {
    id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v4 appendFormat:@"CurrentDeviceState = {\n"];
    objc_msgSend( v4,  "appendFormat:",  @"    currentTime               = %@;\n",
      stringFromCFAbsoluteTime(a3->var0));
    objc_msgSend(v4, "appendFormat:", @"    currentBatteryLevel       = %.1f;\n", *(void *)&a3->var3);
    objc_msgSend(v4, "appendFormat:", @"    currentScreenBlankedTime  = %.1f;\n", *(void *)&a3->var1);
    objc_msgSend(v4, "appendFormat:", @"    currentPowerPluggedinTime = %.1f;\n", *(void *)&a3->var2);
    objc_msgSend(v4, "appendFormat:", @"    isInVoiceCall             = %d;\n", a3->var4);
    objc_msgSend(v4, "appendFormat:", @"    isRoaming                 = %d;\n", a3->var5);
    objc_msgSend(v4, "appendFormat:", @"    primaryLinkQuality        = %d;\n", a3->var6);
    objc_msgSend(v4, "appendFormat:", @"    primaryLinkIsCellular     = %d;\n", a3->var7);
    if (_logToConsole && bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "%s}",  (const char *)objc_msgSend(objc_msgSend(v4, "description"), "UTF8String"));
    }
    if (_logToFile)
    {
      if (bta_logfile_asl_handle) {
        asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "%s}",  (const char *)objc_msgSend(objc_msgSend(v4, "description"), "UTF8String"));
      }
    }
  }

- (void)getCurrentDeviceState:(id *)a3
{
  a3->double var0 = CFAbsoluteTimeGetCurrent();
  a3->var6 = -[BackgroundTaskAgentMonitor primaryLinkQuality]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "primaryLinkQuality");
  a3->var7 = -[BackgroundTaskAgentMonitor primaryLinkIsCellular]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "primaryLinkIsCellular");
  -[BackgroundTaskAgentMonitor batteryLevel](-[BackgroundTaskAgentJobManager monitor](self, "monitor"), "batteryLevel");
  a3->var3 = v5;
  a3->var4 = -[BackgroundTaskAgentMonitor isInVoiceCall]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "isInVoiceCall");
  a3->var5 = -[BackgroundTaskAgentMonitor isRoaming]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "isRoaming");
  unsigned int v6 = -[BackgroundTaskAgentMonitor isScreenBlanked]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "isScreenBlanked");
  double v7 = -1.0;
  double v8 = -1.0;
  if (v6)
  {
    double var0 = a3->var0;
    -[BackgroundTaskAgentMonitor lastScreenBlankedTime]( -[BackgroundTaskAgentJobManager monitor](self, "monitor", -1.0),  "lastScreenBlankedTime");
    double v8 = var0 - v10;
  }

  a3->var1 = v8;
  if (-[BackgroundTaskAgentMonitor isPowerPluggedin]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "isPowerPluggedin"))
  {
    double v11 = a3->var0;
    -[BackgroundTaskAgentMonitor lastPowerPluggedinTime]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "lastPowerPluggedinTime");
    double v7 = v11 - v12;
  }

  a3->var2 = v7;
  -[BackgroundTaskAgentJobManager printCurrentDeviceState:](self, "printCurrentDeviceState:", a3);
}

- (void)processJobList
{
  if ((byte_DA10 & 1) == 0)
  {
    byte_DA10 = 1;
    dispatch_time(0LL, 200000000LL);
    -[BackgroundTaskAgentJobManager userEventAgentProvider](self, "userEventAgentProvider");
    xpc_event_provider_get_queue();
  }

- (void)processJobListImmediately
{
  uint64_t v27 = 0LL;
  BOOL v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  if (-[BackgroundTaskAgentMonitor pendingNetworkUpdate]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "pendingNetworkUpdate"))
  {
    -[BackgroundTaskAgentJobManager setHasPendingJobs:](self, "setHasPendingJobs:", 1LL);
    if (_logToConsole) {
      BOOL v3 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "A new job was added during network status update. Will hold-off on processing the JobList until network status stabilizes.");
    }
    if (_logToFile) {
      BOOL v4 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "A new job was added during network status update. Will hold-off on processing the JobList until network status stabilizes.");
    }
  }

  else
  {
    -[BackgroundTaskAgentJobManager setHasPendingJobs:](self, "setHasPendingJobs:", 0LL);
    -[BackgroundTaskAgentJobManager getCurrentDeviceState:](self, "getCurrentDeviceState:", v26);
    double v5 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (_logToConsole) {
      BOOL v6 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      double v7 = -[BackgroundTaskAgentJobManager jobList](self, "jobList");
      CFIndex Count = CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList"));
      asl_log(v5, 0LL, 5, "processJobList: Before - Job List Pointer = %p, CFIndex Count = %ld", v7, Count);
    }

    v9 = (__asl_object_s *)bta_logfile_asl_handle;
    if (_logToFile) {
      BOOL v10 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      double v11 = -[BackgroundTaskAgentJobManager jobList](self, "jobList");
      CFIndex v12 = CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList"));
      asl_log(v9, 0LL, 7, "processJobList: Before - Job List Pointer = %p, CFIndex Count = %ld", v11, v12);
    }

    self->_shouldScheduleConditionTimer = 0;
    self->_nextHardDeadlineJob = 0LL;
    self->_nextSoftDeadlineJob = 0LL;
    self->_nextSoftDeadlineTime = 6048000.0;
    *(_OWORD *)&self->_batteryLevelNotificationThreshold = xmmword_8F00;
    v13 = -[BackgroundTaskAgentJobManager jobList](self, "jobList");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_3140;
    v22[3] = &unk_C508;
    __int128 v23 = v26[0];
    __int128 v24 = v26[1];
    __int128 v25 = v26[2];
    v22[4] = self;
    v22[5] = &v27;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v13, "enumerateKeysAndObjectsUsingBlock:", v22);
    if (v28[3])
    {
      if (_logToConsole && bta_logconsole_asl_handle) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "processJobList: Removing all expired jobs");
      }
      if (_logToFile && bta_logfile_asl_handle) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "processJobList: Removing all expired jobs");
      }
      v14 = (void *)v28[3];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_315C;
      v21[3] = &unk_C4B8;
      v21[4] = self;
      [v14 enumerateKeysAndObjectsUsingBlock:v21];
      CFRelease((CFTypeRef)v28[3]);
    }

    if (_logToConsole)
    {
      BOOL v15 = (__asl_object_s *)bta_logconsole_asl_handle;
      if (bta_logconsole_asl_handle)
      {
        v16 = -[BackgroundTaskAgentJobManager jobList](self, "jobList");
        CFIndex v17 = CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList"));
        asl_log(v15, 0LL, 5, "processJobList: After - Job List Pointer = %p, CFIndex Count = %ld", v16, v17);
      }
    }

    if (_logToFile)
    {
      v18 = (__asl_object_s *)bta_logfile_asl_handle;
      if (bta_logfile_asl_handle)
      {
        BOOL v19 = -[BackgroundTaskAgentJobManager jobList](self, "jobList");
        CFIndex v20 = CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList"));
        asl_log(v18, 0LL, 7, "processJobList: After - Job List Pointer = %p, CFIndex Count = %ld", v19, v20);
      }
    }

    -[BackgroundTaskAgentJobManager scheduleTimerIfNecessary](self, "scheduleTimerIfNecessary");
    if (self->_batteryLevelNotificationThreshold <= 100.0) {
      -[BackgroundTaskAgentMonitor notifyWhenBatteryLevel:]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "notifyWhenBatteryLevel:",  self->_batteryLevelNotificationThreshold);
    }
  }

  _Block_object_dispose(&v27, 8);
}

- (void)hasJobStatusChanged:(id)a3 withToken:(__CFNumber *)a4 withCurrentDeviceState:(id *)a5 withPointerToExpiredJobs:(__CFDictionary *)a6
{
  BOOL v10 = (const char *)kBackgroundTaskAgentJobStatus;
  int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentJobStatus);
  string = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
  double v11 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowStartTime);
  double v12 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowEndTime);
  int64_t v13 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  v14 = (__asl_object_s *)bta_logconsole_asl_handle;
  if (_logToConsole) {
    BOOL v15 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    v16 = -[NSString UTF8String](stringFromCFAbsoluteTime(v11), "UTF8String");
    CFIndex v17 = -[NSString UTF8String](stringFromCFAbsoluteTime(v12), "UTF8String");
    asl_log( v14,  0LL,  5,  "[Job Window] Start = %s; End = %s; Client=%s; Token=%s; Status = %d;",
      v16,
      v17,
      string,
      (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"),
      int64);
  }

  v18 = (__asl_object_s *)bta_logfile_asl_handle;
  if (_logToFile) {
    BOOL v19 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    CFIndex v20 = -[NSString UTF8String](stringFromCFAbsoluteTime(v11), "UTF8String");
    uint64_t v27 = -[NSString UTF8String](stringFromCFAbsoluteTime(v12), "UTF8String");
    asl_log( v18,  0LL,  7,  "[Job Window] Start = %s; End = %s; Client=%s; Token=%s; Status = %d;",
      v20,
      v27,
      string,
      (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"),
      int64);
  }

  double v21 = v11 - a5->var0;
  double v22 = v12 - a5->var0;
  if (v21 <= 0.0)
  {
    -[BackgroundTaskAgentJobManager evalJobConditions:withCurrentDeviceState:andStoreJobStatusIn:]( self,  "evalJobConditions:withCurrentDeviceState:andStoreJobStatusIn:",  a3,  a5,  v31);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusNetwork, v31[1]);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusScreenBlanked, v31[2]);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusPowerPluggedin, v31[3]);
    if (v22 >= 0.0)
    {
      self->_shouldScheduleConditionTimer = 1;
      xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobExpired, 0);
      if (v31[0])
      {
        if (int64 == 3)
        {
          if (_logToConsole && bta_logconsole_asl_handle) {
            asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "hasJobStatusChanged(%s, %s): Job Changed from Unsatisfied to Satisfied",  string,  (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"));
          }
          if (_logToFile && bta_logfile_asl_handle) {
            asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "hasJobStatusChanged(%s, %s): Job Changed from Unsatisfied to Satisfied",  string,  (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"));
          }
          xpc_dictionary_set_int64(a3, v10, 2LL);
          -[BackgroundTaskAgentJobManager postClientNotificationForJob:withToken:]( self,  "postClientNotificationForJob:withToken:",  a3,  a4);
        }
      }

      else
      {
        if (int64 == 2)
        {
          if (_logToConsole && bta_logconsole_asl_handle) {
            asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "hasJobStatusChanged(%s, %s): Job Changed from Satisfied to Unsatisfied",  string,  (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"));
          }
          if (_logToFile && bta_logfile_asl_handle) {
            asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "hasJobStatusChanged(%s, %s): Job Changed from Satisfied to Unsatisfied",  string,  (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"));
          }
          xpc_dictionary_set_int64(a3, v10, 3LL);
          -[BackgroundTaskAgentJobManager postClientNotificationForJob:withToken:]( self,  "postClientNotificationForJob:withToken:",  a3,  a4);
        }

        if (v31[5] && v32 < self->_batteryLevelNotificationThreshold) {
          self->_batteryLevelNotificationThreshold = v32;
        }
        if (v33)
        {
          double v26 = v34;
          if (v34 < self->_nextHardDeadlineTime)
          {
            self->_nextHardDeadlineJob = (OS_xpc_object *)a3;
            self->_nextHardDeadlineTime = v26;
          }
        }
      }

      goto LABEL_58;
    }

    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobExpired, 1);
    if (v31[0])
    {
      xpc_dictionary_set_int64(a3, v10, 2LL);
      if (_logToConsole && bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "hasJobStatusChanged(%s, %s): Job Expired and Satisfied",  string,  (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"));
      }
      if (_logToFile)
      {
        __int128 v23 = (__asl_object_s *)bta_logfile_asl_handle;
        if (bta_logfile_asl_handle)
        {
          objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String");
          asl_log(v23, 0LL, 7, "hasJobStatusChanged(%s, %s): Job Expired and Satisfied");
        }
      }
    }

    else
    {
      xpc_dictionary_set_int64(a3, v10, 3LL);
      if (_logToConsole && bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "hasJobStatusChanged(%s, %s): Job Expired and Unsatisfied",  string,  (const char *)objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String"));
      }
      if (_logToFile)
      {
        __int128 v24 = (__asl_object_s *)bta_logfile_asl_handle;
        if (bta_logfile_asl_handle)
        {
          objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String");
          asl_log(v24, 0LL, 7, "hasJobStatusChanged(%s, %s): Job Expired and Unsatisfied");
        }
      }
    }

    -[BackgroundTaskAgentJobManager postClientNotificationForJob:withToken:]( self,  "postClientNotificationForJob:withToken:",  a3,  a4);
    CFMutableDictionaryRef Mutable = *a6;
    if (*a6
      || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL),
          (*a6 = Mutable) != 0LL))
    {
      CFDictionaryAddValue(Mutable, a4, a3);
    }

    else
    {
      if (bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "CFDictionaryCreateMutable returned NULL => expiredJobs allocation failure");
      }
      if (_logToFile && bta_logfile_asl_handle) {
        asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "CFDictionaryCreateMutable returned NULL => expiredJobs allocation failure");
      }
    }
  }

  else if (v13 == 1)
  {
    if (v21 < self->_nextHardDeadlineTime)
    {
      self->_nextHardDeadlineJob = (OS_xpc_object *)a3;
      self->_nextHardDeadlineTime = v21;
    }
  }

  else if (v13 == 2 && v21 < self->_nextSoftDeadlineTime)
  {
    self->_nextSoftDeadlineJob = (OS_xpc_object *)a3;
    self->_nextSoftDeadlineTime = v21;
LABEL_58:
    if (v22 < self->_nextHardDeadlineTime)
    {
      self->_nextHardDeadlineJob = (OS_xpc_object *)a3;
      self->_nextHardDeadlineTime = v22;
    }
  }

- (void)postClientNotificationForJob:(id)a3 withToken:(__CFNumber *)a4
{
}

- (void)removeJob:(id)a3 withToken:(__CFNumber *)a4
{
  BOOL v7 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentJobWindowAdjustTime);
  BOOL v8 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentNetworkRequired);
  double v9 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentScreenBlankedTime);
  double v10 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentPowerPluggedinTime);
  int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  BOOL v12 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringVoiceCall);
  BOOL v13 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringRoaming);
  if (v7) {
    -[BackgroundTaskAgentMonitor decrementNumAdjustTimeJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "decrementNumAdjustTimeJobs");
  }
  if (v8) {
    -[BackgroundTaskAgentMonitor decrementNumNetworkJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "decrementNumNetworkJobs");
  }
  if (v9 >= 0.0) {
    -[BackgroundTaskAgentMonitor decrementNumScreenBlankedJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "decrementNumScreenBlankedJobs");
  }
  if (v10 < 0.0 && int64 != 2LL)
  {
    if (v12) {
      goto LABEL_12;
    }
LABEL_16:
    -[BackgroundTaskAgentMonitor decrementNumJobsNotAllowedDuringVoiceCall]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "decrementNumJobsNotAllowedDuringVoiceCall");
    if (v13) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  -[BackgroundTaskAgentMonitor decrementNumPowerPluggedinJobs]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "decrementNumPowerPluggedinJobs");
  if (!v12) {
    goto LABEL_16;
  }
LABEL_12:
  if (!v13) {
LABEL_13:
  }
    -[BackgroundTaskAgentMonitor decrementNumJobsNotAllowedWhileRoaming]( -[BackgroundTaskAgentJobManager monitor](self, "monitor"),  "decrementNumJobsNotAllowedWhileRoaming");
LABEL_14:
  CFDictionaryRemoveValue(-[BackgroundTaskAgentJobManager jobList](self, "jobList"), a4);
  xpc_release(a3);
}

- (void)scheduleTimerIfNecessary
{
  if (CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList")) <= 0)
  {
    if (_logToConsole) {
      BOOL v10 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "processJobList: No jobs - Cancelling PC Timer");
    }
    if (_logToFile) {
      BOOL v11 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "processJobList: No jobs - Cancelling PC Timer");
    }
    -[BackgroundTaskAgentJobManager cancelTimer](self, "cancelTimer");
  }

  else
  {
    -[PCSimpleTimer invalidate](self->_softTimer, "invalidate");

    self->_softTimer = 0LL;
    nextSoftDeadlineJob = self->_nextSoftDeadlineJob;
    if (nextSoftDeadlineJob)
    {
      BOOL v6 = -[PCSimpleTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCSimpleTimer),  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BTA-%s",  xpc_dictionary_get_string(nextSoftDeadlineJob, "BackgroundTaskAgentClientName")),  self,  "pcTimerFired:",  0LL,  self->_nextSoftDeadlineTime);
      self->_softTimer = v6;
      -[PCSimpleTimer setDisableSystemWaking:](v6, "setDisableSystemWaking:", 1LL);
      -[BackgroundTaskAgentJobManager userEventAgentProvider](self, "userEventAgentProvider");
      xpc_event_provider_get_queue();
    }

    nextHardDeadlineJob = self->_nextHardDeadlineJob;
    if (self->_shouldScheduleConditionTimer)
    {
      if (!nextHardDeadlineJob || self->_nextHardDeadlineTime > 3600.0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        v2 = @"BTA-PeriodicConditionMonitor";
        double v3 = 0.45;
        double nextHardDeadlineTime = 3600.0;
        if (Current - *(double *)&qword_D9F0 < 180.0)
        {
          if (_logToConsole && bta_logconsole_asl_handle) {
            asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "A ConditionMonitor timer was last scheduled within the past %d seconds. Skipping reschedule.",  180);
          }
          if (_logToFile)
          {
            if (bta_logfile_asl_handle) {
              asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "A ConditionMonitor timer was last scheduled within the past %d seconds. Skipping reschedule.");
            }
          }

          return;
        }

        goto LABEL_31;
      }
    }

    else if (!nextHardDeadlineJob)
    {
      double nextHardDeadlineTime = NAN;
LABEL_32:
      -[PCPersistentTimer invalidate](self->_hardTimer, "invalidate");

      self->_hardTimer = 0LL;
      CFIndex v17 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCPersistentTimer),  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  v2,  self,  "hardTimerFired:",  0LL,  nextHardDeadlineTime);
      self->_hardTimer = v17;
      -[PCPersistentTimer setMinimumEarlyFireProportion:](v17, "setMinimumEarlyFireProportion:", v3);
      -[BackgroundTaskAgentJobManager userEventAgentProvider](self, "userEventAgentProvider");
      xpc_event_provider_get_queue();
    }

    BOOL v12 = +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  self->_nextHardDeadlineTime);
    lastFireDate = self->_lastFireDate;
    v14 = self->_nextHardDeadlineJob;
    if (!lastFireDate || self->_lastHardDeadlineJob != v14)
    {
LABEL_30:
      self->_lastHardDeadlineJob = v14;

      self->_lastFireDate = v12;
      v16 = v12;
      v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BTA-%s",  xpc_dictionary_get_string(self->_nextHardDeadlineJob, "BackgroundTaskAgentClientName"));
      double nextHardDeadlineTime = self->_nextHardDeadlineTime;
      double v3 = 1.0;
      double Current = NAN;
LABEL_31:
      qword_D9F0 = *(void *)&Current;
      goto LABEL_32;
    }

    -[NSDate timeIntervalSinceDate:](lastFireDate, "timeIntervalSinceDate:", v12);
    if (v15 > 1.0)
    {
      v14 = self->_nextHardDeadlineJob;
      lastFireDate = self->_lastFireDate;
      goto LABEL_30;
    }

    if (_logToConsole && bta_logconsole_asl_handle) {
      asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "Waking timer has not changed. Skipping scheduling.");
    }
    if (_logToFile && bta_logfile_asl_handle) {
      asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "Waking timer has not changed. Skipping scheduling.");
    }
  }

- (void)hardTimerFired:(id)a3
{
  self->_lastHardDeadlineJob = 0LL;
  -[BackgroundTaskAgentJobManager pcTimerFired:](self, "pcTimerFired:", a3);
}

- (void)pcTimerFired:(id)a3
{
  if (_logToConsole) {
    BOOL v4 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "pcTimerFired");
  }
  if (_logToFile) {
    BOOL v5 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "pcTimerFired");
  }
  -[BackgroundTaskAgentJobManager processJobListImmediately](self, "processJobListImmediately");
}

- (void)cancelTimer
{
  self->_hardTimer = 0LL;
  -[PCSimpleTimer invalidate](self->_softTimer, "invalidate");

  self->_softTimer = 0LL;
}

- (void)BackgroundTaskAgentMonitoredConditionChangedWithTimeChange:(double *)a3
{
  if (_logToConsole) {
    BOOL v5 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitoredConditionChangedWithTimeChange:");
  }
  if (_logToFile) {
    BOOL v6 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitoredConditionChangedWithTimeChange:");
  }
  if (a3) {
    -[BackgroundTaskAgentJobManager adjustTime:](self, "adjustTime:", *a3);
  }
  -[BackgroundTaskAgentJobManager processJobList](self, "processJobList");
}

- (void)adjustTime:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_41D0;
  v3[3] = &unk_C528;
  *(double *)&v3[4] = a3;
  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:]( -[BackgroundTaskAgentJobManager jobList](self, "jobList"),  "enumerateKeysAndObjectsUsingBlock:",  v3);
}

- (void)evalJobConditions:(id)a3 withCurrentDeviceState:(id *)a4 andStoreJobStatusIn:(id *)a5
{
  double var1 = a4->var1;
  double var2 = a4->var2;
  string = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
  double v12 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentScreenBlankedTime);
  if (v12 < 0.0)
  {
    a5->double var2 = 1;
LABEL_5:
    double v13 = -1.0;
    goto LABEL_6;
  }

  if (var1 < 0.0)
  {
    a5->double var2 = 0;
    goto LABEL_5;
  }

  double v13 = v12 - a4->var1;
  a5->double var2 = v13 <= 0.0;
LABEL_6:
  double v14 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentPowerPluggedinTime);
  if (v14 < 0.0)
  {
    a5->double var3 = 1;
LABEL_10:
    double v15 = -1.0;
    goto LABEL_11;
  }

  if (var2 < 0.0)
  {
    a5->double var3 = 0;
    goto LABEL_10;
  }

  double v15 = v14 - a4->var2;
  a5->double var3 = v15 <= 0.0;
LABEL_11:
  a5->double var1 = -[BackgroundTaskAgentJobManager areNetworkingRequirementsMetForJob:withCurrentDeviceState:]( self,  "areNetworkingRequirementsMetForJob:withCurrentDeviceState:",  a3,  a4);
  double v16 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentRequiredBatteryLevel);
  double var3 = a4->var3;
  a5->var4 = var3 >= v16;
  BOOL v18 = a5->var1;
  if (!a5->var1) {
    goto LABEL_34;
  }
  if (!a5->var2 || !a5->var3)
  {
    BOOL v22 = v12 < 0.0;
    if (var1 < 0.0) {
      BOOL v22 = 1;
    }
    if (v12 < 0.0 || !v22)
    {
      BOOL v24 = v14 < 0.0;
      if (var2 < 0.0) {
        BOOL v24 = 1;
      }
      if (v14 < 0.0 || !v24)
      {
        if (var3 >= v16)
        {
          int v20 = 0;
          int v21 = 0;
          a5->double var0 = 0;
          a5->var5 = 0;
          a5->var6 = 101.0;
          int v19 = 1;
          a5->var7 = 1;
          if (v13 <= v15) {
            double v26 = v15;
          }
          else {
            double v26 = v13;
          }
          goto LABEL_36;
        }

- (BOOL)areNetworkingRequirementsMetForJob:(id)a3 withCurrentDeviceState:(id *)a4
{
  unsigned int var6 = a4->var6;
  double var2 = a4->var2;
  BOOL var7 = a4->var7;
  BOOL var4 = a4->var4;
  BOOL var5 = a4->var5;
  int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  BOOL v11 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentNetworkRequired);
  BOOL v12 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentCellularAllowed);
  BOOL v13 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringVoiceCall);
  BOOL v14 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringRoaming);
  int v15 = !var4 || v13;
  char v16 = !var5 || v14;
  if (!v12 || v15 == 0) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v16;
  }
  if (!v11) {
    return 1;
  }
  if (!var7) {
    BOOL v18 = 1;
  }
  return var6 && v18;
}

- (void)printJobListwithPrefix:(const char *)a3 withLogLevel:(int)a4 withJobStatus:(BOOL)a5
{
  if (_logToFile | _logToConsole)
  {
    if (-[BackgroundTaskAgentJobManager jobList](self, "jobList"))
    {
      if (CFDictionaryGetCount(-[BackgroundTaskAgentJobManager jobList](self, "jobList")) < 1)
      {
        if (_logToConsole) {
          BOOL v11 = bta_logconsole_asl_handle == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11) {
          asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "%s jobList CFIndex Count = 0", a3);
        }
        if (_logToFile) {
          BOOL v12 = bta_logfile_asl_handle == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12) {
          asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "%s jobList CFIndex Count = 0");
        }
      }

      else
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_487C;
        v13[3] = &unk_C550;
        v13[4] = self;
        v13[5] = a3;
        int v14 = a4;
        BOOL v15 = a5;
        -[__CFDictionary enumerateKeysAndObjectsUsingBlock:]( -[BackgroundTaskAgentJobManager jobList](self, "jobList"),  "enumerateKeysAndObjectsUsingBlock:",  v13);
      }
    }

    else
    {
      if (bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  3,  "%s jobList == NULL",  (const char *)objc_msgSend(objc_msgSend((id)a3, "description"), "UTF8String"));
      }
      double v9 = (__asl_object_s *)bta_logfile_asl_handle;
      if (_logToFile) {
        BOOL v10 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        objc_msgSend(objc_msgSend((id)a3, "description"), "UTF8String");
        asl_log(v9, 0LL, 3, "%s jobList == NULL");
      }
    }
  }

- (void)printJob:(id)a3 withToken:(__CFNumber *)a4 withPrefix:(const char *)a5 withLogLevel:(int)a6 withJobStatus:(BOOL)a7
{
  if (_logToFile | _logToConsole)
  {
    BOOL v7 = a7;
    id v12 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v12 appendFormat:@"%s\n(%s, %@) = {\n", a5, xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName"), a4];
    CFNumberGetValue(a4, kCFNumberSInt64Type, &valuePtr);
    [v12 appendString:@"--- Job Requirements ---------\n"];
    BOOL v13 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowStartTime))
    {
      double v14 = xpc_dictionary_get_double(a3, v13);
      [v12 appendFormat:@"    StartTime              = %@;\n", stringFromCFAbsoluteTime(v14)];
    }

    BOOL v15 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowEndTime))
    {
      double v16 = xpc_dictionary_get_double(a3, v15);
      [v12 appendFormat:@"    EndTime                = %@;\n", stringFromCFAbsoluteTime(v16)];
    }

    CFIndex v17 = (const char *)kBackgroundTaskAgentJobWindowAdjustTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowAdjustTime)) {
      objc_msgSend(v12, "appendFormat:", @"    AdjustTime             = %3d;", xpc_dictionary_get_BOOL(a3, v17));
    }
    BOOL v18 = (const char *)kBackgroundTaskAgentNetworkRequired;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentNetworkRequired)) {
      objc_msgSend(v12, "appendFormat:", @"    NetworkRequired        = %3d;", xpc_dictionary_get_BOOL(a3, v18));
    }
    int v19 = (const char *)kBackgroundTaskAgentCellularAllowed;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentCellularAllowed)) {
      objc_msgSend(v12, "appendFormat:", @"    CellularAllowed        = %3d;\n", xpc_dictionary_get_BOOL(a3, v19));
    }
    int v20 = (const char *)kBackgroundTaskAgentAllowedDuringVoiceCall;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentAllowedDuringVoiceCall)) {
      objc_msgSend(v12, "appendFormat:", @"    allowedDuringVoiceCall = %3d;", xpc_dictionary_get_BOOL(a3, v20));
    }
    int v21 = (const char *)kBackgroundTaskAgentAllowedDuringRoaming;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentAllowedDuringRoaming)) {
      objc_msgSend(v12, "appendFormat:", @"    allowedDuringRoaming   = %3d;", xpc_dictionary_get_BOOL(a3, v21));
    }
    BOOL v22 = (const char *)kBackgroundTaskAgentPowerOptLevel;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentPowerOptLevel)) {
      objc_msgSend( v12,  "appendFormat:",  @"    PowerOptLevel          = %3lld;\n",
    }
        xpc_dictionary_get_int64(a3, v22));
    __int128 v23 = (const char *)kBackgroundTaskAgentScreenBlankedTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentScreenBlankedTime)) {
      objc_msgSend( v12,  "appendFormat:",  @"    ScreenBlankedTime      = %.1f;",
    }
        xpc_dictionary_get_double(a3, v23));
    BOOL v24 = (const char *)kBackgroundTaskAgentPowerPluggedinTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentPowerPluggedinTime)) {
      objc_msgSend( v12,  "appendFormat:",  @"    PowerPluggedinTime     = %.1f;",
    }
        xpc_dictionary_get_double(a3, v24));
    __int128 v25 = (const char *)kBackgroundTaskAgentRequiredBatteryLevel;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentRequiredBatteryLevel)) {
      objc_msgSend( v12,  "appendFormat:",  @"    RequiredBatteryLevel   = %.1f;\n",
    }
        xpc_dictionary_get_double(a3, v25));
    if (v7)
    {
      [v12 appendString:@"\n--- Status Info --------------\n"];
      double v26 = (const char *)kBackgroundTaskAgentJobStatus;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatus)) {
        objc_msgSend( v12,  "appendFormat:",  @"    JobStatus              = %3lld;",
      }
          xpc_dictionary_get_int64(a3, v26));
      double v27 = (const char *)kBackgroundTaskAgentJobExpired;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobExpired)) {
        objc_msgSend(v12, "appendFormat:", @"    JobExpired             = %3d;", xpc_dictionary_get_BOOL(a3, v27));
      }
      BOOL v28 = (const char *)kBackgroundTaskAgentJobStatusNetwork;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatusNetwork)) {
        objc_msgSend( v12,  "appendFormat:",  @"    JobStatusNetwork       = %3d;\n",
      }
          xpc_dictionary_get_BOOL(a3, v28));
      uint64_t v29 = (const char *)kBackgroundTaskAgentJobStatusScreenBlanked;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatusScreenBlanked)) {
        objc_msgSend(v12, "appendFormat:", @"    JobStatusScreenBlanked = %3d;", xpc_dictionary_get_BOOL(a3, v29));
      }
      uint64_t v30 = (const char *)kBackgroundTaskAgentJobStatusPowerPluggedin;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatusPowerPluggedin)) {
        objc_msgSend(v12, "appendFormat:", @"    JobStatusPowerPluggedin= %3d;", xpc_dictionary_get_BOOL(a3, v30));
      }
    }

    if (_logToConsole) {
      BOOL v31 = 1;
    }
    else {
      BOOL v31 = a6 == 3;
    }
    if (v31 && bta_logconsole_asl_handle)
    {
      if (a6 >= 5) {
        int v32 = 5;
      }
      else {
        int v32 = a6;
      }
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  v32,  "%s\n}",  (const char *)objc_msgSend(objc_msgSend(v12, "description"), "UTF8String"));
    }

    if (_logToFile)
    {
      if (bta_logfile_asl_handle) {
        asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  a6,  "%s\n}",  (const char *)objc_msgSend(objc_msgSend(v12, "description"), "UTF8String"));
      }
    }
  }

- (void)userEventAgentProvider
{
  return self->_userEventAgentProvider;
}

- (__CFDictionary)jobList
{
  return self->_jobList;
}

- (BackgroundTaskAgentMonitor)monitor
{
  return self->_monitor;
}

- (BOOL)hasPendingJobs
{
  return self->_hasPendingJobs;
}

- (void)setHasPendingJobs:(BOOL)a3
{
  self->_hasPendingJobs = a3;
}

@end