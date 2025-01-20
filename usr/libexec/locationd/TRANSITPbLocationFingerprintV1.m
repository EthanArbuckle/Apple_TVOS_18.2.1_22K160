@interface TRANSITPbLocationFingerprintV1
- (BOOL)hasLatitude;
- (BOOL)hasLocationId;
- (BOOL)hasLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)macModes;
- (NSString)locationId;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)macModesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)macModesCount;
- (void)addMacModes:(id)a3;
- (void)clearMacModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationId:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMacModes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbLocationFingerprintV1

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbLocationFingerprintV1;
  -[TRANSITPbLocationFingerprintV1 dealloc](&v3, "dealloc");
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0LL;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearMacModes
{
}

- (void)addMacModes:(id)a3
{
  macModes = self->_macModes;
  if (!macModes)
  {
    macModes = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_macModes = macModes;
  }

  -[NSMutableArray addObject:](macModes, "addObject:", a3);
}

- (unint64_t)macModesCount
{
  return (unint64_t)-[NSMutableArray count](self->_macModes, "count");
}

- (id)macModesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_macModes, "objectAtIndex:", a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbLocationFingerprintV1;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbLocationFingerprintV1 description](&v3, "description"),  -[TRANSITPbLocationFingerprintV1 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  locationId = self->_locationId;
  if (locationId) {
    [v3 setObject:locationId forKey:@"locationId"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude),  @"latitude");
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude),  @"longitude");
  }
  if (-[NSMutableArray count](self->_macModes, "count"))
  {
    v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_macModes, "count"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    macModes = self->_macModes;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( macModes,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(macModes);
          }
          -[NSMutableArray addObject:]( v7,  "addObject:",  [*(id *)(*((void *)&v14 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( macModes,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v10);
    }

    [v4 setObject:v7 forKey:@"macModes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BEA714((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  locationId = self->_locationId;
  if (locationId) {
    PBDataWriterWriteStringField(a3, locationId, 1LL);
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 2LL, self->_latitude);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField(a3, 3LL, self->_longitude);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  macModes = self->_macModes;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( macModes,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(macModes);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v12 + 1) + 8LL * (void)i), 4LL);
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( macModes,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

- (void)copyTo:(id)a3
{
  if (self->_locationId) {
    objc_msgSend(a3, "setLocationId:");
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)a3 + 1) = *(void *)&self->_latitude;
    *((_BYTE *)a3 + 40) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = *(void *)&self->_longitude;
    *((_BYTE *)a3 + 40) |= 2u;
  }

  if (-[TRANSITPbLocationFingerprintV1 macModesCount](self, "macModesCount"))
  {
    [a3 clearMacModes];
    unint64_t v6 = -[TRANSITPbLocationFingerprintV1 macModesCount](self, "macModesCount");
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
        objc_msgSend( a3,  "addMacModes:",  -[TRANSITPbLocationFingerprintV1 macModesAtIndex:](self, "macModesAtIndex:", i));
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unint64_t v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[3] = -[NSString copyWithZone:](self->_locationId, "copyWithZone:", a3);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7[1] = *(id *)&self->_latitude;
    *((_BYTE *)v7 + 40) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v7[2] = *(id *)&self->_longitude;
    *((_BYTE *)v7 + 40) |= 2u;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  macModes = self->_macModes;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( macModes,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(macModes);
        }
        id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) copyWithZone:a3];
        [v7 addMacModes:v14];
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( macModes,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v11);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    locationId = self->_locationId;
    if (!((unint64_t)locationId | *((void *)a3 + 3))
      || (unsigned int v7 = -[NSString isEqual:](locationId, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
      }

      else if ((*((_BYTE *)a3 + 40) & 1) != 0)
      {
LABEL_16:
        LOBYTE(v7) = 0;
        return v7;
      }

      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
      }

      else if ((*((_BYTE *)a3 + 40) & 2) != 0)
      {
        goto LABEL_16;
      }

      macModes = self->_macModes;
      else {
        LOBYTE(v7) = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_locationId, "hash");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    double latitude = self->_latitude;
    double v7 = -latitude;
    if (latitude >= 0.0) {
      double v7 = self->_latitude;
    }
    double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }

    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  if ((has & 2) != 0)
  {
    double longitude = self->_longitude;
    double v12 = -longitude;
    if (longitude >= 0.0) {
      double v12 = self->_longitude;
    }
    double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }

    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  return v5 ^ v3 ^ v10 ^ (unint64_t)-[NSMutableArray hash](self->_macModes, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[TRANSITPbLocationFingerprintV1 setLocationId:](self, "setLocationId:");
  }
  char v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_double latitude = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)a3 + 40);
  }

  if ((v5 & 2) != 0)
  {
    self->_double longitude = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TRANSITPbLocationFingerprintV1 addMacModes:]( self,  "addMacModes:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i));
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSMutableArray)macModes
{
  return self->_macModes;
}

- (void)setMacModes:(id)a3
{
}

@end