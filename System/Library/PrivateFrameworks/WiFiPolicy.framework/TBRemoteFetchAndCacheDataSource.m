@interface TBRemoteFetchAndCacheDataSource
- (TBCacheProvider)cacheProvider;
- (TBDataSource)fetchDataSource;
- (TBRemoteFetchAndCacheDataSource)initWithFetchDataSource:(id)a3 cacheProvider:(id)a4;
- (void)setCacheProvider:(id)a3;
- (void)setFetchDataSource:(id)a3;
@end

@implementation TBRemoteFetchAndCacheDataSource

- (TBRemoteFetchAndCacheDataSource)initWithFetchDataSource:(id)a3 cacheProvider:(id)a4
{
  v6 = (TBDataSource *)a3;
  v7 = (TBCacheProvider *)a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TBRemoteFetchAndCacheDataSource;
  v8 = -[TBRemoteFetchAndCacheDataSource init](&v13, sel_init);
  fetchDataSource = v8->_fetchDataSource;
  v8->_fetchDataSource = v6;
  v10 = v6;

  cacheProvider = v8->_cacheProvider;
  v8->_cacheProvider = v7;

  return v8;
}

- (TBDataSource)fetchDataSource
{
  return self->_fetchDataSource;
}

- (void)setFetchDataSource:(id)a3
{
}

- (TBCacheProvider)cacheProvider
{
  return self->_cacheProvider;
}

- (void)setCacheProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end