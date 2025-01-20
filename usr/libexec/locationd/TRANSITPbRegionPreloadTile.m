@interface TRANSITPbRegionPreloadTile
- (BOOL)hasIsAllowOverCellular;
- (BOOL)hasSecKey;
- (BOOL)hasTileType;
- (BOOL)hasTileX;
- (BOOL)hasTileY;
- (BOOL)isAllowOverCellular;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)secKey;
- (unsigned)tileType;
- (unsigned)tileX;
- (unsigned)tileY;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAllowOverCellular:(BOOL)a3;
- (void)setHasSecKey:(BOOL)a3;
- (void)setHasTileType:(BOOL)a3;
- (void)setHasTileX:(BOOL)a3;
- (void)setHasTileY:(BOOL)a3;
- (void)setIsAllowOverCellular:(BOOL)a3;
- (void)setSecKey:(unint64_t)a3;
- (void)setTileType:(unsigned int)a3;
- (void)setTileX:(unsigned int)a3;
- (void)setTileY:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbRegionPreloadTile

- (void)setTileType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tileType = a3;
}

- (void)setHasTileType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTileType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTileX:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTileX
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTileY:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTileY
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsAllowOverCellular:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isAllowOverCellular = a3;
}

- (void)setHasIsAllowOverCellular:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAllowOverCellular
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unint64_t)secKey
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_secKey;
  }
  else {
    return -1LL;
  }
}

- (void)setSecKey:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secKey = a3;
}

- (void)setHasSecKey:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecKey
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbRegionPreloadTile;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbRegionPreloadTile description](&v3, "description"),  -[TRANSITPbRegionPreloadTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileType),  @"tileType");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileX),  @"tileX");
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isAllowOverCellular),  @"isAllowOverCellular");
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_6;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100291654((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_tileType, 1LL);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(a3, self->_tileX, 2LL);
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_tileType;
    *((_BYTE *)a3 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 5) = self->_tileX;
  *((_BYTE *)a3 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_tileType;
    *((_BYTE *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 5) = self->_tileX;
  *((_BYTE *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_tileType != *((_DWORD *)a3 + 4)) {
        goto LABEL_26;
      }
    }

    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_tileX != *((_DWORD *)a3 + 5)) {
        goto LABEL_26;
      }
    }

    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
      goto LABEL_26;
    }

    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_tileY != *((_DWORD *)a3 + 6)) {
        goto LABEL_26;
      }
    }

    else if ((*((_BYTE *)a3 + 32) & 8) != 0)
    {
      goto LABEL_26;
    }

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
    {
      goto LABEL_26;
    }

    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_secKey != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_tileType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_tileX;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761LL * self->_tileY;
    if ((*(_BYTE *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0LL;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }

- (void)mergeFrom:(id)a3
{
  char v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_tileType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    char v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)a3 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_tileX = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  char v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (unsigned)tileType
{
  return self->_tileType;
}

- (unsigned)tileX
{
  return self->_tileX;
}

- (unsigned)tileY
{
  return self->_tileY;
}

- (BOOL)isAllowOverCellular
{
  return self->_isAllowOverCellular;
}

@end