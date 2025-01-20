@interface CBDevice
- (BOOL)needsSetup;
- (NSUUID)deviceIdentifier;
- (NSUUID)pairingAgentDeviceIdentifier;
- (char)channel;
- (unsigned)deviceActionType;
@end

@implementation CBDevice

- (NSUUID)deviceIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
    v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (NSUUID)pairingAgentDeviceIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
    v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (char)channel
{
  return -[CBDevice bleChannel](self, "bleChannel");
}

- (unsigned)deviceActionType
{
  return -[CBDevice nearbyActionType](self, "nearbyActionType");
}

- (BOOL)needsSetup
{
  return 0;
}

@end