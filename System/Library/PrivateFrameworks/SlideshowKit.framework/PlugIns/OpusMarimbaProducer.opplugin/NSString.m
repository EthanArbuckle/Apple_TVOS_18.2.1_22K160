@interface NSString
- (int64_t)numericCompare:(id)a3;
@end

@implementation NSString

- (int64_t)numericCompare:(id)a3
{
  return -[NSString compare:options:](self, "compare:options:", a3, 64LL);
}

@end