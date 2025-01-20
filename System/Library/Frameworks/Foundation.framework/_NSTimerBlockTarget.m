@interface _NSTimerBlockTarget
- (void)dealloc;
- (void)fire:(id)a3;
@end

@implementation _NSTimerBlockTarget

- (void)fire:(id)a3
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  _Block_release(self->_block);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSTimerBlockTarget;
  -[_NSTimerBlockTarget dealloc](&v3, sel_dealloc);
}

@end