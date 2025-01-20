@interface GameSummary
+ (id)fetchRequest;
@end

@implementation GameSummary

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GameSummary");
}

@end