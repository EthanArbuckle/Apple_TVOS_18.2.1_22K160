@interface MRDBackgroundTasks
- (id)allowList;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
@end

@implementation MRDBackgroundTasks

- (id)allowList
{
  if (qword_1003FDD20 != -1) {
    dispatch_once(&qword_1003FDD20, &stru_10039C5D8);
  }
  return (id)qword_1003FDD18;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "MRXPC_NOTIFICATION_NAME_KEY");
  v7 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  string,  4LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBackgroundTasks allowList](self, "allowList"));
  unsigned __int8 v9 = [v8 containsObject:v7];

  if ((v9 & 1) != 0)
  {
    double v11 = xpc_dictionary_get_double(v5, "MRXPC_NOTIFICATION_DELAY");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100066C50;
    v15[3] = &unk_100399B48;
    v15[4] = string;
    v12 = objc_retainBlock(v15);
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_double(v13, XPC_ACTIVITY_DELAY, v11);
    xpc_activity_register(string, v13, v12);
  }

  else
  {
    uint64_t v14 = _MRLogForCategory(0LL, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B5BEC((uint64_t)v7, (os_log_s *)v12);
    }
  }
}

@end