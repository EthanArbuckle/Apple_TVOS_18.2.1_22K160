@interface UMSideEffects
- (UMLibInfoProviding)libInfo;
- (UMLibNotifyProviding)libNotify;
- (void)setLibInfo:(id)a3;
- (void)setLibNotify:(id)a3;
@end

@implementation UMSideEffects

- (UMLibInfoProviding)libInfo
{
  return self->_libInfo;
}

- (void)setLibInfo:(id)a3
{
}

- (UMLibNotifyProviding)libNotify
{
  return self->_libNotify;
}

- (void)setLibNotify:(id)a3
{
}

- (void).cxx_destruct
{
}

@end