@interface NSString
@end

@implementation NSString

void __80__NSString_LSVisualOrderingAdditions__ls_visuallyOrderCharactersReturningError___block_invoke( uint64_t a1,  uint64_t a2,  unint64_t a3)
{
  if (ubidi_open())
  {
    ubidi_setReorderingOptions();
    int v23 = 0;
    ubidi_setPara();
    memset(&__p, 0, sizeof(__p));
    if (a3)
    {
      std::vector<unsigned int>::__vallocate[abi:nn180100](&__p, a3);
      std::vector<int>::pointer end = __p.__end_;
      bzero(__p.__end_, 4 * a3);
      __p.__end_ = &end[a3];
    }

    ubidi_getVisualMap();
    if (v23 <= 0)
    {
      int ResultLength = ubidi_getResultLength();
      std::vector<int>::resize(&__p, ResultLength);
      [MEMORY[0x189607940] stringWithCapacity:a3];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        std::vector<int>::pointer begin = __p.__begin_;
        std::vector<int>::pointer v13 = __p.__end_;
        while (begin != v13)
          [v11 appendCharacters:a2 + 2 * *begin++ length:1];
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
        id v15 = v11;
        v16 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v15;
      }

      else
      {
        uint64_t v17 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -41LL,  (uint64_t)"-[NSString(LSVisualOrderingAdditions) ls_visuallyOrderCharactersReturningError:]_block_invoke",  837LL,  0LL);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
        v16 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;
      }
    }

    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }

    if (v23 >= 1)
    {
      uint64_t v19 = _LSMakeNSErrorImpl( @"Unicode",  v23,  (uint64_t)"-[NSString(LSVisualOrderingAdditions) ls_visuallyOrderCharactersReturningError:]_block_invoke",  844LL,  0LL);
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }

    ubidi_close();
  }

  else
  {
    uint64_t v7 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -41LL,  (uint64_t)"-[NSString(LSVisualOrderingAdditions) ls_visuallyOrderCharactersReturningError:]_block_invoke",  850LL,  0LL);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

void __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  if (_NSIsNSString())
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "ls_matchesStringForPluginQuery:",  v6);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      *a4 = 1;
    }
  }

  else
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke_cold_1(a1, v7);
    }
  }
}

void __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_183E58000, a2, OS_LOG_TYPE_DEBUG, "Cannot match invalid query %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end