@interface _TVSMModuleInfo
+ (id)_defaultModuleDirectories;
+ (id)allModuleInfos;
- (NSDictionary)infoPlist;
- (NSURL)bundleURL;
- (id)_initWithURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
@end

@implementation _TVSMModuleInfo

+ (id)allModuleInfos
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_100025028;
  v7 = &unk_100049828;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_100056CF0;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100056CE8;
}

- (id)_initWithURL:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0LL;
  v10.receiver = v3;
  v10.super_class = (Class)&OBJC_CLASS____TVSMModuleInfo;
  id v8 = -[_TVSMModuleInfo init](&v10, "init");
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    CFDictionaryRef v13 = CFBundleCopyInfoDictionaryInDirectory((CFURLRef)location[0]);
    SEL v9 = v13;
    objc_storeStrong((id *)&v12->_bundleURL, location[0]);
    objc_storeStrong((id *)&v12->_infoPlist, v9);
    id v7 = -[__CFDictionary objectForKey:](v9, "objectForKey:", @"TVSMModuleType");
    id v4 = [v7 integerValue];
    v12->_type = (int64_t)v4;

    objc_storeStrong((id *)&v9, 0LL);
  }

  v6 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

+ (id)_defaultModuleDirectories
{
  id v4 = (dispatch_once_t *)&unk_100056D00;
  id location = 0LL;
  objc_storeStrong(&location, &stru_100049848);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100056CF8;
}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end