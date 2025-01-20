@interface FriendsPlayedGameList
+ (id)fetchRequest;
@end

@implementation FriendsPlayedGameList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"FriendsPlayedGameList");
}

@end