@interface RBSService
+ (BOOL)saveEndowment:(id)a3 forKey:(id)a4 withError:(id *)a5;
- (RBSService)init;
- (id)inheritances;
- (id)managedEndpointByLaunchIdentifier;
- (void)_init;
- (void)dealloc;
- (void)didLoseInheritances:(id)a3;
- (void)didReceiveInheritances:(id)a3;
@end

@implementation RBSService

- (void)_init
{
  if (!a1) {
    return 0LL;
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_CLASS___RBSService;
  v1 = objc_msgSendSuper2(&v10, sel_init);
  v2 = v1;
  if (v1)
  {
    *((_DWORD *)v1 + 4) = 0;
    uint64_t v3 = [MEMORY[0x189603FE0] set];
    v4 = (void *)v2[3];
    v2[3] = v3;

    uint64_t v5 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    v6 = (void *)v2[4];
    v2[4] = v5;

    dispatch_queue_t v7 = +[RBSWorkloop createCalloutQueue:]( (uint64_t)&OBJC_CLASS___RBSWorkloop,  @"com.apple.runningboard.service.callout");
    v8 = (void *)v2[5];
    v2[5] = v7;
  }

  return v2;
}

- (RBSService)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSService.m" lineNumber:52 description:@"cannot call -init on RBSService"];

  return 0LL;
}

- (void)dealloc
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSService.m" lineNumber:68 description:@"RBSService must not dealloc"];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBSService;
  -[RBSService dealloc](&v5, sel_dealloc);
}

+ (BOOL)saveEndowment:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, a1, @"RBSService.m", 74, @"Invalid parameter not satisfying: %@", @"endowment" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, a1, @"RBSService.m", 75, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  v13 = +[RBSSavedEndowment savedEndowment:withKey:](&OBJC_CLASS___RBSSavedEndowment, "savedEndowment:withKey:", v9, v11);
  char v14 = [v12 saveEndowment:v13 withError:a5];

  return v14;
}

- (id)inheritances
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_inheritances, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)managedEndpointByLaunchIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection managedEndpointByLaunchIdentifier]((uint64_t)v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didReceiveInheritances:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet unionSet:](self->_inheritances, "unionSet:", v4);
  calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __37__RBSService_didReceiveInheritances___block_invoke;
  v8[3] = &unk_189DE0C40;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(calloutQueue, v8);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __37__RBSService_didReceiveInheritances___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) service:*(void *)(a1 + 32) didReceiveInheritances:*(void *)(a1 + 40)];
}

- (void)didLoseInheritances:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet minusSet:](self->_inheritances, "minusSet:", v4);
  calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __34__RBSService_didLoseInheritances___block_invoke;
  v8[3] = &unk_189DE0C40;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(calloutQueue, v8);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __34__RBSService_didLoseInheritances___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) service:*(void *)(a1 + 32) didLoseInheritances:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end