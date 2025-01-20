@interface CLFallLogger
- (BOOL)_shouldRotate;
- (BOOL)_shouldRotateToHour:(int64_t *)a3 date:(id *)a4;
- (CLFallLogger)init;
- (id)_currentFilename;
- (id)_outputStream;
- (id)currentFilename;
- (id)initToDirectory:(id)a3 prefix:(id)a4 rotation:(int64_t)a5;
- (id)logDirectory;
- (void)_stopLoggingOnQueue;
- (void)clearLogs;
- (void)dealloc;
- (void)flushInMemoryDataWithCompletionQueue:(id)a3 completionBlock:(id)a4;
- (void)flushToFile;
- (void)logData:(id)a3;
- (void)stopLogging;
@end

@implementation CLFallLogger

- (CLFallLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLFallLogger;
  v2 = -[CLFallLogger init](&v4, "init");
  if (v2) {
    v2->fQueue = (OS_dispatch_queue *)dispatch_queue_create("CLFallLogger", 0LL);
  }
  return v2;
}

- (id)initToDirectory:(id)a3 prefix:(id)a4 rotation:(int64_t)a5
{
  v8 = -[CLFallLogger init](self, "init");
  if (v8)
  {
    v8->fLogDirectory = (NSString *)a3;
    v8->fLogFilePrefix = (NSString *)a4;
    v8->fRotation = a5;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFallLogger;
  -[CLFallLogger dealloc](&v3, "dealloc");
}

- (id)logDirectory
{
  return self->fLogDirectory;
}

- (id)_currentFilename
{
  if (!self->fHour && !self->fDate) {
    return &stru_1018A4B00;
  }
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyyMMdd");
  if (self->fRotation) {
    objc_super v4 = -[NSDateFormatter stringFromDate:](v3, "stringFromDate:", self->fDate);
  }
  else {
    objc_super v4 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->fHour);
  }
  v5 = v4;

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.v%d.%@.%@",  self->fLogFilePrefix,  11LL,  v5,  @"bin");
}

- (id)currentFilename
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100EF636C;
  v10 = sub_100EF637C;
  uint64_t v11 = 0LL;
  fQueue = (dispatch_queue_s *)self->fQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100EF6388;
  v5[3] = &unk_101844130;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_stopLoggingOnQueue
{
  self->fOutputStream = 0LL;
  self->fHour = 0LL;

  self->fDate = 0LL;
}

- (BOOL)_shouldRotate
{
  return -[CLFallLogger _shouldRotateToHour:date:](self, "_shouldRotateToHour:date:", 0LL, 0LL);
}

- (BOOL)_shouldRotateToHour:(int64_t *)a3 date:(id *)a4
{
  if (!self->fLogDirectory) {
    return 0;
  }
  if (!self->fRotation)
  {
    int64_t v8 = (uint64_t)CFAbsoluteTimeGetCurrent() / 3600;
    if (self->fHour != v8)
    {
      v7 = 0LL;
      if (!a3) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }

    return 0;
  }

  v7 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if (-[NSCalendar isDate:inSameDayAsDate:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "isDate:inSameDayAsDate:",  self->fDate,  v7))
  {
    return 0;
  }

  int64_t v8 = 0LL;
  if (a3) {
LABEL_5:
  }
    *a3 = v8;
LABEL_6:
  if (a4) {
    *a4 = v7;
  }
  return 1;
}

- (void)stopLogging
{
  fQueue = (dispatch_queue_s *)self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100EF6520;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_sync(fQueue, block);
}

- (void)clearLogs
{
  fQueue = (dispatch_queue_s *)self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100EF6580;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)flushToFile
{
  fQueue = (dispatch_queue_s *)self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100EF662C;
  block[3] = &unk_10181A288;
  block[4] = self;
  dispatch_sync(fQueue, block);
}

- (void)flushInMemoryDataWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  fQueue = (dispatch_queue_s *)self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100EF66C0;
  block[3] = &unk_1018653A8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(fQueue, block);
}

- (id)_outputStream
{
  if (!self->fLogDirectory)
  {
    if (self->fOutputStream) {
      return self->fOutputStream;
    }
    v7 = -[NSOutputStream initToMemory](objc_alloc(&OBJC_CLASS___NSOutputStream), "initToMemory");
    goto LABEL_32;
  }

  id v17 = 0LL;
  int64_t v18 = 0LL;
  if (!-[CLFallLogger _shouldRotateToHour:date:](self, "_shouldRotateToHour:date:", &v18, &v17)) {
    return self->fOutputStream;
  }
  -[CLFallLogger _stopLoggingOnQueue](self, "_stopLoggingOnQueue");
  char v16 = 1;
  unsigned int v3 = -[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  self->fLogDirectory,  &v16);
  if (v3) {
    BOOL v4 = v16 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    if ((v3 & 1) == 0)
    {
      uint64_t v15 = 0LL;
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  self->fLogDirectory,  1LL,  0LL,  &v15);
      if (v15)
      {
        if (qword_1019345D0 != -1) {
          dispatch_once(&qword_1019345D0, &stru_10188BE10);
        }
        v5 = (os_log_s *)qword_1019345D8;
        if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Directory creation failed: %@", buf, 0xCu);
        }

        if (sub_1002921D0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019345D0 != -1) {
            dispatch_once(&qword_1019345D0, &stru_10188BE10);
          }
          int v20 = 138412290;
          uint64_t v21 = v15;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  17LL,  "Directory creation failed: %@",  &v20,  12);
LABEL_27:
          v9 = (uint8_t *)v6;
          sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLFallLogger _outputStream]", "%s\n", v6);
          if (v9 != buf) {
            free(v9);
          }
          return self->fOutputStream;
        }

        return self->fOutputStream;
      }
    }

    self->fHour = v18;
    self->fDate = (NSDate *)v17;
    v19[0] = self->fLogDirectory;
    v19[1] = -[CLFallLogger _currentFilename](self, "_currentFilename");
    v10 = +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v10)
      && !-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v10,  0LL,  0LL))
    {
      if (qword_1019345D0 != -1) {
        dispatch_once(&qword_1019345D0, &stru_10188BE10);
      }
      v12 = (os_log_s *)qword_1019345D8;
      if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "File creation failed", buf, 2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019345D0 != -1) {
          dispatch_once(&qword_1019345D0, &stru_10188BE10);
        }
        LOWORD(v20) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  17LL,  "File creation failed",  &v20,  2);
        v14 = (uint8_t *)v13;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLFallLogger _outputStream]", "%s\n", v13);
        if (v14 != buf) {
          free(v14);
        }
      }

      -[CLFallLogger _stopLoggingOnQueue](self, "_stopLoggingOnQueue");
      return self->fOutputStream;
    }

    v7 = -[NSOutputStream initToFileAtPath:append:]( objc_alloc(&OBJC_CLASS___NSOutputStream),  "initToFileAtPath:append:",  v10,  1LL);
LABEL_32:
    self->fOutputStream = v7;
    -[NSOutputStream open](v7, "open");
    return self->fOutputStream;
  }

  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_10188BE10);
  }
  int64_t v8 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "Unable to create directory. There is a file with the same name.",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10188BE10);
    }
    LOWORD(v20) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  17LL,  "Unable to create directory. There is a file with the same name.",  &v20,  2);
    goto LABEL_27;
  }

  return self->fOutputStream;
}

- (void)logData:(id)a3
{
  fQueue = (dispatch_queue_s *)self->fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100EF6CD0;
  v4[3] = &unk_10181A328;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fQueue, v4);
}

@end