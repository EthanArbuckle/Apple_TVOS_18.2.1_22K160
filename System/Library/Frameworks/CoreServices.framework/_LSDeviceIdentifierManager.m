@interface _LSDeviceIdentifierManager
+ (id)sharedInstance;
- (_LSDeviceIdentifierManager)init;
- (id)cacheForPersona:(id)a3;
@end

@implementation _LSDeviceIdentifierManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44___LSDeviceIdentifierManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_LSDeviceIdentifierManager sharedInstance]::once != -1) {
    dispatch_once(&+[_LSDeviceIdentifierManager sharedInstance]::once, block);
  }
  return (id)+[_LSDeviceIdentifierManager sharedInstance]::result;
}

- (id)cacheForPersona:(id)a3
{
  id v4 = a3;
  if (v4 && (getUMUserPersonaClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    if ([v5 isEnterprisePersona])
    {
      [v5 userPersonaUniqueString];
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v6 = &stru_189D7B4C8;
    }
  }

  else
  {
    v6 = &stru_189D7B4C8;
  }

  v7 = self->_sharedCaches;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKey:](self->_sharedCaches, "objectForKey:", v6);
  v8 = (_LSDeviceIdentifierCache *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_LSDeviceIdentifierCache initWithPersona:]( objc_alloc(&OBJC_CLASS____LSDeviceIdentifierCache),  "initWithPersona:",  v6);
    -[NSMutableDictionary setObject:forKey:](self->_sharedCaches, "setObject:forKey:", v8, v6);
  }

  objc_sync_exit(v7);

  return v8;
}

- (_LSDeviceIdentifierManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____LSDeviceIdentifierManager;
  v2 = -[_LSDeviceIdentifierManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    sharedCaches = v2->_sharedCaches;
    v2->_sharedCaches = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end