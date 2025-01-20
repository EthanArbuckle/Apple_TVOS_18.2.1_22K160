@interface VMUMutableFieldInfo
- (BOOL)replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5;
- (void)addSubField:(id)a3;
- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3 parentOffset:(unsigned int)a4;
- (void)setFlags:(unsigned int)a3;
- (void)setIsByref:(BOOL)a3;
- (void)setIsCapture:(BOOL)a3;
- (void)setIvarName:(id)a3;
- (void)setKind:(unsigned int)a3;
- (void)setOffset:(unsigned int)a3;
- (void)setScanType:(unsigned int)a3;
- (void)setScannableSize:(unsigned int)a3;
- (void)setSize:(unsigned int)a3;
- (void)setStride:(unsigned int)a3;
@end

@implementation VMUMutableFieldInfo

- (void)setIvarName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setIvarName:](&v3, sel__setIvarName_, a3);
}

- (void)setScanType:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setScanType:](&v3, sel__setScanType_, *(void *)&a3);
}

- (void)setOffset:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setOffset:](&v3, sel__setOffset_, *(void *)&a3);
}

- (void)setSize:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setSize:](&v3, sel__setSize_, *(void *)&a3);
}

- (void)setKind:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setKind:](&v3, sel__setKind_, *(void *)&a3);
}

- (void)setIsByref:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setFlags:](&v3, sel__setFlags_, -[VMUFieldInfo flags](self, "flags", a3) | 2);
}

- (void)setIsCapture:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setFlags:](&v3, sel__setFlags_, -[VMUFieldInfo flags](self, "flags", a3) | 1);
}

- (void)setFlags:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setFlags:](&v3, sel__setFlags_, *(void *)&a3);
}

- (void)setScannableSize:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setScannableSize:](&v3, sel__setScannableSize_, *(void *)&a3);
}

- (void)setStride:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableFieldInfo;
  -[VMUFieldInfo _setStride:](&v3, sel__setStride_, *(void *)&a3);
}

- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3 parentOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v6 = a3;
  v7 = -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v8 = -[VMUFieldInfo subFieldArray](self, "subFieldArray", 0LL);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void (*)(void *, id, uint64_t))v6[2];
          id v14 = *(id *)(*((void *)&v15 + 1) + 8 * v12);
          v13(v6, v14, v4);
          [v14 mutateTypeFieldsRecursivelyWithBlock:v6 parentOffset:[v14 offset] + v4];

          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }
  }
}

- (BOOL)replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];
  if (v11)
  {
    unint64_t v12 = v11;
    [v10 objectAtIndexedSubscript:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v14 = [v13 offset];
    if (a4 - (unint64_t)v14 < [v13 size])
    {
      unint64_t v15 = 0LL;
      BOOL v16 = 1;
LABEL_8:
      uint64_t v18 = a4 - v14;
      if ((_DWORD)v18 || ![v13 isEqual:v8])
      {
        [v13 subFieldArray];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19 || ([v13 replaceFieldRecursively:v8 atOffset:v18 withField:v9] & 1) == 0)
        {
          LOBYTE(a4) = 0;
          goto LABEL_16;
        }
      }

      else
      {
        [v10 setObject:v9 atIndexedSubscript:v15];
      }

      LOBYTE(a4) = 1;
LABEL_16:

      goto LABEL_17;
    }

    uint64_t v17 = 1LL;
    while (1)
    {

      if (v12 == v17) {
        break;
      }
      [v10 objectAtIndexedSubscript:v17];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v14 = [v13 offset];
      ++v17;
      if (a4 - (unint64_t)v14 < [v13 size])
      {
        unint64_t v15 = v17 - 1;
        BOOL v16 = v15 < v12;
        goto LABEL_8;
      }
    }
  }

  BOOL v16 = 0;
LABEL_17:

  return v16 & a4;
}

- (void)addSubField:(id)a3
{
  id v4 = a3;
  v5 = -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  if (!v5) {
    -[VMUFieldInfo initializeSubFieldArray](self, "initializeSubFieldArray");
  }
  -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v4];
}

@end