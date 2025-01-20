@interface PLCoreDuetEvent
- (NSArray)eventIntervals;
- (NSDictionary)childBundleIDToWeight;
- (NSString)bundleID;
- (NSString)processName;
- (id)description;
- (unsigned)updateType;
- (void)setBundleID:(id)a3;
- (void)setChildBundleIDToWeight:(id)a3;
- (void)setEventIntervals:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setUpdateType:(unsigned __int8)a3;
@end

@implementation PLCoreDuetEvent

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PLCoreDuetEvent bundleID](self, "bundleID");
  v5 = -[PLCoreDuetEvent processName](self, "processName");
  v6 = -[PLCoreDuetEvent eventIntervals](self, "eventIntervals");
  v7 = -[PLCoreDuetEvent childBundleIDToWeight](self, "childBundleIDToWeight");
  [v3 stringWithFormat:@"bundleID=%@, processName=%@, eventIntervals=%@, childBundleIDToWeight=%@", v4, v5, v6, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (unsigned)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unsigned __int8)a3
{
  self->_updateType = a3;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSDictionary)childBundleIDToWeight
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setChildBundleIDToWeight:(id)a3
{
}

- (NSArray)eventIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEventIntervals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end