@interface NSCachedFetchRequestInfo
- (void)dealloc;
@end

@implementation NSCachedFetchRequestInfo

- (void)dealloc
{
  self->_substVarBindOrdering = 0LL;
  self->_substIntarrayBindOrdering = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCachedFetchRequestInfo;
  -[NSCachedFetchRequestInfo dealloc](&v3, sel_dealloc);
}

@end