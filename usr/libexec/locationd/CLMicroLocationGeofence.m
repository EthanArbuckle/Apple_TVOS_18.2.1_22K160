@interface CLMicroLocationGeofence
- (CLLocation)regionCenterLocation;
- (CLMicroLocationGeofence)init;
- (NSString)regionId;
- (void)dealloc;
- (void)setRegionCenterLocation:(id)a3;
- (void)setRegionId:(id)a3;
@end

@implementation CLMicroLocationGeofence

- (CLMicroLocationGeofence)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMicroLocationGeofence;
  return -[CLMicroLocationGeofence init](&v3, "init");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMicroLocationGeofence;
  -[CLMicroLocationGeofence dealloc](&v3, "dealloc");
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void)setRegionId:(id)a3
{
}

- (CLLocation)regionCenterLocation
{
  return self->_regionCenterLocation;
}

- (void)setRegionCenterLocation:(id)a3
{
}

@end