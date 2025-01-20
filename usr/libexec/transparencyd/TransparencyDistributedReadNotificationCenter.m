@interface TransparencyDistributedReadNotificationCenter
+ (id)defaultCenter;
- (NSDistributedNotificationCenter)nsDNC;
- (NSMutableSet)cachedNotification;
- (NSNotificationCenter)localNC;
- (TransparencyDistributedReadNotificationCenter)init;
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5;
- (void)notificationProxyMethod:(id)a3;
- (void)removeObserver:(id)a3 name:(id)a4;
- (void)setCachedNotification:(id)a3;
- (void)setLocalNC:(id)a3;
- (void)setNsDNC:(id)a3;
@end

@implementation TransparencyDistributedReadNotificationCenter

+ (id)defaultCenter
{
  id v3 = (id)qword_1002EED80;
  if (!v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EED88);
    id v4 = objc_alloc_init((Class)a1);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1002EED88);
    if (qword_1002EED80)
    {
      id v3 = (id)qword_1002EED80;
    }

    else
    {
      id v3 = v4;
      id v4 = (id)qword_1002EED80;
      qword_1002EED80 = (uint64_t)v3;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EED88);
  return v3;
}

- (TransparencyDistributedReadNotificationCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TransparencyDistributedReadNotificationCenter;
  v2 = -[TransparencyDistributedReadNotificationCenter init](&v8, "init");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    -[TransparencyDistributedReadNotificationCenter setNsDNC:](v2, "setNsDNC:", v3);

    id v4 = objc_alloc_init(&OBJC_CLASS___NSNotificationCenter);
    -[TransparencyDistributedReadNotificationCenter setLocalNC:](v2, "setLocalNC:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[TransparencyDistributedReadNotificationCenter setCachedNotification:](v2, "setCachedNotification:", v5);

    v6 = v2;
  }

  return v2;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v15 = v8;
    id v9 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1002EED88);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter cachedNotification](self, "cachedNotification"));
    unsigned __int8 v11 = [v10 containsObject:v15];

    if ((v11 & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EED88);
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter cachedNotification](self, "cachedNotification"));
      [v12 addObject:v15];

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EED88);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter nsDNC](self, "nsDNC"));
      [v13 addObserver:self selector:"notificationProxyMethod:" name:v15 object:0];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter localNC](self, "localNC"));
    [v14 addObserver:v9 selector:a4 name:v15 object:0];

    id v8 = v15;
  }
}

- (void)notificationProxyMethod:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter localNC](self, "localNC"));
  [v5 postNotification:v4];
}

- (void)removeObserver:(id)a3 name:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter localNC](self, "localNC"));
    [v8 removeObserver:v7 name:v6 object:0];
  }

- (NSDistributedNotificationCenter)nsDNC
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setNsDNC:(id)a3
{
}

- (NSNotificationCenter)localNC
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLocalNC:(id)a3
{
}

- (NSMutableSet)cachedNotification
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCachedNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end