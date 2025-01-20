@interface MRDUIClientMessageForwarder
+ (id)forwarderWithTarget:(id)a3;
+ (id)forwarderWithXPCTarget:(id)a3;
@end

@implementation MRDUIClientMessageForwarder

+ (id)forwarderWithTarget:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___MRDUIClientBSMessageForwarder);
  -[MRDUIClientBSMessageForwarder setTarget:](v4, "setTarget:", v3);

  return v4;
}

+ (id)forwarderWithXPCTarget:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___MRDUIClientXPCMessageForwarder);
  -[MRDUIClientXPCMessageForwarder setTarget:](v4, "setTarget:", v3);

  return v4;
}

@end