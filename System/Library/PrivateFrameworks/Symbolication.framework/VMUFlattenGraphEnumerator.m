@interface VMUFlattenGraphEnumerator
- (VMUFlattenGraphEnumerator)initWithGraph:(id)a3 graphEnumerator:(id)a4;
- (id)statusDisplayDescription;
- (void)dealloc;
- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUFlattenGraphEnumerator

- (VMUFlattenGraphEnumerator)initWithGraph:(id)a3 graphEnumerator:(id)a4
{
  v6 = (VMUGraphEnumerator *)a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VMUFlattenGraphEnumerator;
  v7 = -[VMUGraphEnumerator initWithGraph:](&v14, sel_initWithGraph_, a3);
  graphEnumerator = v7->_graphEnumerator;
  v7->_graphEnumerator = v6;
  v9 = -[VMUGraphEnumerator graph](v7, "graph");
  LODWORD(v6) = [v9 nodeNamespaceSize];
  v10 = calloc(1uLL, (((_DWORD)v6 + 7) >> 3) + 4);
  _DWORD *v10 = (_DWORD)v6;
  v7->_deliveredReachable = v10;
  v11 = -[VMUGraphEnumerator graph](v7, "graph");
  LODWORD(v6) = [v11 nodeNamespaceSize];
  v12 = calloc(1uLL, (((_DWORD)v6 + 7) >> 3) + 4);
  _DWORD *v12 = (_DWORD)v6;
  v7->_topLevel = v12;

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUFlattenGraphEnumerator;
  -[VMUFlattenGraphEnumerator dealloc](&v3, sel_dealloc);
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!self->_iteratingTopLevel)
  {
    deliveredReachable = (unsigned int *)self->_deliveredReachable;
    if (*deliveredReachable <= a3
      || (uint64_t v9 = (a3 >> 3) + 4LL,
          int v10 = *((unsigned __int8 *)deliveredReachable + v9),
          int v11 = 1 << (a3 & 7),
          (v11 & v10) == 0)
      || (v12 = (unsigned int *)self->_topLevel, *v12 > a3) && (v11 & *((_BYTE *)v12 + v9)) != 0)
    {
      v45 = v6;
      self->_iteratingTopLevel = 1;
      v13 = -[VMUGraphEnumerator graph](self, "graph");
      int v14 = [v13 nodeNamespaceSize];
      v15 = calloc(1uLL, ((v14 + 7) >> 3) + 4);
      _DWORD *v15 = v14;

      uint64_t v57 = 0LL;
      v58 = &v57;
      uint64_t v59 = 0x2020000000LL;
      uint64_t v60 = 0LL;
      v16 = -[VMUGraphEnumerator graph](self, "graph");
      size_t v17 = 4 * [v16 nodeNamespaceSize];
      v18 = (unsigned int *)malloc(v17);
      __pattern4[0] = -1;
      memset_pattern4(v18, __pattern4, v17);

      v19 = v58;
      uint64_t v20 = v58[3];
      uint64_t v21 = v20 + 1;
      v58[3] = v20 + 1;
      v18[v20] = a3;
      uint64_t v22 = MEMORY[0x1895F87A8];
      if ((v20 & 0x8000000000000000LL) == 0)
      {
        while (1)
        {
          uint64_t v23 = v21 - 1;
          v19[3] = v23;
          unint64_t v24 = v18[v23];
          uint64_t v25 = (v24 >> 3) + 4;
          int v26 = *((unsigned __int8 *)v15 + v25);
          int v27 = 1 << (v24 & 7);
          if ((v27 & v26) == 0) {
            break;
          }
LABEL_11:
          uint64_t v21 = v19[3];
          if (v21 <= 0) {
            goto LABEL_12;
          }
        }

        *((_BYTE *)v15 + v25) = v26 | v27;
LABEL_10:
        graphEnumerator = self->_graphEnumerator;
        uint64_t v51 = v22;
        uint64_t v52 = 3221225472LL;
        v53 = __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
        v54 = &unk_189DFE388;
        v55 = &v57;
        v56 = v18;
        -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](graphEnumerator, "enumerateEdgesOfNode:withBlock:");
        v19 = v58;
        goto LABEL_11;
      }

uint64_t __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  int a4)
{
  uint64_t v4 = *(void *)(result + 40);
  uint64_t v5 = *(void *)(*(void *)(result + 32) + 8LL);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  *(_DWORD *)(v4 + 4 * v6) = a4;
  return result;
}

uint64_t __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke_2( uint64_t result,  int a2)
{
  char v2 = 0;
  if (*(_DWORD *)(result + 40) != a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

- (id)statusDisplayDescription
{
  return @"flatten";
}

- (void).cxx_destruct
{
}

@end