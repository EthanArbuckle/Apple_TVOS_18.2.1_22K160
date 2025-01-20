@interface MSUBrainDelegateImpl_softwareupdated
+ (id)sharedInstance;
- (MSUBrainDelegateImpl_softwareupdated)init;
- (Protocol)brainProtocol;
- (Protocol)delegateProtocol;
- (void)_nsxpcInvoke:(id)a3 args:(id)a4 options:(id)a5 completion:(id)a6;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
@end

@implementation MSUBrainDelegateImpl_softwareupdated

- (MSUBrainDelegateImpl_softwareupdated)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUBrainDelegateImpl_softwareupdated;
  result = -[MSUBrainDelegateImpl_softwareupdated init](&v3, "init");
  if (result)
  {
    result->_brainProtocol = (Protocol *)&OBJC_PROTOCOL___MSUBrainNSXPCInterface;
    result->_delegateProtocol = (Protocol *)&OBJC_PROTOCOL___MSUBrainDelegateNSXPCInterface;
  }

  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_10);
  }
  return (id)sharedInstance___instance_0;
}

- (void)connectionInterrupted
{
}

- (void)connectionInvalidated
{
}

- (void)_nsxpcInvoke:(id)a3 args:(id)a4 options:(id)a5 completion:(id)a6
{
  if (a6)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not implemented",  a4,  a5,  "-[MSUBrainDelegateImpl_softwareupdated _nsxpcInvoke:args:options:completion:]",  NSDebugDescriptionErrorKey);
    (*((void (**)(id, NSError *, void))a6 + 2))( a6,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1300LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL)),  0LL);
  }

- (Protocol)brainProtocol
{
  return self->_brainProtocol;
}

- (Protocol)delegateProtocol
{
  return self->_delegateProtocol;
}

@end