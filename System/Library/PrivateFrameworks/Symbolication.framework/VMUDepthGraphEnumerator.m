@interface VMUDepthGraphEnumerator
- (VMUDepthGraphEnumerator)initWithGraph:(id)a3 depthGraph:(id)a4;
- (id)statusDisplayDescription;
- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUDepthGraphEnumerator

- (VMUDepthGraphEnumerator)initWithGraph:(id)a3 depthGraph:(id)a4
{
  v6 = (VMUDepthGraph *)a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VMUDepthGraphEnumerator;
  v7 = -[VMUGraphEnumerator initWithGraph:](&v10, sel_initWithGraph_, a3);
  depthGraph = v7->_depthGraph;
  v7->_depthGraph = v6;

  return v7;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned int v7 = -[VMUDepthGraph depthOfNode:](self->_depthGraph, "depthOfNode:", v4);
  v8 = -[VMUGraphEnumerator graph](self, "graph");
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __58__VMUDepthGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
  v10[3] = &unk_189DFE400;
  unsigned int v12 = v7;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 enumerateEdgesOfNode:v4 withBlock:v10];
}

uint64_t __58__VMUDepthGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) depthOfNode:a4];
  if ((_DWORD)result == *(_DWORD *)(a1 + 48) + 1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  return result;
}

- (id)statusDisplayDescription
{
  return @"deeper";
}

- (void).cxx_destruct
{
}

@end