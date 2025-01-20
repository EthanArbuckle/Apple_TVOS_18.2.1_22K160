@interface NSXPCStoreServerConnectionContext
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_allowCoreDataFutures;
- (NSXPCStoreServerConnectionContext)initWithConnectionInfo:(id)a3;
- (id)cache;
- (id)description;
- (id)entitlements;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)managedObjectContext;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)notificationManager;
- (id)persistentStoreCoordinator;
- (id)userInfo;
- (void)dealloc;
- (void)setActiveStore:(uint64_t)a1;
- (void)setManagedObjectContext:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NSXPCStoreServerConnectionContext

- (void)setActiveStore:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 32) = a2;
    }
  }

- (NSXPCStoreServerConnectionContext)initWithConnectionInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCStoreServerConnectionContext;
  id v4 = -[NSXPCStoreServerConnectionContext init](&v6, sel_init);
  if (v4) {
    v4->_info = (NSXPCStoreConnectionInfo *)a3;
  }
  return v4;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"<NSXPCStoreServerConnectionContext: \n\tentitlements = %@ ;\n\tcontext = %@ ;\n\tinfo = %@>",
               -[NSXPCStoreServerConnectionContext entitlements](self, "entitlements"),
               self->_context,
               self->_info);
}

- (void)dealloc
{
  self->_activeStore = 0LL;
  self->_info = 0LL;

  self->_context = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCStoreServerConnectionContext;
  -[NSXPCStoreServerConnectionContext dealloc](&v3, sel_dealloc);
}

- (id)entitlements
{
  return -[NSXPCStoreConnectionInfo entitlements](self->_info, "entitlements");
}

- (id)persistentStoreCoordinator
{
  return -[NSXPCStoreConnectionInfo persistentStoreCoordinator](self->_info, "persistentStoreCoordinator");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_info;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)managedObjectContext
{
  return self->_context;
}

- (void)setManagedObjectContext:(id)a3
{
  if (self->_context != a3)
  {
    id v5 = a3;

    self->_context = (NSManagedObjectContext *)a3;
  }

- (id)userInfo
{
  return -[NSXPCStoreConnectionInfo userInfo](self->_info, "userInfo");
}

- (void)setUserInfo:(id)a3
{
  info = self->_info;
  if (info)
  {
    id v5 = a3;
    os_unfair_lock_lock_with_options();
    id userInfo = info->_userInfo;
    info->_id userInfo = a3;
    os_unfair_lock_unlock(&info->_lock);
  }

- (id)notificationManager
{
  return self->_manager;
}

- (void)setNotificationManager:(id)a3
{
  if (self->_manager != a3)
  {
    id v5 = a3;

    self->_manager = a3;
  }

- (id)cache
{
  info = self->_info;
  if (info) {
    return info->_cache;
  }
  else {
    return 0LL;
  }
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return (id)objc_msgSend( -[NSXPCStoreServerConnectionContext cache](self, "cache"),  "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:",  a3,  a4);
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return (id)objc_msgSend( -[NSXPCStoreServerConnectionContext cache](self, "cache"),  "manyToOnePrefetchRequestForRelationshipNamed:onEntity:",  a3,  a4);
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return (id)objc_msgSend( -[NSXPCStoreServerConnectionContext cache](self, "cache"),  "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:",  a3,  a4);
}

- (BOOL)_allowCoreDataFutures
{
  return 1;
}

@end