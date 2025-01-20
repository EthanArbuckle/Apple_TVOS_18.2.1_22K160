@interface SiriTimeoutActivity
- (SiriTimeoutActivity)initWithType:(int64_t)a3 atDate:(id)a4;
- (id)description;
- (id)getBrokenLinkReason;
- (id)getDate;
- (id)getLinkTestReason;
- (id)getLnkTestResult;
- (int64_t)getFaultHandlingLimited;
- (int64_t)getType;
- (unint64_t)getFaultReason;
- (void)description;
- (void)setBrokenLinkReason:(id)a3;
- (void)setFaultHandlingLimited:(int64_t)a3;
- (void)setFaultReason:(unint64_t)a3;
- (void)setFaultReasonString:(id)a3;
- (void)setLinkTestReason:(id)a3;
- (void)setLnkTestResult:(id)a3;
@end

@implementation SiriTimeoutActivity

- (SiriTimeoutActivity)initWithType:(int64_t)a3 atDate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SiriTimeoutActivity;
  v8 = -[SiriTimeoutActivity init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_date, a4);
    v9->_type = a3;
  }

  return v9;
}

- (int64_t)getType
{
  return self->_type;
}

- (id)getDate
{
  return self->_date;
}

- (void)setFaultReason:(unint64_t)a3
{
  self->_faultReason = a3;
}

- (unint64_t)getFaultReason
{
  return self->_faultReason;
}

- (void)setFaultHandlingLimited:(int64_t)a3
{
  self->_faultWasLimited = a3;
}

- (int64_t)getFaultHandlingLimited
{
  return self->_faultWasLimited;
}

- (void)setLinkTestReason:(id)a3
{
}

- (id)getLinkTestReason
{
  return self->_linkTestReason;
}

- (void)setFaultReasonString:(id)a3
{
}

- (void)setLnkTestResult:(id)a3
{
}

- (id)getLnkTestResult
{
  return self->_linkTestResult;
}

- (void)setBrokenLinkReason:(id)a3
{
}

- (id)getBrokenLinkReason
{
  return self->_brokenLinkReason;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607848]);
  [v3 setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSS"];
  v4 = (void *)NSString;
  [v3 stringFromDate:self->_date];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LinkEventSourceStringMap(self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"Date: %@ Reason: %@", v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(self->_type)
  {
    case 1LL:
      unint64_t faultReason = self->_faultReason;
      WiFiUsageFaultReasonStringMap(faultReason);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v7 stringByAppendingFormat:@" Raw Fault Event WiFiUsageFaultReason %lu %@", faultReason, v9];

      goto LABEL_21;
    case 2LL:
      unint64_t v14 = self->_faultReason;
      WiFiUsageFaultReasonStringMap(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 stringByAppendingFormat:@" Fault Event Dropped %lu %@", v14, v15];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      int64_t faultWasLimited = self->_faultWasLimited;
      if (faultWasLimited == 1)
      {
        v13 = @" Limited due to Rate Limiting Fault Indications";
      }

      else
      {
        if (faultWasLimited != 2) {
          -[SiriTimeoutActivity description].cold.2();
        }
        v13 = @" Limited due to linkup or primary";
      }

      goto LABEL_19;
    case 3LL:
      [v7 stringByAppendingFormat:@" Recovery due to %@", self->_brokenLinkReason];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      int64_t v11 = self->_faultWasLimited;
      if (v11 == 4) {
        goto LABEL_16;
      }
      if (v11 == 3) {
        goto LABEL_17;
      }
      if (v11) {
        -[SiriTimeoutActivity description].cold.3();
      }
      goto LABEL_10;
    case 4LL:
      [v7 stringByAppendingFormat:@" Recovery Ignored %@", self->_brokenLinkReason];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      int64_t v12 = self->_faultWasLimited;
      if (v12 == 4)
      {
LABEL_16:
        v13 = @" Denied due to Recovery Disabled";
      }

      else if (v12 == 3)
      {
LABEL_17:
        v13 = @" Denied due to Minimum Broken Link Interval";
      }

      else
      {
        if (v12) {
          -[SiriTimeoutActivity description].cold.4();
        }
LABEL_10:
        v13 = @" Granted";
      }

- (void).cxx_destruct
{
}

- (void)description
{
}

@end