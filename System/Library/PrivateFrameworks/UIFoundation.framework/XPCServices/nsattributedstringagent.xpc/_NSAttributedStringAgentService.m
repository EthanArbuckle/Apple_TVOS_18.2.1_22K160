@interface _NSAttributedStringAgentService
+ (id)sharedApplication;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_NSAttributedStringAgentService)init;
- (void)start;
@end

@implementation _NSAttributedStringAgentService

+ (id)sharedApplication
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2050000000LL;
  v2 = (void *)qword_100008858;
  uint64_t v9 = qword_100008858;
  if (!qword_100008858)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000022D4;
    v5[3] = &unk_1000041C8;
    v5[4] = &v6;
    sub_1000022D4((uint64_t)v5);
    v2 = (void *)v7[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (id)objc_claimAutoreleasedReturnValue([v3 sharedApplication]);
}

- (_NSAttributedStringAgentService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSAttributedStringAgentService;
  v2 = -[_NSAttributedStringAgentService init](&v6, "init");
  id v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.textkit.nsattributedstringagent");
  listener = v2->_listener;
  v2->_listener = v3;

  -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  return v2;
}

- (void)start
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _allowedTokensClasses](&OBJC_CLASS___NSAttributedString, "_allowedTokensClasses"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _allowedOptionClasses](&OBJC_CLASS___NSAttributedString, "_allowedOptionClasses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____NSAttributedStringAgentProtocol));
  [v7 setClasses:v6 forSelector:"renderHTML:options:extensionTokens:withReply:" argumentIndex:1 ofReply:0];
  [v7 setClasses:v5 forSelector:"renderHTML:options:extensionTokens:withReply:" argumentIndex:2 ofReply:0];
  [v7 setClasses:v6 forSelector:"renderHTML:options:extensionTokens:withReply:" argumentIndex:0 ofReply:1];
  [v7 setClasses:v6 forSelector:"readFromData:orFileURL:options:extensionTokens:withReply:" argumentIndex:2 ofReply:0];
  [v7 setClasses:v5 forSelector:"readFromData:orFileURL:options:extensionTokens:withReply:" argumentIndex:3 ofReply:0];
  [v7 setClasses:v6 forSelector:"readFromData:orFileURL:options:extensionTokens:withReply:" argumentIndex:1 ofReply:1];
  [v4 setExportedInterface:v7];
  uint64_t v8 = objc_opt_new(&OBJC_CLASS____NSAttributedStringAgent);
  [v4 setExportedObject:v8];
  [v4 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end