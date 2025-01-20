@interface DownloadDRM
- (DownloadDRM)init;
@end

@implementation DownloadDRM

- (DownloadDRM)init
{
  v2 = self;
  if (self)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___DownloadDRM;
    v2 = -[DownloadDRM init](&v15, "init");
    if (v2)
    {
      v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v4 = [0 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v12;
        do
        {
          v7 = 0LL;
          do
          {
            if (*(void *)v12 != v6) {
              objc_enumerationMutation(0LL);
            }
            v8 = sub_100322838( objc_alloc(&OBJC_CLASS___DownloadSinf),  *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7));
            if (v8) {
              -[NSMutableArray addObject:](v3, "addObject:", v8);
            }

            v7 = (char *)v7 + 1;
          }

          while (v5 != v7);
          id v5 = [0 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }

        while (v5);
      }

      sinfs = v2->_sinfs;
      v2->_sinfs = &v3->super;
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end