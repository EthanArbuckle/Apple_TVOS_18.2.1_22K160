@interface SDActivityPayloadReplyRecord
- (NSString)deviceIdentifier;
- (NSUUID)activityIdentifier;
- (NSUUID)messageIdentifier;
- (NSUUID)requestIdentifier;
- (id)description;
- (void)setActivityIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation SDActivityPayloadReplyRecord

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadReplyRecord messageIdentifier](self, "messageIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadReplyRecord requestIdentifier](self, "requestIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadReplyRecord activityIdentifier](self, "activityIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadReplyRecord deviceIdentifier](self, "deviceIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, messageIdentifier:%@, requestIdentifier:%@, activityIdentifier:%@, deviceIdentifier:%@>",  v5,  self,  v7,  v9,  v11,  v12));

  return v13;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSUUID)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end