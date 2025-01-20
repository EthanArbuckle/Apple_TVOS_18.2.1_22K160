@interface WiFiUsageLQMKernelSampleScanSummary
+ (id)allLQMProperties;
+ (id)featureFromFieldName:(id)a3;
+ (id)sampleWithStruct:(id *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (NSString)scanClient;
- (WiFiUsageLQMKernelSampleScanSummary)initWithStruct:(id *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)scanDurationMS;
- (void)setDuration:(double)a3;
- (void)setScanClient:(id)a3;
- (void)setScanDurationMS:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleScanSummary

+ (id)sampleWithStruct:(id *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog( @"%s - Unknown version: %u",  "+[WiFiUsageLQMKernelSampleScanSummary sampleWithStruct:andTimestamp:]",  var0);
    v7 = 0LL;
  }

  else
  {
    v7 = -[WiFiUsageLQMKernelSampleScanSummary initWithStruct:andTimestamp:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMKernelSampleScanSummary),  "initWithStruct:andTimestamp:",  a3,  v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleScanSummary)initWithStruct:(id *)a3 andTimestamp:(id)a4
{
  v6 = (NSDate *)a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMKernelSampleScanSummary;
  v7 = -[WiFiUsageLQMKernelSampleScanSummary init](&v13, sel_init);
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  v7->_scanDurationMS = a3->var1;
  uint64_t v10 = +[WiFiUsageLQMTransformations scanClient:](&OBJC_CLASS___WiFiUsageLQMTransformations, "scanClient:", a3->var5);
  scanClient = v7->_scanClient;
  v7->_scanClient = (NSString *)v10;

  return v7;
}

+ (id)featureFromFieldName:(id)a3
{
  return (id)[&unk_18A1B5AB0 objectForKeyedSubscript:a3];
}

+ (id)allLQMProperties
{
  v2 = (void *)MEMORY[0x189603FE0];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMKernelSampleScanSummary;
  objc_msgSendSuper2(&v7, sel_allLQMProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setWithSet:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 addObject:@"scanClient"];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)scanDurationMS
{
  return self->_scanDurationMS;
}

- (void)setScanDurationMS:(unint64_t)a3
{
  self->_scanDurationMS = a3;
}

- (NSString)scanClient
{
  return self->_scanClient;
}

- (void)setScanClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end