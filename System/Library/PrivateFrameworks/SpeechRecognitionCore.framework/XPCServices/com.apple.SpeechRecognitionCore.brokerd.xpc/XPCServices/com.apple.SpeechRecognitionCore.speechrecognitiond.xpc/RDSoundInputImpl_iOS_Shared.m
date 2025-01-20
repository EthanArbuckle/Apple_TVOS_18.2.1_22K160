@interface RDSoundInputImpl_iOS_Shared
+ (BOOL)isCarPlayActive;
+ (BOOL)isSystemSleeping;
@end

@implementation RDSoundInputImpl_iOS_Shared

+ (BOOL)isCarPlayActive
{
  return 0;
}

+ (BOOL)isSystemSleeping
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  v10 = sub_10000AC78;
  v11 = sub_10000AC88;
  v3 = (void *)qword_1000DDCC8;
  uint64_t v12 = qword_1000DDCC8;
  if (!qword_1000DDCC8)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000AC94;
    v6[3] = &unk_1000CE018;
    v6[4] = &v7;
    sub_10000AC94((uint64_t)v6);
    v3 = (void *)v8[5];
  }

  _Block_object_dispose(&v7, 8);
  unsigned int v4 = objc_msgSend(objc_msgSend(v3, "server"), "isSystemSleeping");
  if (v4) {
    LOBYTE(v4) = [a1 isCarPlayActive] ^ 1;
  }
  return v4;
}

@end