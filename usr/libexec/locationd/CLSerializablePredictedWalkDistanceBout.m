@interface CLSerializablePredictedWalkDistanceBout
+ (BOOL)supportsSecureCoding;
- (CLSerializablePredictedWalkDistanceBout)initWithCoder:(id)a3;
- (CLSerializablePredictedWalkDistanceBout)initWithPredictedWalkDistanceBout:(const CLPredictedWalkDistanceBoutEntry *)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)getPredictedWalkDistanceBout:(CLPredictedWalkDistanceBoutEntry *)a3;
@end

@implementation CLSerializablePredictedWalkDistanceBout

- (CLSerializablePredictedWalkDistanceBout)initWithPredictedWalkDistanceBout:(const CLPredictedWalkDistanceBoutEntry *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLSerializablePredictedWalkDistanceBout;
  result = -[CLSerializablePredictedWalkDistanceBout init](&v11, "init");
  if (result)
  {
    __int128 v5 = *(_OWORD *)&a3->recordId;
    __int128 v6 = *(_OWORD *)&a3->endTime;
    __int128 v7 = *(_OWORD *)&a3->distance;
    *(_OWORD *)&result->_bout.elevationAscended = *(_OWORD *)&a3->elevationAscended;
    *(_OWORD *)&result->_bout.distance = v7;
    *(_OWORD *)&result->_bout.endTime = v6;
    *(_OWORD *)&result->_bout.recordId = v5;
    __int128 v8 = *(_OWORD *)&a3->distanceGPS;
    __int128 v9 = *(_OWORD *)&a3->cadence;
    __int128 v10 = *(_OWORD *)&a3->speed;
    result->_bout.supportsBout = a3->supportsBout;
    *(_OWORD *)&result->_bout.speed = v10;
    *(_OWORD *)&result->_bout.cadence = v9;
    *(_OWORD *)&result->_bout.distanceGPS = v8;
  }

  return result;
}

- (void)getPredictedWalkDistanceBout:(CLPredictedWalkDistanceBoutEntry *)a3
{
  __int128 v3 = *(_OWORD *)&self->_bout.recordId;
  __int128 v4 = *(_OWORD *)&self->_bout.endTime;
  __int128 v5 = *(_OWORD *)&self->_bout.elevationAscended;
  *(_OWORD *)&a3->distance = *(_OWORD *)&self->_bout.distance;
  *(_OWORD *)&a3->elevationAscended = v5;
  *(_OWORD *)&a3->recordId = v3;
  *(_OWORD *)&a3->endTime = v4;
  __int128 v6 = *(_OWORD *)&self->_bout.distanceGPS;
  __int128 v7 = *(_OWORD *)&self->_bout.cadence;
  __int128 v8 = *(_OWORD *)&self->_bout.speed;
  a3->supportsBout = self->_bout.supportsBout;
  *(_OWORD *)&a3->cadence = v7;
  *(_OWORD *)&a3->speed = v8;
  *(_OWORD *)&a3->distanceGPS = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLSerializablePredictedWalkDistanceBout)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLSerializablePredictedWalkDistanceBout;
  __int128 v4 = -[CLSerializablePredictedWalkDistanceBout init](&v12, "init");
  __int128 v5 = (CLSerializablePredictedWalkDistanceBout *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 2) = 0;
    *((void *)v4 + 2) = 0LL;
    *((void *)v4 + 3) = 0LL;
    *((_DWORD *)v4 + 8) = 0;
    *((void *)v4 + 6) = 0LL;
    *((void *)v4 + 7) = 0LL;
    *((void *)v4 + 5) = 0LL;
    *((_DWORD *)v4 + 16) = 0;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 88) = 0u;
    *(_OWORD *)(v4 + 104) = 0u;
    *((void *)v4 + 15) = 0LL;
    *((_DWORD *)v4 + 2) = [a3 decodeIntForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v5->_bout.startTime = v6;
    [a3 decodeDoubleForKey:@"endTime"];
    v5->_bout.endTime = v7;
    v5->_bout.stepCount = [a3 decodeIntForKey:@"stepCount"];
    [a3 decodeDoubleForKey:@"distance"];
    v5->_bout.distance = v8;
    [a3 decodeDoubleForKey:@"activeTime"];
    v5->_bout.activeTime = v9;
    v5->_bout.elevationAscended = [a3 decodeIntForKey:@"elevationAscended"];
    v5->_bout.elevationDescended = [a3 decodeIntForKey:@"elevationDescended"];
    v5->_bout.stepCountGPS = [a3 decodeIntForKey:@"stepCountGPS"];
    [a3 decodeDoubleForKey:@"distanceGPS"];
    v5->_bout.distanceGPS = v10;
    v5->_bout.boutType = [a3 decodeIntForKey:@"boutType"];
  }

  return v5;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((_DWORD *)self + 8) = 0;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 5) = 0LL;
  *((_DWORD *)self + 16) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0LL;
  return self;
}

@end