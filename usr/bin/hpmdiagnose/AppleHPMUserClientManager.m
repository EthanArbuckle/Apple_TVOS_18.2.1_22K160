@interface AppleHPMUserClientManager
+ (id)sharedInstance;
- (AppleHPMUserClientManager)init;
- (NSMutableOrderedSet)userClientSet;
- (id)userClientForRouterID:(unsigned __int8)a3 andRoute:(unint64_t)a4;
- (int)createUserClientForService:(unsigned int)a3;
- (int)findUserClients;
- (void)dealloc;
- (void)setUserClientSet:(id)a3;
@end

@implementation AppleHPMUserClientManager

+ (id)sharedInstance
{
  v3 = (void *)qword_100021800;
  if (!qword_100021800)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_100021800;
    qword_100021800 = (uint64_t)v4;

    v3 = (void *)qword_100021800;
  }

  return v3;
}

- (AppleHPMUserClientManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AppleHPMUserClientManager;
  v2 = -[AppleHPMUserClientManager init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    -[AppleHPMUserClientManager setUserClientSet:](v2, "setUserClientSet:", v3);

    -[AppleHPMUserClientManager findUserClients](v2, "findUserClients");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppleHPMUserClientManager;
  -[AppleHPMUserClientManager dealloc](&v3, "dealloc");
}

- (id)userClientForRouterID:(unsigned __int8)a3 andRoute:(unint64_t)a4
{
  int v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppleHPMUserClientManager userClientSet](self, "userClientSet", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v11 routerID] == v5 && objc_msgSend(v11, "routeString") == (id)a4)
        {
          id v12 = v11;
          goto LABEL_12;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_12:

  return v12;
}

- (int)findUserClients
{
  kern_return_t MatchingServices;
  uint64_t v5;
  uint64_t v6;
  io_iterator_t existing;
  objc_super v3 = IOServiceMatching("AppleHPM");
  existing = 0;
  if (!v3) {
    return -536870212;
  }
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if (!existing) {
    return -536870160;
  }
  if (!MatchingServices)
  {
    IOIteratorReset(existing);
    int v5 = IOIteratorNext(existing);
    if ((_DWORD)v5)
    {
      v6 = v5;
      do
      {
        -[AppleHPMUserClientManager createUserClientForService:](self, "createUserClientForService:", v6);
        v6 = IOIteratorNext(existing);
      }

      while ((_DWORD)v6);
    }
  }

  if (existing) {
    IOObjectRelease(existing);
  }
  return MatchingServices;
}

- (int)createUserClientForService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = objc_alloc_init(&OBJC_CLASS___AppleHPMUserClient);
  int v6 = -[AppleHPMUserClient createUserClientForService:](v5, "createUserClientForService:", v3);
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppleHPMUserClientManager userClientSet](self, "userClientSet"));
    [v7 addObject:v5];
  }

  return v6;
}

- (NSMutableOrderedSet)userClientSet
{
  return self->_userClientSet;
}

- (void)setUserClientSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end