@interface CSDIDSTransport
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransport:(id)a3;
- (CSDIDSTransport)initWithDestination:(id)a3;
- (CSDIDSTransport)initWithSocket:(int)a3;
- (IDSDestination)remoteDestination;
- (IDSDevice)remoteDevice;
- (NSString)destination;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)socket;
- (int)type;
- (unint64_t)hash;
- (unint64_t)initialLinkType;
- (void)setInitialLinkType:(unint64_t)a3;
- (void)setRemoteDestination:(id)a3;
- (void)setRemoteDevice:(id)a3;
@end

@implementation CSDIDSTransport

- (CSDIDSTransport)initWithSocket:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDIDSTransport;
  result = -[CSDIDSTransport init](&v5, "init");
  if (result)
  {
    result->_type = 1;
    result->_socket = a3;
  }

  return result;
}

- (CSDIDSTransport)initWithDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDIDSTransport;
  v6 = -[CSDIDSTransport init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_destination, a3);
    v7->_socket = -1;
  }

  return v7;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p type=%d",  objc_opt_class(self, a2),  self,  -[CSDIDSTransport type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = -[CSDIDSTransport type](self, "type");
  if (v5 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport destination](self, "destination"));
    [v4 appendFormat:@" destination=%@", v6];
  }

  else if (v5 == 1)
  {
    objc_msgSend(v4, "appendFormat:", @" socket=%d", -[CSDIDSTransport socket](self, "socket"));
  }

  objc_msgSend( v4,  "appendFormat:",  @" initialLinkType=%lu",  -[CSDIDSTransport initialLinkType](self, "initialLinkType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDestination](self, "remoteDestination"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDestination](self, "remoteDestination"));
    [v4 appendFormat:@" remoteDestination=%@", v8];
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDevice](self, "remoteDevice"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDevice](self, "remoteDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
    [v4 appendFormat:@" remoteDeviceUniqueIdentifier=%@", v11];
  }

  [v4 appendString:@">"];
  id v12 = [v4 copy];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CSDIDSTransport, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[CSDIDSTransport isEqualToTransport:](self, "isEqualToTransport:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToTransport:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[CSDIDSTransport type](self, "type");
  if (v5 == [v4 type]
    && (unsigned int v6 = -[CSDIDSTransport socket](self, "socket"), v6 == [v4 socket]))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport destination](self, "destination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
    if (TUStringsAreEqualOrNil(v7, v8)
      && (id v9 = -[CSDIDSTransport initialLinkType](self, "initialLinkType"), v9 == [v4 initialLinkType]))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDestination](self, "remoteDestination"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteDestination]);
      if (TUObjectsAreEqualOrNil(v10, v11))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDevice](self, "remoteDevice"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIDOverride]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteDevice]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIDOverride]);
        char v16 = TUStringsAreEqualOrNil(v13, v15);
      }

      else
      {
        char v16 = 0;
      }
    }

    else
    {
      char v16 = 0;
    }
  }

  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unsigned int v3 = -[CSDIDSTransport type](self, "type");
  uint64_t v4 = (int)(-[CSDIDSTransport socket](self, "socket") ^ v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport destination](self, "destination"));
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v6 ^ -[CSDIDSTransport initialLinkType](self, "initialLinkType") ^ v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDestination](self, "remoteDestination"));
  unint64_t v9 = (unint64_t)[v8 hash];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDevice](self, "remoteDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
  unint64_t v12 = v7 ^ v9 ^ (unint64_t)[v11 hash];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = -[CSDIDSTransport type](self, "type");
  if (v5 == 2)
  {
    id v8 = objc_msgSend((id)objc_opt_class(self, v6), "allocWithZone:", a3);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport destination](self, "destination"));
    id v7 = [v8 initWithDestination:v9];
  }

  else if (v5 == 1)
  {
    id v7 = objc_msgSend( objc_msgSend((id)objc_opt_class(self, v6), "allocWithZone:", a3),  "initWithSocket:",  -[CSDIDSTransport socket](self, "socket"));
  }

  else
  {
    id v7 = 0LL;
  }

  objc_msgSend(v7, "setInitialLinkType:", -[CSDIDSTransport initialLinkType](self, "initialLinkType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDestination](self, "remoteDestination"));
  [v7 setRemoteDestination:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSTransport remoteDevice](self, "remoteDevice"));
  [v7 setRemoteDevice:v11];

  return v7;
}

- (int)type
{
  return self->_type;
}

- (int)socket
{
  return self->_socket;
}

- (NSString)destination
{
  return self->_destination;
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (void)setInitialLinkType:(unint64_t)a3
{
  self->_initialLinkType = a3;
}

- (IDSDestination)remoteDestination
{
  return self->_remoteDestination;
}

- (void)setRemoteDestination:(id)a3
{
}

- (IDSDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end