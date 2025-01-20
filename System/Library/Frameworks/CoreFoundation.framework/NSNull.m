@interface NSNull
+ (BOOL)supportsSecureCoding;
+ (NSNull)allocWithZone:(_NSZone *)a3;
+ (NSNull)null;
- (NSNull)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)retainCount;
@end

@implementation NSNull

+ (NSNull)allocWithZone:(_NSZone *)a3
{
  return (NSNull *)&__kCFNull;
}

+ (NSNull)null
{
  return (NSNull *)&__kCFNull;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)description
{
  return @"<null>";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNull)initWithCoder:(id)a3
{
  return 0LL;
}

@end