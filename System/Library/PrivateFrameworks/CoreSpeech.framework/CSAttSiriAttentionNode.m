@interface CSAttSiriAttentionNode
+ (BOOL)supportAttentionLostAndGain;
- (BOOL)isReady;
- (CSAttSiriAttentionNode)initWithAttSiriController:(id)a3;
- (CSAttSiriController)attSiriController;
- (NSArray)requiredNodes;
- (unint64_t)type;
- (void)setAttSiriController:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setRequiredNodes:(id)a3;
@end

@implementation CSAttSiriAttentionNode

+ (BOOL)supportAttentionLostAndGain
{
  return 0;
}

- (CSAttSiriAttentionNode)initWithAttSiriController:(id)a3
{
  return 0LL;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (void)setRequiredNodes:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end