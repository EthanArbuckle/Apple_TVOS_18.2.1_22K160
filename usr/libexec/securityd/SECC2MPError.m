@interface SECC2MPError
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasErrorDomain;
- (BOOL)hasUnderlyingError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDescription;
- (NSString)errorDomain;
- (SECC2MPError)underlyingError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setUnderlyingError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPError

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0LL;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0LL;
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPError;
  id v3 = -[SECC2MPError description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"error_domain"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_errorCode));
    [v4 setObject:v6 forKey:@"error_code"];
  }

  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"error_description"];
  }
  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](underlyingError, "dictionaryRepresentation"));
    [v4 setObject:v9 forKey:@"underlying_error"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011ECE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  errorDomain = self->_errorDomain;
  id v8 = v4;
  if (errorDomain)
  {
    PBDataWriterWriteStringField(v4, errorDomain, 1LL);
    id v4 = v8;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field(v8, self->_errorCode, 2LL);
    id v4 = v8;
  }

  errorDescription = self->_errorDescription;
  if (errorDescription)
  {
    PBDataWriterWriteStringField(v8, errorDescription, 3LL);
    id v4 = v8;
  }

  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    PBDataWriterWriteSubmessage(v8, underlyingError, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_errorDomain)
  {
    objc_msgSend(v4, "setErrorDomain:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_errorCode;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    id v4 = v5;
  }

  if (self->_underlyingError)
  {
    objc_msgSend(v5, "setUnderlyingError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_errorCode;
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[SECC2MPError copyWithZone:](self->_underlyingError, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 3))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_errorCode != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }

  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_13;
  }

  underlyingError = self->_underlyingError;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v4 = 0LL;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = -[NSString hash](self->_errorDescription, "hash");
  return v5 ^ v6 ^ -[SECC2MPError hash](self->_underlyingError, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[SECC2MPError setErrorDomain:](self, "setErrorDomain:");
    uint64_t v4 = v7;
  }

  if ((v4[5] & 1) != 0)
  {
    self->_errorCode = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (v4[2])
  {
    -[SECC2MPError setErrorDescription:](self, "setErrorDescription:");
    uint64_t v4 = v7;
  }

  underlyingError = self->_underlyingError;
  uint64_t v6 = v4[4];
  if (underlyingError)
  {
    if (v6)
    {
      -[SECC2MPError mergeFrom:](underlyingError, "mergeFrom:");
LABEL_12:
      uint64_t v4 = v7;
    }
  }

  else if (v6)
  {
    -[SECC2MPError setUnderlyingError:](self, "setUnderlyingError:");
    goto LABEL_12;
  }
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (SECC2MPError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end