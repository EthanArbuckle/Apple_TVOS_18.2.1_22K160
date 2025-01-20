@interface CLBatchedSensorSubscriptionAdapter
- (BOOL)valid;
- (CLBatchedSensorSubscriptionAdapter)initWithBatchedSensorSubscription:(void *)a3;
- (void)onBatchedAccelerometerData:(id)a3;
- (void)onBatchedDeviceMotionData:(id)a3;
- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5;
- (void)setSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)subscription;
@end

@implementation CLBatchedSensorSubscriptionAdapter

- (CLBatchedSensorSubscriptionAdapter)initWithBatchedSensorSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLBatchedSensorSubscriptionAdapter;
  result = -[CLBatchedSensorSubscriptionAdapter init](&v5, "init");
  if (result) {
    result->_subscription = a3;
  }
  return result;
}

- (void)onBatchedAccelerometerData:(id)a3
{
}

- (void)onBatchedDeviceMotionData:(id)a3
{
}

- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5
{
  v7 = -[CLBatchedSensorSubscriptionAdapter subscription](self, "subscription", a3, a4, a5);
  __int128 v8 = *(_OWORD *)&a3->var5.var6.var1[47];
  __int128 v9 = *(_OWORD *)&a3->var5.var6.var1[63];
  __int128 v10 = *(_OWORD *)&a3->var5.var6.var1[15];
  v21[11] = *(_OWORD *)&a3->var5.var6.var1[31];
  v21[12] = v8;
  v21[13] = v9;
  WorkoutAttrib var5 = a3->var5.var5;
  __int128 v12 = *(_OWORD *)&a3->var5.var6.var0;
  __int128 v13 = *(_OWORD *)a3->var5.var2;
  v21[7] = *(_OWORD *)&a3->var5.var3;
  v21[8] = var5;
  v21[9] = v12;
  v21[10] = v10;
  __int128 v14 = *(_OWORD *)a3->var5.var0;
  __int128 v15 = *(_OWORD *)a3->var5.var1;
  __int128 v16 = *(_OWORD *)&a3->var4.var0;
  v21[3] = *(_OWORD *)&a3->var4.var2;
  v21[4] = v14;
  v21[5] = v15;
  v21[6] = v13;
  __int128 v17 = *(_OWORD *)&a3->var2;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v17;
  unint64_t var7 = a3->var5.var7;
  v21[2] = v16;
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v18, a4);
  sub_100E40740((uint64_t)v7, (uint64_t)v21, (uint64_t)v18);
  sub_10041385C(v20);
  if (v19 < 0) {
    operator delete(v18[2]);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end