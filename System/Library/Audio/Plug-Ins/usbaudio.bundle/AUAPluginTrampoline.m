@interface AUAPluginTrampoline
- (id)fnHALInitializeWithPluginHost;
- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3;
- (void)setFnHALInitializeWithPluginHost:(id)a3;
@end

@implementation AUAPluginTrampoline

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUAPluginTrampoline fnHALInitializeWithPluginHost](self, "fnHALInitializeWithPluginHost"));

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000044FC;
    v8[3] = &unk_1000FD868;
    v8[4] = self;
    v6 = objc_retainBlock(v8);
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[AUAPluginTrampoline fnHALInitializeWithPluginHost]( self,  "fnHALInitializeWithPluginHost"));
    ((void (**)(void, AudioServerPlugInHostInterface *, void *))v7)[2](v7, a3, v6);
  }

- (id)fnHALInitializeWithPluginHost
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setFnHALInitializeWithPluginHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end