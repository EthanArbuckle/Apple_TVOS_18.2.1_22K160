@interface DYEAGLCaptureAPISupport
- (DYEAGLCaptureAPISupport)initWithAPI:(unsigned int)a3;
- (id)_createContextInfo:(unint64_t)a3;
- (id)diagnosticsDylibPath;
- (id)diagnosticsTransportEnvironmentVariable;
- (id)graphicsAPIInfo;
- (id)interposeDylibPath;
- (id)transportEnvironmentVariable;
@end

@implementation DYEAGLCaptureAPISupport

- (DYEAGLCaptureAPISupport)initWithAPI:(unsigned int)a3
{
  if (a3)
  {
    v3 = 0LL;
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DYEAGLCaptureAPISupport;
    self = -[DYEAGLCaptureAPISupport init](&v5, "init");
    v3 = self;
  }

  return v3;
}

- (id)interposeDylibPath
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DYGetGLInterposeDylibPath(self, a2));
}

- (id)diagnosticsDylibPath
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DYGetMTLDiagnosticsDylibPath(self, a2));
}

- (id)_createContextInfo:(unint64_t)a3
{
  v4 = -[EAGLContext initWithAPI:](objc_alloc(&OBJC_CLASS___EAGLContext), "initWithAPI:", a3);
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = GLIContextFromEAGLContext(v4);
    if (!v6) {
      __assert_rtn("-[DYEAGLCaptureAPISupport _createContextInfo:]", ", 0, "gli_ctx"");
    }
    uint64_t v7 = GLCFrontDispatch(v5);
    if (!v7) {
      __assert_rtn("-[DYEAGLCaptureAPISupport _createContextInfo:]", ", 0, "dispatch"");
    }
    if (a3 == 2) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = 1;
    }
    if (a3 == 3) {
      uint64_t v9 = 4LL;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[DYRendererInfo rendererInfoWithGLIContext:dispatch:api:]( &OBJC_CLASS___DYRendererInfo,  "rendererInfoWithGLIContext:dispatch:api:",  v6,  v7,  v9));
    v11 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v10, 0LL);
    id v12 = objc_alloc(&OBJC_CLASS___DYContextInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EAGLContext sharegroup](v5, "sharegroup"));
    id v14 = [v12 initWithIdentifier:v5 sharegroupIdentifier:v13 renderers:v11 currentRendererIndex:0 api:v9];
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (id)graphicsAPIInfo
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLCaptureAPISupport _createContextInfo:](self, "_createContextInfo:", 1LL));
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLCaptureAPISupport _createContextInfo:](self, "_createContextInfo:", 2LL));

  if (v5) {
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLCaptureAPISupport _createContextInfo:](self, "_createContextInfo:", 3LL));

  if (v6) {
    -[NSMutableArray addObject:](v3, "addObject:", v6);
  }

  return v3;
}

- (id)transportEnvironmentVariable
{
  return @"GT_HOST_URL_GL";
}

- (id)diagnosticsTransportEnvironmentVariable
{
  return @"GT_HOST_GL_DIAGNOSTICS";
}

@end