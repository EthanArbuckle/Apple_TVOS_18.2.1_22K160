@interface AppleKeyboardStateManager
+ (id)sharedManager;
- (AppleKeyboardStateManager)init;
- (BOOL)isCapsLockEnabled:(id)a3;
- (NSMutableSet)capsLockStateTable;
- (void)setCapsLockEnabled:(BOOL)a3 locationID:(id)a4;
- (void)setCapsLockStateTable:(id)a3;
@end

@implementation AppleKeyboardStateManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1890B8DB8;
  block[3] = &unk_18A3441C8;
  block[4] = a1;
  if (qword_18C767EB0 != -1) {
    dispatch_once(&qword_18C767EB0, block);
  }
  return (id)qword_18C767EA8;
}

- (AppleKeyboardStateManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AppleKeyboardStateManager;
  v2 = -[AppleKeyboardStateManager init](&v7, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    capsLockStateTable = v2->_capsLockStateTable;
    v2->_capsLockStateTable = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isCapsLockEnabled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    char v6 = -[NSMutableSet containsObject:](v5->_capsLockStateTable, "containsObject:", v4);
    objc_sync_exit(v5);
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setCapsLockEnabled:(BOOL)a3 locationID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    objc_super v7 = self;
    objc_sync_enter(v7);
    capsLockStateTable = v7->_capsLockStateTable;
    if (v4) {
      -[NSMutableSet addObject:](capsLockStateTable, "addObject:", v9);
    }
    else {
      -[NSMutableSet removeObject:](capsLockStateTable, "removeObject:", v9);
    }
    objc_sync_exit(v7);

    id v6 = v9;
  }
}

- (NSMutableSet)capsLockStateTable
{
  return self->_capsLockStateTable;
}

- (void)setCapsLockStateTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end