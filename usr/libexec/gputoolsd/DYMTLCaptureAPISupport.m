@interface DYMTLCaptureAPISupport
- (DYMTLCaptureAPISupport)initWithAPI:(unsigned int)a3;
- (id)diagnosticsDylibPath;
- (id)diagnosticsTransportEnvironmentVariable;
- (id)graphicsAPIInfo;
- (id)interposeDylibPath;
- (id)transportEnvironmentVariable;
@end

@implementation DYMTLCaptureAPISupport

- (DYMTLCaptureAPISupport)initWithAPI:(unsigned int)a3
{
  if (a3 == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DYMTLCaptureAPISupport;
    self = -[DYMTLCaptureAPISupport init](&v5, "init");
    v3 = self;
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)interposeDylibPath
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DYGetMTLInterposeDylibPath(self, a2));
}

- (id)diagnosticsDylibPath
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DYGetMTLDiagnosticsDylibPath(self, a2));
}

- (id)graphicsAPIInfo
{
  id v2 = MTLCreateSystemDefaultDevice();
  if (v2)
  {
    id v3 = [[DYMTLDeviceProfile alloc] initWithDevice:v2];
    id v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (id)transportEnvironmentVariable
{
  return @"GT_HOST_URL_MTL";
}

- (id)diagnosticsTransportEnvironmentVariable
{
  return @"GT_HOST_URL_MTL_DIAGNOSTICS";
}

@end