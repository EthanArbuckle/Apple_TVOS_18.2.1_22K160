@interface SHTrackMO
+ (id)fetchRequest;
@end

@implementation SHTrackMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"SHTrackMO");
}

@end