@interface NSUnknownRequestTypeResult
- (NSUnknownRequestTypeResult)initWithSubresults:(id)a3;
- (void)dealloc;
@end

@implementation NSUnknownRequestTypeResult

- (NSUnknownRequestTypeResult)initWithSubresults:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSUnknownRequestTypeResult;
  v4 = -[NSUnknownRequestTypeResult init](&v6, sel_init);
  if (v4) {
    v4->_subresults = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_subresults = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUnknownRequestTypeResult;
  -[NSUnknownRequestTypeResult dealloc](&v3, sel_dealloc);
}

@end