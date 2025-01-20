@interface __NSCFURLLocalStreamTaskWorkRead
- (void)dealloc;
@end

@implementation __NSCFURLLocalStreamTaskWorkRead

- (void)dealloc
{
  id completion = self->_completion;
  if (completion)
  {
    _Block_release(completion);
    self->_id completion = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSCFURLLocalStreamTaskWorkRead;
  -[__NSCFURLLocalStreamTaskWorkRead dealloc](&v4, sel_dealloc);
}

@end