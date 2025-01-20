@interface SPSampledProcess
+ (BOOL)receivedHidEventForPid:(int)a3 eventTimeMachAbs:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6;
+ (id)allSampledProcesses;
+ (id)copySampledProcessForPid:(int)a3 isWSBased:(BOOL)a4 createIfUnsampled:(BOOL)a5 wasSampled:(BOOL *)a6;
- (BOOL)cancelOnMemoryPressure;
- (BOOL)startSampling;
- (SPSampledProcess)initWithPid:(int)a3 isWSBased:(BOOL)a4;
- (unsigned)occasionalDataIntervalSec;
- (unsigned)samplingIntervalUs;
- (unsigned)samplingMode;
- (void)_performSamplePrinterWork:(id)a3;
- (void)_samplingHasCompletedWithEndSnapshot:(id)a3 withReason:(unsigned __int8)a4;
- (void)_saveReportToStream:(__sFILE *)a3;
- (void)createHIDExitSource;
- (void)dealloc;
- (void)deleteHIDExitSource;
- (void)gatherLoadInfoForPid:(int)a3;
- (void)removeSelfFromPidCache;
- (void)requireHIDEvent:(BOOL)a3;
- (void)setCancelOnMemoryPressure:(BOOL)a3;
- (void)setOccasionalDataIntervalSec:(unsigned int)a3;
- (void)setSamplingCompletionHandlerQueue:(id)a3 andBlock:(id)a4;
- (void)setSamplingIntervalUs:(unsigned int)a3;
- (void)setSamplingMode:(unsigned __int8)a3 withAdditionalSampledProcesses:(id)a4;
- (void)setSamplingTimeoutAtTime:(double)a3;
- (void)setStopWhenProcessExits:(BOOL)a3;
- (void)stopSamplingWithReason:(unsigned __int8)a3;
@end

@implementation SPSampledProcess

- (SPSampledProcess)initWithPid:(int)a3 isWSBased:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SPSampledProcess;
  v6 = -[SPMonitoredProcess initWithPid:](&v9, "initWithPid:");
  if (v6)
  {
    snprintf(__str, 0x40uLL, "com.apple.spindump.sampled_process_%d", a3);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->super.super._processingQueue = (OS_dispatch_queue *)dispatch_queue_create(__str, v7);
    dispatch_release(v7);
    v6->super.super._isWSBased = a4;
    v6->_samplingMode = 3;
    v6->_sampledProcesses = 0LL;
    v6->_cancelOnMemoryPressure = 0;
  }

  return v6;
}

- (void)dealloc
{
  hidEventSem = self->_hidEventSem;
  if (hidEventSem) {
    dispatch_release((dispatch_object_t)hidEventSem);
  }
  exitHIDSource = self->_exitHIDSource;
  if (exitHIDSource) {
    dispatch_release((dispatch_object_t)exitHIDSource);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SPSampledProcess;
  -[SPProcessEvent dealloc](&v5, "dealloc");
}

- (BOOL)cancelOnMemoryPressure
{
  return self->_cancelOnMemoryPressure;
}

- (void)setCancelOnMemoryPressure:(BOOL)a3
{
  self->_cancelOnMemoryPressure = a3;
  if (a3) {
    +[SPSampledProcess startMemoryPressureTimer](&OBJC_CLASS___SPSampledProcess, "startMemoryPressureTimer");
  }
}

+ (id)copySampledProcessForPid:(int)a3 isWSBased:(BOOL)a4 createIfUnsampled:(BOOL)a5 wasSampled:(BOOL *)a6
{
  uint64_t v9 = *(void *)&a3;
  if (qword_1000E7CA8 != -1) {
    dispatch_once(&qword_1000E7CA8, &stru_1000D9890);
  }
  v10 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v9);
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  v20 = sub_100060748;
  v21 = sub_100060758;
  uint64_t v22 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100060764;
  v13[3] = &unk_1000D98B8;
  v13[4] = v10;
  v13[5] = &v17;
  BOOL v15 = a5;
  int v14 = v9;
  BOOL v16 = a4;
  v13[6] = a6;
  dispatch_sync((dispatch_queue_t)qword_1000E7CB8, v13);

  v11 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (id)allSampledProcesses
{
  return [(id)qword_1000E7CB0 allValues];
}

- (void)removeSelfFromPidCache
{
  if (self->super.super._isSelfInPidCache)
  {
    self->super.super._isSelfInPidCache = 0;
    int targetProcessId = self->super.super._targetProcessId;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000608D4;
    v3[3] = &unk_1000D97D8;
    int v4 = targetProcessId;
    v3[4] = self;
    dispatch_async((dispatch_queue_t)qword_1000E7CB8, v3);
  }

- (void)gatherLoadInfoForPid:(int)a3
{
}

- (void)createHIDExitSource
{
  if (self->_exitHIDSource) {
    return;
  }
  p_uintptr_t targetProcessId = &self->super.super._targetProcessId;
  uintptr_t targetProcessId = self->super.super._targetProcessId;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 2uLL);
  v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  targetProcessId,  0xA0000000uLL,  global_queue);
  self->_exitHIDSource = v6;
  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100060CEC;
    handler[3] = &unk_1000D95B0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
    dispatch_resume((dispatch_object_t)self->_exitHIDSource);
    return;
  }

  if ((*p_targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E7D30)
    {
      int v7 = *__error();
      v8 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10008F390();
      }
      *__error() = v7;
    }

    if (byte_1000E7D31) {
      BOOL v9 = dword_1000E74E0 <= 3;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9) {
      return;
    }
    int v10 = *__error();
    v11 = sub_10002EF3C(*p_targetProcessId);
    v12 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Unable to allocate proc exit HID dispatch source",  v11,  *p_targetProcessId);
    if (v12)
    {
      v13 = v12;
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      if (CStringPtr)
      {
        BOOL v15 = (char *)CStringPtr;
        BOOL v16 = 0LL;
      }

      else
      {
        BOOL v15 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v13, v15, 1024LL, 0x8000100u);
        BOOL v16 = v15;
      }

      if (qword_1000E7D38) {
        v26 = (FILE *)qword_1000E7D38;
      }
      else {
        v26 = __stderrp;
      }
      fprintf(v26, "%s\n", v15);
      if (v16) {
        free(v16);
      }
      v27 = v13;
LABEL_51:
      CFRelease(v27);
LABEL_52:
      *__error() = v10;
      return;
    }

    v25 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_10008F324();
    }
    goto LABEL_40;
  }

  if (byte_1000E7D30)
  {
    int v17 = *__error();
    v18 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10008F428();
    }
    *__error() = v17;
  }

  if (byte_1000E7D31) {
    BOOL v19 = dword_1000E74E0 <= 3;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    int v10 = *__error();
    v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Unable to allocate proc exit HID dispatch source");
    if (v20)
    {
      v21 = v20;
      uint64_t v22 = CFStringGetCStringPtr(v20, 0x8000100u);
      if (v22)
      {
        v23 = (char *)v22;
        v24 = 0LL;
      }

      else
      {
        v23 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v21, v23, 1024LL, 0x8000100u);
        v24 = v23;
      }

      if (qword_1000E7D38) {
        v30 = (FILE *)qword_1000E7D38;
      }
      else {
        v30 = __stderrp;
      }
      fprintf(v30, "%s\n", v23);
      if (v24) {
        free(v24);
      }
      v27 = v21;
      goto LABEL_51;
    }

    v28 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_10008F3FC();
    }
LABEL_40:
    if (qword_1000E7D38) {
      v29 = (FILE *)qword_1000E7D38;
    }
    else {
      v29 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v29);
    goto LABEL_52;
  }

- (void)deleteHIDExitSource
{
  exitHIDSource = self->_exitHIDSource;
  if (exitHIDSource)
  {
    dispatch_release((dispatch_object_t)exitHIDSource);
    self->_exitHIDSource = 0LL;
  }

- (void)requireHIDEvent:(BOOL)a3
{
  processingQueue = self->super.super._processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100061714;
  v4[3] = &unk_1000D9930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)processingQueue, v4);
}

+ (BOOL)receivedHidEventForPid:(int)a3 eventTimeMachAbs:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100062F30;
  v8[3] = &unk_1000D9958;
  int v9 = a3;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = &v10;
  v8[7] = a4;
  sub_10006103C((uint64_t)v8);
  char v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)setSamplingMode:(unsigned __int8)a3 withAdditionalSampledProcesses:(id)a4
{
  id v4 = a4;
  int v5 = a3;
  if (a3 == 3 && a4)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v18 = *__error();
        BOOL v19 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000906C8();
        }
        *__error() = v18;
      }

      if (byte_1000E7D31) {
        BOOL v20 = dword_1000E74E0 <= 3;
      }
      else {
        BOOL v20 = 0;
      }
      if (!v20) {
        goto LABEL_24;
      }
      int v11 = *__error();
      v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Pids is ignored when sampling all processes");
      if (v21)
      {
        uint64_t v22 = v21;
        CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
        if (CStringPtr)
        {
          v24 = (char *)CStringPtr;
          v25 = 0LL;
        }

        else
        {
          v24 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v22, v24, 1024LL, 0x8000100u);
          v25 = v24;
        }

        if (qword_1000E7D38) {
          v31 = (FILE *)qword_1000E7D38;
        }
        else {
          v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v24);
        if (v25) {
          free(v25);
        }
        v28 = v22;
        goto LABEL_50;
      }

      v29 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_10009069C();
      }
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v8 = *__error();
        int v9 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100090630();
        }
        *__error() = v8;
      }

      if (byte_1000E7D31) {
        BOOL v10 = dword_1000E74E0 <= 3;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10)
      {
LABEL_24:
        id v4 = 0LL;
        goto LABEL_52;
      }

      int v11 = *__error();
      uint64_t v12 = sub_10002EF3C(*p_targetProcessId);
      char v13 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Pids is ignored when sampling all processes",  v12,  *p_targetProcessId);
      if (v13)
      {
        int v14 = v13;
        BOOL v15 = CFStringGetCStringPtr(v13, 0x8000100u);
        if (v15)
        {
          BOOL v16 = (char *)v15;
          int v17 = 0LL;
        }

        else
        {
          BOOL v16 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v14, v16, 1024LL, 0x8000100u);
          int v17 = v16;
        }

        if (qword_1000E7D38) {
          v27 = (FILE *)qword_1000E7D38;
        }
        else {
          v27 = __stderrp;
        }
        fprintf(v27, "%s\n", v16);
        if (v17) {
          free(v17);
        }
        v28 = v14;
LABEL_50:
        CFRelease(v28);
LABEL_51:
        id v4 = 0LL;
        *__error() = v11;
        goto LABEL_52;
      }

      v26 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_1000905C4();
      }
    }

    if (qword_1000E7D38) {
      v30 = (FILE *)qword_1000E7D38;
    }
    else {
      v30 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }

- (unsigned)samplingIntervalUs
{
  return self->_samplingIntervalUs;
}

- (void)setSamplingIntervalUs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->super.super._hasSampled)
  {
    self->_unsigned int samplingIntervalUs = a3;
    return;
  }

  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E7D30)
    {
      int v5 = *__error();
      char v6 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10002EF3C(self->super.super._targetProcessId);
        unsigned int samplingIntervalUs = self->_samplingIntervalUs;
        int targetProcessId = self->super.super._targetProcessId;
        *(_DWORD *)buf = 136446978;
        int v36 = v32;
        __int16 v37 = 1024;
        int v38 = targetProcessId;
        __int16 v39 = 1024;
        int v40 = v3;
        __int16 v41 = 1024;
        unsigned int v42 = samplingIntervalUs;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus",  buf,  0x1Eu);
      }

      *__error() = v5;
    }

    if (byte_1000E7D31) {
      BOOL v7 = dword_1000E74E0 <= 3;
    }
    else {
      BOOL v7 = 0;
    }
    if (!v7) {
      return;
    }
    int v8 = *__error();
    int v9 = sub_10002EF3C(self->super.super._targetProcessId);
    BOOL v10 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus",  v9,  self->super.super._targetProcessId,  v3,  self->_samplingIntervalUs);
    if (v10)
    {
      int v11 = v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (CStringPtr)
      {
        char v13 = (char *)CStringPtr;
        int v14 = 0LL;
      }

      else
      {
        char v13 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v11, v13, 1024LL, 0x8000100u);
        int v14 = v13;
      }

      if (qword_1000E7D38) {
        v27 = (FILE *)qword_1000E7D38;
      }
      else {
        v27 = __stderrp;
      }
      fprintf(v27, "%s\n", v13);
      if (v14) {
        free(v14);
      }
      v28 = v11;
LABEL_50:
      CFRelease(v28);
LABEL_51:
      *__error() = v8;
      return;
    }

    v23 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = sub_10002EF3C(self->super.super._targetProcessId);
      unsigned int v25 = self->_samplingIntervalUs;
      int v26 = self->super.super._targetProcessId;
      *(_DWORD *)buf = 136315906;
      int v36 = v24;
      __int16 v37 = 1024;
      int v38 = v26;
      __int16 v39 = 1024;
      int v40 = v3;
      __int16 v41 = 1024;
      unsigned int v42 = v25;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "Unable to format: %s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus",  buf,  0x1Eu);
    }

    goto LABEL_39;
  }

  if (byte_1000E7D30)
  {
    int v15 = *__error();
    BOOL v16 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100090758();
    }
    *__error() = v15;
  }

  if (byte_1000E7D31) {
    BOOL v17 = dword_1000E74E0 <= 3;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    int v8 = *__error();
    int v18 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Attempted to change sampling interval to %uus while already sampling/sampled at %uus",  v3,  self->_samplingIntervalUs);
    if (v18)
    {
      BOOL v19 = v18;
      BOOL v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        uint64_t v22 = 0LL;
      }

      else
      {
        v21 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v19, v21, 1024LL, 0x8000100u);
        uint64_t v22 = v21;
      }

      if (qword_1000E7D38) {
        v31 = (FILE *)qword_1000E7D38;
      }
      else {
        v31 = __stderrp;
      }
      fprintf(v31, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      v28 = v19;
      goto LABEL_50;
    }

    v29 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_1000906F4();
    }
LABEL_39:
    if (qword_1000E7D38) {
      v30 = (FILE *)qword_1000E7D38;
    }
    else {
      v30 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }

- (unsigned)occasionalDataIntervalSec
{
  return self->_occasionalDataIntervalSec;
}

- (void)setOccasionalDataIntervalSec:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->super.super._hasSampled)
  {
    self->_unsigned int occasionalDataIntervalSec = a3;
    return;
  }

  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E7D30)
    {
      int v5 = *__error();
      char v6 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10002EF3C(self->super.super._targetProcessId);
        unsigned int occasionalDataIntervalSec = self->_occasionalDataIntervalSec;
        int targetProcessId = self->super.super._targetProcessId;
        *(_DWORD *)buf = 136446978;
        int v36 = v32;
        __int16 v37 = 1024;
        int v38 = targetProcessId;
        __int16 v39 = 1024;
        int v40 = v3;
        __int16 v41 = 1024;
        unsigned int v42 = occasionalDataIntervalSec;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus",  buf,  0x1Eu);
      }

      *__error() = v5;
    }

    if (byte_1000E7D31) {
      BOOL v7 = dword_1000E74E0 <= 3;
    }
    else {
      BOOL v7 = 0;
    }
    if (!v7) {
      return;
    }
    int v8 = *__error();
    int v9 = sub_10002EF3C(self->super.super._targetProcessId);
    BOOL v10 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus",  v9,  self->super.super._targetProcessId,  v3,  self->_occasionalDataIntervalSec);
    if (v10)
    {
      int v11 = v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (CStringPtr)
      {
        char v13 = (char *)CStringPtr;
        int v14 = 0LL;
      }

      else
      {
        char v13 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v11, v13, 1024LL, 0x8000100u);
        int v14 = v13;
      }

      if (qword_1000E7D38) {
        v27 = (FILE *)qword_1000E7D38;
      }
      else {
        v27 = __stderrp;
      }
      fprintf(v27, "%s\n", v13);
      if (v14) {
        free(v14);
      }
      v28 = v11;
LABEL_50:
      CFRelease(v28);
LABEL_51:
      *__error() = v8;
      return;
    }

    v23 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = sub_10002EF3C(self->super.super._targetProcessId);
      unsigned int v25 = self->_occasionalDataIntervalSec;
      int v26 = self->super.super._targetProcessId;
      *(_DWORD *)buf = 136315906;
      int v36 = v24;
      __int16 v37 = 1024;
      int v38 = v26;
      __int16 v39 = 1024;
      int v40 = v3;
      __int16 v41 = 1024;
      unsigned int v42 = v25;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "Unable to format: %s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus",  buf,  0x1Eu);
    }

    goto LABEL_39;
  }

  if (byte_1000E7D30)
  {
    int v15 = *__error();
    BOOL v16 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100090828();
    }
    *__error() = v15;
  }

  if (byte_1000E7D31) {
    BOOL v17 = dword_1000E74E0 <= 3;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    int v8 = *__error();
    int v18 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Attempted to change occasional data interval to %uus while already sampling/sampled at %uus",  v3,  self->_occasionalDataIntervalSec);
    if (v18)
    {
      BOOL v19 = v18;
      BOOL v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        uint64_t v22 = 0LL;
      }

      else
      {
        v21 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v19, v21, 1024LL, 0x8000100u);
        uint64_t v22 = v21;
      }

      if (qword_1000E7D38) {
        v31 = (FILE *)qword_1000E7D38;
      }
      else {
        v31 = __stderrp;
      }
      fprintf(v31, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      v28 = v19;
      goto LABEL_50;
    }

    v29 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_1000907C4();
    }
LABEL_39:
    if (qword_1000E7D38) {
      v30 = (FILE *)qword_1000E7D38;
    }
    else {
      v30 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }

- (void)setSamplingTimeoutAtTime:(double)a3
{
  if (self->super.super._timeoutTime <= a3)
  {
    double Current = SAMachAbsTimeSecondsGetCurrent(self);
    double v17 = Current;
    if (Current < a3) {
      double v18 = a3;
    }
    else {
      double v18 = Current;
    }
    p_int targetProcessId = &self->super.super._targetProcessId;
    int targetProcessId = self->super.super._targetProcessId;
    self->super.super._timeoutTime = v18;
    if (targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v39 = *__error();
        int v40 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v71 = v18 - v17;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "Setting sampling timeout for %.2f seconds from now",  buf,  0xCu);
        }

        *__error() = v39;
      }

      if (byte_1000E7D31) {
        BOOL v41 = dword_1000E74E0 <= 0;
      }
      else {
        BOOL v41 = 0;
      }
      if (!v41) {
        goto LABEL_103;
      }
      int v24 = *__error();
      unsigned int v42 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Setting sampling timeout for %.2f seconds from now",  v18 - v17);
      if (v42)
      {
        v43 = v42;
        CStringPtr = CFStringGetCStringPtr(v42, 0x8000100u);
        if (CStringPtr)
        {
          v45 = (char *)CStringPtr;
          int v46 = 0LL;
        }

        else
        {
          v45 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v43, v45, 1024LL, 0x8000100u);
          int v46 = v45;
        }

        if (qword_1000E7D38) {
          v65 = (FILE *)qword_1000E7D38;
        }
        else {
          v65 = __stderrp;
        }
        fprintf(v65, "%s\n", v45);
        if (v46) {
          free(v46);
        }
        v52 = v43;
        goto LABEL_101;
      }

      v55 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
        sub_100090A58(v55, v56, v57, v58, v59, v60, v61, v62);
      }
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v21 = *__error();
        uint64_t v22 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v67 = sub_10002EF3C(*p_targetProcessId);
          int v68 = *p_targetProcessId;
          *(_DWORD *)buf = 136446722;
          double v71 = *(double *)&v67;
          __int16 v72 = 1024;
          int v73 = v68;
          __int16 v74 = 2048;
          double v75 = v18 - v17;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%{public}s [%d]: Setting sampling timeout for %.2f seconds from now",  buf,  0x1Cu);
        }

        *__error() = v21;
      }

      if (byte_1000E7D31) {
        BOOL v23 = dword_1000E74E0 <= 0;
      }
      else {
        BOOL v23 = 0;
      }
      if (!v23) {
        goto LABEL_103;
      }
      int v24 = *__error();
      unsigned int v25 = sub_10002EF3C(*p_targetProcessId);
      int v26 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Setting sampling timeout for %.2f seconds from now",  v25,  *p_targetProcessId,  v18 - v17);
      if (v26)
      {
        v27 = v26;
        v28 = CFStringGetCStringPtr(v26, 0x8000100u);
        if (v28)
        {
          v29 = (char *)v28;
          v30 = 0LL;
        }

        else
        {
          v29 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v27, v29, 1024LL, 0x8000100u);
          v30 = v29;
        }

        if (qword_1000E7D38) {
          v51 = (FILE *)qword_1000E7D38;
        }
        else {
          v51 = __stderrp;
        }
        fprintf(v51, "%s\n", v29);
        if (v30) {
          free(v30);
        }
        v52 = v27;
LABEL_101:
        CFRelease(v52);
LABEL_102:
        *__error() = v24;
LABEL_103:
        processingQueue = self->super.super._processingQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100065110;
        block[3] = &unk_1000D90E0;
        block[4] = self;
        *(double *)&block[5] = v18;
        *(double *)&block[6] = v17;
        dispatch_async((dispatch_queue_t)processingQueue, block);
        return;
      }

      BOOL v48 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
        sub_1000909C4(&self->super.super._targetProcessId);
      }
    }

    if (qword_1000E7D38) {
      v63 = (FILE *)qword_1000E7D38;
    }
    else {
      v63 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
    goto LABEL_102;
  }

  int v5 = &self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E7D30)
    {
      int v6 = *__error();
      BOOL v7 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100090900();
      }
      *__error() = v6;
    }

    if (byte_1000E7D31) {
      BOOL v8 = dword_1000E74E0 <= 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8) {
      return;
    }
    int v9 = *__error();
    BOOL v10 = sub_10002EF3C(*v5);
    int v11 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Asked to stop sooner than the existing timeout",  v10,  *v5);
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = CFStringGetCStringPtr(v11, 0x8000100u);
      if (v13)
      {
        int v14 = (char *)v13;
        int v15 = 0LL;
      }

      else
      {
        int v14 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v12, v14, 1024LL, 0x8000100u);
        int v15 = v14;
      }

      if (qword_1000E7D38) {
        v49 = (FILE *)qword_1000E7D38;
      }
      else {
        v49 = __stderrp;
      }
      fprintf(v49, "%s\n", v14);
      if (v15) {
        free(v15);
      }
      v50 = v12;
LABEL_92:
      CFRelease(v50);
LABEL_93:
      *__error() = v9;
      return;
    }

    v47 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
      sub_100090894();
    }
    goto LABEL_75;
  }

  if (byte_1000E7D30)
  {
    int v31 = *__error();
    v32 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_100090998();
    }
    *__error() = v31;
  }

  if (byte_1000E7D31) {
    BOOL v33 = dword_1000E74E0 <= 0;
  }
  else {
    BOOL v33 = 0;
  }
  if (v33)
  {
    int v9 = *__error();
    v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Asked to stop sooner than the existing timeout");
    if (v34)
    {
      v35 = v34;
      int v36 = CFStringGetCStringPtr(v34, 0x8000100u);
      if (v36)
      {
        __int16 v37 = (char *)v36;
        int v38 = 0LL;
      }

      else
      {
        __int16 v37 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v35, v37, 1024LL, 0x8000100u);
        int v38 = v37;
      }

      if (qword_1000E7D38) {
        v64 = (FILE *)qword_1000E7D38;
      }
      else {
        v64 = __stderrp;
      }
      fprintf(v64, "%s\n", v37);
      if (v38) {
        free(v38);
      }
      v50 = v35;
      goto LABEL_92;
    }

    v53 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      sub_10009096C();
    }
LABEL_75:
    if (qword_1000E7D38) {
      v54 = (FILE *)qword_1000E7D38;
    }
    else {
      v54 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v54);
    goto LABEL_93;
  }

- (void)setSamplingCompletionHandlerQueue:(id)a3 andBlock:(id)a4
{
  if (!a3 || !a4)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v22 = *__error();
        BOOL v23 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100090FB8(v23, v24, v25, v26, v27, v28, v29, v30);
        }
        *__error() = v22;
      }

      if (byte_1000E7D31) {
        BOOL v31 = dword_1000E74E0 <= 3;
      }
      else {
        BOOL v31 = 0;
      }
      if (v31)
      {
        int v32 = *__error();
        BOOL v33 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s: Must provide both queue and block",  "queue && block");
        if (v33)
        {
          v47 = v33;
          CStringPtr = CFStringGetCStringPtr(v33, 0x8000100u);
          if (CStringPtr)
          {
            v49 = (char *)CStringPtr;
            v50 = 0LL;
          }

          else
          {
            v49 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v47, v49, 1024LL, 0x8000100u);
            v50 = v49;
          }

          if (qword_1000E7D38) {
            uint64_t v57 = (FILE *)qword_1000E7D38;
          }
          else {
            uint64_t v57 = __stderrp;
          }
          fprintf(v57, "%s\n", v49);
          if (v50) {
            free(v50);
          }
          CFRelease(v47);
        }

        else
        {
          v34 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
            sub_100090F48(v34, v35, v36, v37, v38, v39, v40, v41);
          }
          if (qword_1000E7D38) {
            unsigned int v42 = (FILE *)qword_1000E7D38;
          }
          else {
            unsigned int v42 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v42);
        }

        *__error() = v32;
      }

      sub_10002EE78( "-[SPSampledProcess setSamplingCompletionHandlerQueue:andBlock:]",  "SPProcessEvent.m",  1121,  "%s: Must provide both queue and block",  v4,  v5,  v6,  v7,  (char)"queue && block");
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v14 = *__error();
        int v15 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100090ECC();
        }
        *__error() = v14;
      }

      if (byte_1000E7D31) {
        BOOL v16 = dword_1000E74E0 <= 3;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        int v17 = *__error();
        double v18 = sub_10002EF3C(*p_targetProcessId);
        BOOL v19 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: %s: Must provide both queue and block",  v18,  *p_targetProcessId,  "queue && block");
        if (v19)
        {
          v43 = v19;
          v44 = CFStringGetCStringPtr(v19, 0x8000100u);
          if (v44)
          {
            v45 = (char *)v44;
            int v46 = 0LL;
          }

          else
          {
            v45 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v43, v45, 1024LL, 0x8000100u);
            int v46 = v45;
          }

          if (qword_1000E7D38) {
            v51 = (FILE *)qword_1000E7D38;
          }
          else {
            v51 = __stderrp;
          }
          fprintf(v51, "%s\n", v45);
          if (v46) {
            free(v46);
          }
          CFRelease(v43);
        }

        else
        {
          BOOL v20 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            sub_100090E50();
          }
          if (qword_1000E7D38) {
            int v21 = (FILE *)qword_1000E7D38;
          }
          else {
            int v21 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v21);
        }

        *__error() = v17;
      }

      char v52 = sub_10002EF3C(*p_targetProcessId);
      sub_10002EE78( "-[SPSampledProcess setSamplingCompletionHandlerQueue:andBlock:]",  "SPProcessEvent.m",  1121,  "%s [%d]: %s: Must provide both queue and block",  v53,  v54,  v55,  v56,  v52);
    }

    abort();
  }

  dispatch_retain((dispatch_object_t)a3);
  int v11 = _Block_copy(a4);
  processingQueue = self->super.super._processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100065E94;
  block[3] = &unk_1000D9980;
  block[4] = self;
  block[5] = a3;
  block[6] = v11;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void)setStopWhenProcessExits:(BOOL)a3
{
  processingQueue = self->super.super._processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100065F44;
  v4[3] = &unk_1000D9930;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)processingQueue, v4);
}

- (BOOL)startSampling
{
  if (self->super.super._hasSampled || !self->_samplingIntervalUs) {
    return 0;
  }
  -[SPProcessEvent takeTransaction](self, "takeTransaction");
  id v4 = +[SPStackshotProvider snapshotWithSamplingIntervalUs:andOccasionalDataIntervalSec:andOnlySampleProcesses:andOnlySampleMainThreads:andOmitSensitiveStrings:]( &OBJC_CLASS___SPStackshotProvider,  "snapshotWithSamplingIntervalUs:andOccasionalDataIntervalSec:andOnlySampleProcesses:andOnlySampleMainThreads:and OmitSensitiveStrings:",  self->_samplingIntervalUs,  self->_occasionalDataIntervalSec,  self->_sampledProcesses,  self->_samplingMode == 1,  self->super.super._omitSensitiveStrings);
  if (!v4)
  {
    -[SPProcessEvent dropTransaction](self, "dropTransaction");
    return 0;
  }

  BOOL v5 = v4;
  self->super.super._numSamplesAvoidedDueToAudioAtStart = [v4 numSamplesAvoidedDueToAudio];
  self->super.super._numSamplesAtStart = [v5 numSamples];
  self->_startedMonitoringTimestamp = (SATimestamp *)[v5 timestamp];
  self->super.super._sampleProvider = (SPStackshotProvider *)[v5 stackshotProvider];
  *(_WORD *)&self->super.super._isSampling = 257;
  return 1;
}

- (void)stopSamplingWithReason:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if (self->super.super._isSampling)
  {
    processingQueue = self->super.super._processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100066CE8;
    block[3] = &unk_1000D9930;
    block[4] = self;
    unsigned __int8 v32 = a3;
    dispatch_async((dispatch_queue_t)processingQueue, block);
    return;
  }

  p_int targetProcessId = &self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E7D30)
    {
      int v7 = *__error();
      BOOL v8 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100091370(p_targetProcessId, v3, v8);
      }
      *__error() = v7;
    }

    if (byte_1000E7D31) {
      BOOL v9 = dword_1000E74E0 <= 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9) {
      return;
    }
    int v10 = *__error();
    int v11 = sub_10002EF3C(*p_targetProcessId);
    uint64_t v12 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Already not sampling when stopped with reason %d",  v11,  *p_targetProcessId,  v3);
    if (v12)
    {
      char v13 = v12;
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      if (CStringPtr)
      {
        int v15 = (char *)CStringPtr;
        BOOL v16 = 0LL;
      }

      else
      {
        int v15 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v13, v15, 1024LL, 0x8000100u);
        BOOL v16 = v15;
      }

      if (qword_1000E7D38) {
        uint64_t v26 = (FILE *)qword_1000E7D38;
      }
      else {
        uint64_t v26 = __stderrp;
      }
      fprintf(v26, "%s\n", v15);
      if (v16) {
        free(v16);
      }
      uint64_t v27 = v13;
LABEL_50:
      CFRelease(v27);
LABEL_51:
      *__error() = v10;
      return;
    }

    uint64_t v25 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_1000912E0(p_targetProcessId);
    }
    goto LABEL_39;
  }

  if (byte_1000E7D30)
  {
    int v17 = *__error();
    double v18 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10009148C(v3, v18);
    }
    *__error() = v17;
  }

  if (byte_1000E7D31) {
    BOOL v19 = dword_1000E74E0 <= 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    int v10 = *__error();
    BOOL v20 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Already not sampling when stopped with reason %d",  v3);
    if (v20)
    {
      int v21 = v20;
      int v22 = CFStringGetCStringPtr(v20, 0x8000100u);
      if (v22)
      {
        BOOL v23 = (char *)v22;
        uint64_t v24 = 0LL;
      }

      else
      {
        BOOL v23 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v21, v23, 1024LL, 0x8000100u);
        uint64_t v24 = v23;
      }

      if (qword_1000E7D38) {
        uint64_t v30 = (FILE *)qword_1000E7D38;
      }
      else {
        uint64_t v30 = __stderrp;
      }
      fprintf(v30, "%s\n", v23);
      if (v24) {
        free(v24);
      }
      uint64_t v27 = v21;
      goto LABEL_50;
    }

    uint64_t v28 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_10009141C(v3, v28);
    }
LABEL_39:
    if (qword_1000E7D38) {
      uint64_t v29 = (FILE *)qword_1000E7D38;
    }
    else {
      uint64_t v29 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v29);
    goto LABEL_51;
  }

- (void)_samplingHasCompletedWithEndSnapshot:(id)a3 withReason:(unsigned __int8)a4
{
  int v4 = a4;
  if (!self->super.super._isUrgent) {
    -[SPStackshotProvider waitForSamplingToComplete](self->super.super._sampleProvider, "waitForSamplingToComplete");
  }
  unsigned int v7 = v4 - 6;
  if (!a3 || v7 < 0xFFFFFFFC || !self->_hidEventSem)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v29 = *__error();
        uint64_t v30 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_100091604();
        }
        *__error() = v29;
      }

      if (byte_1000E7D31) {
        BOOL v31 = dword_1000E74E0 <= 0;
      }
      else {
        BOOL v31 = 0;
      }
      if (!v31)
      {
LABEL_87:
        if (v7 <= 0xFFFFFFFB) {
          goto LABEL_206;
        }
LABEL_88:
        sampleProvider = self->super.super._sampleProvider;
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472LL;
        v122[2] = sub_100068240;
        v122[3] = &unk_1000D99F8;
        char v123 = v4;
        v122[4] = self;
        v122[5] = a3;
        -[SPStackshotProvider performSampleStoreWork:](sampleProvider, "performSampleStoreWork:", v122);
        return;
      }

      int v22 = *__error();
      unsigned __int8 v32 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"No HID event required");
      if (v32)
      {
        BOOL v33 = v32;
        CStringPtr = CFStringGetCStringPtr(v32, 0x8000100u);
        if (CStringPtr)
        {
          uint64_t v35 = (char *)CStringPtr;
          uint64_t v36 = 0LL;
        }

        else
        {
          uint64_t v35 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v33, v35, 1024LL, 0x8000100u);
          uint64_t v36 = v35;
        }

        if (qword_1000E7D38) {
          v50 = (FILE *)qword_1000E7D38;
        }
        else {
          v50 = __stderrp;
        }
        fprintf(v50, "%s\n", v35);
        if (v36) {
          free(v36);
        }
        int v46 = v33;
        goto LABEL_85;
      }

      v47 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        sub_1000915D8();
      }
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v19 = *__error();
        BOOL v20 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_10009156C();
        }
        *__error() = v19;
      }

      if (byte_1000E7D31) {
        BOOL v21 = dword_1000E74E0 <= 0;
      }
      else {
        BOOL v21 = 0;
      }
      if (!v21) {
        goto LABEL_87;
      }
      int v22 = *__error();
      BOOL v23 = sub_10002EF3C(*p_targetProcessId);
      uint64_t v24 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: No HID event required",  v23,  *p_targetProcessId);
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = CFStringGetCStringPtr(v24, 0x8000100u);
        if (v26)
        {
          uint64_t v27 = (char *)v26;
          uint64_t v28 = 0LL;
        }

        else
        {
          uint64_t v27 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v25, v27, 1024LL, 0x8000100u);
          uint64_t v28 = v27;
        }

        if (qword_1000E7D38) {
          v45 = (FILE *)qword_1000E7D38;
        }
        else {
          v45 = __stderrp;
        }
        fprintf(v45, "%s\n", v27);
        if (v28) {
          free(v28);
        }
        int v46 = v25;
LABEL_85:
        CFRelease(v46);
LABEL_86:
        *__error() = v22;
        goto LABEL_87;
      }

      v44 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        sub_100091500();
      }
    }

    if (qword_1000E7D38) {
      BOOL v48 = (FILE *)qword_1000E7D38;
    }
    else {
      BOOL v48 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
    goto LABEL_86;
  }

  BOOL v8 = (unsigned int *)&self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000E7D30)
    {
      int v9 = *__error();
      int v10 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = sub_10002EF3C(*v8);
        int v12 = *v8;
        *(_DWORD *)buf = 136446466;
        v128 = v11;
        __int16 v129 = 1024;
        int v130 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%{public}s [%d]: Waiting for HID event...",  buf,  0x12u);
      }

      *__error() = v9;
    }

    if (byte_1000E7D31) {
      BOOL v13 = dword_1000E74E0 <= 1;
    }
    else {
      BOOL v13 = 0;
    }
    if (!v13) {
      goto LABEL_96;
    }
    int v14 = *__error();
    int v15 = sub_10002EF3C(*v8);
    BOOL v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s [%d]: Waiting for HID event...", v15, *v8);
    if (!v16)
    {
      int v17 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100091928();
      }
LABEL_91:
      if (qword_1000E7D38) {
        uint64_t v53 = (FILE *)qword_1000E7D38;
      }
      else {
        uint64_t v53 = __stderrp;
      }
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v53);
LABEL_95:
      *__error() = v14;
      goto LABEL_96;
    }

    goto LABEL_54;
  }

  if (byte_1000E7D30)
  {
    int v37 = *__error();
    uint64_t v38 = (os_log_s *)sub_10002EFA0();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Waiting for HID event...", buf, 2u);
    }

    *__error() = v37;
  }

  if (byte_1000E7D31) {
    BOOL v39 = dword_1000E74E0 <= 1;
  }
  else {
    BOOL v39 = 0;
  }
  if (v39)
  {
    int v14 = *__error();
    BOOL v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Waiting for HID event...");
    if (!v16)
    {
      char v52 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        sub_100091994();
      }
      goto LABEL_91;
    }

- (void)_saveReportToStream:(__sFILE *)a3
{
  if (!a3 || self->super.super._isSampling || !self->super.super._hasSampled)
  {
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v44 = *__error();
        v45 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100091CDC();
        }
        *__error() = v44;
      }

      if (byte_1000E7D31) {
        BOOL v46 = dword_1000E74E0 < 4;
      }
      else {
        BOOL v46 = 0;
      }
      if (v46)
      {
        BOOL v57 = a3 != 0LL;
        int v58 = *__error();
        int v59 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s: save report fail %d %d %d",  "stream && !_isSampling && _hasSampled",  a3 != 0LL,  self->super.super._isSampling,  self->super.super._hasSampled);
        if (v59)
        {
          int v68 = v59;
          int v79 = v58;
          CStringPtr = CFStringGetCStringPtr(v59, 0x8000100u);
          if (CStringPtr)
          {
            v70 = (char *)CStringPtr;
            double v71 = 0LL;
          }

          else
          {
            v70 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v68, v70, 1024LL, 0x8000100u);
            double v71 = v70;
          }

          if (qword_1000E7D38) {
            v78 = (FILE *)qword_1000E7D38;
          }
          else {
            v78 = __stderrp;
          }
          fprintf(v78, "%s\n", v70);
          if (v71) {
            free(v71);
          }
          CFRelease(v68);
          int v58 = v79;
        }

        else
        {
          int v60 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            BOOL isSampling = self->super.super._isSampling;
            BOOL hasSampled = self->super.super._hasSampled;
            *(_DWORD *)buf = 136315906;
            int v82 = "stream && !_isSampling && _hasSampled";
            __int16 v83 = 1024;
            int v84 = v57;
            __int16 v85 = 1024;
            *(_DWORD *)v86 = isSampling;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = hasSampled;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_FAULT,  "Unable to format: %s: save report fail %d %d %d",  buf,  0x1Eu);
          }

          if (qword_1000E7D38) {
            v63 = (FILE *)qword_1000E7D38;
          }
          else {
            v63 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
        }

        *__error() = v58;
      }

      sub_10002EE78( "-[SPSampledProcess _saveReportToStream:]",  "SPProcessEvent.m",  1417,  "%s: save report fail %d %d %d",  v3,  v4,  v5,  v6,  (char)"stream && !_isSampling && _hasSampled");
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v37 = *__error();
        uint64_t v38 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          BOOL v39 = (const char *)sub_10002EF3C(self->super.super._targetProcessId);
          int targetProcessId = self->super.super._targetProcessId;
          BOOL v41 = self->super.super._isSampling;
          BOOL v42 = self->super.super._hasSampled;
          *(_DWORD *)buf = 136316418;
          int v82 = v39;
          __int16 v83 = 1024;
          int v84 = targetProcessId;
          __int16 v85 = 2080;
          *(void *)v86 = "stream && !_isSampling && _hasSampled";
          *(_WORD *)&v86[8] = 1024;
          BOOL v87 = a3 != 0LL;
          __int16 v88 = 1024;
          BOOL v89 = v41;
          __int16 v90 = 1024;
          BOOL v91 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s [%d]: %s: save report fail %d %d %d",  buf,  0x2Eu);
        }

        *__error() = v37;
      }

      if (byte_1000E7D31) {
        BOOL v43 = dword_1000E74E0 < 4;
      }
      else {
        BOOL v43 = 0;
      }
      if (v43)
      {
        BOOL v47 = a3 != 0LL;
        int v48 = *__error();
        v49 = sub_10002EF3C(self->super.super._targetProcessId);
        v50 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: %s: save report fail %d %d %d",  v49,  self->super.super._targetProcessId,  "stream && !_isSampling && _hasSampled",  v47,  self->super.super._isSampling,  self->super.super._hasSampled);
        if (v50)
        {
          int v64 = v50;
          v65 = CFStringGetCStringPtr(v50, 0x8000100u);
          if (v65)
          {
            int v66 = (char *)v65;
            v67 = 0LL;
          }

          else
          {
            int v66 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v64, v66, 1024LL, 0x8000100u);
            v67 = v66;
          }

          if (qword_1000E7D38) {
            __int16 v72 = (FILE *)qword_1000E7D38;
          }
          else {
            __int16 v72 = __stderrp;
          }
          fprintf(v72, "%s\n", v66);
          if (v67) {
            free(v67);
          }
          CFRelease(v64);
        }

        else
        {
          v51 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            char v52 = (const char *)sub_10002EF3C(self->super.super._targetProcessId);
            int v53 = self->super.super._targetProcessId;
            BOOL v54 = self->super.super._isSampling;
            BOOL v55 = self->super.super._hasSampled;
            *(_DWORD *)buf = 136316418;
            int v82 = v52;
            __int16 v83 = 1024;
            int v84 = v53;
            __int16 v85 = 2080;
            *(void *)v86 = "stream && !_isSampling && _hasSampled";
            *(_WORD *)&v86[8] = 1024;
            BOOL v87 = v47;
            __int16 v88 = 1024;
            BOOL v89 = v54;
            __int16 v90 = 1024;
            BOOL v91 = v55;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_FAULT,  "Unable to format: %s [%d]: %s: save report fail %d %d %d",  buf,  0x2Eu);
          }

          if (qword_1000E7D38) {
            int v56 = (FILE *)qword_1000E7D38;
          }
          else {
            int v56 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v56);
        }

        *__error() = v48;
      }

      char v73 = sub_10002EF3C(self->super.super._targetProcessId);
      sub_10002EE78( "-[SPSampledProcess _saveReportToStream:]",  "SPProcessEvent.m",  1417,  "%s [%d]: %s: save report fail %d %d %d",  v74,  v75,  v76,  v77,  v73);
    }

    abort();
  }

  if (!self->super.super._isUrgent)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v22 = *__error();
        BOOL v23 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Waiting for sampling to complete", buf, 2u);
        }

        *__error() = v22;
      }

      if (byte_1000E7D31) {
        BOOL v24 = dword_1000E74E0 <= 1;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24) {
        goto LABEL_54;
      }
      int v15 = *__error();
      uint64_t v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Waiting for sampling to complete");
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = CFStringGetCStringPtr(v25, 0x8000100u);
        if (v27)
        {
          uint64_t v28 = (char *)v27;
          int v29 = 0LL;
        }

        else
        {
          uint64_t v28 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v26, v28, 1024LL, 0x8000100u);
          int v29 = v28;
        }

        if (qword_1000E7D38) {
          uint64_t v35 = (FILE *)qword_1000E7D38;
        }
        else {
          uint64_t v35 = __stderrp;
        }
        fprintf(v35, "%s\n", v28);
        if (v29) {
          free(v29);
        }
        unsigned __int8 v32 = v26;
        goto LABEL_52;
      }

      BOOL v33 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_100091DB8();
      }
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v10 = *__error();
        int v11 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = (const char *)sub_10002EF3C(*p_targetProcessId);
          int v13 = *p_targetProcessId;
          *(_DWORD *)buf = 136446466;
          int v82 = v12;
          __int16 v83 = 1024;
          int v84 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}s [%d]: Waiting for sampling to complete",  buf,  0x12u);
        }

        *__error() = v10;
      }

      if (byte_1000E7D31) {
        BOOL v14 = dword_1000E74E0 <= 1;
      }
      else {
        BOOL v14 = 0;
      }
      if (!v14) {
        goto LABEL_54;
      }
      int v15 = *__error();
      BOOL v16 = sub_10002EF3C(*p_targetProcessId);
      int v17 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Waiting for sampling to complete",  v16,  *p_targetProcessId);
      if (v17)
      {
        double v18 = v17;
        int v19 = CFStringGetCStringPtr(v17, 0x8000100u);
        if (v19)
        {
          BOOL v20 = (char *)v19;
          BOOL v21 = 0LL;
        }

        else
        {
          BOOL v20 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v18, v20, 1024LL, 0x8000100u);
          BOOL v21 = v20;
        }

        if (qword_1000E7D38) {
          BOOL v31 = (FILE *)qword_1000E7D38;
        }
        else {
          BOOL v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v20);
        if (v21) {
          free(v21);
        }
        unsigned __int8 v32 = v18;
LABEL_52:
        CFRelease(v32);
LABEL_53:
        *__error() = v15;
LABEL_54:
        -[SPStackshotProvider waitForSamplingToComplete](self->super.super._sampleProvider, "waitForSamplingToComplete");
        goto LABEL_55;
      }

      uint64_t v30 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100091D4C();
      }
    }

    if (qword_1000E7D38) {
      v34 = (FILE *)qword_1000E7D38;
    }
    else {
      v34 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
    goto LABEL_53;
  }

- (void)_performSamplePrinterWork:(id)a3
{
  if (!a3 || self->super.super._isSampling || !self->super.super._hasSampled)
  {
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v44 = *__error();
        v45 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100091DE4();
        }
        *__error() = v44;
      }

      if (byte_1000E7D31) {
        BOOL v46 = dword_1000E74E0 < 4;
      }
      else {
        BOOL v46 = 0;
      }
      if (v46)
      {
        BOOL v57 = a3 != 0LL;
        int v58 = *__error();
        int v59 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s: save report fail %d %d %d",  "callback && !_isSampling && _hasSampled",  a3 != 0LL,  self->super.super._isSampling,  self->super.super._hasSampled);
        if (v59)
        {
          int v68 = v59;
          int v79 = v58;
          CStringPtr = CFStringGetCStringPtr(v59, 0x8000100u);
          if (CStringPtr)
          {
            v70 = (char *)CStringPtr;
            double v71 = 0LL;
          }

          else
          {
            v70 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v68, v70, 1024LL, 0x8000100u);
            double v71 = v70;
          }

          if (qword_1000E7D38) {
            v78 = (FILE *)qword_1000E7D38;
          }
          else {
            v78 = __stderrp;
          }
          fprintf(v78, "%s\n", v70);
          if (v71) {
            free(v71);
          }
          CFRelease(v68);
          int v58 = v79;
        }

        else
        {
          int v60 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            BOOL isSampling = self->super.super._isSampling;
            BOOL hasSampled = self->super.super._hasSampled;
            *(_DWORD *)buf = 136315906;
            int v82 = "callback && !_isSampling && _hasSampled";
            __int16 v83 = 1024;
            int v84 = v57;
            __int16 v85 = 1024;
            *(_DWORD *)v86 = isSampling;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = hasSampled;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_FAULT,  "Unable to format: %s: save report fail %d %d %d",  buf,  0x1Eu);
          }

          if (qword_1000E7D38) {
            v63 = (FILE *)qword_1000E7D38;
          }
          else {
            v63 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
        }

        *__error() = v58;
      }

      sub_10002EE78( "-[SPSampledProcess _performSamplePrinterWork:]",  "SPProcessEvent.m",  1433,  "%s: save report fail %d %d %d",  v3,  v4,  v5,  v6,  (char)"callback && !_isSampling && _hasSampled");
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v37 = *__error();
        uint64_t v38 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          BOOL v39 = (const char *)sub_10002EF3C(self->super.super._targetProcessId);
          int targetProcessId = self->super.super._targetProcessId;
          BOOL v41 = self->super.super._isSampling;
          BOOL v42 = self->super.super._hasSampled;
          *(_DWORD *)buf = 136316418;
          int v82 = v39;
          __int16 v83 = 1024;
          int v84 = targetProcessId;
          __int16 v85 = 2080;
          *(void *)v86 = "callback && !_isSampling && _hasSampled";
          *(_WORD *)&v86[8] = 1024;
          BOOL v87 = a3 != 0LL;
          __int16 v88 = 1024;
          BOOL v89 = v41;
          __int16 v90 = 1024;
          BOOL v91 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s [%d]: %s: save report fail %d %d %d",  buf,  0x2Eu);
        }

        *__error() = v37;
      }

      if (byte_1000E7D31) {
        BOOL v43 = dword_1000E74E0 < 4;
      }
      else {
        BOOL v43 = 0;
      }
      if (v43)
      {
        BOOL v47 = a3 != 0LL;
        int v48 = *__error();
        v49 = sub_10002EF3C(self->super.super._targetProcessId);
        v50 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: %s: save report fail %d %d %d",  v49,  self->super.super._targetProcessId,  "callback && !_isSampling && _hasSampled",  v47,  self->super.super._isSampling,  self->super.super._hasSampled);
        if (v50)
        {
          int v64 = v50;
          v65 = CFStringGetCStringPtr(v50, 0x8000100u);
          if (v65)
          {
            int v66 = (char *)v65;
            v67 = 0LL;
          }

          else
          {
            int v66 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v64, v66, 1024LL, 0x8000100u);
            v67 = v66;
          }

          if (qword_1000E7D38) {
            __int16 v72 = (FILE *)qword_1000E7D38;
          }
          else {
            __int16 v72 = __stderrp;
          }
          fprintf(v72, "%s\n", v66);
          if (v67) {
            free(v67);
          }
          CFRelease(v64);
        }

        else
        {
          v51 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            char v52 = (const char *)sub_10002EF3C(self->super.super._targetProcessId);
            int v53 = self->super.super._targetProcessId;
            BOOL v54 = self->super.super._isSampling;
            BOOL v55 = self->super.super._hasSampled;
            *(_DWORD *)buf = 136316418;
            int v82 = v52;
            __int16 v83 = 1024;
            int v84 = v53;
            __int16 v85 = 2080;
            *(void *)v86 = "callback && !_isSampling && _hasSampled";
            *(_WORD *)&v86[8] = 1024;
            BOOL v87 = v47;
            __int16 v88 = 1024;
            BOOL v89 = v54;
            __int16 v90 = 1024;
            BOOL v91 = v55;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_FAULT,  "Unable to format: %s [%d]: %s: save report fail %d %d %d",  buf,  0x2Eu);
          }

          if (qword_1000E7D38) {
            int v56 = (FILE *)qword_1000E7D38;
          }
          else {
            int v56 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v56);
        }

        *__error() = v48;
      }

      char v73 = sub_10002EF3C(self->super.super._targetProcessId);
      sub_10002EE78( "-[SPSampledProcess _performSamplePrinterWork:]",  "SPProcessEvent.m",  1433,  "%s [%d]: %s: save report fail %d %d %d",  v74,  v75,  v76,  v77,  v73);
    }

    abort();
  }

  if (!self->super.super._isUrgent)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000E7D30)
      {
        int v22 = *__error();
        BOOL v23 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Waiting for sampling to complete", buf, 2u);
        }

        *__error() = v22;
      }

      if (byte_1000E7D31) {
        BOOL v24 = dword_1000E74E0 <= 1;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24) {
        goto LABEL_54;
      }
      int v15 = *__error();
      uint64_t v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Waiting for sampling to complete");
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = CFStringGetCStringPtr(v25, 0x8000100u);
        if (v27)
        {
          uint64_t v28 = (char *)v27;
          int v29 = 0LL;
        }

        else
        {
          uint64_t v28 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v26, v28, 1024LL, 0x8000100u);
          int v29 = v28;
        }

        if (qword_1000E7D38) {
          uint64_t v35 = (FILE *)qword_1000E7D38;
        }
        else {
          uint64_t v35 = __stderrp;
        }
        fprintf(v35, "%s\n", v28);
        if (v29) {
          free(v29);
        }
        unsigned __int8 v32 = v26;
        goto LABEL_52;
      }

      BOOL v33 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_100091DB8();
      }
    }

    else
    {
      if (byte_1000E7D30)
      {
        int v10 = *__error();
        int v11 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = (const char *)sub_10002EF3C(*p_targetProcessId);
          int v13 = *p_targetProcessId;
          *(_DWORD *)buf = 136446466;
          int v82 = v12;
          __int16 v83 = 1024;
          int v84 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}s [%d]: Waiting for sampling to complete",  buf,  0x12u);
        }

        *__error() = v10;
      }

      if (byte_1000E7D31) {
        BOOL v14 = dword_1000E74E0 <= 1;
      }
      else {
        BOOL v14 = 0;
      }
      if (!v14) {
        goto LABEL_54;
      }
      int v15 = *__error();
      BOOL v16 = sub_10002EF3C(*p_targetProcessId);
      int v17 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Waiting for sampling to complete",  v16,  *p_targetProcessId);
      if (v17)
      {
        double v18 = v17;
        int v19 = CFStringGetCStringPtr(v17, 0x8000100u);
        if (v19)
        {
          BOOL v20 = (char *)v19;
          BOOL v21 = 0LL;
        }

        else
        {
          BOOL v20 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v18, v20, 1024LL, 0x8000100u);
          BOOL v21 = v20;
        }

        if (qword_1000E7D38) {
          BOOL v31 = (FILE *)qword_1000E7D38;
        }
        else {
          BOOL v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v20);
        if (v21) {
          free(v21);
        }
        unsigned __int8 v32 = v18;
LABEL_52:
        CFRelease(v32);
LABEL_53:
        *__error() = v15;
LABEL_54:
        -[SPStackshotProvider waitForSamplingToComplete](self->super.super._sampleProvider, "waitForSamplingToComplete");
        goto LABEL_55;
      }

      uint64_t v30 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100091D4C();
      }
    }

    if (qword_1000E7D38) {
      v34 = (FILE *)qword_1000E7D38;
    }
    else {
      v34 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
    goto LABEL_53;
  }

- (unsigned)samplingMode
{
  return self->_samplingMode;
}

@end