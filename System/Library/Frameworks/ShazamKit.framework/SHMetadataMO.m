@interface SHMetadataMO
+ (id)fetchRequest;
@end

@implementation SHMetadataMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"SHMetadataMO");
}

@end