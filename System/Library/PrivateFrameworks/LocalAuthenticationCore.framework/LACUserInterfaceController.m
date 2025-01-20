@interface LACUserInterfaceController
- (LACUserInterfaceController)init;
- (id)userInterface;
- (id)userInterfaceWithUUID:(id)a3;
- (void)terminateAllUserInterfacesWithReason:(id)a3;
- (void)terminateUserInterfaceWithUUID:(id)a3 reason:(id)a4;
@end

@implementation LACUserInterfaceController

- (LACUserInterfaceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACUserInterfaceController;
  v2 = -[LACUserInterfaceController init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
    activeUserInterfaces = v2->_activeUserInterfaces;
    v2->_activeUserInterfaces = (NSMapTable *)v3;
  }

  return v2;
}

- (id)userInterface
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACUserInterfaceController userInterfaceWithUUID:](self, "userInterfaceWithUUID:", v3);
  return v4;
}

- (id)userInterfaceWithUUID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___LACUserInterfaceNullAdapter);
  -[NSMapTable setObject:forKey:](self->_activeUserInterfaces, "setObject:forKey:", v5, v4);

  return v5;
}

- (void)terminateAllUserInterfacesWithReason:(id)a3
{
  id v8 = a3;
  -[NSMapTable objectEnumerator](self->_activeUserInterfaces, "objectEnumerator");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 nextObject];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      [v5 terminateWithReason:v8];
      -[NSMapTable objectEnumerator](self->_activeUserInterfaces, "objectEnumerator");
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 nextObject];

      v5 = (void *)v7;
    }

    while (v7);
  }
}

- (void)terminateUserInterfaceWithUUID:(id)a3 reason:(id)a4
{
  activeUserInterfaces = self->_activeUserInterfaces;
  id v6 = a4;
  -[NSMapTable objectForKey:](activeUserInterfaces, "objectForKey:", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 terminateWithReason:v6];
}

- (void).cxx_destruct
{
}

@end