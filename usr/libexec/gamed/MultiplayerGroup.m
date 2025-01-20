@interface MultiplayerGroup
+ (id)fetchRequest;
@end

@implementation MultiplayerGroup

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"MultiplayerGroup");
}

@end