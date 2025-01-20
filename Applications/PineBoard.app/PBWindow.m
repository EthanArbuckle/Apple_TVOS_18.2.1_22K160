@interface PBWindow
+ (void)_decrementOcclusionCounter;
+ (void)_incrementOcclusionCounter;
- (BOOL)isOccluding;
- (BOOL)shouldOcclude;
- (NSString)name;
- (PBWindow)initWithWindowScene:(id)a3 name:(id)a4;
- (id)description;
- (void)_updateOccludingState;
- (void)dealloc;
- (void)setHidden:(BOOL)a3;
- (void)setOccluding:(BOOL)a3;
- (void)setShouldOcclude:(BOOL)a3;
- (void)setWindowLevel:(double)a3;
@end

@implementation PBWindow

- (PBWindow)initWithWindowScene:(id)a3 name:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBWindow;
  v7 = -[PBWindow initWithWindowScene:](&v12, "initWithWindowScene:", a3);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[PBWindow setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v7->_shouldOcclude = 1;
    v9 = (NSString *)[v6 copy];
    name = v7->_name;
    v7->_name = v9;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_occluding) {
    +[PBWindow _decrementOcclusionCounter](&OBJC_CLASS___PBWindow, "_decrementOcclusionCounter");
  }
  id v3 = sub_1000849C8();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBWindow;
  -[PBWindow dealloc](&v5, "dealloc");
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBWindow;
  id v3 = -[PBWindow description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBWindow name](self, "name"));
  id v6 = (void *)v5;
  v7 = @"No Name";
  if (v5) {
    v7 = (const __CFString *)v5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ [%@]", v4, v7));

  return v8;
}

- (void)setWindowLevel:(double)a3
{
  id v5 = sub_1000849C8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = (id)objc_opt_class(self);
    __int16 v11 = 2048;
    double v12 = a3;
    id v7 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "adjusting %@ windowLevel to %f", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBWindow;
  -[PBWindow setWindowLevel:](&v8, "setWindowLevel:", a3);
  -[PBWindow _updateOccludingState](self, "_updateOccludingState");
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000849C8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_opt_class(self);
    objc_super v8 = "no";
    if (v3) {
      objc_super v8 = "yes";
    }
    *(_DWORD *)buf = 138412546;
    double v12 = v7;
    __int16 v13 = 2080;
    v14 = v8;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "adjusting %@ isHidden to %s", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBWindow;
  -[PBWindow setHidden:](&v10, "setHidden:", v3);
  -[PBWindow _updateOccludingState](self, "_updateOccludingState");
}

- (void)setOccluding:(BOOL)a3
{
  if (self->_occluding != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1000849C8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_opt_class(self);
      objc_super v8 = "no";
      if (v3) {
        objc_super v8 = "yes";
      }
      int v10 = 138412546;
      __int16 v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = v8;
      id v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "adjusting %@ _occluding to %s",  (uint8_t *)&v10,  0x16u);
    }

    self->_occluding = v3;
    if (v3) {
      +[PBWindow _incrementOcclusionCounter](&OBJC_CLASS___PBWindow, "_incrementOcclusionCounter");
    }
    else {
      +[PBWindow _decrementOcclusionCounter](&OBJC_CLASS___PBWindow, "_decrementOcclusionCounter");
    }
  }

- (void)_updateOccludingState
{
  if (-[PBWindow shouldOcclude](self, "shouldOcclude")
    && (-[PBWindow windowLevel](self, "windowLevel"), v3 >= UIAlertWindowLevel))
  {
    uint64_t v4 = -[PBWindow isHidden](self, "isHidden") ^ 1;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  -[PBWindow setOccluding:](self, "setOccluding:", v4);
}

+ (void)_incrementOcclusionCounter
{
  uint64_t v2 = qword_100470AC0;
  if (!qword_100470AC0)
  {
    id v3 = sub_1000ECA38();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    [v4 acquireWithPredicate:&stru_1003D6930 transitionContext:0];

    id v5 = sub_100083C30();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_1000ECA38();
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = UIApplicationSceneDeactivationReasonDescription([v8 reason]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v19 = 138543362;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Acquired scene assertion for reason: %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    id v11 = sub_1000ECAEC();
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v12 acquireWithPredicate:&stru_1003D6950 transitionContext:0];

    id v13 = sub_100083C30();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = sub_1000ECAEC();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = UIApplicationSceneDeactivationReasonDescription([v16 reason]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Acquired scene assertion for reason: %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v2 = qword_100470AC0;
  }

  qword_100470AC0 = v2 + 1;
}

+ (void)_decrementOcclusionCounter
{
  uint64_t v2 = qword_100470AC0;
  if (qword_100470AC0 == 1)
  {
    id v3 = sub_1000ECA38();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    [v4 relinquish];

    id v5 = sub_100083C30();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_1000ECA38();
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = UIApplicationSceneDeactivationReasonDescription([v8 reason]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v19 = 138543362;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Relinquished scene assertion for reason: %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    id v11 = sub_1000ECAEC();
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v12 relinquish];

    id v13 = sub_100083C30();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = sub_1000ECA38();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = UIApplicationSceneDeactivationReasonDescription([v16 reason]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Relinquished scene assertion for reason: %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v2 = qword_100470AC0;
  }

  qword_100470AC0 = v2 - 1;
}

- (BOOL)shouldOcclude
{
  return self->_shouldOcclude;
}

- (void)setShouldOcclude:(BOOL)a3
{
  self->_shouldOcclude = a3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isOccluding
{
  return self->_occluding;
}

- (void).cxx_destruct
{
}

@end