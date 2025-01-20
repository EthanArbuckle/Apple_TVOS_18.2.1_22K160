@interface GKCDGameFriend
+ (id)fetchRequest;
@end

@implementation GKCDGameFriend

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDGameFriend");
}

@end