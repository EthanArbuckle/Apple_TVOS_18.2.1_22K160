@interface KTSMTFailure
+ (id)fetchRequest;
@end

@implementation KTSMTFailure

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTSMTFailure");
}

@end