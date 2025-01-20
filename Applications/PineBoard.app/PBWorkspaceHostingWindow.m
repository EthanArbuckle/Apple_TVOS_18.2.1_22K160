@interface PBWorkspaceHostingWindow
- (BOOL)canBecomeKeyWindow;
- (BOOL)setLayout:(id)a3;
- (PBWorkspaceHostingWindow)initWithWindowScene:(id)a3;
- (PBWorkspaceLayout)layout;
- (id)stateDumpBuilder;
- (id)viewForSceneWithKey:(id)a3;
- (int64_t)effectiveUserInterfaceLayoutDirection;
- (void)_applyAttributes:(id)a3 toSubview:(id)a4;
- (void)_resetAttributesOfSubview:(id)a3;
- (void)_userInterfaceLayoutDirectionChanged:(id)a3;
- (void)addScene:(id)a3;
- (void)addScene:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)removeScene:(id)a3;
- (void)scenePresentationBinder:(id)a3 didStartPresentingScene:(id)a4;
@end

@implementation PBWorkspaceHostingWindow

- (PBWorkspaceHostingWindow)initWithWindowScene:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBWorkspaceHostingWindow;
  v3 = -[PBWorkspaceHostingWindow initWithWindowScene:](&v14, "initWithWindowScene:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    keysBySceneID = v3->_keysBySceneID;
    v3->_keysBySceneID = (NSMutableDictionary *)v4;

    v6 = (objc_class *)objc_opt_class(v3);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%p", v8, v3));

    v10 = -[UIScenePresentationBinder initWithIdentifier:priority:rootView:appearanceStyle:]( objc_alloc(&OBJC_CLASS___UIScenePresentationBinder),  "initWithIdentifier:priority:rootView:appearanceStyle:",  v9,  -10LL,  v3,  1LL);
    scenePresentationBinder = v3->_scenePresentationBinder;
    v3->_scenePresentationBinder = v10;

    -[UIScenePresentationBinder setDelegate:](v3->_scenePresentationBinder, "setDelegate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v3 selector:"_userInterfaceLayoutDirectionChanged:" name:@"kPBUserInterfaceLayoutDirectionChangedNotification" object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBWorkspaceHostingWindow;
  -[PBWorkspaceHostingWindow dealloc](&v3, "dealloc");
}

- (BOOL)setLayout:(id)a3
{
  id v4 = a3;
  p_layout = &self->_layout;
  char v6 = BSEqualObjects(self->_layout, v4);
  if ((v6 & 1) != 0)
  {
    id v7 = sub_1000F7B04();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100278848((uint64_t)self, &self->_layout, v8);
    }
  }

  else
  {
    v9 = (PBWorkspaceLayout *)[v4 copy];
    v10 = *p_layout;
    *p_layout = v9;

    id v11 = sub_1000F7B04();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  *p_layout));
      int v15 = 134218242;
      v16 = self;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%p] Updated layout {layout=%{public}@}",  (uint8_t *)&v15,  0x16u);
    }

    -[PBWorkspaceHostingWindow setNeedsLayout](self, "setNeedsLayout");
  }

  return v6 ^ 1;
}

- (void)addScene:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  keysBySceneID = self->_keysBySceneID;
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](keysBySceneID, "setObject:forKey:", v6, v8);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](keysBySceneID, "removeObjectForKey:", v8);
  }
  -[UIScenePresentationBinder addScene:](self->_scenePresentationBinder, "addScene:", v7);
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (int64_t)effectiveUserInterfaceLayoutDirection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = [v2 userInterfaceLayoutDirection];

  return (int64_t)v3;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBWorkspaceHostingWindow;
  -[PBWorkspaceHostingWindow layoutSubviews](&v20, "layoutSubviews");
  id v3 = self->_layout;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[PBWorkspaceHostingWindow subviews](self, "subviews"));
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 presenter]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scene]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_keysBySceneID, "objectForKey:", v11));
        if (v12
          && (uint64_t v13 = objc_claimAutoreleasedReturnValue(-[PBWorkspaceLayout attributesForKey:](v3, "attributesForKey:", v12))) != 0)
        {
          objc_super v14 = (void *)v13;
          -[PBWorkspaceHostingWindow _applyAttributes:toSubview:](self, "_applyAttributes:toSubview:", v13, v8);
        }

        else
        {
          -[PBWorkspaceHostingWindow _resetAttributesOfSubview:](self, "_resetAttributesOfSubview:", v8);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v5);
  }
}

- (id)viewForSceneWithKey:(id)a3
{
  id v4 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[PBWorkspaceHostingWindow subviews](self, "subviews"));
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 presenter]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scene]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);

        id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_keysBySceneID, "objectForKey:", v12));
        if (v13) {
          BOOL v14 = v13 == v4;
        }
        else {
          BOOL v14 = 0;
        }
        if (v14)
        {
          id v15 = v9;

          goto LABEL_14;
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v15 = 0LL;
LABEL_14:

  return v15;
}

- (void)invalidate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[UIScenePresentationBinder invalidate](self->_scenePresentationBinder, "invalidate");
  scenePresentationBinder = self->_scenePresentationBinder;
  self->_scenePresentationBinder = 0LL;
}

- (void)addScene:(id)a3
{
}

- (void)removeScene:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[NSMutableDictionary removeObjectForKey:](self->_keysBySceneID, "removeObjectForKey:", v5);
  -[UIScenePresentationBinder removeScene:](self->_scenePresentationBinder, "removeScene:", v4);
}

- (void)scenePresentationBinder:(id)a3 didStartPresentingScene:(id)a4
{
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendObject:self->_scenePresentationBinder withKey:@"scenePresentationBinder"];
  id v5 = [v3 appendObject:self->_layout withKey:@"layout"];
  return v3;
}

- (void)_userInterfaceLayoutDirectionChanged:(id)a3
{
}

- (void)_applyAttributes:(id)a3 toSubview:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_100058A54(v7, (uint64_t)v29);
  [v7 cornerRadius];
  double v9 = v8;
  uint64_t v10 = BSFloatIsZero(v8) ^ 1;
  BOOL v11 = (id)-[PBWorkspaceHostingWindow effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection") == (id)1;
  -[PBWorkspaceHostingWindow bounds](self, "bounds");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 presenter]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 scene]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 settings]);
  [v20 frame];
  double v25 = sub_100058AB4(v7, v11, v21, v22, v23, v24, v13, v15, v17);
  double v27 = v26;

  v28[0] = v29[0];
  v28[1] = v29[1];
  v28[2] = v29[2];
  [v6 setTransform:v28];
  objc_msgSend(v6, "setCenter:", v25, v27);
  [v6 _setContinuousCornerRadius:v9];
  [v6 setClipsToBounds:v10];
}

- (void)_resetAttributesOfSubview:(id)a3
{
  id v4 = a3;
  -[PBWorkspaceHostingWindow bounds](self, "bounds");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  __int128 v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v20.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v20.c = v13;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v4 bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  v24.origin.CGFloat x = v6;
  v24.origin.CGFloat y = v8;
  v24.size.double width = v10;
  v24.size.double height = v12;
  if (!CGRectEqualToRect(v21, v24))
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    double v18 = 1.0;
    if (!CGRectIsEmpty(v22))
    {
      v23.origin.CGFloat x = v6;
      v23.origin.CGFloat y = v8;
      v23.size.double width = v10;
      v23.size.double height = v12;
      if (!CGRectIsEmpty(v23))
      {
        if (v10 / v12 >= width / height) {
          double v18 = v12 / height;
        }
        else {
          double v18 = v10 / width;
        }
      }
    }

    CGAffineTransformMakeScale(&v20, v18, v18);
  }

  CGAffineTransform v19 = v20;
  UIRectGetCenter([v4 setTransform:&v19], v6, v8, v10, v12);
  objc_msgSend(v4, "setCenter:");
  [v4 _setContinuousCornerRadius:0.0];
}

- (PBWorkspaceLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

@end