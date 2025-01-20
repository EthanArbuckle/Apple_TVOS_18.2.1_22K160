@interface IDSActivityScribeMessage
- (BOOL)highPriority;
- (BOOL)isIDSMessage;
- (BOOL)isWebTunnelMessage;
- (BOOL)wantsAPSRetries;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsIDSProtocolVersion;
- (BOOL)wantsIntegerUniqueIDs;
- (BOOL)wantsResponse;
- (NSArray)tokens;
- (NSData)metadataBlob;
- (NSString)activityTopic;
- (NSString)messageID;
- (NSString)responsePresenceTopic;
- (NSString)subActivity;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)topic;
- (int)responseStatus;
- (int)version;
- (int64_t)command;
- (int64_t)responseCommand;
- (int64_t)ttl;
- (unsigned)activityPolicy;
- (unsigned)pushPriority;
- (void)handleResponseDictionary:(id)a3;
- (void)handleResponseHeaders:(id)a3;
- (void)setActivityPolicy:(unsigned __int8)a3;
- (void)setActivityTopic:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setMetadataBlob:(id)a3;
- (void)setPushPriority:(unsigned __int8)a3;
- (void)setResponsePresenceTopic:(id)a3;
- (void)setResponseStatus:(int)a3;
- (void)setSubActivity:(id)a3;
- (void)setTokens:(id)a3;
- (void)setTtl:(int64_t)a3;
- (void)setVersion:(int)a3;
@end

@implementation IDSActivityScribeMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSActivityScribeMessage;
  id v4 = -[IDSActivityScribeMessage copyWithZone:](&v11, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage tokens](self, "tokens"));
  [v4 setTokens:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage activityTopic](self, "activityTopic"));
  [v4 setActivityTopic:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage subActivity](self, "subActivity"));
  [v4 setSubActivity:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage metadataBlob](self, "metadataBlob"));
  [v4 setMetadataBlob:v8];

  objc_msgSend(v4, "setTtl:", -[IDSActivityScribeMessage ttl](self, "ttl"));
  objc_msgSend(v4, "setPushPriority:", -[IDSActivityScribeMessage pushPriority](self, "pushPriority"));
  objc_msgSend(v4, "setActivityPolicy:", -[IDSActivityScribeMessage activityPolicy](self, "activityPolicy"));
  objc_msgSend(v4, "setVersion:", -[IDSActivityScribeMessage version](self, "version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage messageID](self, "messageID"));
  [v4 setMessageID:v9];

  return v4;
}

- (int64_t)command
{
  return 221LL;
}

- (int64_t)responseCommand
{
  return 222LL;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 0;
}

- (BOOL)isWebTunnelMessage
{
  return 1;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 0;
}

- (BOOL)wantsAPSRetries
{
  return 1;
}

- (BOOL)highPriority
{
  return 1;
}

- (BOOL)isIDSMessage
{
  return 0;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return 1;
}

- (id)topic
{
  return @"com.apple.icloud.presence";
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSActivityScribeMessage;
  id v2 = -[IDSActivityScribeMessage additionalMessageHeaders](&v6, "additionalMessageHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 mutableCopy];

  return v4;
}

- (id)messageBody
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSActivityScribeMessage;
  id v3 = -[IDSActivityScribeMessage messageBody](&v21, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (__CFDictionary *)[v4 mutableCopy];

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage messageID](self, "messageID"));
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage messageID](self, "messageID"));
    v9 = (const char *)[v8 UTF8String];

    if (v9)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v9, uu);
      id v20 = 0LL;
      jw_uuid_to_data(uu, &v20);
      id v10 = v20;
      if (v10)
      {
        CFDictionarySetValue(v5, @"U", v10);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10069AD48();
      }
    }
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[IDSActivityScribeMessage version](self, "version")));
  if (v11)
  {
    CFDictionarySetValue(v5, @"v", v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069ACC8();
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IDSActivityScribeMessage pushPriority](self, "pushPriority")));
  if (v12)
  {
    CFDictionarySetValue(v5, @"pMpr", v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069AC48();
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IDSActivityScribeMessage activityPolicy](self, "activityPolicy")));
  if (v13)
  {
    CFDictionarySetValue(v5, @"pMpo", v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069ABC8();
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage activityTopic](self, "activityTopic"));
  if (v14)
  {
    CFDictionarySetValue(v5, @"pAt", v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069AB48();
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage subActivity](self, "subActivity"));
  if (v15)
  {
    CFDictionarySetValue(v5, @"pSa", v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069AAC8();
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSActivityScribeMessage ttl](self, "ttl")));
  if (v16)
  {
    CFDictionarySetValue(v5, @"pTtl", v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069AA48();
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage tokens](self, "tokens"));
  if (v17) {
    CFDictionarySetValue(v5, @"pSt", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityScribeMessage metadataBlob](self, "metadataBlob"));
  if (v18) {
    CFDictionarySetValue(v5, @"pAM", v18);
  }

  return v5;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"pAT"]);
  -[IDSActivityScribeMessage setResponsePresenceTopic:](self, "setResponsePresenceTopic:", v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"s"]);
  -[IDSActivityScribeMessage setResponseStatus:](self, "setResponseStatus:", [v6 intValue]);
}

- (void)handleResponseHeaders:(id)a3
{
  id v3 = a3;
  uint64_t v4 = OSLogHandleForIDSCategory("WebTunnel");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Web Tunnel Message Completed With Respone Headers %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6) && _IDSShouldLog(0LL, @"WebTunnel")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"WebTunnel",  @"Web Tunnel Message Completed With Respone Headers %@");
  }
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSString)activityTopic
{
  return self->_activityTopic;
}

- (void)setActivityTopic:(id)a3
{
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (void)setSubActivity:(id)a3
{
}

- (NSData)metadataBlob
{
  return self->_metadataBlob;
}

- (void)setMetadataBlob:(id)a3
{
}

- (unsigned)pushPriority
{
  return self->_pushPriority;
}

- (void)setPushPriority:(unsigned __int8)a3
{
  self->_pushPriority = a3;
}

- (unsigned)activityPolicy
{
  return self->_activityPolicy;
}

- (void)setActivityPolicy:(unsigned __int8)a3
{
  self->_activityPolicy = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (int64_t)ttl
{
  return self->_ttl;
}

- (void)setTtl:(int64_t)a3
{
  self->_ttl = a3;
}

- (NSString)responsePresenceTopic
{
  return self->_responsePresenceTopic;
}

- (void)setResponsePresenceTopic:(id)a3
{
}

- (int)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(int)a3
{
  self->_responseStatus = a3;
}

- (void).cxx_destruct
{
}

@end