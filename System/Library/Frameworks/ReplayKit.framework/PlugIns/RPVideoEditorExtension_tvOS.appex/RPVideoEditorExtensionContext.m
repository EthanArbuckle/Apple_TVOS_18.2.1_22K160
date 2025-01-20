@interface RPVideoEditorExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)extensionObjectProxy;
- (id)videoEditorExtensionViewController;
- (int64_t)mode;
- (void)doAction:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation RPVideoEditorExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPVideoEditorExtensionProtocol);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPVideoEditorExtensionHostProtocol);
}

- (void)setMode:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[RPVideoEditorExtensionContext videoEditorExtensionViewController]( self,  "videoEditorExtensionViewController"));
  [v4 setMode:a3];
}

- (void)doAction:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPVideoEditorExtensionContext:doAction",  v6,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[RPVideoEditorExtensionContext videoEditorExtensionViewController]( self,  "videoEditorExtensionViewController"));
  [v5 doAction:v4];
}

- (id)videoEditorExtensionViewController
{
  return -[RPVideoEditorExtensionContext _principalObject](self, "_principalObject");
}

- (id)extensionObjectProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxyWithErrorHandler:&stru_10000C540]);

  return v3;
}

- (int64_t)mode
{
  return self->_mode;
}

@end