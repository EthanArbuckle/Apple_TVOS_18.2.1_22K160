@interface IDSCryptionContext
- (BOOL)isEqual:(id)a3;
- (IDSCryptionContext)initWithGuid:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 service:(id)a8;
- (IDSPushToken)receivingPushToken;
- (IDSPushToken)sendingPushToken;
- (IDSURI)receivingURI;
- (IDSURI)sendingURI;
- (NSData)authenticatedData;
- (NSString)guid;
- (NSString)service;
- (id)description;
- (int64_t)messageType;
- (void)setMessageType:(int64_t)a3;
@end

@implementation IDSCryptionContext

- (IDSCryptionContext)initWithGuid:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 service:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IDSCryptionContext;
  v18 = -[IDSCryptionContext init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_guid, a3);
    objc_storeStrong((id *)&v19->_sendingURI, a4);
    objc_storeStrong((id *)&v19->_sendingPushToken, a5);
    objc_storeStrong((id *)&v19->_receivingURI, a6);
    objc_storeStrong((id *)&v19->_receivingPushToken, a7);
    objc_storeStrong((id *)&v19->_service, a8);
  }

  return v19;
}

- (NSData)authenticatedData
{
  return -[NSString dataUsingEncoding:](self->_service, "dataUsingEncoding:", 4LL);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5 && (uint64_t v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    id v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext guid](self, "guid"));
    if ([v8 isEqualToString:v9])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sendingURI]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext sendingURI](self, "sendingURI"));
      if ([v10 isEqual:v11])
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 sendingPushToken]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext sendingPushToken](self, "sendingPushToken"));
        if ([v12 isEqual:v13])
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v7 receivingURI]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext receivingURI](self, "receivingURI"));
          id v23 = v14;
          if ([v14 isEqual:v22])
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 receivingPushToken]);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext receivingPushToken](self, "receivingPushToken"));
            id v21 = v15;
            if ([v15 isEqual:v20])
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
              id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext service](self, "service"));
              unsigned __int8 v17 = objc_msgSend(v19, "isEqualToString:");
            }

            else
            {
              unsigned __int8 v17 = 0;
            }
          }

          else
          {
            unsigned __int8 v17 = 0;
          }
        }

        else
        {
          unsigned __int8 v17 = 0;
        }
      }

      else
      {
        unsigned __int8 v17 = 0;
      }
    }

    else
    {
      unsigned __int8 v17 = 0;
    }
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext guid](self, "guid"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext sendingURI](self, "sendingURI"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext sendingPushToken](self, "sendingPushToken"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext receivingURI](self, "receivingURI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext receivingPushToken](self, "receivingPushToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCryptionContext service](self, "service"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p { guid: %@, sendingURI: %@, sendingPushToken: %@, receivingURI: %@, receivingPushToken: %@ service: %@ }>",  v3,  self,  v4,  v5,  v6,  v7,  v8,  v9));

  return v10;
}

- (NSString)guid
{
  return self->_guid;
}

- (IDSURI)sendingURI
{
  return self->_sendingURI;
}

- (IDSPushToken)sendingPushToken
{
  return self->_sendingPushToken;
}

- (IDSURI)receivingURI
{
  return self->_receivingURI;
}

- (IDSPushToken)receivingPushToken
{
  return self->_receivingPushToken;
}

- (NSString)service
{
  return self->_service;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
}

@end