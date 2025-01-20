@interface DownloadRecord
+ (id)fetchRequest;
- (BOOL)expired;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (unint64_t)getUnsigned:(SEL)a3;
@end

@implementation DownloadRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"DownloadRecord");
}

- (BOOL)expired
{
  return v2 < CFAbsoluteTimeGetCurrent() - (double)kTransparencyMaxmimumDownloadRecordLifetime;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001D6330(self, a3);
}

@end