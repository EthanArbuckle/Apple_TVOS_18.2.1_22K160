@interface PDSharingRelayServerUpdateMailboxRequest
- (NSString)notificationToken;
- (NSString)notificationTopic;
- (PDSharingMailboxPayload)payload;
- (id)_urlRequest;
- (void)setNotificationToken:(id)a3;
- (void)setNotificationTopic:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation PDSharingRelayServerUpdateMailboxRequest

- (id)_urlRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _murlMailboxRequestWithAdditionalEndpointComponents:]( self,  "_murlMailboxRequestWithAdditionalEndpointComponents:",  0LL));
  [v3 setHTTPMethod:@"PUT"];
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingMailboxPayload dictionaryRepresentation](self->_payload, "dictionaryRepresentation"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, @"payload");

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _notificationTokenDictFromToken:topic:]( self,  "_notificationTokenDictFromToken:topic:",  self->_notificationToken,  self->_notificationTopic));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v6,  @"notificationToken");

  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_HTTPBodyWithDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setHTTPBody:v9];

  return v3;
}

- (PDSharingMailboxPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (NSString)notificationTopic
{
  return self->_notificationTopic;
}

- (void)setNotificationTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end