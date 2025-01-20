@interface GTMTLReplaySharedBufferHeap
- (GTMTLReplaySharedBufferHeap)initWithBuffer:(id)a3 resourcePool:(id)a4;
- (id)buffer;
- (void)dealloc;
@end

@implementation GTMTLReplaySharedBufferHeap

- (GTMTLReplaySharedBufferHeap)initWithBuffer:(id)a3 resourcePool:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedBufferHeap;
  v9 = -[GTMTLReplaySharedBufferHeap init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_buffer, a3);
    objc_storeStrong((id *)&v10->_resourcePool, a4);
  }

  return v10;
}

- (id)buffer
{
  return self->_buffer;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedBufferHeap;
  -[GTMTLReplaySharedBufferHeap dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end