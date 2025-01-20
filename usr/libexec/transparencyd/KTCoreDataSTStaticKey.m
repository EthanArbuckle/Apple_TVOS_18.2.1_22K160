@interface KTCoreDataSTStaticKey
+ (id)fetchRequest;
@end

@implementation KTCoreDataSTStaticKey

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"STStaticKey");
}

@end