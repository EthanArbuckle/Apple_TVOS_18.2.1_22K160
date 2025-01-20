@interface NSArray
+ (NSArray)arrayWithXPCArray:(id)a3;
- (NSArray)initWithXPCArray:(id)a3;
- (id)xpcArrayFromArray;
@end

@implementation NSArray

+ (NSArray)arrayWithXPCArray:(id)a3
{
  id v3 = a3;
  v4 = -[NSArray initWithXPCArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithXPCArray:", v3);

  return v4;
}

- (NSArray)initWithXPCArray:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  v17[0] = &v16;
  v17[1] = 0x3032000000LL;
  v17[2] = sub_100004680;
  v17[3] = sub_100004690;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100004698;
  v13 = &unk_1000F9228;
  v15 = &v16;
  v5 = self;
  v14 = v5;
  if (xpc_array_apply(v4, &v10))
  {
    id v6 = sub_10003A95C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10008FE78((uint64_t)v17, v7);
    }

    v5 = -[NSArray initWithArray:](v5, "initWithArray:", *(void *)(v17[0] + 40LL), v10, v11, v12, v13);
    v8 = v5;
  }

  else
  {
    v8 = 0LL;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)xpcArrayFromArray
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004A30;
  v6[3] = &unk_1000F9250;
  xpc_object_t v3 = xpc_array_create(0LL, 0LL);
  id v7 = v3;
  v8 = &v9;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  if (*((_BYTE *)v10 + 24)) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  _Block_object_dispose(&v9, 8);
  return v4;
}

@end