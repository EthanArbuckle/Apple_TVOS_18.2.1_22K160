@interface PDSharingRelayServerEndpoint
- (BOOL)doesRemoteMailboxExist;
- (BOOL)doesRemoteMailboxSupportPushNotifications;
- (BOOL)hasOutstandingMessages;
- (NSData)payloadEncryptionPassword;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)description;
- (NSString)deviceClaim;
- (NSString)transportIdentifier;
- (NSURL)relayServerHost;
- (PDSharingRelayServerEndpoint)init;
- (PDSharingRelayServerEndpoint)initWithMailboxIdentifier:(id)a3 provisioningType:(unint64_t)a4;
- (PDSharingRelayServerEndpoint)initWithProvisioningType:(unint64_t)a3;
- (unint64_t)channelType;
- (unint64_t)mailboxStatus;
- (unint64_t)pollingBackoffCounter;
- (unint64_t)provisioningType;
- (unint64_t)timeToLive;
- (void)rollTransportIdentifer;
- (void)setChannelType:(unint64_t)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDeviceClaim:(id)a3;
- (void)setDoesRemoteMailboxSupportPushNotifications:(BOOL)a3;
- (void)setHasOutstandingMessages:(BOOL)a3;
- (void)setMailboxStatus:(unint64_t)a3;
- (void)setPayloadEncryptionPassword:(id)a3;
- (void)setPollingBackoffCounter:(unint64_t)a3;
- (void)setProvisioningType:(unint64_t)a3;
- (void)setRelayServerHost:(id)a3;
- (void)setTimeToLive:(unint64_t)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PDSharingRelayServerEndpoint

- (PDSharingRelayServerEndpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerEndpoint;
  return -[PDSharingRelayServerEndpoint init](&v3, "init");
}

- (PDSharingRelayServerEndpoint)initWithProvisioningType:(unint64_t)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"-" withString:&stru_100662310]);

  v8 = -[PDSharingRelayServerEndpoint initWithMailboxIdentifier:provisioningType:]( self,  "initWithMailboxIdentifier:provisioningType:",  v7,  a3);
  return v8;
}

- (PDSharingRelayServerEndpoint)initWithMailboxIdentifier:(id)a3 provisioningType:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerEndpoint;
  v8 = -[PDSharingRelayServerEndpoint init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transportIdentifier, a3);
    v9->_channelType = 1LL;
    v9->_provisioningType = a4;
    v9->_mailboxStatus = 0LL;
    v10 = objc_alloc_init(&OBJC_CLASS___NSDate);
    createdAt = v9->_createdAt;
    v9->_createdAt = v10;

    if (a4 <= 2) {
      v9->_timeToLive = qword_1004D6A20[a4];
    }
  }

  return v9;
}

- (BOOL)doesRemoteMailboxExist
{
  return self->_mailboxStatus - 2 < 3;
}

- (void)rollTransportIdentifer
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v3, "UUIDString"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"-" withString:&stru_100662310]);

  transportIdentifier = self->_transportIdentifier;
  self->_transportIdentifier = v5;
}

- (void)setCreatedAt:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_createdAt, a3);
  updatedAt = self->_updatedAt;
  p_updatedAt = &self->_updatedAt;
  if (!updatedAt) {
    objc_storeStrong((id *)p_updatedAt, a3);
  }
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSString)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (self->_mailboxStatus == 1)
  {
    [v4 appendFormat:@"mailboxIdentifier: '%@'; ", @"TBD"];
  }

  else
  {
    uint64_t v6 = PKSharingLoggableMailboxAddress(self->_transportIdentifier);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 appendFormat:@"mailboxIdentifier: '%@'; ", v7];
  }

  unint64_t provisioningType = self->_provisioningType;
  v9 = @"unknown";
  v10 = @"stateful";
  if (provisioningType != 2) {
    v10 = @"unknown";
  }
  if (provisioningType == 1) {
    v11 = @"stateless";
  }
  else {
    v11 = v10;
  }
  [v5 appendFormat:@"provisioningType: '%@'; ", v11];
  unint64_t v12 = self->_channelType - 1;
  if (v12 <= 2) {
    v9 = *(&off_100645C58 + v12);
  }
  [v5 appendFormat:@"channelType: '%@'; ", v9];
  unint64_t v13 = self->_mailboxStatus - 1;
  if (v13 > 3) {
    v14 = @"unknown";
  }
  else {
    v14 = *(&off_100645C70 + v13);
  }
  [v5 appendFormat:@"mailboxStatus: '%@'; ", v14];
  [v5 appendFormat:@"deviceClaim: '%@'; ", self->_deviceClaim];
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSData base64EncodedStringWithOptions:]( self->_payloadEncryptionPassword,  "base64EncodedStringWithOptions:",  0LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 substringToIndex:6]);
  [v5 appendFormat:@"encryptionPassword: '%@..'; ", v16];

  if (self->_hasOutstandingMessages) {
    v17 = @"Yes";
  }
  else {
    v17 = @"No";
  }
  [v5 appendFormat:@"hasOutstandingMessages: '%@..'; ", v17];
  objc_msgSend(v5, "appendFormat:", @"timeToLive: '%lu'; ", self->_timeToLive);
  [v5 appendFormat:@"createdAt: '%@'; ", self->_createdAt];
  [v5 appendFormat:@"updatedAt: '%@'; ", self->_updatedAt];
  [v5 appendFormat:@"relayServerHost: '%@'; ", self->_relayServerHost];
  if (self->_provisioningType == 2)
  {
    if (self->_doesRemoteMailboxSupportPushNotifications) {
      v18 = @"Y";
    }
    else {
      v18 = @"N";
    }
    [v5 appendFormat:@"supportsPushNotifications: '%@'; ", v18];
    objc_msgSend(v5, "appendFormat:", @"pollingBackoffCounter: '%lu'; ", self->_pollingBackoffCounter);
  }

  [v5 appendFormat:@">"];
  id v19 = [v5 copy];

  return (NSString *)v19;
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (unint64_t)provisioningType
{
  return self->_provisioningType;
}

- (void)setProvisioningType:(unint64_t)a3
{
  self->_unint64_t provisioningType = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(unint64_t)a3
{
  self->_timeToLive = a3;
}

- (unint64_t)mailboxStatus
{
  return self->_mailboxStatus;
}

- (void)setMailboxStatus:(unint64_t)a3
{
  self->_mailboxStatus = a3;
}

- (BOOL)doesRemoteMailboxSupportPushNotifications
{
  return self->_doesRemoteMailboxSupportPushNotifications;
}

- (void)setDoesRemoteMailboxSupportPushNotifications:(BOOL)a3
{
  self->_doesRemoteMailboxSupportPushNotifications = a3;
}

- (unint64_t)pollingBackoffCounter
{
  return self->_pollingBackoffCounter;
}

- (void)setPollingBackoffCounter:(unint64_t)a3
{
  self->_pollingBackoffCounter = a3;
}

- (NSData)payloadEncryptionPassword
{
  return self->_payloadEncryptionPassword;
}

- (void)setPayloadEncryptionPassword:(id)a3
{
}

- (NSString)deviceClaim
{
  return self->_deviceClaim;
}

- (void)setDeviceClaim:(id)a3
{
}

- (BOOL)hasOutstandingMessages
{
  return self->_hasOutstandingMessages;
}

- (void)setHasOutstandingMessages:(BOOL)a3
{
  self->_hasOutstandingMessages = a3;
}

- (NSURL)relayServerHost
{
  return self->_relayServerHost;
}

- (void)setRelayServerHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end