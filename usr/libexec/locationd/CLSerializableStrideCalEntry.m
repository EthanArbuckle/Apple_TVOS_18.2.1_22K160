@interface CLSerializableStrideCalEntry
+ (BOOL)supportsSecureCoding;
- (CLSerializableStrideCalEntry)initWithCoder:(id)a3;
- (CLSerializableStrideCalEntry)initWithStrideCalEntry:(const CLStrideCalEntry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getStrideCalEntry:(CLStrideCalEntry *)a3;
@end

@implementation CLSerializableStrideCalEntry

- (CLSerializableStrideCalEntry)initWithStrideCalEntry:(const CLStrideCalEntry *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLSerializableStrideCalEntry;
  result = -[CLSerializableStrideCalEntry init](&v11, "init");
  if (result)
  {
    __int128 v5 = *(_OWORD *)&a3->recordId;
    __int128 v6 = *(_OWORD *)&a3->pacebin;
    __int128 v7 = *(_OWORD *)&a3->kvalueTrack;
    *(_OWORD *)&result->_entry.endTime = *(_OWORD *)&a3->endTime;
    *(_OWORD *)&result->_entry.kvalueTrack = v7;
    *(_OWORD *)&result->_entry.pacebin = v6;
    *(_OWORD *)&result->_entry.recordId = v5;
    __int128 v8 = *(_OWORD *)&a3->steps;
    __int128 v9 = *(_OWORD *)&a3->percentGrade;
    __int128 v10 = *(_OWORD *)&a3->timestamp;
    *(void *)&result->_entry.runningFormStrideLengthMetrics = *(void *)&a3->runningFormStrideLengthMetrics;
    *(_OWORD *)&result->_entry.timestamp = v10;
    *(_OWORD *)&result->_entry.percentGrade = v9;
    *(_OWORD *)&result->_entry.steps = v8;
  }

  return result;
}

- (void)getStrideCalEntry:(CLStrideCalEntry *)a3
{
  __int128 v3 = *(_OWORD *)&self->_entry.recordId;
  __int128 v4 = *(_OWORD *)&self->_entry.pacebin;
  __int128 v5 = *(_OWORD *)&self->_entry.endTime;
  *(_OWORD *)&a3->kvalueTrack = *(_OWORD *)&self->_entry.kvalueTrack;
  *(_OWORD *)&a3->endTime = v5;
  *(_OWORD *)&a3->recordId = v3;
  *(_OWORD *)&a3->pacebin = v4;
  __int128 v6 = *(_OWORD *)&self->_entry.steps;
  __int128 v7 = *(_OWORD *)&self->_entry.percentGrade;
  __int128 v8 = *(_OWORD *)&self->_entry.timestamp;
  *(void *)&a3->runningFormStrideLengthMetrics = *(void *)&self->_entry.runningFormStrideLengthMetrics;
  *(_OWORD *)&a3->percentGrade = v7;
  *(_OWORD *)&a3->timestamp = v8;
  *(_OWORD *)&a3->steps = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLSerializableStrideCalEntry)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CLSerializableStrideCalEntry;
  __int128 v4 = -[CLSerializableStrideCalEntry init](&v16, "init");
  if (v4)
  {
    v4->_entry.recordId = [a3 decodeIntForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_entry.startTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_entry.endTime = v6;
    v4->_entry.pacebin = [a3 decodeIntForKey:@"pacebin"];
    [a3 decodeDoubleForKey:@"kvalue"];
    v4->_entry.kvalue = v7;
    [a3 decodeDoubleForKey:@"kvalueTrack"];
    v4->_entry.kvalueTrack = v8;
    [a3 decodeDoubleForKey:@"score"];
    v4->_entry.score = v9;
    [a3 decodeDoubleForKey:@"distance"];
    v4->_entry.distance = v10;
    v4->_entry.steps = [a3 decodeIntForKey:@"steps"];
    v4->_entry.session = [a3 decodeIntForKey:@"session"];
    [a3 decodeDoubleForKey:@"speed"];
    v4->_entry.speed = v11;
    [a3 decodeDoubleForKey:@"percentGrade"];
    v4->_entry.percentGrade = v12;
    v4->_entry.gpsSource = [a3 decodeIntForKey:@"gpsSource"];
    [a3 decodeDoubleForKey:@"timestamp"];
    v4->_entry.timestamp = v13;
    [a3 decodeDoubleForKey:@"runningFormStrideLength"];
    v4->_entry.runningFormStrideLength = v14;
    v4->_entry.runningFormStrideLengthMetrics = [a3 decodeIntForKey:@"runningFormStrideLengthMetrics"];
  }

  return v4;
}

@end