@interface TSDgPTPLocalClockPort
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)_hasLocalFrequencyStabilityLower;
- (BOOL)_hasLocalFrequencyStabilityUpper;
- (BOOL)_hasLocalFrequencyToleranceLower;
- (BOOL)_hasLocalFrequencyToleranceUpper;
- (BOOL)hasLocalFrequencyStabilityLower;
- (BOOL)hasLocalFrequencyStabilityUpper;
- (BOOL)hasLocalFrequencyToleranceLower;
- (BOOL)hasLocalFrequencyToleranceUpper;
- (TSDgPTPLocalClockPort)initWithService:(id)a3 pid:(int)a4;
- (int)_localFrequencyStabilityLower;
- (int)_localFrequencyStabilityUpper;
- (int)_localFrequencyToleranceLower;
- (int)_localFrequencyToleranceUpper;
- (int)localFrequencyStabilityLower;
- (int)localFrequencyStabilityUpper;
- (int)localFrequencyToleranceLower;
- (int)localFrequencyToleranceUpper;
- (int)portType;
- (unsigned)_localOscillatorType;
- (unsigned)localOscillatorType;
- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3;
- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3;
- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3;
- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3;
- (void)setLocalFrequencyStabilityLower:(int)a3;
- (void)setLocalFrequencyStabilityUpper:(int)a3;
- (void)setLocalFrequencyToleranceLower:(int)a3;
- (void)setLocalFrequencyToleranceUpper:(int)a3;
- (void)setLocalOscillatorType:(unsigned __int8)a3;
@end

@implementation TSDgPTPLocalClockPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v13[0] = @"IOTimeSyncLocalClockPort";
  v12[0] = @"IOProviderClass";
  v12[1] = @"IOParentMatch";
  v10[0] = @"IOProviderClass";
  v10[1] = @"IOPropertyMatch";
  v11[0] = @"IOTimeSyncDomain";
  v8 = @"ClockIdentifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v9 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  v13[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));

  return v6;
}

- (TSDgPTPLocalClockPort)initWithService:(id)a3 pid:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TSDgPTPLocalClockPort;
  v4 = -[TSDgPTPPort initWithService:pid:](&v7, "initWithService:pid:", a3, *(void *)&a4);
  v5 = v4;
  if (v4)
  {
    v4->_localOscillatorType = -[TSDgPTPLocalClockPort _localOscillatorType](v4, "_localOscillatorType");
    v5->_hasLocalFrequencyToleranceLower = -[TSDgPTPLocalClockPort _hasLocalFrequencyToleranceLower]( v5,  "_hasLocalFrequencyToleranceLower");
    v5->_localFrequencyToleranceLower = -[TSDgPTPLocalClockPort _localFrequencyToleranceLower]( v5,  "_localFrequencyToleranceLower");
    v5->_hasLocalFrequencyToleranceUpper = -[TSDgPTPLocalClockPort _hasLocalFrequencyToleranceUpper]( v5,  "_hasLocalFrequencyToleranceUpper");
    v5->_localFrequencyToleranceUpper = -[TSDgPTPLocalClockPort _localFrequencyToleranceUpper]( v5,  "_localFrequencyToleranceUpper");
    v5->_hasLocalFrequencyStabilityLower = -[TSDgPTPLocalClockPort _hasLocalFrequencyStabilityLower]( v5,  "_hasLocalFrequencyStabilityLower");
    v5->_localFrequencyStabilityLower = -[TSDgPTPLocalClockPort _localFrequencyStabilityLower]( v5,  "_localFrequencyStabilityLower");
    v5->_hasLocalFrequencyStabilityUpper = -[TSDgPTPLocalClockPort _hasLocalFrequencyStabilityUpper]( v5,  "_hasLocalFrequencyStabilityUpper");
    v5->_localFrequencyStabilityUpper = -[TSDgPTPLocalClockPort _localFrequencyStabilityUpper]( v5,  "_localFrequencyStabilityUpper");
  }

  return v5;
}

- (int)portType
{
  return 8;
}

- (unsigned)_localOscillatorType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalOscillatorType"]);

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceLower
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"]);

  return v3 != 0LL;
}

- (int)_localFrequencyToleranceLower
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"]);

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceUpper
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"]);

  return v3 != 0LL;
}

- (int)_localFrequencyToleranceUpper
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"]);

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityLower
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"]);

  return v3 != 0LL;
}

- (int)_localFrequencyStabilityLower
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"]);

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityUpper
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"]);

  return v3 != 0LL;
}

- (int)_localFrequencyStabilityUpper
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"]);

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TSDgPTPLocalClockPort;
  id v3 = objc_msgSendSuper2(&v7, "diagnosticInfoForService:", a3);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 8LL));
  [v4 setObject:v5 forKeyedSubscript:@"PortType"];

  return v4;
}

- (unsigned)localOscillatorType
{
  return self->_localOscillatorType;
}

- (void)setLocalOscillatorType:(unsigned __int8)a3
{
  self->_localOscillatorType = a3;
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return self->_hasLocalFrequencyToleranceLower;
}

- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceLower = a3;
}

- (int)localFrequencyToleranceLower
{
  return self->_localFrequencyToleranceLower;
}

- (void)setLocalFrequencyToleranceLower:(int)a3
{
  self->_localFrequencyToleranceLower = a3;
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return self->_hasLocalFrequencyToleranceUpper;
}

- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceUpper = a3;
}

- (int)localFrequencyToleranceUpper
{
  return self->_localFrequencyToleranceUpper;
}

- (void)setLocalFrequencyToleranceUpper:(int)a3
{
  self->_localFrequencyToleranceUpper = a3;
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return self->_hasLocalFrequencyStabilityLower;
}

- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityLower = a3;
}

- (int)localFrequencyStabilityLower
{
  return self->_localFrequencyStabilityLower;
}

- (void)setLocalFrequencyStabilityLower:(int)a3
{
  self->_localFrequencyStabilityLower = a3;
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return self->_hasLocalFrequencyStabilityUpper;
}

- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityUpper = a3;
}

- (int)localFrequencyStabilityUpper
{
  return self->_localFrequencyStabilityUpper;
}

- (void)setLocalFrequencyStabilityUpper:(int)a3
{
  self->_localFrequencyStabilityUpper = a3;
}

@end