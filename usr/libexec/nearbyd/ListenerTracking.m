@interface ListenerTracking
- (NIConfiguration)configuration;
- (NIServerAccessoryGATTServiceListener)listener;
- (NSUUID)peerIdentifier;
- (void)setConfiguration:(id)a3;
- (void)setListener:(id)a3;
- (void)setPeerIdentifier:(id)a3;
@end

@implementation ListenerTracking

- (NIServerAccessoryGATTServiceListener)listener
{
  return (NIServerAccessoryGATTServiceListener *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)setListener:(id)a3
{
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NIConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end