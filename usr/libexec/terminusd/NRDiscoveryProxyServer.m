@interface NRDiscoveryProxyServer
- (id)description;
- (void)cancel;
- (void)start;
@end

@implementation NRDiscoveryProxyServer

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self)
  {
    unint64_t identifier = self->super._identifier;
    uint64_t state = self->super._state;
    v6 = @"Invalid";
    switch((int)state)
    {
      case 0:
        break;
      case 1:
        v6 = @"Preparing";
        break;
      case 2:
        v6 = @"Ready";
        break;
      case 3:
        v6 = @"Restarting";
        break;
      case 4:
        v6 = @"Failed";
        break;
      default:
        v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%u)",  state);
        break;
    }
  }

  else
  {
    unint64_t identifier = 0LL;
    v6 = @"Invalid";
  }

  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"NRDiscoveryProxyServer[%llu, %@]", identifier, v6);

  return v7;
}

- (void)start
{
  if (self)
  {
    if (!self->super._started)
    {
      v3.receiver = self;
      v3.super_class = (Class)&OBJC_CLASS___NRDiscoveryProxyServer;
      -[NRDNSProxy start](&v3, "start");
      if (self->super._state - 1 >= 2)
      {
        self->_certificateUpdateNotifyToken = -1;
        sub_10001C4AC((uint64_t)self);
      }
    }
  }

  else
  {
    v3.receiver = 0LL;
    v3.super_class = (Class)&OBJC_CLASS___NRDiscoveryProxyServer;
    -[NRDNSProxy start](&v3, "start");
  }

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NRDiscoveryProxyServer;
  -[NRDNSProxy cancel](&v8, "cancel");
  if (self)
  {
    int certificateUpdateNotifyToken = self->_certificateUpdateNotifyToken;
    if (certificateUpdateNotifyToken != -1)
    {
      notify_cancel(certificateUpdateNotifyToken);
      self->_int certificateUpdateNotifyToken = -1;
    }

    if (self->_discoveryProxyRef)
    {
      advertising_proxy_ref_dealloc();
      v4 = (void *)qword_1001DC6B8;
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  self->_discoveryProxyRef));
      [v4 setObject:0 forKeyedSubscript:v5];

      self->_discoveryProxyRef = 0LL;
    }

    certificateFetcherSource = self->_certificateFetcherSource;
    if (certificateFetcherSource)
    {
      dispatch_source_cancel((dispatch_source_t)certificateFetcherSource);
      v7 = self->_certificateFetcherSource;
      self->_certificateFetcherSource = 0LL;
    }
  }

  else
  {
    notify_cancel(0);
  }

- (void).cxx_destruct
{
}

@end