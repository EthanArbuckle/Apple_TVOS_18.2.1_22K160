@interface MultiplayerGroupParticipant
+ (id)fetchRequest;
@end

@implementation MultiplayerGroupParticipant

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"MultiplayerGroupParticipant");
}

@end