@interface NSRunLoop(NSOrderedPerforming)
- (uint64_t)cancelPerformSelector:()NSOrderedPerforming target:argument:;
- (uint64_t)cancelPerformSelectorsWithTarget:()NSOrderedPerforming;
- (uint64_t)performSelector:()NSOrderedPerforming target:argument:order:modes:;
@end

@implementation NSRunLoop(NSOrderedPerforming)

- (uint64_t)performSelector:()NSOrderedPerforming target:argument:order:modes:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t result = [a1 getCFRunLoop];
  if (result)
  {
    v13 = (__CFRunLoop *)result;
    *(_OWORD *)&context.version = xmmword_189CA0978;
    *(_OWORD *)&context.retain = *(_OWORD *)algn_189CA0988;
    context.copyDescription = 0LL;
    uint64_t result = [a7 count];
    if (result)
    {
      objc_sync_enter(a1);
      v14 = malloc_default_zone();
      v15 = malloc_zone_calloc(v14, 1uLL, 0x30uLL);
      context.info = v15;
      void *v15 = a4;
      v15[1] = a3;
      v15[2] = a5;
      v15[3] = [a7 copyWithZone:0];
      v15[5] = a1;
      if (a6 >= 0x7FFFFFFFFFFFFFFFLL) {
        CFIndex v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        CFIndex v16 = a6;
      }
      v17 = CFRunLoopObserverCreate(0LL, 2uLL, 0, v16, (CFRunLoopObserverCallBack)__NSFirePerformWithOrder, &context);
      v15[4] = v17;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v26 = a7;
      uint64_t v18 = [a7 countByEnumeratingWithState:&v29 objects:v28 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v30;
        v20 = (__CFString *)*MEMORY[0x1896051B0];
        v21 = (__CFString *)*MEMORY[0x189603B48];
        v22 = (__CFString *)*MEMORY[0x1896051A8];
        do
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v26);
            }
            v24 = *(__CFString **)(*((void *)&v29 + 1) + 8 * i);
            CFRunLoopAddObserver(v13, v17, v24);
          }

          uint64_t v18 = [v26 countByEnumeratingWithState:&v29 objects:v28 count:16];
        }

        while (v18);
      }

      CFArrayAppendValue((CFMutableArrayRef)[a1 _perft], v17);
      CFRelease(v17);
      return objc_sync_exit(a1);
    }
  }

  return result;
}

- (uint64_t)cancelPerformSelector:()NSOrderedPerforming target:argument:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t result = [a1 getCFRunLoop];
  if (result)
  {
    v10 = (__CFRunLoop *)result;
    objc_sync_enter(a1);
    id obj = a1;
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a1, "_perft"), "count");
    if (v11)
    {
      v12 = (const __CFString *)*MEMORY[0x189603B48];
      v13 = (const __CFString *)*MEMORY[0x1896051A8];
      uint64_t v25 = a4;
      uint64_t v26 = a5;
      uint64_t v24 = a3;
      do
      {
        ValueAtIndex = (__CFRunLoopObserver *)CFArrayGetValueAtIndex( (CFArrayRef)objc_msgSend(obj, "_perft", v24, v25, v26),  --v11);
        context.version = 0LL;
        CFRunLoopObserverGetContext(ValueAtIndex, &context);
        info = context.info;
        if (*((void *)context.info + 1) == a3)
        {
          if ([*(id *)context.info isEqual:a4])
          {
            unint64_t v16 = info[2];
            if (!(a5 | v16) || [(id)v16 isEqual:a5])
            {
              CFRetain(ValueAtIndex);
              uint64_t v27 = v11;
              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v31 = 0u;
              __int128 v32 = 0u;
              v17 = (void *)info[3];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v30 count:16];
              if (v18)
              {
                uint64_t v19 = *(void *)v32;
                do
                {
                  for (uint64_t i = 0LL; i != v18; ++i)
                  {
                    if (*(void *)v32 != v19) {
                      objc_enumerationMutation(v17);
                    }
                    v21 = *(const __CFString **)(*((void *)&v31 + 1) + 8 * i);
                    v22 = v13;
                    if (v21 != v12)
                    {
                      int v23 = [*(id *)(*((void *)&v31 + 1) + 8 * i) isEqual:@"kCFRunLoopCommonModes"];
                      v22 = v21;
                      if (v23) {
                        v22 = v13;
                      }
                    }

                    CFRunLoopRemoveObserver(v10, ValueAtIndex, v22);
                  }

                  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v30 count:16];
                }

                while (v18);
              }

              CFRunLoopObserverInvalidate(ValueAtIndex);
              a4 = v25;
              a5 = v26;
              a3 = v24;
              uint64_t v11 = v27;
              CFRelease(ValueAtIndex);
              objc_msgSend((id)objc_msgSend(obj, "_perft"), "removeObjectAtIndex:", v27);
            }
          }
        }
      }

      while (v11);
    }

    return objc_sync_exit(obj);
  }

  return result;
}

- (uint64_t)cancelPerformSelectorsWithTarget:()NSOrderedPerforming
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t result = [a1 getCFRunLoop];
  if (result)
  {
    v6 = (__CFRunLoop *)result;
    objc_sync_enter(a1);
    id obj = a1;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a1, "_perft"), "count");
    if (v7)
    {
      v8 = (const __CFString *)*MEMORY[0x189603B48];
      v9 = (const __CFString *)*MEMORY[0x1896051A8];
      uint64_t v19 = a3;
      do
      {
        ValueAtIndex = (__CFRunLoopObserver *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(obj, "_perft", v19), --v7);
        context.version = 0LL;
        CFRunLoopObserverGetContext(ValueAtIndex, &context);
        info = context.info;
        if (*(void *)context.info == a3 || [*(id *)context.info isEqual:a3])
        {
          CFRetain(ValueAtIndex);
          uint64_t v20 = v7;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          v12 = (void *)info[3];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v23 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t i = 0LL; i != v13; ++i)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v12);
                }
                unint64_t v16 = *(const __CFString **)(*((void *)&v24 + 1) + 8 * i);
                v17 = v9;
                if (v16 != v8)
                {
                  int v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) isEqual:@"kCFRunLoopCommonModes"];
                  v17 = v16;
                  if (v18) {
                    v17 = v9;
                  }
                }

                CFRunLoopRemoveObserver(v6, ValueAtIndex, v17);
              }

              uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v23 count:16];
            }

            while (v13);
          }

          CFRunLoopObserverInvalidate(ValueAtIndex);
          a3 = v19;
          uint64_t v7 = v20;
          CFRelease(ValueAtIndex);
          objc_msgSend((id)objc_msgSend(obj, "_perft"), "removeObjectAtIndex:", v20);
        }
      }

      while (v7);
    }

    return objc_sync_exit(obj);
  }

  return result;
}

@end