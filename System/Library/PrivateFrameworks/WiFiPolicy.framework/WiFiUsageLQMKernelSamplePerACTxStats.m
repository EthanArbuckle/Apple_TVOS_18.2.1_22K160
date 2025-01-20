@interface WiFiUsageLQMKernelSamplePerACTxStats
+ (id)sampleWithTimestamp:(id)a3;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSamplePerACTxStats)initWithTimestamp:(id)a3;
- (double)duration;
- (id)description;
- (void)populateTXStats:(int)a3 With:(unsigned int)a4 ForQueue:(int)a5;
- (void)setDuration:(double)a3;
@end

@implementation WiFiUsageLQMKernelSamplePerACTxStats

+ (id)sampleWithTimestamp:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTimestamp:v3];

  return v4;
}

- (WiFiUsageLQMKernelSamplePerACTxStats)initWithTimestamp:(id)a3
{
  v4 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMKernelSamplePerACTxStats;
  v5 = -[WiFiUsageLQMKernelSamplePerACTxStats init](&v8, sel_init);
  timestamp = v5->_timestamp;
  v5->_timestamp = v4;

  return v5;
}

- (void)populateTXStats:(int)a3 With:(unsigned int)a4 ForQueue:(int)a5
{
  uint64_t v6 = *(void *)&a3;
  objc_super v8 = @"BE";
  int v9 = 1;
  switch(a5)
  {
    case 0:
      break;
    case 1:
      objc_super v8 = @"BK";
      break;
    case 2:
      objc_super v8 = @"VI";
      break;
    case 3:
      objc_super v8 = @"VO";
      break;
    case 4:
      objc_super v8 = @"Mcast";
      break;
    default:
      NSLog( @"%s - Unknown queue tag %u while parsing TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS",  a2,  "-[WiFiUsageLQMKernelSamplePerACTxStats populateTXStats:With:ForQueue:]",  a5);
      int v9 = 0;
      objc_super v8 = 0LL;
      break;
  }

  if (v6 >= 0xB)
  {
    NSLog( @"%s - Unknown stat tag %u while parsing TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS",  a2,  "-[WiFiUsageLQMKernelSamplePerACTxStats populateTXStats:With:ForQueue:]",  v6);
  }

  else if (v9)
  {
    v10 = off_18A16E060[(int)v6];
    [MEMORY[0x189607968] numberWithLong:a4];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"tx%@%@Perc", v8, v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageLQMKernelSamplePerACTxStats setValue:forKey:](self, "setValue:forKey:", v12, v11);
  }

- (id)description
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  [(id)objc_opt_class() allLQMProperties];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v9);
        if (v10)
        {
          v11 = -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v9);
          [v3 appendFormat:@"%@:%@,", v9, v11, (void)v14];
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  [NSString stringWithString:v3];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end