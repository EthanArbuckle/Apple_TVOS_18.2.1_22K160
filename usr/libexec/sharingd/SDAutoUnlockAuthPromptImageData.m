@interface SDAutoUnlockAuthPromptImageData
- (BOOL)finalMessage;
- (BOOL)hasFinalMessage;
- (BOOL)hasImageData;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFinalMessage:(BOOL)a3;
- (void)setHasFinalMessage:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAuthPromptImageData

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0LL;
}

- (void)setFinalMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_finalMessage = a3;
}

- (void)setHasFinalMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFinalMessage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAuthPromptImageData;
  id v3 = -[SDAutoUnlockAuthPromptImageData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_finalMessage));
    [v3 setObject:v6 forKey:@"finalMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptImageDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v6;
  }

  imageData = self->_imageData;
  if (imageData)
  {
    PBDataWriterWriteDataField(v6, imageData, 2LL);
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_finalMessage, 3LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 24) |= 1u;
  }

  if (self->_imageData)
  {
    v5 = v4;
    objc_msgSend(v4, "setImageData:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 20) = self->_finalMessage;
    *((_BYTE *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[4] = self->_version;
    *((_BYTE *)v5 + 24) |= 1u;
  }

  id v7 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 20) = self->_finalMessage;
    *((_BYTE *)v6 + 24) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_12;
  }

  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 1))
  {
    char has = (char)self->_has;
  }

  BOOL v8 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_finalMessage)
      {
        if (!*((_BYTE *)v4 + 20)) {
          goto LABEL_12;
        }
      }

      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_12;
      }

      BOOL v8 = 1;
      goto LABEL_13;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSData hash](self->_imageData, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761LL * self->_finalMessage;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[SDAutoUnlockAuthPromptImageData setImageData:](self, "setImageData:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    self->_finalMessage = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (BOOL)finalMessage
{
  return self->_finalMessage;
}

- (void).cxx_destruct
{
}

@end