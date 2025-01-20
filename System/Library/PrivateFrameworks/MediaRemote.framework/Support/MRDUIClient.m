@interface MRDUIClient
- (BOOL)hasGroupSessionLowPowerPlatterAssertion;
- (BOOL)hasGroupSessionNearbyAssertion;
- (BOOL)hasLockScreenAssertion;
- (BOOL)hasNowPlayingActivityAssertion;
- (BOOL)hasQuickControlsAssertion;
- (BOOL)hasRouteRecommendationAssertion;
- (BOOL)hasScreenMirroringAssertion;
- (MRDUIClient)initWithConnection:(id)a3 bundleID:(id)a4;
- (NSArray)routeRecommendationIdentifiers;
- (NSString)bundleID;
- (NSXPCConnection)connection;
- (id)description;
- (id)remoteObjectProxy;
- (void)dealloc;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)routeRecommendationDismissed;
- (void)setHasGroupSessionLowPowerPlatterAssertion:(BOOL)a3;
- (void)setHasGroupSessionNearbyAssertion:(BOOL)a3;
- (void)setHasLockScreenAssertion:(BOOL)a3;
- (void)setHasNowPlayingActivityAssertion:(BOOL)a3;
- (void)setHasQuickControlsAssertion:(BOOL)a3;
- (void)setHasRouteRecommendationAssertion:(BOOL)a3;
- (void)setHasScreenMirroringAssertion:(BOOL)a3;
- (void)setRouteRecommendationIdentifiers:(id)a3;
@end

@implementation MRDUIClient

- (MRDUIClient)initWithConnection:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDUIClient;
  v9 = -[MRDUIClient init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_bundleID, a4);
  }

  return v10;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p bundleID=%@>",  objc_opt_class(self),  self,  self->_bundleID);
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(11LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1002B8CE0();
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDUIClient;
  -[MRDUIClient dealloc](&v5, "dealloc");
}

- (id)remoteObjectProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)routeRecommendationDismissed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIClient remoteObjectProxy](self, "remoteObjectProxy"));
  [v2 routeRecommendationDismissed];
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIClient remoteObjectProxy](self, "remoteObjectProxy"));
  [v5 nearbyGroupSessionDismissed:v4];
}

- (BOOL)hasLockScreenAssertion
{
  return self->_hasLockScreenAssertion;
}

- (void)setHasLockScreenAssertion:(BOOL)a3
{
  self->_hasLockScreenAssertion = a3;
}

- (BOOL)hasQuickControlsAssertion
{
  return self->_hasQuickControlsAssertion;
}

- (void)setHasQuickControlsAssertion:(BOOL)a3
{
  self->_hasQuickControlsAssertion = a3;
}

- (BOOL)hasScreenMirroringAssertion
{
  return self->_hasScreenMirroringAssertion;
}

- (void)setHasScreenMirroringAssertion:(BOOL)a3
{
  self->_hasScreenMirroringAssertion = a3;
}

- (BOOL)hasGroupSessionNearbyAssertion
{
  return self->_hasGroupSessionNearbyAssertion;
}

- (void)setHasGroupSessionNearbyAssertion:(BOOL)a3
{
  self->_hasGroupSessionNearbyAssertion = a3;
}

- (BOOL)hasRouteRecommendationAssertion
{
  return self->_hasRouteRecommendationAssertion;
}

- (void)setHasRouteRecommendationAssertion:(BOOL)a3
{
  self->_hasRouteRecommendationAssertion = a3;
}

- (BOOL)hasNowPlayingActivityAssertion
{
  return self->_hasNowPlayingActivityAssertion;
}

- (void)setHasNowPlayingActivityAssertion:(BOOL)a3
{
  self->_hasNowPlayingActivityAssertion = a3;
}

- (NSArray)routeRecommendationIdentifiers
{
  return self->_routeRecommendationIdentifiers;
}

- (void)setRouteRecommendationIdentifiers:(id)a3
{
}

- (BOOL)hasGroupSessionLowPowerPlatterAssertion
{
  return self->_hasGroupSessionLowPowerPlatterAssertion;
}

- (void)setHasGroupSessionLowPowerPlatterAssertion:(BOOL)a3
{
  self->_hasGroupSessionLowPowerPlatterAssertion = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end