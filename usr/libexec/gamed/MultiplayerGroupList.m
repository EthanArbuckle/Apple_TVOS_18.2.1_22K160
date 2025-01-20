@interface MultiplayerGroupList
+ (id)fetchRequest;
@end

@implementation MultiplayerGroupList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"MultiplayerGroupList");
}

@end