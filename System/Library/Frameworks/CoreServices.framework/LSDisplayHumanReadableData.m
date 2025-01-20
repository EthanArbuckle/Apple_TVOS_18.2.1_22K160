@interface LSDisplayHumanReadableData
@end

@implementation LSDisplayHumanReadableData

void ___LSDisplayHumanReadableData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  v4 = (void *)MEMORY[0x186E2A59C]();
  [*(id *)(a1 + 32) descriptionOfUnit:a2 inTable:*(unsigned int *)(a1 + 72)];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(unsigned int *)(a1 + 72);
    int v10 = *(_DWORD *)(a1 + 76);
    v55 = *(FILE **)(a1 + 64);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v50 = v5;
    id v54 = v5;
    id v52 = v7;
    id v12 = v8;
    v51 = (void *)MEMORY[0x186E2A59C]();
    v53 = v12;
    if (!v12 || (id v56 = v54, objc_msgSend(v12, "evaluateWithObject:")))
    {
      if ((v10 & 0x10) != 0)
      {
        id v56 = v54;
        id v36 = v52;
        id v37 = objc_alloc_init(MEMORY[0x189603FC8]);
        if (v36) {
          uint64_t v38 = [v36 count];
        }
        else {
          uint64_t v38 = -1LL;
        }
        v39 = (void *)MEMORY[0x18960DD78];
        uint64_t v61 = MEMORY[0x1895F87A8];
        uint64_t v62 = 3221225472LL;
        uint64_t v63 = (uint64_t)___ZN14LaunchServices21DatabaseVisualizationL34getPropertyListFromUnitDescriptionEjjP18NSAttributedStringP5NSSetIP8NSStringE_block_invoke;
        v64 = (__n128 (*)(__n128 *, __n128 *))&unk_189D75938;
        v40 = (void (*)(uint64_t))v36;
        v65 = v40;
        v41 = (char *)v37;
        v66 = v41;
        __p = (void *)v38;
        [v39 enumerateValuesForTitlesInDescription:v56 block:&v61];
        [MEMORY[0x189607968] numberWithUnsignedInt:v9];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 setObject:v42 forKeyedSubscript:@"tableID"];

        [MEMORY[0x189607968] numberWithUnsignedInt:a2];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 setObject:v43 forKeyedSubscript:@"unitID"];

        v44 = (char *)v66;
        v45 = v41;

        [MEMORY[0x1896078D8] dataWithJSONObject:v45 options:0 error:0];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          if (!*(_BYTE *)(v11 + 24)) {
            fputc(44, v55);
          }
          *(_BYTE *)(v11 + 24) = 0;
          id v47 = v46;
          fwrite((const void *)[v47 bytes], 1uLL, objc_msgSend(v47, "length"), v55);
        }
      }

      else
      {
        CSStore2::AttributedStringWriter::Separator((CSStore2::AttributedStringWriter *)0x2D, 0LL, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v55;
        objc_msgSend(v14, "cs_writeToFileHandle:", v55);

        fputc(10, v55);
        id v56 = v54;
        if (v53)
        {
          v49 = v4;
          id v16 = (id)[v54 mutableCopy];
          uint64_t v17 = MEMORY[0x186E2A59C]();
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          id v56 = v16;
          objc_msgSend(v16, "cs_rangesMatchingPredicate:", v53);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          context = (void *)v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:&v61 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v58;
            uint64_t v21 = *MEMORY[0x18960DF30];
            uint64_t v22 = *MEMORY[0x18960DF20];
            do
            {
              for (uint64_t i = 0LL; i != v19; ++i)
              {
                if (*(void *)v58 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v24 = [*(id *)(*((void *)&v57 + 1) + 8 * i) rangeValue];
                uint64_t v26 = v25;
                objc_msgSend(v56, "addAttribute:value:range:", v21, &unk_189DA80E0, v24, v25);
                objc_msgSend(v56, "addAttribute:value:range:", v22, &unk_189DA80F8, v24, v26);
              }

              uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:&v61 count:16];
            }

            while (v19);
          }

          v4 = v49;
          objc_autoreleasePoolPop(context);

          v15 = v55;
        }

        if (v52)
        {
          uint64_t v27 = [v52 count];
          uint64_t v61 = 0LL;
          uint64_t v62 = (uint64_t)&v61;
          uint64_t v63 = 0x4812000000LL;
          v64 = __Block_byref_object_copy__54;
          v65 = __Block_byref_object_dispose__55;
          v66 = "";
          __p = 0LL;
          v68 = 0LL;
          uint64_t v69 = 0LL;
          v28 = (void *)MEMORY[0x18960DD78];
          *(void *)&__int128 v57 = MEMORY[0x1895F87A8];
          *((void *)&v57 + 1) = 3221225472LL;
          *(void *)&__int128 v58 = ___ZN14LaunchServices21DatabaseVisualizationL20writeUnitDescriptionEP7__sFILEjjP18NSAttributedStringP5NSSetIP8NSStringEP11NSPredicatejPb_block_invoke;
          *((void *)&v58 + 1) = &unk_189D75910;
          *(void *)&__int128 v59 = v52;
          *((void *)&v59 + 1) = &v61;
          *(void *)&__int128 v60 = v27;
          uint64_t v29 = [v28 enumerateValuesForTitlesInDescription:v56 block:&v57];
          v30 = *(uint64_t **)(v62 + 48);
          v31 = *(uint64_t **)(v62 + 56);
          while (v30 != v31)
          {
            uint64_t v32 = *v30;
            uint64_t v33 = v30[1];
            v34 = (void *)MEMORY[0x186E2A59C](v29);
            objc_msgSend(v56, "attributedSubstringFromRange:", v32, v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "cs_writeToFileHandle:", v55);
            fputc(10, v55);

            objc_autoreleasePoolPop(v34);
            v30 += 2;
          }

          _Block_object_dispose(&v61, 8);
          if (__p)
          {
            v68 = __p;
            operator delete(__p);
          }
        }

        else
        {
          objc_msgSend(v56, "cs_writeToFileHandle:", v15);
          fputc(10, v55);
        }
      }
    }

    objc_autoreleasePoolPop(v51);

    v6 = v50;
  }

  objc_autoreleasePoolPop(v4);
}

@end