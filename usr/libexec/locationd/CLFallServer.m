@interface CLFallServer
- (BOOL)dataCollectionEnabled;
- (BOOL)sendData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6;
- (id)getUUID;
- (id)initInUniverse:(id)a3;
@end

@implementation CLFallServer

- (id)initInUniverse:(id)a3
{
  return 0LL;
}

- (BOOL)sendData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  return 0;
}

- (id)getUUID
{
  return 0LL;
}

- (BOOL)dataCollectionEnabled
{
  return self->_dataCollectionEnabled;
}

@end