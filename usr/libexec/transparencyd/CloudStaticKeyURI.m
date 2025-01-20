@interface CloudStaticKeyURI
+ (id)fetchRequest;
@end

@implementation CloudStaticKeyURI

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CloudStaticKeyURI");
}

@end