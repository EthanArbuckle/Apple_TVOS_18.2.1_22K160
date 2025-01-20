@interface PLUsageSnapshot
- (NSDate)timestamp;
- (double)cpuUsage;
- (id)description;
- (void)setCpuUsage:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PLUsageSnapshot

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PLUsageSnapshot timestamp](self, "timestamp");
  -[PLUsageSnapshot cpuUsage](self, "cpuUsage");
  [v3 stringWithFormat:@"PLUsageSnapshot (%@: %f)", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (double)cpuUsage
{
  return self->_cpuUsage;
}

- (void)setCpuUsage:(double)a3
{
  self->_cpuUsage = a3;
}

- (void).cxx_destruct
{
}

@end