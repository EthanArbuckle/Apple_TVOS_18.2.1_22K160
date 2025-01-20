@interface CaptureMTLCaptureManager
+ (id)toolsCaptureManager;
- (BOOL)isCapturing;
- (BOOL)startCaptureWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)supportsDestination:(int64_t)a3;
- (CaptureMTLCaptureManager)initWithCaptureContext:(GTTraceContext *)a3 andIsToolsManager:(BOOL)a4;
- (GTTraceStream)traceStream;
- (id)newCaptureScopeWithCommandQueue:(id)a3;
- (id)newCaptureScopeWithDevice:(id)a3;
- (void)dealloc;
- (void)setDefaultCaptureScope:(id)a3;
- (void)startCaptureWithCommandQueue:(id)a3;
- (void)startCaptureWithDevice:(id)a3;
- (void)startCaptureWithScope:(id)a3;
- (void)stopCapture;
@end

@implementation CaptureMTLCaptureManager

- (GTTraceStream)traceStream
{
  return (GTTraceStream *)self->super._defaultCaptureScope;
}

- (CaptureMTLCaptureManager)initWithCaptureContext:(GTTraceContext *)a3 andIsToolsManager:(BOOL)a4
{
  v6 = -[CaptureMTLCaptureManager init](self, "init");
  unint64_t v7 = (unint64_t)v6;
  if (v6)
  {
    *(void *)&v6->super._isCapturing = a3;
    v8 = objc_autoreleasePoolPush();
    for (id i = (id)v7;
          (objc_opt_respondsToSelector(i, "baseObject") & 1) != 0;
      ;
    }

    objc_autoreleasePoolPop(v8);
    id v10 = i;
    *(void *)(v7 + 16) = GTTraceContext_openStream((uint64_t)a3, (unint64_t)i, v7);

    *(_BYTE *)(v7 + 32) = a4;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    v12 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v11;
  }

  return (CaptureMTLCaptureManager *)v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureManager;
  -[CaptureMTLCaptureManager dealloc](&v3, "dealloc");
}

- (BOOL)supportsDestination:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  if (a3 == 1)
  {
    if (!*(void *)g_guestAppClientMTL && (qword_23A448 & 0x800) == 0) {
      return [*(id *)(g_guestAppClientMTL + 8) hasObservers];
    }
    return 1;
  }

  return 0;
}

- (BOOL)startCaptureWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!*(_DWORD *)(boundaryTrackerInstance + 20))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(g_guestAppClientMTL + 32));
    uint64_t v8 = *(void *)(g_guestAppClientMTL + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(g_guestAppClientMTL + 32));
    if (v8)
    {
      id UnsupportedFenumInfo = GTMTLGuestAppClient_getUnsupportedFenumInfo();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(UnsupportedFenumInfo);
      dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 asError]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
      ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 1LL, (uint64_t)v12);

      goto LABEL_5;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 captureObject]);
    v113 = 0LL;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    if ((objc_opt_respondsToSelector(v6, "captureMode") & 1) != 0)
    {
      unint64_t v16 = (unint64_t)[v6 captureMode];
      id v17 = v15;
      v19 = v17;
      if (!v17 && v16 != 5) {
        goto LABEL_10;
      }
      if (v16 <= 1 && ![v17 conformsToProtocol:&OBJC_PROTOCOL___MTLDevice])
      {
        v22 = @"an MTLDevice";
        goto LABEL_59;
      }

      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 2
        && ![v19 conformsToProtocol:&OBJC_PROTOCOL___MTLCommandQueue])
      {
        v22 = @"an MTLCommandQueue";
        goto LABEL_59;
      }

      if (v16 == 6)
      {
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___CAMetalLayer, v18);
        if ((objc_opt_isKindOfClass(v19, v32) & 1) == 0)
        {
          v22 = @"a CAMetalLayer";
          goto LABEL_59;
        }

- (void)startCaptureWithDevice:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___MTLCaptureDescriptorInternal);
  -[MTLCaptureDescriptorInternal setApiTriggeredCapture:](v5, "setApiTriggeredCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setSuspendAfterCapture:](v5, "setSuspendAfterCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setCaptureMode:](v5, "setCaptureMode:", 0LL);
  -[MTLCaptureDescriptorInternal setDestination:](v5, "setDestination:", 1LL);
  -[MTLCaptureDescriptorInternal setCaptureObject:](v5, "setCaptureObject:", v4);

  -[CaptureMTLCaptureManager startCaptureWithDescriptor:error:](self, "startCaptureWithDescriptor:error:", v5, 0LL);
}

- (void)startCaptureWithCommandQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___MTLCaptureDescriptorInternal);
  -[MTLCaptureDescriptorInternal setApiTriggeredCapture:](v5, "setApiTriggeredCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setSuspendAfterCapture:](v5, "setSuspendAfterCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setCaptureMode:](v5, "setCaptureMode:", 2LL);
  -[MTLCaptureDescriptorInternal setDestination:](v5, "setDestination:", 1LL);
  -[MTLCaptureDescriptorInternal setCaptureObject:](v5, "setCaptureObject:", v4);

  -[CaptureMTLCaptureManager startCaptureWithDescriptor:error:](self, "startCaptureWithDescriptor:error:", v5, 0LL);
}

- (void)startCaptureWithScope:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___MTLCaptureDescriptorInternal);
  -[MTLCaptureDescriptorInternal setApiTriggeredCapture:](v5, "setApiTriggeredCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setSuspendAfterCapture:](v5, "setSuspendAfterCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setCaptureMode:](v5, "setCaptureMode:", 4LL);
  -[MTLCaptureDescriptorInternal setTriggerHitsToStart:](v5, "setTriggerHitsToStart:", 1LL);
  -[MTLCaptureDescriptorInternal setTriggerHitsToEnd:](v5, "setTriggerHitsToEnd:", 1LL);
  -[MTLCaptureDescriptorInternal setDestination:](v5, "setDestination:", 1LL);
  -[MTLCaptureDescriptorInternal setCaptureObject:](v5, "setCaptureObject:", v4);

  -[CaptureMTLCaptureManager startCaptureWithDescriptor:error:](self, "startCaptureWithDescriptor:error:", v5, 0LL);
}

- (void)stopCapture
{
  uint64_t v3 = v26;
  *(_DWORD *)(v26 + 8) = -16067;
  unsigned __int8 v4 = v29;
  if (v29 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v25 + 24);
    uint64_t v7 = v30++;
    v5 = GTTraceMemPool_allocateBytes(v6, v27, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    v5 = (char *)(v3 + v29);
    v29 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLCaptureManager traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v28;
  *(_BYTE *)(v26 + 15) |= 8u;
  int traceStream_low = LOBYTE(self->_traceStream);
  BOOL v13 = -[CaptureMTLCaptureManager traceStream](self, "traceStream");
  if (v13) {
    unint64_t v14 = v13->var0;
  }
  else {
    unint64_t v14 = 0LL;
  }
  if (traceStream_low) {
    unsigned int v15 = 4;
  }
  else {
    unsigned int v15 = 5;
  }
  memset(v22, 0, sizeof(v22));
  *(void *)&__int128 v16 = v15 | 0x800000000LL;
  *((void *)&v16 + 1) = v14;
  uint64_t v17 = v27;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  char v21 = 0;
  uint64_t v23 = 0LL;
  GTCaptureBoundaryTracker_handleTrigger(&v16);
}

- (BOOL)isCapturing
{
  return *(_DWORD *)(boundaryTrackerInstance + 20) != 0;
}

- (id)newCaptureScopeWithDevice:(id)a3
{
  uint64_t v4 = *(void *)&self->super._isCapturing;
  id v5 = a3;
  uint64_t v6 = (unint64_t *)(v4 + 72);
  do
    unint64_t v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  uint64_t v25 = v4;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = v7;
  s();
  v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v29 = v10;
  char v30 = *((_BYTE *)v8 + 8);
  __int16 v31 = 16400;
  int v32 = 0;
  char v33 = 0;
  v12 = -[CaptureMTLCaptureScope initWithDevice:commandQueue:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLCaptureScope),  "initWithDevice:commandQueue:captureContext:",  v5,  0LL,  *(void *)&self->super._isCapturing);
  GTTraceEncoder_setStream(&v25, (uint64_t)-[CaptureMTLCaptureScope traceStream](v12, "traceStream"));
  uint64_t v13 = v27;
  *(_DWORD *)(v27 + 8) = -15734;
  char v14 = v31;
  if (v31 > 0x28uLL)
  {
    uint64_t v16 = *(void *)(v26 + 24);
    uint64_t v17 = HIBYTE(v31);
    ++HIBYTE(v31);
    unsigned int v15 = GTTraceMemPool_allocateBytes(v16, v28, v17 | 0x1800000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    unsigned int v15 = (char *)(v13 + v31);
    LOBYTE(v31) = v31 + 24;
  }

  *(_BYTE *)(v13 + 13) = v14;
  __int128 v18 = -[CaptureMTLCaptureManager traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v20 = -[CaptureMTLCaptureScope traceStream](v12, "traceStream");
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0LL;
  }
  v22 = (uint64_t *)[v5 traceStream];

  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  *(void *)unsigned int v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  uint64_t *v9 = v29;
  *((_BYTE *)v9 + 8) = v30;
  *(_BYTE *)(v27 + 15) |= 8u;
  return v12;
}

- (id)newCaptureScopeWithCommandQueue:(id)a3
{
  uint64_t v4 = *(void *)&self->super._isCapturing;
  id v5 = a3;
  uint64_t v6 = (unint64_t *)(v4 + 72);
  do
    unint64_t v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  uint64_t v27 = v4;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v7;
  s();
  v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v31 = v10;
  char v32 = *((_BYTE *)v8 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  v12 = objc_alloc(&OBJC_CLASS___CaptureMTLCaptureScope);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
  char v14 = -[CaptureMTLCaptureScope initWithDevice:commandQueue:captureContext:]( v12,  "initWithDevice:commandQueue:captureContext:",  v13,  v5,  *(void *)&self->super._isCapturing);

  GTTraceEncoder_setStream(&v27, (uint64_t)-[CaptureMTLCaptureScope traceStream](v14, "traceStream"));
  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15733;
  char v16 = v33;
  if (v33 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v28 + 24);
    uint64_t v19 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x1800000000LL) + 16;
    char v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v33);
    LOBYTE(v33) = v33 + 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  __int128 v20 = -[CaptureMTLCaptureManager traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v22 = -[CaptureMTLCaptureScope traceStream](v14, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  id v24 = (uint64_t *)[v5 traceStream];

  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  uint64_t *v9 = v31;
  *((_BYTE *)v9 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;
  return v14;
}

- (void)setDefaultCaptureScope:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CaptureMTLCaptureManager;
  -[CaptureMTLCaptureManager setDefaultCaptureScope:](&v3, "setDefaultCaptureScope:", a3);
  +[GTMTLCaptureScopeInfo updateAll](&OBJC_CLASS___GTMTLCaptureScopeInfo, "updateAll");
}

- (void).cxx_destruct
{
}

void __61__CaptureMTLCaptureManager_startCaptureWithDescriptor_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);
  if (a2)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
    v5[2](v5, v4);
  }

  else
  {
    v5[2](v5, 0LL);
  }
}

void __61__CaptureMTLCaptureManager_startCaptureWithDescriptor_error___block_invoke_2(id a1)
{
}

+ (id)toolsCaptureManager
{
  if (toolsCaptureManager_onceToken != -1) {
    dispatch_once(&toolsCaptureManager_onceToken, &__block_literal_global_8881);
  }
  return (id)toolsCaptureManager_toolsCaptureManager;
}

void __47__CaptureMTLCaptureManager_toolsCaptureManager__block_invoke(id a1)
{
  v1 = -[CaptureMTLCaptureManager initWithCaptureContext:andIsToolsManager:]( objc_alloc(&OBJC_CLASS___CaptureMTLCaptureManager),  "initWithCaptureContext:andIsToolsManager:",  g_ctx,  1LL);
  v2 = (void *)toolsCaptureManager_toolsCaptureManager;
  toolsCaptureManager_toolsCaptureManager = (uint64_t)v1;
}

@end