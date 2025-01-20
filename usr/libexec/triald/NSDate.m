@interface NSDate
+ (void)load;
- (id)tri_memoryFriendlyDescriptionWithLocale:(id)a3;
@end

@implementation NSDate

+ (void)load
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000323C;
  v2[3] = &unk_100004118;
  v2[4] = a1;
  v2[5] = a2;
  if (qword_100008078 != -1) {
    dispatch_once(&qword_100008078, v2);
  }
}

- (id)tri_memoryFriendlyDescriptionWithLocale:(id)a3
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000034B4;
  v17[3] = &unk_100004140;
  v17[4] = self;
  id v5 = a3;
  id v18 = v5;
  SEL v19 = a2;
  v6 = objc_retainBlock(v17);
  if (v5) {
    goto LABEL_2;
  }
  -[NSDate timeIntervalSince1970](self, "timeIntervalSince1970");
  time_t v16 = (uint64_t)v10;
  memset(&v15, 0, sizeof(v15));
  if (!gmtime_r(&v16, &v15)) {
    goto LABEL_2;
  }
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  *(_OWORD *)v20 = 0u;
  __int128 v21 = 0u;
  if (strftime(v20, 0x100uLL, "%Y-%m-%d %H:%M:%S +0000", &v15))
  {
    v11 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v20);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }

    else
    {
      uint64_t v14 = ((uint64_t (*)(void *))v6[2])(v6);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
    }

    v8 = v13;
  }

  else
  {
LABEL_2:
    uint64_t v7 = ((uint64_t (*)(void *))v6[2])(v6);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v8;
}

@end