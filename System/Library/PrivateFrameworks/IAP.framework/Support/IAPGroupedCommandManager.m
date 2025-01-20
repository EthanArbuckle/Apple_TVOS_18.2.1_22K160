@interface IAPGroupedCommandManager
+ (id)sharedManager;
- (BOOL)isGrouping:(void *)a3;
- (void)applyAndCancelGrouping:(void *)a3;
- (void)cancelGrouping:(void *)a3;
- (void)dealloc;
- (void)lineOutEnabled:(BOOL)a3 onTransport:(void *)a4;
- (void)startGrouping:(void *)a3;
- (void)videoOutSettingsChanged:(void *)a3;
@end

@implementation IAPGroupedCommandManager

+ (id)sharedManager
{
  id result = (id)qword_10011BAC0;
  if (!qword_10011BAC0)
  {
    id result = objc_alloc_init(&OBJC_CLASS___IAPGroupedCommandManager);
    qword_10011BAC0 = (uint64_t)result;
  }

  return result;
}

- (void)dealloc
{
  if ((((_BYTE)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {

    self->_iapGroupedCommands = 0LL;
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___IAPGroupedCommandManager;
    -[IAPGroupedCommandManager dealloc](&v3, "dealloc");
  }

- (void)startGrouping:(void *)a3
{
  if (a3)
  {
    v5 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a3);
    p_iapGroupedCommands = (id *)&self->_iapGroupedCommands;
    if ((p_iapGroupedCommands & 7) != 0)
    {
      __break(0x5516u);
    }

    else
    {
      v8 = v5;
      if ([*p_iapGroupedCommands objectForKey:v5])
      {
        NSLog( @"ERROR - %s:%s - %d grouping already enabled for %hhx",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPGroupedCommandManager.mm",  "-[IAPGroupedCommandManager startGrouping:]",  75LL,  a3);
      }

      else
      {
        if (!*p_iapGroupedCommands) {
          id *p_iapGroupedCommands = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }
        v7 = objc_alloc_init(&OBJC_CLASS___IAPGroupedCommands);
        [*p_iapGroupedCommands setObject:v7 forKey:v8];
      }
    }
  }

- (void)applyAndCancelGrouping:(void *)a3
{
  if (a3)
  {
    v9 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a3);
    p_iapGroupedCommands = &self->_iapGroupedCommands;
    if (((unint64_t)&self->_iapGroupedCommands & 7) == 0)
    {
      id v6 = -[NSMutableDictionary objectForKey:](*p_iapGroupedCommands, "objectForKey:", v9);
      if (!v6)
      {
        NSLog( @"ERROR - %s:%s - %d grouping not enabled for %hhx",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPGroupedCommandManager.mm",  "-[IAPGroupedCommandManager applyAndCancelGrouping:]",  110LL,  a3);
LABEL_15:

        return;
      }

      v7 = v6;
      [v6 setCancelled:1];
      uint64_t v8 = sub_100042AC4();
      if (v8 && (v8 & 7) == 0)
      {
        (*(void (**)(uint64_t, void *, id))(*(void *)v8 + 176))( v8,  a3,  [v7 lineOutEnabled]);
        [v7 setLineOutChanged:0];
LABEL_8:
        if ((sub_10004783C() & 7) == 0)
        {
          sub_100049534((uint64_t)a3);
          [v7 setVideoOutSettingChanged:0];
LABEL_11:
          -[NSMutableDictionary removeObjectForKey:](*p_iapGroupedCommands, "removeObjectForKey:", v9);
          if (!-[NSMutableDictionary count](*p_iapGroupedCommands, "count"))
          {

            id *p_iapGroupedCommands = 0LL;
          }

          goto LABEL_15;
        }
      }
    }

    __break(0x5516u);
  }

- (void)cancelGrouping:(void *)a3
{
  if (a3)
  {
    v5 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a3);
    p_iapGroupedCommands = &self->_iapGroupedCommands;
    if ((p_iapGroupedCommands & 7) != 0)
    {
      __break(0x5516u);
    }

    else
    {
      v7 = v5;
      if (-[NSMutableDictionary objectForKey:](*p_iapGroupedCommands, "objectForKey:", v5))
      {
        -[NSMutableDictionary removeObjectForKey:](*p_iapGroupedCommands, "removeObjectForKey:", v7);
        if (!-[NSMutableDictionary count](*p_iapGroupedCommands, "count"))
        {

          id *p_iapGroupedCommands = 0LL;
        }
      }

      else
      {
        NSLog( @"ERROR - %s:%s - %d grouping not enabled for %hhx",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPGroupedCommandManager.mm",  "-[IAPGroupedCommandManager cancelGrouping:]",  132LL,  a3);
      }
    }
  }

- (void)videoOutSettingsChanged:(void *)a3
{
  v5 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a3);
  if (((unint64_t)&self->_iapGroupedCommands & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    v7 = v5;
    id v6 = -[NSMutableDictionary objectForKey:](self->_iapGroupedCommands, "objectForKey:", v5);
    if (v6) {
      [v6 setVideoOutSettingChanged:1];
    }
    else {
      NSLog( @"ERROR - %s:%s - %d grouping not enabled for %hhx",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPGroupedCommandManager.mm",  "-[IAPGroupedCommandManager videoOutSettingsChanged:]",  147LL,  a3);
    }
  }

- (void)lineOutEnabled:(BOOL)a3 onTransport:(void *)a4
{
  BOOL v5 = a3;
  v7 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a4);
  if (((unint64_t)&self->_iapGroupedCommands & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    v10 = v7;
    id v8 = -[NSMutableDictionary objectForKey:](self->_iapGroupedCommands, "objectForKey:", v7);
    if (v8)
    {
      v9 = v8;
      [v8 setLineOutChanged:1];
      [v9 setLineOutEnabled:v5];
    }

    else
    {
      NSLog( @"ERROR - %s:%s - %d grouping not enabled for %hhx",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPGroupedCommandManager.mm",  "-[IAPGroupedCommandManager lineOutEnabled:onTransport:]",  162LL,  a4);
    }
  }

- (BOOL)isGrouping:(void *)a3
{
  v4 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a3);
  if (((unint64_t)&self->_iapGroupedCommands & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    BOOL v5 = v4;
    id v6 = -[NSMutableDictionary objectForKey:](self->_iapGroupedCommands, "objectForKey:", v4);
    if (v6) {
      unsigned int v7 = [v6 cancelled] ^ 1;
    }
    else {
      LOBYTE(v7) = 0;
    }

    LOBYTE(v4) = v7;
  }

  return (char)v4;
}

@end