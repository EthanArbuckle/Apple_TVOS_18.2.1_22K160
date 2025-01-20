@interface SKProgress
+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3;
- (NSMutableArray)children;
- (SKProgress)init;
- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLocalizedAdditionalDescription:(id)a3;
@end

@implementation SKProgress

- (void)setLocalizedAdditionalDescription:(id)a3
{
  v4 = (void *)MEMORY[0x189607810];
  id v5 = a3;
  [v4 newlineCharacterSet];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringByTrimmingCharactersInSet:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v7, *MEMORY[0x189607BB8]);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKProgress;
  -[SKProgress setLocalizedAdditionalDescription:](&v8, sel_setLocalizedAdditionalDescription_, v7);
}

+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3
{
  v4 = (void *)objc_opt_new();
  [v4 setTotalUnitCount:a3];
  return (SKProgress *)v4;
}

- (SKProgress)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SKProgress;
  v2 = -[SKProgress init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKProgress set_adoptChildUserInfo:](v2, "set_adoptChildUserInfo:", 1LL);
    -[SKProgress setLocalizedAdditionalDescription:](v3, "setLocalizedAdditionalDescription:", &stru_18A323F58);
    uint64_t v4 = objc_opt_new();
    children = v3->_children;
    v3->_children = (NSMutableArray *)v4;
  }

  return v3;
}

- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4
{
  id v6 = a3;
  -[SKProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", v6, a4);
  -[SKProgress children](self, "children");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addObject:v6];

  [v6 userInfo];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 addObserver:self forKeyPath:*MEMORY[0x189607BB8] options:0 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = *MEMORY[0x189607BB8];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x189607BB8], a4, a5, a6))
  {
    -[SKProgress userInfo](self, "userInfo");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProgress setLocalizedAdditionalDescription:](self, "setLocalizedAdditionalDescription:", v8);
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __21__SKProgress_dealloc__block_invoke;
  v5[3] = &unk_18A3230E8;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKProgress;
  -[SKProgress dealloc](&v4, sel_dealloc);
}

void __21__SKProgress_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:*MEMORY[0x189607BB8]];
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
}

@end