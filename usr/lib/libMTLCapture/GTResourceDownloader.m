@interface GTResourceDownloader
- (GTResourceDownloader)initWithDevice:(id)a3;
- (id)commanndBufferDescriptor;
- (id)downloadQueue;
- (id)getFramebufferPipeline:(unint64_t)a3;
- (id)getGPUBuffer:(unint64_t)a3;
- (id)getGPUBuffer:(unint64_t)a3 context:(id)a4;
- (id)getGPUIndirectCommandBuffer:(id)a3 count:(unint64_t)a4;
- (id)getGPUIndirectCommandBuffer:(unint64_t)a3 context:(id)a4 descriptor:(id)a5;
- (void)_downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5;
- (void)_downloadRequestNew:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5;
- (void)_downloadRequestOld:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5;
- (void)dealloc;
- (void)downloadRequest:(apr_array_header_t *)a3;
- (void)downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4;
- (void)fillGPUBuffer:(id)a3 size:(unint64_t)a4 context:(id)a5;
@end

@implementation GTResourceDownloader

- (GTResourceDownloader)initWithDevice:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___GTResourceDownloader;
  v5 = -[GTResourceDownloader init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    apr_pool_create_ex(&v5->_pool, 0LL, 0LL, 0LL);
    id v7 = DEVICEOBJECT(v4);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    device = v6->_device;
    v6->_device = (MTLDeviceSPI *)v8;

    v10 = (MTLCommandQueue *)-[MTLDeviceSPI newCommandQueue](v6->_device, "newCommandQueue");
    downloadQueue = v6->_downloadQueue;
    v6->_downloadQueue = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___MTLCommandBufferDescriptor);
    commandBufferDescriptor = v6->_commandBufferDescriptor;
    v6->_commandBufferDescriptor = v12;

    if ((qword_23A448 & 0x100000) != 0) {
      -[MTLCommandBufferDescriptor setErrorOptions:]( v6->_commandBufferDescriptor,  "setErrorOptions:",  -[MTLCommandBufferDescriptor errorOptions](v6->_commandBufferDescriptor, "errorOptions") | 1);
    }
    v14 = (MTLSharedEvent *)-[MTLDeviceSPI newSharedEvent](v6->_device, "newSharedEvent");
    downloadEvent = v6->_downloadEvent;
    v6->_downloadEvent = v14;

    v6->_alignment = (unint64_t)-[MTLDeviceSPI linearTextureAlignmentBytes]( v6->_device,  "linearTextureAlignmentBytes");
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 dispatchGroup]);
    dispatchGroup = v6->_dispatchGroup;
    v6->_dispatchGroup = (OS_dispatch_group *)v16;

    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.dt.GPUTools.downloader", v19);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v20;

    pthread_mutex_init(&v6->_framebufferPipelineMutex, 0LL);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTResourceDownloader;
  -[GTResourceDownloader dealloc](&v3, "dealloc");
}

- (void)fillGPUBuffer:(id)a3 size:(unint64_t)a4 context:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  v9 = v8;
  unint64_t v10 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  if (!self->_maxGPUMemory)
  {
    atomic_store(0LL, &self->_usedGPUMemory);
    self->_unint64_t maxGPUMemory = 0x8000000LL;
  }

  p_usedGPUMemory = &self->_usedGPUMemory;
  unint64_t v12 = atomic_load(&self->_usedGPUMemory);
  if (v12 + v10 > self->_maxGPUMemory)
  {
    if (v8)
    {
      id v13 = [v8 usedGPUMemory];
      do
        unint64_t v14 = __ldaxr(p_usedGPUMemory);
      while (__stlxr(v14 - (void)v13, p_usedGPUMemory));
      [v9 flush];
    }

    while (1)
    {
      unint64_t v15 = atomic_load(&self->_usedGPUMemory);
      unint64_t v16 = v15 + v10;
      unint64_t maxGPUMemory = self->_maxGPUMemory;
      if (v16 <= maxGPUMemory) {
        break;
      }
      if (v10 > maxGPUMemory && !atomic_load(p_usedGPUMemory)) {
        break;
      }
      usleep(0x3E8u);
    }
  }

  do
    unint64_t v19 = __ldaxr(p_usedGPUMemory);
  while (__stlxr(v19 + v10, p_usedGPUMemory));
  if (v9) {
    objc_msgSend(v9, "setUsedGPUMemory:", (char *)objc_msgSend(v9, "usedGPUMemory") + v10);
  }
  if (v10 <= 8) {
    unint64_t v10 = 8LL;
  }
  id v20 = -[MTLDeviceSPI newBufferWithLength:options:]( self->_device,  "newBufferWithLength:options:",  v10,  (unint64_t)hideMemory << 18);
  [v23 setBuffer:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v23 buffer]);
  if (!v21)
  {
    if (fillGPUBuffer_size_context__onceToken != -1) {
      dispatch_once(&fillGPUBuffer_size_context__onceToken, &__block_literal_global_315);
    }
    id v22 = -[MTLDeviceSPI newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v10, 0LL);
    [v23 setBuffer:v22];
  }

  [v23 setSize:v10];
  [v23 setOffset:0];
}

- (id)getGPUBuffer:(unint64_t)a3
{
  v5 = -[GTDownloadGPUBuffer initWithTracking:]( objc_alloc(&OBJC_CLASS___GTDownloadGPUBuffer),  "initWithTracking:",  &self->_usedGPUMemory);
  -[GTResourceDownloader fillGPUBuffer:size:context:](self, "fillGPUBuffer:size:context:", v5, a3, 0LL);
  return v5;
}

- (id)getGPUIndirectCommandBuffer:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  id v7 = -[MTLDeviceSPI newIndirectCommandBufferWithDescriptor:maxCommandCount:options:]( self->_device,  "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:",  v6,  a4,  (unint64_t)hideMemory << 18);
  if (!v7)
  {
    if (getGPUIndirectCommandBuffer_count__onceToken != -1) {
      dispatch_once(&getGPUIndirectCommandBuffer_count__onceToken, &__block_literal_global_320);
    }
    id v7 = -[MTLDeviceSPI newIndirectCommandBufferWithDescriptor:maxCommandCount:options:]( self->_device,  "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:",  v6,  a4,  0LL);
  }

  return v7;
}

- (id)getGPUBuffer:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new(&OBJC_CLASS___GTDownloadGPUBuffer);
  -[GTResourceDownloader fillGPUBuffer:size:context:](self, "fillGPUBuffer:size:context:", v7, a3, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTDownloadGPUBuffer buffer](v7, "buffer"));
  [v6 retainMTLResource:v8];

  return v7;
}

- (id)getGPUIndirectCommandBuffer:(unint64_t)a3 context:(id)a4 descriptor:(id)a5
{
  return -[GTResourceDownloader getGPUIndirectCommandBuffer:count:](self, "getGPUIndirectCommandBuffer:count:", a5, a3);
}

- (id)getFramebufferPipeline:(unint64_t)a3
{
  p_framebufferPipelineMutex = &self->_framebufferPipelineMutex;
  pthread_mutex_lock(&self->_framebufferPipelineMutex);
  pipelineCache = self->_pipelineCache;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pipelineCache, "objectForKey:", v7));

  if (!v8)
  {
    device = self->_device;
    id v20 = 0LL;
    id v10 = -[MTLDeviceSPI newLibraryWithSource:options:error:]( device,  "newLibraryWithSource:options:error:",  @"#include <metal_stdlib>\nusing namespace metal\n;struct VOut { float4 pos [[position]]; float2 uv; };\nvertex VOut Vertex(uint vid [[ vertex_id ]]) {VOut out; out.uv = float2((vid << 1) & 2, vid & 2); out.pos = float4(out.uv * 2.0f + -1.0f, 0.0f, 1.0f); return out; }\nstruct FOut { half4 rt0 [[color(0)]]; };\nfragment FOut Fragment(VOut in [[stage_in]], texture2d<half> tex) { FOut out; out.rt0 = tex.read(uint2(tex.get_width() * (in.uv.x), tex.get_height() * (1.0 - in.uv.y))); return out; }\n",
            0LL,
            &v20);
    id v19 = v20;
    id v11 = [v10 newFunctionWithName:@"Vertex"];
    id v12 = [v10 newFunctionWithName:@"Fragment"];
    id v13 = objc_opt_new(&OBJC_CLASS___MTLRenderPipelineDescriptor);
    -[MTLRenderPipelineDescriptor setVertexFunction:](v13, "setVertexFunction:", v11);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](v13, "setFragmentFunction:", v12);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments"));
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
    [v15 setPixelFormat:a3];

    id v8 = -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:error:]( self->_device,  "newRenderPipelineStateWithDescriptor:error:",  v13,  0LL);
    unint64_t v16 = self->_pipelineCache;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v8, v17);
  }

  pthread_mutex_unlock(p_framebufferPipelineMutex);
  return v8;
}

- (id)downloadQueue
{
  return self->_downloadQueue;
}

- (id)commanndBufferDescriptor
{
  return self->_commandBufferDescriptor;
}

- (void)downloadRequest:(apr_array_header_t *)a3
{
  if (a3->nelts)
  {
    v5 = objc_opt_new(&OBJC_CLASS___GTDownloadPoint);
    ++self->_downloadValue;
    -[GTDownloadPoint setDownloadValue:](v5, "setDownloadValue:");
    -[GTDownloadPoint setDownloadEvent:](v5, "setDownloadEvent:", self->_downloadEvent);
    -[GTDownloadPoint setDownloadQueue:](v5, "setDownloadQueue:", self->_downloadQueue);
    -[GTDownloadPoint setWaitValue:](v5, "setWaitValue:", 0LL);
    -[GTDownloadPoint setWaitEvent:](v5, "setWaitEvent:", self->_downloadEvent);
    -[GTResourceDownloader _downloadRequest:atPoint:dispatchGroup:]( self,  "_downloadRequest:atPoint:dispatchGroup:",  a3,  v5,  self->_dispatchGroup);
  }

- (void)downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4
{
}

- (void)_downloadRequestOld:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a4;
  v9 = (dispatch_group_s *)a5;
  id v10 = -[MTLSharedEventListener initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___MTLSharedEventListener),  "initWithDispatchQueue:",  self->_dispatchQueue);
  if (v9) {
    dispatch_group_enter(v9);
  }
  [v8 createContext:a3];
  uint64_t nelts = a3->nelts;
  do
    unint64_t v12 = __ldaxr(&g_resourceCount);
  while (__stlxr(v12 + nelts, &g_resourceCount));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 waitEvent]);
  id v14 = [v8 waitValue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __66__GTResourceDownloader__downloadRequestOld_atPoint_dispatchGroup___block_invoke;
  v17[3] = &unk_20DF10;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  unint64_t v15 = v9;
  id v16 = v8;
  [v13 notifyListener:v10 atValue:v14 block:v17];
}

- (void)_downloadRequestNew:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a4;
  v9 = (dispatch_group_s *)a5;
  id v10 = objc_autoreleasePoolPush();
  if (v9) {
    dispatch_group_enter(v9);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadQueue]);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 commandBufferWithDescriptor:self->_commandBufferDescriptor]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 waitEvent]);
  objc_msgSend(v12, "encodeWaitForEvent:value:", v13, objc_msgSend(v8, "waitValue"));

  DownloadNewArchiveRequests(v12, (uint64_t)a3, _sharedCaptureManager);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadEvent]);
  objc_msgSend(v12, "encodeSignalEvent:value:", v14, objc_msgSend(v8, "downloadValue"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __66__GTResourceDownloader__downloadRequestNew_atPoint_dispatchGroup___block_invoke;
  v16[3] = &unk_20E118;
  unint64_t v15 = v9;
  v17 = v15;
  [v12 addCompletedHandler:v16];
  [v12 commit];

  objc_autoreleasePoolPop(v10);
}

- (void)_downloadRequest:(apr_array_header_t *)a3 atPoint:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = v9;
  if (*(_BYTE *)(_sharedCaptureManager + 93)) {
    -[GTResourceDownloader _downloadRequestNew:atPoint:dispatchGroup:]( self,  "_downloadRequestNew:atPoint:dispatchGroup:",  a3,  v9,  v8);
  }
  else {
    -[GTResourceDownloader _downloadRequestOld:atPoint:dispatchGroup:]( self,  "_downloadRequestOld:atPoint:dispatchGroup:",  a3,  v9,  v8);
  }
}

- (void).cxx_destruct
{
}

void __66__GTResourceDownloader__downloadRequestNew_atPoint_dispatchGroup___block_invoke(uint64_t a1)
{
  v1 = *(dispatch_group_s **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void __66__GTResourceDownloader__downloadRequestOld_atPoint_dispatchGroup___block_invoke( uint64_t a1,  void *a2)
{
  id v103 = a2;
  context = objc_autoreleasePoolPush();
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadContext]);
  id v4 = (void **)[v3 requests];
  qsort( v4[3],  *((int *)v4 + 3),  *((int *)v4 + 2),  (int (__cdecl *)(const void *, const void *))GTResourceDownloaderRequest_compareType);
  v5 = &OBJC_PROTOCOL___CaptureMTLObject;
  v110 = v3;
  uint64_t v111 = a1;
  if (v4)
  {
    while (*((_DWORD *)v4 + 3))
    {
      id v6 = objc_autoreleasePoolPush();
      uint64_t v7 = *((int *)v4 + 3);
      if ((_DWORD)v7)
      {
        id v8 = (char *)v4[3];
        uint64_t v9 = *((int *)v4 + 2);
        uint64_t v10 = v7 - 1;
        *((_DWORD *)v4 + 3) = v10;
        id v11 = &v8[v10 * v9];
      }

      else
      {
        id v11 = 0LL;
      }

      os_signpost_id_t v12 = os_signpost_id_make_with_pointer((os_log_t)v5[1].inst_meths, v11);
      id v13 = v5[1].inst_meths;
      id v14 = v13;
      unint64_t v15 = v12 - 1;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_0,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "Capture-downloadRequest",  "",  buf,  2u);
      }

      unsigned int v16 = v11[46];
      if (v16 > 0x3B)
      {
        if (v11[46] > 0x52u)
        {
          if (v16 == 83)
          {
            unint64_t v112 = v12 - 1;
            os_signpost_id_t v114 = v12;
            v116 = v6;
            id v109 = *(id *)(a1 + 40);
            id v107 = v3;
            id v72 = *(id *)v11;
            v73 = (void *)objc_claimAutoreleasedReturnValue([v72 functionArray]);
            uint64_t v74 = 8 * (void)[v73 count];

            v105 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v74);
            v75 = -[NSMutableData mutableBytes](v105, "mutableBytes");
            v76 = (void *)objc_claimAutoreleasedReturnValue([v72 functionArray]);
            id v77 = [v76 count];

            if (v77)
            {
              unint64_t v78 = 0LL;
              do
              {
                v79 = (void *)objc_claimAutoreleasedReturnValue([v72 functionArray]);
                v80 = (void *)objc_claimAutoreleasedReturnValue([v79 objectAtIndexedSubscript:v78]);
                uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSNull, v81);
                if ((objc_opt_isKindOfClass(v80, v82) & 1) != 0)
                {
                  v75[v78] = 0LL;
                }

                else
                {
                  v83 = (void *)objc_claimAutoreleasedReturnValue([v72 functionArray]);
                  v84 = (void *)objc_claimAutoreleasedReturnValue([v83 objectAtIndexedSubscript:v78]);
                  id v85 = DEVICEOBJECT(v84);
                  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
                  v75[v78] = v86;
                }

                ++v78;
                v87 = (void *)objc_claimAutoreleasedReturnValue([v72 functionArray]);
                id v88 = [v87 count];
              }

              while ((unint64_t)v88 > v78);
            }

            GTResourceDownloaderGetResourceFilename((uint64_t)v11, 0, (char *)buf, 0x80uLL);
            v89 = (void *)objc_claimAutoreleasedReturnValue([v107 objects]);
            v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
            [v89 addObject:v90];

            v91 = (void *)objc_claimAutoreleasedReturnValue([v107 objects]);
            [v91 addObject:v105];

            NSUInteger v92 = -[NSMutableData length](v105, "length");
            do
              unint64_t v93 = __ldaxr(&g_GPUDataSize);
            while (__stlxr(v93 + v92, &g_GPUDataSize));

LABEL_52:
            objc_super v3 = v110;
            a1 = v111;
            v5 = &OBJC_PROTOCOL___CaptureMTLObject;
            os_signpost_id_t v12 = v114;
            id v6 = v116;
            unint64_t v15 = v112;
            goto LABEL_53;
          }

          if (v16 == 86) {
            DownloadIOSurface(*(void **)(a1 + 40), v3, (id *)v11);
          }
        }

        else if (v16 == 60)
        {
          unint64_t v113 = v12 - 1;
          os_signpost_id_t v115 = v12;
          v117 = v6;
          id v106 = *(id *)(a1 + 40);
          id v108 = v3;
          id v35 = *(id *)v11;
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 functionArray]);
          uint64_t v37 = 8 * (void)[v36 count] + 8;

          v38 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v35 functionArray]);
          id v40 = [v39 count];
          v41 = v38;
          *(void *)-[NSMutableData mutableBytes](v41, "mutableBytes") = v40;

          v104 = v41;
          v42 = -[NSMutableData mutableBytes](v104, "mutableBytes");
          v43 = (void *)objc_claimAutoreleasedReturnValue([v35 functionArray]);
          id v44 = [v43 count];

          if (v44)
          {
            unint64_t v45 = 0LL;
            v46 = v42 + 8;
            do
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue([v35 functionArray]);
              v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndexedSubscript:v45]);
              uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSNull, v49);
              if ((objc_opt_isKindOfClass(v48, v50) & 1) != 0)
              {
                *(void *)&v46[8 * v45] = 0LL;
              }

              else
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue([v35 functionArray]);
                v52 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:v45]);
                id v53 = DEVICEOBJECT(v52);
                v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
                *(void *)&v46[8 * v45] = v54;
              }

              ++v45;
              v55 = (void *)objc_claimAutoreleasedReturnValue([v35 functionArray]);
              id v56 = [v55 count];
            }

            while ((unint64_t)v56 > v45);
          }

          GTResourceDownloaderGetResourceFilename((uint64_t)v11, 0, (char *)buf, 0x80uLL);
          v57 = v108;
          v58 = (void *)objc_claimAutoreleasedReturnValue([v108 objects]);
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
          [v58 addObject:v59];

          v60 = (void *)objc_claimAutoreleasedReturnValue([v108 objects]);
          [v60 addObject:v104];

          NSUInteger v61 = -[NSMutableData length](v104, "length");
          do
            unint64_t v62 = __ldaxr(&g_GPUDataSize);
          while (__stlxr(v62 + v61, &g_GPUDataSize));

          unint64_t v15 = v113;
          os_signpost_id_t v12 = v115;
          if ((objc_opt_respondsToSelector(v35, "bufferAddressAtIndex:") & 1) != 0)
          {
            v63 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 256LL);
            *(void *)-[NSMutableData mutableBytes](v63, "mutableBytes") = 31LL;
            v64 = v63;
            uint64_t v65 = 0LL;
            v66 = (char *)-[NSMutableData mutableBytes](v64, "mutableBytes") + 8;
            do
            {
              *(void *)&v66[8 * v65] = [v35 bufferAddressAtIndex:v65];
              ++v65;
            }

            while (v65 != 31);
            GTResourceDownloaderGetResourceFilename((uint64_t)v11, 1, (char *)buf, 0x80uLL);
            v57 = v108;
            v67 = (void *)objc_claimAutoreleasedReturnValue([v108 objects]);
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
            [v67 addObject:v68];

            v69 = (void *)objc_claimAutoreleasedReturnValue([v108 objects]);
            [v69 addObject:v64];

            NSUInteger v70 = -[NSMutableData length](v64, "length");
            do
              unint64_t v71 = __ldaxr(&g_GPUDataSize);
            while (__stlxr(v71 + v70, &g_GPUDataSize));
          }

          objc_super v3 = v110;
          a1 = v111;
          v5 = &OBJC_PROTOCOL___CaptureMTLObject;
          id v6 = v117;
        }

        else if (v16 == 80)
        {
          DownloadTexture(*(void **)(a1 + 40), v3, (id *)v11, 1);
        }
      }

      else
      {
        if (v11[46] > 0x31u)
        {
          if (v16 == 50)
          {
            DownloadHeap(*(void **)(a1 + 40), v3, v11);
            goto LABEL_53;
          }

          if (v16 != 57) {
            goto LABEL_53;
          }
          unint64_t v112 = v12 - 1;
          os_signpost_id_t v114 = v12;
          v116 = v6;
          id v17 = *(id *)v11;
          id v18 = *(id *)(a1 + 40);
          id v19 = v3;
          id v20 = v17;
          id v21 = DEVICEOBJECT(v20);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          id v23 = [v22 size];
          MTLIndirectCommandBufferDescriptorWithoutResourceIndex = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex((uint64_t)(v11 + 48));
          v25 = (void *)objc_claimAutoreleasedReturnValue(MTLIndirectCommandBufferDescriptorWithoutResourceIndex);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v18 getGPUIndirectCommandBuffer:v23 context:v19 descriptor:v25]);

          v27 = (void *)objc_claimAutoreleasedReturnValue([v19 blitCommandEncoder]);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v19 blitCommandEncoder]);
          objc_msgSend( v28,  "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:",  v22,  0,  v23,  v26,  0);

          GTResourceDownloaderGetResourceFilename((uint64_t)v11, 0, (char *)buf, 0x80uLL);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v19 objects]);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
          [v29 addObject:v30];

          v31 = (void *)objc_claimAutoreleasedReturnValue([v19 objects]);
          [v31 addObject:v26];

          v32 = (void *)objc_claimAutoreleasedReturnValue([v19 objects]);
          [v32 addObject:v25];

          id v33 = [v26 allocatedSize];
          do
            unint64_t v34 = __ldaxr(&g_GPUDataSize);
          while (__stlxr((unint64_t)v33 + v34, &g_GPUDataSize));

          goto LABEL_52;
        }

        if (v16 == 16)
        {
          DownloadAccelerationStructure(*(void **)(a1 + 40), v3, v11);
        }

        else if (v16 == 22)
        {
          DownloadBuffer(*(void **)(a1 + 40), v3, v11);
        }
      }

void __58__GTResourceDownloader_getGPUIndirectCommandBuffer_count___block_invoke(id a1)
{
  if (s_logUsingOsLog)
  {
    id v1 = gt_default_log();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "warning: failed to mark GPU indirect buffer memory(GRAPHICS)",  buf,  2u);
    }
  }

  else
  {
    objc_super v3 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"warning: failed to mark GPU indirect buffer memory(GRAPHICS)"));
    fprintf(v3, "%s\n", (const char *)[v4 UTF8String]);
  }

void __51__GTResourceDownloader_fillGPUBuffer_size_context___block_invoke(id a1)
{
  if (s_logUsingOsLog)
  {
    id v1 = gt_default_log();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "warning: failed to mark GPU buffer memory(GRAPHICS)",  buf,  2u);
    }
  }

  else
  {
    objc_super v3 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"warning: failed to mark GPU buffer memory(GRAPHICS)"));
    fprintf(v3, "%s\n", (const char *)[v4 UTF8String]);
  }

@end