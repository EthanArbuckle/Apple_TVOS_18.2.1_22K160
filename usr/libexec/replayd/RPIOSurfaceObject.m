@interface RPIOSurfaceObject
+ (BOOL)supportsSecureCoding;
- (RPIOSurfaceObject)initWithCoder:(id)a3;
- (__IOSurface)ioSurface;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIOSurface:(__IOSurface *)a3;
@end

@implementation RPIOSurfaceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
  {
    ioSurface = self->_ioSurface;
    if (ioSurface)
    {
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(ioSurface);
      [v7 encodeXPCObject:XPCObject forKey:@"ioSurface"];
    }
  }
}

- (RPIOSurfaceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPIOSurfaceObject;
  v5 = -[RPIOSurfaceObject init](&v12, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeXPCObjectForKey:@"ioSurface"]);
      v8 = v7;
      if (v7)
      {
        IOSurfaceRef v9 = IOSurfaceLookupFromXPCObject(v7);
        -[RPIOSurfaceObject setIOSurface:](v5, "setIOSurface:", v9);
        CFRelease(v9);
      }
    }

    v10 = v5;
  }

  return v5;
}

- (void)setIOSurface:(__IOSurface *)a3
{
  ioSurface = self->_ioSurface;
  if (ioSurface != a3)
  {
    if (ioSurface) {
      CFRelease(ioSurface);
    }
    self->_ioSurface = a3;
    if (a3) {
      CFRetain(a3);
    }
  }

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)dealloc
{
  ioSurface = self->_ioSurface;
  if (ioSurface) {
    CFRelease(ioSurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPIOSurfaceObject;
  -[RPIOSurfaceObject dealloc](&v4, "dealloc");
}

@end