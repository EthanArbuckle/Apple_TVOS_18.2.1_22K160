@interface SDAutoUnlockLTKInfo
- (BOOL)hasLtk;
- (BOOL)hasLtkID;
- (BOOL)hasSignout;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)signout;
- (NSData)ltk;
- (NSData)ltkID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSignout:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLtk:(id)a3;
- (void)setLtkID:(id)a3;
- (void)setSignout:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockLTKInfo

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

- (BOOL)hasLtk
{
  return self->_ltk != 0LL;
}

- (BOOL)hasLtkID
{
  return self->_ltkID != 0LL;
}

- (void)setSignout:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signout = a3;
}

- (void)setHasSignout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignout
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockLTKInfo;
  id v3 = -[SDAutoUnlockLTKInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  ltk = self->_ltk;
  if (ltk) {
    [v3 setObject:ltk forKey:@"ltk"];
  }
  ltkID = self->_ltkID;
  if (ltkID) {
    [v3 setObject:ltkID forKey:@"ltkID"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_signout));
    [v3 setObject:v7 forKey:@"signout"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
  }
  ltk = self->_ltk;
  if (ltk) {
    PBDataWriterWriteDataField(v6, ltk, 2LL);
  }
  ltkID = self->_ltkID;
  if (ltkID) {
    PBDataWriterWriteDataField(v6, ltkID, 3LL);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField(v6, self->_signout, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  v5 = v4;
  if (self->_ltk)
  {
    objc_msgSend(v4, "setLtk:");
    v4 = v5;
  }

  if (self->_ltkID)
  {
    objc_msgSend(v5, "setLtkID:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_signout;
    *((_BYTE *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[6] = self->_version;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v7 = -[NSData copyWithZone:](self->_ltk, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = -[NSData copyWithZone:](self->_ltkID, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 28) = self->_signout;
    *((_BYTE *)v6 + 32) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_13;
  }

  ltk = self->_ltk;
  ltkID = self->_ltkID;
  if ((unint64_t)ltkID | *((void *)v4 + 2))
  {
  }

  BOOL v8 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
    {
LABEL_13:
      BOOL v8 = 0;
      goto LABEL_14;
    }

    if (self->_signout)
    {
      if (!*((_BYTE *)v4 + 28)) {
        goto LABEL_13;
      }
    }

    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_13;
    }

    BOOL v8 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSData hash](self->_ltk, "hash");
  unint64_t v5 = (unint64_t)-[NSData hash](self->_ltkID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761LL * self->_signout;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDAutoUnlockLTKInfo setLtk:](self, "setLtk:");
    id v4 = v5;
  }

  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockLTKInfo setLtkID:](self, "setLtkID:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_signout = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)ltk
{
  return self->_ltk;
}

- (void)setLtk:(id)a3
{
}

- (NSData)ltkID
{
  return self->_ltkID;
}

- (void)setLtkID:(id)a3
{
}

- (BOOL)signout
{
  return self->_signout;
}

- (void).cxx_destruct
{
}

@end