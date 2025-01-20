@interface CLKalmanSmootherEstimates
- (CLKalmanSmootherEstimates)init;
- (CMMatrix<float,)fCovariance;
- (CMVector<float,)fState;
- (double)timestamp;
- (void)setFCovariance:()CMMatrix<float;
- (void)setFState:()CMVector<float;
- (void)setTimestamp:(double)a3;
@end

@implementation CLKalmanSmootherEstimates

- (CLKalmanSmootherEstimates)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLKalmanSmootherEstimates;
  result = -[CLKalmanSmootherEstimates init](&v3, "init");
  if (result)
  {
    *(void *)result->_fCovariance.fData = 0LL;
    *(void *)&result->_fCovariance.fData[2] = 0LL;
    result->_fState = 0LL;
    result->_timestamp = 1.79769313e308;
  }

  return result;
}

- (CMVector<float,)fState
{
  float v2 = self->_fState.elements[0];
  float v3 = self->_fState.elements[1];
  result.elements[1] = v3;
  result.elements[0] = v2;
  return result;
}

- (void)setFState:()CMVector<float
{
  self->_fState = a3;
}

- (CMMatrix<float,)fCovariance
{
  float v2 = self->_fCovariance.fData[0];
  float v3 = self->_fCovariance.fData[1];
  float v4 = self->_fCovariance.fData[2];
  float v5 = self->_fCovariance.fData[3];
  result.fData[3] = v5;
  result.fData[2] = v4;
  result.fData[1] = v3;
  result.fData[0] = v2;
  return result;
}

- (void)setFCovariance:()CMMatrix<float
{
  self->_fCovariance = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end