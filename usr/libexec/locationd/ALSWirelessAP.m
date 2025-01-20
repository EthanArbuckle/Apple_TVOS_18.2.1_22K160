@interface ALSWirelessAP
- (ALSLocation)location;
- (BOOL)hasChannel;
- (BOOL)hasLocation;
- (BOOL)hasNumZaxisHarvestTraces;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)macID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)channel;
- (unsigned)numZaxisHarvestTraces;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasNumZaxisHarvestTraces:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMacID:(id)a3;
- (void)setNumZaxisHarvestTraces:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSWirelessAP

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSWirelessAP;
  -[ALSWirelessAP dealloc](&v3, "dealloc");
}

- (BOOL)hasLocation
{
  return self->_location != 0LL;
}

- (void)setChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumZaxisHarvestTraces:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numZaxisHarvestTraces = a3;
}

- (void)setHasNumZaxisHarvestTraces:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumZaxisHarvestTraces
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSWirelessAP;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSWirelessAP description](&v3, "description"),  -[ALSWirelessAP dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  macID = self->_macID;
  if (macID) {
    [v3 setObject:macID forKey:@"macID"];
  }
  location = self->_location;
  if (location) {
    objc_msgSend( v4,  "setObject:forKey:",  -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"),  @"location");
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_channel),  @"channel");
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numZaxisHarvestTraces),  @"numZaxisHarvestTraces");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BD1ED0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  macID = self->_macID;
  if (!macID) {
    sub_101264EC0();
  }
  PBDataWriterWriteStringField(a3, macID, 1LL);
  location = self->_location;
  if (location) {
    PBDataWriterWriteSubmessage(a3, location, 2LL);
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_channel, 21LL);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field(a3, self->_numZaxisHarvestTraces, 22LL);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_location) {
    objc_msgSend(a3, "setLocation:");
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_channel;
    *((_BYTE *)a3 + 36) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_numZaxisHarvestTraces;
    *((_BYTE *)a3 + 36) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[3] = -[NSString copyWithZone:](self->_macID, "copyWithZone:", a3);
  v7[2] = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v7 + 2) = self->_channel;
    *((_BYTE *)v7 + 36) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_DWORD *)v7 + 8) = self->_numZaxisHarvestTraces;
    *((_BYTE *)v7 + 36) |= 2u;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    macID = self->_macID;
    if (!((unint64_t)macID | *((void *)a3 + 3))
      || (unsigned int v7 = -[NSString isEqual:](macID, "isEqual:")) != 0)
    {
      location = self->_location;
      if (!((unint64_t)location | *((void *)a3 + 2))
        || (unsigned int v7 = -[ALSLocation isEqual:](location, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_channel != *((_DWORD *)a3 + 2)) {
            goto LABEL_15;
          }
        }

        else if ((*((_BYTE *)a3 + 36) & 1) != 0)
        {
LABEL_15:
          LOBYTE(v7) = 0;
          return v7;
        }

        LOBYTE(v7) = (*((_BYTE *)a3 + 36) & 2) == 0;
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_numZaxisHarvestTraces != *((_DWORD *)a3 + 8)) {
            goto LABEL_15;
          }
          LOBYTE(v7) = 1;
        }
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_macID, "hash");
  unint64_t v4 = -[ALSLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_channel;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6;
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761LL * self->_numZaxisHarvestTraces;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[ALSWirelessAP setMacID:](self, "setMacID:");
  }
  location = self->_location;
  uint64_t v6 = *((void *)a3 + 2);
  if (location)
  {
    if (v6) {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[ALSWirelessAP setLocation:](self, "setLocation:");
  }

  char v7 = *((_BYTE *)a3 + 36);
  if ((v7 & 1) != 0)
  {
    self->_channel = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v7 = *((_BYTE *)a3 + 36);
  }

  if ((v7 & 2) != 0)
  {
    self->_numZaxisHarvestTraces = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }

- (NSString)macID
{
  return self->_macID;
}

- (void)setMacID:(id)a3
{
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)numZaxisHarvestTraces
{
  return self->_numZaxisHarvestTraces;
}

@end