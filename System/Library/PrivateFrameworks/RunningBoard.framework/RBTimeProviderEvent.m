@interface RBTimeProviderEvent
+ (id)eventWithSource:(id)a3;
- (id)_initWithSource:(id)a3;
- (void)cancel;
@end

@implementation RBTimeProviderEvent

- (id)_initWithSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBTimeProviderEvent;
  v6 = -[RBTimeProviderEvent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)eventWithSource:(id)a3
{
  id v3 = a3;
  id v4 = -[RBTimeProviderEvent _initWithSource:](objc_alloc(&OBJC_CLASS___RBTimeProviderEvent), "_initWithSource:", v3);

  return v4;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end