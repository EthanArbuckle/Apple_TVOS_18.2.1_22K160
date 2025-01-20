@interface DYGLShaderProfilerFunctionPlayerSupport
- (BOOL)_getFramebufferWidth:(int *)a3 height:(int *)a4 numSamples:(int *)a5;
- (BOOL)_uscSamplingEnded;
- (BOOL)shouldCallSuper;
- (BOOL)shouldExecuteGraphicsFunction;
- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3;
- (BOOL)shouldReturn;
- (DYEAGLDebugFunctionPlayer)strongFunctionPlayer;
- (DYEAGLDebugPlaybackEngine)strongPlaybackEngine;
- (DYGLShaderProfilerFunctionPlayerSupport)initWithDebugEAGLPlaybackEngine:(id)a3 payLoad:(id)a4;
- (id).cxx_construct;
- (id)_queryShaderResult;
- (id)_valueFromKey:(id)a3;
- (id)queryShaderStart;
- (void)_backupAndSetupStates;
- (void)_endUSCSampling;
- (void)_harvestShaderBinaries;
- (void)_replaceColorAttachment;
- (void)_restoreColorAttachment;
- (void)_restoreStates;
- (void)_saveColorAttachmentFramebuffer:(unsigned int)a3;
- (void)_shouldEndUSCSampling;
- (void)_startUSCSampling;
- (void)dealloc;
- (void)executePlatformFunction;
- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3;
- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3;
- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3;
- (void)setShouldCallSuper:(BOOL)a3;
- (void)setShouldReturn:(BOOL)a3;
@end

@implementation DYGLShaderProfilerFunctionPlayerSupport

- (DYEAGLDebugFunctionPlayer)strongFunctionPlayer
{
  return (DYEAGLDebugFunctionPlayer *)objc_loadWeakRetained((id *)&self->_functionPlayer);
}

- (DYEAGLDebugPlaybackEngine)strongPlaybackEngine
{
  return (DYEAGLDebugPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (DYGLShaderProfilerFunctionPlayerSupport)initWithDebugEAGLPlaybackEngine:(id)a3 payLoad:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DYGLShaderProfilerFunctionPlayerSupport;
  v8 = -[DYGLShaderProfilerFunctionPlayerSupport init](&v23, "init");
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 player]);
    objc_storeWeak((id *)&v9->_functionPlayer, v11);

    p_payLoad = (id *)&v9->_payLoad;
    objc_storeStrong((id *)&v9->_payLoad, a4);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10->_payLoad, "objectForKeyedSubscript:", @"function flag"));
    functionFlag = v10->_functionFlag;
    v10->_functionFlag = (NSArray *)v13;

    if (-[NSArray count](v10->_functionFlag, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([*p_payLoad objectForKeyedSubscript:@"harvest draw call footprint"]);
      v10->_harvestDrawCallFootprint = [v15 BOOLValue];

      v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v10->_payLoad,  "objectForKeyedSubscript:",  @"usc sampling period"));
      v10->_uscSampling_Period = [v16 unsignedIntValue];

      if (v10->_uscSampling_Period)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([*p_payLoad objectForKeyedSubscript:@"draw call num"]);
        unsigned int v18 = [v17 unsignedIntValue];

        v10->_uscSampling_SampleBufferSize = 0x2000000;
        unsigned int v19 = 60 * v18 * v10->_uscSampling_Period;
        if (v19 <= 0x6666) {
          unint64_t v20 = 26214LL;
        }
        else {
          unint64_t v20 = v19;
        }
        v10->_uscSampling_AddressBufferSize = 40 * v20;
        if (vm_allocate(mach_task_self_, (vm_address_t *)&v9->_uscSampling_SampleBuffer, 0x2000000uLL, 1)) {
          goto LABEL_8;
        }
        sub_E3AC((uint64_t)&v9->_uscSampling_AddressBuffer, v20);
        memset(v10->_uscSampling_SampleBuffer, 255, v10->_uscSampling_SampleBufferSize);
        memset(v10->_uscSampling_AddressBuffer.__begin_, 255, v10->_uscSampling_AddressBufferSize);
      }

      v21 = IOServiceMatching("IOAcceleratorES");
      dword_2AC74 = IOServiceGetMatchingService(kIOMasterPortDefault, v21);
      v9 = v10;
      goto LABEL_11;
    }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  [v3 setDelegate:0];

  payLoad = self->_payLoad;
  self->_payLoad = 0LL;

  uscSampling_SampleBuffer = self->_uscSampling_SampleBuffer;
  if (uscSampling_SampleBuffer) {
    vm_deallocate(mach_task_self_, (vm_address_t)uscSampling_SampleBuffer, self->_uscSampling_SampleBufferSize);
  }
  frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
  self->_frameTiming_PerformanceStatisticsArray = 0LL;

  if (dword_2AC74)
  {
    IOObjectRelease(dword_2AC74);
    dword_2AC74 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DYGLShaderProfilerFunctionPlayerSupport;
  -[DYGLShaderProfilerFunctionPlayerSupport dealloc](&v7, "dealloc");
}

- (id)queryShaderStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DYFuture future](&OBJC_CLASS___DYFuture, "future"));
  self->_queryShaderState = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  [v4 setDelegate:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  id v6 = [v5 loopCount];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  [v7 setLoopCount:0xFFFFFFFFLL];

  v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"gputools.%@.%p", v9, self));
  dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playbackToFunction:", objc_msgSend(v13, "targetFunctionIndex")));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_E724;
  v20[3] = &unk_247A0;
  v20[4] = self;
  id v15 = v3;
  id v21 = v15;
  [v14 notifyOnQueue:v11 handler:v20];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  [v16 setLoopCount:v6];

  v17 = v21;
  id v18 = v15;

  return v18;
}

- (id)_valueFromKey:(id)a3
{
  v3 = (__CFString *)a3;
  if (dword_2AC74
    && (CFProperty = (void *)IORegistryEntryCreateCFProperty(dword_2AC74, v3, kCFAllocatorDefault, 0)) != 0LL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", CFProperty));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)_queryShaderResult
{
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v25 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_drawCallInfo, "count"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  obj = self->_drawCallInfo;
  id v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v2)
  {
    uint64_t v3 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v27 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 footprint]));
        objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 vertexShaderKey]);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v5 fragmentShaderKey]);
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  @"footprint",  v7,  @"vertex shader key",  v8,  @"fragment shader key",  0LL));
        -[NSMutableArray addObject:](v25, "addObject:", v9);
      }

      id v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    }

    while (v2);
  }

  [v22 setObject:v25 forKey:@"draw call info"];
  id v10 = self;
  [v22 setObject:self->_vertexShaderInfo forKey:@"vertex shader info"];
  [v22 setObject:self->_fragmentShaderInfo forKey:@"fragment shader info"];
  uscSampling_SampleBuffer = self->_uscSampling_SampleBuffer;
  if (uscSampling_SampleBuffer)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  uscSampling_SampleBuffer,  self->_uscSampling_SampleBufferSize));
    [v22 setObject:v12 forKey:@"usc sampling sample data"];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_uscSampling_AddressBuffer.__begin_,  self->_uscSampling_AddressBufferSize));
    [v22 setObject:v13 forKey:@"usc sampling address data"];

    id v10 = self;
  }

  if (v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_)
  {
    v14 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  *((unsigned int *)v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_ + 56));
    value = v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    if (value[56])
    {
      int v16 = 0;
      unsigned int v17 = 0;
      do
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(*(void *)value + 8LL * ((v16 + value[57] + value[6]) % value[6]))));
        -[NSMutableArray addObject:](v14, "addObject:", v18);

        ++v17;
        value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        --v16;
      }

      while (v17 < value[56]);
    }

    [v22 setObject:v14 forKey:@"frametime"];

    id v10 = self;
  }

  frameTiming_PerformanceStatisticsArray = v10->_frameTiming_PerformanceStatisticsArray;
  if (frameTiming_PerformanceStatisticsArray) {
    [v22 setObject:frameTiming_PerformanceStatisticsArray forKey:@"performance statistics"];
  }
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[DYGLShaderProfilerFunctionPlayerSupport _valueFromKey:]( v10,  "_valueFromKey:",  @"MetalPluginName"));
  if (v20) {
    [v22 setObject:v20 forKeyedSubscript:@"MetalPluginName"];
  }

  return v22;
}

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (unint64_t *)[v3 function];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v6 = (void (**)(id, uint64_t, unint64_t *))[v5 gliDispatch];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v8 = [v7 gliContext];

  if (self->_queryShaderState == 4) {
    -[DYGLShaderProfilerFunctionPlayerSupport _restoreColorAttachment](self, "_restoreColorAttachment");
  }
  int v9 = *(_DWORD *)v4;
  if (*(int *)v4 > 822)
  {
    unsigned int v10 = v9 - 823;
    if (v10 > 0x1F) {
      goto LABEL_13;
    }
    int v11 = 1 << v10;
    if ((v11 & 0xF0004000) == 0 && (v11 & 3) == 0) {
      goto LABEL_13;
    }
LABEL_12:
    LODWORD(v64) = 0;
    v6[104](v8, 36006LL, &v64);
    int v12 = v64;
    v65 = v4 + 2;
    *((_DWORD *)sub_122C0((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v65) + 6) = v12;
    goto LABEL_13;
  }

- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3
{
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer", a3));
  v4 = (int *)[v16 function];

  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1LL);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0LL);
  int v5 = *v4;
  if (*v4 <= 381)
  {
    BOOL v8 = (v5 - 139) <= 7 && ((1 << (v5 + 117)) & 0x91) != 0 || v5 == 28;
    if (!v8 && v5 != 36) {
      return;
    }
  }

  else
  {
    BOOL v6 = (v5 - 823) > 0x1F || ((1 << (v5 - 55)) & 0xF0784003) == 0;
    if (v6 && v5 != 382 && v5 != 384) {
      return;
    }
  }

  if (self->_queryShaderState == 2)
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    if ([v17 mainExecutionMode])
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      unsigned int v10 = [v9 currentExecutionModeFunctionIndex];
      unint64_t v11 = -[NSArray count](self->_functionFlag, "count");

      if (v11 > v10)
      {
        functionFlag = self->_functionFlag;
        id v18 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( functionFlag,  "objectAtIndexedSubscript:",  [v18 currentExecutionModeFunctionIndex]));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"flag"]);
        unsigned __int8 v15 = [v14 unsignedIntValue];

        if ((v15 & 8) != 0) {
          -[DYGLShaderProfilerFunctionPlayerSupport _harvestShaderBinaries](self, "_harvestShaderBinaries");
        }
      }
    }

    else
    {
    }
  }

- (void)executePlatformFunction
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (unint64_t *)[v3 function];

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  BOOL v6 = (void (**)(id))[v5 gliDispatch];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v8 = [v7 gliContext];

  int v9 = *(_DWORD *)v4;
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 0LL);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0LL);
  if (self->_queryShaderState != 3)
  {
LABEL_9:
    if ((self->_queryShaderState - 5) <= 1)
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      if ([v19 mainExecutionMode])
      {
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        unsigned int v21 = [v20 currentExecutionModeFunctionIndex];
        unint64_t v22 = -[NSArray count](self->_functionFlag, "count");

        if (v22 > v21 && (v9 + 8190) <= 0xC && ((1 << (v9 - 2)) & 0x1801) != 0)
        {
          if (self->_queryShaderState == 6)
          {
            -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1LL);
            -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 1LL);
          }

          else
          {
            v6[90](v8);
            -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1LL);
          }

          return;
        }
      }

      else
      {
      }
    }

    goto LABEL_20;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  if (([v10 mainExecutionMode] & 1) == 0)
  {

    goto LABEL_9;
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unsigned int v12 = [v11 currentExecutionModeFunctionIndex];
  unint64_t v13 = -[NSArray count](self->_functionFlag, "count");

  if (v13 <= v12) {
    goto LABEL_9;
  }
  functionFlag = self->_functionFlag;
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( functionFlag,  "objectAtIndexedSubscript:",  [v15 currentExecutionModeFunctionIndex]));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"flag"]);
  unsigned __int8 v18 = [v17 unsignedIntValue];

  if ((v18 & 1) != 0)
  {
    __int128 v26 = v4 + 2;
    -[DYGLShaderProfilerFunctionPlayerSupport _saveColorAttachmentFramebuffer:]( self,  "_saveColorAttachmentFramebuffer:",  *((unsigned int *)sub_122C0((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v26) + 6));
    if ((v18 & 4) == 0)
    {
LABEL_6:
      if ((v18 & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }

  else if ((v18 & 4) == 0)
  {
    goto LABEL_6;
  }

  -[DYGLShaderProfilerFunctionPlayerSupport _replaceColorAttachment](self, "_replaceColorAttachment");
  if ((v18 & 2) != 0) {
LABEL_19:
  }
    ((void (*)(id, uint64_t))v6[10])(v8, 0x4000LL);
LABEL_20:
  unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unsigned int v24 = [v23 isFunctionEnabled];
  if (v9 == -8188) {
    unsigned int v25 = v24;
  }
  else {
    unsigned int v25 = 0;
  }

  if (v25 == 1)
  {
    __int128 v26 = v4 + 2;
    *((_DWORD *)sub_122C0((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v26) + 6) = 0;
  }

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  return self->_queryShaderState != 0;
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  switch(self->_queryShaderState)
  {
    case 1:
      int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
      self->_BOOL backup_enableWireframePresent = [v5 enableWireframePresent];

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
      [v6 setEnableWireframePresent:0];

      objc_super v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_functionFlag, "count") >> 2);
      drawCallInfo = self->_drawCallInfo;
      self->_drawCallInfo = v7;

      int v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_functionFlag, "count") >> 2);
      vertexShaderInfo = self->_vertexShaderInfo;
      self->_vertexShaderInfo = v9;

      unint64_t v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_functionFlag, "count") >> 2);
      fragmentShaderInfo = self->_fragmentShaderInfo;
      self->_fragmentShaderInfo = v11;

      self->_drawCallIndex = 0;
      int v13 = 2;
      goto LABEL_21;
    case 2:
      -[DYGLShaderProfilerFunctionPlayerSupport _backupAndSetupStates](self, "_backupAndSetupStates");
      self->_drawCallIndex = 0;
      sub_12760((uint64_t)&self->_colorAttachmentMap);
      sub_127F0((uint64_t)&self->_drawCallIndexMap);
      int v13 = 3;
      goto LABEL_21;
    case 3:
      -[DYGLShaderProfilerFunctionPlayerSupport _restoreStates](self, "_restoreStates");
LABEL_6:
      int v13 = 4;
      goto LABEL_21;
    case 4:
      self->_uscSampling_FrameIndexStart = a3;
      self->_uscSampling_TimeStart = mach_absolute_time();
      int v13 = 5;
      goto LABEL_21;
    case 5:
      if (-[DYGLShaderProfilerFunctionPlayerSupport _uscSamplingEnded](self, "_uscSamplingEnded"))
      {
        value = (uint64_t *)self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        if (value)
        {
          sub_FF98(value);
        }

        else
        {
          unsigned int v19 = operator new(0xE8uLL);
          sub_12844((uint64_t)v19, 0x20u);
          unint64_t v20 = (void **)self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
          self->_frameTiming_FrameTimeStatistics.__ptr_.__value_ = v19;
          if (v20) {
            sub_12C38((_DWORD)self + 400, v20);
          }
        }

        frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
        if (frameTiming_PerformanceStatisticsArray)
        {
          -[NSMutableArray removeAllObjects](frameTiming_PerformanceStatisticsArray, "removeAllObjects");
        }

        else
        {
          unint64_t v22 = objc_alloc(&OBJC_CLASS___NSMutableArray);
          unsigned __int8 v23 = -[NSMutableArray initWithCapacity:](v22, "initWithCapacity:", kDYExperimentFrameTimeArraySizeDefault);
          unsigned int v24 = self->_frameTiming_PerformanceStatisticsArray;
          self->_frameTiming_PerformanceStatisticsArray = v23;
        }

        self->_frameTiming_FrameIndexStart = a3;
        uint64_t v25 = mach_absolute_time();
        self->_frameTiming_GlobalTimeStart = v25;
        self->_frameTiming_FrameTimeStart = v25;
        self->_frameTiming_Done = 0;
        int v29 = 0;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 context]);
        [v27 setParameter:1414 to:&v29];

        int v13 = 6;
LABEL_21:
        self->_queryShaderState = v13;
      }

      else
      {
        -[DYGLShaderProfilerFunctionPlayerSupport _shouldEndUSCSampling](self, "_shouldEndUSCSampling");
      }

      return;
    case 6:
      self->_frameTiming_FrameTimeStart = mach_absolute_time();
      if (!self->_frameTiming_Done) {
        return;
      }
      int v28 = 0;
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
      [v16 setParameter:1414 to:&v28];

      BOOL backup_enableWireframePresent = self->_backup_enableWireframePresent;
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
      [v18 setEnableWireframePresent:backup_enableWireframePresent];

      int v13 = 7;
      goto LABEL_21;
    case 7:
      self->_queryShaderState = 0;
      return;
    default:
      return;
  }

- (void)_startUSCSampling
{
  if (self->_uscSampling_SampleBuffer)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v4 = (void (*)(id))*((void *)[v3 gliDispatch] + 89);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v4([v5 gliContext]);

    unint64_t v6 = self->_uscSampling_AddressBufferSize / 0x28uLL;
    v13[0] = self->_uscSampling_AddressBuffer.__begin_;
    v13[1] = v6;
    uint64_t uscSampling_SampleBufferSize = self->_uscSampling_SampleBufferSize;
    v13[2] = self->_uscSampling_SampleBuffer;
    v13[3] = uscSampling_SampleBufferSize / 0xCuLL;
    v13[4] = uscSampling_SampleBufferSize;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 context]);
    [v9 setParameter:1411 to:v13];

    int v12 = 0;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    [v11 setParameter:1412 to:&v12];

    self->_uscSampling_Enabled = 1;
  }

- (BOOL)_uscSamplingEnded
{
  return !self->_uscSampling_SampleBuffer || !self->_uscSampling_Enabled || self->_uscSamplingEnded;
}

- (void)_shouldEndUSCSampling
{
  uint64_t v3 = mach_absolute_time();
  self->_uscSampling_TimeEnd = v3;
  unint64_t v4 = v3 - self->_uscSampling_TimeStart;
  if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1)) {
    unint64_t v4 = __udivti3(v4 * g_DYTimebaseInfo, (v4 * (unsigned __int128)g_DYTimebaseInfo) >> 64);
  }
}

- (void)_endUSCSampling
{
  int v11 = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
  [v4 setParameter:1413 to:&v11];

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v6 = (void (*)(id))*((void *)[v5 gliDispatch] + 89);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6([v7 gliContext]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer]( self,  "strongFunctionPlayer",  0LL,  0LL,  0LL,  0LL,  0LL));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 context]);
  [v9 setParameter:1411 to:&v10];

  self->_uscSamplingEnded = 1;
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  if (self->_queryShaderState == 6)
  {
    uint64_t v5 = mach_absolute_time();
    value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    uint64_t v7 = v5 - self->_frameTiming_FrameTimeStart;
    if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1)) {
      uint64_t v7 = __udivti3(v7 * g_DYTimebaseInfo, ((unint64_t)v7 * (unsigned __int128)g_DYTimebaseInfo) >> 64);
    }
    double v18 = *(double *)&v7;
    sub_10550((uint64_t)value, &v18);
    id v8 = -[NSMutableArray count](self->_frameTiming_PerformanceStatisticsArray, "count");
    if (v8 == (id)kDYExperimentFrameTimeArraySizeDefault) {
      -[NSMutableArray removeObjectAtIndex:](self->_frameTiming_PerformanceStatisticsArray, "removeObjectAtIndex:", 0LL);
    }
    if (dword_2AC74
      && (CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( dword_2AC74,  @"PerformanceStatistics",  kCFAllocatorDefault,  0)) != 0LL)
    {
      __int128 v10 = (void *)CFProperty;
      -[NSMutableArray addObject:](self->_frameTiming_PerformanceStatisticsArray, "addObject:", CFProperty);
    }

    else
    {
      frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray addObject:](frameTiming_PerformanceStatisticsArray, "addObject:", v10);
    }

    int v12 = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    unsigned int v13 = v12[56];
    unsigned int v14 = v12[6];
    if (v13 >= v14)
    {
      if (a3 - self->_frameTiming_FrameIndexStart > 0x7F) {
        goto LABEL_16;
      }
      unint64_t v15 = v5 - self->_frameTiming_GlobalTimeStart;
      if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1))
      {
        id v16 = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        unint64_t v15 = __udivti3(v15 * g_DYTimebaseInfo, (v15 * (unsigned __int128)g_DYTimebaseInfo) >> 64);
        int v12 = v16;
      }

      if (v15 >= 0x3B9ACA01
        || (double)(unint64_t)(*(void *)(*((void *)v12 + 19) + 8LL * ((v12[57] + v14) % v14))
                                    - *(void *)(*((void *)v12 + 13) + 8LL * ((v12[57] + v14) % v14)))
         / (double)*(unint64_t *)(*((void *)v12 + 7) + 8LL * ((v12[57] + v14) % v14)) < kDYExperimentFrameTimeVariationLimit1
        || v13 >= kDYExperimentFrameTimeVariationArraySizeDefault
        && (double v17 = 0.0,
            double v18 = 0.0,
            sub_107D4((uint64_t)v12, kDYExperimentFrameTimeVariationArraySizeDefault, &v18, &v17))
        && v17 < kDYExperimentFrameTimeVariationLimit2
        && v17 - v18 < kDYExperimentFrameTimeVariationRangeMax)
      {
LABEL_16:
        self->_frameTiming_Done = 1;
      }
    }
  }

- (void)_replaceColorAttachment
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v4 = (unint64_t *)[v3 function];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v6 = (void (**)(id, uint64_t, _DWORD *))[v5 gliDispatch];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v8 = [v7 gliContext];

  v6[104](v8, 36006LL, &v55);
  v6[104](v8, 36007LL, &v54);
  uint64_t v53 = 0LL;
  int v52 = 0;
  if (!-[DYGLShaderProfilerFunctionPlayerSupport _getFramebufferWidth:height:numSamples:]( self,  "_getFramebufferWidth:height:numSamples:",  (char *)&v53 + 4,  &v53,  &v52)) {
    self->_error = 1;
  }
  unsigned int v9 = kDYReservedGLNameFootprintRenderbuffer;
  v6[666](v8, 36161LL, (_DWORD *)kDYReservedGLNameFootprintRenderbuffer);
  int v43 = v4;
  if (v52) {
    ((void (*)(id, uint64_t))v6[756])(v8, 36161LL);
  }
  else {
    ((void (*)(id, uint64_t, uint64_t, void, void))v6[669])( v8,  36161LL,  32856LL,  HIDWORD(v53),  v53);
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
  sub_4948(v51, v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v50[0] = v51;
  v50[1] = [v12 gliDispatch];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 captureSessionInfo]);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contextInfoForContext:", objc_msgSend(v15, "ctxID")));
  id v17 = [v16 api];

  int v49 = 1;
  int v42 = self;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v19 = *((void *)[v18 currentContextInfo] + 13);

  if (v19 >= 3) {
    v6[104](v8, 36063LL, &v49);
  }
  __p[0] = 0LL;
  __p[1] = 0LL;
  v48 = 0LL;
  if (v49 >= 1)
  {
    for (int i = 0; i < v49; ++i)
    {
      GPUTools::GL::GetFramebufferAttachmentInfo(v50, v17, 36009LL, (i + 36064), &v44);
      unsigned int v21 = (char *)__p[1];
      if (__p[1] >= v48)
      {
        unsigned int v24 = (char *)__p[0];
        int64_t v25 = ((char *)__p[1] - (char *)__p[0]) >> 5;
        unint64_t v26 = v25 + 1;
        uint64_t v27 = v48 - (char *)__p[0];
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          int v29 = (char *)sub_12CEC((uint64_t)&v48, v28);
          unsigned int v24 = (char *)__p[0];
          unsigned int v21 = (char *)__p[1];
        }

        else
        {
          int v29 = 0LL;
        }

        __int128 v30 = v45;
        v31 = &v29[32 * v25];
        *(_OWORD *)v31 = v44;
        *((_OWORD *)v31 + 1) = v30;
        if (v21 == v24)
        {
          v34 = &v29[32 * v25];
        }

        else
        {
          int v32 = &v29[32 * v25];
          do
          {
            __int128 v33 = *((_OWORD *)v21 - 1);
            v34 = v32 - 32;
            *((_OWORD *)v32 - 2) = *((_OWORD *)v21 - 2);
            *((_OWORD *)v32 - 1) = v33;
            v21 -= 32;
            v32 -= 32;
          }

          while (v21 != v24);
        }

        unsigned __int8 v23 = v31 + 32;
        __p[0] = v34;
        __p[1] = v31 + 32;
        v48 = &v29[32 * v28];
        if (v24) {
          operator delete(v24);
        }
      }

      else
      {
        __int128 v22 = v45;
        *(_OWORD *)__p[1] = v44;
        *((_OWORD *)v21 + 1) = v22;
        unsigned __int8 v23 = v21 + 32;
      }

      __p[1] = v23;
      if (i) {
        uint64_t v35 = 0LL;
      }
      else {
        uint64_t v35 = v9;
      }
      ((void (*)(id, uint64_t, void, uint64_t, uint64_t))v6[679])( v8,  36009LL,  (i + 36064),  36161LL,  v35);
    }
  }

  uint64_t p_colorAttachmentMap = (uint64_t)&v42->_colorAttachmentMap;
  unsigned int v37 = v43 + 2;
  if (!sub_56B8(&v42->_colorAttachmentMap.__table_.__bucket_list_.__ptr_.__value_, v43 + 2))
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    int v46 = 1065353216;
    *(void *)v56 = v43 + 2;
    int v38 = sub_12D20(p_colorAttachmentMap, v37, (uint64_t)&unk_237D1, (void **)v56);
    sub_12FD0((uint64_t)(v38 + 3), (uint64_t *)&v44);
    sub_49B8((uint64_t)&v44);
  }

  *(void *)&__int128 v44 = v43 + 2;
  int v39 = sub_12D20(p_colorAttachmentMap, v37, (uint64_t)&unk_237D1, (void **)&v44);
  v56[0] = v55;
  *(void *)&__int128 v44 = v56;
  int v40 = sub_13070((uint64_t)(v39 + 3), v56, (uint64_t)&unk_237D1, (_DWORD **)&v44);
  uint64_t v41 = (void *)v40[3];
  if (v41)
  {
    v40[4] = v41;
    operator delete(v41);
    v40[3] = 0LL;
    v40[4] = 0LL;
    v40[5] = 0LL;
  }

  *(_OWORD *)(v40 + 3) = *(_OWORD *)__p;
  v40[5] = v48;
  __p[1] = 0LL;
  v48 = 0LL;
  __p[0] = 0LL;
  ((void (*)(id, float, float, float, float))v6[12])(v8, 0.0, 0.0, 0.0, 0.0);
  ((void (*)(id, uint64_t))v6[10])(v8, 0x4000LL);
  v6[666](v8, 36161LL, (_DWORD *)v54);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)_saveColorAttachmentFramebuffer:(unsigned int)a3
{
  if (a3)
  {
    memset(v53, 0, sizeof(v53));
    int v54 = 0;
    uint64_t v55 = 0x100000001LL;
    v56[0] = 0LL;
    *(void *)((char *)v56 + 5) = 0LL;
    memset(&v56[2], 0, 24);
    int v57 = 0;
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    uint64_t v5 = [v4 function];
    DYHarvestRenderbufferInfo(v5[2], kDYReservedGLNameFootprintRenderbuffer, 1LL, v53);

    if (LODWORD(v56[2]))
    {
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      p_drawCallIndexMap = &self->_drawCallIndexMap;
      uint64_t v7 = sub_56B8( &self->_drawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)[v6 function] + 2);

      if (v7)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        v58[0] = (uint64_t *)((char *)[v8 function] + 16);
        unsigned int v9 = sub_124E0((uint64_t)p_drawCallIndexMap, (unint64_t *)v58[0], (uint64_t)&unk_237D1, v58);

        __int128 v10 = (unsigned int *)v9[3];
        if (v10 != (unsigned int *)v9[4])
        {
          int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_functionFlag, "objectAtIndexedSubscript:", *v10));
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"flag"]);
          unsigned __int8 v13 = [v12 unsignedIntValue];

          if ((v13 & 0x10) != 0)
          {
            uint64_t v27 = *(unsigned int **)((char *)&v56[2] + 4);
            unint64_t v28 = *(unsigned int **)((char *)&v56[3] + 4);
            while (v27 != v28)
            {
              unsigned int v29 = *v27;
              if (*v27 && v29 <= self->_drawCallIndex)
              {
                __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_drawCallInfo,  "objectAtIndexedSubscript:",  v29 - 1));
                objc_msgSend(v30, "setFootprint:", objc_msgSend(v30, "footprint") + 1);
              }

              ++v27;
            }
          }

          else if ((v13 & 0x20) != 0)
          {
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_functionFlag,  "objectAtIndexedSubscript:",  *(unsigned int *)v9[3]));
            unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"parameters"]);

            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"blending draw call scale"]);
            BOOL v17 = v16 == 0LL;

            if (v17)
            {
              uint64_t v31 = v9[4];
              if (v31 == v9[3])
              {
                uint64_t v41 = v9[4];
              }

              else
              {
                unint64_t v32 = 0LL;
                unsigned int v33 = 1;
                uint64_t v31 = v9[3];
                do
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_functionFlag,  "objectAtIndexedSubscript:",  *(unsigned int *)(v31 + 8 * v32),  p_drawCallIndexMap));
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"parameters"]);

                  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"blending draw call bit start"]);
                  unsigned int v37 = [v36 unsignedIntValue];

                  int v38 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"blending draw call bit end"]);
                  unsigned __int8 v39 = [v38 unsignedIntValue];

                  int v40 = &v58[v32];
                  *(_DWORD *)int v40 = v37;
                  *((_DWORD *)v40 + 1) = (-1 << ~v39) >> (31 - v39 + v37);
                  unint64_t v32 = v33;
                  uint64_t v31 = v9[3];
                  uint64_t v41 = v9[4];
                  ++v33;
                  unint64_t v15 = v35;
                }

                while (v32 < (v41 - v31) >> 3);
                unint64_t v15 = v35;
              }

              int v42 = *(unsigned int **)((char *)&v56[2] + 4);
              int v43 = *(unsigned int **)((char *)&v56[3] + 4);
              if (*(void *)((char *)&v56[2] + 4) != *(void *)((char *)&v56[3] + 4))
              {
                uint64_t v44 = v41;
                do
                {
                  unsigned int v45 = *v42;
                  if (*v42)
                  {
                    if (v44 == v31)
                    {
                      uint64_t v44 = v31;
                    }

                    else
                    {
                      unint64_t v46 = 0LL;
                      unsigned int v47 = 1;
                      do
                      {
                        int v48 = (v45 >> LODWORD(v58[v46])) & HIDWORD(v58[v46]);
                        if (v48)
                        {
                          int v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_drawCallInfo,  "objectAtIndexedSubscript:",  *(unsigned int *)(v31 + 8 * v46 + 4)));
                          objc_msgSend(v49, "setFootprint:", objc_msgSend(v49, "footprint") + v48);

                          uint64_t v31 = v9[3];
                          uint64_t v41 = v9[4];
                        }

                        unint64_t v46 = v47++;
                        uint64_t v44 = v41;
                      }

                      while (v46 < (v41 - v31) >> 3);
                    }
                  }

                  ++v42;
                }

                while (v42 != v43);
              }
            }

            else
            {
              double v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"blending draw call scale"]);
              unsigned __int8 v19 = [v18 unsignedIntValue];

              unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_drawCallInfo,  "objectAtIndexedSubscript:",  *(unsigned int *)(v9[3] + 4LL)));
              __int128 v22 = *(unsigned int **)((char *)&v56[3] + 4);
              for (int i = *(unsigned int **)((char *)&v56[2] + 4); i != v22; ++i)
              {
                unsigned int v23 = *i;
                if (*i)
                {
                  if (*i == 255)
                  {
                    if (BYTE1(v23) == 255)
                    {
                      unsigned int v24 = [v20 footprint];
                      if (BYTE2(v23) == 255) {
                        int v25 = HIBYTE(v23) << (3 * v19);
                      }
                      else {
                        int v25 = BYTE2(v23) << (2 * v19);
                      }
                    }

                    else
                    {
                      unsigned int v24 = [v20 footprint];
                      int v25 = BYTE1(v23) << v19;
                    }

                    uint64_t v26 = v24 + v25;
                  }

                  else
                  {
                    uint64_t v26 = [v20 footprint] + v23;
                  }

                  objc_msgSend(v20, "setFootprint:", v26, p_drawCallIndexMap);
                }
              }
            }
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue( -[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer]( self,  "strongFunctionPlayer",  p_drawCallIndexMap));
          sub_132C4(v52, (unint64_t *)[v50 function] + 2);
        }
      }
    }

    if (*(void *)((char *)&v56[2] + 4))
    {
      *(void *)((char *)&v56[3] + 4) = *(void *)((char *)&v56[2] + 4);
      operator delete(*(void **)((char *)&v56[2] + 4));
    }
  }

- (void)_harvestShaderBinaries
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, a2);
  uint64_t v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v7 = *((void *)[v6 currentContextInfo] + 13);

  if (v7 >= 2)
  {
    __int128 v26 = 0u;
    *(_OWORD *)uint64_t v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    *(_OWORD *)__src = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 context]);
    [v9 getParameter:1407 to:__src];

    if (__src[0])
    {
      if (*(_DWORD *)__src[0] == -17958193)
      {
        size_t v10 = LODWORD(__src[1]);
        if (LODWORD(__src[1]))
        {
          [v3 setLength:LODWORD(__src[1])];
          id v11 = [v3 mutableBytes];
          memcpy(v11, __src[0], v10);
        }
      }
    }

    if (v27[0])
    {
      if (*(_DWORD *)v27[0] == -17958193)
      {
        size_t v12 = LODWORD(v27[1]);
        if (LODWORD(v27[1]))
        {
          [v5 setLength:LODWORD(v27[1])];
          id v13 = [v5 mutableBytes];
          memcpy(v13, v27[0], v12);
        }
      }
    }
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  objc_msgSend(v3, "dy_crc32")));
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  objc_msgSend(v5, "dy_crc32")));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_drawCallInfo,  "objectAtIndexedSubscript:",  self->_drawCallIndex - 1));
  [v16 setVertexShaderKey:v14];
  [v16 setFragmentShaderKey:v15];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_vertexShaderInfo, "objectForKey:", v14));

  if (!v17)
  {
    vertexShaderInfo = self->_vertexShaderInfo;
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  @"binary",  0LL));
    -[NSMutableDictionary setObject:forKey:](vertexShaderInfo, "setObject:forKey:", v19, v14);
  }

  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fragmentShaderInfo, "objectForKey:", v15));

  if (!v20)
  {
    fragmentShaderInfo = self->_fragmentShaderInfo;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  @"binary",  0LL));
    -[NSMutableDictionary setObject:forKey:](fragmentShaderInfo, "setObject:forKey:", v22, v15);
  }
}

- (BOOL)_getFramebufferWidth:(int *)a3 height:(int *)a4 numSamples:(int *)a5
{
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  size_t v10 = (void (**)(id, uint64_t, int *))[v9 gliDispatch];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v12 = [v11 gliContext];

  v47[0] = 1;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 context]);
  sub_4948(v46, v14);

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unsigned int v37 = a3;
  v45[0] = v46;
  v45[1] = [v15 gliDispatch];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 captureSessionInfo]);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contextInfoForContext:", objc_msgSend(v18, "ctxID")));
  id v20 = [v19 api];

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v22 = *((void *)[v21 currentContextInfo] + 13);

  if (v22 < 3)
  {
    int v24 = 1;
  }

  else
  {
    v10[104](v12, 36063LL, v47);
    int v24 = v47[0];
    if (v47[0] < -1)
    {
LABEL_19:
      BOOL v33 = 0;
      goto LABEL_20;
    }
  }

  uint64_t v35 = a4;
  v36 = a5;
  int v25 = 0;
  char v26 = 0;
  *(void *)&__int128 v23 = 0x8000000080000000LL;
  __int128 v38 = v23;
  __int32 v27 = 0x7FFFFFFF;
  do
  {
    BOOL v28 = v25 < v24;
    if (v25 == v24) {
      unsigned int v29 = 36096;
    }
    else {
      unsigned int v29 = 36128;
    }
    unsigned int v30 = v25 + 36064;
    if (v28) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = v29;
    }
    GPUTools::GL::GetFramebufferAttachmentInfo(v45, v20, 36009LL, v31, v41);
    if (v42)
    {
      memset(v39, 0, sizeof(v39));
      v40[0].i32[0] = 0;
      *(int32x2_t *)((char *)v40 + 4) = (int32x2_t)0x100000001LL;
      memset((char *)&v40[1] + 4, 0, 13);
      GPUTools::GL::GetImageInfo(v45, v20, v42, v43, v44, v39);
      *((void *)&v32 + 1) = *((void *)&v38 + 1);
      *(int32x2_t *)&__int128 v32 = vmin_s32(v40[0], *(int32x2_t *)&v38);
      __int128 v38 = v32;
      if (v40[2].i32[0] < v27) {
        __int32 v27 = v40[2].i32[0];
      }
      char v26 = 1;
    }

    int v24 = v47[0];
    int v25 = v30 - 36063;
  }

  while ((int)(v30 - 36064) <= v47[0]);
  if ((v26 & 1) == 0) {
    goto LABEL_19;
  }
  *unsigned int v37 = v38;
  *uint64_t v35 = DWORD1(v38);
  BOOL v33 = 1;
  int *v36 = v27;
LABEL_20:

  return v33;
}

- (void)_backupAndSetupStates
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  uint64_t v3 = (void (**)(id, uint64_t, float *))[v5 gliDispatch];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v4 = [v6 gliContext];

  v3[103](v4, 3106LL, self->_backup_color_clear_value);
  v3[99](v4, 3107LL, (float *)self->_backup_color_writemask);
  v3[104](v4, 3042LL, (float *)&self->_backup_blend);
  v3[103](v4, 32773LL, self->_backup_blend_color);
  v3[104](v4, 32970LL, (float *)&self->_backup_blend_dst_alpha);
  v3[104](v4, 32968LL, (float *)&self->_backup_blend_dst_rgb);
  v3[104](v4, 34877LL, (float *)&self->_backup_blend_equation_alpha);
  v3[104](v4, 32777LL, (float *)&self->_backup_blend_equation_rgb);
  v3[104](v4, 32971LL, (float *)&self->_backup_blend_src_alpha);
  v3[104](v4, 32969LL, (float *)&self->_backup_blend_src_rgb);
  v3[104](v4, 3024LL, (float *)&self->_backup_dither);
  ((void (*)(id, uint64_t))v3[72])(v4, 3042LL);
  v3[458](v4, 35445LL, (float *)((char *)&loc_8A74 + 1));
  ((void (*)(id, uint64_t))v3[63])(v4, 3024LL);
  ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v3[49])(v4, 1LL, 1LL, 1LL, 1LL);
  ((void (*)(id, float, float, float, float))v3[12])(v4, 0.0, 0.0, 0.0, 0.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  self->_BOOL backup_enableWireframePresent = [v7 enableWireframePresent];
}

- (void)_restoreStates
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  uint64_t v3 = (void (**)(id, float, float, float, float))[v8 gliDispatch];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v4 = [v9 gliContext];

  v3[12]( v4,  self->_backup_color_clear_value[0],  self->_backup_color_clear_value[1],  self->_backup_color_clear_value[2],  self->_backup_color_clear_value[3]);
  ((void (*)(id, void, void, void, void))v3[49])( v4,  self->_backup_color_writemask[0],  self->_backup_color_writemask[1],  self->_backup_color_writemask[2],  self->_backup_color_writemask[3]);
  if (self->_backup_blend) {
    uint64_t v5 = 72LL;
  }
  else {
    uint64_t v5 = 63LL;
  }
  ((void (*)(id, uint64_t))v3[v5])(v4, 3042LL);
  v3[337]( v4,  self->_backup_blend_color[0],  self->_backup_blend_color[1],  self->_backup_blend_color[2],  self->_backup_blend_color[3]);
  ((void (*)(id, void, void, void, void))v3[336])( v4,  self->_backup_blend_src_rgb,  self->_backup_blend_dst_rgb,  self->_backup_blend_src_alpha,  self->_backup_blend_dst_alpha);
  ((void (*)(id, void, void))v3[458])( v4,  self->_backup_blend_equation_rgb,  self->_backup_blend_equation_alpha);
  if (self->_backup_dither) {
    uint64_t v6 = 72LL;
  }
  else {
    uint64_t v6 = 63LL;
  }
  ((void (*)(id, uint64_t))v3[v6])(v4, 3024LL);
  BOOL backup_enableWireframePresent = self->_backup_enableWireframePresent;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  [v10 setEnableWireframePresent:backup_enableWireframePresent];
}

- (void)_restoreColorAttachment
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v4 = (unint64_t *)[v3 function];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  uint64_t v6 = (void (**)(id, uint64_t, _DWORD *))[v5 gliDispatch];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  id v8 = [v7 gliContext];

  uint64_t p_colorAttachmentMap = &self->_colorAttachmentMap;
  id v10 = sub_56B8(&self->_colorAttachmentMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 2);
  if (v10)
  {
    id v11 = v10;
    char v26 = p_colorAttachmentMap;
    v6[104](v8, 36006LL, &v27);
    int v25 = v11;
    id v12 = (uint64_t **)v11[5];
    if (v12)
    {
      while (1)
      {
        if (((unsigned int (*)(id, void))v6[671])(v8, *((unsigned int *)v12 + 4)))
        {
          v6[672](v8, 36009LL, (_DWORD *)*((unsigned int *)v12 + 4));
          id v13 = (unsigned int *)v12[3];
          unsigned int v14 = (unsigned int *)v12[4];
          if (v13 != v14) {
            break;
          }
        }

- (BOOL)shouldReturn
{
  return self->_shouldReturn;
}

- (void)setShouldReturn:(BOOL)a3
{
  self->_shouldReturn = a3;
}

- (BOOL)shouldCallSuper
{
  return self->_shouldCallSuper;
}

- (void)setShouldCallSuper:(BOOL)a3
{
  self->_shouldCallSuper = a3;
}

- (void).cxx_destruct
{
  value = (void **)self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
  self->_frameTiming_FrameTimeStatistics.__ptr_.__value_ = 0LL;
  if (value) {
    sub_12C38((_DWORD)self + 400, value);
  }
  begin = self->_uscSampling_AddressBuffer.__begin_;
  if (begin)
  {
    self->_uscSampling_AddressBuffer.__end_ = begin;
    operator delete(begin);
  }

  sub_49B8((uint64_t)&self->_drawCallIndexMap);
  sub_13340((uint64_t)&self->_colorAttachmentMap);
  objc_storeStrong((id *)&self->_fragmentShaderInfo, 0LL);
  objc_storeStrong((id *)&self->_vertexShaderInfo, 0LL);
  objc_storeStrong((id *)&self->_drawCallInfo, 0LL);
  uint64_t v5 = self->_funcFlag.__begin_;
  if (v5)
  {
    self->_funcFlag.__end_ = v5;
    operator delete(v5);
  }

  sub_4AA8((uint64_t)&self->_lastUpdatedFramebuffer);
  objc_storeStrong((id *)&self->_functionFlag, 0LL);
  objc_storeStrong((id *)&self->_payLoad, 0LL);
  objc_destroyWeak((id *)&self->_functionPlayer);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 11) = 0LL;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((void *)self + 43) = 0LL;
  *((void *)self + 44) = 0LL;
  *((void *)self + 42) = 0LL;
  *((void *)self + 50) = 0LL;
  return self;
}

@end