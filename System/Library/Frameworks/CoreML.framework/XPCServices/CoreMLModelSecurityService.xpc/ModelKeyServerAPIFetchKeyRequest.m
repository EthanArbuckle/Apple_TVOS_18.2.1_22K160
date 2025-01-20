@interface ModelKeyServerAPIFetchKeyRequest
- (BOOL)hasKeyId;
- (BOOL)hasRawRequest;
- (BOOL)hasSignedKeyRequest;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)rawRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)signedKeyRequest;
- (NSString)description;
- (NSString)keyId;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRawRequest:(BOOL)a3;
- (void)setKeyId:(id)a3;
- (void)setRawRequest:(BOOL)a3;
- (void)setSignedKeyRequest:(id)a3;
- (void)setTeamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIFetchKeyRequest

- (BOOL)hasKeyId
{
  return self->_keyId != 0LL;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0LL;
}

- (BOOL)hasSignedKeyRequest
{
  return self->_signedKeyRequest != 0LL;
}

- (void)setRawRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawRequest = a3;
}

- (void)setHasRawRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ModelKeyServerAPIFetchKeyRequest;
  v3 = -[ModelKeyServerAPIFetchKeyRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIFetchKeyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  keyId = self->_keyId;
  if (keyId) {
    [v3 setObject:keyId forKey:@"key_id"];
  }
  teamId = self->_teamId;
  if (teamId) {
    [v4 setObject:teamId forKey:@"team_id"];
  }
  signedKeyRequest = self->_signedKeyRequest;
  if (signedKeyRequest) {
    [v4 setObject:signedKeyRequest forKey:@"signed_key_request"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_rawRequest));
    [v4 setObject:v8 forKey:@"raw_request"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  keyId = self->_keyId;
  id v8 = v4;
  if (keyId)
  {
    PBDataWriterWriteStringField(v4, keyId, 1LL);
    id v4 = v8;
  }

  teamId = self->_teamId;
  if (teamId)
  {
    PBDataWriterWriteStringField(v8, teamId, 2LL);
    id v4 = v8;
  }

  signedKeyRequest = self->_signedKeyRequest;
  if (signedKeyRequest)
  {
    PBDataWriterWriteDataField(v8, signedKeyRequest, 3LL);
    id v4 = v8;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v8, self->_rawRequest, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_keyId)
  {
    objc_msgSend(v4, "setKeyId:");
    id v4 = v5;
  }

  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    id v4 = v5;
  }

  if (self->_signedKeyRequest)
  {
    objc_msgSend(v5, "setSignedKeyRequest:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_rawRequest;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_keyId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = -[NSData copyWithZone:](self->_signedKeyRequest, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 32) = self->_rawRequest;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  keyId = self->_keyId;
  if ((unint64_t)keyId | *((void *)v4 + 1))
  {
  }

  teamId = self->_teamId;
  if ((unint64_t)teamId | *((void *)v4 + 3))
  {
  }

  signedKeyRequest = self->_signedKeyRequest;
  if ((unint64_t)signedKeyRequest | *((void *)v4 + 2))
  {
  }

  BOOL v9 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v9 = 0;
      goto LABEL_11;
    }

    if (self->_rawRequest)
    {
      if (!*((_BYTE *)v4 + 32)) {
        goto LABEL_10;
      }
    }

    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }

    BOOL v9 = 1;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_keyId, "hash");
  NSUInteger v4 = -[NSString hash](self->_teamId, "hash");
  unint64_t v5 = (unint64_t)-[NSData hash](self->_signedKeyRequest, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_rawRequest;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ModelKeyServerAPIFetchKeyRequest setKeyId:](self, "setKeyId:");
    NSUInteger v4 = v5;
  }

  if (*((void *)v4 + 3))
  {
    -[ModelKeyServerAPIFetchKeyRequest setTeamId:](self, "setTeamId:");
    NSUInteger v4 = v5;
  }

  if (*((void *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyRequest setSignedKeyRequest:](self, "setSignedKeyRequest:");
    NSUInteger v4 = v5;
  }

  if (v4[36])
  {
    self->_rawRequest = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (NSData)signedKeyRequest
{
  return self->_signedKeyRequest;
}

- (void)setSignedKeyRequest:(id)a3
{
}

- (BOOL)rawRequest
{
  return self->_rawRequest;
}

- (void).cxx_destruct
{
}

@end