@interface ALSNr5GCellTower
- (ALSLocation)location;
- (BOOL)hasCellID;
- (BOOL)hasLocation;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNrarfcn;
- (BOOL)hasTacID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)mcc;
- (int)mnc;
- (int)nrarfcn;
- (int)tacID;
- (int64_t)cellID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCellID:(int64_t)a3;
- (void)setHasCellID:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNrarfcn:(BOOL)a3;
- (void)setHasTacID:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setNrarfcn:(int)a3;
- (void)setTacID:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSNr5GCellTower

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSNr5GCellTower;
  -[ALSNr5GCellTower dealloc](&v3, "dealloc");
}

- (void)setMcc:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMcc
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMnc:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMnc
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCellID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cellID = a3;
}

- (void)setHasCellID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTacID:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tacID = a3;
}

- (void)setHasTacID:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTacID
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0LL;
}

- (void)setNrarfcn:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_nrarfcn = a3;
}

- (void)setHasNrarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNrarfcn
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSNr5GCellTower;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSNr5GCellTower description](&v3, "description"),  -[ALSNr5GCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc),  @"mcc");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mnc),  @"mnc");
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10101375C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_mcc, 1LL);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_mnc, 2LL);
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mcc;
    *((_BYTE *)a3 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 7) = self->_mnc;
  *((_BYTE *)a3 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  v8 = v7;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v7 + 6) = self->_mcc;
    *((_BYTE *)v7 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v7 + 7) = self->_mnc;
  *((_BYTE *)v7 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
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
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_mcc != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_29:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_mnc != *((_DWORD *)a3 + 7)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_cellID != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_29;
    }

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_tacID != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }

    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }

    location = self->_location;
    if ((unint64_t)location | *((void *)a3 + 2))
    {
      unsigned int v7 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v7) {
        return v7;
      }
      char has = (char)self->_has;
    }

    LOBYTE(v7) = (*((_BYTE *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_nrarfcn != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_mcc;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_mnc;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0LL;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761LL * self->_cellID;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761LL * self->_tacID;
    goto LABEL_10;
  }

- (void)mergeFrom:(id)a3
{
  char v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_mnc = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  char v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (int)mcc
{
  return self->_mcc;
}

- (int)mnc
{
  return self->_mnc;
}

- (int64_t)cellID
{
  return self->_cellID;
}

- (int)tacID
{
  return self->_tacID;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)nrarfcn
{
  return self->_nrarfcn;
}

@end