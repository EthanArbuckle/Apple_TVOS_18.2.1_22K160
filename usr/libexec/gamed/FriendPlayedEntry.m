@interface FriendPlayedEntry
+ (id)fetchRequest;
@end

@implementation FriendPlayedEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"FriendPlayedEntry");
}

@end