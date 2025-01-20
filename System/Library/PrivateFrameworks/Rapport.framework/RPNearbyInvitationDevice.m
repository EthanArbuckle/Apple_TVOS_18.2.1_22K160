@interface RPNearbyInvitationDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)inBubble;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)wasTriggered;
- (RPNearbyInvitationDevice)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)deviceColor;
- (unsigned)updateWithEndpoint:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInBubble:(BOOL)a3;
- (void)setWasTriggered:(BOOL)a3;
@end

@implementation RPNearbyInvitationDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDevice;
  v5 = -[RPEndpoint initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDevice;
  -[RPEndpoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_deviceColor) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
}

- (id)description
{
  return -[RPNearbyInvitationDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v11 = 0LL;
  -[RPEndpoint identifier](self, "identifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  id v4 = v11;

  uint64_t v10 = -[RPNearbyInvitationDevice deviceColor](self, "deviceColor", v9);
  NSAppendPrintF();
  id v5 = v4;
  v6 = -[RPEndpoint model](self, "model", v10);
  if (v6)
  {
    NSAppendPrintF();
    id v7 = v5;

    id v5 = v7;
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  identifier = self->super._identifier;
  [a3 identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v4);

  return (char)identifier;
}

- (unsigned)updateWithSFDevice:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDevice;
  id v4 = a3;
  unsigned int v5 = -[RPEndpoint updateWithSFDevice:](&v10, sel_updateWithSFDevice_, v4);
  objc_msgSend(v4, "bleDevice", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 advertisementFields];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();

  if (self->_deviceColor != Int64Ranged)
  {
    self->_deviceColor = Int64Ranged;
    v5 |= 2u;
  }

  return v5;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDevice;
  return -[RPEndpoint updateWithEndpoint:](&v4, sel_updateWithEndpoint_, a3);
}

- (unsigned)deviceColor
{
  return self->_deviceColor;
}

- (BOOL)inBubble
{
  return self->_inBubble;
}

- (void)setInBubble:(BOOL)a3
{
  self->_inBubble = a3;
}

- (BOOL)wasTriggered
{
  return self->_wasTriggered;
}

- (void)setWasTriggered:(BOOL)a3
{
  self->_wasTriggered = a3;
}

@end