@interface LipMovementSignalData
- (BOOL)hadLipMovement;
- (LipMovementSignalData)initWithLipMovement:(BOOL)a3 from:(unint64_t)a4 to:(unint64_t)a5;
- (unint64_t)endTime;
- (unint64_t)startTime;
@end

@implementation LipMovementSignalData

- (LipMovementSignalData)initWithLipMovement:(BOOL)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LipMovementSignalData;
  result = -[LipMovementSignalData init](&v9, "init");
  if (result)
  {
    result->_hadLipMovement = a3;
    result->_startTime = a4;
    result->_endTime = a5;
  }

  return result;
}

- (BOOL)hadLipMovement
{
  return self->_hadLipMovement;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

@end