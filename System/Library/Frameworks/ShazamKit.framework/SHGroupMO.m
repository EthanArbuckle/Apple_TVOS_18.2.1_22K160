@interface SHGroupMO
+ (id)fetchRequest;
@end

@implementation SHGroupMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"SHGroupMO");
}

@end