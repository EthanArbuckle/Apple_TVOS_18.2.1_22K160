@interface FTiMessageRequestMMCSFileRefreshToken
- (FTiMessageRequestMMCSFileRefreshToken)init;
- (NSData)responseContentBody;
- (NSData)signature;
- (NSNumber)failReason;
- (NSNumber)fileLength;
- (NSNumber)requestContentVersion;
- (NSNumber)responseCode;
- (NSNumber)responseContentVersion;
- (NSString)authURL;
- (NSString)owner;
- (NSString)requestContentHeaders;
- (NSString)responseContentHeaders;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthURL:(id)a3;
- (void)setFailReason:(id)a3;
- (void)setFileLength:(id)a3;
- (void)setOwner:(id)a3;
- (void)setRequestContentHeaders:(id)a3;
- (void)setRequestContentVersion:(id)a3;
- (void)setResponseCode:(id)a3;
- (void)setResponseContentBody:(id)a3;
- (void)setResponseContentHeaders:(id)a3;
- (void)setResponseContentVersion:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation FTiMessageRequestMMCSFileRefreshToken

- (FTiMessageRequestMMCSFileRefreshToken)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FTiMessageRequestMMCSFileRefreshToken;
  v2 = -[FTiMessageRequestMMCSFileRefreshToken init](&v5, "init");
  if (v2)
  {
    id v4 = 0LL;
    IMGetiMessageSettings(0LL, 0LL, &v4, 0LL, 0LL);
    -[FTiMessageRequestMMCSFileRefreshToken setTopic:](v2, "setTopic:", [v4 lastObject]);
    -[FTiMessageRequestMMCSFileRefreshToken setWantsResponse:](v2, "setWantsResponse:", 1LL);
    v2->_requestContentVersion = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FTiMessageRequestMMCSFileRefreshToken;
  id v4 = -[FTiMessageRequestMMCSFileRefreshToken copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setOwner:", -[FTiMessageRequestMMCSFileRefreshToken owner](self, "owner"));
  objc_msgSend(v4, "setSignature:", -[FTiMessageRequestMMCSFileRefreshToken signature](self, "signature"));
  objc_msgSend(v4, "setFileLength:", -[FTiMessageRequestMMCSFileRefreshToken fileLength](self, "fileLength"));
  objc_msgSend(v4, "setAuthURL:", -[FTiMessageRequestMMCSFileRefreshToken authURL](self, "authURL"));
  objc_msgSend( v4,  "setRequestContentVersion:",  -[FTiMessageRequestMMCSFileRefreshToken requestContentVersion](self, "requestContentVersion"));
  objc_msgSend( v4,  "setRequestContentHeaders:",  -[FTiMessageRequestMMCSFileRefreshToken requestContentHeaders](self, "requestContentHeaders"));
  objc_msgSend( v4,  "setResponseContentVersion:",  -[FTiMessageRequestMMCSFileRefreshToken responseContentVersion](self, "responseContentVersion"));
  objc_msgSend( v4,  "setResponseContentHeaders:",  -[FTiMessageRequestMMCSFileRefreshToken responseContentHeaders](self, "responseContentHeaders"));
  objc_msgSend( v4,  "setResponseContentBody:",  -[FTiMessageRequestMMCSFileRefreshToken responseContentBody](self, "responseContentBody"));
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FTiMessageRequestMMCSFileRefreshToken;
  -[FTiMessageRequestMMCSFileRefreshToken dealloc](&v3, "dealloc");
}

- (int64_t)command
{
  return 152LL;
}

- (int64_t)responseCommand
{
  return 152LL;
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"mU");
  -[NSMutableArray addObject:](v2, "addObject:", @"mS");
  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FTiMessageRequestMMCSFileRefreshToken;
  objc_super v3 = (__CFDictionary *)objc_msgSend( -[FTiMessageRequestMMCSFileRefreshToken messageBody](&v10, "messageBody"),  "mutableCopy");
  id v4 = -[FTiMessageRequestMMCSFileRefreshToken owner](self, "owner");
  if (v4)
  {
    CFDictionarySetValue(v3, @"mU", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_9024C();
  }

  objc_super v5 = -[FTiMessageRequestMMCSFileRefreshToken signature](self, "signature");
  if (v5)
  {
    CFDictionarySetValue(v3, @"mS", v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_901CC();
  }

  objc_super v6 = -[FTiMessageRequestMMCSFileRefreshToken authURL](self, "authURL");
  if (v6)
  {
    CFDictionarySetValue(v3, @"mR", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_9014C();
  }

  CFDictionarySetValue(v3, @"mL", &off_DB5D0);
  v7 = -[FTiMessageRequestMMCSFileRefreshToken requestContentVersion](self, "requestContentVersion");
  if (v7)
  {
    CFDictionarySetValue(v3, @"cV", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_900CC();
  }

  v8 = -[FTiMessageRequestMMCSFileRefreshToken requestContentHeaders](self, "requestContentHeaders");
  if (v8)
  {
    CFDictionarySetValue(v3, @"cH", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_9004C();
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSNumber)fileLength
{
  return self->_fileLength;
}

- (void)setFileLength:(id)a3
{
}

- (NSString)requestContentHeaders
{
  return self->_requestContentHeaders;
}

- (void)setRequestContentHeaders:(id)a3
{
}

- (NSNumber)requestContentVersion
{
  return self->_requestContentVersion;
}

- (void)setRequestContentVersion:(id)a3
{
}

- (NSString)responseContentHeaders
{
  return self->_responseContentHeaders;
}

- (void)setResponseContentHeaders:(id)a3
{
}

- (NSData)responseContentBody
{
  return self->_responseContentBody;
}

- (void)setResponseContentBody:(id)a3
{
}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
}

- (NSNumber)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(id)a3
{
}

- (NSNumber)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(id)a3
{
}

- (NSNumber)responseContentVersion
{
  return self->_responseContentVersion;
}

- (void)setResponseContentVersion:(id)a3
{
}

@end