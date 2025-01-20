@interface CloudDevice
+ (id)fetchRequest;
@end

@implementation CloudDevice

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CloudDevice");
}

@end