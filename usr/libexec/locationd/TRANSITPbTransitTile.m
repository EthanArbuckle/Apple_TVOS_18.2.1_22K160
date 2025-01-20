@interface TRANSITPbTransitTile
- (BOOL)hasDEPRECATEDFingerprints;
- (BOOL)hasExpirationAgeSecs;
- (BOOL)hasFingerprints;
- (BOOL)hasGenerationTimeSecs;
- (BOOL)hasMarketId;
- (BOOL)hasSecurityKey;
- (BOOL)hasTileX;
- (BOOL)hasTileY;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TRANSITPbLocationFingerprints)fingerprints;
- (TRANSITPbLocationFingerprintsV1)dEPRECATEDFingerprints;
- (double)generationTimeSecs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)expirationAgeSecs;
- (int)tileX;
- (int)tileY;
- (int)version;
- (unint64_t)hash;
- (unint64_t)marketId;
- (unint64_t)securityKey;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDEPRECATEDFingerprints:(id)a3;
- (void)setExpirationAgeSecs:(int)a3;
- (void)setFingerprints:(id)a3;
- (void)setGenerationTimeSecs:(double)a3;
- (void)setHasExpirationAgeSecs:(BOOL)a3;
- (void)setHasGenerationTimeSecs:(BOOL)a3;
- (void)setHasMarketId:(BOOL)a3;
- (void)setHasSecurityKey:(BOOL)a3;
- (void)setHasTileX:(BOOL)a3;
- (void)setHasTileY:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMarketId:(unint64_t)a3;
- (void)setSecurityKey:(unint64_t)a3;
- (void)setTileX:(int)a3;
- (void)setTileY:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbTransitTile

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbTransitTile;
  -[TRANSITPbTransitTile dealloc](&v3, "dealloc");
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTileX:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTileX
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTileY:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTileY
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (unint64_t)securityKey
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_securityKey;
  }
  else {
    return -1LL;
  }
}

- (void)setSecurityKey:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_securityKey = a3;
}

- (void)setHasSecurityKey:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecurityKey
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  *(_BYTE *)&self->_has |= 8u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDEPRECATEDFingerprints
{
  return self->_dEPRECATEDFingerprints != 0LL;
}

- (BOOL)hasFingerprints
{
  return self->_fingerprints != 0LL;
}

- (unint64_t)marketId
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_marketId;
  }
  else {
    return 0LL;
  }
}

- (void)setMarketId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_marketId = a3;
}

- (void)setHasMarketId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMarketId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbTransitTile;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbTransitTile description](&v3, "description"),  -[TRANSITPbTransitTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version),  @"version");
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileX),  @"tileX");
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1002CBC3C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_version, 1LL);
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_tileX, 2LL);
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_version;
    *((_BYTE *)a3 + 68) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 14) = self->_tileX;
  *((_BYTE *)a3 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_version;
    *((_BYTE *)v5 + 68) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 14) = self->_tileX;
  *((_BYTE *)v5 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x40) == 0 || self->_version != *((_DWORD *)a3 + 16)) {
        goto LABEL_42;
      }
    }

    else if ((*((_BYTE *)a3 + 68) & 0x40) != 0)
    {
LABEL_42:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x10) == 0 || self->_tileX != *((_DWORD *)a3 + 14)) {
        goto LABEL_42;
      }
    }

    else if ((*((_BYTE *)a3 + 68) & 0x10) != 0)
    {
      goto LABEL_42;
    }

    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x20) == 0 || self->_tileY != *((_DWORD *)a3 + 15)) {
        goto LABEL_42;
      }
    }

    else if ((*((_BYTE *)a3 + 68) & 0x20) != 0)
    {
      goto LABEL_42;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 4) == 0 || self->_securityKey != *((void *)a3 + 3)) {
        goto LABEL_42;
      }
    }

    else if ((*((_BYTE *)a3 + 68) & 4) != 0)
    {
      goto LABEL_42;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 68) & 1) != 0)
    {
      goto LABEL_42;
    }

    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 8) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 10)) {
        goto LABEL_42;
      }
    }

    else if ((*((_BYTE *)a3 + 68) & 8) != 0)
    {
      goto LABEL_42;
    }

    dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
    if ((unint64_t)dEPRECATEDFingerprints | *((void *)a3 + 4))
    {
      unsigned int v5 = -[TRANSITPbLocationFingerprintsV1 isEqual:](dEPRECATEDFingerprints, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }

    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 2) == 0 || self->_marketId != *((void *)a3 + 2)) {
        goto LABEL_42;
      }
    }

    else if ((*((_BYTE *)a3 + 68) & 2) != 0)
    {
      goto LABEL_42;
    }

    fingerprints = self->_fingerprints;
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761LL * self->_tileX;
      if ((*(_BYTE *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761LL * self->_tileY;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t v7 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v12 = 0LL;
    goto LABEL_17;
  }

- (void)mergeFrom:(id)a3
{
  char v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 0x40) != 0)
  {
    self->_version = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 0x40u;
    char v5 = *((_BYTE *)a3 + 68);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)a3 + 68) & 0x10) == 0)
  {
    goto LABEL_3;
  }

  self->_tileX = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 0x10u;
  char v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
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

- (TRANSITPbLocationFingerprintsV1)dEPRECATEDFingerprints
{
  return self->_dEPRECATEDFingerprints;
}

- (void)setDEPRECATEDFingerprints:(id)a3
{
}

- (TRANSITPbLocationFingerprints)fingerprints
{
  return self->_fingerprints;
}

- (void)setFingerprints:(id)a3
{
}

@end