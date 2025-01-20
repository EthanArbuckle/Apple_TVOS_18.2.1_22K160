@interface ALSScdmaCellTower
- (ALSLocation)location;
- (BOOL)hasArfcn;
- (BOOL)hasLocation;
- (BOOL)hasPsc;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)arfcn;
- (int)cellID;
- (int)lacID;
- (int)mcc;
- (int)mnc;
- (int)psc;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArfcn:(int)a3;
- (void)setCellID:(int)a3;
- (void)setHasArfcn:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setLacID:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setPsc:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSScdmaCellTower

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSScdmaCellTower;
  -[ALSScdmaCellTower dealloc](&v3, "dealloc");
}

- (BOOL)hasLocation
{
  return self->_location != 0LL;
}

- (void)setArfcn:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPsc
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSScdmaCellTower;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSScdmaCellTower description](&v3, "description"),  -[ALSScdmaCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc),  @"mcc");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mnc),  @"mnc");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_cellID),  @"cellID");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lacID),  @"lacID");
  location = self->_location;
  if (location) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"),  @"location");
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_arfcn),  @"arfcn");
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_psc),  @"psc");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F15F50((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  location = self->_location;
  if (location) {
    PBDataWriterWriteSubmessage(a3, location, 5LL);
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_arfcn, 11LL);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_psc, 12LL);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 8) = self->_mcc;
  *((_DWORD *)a3 + 9) = self->_mnc;
  *((_DWORD *)a3 + 3) = self->_cellID;
  *((_DWORD *)a3 + 4) = self->_lacID;
  if (self->_location) {
    objc_msgSend(a3, "setLocation:");
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_arfcn;
    *((_BYTE *)a3 + 44) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_psc;
    *((_BYTE *)a3 + 44) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((_DWORD *)v7 + 8) = self->_mcc;
  *((_DWORD *)v7 + 9) = self->_mnc;
  *((_DWORD *)v7 + 3) = self->_cellID;
  *((_DWORD *)v7 + 4) = self->_lacID;

  *((void *)v7 + 3) = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v7 + 2) = self->_arfcn;
    *((_BYTE *)v7 + 44) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_DWORD *)v7 + 10) = self->_psc;
    *((_BYTE *)v7 + 44) |= 2u;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if (self->_mcc != *((_DWORD *)a3 + 8)
      || self->_mnc != *((_DWORD *)a3 + 9)
      || self->_cellID != *((_DWORD *)a3 + 3)
      || self->_lacID != *((_DWORD *)a3 + 4))
    {
      goto LABEL_17;
    }

    location = self->_location;
    if (!((unint64_t)location | *((void *)a3 + 3))
      || (unsigned int v7 = -[ALSLocation isEqual:](location, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_arfcn != *((_DWORD *)a3 + 2)) {
          goto LABEL_17;
        }
      }

      else if ((*((_BYTE *)a3 + 44) & 1) != 0)
      {
LABEL_17:
        LOBYTE(v7) = 0;
        return v7;
      }

      LOBYTE(v7) = (*((_BYTE *)a3 + 44) & 2) == 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_psc != *((_DWORD *)a3 + 10)) {
          goto LABEL_17;
        }
        LOBYTE(v7) = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t mcc = self->_mcc;
  uint64_t mnc = self->_mnc;
  uint64_t cellID = self->_cellID;
  uint64_t lacID = self->_lacID;
  unint64_t v7 = -[ALSLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v8 = 2654435761LL * self->_arfcn;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0LL;
    return (2654435761LL * mnc) ^ (2654435761LL * mcc) ^ (2654435761LL * cellID) ^ (2654435761LL * lacID) ^ v7 ^ v8 ^ v9;
  }

  uint64_t v8 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761LL * self->_psc;
  return (2654435761LL * mnc) ^ (2654435761LL * mcc) ^ (2654435761LL * cellID) ^ (2654435761LL * lacID) ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t mcc = *((_DWORD *)a3 + 8);
  self->_uint64_t mnc = *((_DWORD *)a3 + 9);
  self->_uint64_t cellID = *((_DWORD *)a3 + 3);
  self->_uint64_t lacID = *((_DWORD *)a3 + 4);
  location = self->_location;
  uint64_t v6 = *((void *)a3 + 3);
  if (location)
  {
    if (v6) {
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[ALSScdmaCellTower setLocation:](self, "setLocation:");
  }

  char v7 = *((_BYTE *)a3 + 44);
  if ((v7 & 1) != 0)
  {
    self->_arfcn = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v7 = *((_BYTE *)a3 + 44);
  }

  if ((v7 & 2) != 0)
  {
    self->_psc = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_uint64_t mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_uint64_t mnc = a3;
}

- (int)cellID
{
  return self->_cellID;
}

- (void)setCellID:(int)a3
{
  self->_uint64_t cellID = a3;
}

- (int)lacID
{
  return self->_lacID;
}

- (void)setLacID:(int)a3
{
  self->_uint64_t lacID = a3;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)arfcn
{
  return self->_arfcn;
}

- (int)psc
{
  return self->_psc;
}

@end