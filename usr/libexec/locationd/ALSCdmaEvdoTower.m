@interface ALSCdmaEvdoTower
- (ALSLocation)location;
- (BOOL)hasBandclass;
- (BOOL)hasChannel;
- (BOOL)hasLocation;
- (BOOL)hasPnoffset;
- (BOOL)hasSectorid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectorid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bandclass;
- (int)channel;
- (int)pnoffset;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBandclass:(int)a3;
- (void)setChannel:(int)a3;
- (void)setHasBandclass:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasPnoffset:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPnoffset:(int)a3;
- (void)setSectorid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSCdmaEvdoTower

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSCdmaEvdoTower;
  -[ALSCdmaEvdoTower dealloc](&v3, "dealloc");
}

- (BOOL)hasSectorid
{
  return self->_sectorid != 0LL;
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
  *(_BYTE *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPnoffset
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSCdmaEvdoTower;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSCdmaEvdoTower description](&v3, "description"),  -[ALSCdmaEvdoTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  sectorid = self->_sectorid;
  if (sectorid) {
    [v3 setObject:sectorid forKey:@"sectorid"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bandclass),  @"bandclass");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_channel),  @"channel");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
LABEL_6:
  }
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pnoffset),  @"pnoffset");
LABEL_7:
  location = self->_location;
  if (location) {
    objc_msgSend( v4,  "setObject:forKey:",  -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"),  @"location");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B6CAC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  sectorid = self->_sectorid;
  if (sectorid) {
    PBDataWriterWriteStringField(a3, sectorid, 1LL);
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_bandclass, 2LL);
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  PBDataWriterWriteInt32Field(a3, self->_channel, 3LL);
  if ((*(_BYTE *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field(a3, self->_pnoffset, 4LL);
LABEL_7:
  location = self->_location;
  if (location) {
    PBDataWriterWriteSubmessage(a3, location, 5LL);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_sectorid) {
    objc_msgSend(a3, "setSectorid:");
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_bandclass;
    *((_BYTE *)a3 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  *((_DWORD *)a3 + 3) = self->_channel;
  *((_BYTE *)a3 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 6) = self->_pnoffset;
    *((_BYTE *)a3 + 40) |= 4u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[4] = -[NSString copyWithZone:](self->_sectorid, "copyWithZone:", a3);
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v7 + 3) = self->_channel;
    *((_BYTE *)v7 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_DWORD *)v7 + 2) = self->_bandclass;
  *((_BYTE *)v7 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v7 + 6) = self->_pnoffset;
    *((_BYTE *)v7 + 40) |= 4u;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    sectorid = self->_sectorid;
    if (!((unint64_t)sectorid | *((void *)a3 + 4))
      || (unsigned int v7 = -[NSString isEqual:](sectorid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_bandclass != *((_DWORD *)a3 + 2)) {
          goto LABEL_21;
        }
      }

      else if ((*((_BYTE *)a3 + 40) & 1) != 0)
      {
LABEL_21:
        LOBYTE(v7) = 0;
        return v7;
      }

      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_channel != *((_DWORD *)a3 + 3)) {
          goto LABEL_21;
        }
      }

      else if ((*((_BYTE *)a3 + 40) & 2) != 0)
      {
        goto LABEL_21;
      }

      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_pnoffset != *((_DWORD *)a3 + 6)) {
          goto LABEL_21;
        }
      }

      else if ((*((_BYTE *)a3 + 40) & 4) != 0)
      {
        goto LABEL_21;
      }

      location = self->_location;
      else {
        LOBYTE(v7) = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_sectorid, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[ALSLocation hash](self->_location, "hash");
  }

  uint64_t v4 = 2654435761LL * self->_bandclass;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761LL * self->_channel;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761LL * self->_pnoffset;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[ALSLocation hash](self->_location, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[ALSCdmaEvdoTower setSectorid:](self, "setSectorid:");
  }
  char v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_bandclass = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((*((_BYTE *)a3 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }

  self->_channel = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 40) & 4) != 0)
  {
LABEL_6:
    self->_pnoffset = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }

- (NSString)sectorid
{
  return self->_sectorid;
}

- (void)setSectorid:(id)a3
{
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

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

@end