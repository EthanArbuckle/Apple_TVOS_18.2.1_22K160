@interface MRAVEndpoint
- (BOOL)hasASmartDevice;
- (BOOL)isRemoteEndpoint;
- (BOOL)shouldDonate;
- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo;
@end

@implementation MRAVEndpoint

- (BOOL)hasASmartDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint outputDevices](self, "outputDevices"));
  unsigned __int8 v3 = objc_msgSend(v2, "mr_any:", &stru_1003A08A8);

  return v3;
}

- (BOOL)isRemoteEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint origin](self, "origin"));
  char v3 = [v2 isLocallyHosted] ^ 1;

  return v3;
}

- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo
{
  v5 = objc_alloc(&OBJC_CLASS___MRDSystemEndpointControllerHelperEndpointInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint outputDevices](self, "outputDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 parentGroupIdentifier]);
  v9 = v8;
  if (!v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint outputDevices](self, "outputDevices"));
    char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 groupID]);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint designatedGroupLeader](self, "designatedGroupLeader"));
  v11 = -[MRDSystemEndpointControllerHelperEndpointInfo initWithParentGroupID:isAirplayActive:]( v5,  "initWithParentGroupID:isAirplayActive:",  v9,  [v10 isAirPlayReceiverSessionActive]);

  if (!v8)
  {
  }

  return v11;
}

- (BOOL)shouldDonate
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint outputDevices](self, "outputDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  BOOL v5 = [v4 deviceType] != 4;

  return v5;
}

@end