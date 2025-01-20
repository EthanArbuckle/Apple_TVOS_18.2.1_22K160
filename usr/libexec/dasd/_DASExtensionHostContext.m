@interface _DASExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_DASPlugin)contextPlugin;
- (id)remoteContextWithError:(id *)a3;
- (int)pid;
- (void)activityCompletedWithStatus:(unsigned __int8)a3;
- (void)setContextPlugin:(id)a3;
@end

@implementation _DASExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_100157D88 != -1) {
    dispatch_once(&qword_100157D88, &stru_1001176C0);
  }
  return (id)qword_100157D90;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_100157D98 != -1) {
    dispatch_once(&qword_100157D98, &stru_1001176E0);
  }
  return (id)qword_100157DA0;
}

- (int)pid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  int v3 = [v2 processIdentifier];

  return v3;
}

- (id)remoteContextWithError:(id *)a3
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_1000AD358;
  v12 = sub_1000AD368;
  id v13 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AD370;
  v7[3] = &unk_100117708;
  v7[4] = &v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxyWithErrorHandler:v7]);

  if (a3) {
    *a3 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)activityCompletedWithStatus:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Host received notice that extension is finished",  v7,  2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASExtensionHostContext contextPlugin](self, "contextPlugin"));
  [v6 extensionDidFinishWithStatus:v3];
}

- (_DASPlugin)contextPlugin
{
  return (_DASPlugin *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContextPlugin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end