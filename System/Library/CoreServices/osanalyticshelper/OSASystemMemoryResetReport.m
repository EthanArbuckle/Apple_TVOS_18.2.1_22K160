@interface OSASystemMemoryResetReport
- (BOOL)isActionable;
- (OSASystemMemoryResetReport)initWithEvent:(id)a3 code:(unint64_t)a4;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (void)acquireJetsamData;
@end

@implementation OSASystemMemoryResetReport

- (OSASystemMemoryResetReport)initWithEvent:(id)a3 code:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OSASystemMemoryResetReport;
  v8 = -[OSASystemMemoryResetReport initWithIncidentID:visibilityEndowmentState:audioAssertionState:]( &v11,  "initWithIncidentID:visibilityEndowmentState:audioAssertionState:",  0LL,  0LL,  0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->OSAJetsamReport_opaque[OBJC_IVAR___OSAJetsamReport__event_reason], a3);
    *(void *)&v9->OSAJetsamReport_opaque[OBJC_IVAR___OSAJetsamReport__event_code] = a4;
  }

  return v9;
}

- (id)problemType
{
  return @"301";
}

- (id)appleCareDetails
{
  return &__NSArray0__struct;
}

- (id)reportNamePrefix
{
  return @"SystemMemoryReset";
}

- (BOOL)isActionable
{
  return 1;
}

- (void)acquireJetsamData
{
}

@end