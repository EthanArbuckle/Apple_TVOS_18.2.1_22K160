@interface CaptureMTLDebugCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLDebugCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDebugCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)dumpBuffer:(id)a3;
- (void)dumpBuffer:(id)a3 name:(const char *)a4;
- (void)dumpTexture:(id)a3;
- (void)dumpTexture:(id)a3 name:(const char *)a4;
- (void)dumpTexture:(id)a3 name:(const char *)a4 glMode:(BOOL)a5;
- (void)touch;
@end

@implementation CaptureMTLDebugCommandEncoder

- (CaptureMTLDebugCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CaptureMTLDebugCommandEncoder;
  v9 = -[CaptureMTLDebugCommandEncoder init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 retainedObjects]);
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v13;

    v15 = v10->_retainedObjects;
    id v16 = DEVICEOBJECT(v10->_baseObject);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NSMutableSet addObject:](v15, "addObject:", v17);
  }

  return v10;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  [WeakRetained unionRetainSet:self->_retainedObjects];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CaptureMTLDebugCommandEncoder;
  -[CaptureMTLDebugCommandEncoder dealloc](&v4, "dealloc");
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLDebugCommandEncoder;
  uint64_t v3 = -[CaptureMTLDebugCommandEncoder description](&v8, "description");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLDebugCommandEncoder description](self->_baseObject, "description"));
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
  objc_super v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLDebugCommandEncoder conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (MTLDebugCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (void)dumpBuffer:(id)a3 name:(const char *)a4
{
  baseObject = self->_baseObject;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  -[MTLDebugCommandEncoder dumpBuffer:name:](baseObject, "dumpBuffer:name:", v6, a4);
}

- (void)dumpBuffer:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  -[MTLDebugCommandEncoder dumpBuffer:](baseObject, "dumpBuffer:", v4);
}

- (void)dumpTexture:(id)a3 name:(const char *)a4 glMode:(BOOL)a5
{
  BOOL v5 = a5;
  baseObject = self->_baseObject;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  -[MTLDebugCommandEncoder dumpTexture:name:glMode:](baseObject, "dumpTexture:name:glMode:", v8, a4, v5);
}

- (void)dumpTexture:(id)a3 name:(const char *)a4
{
  baseObject = self->_baseObject;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  -[MTLDebugCommandEncoder dumpTexture:name:](baseObject, "dumpTexture:name:", v6, a4);
}

- (void)dumpTexture:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  -[MTLDebugCommandEncoder dumpTexture:](baseObject, "dumpTexture:", v4);
}

- (void).cxx_destruct
{
}

@end