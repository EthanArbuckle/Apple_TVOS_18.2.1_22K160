@interface XDCDevice
- (id)description;
@end

@implementation XDCDevice

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRDevice pairingID](self->_device, "pairingID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<XDCDevice: %p pairingID = %@>",  self,  v3));

  return v4;
}

- (void).cxx_destruct
{
}

@end