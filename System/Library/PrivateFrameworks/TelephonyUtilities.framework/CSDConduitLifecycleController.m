@interface CSDConduitLifecycleController
- (BOOL)shouldKeepConduitAlive;
- (CSDConduitLifecycleController)initWithConversationManager:(id)a3 delegate:(id)a4;
- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery;
- (TUConduitLifecycleControllerDelegate)delegate;
- (TUConversationManager)conversationManager;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CSDConduitLifecycleController

- (CSDConduitLifecycleController)initWithConversationManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSDConduitLifecycleController;
  v9 = -[CSDConduitLifecycleController init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversationManager, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDiscovery);
    remoteDisplayDiscovery = v10->_remoteDisplayDiscovery;
    v10->_remoteDisplayDiscovery = v11;

    -[RPRemoteDisplayDiscovery activateWithCompletion:]( v10->_remoteDisplayDiscovery,  "activateWithCompletion:",  &stru_1003DA458);
    objc_initWeak(&location, v10);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10010BB34;
    v15[3] = &unk_1003DA480;
    objc_copyWeak(&v16, &location);
    -[RPRemoteDisplayDiscovery setDiscoverySessionStateChangedHandler:]( v10->_remoteDisplayDiscovery,  "setDiscoverySessionStateChangedHandler:",  v15);
    v13 = v10;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDConduitLifecycleController;
  -[CSDConduitLifecycleController dealloc](&v3, "dealloc");
}

- (BOOL)shouldKeepConduitAlive
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationManager activeConversations](self->_conversationManager, "activeConversations"));
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = -[RPRemoteDisplayDiscovery currentState](self->_remoteDisplayDiscovery, "currentState") == 1;
  }

  return v4;
}

- (TUConduitLifecycleControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery
{
  return self->_remoteDisplayDiscovery;
}

- (void).cxx_destruct
{
}

@end