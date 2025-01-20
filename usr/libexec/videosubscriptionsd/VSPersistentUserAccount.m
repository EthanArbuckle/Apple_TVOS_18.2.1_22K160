@interface VSPersistentUserAccount
+ (id)fetchRequest;
@end

@implementation VSPersistentUserAccount

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"VSPersistentUserAccount");
}

@end