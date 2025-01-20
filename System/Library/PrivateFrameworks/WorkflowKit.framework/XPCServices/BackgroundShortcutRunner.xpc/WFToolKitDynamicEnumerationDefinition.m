@interface WFToolKitDynamicEnumerationDefinition
- (NSString)actionIdentifier;
- (NSString)parameterKey;
- (WFToolKitDynamicEnumerationDefinition)init;
- (void)setActionIdentifier:(id)a3;
- (void)setParameterKey:(id)a3;
@end

@implementation WFToolKitDynamicEnumerationDefinition

- (NSString)actionIdentifier
{
  return (NSString *)ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.getter();
}

- (void)setActionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.setter(v4);
}

- (NSString)parameterKey
{
  return (NSString *)ToolKitHelper.DynamicEnumerationDefinition.parameterKey.getter();
}

- (void)setParameterKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolKitHelper.DynamicEnumerationDefinition.parameterKey.setter(v4);
}

- (WFToolKitDynamicEnumerationDefinition)init
{
}

- (void).cxx_destruct
{
}

@end