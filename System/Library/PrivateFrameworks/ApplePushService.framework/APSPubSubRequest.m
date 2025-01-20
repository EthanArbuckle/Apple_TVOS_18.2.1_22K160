@interface APSPubSubRequest
- (APSPubSubRequest)initWithMetadata:(id)a3 messageID:(id)a4 userName:(id)a5 token:(id)a6 subscriptionType:(int)a7 connectionType:(int64_t)a8 retryCount:(unint64_t)a9;
- (APSPubSubRequest)initWithSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 messageID:(id)a5 userName:(id)a6 token:(id)a7 subscriptionType:(int)a8 connectionType:(int64_t)a9 retryCount:(unint64_t)a10;
- (BOOL)isEqual:(id)a3;
- (NSArray)subscriptionChannels;
- (NSArray)unsubscriptionChannels;
- (NSData)metadata;
- (NSData)token;
- (NSNumber)messageID;
- (NSString)userName;
- (OS_dispatch_source)timeoutSource;
- (id)description;
- (int)subscriptionType;
- (int64_t)connectionType;
- (unint64_t)retryCount;
- (void)setConnectionType:(int64_t)a3;
- (void)setMessageID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSubscriptionType:(int)a3;
- (void)setTimeoutSource:(id)a3;
- (void)setToken:(id)a3;
- (void)setUserName:(id)a3;
@end

@implementation APSPubSubRequest

- (APSPubSubRequest)initWithSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 messageID:(id)a5 userName:(id)a6 token:(id)a7 subscriptionType:(int)a8 connectionType:(int64_t)a9 retryCount:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v24 = a5;
  id v23 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___APSPubSubRequest;
  v20 = -[APSPubSubRequest init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_subscriptionChannels, a3);
    objc_storeStrong((id *)&v21->_unsubscriptionChannels, a4);
    objc_storeStrong((id *)&v21->_messageID, a5);
    objc_storeStrong((id *)&v21->_userName, a6);
    objc_storeStrong((id *)&v21->_token, a7);
    v21->_subscriptionType = a8;
    v21->_connectionType = a9;
    v21->_retryCount = a10;
  }

  return v21;
}

- (APSPubSubRequest)initWithMetadata:(id)a3 messageID:(id)a4 userName:(id)a5 token:(id)a6 subscriptionType:(int)a7 connectionType:(int64_t)a8 retryCount:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v22 = a5;
  id v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___APSPubSubRequest;
  id v19 = -[APSPubSubRequest init](&v23, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_metadata, a3);
    objc_storeStrong((id *)&v20->_messageID, a4);
    objc_storeStrong((id *)&v20->_userName, a5);
    objc_storeStrong((id *)&v20->_token, a6);
    v20->_subscriptionType = a7;
    v20->_connectionType = a8;
    v20->_retryCount = a9;
  }

  return v20;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest messageID](self, "messageID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<APSPubsubRequest %p: %@>",  self,  v3));

  return v4;
}

- (NSData)metadata
{
  metadata = self->_metadata;
  if (metadata) {
    return metadata;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest subscriptionChannels](self, "subscriptionChannels"));
  if ([v5 count])
  {
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest unsubscriptionChannels](self, "unsubscriptionChannels"));
    id v7 = [v6 count];

    if (!v7) {
      return (NSData *)0LL;
    }
  }

  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courierOversized](&OBJC_CLASS___APSLog, "courierOversized"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = sub_100005B48(-[APSPubSubRequest connectionType](self, "connectionType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest subscriptionChannels](self, "subscriptionChannels"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest unsubscriptionChannels](self, "unsubscriptionChannels"));
    int v17 = 138413058;
    id v18 = self;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending pubsub request %@ on interface %@ with subscription channels: %@ unsubscription channels: %@",  (uint8_t *)&v17,  0x2Au);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest subscriptionChannels](self, "subscriptionChannels"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest unsubscriptionChannels](self, "unsubscriptionChannels"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[PSChannelSubscriptionsRequestPayload createPayloadForSubscriptionChannels:unsubscriptionChannels:subscriptionType:]( &OBJC_CLASS___PSChannelSubscriptionsRequestPayload,  "createPayloadForSubscriptionChannels:unsubscriptionChannels:subscriptionType:",  v13,  v14,  -[APSPubSubRequest subscriptionType](self, "subscriptionType")));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 data]);

  return (NSData *)v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 messageID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest messageID](self, "messageID"));
    if (v8 == v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 subscriptionChannels]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest subscriptionChannels](self, "subscriptionChannels"));
      if ([v11 isEqual:v12])
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v7 unsubscriptionChannels]);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest unsubscriptionChannels](self, "unsubscriptionChannels"));
        unsigned __int8 v10 = [v13 isEqual:v14];
      }

      else
      {
        unsigned __int8 v10 = 0;
      }
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (NSArray)subscriptionChannels
{
  return self->_subscriptionChannels;
}

- (NSArray)unsubscriptionChannels
{
  return self->_unsubscriptionChannels;
}

- (NSNumber)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setMetadata:(id)a3
{
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end