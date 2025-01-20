@interface MRDIDSRemoteControlServiceRemoteControlChannel
- (MRExternalDeviceTransportConnection)transport;
- (NSDate)connectionAttemptDate;
- (NSObject)notificationToken;
- (NSString)destination;
- (NSString)session;
- (id)debugDescription;
- (void)setConnectionAttemptDate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setSession:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation MRDIDSRemoteControlServiceRemoteControlChannel

- (id)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  destination = %@\n", self->_destination);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  session = %@\n", self->_session);
  connectionAttemptDate = self->_connectionAttemptDate;
  -[NSDate timeIntervalSinceNow](connectionAttemptDate, "timeIntervalSinceNow");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  connectionAttemptDate = %@ (%lf seconds ago)\n",  connectionAttemptDate,  v5);
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(self->_transport);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  transport = %@\n", v7);

  -[NSMutableString appendString:](v3, "appendString:", @"}>");
  return v3;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSString)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (MRExternalDeviceTransportConnection)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (NSDate)connectionAttemptDate
{
  return self->_connectionAttemptDate;
}

- (void)setConnectionAttemptDate:(id)a3
{
}

- (NSObject)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end