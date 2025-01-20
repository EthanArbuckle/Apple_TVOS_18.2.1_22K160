@interface CaptureMTLDrawable
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLDrawable)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDrawable)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)layer;
- (id)texture;
- (unint64_t)deviceRef;
- (unint64_t)streamReference;
- (void)addPresentScheduledHandler:(id)a3;
- (void)addPresentedHandler:(id)a3;
- (void)dealloc;
- (void)present;
- (void)presentAfterMinimumDuration:(double)a3;
- (void)presentAtTime:(double)a3;
- (void)touch;
@end

@implementation CaptureMTLDrawable

- (CaptureMTLDrawable)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLDrawable;
  v8 = -[CaptureMTLDrawable init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseObject, a3);
    v9->_traceContext = a4;
    id v10 = DEVICEOBJECT(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)a4,  (unint64_t)v11,  (unint64_t)v9);
  }

  return v9;
}

- (MTLDrawable)baseObject
{
  return self->_baseObject;
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

- (unint64_t)deviceRef
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDrawable layer](self, "layer"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 device]);
  v4 = (unint64_t *)[v3 traceStream];
  if (v4) {
    unint64_t v5 = *v4;
  }
  else {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (s_logUsingOsLog)
  {
    id v5 = gt_default_log();
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self->_baseObject);
      *(_DWORD *)buf = 136315394;
      v14 = ClassName;
      __int16 v15 = 2080;
      Name = sel_getName(a3);
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "warning: Uncaught selector, -[%s %s]", buf, 0x16u);
    }
  }

  else
  {
    int v7 = __stderrp;
    v8 = object_getClassName(self->_baseObject);
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"warning: Uncaught selector, -[%s %s]",  v8,  sel_getName(a3));
    id v10 = objc_claimAutoreleasedReturnValue(v9);
    fprintf(v7, "%s\n", (const char *)[v10 UTF8String]);
  }

  return self->_baseObject;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLDrawable conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (NSString)description
{
  return (NSString *)-[MTLDrawable description](self->_baseObject, "description");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -7161;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    unsigned __int8 v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unsigned __int8 v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  v8 = -[CaptureMTLDrawable traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLDrawable;
  -[CaptureMTLDrawable dealloc](&v12, "dealloc");
}

- (id)layer
{
  return -[MTLDrawable layer](self->_baseObject, "layer");
}

- (id)texture
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTLDrawable texture](self->_baseObject, "texture"));
  unsigned __int8 v4 = v3;
  unsigned __int8 v5 = v3;
  if ((qword_23A448 & 0x80000) != 0)
  {
    id v6 = v3;
    unsigned __int8 v5 = v6;
    if (([v6 conformsToProtocol:&OBJC_PROTOCOL___CaptureMTLObject] & 1) == 0)
    {
      uint64_t v7 = v6;
      while ((objc_opt_respondsToSelector(v7, "baseObject") & 1) != 0)
      {
        unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v7 performSelector:"baseObject"]);

        uint64_t v7 = v5;
      }

      unsigned __int8 v5 = v7;
    }

- (void)addPresentedHandler:(id)a3
{
}

- (void)present
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -7158;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    unsigned __int8 v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unsigned __int8 v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLDrawable traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
  PresentTrigger(self, (uint64_t)v12);
}

- (void)presentAtTime:(double)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -7157;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLDrawable traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((double *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  PresentTrigger(self, (uint64_t)v14);
}

- (void)presentAfterMinimumDuration:(double)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -7156;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLDrawable traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((double *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  PresentTrigger(self, (uint64_t)v14);
}

- (void)addPresentScheduledHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end