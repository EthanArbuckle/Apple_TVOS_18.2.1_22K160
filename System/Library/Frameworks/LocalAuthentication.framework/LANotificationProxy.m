@interface LANotificationProxy
- (LANotificationObserverXPC)target;
- (LANotificationProxy)initWithTarget:(id)a3;
- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5;
@end

@implementation LANotificationProxy

- (LANotificationProxy)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LANotificationProxy;
  v5 = -[LANotificationProxy init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_target, v4);
  }

  return v6;
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[LANotificationProxy target](self, "target");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 newValue:v10 oldValue:v9 completionHandler:v8];
}

- (LANotificationObserverXPC)target
{
  return (LANotificationObserverXPC *)objc_loadWeakRetained((id *)&self->_target);
}

- (void).cxx_destruct
{
}

@end