@interface CloudStaticKey
+ (id)fetchRequest;
@end

@implementation CloudStaticKey

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CloudStaticKey");
}

@end