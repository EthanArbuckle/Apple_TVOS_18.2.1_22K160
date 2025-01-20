@interface OTSupportOctagonMessage
- (BOOL)hasSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)supportedAsString:(int)a3;
- (int)StringAsSupported:(id)a3;
- (int)supported;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSupported:(BOOL)a3;
- (void)setSupported:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSupportOctagonMessage

- (int)supported
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_supported;
  }
  else {
    return 0;
  }
}

- (void)setSupported:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supported = a3;
}

- (void)setHasSupported:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupported
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)supportedAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupported:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"supported"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"not_supported"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTSupportOctagonMessage;
  -[OTSupportOctagonMessage description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[OTSupportOctagonMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t supported = self->_supported;
    if (supported >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_supported);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = off_18A134D50[supported];
    }

    [v3 setObject:v5 forKey:@"supported"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTSupportOctagonMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_supported;
    *((_BYTE *)a3 + 12) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_supported;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_supported == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761LL * self->_supported;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_uint64_t supported = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

@end