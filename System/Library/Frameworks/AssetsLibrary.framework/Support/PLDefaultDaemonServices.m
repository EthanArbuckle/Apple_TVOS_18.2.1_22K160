@interface PLDefaultDaemonServices
- (id)captureSessionStateFromAuditToken:(id *)a3;
@end

@implementation PLDefaultDaemonServices

- (id)captureSessionStateFromAuditToken:(id *)a3
{
  uint64_t v3 = PLMethodNotImplementedException(self, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_exception_throw(v4);
  return (id)-[PLExcessiveDatabaseSizeMaintenanceTask runTaskWithTransaction:](v5, v6, v7);
}

@end