@interface CMVehicleStateData
+ (BOOL)supportsSecureCoding;
- (CMMotionTimeRange)timeRange;
- (CMVehicleStateData)initWithCoder:(id)a3;
- (CMVehicleStateData)initWithTimeRange:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 vehicleBluetoothAddress:(id)a6;
- (CMVehicleStateData)initWithTimestamp:(id)a3 state:(unint64_t)a4 hints:(unint64_t)a5;
- (NSString)deviceId;
- (NSString)vehicleBluetoothAddress;
- (NSString)vehicleModelName;
- (NSString)vehicleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)vehicularHints;
- (unint64_t)vehicularState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMVehicleStateData

- (CMVehicleStateData)initWithTimeRange:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 vehicleBluetoothAddress:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CMVehicleStateData;
  v10 = -[CMVehicleStateData init](&v12, "init");
  if (v10)
  {
    *((void *)v10 + 1) = a3;
    *((void *)v10 + 2) = a4;
    *((void *)v10 + 3) = a5;
    *((void *)v10 + 4) = a6;
    *(_OWORD *)(v10 + 40) = xmmword_1012F1150;
  }

  return (CMVehicleStateData *)v10;
}

- (CMVehicleStateData)initWithTimestamp:(id)a3 state:(unint64_t)a4 hints:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CMVehicleStateData;
  v8 = -[CMVehicleStateData init](&v14, "init");
  if (v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___CMMotionTimeRange);
    [a3 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [a3 timeIntervalSinceReferenceDate];
    v8->fTimeRange = -[CMMotionTimeRange initWithStartDate:endDate:](v9, "initWithStartDate:endDate:", v11, v12);
    v8->fVehicleName = 0LL;
    v8->fVehicleModelName = 0LL;
    v8->fVehicleBluetoothAddress = 0LL;
    v8->fVehicularState = a4;
    v8->fVehicularHints = a5;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMVehicleStateData;
  -[CMVehicleStateData dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if (v4)
  {
    *((void *)v4 + 1) = -[CMMotionTimeRange copy](self->fTimeRange, "copy");
    *((void *)v4 + 2) = -[NSString copy](self->fVehicleName, "copy");
    *((void *)v4 + 3) = -[NSString copy](self->fVehicleModelName, "copy");
    *((void *)v4 + 4) = -[NSString copy](self->fVehicleBluetoothAddress, "copy");
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&self->fVehicularState;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVehicleStateData)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CMVehicleStateData;
  v4 = -[CMVehicleStateData init](&v6, "init");
  if (v4)
  {
    v4->fTimeRange = (CMMotionTimeRange *) [a3 decodeObjectOfClass:objc_opt_class(CMMotionTimeRange) forKey:@"kCMVehicleStateDataCodingKeyTimeRange"];
    v4->fVehicleName = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kCMVehicleStateDataCodingKeyVehicleName"];
    v4->fVehicleModelName = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kCMVehicleStateDataCodingKeyVehicleModelName"];
    v4->fVehicleBluetoothAddress = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"];
    v4->fVehicularState = (unint64_t)[a3 decodeIntegerForKey:@"kCMVehicleStateDataCodingKeyState"];
    v4->fVehicularHints = (unint64_t)[a3 decodeIntegerForKey:@"kCMVehicleStateDataCodingKeyHints"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<startDate %@, endDate %@, deviceId %@, vehicleName %@, vehicleModelName %@, vehicleBluetoothAddress %@, state %@, hints %@>",  NSStringFromClass(v3),  -[CMMotionTimeRange startDate](-[CMVehicleStateData timeRange](self, "timeRange"), "startDate"),  -[CMMotionTimeRange endDate](-[CMVehicleStateData timeRange](self, "timeRange"), "endDate"),  -[CMVehicleStateData deviceId](self, "deviceId"),  -[CMVehicleStateData vehicleName](self, "vehicleName"),  -[CMVehicleStateData vehicleModelName](self, "vehicleModelName"),  -[CMVehicleStateData vehicleBluetoothAddress](self, "vehicleBluetoothAddress"),  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CMVehicleStateData vehicularState](self, "vehicularState")),  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CMVehicleStateData vehicularHints](self, "vehicularHints")));
}

- (CMMotionTimeRange)timeRange
{
  return self->fTimeRange;
}

- (NSString)deviceId
{
  result = self->fVehicleName;
  if (!result) {
    return self->fVehicleBluetoothAddress;
  }
  return result;
}

- (NSString)vehicleName
{
  return self->fVehicleName;
}

- (NSString)vehicleModelName
{
  return self->fVehicleModelName;
}

- (NSString)vehicleBluetoothAddress
{
  return self->fVehicleBluetoothAddress;
}

- (unint64_t)vehicularState
{
  return self->fVehicularState;
}

- (unint64_t)vehicularHints
{
  return self->fVehicularHints;
}

@end