@interface TPPBPolicySecret
- (BOOL)hasName;
- (BOOL)hasSecret;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)secret;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setSecret:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicySecret

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (BOOL)hasSecret
{
  return self->_secret != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicySecret;
  v4 = -[TPPBPolicySecret description](&v8, sel_description);
  v5 = -[TPPBPolicySecret dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  secret = self->_secret;
  if (secret) {
    [v4 setObject:secret forKey:@"secret"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicySecretReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_secret)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }

  if (self->_secret)
  {
    objc_msgSend(v5, "setSecret:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_secret, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    secret = self->_secret;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_name, "hash");
  return -[NSData hash](self->_secret, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[TPPBPolicySecret setName:](self, "setName:");
    id v4 = v5;
  }

  if (v4[2])
  {
    -[TPPBPolicySecret setSecret:](self, "setSecret:");
    id v4 = v5;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
}

- (void).cxx_destruct
{
}

@end