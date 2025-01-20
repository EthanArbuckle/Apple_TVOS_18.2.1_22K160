@interface PBTVMainDisplayTransformer
- (BOOL)configurationRequiresTransforming:(id)a3;
- (PBTVMainDisplayTransformer)init;
- (id)transformDisplayConfiguration:(id)a3;
- (void)_handleDisplayBoundsDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation PBTVMainDisplayTransformer

- (PBTVMainDisplayTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBTVMainDisplayTransformer;
  v2 = -[PBTVMainDisplayTransformer init](&v6, "init");
  v3 = (PBTVMainDisplayTransformer *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1002EC088;
    *(_OWORD *)(v2 + 24) = *(_OWORD *)&qword_1002EC098;
    if (sub_1001C9E00())
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v4 addObserver:v3 selector:"_handleDisplayBoundsDidChangeNotification:" name:@"PBDisplayBoundsManagerBoundsDidChangeNotification" object:0];
    }
  }

  return v3;
}

- (void)dealloc
{
  if (sub_1001C9E00())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"PBDisplayBoundsManagerBoundsDidChangeNotification" object:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBTVMainDisplayTransformer;
  -[PBTVMainDisplayTransformer dealloc](&v4, "dealloc");
}

- (void)_handleDisplayBoundsDidChangeNotification:(id)a3
{
  if (sub_1001C9E00())
  {
    id v3 = sub_1000F6C7C();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PBTVMainDisplayTransformer handling display bounds change notification",  buf,  2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBHotBlackManager sharedInstance](&OBJC_CLASS___PBHotBlackManager, "sharedInstance"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 acquirePresentationAssertionForReason:@"System Aspect Ratio Change"]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](&OBJC_CLASS___FBDisplayManager, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10010A91C;
    v9[3] = &unk_1003CFF08;
    id v10 = v6;
    id v8 = v6;
    [v7 updateTransformsWithCompletion:v9];
  }

- (id)transformDisplayConfiguration:(id)a3
{
  id v4 = a3;
  else {
    id v5 = sub_10010ACB4((uint64_t)self, v4);
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)configurationRequiresTransforming:(id)a3
{
  id v5 = a3;
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    v7 = NSStringFromSelector(a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (objc_class *)objc_opt_class(self);
    id v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v13 = 138413314;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2112;
    v20 = @"PBTVMainDisplayTransformer.m";
    __int16 v21 = 1024;
    int v22 = 221;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %@ of <%@:%p> (%@:%i)",  (uint8_t *)&v13,  0x30u);
  }

  __break(0);
  return v6;
}

@end