@interface CLBatchedDeviceMotionService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLBatchedDeviceMotionService)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)onBatchedData:(void *)a3 N:(int)a4;
- (void)registerForData:(id)a3;
- (void)unregisterForData:(id)a3;
@end

@implementation CLBatchedDeviceMotionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199EE20 != -1) {
    dispatch_once(&qword_10199EE20, &stru_101889010);
  }
  return (id)qword_10199EE18;
}

+ (BOOL)isSupported
{
  return +[CLBatchedSensorService isSupported](&OBJC_CLASS___CLBatchedSensorService, "isSupported");
}

- (CLBatchedDeviceMotionService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  v2 = -[CLBatchedSensorService initWithClientProtocol:]( &v10,  "initWithClientProtocol:",  &OBJC_PROTOCOL___CLBatchedDeviceMotionServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    int64_t var0 = v2->super._info.name.var0;
    v3->super._info.name.int64_t var0 = 0LL;
    if (var0) {
      (*(void (**)(int64_t))(*(void *)var0 + 8LL))(var0);
    }
    if (byte_10199EE0F < 0)
    {
      sub_1010DD48C(__p, (void *)xmmword_10199EDF8, *((unint64_t *)&xmmword_10199EDF8 + 1));
    }

    else
    {
      *(_OWORD *)__p = xmmword_10199EDF8;
      uint64_t v8 = unk_10199EE08;
    }

    int v9 = dword_10199EE10;
    v6.receiver = v3;
    v6.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
    -[CLBatchedSensorService setInfo:](&v6, "setInfo:", __p);
    if (SHIBYTE(v8) < 0) {
      operator delete(__p[0]);
    }
  }

  return v3;
}

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  -[CLBatchedSensorService disableProvider](&v6, "disableProvider");
  int64_t var0 = self->super._info.name.var0;
  if (var0)
  {
    sub_100866AE4(var0);
    int64_t v4 = self->super._info.name.var0;
    self->super._info.name.int64_t var0 = 0LL;
    if (v4) {
      (*(void (**)(int64_t))(*(void *)v4 + 8LL))(v4);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  -[CLBatchedSensorService dealloc](&v5, "dealloc");
}

- (void)registerForData:(id)a3
{
  if (self->super._info.name.var0) {
    goto LABEL_23;
  }
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  -[CLBatchedSensorService enableProvider](&v19, "enableProvider");
  if (qword_1019347C0 != -1) {
    dispatch_once(&qword_1019347C0, &stru_101889030);
  }
  objc_super v5 = (os_log_s *)qword_1019347C8;
  if (os_log_type_enabled((os_log_t)qword_1019347C8, OS_LOG_TYPE_DEFAULT))
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
    -[CLBatchedSensorService info](&v18, "info");
    objc_super v6 = v23 >= 0 ? __p : (void **)__p[0];
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[service-%{public}s] first client, creating fast path interface",  (uint8_t *)&buf,  0xCu);
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019347C0 != -1) {
      dispatch_once(&qword_1019347C0, &stru_101889030);
    }
    uint64_t v12 = qword_1019347C8;
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
    -[CLBatchedSensorService info](&v17, "info");
    if (v26 >= 0) {
      p___int128 buf = &buf;
    }
    else {
      p___int128 buf = (__int128 *)buf;
    }
    int v20 = 136446210;
    v21 = p_buf;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v12,  0LL,  "[service-%{public}s] first client, creating fast path interface",  &v20,  12);
    v15 = v14;
    if (v26 < 0) {
      operator delete((void *)buf);
    }
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBatchedDeviceMotionService registerForData:]", "%s\n", v15);
  }

  id v7 = objc_msgSend(-[CLBatchedDeviceMotionService universe](self, "universe"), "silo");
  uint64_t v8 = operator new(0xE8uLL);
  if (byte_10199EE0F < 0)
  {
    sub_1010DD48C(__p, (void *)xmmword_10199EDF8, *((unint64_t *)&xmmword_10199EDF8 + 1));
  }

  else
  {
    *(_OWORD *)__p = xmmword_10199EDF8;
    uint64_t v23 = unk_10199EE08;
  }

  int v24 = dword_10199EE10;
  *(void *)&__int128 buf = &off_101889060;
  *((void *)&buf + 1) = self;
  v27 = &buf;
  sub_100ADEC10(v8, (uint64_t)v7, (uint64_t)__p, (uint64_t)&buf);
  int v9 = v27;
  if (v27 == &buf)
  {
    uint64_t v10 = 4LL;
    int v9 = &buf;
    goto LABEL_18;
  }

  if (v27)
  {
    uint64_t v10 = 5LL;
LABEL_18:
    (*(void (**)(void))(*(void *)v9 + 8 * v10))();
  }

  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
  int64_t var0 = self->super._info.name.var0;
  self->super._info.name.int64_t var0 = (int64_t)v8;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 8LL))(var0);
  }
LABEL_23:
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  -[CLBatchedSensorService registerForData:](&v16, "registerForData:", a3);
  sub_100866CD0(self->super._info.name.var0, 0.5);
}

- (void)unregisterForData:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  -[CLBatchedSensorService unregisterForData:](&v8, "unregisterForData:", a3);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  if (!-[NSMutableSet count](-[CLBatchedSensorService clients](&v7, "clients"), "count"))
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
    -[CLBatchedSensorService disableProvider](&v6, "disableProvider");
    int64_t var0 = self->super._info.name.var0;
    if (var0)
    {
      sub_100866AE4(var0);
      int64_t v5 = self->super._info.name.var0;
      self->super._info.name.int64_t var0 = 0LL;
      if (v5) {
        (*(void (**)(int64_t))(*(void *)v5 + 8LL))(v5);
      }
    }
  }

- (void)onBatchedData:(void *)a3 N:(int)a4
{
  if (qword_1019347C0 != -1) {
    dispatch_once(&qword_1019347C0, &stru_101889030);
  }
  objc_super v7 = (os_log_s *)qword_1019347C8;
  if (os_log_type_enabled((os_log_t)qword_1019347C8, OS_LOG_TYPE_INFO))
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
    -[CLBatchedSensorService info](&v24, "info");
    objc_super v8 = v35 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)__int128 buf = 136446466;
    *(void *)&buf[4] = v8;
    __int16 v27 = 1026;
    int v28 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[service-%{public}s] notifying %{public}d samples",  buf,  0x12u);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019347C0 != -1) {
      dispatch_once(&qword_1019347C0, &stru_101889030);
    }
    uint64_t v14 = qword_1019347C8;
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
    -[CLBatchedSensorService info](&v23, "info");
    if (v29 >= 0) {
      v15 = buf;
    }
    else {
      v15 = *(_BYTE **)buf;
    }
    int v30 = 136446466;
    v31 = v15;
    __int16 v32 = 1026;
    int v33 = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v14,  1LL,  "[service-%{public}s] notifying %{public}d samples",  &v30,  18);
    objc_super v17 = v16;
    if (v29 < 0) {
      operator delete(*(void **)buf);
    }
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBatchedDeviceMotionService onBatchedData:N:]", "%s\n", v17);
  }

  int v9 = -[CLBatchedDeviceMotionBufferWrapper initWithMovedBuffer:]( objc_alloc(&OBJC_CLASS___CLBatchedDeviceMotionBufferWrapper),  "initWithMovedBuffer:",  a3);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CLBatchedDeviceMotionService;
  uint64_t v10 = -[CLBatchedSensorService clients](&v18, "clients");
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v19,  v25,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)i) onBatchedDeviceMotionData:v9];
      }

      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v19,  v25,  16LL);
    }

    while (v11);
  }
}

- (void).cxx_destruct
{
  int64_t var0 = self->super._info.name.var0;
  self->super._info.name.int64_t var0 = 0LL;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 8LL))(var0);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  return self;
}

@end