@interface ADLocalRequestProvider
+ (id)sharedProvider;
- (ADLocalRequestProvider)init;
- (id)_bundle;
- (void)_getLocalRequestWithType:(int64_t)a3 bundle:(id)a4 languageCode:(id)a5 outputVoiceInfo:(id)a6 completion:(id)a7;
- (void)getLocalRequestWithType:(int64_t)a3 completion:(id)a4;
@end

@implementation ADLocalRequestProvider

- (ADLocalRequestProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADLocalRequestProvider;
  v2 = -[ADLocalRequestProvider init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.local-request-provider", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)getLocalRequestWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141748;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (id)_bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AFVoiceInfo));
    dispatch_queue_attr_t v5 = (NSBundle *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = self->_bundle;
    self->_bundle = v5;

    bundle = self->_bundle;
  }

  return bundle;
}

- (void)_getLocalRequestWithType:(int64_t)a3 bundle:(id)a4 languageCode:(id)a5 outputVoiceInfo:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, id))a7;
  uint64_t v15 = SiriCoreUUIDStringCreate(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_alloc_init(&OBJC_CLASS___SARequestCompleted);
  uint64_t v18 = SiriCoreUUIDStringCreate(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[SARequestCompleted setAceId:](v17, "setAceId:", v19);

  -[SARequestCompleted setRefId:](v17, "setRefId:", v16);
  if (a3 != 1) {
    goto LABEL_6;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  id v21 = [v13 gender];
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v13 languageCode]);
  v23 = (void *)v22;
  id v24 = v22 ? (id)v22 : v12;
  v36 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"ASSISTANT_SERVICES_LOCAL_MUSIC_SUBSCRIPTION_LEASE" gender:v21 table:0 bundle:v11 languageCode:v24]);

  id v25 = objc_alloc_init(&OBJC_CLASS___SAResultCallback);
  uint64_t v26 = SiriCoreUUIDStringCreate(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v25 setAceId:v27];

  [v25 setRefId:v16];
  v40 = v17;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  [v25 setCommands:v28];

  id v29 = v11;
  v30 = objc_alloc_init(&OBJC_CLASS___SAUISayIt);
  uint64_t v31 = SiriCoreUUIDStringCreate(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[SAUISayIt setAceId:](v30, "setAceId:", v32);

  -[SAUISayIt setRefId:](v30, "setRefId:", v16);
  -[SAUISayIt setMessage:](v30, "setMessage:", v36);
  id v39 = v25;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  -[SAUISayIt setCallbacks:](v30, "setCallbacks:", v33);

  v38 = v30;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));

  id v11 = v29;
  if (!v34)
  {
LABEL_6:
    v37 = v17;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  }

  v35 = objc_alloc_init(&OBJC_CLASS___SAStartLocalRequest);
  -[SAStartLocalRequest setAceId:](v35, "setAceId:", v16);
  -[SAStartLocalRequest setClientBoundCommands:](v35, "setClientBoundCommands:", v34);
  v14[2](v14, v35);
}

- (void).cxx_destruct
{
}

+ (id)sharedProvider
{
  if (qword_100577F30 != -1) {
    dispatch_once(&qword_100577F30, &stru_1004F2CA0);
  }
  return (id)qword_100577F38;
}

@end