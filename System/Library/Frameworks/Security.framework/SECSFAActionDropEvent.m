@interface SECSFAActionDropEvent
- (BOOL)excludeCount;
- (BOOL)excludeEvent;
- (BOOL)hasExcludeCount;
- (BOOL)hasExcludeEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExcludeCount:(BOOL)a3;
- (void)setExcludeEvent:(BOOL)a3;
- (void)setHasExcludeCount:(BOOL)a3;
- (void)setHasExcludeEvent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAActionDropEvent

- (void)setExcludeEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_excludeEvent = a3;
}

- (void)setHasExcludeEvent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExcludeEvent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setExcludeCount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_excludeCount = a3;
}

- (void)setHasExcludeCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExcludeCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAActionDropEvent;
  v4 = -[SECSFAActionDropEvent description](&v8, sel_description);
  v5 = -[SECSFAActionDropEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
    [MEMORY[0x189607968] numberWithBool:self->_excludeEvent];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"excludeEvent"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_excludeCount];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKey:@"excludeCount"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionDropEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_excludeEvent;
    v4[12] |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[8] = self->_excludeCount;
    v4[12] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_excludeEvent;
    *((_BYTE *)result + 12) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_excludeCount;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_12;
    }
    if (self->_excludeEvent)
    {
      if (!v4[9]) {
        goto LABEL_12;
      }
    }

    else if (v4[9])
    {
      goto LABEL_12;
    }
  }

  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_12;
  }

  BOOL v5 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) != 0)
    {
      if (self->_excludeCount)
      {
        if (!v4[8]) {
          goto LABEL_12;
        }
      }

      else if (v4[8])
      {
        goto LABEL_12;
      }

      BOOL v5 = 1;
      goto LABEL_13;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_excludeEvent;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_excludeCount;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if ((v5 & 2) != 0)
  {
    self->_excludeEvent = v4[9];
    *(_BYTE *)&self->_has |= 2u;
    BOOL v5 = v4[12];
  }

  if (v5)
  {
    self->_excludeCount = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (BOOL)excludeEvent
{
  return self->_excludeEvent;
}

- (BOOL)excludeCount
{
  return self->_excludeCount;
}

@end