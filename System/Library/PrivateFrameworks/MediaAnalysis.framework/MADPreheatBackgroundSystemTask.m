@interface MADPreheatBackgroundSystemTask
+ (BOOL)buddyCheckRequired;
+ (BOOL)enabled;
+ (id)identifier;
+ (id)sharedTask;
+ (int)clearPixelBuffer:(__CVBuffer *)a3;
+ (unint64_t)taskID;
- (BOOL)oneShot;
- (void)dealloc;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
@end

@implementation MADPreheatBackgroundSystemTask

+ (int)clearPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 0LL;
  if (a3)
  {
    v4 = (void *)CVPixelBufferLockBaseAddress(a3, 0LL);
    LODWORD(v23) = (_DWORD)v4;
    if ((_DWORD)v4)
    {
      BaseAddress = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004B5DC((uint64_t)a3, (uint64_t)BaseAddress, v6, v7, v8, v9, v10, v11);
      }
    }

    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      memset(BaseAddress, 255, Height * BytesPerRow);
      LODWORD(BaseAddress) = sub_100026E48(&v23);
      if (pixelBuffer
        && !(_DWORD)v23
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10004B570();
      }
    }
  }

  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_10002C480(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    LODWORD(BaseAddress) = -50;
  }

  return (int)BaseAddress;
}

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A8D0;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6460 != -1) {
    dispatch_once(&qword_1001E6460, block);
  }
  return (id)qword_1001E6458;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.preheat";
}

+ (unint64_t)taskID
{
  return 0LL;
}

+ (BOOL)buddyCheckRequired
{
  return 0;
}

- (BOOL)oneShot
{
  return 1;
}

+ (BOOL)enabled
{
  return 1;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v100 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  BYTE1(self->_preheat_completion_semaphore) = 0;
  v98 = v6;
  id v7 = [(id)objc_opt_class(self) enabled];
  if ((v7 & 1) != 0)
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v93 = (void *)objc_claimAutoreleasedReturnValue([v97 persistentDomainForName:MediaAnalysisDaemonDomain]);
    v95 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:@"PreheatLastRun"]);
    if (v95)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v95, v9);
      if ((isKindOfClass & 1) != 0)
      {
        id v96 = v95;
        goto LABEL_15;
      }

      uint64_t v17 = MediaAnalysisLogLevel(isKindOfClass, v11);
      if ((int)v17 >= 3)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "[Preheat] Last run date malformed; dropping", buf, 2u);
        }
      }
    }

    id v96 = 0LL;
LABEL_15:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v22 systemUptime];
    double v24 = v23;

    if (v96)
    {
      [v96 timeIntervalSinceNow];
      if (v24 > -v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:@"PreheatAttempts"]);
        v28 = v27;
        if (v27)
        {
          unsigned int v29 = [v27 unsignedIntValue];

          uint64_t v32 = v29 + 1LL;
          if (v29 >= 2)
          {
            uint64_t v33 = MediaAnalysisLogLevel(v30, v31);
            if ((int)v33 >= 4)
            {
              uint64_t v35 = VCPLogInstance(v33, v34);
              v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              os_log_type_t v37 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v36, v37))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)v111 = v32;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "Preheat attempted for %lu times, not allowed to retry",  buf,  0xCu);
              }
            }

            v98[2](v98, 4294967278LL);
LABEL_60:

            uint64_t v6 = v98;
            goto LABEL_61;
          }
        }

        else
        {
          uint64_t v32 = 1LL;
        }

- (void)dealloc
{
  if (BYTE1(self->_preheat_completion_semaphore))
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)((char *)&self->_preheat_queue + 1), 0xFFFFFFFFFFFFFFFFLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[VCPClientManager sharedManager](&OBJC_CLASS___VCPClientManager, "sharedManager"));
    [v3 removeClientHandler:*(void *)(&self->_preheat_timed_out + 1)];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MADPreheatBackgroundSystemTask;
  -[MADPreheatBackgroundSystemTask dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end