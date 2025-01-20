@interface MessageInboxEntry
+ (id)fetchRequest;
@end

@implementation MessageInboxEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"MessageInboxEntry");
}

@end