@interface AXCatalogRefreshTask
- (AXCatalogRefreshTask)initWithPolicy:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5;
- (NSNumber)overrideTimeout;
- (void)_refreshCatalog:(BOOL)a3;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)setOverrideTimeout:(id)a3;
@end

@implementation AXCatalogRefreshTask

- (AXCatalogRefreshTask)initWithPolicy:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5
{
  v7[1] = 3221225472LL;
  v7[2] = sub_100005C78;
  v7[3] = &unk_100020748;
  BOOL v8 = a4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXCatalogRefreshTask;
  v7[0] = _NSConcreteStackBlock;
  return -[AXManagedAssetTask initWithName:policy:context:block:]( &v6,  "initWithName:policy:context:block:",  @"Catalog Refresh",  a3,  a5,  v7);
}

- (void)_refreshCatalog:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AXLogAssetDaemon(self);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (v3) {
      v7 = @"force-update";
    }
    else {
      v7 = @"attempt to update";
    }
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXCatalogRefreshTask overrideTimeout](self, "overrideTimeout"));
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AXCatalogRefreshTask: Will %@ catalog now. timeout=%@",  (uint8_t *)&v12,  0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask assetController](self, "assetController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXCatalogRefreshTask overrideTimeout](self, "overrideTimeout"));
  [v9 refreshAssetsByForceUpdatingCatalog:v3 updatingCatalogIfNeeded:v3 ^ 1 catalogRefreshOverrideTimeout:v10 completion:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTask assetController](self, "assetController"));
  [v11 addObserver:self];
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
}

- (NSNumber)overrideTimeout
{
  return self->_overrideTimeout;
}

- (void)setOverrideTimeout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end