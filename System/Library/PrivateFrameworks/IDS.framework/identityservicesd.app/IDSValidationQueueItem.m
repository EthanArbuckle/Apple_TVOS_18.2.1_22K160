@interface IDSValidationQueueItem
- (BOOL)isEqual:(id)a3;
- (IDSBaseMessage)message;
- (IDSValidationQueueItem)initWithMessage:(id)a3 subsystem:(int64_t)a4 sendBlock:(id)a5;
- (id)sendBlock;
- (int64_t)subsystem;
- (void)setMessage:(id)a3;
- (void)setSendBlock:(id)a3;
- (void)setSubsystem:(int64_t)a3;
@end

@implementation IDSValidationQueueItem

- (IDSValidationQueueItem)initWithMessage:(id)a3 subsystem:(int64_t)a4 sendBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IDSValidationQueueItem;
  v11 = -[IDSValidationQueueItem init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    v12->_subsystem = a4;
    id v13 = objc_retainBlock(v10);
    id sendBlock = v12->_sendBlock;
    v12->_id sendBlock = v13;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5 && (uint64_t v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationQueueItem message](self, "message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    BOOL v9 = v7 == v8;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (IDSBaseMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(int64_t)a3
{
  self->_subsystem = a3;
}

- (id)sendBlock
{
  return self->_sendBlock;
}

- (void)setSendBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end