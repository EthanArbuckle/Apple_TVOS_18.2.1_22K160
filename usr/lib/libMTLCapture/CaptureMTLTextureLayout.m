@interface CaptureMTLTextureLayout
- ($71D83D51AB0F57F7CF166351F850C832)watermark;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLTextureLayout)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLTextureLayout)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)alignment;
- (unint64_t)size;
- (unint64_t)streamReference;
- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10;
- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10;
- (void)dealloc;
- (void)finalizeTextureMemory:(void *)a3;
- (void)initializeTextureMemory:(void *)a3;
- (void)touch;
@end

@implementation CaptureMTLTextureLayout

- (CaptureMTLTextureLayout)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLTextureLayout;
  v8 = -[CaptureMTLTextureLayout init](&v13, "init");
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

- (MTLTextureLayout)baseObject
{
  return self->_baseObject;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLTextureLayout;
  uint64_t v3 = -[CaptureMTLTextureLayout description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLTextureLayout description](self->_baseObject, "description"));
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
  v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLTextureLayout conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)alignment
{
  return (unint64_t)-[MTLTextureLayout alignment](self->_baseObject, "alignment");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity
{
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A copyGranularity]( result,  "copyGranularity");
  }
  retstr->var0 = 0LL;
  retstr->var1 = 0LL;
  retstr->var2 = 0LL;
  return result;
}

- (unint64_t)size
{
  return (unint64_t)-[MTLTextureLayout size](self->_baseObject, "size");
}

- ($71D83D51AB0F57F7CF166351F850C832)watermark
{
  id v2 = -[MTLTextureLayout watermark](self->_baseObject, "watermark");
  result.var0[1] = v3;
  result.var0[0] = (unint64_t)v2;
  return result;
}

- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10
{
  baseObject = self->_baseObject;
  __int128 v11 = *(_OWORD *)&a10->var0.var2;
  v12[0] = *(_OWORD *)&a10->var0.var0;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a10->var1.var1;
  -[MTLTextureLayout copyFromLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:toTextureMemory:textureSlice:textureLevel:textureRegion:]( baseObject,  "copyFromLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:toTextureMemory:textureSlice:textureLevel:textureRegion:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  v12);
}

- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10
{
  baseObject = self->_baseObject;
  __int128 v11 = *(_OWORD *)&a6->var0.var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLTextureLayout copyFromTextureMemory:textureSlice:textureLevel:textureRegion:toLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:]( baseObject,  "copyFromTextureMemory:textureSlice:textureLevel:textureRegion:toLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:",  a3,  a4,  a5,  v12,  a7,  a8,  a9,  a10);
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16097;
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
  objc_super v8 = -[CaptureMTLTextureLayout traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLTextureLayout;
  -[CaptureMTLTextureLayout dealloc](&v12, "dealloc");
}

- (void)finalizeTextureMemory:(void *)a3
{
}

- (void)initializeTextureMemory:(void *)a3
{
}

- (void).cxx_destruct
{
}

@end