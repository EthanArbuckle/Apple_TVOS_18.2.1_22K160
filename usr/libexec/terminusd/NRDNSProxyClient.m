@interface NRDNSProxyClient
- (id)description;
- (void)cancel;
- (void)start;
@end

@implementation NRDNSProxyClient

- (void)start
{
  if (!self)
  {
    v47.receiver = 0LL;
    v47.super_class = (Class)&OBJC_CLASS___NRDNSProxyClient;
    -[NRDNSProxy start](&v47, "start");
    return;
  }

  if (!self->super._started)
  {
    v47.receiver = self;
    v47.super_class = (Class)&OBJC_CLASS___NRDNSProxyClient;
    id v3 = -[NRDNSProxy start](&v47, "start");
    int dnsProtocol = self->super._dnsProtocol;
    if (dnsProtocol != 1)
    {
      if (!dnsProtocol)
      {
        v6 = self;
        int v7 = 2;
LABEL_16:
        sub_10001B5C8(v6, v7);
        return;
      }

      goto LABEL_13;
    }

    if (!self->super._isDiscoveryProxy)
    {
LABEL_13:
      v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v18, 17LL);

      if (IsLevelEnabled)
      {
        v20 = self->super._nrUUID;
        v22 = (void *)_NRCopyLogObjectForNRUUID(v20, v21);
        int v23 = self->super._dnsProtocol;

        _NRLogWithArgs(v22, 17LL, "unsupported dns protocol %u", v23);
      }

- (id)description
{
  if (self)
  {
    if (self->super._isDiscoveryProxy) {
      id v3 = "NRDiscoveryProxyClient";
    }
    else {
      id v3 = "NRDNSProxyClient";
    }
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
    unint64_t identifier = self->super._identifier;
    uint64_t state = self->super._state;
    int v7 = @"Invalid";
    switch((int)state)
    {
      case 0:
        break;
      case 1:
        int v7 = @"Preparing";
        break;
      case 2:
        int v7 = @"Ready";
        break;
      case 3:
        int v7 = @"Restarting";
        break;
      case 4:
        int v7 = @"Failed";
        break;
      default:
        int v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%u)",  state);
        break;
    }
  }

  else
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
    unint64_t identifier = 0LL;
    int v7 = @"Invalid";
    id v3 = "NRDNSProxyClient";
  }

  uint64_t v8 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%s[%llu, %@]", v3, identifier, v7);

  return v8;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRDNSProxyClient;
  -[NRDNSProxy cancel](&v4, "cancel");
  if (self)
  {
    if (self->_discoveryProxyClient)
    {
      mrc_discovery_proxy_invalidate();
      discoveryProxyClient = self->_discoveryProxyClient;
      self->_discoveryProxyClient = 0LL;
    }
  }

- (void).cxx_destruct
{
}

@end