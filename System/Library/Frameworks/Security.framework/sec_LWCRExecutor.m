@interface sec_LWCRExecutor
+ (id)executor;
- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4;
@end

@implementation sec_LWCRExecutor

- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke;
  aBlock[3] = &unk_189667D00;
  id v42 = v6;
  v39[0] = v7;
  v39[1] = 3221225472LL;
  v39[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2;
  v39[3] = &unk_189667D28;
  id v40 = v42;
  v37[0] = v7;
  v37[1] = 3221225472LL;
  v37[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3;
  v37[3] = &unk_189667D50;
  id v8 = v40;
  id v38 = v8;
  v43 = off_189667D80;
  v9 = v37;
  v10 = v39;
  id v44 = _Block_copy(aBlock);
  v11 = _Block_copy(v10);

  id v45 = v11;
  v12 = _Block_copy(v9);

  id v46 = v12;
  v36[0] = &v43;
  v36[1] = 0LL;
  *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v13 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&v50.runtime = *((_OWORD *)v5 + 3);
  *(_OWORD *)&v50.lookup.index_count = v13;
  *(_OWORD *)&v50.sorted = *((_OWORD *)v5 + 5);
  v50.var0.ccstate.der_end = (char *)*((void *)v5 + 12);
  if ((der_vm_context_is_valid() & 1) == 0)
  {
    BOOL v17 = 0;
    __int128 v35 = 0x12uLL;
    goto LABEL_32;
  }

  __int128 v14 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&v50.runtime = *((_OWORD *)v5 + 3);
  *(_OWORD *)&v50.lookup.index_count = v14;
  *(_OWORD *)&v50.sorted = *((_OWORD *)v5 + 5);
  v50.var0.ccstate.der_end = (char *)*((void *)v5 + 12);
  uint64_t v53 = 0LL;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  int v47 = 0;
  uint64_t v48 = 0LL;
  uint64_t v49 = 0LL;
  TLE::Executor::getDependentOpsFromDictionary((uint64_t)&v51, (uint64_t)v36, &v50);
  if ((_DWORD)v51)
  {
    LODWORD(v34) = v51;
    v16 = (void **)*((void *)&v52 + 1);
    __int128 v35 = (unint64_t)v52;
    if (!*((void *)&v52 + 1))
    {
LABEL_22:
      if ((_DWORD)v34)
      {
        BOOL v17 = 0;
        goto LABEL_32;
      }

      v27 = (void *)*((void *)&v35 + 1);
      v28 = (void (**)(TLE::AndOperation *__hidden))**((void **)&v35 + 1);
      goto LABEL_26;
    }

+ (id)executor
{
  return objc_alloc_init(&OBJC_CLASS___sec_LWCRExecutor);
}

@end