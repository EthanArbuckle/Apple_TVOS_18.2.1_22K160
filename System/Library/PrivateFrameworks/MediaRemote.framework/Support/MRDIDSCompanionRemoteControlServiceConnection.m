@interface MRDIDSCompanionRemoteControlServiceConnection
- (MRExternalDeviceTransportConnection)connection;
- (NSDate)connectionAttemptDate;
- (NSObject)notificationToken;
- (NSString)destination;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setConnectionAttemptDate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setNotificationToken:(id)a3;
@end

@implementation MRDIDSCompanionRemoteControlServiceConnection

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSCompanionRemoteControlServiceConnection notificationToken](self, "notificationToken"));
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDIDSCompanionRemoteControlServiceConnection;
  -[MRDIDSCompanionRemoteControlServiceConnection dealloc](&v5, "dealloc");
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
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