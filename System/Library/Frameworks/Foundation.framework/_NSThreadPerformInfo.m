@interface _NSThreadPerformInfo
- (int)wait;
- (void)dealloc;
- (void)signal:(int)a3;
@end

@implementation _NSThreadPerformInfo

- (void)signal:(int)a3
{
  self->_state = a3;
  -[NSCondition signal](self->_waiter, "signal");
  -[NSCondition unlock](self->_waiter, "unlock");
}

- (int)wait
{
  while (1)
  {
    int state = self->_state;
    if (state) {
      break;
    }
    -[NSCondition wait](self->_waiter, "wait");
  }

  -[NSCondition unlock](self->_waiter, "unlock");
  return state;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSThreadPerformInfo;
  -[_NSThreadPerformInfo dealloc](&v3, sel_dealloc);
}

@end