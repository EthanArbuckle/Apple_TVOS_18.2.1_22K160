@interface CLActivityRecorderUtils
+ (id)getDbDetails:(void *)a3;
@end

@implementation CLActivityRecorderUtils

+ (id)getDbDetails:(void *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  sub_100D8B408((uint64_t)a3, (uint64_t)__p);
  if (v13 >= 0) {
    v5 = __p;
  }
  else {
    v5 = (void **)__p[0];
  }
  v6 = -[NSString initWithUTF8String:](v4, "initWithUTF8String:", v5);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  v7 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
  v8 = objc_alloc(&OBJC_CLASS___NSString);
  (*(void (**)(void **__return_ptr, void *))(*(void *)a3 + 32LL))(__p, a3);
  if (v13 >= 0) {
    v9 = __p;
  }
  else {
    v9 = (void **)__p[0];
  }
  v10 = -[NSString initWithUTF8String:](v8, "initWithUTF8String:", v9);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  v14[0] = @"url";
  v14[1] = @"name";
  v15[0] = v7;
  v15[1] = v10;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL);
}

@end