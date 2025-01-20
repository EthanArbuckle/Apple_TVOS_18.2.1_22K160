@interface NSPTokenEvent
+ (id)fetchRequest;
@end

@implementation NSPTokenEvent

+ (id)fetchRequest
{
  return  -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  @"NSPTokenEvent");
}

@end