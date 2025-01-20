@interface CaptureMTLSharedEvent
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4;
- (CaptureMTLSharedEvent)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLSharedEvent)baseObject;
- (NSString)description;
- (NSString)label;
- (id)IOSurfaceSharedEvent;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newSharedEventHandle;
- (id)originalObject;
- (unint64_t)signaledValue;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5;
- (void)setLabel:(id)a3;
- (void)setSignaledValue:(unint64_t)a3;
- (void)touch;
@end

@implementation CaptureMTLSharedEvent

- (CaptureMTLSharedEvent)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLSharedEvent;
  v9 = -[CaptureMTLSharedEvent init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureDevice, a4);
    objc_storeStrong((id *)&v10->_baseObject, a3);
    v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);
  }

  return v10;
}

- (MTLSharedEvent)baseObject
{
  return self->_baseObject;
}

- (id)newSharedEventHandle
{
  id v3 = -[MTLSharedEventSPI newSharedEventHandle](self->_baseObject, "newSharedEventHandle");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15907;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  v9 = -[CaptureMTLSharedEvent traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return v3;
}

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
  id v8 = a5;
  v9 = self;
  baseObject = v9->_baseObject;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __54__CaptureMTLSharedEvent_notifyListener_atValue_block___block_invoke;
  v13[3] = &unk_20E220;
  v14 = v9;
  id v15 = v8;
  unint64_t v16 = a4;
  uint64_t v11 = v9;
  id v12 = v8;
  -[MTLSharedEventSPI notifyListener:atValue:block:](baseObject, "notifyListener:atValue:block:", a3, a4, v13);
}

- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4
{
  unint64_t v6 = a4 + 1000 * GT_ENV;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__CaptureMTLSharedEvent_waitUntilSignaledValue_timeoutMS___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v6;
  if (waitUntilSignaledValue_timeoutMS__onceToken != -1) {
    dispatch_once(&waitUntilSignaledValue_timeoutMS__onceToken, block);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  unsigned int v7 = -[MTLSharedEventSPI waitUntilSignaledValue:timeoutMS:]( self->_baseObject,  "waitUntilSignaledValue:timeoutMS:",  a3,  v6);
  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15422;
  unsigned __int8 v9 = v23;
  if (v23 > 0x20uLL)
  {
    uint64_t v11 = *(void *)(v19 + 24);
    uint64_t v12 = v24++;
    v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x2000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    v10 = (char *)(v8 + v23);
    v23 += 32;
  }

  *(_BYTE *)(v8 + 13) = v9;
  v13 = -[CaptureMTLSharedEvent traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = v6;
  *((_DWORD *)v10 + 6) = v7;
  *((_DWORD *)v10 + 7) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
  return v7;
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v5 = atomic_load(&traceStream[1].var1);
    while (1)
    {
      unint64_t v6 = __ldaxr(p_var1);
      if (v6 != v5) {
        break;
      }
      if (__stlxr(v5 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0LL, p_var1)) {
        goto LABEL_7;
      }
      int v7 = 1;
LABEL_8:
      unint64_t v5 = v6;
      if (v7) {
        return;
      }
    }

    __clrex();
LABEL_7:
    int v7 = 0;
    goto LABEL_8;
  }

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0LL;
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLSharedEvent;
  uint64_t v3 = -[CaptureMTLSharedEvent description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLSharedEventSPI description](self->_baseObject, "description"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ -> %@", v4, v5));

  return (NSString *)v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  uint64_t v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLSharedEventSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (id)IOSurfaceSharedEvent
{
  return -[MTLSharedEventSPI IOSurfaceSharedEvent](self->_baseObject, "IOSurfaceSharedEvent");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSString)label
{
  return (NSString *)-[MTLSharedEventSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLSharedEventSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15974;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLSharedEvent traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)v19, v15, v16 + 1);
  }

  *(void *)int v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (unint64_t)signaledValue
{
  return (unint64_t)-[MTLSharedEventSPI signaledValue](self->_baseObject, "signaledValue");
}

- (void)setSignaledValue:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15975;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLSharedEvent traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)int v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15973;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLSharedEvent traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLSharedEvent;
  -[CaptureMTLSharedEvent dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
}

void __58__CaptureMTLSharedEvent_waitUntilSignaledValue_timeoutMS___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 134217984;
    uint64_t v4 = v2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-[ waitUntilSignaledValue:timeoutMS:] timeout changed to %llu ms due to capture being loaded.",  (uint8_t *)&v3,  0xCu);
  }

uint64_t __54__CaptureMTLSharedEvent_notifyListener_atValue_block___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))(a1[5], a1[4], a1[6]);
}

@end