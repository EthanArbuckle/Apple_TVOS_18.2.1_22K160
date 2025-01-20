@interface CLUsageReportCoordinate
+ (BOOL)supportsSecureCoding;
- (CLUsageReportCoordinate)initWithCoder:(id)a3;
- (CLUsageReportCoordinate)initWithLatitude:(double)a3 longitude:(double)a4;
- (double)latitude;
- (double)longitude;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation CLUsageReportCoordinate

- (CLUsageReportCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLUsageReportCoordinate;
  v6 = -[CLUsageReportCoordinate init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLUsageReportCoordinate setLatitude:](v6, "setLatitude:", a3);
    -[CLUsageReportCoordinate setLongitude:](v7, "setLongitude:", a4);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLUsageReportCoordinate)initWithCoder:(id)a3
{
  double v6 = v5;
  [a3 decodeDoubleForKey:@"CL2dLocationLonCodingKey"];
  return -[CLUsageReportCoordinate initWithLatitude:longitude:](self, "initWithLatitude:longitude:", v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

@end