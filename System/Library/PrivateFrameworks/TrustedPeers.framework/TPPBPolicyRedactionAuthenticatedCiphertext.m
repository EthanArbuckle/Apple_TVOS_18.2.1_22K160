@interface TPPBPolicyRedactionAuthenticatedCiphertext
- (BOOL)hasAuthenticationCode;
- (BOOL)hasCiphertext;
- (BOOL)hasInitializationVector;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authenticationCode;
- (NSData)ciphertext;
- (NSData)initializationVector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthenticationCode:(id)a3;
- (void)setCiphertext:(id)a3;
- (void)setInitializationVector:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyRedactionAuthenticatedCiphertext

- (BOOL)hasCiphertext
{
  return self->_ciphertext != 0LL;
}

- (BOOL)hasAuthenticationCode
{
  return self->_authenticationCode != 0LL;
}

- (BOOL)hasInitializationVector
{
  return self->_initializationVector != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyRedactionAuthenticatedCiphertext;
  v4 = -[TPPBPolicyRedactionAuthenticatedCiphertext description](&v8, sel_description);
  v5 = -[TPPBPolicyRedactionAuthenticatedCiphertext dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ciphertext = self->_ciphertext;
  if (ciphertext) {
    [v3 setObject:ciphertext forKey:@"ciphertext"];
  }
  authenticationCode = self->_authenticationCode;
  if (authenticationCode) {
    [v4 setObject:authenticationCode forKey:@"authenticationCode"];
  }
  initializationVector = self->_initializationVector;
  if (initializationVector) {
    [v4 setObject:initializationVector forKey:@"initializationVector"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyRedactionAuthenticatedCiphertextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ciphertext)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_authenticationCode)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_initializationVector)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ciphertext)
  {
    objc_msgSend(v4, "setCiphertext:");
    id v4 = v5;
  }

  if (self->_authenticationCode)
  {
    objc_msgSend(v5, "setAuthenticationCode:");
    id v4 = v5;
  }

  if (self->_initializationVector)
  {
    objc_msgSend(v5, "setInitializationVector:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSData copyWithZone:](self->_ciphertext, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_authenticationCode, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = -[NSData copyWithZone:](self->_initializationVector, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[2]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((authenticationCode = self->_authenticationCode, !((unint64_t)authenticationCode | v4[1]))
     || -[NSData isEqual:](authenticationCode, "isEqual:")))
  {
    initializationVector = self->_initializationVector;
    else {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_ciphertext, "hash");
  uint64_t v4 = -[NSData hash](self->_authenticationCode, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_initializationVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[2]) {
    -[TPPBPolicyRedactionAuthenticatedCiphertext setCiphertext:](self, "setCiphertext:");
  }
  if (v4[1]) {
    -[TPPBPolicyRedactionAuthenticatedCiphertext setAuthenticationCode:](self, "setAuthenticationCode:");
  }
  if (v4[3]) {
    -[TPPBPolicyRedactionAuthenticatedCiphertext setInitializationVector:](self, "setInitializationVector:");
  }
}

- (NSData)ciphertext
{
  return self->_ciphertext;
}

- (void)setCiphertext:(id)a3
{
}

- (NSData)authenticationCode
{
  return self->_authenticationCode;
}

- (void)setAuthenticationCode:(id)a3
{
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end