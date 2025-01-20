@interface CKDiscretionarySchedulerTask
- (CKDiscretionarySchedulerTask)init;
- (unint64_t)state;
- (void)setState:(unint64_t)a3;
@end

@implementation CKDiscretionarySchedulerTask

- (CKDiscretionarySchedulerTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKDiscretionarySchedulerTask;
  result = -[CKDiscretionarySchedulerTask init](&v3, "init");
  if (result) {
    result->_state = 0LL;
  }
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end