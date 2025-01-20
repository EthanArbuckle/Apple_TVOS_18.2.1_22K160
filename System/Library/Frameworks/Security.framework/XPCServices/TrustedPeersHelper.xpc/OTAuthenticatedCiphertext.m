@interface OTAuthenticatedCiphertext
+ (id)fromSFAuthenticatedCiphertext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authenticationCode;
- (NSData)ciphertext;
- (NSData)initializationVector;
- (id)asSFAuthenticatedCiphertext;
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

@implementation OTAuthenticatedCiphertext

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTAuthenticatedCiphertext;
  id v3 = -[OTAuthenticatedCiphertext description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthenticatedCiphertext dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
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
  return sub_1001C67A0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  ciphertext = self->_ciphertext;
  id v5 = a3;
  PBDataWriterWriteDataField(v5, ciphertext, 1LL);
  PBDataWriterWriteDataField(v5, self->_authenticationCode, 2LL);
  PBDataWriterWriteDataField(v5, self->_initializationVector, 3LL);
}

- (void)copyTo:(id)a3
{
  ciphertext = self->_ciphertext;
  id v5 = a3;
  [v5 setCiphertext:ciphertext];
  [v5 setAuthenticationCode:self->_authenticationCode];
  [v5 setInitializationVector:self->_initializationVector];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_ciphertext, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSData copyWithZone:](self->_authenticationCode, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = -[NSData copyWithZone:](self->_initializationVector, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[2]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((authenticationCode = self->_authenticationCode, !((unint64_t)authenticationCode | v4[1]))
     || -[NSData isEqual:](authenticationCode, "isEqual:")))
  {
    initializationVector = self->_initializationVector;
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
  unint64_t v3 = (unint64_t)-[NSData hash](self->_ciphertext, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_authenticationCode, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_initializationVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[OTAuthenticatedCiphertext setCiphertext:](self, "setCiphertext:");
  }
  if (v4[1]) {
    -[OTAuthenticatedCiphertext setAuthenticationCode:](self, "setAuthenticationCode:");
  }
  if (v4[3]) {
    -[OTAuthenticatedCiphertext setInitializationVector:](self, "setInitializationVector:");
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

- (id)asSFAuthenticatedCiphertext
{
  id v3 = objc_alloc(&OBJC_CLASS____SFAuthenticatedCiphertext);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthenticatedCiphertext ciphertext](self, "ciphertext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthenticatedCiphertext authenticationCode](self, "authenticationCode"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthenticatedCiphertext initializationVector](self, "initializationVector"));
  id v7 = [v3 initWithCiphertext:v4 authenticationCode:v5 initializationVector:v6];

  return v7;
}

+ (id)fromSFAuthenticatedCiphertext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new(&OBJC_CLASS___OTAuthenticatedCiphertext);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ciphertext]);
  -[OTAuthenticatedCiphertext setCiphertext:](v4, "setCiphertext:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 authenticationCode]);
  -[OTAuthenticatedCiphertext setAuthenticationCode:](v4, "setAuthenticationCode:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 initializationVector]);
  -[OTAuthenticatedCiphertext setInitializationVector:](v4, "setInitializationVector:", v7);

  return v4;
}

@end