@interface NSError
- (id)dy_errorSignature;
@end

@implementation NSError

- (id)dy_errorSignature
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%llu)",  -[NSError domain](self, "domain"),  -[NSError code](self, "code"));
}

@end