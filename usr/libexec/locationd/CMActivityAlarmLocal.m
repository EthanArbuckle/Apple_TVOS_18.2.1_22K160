@interface CMActivityAlarmLocal
+ (BOOL)activityAlarmAvailable;
+ (id)activityAlarmInfo;
- (BOOL)isValid;
- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 forClient:(const void *)a6 withHandler:(id)a7;
- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6;
- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6;
- (NSString)bundleId;
- (NSString)executable;
- (void)dealloc;
- (void)fire;
- (void)invalidate;
- (void)setBundleId:(id)a3;
- (void)setExecutable:(id)a3;
@end

@implementation CMActivityAlarmLocal

+ (BOOL)activityAlarmAvailable
{
  return sub_100ED5364() != 0;
}

+ (id)activityAlarmInfo
{
  id result = (id)sub_100ED5364();
  if (result) {
    return sub_100ED5EEC((uint64_t)result);
  }
  return result;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CMActivityAlarmLocal;
  v10 = -[CMActivityAlarmLocal init](&v18, "init");
  v11 = v10;
  if (v9 < 0x1C)
  {
    uint64_t v12 = sub_100ED5364();
    v11->fConcentrator = (void *)v12;
    if (!v12) {
      sub_101276F34(qword_101934500 == -1);
    }
    if (qword_101934500 != -1) {
      dispatch_once(&qword_101934500, &stru_10188AF00);
    }
    v13 = (os_log_s *)qword_101934508;
    if (os_log_type_enabled((os_log_t)qword_101934508, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v23 = v9;
      __int16 v24 = 2048;
      double v25 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "trigger,%d,duration,%f", buf, 0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934500 != -1) {
        dispatch_once(&qword_101934500, &stru_10188AF00);
      }
      v19[0] = 67109376;
      v19[1] = v9;
      __int16 v20 = 2048;
      double v21 = a4;
      LODWORD(v17) = 18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934508,  1LL,  "trigger,%d,duration,%f",  v19,  v17);
      v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMActivityAlarmLocal initWithTrigger:duration:onQueue:withHandler:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    v11->fIsValid = 1;
    v11->fRunLoop = 0LL;
    dispatch_retain((dispatch_object_t)a5);
    v11->fQueue = (OS_dispatch_queue *)a5;
    v11->fHandler = _Block_copy(a6);
    -[CMActivityAlarmLocal setDuration:](v11, "setDuration:", a4);
    -[CMActivityAlarmLocal setTrigger:](v11, "setTrigger:", v9);
    v11->_bundleId = (NSString *)@"<locationd internal>";
    v11->_executable = (NSString *)@"<locationd internal>";
    sub_100ED57C0((char *)v11->fConcentrator, v11);
  }

  else
  {

    return 0LL;
  }

  return v11;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 forClient:(const void *)a6 withHandler:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CMActivityAlarmLocal;
  uint64_t v12 = -[CMActivityAlarmLocal init](&v23, "init");
  v13 = v12;
  if (v11 < 0x1C)
  {
    uint64_t v14 = sub_100ED5364();
    v13->fConcentrator = (void *)v14;
    if (!v14) {
      sub_1012770A8();
    }
    v13->fIsValid = 1;
    v13->fRunLoop = 0LL;
    dispatch_retain((dispatch_object_t)a5);
    v13->fQueue = (OS_dispatch_queue *)a5;
    v13->fHandler = _Block_copy(a7);
    -[CMActivityAlarmLocal setDuration:](v13, "setDuration:", a4);
    -[CMActivityAlarmLocal setTrigger:](v13, "setTrigger:", v11);
    v15 = objc_alloc(&OBJC_CLASS___NSString);
    sub_100FE370C((uint64_t)a6);
    else {
      v16 = (char *)*((void *)a6 + 13);
    }
    v13->_bundleId = -[NSString initWithUTF8String:](v15, "initWithUTF8String:", v16);
    double v17 = objc_alloc(&OBJC_CLASS___NSString);
    __int16 v20 = (char *)*((void *)a6 + 3);
    v19 = (char *)a6 + 24;
    objc_super v18 = v20;
    if (v19[23] >= 0) {
      double v21 = v19;
    }
    else {
      double v21 = v18;
    }
    v13->_executable = -[NSString initWithUTF8String:](v17, "initWithUTF8String:", v21);
    sub_100ED57C0((char *)v13->fConcentrator, v13);
  }

  else
  {

    return 0LL;
  }

  return v13;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CMActivityAlarmLocal;
  id v10 = -[CMActivityAlarmLocal init](&v13, "init");
  uint64_t v11 = sub_100ED5364();
  *((void *)v10 + 1) = v11;
  if (!v11) {
    sub_101277224();
  }
  *((_BYTE *)v10 + 16) = 1;
  *((void *)v10 + 3) = a5;
  *((void *)v10 + 4) = 0LL;
  *((void *)v10 + 5) = _Block_copy(a6);
  [v10 setDuration:a4];
  [v10 setTrigger:v9];
  *((void *)v10 + 6) = @"<locationd internal>";
  *((void *)v10 + 7) = @"<locationd internal>";
  sub_100ED57C0(*((char **)v10 + 1), v10);
  return (CMActivityAlarmLocal *)v10;
}

- (void)dealloc
{
  -[CMActivityAlarmLocal invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMActivityAlarmLocal;
  -[CMActivityAlarmLocal dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    _Block_release(self->fHandler);
    self->fHandler = 0LL;
    fQueue = (dispatch_queue_s *)self->fQueue;
    if (fQueue)
    {
      self->fQueue = 0LL;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100EDB0E8;
      block[3] = &unk_10181A288;
      block[4] = fQueue;
      dispatch_async(fQueue, block);
    }

    self->fRunLoop = 0LL;
    objc_sync_exit(self);
    sub_100ED5B7C((uint64_t)self->fConcentrator, self);
  }

  else
  {
    objc_sync_exit(self);
  }

- (BOOL)isValid
{
  BOOL fIsValid = self->fIsValid;
  objc_sync_exit(self);
  return fIsValid;
}

- (void)fire
{
  if (self->fIsValid)
  {
    self->BOOL fIsValid = 0;
    if (self->fRunLoop)
    {
      objc_super v3 = _Block_copy(self->fHandler);
      fRunLoop = self->fRunLoop;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100EDB26C;
      block[3] = &unk_10182C230;
      block[4] = self;
      void block[5] = v3;
      CFRunLoopPerformBlock(fRunLoop, kCFRunLoopDefaultMode, block);
      CFRunLoopWakeUp(self->fRunLoop);
      self->fRunLoop = 0LL;
    }

    if (self->fQueue)
    {
      v5 = _Block_copy(self->fHandler);
      fQueue = (dispatch_queue_s *)self->fQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100EDB2A0;
      v7[3] = &unk_10182C230;
      v7[4] = self;
      v7[5] = v5;
      dispatch_async(fQueue, v7);
      dispatch_release((dispatch_object_t)self->fQueue);
      self->fQueue = 0LL;
    }

    _Block_release(self->fHandler);
    self->fHandler = 0LL;
  }

  objc_sync_exit(self);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)executable
{
  return self->_executable;
}

- (void)setExecutable:(id)a3
{
}

@end