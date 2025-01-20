@interface PDSharingRelayServerCreateMailboxRequest
- (NSString)accessRights;
- (NSString)notificationToken;
- (NSString)notificationTopic;
- (PDSharingMailboxPayload)payload;
- (PKSharingMessageDisplayInformation)displayInformation;
- (id)_urlRequest;
- (unint64_t)timeToLive;
- (void)setAccessRights:(id)a3;
- (void)setDisplayInformation:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setNotificationTopic:(id)a3;
- (void)setPayload:(id)a3;
- (void)setTimeToLive:(unint64_t)a3;
@end

@implementation PDSharingRelayServerCreateMailboxRequest

- (id)_urlRequest
{
  uint64_t v21 = PKSharingRelayServerMailboxURI;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _murlRequestWithEndpointComponents:]( self,  "_murlRequestWithEndpointComponents:",  v3));

  [v4 setHTTPMethod:@"POST"];
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingMailboxPayload dictionaryRepresentation](self->_payload, "dictionaryRepresentation"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"payload");

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _notificationTokenDictFromToken:topic:]( self,  "_notificationTokenDictFromToken:topic:",  self->_notificationToken,  self->_notificationTopic));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"notificationToken");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKSharingMessageDisplayInformation openGraphURL](self->_displayInformation, "openGraphURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v9,  @"displayInformationUrl");

  if (self->_accessRights) {
    accessRights = (const __CFString *)self->_accessRights;
  }
  else {
    accessRights = @"RD";
  }
  v19[0] = @"accessRights";
  v19[1] = @"expiration";
  v20[0] = accessRights;
  v11 = -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  (double)self->_timeToLive,  @"accessRights",  @"expiration",  accessRights);
  uint64_t v12 = RFC3339DateStringFromDateInUTCWithIntegralSeconds();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v20[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v14,  @"mailboxConfiguration");

  id v16 = objc_msgSend((id)objc_opt_class(self, v15), "_HTTPBodyWithDictionary:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v4 setHTTPBody:v17];

  return v4;
}

- (PDSharingMailboxPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (PKSharingMessageDisplayInformation)displayInformation
{
  return self->_displayInformation;
}

- (void)setDisplayInformation:(id)a3
{
}

- (NSString)accessRights
{
  return self->_accessRights;
}

- (void)setAccessRights:(id)a3
{
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(unint64_t)a3
{
  self->_timeToLive = a3;
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