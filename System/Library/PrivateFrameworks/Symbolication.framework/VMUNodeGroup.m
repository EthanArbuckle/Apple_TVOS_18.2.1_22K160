@interface VMUNodeGroup
- (NSString)name;
- (VMUNodeGroup)initWithName:(id)a3 graph:(id)a4;
- (int64_t)count;
- (void)_createGroup;
- (void)addNode:(unsigned int)a3;
- (void)dealloc;
- (void)enumerateNodesWithBlock:(id)a3;
- (void)nodes;
@end

@implementation VMUNodeGroup

- (VMUNodeGroup)initWithName:(id)a3 graph:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [v6 nodeNamespaceSize];

  self->_nodeNamespaceSize = v7;
  self->_singleNode = -1;
  return self;
}

- (void)dealloc
{
  group = self->_group;
  if (group) {
    free(group);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUNodeGroup;
  -[VMUNodeGroup dealloc](&v4, sel_dealloc);
}

- (void)_createGroup
{
  if (!self->_group)
  {
    unsigned int nodeNamespaceSize = self->_nodeNamespaceSize;
    objc_super v4 = calloc(1uLL, ((nodeNamespaceSize + 7) >> 3) + 4);
    *objc_super v4 = nodeNamespaceSize;
    self->_group = v4;
    unint64_t count = self->_count;
    if ((_DWORD)count)
    {
      for (unint64_t i = 0LL; i < count; ++i)
      {
        group = self->_group;
        unint64_t v8 = self->_inlineNodes[i];
        if (*group > v8)
        {
          *((_BYTE *)group + (v8 >> 3) + 4) |= 1 << (v8 & 7);
          unint64_t count = self->_count;
        }
      }
    }
  }

- (void)addNode:(unsigned int)a3
{
  if (!self->_group)
  {
    unsigned int count = self->_count;
    if (count <= 0xF)
    {
      if (count)
      {
        inlineNodes = self->_inlineNodes;
        uint64_t v7 = self->_count;
        while (1)
        {
          int v8 = *inlineNodes++;
          if (v8 == a3) {
            return;
          }
          if (!--v7)
          {
            uint64_t v9 = self->_count;
            goto LABEL_14;
          }
        }
      }

      uint64_t v9 = 0LL;
LABEL_14:
      self->_unsigned int count = count + 1;
      p_singleNode = &self->_inlineNodes[v9];
LABEL_15:
      unsigned int *p_singleNode = a3;
      return;
    }
  }

  -[VMUNodeGroup _createGroup](self, "_createGroup");
  group = (unsigned int *)self->_group;
  if (*group > a3)
  {
    uint64_t v11 = (a3 >> 3) + 4LL;
    int v12 = *((unsigned __int8 *)group + v11);
    int v13 = 1 << (a3 & 7);
    if ((v13 & v12) != 0) {
      return;
    }
    *((_BYTE *)group + v11) = v12 | v13;
  }

  unsigned int v14 = self->_count;
  self->_unsigned int count = v14 + 1;
  if (!v14)
  {
    p_singleNode = &self->_singleNode;
    goto LABEL_15;
  }

- (void)nodes
{
  return self->_group;
}

- (int64_t)count
{
  return self->_count;
}

- (void)enumerateNodesWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  group = (unsigned int *)self->_group;
  if (group)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v16 = __40__VMUNodeGroup_enumerateNodesWithBlock___block_invoke;
    v17 = &unk_189DFFF38;
    id v18 = v4;
    uint64_t v7 = v15;
    unsigned int v8 = *group;
    if (*group)
    {
      uint64_t v9 = 0LL;
      do
      {
        v10 = (char *)group + (v9 >> 3);
        unsigned int v11 = v10[4];
        uint64_t v12 = v9;
        if (v10[4])
        {
          do
          {
            if ((v11 & 1) != 0) {
              ((void (*)(void *, uint64_t))v16)(v7, v12);
            }
            if (v11 < 2) {
              break;
            }
            uint64_t v12 = (v12 + 1);
            v11 >>= 1;
          }

          while (v12 < v8);
        }

        uint64_t v9 = (v9 + 8);
      }

      while (v9 < v8);
    }
  }

  else if (self->_count)
  {
    unint64_t v13 = 0LL;
    do
    {
      unsigned int v14 = (void *)MEMORY[0x186E32E40]();
      char v19 = 0;
      ((void (**)(void, void, char *))v5)[2](v5, self->_inlineNodes[v13], &v19);
      objc_autoreleasePoolPop(v14);
      ++v13;
    }

    while (v13 < self->_count);
  }
}

void __40__VMUNodeGroup_enumerateNodesWithBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E32E40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void).cxx_destruct
{
}

@end