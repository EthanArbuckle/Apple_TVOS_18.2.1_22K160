@interface SFMCommandRouter
+ (Class)handlerClass;
+ (Class)legacyHandlerClass;
+ (id)chooseTargetWithDictionary:(id)a3 initBlock:(id)a4;
- (SFMCommandRouter)init;
- (SFMCommandRouter)initWithDictionary:(id)a3;
@end

@implementation SFMCommandRouter

- (SFMCommandRouter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_3674;
  v9[3] = &unk_40C8;
  id v10 = v4;
  id v6 = v4;
  v7 = (SFMCommandRouter *)objc_claimAutoreleasedReturnValue([v5 chooseTargetWithDictionary:v6 initBlock:v9]);

  return v7;
}

- (SFMCommandRouter)init
{
  id v3 = [(id)objc_opt_class(self) chooseTargetWithDictionary:0 initBlock:&stru_4108];
  id v4 = (SFMCommandRouter *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

+ (Class)handlerClass
{
  v2 = (NSString *)objc_claimAutoreleasedReturnValue([a1 handlerClassName]);
  Class v3 = NSClassFromString(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (Class)v4;
}

+ (Class)legacyHandlerClass
{
  Class v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/Assistant/Plugins/FMIPSiriBackendPlugin.assistantBundle"));
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue([a1 legacyHandlerClassName]);
  Class v5 = NSClassFromString(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (Class)v6;
}

+ (id)chooseTargetWithDictionary:(id)a3 initBlock:(id)a4
{
  Class v5 = (uint64_t (**)(id, id))a4;
  os_log_t v6 = os_log_create("com.apple.siri.findmy", "plugin");

  v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 commandName]);
    int v12 = 138543362;
    v13 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Using legacy plugin to service %{public}@ command.",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v9 = v5[2](v5, [a1 legacyHandlerClass]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

@end