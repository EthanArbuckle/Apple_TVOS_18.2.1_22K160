@interface DYEAGLOverridingFunctionPlayer
- (void)executeGraphicsFunction;
- (void)executePlatformFunction;
- (void)performNewFrameActions;
- (void)performPostDispatchFrameBoundaryActions;
- (void)setEngine:(id)a3;
@end

@implementation DYEAGLOverridingFunctionPlayer

- (void)setEngine:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer setEngine:](&v7, "setEngine:", v4);
  v5 = (DYGLExperimentResultsGenerator *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] experimentResultsGenerator]);
  experimentResultsGenerator = self->_experimentResultsGenerator;
  self->_experimentResultsGenerator = v5;
}

- (void)executeGraphicsFunction
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer executeGraphicsFunction](&v3, "executeGraphicsFunction");
  -[DYGLExperimentResultsGenerator onGraphicsFunctionEnd](self->_experimentResultsGenerator, "onGraphicsFunctionEnd");
}

- (void)executePlatformFunction
{
  uint64_t v3 = *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  if (*(_DWORD *)v3 == -12271)
  {
    DYHarvestRenderbuffer( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__ctxID],  **(unsigned int **)(v3 + 72));
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___DYEAGLOverridingFunctionPlayer;
    -[DYEAGLFunctionPlayer executePlatformFunction](&v4, "executePlatformFunction");
  }

  -[DYGLExperimentResultsGenerator onPlatformFunctionEnd](self->_experimentResultsGenerator, "onPlatformFunctionEnd");
}

- (void)performNewFrameActions
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer performNewFrameActions](&v3, "performNewFrameActions");
  -[DYGLExperimentResultsGenerator onFrameStart](self->_experimentResultsGenerator, "onFrameStart");
}

- (void)performPostDispatchFrameBoundaryActions
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYEAGLOverridingFunctionPlayer;
  -[DYEAGLOverridingFunctionPlayer performPostDispatchFrameBoundaryActions]( &v3,  "performPostDispatchFrameBoundaryActions");
}

- (void).cxx_destruct
{
}

@end