@interface ALSCdmaCellTower
- (ALSLocation)location;
- (BOOL)hasBandclass;
- (BOOL)hasBsid;
- (BOOL)hasChannel;
- (BOOL)hasLocation;
- (BOOL)hasMcc;
- (BOOL)hasNid;
- (BOOL)hasPnoffset;
- (BOOL)hasSid;
- (BOOL)hasZoneid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bandclass;
- (int)bsid;
- (int)channel;
- (int)mcc;
- (int)nid;
- (int)pnoffset;
- (int)sid;
- (int)zoneid;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBandclass:(int)a3;
- (void)setBsid:(int)a3;
- (void)setChannel:(int)a3;
- (void)setHasBandclass:(BOOL)a3;
- (void)setHasBsid:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasNid:(BOOL)a3;
- (void)setHasPnoffset:(BOOL)a3;
- (void)setHasSid:(BOOL)a3;
- (void)setHasZoneid:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setNid:(int)a3;
- (void)setPnoffset:(int)a3;
- (void)setSid:(int)a3;
- (void)setZoneid:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSCdmaCellTower

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSCdmaCellTower;
  -[ALSCdmaCellTower dealloc](&v3, "dealloc");
}

- (void)setMcc:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMcc
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSid:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSid
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNid:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNid
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBsid:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bsid = a3;
}

- (void)setHasBsid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBsid
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0LL;
}

- (void)setZoneid:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_zoneid = a3;
}

- (void)setHasZoneid:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasZoneid
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBandclass:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bandclass = a3;
}

- (void)setHasBandclass:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBandclass
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setChannel:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPnoffset
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSCdmaCellTower;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSCdmaCellTower description](&v3, "description"),  -[ALSCdmaCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc),  @"mcc");
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sid),  @"sid");
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100B61888((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_mcc, 1LL);
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_sid, 3LL);
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_mcc;
    *((_BYTE *)a3 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 11) = self->_sid;
  *((_BYTE *)a3 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  $9A7F0227EFB4DBDE183E01B489D06990 v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  v8 = v7;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v7 + 8) = self->_mcc;
    *((_BYTE *)v7 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v7 + 11) = self->_sid;
  *((_BYTE *)v7 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    char has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_mcc != *((_DWORD *)a3 + 8)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 8) != 0)
    {
      goto LABEL_44;
    }

    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x40) == 0 || self->_sid != *((_DWORD *)a3 + 11)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_44;
    }

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_nid != *((_DWORD *)a3 + 9)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_44;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_bsid != *((_DWORD *)a3 + 3)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_44;
    }

    location = self->_location;
    if ((unint64_t)location | *((void *)a3 + 3))
    {
      unsigned int v7 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v7) {
        return v7;
      }
      char has = (char)self->_has;
    }

    if (has < 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x80) == 0 || self->_zoneid != *((_DWORD *)a3 + 12)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 0x80) != 0)
    {
LABEL_44:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_bandclass != *((_DWORD *)a3 + 2)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_44;
    }

    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_channel != *((_DWORD *)a3 + 4)) {
        goto LABEL_44;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_44;
    }

    LOBYTE(v7) = (*((_BYTE *)a3 + 52) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x20) == 0 || self->_pnoffset != *((_DWORD *)a3 + 10)) {
        goto LABEL_44;
      }
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_mcc;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_sid;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0LL;
      if ((*(_BYTE *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761LL * self->_nid;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761LL * self->_bsid;
    goto LABEL_10;
  }

- (void)mergeFrom:(id)a3
{
  char v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 8) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
    char v5 = *((_BYTE *)a3 + 52);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)a3 + 52) & 0x40) == 0)
  {
    goto LABEL_3;
  }

  self->_sid = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  char v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (int)mcc
{
  return self->_mcc;
}

- (int)sid
{
  return self->_sid;
}

- (int)nid
{
  return self->_nid;
}

- (int)bsid
{
  return self->_bsid;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)zoneid
{
  return self->_zoneid;
}

- (int)bandclass
{
  return self->_bandclass;
}

- (int)channel
{
  return self->_channel;
}

- (int)pnoffset
{
  return self->_pnoffset;
}

@end