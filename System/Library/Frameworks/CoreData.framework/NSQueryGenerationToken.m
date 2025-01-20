@interface NSQueryGenerationToken
+ (BOOL)supportsSecureCoding;
+ (NSQueryGenerationToken)currentQueryGenerationToken;
+ (id)nostoresQueryGenerationToken;
+ (id)unpinnedQueryGenerationToken;
+ (void)initialize;
- (BOOL)_isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSQueryGenerationToken)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSQueryGenerationToken

+ (NSQueryGenerationToken)currentQueryGenerationToken
{
  return (NSQueryGenerationToken *)qword_18C4ABA18;
}

- (BOOL)_isEnabled
{
  return _MergedGlobals_72 != (void)self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_72 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]( objc_alloc(&OBJC_CLASS____NSQueryGenerationToken),  @"unpinned",  1);
    qword_18C4ABA18 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]( objc_alloc(&OBJC_CLASS____NSQueryGenerationToken),  @"current",  1);
    qword_18C4ABA20 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]( objc_alloc(&OBJC_CLASS____NSQueryGenerationToken),  @"nostore",  1);
  }

+ (id)unpinnedQueryGenerationToken
{
  return (id)_MergedGlobals_72;
}

+ (id)nostoresQueryGenerationToken
{
  return (id)qword_18C4ABA20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSQueryGenerationToken)initWithCoder:(id)a3
{
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSQueryGenerationToken: %p>", self);
}

@end