@interface ModelKeyServerAPIRawKey
- (BOOL)hasEncryptionIv;
- (BOOL)hasEncryptionKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionIv;
- (NSData)encryptionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionIv:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIRawKey

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0LL;
}

- (BOOL)hasEncryptionIv
{
  return self->_encryptionIv != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ModelKeyServerAPIRawKey;
  id v3 = -[ModelKeyServerAPIRawKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIRawKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v3 setObject:encryptionKey forKey:@"encryption_key"];
  }
  encryptionIv = self->_encryptionIv;
  if (encryptionIv) {
    [v4 setObject:encryptionIv forKey:@"encryption_iv"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIRawKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  encryptionKey = self->_encryptionKey;
  id v7 = v4;
  if (encryptionKey)
  {
    PBDataWriterWriteDataField(v4, encryptionKey, 1LL);
    id v4 = v7;
  }

  encryptionIv = self->_encryptionIv;
  if (encryptionIv)
  {
    PBDataWriterWriteDataField(v7, encryptionIv, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptionKey)
  {
    objc_msgSend(v4, "setEncryptionKey:");
    id v4 = v5;
  }

  if (self->_encryptionIv)
  {
    objc_msgSend(v5, "setEncryptionIv:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_encryptionKey, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSData copyWithZone:](self->_encryptionIv, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((encryptionKey = self->_encryptionKey, !((unint64_t)encryptionKey | v4[2]))
     || -[NSData isEqual:](encryptionKey, "isEqual:")))
  {
    encryptionIv = self->_encryptionIv;
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
  unint64_t v3 = (unint64_t)-[NSData hash](self->_encryptionKey, "hash");
  return (unint64_t)-[NSData hash](self->_encryptionIv, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[2])
  {
    -[ModelKeyServerAPIRawKey setEncryptionKey:](self, "setEncryptionKey:");
    id v4 = v5;
  }

  if (v4[1])
  {
    -[ModelKeyServerAPIRawKey setEncryptionIv:](self, "setEncryptionIv:");
    id v4 = v5;
  }
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionIv
{
  return self->_encryptionIv;
}

- (void)setEncryptionIv:(id)a3
{
}

- (void).cxx_destruct
{
}

@end