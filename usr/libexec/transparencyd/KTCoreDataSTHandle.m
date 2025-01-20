@interface KTCoreDataSTHandle
+ (id)fetchRequest;
@end

@implementation KTCoreDataSTHandle

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"STStaticKeyHandle");
}

@end