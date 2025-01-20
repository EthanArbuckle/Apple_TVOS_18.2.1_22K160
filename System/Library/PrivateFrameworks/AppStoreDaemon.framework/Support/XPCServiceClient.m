@interface XPCServiceClient
- (AMSProcessInfo)processInfo;
- (ASDSupportedDialogHandlers)supportedDialogHandlers;
- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverNotifications:(id)a3 withBarrierBlock:(id)a4;
- (void)deliverProgress:(id)a3 withBarrierBlock:(id)a4;
- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)getAppStoreServiceWithReplyHandler:(id)a3;
- (void)getCrossfireServiceWithReplyHandler:(id)a3;
- (void)getDiagnosticServiceWithReplyHandler:(id)a3;
- (void)getFairPlayServiceWithReplyHandler:(id)a3;
- (void)getIAPHistoryServiceWithReplyHandler:(id)a3;
- (void)getInstallationServiceWithReplyHandler:(id)a3;
- (void)getLibraryServiceWithReplyHandler:(id)a3;
- (void)getManagedAppServiceWithReplyHandler:(id)a3;
- (void)getMetricsServiceWithReplyHandler:(id)a3;
- (void)getOcelotServiceWithReplyHandler:(id)a3;
- (void)getPurchaseHistoryServiceWithReplyHandler:(id)a3;
- (void)getPurchaseServiceWithReplyHandler:(id)a3;
- (void)getRepairServiceWithReplyHandler:(id)a3;
- (void)getRestoreServiceWithReplyHandler:(id)a3;
- (void)getUpdatesServiceWithReplyHandler:(id)a3;
- (void)setSupportedNotificationDelivery:(id)a3;
@end

@implementation XPCServiceClient

- (void)getAppStoreServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 8LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_AppStoreServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getDiagnosticServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_diagnosticServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getFairPlayServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic(dest, &v8->_fairPlayEntitlement, (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getIAPHistoryServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_IAPHistoryServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getInstallationServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_installationServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getLibraryServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 56LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_libraryServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getCrossfireServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_CrossfireServerEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getManagedAppServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 72LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_ManagedAppServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getOcelotServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic(dest, &v8->_OcelotServerEntitlement, (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getMetricsServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 64LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_MetricsServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getPurchaseHistoryServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_PurchaseHistoryServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getPurchaseServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_PurchaseServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getRepairServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 104LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_RepairServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getRestoreServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_RestoreServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)getUpdatesServiceWithReplyHandler:(id)a3
{
  catalog = self->_catalog;
  id v6 = a3;
  if (catalog) {
    id Property = objc_getProperty(catalog, v5, 120LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  v8 = self->_catalog;
  if (v8)
  {
    objc_copyCppObjectAtomic( dest,  &v8->_UpdatesServiceEntitlement,  (void (__cdecl *)(void *, const void *))sub_1001E0FA4);
    v9 = (void *)dest[0];
    v10 = (void *)dest[1];
  }

  else
  {
    v10 = 0LL;
    v9 = 0LL;
  }

  sub_10022A654((uint64_t)self, v11, v9, v10, v6);
}

- (void)setSupportedNotificationDelivery:(id)a3
{
  v4 = (ASDSupportedDialogHandlers *)a3;
  obj = self;
  objc_sync_enter(obj);
  supportedDialogHandlers = obj->_supportedDialogHandlers;
  obj->_supportedDialogHandlers = v4;

  objc_sync_exit(obj);
}

- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022B248;
  v11[3] = &unk_1003E9C30;
  id v12 = v6;
  id v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v11]);
  [v10 deliverAlertPresentationRequest:v7 resultHandler:v9];
}

- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022B31C;
  v11[3] = &unk_1003E9C30;
  id v12 = v6;
  id v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v11]);
  [v10 deliverAuthenticateRequest:v7 withResultHandler:v9];
}

- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022B3F0;
  v11[3] = &unk_1003E9C30;
  id v12 = v6;
  id v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v11]);
  [v10 deliverDialogRequest:v7 withResultHandler:v9];
}

- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022B4C4;
  v11[3] = &unk_1003E9C30;
  id v12 = v6;
  id v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v11]);
  [v10 deliverEngagementRequest:v7 withResultHandler:v9];
}

- (void)deliverNotifications:(id)a3 withBarrierBlock:(id)a4
{
  p_connection = &self->_connection;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _unboostingRemoteObjectProxy]);
  [v9 deliverNotifications:v7];

  id v10 = objc_loadWeakRetained((id *)p_connection);
  [v10 addBarrierBlock:v6];
}

- (void)deliverProgress:(id)a3 withBarrierBlock:(id)a4
{
  p_connection = &self->_connection;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _unboostingRemoteObjectProxy]);
  [v9 deliverProgress:v7];

  id v10 = objc_loadWeakRetained((id *)p_connection);
  [v10 addBarrierBlock:v6];
}

- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022B6B8;
  v11[3] = &unk_1003E9C30;
  id v12 = v6;
  id v9 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v11]);
  [v10 deliverViewPresentationRequest:v7 resultHandler:v9];
}

- (ASDSupportedDialogHandlers)supportedDialogHandlers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedDialogHandlers;
  objc_sync_exit(v2);

  return v3;
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

@end