@interface DYEAGLReplayControllerSupport
- (BOOL)isDebugPlaybackEngine:(id)a3;
- (DYEAGLReplayControllerSupport)initWithCaptureStore:(id)a3;
- (id)createDebugPlaybackEngineWithCaptureStore:(id)a3;
- (id)createOverridingPlaybackEngineWithCaptureStore:(id)a3 experiment:(id)a4;
- (id)experimentResultsGeneratorForPlaybackEngine:(id)a3;
- (id)newShaderProfilerWithPlaybackEngine:(id)a3 payload:(id)a4;
- (id)startShaderProfiler:(id)a3;
- (id)viewControllerForPlaybackEngine:(id)a3;
- (void)_setupContextRemapperForPlaybackEngine:(id)a3;
- (void)disableDebugFunctions:(id)a3 playbackEngine:(id)a4;
- (void)enableDebugDrawCallPresent:(BOOL)a3 playbackEngine:(id)a4;
- (void)enableDebugFunctions:(id)a3 playbackEngine:(id)a4;
- (void)enableDebugOutlinePresent:(BOOL)a3 playbackEngine:(id)a4;
- (void)enableDebugWireframePresent:(BOOL)a3 playbackEngine:(id)a4;
- (void)endPlayback;
- (void)generateDependencyGraphThumbnailsWithPlaybackEngine:(id)a3 forMessage:(id)a4 onReady:(id)a5;
- (void)generateThumbnailsWithPlaybackEngine:(id)a3 forMessage:(id)a4 onReady:(id)a5;
- (void)setDebugTessellationWireframeLineWidth:(float)a3 playbackEngine:(id)a4;
- (void)setDebugWireframeLineWidth:(float)a3 playbackEngine:(id)a4;
- (void)setWireframeLineColor:(unsigned int)a3 playbackEngine:(id)a4;
@end

@implementation DYEAGLReplayControllerSupport

- (DYEAGLReplayControllerSupport)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metadataValueForKey:kDYCaptureSessionGraphicsAPIMetadataKey]);
  unsigned int v6 = [v5 unsignedIntValue];

  if (v6)
  {
    v7 = 0LL;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___DYEAGLReplayControllerSupport;
    v7 = -[DYEAGLReplayControllerSupport init](&v9, "init");
    if (v7)
    {
      DYSetNameReservationEncoding(1LL);
      self = v7;
      v7 = self;
    }

    else
    {
      self = 0LL;
    }
  }

  return v7;
}

- (void)enableDebugWireframePresent:(BOOL)a3 playbackEngine:(id)a4
{
}

- (void)setDebugWireframeLineWidth:(float)a3 playbackEngine:(id)a4
{
}

- (void)setDebugTessellationWireframeLineWidth:(float)a3 playbackEngine:(id)a4
{
}

- (void)setWireframeLineColor:(unsigned int)a3 playbackEngine:(id)a4
{
}

- (void)enableDebugDrawCallPresent:(BOOL)a3 playbackEngine:(id)a4
{
}

- (void)enableDebugOutlinePresent:(BOOL)a3 playbackEngine:(id)a4
{
}

- (void)disableDebugFunctions:(id)a3 playbackEngine:(id)a4
{
  id v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 disabledFunctions]);
  [v5 addIndexes:v6];
}

- (void)enableDebugFunctions:(id)a3 playbackEngine:(id)a4
{
  id v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 disabledFunctions]);
  [v5 removeIndexes:v6];
}

- (id)createOverridingPlaybackEngineWithCaptureStore:(id)a3 experiment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[DYGLExperimentResultsGenerator initWithExperiment:]( objc_alloc(&OBJC_CLASS___DYGLExperimentResultsGenerator),  "initWithExperiment:",  v7);
  objc_super v9 = -[DYEAGLOverridingPlaybackEngine initWithCaptureStore:experimentResultsGenerator:]( objc_alloc(&OBJC_CLASS___DYEAGLOverridingPlaybackEngine),  "initWithCaptureStore:experimentResultsGenerator:",  v6,  v8);
  if (!v9) {
    __assert_rtn( "-[DYEAGLReplayControllerSupport createOverridingPlaybackEngineWithCaptureStore:experiment:]",  (const char *)&unk_224DD,  0,  "playbackEngine");
  }
  -[DYEAGLReplayControllerSupport _setupContextRemapperForPlaybackEngine:]( self,  "_setupContextRemapperForPlaybackEngine:",  v9);

  return v9;
}

- (id)createDebugPlaybackEngineWithCaptureStore:(id)a3
{
  id v4 = a3;
  v5 = -[DYEAGLDebugPlaybackEngine initWithCaptureStore:]( objc_alloc(&OBJC_CLASS___DYEAGLDebugPlaybackEngine),  "initWithCaptureStore:",  v4);
  if (!v5) {
    __assert_rtn( "-[DYEAGLReplayControllerSupport createDebugPlaybackEngineWithCaptureStore:]",  (const char *)&unk_224DD,  0,  "playbackEngine");
  }
  -[DYEAGLReplayControllerSupport _setupContextRemapperForPlaybackEngine:]( self,  "_setupContextRemapperForPlaybackEngine:",  v5);

  return v5;
}

- (void)endPlayback
{
}

- (BOOL)isDebugPlaybackEngine:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___DYEAGLDebugPlaybackEngine);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)viewControllerForPlaybackEngine:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue([a3 viewController]);
}

- (id)experimentResultsGeneratorForPlaybackEngine:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___DYEAGLOverridingPlaybackEngine);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 experimentResultsGenerator]);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (void)generateThumbnailsWithPlaybackEngine:(id)a3 forMessage:(id)a4 onReady:(id)a5
{
}

- (void)generateDependencyGraphThumbnailsWithPlaybackEngine:(id)a3 forMessage:(id)a4 onReady:(id)a5
{
}

- (id)newShaderProfilerWithPlaybackEngine:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___DYEAGLDebugPlaybackEngine);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v8 = v5;
    objc_super v9 = -[DYGLShaderProfilerFunctionPlayerSupport initWithDebugEAGLPlaybackEngine:payLoad:]( objc_alloc(&OBJC_CLASS___DYGLShaderProfilerFunctionPlayerSupport),  "initWithDebugEAGLPlaybackEngine:payLoad:",  v8,  v6);
  }

  else
  {
    objc_super v9 = 0LL;
  }

  return v9;
}

- (id)startShaderProfiler:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue([a3 queryShaderStart]);
}

- (void)_setupContextRemapperForPlaybackEngine:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_13940;
  v5[3] = &unk_247E8;
  id v6 = a3;
  id v3 = v6;
  DYSetContextRemappingBlock(v5, v4);
}

@end