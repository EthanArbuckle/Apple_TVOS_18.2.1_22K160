@interface CLWifiAssociatedApCentroidDO
- (BOOL)isEqual:(id)a3;
- (CLWifiAssociatedApCentroidDO)initWithMac:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 reach:(int)a9 stationaryTimeInSeconds:(double)a10 loiType:(id)a11 lastUpdated:(double)a12;
- (CLWifiAssociatedApCentroidDO)initWithNSDictionary:(id)a3;
- (NSString)loiType;
- (NSString)mac;
- (double)altitude;
- (double)horizontalAccuracy;
- (double)lastUpdated;
- (double)latitude;
- (double)longitude;
- (double)stationaryTimeInSeconds;
- (double)verticalAccuracy;
- (id)description;
- (id)toNSDictionary;
- (int)reach;
- (void)dealloc;
- (void)setAltitude:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLastUpdated:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLoiType:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMac:(id)a3;
- (void)setReach:(int)a3;
- (void)setStationaryTimeInSeconds:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation CLWifiAssociatedApCentroidDO

- (CLWifiAssociatedApCentroidDO)initWithMac:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 reach:(int)a9 stationaryTimeInSeconds:(double)a10 loiType:(id)a11 lastUpdated:(double)a12
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CLWifiAssociatedApCentroidDO;
  v22 = -[CLWifiAssociatedApCentroidDO init](&v24, "init");
  if (v22)
  {
    v22->_mac = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a3);
    v22->_horizontalAccuracy = a7;
    v22->_latitude = a4;
    v22->_longitude = a5;
    v22->_altitude = a6;
    v22->_reach = a9;
    v22->_stationaryTimeInSeconds = a10;
    v22->_verticalAccuracy = a8;
    v22->_loiType = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a11);
    v22->_lastUpdated = a12;
  }

  return v22;
}

- (CLWifiAssociatedApCentroidDO)initWithNSDictionary:(id)a3
{
  id v5 = [a3 objectForKey:@"mac"];
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"latitude"), "doubleValue");
  double v7 = v6;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"longitude"), "doubleValue");
  double v9 = v8;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"altitude"), "doubleValue");
  double v11 = v10;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"horizontalAccuracy"), "doubleValue");
  double v13 = v12;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"verticalAccuracy"), "doubleValue");
  double v15 = v14;
  id v16 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"reach"), "intValue");
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"stationaryTimeInSeconds"), "doubleValue");
  double v18 = v17;
  id v19 = [a3 objectForKey:@"loiType"];
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"lastUpdated"), "doubleValue");
  return -[CLWifiAssociatedApCentroidDO initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loiType:lastUpdated:]( self,  "initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loi Type:lastUpdated:",  v5,  v16,  v19,  v7,  v9,  v11,  v13,  v15,  v18,  v20);
}

- (id)toNSDictionary
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v3 setObject:self->_mac forKey:@"mac"];
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude),  @"latitude");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude),  @"longitude");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_altitude),  @"altitude");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_horizontalAccuracy),  @"horizontalAccuracy");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_verticalAccuracy),  @"verticalAccuracy");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_reach),  @"reach");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_stationaryTimeInSeconds),  @"stationaryTimeInSeconds");
  [v3 setObject:self->_loiType forKey:@"loiType"];
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastUpdated),  @"lastUpdated");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    unsigned int v7 = -[NSString isEqualToString:](self->_mac, "isEqualToString:", [a3 mac]);
    if (v7)
    {
      double latitude = self->_latitude;
      [a3 latitude];
      if (latitude != v9) {
        goto LABEL_12;
      }
      double longitude = self->_longitude;
      [a3 longitude];
      if (longitude != v11) {
        goto LABEL_12;
      }
      double altitude = self->_altitude;
      [a3 altitude];
      if (altitude != v13) {
        goto LABEL_12;
      }
      double horizontalAccuracy = self->_horizontalAccuracy;
      [a3 horizontalAccuracy];
      if (horizontalAccuracy == v15
        && (double verticalAccuracy = self->_verticalAccuracy, [a3 verticalAccuracy], verticalAccuracy == v17)
        && (int reach = self->_reach, reach == [a3 reach])
        && (double stationaryTimeInSeconds = self->_stationaryTimeInSeconds,
            [a3 stationaryTimeInSeconds],
            stationaryTimeInSeconds == v20))
      {
        unsigned int v7 = -[NSString isEqualToString:](self->_loiType, "isEqualToString:", [a3 loiType]);
        if (v7)
        {
          double lastUpdated = self->_lastUpdated;
          [a3 lastUpdated];
          LOBYTE(v7) = lastUpdated == v22;
        }
      }

      else
      {
LABEL_12:
        LOBYTE(v7) = 0;
      }
    }
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<mac, %@, lat, %f, lng, %f, alt, %f, hacc, %f, vacc, %f, reach, %d, stationaryTimeInSeconds, %f, loiType, %@, lastUpdated, %f>",  NSStringFromClass(v3),  self->_mac,  *(void *)&self->_latitude,  *(void *)&self->_longitude,  *(void *)&self->_altitude,  *(void *)&self->_horizontalAccuracy,  *(void *)&self->_verticalAccuracy,  self->_reach,  *(void *)&self->_stationaryTimeInSeconds,  self->_loiType,  *(void *)&self->_lastUpdated);
}

- (void)dealloc
{
  self->_mac = 0LL;
  self->_loiType = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWifiAssociatedApCentroidDO;
  -[CLWifiAssociatedApCentroidDO dealloc](&v3, "dealloc");
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_double altitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_double horizontalAccuracy = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (NSString)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(id)a3
{
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
}

- (int)reach
{
  return self->_reach;
}

- (void)setReach:(int)a3
{
  self->_int reach = a3;
}

- (double)stationaryTimeInSeconds
{
  return self->_stationaryTimeInSeconds;
}

- (void)setStationaryTimeInSeconds:(double)a3
{
  self->_double stationaryTimeInSeconds = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_double verticalAccuracy = a3;
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  self->_double lastUpdated = a3;
}

@end