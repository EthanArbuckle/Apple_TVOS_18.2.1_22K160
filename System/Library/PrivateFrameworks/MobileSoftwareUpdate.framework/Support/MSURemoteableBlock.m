@interface MSURemoteableBlock
- (MSURemoteableBlock)initWithProgressBlock:(id)a3;
- (void)_nsxpcInvoke:(id)a3 args:(id)a4 options:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)progress:(id)a3;
@end

@implementation MSURemoteableBlock

- (MSURemoteableBlock)initWithProgressBlock:(id)a3
{
  v4 = -[MSURemoteableBlock init](self, "init");
  result = 0LL;
  if (a3)
  {
    if (v4)
    {
      v4->_progressBlock = a3;
      v4->_progressBlock = _Block_copy(a3);
      return v4;
    }
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSURemoteableBlock;
  -[MSURemoteableBlock dealloc](&v3, "dealloc");
}

- (void)_nsxpcInvoke:(id)a3 args:(id)a4 options:(id)a5 completion:(id)a6
{
  if (a6)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not implemented",  a4,  a5,  "-[MSURemoteableBlock _nsxpcInvoke:args:options:completion:]",  NSDebugDescriptionErrorKey);
    (*((void (**)(id, NSError *, void))a6 + 2))( a6,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1300LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL)),  0LL);
  }

- (void)progress:(id)a3
{
  progressBlock = (void (**)(id, id))self->_progressBlock;
  if (progressBlock) {
    progressBlock[2](progressBlock, a3);
  }
}

@end