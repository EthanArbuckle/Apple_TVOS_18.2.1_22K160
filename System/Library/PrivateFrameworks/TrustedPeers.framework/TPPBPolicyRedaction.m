@interface TPPBPolicyRedaction
- (BOOL)hasCiphertext;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (TPPBPolicyRedactionAuthenticatedCiphertext)ciphertext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCiphertext:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyRedaction

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (BOOL)hasCiphertext
{
  return self->_ciphertext != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyRedaction;
  v4 = -[TPPBPolicyRedaction description](&v8, sel_description);
  v5 = -[TPPBPolicyRedaction dictionaryRepresentation](self, "dictionaryRepresentation");
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
  ciphertext = self->_ciphertext;
  if (ciphertext)
  {
    v7 = -[TPPBPolicyRedactionAuthenticatedCiphertext dictionaryRepresentation](ciphertext, "dictionaryRepresentation");
    [v4 setObject:v7 forKey:@"ciphertext"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyRedactionReadFrom((uint64_t)self, (uint64_t)a3);
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

  if (self->_ciphertext)
  {
    PBDataWriterWriteSubmessage();
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

  if (self->_ciphertext)
  {
    objc_msgSend(v5, "setCiphertext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[TPPBPolicyRedactionAuthenticatedCiphertext copyWithZone:](self->_ciphertext, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:")))
  {
    ciphertext = self->_ciphertext;
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
  return -[TPPBPolicyRedactionAuthenticatedCiphertext hash](self->_ciphertext, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[TPPBPolicyRedaction setName:](self, "setName:");
    id v4 = v7;
  }

  ciphertext = self->_ciphertext;
  uint64_t v6 = v4[1];
  if (ciphertext)
  {
    if (v6)
    {
      -[TPPBPolicyRedactionAuthenticatedCiphertext mergeFrom:](ciphertext, "mergeFrom:");
LABEL_8:
      id v4 = v7;
    }
  }

  else if (v6)
  {
    -[TPPBPolicyRedaction setCiphertext:](self, "setCiphertext:");
    goto LABEL_8;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (TPPBPolicyRedactionAuthenticatedCiphertext)ciphertext
{
  return self->_ciphertext;
}

- (void)setCiphertext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end