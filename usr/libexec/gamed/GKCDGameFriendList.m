@interface GKCDGameFriendList
+ (id)fetchRequest;
@end

@implementation GKCDGameFriendList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDGameFriendList");
}

@end