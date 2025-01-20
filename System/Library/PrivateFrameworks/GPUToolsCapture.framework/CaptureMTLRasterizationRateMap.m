@interface CaptureMTLRasterizationRateMap
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign;
- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4;
- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLRasterizationRateMap)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLRasterizationRateMap)baseObject;
- (NSString)description;
- (NSString)label;
- (float)minFactor;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)layerCount;
- (unint64_t)mutability;
- (unint64_t)streamReference;
- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)dealloc;
- (void)resetUsingDescriptor:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLRasterizationRateMap

- (CaptureMTLRasterizationRateMap)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLRasterizationRateMap;
  v9 = -[CaptureMTLRasterizationRateMap init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);
  }

  return v10;
}

- (MTLRasterizationRateMap)baseObject
{
  return self->_baseObject;
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSString)label
{
  return (NSString *)-[MTLRasterizationRateMapSPI label](self->_baseObject, "label");
}

- (unint64_t)layerCount
{
  return (unint64_t)-[MTLRasterizationRateMapSPI layerCount](self->_baseObject, "layerCount");
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  id v2 = -[MTLRasterizationRateMapSPI parameterBufferSizeAndAlign](self->_baseObject, "parameterBufferSizeAndAlign");
  result.var1 = v3;
  result.var0 = (unint64_t)v2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A physicalGranularity]( result,  "physicalGranularity");
  }
  retstr->var0 = 0LL;
  retstr->var1 = 0LL;
  retstr->var2 = 0LL;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A screenSize](result, "screenSize");
  }
  retstr->var0 = 0LL;
  retstr->var1 = 0LL;
  retstr->var2 = 0LL;
  return result;
}

- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (unint64_t *)[v6 traceStream];
  if (v7)
  {
    id v8 = v7 + 7;
    unint64_t v9 = atomic_load(v7 + 7);
    while (1)
    {
      unint64_t v10 = __ldaxr(v8);
      if (v10 != v9) {
        break;
      }
      if (__stlxr(v9 | 2, v8)) {
        goto LABEL_7;
      }
      int v11 = 1;
LABEL_8:
      unint64_t v9 = v10;
      if (v11) {
        goto LABEL_9;
      }
    }

    __clrex();
LABEL_7:
    int v11 = 0;
    goto LABEL_8;
  }

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15801;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  id v8 = -[CaptureMTLRasterizationRateMap traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLRasterizationRateMap;
  -[CaptureMTLRasterizationRateMap dealloc](&v12, "dealloc");
}

- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  result.var1 = v5;
  result.unint64_t var0 = v4;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v25);
  *(float *)&double v8 = var0;
  *(float *)&double v9 = var1;
  -[MTLRasterizationRateMapSPI mapScreenToPhysicalCoordinates:forLayer:]( self->_baseObject,  "mapScreenToPhysicalCoordinates:forLayer:",  a4,  v8,  v9);
  float v11 = v10;
  float v13 = v12;
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15770;
  unsigned __int8 v15 = v29;
  if (v29 > 0x20uLL)
  {
    uint64_t v17 = *(void *)(v25[1] + 24LL);
    uint64_t v18 = v30++;
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x2000000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v29);
    v29 += 32;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLRasterizationRateMap traceStream](self, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v16 = v20;
  *((void *)v16 + 1) = a4;
  *((float *)v16 + 4) = v11;
  *((float *)v16 + 5) = v13;
  *((float *)v16 + 6) = var0;
  *((float *)v16 + 7) = var1;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v28;
  *(_BYTE *)(v26 + 15) |= 8u;
  float v23 = v11;
  float v24 = v13;
  result.float var1 = v24;
  result.float var0 = v23;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  baseObject = self->_baseObject;
  if (baseObject)
  {
    -[MTLRasterizationRateMapSPI physicalSizeForLayer:](baseObject, "physicalSizeForLayer:", a4);
  }

  else
  {
    retstr->unint64_t var0 = 0LL;
    retstr->float var1 = 0LL;
    retstr->unint64_t var2 = 0LL;
  }

  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15797;
  unsigned __int8 v9 = v22;
  if (v22 > 0x18uLL)
  {
    uint64_t v11 = *(void *)(v18[1] + 24LL);
    uint64_t v12 = v23++;
    float v10 = GTTraceMemPool_allocateBytes(v11, v20, v12 | 0x2800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    float v10 = (char *)(v8 + v22);
    v22 += 40;
  }

  *(_BYTE *)(v8 + 13) = v9;
  float v13 = -[CaptureMTLRasterizationRateMap traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = retstr->var2;
  *(void *)float v10 = var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v10 + 3) = var2;
  *((void *)v10 + 4) = a4;
  s();
  result->unint64_t var0 = v17;
  LOBYTE(result->var1) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
  return result;
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
    p_float var1 = &traceStream[1].var1;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLRasterizationRateMap;
  uint64_t v3 = -[CaptureMTLRasterizationRateMap description](&v8, "description");
  float v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRasterizationRateMapSPI description](self->_baseObject, "description"));
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
  float v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLRasterizationRateMapSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (float)minFactor
{
  return result;
}

- (unint64_t)mutability
{
  return (unint64_t)-[MTLRasterizationRateMapSPI mutability](self->_baseObject, "mutability");
}

- (id)formattedDescription:(unint64_t)a3
{
  return -[MTLRasterizationRateMapSPI formattedDescription:](self->_baseObject, "formattedDescription:", a3);
}

- (void)resetUsingDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v16);
  -[MTLRasterizationRateMapSPI resetUsingDescriptor:](self->_baseObject, "resetUsingDescriptor:", v5);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15411;
  unsigned __int8 v7 = v20;
  if (v20 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    objc_super v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    objc_super v8 = (char *)(v6 + v20);
    v20 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLRasterizationRateMap traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v13 = SaveMTLRasterizationRateMapDescriptor((uint64_t)v16, v5);

  *(void *)objc_super v8 = var0;
  v8[8] = v13;
  *(_DWORD *)(v8 + 9) = 0;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

@end