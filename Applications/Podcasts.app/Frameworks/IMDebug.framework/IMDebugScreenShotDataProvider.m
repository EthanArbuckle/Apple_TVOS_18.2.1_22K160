@interface IMDebugScreenShotDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugScreenShotDataProvider

- (id)debugDataFileName
{
  return @"ScreenShot.png";
}

- (id)debugData
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __42__IMDebugScreenShotDataProvider_debugData__block_invoke;
  block[3] = &unk_C568;
  block[4] = &v5;
  dispatch_sync(&_dispatch_main_q, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__IMDebugScreenShotDataProvider_debugData__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI debugViewController](&OBJC_CLASS___DebugUI, "debugViewController"));
  image = (UIImage *)objc_claimAutoreleasedReturnValue([v2 screenShotImage]);

  v3 = UIImagePNGRepresentation(image);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end