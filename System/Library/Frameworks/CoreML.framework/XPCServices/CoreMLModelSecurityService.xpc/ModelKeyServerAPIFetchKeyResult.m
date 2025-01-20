@interface ModelKeyServerAPIFetchKeyResult
- (BOOL)hasKey;
- (BOOL)hasKeyId;
- (BOOL)hasModelName;
- (BOOL)hasRawKey;
- (BOOL)hasSignedKey;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ModelKeyServerAPIRawKey)rawKey;
- (ModelKeyServerAPISignedKey)signedKey;
- (NSString)keyId;
- (NSString)modelName;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyAsString:(int)a3;
- (int)StringAsKey:(id)a3;
- (int)key;
- (unint64_t)hash;
- (void)clearOneofValuesForKey;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setKey:(int)a3;
- (void)setKeyId:(id)a3;
- (void)setModelName:(id)a3;
- (void)setRawKey:(id)a3;
- (void)setSignedKey:(id)a3;
- (void)setTeamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIFetchKeyResult

- (BOOL)hasKeyId
{
  return self->_keyId != 0LL;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0LL;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0LL;
}

- (BOOL)hasSignedKey
{
  return self->_signedKey != 0LL;
}

- (void)setSignedKey:(id)a3
{
  v4 = (ModelKeyServerAPISignedKey *)a3;
  -[ModelKeyServerAPIFetchKeyResult clearOneofValuesForKey](self, "clearOneofValuesForKey");
  *(_BYTE *)&self->_has |= 1u;
  self->_key = 1;
  signedKey = self->_signedKey;
  self->_signedKey = v4;
}

- (BOOL)hasRawKey
{
  return self->_rawKey != 0LL;
}

- (void)setRawKey:(id)a3
{
  v4 = (ModelKeyServerAPIRawKey *)a3;
  -[ModelKeyServerAPIFetchKeyResult clearOneofValuesForKey](self, "clearOneofValuesForKey");
  *(_BYTE *)&self->_has |= 1u;
  self->_key = 2;
  rawKey = self->_rawKey;
  self->_rawKey = v4;
}

- (int)key
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_key;
  }
  else {
    return 0;
  }
}

- (void)setKey:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKey
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)keyAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_10000C348[a3];
  }
}

- (int)StringAsKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"signed_key"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"raw_key"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForKey
{
  *(_BYTE *)&self->_has &= ~1u;
  self->_key = 0;
  signedKey = self->_signedKey;
  self->_signedKey = 0LL;

  rawKey = self->_rawKey;
  self->_rawKey = 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ModelKeyServerAPIFetchKeyResult;
  id v3 = -[ModelKeyServerAPIFetchKeyResult description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIFetchKeyResult dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  keyId = self->_keyId;
  if (keyId) {
    [v3 setObject:keyId forKey:@"key_id"];
  }
  modelName = self->_modelName;
  if (modelName) {
    [v4 setObject:modelName forKey:@"model_name"];
  }
  teamId = self->_teamId;
  if (teamId) {
    [v4 setObject:teamId forKey:@"team_id"];
  }
  signedKey = self->_signedKey;
  if (signedKey)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPISignedKey dictionaryRepresentation](signedKey, "dictionaryRepresentation"));
    [v4 setObject:v9 forKey:@"signed_key"];
  }

  rawKey = self->_rawKey;
  if (rawKey)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIRawKey dictionaryRepresentation](rawKey, "dictionaryRepresentation"));
    [v4 setObject:v11 forKey:@"raw_key"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t key = self->_key;
    if (key >= 3) {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_key));
    }
    else {
      v13 = off_10000C348[key];
    }
    [v4 setObject:v13 forKey:@"Key"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  keyId = self->_keyId;
  id v10 = v4;
  if (keyId)
  {
    PBDataWriterWriteStringField(v4, keyId, 1LL);
    id v4 = v10;
  }

  modelName = self->_modelName;
  if (modelName)
  {
    PBDataWriterWriteStringField(v10, modelName, 2LL);
    id v4 = v10;
  }

  teamId = self->_teamId;
  if (teamId)
  {
    PBDataWriterWriteStringField(v10, teamId, 3LL);
    id v4 = v10;
  }

  signedKey = self->_signedKey;
  if (signedKey)
  {
    PBDataWriterWriteSubmessage(v10, signedKey, 4LL);
    id v4 = v10;
  }

  rawKey = self->_rawKey;
  if (rawKey)
  {
    PBDataWriterWriteSubmessage(v10, rawKey, 5LL);
    id v4 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_key;
    *((_BYTE *)v4 + 56) |= 1u;
  }

  v5 = v4;
  if (self->_keyId)
  {
    objc_msgSend(v4, "setKeyId:");
    id v4 = v5;
  }

  if (self->_modelName)
  {
    objc_msgSend(v5, "setModelName:");
    id v4 = v5;
  }

  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    id v4 = v5;
  }

  if (self->_signedKey)
  {
    objc_msgSend(v5, "setSignedKey:");
    id v4 = v5;
  }

  if (self->_rawKey)
  {
    objc_msgSend(v5, "setRawKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_key;
    *((_BYTE *)v5 + 56) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_keyId, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);
  id v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v12 = (void *)v6[6];
  v6[6] = v11;

  id v13 = -[ModelKeyServerAPISignedKey copyWithZone:](self->_signedKey, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  id v15 = -[ModelKeyServerAPIRawKey copyWithZone:](self->_rawKey, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_key != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    unsigned __int8 v11 = 0;
    goto LABEL_18;
  }

  keyId = self->_keyId;
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((void *)v4 + 3))
  {
  }

  teamId = self->_teamId;
  if ((unint64_t)teamId | *((void *)v4 + 6))
  {
  }

  signedKey = self->_signedKey;
  if ((unint64_t)signedKey | *((void *)v4 + 5))
  {
    if (!-[ModelKeyServerAPISignedKey isEqual:](signedKey, "isEqual:")) {
      goto LABEL_17;
    }
  }

  rawKey = self->_rawKey;
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_key;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[NSString hash](self->_keyId, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_modelName, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[NSString hash](self->_teamId, "hash");
  unint64_t v7 = -[ModelKeyServerAPISignedKey hash](self->_signedKey, "hash");
  return v6 ^ v7 ^ -[ModelKeyServerAPIRawKey hash](self->_rawKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_uint64_t key = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v10 = v4;
  if (*((void *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyResult setKeyId:](self, "setKeyId:");
    NSUInteger v5 = v10;
  }

  if (v5[3])
  {
    -[ModelKeyServerAPIFetchKeyResult setModelName:](self, "setModelName:");
    NSUInteger v5 = v10;
  }

  if (v5[6])
  {
    -[ModelKeyServerAPIFetchKeyResult setTeamId:](self, "setTeamId:");
    NSUInteger v5 = v10;
  }

  signedKey = self->_signedKey;
  uint64_t v7 = v5[5];
  if (signedKey)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[ModelKeyServerAPISignedKey mergeFrom:](signedKey, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[ModelKeyServerAPIFetchKeyResult setSignedKey:](self, "setSignedKey:");
  }

  NSUInteger v5 = v10;
LABEL_15:
  rawKey = self->_rawKey;
  uint64_t v9 = v5[4];
  if (rawKey)
  {
    if (v9)
    {
      -[ModelKeyServerAPIRawKey mergeFrom:](rawKey, "mergeFrom:");
LABEL_20:
      NSUInteger v5 = v10;
    }
  }

  else if (v9)
  {
    -[ModelKeyServerAPIFetchKeyResult setRawKey:](self, "setRawKey:");
    goto LABEL_20;
  }
}

- (NSString)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (ModelKeyServerAPISignedKey)signedKey
{
  return self->_signedKey;
}

- (ModelKeyServerAPIRawKey)rawKey
{
  return self->_rawKey;
}

- (void).cxx_destruct
{
}

@end