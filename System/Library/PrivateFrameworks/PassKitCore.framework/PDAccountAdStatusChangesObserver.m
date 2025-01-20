@interface PDAccountAdStatusChangesObserver
- (PDAccountAdStatusChangesObserver)initWithAccountManager:(id)a3;
- (void)dealloc;
@end

@implementation PDAccountAdStatusChangesObserver

- (PDAccountAdStatusChangesObserver)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountAdStatusChangesObserver;
  v6 = -[PDAccountAdStatusChangesObserver init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    -[PDAccountManager registerObserver:](v7->_accountManager, "registerObserver:", v7);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAccountAdStatusChangesObserver;
  -[PDAccountAdStatusChangesObserver dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end