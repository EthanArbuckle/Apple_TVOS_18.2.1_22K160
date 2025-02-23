@interface ADFanInfo
- (int64_t)currentSpeed;
- (int64_t)targetSpeed;
- (unint64_t)fanId;
- (void)setCurrentSpeed:(int64_t)a3;
- (void)setFanId:(unint64_t)a3;
- (void)setTargetSpeed:(int64_t)a3;
@end

@implementation ADFanInfo

- (unint64_t)fanId
{
  return self->_fanId;
}

- (void)setFanId:(unint64_t)a3
{
  self->_fanId = a3;
}

- (int64_t)currentSpeed
{
  return self->_currentSpeed;
}

- (void)setCurrentSpeed:(int64_t)a3
{
  self->_currentSpeed = a3;
}

- (int64_t)targetSpeed
{
  return self->_targetSpeed;
}

- (void)setTargetSpeed:(int64_t)a3
{
  self->_targetSpeed = a3;
}

@end