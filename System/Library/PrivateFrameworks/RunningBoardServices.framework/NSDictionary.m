@interface NSDictionary
@end

@implementation NSDictionary

void __62__NSDictionary_RunningBoard__entriesToStringWithIndent_debug___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v25 = a3;
  [a2 description];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    int v7 = *(_DWORD *)(a1 + 40);
    if (v7 >= 8) {
      int v7 = 8;
    }
    v8 = &_indentPrefix_tabs[8 - v7];
    id v9 = v25;
    [v6 appendFormat:@"%s%@={\n", v8, v5];
    v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    [v9 entriesToStringWithIndent:(*(_DWORD *)(a1 + 40) + 1) debug:*(unsigned __int8 *)(a1 + 44)];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 appendFormat:@"%@", v11];
    int v12 = *(_DWORD *)(a1 + 40);
    if (v12 >= 8) {
      int v12 = 8;
    }
    objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40),  "appendFormat:",  @"%s}\n",  &_indentPrefix_tabs[8 - v12],  v22,  v24);
  }

  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    int v15 = *(_DWORD *)(a1 + 40);
    if (v15 >= 8) {
      int v15 = 8;
    }
    v16 = &_indentPrefix_tabs[8 - v15];
    if ((isKindOfClass & 1) != 0)
    {
      id v17 = v25;
      [v14 appendFormat:@"%s%@=[\n", v16, v5];
      v18 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      v19 = -[NSArray elementsToString:debug:](v17, *(_DWORD *)(a1 + 40) + 1, *(_BYTE *)(a1 + 44));
      [v18 appendFormat:@"%@", v19];
      int v20 = *(_DWORD *)(a1 + 40);
      if (v20 >= 8) {
        int v20 = 8;
      }
      objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40),  "appendFormat:",  @"%s]\n",  &_indentPrefix_tabs[8 - v20],  v23,  v24);
    }

    else if (*(_BYTE *)(a1 + 44))
    {
      [v14 appendFormat:@"%s%@=%@\n", v16, v5, v25];
    }

    else
    {
      [v25 debugDescription];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 appendFormat:@"%s%@=%@\n", v16, v5, v21];
    }
  }
}

@end