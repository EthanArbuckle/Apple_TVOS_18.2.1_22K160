@interface PassDynamicState
- (PKPassBalanceModel)balanceModel;
- (PKPassLiveRender)liveRender;
- (PKPassRelevancyModel)relevancyModel;
- (void)setBalanceModel:(id)a3;
- (void)setLiveRender:(id)a3;
- (void)setRelevancyModel:(id)a3;
@end

@implementation PassDynamicState

- (PKPassLiveRender)liveRender
{
  return self->_liveRender;
}

- (void)setLiveRender:(id)a3
{
}

- (PKPassBalanceModel)balanceModel
{
  return self->_balanceModel;
}

- (void)setBalanceModel:(id)a3
{
}

- (PKPassRelevancyModel)relevancyModel
{
  return self->_relevancyModel;
}

- (void)setRelevancyModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end