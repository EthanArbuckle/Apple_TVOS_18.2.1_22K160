@interface CLSerializableWalkingSpeedStrideCal
+ (BOOL)supportsSecureCoding;
- (CLSerializableWalkingSpeedStrideCal)initWithCoder:(id)a3;
- (CLSerializableWalkingSpeedStrideCal)initWithWalkingSpeedStrideCal:(const WalkingSpeedStrideCal *)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)getWalkingSpeedStrideCal:(WalkingSpeedStrideCal *)a3;
@end

@implementation CLSerializableWalkingSpeedStrideCal

- (CLSerializableWalkingSpeedStrideCal)initWithWalkingSpeedStrideCal:(const WalkingSpeedStrideCal *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLSerializableWalkingSpeedStrideCal;
  result = -[CLSerializableWalkingSpeedStrideCal init](&v7, "init");
  if (result)
  {
    __int128 v5 = *(_OWORD *)&a3->startTime;
    __int128 v6 = *(_OWORD *)&a3->cadenceWatch;
    *(_OWORD *)&result->_strideCal.meanWalkingSpeed = *(_OWORD *)&a3->meanWalkingSpeed;
    *(_OWORD *)&result->_strideCal.cadenceWatch = v6;
    *(_OWORD *)&result->_strideCal.startTime = v5;
  }

  return result;
}

- (void)getWalkingSpeedStrideCal:(WalkingSpeedStrideCal *)a3
{
  __int128 v3 = *(_OWORD *)&self->_strideCal.startTime;
  __int128 v4 = *(_OWORD *)&self->_strideCal.meanWalkingSpeed;
  *(_OWORD *)&a3->cadenceWatch = *(_OWORD *)&self->_strideCal.cadenceWatch;
  *(_OWORD *)&a3->meanWalkingSpeed = v4;
  *(_OWORD *)&a3->startTime = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLSerializableWalkingSpeedStrideCal)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLSerializableWalkingSpeedStrideCal;
  __int128 v4 = -[CLSerializableWalkingSpeedStrideCal init](&v12, "init");
  if (v4)
  {
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_strideCal.startTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_strideCal.endTime = v6;
    [a3 decodeDoubleForKey:@"cadenceWatch"];
    v4->_strideCal.cadenceWatch = v7;
    [a3 decodeDoubleForKey:@"cadenceGaitCycle"];
    v4->_strideCal.cadenceGaitCycle = v8;
    [a3 decodeDoubleForKey:@"meanWalkingSpeed"];
    v4->_strideCal.meanWalkingSpeed = v9;
    [a3 decodeDoubleForKey:@"gaitCycleYield"];
    v4->_strideCal.gaitCycleYield = v10;
  }

  return v4;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end