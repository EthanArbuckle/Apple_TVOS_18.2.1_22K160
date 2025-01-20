@interface KTCoreDataSTSetting
+ (id)fetchRequest;
@end

@implementation KTCoreDataSTSetting

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"STSetting");
}

@end