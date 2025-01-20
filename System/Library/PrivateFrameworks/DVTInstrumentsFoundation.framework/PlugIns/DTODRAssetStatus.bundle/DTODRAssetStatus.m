void sub_F58(id a1)
{
  uint64_t v1;
  void *v2;
  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_4900));
  v2 = (void *)qword_8918;
  qword_8918 = v1;
}

id sub_1688()
{
  v0 = (void *)qword_8910;
  if (!qword_8910)
  {
    v1 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.ondemandd.devtools",  4096LL);
    v2 = (void *)qword_8910;
    qword_8910 = (uint64_t)v1;

    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ODRDeveloperToolsProtocol_New));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNull);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v3 setClasses:v11 forSelector:"tagStatusForBundle:replyBlock:" argumentIndex:0 ofReply:1];

    [(id)qword_8910 setRemoteObjectInterface:v3];
    [(id)qword_8910 resume];
    v0 = (void *)qword_8910;
  }

  return v0;
}

void sub_17EC(id a1, NSError *a2)
{
}

void sub_1800(id a1)
{
  v1 = (void *)qword_8910;
  qword_8910 = 0LL;
}

uint64_t sub_1810(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1820(uint64_t a1)
{
}

void sub_1828(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_18C8;
  v6[3] = &unk_42C0;
  id v7 = v2;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  __int128 v8 = v5;
  [v3 tagStatusForBundle:v7 replyBlock:v6];
}

void sub_18C8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "mutableCopy", (void)v14);
          [v13 setObject:a1[4] forKeyedSubscript:@"ODRTag_BundleIDKey"];
          [v7 addObject:v13];

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v10);
    }

    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v7 forKeyedSubscript:@"process.resources[]"];
  }

  (*(void (**)(void))(a1[5] + 16LL))();
}

void sub_1C98(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  id v5 = @"Resource status collection timeout.";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dtmobileis.resources",  -2LL,  v2));
  [v1 invokeCompletionWithReturnValue:0 error:v3];
}

void sub_1D68(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  [v5 setObject:a2 forKeyedSubscript:v6];
  [*(id *)(a1 + 48) invokeCompletionWithReturnValue:*(void *)(a1 + 32) error:v7];
}

void sub_1FF0(id a1, NSError *a2)
{
}

void sub_2004(id a1)
{
  v1 = (void *)qword_8910;
  qword_8910 = 0LL;
}

uint64_t sub_2014(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_2020(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_216C(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Resource purge for BundleID '%@' timedout.",  *(void *)(a1 + 40),  NSLocalizedDescriptionKey));
  uint64_t v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  NSErrorUserInfoKey v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dtmobileis.assetcontrol",  -3LL,  v3));
  [v1 invokeCompletionWithReturnValue:0 error:v4];
}

id sub_225C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeCompletionWithReturnValue:a2 error:a2];
}

void sub_23C8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Resource purge for AssetID '%@' timedout.",  *(void *)(a1 + 40),  NSLocalizedDescriptionKey));
  uint64_t v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  NSErrorUserInfoKey v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dtmobileis.assetcontrol",  -4LL,  v3));
  [v1 invokeCompletionWithReturnValue:0 error:v4];
}

id sub_24B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeCompletionWithReturnValue:a2 error:a2];
}

void sub_2608(id a1, NSError *a2)
{
}

void sub_261C(id a1)
{
  v1 = (void *)qword_8910;
  qword_8910 = 0LL;
}

void sub_262C(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  uint64_t v5 = @"Resource: Get bandwidth value timedout.";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dtmobileis.resources",  -2LL,  v2));
  [v1 invokeCompletionWithReturnValue:0 error:v3];
}

void sub_26FC(uint64_t a1, uint64_t a2, void *a3)
{
  NSErrorUserInfoKey v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  [v4 invokeCompletionWithReturnValue:v6 error:v5];
}

void sub_28D8(id a1, NSError *a2)
{
}

void sub_28EC(id a1)
{
  v1 = (void *)qword_8910;
  qword_8910 = 0LL;
}

void sub_28FC(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Resource: Set bandwidth to '%@' timedout.",  *(void *)(a1 + 40),  NSLocalizedDescriptionKey));
  id v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  NSErrorUserInfoKey v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dtmobileis.resources",  -2LL,  v3));
  [v1 invokeCompletionWithReturnValue:0 error:v4];
}

void sub_29EC(uint64_t a1, uint64_t a2, void *a3)
{
  NSErrorUserInfoKey v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  [v4 invokeCompletionWithReturnValue:v6 error:v5];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}