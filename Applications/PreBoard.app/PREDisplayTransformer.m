@interface PREDisplayTransformer
- (id)_transformDisplayConfiguration:(id)a3;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation PREDisplayTransformer

- (id)transformDisplayConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 isMainRootDisplay])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PREDisplayTransformer _transformDisplayConfiguration:](self, "_transformDisplayConfiguration:", v4));

    id v4 = (id)v5;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));

  return v6;
}

- (id)_transformDisplayConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [[FBSDisplayConfigurationBuilder alloc] initWithConfiguration:v3];
  id v5 = [v3 pixelSize];
  double v7 = v6;
  double v9 = v8;
  uint64_t IsZero = BSFloatIsZero(v5);
  if ((IsZero & 1) != 0 || BSFloatIsZero(IsZero))
  {
    double v7 = 1920.0;
    double v9 = 1080.0;
  }

  objc_msgSend( v4,  "setPixelSize:nativeBounds:bounds:",  v7,  v9,  0.0,  0.0,  1920.0,  1080.0,  0,  0,  0x409E000000000000,  0x4090E00000000000);
  id v15 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 buildConfigurationWithError:&v15]);
  id v12 = v15;
  if (v11)
  {
    id v13 = v11;

    id v3 = v13;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000069D8((uint64_t)v12);
  }

  return v3;
}

@end