@interface CPLCloudKitMoveStepFaultInjection
+ (id)moveStepFaultInjectionWithMoveStep:(int64_t)a3 workItemDelay:(double)a4;
- (CPLCloudKitMoveStepFaultInjection)initWithMoveStep:(int64_t)a3 workItemDelay:(double)a4;
- (double)workItemDelay;
- (int64_t)moveStep;
@end

@implementation CPLCloudKitMoveStepFaultInjection

+ (id)moveStepFaultInjectionWithMoveStep:(int64_t)a3 workItemDelay:(double)a4
{
  return [objc_alloc((Class)a1) initWithMoveStep:a3 workItemDelay:a4];
}

- (CPLCloudKitMoveStepFaultInjection)initWithMoveStep:(int64_t)a3 workItemDelay:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CPLCloudKitMoveStepFaultInjection;
  result = -[CPLCloudKitMoveStepFaultInjection init](&v7, "init");
  if (result)
  {
    result->_moveStep = a3;
    result->_workItemDelay = a4;
  }

  return result;
}

- (int64_t)moveStep
{
  return self->_moveStep;
}

- (double)workItemDelay
{
  return self->_workItemDelay;
}

@end