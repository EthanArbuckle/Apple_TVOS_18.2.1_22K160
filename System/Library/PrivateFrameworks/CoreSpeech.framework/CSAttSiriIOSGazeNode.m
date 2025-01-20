@interface CSAttSiriIOSGazeNode
- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriIOSGazeNode)initWithAttSiriController:(id)a3;
- (NSArray)requiredNodes;
- (NSString)mhId;
- (unint64_t)type;
- (void)setAttSiriController:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setRequiredNodes:(id)a3;
@end

@implementation CSAttSiriIOSGazeNode

- (CSAttSiriIOSGazeNode)initWithAttSiriController:(id)a3
{
  return 0LL;
}

- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0;
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
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

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end