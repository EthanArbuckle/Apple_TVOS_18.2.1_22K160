@interface NRDEphemeralDevice
- (id)description;
@end

@implementation NRDEphemeralDevice

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self)
  {
    v4 = self->super._nrUUID;
    connection = self->super._connection;
  }

  else
  {
    v4 = 0LL;
    connection = 0LL;
  }

  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[NRDEphemeralDevices:%@,%@]", v4, connection);

  return v6;
}

@end