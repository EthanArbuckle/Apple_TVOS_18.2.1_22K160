@interface VMUMutableClassInfo
- (void)addComplexAction:(id)a3 withEvaluator:(id)a4;
- (void)addVariant:(id)a3 forField:(id)a4 withEvaluator:(id)a5;
- (void)addVariantRecursively:(id)a3 forField:(id)a4 atOffset:(unsigned int)a5 withEvaluator:(id)a6;
- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3;
- (void)mutateTypeFieldsWithBlock:(id)a3;
- (void)setBinaryPath:(id)a3;
- (void)setDefaultScanType:(unsigned int)a3;
- (void)setDisplayName:(id)a3;
- (void)setInfoType:(unsigned int)a3;
- (void)setInstanceSize:(unsigned int)a3;
- (void)setIsCoreMediaFigObject:(BOOL)a3;
- (void)setIsRootClass:(BOOL)a3;
- (void)setSuperclassInfo:(id)a3;
- (void)setVariantScanType:(unsigned int)a3 withEvaluator:(id)a4;
@end

@implementation VMUMutableClassInfo

- (void)setDisplayName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setDisplayName:](&v3, sel__setDisplayName_, a3);
}

- (void)setBinaryPath:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setBinaryPath:sanitize:](&v3, sel__setBinaryPath_sanitize_, a3, 1LL);
}

- (void)setSuperclassInfo:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setSuperclassInfo:](&v3, sel__setSuperclassInfo_, a3);
}

- (void)setIsCoreMediaFigObject:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setIsCoreMediaFigObject:](&v3, sel__setIsCoreMediaFigObject_, a3);
}

- (void)setDefaultScanType:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setDefaultScanType:](&v3, sel__setDefaultScanType_, *(void *)&a3);
}

- (void)setInstanceSize:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setInstanceSize:](&v3, sel__setInstanceSize_, *(void *)&a3);
}

- (void)setIsRootClass:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setIsRootClass:](&v3, sel__setIsRootClass_, a3);
}

- (void)setInfoType:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _setInfoType:](&v3, sel__setInfoType_, *(void *)&a3);
}

- (void)mutateTypeFieldsWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __49__VMUMutableClassInfo_mutateTypeFieldsWithBlock___block_invoke;
  v6[3] = &unk_189DFE9E8;
  id v7 = v4;
  id v5 = v4;
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v6);
}

uint64_t __49__VMUMutableClassInfo_mutateTypeFieldsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __60__VMUMutableClassInfo_mutateTypeFieldsRecursivelyWithBlock___block_invoke;
  v6[3] = &unk_189DFE9E8;
  id v7 = v4;
  id v5 = v4;
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v6);
}

void __60__VMUMutableClassInfo_mutateTypeFieldsRecursivelyWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  [v3 mutateTypeFieldsRecursivelyWithBlock:^(id v3, int v3) {
    *(void *)(v3 + 32) = *(void *)(a1 + 32);
    *(void *)(v3 + 32) = [v3 offset];
}];
}

- (void)addVariant:(id)a3 forField:(id)a4 withEvaluator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __57__VMUMutableClassInfo_addVariant_forField_withEvaluator___block_invoke;
  v15[3] = &unk_189DFEA10;
  id v10 = v9;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v12 = a5;
  v13 = (void *)MEMORY[0x186E33044](v15);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _addVariantAction:withEvaluator:](&v14, sel__addVariantAction_withEvaluator_, v13, v12);
}

void __57__VMUMutableClassInfo_addVariant_forField_withEvaluator___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    v7[0] = *(void *)(a1 + 40);
    [MEMORY[0x189603F18] arrayWithObjects:v7 count:1];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 replaceField:v4 withFields:v5];
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [MEMORY[0x189603F18] arrayWithObjects:&v6 count:1];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addFields:v5];
  }
}

- (void)addVariantRecursively:(id)a3 forField:(id)a4 atOffset:(unsigned int)a5 withEvaluator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __77__VMUMutableClassInfo_addVariantRecursively_forField_atOffset_withEvaluator___block_invoke;
  v17[3] = &unk_189DFEA38;
  id v12 = v11;
  id v18 = v12;
  unsigned int v20 = a5;
  id v13 = v10;
  id v19 = v13;
  id v14 = a6;
  v15 = (void *)MEMORY[0x186E33044](v17);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _addVariantAction:withEvaluator:](&v16, sel__addVariantAction_withEvaluator_, v15, v14);
}

void __77__VMUMutableClassInfo_addVariantRecursively_forField_atOffset_withEvaluator___block_invoke( uint64_t a1,  void *a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    [v3 _replaceFieldRecursively:v5 atOffset:*(unsigned int *)(a1 + 48) withField:*(void *)(a1 + 40)];
  }

  else
  {
    v7[0] = *(void *)(a1 + 40);
    [MEMORY[0x189603F18] arrayWithObjects:v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addFields:v6];
  }
}

- (void)addComplexAction:(id)a3 withEvaluator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _addComplexAction:withEvaluator:](&v4, sel__addComplexAction_withEvaluator_, a3, a4);
}

- (void)setVariantScanType:(unsigned int)a3 withEvaluator:(id)a4
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __56__VMUMutableClassInfo_setVariantScanType_withEvaluator___block_invoke;
  v8[3] = &__block_descriptor_36_e29_v16__0__VMUMutableClassInfo_8l;
  unsigned int v9 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x186E33044](v8);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VMUMutableClassInfo;
  -[VMUClassInfo _addVariantAction:withEvaluator:](&v7, sel__addVariantAction_withEvaluator_, v6, v5);
}

uint64_t __56__VMUMutableClassInfo_setVariantScanType_withEvaluator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDefaultScanType:*(unsigned int *)(a1 + 32)];
}

@end