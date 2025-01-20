@interface PBOverlayLayoutService
+ (BOOL)_connection:(id)a3 hasValidEntitlementWithReply:(id)a4;
- (BOOL)_hasInvalidEntitlementWithReply:(id)a3;
- (BOOL)_hasValidEntitlement;
- (BOOL)_hasValidEntitlementWithReply:(id)a3;
- (BSServiceConnectionHost)remoteConnection;
- (PBOverlayLayoutController)controller;
- (PBOverlayLayoutService)initWithRemoteConnection:(id)a3;
- (PBSOverlayLayoutDelegateServiceInterface)serviceClient;
- (void)invalidate;
- (void)layoutController:(id)a3 didUpdateHints:(id)a4 withTransitionContext:(id)a5;
- (void)performBatchUpdate:(id)a3 withTransitionContext:(id)a4 reply:(id)a5;
- (void)setServiceClient:(id)a3;
@end

@implementation PBOverlayLayoutService

- (PBOverlayLayoutService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutService;
  v5 = -[PBOverlayLayoutService init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
    v7 = objc_alloc(&OBJC_CLASS___PBOverlayLayoutController);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteProcess]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    v10 = -[PBOverlayLayoutController initWithName:](v7, "initWithName:", v9);
    controller = v6->_controller;
    v6->_controller = v10;

    -[PBOverlayLayoutController setDelegate:](v6->_controller, "setDelegate:", v6);
  }

  return v6;
}

- (void)invalidate
{
  controller = self->_controller;
  self->_controller = 0LL;
}

- (void)layoutController:(id)a3 didUpdateHints:(id)a4 withTransitionContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (-[PBOverlayLayoutService _hasValidEntitlement](self, "_hasValidEntitlement")) {
    -[PBSOverlayLayoutDelegateServiceInterface overlayLayoutServiceDidUpdateHints:withTransitionContext:]( self->_serviceClient,  "overlayLayoutServiceDidUpdateHints:withTransitionContext:",  v7,  v8);
  }
}

- (void)setServiceClient:(id)a3
{
  id v5 = a3;
  if (-[PBOverlayLayoutService _hasValidEntitlement](self, "_hasValidEntitlement")) {
    objc_storeStrong((id *)&self->_serviceClient, a3);
  }
}

- (void)performBatchUpdate:(id)a3 withTransitionContext:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  if (!-[PBOverlayLayoutService _hasInvalidEntitlementWithReply:](self, "_hasInvalidEntitlementWithReply:", v10))
  {
    if ([v8 count])
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController performBatchUpdate:withTransitionContext:]( self->_controller,  "performBatchUpdate:withTransitionContext:",  v8,  v9));
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }

      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v11 = v11;
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier", (void)v21));
            -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v17, v18);
          }

          id v14 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v14);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v12, "allValues"));
      v10[2](v10, v19, 0LL);

LABEL_14:
      goto LABEL_15;
    }

    if (v10)
    {
      uint64_t v20 = PBSOverlayLayoutServiceErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
      v27 = @"The request was empty.";
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  -102LL,  v11));
      ((void (**)(id, void *, NSMutableDictionary *))v10)[2](v10, 0LL, v12);
      goto LABEL_14;
    }
  }

- (BOOL)_hasValidEntitlement
{
  return -[PBOverlayLayoutService _hasValidEntitlementWithReply:](self, "_hasValidEntitlementWithReply:", 0LL);
}

- (BOOL)_hasInvalidEntitlementWithReply:(id)a3
{
  return !-[PBOverlayLayoutService _hasValidEntitlementWithReply:](self, "_hasValidEntitlementWithReply:", a3);
}

- (BOOL)_hasValidEntitlementWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_class(self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  LOBYTE(v5) = [v5 _connection:WeakRetained hasValidEntitlementWithReply:v4];

  return (char)v5;
}

+ (BOOL)_connection:(id)a3 hasValidEntitlementWithReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
  unsigned __int8 v8 = [v7 hasEntitlement:@"com.apple.appletv.pbs.overlay-layout-service-access"];

  if ((v8 & 1) == 0)
  {
    id v9 = sub_10008330C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002892FC(v5, v10);
    }

    if (v6)
    {
      uint64_t v11 = PBSOverlayLayoutServiceErrorDomain;
      NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
      v16 = @"You do not have the right entitlement(s).";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  -100LL,  v12));
      v6[2](v6, 0LL, v13);
    }
  }

  return v8;
}

- (BSServiceConnectionHost)remoteConnection
{
  return (BSServiceConnectionHost *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (PBSOverlayLayoutDelegateServiceInterface)serviceClient
{
  return self->_serviceClient;
}

- (PBOverlayLayoutController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
}

@end