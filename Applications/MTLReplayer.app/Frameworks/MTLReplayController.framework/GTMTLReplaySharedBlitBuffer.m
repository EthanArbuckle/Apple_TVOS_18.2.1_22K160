@interface GTMTLReplaySharedBlitBuffer
- (BOOL)commitCommandBuffer;
- (BOOL)commitCommandBufferWithLog:(id)a3;
- (GTMTLReplaySharedBlitBuffer)bufferWithLength:(unint64_t)a3 alignment:(unint64_t)a4;
- (GTMTLReplaySharedBlitBuffer)initWithCommandQueue:(id)a3 resourcePool:(id)a4;
- (id)accelerationStructureCommandEncoder;
- (id)blitCommandEncoder;
- (id)commandBuffer;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourcePool;
- (void)clearCommandBuffer;
- (void)dealloc;
- (void)releaseBuffer;
@end

@implementation GTMTLReplaySharedBlitBuffer

- (GTMTLReplaySharedBlitBuffer)initWithCommandQueue:(id)a3 resourcePool:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedBlitBuffer;
  v9 = -[GTMTLReplaySharedBlitBuffer init](&v17, "init");
  if (v9)
  {
    v10 = (GTMTLReplaySharedResourcePool *)v8;
    v11 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 4LL);
    resourcePool = v9->_bufferArray.resourcePool;
    v9->_bufferArray.resourcePool = v10;

    retainArray = v9->_bufferArray.retainArray;
    v9->_bufferArray.retainArray = v11;

    v9->_bufferArray.bufferOffset = 0LL;
    objc_storeStrong((id *)&v9->_commandBuffer.commandQueue, a3);
    commandBuffer = v9->_commandBuffer.commandBuffer;
    v9->_commandBuffer.commandBuffer = 0LL;

    commandEncoder = v9->_commandBuffer.commandEncoder;
    v9->_commandBuffer.commandEncoder = 0LL;
  }

  return v9;
}

- (void)dealloc
{
  commandQueue = self->_commandBuffer.commandQueue;
  self->_commandBuffer.commandQueue = 0LL;

  resourcePool = self->_bufferArray.resourcePool;
  self->_bufferArray.resourcePool = 0LL;

  retainArray = self->_bufferArray.retainArray;
  self->_bufferArray.retainArray = 0LL;

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedBlitBuffer;
  -[GTMTLReplaySharedBlitBuffer dealloc](&v6, "dealloc");
}

- (GTMTLReplaySharedBlitBuffer)bufferWithLength:(unint64_t)a3 alignment:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_bufferArray.retainArray, "lastObject"));
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = (a4 + self->_bufferArray.bufferOffset - 1) & -(uint64_t)a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 buffer]);
    id v11 = [v10 length];
  }

  unint64_t v12 = -[GTMTLReplaySharedResourcePool defaultBufferCapacity](self->_bufferArray.resourcePool, "defaultBufferCapacity");
  unint64_t v13 = a3;
  if (v12 > a3) {
    unint64_t v13 = -[GTMTLReplaySharedResourcePool defaultBufferCapacity]( self->_bufferArray.resourcePool,  "defaultBufferCapacity",  a3);
  }
  id v8 = -[GTMTLReplaySharedResourcePool newBufferHeapWithLength:]( self->_bufferArray.resourcePool,  "newBufferHeapWithLength:",  v13);
  -[NSMutableArray addObject:](self->_bufferArray.retainArray, "addObject:", v8);
  unint64_t v9 = 0LL;
LABEL_7:
  self->_bufferArray.bufferOffset = v9 + a3;
  v14 = -[GTMTLReplaySharedBufferRange initWithHeap:range:]( objc_alloc(&OBJC_CLASS___GTMTLReplaySharedBufferRange),  "initWithHeap:range:",  v8,  v9,  a3);

  return (GTMTLReplaySharedBlitBuffer *)v14;
}

- (id)resourcePool
{
  return self->_bufferArray.resourcePool;
}

- (id)commandBuffer
{
  return SharedCommandBuffer_commandBuffer((uint64_t)&self->_commandBuffer);
}

- (id)blitCommandEncoder
{
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  v3 = self->_commandBuffer.commandEncoder;
  if (!v3) {
    goto LABEL_4;
  }
  v4 = v3;
  if ((-[MTLCommandEncoder conformsToProtocol:]( v3,  "conformsToProtocol:",  &OBJC_PROTOCOL___MTLBlitCommandEncoder) & 1) == 0)
  {
    -[MTLCommandEncoder endEncoding](v4, "endEncoding");

LABEL_4:
    id v5 = SharedCommandBuffer_commandBuffer((uint64_t)(p_commandEncoder - 2));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = InternalBlitCommandEncoder(v6, *(p_commandEncoder - 2));
    v4 = (MTLCommandEncoder *)objc_claimAutoreleasedReturnValue(v7);
    objc_storeStrong((id *)p_commandEncoder, v4);
  }

  return v4;
}

- (id)accelerationStructureCommandEncoder
{
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  v3 = self->_commandBuffer.commandEncoder;
  if (!v3) {
    goto LABEL_4;
  }
  v4 = v3;
  if ((-[MTLCommandEncoder conformsToProtocol:]( v3,  "conformsToProtocol:",  &OBJC_PROTOCOL___MTLAccelerationStructureCommandEncoder) & 1) == 0)
  {
    -[MTLCommandEncoder endEncoding](v4, "endEncoding");

LABEL_4:
    id v5 = SharedCommandBuffer_commandBuffer((uint64_t)(p_commandEncoder - 2));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = (MTLCommandEncoder *)objc_claimAutoreleasedReturnValue([v6 accelerationStructureCommandEncoder]);
    objc_storeStrong((id *)p_commandEncoder, v4);
  }

  return v4;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  objc_super v6 = self->_commandBuffer.commandEncoder;
  if (v6)
  {
    id v7 = v6;
    -[MTLCommandEncoder endEncoding](v6, "endEncoding");
  }

  id v8 = SharedCommandBuffer_commandBuffer((uint64_t)&self->_commandBuffer);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 renderCommandEncoderWithDescriptor:v4]);
  objc_storeStrong((id *)p_commandEncoder, v10);

  return v10;
}

- (BOOL)commitCommandBuffer
{
  return -[GTMTLReplaySharedBlitBuffer commitCommandBufferWithLog:](self, "commitCommandBufferWithLog:", g_activityLog);
}

- (BOOL)commitCommandBufferWithLog:(id)a3
{
  p_commandBuffer = &self->_commandBuffer;
  [a3 logSharedCommandBuffer:self->_commandBuffer.commandBuffer];
  id v5 = SharedBufferArray_retainArray((uint64_t)&self->_bufferArray);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v7 = self->_commandBuffer.commandBuffer;
  SharedCommandBuffer_clearCommandBuffer((uint64_t)p_commandBuffer);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __SharedCommandBuffer_commitCommandBuffer_block_invoke;
  v10[3] = &unk_58F0C0;
  id v11 = v6;
  id v8 = v6;
  -[MTLCommandBuffer addCompletedHandler:](v7, "addCompletedHandler:", v10);
  GTMTLReplay_commitCommandBuffer(v7);

  return v7 != 0LL;
}

- (void)clearCommandBuffer
{
  id v3 = SharedBufferArray_retainArray((uint64_t)&self->_bufferArray);
  SharedCommandBuffer_clearCommandBuffer((uint64_t)&self->_commandBuffer);
}

- (void)releaseBuffer
{
}

- (void).cxx_destruct
{
}

@end