@interface NILocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NILocation)initWithCoder:(id)a3;
- (NILocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 ellipsoidalAltitude:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 course:(double)a12 courseAccuracy:(double)a13 floor:(int64_t)a14 locationType:(int64_t)a15 signalEnvironment:(int64_t)a16;
- (NSDate)timestamp;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)ellipsoidalAltitude;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)speedAccuracy;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)floor;
- (int64_t)locationType;
- (int64_t)signalEnvironment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setCourseAccuracy:(double)a3;
- (void)setEllipsoidalAltitude:(double)a3;
- (void)setFloor:(int64_t)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setLongitude:(double)a3;
- (void)setSignalEnvironment:(int64_t)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedAccuracy:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation NILocation

- (NILocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 ellipsoidalAltitude:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 course:(double)a12 courseAccuracy:(double)a13 floor:(int64_t)a14 locationType:(int64_t)a15 signalEnvironment:(int64_t)a16
{
  id v28 = a3;
  if (!v28) {
    __assert_rtn( "-[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy :speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]",  "NILocation.mm",  37,  "timestamp");
  }
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NILocation;
  v29 = -[NILocation init](&v33, "init");
  if (v29)
  {
    v30 = (NSDate *)[v28 copy];
    timestamp = v29->_timestamp;
    v29->_timestamp = v30;

    v29->_latitude = a4;
    v29->_longitude = a5;
    v29->_altitude = a6;
    v29->_ellipsoidalAltitude = a7;
    v29->_horizontalAccuracy = a8;
    v29->_verticalAccuracy = a9;
    v29->_speed = a10;
    v29->_speedAccuracy = a11;
    v29->_course = a12;
    v29->_courseAccuracy = a13;
    v29->_floor = a14;
    v29->_locationType = a15;
    v29->_signalEnvironment = a16;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]( +[NILocation allocWithZone:](&OBJC_CLASS___NILocation, "allocWithZone:", a3),  "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:s peedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:",  self->_timestamp,  self->_floor,  self->_locationType,  self->_signalEnvironment,  self->_latitude,  self->_longitude,  self->_altitude,  self->_ellipsoidalAltitude,  self->_horizontalAccuracy,  self->_verticalAccuracy,  self->_speed,  self->_speedAccuracy,  *(void *)&self->_course,  *(void *)&self->_courseAccuracy);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v4 encodeDouble:@"latitude" forKey:self->_latitude];
  [v4 encodeDouble:@"longitude" forKey:self->_longitude];
  [v4 encodeDouble:@"altitude" forKey:self->_altitude];
  [v4 encodeDouble:@"ellipsoidalAltitude" forKey:self->_ellipsoidalAltitude];
  [v4 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v4 encodeDouble:@"verticalAccuracy" forKey:self->_verticalAccuracy];
  [v4 encodeDouble:@"speed" forKey:self->_speed];
  [v4 encodeDouble:@"speedAccuracy" forKey:self->_speedAccuracy];
  [v4 encodeDouble:@"course" forKey:self->_course];
  [v4 encodeDouble:@"courseAccuracy" forKey:self->_courseAccuracy];
  [v4 encodeInteger:self->_floor forKey:@"floor"];
  [v4 encodeInteger:self->_locationType forKey:@"locationType"];
  [v4 encodeInteger:self->_signalEnvironment forKey:@"signalEnvironment"];
}

- (NILocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v5), @"timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    [v4 decodeDoubleForKey:@"latitude"];
    double v30 = v10;
    [v4 decodeDoubleForKey:@"longitude"];
    double v29 = v11;
    [v4 decodeDoubleForKey:@"altitude"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"ellipsoidalAltitude"];
    double v15 = v14;
    [v4 decodeDoubleForKey:@"horizontalAccuracy"];
    double v17 = v16;
    [v4 decodeDoubleForKey:@"verticalAccuracy"];
    double v19 = v18;
    [v4 decodeDoubleForKey:@"speed"];
    double v21 = v20;
    [v4 decodeDoubleForKey:@"speedAccuracy"];
    double v23 = v22;
    [v4 decodeDoubleForKey:@"course"];
    uint64_t v25 = v24;
    [v4 decodeDoubleForKey:@"courseAccuracy"];
    v27 = -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]( [NILocation alloc],  "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed: speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:",  v8,  [v4 decodeIntegerForKey:@"floor"],  objc_msgSend(v4, "decodeIntegerForKey:", @"locationType"),  objc_msgSend(v4, "decodeIntegerForKey:", @"signalEnvironment"),  v30,  v29,  v13,  v15,  v17,  v19,  v21,  v23,  v25,  v26);
  }

  else
  {
    v27 = 0LL;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NILocation *)v4;
    v8 = v7;
    if (v7 == self)
    {
      BOOL v37 = 1;
LABEL_27:

      goto LABEL_28;
    }

    timestamp = self->_timestamp;
    if (!timestamp)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NILocation timestamp](v7, "timestamp"));

      if (!v10)
      {
        unsigned int v12 = 1;
        goto LABEL_7;
      }

      timestamp = self->_timestamp;
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[NILocation timestamp](v8, "timestamp"));
    unsigned int v12 = -[NSDate isEqual:](timestamp, "isEqual:", v11);

LABEL_7:
    double latitude = self->_latitude;
    -[NILocation latitude](v8, "latitude");
    double v15 = v14;
    double longitude = self->_longitude;
    -[NILocation longitude](v8, "longitude");
    double v18 = v17;
    double altitude = self->_altitude;
    -[NILocation altitude](v8, "altitude");
    double v21 = v20;
    double ellipsoidalAltitude = self->_ellipsoidalAltitude;
    -[NILocation ellipsoidalAltitude](v8, "ellipsoidalAltitude");
    double v24 = v23;
    double horizontalAccuracy = self->_horizontalAccuracy;
    -[NILocation horizontalAccuracy](v8, "horizontalAccuracy");
    double v50 = v25;
    double verticalAccuracy = self->_verticalAccuracy;
    -[NILocation verticalAccuracy](v8, "verticalAccuracy");
    double v48 = v26;
    double speed = self->_speed;
    -[NILocation speed](v8, "speed");
    double v46 = v27;
    double speedAccuracy = self->_speedAccuracy;
    -[NILocation speedAccuracy](v8, "speedAccuracy");
    double v44 = v28;
    double course = self->_course;
    -[NILocation course](v8, "course");
    double v42 = v29;
    double courseAccuracy = self->_courseAccuracy;
    -[NILocation courseAccuracy](v8, "courseAccuracy");
    double v40 = v30;
    int64_t floor = self->_floor;
    id v32 = -[NILocation floor](v8, "floor");
    int64_t locationType = self->_locationType;
    id v34 = -[NILocation locationType](v8, "locationType");
    int64_t signalEnvironment = self->_signalEnvironment;
    int64_t v36 = -[NILocation signalEnvironment](v8, "signalEnvironment");
    BOOL v37 = 0;
    if (v12
      && latitude == v15
      && longitude == v18
      && altitude == v21
      && ellipsoidalAltitude == v24
      && horizontalAccuracy == v50
      && verticalAccuracy == v48
      && speed == v46
      && speedAccuracy == v44
      && course == v42
      && courseAccuracy == v40
      && (id)floor == v32)
    {
      BOOL v37 = (id)locationType == v34 && signalEnvironment == v36;
    }

    goto LABEL_27;
  }

  BOOL v37 = 0;
LABEL_28:

  return v37;
}

- (unint64_t)hash
{
  timestamp = self->_timestamp;
  if (timestamp) {
    unint64_t v24 = (unint64_t)-[NSDate hash](timestamp, "hash");
  }
  else {
    unint64_t v24 = 0LL;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_latitude));
  unint64_t v23 = (unint64_t)[v31 hash];
  double v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_longitude));
  unint64_t v22 = (unint64_t)[v30 hash];
  double v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_altitude));
  unint64_t v20 = (unint64_t)[v29 hash];
  double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_ellipsoidalAltitude));
  unint64_t v19 = (unint64_t)[v28 hash];
  double v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_horizontalAccuracy));
  unint64_t v18 = (unint64_t)[v27 hash];
  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_verticalAccuracy));
  unint64_t v17 = (unint64_t)[v26 hash];
  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_speed));
  unint64_t v16 = (unint64_t)[v25 hash];
  double v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_speedAccuracy));
  unint64_t v15 = (unint64_t)[v21 hash];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_course));
  unint64_t v5 = (unint64_t)[v4 hash];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_courseAccuracy));
  unint64_t v7 = (unint64_t)[v6 hash];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_floor));
  unint64_t v9 = (unint64_t)[v8 hash];
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_locationType));
  unint64_t v11 = (unint64_t)[v10 hash];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_signalEnvironment));
  unint64_t v13 = v23 ^ v24 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ (unint64_t)[v12 hash];

  return v13;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  unint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NILocation descriptionInternal](self, "descriptionInternal"));
  unint64_t v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.7fdeg",  *(void *)&self->_latitude));
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.7fdeg",  *(void *)&self->_longitude));
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fm",  *(void *)&self->_altitude));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fm",  *(void *)&self->_ellipsoidalAltitude));
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fm",  *(void *)&self->_horizontalAccuracy));
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fm",  *(void *)&self->_verticalAccuracy));
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fm/s",  *(void *)&self->_speed));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fm/s",  *(void *)&self->_speedAccuracy));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fdeg",  *(void *)&self->_course));
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fdeg",  *(void *)&self->_courseAccuracy));
    if (self->_floor == NILocationFloorNotAvailable) {
      uint64_t v6 = @"-";
    }
    else {
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  self->_floor));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  self->_locationType));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  self->_signalEnvironment));
    unint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Time: %@. Pos: [%@, %@, %@ (sea) %@ (ell)] +/- [%@, %@]. Spd: %@ +/- %@. Crs: %@ +/- %@. Flr: %@. LocType: %@. SigEnv: %@.",  self->_timestamp,  v15,  v14,  v3,  v4,  v17,  v16,  v13,  v5,  v12,  v11,  v6,  v8,  v9));
  }

  else
  {
    unint64_t v7 = @"***";
  }

  return v7;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_double altitude = a3;
}

- (double)ellipsoidalAltitude
{
  return self->_ellipsoidalAltitude;
}

- (void)setEllipsoidalAltitude:(double)a3
{
  self->_double ellipsoidalAltitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_double horizontalAccuracy = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_double verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_double speed = a3;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setSpeedAccuracy:(double)a3
{
  self->_double speedAccuracy = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_double course = a3;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setCourseAccuracy:(double)a3
{
  self->_double courseAccuracy = a3;
}

- (int64_t)floor
{
  return self->_floor;
}

- (void)setFloor:(int64_t)a3
{
  self->_int64_t floor = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_int64_t locationType = a3;
}

- (int64_t)signalEnvironment
{
  return self->_signalEnvironment;
}

- (void)setSignalEnvironment:(int64_t)a3
{
  self->_int64_t signalEnvironment = a3;
}

- (void).cxx_destruct
{
}

@end