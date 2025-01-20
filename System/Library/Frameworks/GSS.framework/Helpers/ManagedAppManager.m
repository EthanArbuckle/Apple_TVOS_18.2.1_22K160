@interface ManagedAppManager
- (BOOL)isManagedApp:(id)a3 auditToken:(id *)a4;
- (ManagedAppManager)init;
- (NSArray)managedApps;
- (void)dealloc;
- (void)setManagedApps:(id)a3;
@end

@implementation ManagedAppManager

- (ManagedAppManager)init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ManagedAppManager;
  v6 = -[ManagedAppManager init](&v4, "init");
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    objc_storeStrong((id *)&v6->managedApps, &__NSArray0__struct);
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (void)dealloc
{
  SEL v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___ManagedAppManager;
  -[ManagedAppManager dealloc](&v3, "dealloc");
}

- (BOOL)isManagedApp:(id)a3 auditToken:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 0;
}

- (NSArray)managedApps
{
  return self->managedApps;
}

- (void)setManagedApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end