@interface PDCloudStoreStateConfiguration
- (NSString)operationGroupNameSuffix;
- (id)description;
- (id)stateChangeCompletion;
- (unint64_t)currentState;
- (unint64_t)retryCount;
- (void)setCurrentState:(unint64_t)a3;
- (void)setOperationGroupNameSuffix:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setStateChangeCompletion:(id)a3;
@end

@implementation PDCloudStoreStateConfiguration

- (id)description
{
  v3 = PDCloudStoreContainerStateToString(-[PDCloudStoreStateConfiguration currentState](self, "currentState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreStateConfiguration operationGroupNameSuffix](self, "operationGroupNameSuffix"));
  -[PDCloudStoreStateConfiguration retryCount](self, "retryCount");
  uint64_t v5 = PKStringWithValidatedFormat(@"state: %@, operationGroupNameSuffix: %@, retry count: %lu", @"%@%@%lu");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (NSString)operationGroupNameSuffix
{
  return self->_operationGroupNameSuffix;
}

- (void)setOperationGroupNameSuffix:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (id)stateChangeCompletion
{
  return self->_stateChangeCompletion;
}

- (void)setStateChangeCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end