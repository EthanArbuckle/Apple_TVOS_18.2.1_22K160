@interface SECSFAVersion
- (BOOL)hasBuild;
- (BOOL)hasMajor;
- (BOOL)hasMinor;
- (BOOL)hasProductName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)productNameAsString:(int)a3;
- (int)StringAsProductName:(id)a3;
- (int)productName;
- (int64_t)build;
- (int64_t)major;
- (int64_t)minor;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(int64_t)a3;
- (void)setHasBuild:(BOOL)a3;
- (void)setHasMajor:(BOOL)a3;
- (void)setHasMinor:(BOOL)a3;
- (void)setHasProductName:(BOOL)a3;
- (void)setMajor:(int64_t)a3;
- (void)setMinor:(int64_t)a3;
- (void)setProductName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAVersion

- (int)productName
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_productName;
  }
  else {
    return 1;
  }
}

- (void)setProductName:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_productName = a3;
}

- (void)setHasProductName:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProductName
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)productNameAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProductName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"macOS"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"iphoneOS"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"xrOS"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"watchOS"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"tvOS"])
  {
    int v4 = 5;
  }

  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setMajor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_major = a3;
}

- (void)setHasMajor:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMajor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMinor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minor = a3;
}

- (void)setHasMinor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBuild:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_build = a3;
}

- (void)setHasBuild:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBuild
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAVersion;
  -[SECSFAVersion description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SECSFAVersion dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    unsigned int v5 = self->_productName - 1;
    if (v5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_productName);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v6 = off_189665860[v5];
    }

    [v3 setObject:v6 forKey:@"productName"];

    char has = (char)self->_has;
  }

  if ((has & 2) == 0)
  {
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    [MEMORY[0x189607968] numberWithLongLong:self->_minor];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v10 forKey:@"minor"];

    if ((*(_BYTE *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_9;
  }

  [MEMORY[0x189607968] numberWithLongLong:self->_major];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKey:@"major"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    [MEMORY[0x189607968] numberWithLongLong:self->_build];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKey:@"build"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      PBDataWriterWriteInt64Field();
      if ((*(_BYTE *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 1) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt64Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[8] = self->_productName;
    *((_BYTE *)v4 + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((void *)v4 + 3) = self->_minor;
      *((_BYTE *)v4 + 36) |= 4u;
      if ((*(_BYTE *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((void *)v4 + 2) = self->_major;
  *((_BYTE *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *((void *)v4 + 1) = self->_build;
    *((_BYTE *)v4 + 36) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 8) = self->_productName;
    *((_BYTE *)result + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((void *)result + 2) = self->_major;
  *((_BYTE *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_productName != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_major != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_minor != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }

  BOOL v5 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_build != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_productName;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_major;
      if ((*(_BYTE *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0LL;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0LL;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_minor;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761LL * self->_build;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_productName = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
    char v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      self->_minor = *((void *)v4 + 3);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 36) & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_major = *((void *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    self->_build = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

- (int64_t)major
{
  return self->_major;
}

- (int64_t)minor
{
  return self->_minor;
}

- (int64_t)build
{
  return self->_build;
}

@end