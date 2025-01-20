@interface PRNearbyInteractionService
+ (id)serviceWithQueue:(id)a3;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSArray)machServicesNames;
- (PRNearbyInteractionService)initWithQueue:(id)a3;
@end

@implementation PRNearbyInteractionService

- (PRNearbyInteractionService)initWithQueue:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"PRNearbyInteractionService.mm", 26, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PRNearbyInteractionService;
  v6 = -[PRNearbyInteractionService init](&v12, "init");
  if (v6)
  {
    v7 = -[NIServerSessionManager initWithQueue:]( objc_alloc(&OBJC_CLASS___NIServerSessionManager),  "initWithQueue:",  v5);
    sessionManager = v6->_sessionManager;
    v6->_sessionManager = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  }

  return v6;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3 = a3;
  v4 = -[PRNearbyInteractionService initWithQueue:]( objc_alloc(&OBJC_CLASS___PRNearbyInteractionService),  "initWithQueue:",  v3);

  return v4;
}

- (NSArray)machServicesNames
{
  v3[0] = @"com.apple.nearbyd.xpc.nearbyinteraction";
  v3[1] = @"com.apple.nearbyd.xpc.nearbyinteraction.observer";
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceName]);
  id v6 = [v5 isEqualToString:@"com.apple.nearbyd.xpc.nearbyinteraction.observer"];

  LOBYTE(self) = -[NIServerSessionManager registerSessionWithConnection:observerSession:]( self->_sessionManager,  "registerSessionWithConnection:observerSession:",  v4,  v6);
  return (char)self;
}

- (void).cxx_destruct
{
}

@end