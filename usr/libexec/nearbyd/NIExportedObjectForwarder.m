@interface NIExportedObjectForwarder
- (Class)exportedObjectClass;
- (NIExportedObjectForwarder)initWithExportedObject:(id)a3;
- (id)exportedObject;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)setExportedObject:(id)a3;
- (void)setExportedObjectClass:(Class)a3;
@end

@implementation NIExportedObjectForwarder

- (NIExportedObjectForwarder)initWithExportedObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"NIServerConnection.m", 163, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIExportedObjectForwarder;
  v6 = -[NIExportedObjectForwarder init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    -[NIExportedObjectForwarder setExportedObject:](v6, "setExportedObject:", v5);
    -[NIExportedObjectForwarder setExportedObjectClass:](v7, "setExportedObjectClass:", objc_opt_class(v5, v8));
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return -[NIExportedObjectForwarder exportedObject](self, "exportedObject", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return -[objc_class instanceMethodSignatureForSelector:]( -[NIExportedObjectForwarder exportedObjectClass](self, "exportedObjectClass"),  "instanceMethodSignatureForSelector:",  a3);
}

- (id)exportedObject
{
  return objc_loadWeakRetained(&self->_exportedObject);
}

- (void)setExportedObject:(id)a3
{
}

- (Class)exportedObjectClass
{
  return self->_exportedObjectClass;
}

- (void)setExportedObjectClass:(Class)a3
{
}

- (void).cxx_destruct
{
}

@end