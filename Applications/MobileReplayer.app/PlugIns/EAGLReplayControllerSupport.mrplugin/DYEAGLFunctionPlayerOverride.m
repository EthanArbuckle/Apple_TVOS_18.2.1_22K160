@interface DYEAGLFunctionPlayerOverride
- (DYEAGLFunctionPlayerOverride)init;
- (DYEAGLFunctionPlayerOverride)initWithFunctionPlayer:(id)a3 overrideKey:(id)a4;
- (DYGLFunctionPlayer)strongFunctionPlayer;
- (void)dealloc;
- (void)onPlatformFunctionEnd;
@end

@implementation DYEAGLFunctionPlayerOverride

- (DYGLFunctionPlayer)strongFunctionPlayer
{
  return (DYGLFunctionPlayer *)objc_loadWeakRetained((id *)&self->_functionPlayer);
}

- (DYEAGLFunctionPlayerOverride)init
{
  return 0LL;
}

- (DYEAGLFunctionPlayerOverride)initWithFunctionPlayer:(id)a3 overrideKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DYEAGLFunctionPlayerOverride;
  v8 = -[DYEAGLFunctionPlayerOverride init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_functionPlayer, v6);
    objc_storeStrong((id *)&v9->_overrideKey, a4);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYEAGLFunctionPlayerOverride;
  -[DYEAGLFunctionPlayerOverride dealloc](&v3, "dealloc");
}

- (void)onPlatformFunctionEnd
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
  if (*(_DWORD *)[v3 function] != -8188)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    if (*(_DWORD *)[v4 function] != -8192)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
      int v8 = *(_DWORD *)[v7 function];

      if (v8 != -8191) {
        return;
      }
      goto LABEL_5;
    }
  }

LABEL_5:
  if (-[NSString isEqualToString:]( self->_overrideKey,  "isEqualToString:",  kDYFunctionPlayerOverrideDisableColorWritesKey))
  {
    int v11 = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
    [v6 setParameter:602 to:&v11];
  }

  else if (-[NSString isEqualToString:](self->_overrideKey, "isEqualToString:", kDYFunctionPlayerOverrideDisableAllKey))
  {
    int v10 = 3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
    [v6 setParameter:602 to:&v10];
  }

  else
  {
    if (!-[NSString isEqualToString:]( self->_overrideKey,  "isEqualToString:",  kDYFunctionPlayerOverrideDisableRenderingKey)) {
      return;
    }
    int v9 = 2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
    [v6 setParameter:602 to:&v9];
  }
}

- (void).cxx_destruct
{
}

@end