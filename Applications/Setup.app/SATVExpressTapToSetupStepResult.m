@interface SATVExpressTapToSetupStepResult
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)itemTypes;
- (void)setItemTypes:(unint64_t)a3;
@end

@implementation SATVExpressTapToSetupStepResult

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupStepResult;
  id v4 = -[SATVExpressTapToSetupStepResult descriptionBuilderWithMultilinePrefix:]( &v9,  "descriptionBuilderWithMultilinePrefix:",  a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = TVSKExpressTapToSetupItemTypesDescription(-[SATVExpressTapToSetupStepResult itemTypes](self, "itemTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 appendString:v7 withName:@"itemTypes"];

  return v5;
}

- (unint64_t)itemTypes
{
  return self->_itemTypes;
}

- (void)setItemTypes:(unint64_t)a3
{
  self->_itemTypes = a3;
}

@end