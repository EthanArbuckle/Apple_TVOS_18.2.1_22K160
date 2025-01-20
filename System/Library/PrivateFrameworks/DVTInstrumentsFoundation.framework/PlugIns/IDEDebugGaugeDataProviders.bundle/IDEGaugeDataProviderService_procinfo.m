@interface IDEGaugeDataProviderService_procinfo
+ (void)registerCapabilities:(id)a3;
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
@end

@implementation IDEGaugeDataProviderService_procinfo

+ (void)registerCapabilities:(id)a3
{
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDEDataProvider_procinfo sharedDataProvider]( &OBJC_CLASS___IDEDataProvider_procinfo,  "sharedDataProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 captureAttributes:v6 forPIDs:v5]);

  return v8;
}

@end