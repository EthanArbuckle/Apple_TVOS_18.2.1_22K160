@interface SDAutoUnlockRelockRequest
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockRelockRequest

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

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockRelockRequest;
  id v3 = -[SDAutoUnlockRelockRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRelockRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockRelockRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(a3, self->_version, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_version;
    *((_BYTE *)a3 + 12) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_version;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_version == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_7;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761LL * self->_version;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_version = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unsigned)version
{
  return self->_version;
}

@end