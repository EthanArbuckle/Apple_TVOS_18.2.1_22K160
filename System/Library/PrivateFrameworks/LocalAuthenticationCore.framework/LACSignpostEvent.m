@interface LACSignpostEvent
- (LACSignpostEvent)initWithSendBlock:(id)a3;
- (void)_sendWithMessage:(id)a3;
- (void)send;
@end

@implementation LACSignpostEvent

- (LACSignpostEvent)initWithSendBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACSignpostEvent;
  v5 = -[LACSignpostEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    id sendBlock = v5->_sendBlock;
    v5->_id sendBlock = v6;
  }

  return v5;
}

- (void)send
{
}

- (void)_sendWithMessage:(id)a3
{
  id sendBlock = (void (**)(id, id))self->_sendBlock;
  if (sendBlock) {
    sendBlock[2](sendBlock, a3);
  }
}

- (void).cxx_destruct
{
}

@end