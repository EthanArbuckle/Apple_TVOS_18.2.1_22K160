@interface SATVFlowDescriptionProviderContext
- (BOOL)isCLIMode;
- (BOOL)isUpdateFlow;
- (SATVFlowDescriptionProviderContext)initWithIsUpdateFlow:(BOOL)a3 isCLIMode:(BOOL)a4;
- (id)description;
@end

@implementation SATVFlowDescriptionProviderContext

- (SATVFlowDescriptionProviderContext)initWithIsUpdateFlow:(BOOL)a3 isCLIMode:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVFlowDescriptionProviderContext;
  result = -[SATVFlowDescriptionProviderContext init](&v7, "init");
  if (result)
  {
    result->_updateFlow = a3;
    result->_CLIMode = a4;
  }

  return result;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendBool:self->_updateFlow withName:@"updateFlow"];
  id v5 = [v3 appendBool:self->_CLIMode withName:@"CLIMode"];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v6;
}

- (BOOL)isUpdateFlow
{
  return self->_updateFlow;
}

- (BOOL)isCLIMode
{
  return self->_CLIMode;
}

@end