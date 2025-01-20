@interface GKCDSuggestedFriends
+ (id)fetchRequest;
@end

@implementation GKCDSuggestedFriends

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"SuggestedFriends");
}

@end