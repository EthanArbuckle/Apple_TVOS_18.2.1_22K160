@interface _LSAppToUnregister
- (void)initWithContext:(uint64_t)a3 bundleUnit:(uint64_t)a4 bundleData:;
@end

@implementation _LSAppToUnregister

- (void)initWithContext:(uint64_t)a3 bundleUnit:(uint64_t)a4 bundleData:
{
  if (!a1) {
    return 0LL;
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_CLASS____LSAppToUnregister;
  v7 = objc_msgSendSuper2(&v13, sel_init);
  if (v7)
  {
    uint64_t v8 = +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  a3,  a2);
    v9 = (void *)v7[1];
    v7[1] = v8;

    uint64_t v10 = _CSStringCopyCFString();
    v11 = (void *)v7[2];
    v7[2] = v10;

    *((_BYTE *)v7 + 24) = (*(_DWORD *)(a4 + 164) & 0x40000) != 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end