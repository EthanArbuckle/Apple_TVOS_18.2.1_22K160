@interface FBSDisplayMonitor
- (FBSDisplayConfiguration)displayConfiguration;
- (id)pb_transformToAppJailConfigurationIfNeeded:(id)a3;
@end

@implementation FBSDisplayMonitor

- (id)pb_transformToAppJailConfigurationIfNeeded:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayBoundsManager sharedInstance](&OBJC_CLASS___PBDisplayBoundsManager, "sharedInstance"));
  v5 = v4;
  if (v4)
  {
    [v4 currentDisplayBounds];
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    memset(&v19[1], 0, 32);
  }

  [v3 bounds];
  v22.origin.x = v6;
  v22.origin.y = v7;
  v22.size.width = v8;
  v22.size.height = v9;
  if (CGRectEqualToRect(*(CGRect *)&v19[1], v22))
  {
    id v10 = sub_1000F6844();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10027FC7C(v11);
    }

    id v12 = v3;
  }

  else
  {
    id v13 = [[FBSDisplayConfigurationBuilder alloc] initWithConfiguration:v3];
    [v3 pixelSize];
    objc_msgSend(v13, "setPixelSize:nativeBounds:bounds:", *(_OWORD *)&v19[1], *(_OWORD *)&v19[3]);
    v19[0] = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 buildConfigurationWithError:v19]);
    id v15 = v19[0];
    if (v15)
    {
      id v16 = sub_1000F6844();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10027FCBC((uint64_t)v15, v17);
      }
    }

    else
    {
      v17 = (os_log_s *)v3;
      id v3 = v14;
    }

    id v12 = v3;
  }

  return v12;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return (FBSDisplayConfiguration *)(id)objc_claimAutoreleasedReturnValue( -[FBSDisplayMonitor mainConfiguration]( self,  "mainConfiguration"));
}

@end