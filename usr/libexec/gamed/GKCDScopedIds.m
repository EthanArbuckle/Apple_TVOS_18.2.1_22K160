@interface GKCDScopedIds
+ (id)fetchRequest;
@end

@implementation GKCDScopedIds

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDScopedIds");
}

@end