@interface CLPVehicleType
- (id)initWithCLMotionActivity:(CLMotionActivity *)a3;
@end

@implementation CLPVehicleType

- (id)initWithCLMotionActivity:(CLMotionActivity *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CLPVehicleType;
  v13 = -[CLPVehicleType init]( &v16,  "init",  a3,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  *(void *)&a8,  *(void *)&a9,  a4,  a10);
  if (v13)
  {
    BOOL v14 = +[CLPMeta isInIndia](&OBJC_CLASS___CLPMeta, "isInIndia")
    -[CLPVehicleType setIsMotorcycle:](v13, "setIsMotorcycle:", v14);
  }

  return v13;
}

@end