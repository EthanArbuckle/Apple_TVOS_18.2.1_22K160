@interface CLCompanionSyncInterestZone
- (BOOL)clearClient;
- (BOOL)hasAuthMask;
- (BOOL)hasClearClient;
- (BOOL)hasCorrectiveCompensationMask;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasPhenolicLocation;
- (BOOL)hasProvenance;
- (BOOL)hasRadius;
- (BOOL)hasServiceMaskOperator;
- (BOOL)hasZoneType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)zoneIdentifier;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)authMask;
- (unsigned)correctiveCompensationMask;
- (unsigned)phenolicLocation;
- (unsigned)provenance;
- (unsigned)serviceMaskOperator;
- (unsigned)zoneType;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAuthMask:(unsigned int)a3;
- (void)setClearClient:(BOOL)a3;
- (void)setCorrectiveCompensationMask:(unsigned int)a3;
- (void)setHasAuthMask:(BOOL)a3;
- (void)setHasClearClient:(BOOL)a3;
- (void)setHasCorrectiveCompensationMask:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasPhenolicLocation:(BOOL)a3;
- (void)setHasProvenance:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setHasServiceMaskOperator:(BOOL)a3;
- (void)setHasZoneType:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setPhenolicLocation:(unsigned int)a3;
- (void)setProvenance:(unsigned int)a3;
- (void)setRadius:(double)a3;
- (void)setServiceMaskOperator:(unsigned int)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)setZoneType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCompanionSyncInterestZone

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCompanionSyncInterestZone;
  -[CLCompanionSyncInterestZone dealloc](&v3, "dealloc");
}

- (unsigned)authMask
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_authMask;
  }
  else {
    return 0;
  }
}

- (void)setAuthMask:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_authMask = a3;
}

- (void)setHasAuthMask:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAuthMask
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCorrectiveCompensationMask:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_correctiveCompensationMask = a3;
}

- (void)setHasCorrectiveCompensationMask:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCorrectiveCompensationMask
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setZoneType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_zoneType = a3;
}

- (void)setHasZoneType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasZoneType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLatitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRadius:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRadius
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPhenolicLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_phenolicLocation = a3;
}

- (void)setHasPhenolicLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPhenolicLocation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setServiceMaskOperator:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_serviceMaskOperator = a3;
}

- (void)setHasServiceMaskOperator:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasServiceMaskOperator
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setProvenance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_provenance = a3;
}

- (void)setHasProvenance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasProvenance
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)clearClient
{
  return (*(_WORD *)&self->_has & 0x200) != 0 && self->_clearClient;
}

- (void)setClearClient:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_clearClient = a3;
}

- (void)setHasClearClient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasClearClient
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCompanionSyncInterestZone;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCompanionSyncInterestZone description](&v3, "description"),  -[CLCompanionSyncInterestZone dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier) {
    [v3 setObject:zoneIdentifier forKey:@"zoneIdentifier"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_authMask),  @"authMask");
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }

  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }

  objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  self->_correctiveCompensationMask),  @"correctiveCompensationMask");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10040D660((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  zoneIdentifier = self->_zoneIdentifier;
  if (!zoneIdentifier) {
    sub_101238F4C();
  }
  PBDataWriterWriteStringField(a3, zoneIdentifier, 1LL);
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_authMask, 2LL);
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_4:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x10) == 0)
  {
    goto LABEL_4;
  }

  PBDataWriterWriteUint32Field(a3, self->_correctiveCompensationMask, 3LL);
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_authMask;
    *((_WORD *)a3 + 36) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 9) = self->_correctiveCompensationMask;
  *((_WORD *)a3 + 36) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");

  v5[7] = -[NSString copyWithZone:](self->_zoneIdentifier, "copyWithZone:", a3);
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_authMask;
    *((_WORD *)v5 + 36) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 9) = self->_correctiveCompensationMask;
  *((_WORD *)v5 + 36) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    zoneIdentifier = self->_zoneIdentifier;
    if (!((unint64_t)zoneIdentifier | *((void *)a3 + 7))
      || (unsigned int v5 = -[NSString isEqual:](zoneIdentifier, "isEqual:")) != 0)
    {
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)a3 + 36);
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_authMask != *((_DWORD *)a3 + 8)) {
          goto LABEL_51;
        }
      }

      else if ((v8 & 8) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_correctiveCompensationMask != *((_DWORD *)a3 + 9)) {
          goto LABEL_51;
        }
      }

      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_51;
      }

      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x100) == 0 || self->_zoneType != *((_DWORD *)a3 + 16)) {
          goto LABEL_51;
        }
      }

      else if ((*((_WORD *)a3 + 36) & 0x100) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 1) != 0)
      {
      }

      else if ((v8 & 1) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 2) != 0)
      {
      }

      else if ((v8 & 2) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 4) != 0)
      {
      }

      else if ((v8 & 4) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_phenolicLocation != *((_DWORD *)a3 + 12)) {
          goto LABEL_51;
        }
      }

      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_serviceMaskOperator != *((_DWORD *)a3 + 11)) {
          goto LABEL_51;
        }
      }

      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_51;
      }

      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_provenance != *((_DWORD *)a3 + 10)) {
          goto LABEL_51;
        }
      }

      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_51;
      }

      LOBYTE(v5) = (v8 & 0x200) == 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x200) == 0)
        {
LABEL_51:
          LOBYTE(v5) = 0;
          return v5;
        }

        if (self->_clearClient)
        {
          if (!*((_BYTE *)a3 + 68)) {
            goto LABEL_51;
          }
        }

        else if (*((_BYTE *)a3 + 68))
        {
          goto LABEL_51;
        }

        LOBYTE(v5) = 1;
      }
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_zoneIdentifier, "hash");
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_authMask;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761LL * self->_correctiveCompensationMask;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v7 = 0LL;
      if ((has & 1) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v12 = 0LL;
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v6 = 0LL;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v7 = 2654435761LL * self->_zoneType;
  if ((has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double latitude = self->_latitude;
  double v9 = -latitude;
  if (latitude >= 0.0) {
    double v9 = self->_latitude;
  }
  double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }

  else
  {
    v12 -= (unint64_t)fabs(v11);
  }

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 7)) {
    -[CLCompanionSyncInterestZone setZoneIdentifier:](self, "setZoneIdentifier:");
  }
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 8) != 0)
  {
    self->_authMask = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)a3 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_5:
      if ((v5 & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }

  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_5;
  }

  self->_correctiveCompensationMask = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }

- (NSString)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (unsigned)correctiveCompensationMask
{
  return self->_correctiveCompensationMask;
}

- (unsigned)zoneType
{
  return self->_zoneType;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)radius
{
  return self->_radius;
}

- (unsigned)phenolicLocation
{
  return self->_phenolicLocation;
}

- (unsigned)serviceMaskOperator
{
  return self->_serviceMaskOperator;
}

- (unsigned)provenance
{
  return self->_provenance;
}

@end