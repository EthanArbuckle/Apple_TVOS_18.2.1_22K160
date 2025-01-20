@interface LACPasscodeFormatter
+ (id)sharedInstance;
- (LACPasscodeFormatter)init;
- (id)localizePasscode:(id)a3 type:(int64_t)a4;
@end

@implementation LACPasscodeFormatter

- (LACPasscodeFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACPasscodeFormatter;
  v2 = -[LACPasscodeFormatter init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = __28__LACPasscodeFormatter_init__block_invoke();
    formatter = v2->_formatter;
    v2->_formatter = (NSNumberFormatter *)v3;
  }

  return v2;
}

id __28__LACPasscodeFormatter_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607978]);
  [MEMORY[0x189603F90] localeWithLocaleIdentifier:@"en"];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setLocale:v1];

  return v0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  }
  return (id)sharedInstance_sharedInstance_3;
}

void __38__LACPasscodeFormatter_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___LACPasscodeFormatter);
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;
}

- (id)localizePasscode:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 3)
  {
    id v8 = v6;
  }

  else
  {
    id v9 = objc_alloc_init(MEMORY[0x189607940]);
    if ([v7 length])
    {
      uint64_t v10 = 0LL;
      while (1)
      {
        __int16 v15 = [v7 characterAtIndex:v10];
        [NSString stringWithCharacters:&v15 length:1];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSNumberFormatter numberFromString:](self->_formatter, "numberFromString:", v11);
        if (!v12) {
          break;
        }
        v13 = v12;
        objc_msgSend(v9, "appendFormat:", @"%d", objc_msgSend(v12, "intValue"));
      }

      id v8 = 0LL;
    }

    else
    {
LABEL_7:
      id v8 = v9;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end