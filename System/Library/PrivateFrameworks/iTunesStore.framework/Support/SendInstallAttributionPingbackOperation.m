@interface SendInstallAttributionPingbackOperation
- (SendInstallAttributionPingbackOperation)initWithAdamId:(id)a3;
- (void)run;
@end

@implementation SendInstallAttributionPingbackOperation

- (SendInstallAttributionPingbackOperation)initWithAdamId:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SendInstallAttributionPingbackOperation;
  v5 = -[SendInstallAttributionPingbackOperation init](&v9, "init");
  if (v5)
  {
    v6 = (NSNumber *)[v4 copy];
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = v6;
  }

  return v5;
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"));
  [v3 setPingbackPendingForApp:self->_appAdamId];

  -[SendInstallAttributionPingbackOperation setSuccess:](self, "setSuccess:", 1LL);
  -[SendInstallAttributionPingbackOperation setError:](self, "setError:", 0LL);
}

- (void).cxx_destruct
{
}

@end