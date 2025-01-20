@interface MRDRapportRemoteControlServiceConnection
+ (BOOL)supportsSecureCoding;
- (MRDRapportRemoteControlServiceConnection)initWithCoder:(id)a3;
- (MRRapportTransportConnection)connection;
- (NSDate)connectionAttemptDate;
- (NSObject)notificationToken;
- (NSString)destinationGroupUID;
- (NSString)destinationOutputDeviceUID;
- (NSString)name;
- (NSString)sessionUID;
- (NSString)sourceUID;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionAttemptDate:(id)a3;
- (void)setDestinationGroupUID:(id)a3;
- (void)setDestinationOutputDeviceUID:(id)a3;
- (void)setName:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setSessionUID:(id)a3;
- (void)setSourceUID:(id)a3;
@end

@implementation MRDRapportRemoteControlServiceConnection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sourceUID = self->_sourceUID;
  id v5 = a3;
  [v5 encodeObject:sourceUID forKey:@"source"];
  [v5 encodeObject:self->_sessionUID forKey:@"session"];
  [v5 encodeObject:self->_destinationOutputDeviceUID forKey:@"destination"];
  [v5 encodeObject:self->_connectionAttemptDate forKey:@"date"];
}

- (MRDRapportRemoteControlServiceConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MRDRapportRemoteControlServiceConnection);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"source"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 copy];
  -[MRDRapportRemoteControlServiceConnection setSourceUID:](v5, "setSourceUID:", v8);

  id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"destination"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 copy];
  -[MRDRapportRemoteControlServiceConnection setDestinationOutputDeviceUID:](v5, "setDestinationOutputDeviceUID:", v11);

  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"session"];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  -[MRDRapportRemoteControlServiceConnection setSessionUID:](v5, "setSessionUID:", v13);
  return v5;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"source=%@(%@) session=%@",  self->_sourceUID,  self->_name,  self->_sessionUID);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRapportRemoteControlServiceConnection notificationToken](self, "notificationToken"));
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDRapportRemoteControlServiceConnection;
  -[MRDRapportRemoteControlServiceConnection dealloc](&v5, "dealloc");
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
}

- (NSString)destinationGroupUID
{
  return self->_destinationGroupUID;
}

- (void)setDestinationGroupUID:(id)a3
{
}

- (NSString)sourceUID
{
  return self->_sourceUID;
}

- (void)setSourceUID:(id)a3
{
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (void)setSessionUID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (MRRapportTransportConnection)connection
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