@interface NRDNSProxyServer
- (id)description;
- (void)cancel;
- (void)start;
@end

@implementation NRDNSProxyServer

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self)
  {
    unint64_t identifier = self->super._identifier;
    uint64_t state = self->super._state;
    if (state >= 5) {
      v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%u)",  state);
    }
    else {
      v6 = *(&off_1001AE400 + self->super._state);
    }
    localIfIndices = self->_localIfIndices;
  }

  else
  {
    unint64_t identifier = 0LL;
    localIfIndices = 0LL;
    v6 = @"Invalid";
  }

  v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"NRDNSProxyServer[%llu, %@, idx:%@]",  identifier,  v6,  localIfIndices);

  return v8;
}

- (void)start
{
  if (self)
  {
    if (!self->super._started)
    {
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___NRDNSProxyServer;
      -[NRDNSProxy start](&v10, "start");
      if (self->super._state - 1 >= 2)
      {
        if (self->super._dnsProtocol)
        {
          v4 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
          int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 17LL);

          if (IsLevelEnabled)
          {
            v6 = self->super._nrUUID;
            v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
            int dnsProtocol = self->super._dnsProtocol;

            _NRLogWithArgs(v8, 17LL, "unsupported dns protocol %u", dnsProtocol);
          }

          sub_10001B5C8(self, 4);
        }

        else
        {
          sub_10001BBA8((uint64_t)self);
        }
      }
    }
  }

  else
  {
    v10.receiver = 0LL;
    v10.super_class = (Class)&OBJC_CLASS___NRDNSProxyServer;
    -[NRDNSProxy start](&v10, "start");
  }

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRDNSProxyServer;
  -[NRDNSProxy cancel](&v4, "cancel");
  if (self)
  {
    if (self->_do53Proxy)
    {
      mrc_dns_proxy_invalidate();
      do53Proxy = self->_do53Proxy;
      self->_do53Proxy = 0LL;
    }
  }

- (void).cxx_destruct
{
}

@end