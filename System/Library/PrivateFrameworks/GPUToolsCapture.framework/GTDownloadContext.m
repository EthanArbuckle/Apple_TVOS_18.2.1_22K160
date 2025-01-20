@interface GTDownloadContext
- (GTDownloadContext)initWithQueue:(id)a3 forRequest:(apr_array_header_t *)a4;
- (NSArray)captureAccelerationStructures;
- (NSMutableArray)objects;
- (apr_array_header_t)requests;
- (id)accelerationStructureCommandEncoder;
- (id)blitCommandEncoder;
- (id)computeCommandEncoder;
- (id)newCommandBuffer;
- (unint64_t)usedGPUMemory;
- (void)dealloc;
- (void)flush;
- (void)flushWithCallback:(id)a3;
- (void)retainMTLResource:(id)a3;
- (void)setObjects:(id)a3;
- (void)setRequests:(apr_array_header_t *)a3;
- (void)setUsedGPUMemory:(unint64_t)a3;
@end

@implementation GTDownloadContext

- (GTDownloadContext)initWithQueue:(id)a3 forRequest:(apr_array_header_t *)a4
{
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___GTDownloadContext;
  v8 = -[GTDownloadContext init](&v29, "init");
  v9 = v8;
  if (v8)
  {
    apr_pool_create_ex(&v8->_pool, 0LL, 0LL, 0LL);
    objc_storeStrong((id *)&v9->_queue, a3);
    v10 = objc_alloc_init(&OBJC_CLASS___MTLCommandBufferDescriptor);
    commandBufferDescriptor = v9->_commandBufferDescriptor;
    v9->_commandBufferDescriptor = v10;

    if ((qword_23A448 & 0x100000) != 0) {
      -[MTLCommandBufferDescriptor setErrorOptions:]( v9->_commandBufferDescriptor,  "setErrorOptions:",  -[MTLCommandBufferDescriptor errorOptions](v9->_commandBufferDescriptor, "errorOptions") | 1);
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[MTLCommandQueue commandBufferWithDescriptor:]( v9->_queue,  "commandBufferWithDescriptor:",  v9->_commandBufferDescriptor));
    command = v9->_command;
    v9->_command = (MTLCommandBuffer *)v12;

    v14 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  2LL * a4->nelts);
    objects = v9->_objects;
    v9->_objects = v14;

    v9->_requests = apr_array_copy(v9->_pool, a4);
    v16 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a4->nelts);
    MTLResources = v9->_MTLResources;
    v9->_MTLResources = v16;

    v18 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a4->nelts);
    originalMTLResources = v9->_originalMTLResources;
    v9->_originalMTLResources = v18;

    requests = v9->_requests;
    if (requests->nelts >= 1)
    {
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      char v23 = 0;
      do
      {
        v24 = &requests->elts[v21];
        -[NSMutableArray addObject:](v9->_originalMTLResources, "addObject:", *(void *)v24);
        v23 |= v24[46] == 16;
        ++v22;
        requests = v9->_requests;
        v21 += 88LL;
      }

      while (v22 < requests->nelts);
      if ((v23 & 1) != 0)
      {
        id v25 = CaptureAccelerationStructures();
        uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
        captureAccelerationStructures = v9->_captureAccelerationStructures;
        v9->_captureAccelerationStructures = (NSArray *)v26;
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTDownloadContext;
  -[GTDownloadContext dealloc](&v3, "dealloc");
}

- (void)retainMTLResource:(id)a3
{
}

- (id)newCommandBuffer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandQueue commandBufferWithDescriptor:]( self->_queue,  "commandBufferWithDescriptor:",  self->_commandBufferDescriptor));
  [v2 addCompletedHandler:&__block_literal_global_241];
  return v2;
}

- (id)blitCommandEncoder
{
  if ((qword_23A448 & 0x200000) != 0)
  {
    -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
    blit = self->_blit;
    self->_blit = 0LL;

    -[MTLComputeCommandEncoder endEncoding](self->_computeCommandEncoder, "endEncoding");
    computeCommandEncoder = self->_computeCommandEncoder;
    self->_computeCommandEncoder = 0LL;

    -[MTLAccelerationStructureCommandEncoderSPI endEncoding](self->_accelerationStructureCommandEncoder, "endEncoding");
    accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = 0LL;
  }

  if (!self->_command)
  {
    v6 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue( -[MTLCommandQueue commandBufferWithDescriptor:]( self->_queue,  "commandBufferWithDescriptor:",  self->_commandBufferDescriptor));
    command = self->_command;
    self->_command = v6;
  }

  -[MTLComputeCommandEncoder endEncoding](self->_computeCommandEncoder, "endEncoding");
  v8 = self->_computeCommandEncoder;
  self->_computeCommandEncoder = 0LL;

  -[MTLAccelerationStructureCommandEncoderSPI endEncoding](self->_accelerationStructureCommandEncoder, "endEncoding");
  v9 = self->_accelerationStructureCommandEncoder;
  self->_accelerationStructureCommandEncoder = 0LL;

  v10 = self->_blit;
  if (v10)
  {
    unint64_t v11 = self->_blitRequestCount + 1;
    self->_blitRequestCount = v11;
    if (v11 == 1000)
    {
      -[MTLBlitCommandEncoder endEncoding](v10, "endEncoding");
      uint64_t v12 = (MTLBlitCommandEncoder *)objc_claimAutoreleasedReturnValue(-[MTLCommandBuffer blitCommandEncoder](self->_command, "blitCommandEncoder"));
      v13 = self->_blit;
      self->_blit = v12;

      self->_blitRequestCount = 1LL;
      v10 = self->_blit;
    }
  }

  else
  {
    v14 = (MTLBlitCommandEncoder *)objc_claimAutoreleasedReturnValue(-[MTLCommandBuffer blitCommandEncoder](self->_command, "blitCommandEncoder"));
    v15 = self->_blit;
    self->_blit = v14;

    v10 = self->_blit;
    self->_blitRequestCount = 1LL;
  }

  return v10;
}

- (id)computeCommandEncoder
{
  if ((qword_23A448 & 0x200000) != 0)
  {
    -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
    blit = self->_blit;
    self->_blit = 0LL;

    -[MTLComputeCommandEncoder endEncoding](self->_computeCommandEncoder, "endEncoding");
    computeCommandEncoder = self->_computeCommandEncoder;
    self->_computeCommandEncoder = 0LL;

    -[MTLAccelerationStructureCommandEncoderSPI endEncoding](self->_accelerationStructureCommandEncoder, "endEncoding");
    accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = 0LL;
  }

  if (!self->_command)
  {
    v6 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue( -[MTLCommandQueue commandBufferWithDescriptor:]( self->_queue,  "commandBufferWithDescriptor:",  self->_commandBufferDescriptor));
    command = self->_command;
    self->_command = v6;
  }

  -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
  v8 = self->_blit;
  self->_blit = 0LL;

  -[MTLAccelerationStructureCommandEncoderSPI endEncoding](self->_accelerationStructureCommandEncoder, "endEncoding");
  v9 = self->_accelerationStructureCommandEncoder;
  self->_accelerationStructureCommandEncoder = 0LL;

  v10 = self->_computeCommandEncoder;
  if (!v10)
  {
    unint64_t v11 = (MTLComputeCommandEncoder *)objc_claimAutoreleasedReturnValue( -[MTLCommandBuffer computeCommandEncoder]( self->_command,  "computeCommandEncoder"));
    uint64_t v12 = self->_computeCommandEncoder;
    self->_computeCommandEncoder = v11;

    v10 = self->_computeCommandEncoder;
  }

  return v10;
}

- (id)accelerationStructureCommandEncoder
{
  if ((qword_23A448 & 0x200000) != 0)
  {
    -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
    blit = self->_blit;
    self->_blit = 0LL;

    -[MTLComputeCommandEncoder endEncoding](self->_computeCommandEncoder, "endEncoding");
    computeCommandEncoder = self->_computeCommandEncoder;
    self->_computeCommandEncoder = 0LL;

    -[MTLAccelerationStructureCommandEncoderSPI endEncoding](self->_accelerationStructureCommandEncoder, "endEncoding");
    accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = 0LL;
  }

  if (!self->_command)
  {
    v6 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue( -[MTLCommandQueue commandBufferWithDescriptor:]( self->_queue,  "commandBufferWithDescriptor:",  self->_commandBufferDescriptor));
    command = self->_command;
    self->_command = v6;
  }

  -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
  v8 = self->_blit;
  self->_blit = 0LL;

  -[MTLComputeCommandEncoder endEncoding](self->_computeCommandEncoder, "endEncoding");
  v9 = self->_computeCommandEncoder;
  self->_computeCommandEncoder = 0LL;

  v10 = self->_accelerationStructureCommandEncoder;
  if (!v10)
  {
    unint64_t v11 = (MTLAccelerationStructureCommandEncoderSPI *)objc_claimAutoreleasedReturnValue( -[MTLCommandBuffer accelerationStructureCommandEncoder]( self->_command,  "accelerationStructureCommandEncoder"));
    uint64_t v12 = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = v11;

    v10 = self->_accelerationStructureCommandEncoder;
  }

  return v10;
}

- (void)flushWithCallback:(id)a3
{
  accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
  v5 = (void (**)(id, NSMutableArray *))a3;
  -[MTLAccelerationStructureCommandEncoderSPI endEncoding](accelerationStructureCommandEncoder, "endEncoding");
  -[MTLBlitCommandEncoder endEncoding](self->_blit, "endEncoding");
  -[MTLCommandBuffer commit](self->_command, "commit");
  -[MTLCommandBuffer waitUntilCompleted](self->_command, "waitUntilCompleted");
  v5[2](v5, self->_objects);

  v6 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    objects = self->_objects;
    v8 = v6;
    id v9 = -[NSMutableArray count](objects, "count");
    id v10 = -[NSMutableArray count](self->_MTLResources, "count");
    int v15 = 134218240;
    id v16 = v9;
    __int16 v17 = 2048;
    id v18 = v10;
    _os_signpost_emit_with_name_impl( &dword_0,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Capture-flushCleanup",  "Objects: %lu, resources: %lu",  (uint8_t *)&v15,  0x16u);
  }

  command = self->_command;
  self->_command = 0LL;

  blit = self->_blit;
  self->_blit = 0LL;

  v13 = self->_accelerationStructureCommandEncoder;
  self->_accelerationStructureCommandEncoder = 0LL;

  self->_usedGPUMemory = 0LL;
  -[NSMutableArray removeAllObjects](self->_objects, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_MTLResources, "removeAllObjects");
  v14 = (os_log_s *)g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v14,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Capture-flushCleanup",  "",  (uint8_t *)&v15,  2u);
  }

- (void)flush
{
}

- (apr_array_header_t)requests
{
  return self->_requests;
}

- (void)setRequests:(apr_array_header_t *)a3
{
  self->_requests = a3;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (unint64_t)usedGPUMemory
{
  return self->_usedGPUMemory;
}

- (void)setUsedGPUMemory:(unint64_t)a3
{
  self->_usedGPUMemory = a3;
}

- (NSArray)captureAccelerationStructures
{
  return self->_captureAccelerationStructures;
}

- (void).cxx_destruct
{
}

void __26__GTDownloadContext_flush__block_invoke(id a1, NSArray *a2)
{
  v2 = a2;
  uint64_t v26 = _sharedCaptureManager;
  NSUInteger v27 = -[NSArray count](v2, "count");
  mach_absolute_time();
  v28 = v2;
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v2);
  v4 = g_signpostLog;
  v5 = (os_log_s *)v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Capture-DumpFiles", "", buf, 2u);
  }

  if (v27)
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v28, "objectAtIndex:", v7));
      unint64_t v9 = v7 + 2;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v28, "objectAtIndex:", v7 + 1));
      if (([v10 conformsToProtocol:&OBJC_PROTOCOL___MTLIndirectCommandBuffer] & 1) != 0
        || NSClassFromString(@"MTLIOAccelIndirectCommandBuffer")
        && (Class v11 = NSClassFromString(@"MTLIOAccelIndirectCommandBuffer"),
            (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
      {
        v7 += 3LL;
        id v12 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v28, "objectAtIndex:", v9));
        id v14 = GTMTLDecodeIndirectCommandBuffer(v12, v13);
        id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
        id v16 = [v12 allocatedSize];

        do
          unint64_t v17 = __ldaxr(&g_GPUDataDownloaded);
        while (__stlxr((unint64_t)v16 + v17, &g_GPUDataDownloaded));
      }

      else
      {
        id v15 = v10;
        id v18 = [v15 length];
        do
          unint64_t v19 = __ldaxr(&g_GPUDataDownloaded);
        while (__stlxr((unint64_t)v18 + v19, &g_GPUDataDownloaded));
        v7 += 2LL;
      }

      id v20 = v8;
      uint64_t v21 = (char *)[v20 UTF8String];
      id v22 = v15;
      GTMTLCaptureState_storePointer(v26, v21, (uint64_t *)[v22 bytes], objc_msgSend(v22, "length"));
      v6 += (uint64_t)[v22 length];
      do
        unint64_t v23 = __ldaxr(&g_resourceDownloaded);
      while (__stlxr(v23 + 1, &g_resourceDownloaded));
    }

    while (v7 < v27);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  v24 = g_signpostLog;
  id v25 = (os_log_s *)v24;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)v24))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = v6;
    _os_signpost_emit_with_name_impl( &dword_0,  v25,  OS_SIGNPOST_INTERVAL_END,  v3,  "Capture-DumpFiles",  "Total bytes: %lu",  buf,  0xCu);
  }

  if (!dword_23A2D4) {
    mach_timebase_info((mach_timebase_info_t)&DumpFiles_timebaseInfo);
  }
  mach_absolute_time();
}

@end