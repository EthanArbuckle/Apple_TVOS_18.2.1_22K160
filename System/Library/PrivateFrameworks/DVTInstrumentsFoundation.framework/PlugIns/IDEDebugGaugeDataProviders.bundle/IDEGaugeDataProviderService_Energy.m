@interface IDEGaugeDataProviderService_Energy
+ (void)registerCapabilities:(id)a3;
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
@end

@implementation IDEGaugeDataProviderService_Energy

+ (void)registerCapabilities:(id)a3
{
}

- (id)startSamplingForPIDs:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDEDataProvider_Energy sharedDataProvider]( &OBJC_CLASS___IDEDataProvider_Energy,  "sharedDataProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startSamplingForPIDs:v3]);

  return v5;
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDEDataProvider_Energy sharedDataProvider]( &OBJC_CLASS___IDEDataProvider_Energy,  "sharedDataProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 captureAttributes:v6 forPIDs:v5]);

  return v8;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDEDataProvider_Energy sharedDataProvider]( &OBJC_CLASS___IDEDataProvider_Energy,  "sharedDataProvider"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stopSamplingForPIDs:v3]);

  return v5;
}

@end