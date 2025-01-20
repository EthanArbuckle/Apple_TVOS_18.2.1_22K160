@interface DCAssetFetcherContext
- (BOOL)allowCatalogRefresh;
- (BOOL)ignoreCachedMetadata;
- (id)description;
- (void)setAllowCatalogRefresh:(BOOL)a3;
- (void)setIgnoreCachedMetadata:(BOOL)a3;
@end

@implementation DCAssetFetcherContext

- (id)description
{
  id v3 = [(id)objc_opt_class(self) description];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p - refreshAllowed: %d, ignoreMetadataCache: %d>",  v4,  self,  self->_allowCatalogRefresh,  self->_ignoreCachedMetadata));

  return v5;
}

- (BOOL)allowCatalogRefresh
{
  return self->_allowCatalogRefresh;
}

- (void)setAllowCatalogRefresh:(BOOL)a3
{
  self->_allowCatalogRefresh = a3;
}

- (BOOL)ignoreCachedMetadata
{
  return self->_ignoreCachedMetadata;
}

- (void)setIgnoreCachedMetadata:(BOOL)a3
{
  self->_ignoreCachedMetadata = a3;
}

@end