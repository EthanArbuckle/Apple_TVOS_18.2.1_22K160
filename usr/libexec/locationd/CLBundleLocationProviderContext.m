@interface CLBundleLocationProviderContext
- (BOOL)isValid;
- (CLBundleLocationProviderContext)initWithBundleLocationProvider:(void *)a3 inSilo:(id)a4;
- (CLSilo)silo;
- (void)dealloc;
- (void)invalidate;
- (void)provider;
@end

@implementation CLBundleLocationProviderContext

- (CLBundleLocationProviderContext)initWithBundleLocationProvider:(void *)a3 inSilo:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBundleLocationProviderContext;
  v6 = -[CLBundleLocationProviderContext init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_provider = a3;
    v6->_silo = (CLSilo *)a4;
    id v8 = a4;
  }

  return v7;
}

- (void)dealloc
{
  self->_provider = 0LL;
  self->_silo = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBundleLocationProviderContext;
  -[CLBundleLocationProviderContext dealloc](&v3, "dealloc");
}

- (BOOL)isValid
{
  return self->_provider != 0LL;
}

- (void)provider
{
  return self->_provider;
}

- (void)invalidate
{
  self->_provider = 0LL;
}

- (CLSilo)silo
{
  return self->_silo;
}

@end