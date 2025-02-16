@interface LKAUpgradeOutcomeReport
- (LKAUpgradeOutcomeReport)initWithOutcome:(int)a3 attributes:(id)a4;
- (NSDictionary)attributes;
- (int)outcome;
- (void)setAttributes:(id)a3;
- (void)setOutcome:(int)a3;
@end

@implementation LKAUpgradeOutcomeReport

- (LKAUpgradeOutcomeReport)initWithOutcome:(int)a3 attributes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LKAUpgradeOutcomeReport;
  v7 = -[LKAUpgradeOutcomeReport init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[LKAUpgradeOutcomeReport setOutcome:](v7, "setOutcome:", v4);
    -[LKAUpgradeOutcomeReport setAttributes:](v8, "setAttributes:", v6);
  }

  return v8;
}

- (int)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(int)a3
{
  self->_outcome = a3;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end