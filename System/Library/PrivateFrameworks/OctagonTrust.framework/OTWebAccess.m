@interface OTWebAccess
- (BOOL)enabled;
- (BOOL)hasEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTWebAccess

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTWebAccess;
  v4 = -[OTWebAccess description](&v8, sel_description);
  v5 = -[OTWebAccess dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_enabled];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"enabled"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTWebAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)a3 + 8) = self->_enabled;
    *((_BYTE *)a3 + 12) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_enabled;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }

    if (self->_enabled)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }

    else if (v4[8])
    {
      goto LABEL_4;
    }

    BOOL v5 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761LL * self->_enabled;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_enabled = *((_BYTE *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

- (BOOL)enabled
{
  return self->_enabled;
}

@end