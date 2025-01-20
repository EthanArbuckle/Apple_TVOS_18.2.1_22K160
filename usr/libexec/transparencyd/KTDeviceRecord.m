@interface KTDeviceRecord
+ (id)fetchRequest;
@end

@implementation KTDeviceRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTDeviceRecord");
}

@end