@interface KCInitialMessageData
- (BOOL)hasPrepareMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)prepareMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrepareMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCInitialMessageData

- (BOOL)hasPrepareMessage
{
  return self->_prepareMessage != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KCInitialMessageData;
  v4 = -[KCInitialMessageData description](&v8, sel_description);
  v5 = -[KCInitialMessageData dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  prepareMessage = self->_prepareMessage;
  if (prepareMessage) {
    [v3 setObject:prepareMessage forKey:@"prepareMessage"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return KCInitialMessageDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_prepareMessage) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  prepareMessage = self->_prepareMessage;
  if (prepareMessage) {
    [a3 setPrepareMessage:prepareMessage];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSData copyWithZone:](self->_prepareMessage, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    prepareMessage = self->_prepareMessage;
    else {
      char v6 = 1;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_prepareMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[KCInitialMessageData setPrepareMessage:](self, "setPrepareMessage:");
  }
}

- (NSData)prepareMessage
{
  return self->_prepareMessage;
}

- (void)setPrepareMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end