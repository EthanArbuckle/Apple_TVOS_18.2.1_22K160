@interface ALSNearbyRequest
- (ALSMeta)meta;
- (BOOL)hasMeta;
- (BOOL)hasNeedCellsTowers;
- (BOOL)hasNumberOfSurroundingWifis;
- (BOOL)hasRadius;
- (BOOL)hasTechnology;
- (BOOL)hasWifiAltitudeScale;
- (BOOL)hasWifiGranularity;
- (BOOL)isEqual:(id)a3;
- (BOOL)needCellsTowers;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)technologyAsString:(int)a3;
- (id)wifiAltitudeScaleAsString:(int)a3;
- (id)wifiBandsAsString:(int)a3;
- (id)wifiGranularityAsString:(int)a3;
- (int)StringAsTechnology:(id)a3;
- (int)StringAsWifiAltitudeScale:(id)a3;
- (int)StringAsWifiBands:(id)a3;
- (int)StringAsWifiGranularity:(id)a3;
- (int)numberOfSurroundingWifis;
- (int)radius;
- (int)technology;
- (int)wifiAltitudeScale;
- (int)wifiBands;
- (int)wifiBandsAtIndex:(unint64_t)a3;
- (int)wifiGranularity;
- (int64_t)latitude;
- (int64_t)longitude;
- (unint64_t)hash;
- (unint64_t)wifiBandsCount;
- (unsigned)requestTypeCode;
- (void)addWifiBands:(int)a3;
- (void)clearWifiBands;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasNeedCellsTowers:(BOOL)a3;
- (void)setHasNumberOfSurroundingWifis:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setHasTechnology:(BOOL)a3;
- (void)setHasWifiAltitudeScale:(BOOL)a3;
- (void)setHasWifiGranularity:(BOOL)a3;
- (void)setLatitude:(int64_t)a3;
- (void)setLongitude:(int64_t)a3;
- (void)setMeta:(id)a3;
- (void)setNeedCellsTowers:(BOOL)a3;
- (void)setNumberOfSurroundingWifis:(int)a3;
- (void)setRadius:(int)a3;
- (void)setTechnology:(int)a3;
- (void)setWifiAltitudeScale:(int)a3;
- (void)setWifiBands:(int *)a3 count:(unint64_t)a4;
- (void)setWifiGranularity:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSNearbyRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSNearbyRequest;
  -[ALSNearbyRequest dealloc](&v3, "dealloc");
}

- (void)setNeedCellsTowers:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_needCellsTowers = a3;
}

- (void)setHasNeedCellsTowers:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNeedCellsTowers
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumberOfSurroundingWifis:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfSurroundingWifis = a3;
}

- (void)setHasNumberOfSurroundingWifis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfSurroundingWifis
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)technology
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_technology;
  }
  else {
    return 1;
  }
}

- (void)setTechnology:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_technology = a3;
}

- (void)setHasTechnology:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTechnology
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)technologyAsString:(int)a3
{
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 128) {
        return @"kRadioAccessTechnologySCDMA";
      }
      if (a3 == 256) {
        return @"kRadioAccessTechnologyNR5G";
      }
    }

    else
    {
      if (a3 == 32) {
        return @"kRadioAccessTechnologyCDMAHybrid";
      }
      if (a3 == 64) {
        return @"kRadioAccessTechnologyLTE";
      }
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  id result = @"kRadioAccessTechnologyGSM";
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      id result = @"kRadioAccessTechnologyGSMCompact";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
    case 4:
      id result = @"kRadioAccessTechnologyUTRAN";
      break;
    case 8:
      id result = @"kRadioAccessTechnologyCDMA1x";
      break;
    default:
      if (a3 != 16) {
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
      }
      id result = @"kRadioAccessTechnologyCDMAEVDO";
      break;
  }

  return result;
}

- (int)StringAsTechnology:(id)a3
{
  return 1;
}

- (int)wifiGranularity
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    return self->_wifiGranularity;
  }
  else {
    return 1;
  }
}

- (void)setWifiGranularity:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_wifiGranularity = a3;
}

- (void)setHasWifiGranularity:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWifiGranularity
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)wifiGranularityAsString:(int)a3
{
  switch(a3)
  {
    case 1:
      return @"kGranularityFine";
    case 4:
      return @"kGranularityNearby";
    case 2:
      return @"kGranularityCoarse";
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsWifiGranularity:(id)a3
{
  return 1;
}

- (void)setRadius:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)wifiBandsCount
{
  return self->_wifiBands.count;
}

- (int)wifiBands
{
  return self->_wifiBands.list;
}

- (void)clearWifiBands
{
}

- (void)addWifiBands:(int)a3
{
}

- (int)wifiBandsAtIndex:(unint64_t)a3
{
  p_wifiBands = &self->_wifiBands;
  unint64_t count = self->_wifiBands.count;
  if (count <= a3) {
    -[NSException raise]( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count),  0LL),  "raise");
  }
  return p_wifiBands->list[a3];
}

- (void)setWifiBands:(int *)a3 count:(unint64_t)a4
{
}

- (id)wifiBandsAsString:(int)a3
{
  if (a3 == 1) {
    return @"k2dot4GHZ";
  }
  if (a3 == 2) {
    return @"k5GHZ";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsWifiBands:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"k2dot4GHZ"] & 1) == 0)
  {
    else {
      return 1;
    }
  }

  return v4;
}

- (int)wifiAltitudeScale
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_wifiAltitudeScale;
  }
  else {
    return 1;
  }
}

- (void)setWifiAltitudeScale:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_wifiAltitudeScale = a3;
}

- (void)setHasWifiAltitudeScale:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifiAltitudeScale
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)wifiAltitudeScaleAsString:(int)a3
{
  if (a3 == 1) {
    return @"kWifiAltitudeScaleNone";
  }
  if (a3 == 2) {
    return @"kWifiAltitudeScale10toThe2";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsWifiAltitudeScale:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"kWifiAltitudeScaleNone"] & 1) == 0)
  {
    else {
      return 1;
    }
  }

  return v4;
}

- (BOOL)hasMeta
{
  return self->_meta != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSNearbyRequest;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSNearbyRequest description](&v3, "description"),  -[ALSNearbyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_latitude),  @"Latitude");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_longitude),  @"Longitude");
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_needCellsTowers),  @"needCellsTowers");
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingWifis),  @"numberOfSurroundingWifis");
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100B91B30((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField(a3, self->_needCellsTowers, 3LL);
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingWifis, 4LL);
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

- (unsigned)requestTypeCode
{
  return 3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSNearbyResponse);
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 4) = self->_latitude;
  *((void *)a3 + 5) = self->_longitude;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)a3 + 76) = self->_needCellsTowers;
    *((_BYTE *)a3 + 80) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 14) = self->_numberOfSurroundingWifis;
  *((_BYTE *)a3 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_18:
    *((_DWORD *)a3 + 18) = self->_wifiGranularity;
    *((_BYTE *)a3 + 80) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unint64_t v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  id v8 = v7;
  v7[4] = self->_latitude;
  v7[5] = self->_longitude;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v7 + 76) = self->_needCellsTowers;
    *((_BYTE *)v7 + 80) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v7 + 14) = self->_numberOfSurroundingWifis;
  *((_BYTE *)v7 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int IsEqual = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (!IsEqual) {
    return IsEqual;
  }
  if (self->_latitude != *((void *)a3 + 4) || self->_longitude != *((void *)a3 + 5)) {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 80) & 0x20) != 0) {
      goto LABEL_40;
    }
    goto LABEL_12;
  }

  if ((*((_BYTE *)a3 + 80) & 0x20) == 0) {
    goto LABEL_40;
  }
  if (self->_needCellsTowers)
  {
    if (!*((_BYTE *)a3 + 76)) {
      goto LABEL_40;
    }
    goto LABEL_12;
  }

  if (*((_BYTE *)a3 + 76))
  {
LABEL_40:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v3 = 2654435761LL * self->_needCellsTowers;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_numberOfSurroundingWifis;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_technology;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  self->_int64_t latitude = *((void *)a3 + 4);
  self->_int64_t longitude = *((void *)a3 + 5);
  char v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 0x20) != 0)
  {
    self->_needCellsTowers = *((_BYTE *)a3 + 76);
    *(_BYTE *)&self->_has |= 0x20u;
    char v5 = *((_BYTE *)a3 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)a3 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_numberOfSurroundingWifis = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 1u;
  char v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (int64_t)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(int64_t)a3
{
  self->_int64_t latitude = a3;
}

- (int64_t)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(int64_t)a3
{
  self->_int64_t longitude = a3;
}

- (BOOL)needCellsTowers
{
  return self->_needCellsTowers;
}

- (int)numberOfSurroundingWifis
{
  return self->_numberOfSurroundingWifis;
}

- (int)radius
{
  return self->_radius;
}

- (ALSMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

@end