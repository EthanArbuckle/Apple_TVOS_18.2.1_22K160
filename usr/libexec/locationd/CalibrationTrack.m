@interface CalibrationTrack
+ (BOOL)supportsSecureCoding;
- (CalibrationTrack)initWithCoder:(id)a3;
- (CalibrationTrack)initWithStart:(id)a3 stop:(id)a4 distanceGps:(double)a5 distanceRawPed:(double)a6 steps:(double)a7 gpsSource:(int)a8;
- (NSDate)start;
- (NSDate)stop;
- (double)distanceGps;
- (double)distanceRawPed;
- (double)steps;
- (id)description;
- (int)gpsSource;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceGps:(double)a3;
- (void)setDistanceRawPed:(double)a3;
- (void)setGpsSource:(int)a3;
- (void)setStart:(id)a3;
- (void)setSteps:(double)a3;
- (void)setStop:(id)a3;
@end

@implementation CalibrationTrack

- (CalibrationTrack)initWithStart:(id)a3 stop:(id)a4 distanceGps:(double)a5 distanceRawPed:(double)a6 steps:(double)a7 gpsSource:(int)a8
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CalibrationTrack;
  v14 = -[CalibrationTrack init](&v16, "init");
  if (v14)
  {
    v14->_start = (NSDate *)a3;
    v14->_stop = (NSDate *)a4;
    v14->_distanceGps = a5;
    v14->_distanceRawPed = a6;
    v14->_steps = a7;
    v14->_gpsSource = a8;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalibrationTrack)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CalibrationTrack;
  v4 = -[CalibrationTrack init](&v13, "init");
  if (v4)
  {
    *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___NSDate).n128_u64[0];
    v4->_start = (NSDate *) objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  v6,  @"kCMCalibrationTrackCodingKeyStart",  v5);
    *(void *)&double v7 = objc_opt_class(&OBJC_CLASS___NSDate).n128_u64[0];
    v4->_stop = (NSDate *) objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  v8,  @"kCMCalibrationTrackCodingKeyStop",  v7);
    [a3 decodeDoubleForKey:@"kCMCalibrationTrackCodingKeyDistanceGps"];
    v4->_distanceGps = v9;
    [a3 decodeDoubleForKey:@"kCMCalibrationTrackCodingKeyDistanceRawPed"];
    v4->_distanceRawPed = v10;
    [a3 decodeDoubleForKey:@"kCMCalibrationTrackCodingKeySteps"];
    v4->_steps = v11;
    v4->_gpsSource = [a3 decodeInt32ForKey:@"kCMCalibrationTrackCodingKeyGpsSource"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CalibrationTrack;
  -[CalibrationTrack dealloc](&v3, "dealloc");
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  -[NSDate timeIntervalSinceReferenceDate](-[CalibrationTrack start](self, "start"), "timeIntervalSinceReferenceDate");
  uint64_t v6 = v5;
  -[NSDate timeIntervalSinceReferenceDate](-[CalibrationTrack stop](self, "stop"), "timeIntervalSinceReferenceDate");
  uint64_t v8 = v7;
  -[CalibrationTrack distanceGps](self, "distanceGps");
  uint64_t v10 = v9;
  -[CalibrationTrack distanceRawPed](self, "distanceRawPed");
  uint64_t v12 = v11;
  -[CalibrationTrack steps](self, "steps");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,TimeStart,%0.2f,TimeEnd,%0.2f,DistanceGps,%0.2f,DistanceRawPed,%0.2f,Steps,%0.2f,GpsSource,%ld",  v4,  v6,  v8,  v10,  v12,  v13,  -[CalibrationTrack gpsSource](self, "gpsSource"));
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (NSDate)stop
{
  return self->_stop;
}

- (void)setStop:(id)a3
{
}

- (double)distanceGps
{
  return self->_distanceGps;
}

- (void)setDistanceGps:(double)a3
{
  self->_distanceGps = a3;
}

- (double)distanceRawPed
{
  return self->_distanceRawPed;
}

- (void)setDistanceRawPed:(double)a3
{
  self->_distanceRawPed = a3;
}

- (double)steps
{
  return self->_steps;
}

- (void)setSteps:(double)a3
{
  self->_steps = a3;
}

- (int)gpsSource
{
  return self->_gpsSource;
}

- (void)setGpsSource:(int)a3
{
  self->_gpsSource = a3;
}

@end