@interface DialogManager
+ (BOOL)checkInDialog:(id)a3;
+ (void)checkOutDialog:(id)a3;
@end

@implementation DialogManager

+ (BOOL)checkInDialog:(id)a3
{
  v4 = (NSMutableArray *)qword_1003A31D0;
  if (!qword_1003A31D0)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    qword_1003A31D0 = (uint64_t)v4;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) isEqual:a3])
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(id)qword_1003A31D0 addObject:a3];
  BOOL v9 = 1;
LABEL_13:
  pthread_mutex_unlock(&stru_1003A2068);
  return v9;
}

+ (void)checkOutDialog:(id)a3
{
}

@end