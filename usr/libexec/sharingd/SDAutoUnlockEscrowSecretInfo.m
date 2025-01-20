@interface SDAutoUnlockEscrowSecretInfo
- (BOOL)hasPairingID;
- (BOOL)hasSecret;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)secret;
- (NSString)pairingID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPairingID:(id)a3;
- (void)setSecret:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockEscrowSecretInfo

- (BOOL)hasSecret
{
  return self->_secret != 0LL;
}

- (BOOL)hasPairingID
{
  return self->_pairingID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockEscrowSecretInfo;
  id v3 = -[SDAutoUnlockEscrowSecretInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  secret = self->_secret;
  if (secret) {
    [v3 setObject:secret forKey:@"secret"];
  }
  pairingID = self->_pairingID;
  if (pairingID) {
    [v4 setObject:pairingID forKey:@"pairingID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockEscrowSecretInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  secret = self->_secret;
  id v7 = v4;
  if (secret)
  {
    PBDataWriterWriteDataField(v4, secret, 1LL);
    id v4 = v7;
  }

  pairingID = self->_pairingID;
  if (pairingID)
  {
    PBDataWriterWriteStringField(v7, pairingID, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_secret)
  {
    objc_msgSend(v4, "setSecret:");
    id v4 = v5;
  }

  if (self->_pairingID)
  {
    objc_msgSend(v5, "setPairingID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_secret, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_pairingID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((secret = self->_secret, !((unint64_t)secret | v4[2]))
     || -[NSData isEqual:](secret, "isEqual:")))
  {
    pairingID = self->_pairingID;
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
  unint64_t v3 = (unint64_t)-[NSData hash](self->_secret, "hash");
  return -[NSString hash](self->_pairingID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[2])
  {
    -[SDAutoUnlockEscrowSecretInfo setSecret:](self, "setSecret:");
    id v4 = v5;
  }

  if (v4[1])
  {
    -[SDAutoUnlockEscrowSecretInfo setPairingID:](self, "setPairingID:");
    id v4 = v5;
  }
}

- (NSData)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end