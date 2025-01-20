@interface WiFiUsageSessionCAConfig
- (BOOL)canSubmit;
- (NSDate)ca_lastSubmission;
- (WiFiUsageSessionCAConfig)initWithSampling:(unint64_t)a3 minInterval:(double)a4;
- (double)ca_minTimeIntervalBetweenSubmissions;
- (id)description;
- (unint64_t)ca_sampling;
- (void)countSubmission;
@end

@implementation WiFiUsageSessionCAConfig

- (WiFiUsageSessionCAConfig)initWithSampling:(unint64_t)a3 minInterval:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsageSessionCAConfig;
  v6 = -[WiFiUsageSessionCAConfig init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ca_sampling = a3;
    v6->_ca_minTimeIntervalBetweenSubmissions = a4;
    ca_lastSubmission = v6->_ca_lastSubmission;
    v6->_ca_lastSubmission = 0LL;
  }

  return v7;
}

- (void)countSubmission
{
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  ca_lastSubmission = self->_ca_lastSubmission;
  self->_ca_lastSubmission = v3;
}

- (BOOL)canSubmit
{
  if (self->_ca_lastSubmission
    && ([MEMORY[0x189603F50] now],
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        [v3 timeIntervalSinceDate:self->_ca_lastSubmission],
        double v5 = v4,
        double ca_minTimeIntervalBetweenSubmissions = self->_ca_minTimeIntervalBetweenSubmissions,
        v3,
        v5 < ca_minTimeIntervalBetweenSubmissions))
  {
    return 0;
  }

  else
  {
    return +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  self->_ca_sampling);
  }

- (id)description
{
  v3 = (void *)NSString;
  +[WiFiUsagePrivacyFilter describeSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "describeSampleRate:",  self->_ca_sampling);
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getHumanSecondsFromTimeInterval:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getHumanSecondsFromTimeInterval:",  self->_ca_minTimeIntervalBetweenSubmissions);
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"samplingRate:%@, minTimeInterval:%@ lastSubmission:%@", v4, v5, self->_ca_lastSubmission];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)ca_sampling
{
  return self->_ca_sampling;
}

- (double)ca_minTimeIntervalBetweenSubmissions
{
  return self->_ca_minTimeIntervalBetweenSubmissions;
}

- (NSDate)ca_lastSubmission
{
  return self->_ca_lastSubmission;
}

- (void).cxx_destruct
{
}

@end