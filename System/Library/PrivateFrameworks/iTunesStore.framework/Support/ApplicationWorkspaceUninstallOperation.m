@interface ApplicationWorkspaceUninstallOperation
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceUninstallOperation

- (void)runWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, 1LL, 0LL, 0LL);
  }
}

@end