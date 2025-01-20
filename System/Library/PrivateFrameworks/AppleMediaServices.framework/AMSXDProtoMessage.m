@interface AMSXDProtoMessage
- (BOOL)hasLogKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageData;
- (NSString)logKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMessageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMSXDProtoMessage

- (BOOL)hasLogKey
{
  return self->_logKey != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AMSXDProtoMessage;
  id v3 = -[AMSXDProtoMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSXDProtoMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  messageData = self->_messageData;
  if (messageData) {
    [v3 setObject:messageData forKey:@"messageData"];
  }
  logKey = self->_logKey;
  if (logKey) {
    [v4 setObject:logKey forKey:@"logKey"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100047C64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_messageData) {
    sub_100097B70();
  }
  id v6 = v4;
  PBDataWriterWriteDataField();
  logKey = self->_logKey;
  if (logKey) {
    PBDataWriterWriteStringField(v6, logKey, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setMessageData:self->_messageData];
  if (self->_logKey) {
    objc_msgSend(v4, "setLogKey:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_logKey, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((messageData = self->_messageData, !((unint64_t)messageData | v4[2]))
     || -[NSData isEqual:](messageData, "isEqual:")))
  {
    logKey = self->_logKey;
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
  unint64_t v3 = (unint64_t)-[NSData hash](self->_messageData, "hash");
  return -[NSString hash](self->_logKey, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[2])
  {
    -[AMSXDProtoMessage setMessageData:](self, "setMessageData:");
    id v4 = v5;
  }

  if (v4[1])
  {
    -[AMSXDProtoMessage setLogKey:](self, "setLogKey:");
    id v4 = v5;
  }
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end