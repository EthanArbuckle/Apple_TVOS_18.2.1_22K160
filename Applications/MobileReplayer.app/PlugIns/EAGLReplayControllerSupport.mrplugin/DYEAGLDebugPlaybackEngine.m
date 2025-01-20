@interface DYEAGLDebugPlaybackEngine
- (BOOL)enableDrawCallPresent;
- (BOOL)enableOutlinePresent;
- (BOOL)enableWireframePresent;
- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3;
- (DYEAGLDebugPlaybackEngine)initWithCaptureStore:(id)a3;
- (DYEAGLDebugPlaybackEngineDelegate)delegate;
- (DYEAGLDebugPlaybackEngineDelegate)strongDelegate;
- (NSMutableIndexSet)disabledFunctions;
- (float)tessellationWireframeLineWidth;
- (float)wireframeLineWidth;
- (id)newFunctionPlayer;
- (id)playbackOptions;
- (unsigned)executedDrawCallCount;
- (unsigned)playbackMode;
- (unsigned)wireframeLineColor;
- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3;
- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableDrawCallPresent:(BOOL)a3;
- (void)setEnableOutlinePresent:(BOOL)a3;
- (void)setEnableWireframePresent:(BOOL)a3;
- (void)setExecutedDrawCallCount:(unsigned int)a3;
- (void)setPlaybackMode:(unsigned int)a3;
- (void)setTessellationWireframeLineWidth:(float)a3;
- (void)setWireframeLineColor:(unsigned int)a3;
- (void)setWireframeLineWidth:(float)a3;
@end

@implementation DYEAGLDebugPlaybackEngine

- (DYEAGLDebugPlaybackEngine)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DYEAGLDebugPlaybackEngine;
  v6 = -[DYEAGLDebugPlaybackEngine initWithCaptureStore:](&v13, "initWithCaptureStore:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableIndexSet, v5);
    disabledFunctions = v6->_disabledFunctions;
    v6->_disabledFunctions = (NSMutableIndexSet *)v7;

    LODWORD(v9) = 1.0;
    -[DYEAGLDebugPlaybackEngine setWireframeLineWidth:](v6, "setWireframeLineWidth:", v9);
    LODWORD(v10) = 1.0;
    -[DYEAGLDebugPlaybackEngine setTessellationWireframeLineWidth:](v6, "setTessellationWireframeLineWidth:", v10);
    -[DYEAGLDebugPlaybackEngine setWireframeLineColor:](v6, "setWireframeLineColor:", 16711935LL);
    v6->_enableDrawCallPresent = 1;
    -[DYEAGLDebugPlaybackEngine setEnableWireframePresent:](v6, "setEnableWireframePresent:", 1LL);
    v11 = v6;
  }

  return v6;
}

- (id)playbackOptions
{
  return 0LL;
}

- (DYEAGLDebugPlaybackEngineDelegate)strongDelegate
{
  return (DYEAGLDebugPlaybackEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)newFunctionPlayer
{
  v3 = objc_alloc(&OBJC_CLASS___DYEAGLDebugFunctionPlayer);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine captureStore](self, "captureStore"));
  uint64_t v5 = -[DYEAGLDebugFunctionPlayer initWithCaptureStore:](v3, "initWithCaptureStore:", v4);

  -[DYEAGLFunctionPlayer setLayerManager:](v5, "setLayerManager:", self);
  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  char v5 = objc_opt_respondsToSelector(v6, "performPlaybackLoopIterationPreCaptureActions:");

  if ((v5 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    [v7 performPlaybackLoopIterationPreCaptureActions:v3];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    [v8 shouldReturn];
  }

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  char v5 = objc_opt_respondsToSelector(v6, "performPlaybackLoopIterationPostCaptureActions:");

  if ((v5 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    [v7 performPlaybackLoopIterationPostCaptureActions:v3];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
    [v8 shouldReturn];
  }

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  char v6 = objc_opt_respondsToSelector(v5, "shouldPerformPlaybackLoopIteration:");

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  unsigned __int8 v8 = [v7 shouldPerformPlaybackLoopIteration:v3];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugPlaybackEngine strongDelegate](self, "strongDelegate"));
  unsigned __int8 v10 = [v9 shouldReturn];

  if ((v10 & 1) == 0) {
    return 1;
  }
  return v8;
}

- (NSMutableIndexSet)disabledFunctions
{
  return self->_disabledFunctions;
}

- (BOOL)enableDrawCallPresent
{
  return self->_enableDrawCallPresent;
}

- (void)setEnableDrawCallPresent:(BOOL)a3
{
  self->_enableDrawCallPresent = a3;
}

- (DYEAGLDebugPlaybackEngineDelegate)delegate
{
  return (DYEAGLDebugPlaybackEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unsigned)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(unsigned int)a3
{
  self->_playbackMode = a3;
}

- (unsigned)executedDrawCallCount
{
  return self->_executedDrawCallCount;
}

- (void)setExecutedDrawCallCount:(unsigned int)a3
{
  self->_executedDrawCallCount = a3;
}

- (unsigned)wireframeLineColor
{
  return self->_wireframeLineColor;
}

- (void)setWireframeLineColor:(unsigned int)a3
{
  self->_wireframeLineColor = a3;
}

- (float)wireframeLineWidth
{
  return self->_wireframeLineWidth;
}

- (void)setWireframeLineWidth:(float)a3
{
  self->_wireframeLineWidth = a3;
}

- (float)tessellationWireframeLineWidth
{
  return self->_tessellationWireframeLineWidth;
}

- (void)setTessellationWireframeLineWidth:(float)a3
{
  self->_tessellationWireframeLineWidth = a3;
}

- (BOOL)enableWireframePresent
{
  return self->_enableWireframePresent;
}

- (void)setEnableWireframePresent:(BOOL)a3
{
  self->_enableWireframePresent = a3;
}

- (BOOL)enableOutlinePresent
{
  return self->_enableOutlinePresent;
}

- (void)setEnableOutlinePresent:(BOOL)a3
{
  self->_enableOutlinePresent = a3;
}

- (void).cxx_destruct
{
}

@end