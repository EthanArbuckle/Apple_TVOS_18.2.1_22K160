@interface APSSymptomReporter
- (APSSymptomReporter)init;
- (void)reportClientIPAddress:(id)a3 forInterfaceOfName:(id)a4;
- (void)reportConnectionFailureOnConnectionType:(int64_t)a3;
- (void)reportConnectionSuccessOnConnectionType:(int64_t)a3;
- (void)reportSymptomToAutoBugCapture:(id)a3 subType:(id)a4;
@end

@implementation APSSymptomReporter

- (APSSymptomReporter)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___APSSymptomReporter;
  v2 = -[APSSymptomReporter init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.aps.symptom-reporter-queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (dispatch_object_s *)v2->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v5, v7);

    v8 = v2;
  }

  return v2;
}

- (void)reportSymptomToAutoBugCapture:(id)a3 subType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000512C;
  block[3] = &unk_10011DAB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)reportConnectionFailureOnConnectionType:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000052B8;
  block[3] = &unk_10011DB58;
  block[4] = a3;
  dispatch_async(queue, block);
}

- (void)reportConnectionSuccessOnConnectionType:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005534;
  block[3] = &unk_10011DB58;
  block[4] = a3;
  dispatch_async(queue, block);
}

- (void)reportClientIPAddress:(id)a3 forInterfaceOfName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100005804;
  v11[3] = &unk_10011DC60;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void).cxx_destruct
{
}

  ;
}

@end