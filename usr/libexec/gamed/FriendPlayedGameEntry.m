@interface FriendPlayedGameEntry
+ (id)fetchRequest;
@end

@implementation FriendPlayedGameEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"FriendPlayedGameEntry");
}

@end