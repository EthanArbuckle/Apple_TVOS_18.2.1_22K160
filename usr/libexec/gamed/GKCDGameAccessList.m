@interface GKCDGameAccessList
+ (id)fetchRequest;
@end

@implementation GKCDGameAccessList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDGameAccessList");
}

@end