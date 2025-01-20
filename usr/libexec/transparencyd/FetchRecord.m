@interface FetchRecord
+ (id)fetchRequest;
@end

@implementation FetchRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"FetchRecord");
}

@end