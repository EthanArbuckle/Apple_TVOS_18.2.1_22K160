@interface IDSKTVerification
+ (id)fetchRequest;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (unint64_t)getUnsigned:(SEL)a3;
@end

@implementation IDSKTVerification

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"IDSKTVerification");
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001D6330(self, a3);
}

@end