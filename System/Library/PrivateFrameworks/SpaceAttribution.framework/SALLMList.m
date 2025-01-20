@interface SALLMList
+ (BOOL)isLLM:(id)a3;
+ (void)billLLMsToSystemOn:(id)a3 andTelemetry:(id)a4;
@end

@implementation SALLMList

+ (BOOL)isLLM:(id)a3
{
  id v3 = a3;
  if (qword_10005AB20 != -1) {
    dispatch_once(&qword_10005AB20, &stru_10004D248);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AB18 objectForKeyedSubscript:v3]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AB18 objectForKeyedSubscript:v3]);
    unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (void)billLLMsToSystemOn:(id)a3 andTelemetry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = SALog(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "+[SALLMList billLLMsToSystemOn:andTelemetry:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s start", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 appsDataInternal]);
  id v10 = [v9 mutableCopy];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002534C;
  v16[3] = &unk_10004D270;
  id v17 = v5;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.apple.fakeapp.System"));
  id v19 = v6;
  id v11 = v6;
  id v12 = v18;
  id v13 = v5;
  uint64_t v14 = SALog([v10 enumerateKeysAndObjectsUsingBlock:v16]);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "+[SALLMList billLLMsToSystemOn:andTelemetry:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s end", buf, 0xCu);
  }
}

@end