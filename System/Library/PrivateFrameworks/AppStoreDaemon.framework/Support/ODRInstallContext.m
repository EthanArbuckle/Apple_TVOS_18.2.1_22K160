@interface ODRInstallContext
- (ODRInstallContext)init;
@end

@implementation ODRInstallContext

- (ODRInstallContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ODRInstallContext;
  v2 = -[ODRInstallContext init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    logKey = v2->_logKey;
    v2->_logKey = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end