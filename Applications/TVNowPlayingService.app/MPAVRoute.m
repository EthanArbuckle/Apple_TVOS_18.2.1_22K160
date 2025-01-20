@interface MPAVRoute
- (BOOL)tvnp_shouldShowRoute;
- (unint64_t)tvnp_deviceType;
@end

@implementation MPAVRoute

- (BOOL)tvnp_shouldShowRoute
{
  id v9 = -[MPAVRoute routeType](self, "routeType");
  BOOL v4 = 1;
  if (v9)
  {
    BOOL v4 = 1;
    if (v9 != (id)1) {
      BOOL v4 = v9 == (id)3;
    }
  }

  char v7 = 0;
  char v5 = 0;
  BOOL v3 = 0;
  if (v4)
  {
    id v8 = -[MPAVRoute avRouteDescription](self, "avRouteDescription");
    char v7 = 1;
    id v6 = [v8 objectForKeyedSubscript:kMRMediaRemoteRouteIsLocalDeviceRouteKey];
    char v5 = 1;
    BOOL v3 = ([v6 BOOLValue] & 1) == 0;
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  return v3;
  }
}

- (unint64_t)tvnp_deviceType
{
  unint64_t v3 = 0LL;
  if ((-[MPAVRoute isAppleTVRoute](self, "isAppleTVRoute") & 1) != 0
    || (-[MPAVRoute isDeviceRoute](self, "isDeviceRoute") & 1) != 0
    || -[MPAVRoute routeSubtype](self, "routeSubtype") == (id)10)
  {
    return 1LL;
  }

  if (-[MPAVRoute routeSubtype](self, "routeSubtype") == (id)16) {
    return 11LL;
  }
  return v3;
}

@end