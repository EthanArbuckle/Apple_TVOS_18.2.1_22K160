@interface NWStatsPollHandler
- (BOOL)synchronous;
- (NWStatsManager)manager;
- (NWStatsPollHandler)init;
- (id)completionBlock;
- (id)deliveryBlock;
- (id)description;
- (int64_t)instanceNumber;
- (unint64_t)ntstatContext;
- (void)handleSnapshot:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDeliveryBlock:(id)a3;
- (void)setInstanceNumber:(int64_t)a3;
- (void)setManager:(id)a3;
- (void)setNtstatContext:(unint64_t)a3;
- (void)setSynchronous:(BOOL)a3;
@end

@implementation NWStatsPollHandler

- (id)description
{
  return (id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"NWStatsPollHandler at %p instance %lld, context %lld",  self,  -[NWStatsPollHandler instanceNumber](self, "instanceNumber"),  self->_ntstatContext);
}

- (NWStatsPollHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWStatsPollHandler;
  result = -[NWStatsPollHandler init](&v4, sel_init);
  if (result)
  {
    int64_t v3 = pollHandlerNextSeqno++;
    result->_instanceNumber = v3;
  }

  return result;
}

- (void)handleSnapshot:(id)a3
{
  id v6 = a3;
  -[NWStatsPollHandler deliveryBlock](self, "deliveryBlock");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NWStatsPollHandler deliveryBlock](self, "deliveryBlock");
    v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)deliveryBlock
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDeliveryBlock:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (int64_t)instanceNumber
{
  return self->_instanceNumber;
}

- (void)setInstanceNumber:(int64_t)a3
{
  self->_instanceNumber = a3;
}

- (unint64_t)ntstatContext
{
  return self->_ntstatContext;
}

- (void)setNtstatContext:(unint64_t)a3
{
  self->_ntstatContext = a3;
}

- (NWStatsManager)manager
{
  return (NWStatsManager *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end