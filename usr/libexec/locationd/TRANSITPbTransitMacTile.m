@interface TRANSITPbTransitMacTile
+ (Class)macsType;
- (BOOL)hasExpirationAgeSecs;
- (BOOL)hasGenerationTimeSecs;
- (BOOL)hasTileX;
- (BOOL)hasTileY;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)macs;
- (double)generationTimeSecs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)macsAtIndex:(unint64_t)a3;
- (int)expirationAgeSecs;
- (int)tileX;
- (int)tileY;
- (int)version;
- (unint64_t)hash;
- (unint64_t)macsCount;
- (void)addMacs:(id)a3;
- (void)clearMacs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setExpirationAgeSecs:(int)a3;
- (void)setGenerationTimeSecs:(double)a3;
- (void)setHasExpirationAgeSecs:(BOOL)a3;
- (void)setHasGenerationTimeSecs:(BOOL)a3;
- (void)setHasTileX:(BOOL)a3;
- (void)setHasTileY:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMacs:(id)a3;
- (void)setTileX:(int)a3;
- (void)setTileY:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbTransitMacTile

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbTransitMacTile;
  -[TRANSITPbTransitMacTile dealloc](&v3, "dealloc");
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTileX:(int)a3
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

- (void)setTileY:(int)a3
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

- (void)setGenerationTimeSecs:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generationTimeSecs = a3;
}

- (void)setHasGenerationTimeSecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTimeSecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpirationAgeSecs:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearMacs
{
}

- (void)addMacs:(id)a3
{
  macs = self->_macs;
  if (!macs)
  {
    macs = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_macs = macs;
  }

  -[NSMutableArray addObject:](macs, "addObject:", a3);
}

- (unint64_t)macsCount
{
  return (unint64_t)-[NSMutableArray count](self->_macs, "count");
}

- (id)macsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_macs, "objectAtIndex:", a3);
}

+ (Class)macsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___TRANSITPbTransitMac);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbTransitMacTile;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbTransitMacTile description](&v3, "description"),  -[TRANSITPbTransitMacTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version),  @"version");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileX),  @"tileX");
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100611674((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_version, 1LL);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_tileX, 2LL);
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_version;
    *((_BYTE *)a3 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 8) = self->_tileX;
  *((_BYTE *)a3 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    *((void *)a3 + 1) = *(void *)&self->_generationTimeSecs;
    *((_BYTE *)a3 + 44) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_version;
    *((_BYTE *)v5 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 8) = self->_tileX;
  *((_BYTE *)v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_version != *((_DWORD *)a3 + 10)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_tileX != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_29;
    }

    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_tileY != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_29;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 4)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_29;
    }

    macs = self->_macs;
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761LL * self->_tileX;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0LL;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0LL;
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761LL * self->_tileY;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double generationTimeSecs = self->_generationTimeSecs;
  double v8 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0) {
    double v8 = self->_generationTimeSecs;
  }
  double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }

  else
  {
    v11 -= (unint64_t)fabs(v10);
  }

- (void)mergeFrom:(id)a3
{
  char v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 0x10) != 0)
  {
    self->_version = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    char v4 = *((_BYTE *)a3 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_tileX = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 4u;
  char v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (int)version
{
  return self->_version;
}

- (int)tileX
{
  return self->_tileX;
}

- (int)tileY
{
  return self->_tileY;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (NSMutableArray)macs
{
  return self->_macs;
}

- (void)setMacs:(id)a3
{
}

@end