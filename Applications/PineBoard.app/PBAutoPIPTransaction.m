@interface PBAutoPIPTransaction
- (PBApplication)application;
- (PBAutoPIPTransaction)initWithPictureInPictureController:(id)a3 pictureInPictureApplication:(id)a4 sceneHandle:(id)a5 application:(id)a6;
- (PBSceneHandle)sceneHandle;
- (PGPictureInPictureApplication)pictureInPictureApplication;
- (PGPictureInPictureController)pictureInPictureController;
- (void)_begin;
@end

@implementation PBAutoPIPTransaction

- (PBAutoPIPTransaction)initWithPictureInPictureController:(id)a3 pictureInPictureApplication:(id)a4 sceneHandle:(id)a5 application:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  Class v16 = NSClassFromString(@"PGPictureInPictureController");
  if (!v15)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002933B4();
    }
LABEL_35:
    _bs_set_crash_log_message([v26 UTF8String]);
    __break(0);
    JUMPOUT(0x100209F60LL);
  }

  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PGPictureInPictureControllerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002933B4();
    }
    _bs_set_crash_log_message([v27 UTF8String]);
    __break(0);
    JUMPOUT(0x100209FC4LL);
  }

  id v17 = v12;
  Class v18 = NSClassFromString(@"PGPictureInPictureApplication");
  if (!v17)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293464();
    }
    _bs_set_crash_log_message([v28 UTF8String]);
    __break(0);
    JUMPOUT(0x10020A028LL);
  }

  if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PGPictureInPictureApplicationClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293464();
    }
    _bs_set_crash_log_message([v29 UTF8String]);
    __break(0);
    JUMPOUT(0x10020A08CLL);
  }

  id v19 = v13;
  Class v20 = NSClassFromString(@"PBSceneHandle");
  if (!v19)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293514();
    }
    _bs_set_crash_log_message([v30 UTF8String]);
    __break(0);
    JUMPOUT(0x10020A0F0LL);
  }

  if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSceneHandleClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293514();
    }
    _bs_set_crash_log_message([v31 UTF8String]);
    __break(0);
    JUMPOUT(0x10020A154LL);
  }

  id v21 = v14;
  Class v22 = NSClassFromString(@"PBApplication");
  if (!v21)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002935C4();
    }
    _bs_set_crash_log_message([v32 UTF8String]);
    __break(0);
    JUMPOUT(0x10020A1B8LL);
  }

  if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBApplicationClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002935C4();
    }
    goto LABEL_35;
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___PBAutoPIPTransaction;
  v23 = -[PBAutoPIPTransaction init](&v33, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_pictureInPictureController, a3);
    objc_storeStrong((id *)&v24->_pictureInPictureApplication, a4);
    objc_storeStrong((id *)&v24->_sceneHandle, a5);
    objc_storeStrong((id *)&v24->_application, a6);
  }

  return v24;
}

- (void)_begin
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBAutoPIPTransaction;
  -[PBAutoPIPTransaction _begin](&v4, "_begin");
  if (-[PBApplication isFaceTime](self->_application, "isFaceTime"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier"));
    if (-[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]( self->_pictureInPictureController,  "shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:",  self->_pictureInPictureApplication,  v3)) {
      -[PGPictureInPictureController startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:]( self->_pictureInPictureController,  "startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:",  self->_pictureInPictureApplication,  v3,  1LL,  &stru_1003DD138);
    }
  }

- (PGPictureInPictureController)pictureInPictureController
{
  return self->_pictureInPictureController;
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (PBApplication)application
{
  return self->_application;
}

- (PGPictureInPictureApplication)pictureInPictureApplication
{
  return self->_pictureInPictureApplication;
}

- (void).cxx_destruct
{
}

@end