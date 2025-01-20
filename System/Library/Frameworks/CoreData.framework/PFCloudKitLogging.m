@interface PFCloudKitLogging
+ (void)setCatastrophicLoggingLevel;
- (PFCloudKitLogging)init;
- (void)dealloc;
@end

@implementation PFCloudKitLogging

- (PFCloudKitLogging)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PFCloudKitLogging;
  v2 = -[PFCloudKitLogging init](&v7, sel_init);
  if (v2)
  {
    __ckLoggingOverride = 16LL;
    v3 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v4 = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.CloudKitDebug");
    switch(v4)
    {
      case 1LL:
        uint64_t v5 = 4LL;
        break;
      case 2LL:
        uint64_t v5 = 3LL;
        break;
      case 3LL:
        uint64_t v5 = 1LL;
        break;
      default:
        uint64_t v5 = 16LL;
        break;
    }

    __ckLoggingOverride = v5;
    objc_autoreleasePoolPop(v3);
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PFCloudKitLogging;
  -[PFCloudKitLogging dealloc](&v2, sel_dealloc);
}

+ (void)setCatastrophicLoggingLevel
{
  __ckLoggingOverride = 1LL;
}

@end