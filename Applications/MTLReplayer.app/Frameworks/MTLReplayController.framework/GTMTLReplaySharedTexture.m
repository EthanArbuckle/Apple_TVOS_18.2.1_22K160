@interface GTMTLReplaySharedTexture
- (GTMTLReplaySharedTexture)initWithAllocatedSize:(unint64_t)a3 resourcePool:(id)a4;
- (void)dealloc;
@end

@implementation GTMTLReplaySharedTexture

- (GTMTLReplaySharedTexture)initWithAllocatedSize:(unint64_t)a3 resourcePool:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedTexture;
  v8 = -[GTMTLReplaySharedTexture init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_allocatedSize = a3;
    objc_storeStrong((id *)&v8->_resourcePool, a4);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedTexture;
  -[GTMTLReplaySharedTexture dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end