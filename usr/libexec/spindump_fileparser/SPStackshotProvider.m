@interface SPStackshotProvider
+ (id)sharedInstanceLock;
+ (id)snapshotWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7;
- (BOOL)startWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7;
- (SPStackshotProvider)init;
- (int)numSamples;
- (int)numSamplesAvoidedDueToAudio;
- (void)dealloc;
- (void)gatherLoadInfoForPid:(int)a3;
- (void)performSampleStoreWork:(id)a3;
- (void)sampleProcesses:(id)a3 onlyMainThreads:(BOOL)a4;
- (void)startSamplingThread;
- (void)stopAndWaitForAllSamplingToComplete:(BOOL)a3 withCompletionCallbackOnQueue:(id)a4 withBlock:(id)a5;
- (void)stopSamplingThread;
- (void)waitForSamplingToComplete;
@end

@implementation SPStackshotProvider

- (SPStackshotProvider)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SPStackshotProvider;
  v2 = -[SPStackshotProvider init](&v32, "init");
  v3 = v2;
  if (v2)
  {
    v2->_numClientsSampling = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v3->_storeReportingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spindump.sample_store", v5);
    dispatch_release(v5);
    v6 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v3->_stackshotParsingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spindump.stackshot_parsing", v6);
    v3->_pidsToGatherLoadInfo = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    dispatch_release(v6);
    dispatch_release(v4);
    v3->_samplingGroup = (OS_dispatch_group *)dispatch_group_create();
    v3->_pidsSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1LL);
    v7 = (SASampleStore *)-[SASampleStore initForLiveSampling]( objc_alloc(&OBJC_CLASS___SASampleStore),  "initForLiveSampling");
    v3->_sampleStore = v7;
    sub_1000571C4( v7,  (byte_1000E7D44 >> 3) & 1,  (byte_1000E7D44 >> 2) & 1,  (byte_1000E7D44 & 0x10) == 0);
    if ((byte_1000E7D44 & 2) != 0 && sub_1000257B8())
    {
      if (byte_1000E7D30)
      {
        int v8 = *__error();
        v9 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Avoiding inspecting live processes for stackshot report due to audio running",  buf,  2u);
        }

        *__error() = v8;
      }

      if (byte_1000E7D31 && dword_1000E74E0 <= 2)
      {
        int v10 = *__error();
        v11 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Avoiding inspecting live processes for stackshot report due to audio running");
        if (v11)
        {
          v12 = v11;
          CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
          if (CStringPtr)
          {
            v14 = (char *)CStringPtr;
            v15 = 0LL;
          }

          else
          {
            v14 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v12, v14, 1024LL, 0x8000100u);
            v15 = v14;
          }

          if (qword_1000E7D38) {
            v18 = (FILE *)qword_1000E7D38;
          }
          else {
            v18 = __stderrp;
          }
          fprintf(v18, "%s\n", v14);
          if (v15) {
            free(v15);
          }
          CFRelease(v12);
        }

        else
        {
          v16 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            sub_100092BFC();
          }
          if (qword_1000E7D38) {
            v17 = (FILE *)qword_1000E7D38;
          }
          else {
            v17 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v17);
        }

        *__error() = v10;
      }

      -[SASampleStore setDataGatheringOptions:]( v3->_sampleStore,  "setDataGatheringOptions:",  (unint64_t)-[SASampleStore dataGatheringOptions](v3->_sampleStore, "dataGatheringOptions") & 0xFFFFFFFFFFFFFFFDLL);
    }

    -[SASampleStore gatherMachineArchitecture](v3->_sampleStore, "gatherMachineArchitecture");
    if (byte_1000E7D30)
    {
      int v19 = *__error();
      v20 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100092BD0();
      }
      *__error() = v19;
    }

    if (byte_1000E7D31 && dword_1000E74E0 <= 0)
    {
      int v21 = *__error();
      v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Created shared SPStackshotProvider");
      if (v22)
      {
        v23 = v22;
        v24 = CFStringGetCStringPtr(v22, 0x8000100u);
        if (v24)
        {
          v25 = (char *)v24;
          v26 = 0LL;
        }

        else
        {
          v25 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v23, v25, 1024LL, 0x8000100u);
          v26 = v25;
        }

        if (qword_1000E7D38) {
          v29 = (FILE *)qword_1000E7D38;
        }
        else {
          v29 = __stderrp;
        }
        fprintf(v29, "%s\n", v25);
        if (v26) {
          free(v26);
        }
        CFRelease(v23);
      }

      else
      {
        v27 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          sub_100092BA4();
        }
        if (qword_1000E7D38) {
          v28 = (FILE *)qword_1000E7D38;
        }
        else {
          v28 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v28);
      }

      *__error() = v21;
    }
  }

  return v3;
}

- (void)dealloc
{
  p_numClientsSampling = &self->_numClientsSampling;
  if (self->_numClientsSampling)
  {
    if (byte_1000E7D30)
    {
      int v8 = *__error();
      v9 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100092C98();
      }
      *__error() = v8;
    }

    if (byte_1000E7D31) {
      BOOL v10 = dword_1000E74E0 <= 3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      int v11 = *__error();
      v12 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s: Still have %d clients sampling when dealloc'ed",  "_numClientsSampling == 0",  *p_numClientsSampling);
      int v20 = v11;
      if (v12)
      {
        theString = v12;
        CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
        if (CStringPtr)
        {
          v16 = (char *)CStringPtr;
          v17 = 0LL;
        }

        else
        {
          v16 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(theString, v16, 1024LL, 0x8000100u);
          v17 = v16;
        }

        if (qword_1000E7D38) {
          v18 = (FILE *)qword_1000E7D38;
        }
        else {
          v18 = __stderrp;
        }
        fprintf(v18, "%s\n", v16);
        if (v17) {
          free(v17);
        }
        CFRelease(theString);
      }

      else
      {
        v13 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100092C28();
        }
        if (qword_1000E7D38) {
          v14 = (FILE *)qword_1000E7D38;
        }
        else {
          v14 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v14);
      }

      *__error() = v20;
    }

    sub_10002EE78( "-[SPStackshotProvider dealloc]",  "SPSampleProvider.m",  499,  "%s: Still have %d clients sampling when dealloc'ed",  v2,  v3,  v4,  v5,  (char)"_numClientsSampling == 0");
    abort();
  }

  -[SPStackshotProvider stopSamplingThread](self, "stopSamplingThread");

  dispatch_release((dispatch_object_t)self->_storeReportingQueue);
  dispatch_release((dispatch_object_t)self->_stackshotParsingQueue);
  dispatch_release((dispatch_object_t)self->_samplingGroup);

  dispatch_release((dispatch_object_t)self->_pidsSem);
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SPStackshotProvider;
  -[SPStackshotProvider dealloc](&v21, "dealloc");
}

- (void)startSamplingThread
{
  if (self->_samplingThread)
  {
    if (byte_1000E7D30)
    {
      int v3 = *__error();
      uint64_t v4 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_100092DF0();
      }
      *__error() = v3;
    }

    if (byte_1000E7D31) {
      BOOL v5 = dword_1000E74E0 <= 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      int v6 = *__error();
      v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Already have a sampling thread");
      int v8 = v7;
      if (v7)
      {
        CStringPtr = (char *)CFStringGetCStringPtr(v7, 0x8000100u);
        if (CStringPtr)
        {
          BOOL v10 = 0LL;
        }

        else
        {
          CStringPtr = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v8, CStringPtr, 1024LL, 0x8000100u);
          BOOL v10 = CStringPtr;
        }

        if (qword_1000E7D38) {
          objc_super v21 = (FILE *)qword_1000E7D38;
        }
        else {
          objc_super v21 = __stderrp;
        }
        fprintf(v21, "%s\n", CStringPtr);
        if (v10) {
          free(v10);
        }
        CFRelease(v8);
      }

      else
      {
        int v19 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          sub_100092DC4();
        }
        if (qword_1000E7D38) {
          int v20 = (FILE *)qword_1000E7D38;
        }
        else {
          int v20 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v20);
      }

      *__error() = v6;
    }
  }

  else
  {
    self->_samplingStoppedSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    if (byte_1000E7D30)
    {
      int v11 = *__error();
      v12 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting sampling thread", buf, 2u);
      }

      *__error() = v11;
    }

    if (byte_1000E7D31) {
      BOOL v13 = dword_1000E74E0 <= 1;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      int v14 = *__error();
      v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Starting sampling thread");
      v16 = v15;
      if (v15)
      {
        v17 = (char *)CFStringGetCStringPtr(v15, 0x8000100u);
        if (v17)
        {
          v18 = 0LL;
        }

        else
        {
          v17 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v16, v17, 1024LL, 0x8000100u);
          v18 = v17;
        }

        if (qword_1000E7D38) {
          v24 = (FILE *)qword_1000E7D38;
        }
        else {
          v24 = __stderrp;
        }
        fprintf(v24, "%s\n", v17);
        if (v18) {
          free(v18);
        }
        CFRelease(v16);
      }

      else
      {
        v22 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100092D98();
        }
        if (qword_1000E7D38) {
          v23 = (FILE *)qword_1000E7D38;
        }
        else {
          v23 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v23);
      }

      *__error() = v14;
    }

    uint64_t v25 = pthread_create(&self->_samplingThread, 0LL, (void *(__cdecl *)(void *))sub_10006D1CC, self);
    if ((_DWORD)v25)
    {
      *(void *)__errnum = v25;
      if (byte_1000E7D30)
      {
        int v31 = *__error();
        objc_super v32 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = strerror(__errnum[0]);
          sub_100092D50((uint64_t)v33, buf, __errnum[0]);
        }

        *__error() = v31;
      }

      if (byte_1000E7D31) {
        BOOL v26 = dword_1000E74E0 <= 3;
      }
      else {
        BOOL v26 = 0;
      }
      if (v26)
      {
        int v34 = *__error();
        v35 = strerror(__errnum[0]);
        v36 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s: Unable to create sampling thread: %d (%s)",  "ret == 0",  *(void *)__errnum,  v35);
        v37 = v36;
        if (v36)
        {
          v41 = (char *)CFStringGetCStringPtr(v36, 0x8000100u);
          if (v41)
          {
            v42 = 0LL;
          }

          else
          {
            v41 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v37, v41, 1024LL, 0x8000100u);
            v42 = v41;
          }

          if (qword_1000E7D38) {
            v43 = (FILE *)qword_1000E7D38;
          }
          else {
            v43 = __stderrp;
          }
          fprintf(v43, "%s\n", v41);
          if (v42) {
            free(v42);
          }
          CFRelease(v37);
        }

        else
        {
          v38 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            v39 = strerror(__errnum[0]);
            sub_100092D08((uint64_t)v39, v45, __errnum[0]);
          }

          if (qword_1000E7D38) {
            v40 = (FILE *)qword_1000E7D38;
          }
          else {
            v40 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v40);
        }

        *__error() = v34;
      }

      strerror(__errnum[0]);
      sub_10002EE78( "-[SPStackshotProvider startSamplingThread]",  "SPSampleProvider.m",  517,  "%s: Unable to create sampling thread: %d (%s)",  v27,  v28,  v29,  v30,  (char)"ret == 0");
      abort();
    }
  }

  objc_sync_exit(self);
}

- (void)stopSamplingThread
{
  if (self->_samplingThread)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplingStoppedSem);
    if (byte_1000E7D31)
    {
      if (qword_1000E7D90 && dispatch_group_wait((dispatch_group_t)qword_1000E7D90, 0LL))
      {
        if (byte_1000E7D89) {
          goto LABEL_109;
        }
        if (byte_1000E7D30)
        {
          int v3 = *__error();
          uint64_t v4 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Sampling completed, waiting for SIGINFO...",  buf,  2u);
          }

          *__error() = v3;
        }

        if (!byte_1000E7D31 || dword_1000E74E0 > 2) {
          goto LABEL_109;
        }
        int v5 = *__error();
        int v6 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Sampling completed, waiting for SIGINFO...");
        v7 = v6;
        if (v6)
        {
          CStringPtr = (char *)CFStringGetCStringPtr(v6, 0x8000100u);
          if (CStringPtr)
          {
            v9 = 0LL;
          }

          else
          {
            CStringPtr = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v7, CStringPtr, 1024LL, 0x8000100u);
            v9 = CStringPtr;
          }

          if (qword_1000E7D38) {
            v44 = (FILE *)qword_1000E7D38;
          }
          else {
            v44 = __stderrp;
          }
          fprintf(v44, "%s\n", CStringPtr);
          if (v9) {
            free(v9);
          }
          CFRelease(v7);
        }

        else
        {
          v42 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
            sub_100092E1C();
          }
          if (qword_1000E7D38) {
            v43 = (FILE *)qword_1000E7D38;
          }
          else {
            v43 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v43);
        }

        v40 = __error();
      }

      else if ((byte_1000E7D44 & 0x18) == 0x10)
      {
        if (byte_1000E7D30)
        {
          int v18 = *__error();
          int v19 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Sampling completed, generating report...",  v56,  2u);
          }

          *__error() = v18;
        }

        if (byte_1000E7D31) {
          BOOL v20 = dword_1000E74E0 <= 2;
        }
        else {
          BOOL v20 = 0;
        }
        if (!v20) {
          goto LABEL_109;
        }
        int v5 = *__error();
        objc_super v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Sampling completed, generating report...");
        v22 = v21;
        if (v21)
        {
          v23 = (char *)CFStringGetCStringPtr(v21, 0x8000100u);
          if (v23)
          {
            v24 = 0LL;
          }

          else
          {
            v23 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v22, v23, 1024LL, 0x8000100u);
            v24 = v23;
          }

          if (qword_1000E7D38) {
            v39 = (FILE *)qword_1000E7D38;
          }
          else {
            v39 = __stderrp;
          }
          fprintf(v39, "%s\n", v23);
          if (v24) {
            free(v24);
          }
          CFRelease(v22);
        }

        else
        {
          v35 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            sub_100093060();
          }
          if (qword_1000E7D38) {
            v36 = (FILE *)qword_1000E7D38;
          }
          else {
            v36 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v36);
        }

        v40 = __error();
      }

      else
      {
        if (byte_1000E7D30)
        {
          int v25 = *__error();
          BOOL v26 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v57 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Sampling completed, processing symbols...",  v57,  2u);
          }

          *__error() = v25;
        }

        if (byte_1000E7D31) {
          BOOL v27 = dword_1000E74E0 <= 2;
        }
        else {
          BOOL v27 = 0;
        }
        if (!v27) {
          goto LABEL_109;
        }
        int v5 = *__error();
        uint64_t v28 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Sampling completed, processing symbols...");
        uint64_t v29 = v28;
        if (v28)
        {
          uint64_t v30 = (char *)CFStringGetCStringPtr(v28, 0x8000100u);
          if (v30)
          {
            int v31 = 0LL;
          }

          else
          {
            uint64_t v30 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v29, v30, 1024LL, 0x8000100u);
            int v31 = v30;
          }

          if (qword_1000E7D38) {
            v41 = (FILE *)qword_1000E7D38;
          }
          else {
            v41 = __stderrp;
          }
          fprintf(v41, "%s\n", v30);
          if (v31) {
            free(v31);
          }
          CFRelease(v29);
        }

        else
        {
          v37 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
            sub_10009308C();
          }
          if (qword_1000E7D38) {
            v38 = (FILE *)qword_1000E7D38;
          }
          else {
            v38 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v38);
        }

        v40 = __error();
      }

      int *v40 = v5;
    }

+ (id)sharedInstanceLock
{
  if (qword_1000E7CE8 != -1) {
    dispatch_once(&qword_1000E7CE8, &stru_1000D9B48);
  }
  return (id)qword_1000E7CF0;
}

+ (id)snapshotWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  v17 = sub_10006EF78;
  int v18 = sub_10006EF88;
  uint64_t v19 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006EF94;
  v9[3] = &unk_1000D9B70;
  unsigned int v10 = a3;
  unsigned int v11 = a4;
  BOOL v12 = a6;
  BOOL v13 = a7;
  v9[4] = a5;
  v9[5] = &v14;
  dispatch_sync( (dispatch_queue_t)+[SPStackshotProvider sharedInstanceLock](&OBJC_CLASS___SPStackshotProvider, "sharedInstanceLock"),  v9);
  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)sampleProcesses:(id)a3 onlyMainThreads:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(self);
  if (self->_numClientsSampling)
  {
    sampleOnlyPids = self->_sampleOnlyPids;
    if (a3)
    {
      if (sampleOnlyPids)
      {
        id v8 = [a3 mutableCopy];
        [v8 minusSet:self->_sampleOnlyPids];
        if ([v8 count])
        {
          dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
          self->_sampleOnlyPidsHasUpdate = 1;
          -[NSMutableSet unionSet:](self->_sampleOnlyPids, "unionSet:", v8);
          if (byte_1000E7D30)
          {
            int v9 = *__error();
            unsigned int v10 = (os_log_s *)sub_10002EFA0();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              id v52 = objc_msgSend(objc_msgSend(v8, "description"), "UTF8String");
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Changing to sampling %s also",  buf,  0xCu);
            }

            *__error() = v9;
          }

          if (byte_1000E7D31 && dword_1000E74E0 <= 1)
          {
            int v11 = *__error();
            BOOL v12 = CFStringCreateWithFormat( kCFAllocatorDefault,  0,  @"Changing to sampling %s also",  objc_msgSend(objc_msgSend(v8, "description"), "UTF8String"));
            BOOL v13 = v12;
            if (v12)
            {
              CStringPtr = (char *)CFStringGetCStringPtr(v12, 0x8000100u);
              if (CStringPtr)
              {
                v15 = 0LL;
              }

              else
              {
                CStringPtr = (char *)calloc(0x400uLL, 1uLL);
                CFStringGetCString(v13, CStringPtr, 1024LL, 0x8000100u);
                v15 = CStringPtr;
              }

              if (qword_1000E7D38) {
                v38 = (FILE *)qword_1000E7D38;
              }
              else {
                v38 = __stderrp;
              }
              fprintf(v38, "%s\n", CStringPtr);
              if (v15) {
                free(v15);
              }
              CFRelease(v13);
            }

            else
            {
              int v34 = (os_log_s *)sub_10002EFA0();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
                sub_100093204((uint64_t)objc_msgSend(objc_msgSend(v8, "description"), "UTF8String"), (uint64_t)buf, v34);
              }
              if (qword_1000E7D38) {
                v35 = (FILE *)qword_1000E7D38;
              }
              else {
                v35 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v35);
            }

            *__error() = v11;
          }

          dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
        }
      }

      if (!v4 && -[SASampleStore sampleOnlyMainThreads](self->_sampleStore, "sampleOnlyMainThreads"))
      {
        if (byte_1000E7D30)
        {
          int v39 = *__error();
          v40 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Upping sampling to include non-main threads",  v50,  2u);
          }

          *__error() = v39;
        }

        if (byte_1000E7D31 && dword_1000E74E0 <= 1)
        {
          int v41 = *__error();
          v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Upping sampling to include non-main threads");
          v43 = v42;
          if (v42)
          {
            v44 = (char *)CFStringGetCStringPtr(v42, 0x8000100u);
            if (v44)
            {
              int v45 = 0LL;
            }

            else
            {
              v44 = (char *)calloc(0x400uLL, 1uLL);
              CFStringGetCString(v43, v44, 1024LL, 0x8000100u);
              int v45 = v44;
            }

            if (qword_1000E7D38) {
              v49 = (FILE *)qword_1000E7D38;
            }
            else {
              v49 = __stderrp;
            }
            fprintf(v49, "%s\n", v44);
            if (v45) {
              free(v45);
            }
            CFRelease(v43);
          }

          else
          {
            v46 = (os_log_s *)sub_10002EFA0();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
              sub_1000931D8();
            }
            if (qword_1000E7D38) {
              int v47 = (FILE *)qword_1000E7D38;
            }
            else {
              int v47 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v47);
          }

          *__error() = v41;
        }

        -[SASampleStore setSampleOnlyMainThreads:](self->_sampleStore, "setSampleOnlyMainThreads:", 0LL);
      }

      goto LABEL_111;
    }

    if (sampleOnlyPids)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
      self->_sampleOnlyPidsHasUpdate = 1;

      self->_sampleOnlyPids = 0LL;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
      -[SASampleStore setStackshotsOnlyIncludeSpecificProcesses:]( self->_sampleStore,  "setStackshotsOnlyIncludeSpecificProcesses:",  0LL);
      if (byte_1000E7D30)
      {
        int v24 = *__error();
        int v25 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Changing to sampling everything", buf, 2u);
        }

        *__error() = v24;
      }

      if (byte_1000E7D31 && dword_1000E74E0 <= 1)
      {
        int v19 = *__error();
        BOOL v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Changing to sampling everything");
        BOOL v27 = v26;
        if (v26)
        {
          uint64_t v28 = (char *)CFStringGetCStringPtr(v26, 0x8000100u);
          if (v28)
          {
            uint64_t v29 = 0LL;
          }

          else
          {
            uint64_t v28 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v27, v28, 1024LL, 0x8000100u);
            uint64_t v29 = v28;
          }

          if (qword_1000E7D38) {
            v48 = (FILE *)qword_1000E7D38;
          }
          else {
            v48 = __stderrp;
          }
          fprintf(v48, "%s\n", v28);
          if (v29) {
            free(v29);
          }
          CFRelease(v27);
        }

        else
        {
          v36 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
            sub_1000931AC();
          }
          if (qword_1000E7D38) {
            v37 = (FILE *)qword_1000E7D38;
          }
          else {
            v37 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v37);
        }

        v33 = __error();
LABEL_101:
        int *v33 = v19;
      }
    }
  }

  else
  {
    if (a3) {
      -[SASampleStore setStackshotsOnlyIncludeSpecificProcesses:]( self->_sampleStore,  "setStackshotsOnlyIncludeSpecificProcesses:",  1LL);
    }
    if (byte_1000E7D30)
    {
      int v16 = *__error();
      v17 = (os_log_s *)sub_10002EFA0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10009315C((uint64_t)[a3 description], v4, (uint64_t)buf, v17);
      }
      *__error() = v16;
    }

    if (byte_1000E7D31) {
      BOOL v18 = dword_1000E74E0 <= 3;
    }
    else {
      BOOL v18 = 0;
    }
    if (v18)
    {
      int v19 = *__error();
      BOOL v20 = CFStringCreateWithFormat( kCFAllocatorDefault,  0,  @"No one's sampling when requested to adjust sampling target to %@ %d",  [a3 description],  v4);
      objc_super v21 = v20;
      if (v20)
      {
        v22 = (char *)CFStringGetCStringPtr(v20, 0x8000100u);
        if (v22)
        {
          v23 = 0LL;
        }

        else
        {
          v22 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v21, v22, 1024LL, 0x8000100u);
          v23 = v22;
        }

        if (qword_1000E7D38) {
          objc_super v32 = (FILE *)qword_1000E7D38;
        }
        else {
          objc_super v32 = __stderrp;
        }
        fprintf(v32, "%s\n", v22);
        if (v23) {
          free(v23);
        }
        CFRelease(v21);
      }

      else
      {
        uint64_t v30 = (os_log_s *)sub_10002EFA0();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          sub_100093110((uint64_t)[a3 description], (uint64_t)v50, v4, v30);
        }
        if (qword_1000E7D38) {
          int v31 = (FILE *)qword_1000E7D38;
        }
        else {
          int v31 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v31);
      }

      v33 = __error();
      goto LABEL_101;
    }
  }

- (BOOL)startWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7
{
  if (a3)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    uint64_t v10 = *(void *)&a4;
    uint64_t v11 = *(void *)&a3;
    objc_sync_enter(self);
    int numClientsSampling = self->_numClientsSampling;
    if (numClientsSampling)
    {
      if (self->_samplingIntervalUs != (_DWORD)v11
        || (_DWORD)v10 && (unsigned int v14 = self->_occasionalDataIntervalSec) != 0 && v14 != (_DWORD)v10)
      {
        if (byte_1000E7D30)
        {
          int v15 = *__error();
          int v16 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            unsigned int samplingIntervalUs = self->_samplingIntervalUs;
            unsigned int occasionalDataIntervalSec = self->_occasionalDataIntervalSec;
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v119 = samplingIntervalUs;
            *(_WORD *)&v119[4] = 1024;
            *(_DWORD *)&v119[6] = occasionalDataIntervalSec;
            __int16 v120 = 1024;
            LODWORD(v121[0]) = v11;
            WORD2(v121[0]) = 1024;
            *(_DWORD *)((char *)v121 + 6) = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data",  buf,  0x1Au);
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
          int v18 = *__error();
          int v19 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data",  self->_samplingIntervalUs,  self->_occasionalDataIntervalSec,  v11,  v10);
          BOOL v20 = v19;
          if (v19)
          {
            CStringPtr = (char *)CFStringGetCStringPtr(v19, 0x8000100u);
            if (CStringPtr)
            {
              v22 = 0LL;
            }

            else
            {
              CStringPtr = (char *)calloc(0x400uLL, 1uLL);
              CFStringGetCString(v20, CStringPtr, 1024LL, 0x8000100u);
              v22 = CStringPtr;
            }

            if (qword_1000E7D38) {
              v56 = (FILE *)qword_1000E7D38;
            }
            else {
              v56 = __stderrp;
            }
            fprintf(v56, "%s\n", CStringPtr);
            if (v22) {
              free(v22);
            }
            CFRelease(v20);
          }

          else
          {
            int v47 = (os_log_s *)sub_10002EFA0();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
            {
              unsigned int v112 = self->_samplingIntervalUs;
              unsigned int v113 = self->_occasionalDataIntervalSec;
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v119 = v112;
              *(_WORD *)&v119[4] = 1024;
              *(_DWORD *)&v119[6] = v113;
              __int16 v120 = 1024;
              LODWORD(v121[0]) = v11;
              WORD2(v121[0]) = 1024;
              *(_DWORD *)((char *)v121 + 6) = v10;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_FAULT,  "Unable to format: Already sampling with %uus-interval stackshots and %uus-interval occasional data, so c an't start sampling with %uus-interval stackshots and %us-interval occasional data",  buf,  0x1Au);
            }

            if (qword_1000E7D38) {
              v48 = (FILE *)qword_1000E7D38;
            }
            else {
              v48 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
          }

          BOOL v23 = 0;
          *__error() = v18;
          goto LABEL_201;
        }

        goto LABEL_29;
      }

      if (!v7 || self->_omitSensitiveStrings)
      {
        self->_int numClientsSampling = numClientsSampling + 1;
        if (byte_1000E7D30)
        {
          int v27 = *__error();
          uint64_t v28 = (os_log_s *)sub_10002EFA0();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_100093464();
          }
          *__error() = v27;
        }

        if (byte_1000E7D31) {
          BOOL v29 = dword_1000E74E0 <= 0;
        }
        else {
          BOOL v29 = 0;
        }
        if (v29)
        {
          int v30 = *__error();
          int v31 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Already sampling with %uus-interval stackshots and %us-interval occasional data",  self->_samplingIntervalUs,  self->_occasionalDataIntervalSec);
          objc_super v32 = v31;
          if (v31)
          {
            v33 = (char *)CFStringGetCStringPtr(v31, 0x8000100u);
            if (v33)
            {
              int v34 = 0LL;
            }

            else
            {
              v33 = (char *)calloc(0x400uLL, 1uLL);
              CFStringGetCString(v32, v33, 1024LL, 0x8000100u);
              int v34 = v33;
            }

            if (qword_1000E7D38) {
              v67 = (FILE *)qword_1000E7D38;
            }
            else {
              v67 = __stderrp;
            }
            fprintf(v67, "%s\n", v33);
            if (v34) {
              free(v34);
            }
            CFRelease(v32);
          }

          else
          {
            v64 = (os_log_s *)sub_10002EFA0();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
              sub_1000933F0();
            }
            if (qword_1000E7D38) {
              v65 = (FILE *)qword_1000E7D38;
            }
            else {
              v65 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v65);
          }

          *__error() = v30;
        }

        v68 = (int *)-[SPStackshotProvider sampleProcesses:onlyMainThreads:]( self,  "sampleProcesses:onlyMainThreads:",  a5,  v8);
        p_unsigned int occasionalDataIntervalSec = &self->_occasionalDataIntervalSec;
        if (!self->_occasionalDataIntervalSec)
        {
          unsigned int *p_occasionalDataIntervalSec = v10;
          if (byte_1000E7D30)
          {
            int v70 = *__error();
            v71 = (os_log_s *)sub_10002EFA0();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              unsigned int v72 = *p_occasionalDataIntervalSec;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v119 = v72;
              _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_INFO,  "Turned on occasional data gathering at %us-intervals for additional client",  buf,  8u);
            }

            v68 = __error();
            int *v68 = v70;
          }

          if (byte_1000E7D31 && dword_1000E74E0 <= 1)
          {
            int v73 = *__error();
            v74 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Turned on occasional data gathering at %us-intervals for additional client",  *p_occasionalDataIntervalSec);
            v75 = v74;
            if (v74)
            {
              v76 = (char *)CFStringGetCStringPtr(v74, 0x8000100u);
              if (v76)
              {
                v77 = 0LL;
              }

              else
              {
                v76 = (char *)calloc(0x400uLL, 1uLL);
                CFStringGetCString(v75, v76, 1024LL, 0x8000100u);
                v77 = v76;
              }

              if (qword_1000E7D38) {
                v87 = (FILE *)qword_1000E7D38;
              }
              else {
                v87 = __stderrp;
              }
              fprintf(v87, "%s\n", v76);
              if (v77) {
                free(v77);
              }
              CFRelease(v75);
            }

            else
            {
              v82 = (os_log_s *)sub_10002EFA0();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT)) {
                sub_10009338C();
              }
              if (qword_1000E7D38) {
                v83 = (FILE *)qword_1000E7D38;
              }
              else {
                v83 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v83);
            }

            v68 = __error();
            int *v68 = v73;
          }
        }

        double Current = SAMachAbsTimeSecondsGetCurrent(v68);
        if ((_DWORD)v10)
        {
          double v89 = Current;
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100070BC0;
          block[3] = &unk_1000D8DD8;
          *(double *)&block[5] = v89;
          block[4] = self;
          dispatch_async(global_queue, block);
        }

- (void)stopAndWaitForAllSamplingToComplete:(BOOL)a3 withCompletionCallbackOnQueue:(id)a4 withBlock:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070E0C;
  block[3] = &unk_1000D95B0;
  block[4] = self;
  dispatch_sync( (dispatch_queue_t)+[SPStackshotProvider sharedInstanceLock](&OBJC_CLASS___SPStackshotProvider, "sharedInstanceLock"),  block);
  objc_sync_enter(self);
  if (self->_numClientsSampling)
  {
    id v9 = +[SATimestamp timestamp](&OBJC_CLASS___SATimestamp, "timestamp");
    uint64_t v10 = *(void *)&self->_numSamples;
    int v11 = self->_numClientsSampling - 1;
    self->_int numClientsSampling = v11;
    if (!v11)
    {
      -[SPStackshotProvider stopSamplingThread](self, "stopSamplingThread");
      dispatch_group_leave((dispatch_group_t)self->_samplingGroup);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
      self->_sampleOnlyPidsHasUpdate = 1;

      self->_sampleOnlyPids = 0LL;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100071138;
    v14[3] = &unk_1000D9BE8;
    v14[4] = v9;
    v14[5] = self;
    v14[6] = a4;
    v14[7] = a5;
    v14[8] = v10;
    BOOL v15 = a3;
    BOOL v13 = v14;
    goto LABEL_8;
  }

  if (a4 && a5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100071128;
    v16[3] = &unk_1000D9AB8;
    v16[4] = a5;
    BOOL v13 = v16;
    dispatch_queue_global_t global_queue = (dispatch_queue_s *)a4;
LABEL_8:
    dispatch_async(global_queue, v13);
  }

  objc_sync_exit(self);
}

- (void)waitForSamplingToComplete
{
}

- (void)performSampleStoreWork:(id)a3
{
  storeReportingQueue = self->_storeReportingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007130C;
  v4[3] = &unk_1000D9728;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)storeReportingQueue, v4);
}

- (void)gatherLoadInfoForPid:(int)a3
{
  stackshotParsingQueue = self->_stackshotParsingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007137C;
  v4[3] = &unk_1000D97D8;
  v4[4] = self;
  int v5 = a3;
  dispatch_async((dispatch_queue_t)stackshotParsingQueue, v4);
}

- (int)numSamples
{
  return self->_numSamples;
}

- (int)numSamplesAvoidedDueToAudio
{
  return self->_numSamplesAvoidedDueToAudio;
}

@end