@interface UMPersonaMachPort
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (UMPersonaMachPort)initWithCoder:(id)a3;
- (id)replacementObjectForCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UMPersonaMachPort

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = self;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___UMPersonaMachPort;
    id v7 = -[UMPersonaMachPort replacementObjectForCoder:](&v10, "replacementObjectForCoder:", v4);
    v6 = (UMPersonaMachPort *)objc_claimAutoreleasedReturnValue(v7);
  }

  v8 = v6;

  return v8;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class(&OBJC_CLASS___UMPersonaMachPort);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (-[UMPersonaMachPort machPort](self, "machPort")
    && -[UMPersonaMachPort machPort](self, "machPort") != -1
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSXPCCoder), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = (void *)xpc_mach_send_create(-[UMPersonaMachPort machPort](self, "machPort"));
    if (v6) {
      [v4 encodeXPCObject:v6 forKey:@"UMPersonaMachPort"];
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___UMPersonaMachPort;
    -[UMPersonaMachPort encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  }
}

- (UMPersonaMachPort)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"UMPersonaMachPort.m", 48, @"Invalid parameter not satisfying: %@", @"[aDecoder isKindOfClass:[NSXPCCoder class]]" object file lineNumber description];
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    && (uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 decodeXPCObjectOfType:&_xpc_type_mach_send forKey:@"UMPersonaMachPort"])) != 0
    && (v9 = (void *)v8, uint64_t v10 = xpc_mach_send_copy_right(), v9, (v10 - 1) <= 0xFFFFFFFD))
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___UMPersonaMachPort;
    v11 = -[UMPersonaMachPort initWithMachPort:options:](&v15, "initWithMachPort:options:", v10, 0LL);
    if (!v11) {
      mach_port_deallocate(mach_task_self_, v10);
    }
  }

  else
  {

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  4864LL,  0LL));
    [v5 failWithError:v12];

    v11 = 0LL;
  }

  return v11;
}

@end