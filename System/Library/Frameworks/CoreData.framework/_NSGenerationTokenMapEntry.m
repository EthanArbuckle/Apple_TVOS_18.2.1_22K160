@interface _NSGenerationTokenMapEntry
- (void)dealloc;
@end

@implementation _NSGenerationTokenMapEntry

- (void)dealloc
{
  self->_token = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSGenerationTokenMapEntry;
  -[_NSGenerationTokenMapEntry dealloc](&v3, sel_dealloc);
}

@end