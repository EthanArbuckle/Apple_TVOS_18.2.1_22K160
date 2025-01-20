@interface CaptureMTLCaptureScope
- (CaptureMTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4 captureContext:(GTTraceContext *)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (unint64_t)streamReference;
- (void)beginScope;
- (void)dealloc;
- (void)endScope;
- (void)setLabel:(id)a3;
@end

@implementation CaptureMTLCaptureScope

- (CaptureMTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4 captureContext:(GTTraceContext *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
  v10 = -[CaptureMTLCaptureScope initWithDevice:commandQueue:](&v16, "initWithDevice:commandQueue:", v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_traceContext = a5;
    v12 = objc_autoreleasePoolPush();
    for (i = v11;
          (objc_opt_respondsToSelector(i, "baseObject") & 1) != 0;
      ;
    }

    objc_autoreleasePoolPop(v12);
    v14 = i;
    v11->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)a5,  (unint64_t)i,  (unint64_t)v11);

    +[GTMTLCaptureScopeInfo addScope:](&OBJC_CLASS___GTMTLCaptureScopeInfo, "addScope:", v11);
  }

  return v11;
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

- (void)beginScope
{
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
  -[CaptureMTLCaptureScope beginScope](&v57, "beginScope");
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v54);
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
  id v3 = -[CaptureMTLCaptureScope label](&v53, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    uint64_t v5 = v55;
    *(_BYTE *)(v55 + 15) |= 1u;
    *(_DWORD *)(v5 + 8) = -16073;
    char v6 = BYTE9(v56);
    if (BYTE9(v56) > 0x30uLL)
    {
      uint64_t v8 = *(void *)(*((void *)&v54 + 1) + 24LL);
      uint64_t v9 = BYTE10(v56);
      ++BYTE10(v56);
      v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v55 + 1), v9 | 0x1000000000LL) + 16;
      char v6 = v9;
    }

    else
    {
      v7 = (char *)(v5 + BYTE9(v56));
      BYTE9(v56) += 16;
    }

    *(_BYTE *)(v5 + 13) = v6;
    v10 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
    if (v10) {
      unint64_t var0 = v10->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    v52.receiver = self;
    v52.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
    id v12 = -[CaptureMTLCaptureScope label](&v52, "label");
    id v13 = objc_claimAutoreleasedReturnValue(v12);
    if ([v13 UTF8String])
    {
      v51.receiver = self;
      v51.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
      id v14 = -[CaptureMTLCaptureScope label](&v51, "label");
      id v15 = objc_claimAutoreleasedReturnValue(v14);
      id v16 = [v15 UTF8String];
      v50.receiver = self;
      v50.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
      id v17 = -[CaptureMTLCaptureScope label](&v50, "label");
      id v18 = objc_claimAutoreleasedReturnValue(v17);
      size_t v19 = strlen((const char *)[v18 UTF8String]);
      char v20 = GTTraceEncoder_storeBytes((uint64_t)&v54, v16, v19 + 1);
      *(void *)v7 = var0;
      v7[8] = v20;
      *(_DWORD *)(v7 + 9) = 0;
      *((_DWORD *)v7 + 3) = 0;
    }

    else
    {
      *(void *)v7 = var0;
      *((void *)v7 + 1) = 0LL;
    }

    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = BYTE8(v56);
    *(_BYTE *)(v55 + 15) |= 8u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v41);
    __int128 v54 = v41;
    __int128 v55 = v42;
    __int128 v56 = v43;
  }

  uint64_t v23 = v55;
  *(_DWORD *)(v55 + 8) = -16071;
  char v24 = BYTE9(v56);
  if (BYTE9(v56) > 0x38uLL)
  {
    uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 24LL);
    uint64_t v27 = BYTE10(v56);
    ++BYTE10(v56);
    v25 = GTTraceMemPool_allocateBytes(v26, *((uint64_t *)&v55 + 1), v27 | 0x800000000LL) + 16;
    char v24 = v27;
  }

  else
  {
    v25 = (char *)(v23 + BYTE9(v56));
    BYTE9(v56) += 8;
  }

  *(_BYTE *)(v23 + 13) = v24;
  v28 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  *(void *)v25 = v29;
  v30 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
  if (v30) {
    unint64_t v31 = v30->var0;
  }
  else {
    unint64_t v31 = 0LL;
  }
  unint64_t v32 = *((void *)&v55 + 1);
  v33 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
  if (v33) {
    unint64_t v34 = v33->var0;
  }
  else {
    unint64_t v34 = 0LL;
  }
  v35 = (uint64_t *)[*(id *)&self->MTLCaptureScope_opaque[OBJC_IVAR___MTLCaptureScope__device] traceStream];
  if (v35) {
    uint64_t v36 = *v35;
  }
  else {
    uint64_t v36 = 0LL;
  }
  v37 = (uint64_t *)[*(id *)&self->MTLCaptureScope_opaque[OBJC_IVAR___MTLCaptureScope__commandQueue] traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0LL;
  }
  memset(v48, 0, sizeof(v48));
  *(void *)&__int128 v41 = 0x100000002LL;
  *((void *)&v41 + 1) = v31;
  __int128 v42 = v32;
  *(void *)&__int128 v43 = v34;
  *((void *)&v43 + 1) = v36;
  uint64_t v44 = 0LL;
  uint64_t v45 = v38;
  uint64_t v46 = 0LL;
  char v47 = 0;
  uint64_t v49 = 0LL;
  GTCaptureBoundaryTracker_handleTrigger(&v41);
  s();
  *(void *)uint64_t v39 = v40;
  *(_BYTE *)(v39 + 8) = BYTE8(v56);
  *(_BYTE *)(v55 + 15) |= 8u;
}

- (void)endScope
{
  uint64_t v3 = v29;
  *(_DWORD *)(v29 + 8) = -16070;
  unsigned __int8 v4 = v32;
  if (v32 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v28 + 24);
    uint64_t v7 = v33++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v30, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v32);
    v32 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
  id v12 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0LL;
  }
  uint64_t v14 = v30;
  id v15 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
  if (v15) {
    unint64_t v16 = v15->var0;
  }
  else {
    unint64_t v16 = 0LL;
  }
  memset(v25, 0, sizeof(v25));
  *(void *)&__int128 v18 = 0x200000002LL;
  *((void *)&v18 + 1) = v13;
  uint64_t v19 = v14;
  uint64_t v20 = 0LL;
  unint64_t v21 = v16;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  char v24 = 0;
  uint64_t v26 = 0LL;
  GTCaptureBoundaryTracker_handleTrigger(&v18);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
  -[CaptureMTLCaptureScope endScope](&v17, "endScope");
}

- (void)setLabel:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
  -[CaptureMTLCaptureScope setLabel:](&v3, "setLabel:", a3);
  +[GTMTLCaptureScopeInfo updateAll](&OBJC_CLASS___GTMTLCaptureScopeInfo, "updateAll");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16072;
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
  uint64_t v8 = -[CaptureMTLCaptureScope traceStream](self, "traceStream");
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
  +[GTMTLCaptureScopeInfo removeScope:](&OBJC_CLASS___GTMTLCaptureScopeInfo, "removeScope:", self);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureScope;
  -[CaptureMTLCaptureScope dealloc](&v12, "dealloc");
}

@end