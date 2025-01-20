@interface TPPBPeerStableInfoSetting
- (BOOL)hasClock;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)clock;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setHasClock:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerStableInfoSetting

- (void)setClock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clock = a3;
}

- (void)setHasClock:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClock
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPeerStableInfoSetting;
  v4 = -[TPPBPeerStableInfoSetting description](&v8, sel_description);
  v5 = -[TPPBPeerStableInfoSetting dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_clock];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"clock"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_value];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerStableInfoSettingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_clock;
    *((_BYTE *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 16) = self->_value;
    *((_BYTE *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)result + 1) = self->_clock;
    *((_BYTE *)result + 20) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 16) = self->_value;
    *((_BYTE *)result + 20) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_clock != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_9;
  }

  BOOL v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }

    if (self->_value)
    {
      if (!*((_BYTE *)v4 + 16)) {
        goto LABEL_9;
      }
    }

    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_9;
    }

    BOOL v5 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unint64_t v2 = 2654435761u * self->_clock;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  unint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_value;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) != 0)
  {
    self->_clock = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 20);
  }

  if ((v5 & 2) != 0)
  {
    self->_value = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)clock
{
  return self->_clock;
}

- (BOOL)value
{
  return self->_value;
}

@end