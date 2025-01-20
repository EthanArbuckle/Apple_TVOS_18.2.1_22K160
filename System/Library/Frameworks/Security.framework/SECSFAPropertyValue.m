@interface SECSFAPropertyValue
- (BOOL)hasInteger;
- (BOOL)hasProperty;
- (BOOL)hasString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertyAsString:(int)a3;
- (int)StringAsProperty:(id)a3;
- (int)property;
- (int64_t)integer;
- (unint64_t)hash;
- (void)clearOneofValuesForProperty;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInteger:(BOOL)a3;
- (void)setHasProperty:(BOOL)a3;
- (void)setInteger:(int64_t)a3;
- (void)setProperty:(int)a3;
- (void)setString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAPropertyValue

- (void)setInteger:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_property = 1;
  *(_BYTE *)&self->_has |= 1u;
  self->_integer = a3;
}

- (void)setHasInteger:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteger
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasString
{
  return self->_string != 0LL;
}

- (void)setString:(id)a3
{
  v4 = (NSString *)a3;
  -[SECSFAPropertyValue clearOneofValuesForProperty](self, "clearOneofValuesForProperty");
  *(_BYTE *)&self->_has |= 2u;
  self->_property = 2;
  string = self->_string;
  self->_string = v4;
}

- (int)property
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_property;
  }
  else {
    return 0;
  }
}

- (void)setProperty:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_property = a3;
}

- (void)setHasProperty:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProperty
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)propertyAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"integer"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"string"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForProperty
{
  *(_BYTE *)&self->_has &= ~2u;
  self->_property = 0;
  *(_BYTE *)&self->_has &= ~1u;
  self->_integer = 0LL;
  string = self->_string;
  self->_string = 0LL;
}

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAPropertyValue;
  -[SECSFAPropertyValue description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SECSFAPropertyValue dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithLongLong:self->_integer];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"integer"];
  }

  string = self->_string;
  if (string) {
    [v3 setObject:string forKey:@"string"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t property = self->_property;
    if (property >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_property);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v7 = off_189665848[property];
    }

    [v3 setObject:v7 forKey:@"Property"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAPropertyValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }

  if (self->_string)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_property;
    *((_BYTE *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_integer;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  if (self->_string)
  {
    v6 = v4;
    objc_msgSend(v4, "setString:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_property;
    *(_BYTE *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_integer;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  uint64_t v8 = -[NSString copyWithZone:](self->_string, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_property != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }

  string = self->_string;
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_property;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2 ^ -[NSString hash](self->_string, "hash");
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_integer;
  return v3 ^ v2 ^ -[NSString hash](self->_string, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t property = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 32);
  }

  if ((v5 & 1) != 0)
  {
    self->_integer = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[SECSFAPropertyValue setString:](self, "setString:");
    id v4 = v6;
  }
}

- (int64_t)integer
{
  return self->_integer;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end