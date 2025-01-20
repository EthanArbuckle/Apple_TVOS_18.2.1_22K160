@interface LACPasscodeHelper
+ (id)sharedInstance;
- (BOOL)isPasscodeSetForUser:(unsigned int)a3 error:(id *)a4;
- (LACPasscodeHelper)init;
- (double)passcodeSuccessAge;
- (void)_notifyObserversAboutUpdate;
- (void)_updatePasscodeSuccessAgeWithUptime:(id)a3;
- (void)addObserver:(id)a3;
- (void)keybagStateDidChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updatePasscodeSuccessAgeWithCurrentSystemUptime;
@end

@implementation LACPasscodeHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_5);
  }
  return (id)sharedInstance_sharedInstance_1;
}

void __35__LACPasscodeHelper_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LACPasscodeHelper);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;
}

- (LACPasscodeHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACPasscodeHelper;
  v2 = -[LACPasscodeHelper init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = -[LACKeyBagMKBAdapter initWithUserId:]( objc_alloc(&OBJC_CLASS___LACKeyBagMKBAdapter),  "initWithUserId:",  geteuid());
    keyBagAdapter = v2->_keyBagAdapter;
    v2->_keyBagAdapter = v5;

    -[LACKeyBagMKBAdapter addObserver:](v2->_keyBagAdapter, "addObserver:", v2);
  }

  return v2;
}

- (void)updatePasscodeSuccessAgeWithCurrentSystemUptime
{
}

- (void)_updatePasscodeSuccessAgeWithUptime:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    self->_lastPasscodeSuccessUptime = v4;
  }

  else
  {
    [MEMORY[0x1896079D8] processInfo];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 systemUptime];
    self->_lastPasscodeSuccessUptime = v5;
  }

- (BOOL)isPasscodeSetForUser:(unsigned int)a3 error:(id *)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isPasscodeSet];

  if (a4)
  {
    if (v6)
    {
      *a4 = 0LL;
    }

    else
    {
      id v7 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -5LL,  @"Passcode not set.");
      *a4 = v7;
    }
  }

  return v6;
}

- (double)passcodeSuccessAge
{
  double result = 0.0;
  if (self->_lastPasscodeSuccessUptime > 0.0)
  {
    objc_msgSend(MEMORY[0x1896079D8], "processInfo", 0.0);
    double v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 systemUptime];
    double v6 = v5;

    return v6 - self->_lastPasscodeSuccessUptime;
  }

  return result;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversAboutUpdate
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v3 = (void *)MEMORY[0x189603F18];
  -[NSHashTable allObjects](self->_observers, "allObjects", 0LL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 arrayWithArray:v4];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v10 passcodeSetDidChangeForHelper:self];
        }
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)keybagStateDidChange:(id)a3
{
  uint64_t v4 = [a3 state];
  keyBagDisabled = self->_keyBagDisabled;
  if (!keyBagDisabled || (v4 == 1) != -[NSNumber BOOLValue](keyBagDisabled, "BOOLValue"))
  {
    [MEMORY[0x189607968] numberWithBool:v4 == 1];
    uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_keyBagDisabled;
    self->_keyBagDisabled = v6;

    -[LACPasscodeHelper _notifyObserversAboutUpdate](self, "_notifyObserversAboutUpdate");
  }

- (void).cxx_destruct
{
}

@end