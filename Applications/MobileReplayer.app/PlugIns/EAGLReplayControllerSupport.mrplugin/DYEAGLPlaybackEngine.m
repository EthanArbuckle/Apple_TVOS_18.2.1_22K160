@interface DYEAGLPlaybackEngine
- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4;
- (id)newFunctionPlayer;
- (id)newLayer;
- (void)setProperties:(id)a3 forLayer:(id)a4;
@end

@implementation DYEAGLPlaybackEngine

- (id)newFunctionPlayer
{
  v3 = objc_alloc(&OBJC_CLASS___DYEAGLFunctionPlayer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLPlaybackEngine captureStore](self, "captureStore"));
  v5 = -[DYEAGLFunctionPlayer initWithCaptureStore:](v3, "initWithCaptureStore:", v4);

  -[DYEAGLFunctionPlayer setLayerManager:](v5, "setLayerManager:", self);
  return v5;
}

- (id)newLayer
{
  return (id)objc_opt_new(&OBJC_CLASS___CAEAGLLayer, a2);
}

- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a4 drawableProperties]);
  unsigned __int8 v7 = [v6 isEqualToDictionary:v5];

  return v7;
}

- (void)setProperties:(id)a3 forLayer:(id)a4
{
}

@end