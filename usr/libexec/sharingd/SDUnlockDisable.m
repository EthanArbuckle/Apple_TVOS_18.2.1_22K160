@interface SDUnlockDisable
- (BOOL)hasPairingID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairingID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPairingID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockDisable

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

- (BOOL)hasPairingID
{
  return self->_pairingID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockDisable;
  id v3 = -[SDUnlockDisable description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockDisable dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  pairingID = self->_pairingID;
  if (pairingID) {
    [v3 setObject:pairingID forKey:@"pairingID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockDisableReadFrom((uint64_t)self, (uint64_t)a3);
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

  pairingID = self->_pairingID;
  if (pairingID)
  {
    PBDataWriterWriteStringField(v6, pairingID, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 20) |= 1u;
  }

  if (self->_pairingID)
  {
    v5 = v4;
    objc_msgSend(v4, "setPairingID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((_BYTE *)v5 + 20) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_pairingID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    unsigned __int8 v7 = 0;
    goto LABEL_10;
  }

  pairingID = self->_pairingID;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return -[NSString hash](self->_pairingID, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_version = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[SDUnlockDisable setPairingID:](self, "setPairingID:");
    id v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
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