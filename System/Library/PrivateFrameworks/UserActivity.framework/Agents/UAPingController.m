@interface UAPingController
- (BOOL)active;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (UAPingClient)client;
- (UAPingController)initWithManager:(id)a3 name:(id)a4;
- (UAPingNotifier)notifier;
@end

@implementation UAPingController

- (UAPingController)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UAPingController;
  v7 = -[UACornerActionManagerHandler initWithManager:name:](&v17, "initWithManager:name:", v6, a4);
  if (v7)
  {
    v8 = -[UAPingNotifier initWithManager:](objc_alloc(&OBJC_CLASS___UAPingNotifier), "initWithManager:", v6);
    notifier = v7->_notifier;
    v7->_notifier = v8;

    v10 = -[UAPingClient initWithController:](objc_alloc(&OBJC_CLASS___UAPingClient), "initWithController:", v7);
    client = v7->_client;
    v7->_client = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v7, "manager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController notifier](v7, "notifier"));
    [v12 addActivityNotifier:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v7, "manager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController client](v7, "client"));
    [v14 addClient:v15];
  }

  return v7;
}

- (BOOL)active
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController client](self, "client"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 items]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)resume
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController notifier](self, "notifier"));
  [v3 resume];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController client](self, "client"));
  [v4 resume];

  return 1;
}

- (BOOL)suspend
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController notifier](self, "notifier"));
  [v3 suspend];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController client](self, "client"));
  [v4 suspend];

  return 1;
}

- (BOOL)terminate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController notifier](self, "notifier"));
  [v3 terminate];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingController client](self, "client"));
  [v4 terminate];

  return 1;
}

- (UAPingClient)client
{
  return (UAPingClient *)objc_getProperty(self, a2, 48LL, 1);
}

- (UAPingNotifier)notifier
{
  return (UAPingNotifier *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end