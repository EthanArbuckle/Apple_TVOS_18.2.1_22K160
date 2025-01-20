@interface _PBWallpaperGenerateOperation
- (_PBWallpaperGenerateOperation)initWithGenerationBlock:(id)a3;
- (id)generationBlock;
- (void)cancel;
- (void)main;
@end

@implementation _PBWallpaperGenerateOperation

- (_PBWallpaperGenerateOperation)initWithGenerationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBWallpaperGenerateOperation;
  v5 = -[_PBWallpaperGenerateOperation init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    targetUserInterfaceStyle = (void *)v5->super._targetUserInterfaceStyle;
    v5->super._targetUserInterfaceStyle = (int64_t)v6;

    LOBYTE(v5->super.super._private1) = 1;
  }

  return v5;
}

- (void)main
{
  id v3 = sub_100083F78();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

  id v6 = sub_100083F78();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  unint64_t v9 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "GenerateWallpaper",  "",  buf,  2u);
  }

  id v10 = sub_100083F78();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "GenerateWallpaper: Begin", v26, 2u);
  }

  if ((-[_PBWallpaperGenerateOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    id v12 = sub_100083F78();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "GenerateWallpaper: Cancelled", v25, 2u);
    }

    id v14 = sub_100083F78();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    targetUserInterfaceStyle = v15;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v24 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  targetUserInterfaceStyle,  OS_SIGNPOST_EVENT,  v5,  "SaveWallpaper.cancelled",  "",  v24,  2u);
    }
  }

  else
  {
    (*(void (**)(void))(self->super._targetUserInterfaceStyle + 16))();
    targetUserInterfaceStyle = (os_log_s *)self->super._targetUserInterfaceStyle;
    self->super._targetUserInterfaceStyle = 0LL;
  }

  CABackingStoreCollectBlocking();
  id v17 = sub_100083F78();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "GenerateWallpaper: End", v23, 2u);
  }

  id v19 = sub_100083F78();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v5,  "GenerateWallpaper",  "",  v22,  2u);
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBWallpaperGenerateOperation;
  -[_PBWallpaperGenerateOperation cancel](&v4, "cancel");
  targetUserInterfaceStyle = (void *)self->super._targetUserInterfaceStyle;
  self->super._targetUserInterfaceStyle = 0LL;
}

- (id)generationBlock
{
  return (id)self->super._targetUserInterfaceStyle;
}

- (void).cxx_destruct
{
}

@end