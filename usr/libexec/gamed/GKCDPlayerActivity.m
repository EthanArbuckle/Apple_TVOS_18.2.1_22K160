@interface GKCDPlayerActivity
+ (id)fetchRequest;
@end

@implementation GKCDPlayerActivity

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDPlayerActivity");
}

@end