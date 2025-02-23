@interface PPSPBCadenceTuple
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (unint64_t)value;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setValue:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBCadenceTuple

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PPSPBCadenceTuple;
  v4 = -[PPSPBCadenceTuple description](&v8, sel_description);
  v5 = -[PPSPBCadenceTuple dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_type];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"type"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_value];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBCadenceTupleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_type;
    *((_BYTE *)v4 + 20) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_value;
    *((_BYTE *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_type;
    *((_BYTE *)result + 20) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)result + 1) = self->_value;
    *((_BYTE *)result + 20) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }

  BOOL v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_value != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_value;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 20);
  }

  if ((v5 & 1) != 0)
  {
    self->_value = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)value
{
  return self->_value;
}

@end