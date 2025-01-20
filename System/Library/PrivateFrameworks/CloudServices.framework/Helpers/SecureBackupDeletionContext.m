@interface SecureBackupDeletionContext
- (EscrowService)escrowService;
- (NSError)deleteError;
- (NSMutableArray)recordIDs;
- (SecureBackup)request;
- (id)completionBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setDeleteError:(id)a3;
- (void)setEscrowService:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation SecureBackupDeletionContext

- (SecureBackup)request
{
  return (SecureBackup *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (EscrowService)escrowService
{
  return (EscrowService *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEscrowService:(id)a3
{
}

- (NSMutableArray)recordIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRecordIDs:(id)a3
{
}

- (NSError)deleteError
{
  return (NSError *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDeleteError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end