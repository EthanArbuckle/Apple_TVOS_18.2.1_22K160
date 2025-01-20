@interface CSDMessagingEncryptedConversationMessage
- (BOOL)hasConversationMessageBytes;
- (BOOL)hasPublicKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)conversationMessageBytes;
- (NSData)publicKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationMessageBytes:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingEncryptedConversationMessage

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0LL;
}

- (BOOL)hasConversationMessageBytes
{
  return self->_conversationMessageBytes != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingEncryptedConversationMessage;
  id v3 = -[CSDMessagingEncryptedConversationMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingEncryptedConversationMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  publicKey = self->_publicKey;
  if (publicKey) {
    [v3 setObject:publicKey forKey:@"publicKey"];
  }
  conversationMessageBytes = self->_conversationMessageBytes;
  if (conversationMessageBytes) {
    [v4 setObject:conversationMessageBytes forKey:@"conversationMessageBytes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000079EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  publicKey = self->_publicKey;
  id v7 = v4;
  if (publicKey)
  {
    PBDataWriterWriteDataField(v4, publicKey, 1LL);
    id v4 = v7;
  }

  conversationMessageBytes = self->_conversationMessageBytes;
  if (conversationMessageBytes)
  {
    PBDataWriterWriteDataField(v7, conversationMessageBytes, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publicKey)
  {
    objc_msgSend(v4, "setPublicKey:");
    id v4 = v5;
  }

  if (self->_conversationMessageBytes)
  {
    objc_msgSend(v5, "setConversationMessageBytes:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_publicKey, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSData copyWithZone:](self->_conversationMessageBytes, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((publicKey = self->_publicKey, !((unint64_t)publicKey | v4[2]))
     || -[NSData isEqual:](publicKey, "isEqual:")))
  {
    conversationMessageBytes = self->_conversationMessageBytes;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_publicKey, "hash");
  return (unint64_t)-[NSData hash](self->_conversationMessageBytes, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[2])
  {
    -[CSDMessagingEncryptedConversationMessage setPublicKey:](self, "setPublicKey:");
    id v4 = v5;
  }

  if (v4[1])
  {
    -[CSDMessagingEncryptedConversationMessage setConversationMessageBytes:](self, "setConversationMessageBytes:");
    id v4 = v5;
  }
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)conversationMessageBytes
{
  return self->_conversationMessageBytes;
}

- (void)setConversationMessageBytes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end