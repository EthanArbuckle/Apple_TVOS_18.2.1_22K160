@interface __NSSKGraphE
- (void)dealloc;
@end

@implementation __NSSKGraphE

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  free(self->_edges);
  unint64_t numV = self->_numV;
  if (numV)
  {
    uint64_t v4 = 24 * numV - 8;
    do
    {
      v5 = *(void **)((char *)&self->_vertices->var0 + v4);
      if (v5) {
        free(v5);
      }
      v4 -= 24LL;
      --numV;
    }

    while (numV);
  }

  free(self->_vertices);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSSKGraphE;
  -[__NSSKGraphE dealloc](&v6, sel_dealloc);
}

@end