@interface LACKeyBagProvider
+ (LACKeyBagProvider)sharedInstance;
- (LACKeyBagProvider)init;
- (id)keybagForUserId:(unsigned int)a3;
@end

@implementation LACKeyBagProvider

- (LACKeyBagProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACKeyBagProvider;
  v2 = -[LACKeyBagProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    userKeybags = v2->_userKeybags;
    v2->_userKeybags = v3;
  }

  return v2;
}

+ (LACKeyBagProvider)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_10);
  }
  return (LACKeyBagProvider *)(id)sharedInstance_sharedInstance_5;
}

void __35__LACKeyBagProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LACKeyBagProvider);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;
}

- (id)keybagForUserId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  userKeybags = self->_userKeybags;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](userKeybags, "objectForKeyedSubscript:", v6);
  v7 = (LACKeyBagMKBAdapter *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[LACKeyBagMKBAdapter initWithUserId:](objc_alloc(&OBJC_CLASS___LACKeyBagMKBAdapter), "initWithUserId:", v3);
    v8 = self->_userKeybags;
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end