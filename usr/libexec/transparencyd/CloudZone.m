@interface CloudZone
+ (id)fetchRequest;
@end

@implementation CloudZone

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CloudZone");
}

@end