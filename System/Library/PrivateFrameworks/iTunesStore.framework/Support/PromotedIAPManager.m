@interface PromotedIAPManager
+ (id)sharedInstance;
- (PromotedIAPManager)init;
- (void)getInfoInternalForApp:(id)a3 completionHandler:(id)a4;
- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4;
- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4;
- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6;
@end

@implementation PromotedIAPManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015CF98;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3570 != -1) {
    dispatch_once(&qword_1003A3570, block);
  }
  return (id)qword_1003A3568;
}

- (PromotedIAPManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PromotedIAPManager;
  v2 = -[PromotedIAPManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PromotedIAPDatabase);
    database = v2->_database;
    v2->_database = v3;
  }

  return v2;
}

- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4
{
}

- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
}

- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
}

- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6
{
}

- (void)getInfoInternalForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  dispatch_group_enter(v8);
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x3032000000LL;
  v28[3] = sub_10015D244;
  v28[4] = sub_10015D254;
  id v29 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x3032000000LL;
  v26[3] = sub_10015D244;
  v26[4] = sub_10015D254;
  id v27 = 0LL;
  database = self->_database;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10015D25C;
  v23[3] = &unk_10034FD88;
  v25 = v28;
  v10 = v8;
  v24 = v10;
  -[PromotedIAPDatabase getOrderForIAPsInApp:completionHandler:]( database,  "getOrderForIAPsInApp:completionHandler:",  v6,  v23);
  v11 = self->_database;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10015D298;
  v20[3] = &unk_10034FDB0;
  v22 = v26;
  v12 = v10;
  v21 = v12;
  -[PromotedIAPDatabase getVisibilityForAllIAPsInApp:completionHandler:]( v11,  "getVisibilityForAllIAPsInApp:completionHandler:",  v6,  v20);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015D2D4;
  block[3] = &unk_10034FDD8;
  id v17 = v7;
  v18 = v26;
  v19 = v28;
  id v15 = v7;
  dispatch_group_notify(v12, v14, block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end