@interface NSHTTPCookieInternal_Data
- (HTTPCookie)_inner;
- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4;
- (void)dealloc;
@end

@implementation NSHTTPCookieInternal_Data

- (void)dealloc
{
  fromData = self->_fromData;
  if (fromData)
  {
    (*((void (**)(CompactHTTPCookieWithData *, SEL))fromData->var0 + 1))(fromData, a2);
    self->_fromData = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSHTTPCookieInternal_Data;
  -[NSHTTPCookieInternal_Data dealloc](&v4, sel_dealloc);
}

- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4
{
  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___NSHTTPCookieInternal_Data;
    v6 = -[NSHTTPCookieInternal init](&v15, sel_init);
    if (v6)
    {
      v7 = (void *)[a3 mutableCopy];
      if (!a4 && [a3 objectForKey:0x18C5AE780]) {
        [v7 setObject:0 forKeyedSubscript:0x18C5AE780];
      }
      uint64_t v8 = [a3 objectForKeyedSubscript:@"Domain"];
      if (v8)
      {
        v9 = (void *)v8;
        objc_opt_class();
        else {
          uint64_t v10 = MEMORY[0x189604A88];
        }
        [v7 setObject:v10 forKeyedSubscript:0x18C5AE780];
      }

      id v11 = v7;
      if (v11) {
        id v12 = v11;
      }
      else {
        id v12 = a3;
      }
      v13 = (CompactHTTPCookieWithData *)operator new(0x10uLL);
      v13->var0 = (void **)off_189C12850;
      __int128 v35 = 0u;
      memset(v36, 0, sizeof(v36));
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v32 = 0u;
      __int128 v31 = 0u;
      __int128 v30 = 0u;
      __int128 v29 = 0u;
      __int128 v28 = 0u;
      __int128 v27 = 0u;
      __int128 v26 = 0u;
      __int128 v25 = 0u;
      __int128 v24 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v17 = 0u;
      v16 = off_189C128F8;
      id v37 = v12;
      uint64_t v38 = 0LL;
      v13->var1 = (char *)Decanter::decant((Decanter *)&v16, (CFAllocatorRef)*MEMORY[0x189604DB0]);
      CompactHTTPCookieWithData::CompactHTTPCookieWithData(__CFDictionary const*)::PropDecanter::~PropDecanter(&v16);
      v6->_fromData = v13;
    }
  }

  else
  {

    return 0LL;
  }

  return v6;
}

- (HTTPCookie)_inner
{
  return (HTTPCookie *)self->_fromData;
}

@end