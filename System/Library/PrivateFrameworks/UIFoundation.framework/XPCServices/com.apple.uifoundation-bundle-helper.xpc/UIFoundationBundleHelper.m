@interface UIFoundationBundleHelper
+ (id)XPCInterface;
+ (id)bundleHelper;
- (void)__localizedInfoDictionaryObjectForKeys:(id)a3 withPlugInUUID:(id)a4 completion:(id)a5;
- (void)__queryPhotoServiceAuthorizationStatusForPlugInUUID:(id)a3 completion:(id)a4;
@end

@implementation UIFoundationBundleHelper

+ (id)bundleHelper
{
  if (qword_100008970 != -1) {
    dispatch_once(&qword_100008970, &stru_1000041A8);
  }
  return (id)qword_100008978;
}

+ (id)XPCInterface
{
  if (qword_100008980 != -1) {
    dispatch_once(&qword_100008980, &stru_1000041C8);
  }
  return (id)qword_100008988;
}

- (void)__localizedInfoDictionaryObjectForKeys:(id)a3 withPlugInUUID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v35 = 0LL;
  id v11 = [[LSApplicationExtensionRecord alloc] initWithUUID:v8 error:&v35];
  id v12 = v35;
  if (!v11)
  {
    id v29 = 0LL;
    v30 = v9;

    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to resolve plugin for UUID %@",  v14));
    id v37 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -2LL,  v22));
LABEL_17:

    v10 = 0LL;
    id v12 = (id)v23;
LABEL_18:
    id v11 = v29;
    v9 = v30;
    goto LABEL_19;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v13));

  if (!v14)
  {
    id v29 = v11;
    v30 = v9;

    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    id v15 = (id)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to resolve plugin for UUID %@",  v15));
    v39 = v22;
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -1LL,  v24));

    id v12 = (id)v24;
    goto LABEL_17;
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    id v29 = v11;
    v30 = v9;
    id v28 = v7;
    uint64_t v18 = *(void *)v32;
    while (2)
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForInfoDictionaryKey:v20]);
        v22 = v21;
        if (v21)
        {
          if (![v21 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding])
          {

            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            uint64_t v25 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value of info dictionary key %@ for plugin with UUID %@ does not conform to secure coding!",  v20,  v25));
            v41 = v26;
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
            uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -1LL,  v27));

            id v12 = (id)v25;
            id v7 = v28;
            goto LABEL_17;
          }

          [v10 setObject:v22 forKey:v20];
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v17) {
        continue;
      }
      break;
    }

    id v7 = v28;
    goto LABEL_18;
  }

- (void)__queryPhotoServiceAuthorizationStatusForPlugInUUID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[LSApplicationExtensionRecord alloc] initWithUUID:v5 error:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containingBundleRecord]);
  if (v8
    && (Default = CFAllocatorGetDefault(), (CFBundleRef v10 = CFBundleCreate(Default, (CFURLRef)[v8 URL])) != 0))
  {
    CFBundleRef v11 = v10;
    id v12 = (void *)TCCAccessCopyInformationForBundle();
    CFRelease(v11);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100003200;
    v16[3] = &unk_1000041F0;
    v16[4] = &v17;
    [v12 enumerateObjectsUsingBlock:v16];
    (*((void (**)(id, void, void))v6 + 2))(v6, *((unsigned __int8 *)v18 + 24), 0LL);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to resolve plugin for UUID %@",  v13));
    v22 = v14;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -1LL,  v12));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v15);
  }
}

@end