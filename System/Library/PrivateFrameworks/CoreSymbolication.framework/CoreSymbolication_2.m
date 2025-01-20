__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( __int128 *result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  v3 = *a2;
  v4 = *a3;
  if (*a2 >= *(void *)result)
  {
    if (v4 < v3)
    {
      v10 = *(_OWORD *)a2;
      v11 = *((_OWORD *)a2 + 1);
      v12 = a2[4];
      v13 = a3[4];
      v14 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v14;
      a2[4] = v13;
      a3[4] = v12;
      *(_OWORD *)a3 = v10;
      *((_OWORD *)a3 + 1) = v11;
      if (*a2 < *(void *)result)
      {
        v15 = *result;
        v16 = result[1];
        v17 = *((void *)result + 4);
        v18 = a2[4];
        v19 = *((_OWORD *)a2 + 1);
        *result = *(_OWORD *)a2;
        result[1] = v19;
        *((void *)result + 4) = v18;
        a2[4] = v17;
        *(_OWORD *)a2 = v15;
        *((_OWORD *)a2 + 1) = v16;
      }
    }
  }

  else
  {
    if (v4 >= v3)
    {
      v20 = *result;
      v21 = result[1];
      v22 = *((void *)result + 4);
      v23 = a2[4];
      v24 = *((_OWORD *)a2 + 1);
      *result = *(_OWORD *)a2;
      result[1] = v24;
      *((void *)result + 4) = v23;
      a2[4] = v22;
      *(_OWORD *)a2 = v20;
      *((_OWORD *)a2 + 1) = v21;
      if (*a3 >= *a2) {
        return result;
      }
      v5 = *(_OWORD *)a2;
      v6 = *((_OWORD *)a2 + 1);
      v7 = a2[4];
      v25 = a3[4];
      v26 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v26;
      a2[4] = v25;
    }

    else
    {
      v5 = *result;
      v6 = result[1];
      v7 = *((void *)result + 4);
      v8 = a3[4];
      v9 = *((_OWORD *)a3 + 1);
      *result = *(_OWORD *)a3;
      result[1] = v9;
      *((void *)result + 4) = v8;
    }

    a3[4] = v7;
    *(_OWORD *)a3 = v5;
    *((_OWORD *)a3 + 1) = v6;
  }

  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 40);
      if (*(void *)(a2 - 40) < *(void *)a1)
      {
        __int128 v7 = *(_OWORD *)a1;
        __int128 v8 = *(_OWORD *)(a1 + 16);
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a2 - 8);
        __int128 v11 = *(_OWORD *)(a2 - 24);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v11;
        *(void *)(a1 + 32) = v10;
        *(void *)(a2 - 8) = v9;
        __int128 *v6 = v7;
        *(_OWORD *)(a2 - 24) = v8;
      }

      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)a1,  (unint64_t *)(a1 + 40),  (unint64_t *)(a2 - 40));
      return 1LL;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( a1,  a1 + 40,  a1 + 80,  a2 - 40);
      return 1LL;
    case 5uLL:
      v21 = (void *)(a1 + 40);
      v22 = (void *)(a1 + 80);
      v23 = (__int128 *)(a1 + 120);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( a1,  a1 + 40,  a1 + 80,  a1 + 120);
      unint64_t v25 = *(void *)(a2 - 40);
      uint64_t v24 = a2 - 40;
      if (v25 >= *(void *)(a1 + 120)) {
        return 1LL;
      }
      __int128 v26 = *v23;
      __int128 v27 = *(_OWORD *)(a1 + 136);
      uint64_t v28 = *(void *)(a1 + 152);
      uint64_t v29 = *(void *)(v24 + 32);
      __int128 v30 = *(_OWORD *)(v24 + 16);
      __int128 *v23 = *(_OWORD *)v24;
      *(_OWORD *)(a1 + 136) = v30;
      *(void *)(a1 + 152) = v29;
      *(void *)(v24 + 32) = v28;
      *(_OWORD *)uint64_t v24 = v26;
      *(_OWORD *)(v24 + 16) = v27;
      if (*(void *)v23 >= *v22) {
        return 1LL;
      }
      uint64_t v31 = *(void *)(a1 + 112);
      __int128 v33 = *(_OWORD *)v22;
      __int128 v32 = *(_OWORD *)(a1 + 96);
      __int128 v34 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)v22 = *v23;
      *(_OWORD *)(a1 + 96) = v34;
      *(void *)(a1 + 112) = *(void *)(a1 + 152);
      __int128 *v23 = v33;
      *(_OWORD *)(a1 + 136) = v32;
      *(void *)(a1 + 152) = v31;
      if (*v22 >= *v21) {
        return 1LL;
      }
      uint64_t v35 = *(void *)(a1 + 72);
      __int128 v37 = *(_OWORD *)v21;
      __int128 v36 = *(_OWORD *)(a1 + 56);
      __int128 v38 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)v21 = *(_OWORD *)v22;
      *(_OWORD *)(a1 + 56) = v38;
      *(void *)(a1 + 72) = *(void *)(a1 + 112);
      *(_OWORD *)v22 = v37;
      *(_OWORD *)(a1 + 96) = v36;
      *(void *)(a1 + 112) = v35;
      if (*(void *)(a1 + 40) >= *(void *)a1) {
        return 1LL;
      }
      uint64_t v39 = *(void *)(a1 + 32);
      __int128 v41 = *(_OWORD *)a1;
      __int128 v40 = *(_OWORD *)(a1 + 16);
      __int128 v42 = *(_OWORD *)(a1 + 56);
      *(_OWORD *)a1 = *(_OWORD *)v21;
      *(_OWORD *)(a1 + 16) = v42;
      *(void *)(a1 + 32) = *(void *)(a1 + 72);
      *(_OWORD *)v21 = v41;
      *(_OWORD *)(a1 + 56) = v40;
      BOOL result = 1LL;
      *(void *)(a1 + 72) = v39;
      return result;
    default:
      v12 = (void *)(a1 + 80);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)a1,  (unint64_t *)(a1 + 40),  (unint64_t *)(a1 + 80));
      uint64_t v13 = a1 + 120;
      if (a1 + 120 == a2) {
        return 1LL;
      }
      uint64_t v14 = 0LL;
      int v15 = 0;
      break;
  }

  while (1)
  {
    unint64_t v16 = *(void *)v13;
    if (*(void *)v13 < *v12)
    {
      __int128 v43 = *(_OWORD *)(v13 + 8);
      __int128 v44 = *(_OWORD *)(v13 + 24);
      uint64_t v17 = v14;
      while (1)
      {
        uint64_t v18 = a1 + v17;
        __int128 v19 = *(_OWORD *)(a1 + v17 + 96);
        *(_OWORD *)(v18 + 120) = *(_OWORD *)(a1 + v17 + 80);
        *(_OWORD *)(v18 + 136) = v19;
        *(void *)(v18 + 152) = *(void *)(a1 + v17 + 112);
        if (v17 == -80) {
          break;
        }
        v17 -= 40LL;
        if (v16 >= *(void *)(v18 + 40))
        {
          uint64_t v20 = a1 + v17 + 120;
          goto LABEL_13;
        }
      }

      uint64_t v20 = a1;
LABEL_13:
      *(void *)uint64_t v20 = v16;
      *(_OWORD *)(v20 + 8) = v43;
      *(_OWORD *)(v20 + 24) = v44;
      if (++v15 == 8) {
        return v13 + 40 == a2;
      }
    }

    v12 = (void *)v13;
    v14 += 40LL;
    v13 += 40LL;
    if (v13 == a2) {
      return 1LL;
    }
  }

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)a4 < *(void *)a3)
  {
    __n128 result = *(__n128 *)a3;
    __int128 v9 = *(_OWORD *)(a3 + 16);
    uint64_t v10 = *(void *)(a3 + 32);
    uint64_t v11 = *(void *)(a4 + 32);
    __int128 v12 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)(a3 + 16) = v12;
    *(void *)(a3 + 32) = v11;
    *(void *)(a4 + 32) = v10;
    *(__n128 *)a4 = result;
    *(_OWORD *)(a4 + 16) = v9;
    if (*(void *)a3 < *(void *)a2)
    {
      __n128 result = *(__n128 *)a2;
      __int128 v13 = *(_OWORD *)(a2 + 16);
      uint64_t v14 = *(void *)(a2 + 32);
      uint64_t v15 = *(void *)(a3 + 32);
      __int128 v16 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 16) = v16;
      *(void *)(a2 + 32) = v15;
      *(void *)(a3 + 32) = v14;
      *(__n128 *)a3 = result;
      *(_OWORD *)(a3 + 16) = v13;
      if (*(void *)a2 < *(void *)a1)
      {
        __n128 result = *(__n128 *)a1;
        __int128 v17 = *(_OWORD *)(a1 + 16);
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(a2 + 32);
        __int128 v20 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v20;
        *(void *)(a1 + 32) = v19;
        *(void *)(a2 + 32) = v18;
        *(__n128 *)a2 = result;
        *(_OWORD *)(a2 + 16) = v17;
      }
    }
  }

  return result;
}

void *std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    v6 = result;
    __n128 result = std::vector<mapped_memory_core_file_dumped_region_info_t>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_186080420(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *std::vector<mapped_memory_core_file_dumped_region_info_t>::__vallocate[abi:ne180100]( void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppDyldSplitSharedCacheMemory::CacheMemoryAndPath>>( (uint64_t)(a1 + 2),  a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

uint64_t *std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100]( uint64_t *a1, uint64_t a2)
{
  a1[2] = 0LL;
  a1[1] = 0LL;
  *a1 = (uint64_t)(a1 + 1);
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *> *,long>>>( a1,  *(unsigned int **)a2,  (unsigned int *)(a2 + 8));
  return a1;
}

void sub_1860804C8(_Unwind_Exception *a1)
{
}

uint64_t *std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *> *,long>>>( uint64_t *result, unsigned int *a2, unsigned int *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      __n128 result = std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>( v5,  v6,  v4 + 8,  v4 + 8);
      uint64_t v7 = (unsigned int *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          size_t v8 = v7;
          uint64_t v7 = *(unsigned int **)v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          size_t v8 = (unsigned int *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
          uint64_t v4 = v8;
        }

        while (!v9);
      }

      uint64_t v4 = v8;
    }

    while (v8 != a3);
  }

  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>( uint64_t **a1, uint64_t *a2, unsigned int *a3, _DWORD *a4)
{
  v6 = (uint64_t **)std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__find_equal<unsigned int>( a1,  a2,  &v10,  &v9,  a3);
  __n128 result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__construct_node<std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>( (uint64_t)a1,  a4,  (uint64_t)&v8);
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }

  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__find_equal<unsigned int>( void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned int *a5)
{
  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, unsigned int v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    size_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }

      else
      {
        *a3 = a2;
        return a2;
      }
    }

    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }

      while (v9);
    }

    else
    {
      __int128 v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        __int128 v13 = v10;
      }

      while (v14);
    }

    unsigned int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          __int128 v17 = (uint64_t *)v16;
          unsigned int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }

        if (v18 >= v15) {
          break;
        }
        v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }

      while (v16);
    }

    else
    {
      __int128 v17 = a1 + 1;
    }

uint64_t *std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__construct_node<std::pair<unsigned int const,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&>@<X0>( uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  unsigned int v6 = operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *a2;
  *((_DWORD *)v6 + 10) = a2[2];
  __n128 result = std::map<int,std::vector<unsigned char>>::map[abi:ne180100]((uint64_t *)v6 + 6, (uint64_t)(a2 + 4));
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_186080800(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,void *>>>::operator()[abi:ne180100]( v3,  v2);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100]( uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 24) = 0;
  std::__optional_storage_base<CSCppCoreFileRegionsTree,false>::__construct_from[abi:ne180100]<std::__optional_copy_base<CSCppCoreFileRegionsTree,false> const&>( (void *)a1,  a2);
  return a1;
}

void sub_186080850( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (*(_BYTE *)(v10 + 24))
  {
    a10 = v10;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  }

  _Unwind_Resume(exception_object);
}

void *std::__optional_storage_base<CSCppCoreFileRegionsTree,false>::__construct_from[abi:ne180100]<std::__optional_copy_base<CSCppCoreFileRegionsTree,false> const&>( void *result, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 24))
  {
    v2 = result;
    *__n128 result = 0LL;
    result[1] = 0LL;
    result[2] = 0LL;
    __n128 result = std::vector<CSCppCoreFileRegionInfo>::__init_with_size[abi:ne180100]<CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>( result,  *(void *)a2,  *(void *)(a2 + 8),  0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 5));
    *((_BYTE *)v2 + 24) = 1;
  }

  return result;
}

CSCppCoreFileTaskCrashinfo *std::__optional_copy_base<CSCppCoreFileTaskCrashinfo,false>::__optional_copy_base[abi:ne180100]( CSCppCoreFileTaskCrashinfo *this, const CSCppCoreFileTaskCrashinfo *a2)
{
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 440) = 0;
  if (*((_BYTE *)a2 + 440))
  {
    CSCppCoreFileTaskCrashinfo::CSCppCoreFileTaskCrashinfo(this, a2);
    *((_BYTE *)this + 440) = 1;
  }

  return this;
}

void sub_18608090C(_Unwind_Exception *exception_object)
{
  if (*((_BYTE *)v1 + 440)) {
    CSCppCoreFileTaskCrashinfo::~CSCppCoreFileTaskCrashinfo(v1);
  }
  _Unwind_Resume(exception_object);
}

void CSCppCoreFileTaskCrashinfo::CSCppCoreFileTaskCrashinfo( CSCppCoreFileTaskCrashinfo *this, const CSCppCoreFileTaskCrashinfo *a2)
{
  uint64_t v4 = std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)this,  (__int128 *)a2);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)((char *)v4 + 32),  (__int128 *)a2 + 2);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)((char *)this + 64),  (__int128 *)a2 + 4);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)this + 4,  (__int128 *)a2 + 6);
  *((_OWORD *)this + 8) = *((_OWORD *)a2 + 8);
  __int128 v5 = *((_OWORD *)a2 + 9);
  __int128 v6 = *((_OWORD *)a2 + 10);
  __int128 v7 = *((_OWORD *)a2 + 11);
  *(_OWORD *)((char *)this + 188) = *(_OWORD *)((char *)a2 + 188);
  *((_OWORD *)this + 10) = v6;
  *((_OWORD *)this + 11) = v7;
  *((_OWORD *)this + 9) = v5;
  std::__optional_copy_base<std::vector<unsigned long long>,false>::__optional_copy_base[abi:ne180100]( (uint64_t)this + 208,  (uint64_t)a2 + 208);
  std::__optional_copy_base<std::vector<CS_vm_object_query_data_t>,false>::__optional_copy_base[abi:ne180100]( (uint64_t)this + 240,  (uint64_t)a2 + 240);
  __int128 v8 = *((_OWORD *)a2 + 17);
  __int128 v9 = *((_OWORD *)a2 + 19);
  *((_OWORD *)this + 18) = *((_OWORD *)a2 + 18);
  *((_OWORD *)this + 19) = v9;
  *((_OWORD *)this + 17) = v8;
  __int128 v10 = *((_OWORD *)a2 + 20);
  __int128 v11 = *((_OWORD *)a2 + 21);
  __int128 v12 = *((_OWORD *)a2 + 23);
  *((_OWORD *)this + 22) = *((_OWORD *)a2 + 22);
  *((_OWORD *)this + 23) = v12;
  *((_OWORD *)this + 20) = v10;
  *((_OWORD *)this + 21) = v11;
  __int128 v13 = *((_OWORD *)a2 + 24);
  __int128 v14 = *((_OWORD *)a2 + 25);
  __int128 v15 = *((_OWORD *)a2 + 26);
  *((void *)this + 54) = *((void *)a2 + 54);
  *((_OWORD *)this + 25) = v14;
  *((_OWORD *)this + 26) = v15;
  *((_OWORD *)this + 24) = v13;
}

void sub_186080A04(_Unwind_Exception *exception_object)
{
  if (*(_BYTE *)(v1 + 232))
  {
    __int128 v7 = *v5;
    if (*v5)
    {
      *(void *)(v1 + 216) = v7;
      operator delete(v7);
    }
  }

  if (*(_BYTE *)(v1 + 24))
  {
  }

  _Unwind_Resume(exception_object);
}

void *CSCppCoreFileDarwinMetadata::CSCppCoreFileDarwinMetadata( void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const CSCppCoreFileTaskCrashinfo *a9)
{
  __p = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>( &__p,  *(const void **)a3,  *(void *)(a3 + 8),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3));
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v18, a5);
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100]((uint64_t)v17, a6);
  CSCppCoreFileMetadata::CSCppCoreFileMetadata((uint64_t)a1, a2, (uint64_t)&__p, a4, (uint64_t)v18, a7, a8, (uint64_t)v17);
  if (v17[24])
  {
    unsigned int v22 = (void **)v17;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v22);
  }

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy( (uint64_t)v18,  (void *)v18[1]);
  if (__p)
  {
    uint64_t v20 = __p;
    operator delete(__p);
  }

  *a1 = off_189DF98F8;
  std::__optional_copy_base<CSCppCoreFileTaskCrashinfo,false>::__optional_copy_base[abi:ne180100]( (CSCppCoreFileTaskCrashinfo *)(a1 + 15),  a9);
  return a1;
}

void sub_186080BB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21)
{
}

uint64_t CSCppCoreFileMetadata::CSCppCoreFileMetadata( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = off_189DF9788;
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>( (void *)(a1 + 16),  *(const void **)a3,  *(void *)(a3 + 8),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3));
  *(void *)(a1 + 40) = a4;
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100]( (uint64_t *)(a1 + 48),  a5);
  *(void *)(a1 + 72) = a6;
  *(void *)(a1 + 80) = a7;
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100](a1 + 88, a8);
  return a1;
}

void sub_186080CC8(_Unwind_Exception *a1)
{
  __int128 v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v5;
    operator delete(v5);
  }

  _Unwind_Resume(a1);
}

void *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone( uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = off_189DFAAC8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_189DFAAC8;
  a2[1] = v2;
  return result;
}

unsigned int *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::operator()( uint64_t a1)
{
  return CSRelease(**(unsigned int ***)(a1 + 8), *(void *)(*(void *)(a1 + 8) + 8LL));
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer32>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void std::vector<CSCppCoreFileRegionInfo>::push_back[abi:ne180100](uint64_t *a1, __int128 *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v7 - *a1) >> 5);
    unint64_t v10 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v5 - *a1) >> 5);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= v9 + 1) {
      uint64_t v11 = v9 + 1;
    }
    if (v10 >= 0x92492492492492LL) {
      unint64_t v12 = 0x124924924924924LL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v18 = v4;
    if (v12) {
      __int128 v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>>(v4, v12);
    }
    else {
      __int128 v13 = 0LL;
    }
    __int128 v14 = v13;
    __int128 v15 = &v13[224 * v9];
    __int128 v17 = &v13[224 * v12];
    std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>( (uint64_t)v15,  a2);
    uint64_t v16 = v15 + 224;
    std::vector<CSCppCoreFileRegionInfo>::__swap_out_circular_buffer(a1, &v14);
    uint64_t v8 = a1[1];
    std::__split_buffer<CSCppCoreFileRegionInfo>::~__split_buffer((uint64_t)&v14);
  }

  else
  {
    std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>( *(void *)(v4 - 8),  a2);
    uint64_t v8 = v7 + 224;
    a1[1] = v7 + 224;
  }

  a1[1] = v8;
}

void sub_186080EC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void set_up_mapped_memory_cache_for_exclave_core_file<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long long,vas_segmentinfo_table const&,CSExclaveCoreFileType,mapped_memory_t *)::{lambda(unsigned long long)#1}::operator()( uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 40);
  unint64_t v10 = a2 - v2;
  if (a2 > v2)
  {
    unint64_t v4 = a2 - v2;
    do
    {
      unint64_t v5 = *(uint64_t **)(a1 + 48);
      if (v4 >= 0x6400000) {
        unint64_t v6 = 104857600LL;
      }
      else {
        unint64_t v6 = v4;
      }
      *(void *)&__int128 v17 = v2;
      *((void *)&v17 + 1) = v6;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      int v21 = 0;
      int v7 = *(unsigned __int8 *)(a1 + 25);
      int v18 = 1;
      int v22 = v7;
      uint64_t v23 = 0LL;
      memset(v24, 0, sizeof(v24));
      __int16 v25 = 3;
      uint64_t v26 = 0LL;
      __int16 v27 = 0;
      int v28 = 0;
      uint64_t v29 = 0LL;
      int v8 = *(_DWORD *)(a1 + 28);
      int v30 = 3;
      int v31 = v8;
      LOBYTE(v32) = 0;
      char v34 = 0;
      uint64_t v9 = v6 >> 14;
      __int16 v14 = 0;
      std::vector<unsigned short>::vector(v15, v6 >> 14, &v14);
      __int128 v35 = *(_OWORD *)v15;
      uint64_t v36 = v16;
      v15[1] = 0LL;
      uint64_t v16 = 0LL;
      v15[0] = 0LL;
      char v37 = 1;
      __int16 v11 = 0;
      std::vector<unsigned short>::vector(__p, v9, &v11);
      __int128 v38 = *(_OWORD *)__p;
      uint64_t v39 = v13;
      __p[1] = 0LL;
      uint64_t v13 = 0LL;
      __p[0] = 0LL;
      char v40 = 1;
      memset(v41, 0, sizeof(v41));
      std::vector<CSCppCoreFileRegionInfo>::push_back[abi:ne180100](v5, &v17);
      __int128 v42 = (void **)v41;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v42);
      if (v40 && (void)v38)
      {
        *((void *)&v38 + 1) = v38;
        operator delete((void *)v38);
      }

      if (v37 && (void)v35)
      {
        *((void *)&v35 + 1) = v35;
        operator delete((void *)v35);
      }

      if (v34 && v33 < 0) {
        operator delete(v32);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }

      if (v15[0])
      {
        v15[1] = v15[0];
        operator delete(v15[0]);
      }

      v2 += 104857600LL;
      v4 -= 104857600LL;
    }

    while (v2 < v10 + *(void *)(a1 + 40));
  }

void sub_1860810B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, __int16 a34, char a35, char a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
  if (a41)
  {
    __int128 v43 = *(void **)(v41 + 136);
    if (v43)
    {
      *(void *)(v41 + 144) = v43;
      operator delete(v43);
    }
  }

  if (__p) {
    operator delete(__p);
  }
  if (a37)
  {
    if (a36 < 0) {
      operator delete(*(void **)(v41 + 104));
    }
  }

  _Unwind_Resume(exception_object);
}

void std::make_unique[abi:ne180100]<CSCppCoreFileExclavesMetadata,int const&,std::vector<mapped_memory_core_file_dumped_region_info_t> const&,_CSArchitecture const&,std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>> const&,std::optional<unsigned long long> const&,CSCppCoreFileRegionsTree,CSExclaveCoreFileType const&,long long &>( _DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, __int128 *a6@<X5>, int *a7@<X6>, uint64_t *a8@<X7>, void *a9@<X8>)
{
  int v18 = operator new(0x88uLL);
  LODWORD(a1) = *a1;
  __int16 v27 = 0LL;
  uint64_t v28 = 0LL;
  __p = 0LL;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>( &__p,  *(const void **)a2,  *(void *)(a2 + 8),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  uint64_t v19 = *a3;
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v25, a4);
  uint64_t v20 = *a5;
  uint64_t v21 = a5[1];
  __int128 v22 = *a6;
  uint64_t v23 = *((void *)a6 + 2);
  *((void *)a6 + 1) = 0LL;
  *((void *)a6 + 2) = 0LL;
  *(void *)a6 = 0LL;
  char v24 = 1;
  CSCppCoreFileExclavesMetadata::CSCppCoreFileExclavesMetadata( (uint64_t)v18,  (int)a1,  (uint64_t)&__p,  v19,  (uint64_t)v25,  v20,  v21,  (uint64_t)&v22,  *a7,  *a8);
  *a9 = v18;
  if (v24)
  {
    uint64_t v29 = (void **)&v22;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v29);
  }

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy( (uint64_t)v25,  (void *)v25[1]);
  if (__p)
  {
    __int16 v27 = __p;
    operator delete(__p);
  }

void sub_186081270( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, void *a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (a14)
  {
    *(void *)(v21 - 88) = &a11;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 88));
  }

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy( (uint64_t)&a16,  a17);
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }

  operator delete(v20);
  _Unwind_Resume(a1);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( uint64_t a1, __n128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  unint64_t v8 = a1;
  while (2)
  {
    a1 = v8;
    uint64_t v9 = (uint64_t)a2 - v8;
    unint64_t v10 = (uint64_t)((uint64_t)a2 - v8) >> 5;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        unint64_t v36 = a2[-2].n128_u64[0];
        __int128 v35 = (__int128 *)&a2[-2];
        if (v36 < *(void *)v8)
        {
          __int128 v105 = *(_OWORD *)v8;
          __int128 v114 = *(_OWORD *)(v8 + 16);
          __int128 v37 = v35[1];
          *(_OWORD *)unint64_t v8 = *v35;
          *(_OWORD *)(v8 + 16) = v37;
          *__int128 v35 = v105;
          v35[1] = v114;
        }

        return;
      case 3uLL:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)v8,  (unint64_t *)(v8 + 32),  a2[-2].n128_u64);
        return;
      case 4uLL:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( v8,  (__n128 *)(v8 + 32),  (__n128 *)(v8 + 64),  a2 - 2);
        return;
      case 5uLL:
        __int128 v38 = (__int128 *)(v8 + 32);
        uint64_t v39 = (__int128 *)(v8 + 64);
        char v40 = (__int128 *)(v8 + 96);
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( v8,  (__n128 *)(v8 + 32),  (__n128 *)(v8 + 64),  (__n128 *)(v8 + 96));
        unint64_t v42 = a2[-2].n128_u64[0];
        uint64_t v41 = a2 - 2;
        if (v42 < *(void *)(v8 + 96))
        {
          __n128 v43 = (__n128)*v40;
          __n128 v115 = *(__n128 *)(v8 + 112);
          __n128 v44 = v41[1];
          *char v40 = (__int128)*v41;
          *(__n128 *)(v8 + 112) = v44;
          *uint64_t v41 = v43;
          v41[1] = v115;
          if (*(void *)v40 < *(void *)v39)
          {
            __int128 v46 = *v39;
            __int128 v45 = *(_OWORD *)(v8 + 80);
            __int128 v47 = *(_OWORD *)(v8 + 112);
            *uint64_t v39 = *v40;
            *(_OWORD *)(v8 + 80) = v47;
            *char v40 = v46;
            *(_OWORD *)(v8 + 112) = v45;
            if (*(void *)v39 < *(void *)v38)
            {
              __int128 v49 = *v38;
              __int128 v48 = *(_OWORD *)(v8 + 48);
              __int128 v50 = *(_OWORD *)(v8 + 80);
              *__int128 v38 = *v39;
              *(_OWORD *)(v8 + 48) = v50;
              *uint64_t v39 = v49;
              *(_OWORD *)(v8 + 80) = v48;
              if (*(void *)(v8 + 32) < *(void *)v8)
              {
                __int128 v106 = *(_OWORD *)v8;
                __int128 v116 = *(_OWORD *)(v8 + 16);
                __int128 v51 = *(_OWORD *)(v8 + 48);
                *(_OWORD *)unint64_t v8 = *v38;
                *(_OWORD *)(v8 + 16) = v51;
                *__int128 v38 = v106;
                *(_OWORD *)(v8 + 48) = v116;
              }
            }
          }
        }

        return;
      default:
        if (v9 <= 767)
        {
          v52 = (__n128 *)(v8 + 32);
          BOOL v54 = (__n128 *)v8 == a2 || v52 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v54)
            {
              uint64_t v55 = 0LL;
              unint64_t v56 = v8;
              do
              {
                v57 = v52;
                unint64_t v58 = *(void *)(v56 + 32);
                if (v58 < *(void *)v56)
                {
                  __int128 v107 = *(_OWORD *)(v56 + 40);
                  uint64_t v117 = *(void *)(v56 + 56);
                  uint64_t v59 = v55;
                  while (1)
                  {
                    uint64_t v60 = v8 + v59;
                    __int128 v61 = *(_OWORD *)(v8 + v59 + 16);
                    *(_OWORD *)(v60 + 32) = *(_OWORD *)(v8 + v59);
                    *(_OWORD *)(v60 + 48) = v61;
                    if (!v59) {
                      break;
                    }
                    v59 -= 32LL;
                    if (v58 >= *(void *)(v60 - 32))
                    {
                      uint64_t v62 = v8 + v59 + 32;
                      goto LABEL_75;
                    }
                  }

                  uint64_t v62 = v8;
LABEL_75:
                  *(void *)uint64_t v62 = v58;
                  *(void *)(v62 + 24) = v117;
                  *(_OWORD *)(v62 + 8) = v107;
                }

                v52 = v57 + 2;
                v55 += 32LL;
                unint64_t v56 = (unint64_t)v57;
              }

              while (&v57[2] != a2);
            }
          }

          else if (!v54)
          {
            do
            {
              uint64_t v92 = (uint64_t)v52;
              unint64_t v93 = *(void *)(a1 + 32);
              if (v93 < *(void *)a1)
              {
                __n128 v110 = *(__n128 *)(a1 + 40);
                unint64_t v120 = *(void *)(a1 + 56);
                do
                {
                  __n128 v94 = v52[-1];
                  __n128 *v52 = v52[-2];
                  v52[1] = v94;
                  unint64_t v95 = v52[-4].n128_u64[0];
                  v52 -= 2;
                }

                while (v93 < v95);
                v52->n128_u64[0] = v93;
                v52[1].n128_u64[1] = v120;
                *(__n128 *)((char *)v52 + 8) = v110;
              }

              v52 = (__n128 *)(v92 + 32);
              a1 = v92;
            }

            while ((__n128 *)(v92 + 32) != a2);
          }

          return;
        }

        if (!a3)
        {
          if ((__n128 *)v8 != a2)
          {
            int64_t v63 = (v10 - 2) >> 1;
            int64_t v64 = v63;
            do
            {
              int64_t v65 = v64;
              if (v63 >= v64)
              {
                uint64_t v66 = (2 * v64) | 1;
                unint64_t v67 = v8 + 32 * v66;
                if (2 * v65 + 2 >= (uint64_t)v10)
                {
                  unint64_t v68 = *(void *)v67;
                }

                else
                {
                  unint64_t v68 = *(void *)(v67 + 32);
                  BOOL v69 = *(void *)v67 >= v68;
                  if (*(void *)v67 > v68) {
                    unint64_t v68 = *(void *)v67;
                  }
                  if (!v69)
                  {
                    v67 += 32LL;
                    uint64_t v66 = 2 * v65 + 2;
                  }
                }

                unint64_t v70 = v8 + 32 * v65;
                unint64_t v71 = *(void *)v70;
                if (v68 >= *(void *)v70)
                {
                  uint64_t v118 = *(void *)(v70 + 24);
                  __int128 v108 = *(_OWORD *)(v70 + 8);
                  do
                  {
                    v72 = (_OWORD *)v70;
                    unint64_t v70 = v67;
                    __int128 v73 = *(_OWORD *)(v67 + 16);
                    _OWORD *v72 = *(_OWORD *)v67;
                    v72[1] = v73;
                    if (v63 < v66) {
                      break;
                    }
                    uint64_t v74 = (2 * v66) | 1;
                    unint64_t v67 = v8 + 32 * v74;
                    uint64_t v66 = 2 * v66 + 2;
                    if (v66 >= (uint64_t)v10)
                    {
                      unint64_t v75 = *(void *)v67;
                      uint64_t v66 = v74;
                    }

                    else
                    {
                      unint64_t v75 = *(void *)v67;
                      unint64_t v76 = *(void *)(v67 + 32);
                      if (*(void *)v67 <= v76) {
                        unint64_t v75 = *(void *)(v67 + 32);
                      }
                      if (*(void *)v67 >= v76) {
                        uint64_t v66 = v74;
                      }
                      else {
                        v67 += 32LL;
                      }
                    }
                  }

                  while (v75 >= v71);
                  *(void *)unint64_t v70 = v71;
                  *(void *)(v70 + 24) = v118;
                  *(_OWORD *)(v70 + 8) = v108;
                }
              }

              int64_t v64 = v65 - 1;
            }

            while (v65);
            uint64_t v77 = (unint64_t)v9 >> 5;
            do
            {
              uint64_t v78 = 0LL;
              __int128 v109 = *(_OWORD *)v8;
              __n128 v119 = *(__n128 *)(v8 + 16);
              v79 = (_OWORD *)v8;
              do
              {
                uint64_t v80 = (uint64_t)&v79[2 * v78 + 2];
                uint64_t v81 = (2 * v78) | 1;
                uint64_t v82 = 2 * v78 + 2;
                if (v82 < v77 && *(void *)v80 < *(void *)(v80 + 32))
                {
                  v80 += 32LL;
                  uint64_t v81 = v82;
                }

                __int128 v83 = *(_OWORD *)(v80 + 16);
                _OWORD *v79 = *(_OWORD *)v80;
                v79[1] = v83;
                v79 = (_OWORD *)v80;
                uint64_t v78 = v81;
              }

              while (v81 <= (uint64_t)((unint64_t)(v77 - 2) >> 1));
              a2 -= 2;
              if ((__n128 *)v80 == a2)
              {
                *(_OWORD *)uint64_t v80 = v109;
                *(__n128 *)(v80 + 16) = v119;
              }

              else
              {
                __n128 v84 = a2[1];
                *(__n128 *)uint64_t v80 = *a2;
                *(__n128 *)(v80 + 16) = v84;
                *a2 = (__n128)v109;
                a2[1] = v119;
                uint64_t v85 = v80 - v8 + 32;
                if (v85 >= 33)
                {
                  unint64_t v86 = (((unint64_t)v85 >> 5) - 2) >> 1;
                  v87 = (_OWORD *)(v8 + 32 * v86);
                  unint64_t v88 = *(void *)v80;
                  if (*(void *)v87 < *(void *)v80)
                  {
                    uint64_t v101 = *(void *)(v80 + 24);
                    __int128 v98 = *(_OWORD *)(v80 + 8);
                    do
                    {
                      v89 = (_OWORD *)v80;
                      uint64_t v80 = (uint64_t)v87;
                      __int128 v90 = v87[1];
                      _OWORD *v89 = *v87;
                      v89[1] = v90;
                      if (!v86) {
                        break;
                      }
                      unint64_t v86 = (v86 - 1) >> 1;
                      v87 = (_OWORD *)(v8 + 32 * v86);
                    }

                    while (*(void *)v87 < v88);
                    *(void *)uint64_t v80 = v88;
                    *(void *)(v80 + 24) = v101;
                    *(_OWORD *)(v80 + 8) = v98;
                  }
                }
              }
            }

            while (v77-- > 2);
          }

          return;
        }

        unint64_t v11 = v10 >> 1;
        unint64_t v12 = v8 + 32 * (v10 >> 1);
        if ((unint64_t)v9 <= 0x1000)
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(a1 + 32 * (v10 >> 1)),  (unint64_t *)a1,  a2[-2].n128_u64);
        }

        else
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)a1,  (unint64_t *)(a1 + 32 * (v10 >> 1)),  a2[-2].n128_u64);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(a1 + 32),  (unint64_t *)(v12 - 32),  a2[-4].n128_u64);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(a1 + 64),  (unint64_t *)(a1 + 32 + 32 * v11),  a2[-6].n128_u64);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(v12 - 32),  (unint64_t *)v12,  (unint64_t *)(a1 + 32 + 32 * v11));
          __int128 v102 = *(_OWORD *)a1;
          __int128 v111 = *(_OWORD *)(a1 + 16);
          __int128 v13 = *(_OWORD *)(v12 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v12;
          *(_OWORD *)(a1 + 16) = v13;
          *(_OWORD *)unint64_t v12 = v102;
          *(_OWORD *)(v12 + 16) = v111;
        }

        --a3;
        unint64_t v14 = *(void *)a1;
        if ((a4 & 1) == 0 && *(void *)(a1 - 32) >= v14)
        {
          uint64_t v100 = *(void *)(a1 + 24);
          __int128 v97 = *(_OWORD *)(a1 + 8);
          if (v14 >= a2[-2].n128_u64[0])
          {
            unint64_t v28 = a1 + 32;
            do
            {
              unint64_t v8 = v28;
              v28 += 32LL;
            }

            while (v14 >= *(void *)v8);
          }

          else
          {
            unint64_t v8 = a1;
            do
            {
              unint64_t v27 = *(void *)(v8 + 32);
              v8 += 32LL;
            }

            while (v14 >= v27);
          }

          uint64_t v29 = (__int128 *)a2;
          if (v8 < (unint64_t)a2)
          {
            uint64_t v29 = (__int128 *)a2;
            do
            {
              unint64_t v30 = *((void *)v29 - 4);
              v29 -= 2;
            }

            while (v14 < v30);
          }

          while (v8 < (unint64_t)v29)
          {
            __int128 v104 = *(_OWORD *)v8;
            __int128 v113 = *(_OWORD *)(v8 + 16);
            __int128 v31 = v29[1];
            *(_OWORD *)unint64_t v8 = *v29;
            *(_OWORD *)(v8 + 16) = v31;
            *uint64_t v29 = v104;
            v29[1] = v113;
            do
            {
              unint64_t v32 = *(void *)(v8 + 32);
              v8 += 32LL;
            }

            while (v14 >= v32);
            do
            {
              unint64_t v33 = *((void *)v29 - 4);
              v29 -= 2;
            }

            while (v14 < v33);
          }

          if (v8 - 32 != a1)
          {
            __int128 v34 = *(_OWORD *)(v8 - 16);
            *(_OWORD *)a1 = *(_OWORD *)(v8 - 32);
            *(_OWORD *)(a1 + 16) = v34;
          }

          a4 = 0;
          *(void *)(v8 - 32) = v14;
          *(void *)(v8 - 8) = v100;
          *(_OWORD *)(v8 - 24) = v97;
          continue;
        }

        uint64_t v15 = 0LL;
        uint64_t v99 = *(void *)(a1 + 24);
        __int128 v96 = *(_OWORD *)(a1 + 8);
        do
        {
          unint64_t v16 = *(void *)(a1 + v15 + 32);
          v15 += 32LL;
        }

        while (v16 < v14);
        unint64_t v17 = a1 + v15;
        int v18 = a2;
        if (v15 == 32)
        {
          int v18 = a2;
          do
          {
            unint64_t v20 = v18[-2].n128_u64[0];
            v18 -= 2;
          }

          while (v20 >= v14);
        }

        else
        {
          do
          {
            unint64_t v19 = v18[-2].n128_u64[0];
            v18 -= 2;
          }

          while (v19 >= v14);
        }

        unint64_t v8 = a1 + v15;
        if (v17 < (unint64_t)v18)
        {
          uint64_t v21 = (__int128 *)v18;
          do
          {
            __int128 v103 = *(_OWORD *)v8;
            __int128 v112 = *(_OWORD *)(v8 + 16);
            __int128 v22 = v21[1];
            *(_OWORD *)unint64_t v8 = *v21;
            *(_OWORD *)(v8 + 16) = v22;
            __int128 *v21 = v103;
            v21[1] = v112;
            do
            {
              unint64_t v23 = *(void *)(v8 + 32);
              v8 += 32LL;
            }

            while (v23 < v14);
            do
            {
              unint64_t v24 = *((void *)v21 - 4);
              v21 -= 2;
            }

            while (v24 >= v14);
          }

          while (v8 < (unint64_t)v21);
        }

        if (v8 - 32 != a1)
        {
          __int128 v25 = *(_OWORD *)(v8 - 16);
          *(_OWORD *)a1 = *(_OWORD *)(v8 - 32);
          *(_OWORD *)(a1 + 16) = v25;
        }

        *(void *)(v8 - 32) = v14;
        *(void *)(v8 - 8) = v99;
        *(_OWORD *)(v8 - 24) = v96;
        if (v17 < (unint64_t)v18)
        {
LABEL_29:
          _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( a1,  v8 - 32,  a3,  a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v26 = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_( a1,  v8 - 32);
        if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_( v8,  (uint64_t)a2))
        {
          if (v26) {
            continue;
          }
          goto LABEL_29;
        }

        a2 = (__n128 *)(v8 - 32);
        if (!v26) {
          goto LABEL_1;
        }
        return;
    }
  }

__int128 *_ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( __int128 *result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  if (*a2 >= *(void *)result)
  {
    if (v4 < v3)
    {
      __int128 v9 = *(_OWORD *)a2;
      __int128 v8 = *((_OWORD *)a2 + 1);
      __int128 v10 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v10;
      *(_OWORD *)a3 = v9;
      *((_OWORD *)a3 + 1) = v8;
      if (*a2 < *(void *)result)
      {
        __int128 v12 = *result;
        __int128 v11 = result[1];
        __int128 v13 = *((_OWORD *)a2 + 1);
        *__n128 result = *(_OWORD *)a2;
        result[1] = v13;
        *(_OWORD *)a2 = v12;
        *((_OWORD *)a2 + 1) = v11;
      }
    }
  }

  else
  {
    if (v4 >= v3)
    {
      __int128 v15 = *result;
      __int128 v14 = result[1];
      __int128 v16 = *((_OWORD *)a2 + 1);
      *__n128 result = *(_OWORD *)a2;
      result[1] = v16;
      *(_OWORD *)a2 = v15;
      *((_OWORD *)a2 + 1) = v14;
      if (*a3 >= *a2) {
        return result;
      }
      __int128 v6 = *(_OWORD *)a2;
      __int128 v5 = *((_OWORD *)a2 + 1);
      __int128 v17 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v17;
    }

    else
    {
      __int128 v6 = *result;
      __int128 v5 = result[1];
      __int128 v7 = *((_OWORD *)a3 + 1);
      *__n128 result = *(_OWORD *)a3;
      result[1] = v7;
    }

    *(_OWORD *)a3 = v6;
    *((_OWORD *)a3 + 1) = v5;
  }

  return result;
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 5;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      __int128 v6 = (__int128 *)(a2 - 32);
      if (*(void *)(a2 - 32) < *(void *)a1)
      {
        __int128 v8 = *(_OWORD *)a1;
        __int128 v7 = *(_OWORD *)(a1 + 16);
        __int128 v9 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v9;
        __int128 *v6 = v8;
        *(_OWORD *)(a2 - 16) = v7;
      }

      return result;
    case 3LL:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)a1,  (unint64_t *)(a1 + 32),  (unint64_t *)(a2 - 32));
      return 1LL;
    case 4LL:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( a1,  (__n128 *)(a1 + 32),  (__n128 *)(a1 + 64),  (__n128 *)(a2 - 32));
      return 1LL;
    case 5LL:
      unint64_t v19 = (__int128 *)(a1 + 32);
      unint64_t v20 = (__int128 *)(a1 + 64);
      uint64_t v21 = (__int128 *)(a1 + 96);
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( a1,  (__n128 *)(a1 + 32),  (__n128 *)(a1 + 64),  (__n128 *)(a1 + 96));
      unint64_t v23 = *(void *)(a2 - 32);
      __int128 v22 = (__int128 *)(a2 - 32);
      if (v23 < *(void *)(a1 + 96))
      {
        __int128 v25 = *v21;
        __int128 v24 = *(_OWORD *)(a1 + 112);
        __int128 v26 = v22[1];
        __int128 *v21 = *v22;
        *(_OWORD *)(a1 + 112) = v26;
        __int128 *v22 = v25;
        v22[1] = v24;
        if (*(void *)v21 < *(void *)v20)
        {
          __int128 v28 = *v20;
          __int128 v27 = *(_OWORD *)(a1 + 80);
          __int128 v29 = *(_OWORD *)(a1 + 112);
          *unint64_t v20 = *v21;
          *(_OWORD *)(a1 + 80) = v29;
          __int128 *v21 = v28;
          *(_OWORD *)(a1 + 112) = v27;
          if (*(void *)v20 < *(void *)v19)
          {
            __int128 v31 = *v19;
            __int128 v30 = *(_OWORD *)(a1 + 48);
            __int128 v32 = *(_OWORD *)(a1 + 80);
            *unint64_t v19 = *v20;
            *(_OWORD *)(a1 + 48) = v32;
            *unint64_t v20 = v31;
            *(_OWORD *)(a1 + 80) = v30;
            if (*(void *)(a1 + 32) < *(void *)a1)
            {
              __int128 v34 = *(_OWORD *)a1;
              __int128 v33 = *(_OWORD *)(a1 + 16);
              __int128 v35 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v35;
              *unint64_t v19 = v34;
              *(_OWORD *)(a1 + 48) = v33;
            }
          }
        }
      }

      return 1LL;
    default:
      __int128 v10 = (void *)(a1 + 64);
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)a1,  (unint64_t *)(a1 + 32),  (unint64_t *)(a1 + 64));
      uint64_t v11 = a1 + 96;
      if (a1 + 96 == a2) {
        return 1LL;
      }
      uint64_t v12 = 0LL;
      int v13 = 0;
      break;
  }

  while (1)
  {
    unint64_t v14 = *(void *)v11;
    if (*(void *)v11 < *v10)
    {
      __int128 v36 = *(_OWORD *)(v11 + 8);
      uint64_t v37 = *(void *)(v11 + 24);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        __int128 v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64) {
          break;
        }
        v15 -= 32LL;
        if (v14 >= *(void *)(v16 + 32))
        {
          uint64_t v18 = a1 + v15 + 96;
          goto LABEL_13;
        }
      }

      uint64_t v18 = a1;
LABEL_13:
      *(void *)uint64_t v18 = v14;
      *(_OWORD *)(v18 + 8) = v36;
      *(void *)(v18 + 24) = v37;
      if (++v13 == 8) {
        return v11 + 32 == a2;
      }
    }

    __int128 v10 = (void *)v11;
    v12 += 32LL;
    v11 += 32LL;
    if (v11 == a2) {
      return 1LL;
    }
  }

__n128 _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4)
{
  if (a4->n128_u64[0] < a3->n128_u64[0])
  {
    __n128 v9 = *a3;
    __n128 result = a3[1];
    __n128 v10 = a4[1];
    *a3 = *a4;
    a3[1] = v10;
    *a4 = v9;
    a4[1] = result;
    if (a3->n128_u64[0] < a2->n128_u64[0])
    {
      __n128 v11 = *a2;
      __n128 result = a2[1];
      __n128 v12 = a3[1];
      *a2 = *a3;
      a2[1] = v12;
      *a3 = v11;
      a3[1] = result;
      if (a2->n128_u64[0] < *(void *)a1)
      {
        __int128 v13 = *(_OWORD *)a1;
        __n128 result = *(__n128 *)(a1 + 16);
        __n128 v14 = a2[1];
        *(__n128 *)a1 = *a2;
        *(__n128 *)(a1 + 16) = v14;
        *a2 = (__n128)v13;
        a2[1] = result;
      }
    }
  }

  return result;
}

uint64_t *std::__tree<unsigned long,std::greater<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long>( uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  __int128 v6 = a1 + 1;
  __int128 v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        __int128 v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 <= v9) {
          break;
        }
        __int128 v5 = *v8;
        __int128 v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 <= v7) {
        break;
      }
      __int128 v5 = v8[1];
      if (!v5)
      {
        __int128 v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    __int128 v8 = a1 + 1;
LABEL_10:
    __n128 v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }

  return (uint64_t *)v8;
}

void *std::vector<unsigned short>::vector(void *a1, uint64_t a2, _WORD *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    std::vector<unsigned short>::__vallocate[abi:ne180100](a1, a2);
    __int128 v6 = (_WORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 2 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 2LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_186081EEC(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

__int128 *std::vector<CSCppCoreFileRegionInfo>::__insert_with_size[abi:ne180100]<std::__wrap_iter<CSCppCoreFileRegionInfo*>,std::__wrap_iter<CSCppCoreFileRegionInfo*>>( uint64_t *a1, __int128 *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  __int128 v5 = a2;
  if (a5 >= 1)
  {
    unint64_t v7 = a3;
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if (0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v11 - v12) >> 5) >= a5)
    {
      uint64_t v20 = v12 - (void)a2;
      if (0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v12 - (void)a2) >> 5) >= a5)
      {
        uint64_t v21 = &a3[28 * a5];
      }

      else
      {
        uint64_t v21 = &a3[4 * ((uint64_t)(v12 - (void)a2) >> 5)];
        a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>( v9,  (uint64_t)v21,  a4,  *(void *)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }

      std::vector<CSCppCoreFileRegionInfo>::__move_range((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[14 * a5]);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>( (uint64_t)v26,  v7,  v21,  (uint64_t)v5);
    }

    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 + 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v12 - *a1) >> 5);
      if (v14 > 0x124924924924924LL) {
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = 0x6DB6DB6DB6DB6DB7LL * (((uint64_t)a2 - v13) >> 5);
      unint64_t v16 = 0x6DB6DB6DB6DB6DB7LL * ((v10 - v13) >> 5);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x92492492492492LL) {
        unint64_t v18 = 0x124924924924924LL;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v29 = v9;
      if (v18) {
        unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>>(v9, v18);
      }
      else {
        unint64_t v19 = 0LL;
      }
      uint64_t v22 = (uint64_t)&v19[224 * v15];
      v26[0] = v19;
      v26[1] = v22;
      uint64_t v27 = v22;
      __int128 v28 = &v19[224 * v18];
      uint64_t v23 = 224 * a5;
      uint64_t v24 = v22 + 224 * a5;
      do
      {
        CSCppCoreFileRegionInfo::CSCppCoreFileRegionInfo(v22, (__int128 *)v7);
        v22 += 224LL;
        v7 += 28;
        v23 -= 224LL;
      }

      while (v23);
      uint64_t v27 = v24;
      __int128 v5 = (__int128 *)std::vector<CSCppCoreFileRegionInfo>::__swap_out_circular_buffer(a1, v26, v5);
      std::__split_buffer<CSCppCoreFileRegionInfo>::~__split_buffer((uint64_t)v26);
    }
  }

  return v5;
}

void sub_1860820E8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v12 + 8) = v13;
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<CSCppCoreFileRegionInfo>::__move_range( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    uint64_t v10 = (__int128 *)(a2 + v6 - a4);
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(v8, v10);
      v10 += 14;
      v8 += 224LL;
    }

    while ((unint64_t)v10 < a3);
  }

  *(void *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>( (uint64_t)&v12,  a2,  v7,  v6);
}

uint64_t std::vector<CSCppCoreFileRegionInfo>::__swap_out_circular_buffer( uint64_t *a1, void *a2, __int128 *a3)
{
  unint64_t v3 = a3;
  uint64_t v6 = a2[1];
  unint64_t v7 = (__int128 *)*a1;
  uint64_t v8 = v6;
  if ((__int128 *)*a1 != a3)
  {
    uint64_t v9 = a3;
    uint64_t v8 = a2[1];
    do
    {
      v8 -= 224LL;
      v9 -= 14;
      std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(v8, v9);
    }

    while (v9 != v7);
  }

  a2[1] = v8;
  uint64_t v10 = (__int128 *)a1[1];
  uint64_t v11 = a2[2];
  if (v10 != v3)
  {
    do
    {
      std::construct_at[abi:ne180100]<CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo,CSCppCoreFileRegionInfo*>(v11, v3);
      v3 += 14;
      v11 += 224LL;
    }

    while (v3 != v10);
    uint64_t v8 = a2[1];
  }

  a2[2] = v11;
  uint64_t v12 = *a1;
  *a1 = v8;
  a2[1] = v12;
  uint64_t v13 = a1[1];
  a1[1] = a2[2];
  a2[2] = v13;
  uint64_t v14 = a1[2];
  a1[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return v6;
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = a4 + v7;
      __int128 v9 = *(_OWORD *)(a3 + v7 - 224);
      __int128 v10 = *(_OWORD *)(a3 + v7 - 192);
      *(_OWORD *)(v8 - 208) = *(_OWORD *)(a3 + v7 - 208);
      *(_OWORD *)(v8 - 192) = v10;
      *(_OWORD *)(v8 - 224) = v9;
      __int128 v11 = *(_OWORD *)(a3 + v7 - 176);
      __int128 v12 = *(_OWORD *)(a3 + v7 - 160);
      __int128 v13 = *(_OWORD *)(a3 + v7 - 144);
      *(void *)(v8 - 128) = *(void *)(a3 + v7 - 128);
      *(_OWORD *)(v8 - 160) = v12;
      *(_OWORD *)(v8 - 144) = v13;
      *(_OWORD *)(v8 - 176) = v11;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a4 + v7 - 120,  (__n128 *)(a3 + v7 - 120));
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a4 + v7 - 88,  (__n128 *)(a3 + v7 - 88));
      uint64_t v14 = a4 + v7;
      uint64_t v15 = a3 + v7;
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a4 + v7 - 56,  (__n128 *)(a3 + v7 - 56));
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a4 + v7 - 24));
      *(_OWORD *)(v14 - 24) = *(_OWORD *)(a3 + v7 - 24);
      *(void *)(v14 - 8) = *(void *)(a3 + v7 - 8);
      *(void *)(v15 - 24) = 0LL;
      *(void *)(v15 - 16) = 0LL;
      *(void *)(v15 - 8) = 0LL;
      v7 -= 224LL;
    }

    while (a3 + v7 != a2);
  }

  return a3;
}

uint64_t *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>( uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  if (a2 == a3) {
    return a2;
  }
  __int128 v5 = a3;
  uint64_t v6 = a2 + 26;
  do
  {
    uint64_t v7 = v6 - 26;
    __int128 v8 = *((_OWORD *)v6 - 13);
    __int128 v9 = *((_OWORD *)v6 - 11);
    *(_OWORD *)(a4 + 16) = *((_OWORD *)v6 - 12);
    *(_OWORD *)(a4 + 32) = v9;
    *(_OWORD *)a4 = v8;
    __int128 v10 = *((_OWORD *)v6 - 10);
    __int128 v11 = *((_OWORD *)v6 - 9);
    __int128 v12 = *((_OWORD *)v6 - 8);
    *(void *)(a4 + 96) = *(v6 - 14);
    *(_OWORD *)(a4 + 64) = v11;
    *(_OWORD *)(a4 + 80) = v12;
    *(_OWORD *)(a4 + 48) = v10;
    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>( (std::string *)(a4 + 104),  (const std::string *)(v6 - 13));
    std::__optional_storage_base<std::vector<unsigned short>,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::vector<unsigned short>,false> const&>( a4 + 136,  (uint64_t)(v6 - 9));
    std::__optional_storage_base<std::vector<unsigned short>,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::vector<unsigned short>,false> const&>( a4 + 168,  (uint64_t)(v6 - 5));
    if ((uint64_t *)a4 != v6 - 26) {
      std::vector<CSCppCoreFileRegionInfo>::__assign_with_size[abi:ne180100]<CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>( (uint64_t *)(a4 + 200),  *(v6 - 1),  *v6,  0x6DB6DB6DB6DB6DB7LL * ((*v6 - *(v6 - 1)) >> 5));
    }
    a4 += 224LL;
    v6 += 28;
  }

  while (v7 + 28 != v5);
  return v5;
}

void std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>( std::string *this, const std::string *a2)
{
  if (this[1].__r_.__value_.__s.__data_[0] == a2[1].__r_.__value_.__s.__data_[0])
  {
    if (this[1].__r_.__value_.__s.__data_[0]) {
      std::string::operator=(this, a2);
    }
  }

  else if (this[1].__r_.__value_.__s.__data_[0])
  {
    this[1].__r_.__value_.__s.__data_[0] = 0;
  }

  else
  {
    if ((char)a2->__r_.__value_.__s.__size_ < 0)
    {
      std::string::__init_copy_ctor_external(this, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    }

    else
    {
      __int128 v3 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
      this->__r_.__value_.__l.__cap_ = a2->__r_.__value_.__l.__cap_;
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
    }

    this[1].__r_.__value_.__s.__data_[0] = 1;
  }

void std::__optional_storage_base<std::vector<unsigned short>,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::vector<unsigned short>,false> const&>( uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
  {
    if (a1 != a2)
    {
      if (*(_BYTE *)(a1 + 24)) {
        std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>( (char *)a1,  *(char **)a2,  *(void *)(a2 + 8),  (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
      }
    }
  }

  else if (*(_BYTE *)(a1 + 24))
  {
    __int128 v3 = *(void **)a1;
    if (*(void *)a1)
    {
      *(void *)(a1 + 8) = v3;
      operator delete(v3);
    }

    *(_BYTE *)(a1 + 24) = 0;
  }

  else
  {
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>( (void *)a1,  *(const void **)a2,  *(void *)(a2 + 8),  (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
    *(_BYTE *)(a1 + 24) = 1;
  }

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>( char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *((void *)result + 2);
  __int128 v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(void *)result) >> 1)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      unint64_t v8 = 0LL;
      *uint64_t v7 = 0LL;
      v7[1] = 0LL;
      v7[2] = 0LL;
    }

    if ((a4 & 0x8000000000000000LL) != 0) {
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    }
    if (v8 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v8 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v10;
    }
    __n128 result = std::vector<unsigned short>::__vallocate[abi:ne180100](v7, v11);
    __int128 v13 = (char *)v7[1];
    __int128 v12 = (void **)(v7 + 1);
    __int128 v9 = v13;
LABEL_17:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_19;
    }

    goto LABEL_20;
  }

  __int128 v12 = (void **)(result + 8);
  uint64_t v14 = (_BYTE *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 1;
  if (v15 >= a4) {
    goto LABEL_17;
  }
  unint64_t v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    __n128 result = (char *)memmove(*(void **)result, __src, v14 - v9);
    __int128 v9 = (char *)*v12;
  }

  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_19:
    __n128 result = (char *)memmove(v18, v19, v17);
  }

void std::vector<CSCppCoreFileRegionInfo>::__assign_with_size[abi:ne180100]<CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>( uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7LL * ((a1[2] - *a1) >> 5) < a4)
  {
    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(a1);
    if (a4 > 0x124924924924924LL) {
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 5);
    if (v9 <= a4) {
      unint64_t v9 = a4;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<CSCppCoreFileRegionInfo>::__vallocate[abi:ne180100](a1, v10);
    uint64_t v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>( v8,  a2,  a3,  a1[1]);
    goto LABEL_11;
  }

  if (0x6DB6DB6DB6DB6DB7LL * ((a1[1] - *a1) >> 5) < a4)
  {
    uint64_t v12 = a2 + 32 * ((a1[1] - *a1) >> 5);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>( &v14,  a2,  v12);
    uint64_t v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CSCppCoreFileRegionInfo>,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*,CSCppCoreFileRegionInfo*>( v8,  v12,  a3,  a1[1]);
LABEL_11:
    a1[1] = v11;
    return;
  }

  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *,CSCppCoreFileRegionInfo *>( &v15,  a2,  a3);
  std::vector<CSCppCoreFileRegionInfo>::__base_destruct_at_end[abi:ne180100]((uint64_t)a1, v13);
}

void sub_1860827FC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_186082804(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  v197 = a2 - 14;
  v202 = a2;
  v195 = a2 - 42;
  v196 = a2 - 28;
  unint64_t v6 = a1;
  while (2)
  {
    a1 = v6;
    uint64_t v7 = v202;
    uint64_t v8 = (uint64_t)v202 - v6;
    unint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)((uint64_t)v202 - v6) >> 5);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        int64_t v64 = v202 - 14;
        if (*((void *)v202 - 28) < *(void *)a1)
        {
          int64_t v65 = (__int128 *)a1;
          goto LABEL_83;
        }

        return;
      case 3uLL:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  v197);
        return;
      case 4uLL:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  v197);
        return;
      case 5uLL:
        uint64_t v66 = (void *)(a1 + 448);
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  (__int128 *)(a1 + 672));
        if (*((void *)v202 - 28) < *(void *)(a1 + 672))
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 672), v202 - 14);
          if (*(void *)(a1 + 672) < *v66)
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 448), (__int128 *)(a1 + 672));
            if (*v66 < *(void *)(a1 + 224))
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 224), (__int128 *)(a1 + 448));
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                int64_t v65 = (__int128 *)a1;
                int64_t v64 = (__int128 *)(a1 + 224);
LABEL_83:
                std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v65, v64);
              }
            }
          }
        }

        return;
      default:
        if (v8 > 5375)
        {
          if (!a3)
          {
            if ((__int128 *)a1 != v202)
            {
              int64_t v200 = (v9 - 2) >> 1;
              int64_t v91 = v200;
              do
              {
                int64_t v92 = v91;
                if (v200 >= v91)
                {
                  uint64_t v93 = (2 * v91) | 1;
                  __n128 v94 = (__int128 *)(a1 + 224 * v93);
                  if (2 * v92 + 2 >= (uint64_t)v9)
                  {
                    unint64_t v95 = *(void *)v94;
                  }

                  else
                  {
                    unint64_t v95 = *(void *)v94;
                    unint64_t v96 = *((void *)v94 + 28);
                    if (*(void *)v94 <= v96) {
                      unint64_t v95 = *((void *)v94 + 28);
                    }
                    if (*(void *)v94 < v96)
                    {
                      v94 += 14;
                      uint64_t v93 = 2 * v92 + 2;
                    }
                  }

                  unint64_t v97 = a1 + 224 * v92;
                  if (v95 >= *(void *)v97)
                  {
                    __int128 v98 = *(_OWORD *)v97;
                    __int128 v99 = *(_OWORD *)(v97 + 32);
                    __int128 v223 = *(_OWORD *)(v97 + 16);
                    __int128 v224 = v99;
                    __int128 v222 = v98;
                    __int128 v100 = *(_OWORD *)(v97 + 48);
                    __int128 v101 = *(_OWORD *)(v97 + 64);
                    __int128 v102 = *(_OWORD *)(v97 + 80);
                    uint64_t v228 = *(void *)(v97 + 96);
                    __int128 v226 = v101;
                    __int128 v227 = v102;
                    __int128 v225 = v100;
                    v229.n128_u8[0] = 0;
                    char v231 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 128))
                    {
                      unint64_t v103 = a1 + 224 * v92;
                      __n128 v104 = *(__n128 *)(v103 + 104);
                      uint64_t v230 = *(void *)(v103 + 120);
                      __n128 v229 = v104;
                      *(void *)(v103 + 112) = 0LL;
                      *(void *)(v103 + 120) = 0LL;
                      *(void *)(v103 + 104) = 0LL;
                      char v231 = 1;
                    }

                    v232.n128_u8[0] = 0;
                    char v234 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 160))
                    {
                      unint64_t v105 = a1 + 224 * v92;
                      __n128 v232 = *(__n128 *)(v105 + 136);
                      uint64_t v233 = *(void *)(v105 + 152);
                      *(void *)(v105 + 136) = 0LL;
                      *(void *)(v105 + 144) = 0LL;
                      *(void *)(v105 + 152) = 0LL;
                      char v234 = 1;
                    }

                    __p.n128_u8[0] = 0;
                    char v237 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 192))
                    {
                      unint64_t v106 = a1 + 224 * v92;
                      __n128 __p = *(__n128 *)(v106 + 168);
                      uint64_t v236 = *(void *)(v106 + 184);
                      *(void *)(v106 + 168) = 0LL;
                      *(void *)(v106 + 176) = 0LL;
                      *(void *)(v106 + 184) = 0LL;
                      char v237 = 1;
                    }

                    int64_t v198 = v92;
                    unint64_t v107 = a1 + 224 * v92;
                    __int128 v238 = *(_OWORD *)(v107 + 200);
                    uint64_t v239 = *(void *)(v107 + 216);
                    *(void *)(v107 + 200) = 0LL;
                    *(void *)(v107 + 208) = 0LL;
                    *(void *)(v107 + 216) = 0LL;
                    do
                    {
                      __int128 v108 = v94;
                      __int128 v109 = *v94;
                      __int128 v110 = v94[2];
                      *(_OWORD *)(v97 + 16) = v94[1];
                      *(_OWORD *)(v97 + 32) = v110;
                      *(_OWORD *)unint64_t v97 = v109;
                      __int128 v111 = v94[3];
                      __int128 v112 = v94[4];
                      __int128 v113 = v94[5];
                      *(void *)(v97 + 96) = *((void *)v94 + 12);
                      *(_OWORD *)(v97 + 64) = v112;
                      *(_OWORD *)(v97 + 80) = v113;
                      *(_OWORD *)(v97 + 48) = v111;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v97 + 104,  (__n128 *)((char *)v94 + 104));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 136,  (__n128 *)((char *)v108 + 136));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 168,  (__n128 *)((char *)v108 + 168));
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v97 + 200));
                      *(_OWORD *)(v97 + 200) = *(__int128 *)((char *)v108 + 200);
                      *(void *)(v97 + 216) = *((void *)v108 + 27);
                      *((void *)v108 + 25) = 0LL;
                      *((void *)v108 + 26) = 0LL;
                      *((void *)v108 + 27) = 0LL;
                      if (v200 < v93) {
                        break;
                      }
                      __n128 v94 = (__int128 *)(a1 + 224 * ((2 * v93) | 1));
                      if (2 * v93 + 2 >= (uint64_t)v9)
                      {
                        unint64_t v114 = *(void *)v94;
                        uint64_t v93 = (2 * v93) | 1;
                      }

                      else
                      {
                        unint64_t v114 = *(void *)v94;
                        unint64_t v115 = *((void *)v94 + 28);
                        if (*(void *)v94 <= v115) {
                          unint64_t v114 = *((void *)v94 + 28);
                        }
                        if (*(void *)v94 >= v115)
                        {
                          uint64_t v93 = (2 * v93) | 1;
                        }

                        else
                        {
                          v94 += 14;
                          uint64_t v93 = 2 * v93 + 2;
                        }
                      }

                      unint64_t v97 = (unint64_t)v108;
                    }

                    while (v114 >= (unint64_t)v222);
                    __int128 v116 = v222;
                    __int128 v117 = v224;
                    v108[1] = v223;
                    v108[2] = v117;
                    *__int128 v108 = v116;
                    __int128 v118 = v225;
                    __int128 v119 = v226;
                    __int128 v120 = v227;
                    *((void *)v108 + 12) = v228;
                    v108[4] = v119;
                    v108[5] = v120;
                    v108[3] = v118;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v108 + 104,  &v229);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 136,  &v232);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 168,  &__p);
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v108 + 25);
                    *(__int128 *)((char *)v108 + 200) = v238;
                    *((void *)v108 + 27) = v239;
                    __int128 v238 = 0uLL;
                    uint64_t v239 = 0LL;
                    *(void *)&__int128 v203 = &v238;
                    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                    if (v237 && __p.n128_u64[0])
                    {
                      __p.n128_u64[1] = __p.n128_u64[0];
                      operator delete((void *)__p.n128_u64[0]);
                    }

                    if (v234 && v232.n128_u64[0])
                    {
                      v232.n128_u64[1] = v232.n128_u64[0];
                      operator delete((void *)v232.n128_u64[0]);
                    }

                    if (v231 && SHIBYTE(v230) < 0) {
                      operator delete((void *)v229.n128_u64[0]);
                    }
                    uint64_t v7 = v202;
                    int64_t v92 = v198;
                  }
                }

                int64_t v91 = v92 - 1;
              }

              while (v92);
              uint64_t v121 = (((unint64_t)v8 >> 5) * (unsigned __int128)0x2492492492492493uLL) >> 64;
              v194 = (__n128 *)(a1 + 104);
              do
              {
                __int128 v122 = *(_OWORD *)a1;
                __int128 v123 = *(_OWORD *)(a1 + 32);
                __int128 v204 = *(_OWORD *)(a1 + 16);
                __int128 v205 = v123;
                __int128 v203 = v122;
                __int128 v124 = *(_OWORD *)(a1 + 48);
                __int128 v125 = *(_OWORD *)(a1 + 64);
                __int128 v126 = *(_OWORD *)(a1 + 80);
                uint64_t v209 = *(void *)(a1 + 96);
                __int128 v207 = v125;
                __int128 v208 = v126;
                __int128 v206 = v124;
                v210.n128_u8[0] = 0;
                char v212 = 0;
                if (*(_BYTE *)(a1 + 128))
                {
                  __n128 v127 = *v194;
                  uint64_t v211 = *(void *)(a1 + 120);
                  __n128 v210 = v127;
                  *(void *)(a1 + 112) = 0LL;
                  *(void *)(a1 + 120) = 0LL;
                  v194->n128_u64[0] = 0LL;
                  char v212 = 1;
                }

                v213.n128_u8[0] = 0;
                char v215 = 0;
                if (*(_BYTE *)(a1 + 160))
                {
                  __n128 v213 = *(__n128 *)(a1 + 136);
                  uint64_t v214 = *(void *)(a1 + 152);
                  *(void *)(a1 + 136) = 0LL;
                  *(void *)(a1 + 144) = 0LL;
                  *(void *)(a1 + 152) = 0LL;
                  char v215 = 1;
                }

                v201 = v7;
                v216.n128_u8[0] = 0;
                char v218 = 0;
                if (*(_BYTE *)(a1 + 192))
                {
                  __n128 v216 = *(__n128 *)(a1 + 168);
                  uint64_t v217 = *(void *)(a1 + 184);
                  *(void *)(a1 + 168) = 0LL;
                  *(void *)(a1 + 176) = 0LL;
                  *(void *)(a1 + 184) = 0LL;
                  char v218 = 1;
                }

                uint64_t v128 = 0LL;
                __int128 v219 = *(_OWORD *)(a1 + 200);
                uint64_t v220 = *(void *)(a1 + 216);
                *(void *)(a1 + 200) = 0LL;
                *(void *)(a1 + 208) = 0LL;
                *(void *)(a1 + 216) = 0LL;
                uint64_t v129 = a1;
                do
                {
                  uint64_t v130 = v129 + 224 * v128 + 224;
                  uint64_t v131 = 2 * v128;
                  uint64_t v128 = (2 * v128) | 1;
                  if (v131 + 2 < v121 && *(void *)v130 < *(void *)(v130 + 224))
                  {
                    v130 += 224LL;
                    uint64_t v128 = v131 + 2;
                  }

                  __int128 v132 = *(_OWORD *)v130;
                  __int128 v133 = *(_OWORD *)(v130 + 32);
                  *(_OWORD *)(v129 + 16) = *(_OWORD *)(v130 + 16);
                  *(_OWORD *)(v129 + 32) = v133;
                  *(_OWORD *)uint64_t v129 = v132;
                  __int128 v134 = *(_OWORD *)(v130 + 48);
                  __int128 v135 = *(_OWORD *)(v130 + 64);
                  __int128 v136 = *(_OWORD *)(v130 + 80);
                  *(void *)(v129 + 96) = *(void *)(v130 + 96);
                  *(_OWORD *)(v129 + 64) = v135;
                  *(_OWORD *)(v129 + 80) = v136;
                  *(_OWORD *)(v129 + 48) = v134;
                  v137 = (__n128 *)(v130 + 104);
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v129 + 104,  (__n128 *)(v130 + 104));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 136,  (__n128 *)(v130 + 136));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 168,  (__n128 *)(v130 + 168));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v129 + 200));
                  *(_OWORD *)(v129 + 200) = *(_OWORD *)(v130 + 200);
                  *(void *)(v129 + 216) = *(void *)(v130 + 216);
                  *(void *)(v130 + 200) = 0LL;
                  *(void *)(v130 + 208) = 0LL;
                  *(void *)(v130 + 216) = 0LL;
                  uint64_t v129 = v130;
                }

                while (v128 <= (uint64_t)((unint64_t)(v121 - 2) >> 1));
                if ((__int128 *)v130 == v201 - 14)
                {
                  __int128 v169 = v203;
                  __int128 v170 = v205;
                  *(_OWORD *)(v130 + 16) = v204;
                  *(_OWORD *)(v130 + 32) = v170;
                  *(_OWORD *)uint64_t v130 = v169;
                  __int128 v171 = v206;
                  __int128 v172 = v207;
                  __int128 v173 = v208;
                  *(void *)(v130 + 96) = v209;
                  *(_OWORD *)(v130 + 64) = v172;
                  *(_OWORD *)(v130 + 80) = v173;
                  *(_OWORD *)(v130 + 48) = v171;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  *(_OWORD *)(v130 + 200) = v219;
                  *(void *)(v130 + 216) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                }

                else
                {
                  __int128 v138 = *(v201 - 14);
                  __int128 v139 = *(v201 - 12);
                  *(_OWORD *)(v130 + 16) = *(v201 - 13);
                  *(_OWORD *)(v130 + 32) = v139;
                  *(_OWORD *)uint64_t v130 = v138;
                  __int128 v140 = *(v201 - 11);
                  __int128 v141 = *(v201 - 10);
                  __int128 v142 = *(v201 - 9);
                  *(void *)(v130 + 96) = *((void *)v201 - 16);
                  *(_OWORD *)(v130 + 64) = v141;
                  *(_OWORD *)(v130 + 80) = v142;
                  *(_OWORD *)(v130 + 48) = v140;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)((char *)v201 - 120));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)((char *)v201 - 88));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)((char *)v201 - 56));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  v143 = (void *)v201 - 3;
                  *(_OWORD *)(v130 + 200) = *(__int128 *)((char *)v201 - 24);
                  *(void *)(v130 + 216) = *((void *)v201 - 1);
                  void *v143 = 0LL;
                  v143[1] = 0LL;
                  v143[2] = 0LL;
                  __int128 v144 = v203;
                  __int128 v145 = v205;
                  *(v201 - 13) = v204;
                  *(v201 - 12) = v145;
                  *(v201 - 14) = v144;
                  __int128 v146 = v206;
                  __int128 v147 = v207;
                  __int128 v148 = v208;
                  *((void *)v201 - 16) = v209;
                  *(v201 - 10) = v147;
                  *(v201 - 9) = v148;
                  *(v201 - 11) = v146;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v201 - 120,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 88,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 56,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v201 - 3);
                  *(__int128 *)((char *)v201 - 24) = v219;
                  *((void *)v201 - 1) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                  uint64_t v149 = v130 + 224 - a1;
                  if (v149 >= 225)
                  {
                    uint64_t v151 = a1 + 224 * v150;
                    if (*(void *)v151 < *(void *)v130)
                    {
                      __int128 v152 = *(_OWORD *)v130;
                      __int128 v153 = *(_OWORD *)(v130 + 32);
                      __int128 v223 = *(_OWORD *)(v130 + 16);
                      __int128 v224 = v153;
                      __int128 v222 = v152;
                      __int128 v154 = *(_OWORD *)(v130 + 48);
                      __int128 v155 = *(_OWORD *)(v130 + 64);
                      __int128 v156 = *(_OWORD *)(v130 + 80);
                      uint64_t v228 = *(void *)(v130 + 96);
                      __int128 v226 = v155;
                      __int128 v227 = v156;
                      __int128 v225 = v154;
                      v229.n128_u8[0] = 0;
                      char v231 = 0;
                      if (*(_BYTE *)(v130 + 128))
                      {
                        __n128 v157 = *v137;
                        uint64_t v230 = *(void *)(v130 + 120);
                        __n128 v229 = v157;
                        *(void *)(v130 + 112) = 0LL;
                        *(void *)(v130 + 120) = 0LL;
                        v137->n128_u64[0] = 0LL;
                        char v231 = 1;
                      }

                      v232.n128_u8[0] = 0;
                      char v234 = 0;
                      if (*(_BYTE *)(v130 + 160))
                      {
                        __n128 v232 = *(__n128 *)(v130 + 136);
                        uint64_t v233 = *(void *)(v130 + 152);
                        *(void *)(v130 + 136) = 0LL;
                        *(void *)(v130 + 144) = 0LL;
                        *(void *)(v130 + 152) = 0LL;
                        char v234 = 1;
                      }

                      __p.n128_u8[0] = 0;
                      char v237 = 0;
                      if (*(_BYTE *)(v130 + 192))
                      {
                        __n128 __p = *(__n128 *)(v130 + 168);
                        uint64_t v236 = *(void *)(v130 + 184);
                        *(void *)(v130 + 168) = 0LL;
                        *(void *)(v130 + 176) = 0LL;
                        *(void *)(v130 + 184) = 0LL;
                        char v237 = 1;
                      }

                      __int128 v238 = *(_OWORD *)(v130 + 200);
                      uint64_t v239 = *(void *)(v130 + 216);
                      *(void *)(v130 + 200) = 0LL;
                      *(void *)(v130 + 208) = 0LL;
                      *(void *)(v130 + 216) = 0LL;
                      do
                      {
                        uint64_t v158 = v151;
                        __int128 v159 = *(_OWORD *)v151;
                        __int128 v160 = *(_OWORD *)(v151 + 32);
                        *(_OWORD *)(v130 + 16) = *(_OWORD *)(v151 + 16);
                        *(_OWORD *)(v130 + 32) = v160;
                        *(_OWORD *)uint64_t v130 = v159;
                        __int128 v161 = *(_OWORD *)(v151 + 48);
                        __int128 v162 = *(_OWORD *)(v151 + 64);
                        __int128 v163 = *(_OWORD *)(v151 + 80);
                        *(void *)(v130 + 96) = *(void *)(v151 + 96);
                        *(_OWORD *)(v130 + 64) = v162;
                        *(_OWORD *)(v130 + 80) = v163;
                        *(_OWORD *)(v130 + 48) = v161;
                        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)(v151 + 104));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)(v158 + 136));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)(v158 + 168));
                        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                        *(_OWORD *)(v130 + 200) = *(_OWORD *)(v158 + 200);
                        *(void *)(v130 + 216) = *(void *)(v158 + 216);
                        *(void *)(v158 + 200) = 0LL;
                        *(void *)(v158 + 208) = 0LL;
                        *(void *)(v158 + 216) = 0LL;
                        if (!v150) {
                          break;
                        }
                        unint64_t v150 = (v150 - 1) >> 1;
                        uint64_t v151 = a1 + 224 * v150;
                        uint64_t v130 = v158;
                      }

                      while (*(void *)v151 < (unint64_t)v222);
                      __int128 v164 = v222;
                      __int128 v165 = v224;
                      *(_OWORD *)(v158 + 16) = v223;
                      *(_OWORD *)(v158 + 32) = v165;
                      *(_OWORD *)uint64_t v158 = v164;
                      __int128 v166 = v225;
                      __int128 v167 = v226;
                      __int128 v168 = v227;
                      *(void *)(v158 + 96) = v228;
                      *(_OWORD *)(v158 + 64) = v167;
                      *(_OWORD *)(v158 + 80) = v168;
                      *(_OWORD *)(v158 + 48) = v166;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v158 + 104,  &v229);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 136,  &v232);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 168,  &__p);
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v158 + 200));
                      *(_OWORD *)(v158 + 200) = v238;
                      *(void *)(v158 + 216) = v239;
                      __int128 v238 = 0uLL;
                      uint64_t v239 = 0LL;
                      v221 = (void **)&v238;
                      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v221);
                      if (v237 && __p.n128_u64[0])
                      {
                        __p.n128_u64[1] = __p.n128_u64[0];
                        operator delete((void *)__p.n128_u64[0]);
                      }

                      if (v234 && v232.n128_u64[0])
                      {
                        v232.n128_u64[1] = v232.n128_u64[0];
                        operator delete((void *)v232.n128_u64[0]);
                      }

                      if (v231 && SHIBYTE(v230) < 0) {
                        operator delete((void *)v229.n128_u64[0]);
                      }
                    }
                  }
                }

                *(void *)&__int128 v222 = &v219;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v222);
                if (v218 && v216.n128_u64[0])
                {
                  v216.n128_u64[1] = v216.n128_u64[0];
                  operator delete((void *)v216.n128_u64[0]);
                }

                if (v215 && v213.n128_u64[0])
                {
                  v213.n128_u64[1] = v213.n128_u64[0];
                  operator delete((void *)v213.n128_u64[0]);
                }

                if (v212 && SHIBYTE(v211) < 0) {
                  operator delete((void *)v210.n128_u64[0]);
                }
                BOOL v174 = v121-- <= 2;
                uint64_t v7 = v201 - 14;
              }

              while (!v174);
            }

            return;
          }

          unint64_t v10 = v9 >> 1;
          uint64_t v11 = (__int128 *)(a1 + 224 * (v9 >> 1));
          if ((unint64_t)v8 <= 0x7000)
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224 * (v9 >> 1)),  (__int128 *)a1,  v197);
          }

          else
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224 * (v9 >> 1)),  v197);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224),  (__int128 *)(224 * v10 + a1 - 224),  v196);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 448),  (__int128 *)(a1 + 224 + 224 * v10),  v195);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(224 * v10 + a1 - 224),  v11,  (__int128 *)(a1 + 224 + 224 * v10));
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)a1, v11);
          }

          --a3;
          if ((a4 & 1) == 0 && *(void *)(a1 - 224) >= *(void *)a1)
          {
            __int128 v40 = *(_OWORD *)a1;
            __int128 v41 = *(_OWORD *)(a1 + 32);
            __int128 v223 = *(_OWORD *)(a1 + 16);
            __int128 v224 = v41;
            __int128 v222 = v40;
            __int128 v42 = *(_OWORD *)(a1 + 48);
            __int128 v43 = *(_OWORD *)(a1 + 64);
            __int128 v44 = *(_OWORD *)(a1 + 80);
            uint64_t v228 = *(void *)(a1 + 96);
            __int128 v226 = v43;
            __int128 v227 = v44;
            __int128 v225 = v42;
            v229.n128_u8[0] = 0;
            char v231 = 0;
            if (*(_BYTE *)(a1 + 128))
            {
              __n128 v45 = *(__n128 *)(a1 + 104);
              uint64_t v230 = *(void *)(a1 + 120);
              __n128 v229 = v45;
              *(void *)(a1 + 112) = 0LL;
              *(void *)(a1 + 120) = 0LL;
              *(void *)(a1 + 104) = 0LL;
              char v231 = 1;
            }

            v232.n128_u8[0] = 0;
            char v234 = 0;
            if (*(_BYTE *)(a1 + 160))
            {
              __n128 v232 = *(__n128 *)(a1 + 136);
              uint64_t v233 = *(void *)(a1 + 152);
              *(void *)(a1 + 136) = 0LL;
              *(void *)(a1 + 144) = 0LL;
              *(void *)(a1 + 152) = 0LL;
              char v234 = 1;
            }

            __p.n128_u8[0] = 0;
            char v237 = 0;
            if (*(_BYTE *)(a1 + 192))
            {
              __n128 __p = *(__n128 *)(a1 + 168);
              uint64_t v236 = *(void *)(a1 + 184);
              *(void *)(a1 + 168) = 0LL;
              *(void *)(a1 + 176) = 0LL;
              *(void *)(a1 + 184) = 0LL;
              char v237 = 1;
            }

            __int128 v238 = *(_OWORD *)(a1 + 200);
            uint64_t v239 = *(void *)(a1 + 216);
            *(void *)(a1 + 200) = 0LL;
            *(void *)(a1 + 208) = 0LL;
            *(void *)(a1 + 216) = 0LL;
            unint64_t v46 = v222;
            if ((unint64_t)v222 >= *(void *)v197)
            {
              unint64_t v48 = a1 + 224;
              do
              {
                unint64_t v6 = v48;
                v48 += 224LL;
              }

              while ((unint64_t)v222 >= *(void *)v6);
            }

            else
            {
              unint64_t v6 = a1;
              do
              {
                unint64_t v47 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while ((unint64_t)v222 >= v47);
            }

            __int128 v49 = v202;
            if (v6 < (unint64_t)v202)
            {
              __int128 v49 = v202;
              do
              {
                unint64_t v50 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while ((unint64_t)v222 < v50);
            }

            while (v6 < (unint64_t)v49)
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v49);
              do
              {
                unint64_t v51 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v46 >= v51);
              do
              {
                unint64_t v52 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while (v46 < v52);
            }

            v53 = (__int128 *)(v6 - 224);
            if (v6 - 224 != a1)
            {
              __int128 v54 = *v53;
              __int128 v55 = *(_OWORD *)(v6 - 192);
              *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
              *(_OWORD *)(a1 + 32) = v55;
              *(_OWORD *)a1 = v54;
              __int128 v56 = *(_OWORD *)(v6 - 176);
              __int128 v57 = *(_OWORD *)(v6 - 160);
              __int128 v58 = *(_OWORD *)(v6 - 144);
              *(void *)(a1 + 96) = *(void *)(v6 - 128);
              *(_OWORD *)(a1 + 64) = v57;
              *(_OWORD *)(a1 + 80) = v58;
              *(_OWORD *)(a1 + 48) = v56;
              std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
              std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
              *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
              *(void *)(a1 + 216) = *(void *)(v6 - 8);
              *(void *)(v6 - 24) = 0LL;
              *(void *)(v6 - 16) = 0LL;
              *(void *)(v6 - 8) = 0LL;
            }

            __int128 v59 = v222;
            __int128 v60 = v224;
            *(_OWORD *)(v6 - 208) = v223;
            *(_OWORD *)(v6 - 192) = v60;
            __int128 *v53 = v59;
            __int128 v61 = v225;
            __int128 v62 = v226;
            __int128 v63 = v227;
            *(void *)(v6 - 128) = v228;
            *(_OWORD *)(v6 - 160) = v62;
            *(_OWORD *)(v6 - 144) = v63;
            *(_OWORD *)(v6 - 176) = v61;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
            *(_OWORD *)(v6 - 24) = v238;
            *(void *)(v6 - 8) = v239;
            __int128 v238 = 0uLL;
            uint64_t v239 = 0LL;
            *(void *)&__int128 v203 = &v238;
            std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
            if (v237 && __p.n128_u64[0])
            {
              __p.n128_u64[1] = __p.n128_u64[0];
              operator delete((void *)__p.n128_u64[0]);
            }

            if (v234 && v232.n128_u64[0])
            {
              v232.n128_u64[1] = v232.n128_u64[0];
              operator delete((void *)v232.n128_u64[0]);
            }

            if (v231 && SHIBYTE(v230) < 0) {
              operator delete((void *)v229.n128_u64[0]);
            }
            goto LABEL_45;
          }

          __int128 v12 = *(_OWORD *)a1;
          __int128 v13 = *(_OWORD *)(a1 + 32);
          __int128 v223 = *(_OWORD *)(a1 + 16);
          __int128 v224 = v13;
          __int128 v222 = v12;
          __int128 v14 = *(_OWORD *)(a1 + 48);
          __int128 v15 = *(_OWORD *)(a1 + 64);
          __int128 v16 = *(_OWORD *)(a1 + 80);
          uint64_t v228 = *(void *)(a1 + 96);
          __int128 v226 = v15;
          __int128 v227 = v16;
          __int128 v225 = v14;
          v229.n128_u8[0] = 0;
          char v231 = 0;
          if (*(_BYTE *)(a1 + 128))
          {
            __n128 v17 = *(__n128 *)(a1 + 104);
            uint64_t v230 = *(void *)(a1 + 120);
            __n128 v229 = v17;
            *(void *)(a1 + 112) = 0LL;
            *(void *)(a1 + 120) = 0LL;
            *(void *)(a1 + 104) = 0LL;
            char v231 = 1;
          }

          v232.n128_u8[0] = 0;
          char v234 = 0;
          if (*(_BYTE *)(a1 + 160))
          {
            __n128 v232 = *(__n128 *)(a1 + 136);
            uint64_t v233 = *(void *)(a1 + 152);
            *(void *)(a1 + 136) = 0LL;
            *(void *)(a1 + 144) = 0LL;
            *(void *)(a1 + 152) = 0LL;
            char v234 = 1;
          }

          __p.n128_u8[0] = 0;
          char v237 = 0;
          if (*(_BYTE *)(a1 + 192))
          {
            __n128 __p = *(__n128 *)(a1 + 168);
            uint64_t v236 = *(void *)(a1 + 184);
            *(void *)(a1 + 168) = 0LL;
            *(void *)(a1 + 176) = 0LL;
            *(void *)(a1 + 184) = 0LL;
            char v237 = 1;
          }

          uint64_t v18 = 0LL;
          __int128 v238 = *(_OWORD *)(a1 + 200);
          uint64_t v239 = *(void *)(a1 + 216);
          *(void *)(a1 + 200) = 0LL;
          *(void *)(a1 + 208) = 0LL;
          *(void *)(a1 + 216) = 0LL;
          unint64_t v19 = v222;
          do
          {
            unint64_t v20 = *(void *)(a1 + v18 + 224);
            v18 += 224LL;
          }

          while (v20 < (unint64_t)v222);
          unint64_t v21 = a1 + v18;
          uint64_t v22 = v202;
          if (v18 == 224)
          {
            uint64_t v22 = v202;
            do
            {
              unint64_t v24 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v24 >= (unint64_t)v222);
          }

          else
          {
            do
            {
              unint64_t v23 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v23 >= (unint64_t)v222);
          }

          unint64_t v6 = a1 + v18;
          if (v21 < (unint64_t)v22)
          {
            __int128 v25 = v22;
            do
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v25);
              do
              {
                unint64_t v26 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v26 < v19);
              do
              {
                unint64_t v27 = *((void *)v25 - 28);
                v25 -= 14;
              }

              while (v27 >= v19);
            }

            while (v6 < (unint64_t)v25);
          }

          __int128 v28 = (__int128 *)(v6 - 224);
          if (v6 - 224 != a1)
          {
            __int128 v29 = *v28;
            __int128 v30 = *(_OWORD *)(v6 - 192);
            *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
            *(_OWORD *)(a1 + 32) = v30;
            *(_OWORD *)a1 = v29;
            __int128 v31 = *(_OWORD *)(v6 - 176);
            __int128 v32 = *(_OWORD *)(v6 - 160);
            __int128 v33 = *(_OWORD *)(v6 - 144);
            *(void *)(a1 + 96) = *(void *)(v6 - 128);
            *(_OWORD *)(a1 + 64) = v32;
            *(_OWORD *)(a1 + 80) = v33;
            *(_OWORD *)(a1 + 48) = v31;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
            *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
            *(void *)(a1 + 216) = *(void *)(v6 - 8);
            *(void *)(v6 - 24) = 0LL;
            *(void *)(v6 - 16) = 0LL;
            *(void *)(v6 - 8) = 0LL;
          }

          __int128 v34 = v222;
          __int128 v35 = v224;
          *(_OWORD *)(v6 - 208) = v223;
          *(_OWORD *)(v6 - 192) = v35;
          *__int128 v28 = v34;
          __int128 v36 = v225;
          __int128 v37 = v226;
          __int128 v38 = v227;
          *(void *)(v6 - 128) = v228;
          *(_OWORD *)(v6 - 160) = v37;
          *(_OWORD *)(v6 - 144) = v38;
          *(_OWORD *)(v6 - 176) = v36;
          std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
          std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
          *(_OWORD *)(v6 - 24) = v238;
          *(void *)(v6 - 8) = v239;
          __int128 v238 = 0uLL;
          uint64_t v239 = 0LL;
          *(void *)&__int128 v203 = &v238;
          std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
          if (v237 && __p.n128_u64[0])
          {
            __p.n128_u64[1] = __p.n128_u64[0];
            operator delete((void *)__p.n128_u64[0]);
          }

          if (v234 && v232.n128_u64[0])
          {
            v232.n128_u64[1] = v232.n128_u64[0];
            operator delete((void *)v232.n128_u64[0]);
          }

          if (v231 && SHIBYTE(v230) < 0) {
            operator delete((void *)v229.n128_u64[0]);
          }
          BOOL v39 = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)a1,  (__int128 *)(v6 - 224));
          if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)v6,  v202))
          {
            if (v39) {
              continue;
            }
LABEL_44:
            _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( a1,  v6 - 224,  a3,  a4 & 1);
LABEL_45:
            a4 = 0;
            continue;
          }

          a2 = (__int128 *)(v6 - 224);
          if (v39) {
            return;
          }
          goto LABEL_1;
        }

        if ((a4 & 1) != 0)
        {
          if ((__int128 *)a1 != v202)
          {
            unint64_t v67 = a1 + 224;
            if ((__int128 *)(a1 + 224) != v202)
            {
              uint64_t v68 = 0LL;
              unint64_t v69 = a1;
              do
              {
                unint64_t v70 = v67;
                if (*(void *)(v69 + 224) < *(void *)v69)
                {
                  __int128 v71 = *(_OWORD *)v67;
                  __int128 v72 = *(_OWORD *)(v67 + 32);
                  __int128 v223 = *(_OWORD *)(v67 + 16);
                  __int128 v224 = v72;
                  __int128 v222 = v71;
                  __int128 v73 = *(_OWORD *)(v67 + 48);
                  __int128 v74 = *(_OWORD *)(v67 + 64);
                  __int128 v75 = *(_OWORD *)(v67 + 80);
                  uint64_t v228 = *(void *)(v67 + 96);
                  __int128 v226 = v74;
                  __int128 v227 = v75;
                  __int128 v225 = v73;
                  v229.n128_u8[0] = 0;
                  char v231 = 0;
                  if (*(_BYTE *)(v69 + 352))
                  {
                    uint64_t v230 = *(void *)(v69 + 344);
                    __n128 v229 = *(__n128 *)(v69 + 328);
                    *(void *)(v69 + 336) = 0LL;
                    *(void *)(v69 + 344) = 0LL;
                    *(void *)(v69 + 328) = 0LL;
                    char v231 = 1;
                  }

                  unint64_t v76 = (__n128 *)(v69 + 360);
                  v232.n128_u8[0] = 0;
                  char v234 = 0;
                  if (*(_BYTE *)(v69 + 384))
                  {
                    __n128 v232 = *v76;
                    uint64_t v233 = *(void *)(v69 + 376);
                    v76->n128_u64[0] = 0LL;
                    *(void *)(v69 + 368) = 0LL;
                    *(void *)(v69 + 376) = 0LL;
                    char v234 = 1;
                  }

                  __p.n128_u8[0] = 0;
                  char v237 = 0;
                  if (*(_BYTE *)(v69 + 416))
                  {
                    __n128 __p = *(__n128 *)(v69 + 392);
                    uint64_t v236 = *(void *)(v69 + 408);
                    *(void *)(v69 + 392) = 0LL;
                    *(void *)(v69 + 400) = 0LL;
                    *(void *)(v69 + 408) = 0LL;
                    char v237 = 1;
                  }

                  __int128 v238 = *(_OWORD *)(v69 + 424);
                  uint64_t v239 = *(void *)(v69 + 440);
                  *(void *)(v69 + 424) = 0LL;
                  *(void *)(v69 + 432) = 0LL;
                  *(void *)(v69 + 440) = 0LL;
                  uint64_t v77 = v68;
                  while (1)
                  {
                    uint64_t v78 = v77;
                    uint64_t v79 = a1 + v77;
                    __int128 v80 = *(_OWORD *)(a1 + v77 + 80);
                    *(_OWORD *)(v79 + 288) = *(_OWORD *)(a1 + v77 + 64);
                    *(_OWORD *)(v79 + 304) = v80;
                    *(void *)(v79 + 320) = *(void *)(a1 + v77 + 96);
                    __int128 v81 = *(_OWORD *)(a1 + v77 + 16);
                    *(_OWORD *)(v79 + 224) = *(_OWORD *)v79;
                    *(_OWORD *)(v79 + 240) = v81;
                    __int128 v82 = *(_OWORD *)(a1 + v77 + 48);
                    *(_OWORD *)(v79 + 256) = *(_OWORD *)(a1 + v77 + 32);
                    *(_OWORD *)(v79 + 272) = v82;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v77 + 328,  (__n128 *)(a1 + v77 + 104));
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v79 + 360,  (__n128 *)(v79 + 136));
                    uint64_t v83 = a1 + v78;
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 392,  (__n128 *)(a1 + v78 + 168));
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + v78 + 424));
                    *(_OWORD *)(v83 + 424) = *(_OWORD *)(v83 + 200);
                    *(void *)(v83 + 440) = *(void *)(v83 + 216);
                    *(void *)(v83 + 208) = 0LL;
                    *(void *)(v83 + 216) = 0LL;
                    *(void *)(v83 + 200) = 0LL;
                    if (!v78) {
                      break;
                    }
                    uint64_t v77 = v78 - 224;
                    if ((unint64_t)v222 >= *(void *)(a1 + v78 - 224))
                    {
                      unint64_t v84 = a1 + v78;
                      goto LABEL_107;
                    }
                  }

                  unint64_t v84 = a1;
LABEL_107:
                  __int128 v85 = v222;
                  __int128 v86 = v224;
                  *(_OWORD *)(v84 + 16) = v223;
                  *(_OWORD *)(v84 + 32) = v86;
                  *(_OWORD *)unint64_t v84 = v85;
                  __int128 v87 = v225;
                  __int128 v88 = v226;
                  __int128 v89 = v227;
                  *(void *)(v84 + 96) = v228;
                  *(_OWORD *)(v84 + 64) = v88;
                  *(_OWORD *)(v84 + 80) = v89;
                  *(_OWORD *)(v84 + 48) = v87;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v78 + 104,  &v229);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 136,  &v232);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 168,  &__p);
                  __int128 v90 = (uint64_t *)(a1 + v78 + 200);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v90);
                  *__int128 v90 = v238;
                  *(void *)(v84 + 208) = *((void *)&v238 + 1);
                  *(void *)(v84 + 216) = v239;
                  __int128 v238 = 0uLL;
                  uint64_t v239 = 0LL;
                  *(void *)&__int128 v203 = &v238;
                  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                  if (v237 && __p.n128_u64[0])
                  {
                    __p.n128_u64[1] = __p.n128_u64[0];
                    operator delete((void *)__p.n128_u64[0]);
                  }

                  if (v234 && v232.n128_u64[0])
                  {
                    v232.n128_u64[1] = v232.n128_u64[0];
                    operator delete((void *)v232.n128_u64[0]);
                  }

                  if (v231 && SHIBYTE(v230) < 0) {
                    operator delete((void *)v229.n128_u64[0]);
                  }
                  uint64_t v7 = v202;
                }

                unint64_t v67 = v70 + 224;
                v68 += 224LL;
                unint64_t v69 = v70;
              }

              while ((__int128 *)(v70 + 224) != v7);
            }
          }
        }

        else if ((__int128 *)a1 != v202)
        {
          unint64_t v175 = a1 + 224;
          if ((__int128 *)(a1 + 224) != v202)
          {
            unint64_t v176 = a1 - 224;
            do
            {
              unint64_t v177 = v175;
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                __int128 v178 = *(_OWORD *)v175;
                __int128 v179 = *(_OWORD *)(v175 + 32);
                __int128 v223 = *(_OWORD *)(v175 + 16);
                __int128 v224 = v179;
                __int128 v222 = v178;
                __int128 v180 = *(_OWORD *)(v175 + 48);
                __int128 v181 = *(_OWORD *)(v175 + 64);
                __int128 v182 = *(_OWORD *)(v175 + 80);
                uint64_t v228 = *(void *)(v175 + 96);
                __int128 v226 = v181;
                __int128 v227 = v182;
                __int128 v225 = v180;
                v229.n128_u8[0] = 0;
                char v231 = 0;
                if (*(_BYTE *)(a1 + 352))
                {
                  uint64_t v230 = *(void *)(a1 + 344);
                  __n128 v229 = *(__n128 *)(a1 + 328);
                  *(void *)(a1 + 336) = 0LL;
                  *(void *)(a1 + 344) = 0LL;
                  *(void *)(a1 + 328) = 0LL;
                  char v231 = 1;
                }

                v183 = (__n128 *)(a1 + 360);
                v232.n128_u8[0] = 0;
                char v234 = 0;
                if (*(_BYTE *)(a1 + 384))
                {
                  __n128 v232 = *v183;
                  uint64_t v233 = *(void *)(a1 + 376);
                  v183->n128_u64[0] = 0LL;
                  *(void *)(a1 + 368) = 0LL;
                  *(void *)(a1 + 376) = 0LL;
                  char v234 = 1;
                }

                __p.n128_u8[0] = 0;
                char v237 = 0;
                if (*(_BYTE *)(a1 + 416))
                {
                  __n128 __p = *(__n128 *)(a1 + 392);
                  uint64_t v236 = *(void *)(a1 + 408);
                  *(void *)(a1 + 392) = 0LL;
                  *(void *)(a1 + 400) = 0LL;
                  *(void *)(a1 + 408) = 0LL;
                  char v237 = 1;
                }

                __int128 v238 = *(_OWORD *)(a1 + 424);
                uint64_t v239 = *(void *)(a1 + 440);
                *(void *)(a1 + 424) = 0LL;
                *(void *)(a1 + 432) = 0LL;
                *(void *)(a1 + 440) = 0LL;
                unint64_t v184 = v176;
                do
                {
                  __int128 v185 = *(_OWORD *)(v184 + 304);
                  *(_OWORD *)(v184 + 512) = *(_OWORD *)(v184 + 288);
                  *(_OWORD *)(v184 + 528) = v185;
                  *(void *)(v184 + 544) = *(void *)(v184 + 320);
                  __int128 v186 = *(_OWORD *)(v184 + 240);
                  *(_OWORD *)(v184 + 448) = *(_OWORD *)(v184 + 224);
                  *(_OWORD *)(v184 + 464) = v186;
                  __int128 v187 = *(_OWORD *)(v184 + 272);
                  *(_OWORD *)(v184 + 480) = *(_OWORD *)(v184 + 256);
                  *(_OWORD *)(v184 + 496) = v187;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  (__n128 *)(v184 + 328));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  (__n128 *)(v184 + 360));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  (__n128 *)(v184 + 392));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                  *(_OWORD *)(v184 + 648) = *(_OWORD *)(v184 + 424);
                  *(void *)(v184 + 664) = *(void *)(v184 + 440);
                  *(void *)(v184 + 424) = 0LL;
                  *(void *)(v184 + 432) = 0LL;
                  *(void *)(v184 + 440) = 0LL;
                  unint64_t v188 = *(void *)v184;
                  v184 -= 224LL;
                }

                while ((unint64_t)v222 < v188);
                __int128 v189 = v222;
                __int128 v190 = v224;
                *(_OWORD *)(v184 + 464) = v223;
                *(_OWORD *)(v184 + 480) = v190;
                *(_OWORD *)(v184 + 448) = v189;
                __int128 v191 = v225;
                __int128 v192 = v226;
                __int128 v193 = v227;
                *(void *)(v184 + 544) = v228;
                *(_OWORD *)(v184 + 512) = v192;
                *(_OWORD *)(v184 + 528) = v193;
                *(_OWORD *)(v184 + 496) = v191;
                std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  &v229);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  &v232);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  &__p);
                std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                *(_OWORD *)(v184 + 648) = v238;
                *(void *)(v184 + 664) = v239;
                __int128 v238 = 0uLL;
                uint64_t v239 = 0LL;
                *(void *)&__int128 v203 = &v238;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                if (v237 && __p.n128_u64[0])
                {
                  __p.n128_u64[1] = __p.n128_u64[0];
                  operator delete((void *)__p.n128_u64[0]);
                }

                if (v234 && v232.n128_u64[0])
                {
                  v232.n128_u64[1] = v232.n128_u64[0];
                  operator delete((void *)v232.n128_u64[0]);
                }

                if (v231 && SHIBYTE(v230) < 0) {
                  operator delete((void *)v229.n128_u64[0]);
                }
                uint64_t v7 = v202;
              }

              unint64_t v175 = v177 + 224;
              v176 += 224LL;
              a1 = v177;
            }

            while ((__int128 *)(v177 + 224) != v7);
          }
        }

        return;
    }
  }

void _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( __int128 *a1, __int128 *a2, __int128 *a3)
{
  __int128 v5 = a1;
  unint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)a3;
  if (*(void *)a2 < *(void *)a1)
  {
    if (v7 >= v6)
    {
      std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1, a2);
      if (*(void *)a3 >= *(void *)a2) {
        return;
      }
      a1 = a2;
    }

    uint64_t v8 = a3;
    goto LABEL_9;
  }

  if (v7 < v6)
  {
    std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a2, a3);
    if (*(void *)a2 < *(void *)v5)
    {
      a1 = v5;
      uint64_t v8 = a2;
LABEL_9:
      std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1, v8);
    }
  }

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( __int128 *a1, __int128 *a2)
{
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a2 - (char *)a1) >> 5);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      if (*((void *)a2 - 28) < *(void *)a1)
      {
        unint64_t v6 = a1;
        unint64_t v7 = a2 - 14;
        goto LABEL_4;
      }

      return result;
    case 3LL:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a2 - 14);
      return 1LL;
    case 4LL:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a2 - 14);
      return 1LL;
    case 5LL:
      unint64_t v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a1 + 42);
      unint64_t v26 = *((void *)a2 - 28);
      __int128 v25 = a2 - 14;
      if (v26 < *((void *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((void *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((void *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((void *)a1 + 28) < *(void *)a1)
            {
              unint64_t v6 = a1;
              unint64_t v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a1 + 28);
      unint64_t v9 = a1 + 42;
      BOOL result = 1LL;
      if (a1 + 42 == a2) {
        return result;
      }
      uint64_t v10 = 0LL;
      int v11 = 0;
      break;
  }

  while (1)
  {
    if (*(void *)v9 < *(void *)v8)
    {
      __int128 v31 = v9[4];
      __int128 v32 = v9[5];
      uint64_t v33 = *((void *)v9 + 12);
      __int128 v27 = *v9;
      __int128 v28 = v9[1];
      __int128 v29 = v9[2];
      __int128 v30 = v9[3];
      v34.n128_u8[0] = 0;
      char v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        __n128 v34 = *(__n128 *)((char *)v9 + 104);
        uint64_t v35 = *((void *)v9 + 15);
        *((void *)v9 + 14) = 0LL;
        *((void *)v9 + 15) = 0LL;
        *((void *)v9 + 13) = 0LL;
        char v36 = 1;
      }

      v37.n128_u8[0] = 0;
      char v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        __n128 v37 = *(__n128 *)((char *)v9 + 136);
        uint64_t v38 = *((void *)v9 + 19);
        *((void *)v9 + 18) = 0LL;
        *((void *)v9 + 19) = 0LL;
        *((void *)v9 + 17) = 0LL;
        char v39 = 1;
      }

      __p.n128_u8[0] = 0;
      char v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __n128 __p = *(__n128 *)((char *)v9 + 168);
        uint64_t v41 = *((void *)v9 + 23);
        *((void *)v9 + 22) = 0LL;
        *((void *)v9 + 23) = 0LL;
        *((void *)v9 + 21) = 0LL;
        char v42 = 1;
      }

      __int128 v43 = *(__int128 *)((char *)v9 + 200);
      uint64_t v44 = *((void *)v9 + 27);
      *((void *)v9 + 26) = 0LL;
      *((void *)v9 + 27) = 0LL;
      *((void *)v9 + 25) = 0LL;
      uint64_t v12 = v10;
      while (1)
      {
        uint64_t v13 = v12;
        __int128 v14 = (char *)a1 + v12;
        __int128 v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((void *)v14 + 96) = *(void *)((char *)a1 + v12 + 544);
        __int128 v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        __int128 v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)a1 + v12 + 776,  (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v14 + 808),  (__n128 *)(v14 + 584));
        uint64_t v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a1 + v13 + 840,  (__n128 *)((char *)a1 + v13 + 616));
        unint64_t v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((void *)v18 + 111) = *((void *)v18 + 83);
        *((void *)v18 + 83) = 0LL;
        *unint64_t v19 = 0u;
        if (v13 == -448) {
          break;
        }
        uint64_t v12 = v13 - 224;
        if ((unint64_t)v27 >= *(void *)((char *)a1 + v13 + 224))
        {
          uint64_t v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }

      uint64_t v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(void *)(v20 + 96) = v33;
      *(_OWORD *)uint64_t v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      unint64_t v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)(v21 + 69),  &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 73),  &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 77),  &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      uint64_t v22 = *((void *)&v43 + 1);
      v21[81] = v43;
      uint64_t v23 = v44;
      *(void *)(v20 + 208) = v22;
      *(void *)(v20 + 216) = v23;
      uint64_t v44 = 0LL;
      __int128 v43 = 0uLL;
      __n128 v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }

      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }

      if (v36 && SHIBYTE(v35) < 0) {
        operator delete((void *)v34.n128_u64[0]);
      }
      if (++v11 == 8) {
        return v9 + 14 == a2;
      }
    }

    uint64_t v8 = v9;
    v10 += 224LL;
    v9 += 14;
    if (v9 == a2) {
      return 1LL;
    }
  }

void std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(__int128 *a1, __int128 *a2)
{
  __int128 v13 = a1[4];
  __int128 v14 = a1[5];
  uint64_t v15 = *((void *)a1 + 12);
  __int128 v9 = *a1;
  __int128 v10 = a1[1];
  __int128 v11 = a1[2];
  __int128 v12 = a1[3];
  v16.n128_u8[0] = 0;
  char v18 = 0;
  if (*((_BYTE *)a1 + 128))
  {
    __n128 v16 = *(__n128 *)((char *)a1 + 104);
    uint64_t v17 = *((void *)a1 + 15);
    *((void *)a1 + 14) = 0LL;
    *((void *)a1 + 15) = 0LL;
    *((void *)a1 + 13) = 0LL;
    char v18 = 1;
  }

  v19.n128_u8[0] = 0;
  char v21 = 0;
  if (*((_BYTE *)a1 + 160))
  {
    __n128 v19 = *(__n128 *)((char *)a1 + 136);
    uint64_t v20 = *((void *)a1 + 19);
    *((void *)a1 + 18) = 0LL;
    *((void *)a1 + 19) = 0LL;
    *((void *)a1 + 17) = 0LL;
    char v21 = 1;
  }

  __p.n128_u8[0] = 0;
  char v24 = 0;
  if (*((_BYTE *)a1 + 192))
  {
    __n128 __p = *(__n128 *)((char *)a1 + 168);
    uint64_t v23 = *((void *)a1 + 23);
    *((void *)a1 + 22) = 0LL;
    *((void *)a1 + 23) = 0LL;
    *((void *)a1 + 21) = 0LL;
    char v24 = 1;
  }

  __int128 v25 = *(__int128 *)((char *)a1 + 200);
  uint64_t v26 = *((void *)a1 + 27);
  *((void *)a1 + 26) = 0LL;
  *((void *)a1 + 27) = 0LL;
  *((void *)a1 + 25) = 0LL;
  __int128 v5 = a2[4];
  __int128 v4 = a2[5];
  __int128 v6 = a2[3];
  *((void *)a1 + 12) = *((void *)a2 + 12);
  a1[4] = v5;
  a1[5] = v4;
  a1[3] = v6;
  __int128 v7 = *a2;
  __int128 v8 = a2[2];
  a1[1] = a2[1];
  a1[2] = v8;
  *a1 = v7;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)a1 + 104,  (__n128 *)((char *)a2 + 104));
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a1 + 136,  (__n128 *)((char *)a2 + 136));
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a1 + 168,  (__n128 *)((char *)a2 + 168));
  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)a1 + 25);
  *(__int128 *)((char *)a1 + 200) = *(__int128 *)((char *)a2 + 200);
  *((void *)a1 + 27) = *((void *)a2 + 27);
  *((void *)a2 + 25) = 0LL;
  *((void *)a2 + 26) = 0LL;
  *((void *)a2 + 27) = 0LL;
  a2[4] = v13;
  a2[5] = v14;
  *((void *)a2 + 12) = v15;
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v12;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)a2 + 104,  &v16);
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a2 + 136,  &v19);
  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a2 + 168,  &__p);
  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)a2 + 25);
  *(__int128 *)((char *)a2 + 200) = v25;
  *((void *)a2 + 27) = v26;
  uint64_t v26 = 0LL;
  __int128 v25 = 0uLL;
  __int128 v27 = (void **)&v25;
  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v27);
  if (v24 && __p.n128_u64[0])
  {
    __p.n128_u64[1] = __p.n128_u64[0];
    operator delete((void *)__p.n128_u64[0]);
  }

  if (v21 && v19.n128_u64[0])
  {
    v19.n128_u64[1] = v19.n128_u64[0];
    operator delete((void *)v19.n128_u64[0]);
  }

  if (v18)
  {
    if (SHIBYTE(v17) < 0) {
      operator delete((void *)v16.n128_u64[0]);
    }
  }

void _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( __int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4)
{
  if (*(void *)a4 < *(void *)a3)
  {
    std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a3, a4);
    if (*(void *)a3 < *(void *)a2)
    {
      std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a2, a3);
      if (*(void *)a2 < *(void *)a1) {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1, a2);
      }
    }
  }

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  v197 = a2 - 14;
  v202 = a2;
  v195 = a2 - 42;
  v196 = a2 - 28;
  unint64_t v6 = a1;
  while (2)
  {
    a1 = v6;
    __int128 v7 = v202;
    uint64_t v8 = (uint64_t)v202 - v6;
    unint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)((uint64_t)v202 - v6) >> 5);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        int64_t v64 = v202 - 14;
        if (*((void *)v202 - 28) < *(void *)a1)
        {
          int64_t v65 = (__int128 *)a1;
          goto LABEL_83;
        }

        return;
      case 3uLL:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  v197);
        return;
      case 4uLL:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  v197);
        return;
      case 5uLL:
        uint64_t v66 = (void *)(a1 + 448);
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  (__int128 *)(a1 + 672));
        if (*((void *)v202 - 28) < *(void *)(a1 + 672))
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 672), v202 - 14);
          if (*(void *)(a1 + 672) < *v66)
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 448), (__int128 *)(a1 + 672));
            if (*v66 < *(void *)(a1 + 224))
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 224), (__int128 *)(a1 + 448));
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                int64_t v65 = (__int128 *)a1;
                int64_t v64 = (__int128 *)(a1 + 224);
LABEL_83:
                std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v65, v64);
              }
            }
          }
        }

        return;
      default:
        if (v8 > 5375)
        {
          if (!a3)
          {
            if ((__int128 *)a1 != v202)
            {
              int64_t v200 = (v9 - 2) >> 1;
              int64_t v91 = v200;
              do
              {
                int64_t v92 = v91;
                if (v200 >= v91)
                {
                  uint64_t v93 = (2 * v91) | 1;
                  __n128 v94 = (__int128 *)(a1 + 224 * v93);
                  if (2 * v92 + 2 >= (uint64_t)v9)
                  {
                    unint64_t v95 = *(void *)v94;
                  }

                  else
                  {
                    unint64_t v95 = *(void *)v94;
                    unint64_t v96 = *((void *)v94 + 28);
                    if (*(void *)v94 <= v96) {
                      unint64_t v95 = *((void *)v94 + 28);
                    }
                    if (*(void *)v94 < v96)
                    {
                      v94 += 14;
                      uint64_t v93 = 2 * v92 + 2;
                    }
                  }

                  unint64_t v97 = a1 + 224 * v92;
                  if (v95 >= *(void *)v97)
                  {
                    __int128 v98 = *(_OWORD *)v97;
                    __int128 v99 = *(_OWORD *)(v97 + 32);
                    __int128 v223 = *(_OWORD *)(v97 + 16);
                    __int128 v224 = v99;
                    __int128 v222 = v98;
                    __int128 v100 = *(_OWORD *)(v97 + 48);
                    __int128 v101 = *(_OWORD *)(v97 + 64);
                    __int128 v102 = *(_OWORD *)(v97 + 80);
                    uint64_t v228 = *(void *)(v97 + 96);
                    __int128 v226 = v101;
                    __int128 v227 = v102;
                    __int128 v225 = v100;
                    v229.n128_u8[0] = 0;
                    char v231 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 128))
                    {
                      unint64_t v103 = a1 + 224 * v92;
                      __n128 v104 = *(__n128 *)(v103 + 104);
                      uint64_t v230 = *(void *)(v103 + 120);
                      __n128 v229 = v104;
                      *(void *)(v103 + 112) = 0LL;
                      *(void *)(v103 + 120) = 0LL;
                      *(void *)(v103 + 104) = 0LL;
                      char v231 = 1;
                    }

                    v232.n128_u8[0] = 0;
                    char v234 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 160))
                    {
                      unint64_t v105 = a1 + 224 * v92;
                      __n128 v232 = *(__n128 *)(v105 + 136);
                      uint64_t v233 = *(void *)(v105 + 152);
                      *(void *)(v105 + 136) = 0LL;
                      *(void *)(v105 + 144) = 0LL;
                      *(void *)(v105 + 152) = 0LL;
                      char v234 = 1;
                    }

                    __p.n128_u8[0] = 0;
                    char v237 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 192))
                    {
                      unint64_t v106 = a1 + 224 * v92;
                      __n128 __p = *(__n128 *)(v106 + 168);
                      uint64_t v236 = *(void *)(v106 + 184);
                      *(void *)(v106 + 168) = 0LL;
                      *(void *)(v106 + 176) = 0LL;
                      *(void *)(v106 + 184) = 0LL;
                      char v237 = 1;
                    }

                    int64_t v198 = v92;
                    unint64_t v107 = a1 + 224 * v92;
                    __int128 v238 = *(_OWORD *)(v107 + 200);
                    uint64_t v239 = *(void *)(v107 + 216);
                    *(void *)(v107 + 200) = 0LL;
                    *(void *)(v107 + 208) = 0LL;
                    *(void *)(v107 + 216) = 0LL;
                    do
                    {
                      __int128 v108 = v94;
                      __int128 v109 = *v94;
                      __int128 v110 = v94[2];
                      *(_OWORD *)(v97 + 16) = v94[1];
                      *(_OWORD *)(v97 + 32) = v110;
                      *(_OWORD *)unint64_t v97 = v109;
                      __int128 v111 = v94[3];
                      __int128 v112 = v94[4];
                      __int128 v113 = v94[5];
                      *(void *)(v97 + 96) = *((void *)v94 + 12);
                      *(_OWORD *)(v97 + 64) = v112;
                      *(_OWORD *)(v97 + 80) = v113;
                      *(_OWORD *)(v97 + 48) = v111;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v97 + 104,  (__n128 *)((char *)v94 + 104));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 136,  (__n128 *)((char *)v108 + 136));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 168,  (__n128 *)((char *)v108 + 168));
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v97 + 200));
                      *(_OWORD *)(v97 + 200) = *(__int128 *)((char *)v108 + 200);
                      *(void *)(v97 + 216) = *((void *)v108 + 27);
                      *((void *)v108 + 25) = 0LL;
                      *((void *)v108 + 26) = 0LL;
                      *((void *)v108 + 27) = 0LL;
                      if (v200 < v93) {
                        break;
                      }
                      __n128 v94 = (__int128 *)(a1 + 224 * ((2 * v93) | 1));
                      if (2 * v93 + 2 >= (uint64_t)v9)
                      {
                        unint64_t v114 = *(void *)v94;
                        uint64_t v93 = (2 * v93) | 1;
                      }

                      else
                      {
                        unint64_t v114 = *(void *)v94;
                        unint64_t v115 = *((void *)v94 + 28);
                        if (*(void *)v94 <= v115) {
                          unint64_t v114 = *((void *)v94 + 28);
                        }
                        if (*(void *)v94 >= v115)
                        {
                          uint64_t v93 = (2 * v93) | 1;
                        }

                        else
                        {
                          v94 += 14;
                          uint64_t v93 = 2 * v93 + 2;
                        }
                      }

                      unint64_t v97 = (unint64_t)v108;
                    }

                    while (v114 >= (unint64_t)v222);
                    __int128 v116 = v222;
                    __int128 v117 = v224;
                    v108[1] = v223;
                    v108[2] = v117;
                    *__int128 v108 = v116;
                    __int128 v118 = v225;
                    __int128 v119 = v226;
                    __int128 v120 = v227;
                    *((void *)v108 + 12) = v228;
                    v108[4] = v119;
                    v108[5] = v120;
                    v108[3] = v118;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v108 + 104,  &v229);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 136,  &v232);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 168,  &__p);
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v108 + 25);
                    *(__int128 *)((char *)v108 + 200) = v238;
                    *((void *)v108 + 27) = v239;
                    __int128 v238 = 0uLL;
                    uint64_t v239 = 0LL;
                    *(void *)&__int128 v203 = &v238;
                    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                    if (v237 && __p.n128_u64[0])
                    {
                      __p.n128_u64[1] = __p.n128_u64[0];
                      operator delete((void *)__p.n128_u64[0]);
                    }

                    if (v234 && v232.n128_u64[0])
                    {
                      v232.n128_u64[1] = v232.n128_u64[0];
                      operator delete((void *)v232.n128_u64[0]);
                    }

                    if (v231 && SHIBYTE(v230) < 0) {
                      operator delete((void *)v229.n128_u64[0]);
                    }
                    __int128 v7 = v202;
                    int64_t v92 = v198;
                  }
                }

                int64_t v91 = v92 - 1;
              }

              while (v92);
              uint64_t v121 = (((unint64_t)v8 >> 5) * (unsigned __int128)0x2492492492492493uLL) >> 64;
              v194 = (__n128 *)(a1 + 104);
              do
              {
                __int128 v122 = *(_OWORD *)a1;
                __int128 v123 = *(_OWORD *)(a1 + 32);
                __int128 v204 = *(_OWORD *)(a1 + 16);
                __int128 v205 = v123;
                __int128 v203 = v122;
                __int128 v124 = *(_OWORD *)(a1 + 48);
                __int128 v125 = *(_OWORD *)(a1 + 64);
                __int128 v126 = *(_OWORD *)(a1 + 80);
                uint64_t v209 = *(void *)(a1 + 96);
                __int128 v207 = v125;
                __int128 v208 = v126;
                __int128 v206 = v124;
                v210.n128_u8[0] = 0;
                char v212 = 0;
                if (*(_BYTE *)(a1 + 128))
                {
                  __n128 v127 = *v194;
                  uint64_t v211 = *(void *)(a1 + 120);
                  __n128 v210 = v127;
                  *(void *)(a1 + 112) = 0LL;
                  *(void *)(a1 + 120) = 0LL;
                  v194->n128_u64[0] = 0LL;
                  char v212 = 1;
                }

                v213.n128_u8[0] = 0;
                char v215 = 0;
                if (*(_BYTE *)(a1 + 160))
                {
                  __n128 v213 = *(__n128 *)(a1 + 136);
                  uint64_t v214 = *(void *)(a1 + 152);
                  *(void *)(a1 + 136) = 0LL;
                  *(void *)(a1 + 144) = 0LL;
                  *(void *)(a1 + 152) = 0LL;
                  char v215 = 1;
                }

                v201 = v7;
                v216.n128_u8[0] = 0;
                char v218 = 0;
                if (*(_BYTE *)(a1 + 192))
                {
                  __n128 v216 = *(__n128 *)(a1 + 168);
                  uint64_t v217 = *(void *)(a1 + 184);
                  *(void *)(a1 + 168) = 0LL;
                  *(void *)(a1 + 176) = 0LL;
                  *(void *)(a1 + 184) = 0LL;
                  char v218 = 1;
                }

                uint64_t v128 = 0LL;
                __int128 v219 = *(_OWORD *)(a1 + 200);
                uint64_t v220 = *(void *)(a1 + 216);
                *(void *)(a1 + 200) = 0LL;
                *(void *)(a1 + 208) = 0LL;
                *(void *)(a1 + 216) = 0LL;
                uint64_t v129 = a1;
                do
                {
                  uint64_t v130 = v129 + 224 * v128 + 224;
                  uint64_t v131 = 2 * v128;
                  uint64_t v128 = (2 * v128) | 1;
                  if (v131 + 2 < v121 && *(void *)v130 < *(void *)(v130 + 224))
                  {
                    v130 += 224LL;
                    uint64_t v128 = v131 + 2;
                  }

                  __int128 v132 = *(_OWORD *)v130;
                  __int128 v133 = *(_OWORD *)(v130 + 32);
                  *(_OWORD *)(v129 + 16) = *(_OWORD *)(v130 + 16);
                  *(_OWORD *)(v129 + 32) = v133;
                  *(_OWORD *)uint64_t v129 = v132;
                  __int128 v134 = *(_OWORD *)(v130 + 48);
                  __int128 v135 = *(_OWORD *)(v130 + 64);
                  __int128 v136 = *(_OWORD *)(v130 + 80);
                  *(void *)(v129 + 96) = *(void *)(v130 + 96);
                  *(_OWORD *)(v129 + 64) = v135;
                  *(_OWORD *)(v129 + 80) = v136;
                  *(_OWORD *)(v129 + 48) = v134;
                  v137 = (__n128 *)(v130 + 104);
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v129 + 104,  (__n128 *)(v130 + 104));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 136,  (__n128 *)(v130 + 136));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 168,  (__n128 *)(v130 + 168));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v129 + 200));
                  *(_OWORD *)(v129 + 200) = *(_OWORD *)(v130 + 200);
                  *(void *)(v129 + 216) = *(void *)(v130 + 216);
                  *(void *)(v130 + 200) = 0LL;
                  *(void *)(v130 + 208) = 0LL;
                  *(void *)(v130 + 216) = 0LL;
                  uint64_t v129 = v130;
                }

                while (v128 <= (uint64_t)((unint64_t)(v121 - 2) >> 1));
                if ((__int128 *)v130 == v201 - 14)
                {
                  __int128 v169 = v203;
                  __int128 v170 = v205;
                  *(_OWORD *)(v130 + 16) = v204;
                  *(_OWORD *)(v130 + 32) = v170;
                  *(_OWORD *)uint64_t v130 = v169;
                  __int128 v171 = v206;
                  __int128 v172 = v207;
                  __int128 v173 = v208;
                  *(void *)(v130 + 96) = v209;
                  *(_OWORD *)(v130 + 64) = v172;
                  *(_OWORD *)(v130 + 80) = v173;
                  *(_OWORD *)(v130 + 48) = v171;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  *(_OWORD *)(v130 + 200) = v219;
                  *(void *)(v130 + 216) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                }

                else
                {
                  __int128 v138 = *(v201 - 14);
                  __int128 v139 = *(v201 - 12);
                  *(_OWORD *)(v130 + 16) = *(v201 - 13);
                  *(_OWORD *)(v130 + 32) = v139;
                  *(_OWORD *)uint64_t v130 = v138;
                  __int128 v140 = *(v201 - 11);
                  __int128 v141 = *(v201 - 10);
                  __int128 v142 = *(v201 - 9);
                  *(void *)(v130 + 96) = *((void *)v201 - 16);
                  *(_OWORD *)(v130 + 64) = v141;
                  *(_OWORD *)(v130 + 80) = v142;
                  *(_OWORD *)(v130 + 48) = v140;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)((char *)v201 - 120));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)((char *)v201 - 88));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)((char *)v201 - 56));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  v143 = (void *)v201 - 3;
                  *(_OWORD *)(v130 + 200) = *(__int128 *)((char *)v201 - 24);
                  *(void *)(v130 + 216) = *((void *)v201 - 1);
                  void *v143 = 0LL;
                  v143[1] = 0LL;
                  v143[2] = 0LL;
                  __int128 v144 = v203;
                  __int128 v145 = v205;
                  *(v201 - 13) = v204;
                  *(v201 - 12) = v145;
                  *(v201 - 14) = v144;
                  __int128 v146 = v206;
                  __int128 v147 = v207;
                  __int128 v148 = v208;
                  *((void *)v201 - 16) = v209;
                  *(v201 - 10) = v147;
                  *(v201 - 9) = v148;
                  *(v201 - 11) = v146;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v201 - 120,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 88,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 56,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v201 - 3);
                  *(__int128 *)((char *)v201 - 24) = v219;
                  *((void *)v201 - 1) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                  uint64_t v149 = v130 + 224 - a1;
                  if (v149 >= 225)
                  {
                    uint64_t v151 = a1 + 224 * v150;
                    if (*(void *)v151 < *(void *)v130)
                    {
                      __int128 v152 = *(_OWORD *)v130;
                      __int128 v153 = *(_OWORD *)(v130 + 32);
                      __int128 v223 = *(_OWORD *)(v130 + 16);
                      __int128 v224 = v153;
                      __int128 v222 = v152;
                      __int128 v154 = *(_OWORD *)(v130 + 48);
                      __int128 v155 = *(_OWORD *)(v130 + 64);
                      __int128 v156 = *(_OWORD *)(v130 + 80);
                      uint64_t v228 = *(void *)(v130 + 96);
                      __int128 v226 = v155;
                      __int128 v227 = v156;
                      __int128 v225 = v154;
                      v229.n128_u8[0] = 0;
                      char v231 = 0;
                      if (*(_BYTE *)(v130 + 128))
                      {
                        __n128 v157 = *v137;
                        uint64_t v230 = *(void *)(v130 + 120);
                        __n128 v229 = v157;
                        *(void *)(v130 + 112) = 0LL;
                        *(void *)(v130 + 120) = 0LL;
                        v137->n128_u64[0] = 0LL;
                        char v231 = 1;
                      }

                      v232.n128_u8[0] = 0;
                      char v234 = 0;
                      if (*(_BYTE *)(v130 + 160))
                      {
                        __n128 v232 = *(__n128 *)(v130 + 136);
                        uint64_t v233 = *(void *)(v130 + 152);
                        *(void *)(v130 + 136) = 0LL;
                        *(void *)(v130 + 144) = 0LL;
                        *(void *)(v130 + 152) = 0LL;
                        char v234 = 1;
                      }

                      __p.n128_u8[0] = 0;
                      char v237 = 0;
                      if (*(_BYTE *)(v130 + 192))
                      {
                        __n128 __p = *(__n128 *)(v130 + 168);
                        uint64_t v236 = *(void *)(v130 + 184);
                        *(void *)(v130 + 168) = 0LL;
                        *(void *)(v130 + 176) = 0LL;
                        *(void *)(v130 + 184) = 0LL;
                        char v237 = 1;
                      }

                      __int128 v238 = *(_OWORD *)(v130 + 200);
                      uint64_t v239 = *(void *)(v130 + 216);
                      *(void *)(v130 + 200) = 0LL;
                      *(void *)(v130 + 208) = 0LL;
                      *(void *)(v130 + 216) = 0LL;
                      do
                      {
                        uint64_t v158 = v151;
                        __int128 v159 = *(_OWORD *)v151;
                        __int128 v160 = *(_OWORD *)(v151 + 32);
                        *(_OWORD *)(v130 + 16) = *(_OWORD *)(v151 + 16);
                        *(_OWORD *)(v130 + 32) = v160;
                        *(_OWORD *)uint64_t v130 = v159;
                        __int128 v161 = *(_OWORD *)(v151 + 48);
                        __int128 v162 = *(_OWORD *)(v151 + 64);
                        __int128 v163 = *(_OWORD *)(v151 + 80);
                        *(void *)(v130 + 96) = *(void *)(v151 + 96);
                        *(_OWORD *)(v130 + 64) = v162;
                        *(_OWORD *)(v130 + 80) = v163;
                        *(_OWORD *)(v130 + 48) = v161;
                        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)(v151 + 104));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)(v158 + 136));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)(v158 + 168));
                        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                        *(_OWORD *)(v130 + 200) = *(_OWORD *)(v158 + 200);
                        *(void *)(v130 + 216) = *(void *)(v158 + 216);
                        *(void *)(v158 + 200) = 0LL;
                        *(void *)(v158 + 208) = 0LL;
                        *(void *)(v158 + 216) = 0LL;
                        if (!v150) {
                          break;
                        }
                        unint64_t v150 = (v150 - 1) >> 1;
                        uint64_t v151 = a1 + 224 * v150;
                        uint64_t v130 = v158;
                      }

                      while (*(void *)v151 < (unint64_t)v222);
                      __int128 v164 = v222;
                      __int128 v165 = v224;
                      *(_OWORD *)(v158 + 16) = v223;
                      *(_OWORD *)(v158 + 32) = v165;
                      *(_OWORD *)uint64_t v158 = v164;
                      __int128 v166 = v225;
                      __int128 v167 = v226;
                      __int128 v168 = v227;
                      *(void *)(v158 + 96) = v228;
                      *(_OWORD *)(v158 + 64) = v167;
                      *(_OWORD *)(v158 + 80) = v168;
                      *(_OWORD *)(v158 + 48) = v166;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v158 + 104,  &v229);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 136,  &v232);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 168,  &__p);
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v158 + 200));
                      *(_OWORD *)(v158 + 200) = v238;
                      *(void *)(v158 + 216) = v239;
                      __int128 v238 = 0uLL;
                      uint64_t v239 = 0LL;
                      v221 = (void **)&v238;
                      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v221);
                      if (v237 && __p.n128_u64[0])
                      {
                        __p.n128_u64[1] = __p.n128_u64[0];
                        operator delete((void *)__p.n128_u64[0]);
                      }

                      if (v234 && v232.n128_u64[0])
                      {
                        v232.n128_u64[1] = v232.n128_u64[0];
                        operator delete((void *)v232.n128_u64[0]);
                      }

                      if (v231 && SHIBYTE(v230) < 0) {
                        operator delete((void *)v229.n128_u64[0]);
                      }
                    }
                  }
                }

                *(void *)&__int128 v222 = &v219;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v222);
                if (v218 && v216.n128_u64[0])
                {
                  v216.n128_u64[1] = v216.n128_u64[0];
                  operator delete((void *)v216.n128_u64[0]);
                }

                if (v215 && v213.n128_u64[0])
                {
                  v213.n128_u64[1] = v213.n128_u64[0];
                  operator delete((void *)v213.n128_u64[0]);
                }

                if (v212 && SHIBYTE(v211) < 0) {
                  operator delete((void *)v210.n128_u64[0]);
                }
                BOOL v174 = v121-- <= 2;
                __int128 v7 = v201 - 14;
              }

              while (!v174);
            }

            return;
          }

          unint64_t v10 = v9 >> 1;
          __int128 v11 = (__int128 *)(a1 + 224 * (v9 >> 1));
          if ((unint64_t)v8 <= 0x7000)
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224 * (v9 >> 1)),  (__int128 *)a1,  v197);
          }

          else
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224 * (v9 >> 1)),  v197);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224),  (__int128 *)(224 * v10 + a1 - 224),  v196);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 448),  (__int128 *)(a1 + 224 + 224 * v10),  v195);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(224 * v10 + a1 - 224),  v11,  (__int128 *)(a1 + 224 + 224 * v10));
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)a1, v11);
          }

          --a3;
          if ((a4 & 1) == 0 && *(void *)(a1 - 224) >= *(void *)a1)
          {
            __int128 v40 = *(_OWORD *)a1;
            __int128 v41 = *(_OWORD *)(a1 + 32);
            __int128 v223 = *(_OWORD *)(a1 + 16);
            __int128 v224 = v41;
            __int128 v222 = v40;
            __int128 v42 = *(_OWORD *)(a1 + 48);
            __int128 v43 = *(_OWORD *)(a1 + 64);
            __int128 v44 = *(_OWORD *)(a1 + 80);
            uint64_t v228 = *(void *)(a1 + 96);
            __int128 v226 = v43;
            __int128 v227 = v44;
            __int128 v225 = v42;
            v229.n128_u8[0] = 0;
            char v231 = 0;
            if (*(_BYTE *)(a1 + 128))
            {
              __n128 v45 = *(__n128 *)(a1 + 104);
              uint64_t v230 = *(void *)(a1 + 120);
              __n128 v229 = v45;
              *(void *)(a1 + 112) = 0LL;
              *(void *)(a1 + 120) = 0LL;
              *(void *)(a1 + 104) = 0LL;
              char v231 = 1;
            }

            v232.n128_u8[0] = 0;
            char v234 = 0;
            if (*(_BYTE *)(a1 + 160))
            {
              __n128 v232 = *(__n128 *)(a1 + 136);
              uint64_t v233 = *(void *)(a1 + 152);
              *(void *)(a1 + 136) = 0LL;
              *(void *)(a1 + 144) = 0LL;
              *(void *)(a1 + 152) = 0LL;
              char v234 = 1;
            }

            __p.n128_u8[0] = 0;
            char v237 = 0;
            if (*(_BYTE *)(a1 + 192))
            {
              __n128 __p = *(__n128 *)(a1 + 168);
              uint64_t v236 = *(void *)(a1 + 184);
              *(void *)(a1 + 168) = 0LL;
              *(void *)(a1 + 176) = 0LL;
              *(void *)(a1 + 184) = 0LL;
              char v237 = 1;
            }

            __int128 v238 = *(_OWORD *)(a1 + 200);
            uint64_t v239 = *(void *)(a1 + 216);
            *(void *)(a1 + 200) = 0LL;
            *(void *)(a1 + 208) = 0LL;
            *(void *)(a1 + 216) = 0LL;
            unint64_t v46 = v222;
            if ((unint64_t)v222 >= *(void *)v197)
            {
              unint64_t v48 = a1 + 224;
              do
              {
                unint64_t v6 = v48;
                v48 += 224LL;
              }

              while ((unint64_t)v222 >= *(void *)v6);
            }

            else
            {
              unint64_t v6 = a1;
              do
              {
                unint64_t v47 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while ((unint64_t)v222 >= v47);
            }

            __int128 v49 = v202;
            if (v6 < (unint64_t)v202)
            {
              __int128 v49 = v202;
              do
              {
                unint64_t v50 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while ((unint64_t)v222 < v50);
            }

            while (v6 < (unint64_t)v49)
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v49);
              do
              {
                unint64_t v51 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v46 >= v51);
              do
              {
                unint64_t v52 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while (v46 < v52);
            }

            v53 = (__int128 *)(v6 - 224);
            if (v6 - 224 != a1)
            {
              __int128 v54 = *v53;
              __int128 v55 = *(_OWORD *)(v6 - 192);
              *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
              *(_OWORD *)(a1 + 32) = v55;
              *(_OWORD *)a1 = v54;
              __int128 v56 = *(_OWORD *)(v6 - 176);
              __int128 v57 = *(_OWORD *)(v6 - 160);
              __int128 v58 = *(_OWORD *)(v6 - 144);
              *(void *)(a1 + 96) = *(void *)(v6 - 128);
              *(_OWORD *)(a1 + 64) = v57;
              *(_OWORD *)(a1 + 80) = v58;
              *(_OWORD *)(a1 + 48) = v56;
              std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
              std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
              *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
              *(void *)(a1 + 216) = *(void *)(v6 - 8);
              *(void *)(v6 - 24) = 0LL;
              *(void *)(v6 - 16) = 0LL;
              *(void *)(v6 - 8) = 0LL;
            }

            __int128 v59 = v222;
            __int128 v60 = v224;
            *(_OWORD *)(v6 - 208) = v223;
            *(_OWORD *)(v6 - 192) = v60;
            __int128 *v53 = v59;
            __int128 v61 = v225;
            __int128 v62 = v226;
            __int128 v63 = v227;
            *(void *)(v6 - 128) = v228;
            *(_OWORD *)(v6 - 160) = v62;
            *(_OWORD *)(v6 - 144) = v63;
            *(_OWORD *)(v6 - 176) = v61;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
            *(_OWORD *)(v6 - 24) = v238;
            *(void *)(v6 - 8) = v239;
            __int128 v238 = 0uLL;
            uint64_t v239 = 0LL;
            *(void *)&__int128 v203 = &v238;
            std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
            if (v237 && __p.n128_u64[0])
            {
              __p.n128_u64[1] = __p.n128_u64[0];
              operator delete((void *)__p.n128_u64[0]);
            }

            if (v234 && v232.n128_u64[0])
            {
              v232.n128_u64[1] = v232.n128_u64[0];
              operator delete((void *)v232.n128_u64[0]);
            }

            if (v231 && SHIBYTE(v230) < 0) {
              operator delete((void *)v229.n128_u64[0]);
            }
            goto LABEL_45;
          }

          __int128 v12 = *(_OWORD *)a1;
          __int128 v13 = *(_OWORD *)(a1 + 32);
          __int128 v223 = *(_OWORD *)(a1 + 16);
          __int128 v224 = v13;
          __int128 v222 = v12;
          __int128 v14 = *(_OWORD *)(a1 + 48);
          __int128 v15 = *(_OWORD *)(a1 + 64);
          __int128 v16 = *(_OWORD *)(a1 + 80);
          uint64_t v228 = *(void *)(a1 + 96);
          __int128 v226 = v15;
          __int128 v227 = v16;
          __int128 v225 = v14;
          v229.n128_u8[0] = 0;
          char v231 = 0;
          if (*(_BYTE *)(a1 + 128))
          {
            __n128 v17 = *(__n128 *)(a1 + 104);
            uint64_t v230 = *(void *)(a1 + 120);
            __n128 v229 = v17;
            *(void *)(a1 + 112) = 0LL;
            *(void *)(a1 + 120) = 0LL;
            *(void *)(a1 + 104) = 0LL;
            char v231 = 1;
          }

          v232.n128_u8[0] = 0;
          char v234 = 0;
          if (*(_BYTE *)(a1 + 160))
          {
            __n128 v232 = *(__n128 *)(a1 + 136);
            uint64_t v233 = *(void *)(a1 + 152);
            *(void *)(a1 + 136) = 0LL;
            *(void *)(a1 + 144) = 0LL;
            *(void *)(a1 + 152) = 0LL;
            char v234 = 1;
          }

          __p.n128_u8[0] = 0;
          char v237 = 0;
          if (*(_BYTE *)(a1 + 192))
          {
            __n128 __p = *(__n128 *)(a1 + 168);
            uint64_t v236 = *(void *)(a1 + 184);
            *(void *)(a1 + 168) = 0LL;
            *(void *)(a1 + 176) = 0LL;
            *(void *)(a1 + 184) = 0LL;
            char v237 = 1;
          }

          uint64_t v18 = 0LL;
          __int128 v238 = *(_OWORD *)(a1 + 200);
          uint64_t v239 = *(void *)(a1 + 216);
          *(void *)(a1 + 200) = 0LL;
          *(void *)(a1 + 208) = 0LL;
          *(void *)(a1 + 216) = 0LL;
          unint64_t v19 = v222;
          do
          {
            unint64_t v20 = *(void *)(a1 + v18 + 224);
            v18 += 224LL;
          }

          while (v20 < (unint64_t)v222);
          unint64_t v21 = a1 + v18;
          uint64_t v22 = v202;
          if (v18 == 224)
          {
            uint64_t v22 = v202;
            do
            {
              unint64_t v24 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v24 >= (unint64_t)v222);
          }

          else
          {
            do
            {
              unint64_t v23 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v23 >= (unint64_t)v222);
          }

          unint64_t v6 = a1 + v18;
          if (v21 < (unint64_t)v22)
          {
            __int128 v25 = v22;
            do
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v25);
              do
              {
                unint64_t v26 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v26 < v19);
              do
              {
                unint64_t v27 = *((void *)v25 - 28);
                v25 -= 14;
              }

              while (v27 >= v19);
            }

            while (v6 < (unint64_t)v25);
          }

          __int128 v28 = (__int128 *)(v6 - 224);
          if (v6 - 224 != a1)
          {
            __int128 v29 = *v28;
            __int128 v30 = *(_OWORD *)(v6 - 192);
            *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
            *(_OWORD *)(a1 + 32) = v30;
            *(_OWORD *)a1 = v29;
            __int128 v31 = *(_OWORD *)(v6 - 176);
            __int128 v32 = *(_OWORD *)(v6 - 160);
            __int128 v33 = *(_OWORD *)(v6 - 144);
            *(void *)(a1 + 96) = *(void *)(v6 - 128);
            *(_OWORD *)(a1 + 64) = v32;
            *(_OWORD *)(a1 + 80) = v33;
            *(_OWORD *)(a1 + 48) = v31;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
            *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
            *(void *)(a1 + 216) = *(void *)(v6 - 8);
            *(void *)(v6 - 24) = 0LL;
            *(void *)(v6 - 16) = 0LL;
            *(void *)(v6 - 8) = 0LL;
          }

          __int128 v34 = v222;
          __int128 v35 = v224;
          *(_OWORD *)(v6 - 208) = v223;
          *(_OWORD *)(v6 - 192) = v35;
          *__int128 v28 = v34;
          __int128 v36 = v225;
          __int128 v37 = v226;
          __int128 v38 = v227;
          *(void *)(v6 - 128) = v228;
          *(_OWORD *)(v6 - 160) = v37;
          *(_OWORD *)(v6 - 144) = v38;
          *(_OWORD *)(v6 - 176) = v36;
          std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
          std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
          *(_OWORD *)(v6 - 24) = v238;
          *(void *)(v6 - 8) = v239;
          __int128 v238 = 0uLL;
          uint64_t v239 = 0LL;
          *(void *)&__int128 v203 = &v238;
          std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
          if (v237 && __p.n128_u64[0])
          {
            __p.n128_u64[1] = __p.n128_u64[0];
            operator delete((void *)__p.n128_u64[0]);
          }

          if (v234 && v232.n128_u64[0])
          {
            v232.n128_u64[1] = v232.n128_u64[0];
            operator delete((void *)v232.n128_u64[0]);
          }

          if (v231 && SHIBYTE(v230) < 0) {
            operator delete((void *)v229.n128_u64[0]);
          }
          BOOL v39 = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)a1,  (__int128 *)(v6 - 224));
          if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)v6,  v202))
          {
            if (v39) {
              continue;
            }
LABEL_44:
            _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( a1,  v6 - 224,  a3,  a4 & 1);
LABEL_45:
            a4 = 0;
            continue;
          }

          a2 = (__int128 *)(v6 - 224);
          if (v39) {
            return;
          }
          goto LABEL_1;
        }

        if ((a4 & 1) != 0)
        {
          if ((__int128 *)a1 != v202)
          {
            unint64_t v67 = a1 + 224;
            if ((__int128 *)(a1 + 224) != v202)
            {
              uint64_t v68 = 0LL;
              unint64_t v69 = a1;
              do
              {
                unint64_t v70 = v67;
                if (*(void *)(v69 + 224) < *(void *)v69)
                {
                  __int128 v71 = *(_OWORD *)v67;
                  __int128 v72 = *(_OWORD *)(v67 + 32);
                  __int128 v223 = *(_OWORD *)(v67 + 16);
                  __int128 v224 = v72;
                  __int128 v222 = v71;
                  __int128 v73 = *(_OWORD *)(v67 + 48);
                  __int128 v74 = *(_OWORD *)(v67 + 64);
                  __int128 v75 = *(_OWORD *)(v67 + 80);
                  uint64_t v228 = *(void *)(v67 + 96);
                  __int128 v226 = v74;
                  __int128 v227 = v75;
                  __int128 v225 = v73;
                  v229.n128_u8[0] = 0;
                  char v231 = 0;
                  if (*(_BYTE *)(v69 + 352))
                  {
                    uint64_t v230 = *(void *)(v69 + 344);
                    __n128 v229 = *(__n128 *)(v69 + 328);
                    *(void *)(v69 + 336) = 0LL;
                    *(void *)(v69 + 344) = 0LL;
                    *(void *)(v69 + 328) = 0LL;
                    char v231 = 1;
                  }

                  unint64_t v76 = (__n128 *)(v69 + 360);
                  v232.n128_u8[0] = 0;
                  char v234 = 0;
                  if (*(_BYTE *)(v69 + 384))
                  {
                    __n128 v232 = *v76;
                    uint64_t v233 = *(void *)(v69 + 376);
                    v76->n128_u64[0] = 0LL;
                    *(void *)(v69 + 368) = 0LL;
                    *(void *)(v69 + 376) = 0LL;
                    char v234 = 1;
                  }

                  __p.n128_u8[0] = 0;
                  char v237 = 0;
                  if (*(_BYTE *)(v69 + 416))
                  {
                    __n128 __p = *(__n128 *)(v69 + 392);
                    uint64_t v236 = *(void *)(v69 + 408);
                    *(void *)(v69 + 392) = 0LL;
                    *(void *)(v69 + 400) = 0LL;
                    *(void *)(v69 + 408) = 0LL;
                    char v237 = 1;
                  }

                  __int128 v238 = *(_OWORD *)(v69 + 424);
                  uint64_t v239 = *(void *)(v69 + 440);
                  *(void *)(v69 + 424) = 0LL;
                  *(void *)(v69 + 432) = 0LL;
                  *(void *)(v69 + 440) = 0LL;
                  uint64_t v77 = v68;
                  while (1)
                  {
                    uint64_t v78 = v77;
                    uint64_t v79 = a1 + v77;
                    __int128 v80 = *(_OWORD *)(a1 + v77 + 80);
                    *(_OWORD *)(v79 + 288) = *(_OWORD *)(a1 + v77 + 64);
                    *(_OWORD *)(v79 + 304) = v80;
                    *(void *)(v79 + 320) = *(void *)(a1 + v77 + 96);
                    __int128 v81 = *(_OWORD *)(a1 + v77 + 16);
                    *(_OWORD *)(v79 + 224) = *(_OWORD *)v79;
                    *(_OWORD *)(v79 + 240) = v81;
                    __int128 v82 = *(_OWORD *)(a1 + v77 + 48);
                    *(_OWORD *)(v79 + 256) = *(_OWORD *)(a1 + v77 + 32);
                    *(_OWORD *)(v79 + 272) = v82;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v77 + 328,  (__n128 *)(a1 + v77 + 104));
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v79 + 360,  (__n128 *)(v79 + 136));
                    uint64_t v83 = a1 + v78;
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 392,  (__n128 *)(a1 + v78 + 168));
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + v78 + 424));
                    *(_OWORD *)(v83 + 424) = *(_OWORD *)(v83 + 200);
                    *(void *)(v83 + 440) = *(void *)(v83 + 216);
                    *(void *)(v83 + 208) = 0LL;
                    *(void *)(v83 + 216) = 0LL;
                    *(void *)(v83 + 200) = 0LL;
                    if (!v78) {
                      break;
                    }
                    uint64_t v77 = v78 - 224;
                    if ((unint64_t)v222 >= *(void *)(a1 + v78 - 224))
                    {
                      unint64_t v84 = a1 + v78;
                      goto LABEL_107;
                    }
                  }

                  unint64_t v84 = a1;
LABEL_107:
                  __int128 v85 = v222;
                  __int128 v86 = v224;
                  *(_OWORD *)(v84 + 16) = v223;
                  *(_OWORD *)(v84 + 32) = v86;
                  *(_OWORD *)unint64_t v84 = v85;
                  __int128 v87 = v225;
                  __int128 v88 = v226;
                  __int128 v89 = v227;
                  *(void *)(v84 + 96) = v228;
                  *(_OWORD *)(v84 + 64) = v88;
                  *(_OWORD *)(v84 + 80) = v89;
                  *(_OWORD *)(v84 + 48) = v87;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v78 + 104,  &v229);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 136,  &v232);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 168,  &__p);
                  __int128 v90 = (uint64_t *)(a1 + v78 + 200);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v90);
                  *__int128 v90 = v238;
                  *(void *)(v84 + 208) = *((void *)&v238 + 1);
                  *(void *)(v84 + 216) = v239;
                  __int128 v238 = 0uLL;
                  uint64_t v239 = 0LL;
                  *(void *)&__int128 v203 = &v238;
                  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                  if (v237 && __p.n128_u64[0])
                  {
                    __p.n128_u64[1] = __p.n128_u64[0];
                    operator delete((void *)__p.n128_u64[0]);
                  }

                  if (v234 && v232.n128_u64[0])
                  {
                    v232.n128_u64[1] = v232.n128_u64[0];
                    operator delete((void *)v232.n128_u64[0]);
                  }

                  if (v231 && SHIBYTE(v230) < 0) {
                    operator delete((void *)v229.n128_u64[0]);
                  }
                  __int128 v7 = v202;
                }

                unint64_t v67 = v70 + 224;
                v68 += 224LL;
                unint64_t v69 = v70;
              }

              while ((__int128 *)(v70 + 224) != v7);
            }
          }
        }

        else if ((__int128 *)a1 != v202)
        {
          unint64_t v175 = a1 + 224;
          if ((__int128 *)(a1 + 224) != v202)
          {
            unint64_t v176 = a1 - 224;
            do
            {
              unint64_t v177 = v175;
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                __int128 v178 = *(_OWORD *)v175;
                __int128 v179 = *(_OWORD *)(v175 + 32);
                __int128 v223 = *(_OWORD *)(v175 + 16);
                __int128 v224 = v179;
                __int128 v222 = v178;
                __int128 v180 = *(_OWORD *)(v175 + 48);
                __int128 v181 = *(_OWORD *)(v175 + 64);
                __int128 v182 = *(_OWORD *)(v175 + 80);
                uint64_t v228 = *(void *)(v175 + 96);
                __int128 v226 = v181;
                __int128 v227 = v182;
                __int128 v225 = v180;
                v229.n128_u8[0] = 0;
                char v231 = 0;
                if (*(_BYTE *)(a1 + 352))
                {
                  uint64_t v230 = *(void *)(a1 + 344);
                  __n128 v229 = *(__n128 *)(a1 + 328);
                  *(void *)(a1 + 336) = 0LL;
                  *(void *)(a1 + 344) = 0LL;
                  *(void *)(a1 + 328) = 0LL;
                  char v231 = 1;
                }

                v183 = (__n128 *)(a1 + 360);
                v232.n128_u8[0] = 0;
                char v234 = 0;
                if (*(_BYTE *)(a1 + 384))
                {
                  __n128 v232 = *v183;
                  uint64_t v233 = *(void *)(a1 + 376);
                  v183->n128_u64[0] = 0LL;
                  *(void *)(a1 + 368) = 0LL;
                  *(void *)(a1 + 376) = 0LL;
                  char v234 = 1;
                }

                __p.n128_u8[0] = 0;
                char v237 = 0;
                if (*(_BYTE *)(a1 + 416))
                {
                  __n128 __p = *(__n128 *)(a1 + 392);
                  uint64_t v236 = *(void *)(a1 + 408);
                  *(void *)(a1 + 392) = 0LL;
                  *(void *)(a1 + 400) = 0LL;
                  *(void *)(a1 + 408) = 0LL;
                  char v237 = 1;
                }

                __int128 v238 = *(_OWORD *)(a1 + 424);
                uint64_t v239 = *(void *)(a1 + 440);
                *(void *)(a1 + 424) = 0LL;
                *(void *)(a1 + 432) = 0LL;
                *(void *)(a1 + 440) = 0LL;
                unint64_t v184 = v176;
                do
                {
                  __int128 v185 = *(_OWORD *)(v184 + 304);
                  *(_OWORD *)(v184 + 512) = *(_OWORD *)(v184 + 288);
                  *(_OWORD *)(v184 + 528) = v185;
                  *(void *)(v184 + 544) = *(void *)(v184 + 320);
                  __int128 v186 = *(_OWORD *)(v184 + 240);
                  *(_OWORD *)(v184 + 448) = *(_OWORD *)(v184 + 224);
                  *(_OWORD *)(v184 + 464) = v186;
                  __int128 v187 = *(_OWORD *)(v184 + 272);
                  *(_OWORD *)(v184 + 480) = *(_OWORD *)(v184 + 256);
                  *(_OWORD *)(v184 + 496) = v187;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  (__n128 *)(v184 + 328));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  (__n128 *)(v184 + 360));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  (__n128 *)(v184 + 392));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                  *(_OWORD *)(v184 + 648) = *(_OWORD *)(v184 + 424);
                  *(void *)(v184 + 664) = *(void *)(v184 + 440);
                  *(void *)(v184 + 424) = 0LL;
                  *(void *)(v184 + 432) = 0LL;
                  *(void *)(v184 + 440) = 0LL;
                  unint64_t v188 = *(void *)v184;
                  v184 -= 224LL;
                }

                while ((unint64_t)v222 < v188);
                __int128 v189 = v222;
                __int128 v190 = v224;
                *(_OWORD *)(v184 + 464) = v223;
                *(_OWORD *)(v184 + 480) = v190;
                *(_OWORD *)(v184 + 448) = v189;
                __int128 v191 = v225;
                __int128 v192 = v226;
                __int128 v193 = v227;
                *(void *)(v184 + 544) = v228;
                *(_OWORD *)(v184 + 512) = v192;
                *(_OWORD *)(v184 + 528) = v193;
                *(_OWORD *)(v184 + 496) = v191;
                std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  &v229);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  &v232);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  &__p);
                std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                *(_OWORD *)(v184 + 648) = v238;
                *(void *)(v184 + 664) = v239;
                __int128 v238 = 0uLL;
                uint64_t v239 = 0LL;
                *(void *)&__int128 v203 = &v238;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                if (v237 && __p.n128_u64[0])
                {
                  __p.n128_u64[1] = __p.n128_u64[0];
                  operator delete((void *)__p.n128_u64[0]);
                }

                if (v234 && v232.n128_u64[0])
                {
                  v232.n128_u64[1] = v232.n128_u64[0];
                  operator delete((void *)v232.n128_u64[0]);
                }

                if (v231 && SHIBYTE(v230) < 0) {
                  operator delete((void *)v229.n128_u64[0]);
                }
                __int128 v7 = v202;
              }

              unint64_t v175 = v177 + 224;
              v176 += 224LL;
              a1 = v177;
            }

            while ((__int128 *)(v177 + 224) != v7);
          }
        }

        return;
    }
  }

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( __int128 *a1, __int128 *a2)
{
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a2 - (char *)a1) >> 5);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      if (*((void *)a2 - 28) < *(void *)a1)
      {
        unint64_t v6 = a1;
        __int128 v7 = a2 - 14;
        goto LABEL_4;
      }

      return result;
    case 3LL:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a2 - 14);
      return 1LL;
    case 4LL:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a2 - 14);
      return 1LL;
    case 5LL:
      unint64_t v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a1 + 42);
      unint64_t v26 = *((void *)a2 - 28);
      __int128 v25 = a2 - 14;
      if (v26 < *((void *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((void *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((void *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((void *)a1 + 28) < *(void *)a1)
            {
              unint64_t v6 = a1;
              __int128 v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a1 + 28);
      unint64_t v9 = a1 + 42;
      BOOL result = 1LL;
      if (a1 + 42 == a2) {
        return result;
      }
      uint64_t v10 = 0LL;
      int v11 = 0;
      break;
  }

  while (1)
  {
    if (*(void *)v9 < *(void *)v8)
    {
      __int128 v31 = v9[4];
      __int128 v32 = v9[5];
      uint64_t v33 = *((void *)v9 + 12);
      __int128 v27 = *v9;
      __int128 v28 = v9[1];
      __int128 v29 = v9[2];
      __int128 v30 = v9[3];
      v34.n128_u8[0] = 0;
      char v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        __n128 v34 = *(__n128 *)((char *)v9 + 104);
        uint64_t v35 = *((void *)v9 + 15);
        *((void *)v9 + 14) = 0LL;
        *((void *)v9 + 15) = 0LL;
        *((void *)v9 + 13) = 0LL;
        char v36 = 1;
      }

      v37.n128_u8[0] = 0;
      char v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        __n128 v37 = *(__n128 *)((char *)v9 + 136);
        uint64_t v38 = *((void *)v9 + 19);
        *((void *)v9 + 18) = 0LL;
        *((void *)v9 + 19) = 0LL;
        *((void *)v9 + 17) = 0LL;
        char v39 = 1;
      }

      __p.n128_u8[0] = 0;
      char v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __n128 __p = *(__n128 *)((char *)v9 + 168);
        uint64_t v41 = *((void *)v9 + 23);
        *((void *)v9 + 22) = 0LL;
        *((void *)v9 + 23) = 0LL;
        *((void *)v9 + 21) = 0LL;
        char v42 = 1;
      }

      __int128 v43 = *(__int128 *)((char *)v9 + 200);
      uint64_t v44 = *((void *)v9 + 27);
      *((void *)v9 + 26) = 0LL;
      *((void *)v9 + 27) = 0LL;
      *((void *)v9 + 25) = 0LL;
      uint64_t v12 = v10;
      while (1)
      {
        uint64_t v13 = v12;
        __int128 v14 = (char *)a1 + v12;
        __int128 v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((void *)v14 + 96) = *(void *)((char *)a1 + v12 + 544);
        __int128 v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        __int128 v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)a1 + v12 + 776,  (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v14 + 808),  (__n128 *)(v14 + 584));
        uint64_t v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a1 + v13 + 840,  (__n128 *)((char *)a1 + v13 + 616));
        unint64_t v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((void *)v18 + 111) = *((void *)v18 + 83);
        *((void *)v18 + 83) = 0LL;
        *unint64_t v19 = 0u;
        if (v13 == -448) {
          break;
        }
        uint64_t v12 = v13 - 224;
        if ((unint64_t)v27 >= *(void *)((char *)a1 + v13 + 224))
        {
          uint64_t v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }

      uint64_t v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(void *)(v20 + 96) = v33;
      *(_OWORD *)uint64_t v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      unint64_t v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)(v21 + 69),  &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 73),  &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 77),  &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      uint64_t v22 = *((void *)&v43 + 1);
      v21[81] = v43;
      uint64_t v23 = v44;
      *(void *)(v20 + 208) = v22;
      *(void *)(v20 + 216) = v23;
      uint64_t v44 = 0LL;
      __int128 v43 = 0uLL;
      __n128 v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }

      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }

      if (v36 && SHIBYTE(v35) < 0) {
        operator delete((void *)v34.n128_u64[0]);
      }
      if (++v11 == 8) {
        return v9 + 14 == a2;
      }
    }

    uint64_t v8 = v9;
    v10 += 224LL;
    v9 += 14;
    if (v9 == a2) {
      return 1LL;
    }
  }

void std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::__move_assign( uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(a1 + 8);
  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy( a1,  *(void **)(a1 + 8));
  *(void *)a1 = *a2;
  __int128 v5 = a2 + 1;
  uint64_t v6 = a2[1];
  *uint64_t v4 = v6;
  uint64_t v7 = a2[2];
  *(void *)(a1 + 16) = v7;
  if (v7)
  {
    *(void *)(v6 + 16) = v4;
    *a2 = v5;
    void *v5 = 0LL;
    a2[2] = 0LL;
  }

  else
  {
    *(void *)a1 = v4;
  }

uint64_t CSCppCoreFileExclavesMetadata::CSCppCoreFileExclavesMetadata( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  __n128 __p = 0LL;
  unint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  std::vector<mapped_memory_core_file_dumped_region_info_t>::__init_with_size[abi:ne180100]<mapped_memory_core_file_dumped_region_info_t*,mapped_memory_core_file_dumped_region_info_t*>( &__p,  *(const void **)a3,  *(void *)(a3 + 8),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3));
  std::map<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>::map[abi:ne180100](v19, a5);
  std::__optional_copy_base<CSCppCoreFileRegionsTree,false>::__optional_copy_base[abi:ne180100]((uint64_t)v18, a8);
  CSCppCoreFileMetadata::CSCppCoreFileMetadata(a1, a2, (uint64_t)&__p, a4, (uint64_t)v19, a6, a7, (uint64_t)v18);
  if (v18[24])
  {
    uint64_t v23 = (void **)v18;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v23);
  }

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy( (uint64_t)v19,  (void *)v19[1]);
  if (__p)
  {
    unint64_t v21 = __p;
    operator delete(__p);
  }

  *(void *)a1 = &unk_189DF9A70;
  *(_DWORD *)(a1 + 120) = a9;
  *(void *)(a1 + 128) = a10;
  return a1;
}

void sub_186086594( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, void *__p, uint64_t a21)
{
  if (a13)
  {
    *(void *)(v21 - 72) = &a10;
    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 72));
  }

  std::__tree<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::pair<unsigned int,std::map<int,std::vector<unsigned char>>>>>>::destroy( (uint64_t)&a15,  a18);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*,false>( uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
LABEL_1:
  unint64_t v8 = a1;
  while (2)
  {
    a1 = v8;
    uint64_t v9 = a2 - v8;
    uint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2 - v8) >> 3);
    switch(v10)
    {
      case 0LL:
      case 1LL:
        return;
      case 2LL:
        unint64_t v44 = *(void *)(a2 - 40);
        unint64_t v43 = a2 - 40;
        if (v44 < *(void *)v8)
        {
          uint64_t v141 = *(void *)(v8 + 32);
          __int128 v122 = *(_OWORD *)v8;
          __int128 v131 = *(_OWORD *)(v8 + 16);
          __int128 v45 = *(_OWORD *)v43;
          __int128 v46 = *(_OWORD *)(v43 + 16);
          *(void *)(v8 + 32) = *(void *)(v43 + 32);
          *(_OWORD *)unint64_t v8 = v45;
          *(_OWORD *)(v8 + 16) = v46;
          *(void *)(v43 + 32) = v141;
          *(_OWORD *)unint64_t v43 = v122;
          *(_OWORD *)(v43 + 16) = v131;
        }

        return;
      case 3LL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)v8,  (unint64_t *)(v8 + 40),  (unint64_t *)(a2 - 40));
        return;
      case 4LL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( v8,  v8 + 40,  v8 + 80,  a2 - 40);
        return;
      case 5LL:
        unint64_t v47 = (__int128 *)(v8 + 40);
        unint64_t v48 = (__int128 *)(v8 + 80);
        __int128 v49 = (__int128 *)(v8 + 120);
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( v8,  v8 + 40,  v8 + 80,  v8 + 120);
        unint64_t v51 = *(void *)(a2 - 40);
        unint64_t v50 = a2 - 40;
        if (v51 < *(void *)(v8 + 120))
        {
          __int128 v52 = *v49;
          __int128 v132 = *(_OWORD *)(v8 + 136);
          uint64_t v53 = *(void *)(v8 + 152);
          __int128 v55 = *(_OWORD *)v50;
          __int128 v54 = *(_OWORD *)(v50 + 16);
          *(void *)(v8 + 152) = *(void *)(v50 + 32);
          *__int128 v49 = v55;
          *(_OWORD *)(v8 + 136) = v54;
          *(void *)(v50 + 32) = v53;
          *(_OWORD *)unint64_t v50 = v52;
          *(_OWORD *)(v50 + 16) = v132;
          if (*(void *)v49 < *(void *)v48)
          {
            uint64_t v56 = *(void *)(v8 + 112);
            __int128 v58 = *v48;
            __int128 v57 = *(_OWORD *)(v8 + 96);
            __int128 v59 = *(_OWORD *)(v8 + 136);
            *unint64_t v48 = *v49;
            *(_OWORD *)(v8 + 96) = v59;
            *(void *)(v8 + 112) = *(void *)(v8 + 152);
            *__int128 v49 = v58;
            *(_OWORD *)(v8 + 136) = v57;
            *(void *)(v8 + 152) = v56;
            if (*(void *)v48 < *(void *)v47)
            {
              uint64_t v60 = *(void *)(v8 + 72);
              __int128 v62 = *v47;
              __int128 v61 = *(_OWORD *)(v8 + 56);
              __int128 v63 = *(_OWORD *)(v8 + 96);
              *unint64_t v47 = *v48;
              *(_OWORD *)(v8 + 56) = v63;
              *(void *)(v8 + 72) = *(void *)(v8 + 112);
              *unint64_t v48 = v62;
              *(_OWORD *)(v8 + 96) = v61;
              *(void *)(v8 + 112) = v60;
              if (*(void *)(v8 + 40) < *(void *)v8)
              {
                uint64_t v142 = *(void *)(v8 + 32);
                __int128 v123 = *(_OWORD *)v8;
                __int128 v133 = *(_OWORD *)(v8 + 16);
                __int128 v64 = *(_OWORD *)(v8 + 56);
                *(_OWORD *)unint64_t v8 = *v47;
                *(_OWORD *)(v8 + 16) = v64;
                *(void *)(v8 + 32) = *(void *)(v8 + 72);
                *unint64_t v47 = v123;
                *(_OWORD *)(v8 + 56) = v133;
                *(void *)(v8 + 72) = v142;
              }
            }
          }
        }

        return;
      default:
        if (v9 <= 959)
        {
          unint64_t v65 = v8 + 40;
          BOOL v67 = v8 == a2 || v65 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v67)
            {
              uint64_t v68 = 0LL;
              unint64_t v69 = v8;
              do
              {
                unint64_t v70 = v65;
                unint64_t v71 = *(void *)(v69 + 40);
                if (v71 < *(void *)v69)
                {
                  __int128 v124 = *(_OWORD *)(v69 + 48);
                  __int128 v134 = *(_OWORD *)(v69 + 64);
                  uint64_t v72 = v68;
                  while (1)
                  {
                    uint64_t v73 = v8 + v72;
                    __int128 v74 = *(_OWORD *)(v8 + v72 + 16);
                    *(_OWORD *)(v73 + 40) = *(_OWORD *)(v8 + v72);
                    *(_OWORD *)(v73 + 56) = v74;
                    *(void *)(v73 + 72) = *(void *)(v8 + v72 + 32);
                    if (!v72) {
                      break;
                    }
                    v72 -= 40LL;
                    if (v71 >= *(void *)(v73 - 40))
                    {
                      uint64_t v75 = v8 + v72 + 40;
                      goto LABEL_75;
                    }
                  }

                  uint64_t v75 = v8;
LABEL_75:
                  *(void *)uint64_t v75 = v71;
                  *(_OWORD *)(v75 + 24) = v134;
                  *(_OWORD *)(v75 + 8) = v124;
                }

                unint64_t v65 = v70 + 40;
                v68 += 40LL;
                unint64_t v69 = v70;
              }

              while (v70 + 40 != a2);
            }
          }

          else if (!v67)
          {
            do
            {
              uint64_t v109 = v65;
              unint64_t v110 = *(void *)(a1 + 40);
              if (v110 < *(void *)a1)
              {
                __int128 v127 = *(_OWORD *)(a1 + 48);
                __int128 v137 = *(_OWORD *)(a1 + 64);
                do
                {
                  __int128 v111 = *(_OWORD *)(v65 - 24);
                  *(_OWORD *)unint64_t v65 = *(_OWORD *)(v65 - 40);
                  *(_OWORD *)(v65 + 16) = v111;
                  *(void *)(v65 + 32) = *(void *)(v65 - 8);
                  unint64_t v112 = *(void *)(v65 - 80);
                  v65 -= 40LL;
                }

                while (v110 < v112);
                *(void *)unint64_t v65 = v110;
                *(_OWORD *)(v65 + 24) = v137;
                *(_OWORD *)(v65 + 8) = v127;
              }

              unint64_t v65 = v109 + 40;
              a1 = v109;
            }

            while (v109 + 40 != a2);
          }

          return;
        }

        if (!a3)
        {
          if (v8 != a2)
          {
            int64_t v76 = (unint64_t)(v10 - 2) >> 1;
            int64_t v77 = v76;
            do
            {
              int64_t v78 = v77;
              if (v76 >= v77)
              {
                uint64_t v79 = (2 * v77) | 1;
                unint64_t v80 = v8 + 40 * v79;
                if (2 * v78 + 2 >= v10)
                {
                  unint64_t v81 = *(void *)v80;
                }

                else
                {
                  unint64_t v81 = *(void *)(v80 + 40);
                  BOOL v82 = *(void *)v80 >= v81;
                  if (*(void *)v80 > v81) {
                    unint64_t v81 = *(void *)v80;
                  }
                  if (!v82)
                  {
                    v80 += 40LL;
                    uint64_t v79 = 2 * v78 + 2;
                  }
                }

                unint64_t v83 = v8 + 40 * v78;
                unint64_t v84 = *(void *)v83;
                if (v81 >= *(void *)v83)
                {
                  __int128 v125 = *(_OWORD *)(v83 + 8);
                  __int128 v135 = *(_OWORD *)(v83 + 24);
                  do
                  {
                    unint64_t v85 = v83;
                    unint64_t v83 = v80;
                    __int128 v86 = *(_OWORD *)v80;
                    __int128 v87 = *(_OWORD *)(v80 + 16);
                    *(void *)(v85 + 32) = *(void *)(v80 + 32);
                    *(_OWORD *)unint64_t v85 = v86;
                    *(_OWORD *)(v85 + 16) = v87;
                    if (v76 < v79) {
                      break;
                    }
                    uint64_t v88 = (2 * v79) | 1;
                    unint64_t v80 = v8 + 40 * v88;
                    uint64_t v79 = 2 * v79 + 2;
                    if (v79 >= v10)
                    {
                      unint64_t v89 = *(void *)v80;
                      uint64_t v79 = v88;
                    }

                    else
                    {
                      unint64_t v89 = *(void *)v80;
                      unint64_t v90 = *(void *)(v80 + 40);
                      if (*(void *)v80 <= v90) {
                        unint64_t v89 = *(void *)(v80 + 40);
                      }
                      if (*(void *)v80 >= v90) {
                        uint64_t v79 = v88;
                      }
                      else {
                        v80 += 40LL;
                      }
                    }
                  }

                  while (v89 >= v84);
                  *(void *)unint64_t v83 = v84;
                  *(_OWORD *)(v83 + 24) = v135;
                  *(_OWORD *)(v83 + 8) = v125;
                }
              }

              int64_t v77 = v78 - 1;
            }

            while (v78);
            int64_t v91 = v9 / 0x28uLL;
            do
            {
              uint64_t v92 = 0LL;
              uint64_t v143 = *(void *)(v8 + 32);
              __int128 v126 = *(_OWORD *)v8;
              __int128 v136 = *(_OWORD *)(v8 + 16);
              unint64_t v93 = v8;
              do
              {
                uint64_t v94 = v93 + 40 * v92 + 40;
                uint64_t v95 = (2 * v92) | 1;
                uint64_t v96 = 2 * v92 + 2;
                if (v96 < v91 && *(void *)v94 < *(void *)(v94 + 40))
                {
                  v94 += 40LL;
                  uint64_t v95 = v96;
                }

                __int128 v97 = *(_OWORD *)v94;
                __int128 v98 = *(_OWORD *)(v94 + 16);
                *(void *)(v93 + 32) = *(void *)(v94 + 32);
                *(_OWORD *)unint64_t v93 = v97;
                *(_OWORD *)(v93 + 16) = v98;
                unint64_t v93 = v94;
                uint64_t v92 = v95;
              }

              while (v95 <= (uint64_t)((unint64_t)(v91 - 2) >> 1));
              a2 -= 40LL;
              if (v94 == a2)
              {
                *(void *)(v94 + 32) = v143;
                *(_OWORD *)uint64_t v94 = v126;
                *(_OWORD *)(v94 + 16) = v136;
              }

              else
              {
                __int128 v99 = *(_OWORD *)a2;
                __int128 v100 = *(_OWORD *)(a2 + 16);
                *(void *)(v94 + 32) = *(void *)(a2 + 32);
                *(_OWORD *)uint64_t v94 = v99;
                *(_OWORD *)(v94 + 16) = v100;
                *(void *)(a2 + 32) = v143;
                *(_OWORD *)a2 = v126;
                *(_OWORD *)(a2 + 16) = v136;
                uint64_t v101 = v94 - v8 + 40;
                if (v101 >= 41)
                {
                  unint64_t v102 = (v101 / 0x28uLL - 2) >> 1;
                  uint64_t v103 = v8 + 40 * v102;
                  unint64_t v104 = *(void *)v94;
                  if (*(void *)v103 < *(void *)v94)
                  {
                    __int128 v115 = *(_OWORD *)(v94 + 8);
                    __int128 v118 = *(_OWORD *)(v94 + 24);
                    do
                    {
                      uint64_t v105 = v94;
                      uint64_t v94 = v103;
                      __int128 v106 = *(_OWORD *)v103;
                      __int128 v107 = *(_OWORD *)(v103 + 16);
                      *(void *)(v105 + 32) = *(void *)(v103 + 32);
                      *(_OWORD *)uint64_t v105 = v106;
                      *(_OWORD *)(v105 + 16) = v107;
                      if (!v102) {
                        break;
                      }
                      unint64_t v102 = (v102 - 1) >> 1;
                      uint64_t v103 = v8 + 40 * v102;
                    }

                    while (*(void *)v103 < v104);
                    *(void *)uint64_t v94 = v104;
                    *(_OWORD *)(v94 + 24) = v118;
                    *(_OWORD *)(v94 + 8) = v115;
                  }
                }
              }
            }

            while (v91-- > 2);
          }

          return;
        }

        unint64_t v11 = (unint64_t)v10 >> 1;
        unint64_t v12 = v8 + 40 * ((unint64_t)v10 >> 1);
        if ((unint64_t)v9 < 0x1401)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)v12,  (unint64_t *)a1,  (unint64_t *)(a2 - 40));
        }

        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)a1,  (unint64_t *)v12,  (unint64_t *)(a2 - 40));
          uint64_t v13 = 5 * v11;
          __int128 v14 = (unint64_t *)(a1 + 40 * v11 - 40);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)(a1 + 40),  v14,  (unint64_t *)(a2 - 80));
          __int128 v15 = (unint64_t *)(a1 + 40 + 8 * v13);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)(a1 + 80),  v15,  (unint64_t *)(a2 - 120));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)v14,  (unint64_t *)v12,  v15);
          uint64_t v138 = *(void *)(a1 + 32);
          __int128 v119 = *(_OWORD *)a1;
          __int128 v128 = *(_OWORD *)(a1 + 16);
          __int128 v16 = *(_OWORD *)v12;
          __int128 v17 = *(_OWORD *)(v12 + 16);
          *(void *)(a1 + 32) = *(void *)(v12 + 32);
          *(_OWORD *)a1 = v16;
          *(_OWORD *)(a1 + 16) = v17;
          *(void *)(v12 + 32) = v138;
          *(_OWORD *)unint64_t v12 = v119;
          *(_OWORD *)(v12 + 16) = v128;
        }

        --a3;
        unint64_t v18 = *(void *)a1;
        if ((a4 & 1) == 0 && *(void *)(a1 - 40) >= v18)
        {
          __int128 v114 = *(_OWORD *)(a1 + 8);
          __int128 v117 = *(_OWORD *)(a1 + 24);
          if (v18 >= *(void *)(a2 - 40))
          {
            unint64_t v34 = a1 + 40;
            do
            {
              unint64_t v8 = v34;
              if (v34 >= a2) {
                break;
              }
              v34 += 40LL;
            }

            while (v18 >= *(void *)v8);
          }

          else
          {
            unint64_t v8 = a1;
            do
            {
              unint64_t v33 = *(void *)(v8 + 40);
              v8 += 40LL;
            }

            while (v18 >= v33);
          }

          unint64_t v35 = a2;
          if (v8 < a2)
          {
            unint64_t v35 = a2;
            do
            {
              unint64_t v36 = *(void *)(v35 - 40);
              v35 -= 40LL;
            }

            while (v18 < v36);
          }

          while (v8 < v35)
          {
            uint64_t v140 = *(void *)(v8 + 32);
            __int128 v121 = *(_OWORD *)v8;
            __int128 v130 = *(_OWORD *)(v8 + 16);
            __int128 v37 = *(_OWORD *)v35;
            __int128 v38 = *(_OWORD *)(v35 + 16);
            *(void *)(v8 + 32) = *(void *)(v35 + 32);
            *(_OWORD *)unint64_t v8 = v37;
            *(_OWORD *)(v8 + 16) = v38;
            *(void *)(v35 + 32) = v140;
            *(_OWORD *)unint64_t v35 = v121;
            *(_OWORD *)(v35 + 16) = v130;
            do
            {
              unint64_t v39 = *(void *)(v8 + 40);
              v8 += 40LL;
            }

            while (v18 >= v39);
            do
            {
              unint64_t v40 = *(void *)(v35 - 40);
              v35 -= 40LL;
            }

            while (v18 < v40);
          }

          if (v8 - 40 != a1)
          {
            __int128 v41 = *(_OWORD *)(v8 - 40);
            __int128 v42 = *(_OWORD *)(v8 - 24);
            *(void *)(a1 + 32) = *(void *)(v8 - 8);
            *(_OWORD *)a1 = v41;
            *(_OWORD *)(a1 + 16) = v42;
          }

          a4 = 0;
          *(void *)(v8 - 40) = v18;
          *(_OWORD *)(v8 - 32) = v114;
          *(_OWORD *)(v8 - 16) = v117;
          continue;
        }

        uint64_t v19 = 0LL;
        __int128 v113 = *(_OWORD *)(a1 + 8);
        __int128 v116 = *(_OWORD *)(a1 + 24);
        do
        {
          unint64_t v20 = *(void *)(a1 + v19 + 40);
          v19 += 40LL;
        }

        while (v20 < v18);
        unint64_t v21 = a1 + v19;
        unint64_t v22 = a2;
        if (v19 == 40)
        {
          unint64_t v22 = a2;
          do
          {
            if (v21 >= v22) {
              break;
            }
            unint64_t v24 = *(void *)(v22 - 40);
            v22 -= 40LL;
          }

          while (v24 >= v18);
        }

        else
        {
          do
          {
            unint64_t v23 = *(void *)(v22 - 40);
            v22 -= 40LL;
          }

          while (v23 >= v18);
        }

        unint64_t v8 = a1 + v19;
        if (v21 < v22)
        {
          unint64_t v25 = v22;
          do
          {
            uint64_t v139 = *(void *)(v8 + 32);
            __int128 v120 = *(_OWORD *)v8;
            __int128 v129 = *(_OWORD *)(v8 + 16);
            __int128 v26 = *(_OWORD *)v25;
            __int128 v27 = *(_OWORD *)(v25 + 16);
            *(void *)(v8 + 32) = *(void *)(v25 + 32);
            *(_OWORD *)unint64_t v8 = v26;
            *(_OWORD *)(v8 + 16) = v27;
            *(void *)(v25 + 32) = v139;
            *(_OWORD *)unint64_t v25 = v120;
            *(_OWORD *)(v25 + 16) = v129;
            do
            {
              unint64_t v28 = *(void *)(v8 + 40);
              v8 += 40LL;
            }

            while (v28 < v18);
            do
            {
              unint64_t v29 = *(void *)(v25 - 40);
              v25 -= 40LL;
            }

            while (v29 >= v18);
          }

          while (v8 < v25);
        }

        if (v8 - 40 != a1)
        {
          __int128 v30 = *(_OWORD *)(v8 - 40);
          __int128 v31 = *(_OWORD *)(v8 - 24);
          *(void *)(a1 + 32) = *(void *)(v8 - 8);
          *(_OWORD *)a1 = v30;
          *(_OWORD *)(a1 + 16) = v31;
        }

        *(void *)(v8 - 40) = v18;
        *(_OWORD *)(v8 - 32) = v113;
        *(_OWORD *)(v8 - 16) = v116;
        if (v21 < v22)
        {
LABEL_29:
          std::__introsort<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*,false>( a1,  v8 - 40,  a3,  a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v32 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( a1,  v8 - 40);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( v8,  a2))
        {
          if (v32) {
            continue;
          }
          goto LABEL_29;
        }

        a2 = v8 - 40;
        if (!v32) {
          goto LABEL_1;
        }
        return;
    }
  }

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = (__int128 *)(a2 - 40);
      if (*(void *)(a2 - 40) < *(void *)a1)
      {
        __int128 v7 = *(_OWORD *)a1;
        __int128 v8 = *(_OWORD *)(a1 + 16);
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a2 - 8);
        __int128 v11 = *(_OWORD *)(a2 - 24);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v11;
        *(void *)(a1 + 32) = v10;
        *(void *)(a2 - 8) = v9;
        __int128 *v6 = v7;
        *(_OWORD *)(a2 - 24) = v8;
      }

      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)a1,  (unint64_t *)(a1 + 40),  (unint64_t *)(a2 - 40));
      return 1LL;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( a1,  a1 + 40,  a1 + 80,  a2 - 40);
      return 1LL;
    case 5uLL:
      unint64_t v21 = (void *)(a1 + 40);
      unint64_t v22 = (void *)(a1 + 80);
      unint64_t v23 = (__int128 *)(a1 + 120);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( a1,  a1 + 40,  a1 + 80,  a1 + 120);
      unint64_t v25 = *(void *)(a2 - 40);
      uint64_t v24 = a2 - 40;
      if (v25 >= *(void *)(a1 + 120)) {
        return 1LL;
      }
      __int128 v26 = *v23;
      __int128 v27 = *(_OWORD *)(a1 + 136);
      uint64_t v28 = *(void *)(a1 + 152);
      uint64_t v29 = *(void *)(v24 + 32);
      __int128 v30 = *(_OWORD *)(v24 + 16);
      __int128 *v23 = *(_OWORD *)v24;
      *(_OWORD *)(a1 + 136) = v30;
      *(void *)(a1 + 152) = v29;
      *(void *)(v24 + 32) = v28;
      *(_OWORD *)uint64_t v24 = v26;
      *(_OWORD *)(v24 + 16) = v27;
      if (*(void *)v23 >= *v22) {
        return 1LL;
      }
      uint64_t v31 = *(void *)(a1 + 112);
      __int128 v33 = *(_OWORD *)v22;
      __int128 v32 = *(_OWORD *)(a1 + 96);
      __int128 v34 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)unint64_t v22 = *v23;
      *(_OWORD *)(a1 + 96) = v34;
      *(void *)(a1 + 112) = *(void *)(a1 + 152);
      __int128 *v23 = v33;
      *(_OWORD *)(a1 + 136) = v32;
      *(void *)(a1 + 152) = v31;
      if (*v22 >= *v21) {
        return 1LL;
      }
      uint64_t v35 = *(void *)(a1 + 72);
      __int128 v37 = *(_OWORD *)v21;
      __int128 v36 = *(_OWORD *)(a1 + 56);
      __int128 v38 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)unint64_t v21 = *(_OWORD *)v22;
      *(_OWORD *)(a1 + 56) = v38;
      *(void *)(a1 + 72) = *(void *)(a1 + 112);
      *(_OWORD *)unint64_t v22 = v37;
      *(_OWORD *)(a1 + 96) = v36;
      *(void *)(a1 + 112) = v35;
      if (*(void *)(a1 + 40) >= *(void *)a1) {
        return 1LL;
      }
      uint64_t v39 = *(void *)(a1 + 32);
      __int128 v41 = *(_OWORD *)a1;
      __int128 v40 = *(_OWORD *)(a1 + 16);
      __int128 v42 = *(_OWORD *)(a1 + 56);
      *(_OWORD *)a1 = *(_OWORD *)v21;
      *(_OWORD *)(a1 + 16) = v42;
      *(void *)(a1 + 32) = *(void *)(a1 + 72);
      *(_OWORD *)unint64_t v21 = v41;
      *(_OWORD *)(a1 + 56) = v40;
      BOOL result = 1LL;
      *(void *)(a1 + 72) = v39;
      return result;
    default:
      unint64_t v12 = (void *)(a1 + 80);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mapped_memory_t * create_mapped_memory_cache_for_core_file_without_exclave_metadata_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(char const*,unsigned long,char const*)::{lambda(mapped_memory_core_file_dumped_region_info_t const&,mapped_memory_core_file_dumped_region_info_t const&)#1} &,mapped_memory_core_file_dumped_region_info_t*>( (__int128 *)a1,  (unint64_t *)(a1 + 40),  (unint64_t *)(a1 + 80));
      uint64_t v13 = a1 + 120;
      if (a1 + 120 == a2) {
        return 1LL;
      }
      uint64_t v14 = 0LL;
      int v15 = 0;
      break;
  }

  while (1)
  {
    unint64_t v16 = *(void *)v13;
    if (*(void *)v13 < *v12)
    {
      __int128 v43 = *(_OWORD *)(v13 + 8);
      __int128 v44 = *(_OWORD *)(v13 + 24);
      uint64_t v17 = v14;
      while (1)
      {
        uint64_t v18 = a1 + v17;
        __int128 v19 = *(_OWORD *)(a1 + v17 + 96);
        *(_OWORD *)(v18 + 120) = *(_OWORD *)(a1 + v17 + 80);
        *(_OWORD *)(v18 + 136) = v19;
        *(void *)(v18 + 152) = *(void *)(a1 + v17 + 112);
        if (v17 == -80) {
          break;
        }
        v17 -= 40LL;
        if (v16 >= *(void *)(v18 + 40))
        {
          uint64_t v20 = a1 + v17 + 120;
          goto LABEL_13;
        }
      }

      uint64_t v20 = a1;
LABEL_13:
      *(void *)uint64_t v20 = v16;
      *(_OWORD *)(v20 + 8) = v43;
      *(_OWORD *)(v20 + 24) = v44;
      if (++v15 == 8) {
        return v13 + 40 == a2;
      }
    }

    unint64_t v12 = (void *)v13;
    v14 += 40LL;
    v13 += 40LL;
    if (v13 == a2) {
      return 1LL;
    }
  }

void *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone( uint64_t a1)
{
  BOOL result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *BOOL result = off_189DFAB48;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_189DFAB48;
  a2[1] = v2;
  return result;
}

unsigned int *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::operator()( uint64_t a1)
{
  return CSRelease(**(unsigned int ***)(a1 + 8), *(void *)(*(void *)(a1 + 8) + 8LL));
}

uint64_t std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1},std::allocator<std::optional<std::pair<vas_segmentinfo_table,CSExclaveCoreFileType>> core_file_get_exclave_segmentinfo_table_and_type<Pointer64>(char const*,mapped_memory_t *)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void set_up_mapped_memory_cache_for_exclave_core_file<SizeAndEndianness<Pointer64,LittleEndian>>(char const*,unsigned long long,vas_segmentinfo_table const&,CSExclaveCoreFileType,mapped_memory_t *)::{lambda(unsigned long long)#1}::operator()( uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 40);
  unint64_t v10 = a2 - v2;
  if (a2 > v2)
  {
    unint64_t v4 = a2 - v2;
    do
    {
      __int128 v5 = *(uint64_t **)(a1 + 48);
      if (v4 >= 0x6400000) {
        unint64_t v6 = 104857600LL;
      }
      else {
        unint64_t v6 = v4;
      }
      *(void *)&__int128 v17 = v2;
      *((void *)&v17 + 1) = v6;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      int v21 = 0;
      int v7 = *(unsigned __int8 *)(a1 + 25);
      int v18 = 1;
      int v22 = v7;
      uint64_t v23 = 0LL;
      memset(v24, 0, sizeof(v24));
      __int16 v25 = 3;
      uint64_t v26 = 0LL;
      __int16 v27 = 0;
      int v28 = 0;
      uint64_t v29 = 0LL;
      int v8 = *(_DWORD *)(a1 + 28);
      int v30 = 3;
      int v31 = v8;
      LOBYTE(v32) = 0;
      char v34 = 0;
      uint64_t v9 = v6 >> 14;
      __int16 v14 = 0;
      std::vector<unsigned short>::vector(v15, v6 >> 14, &v14);
      __int128 v35 = *(_OWORD *)v15;
      uint64_t v36 = v16;
      v15[1] = 0LL;
      uint64_t v16 = 0LL;
      v15[0] = 0LL;
      char v37 = 1;
      __int16 v11 = 0;
      std::vector<unsigned short>::vector(__p, v9, &v11);
      __int128 v38 = *(_OWORD *)__p;
      uint64_t v39 = v13;
      __p[1] = 0LL;
      uint64_t v13 = 0LL;
      __p[0] = 0LL;
      char v40 = 1;
      memset(v41, 0, sizeof(v41));
      std::vector<CSCppCoreFileRegionInfo>::push_back[abi:ne180100](v5, &v17);
      __int128 v42 = (void **)v41;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v42);
      if (v40 && (void)v38)
      {
        *((void *)&v38 + 1) = v38;
        operator delete((void *)v38);
      }

      if (v37 && (void)v35)
      {
        *((void *)&v35 + 1) = v35;
        operator delete((void *)v35);
      }

      if (v34 && v33 < 0) {
        operator delete(v32);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }

      if (v15[0])
      {
        v15[1] = v15[0];
        operator delete(v15[0]);
      }

      v2 += 104857600LL;
      v4 -= 104857600LL;
    }

    while (v2 < v10 + *(void *)(a1 + 40));
  }

void sub_1860873A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, __int16 a34, char a35, char a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
  if (a41)
  {
    __int128 v43 = *(void **)(v41 + 136);
    if (v43)
    {
      *(void *)(v41 + 144) = v43;
      operator delete(v43);
    }
  }

  if (__p) {
    operator delete(__p);
  }
  if (a37)
  {
    if (a36 < 0) {
      operator delete(*(void **)(v41 + 104));
    }
  }

  _Unwind_Resume(exception_object);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( uint64_t a1, __n128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  unint64_t v8 = a1;
  while (2)
  {
    a1 = v8;
    uint64_t v9 = (uint64_t)a2 - v8;
    unint64_t v10 = (uint64_t)((uint64_t)a2 - v8) >> 5;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        unint64_t v36 = a2[-2].n128_u64[0];
        __int128 v35 = (__int128 *)&a2[-2];
        if (v36 < *(void *)v8)
        {
          __int128 v105 = *(_OWORD *)v8;
          __int128 v114 = *(_OWORD *)(v8 + 16);
          __int128 v37 = v35[1];
          *(_OWORD *)unint64_t v8 = *v35;
          *(_OWORD *)(v8 + 16) = v37;
          *__int128 v35 = v105;
          v35[1] = v114;
        }

        return;
      case 3uLL:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)v8,  (unint64_t *)(v8 + 32),  a2[-2].n128_u64);
        return;
      case 4uLL:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( v8,  (__n128 *)(v8 + 32),  (__n128 *)(v8 + 64),  a2 - 2);
        return;
      case 5uLL:
        __int128 v38 = (__int128 *)(v8 + 32);
        uint64_t v39 = (__int128 *)(v8 + 64);
        char v40 = (__int128 *)(v8 + 96);
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( v8,  (__n128 *)(v8 + 32),  (__n128 *)(v8 + 64),  (__n128 *)(v8 + 96));
        unint64_t v42 = a2[-2].n128_u64[0];
        uint64_t v41 = a2 - 2;
        if (v42 < *(void *)(v8 + 96))
        {
          __n128 v43 = (__n128)*v40;
          __n128 v115 = *(__n128 *)(v8 + 112);
          __n128 v44 = v41[1];
          *char v40 = (__int128)*v41;
          *(__n128 *)(v8 + 112) = v44;
          *uint64_t v41 = v43;
          v41[1] = v115;
          if (*(void *)v40 < *(void *)v39)
          {
            __int128 v46 = *v39;
            __int128 v45 = *(_OWORD *)(v8 + 80);
            __int128 v47 = *(_OWORD *)(v8 + 112);
            *uint64_t v39 = *v40;
            *(_OWORD *)(v8 + 80) = v47;
            *char v40 = v46;
            *(_OWORD *)(v8 + 112) = v45;
            if (*(void *)v39 < *(void *)v38)
            {
              __int128 v49 = *v38;
              __int128 v48 = *(_OWORD *)(v8 + 48);
              __int128 v50 = *(_OWORD *)(v8 + 80);
              *__int128 v38 = *v39;
              *(_OWORD *)(v8 + 48) = v50;
              *uint64_t v39 = v49;
              *(_OWORD *)(v8 + 80) = v48;
              if (*(void *)(v8 + 32) < *(void *)v8)
              {
                __int128 v106 = *(_OWORD *)v8;
                __int128 v116 = *(_OWORD *)(v8 + 16);
                __int128 v51 = *(_OWORD *)(v8 + 48);
                *(_OWORD *)unint64_t v8 = *v38;
                *(_OWORD *)(v8 + 16) = v51;
                *__int128 v38 = v106;
                *(_OWORD *)(v8 + 48) = v116;
              }
            }
          }
        }

        return;
      default:
        if (v9 <= 767)
        {
          __int128 v52 = (__n128 *)(v8 + 32);
          BOOL v54 = (__n128 *)v8 == a2 || v52 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v54)
            {
              uint64_t v55 = 0LL;
              unint64_t v56 = v8;
              do
              {
                __int128 v57 = v52;
                unint64_t v58 = *(void *)(v56 + 32);
                if (v58 < *(void *)v56)
                {
                  __int128 v107 = *(_OWORD *)(v56 + 40);
                  uint64_t v117 = *(void *)(v56 + 56);
                  uint64_t v59 = v55;
                  while (1)
                  {
                    uint64_t v60 = v8 + v59;
                    __int128 v61 = *(_OWORD *)(v8 + v59 + 16);
                    *(_OWORD *)(v60 + 32) = *(_OWORD *)(v8 + v59);
                    *(_OWORD *)(v60 + 48) = v61;
                    if (!v59) {
                      break;
                    }
                    v59 -= 32LL;
                    if (v58 >= *(void *)(v60 - 32))
                    {
                      uint64_t v62 = v8 + v59 + 32;
                      goto LABEL_75;
                    }
                  }

                  uint64_t v62 = v8;
LABEL_75:
                  *(void *)uint64_t v62 = v58;
                  *(void *)(v62 + 24) = v117;
                  *(_OWORD *)(v62 + 8) = v107;
                }

                __int128 v52 = v57 + 2;
                v55 += 32LL;
                unint64_t v56 = (unint64_t)v57;
              }

              while (&v57[2] != a2);
            }
          }

          else if (!v54)
          {
            do
            {
              uint64_t v92 = (uint64_t)v52;
              unint64_t v93 = *(void *)(a1 + 32);
              if (v93 < *(void *)a1)
              {
                __n128 v110 = *(__n128 *)(a1 + 40);
                unint64_t v120 = *(void *)(a1 + 56);
                do
                {
                  __n128 v94 = v52[-1];
                  __n128 *v52 = v52[-2];
                  v52[1] = v94;
                  unint64_t v95 = v52[-4].n128_u64[0];
                  v52 -= 2;
                }

                while (v93 < v95);
                v52->n128_u64[0] = v93;
                v52[1].n128_u64[1] = v120;
                *(__n128 *)((char *)v52 + 8) = v110;
              }

              __int128 v52 = (__n128 *)(v92 + 32);
              a1 = v92;
            }

            while ((__n128 *)(v92 + 32) != a2);
          }

          return;
        }

        if (!a3)
        {
          if ((__n128 *)v8 != a2)
          {
            int64_t v63 = (v10 - 2) >> 1;
            int64_t v64 = v63;
            do
            {
              int64_t v65 = v64;
              if (v63 >= v64)
              {
                uint64_t v66 = (2 * v64) | 1;
                unint64_t v67 = v8 + 32 * v66;
                if (2 * v65 + 2 >= (uint64_t)v10)
                {
                  unint64_t v68 = *(void *)v67;
                }

                else
                {
                  unint64_t v68 = *(void *)(v67 + 32);
                  BOOL v69 = *(void *)v67 >= v68;
                  if (*(void *)v67 > v68) {
                    unint64_t v68 = *(void *)v67;
                  }
                  if (!v69)
                  {
                    v67 += 32LL;
                    uint64_t v66 = 2 * v65 + 2;
                  }
                }

                unint64_t v70 = v8 + 32 * v65;
                unint64_t v71 = *(void *)v70;
                if (v68 >= *(void *)v70)
                {
                  uint64_t v118 = *(void *)(v70 + 24);
                  __int128 v108 = *(_OWORD *)(v70 + 8);
                  do
                  {
                    uint64_t v72 = (_OWORD *)v70;
                    unint64_t v70 = v67;
                    __int128 v73 = *(_OWORD *)(v67 + 16);
                    _OWORD *v72 = *(_OWORD *)v67;
                    v72[1] = v73;
                    if (v63 < v66) {
                      break;
                    }
                    uint64_t v74 = (2 * v66) | 1;
                    unint64_t v67 = v8 + 32 * v74;
                    uint64_t v66 = 2 * v66 + 2;
                    if (v66 >= (uint64_t)v10)
                    {
                      unint64_t v75 = *(void *)v67;
                      uint64_t v66 = v74;
                    }

                    else
                    {
                      unint64_t v75 = *(void *)v67;
                      unint64_t v76 = *(void *)(v67 + 32);
                      if (*(void *)v67 <= v76) {
                        unint64_t v75 = *(void *)(v67 + 32);
                      }
                      if (*(void *)v67 >= v76) {
                        uint64_t v66 = v74;
                      }
                      else {
                        v67 += 32LL;
                      }
                    }
                  }

                  while (v75 >= v71);
                  *(void *)unint64_t v70 = v71;
                  *(void *)(v70 + 24) = v118;
                  *(_OWORD *)(v70 + 8) = v108;
                }
              }

              int64_t v64 = v65 - 1;
            }

            while (v65);
            uint64_t v77 = (unint64_t)v9 >> 5;
            do
            {
              uint64_t v78 = 0LL;
              __int128 v109 = *(_OWORD *)v8;
              __n128 v119 = *(__n128 *)(v8 + 16);
              uint64_t v79 = (_OWORD *)v8;
              do
              {
                uint64_t v80 = (uint64_t)&v79[2 * v78 + 2];
                uint64_t v81 = (2 * v78) | 1;
                uint64_t v82 = 2 * v78 + 2;
                if (v82 < v77 && *(void *)v80 < *(void *)(v80 + 32))
                {
                  v80 += 32LL;
                  uint64_t v81 = v82;
                }

                __int128 v83 = *(_OWORD *)(v80 + 16);
                _OWORD *v79 = *(_OWORD *)v80;
                v79[1] = v83;
                uint64_t v79 = (_OWORD *)v80;
                uint64_t v78 = v81;
              }

              while (v81 <= (uint64_t)((unint64_t)(v77 - 2) >> 1));
              a2 -= 2;
              if ((__n128 *)v80 == a2)
              {
                *(_OWORD *)uint64_t v80 = v109;
                *(__n128 *)(v80 + 16) = v119;
              }

              else
              {
                __n128 v84 = a2[1];
                *(__n128 *)uint64_t v80 = *a2;
                *(__n128 *)(v80 + 16) = v84;
                *a2 = (__n128)v109;
                a2[1] = v119;
                uint64_t v85 = v80 - v8 + 32;
                if (v85 >= 33)
                {
                  unint64_t v86 = (((unint64_t)v85 >> 5) - 2) >> 1;
                  __int128 v87 = (_OWORD *)(v8 + 32 * v86);
                  unint64_t v88 = *(void *)v80;
                  if (*(void *)v87 < *(void *)v80)
                  {
                    uint64_t v101 = *(void *)(v80 + 24);
                    __int128 v98 = *(_OWORD *)(v80 + 8);
                    do
                    {
                      unint64_t v89 = (_OWORD *)v80;
                      uint64_t v80 = (uint64_t)v87;
                      __int128 v90 = v87[1];
                      _OWORD *v89 = *v87;
                      v89[1] = v90;
                      if (!v86) {
                        break;
                      }
                      unint64_t v86 = (v86 - 1) >> 1;
                      __int128 v87 = (_OWORD *)(v8 + 32 * v86);
                    }

                    while (*(void *)v87 < v88);
                    *(void *)uint64_t v80 = v88;
                    *(void *)(v80 + 24) = v101;
                    *(_OWORD *)(v80 + 8) = v98;
                  }
                }
              }
            }

            while (v77-- > 2);
          }

          return;
        }

        unint64_t v11 = v10 >> 1;
        unint64_t v12 = v8 + 32 * (v10 >> 1);
        if ((unint64_t)v9 <= 0x1000)
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(a1 + 32 * (v10 >> 1)),  (unint64_t *)a1,  a2[-2].n128_u64);
        }

        else
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)a1,  (unint64_t *)(a1 + 32 * (v10 >> 1)),  a2[-2].n128_u64);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(a1 + 32),  (unint64_t *)(v12 - 32),  a2[-4].n128_u64);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(a1 + 64),  (unint64_t *)(a1 + 32 + 32 * v11),  a2[-6].n128_u64);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)(v12 - 32),  (unint64_t *)v12,  (unint64_t *)(a1 + 32 + 32 * v11));
          __int128 v102 = *(_OWORD *)a1;
          __int128 v111 = *(_OWORD *)(a1 + 16);
          __int128 v13 = *(_OWORD *)(v12 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v12;
          *(_OWORD *)(a1 + 16) = v13;
          *(_OWORD *)unint64_t v12 = v102;
          *(_OWORD *)(v12 + 16) = v111;
        }

        --a3;
        unint64_t v14 = *(void *)a1;
        if ((a4 & 1) == 0 && *(void *)(a1 - 32) >= v14)
        {
          uint64_t v100 = *(void *)(a1 + 24);
          __int128 v97 = *(_OWORD *)(a1 + 8);
          if (v14 >= a2[-2].n128_u64[0])
          {
            unint64_t v28 = a1 + 32;
            do
            {
              unint64_t v8 = v28;
              v28 += 32LL;
            }

            while (v14 >= *(void *)v8);
          }

          else
          {
            unint64_t v8 = a1;
            do
            {
              unint64_t v27 = *(void *)(v8 + 32);
              v8 += 32LL;
            }

            while (v14 >= v27);
          }

          uint64_t v29 = (__int128 *)a2;
          if (v8 < (unint64_t)a2)
          {
            uint64_t v29 = (__int128 *)a2;
            do
            {
              unint64_t v30 = *((void *)v29 - 4);
              v29 -= 2;
            }

            while (v14 < v30);
          }

          while (v8 < (unint64_t)v29)
          {
            __int128 v104 = *(_OWORD *)v8;
            __int128 v113 = *(_OWORD *)(v8 + 16);
            __int128 v31 = v29[1];
            *(_OWORD *)unint64_t v8 = *v29;
            *(_OWORD *)(v8 + 16) = v31;
            *uint64_t v29 = v104;
            v29[1] = v113;
            do
            {
              unint64_t v32 = *(void *)(v8 + 32);
              v8 += 32LL;
            }

            while (v14 >= v32);
            do
            {
              unint64_t v33 = *((void *)v29 - 4);
              v29 -= 2;
            }

            while (v14 < v33);
          }

          if (v8 - 32 != a1)
          {
            __int128 v34 = *(_OWORD *)(v8 - 16);
            *(_OWORD *)a1 = *(_OWORD *)(v8 - 32);
            *(_OWORD *)(a1 + 16) = v34;
          }

          a4 = 0;
          *(void *)(v8 - 32) = v14;
          *(void *)(v8 - 8) = v100;
          *(_OWORD *)(v8 - 24) = v97;
          continue;
        }

        uint64_t v15 = 0LL;
        uint64_t v99 = *(void *)(a1 + 24);
        __int128 v96 = *(_OWORD *)(a1 + 8);
        do
        {
          unint64_t v16 = *(void *)(a1 + v15 + 32);
          v15 += 32LL;
        }

        while (v16 < v14);
        unint64_t v17 = a1 + v15;
        int v18 = a2;
        if (v15 == 32)
        {
          int v18 = a2;
          do
          {
            unint64_t v20 = v18[-2].n128_u64[0];
            v18 -= 2;
          }

          while (v20 >= v14);
        }

        else
        {
          do
          {
            unint64_t v19 = v18[-2].n128_u64[0];
            v18 -= 2;
          }

          while (v19 >= v14);
        }

        unint64_t v8 = a1 + v15;
        if (v17 < (unint64_t)v18)
        {
          int v21 = (__int128 *)v18;
          do
          {
            __int128 v103 = *(_OWORD *)v8;
            __int128 v112 = *(_OWORD *)(v8 + 16);
            __int128 v22 = v21[1];
            *(_OWORD *)unint64_t v8 = *v21;
            *(_OWORD *)(v8 + 16) = v22;
            __int128 *v21 = v103;
            v21[1] = v112;
            do
            {
              unint64_t v23 = *(void *)(v8 + 32);
              v8 += 32LL;
            }

            while (v23 < v14);
            do
            {
              unint64_t v24 = *((void *)v21 - 4);
              v21 -= 2;
            }

            while (v24 >= v14);
          }

          while (v8 < (unint64_t)v21);
        }

        if (v8 - 32 != a1)
        {
          __int128 v25 = *(_OWORD *)(v8 - 16);
          *(_OWORD *)a1 = *(_OWORD *)(v8 - 32);
          *(_OWORD *)(a1 + 16) = v25;
        }

        *(void *)(v8 - 32) = v14;
        *(void *)(v8 - 8) = v99;
        *(_OWORD *)(v8 - 24) = v96;
        if (v17 < (unint64_t)v18)
        {
LABEL_29:
          _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( a1,  v8 - 32,  a3,  a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v26 = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_( a1,  v8 - 32);
        if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_( v8,  (uint64_t)a2))
        {
          if (v26) {
            continue;
          }
          goto LABEL_29;
        }

        a2 = (__n128 *)(v8 - 32);
        if (!v26) {
          goto LABEL_1;
        }
        return;
    }
  }

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEbT1_SP_SI_( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 5;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      unint64_t v6 = (__int128 *)(a2 - 32);
      if (*(void *)(a2 - 32) < *(void *)a1)
      {
        __int128 v8 = *(_OWORD *)a1;
        __int128 v7 = *(_OWORD *)(a1 + 16);
        __int128 v9 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v9;
        __int128 *v6 = v8;
        *(_OWORD *)(a2 - 16) = v7;
      }

      return result;
    case 3LL:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)a1,  (unint64_t *)(a1 + 32),  (unint64_t *)(a2 - 32));
      return 1LL;
    case 4LL:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( a1,  (__n128 *)(a1 + 32),  (__n128 *)(a1 + 64),  (__n128 *)(a2 - 32));
      return 1LL;
    case 5LL:
      unint64_t v19 = (__int128 *)(a1 + 32);
      unint64_t v20 = (__int128 *)(a1 + 64);
      int v21 = (__int128 *)(a1 + 96);
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEvT1_SP_SP_SP_SI_( a1,  (__n128 *)(a1 + 32),  (__n128 *)(a1 + 64),  (__n128 *)(a1 + 96));
      unint64_t v23 = *(void *)(a2 - 32);
      __int128 v22 = (__int128 *)(a2 - 32);
      if (v23 < *(void *)(a1 + 96))
      {
        __int128 v25 = *v21;
        __int128 v24 = *(_OWORD *)(a1 + 112);
        __int128 v26 = v22[1];
        __int128 *v21 = *v22;
        *(_OWORD *)(a1 + 112) = v26;
        __int128 *v22 = v25;
        v22[1] = v24;
        if (*(void *)v21 < *(void *)v20)
        {
          __int128 v28 = *v20;
          __int128 v27 = *(_OWORD *)(a1 + 80);
          __int128 v29 = *(_OWORD *)(a1 + 112);
          *unint64_t v20 = *v21;
          *(_OWORD *)(a1 + 80) = v29;
          __int128 *v21 = v28;
          *(_OWORD *)(a1 + 112) = v27;
          if (*(void *)v20 < *(void *)v19)
          {
            __int128 v31 = *v19;
            __int128 v30 = *(_OWORD *)(a1 + 48);
            __int128 v32 = *(_OWORD *)(a1 + 80);
            *unint64_t v19 = *v20;
            *(_OWORD *)(a1 + 48) = v32;
            *unint64_t v20 = v31;
            *(_OWORD *)(a1 + 80) = v30;
            if (*(void *)(a1 + 32) < *(void *)a1)
            {
              __int128 v34 = *(_OWORD *)a1;
              __int128 v33 = *(_OWORD *)(a1 + 16);
              __int128 v35 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v35;
              *unint64_t v19 = v34;
              *(_OWORD *)(a1 + 48) = v33;
            }
          }
        }
      }

      return 1LL;
    default:
      unint64_t v10 = (void *)(a1 + 64);
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E_P11vas_segmentEEjT1_SP_SP_SI_( (__int128 *)a1,  (unint64_t *)(a1 + 32),  (unint64_t *)(a1 + 64));
      uint64_t v11 = a1 + 96;
      if (a1 + 96 == a2) {
        return 1LL;
      }
      uint64_t v12 = 0LL;
      int v13 = 0;
      break;
  }

  while (1)
  {
    unint64_t v14 = *(void *)v11;
    if (*(void *)v11 < *v10)
    {
      __int128 v36 = *(_OWORD *)(v11 + 8);
      uint64_t v37 = *(void *)(v11 + 24);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        __int128 v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64) {
          break;
        }
        v15 -= 32LL;
        if (v14 >= *(void *)(v16 + 32))
        {
          uint64_t v18 = a1 + v15 + 96;
          goto LABEL_13;
        }
      }

      uint64_t v18 = a1;
LABEL_13:
      *(void *)uint64_t v18 = v14;
      *(_OWORD *)(v18 + 8) = v36;
      *(void *)(v18 + 24) = v37;
      if (++v13 == 8) {
        return v11 + 32 == a2;
      }
    }

    unint64_t v10 = (void *)v11;
    v12 += 32LL;
    v11 += 32LL;
    if (v11 == a2) {
      return 1LL;
    }
  }

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  v197 = a2 - 14;
  v202 = a2;
  v195 = a2 - 42;
  v196 = a2 - 28;
  unint64_t v6 = a1;
  while (2)
  {
    a1 = v6;
    __int128 v7 = v202;
    uint64_t v8 = (uint64_t)v202 - v6;
    unint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)((uint64_t)v202 - v6) >> 5);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        int64_t v64 = v202 - 14;
        if (*((void *)v202 - 28) < *(void *)a1)
        {
          int64_t v65 = (__int128 *)a1;
          goto LABEL_83;
        }

        return;
      case 3uLL:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  v197);
        return;
      case 4uLL:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  v197);
        return;
      case 5uLL:
        uint64_t v66 = (void *)(a1 + 448);
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  (__int128 *)(a1 + 672));
        if (*((void *)v202 - 28) < *(void *)(a1 + 672))
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 672), v202 - 14);
          if (*(void *)(a1 + 672) < *v66)
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 448), (__int128 *)(a1 + 672));
            if (*v66 < *(void *)(a1 + 224))
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 224), (__int128 *)(a1 + 448));
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                int64_t v65 = (__int128 *)a1;
                int64_t v64 = (__int128 *)(a1 + 224);
LABEL_83:
                std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v65, v64);
              }
            }
          }
        }

        return;
      default:
        if (v8 > 5375)
        {
          if (!a3)
          {
            if ((__int128 *)a1 != v202)
            {
              int64_t v200 = (v9 - 2) >> 1;
              int64_t v91 = v200;
              do
              {
                int64_t v92 = v91;
                if (v200 >= v91)
                {
                  uint64_t v93 = (2 * v91) | 1;
                  __n128 v94 = (__int128 *)(a1 + 224 * v93);
                  if (2 * v92 + 2 >= (uint64_t)v9)
                  {
                    unint64_t v95 = *(void *)v94;
                  }

                  else
                  {
                    unint64_t v95 = *(void *)v94;
                    unint64_t v96 = *((void *)v94 + 28);
                    if (*(void *)v94 <= v96) {
                      unint64_t v95 = *((void *)v94 + 28);
                    }
                    if (*(void *)v94 < v96)
                    {
                      v94 += 14;
                      uint64_t v93 = 2 * v92 + 2;
                    }
                  }

                  unint64_t v97 = a1 + 224 * v92;
                  if (v95 >= *(void *)v97)
                  {
                    __int128 v98 = *(_OWORD *)v97;
                    __int128 v99 = *(_OWORD *)(v97 + 32);
                    __int128 v223 = *(_OWORD *)(v97 + 16);
                    __int128 v224 = v99;
                    __int128 v222 = v98;
                    __int128 v100 = *(_OWORD *)(v97 + 48);
                    __int128 v101 = *(_OWORD *)(v97 + 64);
                    __int128 v102 = *(_OWORD *)(v97 + 80);
                    uint64_t v228 = *(void *)(v97 + 96);
                    __int128 v226 = v101;
                    __int128 v227 = v102;
                    __int128 v225 = v100;
                    v229.n128_u8[0] = 0;
                    char v231 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 128))
                    {
                      unint64_t v103 = a1 + 224 * v92;
                      __n128 v104 = *(__n128 *)(v103 + 104);
                      uint64_t v230 = *(void *)(v103 + 120);
                      __n128 v229 = v104;
                      *(void *)(v103 + 112) = 0LL;
                      *(void *)(v103 + 120) = 0LL;
                      *(void *)(v103 + 104) = 0LL;
                      char v231 = 1;
                    }

                    v232.n128_u8[0] = 0;
                    char v234 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 160))
                    {
                      unint64_t v105 = a1 + 224 * v92;
                      __n128 v232 = *(__n128 *)(v105 + 136);
                      uint64_t v233 = *(void *)(v105 + 152);
                      *(void *)(v105 + 136) = 0LL;
                      *(void *)(v105 + 144) = 0LL;
                      *(void *)(v105 + 152) = 0LL;
                      char v234 = 1;
                    }

                    __p.n128_u8[0] = 0;
                    char v237 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 192))
                    {
                      unint64_t v106 = a1 + 224 * v92;
                      __n128 __p = *(__n128 *)(v106 + 168);
                      uint64_t v236 = *(void *)(v106 + 184);
                      *(void *)(v106 + 168) = 0LL;
                      *(void *)(v106 + 176) = 0LL;
                      *(void *)(v106 + 184) = 0LL;
                      char v237 = 1;
                    }

                    int64_t v198 = v92;
                    unint64_t v107 = a1 + 224 * v92;
                    __int128 v238 = *(_OWORD *)(v107 + 200);
                    uint64_t v239 = *(void *)(v107 + 216);
                    *(void *)(v107 + 200) = 0LL;
                    *(void *)(v107 + 208) = 0LL;
                    *(void *)(v107 + 216) = 0LL;
                    do
                    {
                      __int128 v108 = v94;
                      __int128 v109 = *v94;
                      __int128 v110 = v94[2];
                      *(_OWORD *)(v97 + 16) = v94[1];
                      *(_OWORD *)(v97 + 32) = v110;
                      *(_OWORD *)unint64_t v97 = v109;
                      __int128 v111 = v94[3];
                      __int128 v112 = v94[4];
                      __int128 v113 = v94[5];
                      *(void *)(v97 + 96) = *((void *)v94 + 12);
                      *(_OWORD *)(v97 + 64) = v112;
                      *(_OWORD *)(v97 + 80) = v113;
                      *(_OWORD *)(v97 + 48) = v111;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v97 + 104,  (__n128 *)((char *)v94 + 104));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 136,  (__n128 *)((char *)v108 + 136));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 168,  (__n128 *)((char *)v108 + 168));
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v97 + 200));
                      *(_OWORD *)(v97 + 200) = *(__int128 *)((char *)v108 + 200);
                      *(void *)(v97 + 216) = *((void *)v108 + 27);
                      *((void *)v108 + 25) = 0LL;
                      *((void *)v108 + 26) = 0LL;
                      *((void *)v108 + 27) = 0LL;
                      if (v200 < v93) {
                        break;
                      }
                      __n128 v94 = (__int128 *)(a1 + 224 * ((2 * v93) | 1));
                      if (2 * v93 + 2 >= (uint64_t)v9)
                      {
                        unint64_t v114 = *(void *)v94;
                        uint64_t v93 = (2 * v93) | 1;
                      }

                      else
                      {
                        unint64_t v114 = *(void *)v94;
                        unint64_t v115 = *((void *)v94 + 28);
                        if (*(void *)v94 <= v115) {
                          unint64_t v114 = *((void *)v94 + 28);
                        }
                        if (*(void *)v94 >= v115)
                        {
                          uint64_t v93 = (2 * v93) | 1;
                        }

                        else
                        {
                          v94 += 14;
                          uint64_t v93 = 2 * v93 + 2;
                        }
                      }

                      unint64_t v97 = (unint64_t)v108;
                    }

                    while (v114 >= (unint64_t)v222);
                    __int128 v116 = v222;
                    __int128 v117 = v224;
                    v108[1] = v223;
                    v108[2] = v117;
                    *__int128 v108 = v116;
                    __int128 v118 = v225;
                    __int128 v119 = v226;
                    __int128 v120 = v227;
                    *((void *)v108 + 12) = v228;
                    v108[4] = v119;
                    v108[5] = v120;
                    v108[3] = v118;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v108 + 104,  &v229);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 136,  &v232);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 168,  &__p);
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v108 + 25);
                    *(__int128 *)((char *)v108 + 200) = v238;
                    *((void *)v108 + 27) = v239;
                    __int128 v238 = 0uLL;
                    uint64_t v239 = 0LL;
                    *(void *)&__int128 v203 = &v238;
                    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                    if (v237 && __p.n128_u64[0])
                    {
                      __p.n128_u64[1] = __p.n128_u64[0];
                      operator delete((void *)__p.n128_u64[0]);
                    }

                    if (v234 && v232.n128_u64[0])
                    {
                      v232.n128_u64[1] = v232.n128_u64[0];
                      operator delete((void *)v232.n128_u64[0]);
                    }

                    if (v231 && SHIBYTE(v230) < 0) {
                      operator delete((void *)v229.n128_u64[0]);
                    }
                    __int128 v7 = v202;
                    int64_t v92 = v198;
                  }
                }

                int64_t v91 = v92 - 1;
              }

              while (v92);
              uint64_t v121 = (((unint64_t)v8 >> 5) * (unsigned __int128)0x2492492492492493uLL) >> 64;
              v194 = (__n128 *)(a1 + 104);
              do
              {
                __int128 v122 = *(_OWORD *)a1;
                __int128 v123 = *(_OWORD *)(a1 + 32);
                __int128 v204 = *(_OWORD *)(a1 + 16);
                __int128 v205 = v123;
                __int128 v203 = v122;
                __int128 v124 = *(_OWORD *)(a1 + 48);
                __int128 v125 = *(_OWORD *)(a1 + 64);
                __int128 v126 = *(_OWORD *)(a1 + 80);
                uint64_t v209 = *(void *)(a1 + 96);
                __int128 v207 = v125;
                __int128 v208 = v126;
                __int128 v206 = v124;
                v210.n128_u8[0] = 0;
                char v212 = 0;
                if (*(_BYTE *)(a1 + 128))
                {
                  __n128 v127 = *v194;
                  uint64_t v211 = *(void *)(a1 + 120);
                  __n128 v210 = v127;
                  *(void *)(a1 + 112) = 0LL;
                  *(void *)(a1 + 120) = 0LL;
                  v194->n128_u64[0] = 0LL;
                  char v212 = 1;
                }

                v213.n128_u8[0] = 0;
                char v215 = 0;
                if (*(_BYTE *)(a1 + 160))
                {
                  __n128 v213 = *(__n128 *)(a1 + 136);
                  uint64_t v214 = *(void *)(a1 + 152);
                  *(void *)(a1 + 136) = 0LL;
                  *(void *)(a1 + 144) = 0LL;
                  *(void *)(a1 + 152) = 0LL;
                  char v215 = 1;
                }

                v201 = v7;
                v216.n128_u8[0] = 0;
                char v218 = 0;
                if (*(_BYTE *)(a1 + 192))
                {
                  __n128 v216 = *(__n128 *)(a1 + 168);
                  uint64_t v217 = *(void *)(a1 + 184);
                  *(void *)(a1 + 168) = 0LL;
                  *(void *)(a1 + 176) = 0LL;
                  *(void *)(a1 + 184) = 0LL;
                  char v218 = 1;
                }

                uint64_t v128 = 0LL;
                __int128 v219 = *(_OWORD *)(a1 + 200);
                uint64_t v220 = *(void *)(a1 + 216);
                *(void *)(a1 + 200) = 0LL;
                *(void *)(a1 + 208) = 0LL;
                *(void *)(a1 + 216) = 0LL;
                uint64_t v129 = a1;
                do
                {
                  uint64_t v130 = v129 + 224 * v128 + 224;
                  uint64_t v131 = 2 * v128;
                  uint64_t v128 = (2 * v128) | 1;
                  if (v131 + 2 < v121 && *(void *)v130 < *(void *)(v130 + 224))
                  {
                    v130 += 224LL;
                    uint64_t v128 = v131 + 2;
                  }

                  __int128 v132 = *(_OWORD *)v130;
                  __int128 v133 = *(_OWORD *)(v130 + 32);
                  *(_OWORD *)(v129 + 16) = *(_OWORD *)(v130 + 16);
                  *(_OWORD *)(v129 + 32) = v133;
                  *(_OWORD *)uint64_t v129 = v132;
                  __int128 v134 = *(_OWORD *)(v130 + 48);
                  __int128 v135 = *(_OWORD *)(v130 + 64);
                  __int128 v136 = *(_OWORD *)(v130 + 80);
                  *(void *)(v129 + 96) = *(void *)(v130 + 96);
                  *(_OWORD *)(v129 + 64) = v135;
                  *(_OWORD *)(v129 + 80) = v136;
                  *(_OWORD *)(v129 + 48) = v134;
                  __int128 v137 = (__n128 *)(v130 + 104);
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v129 + 104,  (__n128 *)(v130 + 104));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 136,  (__n128 *)(v130 + 136));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 168,  (__n128 *)(v130 + 168));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v129 + 200));
                  *(_OWORD *)(v129 + 200) = *(_OWORD *)(v130 + 200);
                  *(void *)(v129 + 216) = *(void *)(v130 + 216);
                  *(void *)(v130 + 200) = 0LL;
                  *(void *)(v130 + 208) = 0LL;
                  *(void *)(v130 + 216) = 0LL;
                  uint64_t v129 = v130;
                }

                while (v128 <= (uint64_t)((unint64_t)(v121 - 2) >> 1));
                if ((__int128 *)v130 == v201 - 14)
                {
                  __int128 v169 = v203;
                  __int128 v170 = v205;
                  *(_OWORD *)(v130 + 16) = v204;
                  *(_OWORD *)(v130 + 32) = v170;
                  *(_OWORD *)uint64_t v130 = v169;
                  __int128 v171 = v206;
                  __int128 v172 = v207;
                  __int128 v173 = v208;
                  *(void *)(v130 + 96) = v209;
                  *(_OWORD *)(v130 + 64) = v172;
                  *(_OWORD *)(v130 + 80) = v173;
                  *(_OWORD *)(v130 + 48) = v171;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  *(_OWORD *)(v130 + 200) = v219;
                  *(void *)(v130 + 216) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                }

                else
                {
                  __int128 v138 = *(v201 - 14);
                  __int128 v139 = *(v201 - 12);
                  *(_OWORD *)(v130 + 16) = *(v201 - 13);
                  *(_OWORD *)(v130 + 32) = v139;
                  *(_OWORD *)uint64_t v130 = v138;
                  __int128 v140 = *(v201 - 11);
                  __int128 v141 = *(v201 - 10);
                  __int128 v142 = *(v201 - 9);
                  *(void *)(v130 + 96) = *((void *)v201 - 16);
                  *(_OWORD *)(v130 + 64) = v141;
                  *(_OWORD *)(v130 + 80) = v142;
                  *(_OWORD *)(v130 + 48) = v140;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)((char *)v201 - 120));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)((char *)v201 - 88));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)((char *)v201 - 56));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  uint64_t v143 = (void *)v201 - 3;
                  *(_OWORD *)(v130 + 200) = *(__int128 *)((char *)v201 - 24);
                  *(void *)(v130 + 216) = *((void *)v201 - 1);
                  void *v143 = 0LL;
                  v143[1] = 0LL;
                  v143[2] = 0LL;
                  __int128 v144 = v203;
                  __int128 v145 = v205;
                  *(v201 - 13) = v204;
                  *(v201 - 12) = v145;
                  *(v201 - 14) = v144;
                  __int128 v146 = v206;
                  __int128 v147 = v207;
                  __int128 v148 = v208;
                  *((void *)v201 - 16) = v209;
                  *(v201 - 10) = v147;
                  *(v201 - 9) = v148;
                  *(v201 - 11) = v146;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v201 - 120,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 88,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 56,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v201 - 3);
                  *(__int128 *)((char *)v201 - 24) = v219;
                  *((void *)v201 - 1) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                  uint64_t v149 = v130 + 224 - a1;
                  if (v149 >= 225)
                  {
                    uint64_t v151 = a1 + 224 * v150;
                    if (*(void *)v151 < *(void *)v130)
                    {
                      __int128 v152 = *(_OWORD *)v130;
                      __int128 v153 = *(_OWORD *)(v130 + 32);
                      __int128 v223 = *(_OWORD *)(v130 + 16);
                      __int128 v224 = v153;
                      __int128 v222 = v152;
                      __int128 v154 = *(_OWORD *)(v130 + 48);
                      __int128 v155 = *(_OWORD *)(v130 + 64);
                      __int128 v156 = *(_OWORD *)(v130 + 80);
                      uint64_t v228 = *(void *)(v130 + 96);
                      __int128 v226 = v155;
                      __int128 v227 = v156;
                      __int128 v225 = v154;
                      v229.n128_u8[0] = 0;
                      char v231 = 0;
                      if (*(_BYTE *)(v130 + 128))
                      {
                        __n128 v157 = *v137;
                        uint64_t v230 = *(void *)(v130 + 120);
                        __n128 v229 = v157;
                        *(void *)(v130 + 112) = 0LL;
                        *(void *)(v130 + 120) = 0LL;
                        v137->n128_u64[0] = 0LL;
                        char v231 = 1;
                      }

                      v232.n128_u8[0] = 0;
                      char v234 = 0;
                      if (*(_BYTE *)(v130 + 160))
                      {
                        __n128 v232 = *(__n128 *)(v130 + 136);
                        uint64_t v233 = *(void *)(v130 + 152);
                        *(void *)(v130 + 136) = 0LL;
                        *(void *)(v130 + 144) = 0LL;
                        *(void *)(v130 + 152) = 0LL;
                        char v234 = 1;
                      }

                      __p.n128_u8[0] = 0;
                      char v237 = 0;
                      if (*(_BYTE *)(v130 + 192))
                      {
                        __n128 __p = *(__n128 *)(v130 + 168);
                        uint64_t v236 = *(void *)(v130 + 184);
                        *(void *)(v130 + 168) = 0LL;
                        *(void *)(v130 + 176) = 0LL;
                        *(void *)(v130 + 184) = 0LL;
                        char v237 = 1;
                      }

                      __int128 v238 = *(_OWORD *)(v130 + 200);
                      uint64_t v239 = *(void *)(v130 + 216);
                      *(void *)(v130 + 200) = 0LL;
                      *(void *)(v130 + 208) = 0LL;
                      *(void *)(v130 + 216) = 0LL;
                      do
                      {
                        uint64_t v158 = v151;
                        __int128 v159 = *(_OWORD *)v151;
                        __int128 v160 = *(_OWORD *)(v151 + 32);
                        *(_OWORD *)(v130 + 16) = *(_OWORD *)(v151 + 16);
                        *(_OWORD *)(v130 + 32) = v160;
                        *(_OWORD *)uint64_t v130 = v159;
                        __int128 v161 = *(_OWORD *)(v151 + 48);
                        __int128 v162 = *(_OWORD *)(v151 + 64);
                        __int128 v163 = *(_OWORD *)(v151 + 80);
                        *(void *)(v130 + 96) = *(void *)(v151 + 96);
                        *(_OWORD *)(v130 + 64) = v162;
                        *(_OWORD *)(v130 + 80) = v163;
                        *(_OWORD *)(v130 + 48) = v161;
                        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)(v151 + 104));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)(v158 + 136));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)(v158 + 168));
                        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                        *(_OWORD *)(v130 + 200) = *(_OWORD *)(v158 + 200);
                        *(void *)(v130 + 216) = *(void *)(v158 + 216);
                        *(void *)(v158 + 200) = 0LL;
                        *(void *)(v158 + 208) = 0LL;
                        *(void *)(v158 + 216) = 0LL;
                        if (!v150) {
                          break;
                        }
                        unint64_t v150 = (v150 - 1) >> 1;
                        uint64_t v151 = a1 + 224 * v150;
                        uint64_t v130 = v158;
                      }

                      while (*(void *)v151 < (unint64_t)v222);
                      __int128 v164 = v222;
                      __int128 v165 = v224;
                      *(_OWORD *)(v158 + 16) = v223;
                      *(_OWORD *)(v158 + 32) = v165;
                      *(_OWORD *)uint64_t v158 = v164;
                      __int128 v166 = v225;
                      __int128 v167 = v226;
                      __int128 v168 = v227;
                      *(void *)(v158 + 96) = v228;
                      *(_OWORD *)(v158 + 64) = v167;
                      *(_OWORD *)(v158 + 80) = v168;
                      *(_OWORD *)(v158 + 48) = v166;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v158 + 104,  &v229);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 136,  &v232);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 168,  &__p);
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v158 + 200));
                      *(_OWORD *)(v158 + 200) = v238;
                      *(void *)(v158 + 216) = v239;
                      __int128 v238 = 0uLL;
                      uint64_t v239 = 0LL;
                      v221 = (void **)&v238;
                      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v221);
                      if (v237 && __p.n128_u64[0])
                      {
                        __p.n128_u64[1] = __p.n128_u64[0];
                        operator delete((void *)__p.n128_u64[0]);
                      }

                      if (v234 && v232.n128_u64[0])
                      {
                        v232.n128_u64[1] = v232.n128_u64[0];
                        operator delete((void *)v232.n128_u64[0]);
                      }

                      if (v231 && SHIBYTE(v230) < 0) {
                        operator delete((void *)v229.n128_u64[0]);
                      }
                    }
                  }
                }

                *(void *)&__int128 v222 = &v219;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v222);
                if (v218 && v216.n128_u64[0])
                {
                  v216.n128_u64[1] = v216.n128_u64[0];
                  operator delete((void *)v216.n128_u64[0]);
                }

                if (v215 && v213.n128_u64[0])
                {
                  v213.n128_u64[1] = v213.n128_u64[0];
                  operator delete((void *)v213.n128_u64[0]);
                }

                if (v212 && SHIBYTE(v211) < 0) {
                  operator delete((void *)v210.n128_u64[0]);
                }
                BOOL v174 = v121-- <= 2;
                __int128 v7 = v201 - 14;
              }

              while (!v174);
            }

            return;
          }

          unint64_t v10 = v9 >> 1;
          uint64_t v11 = (__int128 *)(a1 + 224 * (v9 >> 1));
          if ((unint64_t)v8 <= 0x7000)
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224 * (v9 >> 1)),  (__int128 *)a1,  v197);
          }

          else
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224 * (v9 >> 1)),  v197);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224),  (__int128 *)(224 * v10 + a1 - 224),  v196);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 448),  (__int128 *)(a1 + 224 + 224 * v10),  v195);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(224 * v10 + a1 - 224),  v11,  (__int128 *)(a1 + 224 + 224 * v10));
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)a1, v11);
          }

          --a3;
          if ((a4 & 1) == 0 && *(void *)(a1 - 224) >= *(void *)a1)
          {
            __int128 v40 = *(_OWORD *)a1;
            __int128 v41 = *(_OWORD *)(a1 + 32);
            __int128 v223 = *(_OWORD *)(a1 + 16);
            __int128 v224 = v41;
            __int128 v222 = v40;
            __int128 v42 = *(_OWORD *)(a1 + 48);
            __int128 v43 = *(_OWORD *)(a1 + 64);
            __int128 v44 = *(_OWORD *)(a1 + 80);
            uint64_t v228 = *(void *)(a1 + 96);
            __int128 v226 = v43;
            __int128 v227 = v44;
            __int128 v225 = v42;
            v229.n128_u8[0] = 0;
            char v231 = 0;
            if (*(_BYTE *)(a1 + 128))
            {
              __n128 v45 = *(__n128 *)(a1 + 104);
              uint64_t v230 = *(void *)(a1 + 120);
              __n128 v229 = v45;
              *(void *)(a1 + 112) = 0LL;
              *(void *)(a1 + 120) = 0LL;
              *(void *)(a1 + 104) = 0LL;
              char v231 = 1;
            }

            v232.n128_u8[0] = 0;
            char v234 = 0;
            if (*(_BYTE *)(a1 + 160))
            {
              __n128 v232 = *(__n128 *)(a1 + 136);
              uint64_t v233 = *(void *)(a1 + 152);
              *(void *)(a1 + 136) = 0LL;
              *(void *)(a1 + 144) = 0LL;
              *(void *)(a1 + 152) = 0LL;
              char v234 = 1;
            }

            __p.n128_u8[0] = 0;
            char v237 = 0;
            if (*(_BYTE *)(a1 + 192))
            {
              __n128 __p = *(__n128 *)(a1 + 168);
              uint64_t v236 = *(void *)(a1 + 184);
              *(void *)(a1 + 168) = 0LL;
              *(void *)(a1 + 176) = 0LL;
              *(void *)(a1 + 184) = 0LL;
              char v237 = 1;
            }

            __int128 v238 = *(_OWORD *)(a1 + 200);
            uint64_t v239 = *(void *)(a1 + 216);
            *(void *)(a1 + 200) = 0LL;
            *(void *)(a1 + 208) = 0LL;
            *(void *)(a1 + 216) = 0LL;
            unint64_t v46 = v222;
            if ((unint64_t)v222 >= *(void *)v197)
            {
              unint64_t v48 = a1 + 224;
              do
              {
                unint64_t v6 = v48;
                v48 += 224LL;
              }

              while ((unint64_t)v222 >= *(void *)v6);
            }

            else
            {
              unint64_t v6 = a1;
              do
              {
                unint64_t v47 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while ((unint64_t)v222 >= v47);
            }

            __int128 v49 = v202;
            if (v6 < (unint64_t)v202)
            {
              __int128 v49 = v202;
              do
              {
                unint64_t v50 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while ((unint64_t)v222 < v50);
            }

            while (v6 < (unint64_t)v49)
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v49);
              do
              {
                unint64_t v51 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v46 >= v51);
              do
              {
                unint64_t v52 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while (v46 < v52);
            }

            uint64_t v53 = (__int128 *)(v6 - 224);
            if (v6 - 224 != a1)
            {
              __int128 v54 = *v53;
              __int128 v55 = *(_OWORD *)(v6 - 192);
              *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
              *(_OWORD *)(a1 + 32) = v55;
              *(_OWORD *)a1 = v54;
              __int128 v56 = *(_OWORD *)(v6 - 176);
              __int128 v57 = *(_OWORD *)(v6 - 160);
              __int128 v58 = *(_OWORD *)(v6 - 144);
              *(void *)(a1 + 96) = *(void *)(v6 - 128);
              *(_OWORD *)(a1 + 64) = v57;
              *(_OWORD *)(a1 + 80) = v58;
              *(_OWORD *)(a1 + 48) = v56;
              std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
              std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
              *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
              *(void *)(a1 + 216) = *(void *)(v6 - 8);
              *(void *)(v6 - 24) = 0LL;
              *(void *)(v6 - 16) = 0LL;
              *(void *)(v6 - 8) = 0LL;
            }

            __int128 v59 = v222;
            __int128 v60 = v224;
            *(_OWORD *)(v6 - 208) = v223;
            *(_OWORD *)(v6 - 192) = v60;
            __int128 *v53 = v59;
            __int128 v61 = v225;
            __int128 v62 = v226;
            __int128 v63 = v227;
            *(void *)(v6 - 128) = v228;
            *(_OWORD *)(v6 - 160) = v62;
            *(_OWORD *)(v6 - 144) = v63;
            *(_OWORD *)(v6 - 176) = v61;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
            *(_OWORD *)(v6 - 24) = v238;
            *(void *)(v6 - 8) = v239;
            __int128 v238 = 0uLL;
            uint64_t v239 = 0LL;
            *(void *)&__int128 v203 = &v238;
            std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
            if (v237 && __p.n128_u64[0])
            {
              __p.n128_u64[1] = __p.n128_u64[0];
              operator delete((void *)__p.n128_u64[0]);
            }

            if (v234 && v232.n128_u64[0])
            {
              v232.n128_u64[1] = v232.n128_u64[0];
              operator delete((void *)v232.n128_u64[0]);
            }

            if (v231 && SHIBYTE(v230) < 0) {
              operator delete((void *)v229.n128_u64[0]);
            }
            goto LABEL_45;
          }

          __int128 v12 = *(_OWORD *)a1;
          __int128 v13 = *(_OWORD *)(a1 + 32);
          __int128 v223 = *(_OWORD *)(a1 + 16);
          __int128 v224 = v13;
          __int128 v222 = v12;
          __int128 v14 = *(_OWORD *)(a1 + 48);
          __int128 v15 = *(_OWORD *)(a1 + 64);
          __int128 v16 = *(_OWORD *)(a1 + 80);
          uint64_t v228 = *(void *)(a1 + 96);
          __int128 v226 = v15;
          __int128 v227 = v16;
          __int128 v225 = v14;
          v229.n128_u8[0] = 0;
          char v231 = 0;
          if (*(_BYTE *)(a1 + 128))
          {
            __n128 v17 = *(__n128 *)(a1 + 104);
            uint64_t v230 = *(void *)(a1 + 120);
            __n128 v229 = v17;
            *(void *)(a1 + 112) = 0LL;
            *(void *)(a1 + 120) = 0LL;
            *(void *)(a1 + 104) = 0LL;
            char v231 = 1;
          }

          v232.n128_u8[0] = 0;
          char v234 = 0;
          if (*(_BYTE *)(a1 + 160))
          {
            __n128 v232 = *(__n128 *)(a1 + 136);
            uint64_t v233 = *(void *)(a1 + 152);
            *(void *)(a1 + 136) = 0LL;
            *(void *)(a1 + 144) = 0LL;
            *(void *)(a1 + 152) = 0LL;
            char v234 = 1;
          }

          __p.n128_u8[0] = 0;
          char v237 = 0;
          if (*(_BYTE *)(a1 + 192))
          {
            __n128 __p = *(__n128 *)(a1 + 168);
            uint64_t v236 = *(void *)(a1 + 184);
            *(void *)(a1 + 168) = 0LL;
            *(void *)(a1 + 176) = 0LL;
            *(void *)(a1 + 184) = 0LL;
            char v237 = 1;
          }

          uint64_t v18 = 0LL;
          __int128 v238 = *(_OWORD *)(a1 + 200);
          uint64_t v239 = *(void *)(a1 + 216);
          *(void *)(a1 + 200) = 0LL;
          *(void *)(a1 + 208) = 0LL;
          *(void *)(a1 + 216) = 0LL;
          unint64_t v19 = v222;
          do
          {
            unint64_t v20 = *(void *)(a1 + v18 + 224);
            v18 += 224LL;
          }

          while (v20 < (unint64_t)v222);
          unint64_t v21 = a1 + v18;
          __int128 v22 = v202;
          if (v18 == 224)
          {
            __int128 v22 = v202;
            do
            {
              unint64_t v24 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v24 >= (unint64_t)v222);
          }

          else
          {
            do
            {
              unint64_t v23 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v23 >= (unint64_t)v222);
          }

          unint64_t v6 = a1 + v18;
          if (v21 < (unint64_t)v22)
          {
            __int128 v25 = v22;
            do
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v25);
              do
              {
                unint64_t v26 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v26 < v19);
              do
              {
                unint64_t v27 = *((void *)v25 - 28);
                v25 -= 14;
              }

              while (v27 >= v19);
            }

            while (v6 < (unint64_t)v25);
          }

          __int128 v28 = (__int128 *)(v6 - 224);
          if (v6 - 224 != a1)
          {
            __int128 v29 = *v28;
            __int128 v30 = *(_OWORD *)(v6 - 192);
            *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
            *(_OWORD *)(a1 + 32) = v30;
            *(_OWORD *)a1 = v29;
            __int128 v31 = *(_OWORD *)(v6 - 176);
            __int128 v32 = *(_OWORD *)(v6 - 160);
            __int128 v33 = *(_OWORD *)(v6 - 144);
            *(void *)(a1 + 96) = *(void *)(v6 - 128);
            *(_OWORD *)(a1 + 64) = v32;
            *(_OWORD *)(a1 + 80) = v33;
            *(_OWORD *)(a1 + 48) = v31;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
            *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
            *(void *)(a1 + 216) = *(void *)(v6 - 8);
            *(void *)(v6 - 24) = 0LL;
            *(void *)(v6 - 16) = 0LL;
            *(void *)(v6 - 8) = 0LL;
          }

          __int128 v34 = v222;
          __int128 v35 = v224;
          *(_OWORD *)(v6 - 208) = v223;
          *(_OWORD *)(v6 - 192) = v35;
          *__int128 v28 = v34;
          __int128 v36 = v225;
          __int128 v37 = v226;
          __int128 v38 = v227;
          *(void *)(v6 - 128) = v228;
          *(_OWORD *)(v6 - 160) = v37;
          *(_OWORD *)(v6 - 144) = v38;
          *(_OWORD *)(v6 - 176) = v36;
          std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
          std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
          *(_OWORD *)(v6 - 24) = v238;
          *(void *)(v6 - 8) = v239;
          __int128 v238 = 0uLL;
          uint64_t v239 = 0LL;
          *(void *)&__int128 v203 = &v238;
          std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
          if (v237 && __p.n128_u64[0])
          {
            __p.n128_u64[1] = __p.n128_u64[0];
            operator delete((void *)__p.n128_u64[0]);
          }

          if (v234 && v232.n128_u64[0])
          {
            v232.n128_u64[1] = v232.n128_u64[0];
            operator delete((void *)v232.n128_u64[0]);
          }

          if (v231 && SHIBYTE(v230) < 0) {
            operator delete((void *)v229.n128_u64[0]);
          }
          BOOL v39 = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)a1,  (__int128 *)(v6 - 224));
          if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)v6,  v202))
          {
            if (v39) {
              continue;
            }
LABEL_44:
            _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( a1,  v6 - 224,  a3,  a4 & 1);
LABEL_45:
            a4 = 0;
            continue;
          }

          a2 = (__int128 *)(v6 - 224);
          if (v39) {
            return;
          }
          goto LABEL_1;
        }

        if ((a4 & 1) != 0)
        {
          if ((__int128 *)a1 != v202)
          {
            unint64_t v67 = a1 + 224;
            if ((__int128 *)(a1 + 224) != v202)
            {
              uint64_t v68 = 0LL;
              unint64_t v69 = a1;
              do
              {
                unint64_t v70 = v67;
                if (*(void *)(v69 + 224) < *(void *)v69)
                {
                  __int128 v71 = *(_OWORD *)v67;
                  __int128 v72 = *(_OWORD *)(v67 + 32);
                  __int128 v223 = *(_OWORD *)(v67 + 16);
                  __int128 v224 = v72;
                  __int128 v222 = v71;
                  __int128 v73 = *(_OWORD *)(v67 + 48);
                  __int128 v74 = *(_OWORD *)(v67 + 64);
                  __int128 v75 = *(_OWORD *)(v67 + 80);
                  uint64_t v228 = *(void *)(v67 + 96);
                  __int128 v226 = v74;
                  __int128 v227 = v75;
                  __int128 v225 = v73;
                  v229.n128_u8[0] = 0;
                  char v231 = 0;
                  if (*(_BYTE *)(v69 + 352))
                  {
                    uint64_t v230 = *(void *)(v69 + 344);
                    __n128 v229 = *(__n128 *)(v69 + 328);
                    *(void *)(v69 + 336) = 0LL;
                    *(void *)(v69 + 344) = 0LL;
                    *(void *)(v69 + 328) = 0LL;
                    char v231 = 1;
                  }

                  unint64_t v76 = (__n128 *)(v69 + 360);
                  v232.n128_u8[0] = 0;
                  char v234 = 0;
                  if (*(_BYTE *)(v69 + 384))
                  {
                    __n128 v232 = *v76;
                    uint64_t v233 = *(void *)(v69 + 376);
                    v76->n128_u64[0] = 0LL;
                    *(void *)(v69 + 368) = 0LL;
                    *(void *)(v69 + 376) = 0LL;
                    char v234 = 1;
                  }

                  __p.n128_u8[0] = 0;
                  char v237 = 0;
                  if (*(_BYTE *)(v69 + 416))
                  {
                    __n128 __p = *(__n128 *)(v69 + 392);
                    uint64_t v236 = *(void *)(v69 + 408);
                    *(void *)(v69 + 392) = 0LL;
                    *(void *)(v69 + 400) = 0LL;
                    *(void *)(v69 + 408) = 0LL;
                    char v237 = 1;
                  }

                  __int128 v238 = *(_OWORD *)(v69 + 424);
                  uint64_t v239 = *(void *)(v69 + 440);
                  *(void *)(v69 + 424) = 0LL;
                  *(void *)(v69 + 432) = 0LL;
                  *(void *)(v69 + 440) = 0LL;
                  uint64_t v77 = v68;
                  while (1)
                  {
                    uint64_t v78 = v77;
                    uint64_t v79 = a1 + v77;
                    __int128 v80 = *(_OWORD *)(a1 + v77 + 80);
                    *(_OWORD *)(v79 + 288) = *(_OWORD *)(a1 + v77 + 64);
                    *(_OWORD *)(v79 + 304) = v80;
                    *(void *)(v79 + 320) = *(void *)(a1 + v77 + 96);
                    __int128 v81 = *(_OWORD *)(a1 + v77 + 16);
                    *(_OWORD *)(v79 + 224) = *(_OWORD *)v79;
                    *(_OWORD *)(v79 + 240) = v81;
                    __int128 v82 = *(_OWORD *)(a1 + v77 + 48);
                    *(_OWORD *)(v79 + 256) = *(_OWORD *)(a1 + v77 + 32);
                    *(_OWORD *)(v79 + 272) = v82;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v77 + 328,  (__n128 *)(a1 + v77 + 104));
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v79 + 360,  (__n128 *)(v79 + 136));
                    uint64_t v83 = a1 + v78;
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 392,  (__n128 *)(a1 + v78 + 168));
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + v78 + 424));
                    *(_OWORD *)(v83 + 424) = *(_OWORD *)(v83 + 200);
                    *(void *)(v83 + 440) = *(void *)(v83 + 216);
                    *(void *)(v83 + 208) = 0LL;
                    *(void *)(v83 + 216) = 0LL;
                    *(void *)(v83 + 200) = 0LL;
                    if (!v78) {
                      break;
                    }
                    uint64_t v77 = v78 - 224;
                    if ((unint64_t)v222 >= *(void *)(a1 + v78 - 224))
                    {
                      unint64_t v84 = a1 + v78;
                      goto LABEL_107;
                    }
                  }

                  unint64_t v84 = a1;
LABEL_107:
                  __int128 v85 = v222;
                  __int128 v86 = v224;
                  *(_OWORD *)(v84 + 16) = v223;
                  *(_OWORD *)(v84 + 32) = v86;
                  *(_OWORD *)unint64_t v84 = v85;
                  __int128 v87 = v225;
                  __int128 v88 = v226;
                  __int128 v89 = v227;
                  *(void *)(v84 + 96) = v228;
                  *(_OWORD *)(v84 + 64) = v88;
                  *(_OWORD *)(v84 + 80) = v89;
                  *(_OWORD *)(v84 + 48) = v87;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v78 + 104,  &v229);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 136,  &v232);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 168,  &__p);
                  __int128 v90 = (uint64_t *)(a1 + v78 + 200);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v90);
                  *__int128 v90 = v238;
                  *(void *)(v84 + 208) = *((void *)&v238 + 1);
                  *(void *)(v84 + 216) = v239;
                  __int128 v238 = 0uLL;
                  uint64_t v239 = 0LL;
                  *(void *)&__int128 v203 = &v238;
                  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                  if (v237 && __p.n128_u64[0])
                  {
                    __p.n128_u64[1] = __p.n128_u64[0];
                    operator delete((void *)__p.n128_u64[0]);
                  }

                  if (v234 && v232.n128_u64[0])
                  {
                    v232.n128_u64[1] = v232.n128_u64[0];
                    operator delete((void *)v232.n128_u64[0]);
                  }

                  if (v231 && SHIBYTE(v230) < 0) {
                    operator delete((void *)v229.n128_u64[0]);
                  }
                  __int128 v7 = v202;
                }

                unint64_t v67 = v70 + 224;
                v68 += 224LL;
                unint64_t v69 = v70;
              }

              while ((__int128 *)(v70 + 224) != v7);
            }
          }
        }

        else if ((__int128 *)a1 != v202)
        {
          unint64_t v175 = a1 + 224;
          if ((__int128 *)(a1 + 224) != v202)
          {
            unint64_t v176 = a1 - 224;
            do
            {
              unint64_t v177 = v175;
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                __int128 v178 = *(_OWORD *)v175;
                __int128 v179 = *(_OWORD *)(v175 + 32);
                __int128 v223 = *(_OWORD *)(v175 + 16);
                __int128 v224 = v179;
                __int128 v222 = v178;
                __int128 v180 = *(_OWORD *)(v175 + 48);
                __int128 v181 = *(_OWORD *)(v175 + 64);
                __int128 v182 = *(_OWORD *)(v175 + 80);
                uint64_t v228 = *(void *)(v175 + 96);
                __int128 v226 = v181;
                __int128 v227 = v182;
                __int128 v225 = v180;
                v229.n128_u8[0] = 0;
                char v231 = 0;
                if (*(_BYTE *)(a1 + 352))
                {
                  uint64_t v230 = *(void *)(a1 + 344);
                  __n128 v229 = *(__n128 *)(a1 + 328);
                  *(void *)(a1 + 336) = 0LL;
                  *(void *)(a1 + 344) = 0LL;
                  *(void *)(a1 + 328) = 0LL;
                  char v231 = 1;
                }

                v183 = (__n128 *)(a1 + 360);
                v232.n128_u8[0] = 0;
                char v234 = 0;
                if (*(_BYTE *)(a1 + 384))
                {
                  __n128 v232 = *v183;
                  uint64_t v233 = *(void *)(a1 + 376);
                  v183->n128_u64[0] = 0LL;
                  *(void *)(a1 + 368) = 0LL;
                  *(void *)(a1 + 376) = 0LL;
                  char v234 = 1;
                }

                __p.n128_u8[0] = 0;
                char v237 = 0;
                if (*(_BYTE *)(a1 + 416))
                {
                  __n128 __p = *(__n128 *)(a1 + 392);
                  uint64_t v236 = *(void *)(a1 + 408);
                  *(void *)(a1 + 392) = 0LL;
                  *(void *)(a1 + 400) = 0LL;
                  *(void *)(a1 + 408) = 0LL;
                  char v237 = 1;
                }

                __int128 v238 = *(_OWORD *)(a1 + 424);
                uint64_t v239 = *(void *)(a1 + 440);
                *(void *)(a1 + 424) = 0LL;
                *(void *)(a1 + 432) = 0LL;
                *(void *)(a1 + 440) = 0LL;
                unint64_t v184 = v176;
                do
                {
                  __int128 v185 = *(_OWORD *)(v184 + 304);
                  *(_OWORD *)(v184 + 512) = *(_OWORD *)(v184 + 288);
                  *(_OWORD *)(v184 + 528) = v185;
                  *(void *)(v184 + 544) = *(void *)(v184 + 320);
                  __int128 v186 = *(_OWORD *)(v184 + 240);
                  *(_OWORD *)(v184 + 448) = *(_OWORD *)(v184 + 224);
                  *(_OWORD *)(v184 + 464) = v186;
                  __int128 v187 = *(_OWORD *)(v184 + 272);
                  *(_OWORD *)(v184 + 480) = *(_OWORD *)(v184 + 256);
                  *(_OWORD *)(v184 + 496) = v187;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  (__n128 *)(v184 + 328));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  (__n128 *)(v184 + 360));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  (__n128 *)(v184 + 392));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                  *(_OWORD *)(v184 + 648) = *(_OWORD *)(v184 + 424);
                  *(void *)(v184 + 664) = *(void *)(v184 + 440);
                  *(void *)(v184 + 424) = 0LL;
                  *(void *)(v184 + 432) = 0LL;
                  *(void *)(v184 + 440) = 0LL;
                  unint64_t v188 = *(void *)v184;
                  v184 -= 224LL;
                }

                while ((unint64_t)v222 < v188);
                __int128 v189 = v222;
                __int128 v190 = v224;
                *(_OWORD *)(v184 + 464) = v223;
                *(_OWORD *)(v184 + 480) = v190;
                *(_OWORD *)(v184 + 448) = v189;
                __int128 v191 = v225;
                __int128 v192 = v226;
                __int128 v193 = v227;
                *(void *)(v184 + 544) = v228;
                *(_OWORD *)(v184 + 512) = v192;
                *(_OWORD *)(v184 + 528) = v193;
                *(_OWORD *)(v184 + 496) = v191;
                std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  &v229);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  &v232);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  &__p);
                std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                *(_OWORD *)(v184 + 648) = v238;
                *(void *)(v184 + 664) = v239;
                __int128 v238 = 0uLL;
                uint64_t v239 = 0LL;
                *(void *)&__int128 v203 = &v238;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                if (v237 && __p.n128_u64[0])
                {
                  __p.n128_u64[1] = __p.n128_u64[0];
                  operator delete((void *)__p.n128_u64[0]);
                }

                if (v234 && v232.n128_u64[0])
                {
                  v232.n128_u64[1] = v232.n128_u64[0];
                  operator delete((void *)v232.n128_u64[0]);
                }

                if (v231 && SHIBYTE(v230) < 0) {
                  operator delete((void *)v229.n128_u64[0]);
                }
                __int128 v7 = v202;
              }

              unint64_t v175 = v177 + 224;
              v176 += 224LL;
              a1 = v177;
            }

            while ((__int128 *)(v177 + 224) != v7);
          }
        }

        return;
    }
  }

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( __int128 *a1, __int128 *a2)
{
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a2 - (char *)a1) >> 5);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      if (*((void *)a2 - 28) < *(void *)a1)
      {
        unint64_t v6 = a1;
        __int128 v7 = a2 - 14;
        goto LABEL_4;
      }

      return result;
    case 3LL:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a2 - 14);
      return 1LL;
    case 4LL:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a2 - 14);
      return 1LL;
    case 5LL:
      unint64_t v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a1 + 42);
      unint64_t v26 = *((void *)a2 - 28);
      __int128 v25 = a2 - 14;
      if (v26 < *((void *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((void *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((void *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((void *)a1 + 28) < *(void *)a1)
            {
              unint64_t v6 = a1;
              __int128 v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a1 + 28);
      unint64_t v9 = a1 + 42;
      BOOL result = 1LL;
      if (a1 + 42 == a2) {
        return result;
      }
      uint64_t v10 = 0LL;
      int v11 = 0;
      break;
  }

  while (1)
  {
    if (*(void *)v9 < *(void *)v8)
    {
      __int128 v31 = v9[4];
      __int128 v32 = v9[5];
      uint64_t v33 = *((void *)v9 + 12);
      __int128 v27 = *v9;
      __int128 v28 = v9[1];
      __int128 v29 = v9[2];
      __int128 v30 = v9[3];
      v34.n128_u8[0] = 0;
      char v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        __n128 v34 = *(__n128 *)((char *)v9 + 104);
        uint64_t v35 = *((void *)v9 + 15);
        *((void *)v9 + 14) = 0LL;
        *((void *)v9 + 15) = 0LL;
        *((void *)v9 + 13) = 0LL;
        char v36 = 1;
      }

      v37.n128_u8[0] = 0;
      char v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        __n128 v37 = *(__n128 *)((char *)v9 + 136);
        uint64_t v38 = *((void *)v9 + 19);
        *((void *)v9 + 18) = 0LL;
        *((void *)v9 + 19) = 0LL;
        *((void *)v9 + 17) = 0LL;
        char v39 = 1;
      }

      __p.n128_u8[0] = 0;
      char v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __n128 __p = *(__n128 *)((char *)v9 + 168);
        uint64_t v41 = *((void *)v9 + 23);
        *((void *)v9 + 22) = 0LL;
        *((void *)v9 + 23) = 0LL;
        *((void *)v9 + 21) = 0LL;
        char v42 = 1;
      }

      __int128 v43 = *(__int128 *)((char *)v9 + 200);
      uint64_t v44 = *((void *)v9 + 27);
      *((void *)v9 + 26) = 0LL;
      *((void *)v9 + 27) = 0LL;
      *((void *)v9 + 25) = 0LL;
      uint64_t v12 = v10;
      while (1)
      {
        uint64_t v13 = v12;
        __int128 v14 = (char *)a1 + v12;
        __int128 v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((void *)v14 + 96) = *(void *)((char *)a1 + v12 + 544);
        __int128 v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        __int128 v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)a1 + v12 + 776,  (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v14 + 808),  (__n128 *)(v14 + 584));
        uint64_t v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a1 + v13 + 840,  (__n128 *)((char *)a1 + v13 + 616));
        unint64_t v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((void *)v18 + 111) = *((void *)v18 + 83);
        *((void *)v18 + 83) = 0LL;
        *unint64_t v19 = 0u;
        if (v13 == -448) {
          break;
        }
        uint64_t v12 = v13 - 224;
        if ((unint64_t)v27 >= *(void *)((char *)a1 + v13 + 224))
        {
          uint64_t v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }

      uint64_t v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(void *)(v20 + 96) = v33;
      *(_OWORD *)uint64_t v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      unint64_t v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)(v21 + 69),  &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 73),  &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 77),  &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      uint64_t v22 = *((void *)&v43 + 1);
      v21[81] = v43;
      uint64_t v23 = v44;
      *(void *)(v20 + 208) = v22;
      *(void *)(v20 + 216) = v23;
      uint64_t v44 = 0LL;
      __int128 v43 = 0uLL;
      __n128 v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }

      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }

      if (v36 && SHIBYTE(v35) < 0) {
        operator delete((void *)v34.n128_u64[0]);
      }
      if (++v11 == 8) {
        return v9 + 14 == a2;
      }
    }

    uint64_t v8 = v9;
    v10 += 224LL;
    v9 += 14;
    if (v9 == a2) {
      return 1LL;
    }
  }

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( unint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  v197 = a2 - 14;
  v202 = a2;
  v195 = a2 - 42;
  v196 = a2 - 28;
  unint64_t v6 = a1;
  while (2)
  {
    a1 = v6;
    __int128 v7 = v202;
    uint64_t v8 = (uint64_t)v202 - v6;
    unint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)((uint64_t)v202 - v6) >> 5);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        int64_t v64 = v202 - 14;
        if (*((void *)v202 - 28) < *(void *)a1)
        {
          int64_t v65 = (__int128 *)a1;
          goto LABEL_83;
        }

        return;
      case 3uLL:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  v197);
        return;
      case 4uLL:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  v197);
        return;
      case 5uLL:
        uint64_t v66 = (void *)(a1 + 448);
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224),  (__int128 *)(a1 + 448),  (__int128 *)(a1 + 672));
        if (*((void *)v202 - 28) < *(void *)(a1 + 672))
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 672), v202 - 14);
          if (*(void *)(a1 + 672) < *v66)
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 448), (__int128 *)(a1 + 672));
            if (*v66 < *(void *)(a1 + 224))
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)(a1 + 224), (__int128 *)(a1 + 448));
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                int64_t v65 = (__int128 *)a1;
                int64_t v64 = (__int128 *)(a1 + 224);
LABEL_83:
                std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v65, v64);
              }
            }
          }
        }

        return;
      default:
        if (v8 > 5375)
        {
          if (!a3)
          {
            if ((__int128 *)a1 != v202)
            {
              int64_t v200 = (v9 - 2) >> 1;
              int64_t v91 = v200;
              do
              {
                int64_t v92 = v91;
                if (v200 >= v91)
                {
                  uint64_t v93 = (2 * v91) | 1;
                  __n128 v94 = (__int128 *)(a1 + 224 * v93);
                  if (2 * v92 + 2 >= (uint64_t)v9)
                  {
                    unint64_t v95 = *(void *)v94;
                  }

                  else
                  {
                    unint64_t v95 = *(void *)v94;
                    unint64_t v96 = *((void *)v94 + 28);
                    if (*(void *)v94 <= v96) {
                      unint64_t v95 = *((void *)v94 + 28);
                    }
                    if (*(void *)v94 < v96)
                    {
                      v94 += 14;
                      uint64_t v93 = 2 * v92 + 2;
                    }
                  }

                  unint64_t v97 = a1 + 224 * v92;
                  if (v95 >= *(void *)v97)
                  {
                    __int128 v98 = *(_OWORD *)v97;
                    __int128 v99 = *(_OWORD *)(v97 + 32);
                    __int128 v223 = *(_OWORD *)(v97 + 16);
                    __int128 v224 = v99;
                    __int128 v222 = v98;
                    __int128 v100 = *(_OWORD *)(v97 + 48);
                    __int128 v101 = *(_OWORD *)(v97 + 64);
                    __int128 v102 = *(_OWORD *)(v97 + 80);
                    uint64_t v228 = *(void *)(v97 + 96);
                    __int128 v226 = v101;
                    __int128 v227 = v102;
                    __int128 v225 = v100;
                    v229.n128_u8[0] = 0;
                    char v231 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 128))
                    {
                      unint64_t v103 = a1 + 224 * v92;
                      __n128 v104 = *(__n128 *)(v103 + 104);
                      uint64_t v230 = *(void *)(v103 + 120);
                      __n128 v229 = v104;
                      *(void *)(v103 + 112) = 0LL;
                      *(void *)(v103 + 120) = 0LL;
                      *(void *)(v103 + 104) = 0LL;
                      char v231 = 1;
                    }

                    v232.n128_u8[0] = 0;
                    char v234 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 160))
                    {
                      unint64_t v105 = a1 + 224 * v92;
                      __n128 v232 = *(__n128 *)(v105 + 136);
                      uint64_t v233 = *(void *)(v105 + 152);
                      *(void *)(v105 + 136) = 0LL;
                      *(void *)(v105 + 144) = 0LL;
                      *(void *)(v105 + 152) = 0LL;
                      char v234 = 1;
                    }

                    __p.n128_u8[0] = 0;
                    char v237 = 0;
                    if (*(_BYTE *)(a1 + 224 * v92 + 192))
                    {
                      unint64_t v106 = a1 + 224 * v92;
                      __n128 __p = *(__n128 *)(v106 + 168);
                      uint64_t v236 = *(void *)(v106 + 184);
                      *(void *)(v106 + 168) = 0LL;
                      *(void *)(v106 + 176) = 0LL;
                      *(void *)(v106 + 184) = 0LL;
                      char v237 = 1;
                    }

                    int64_t v198 = v92;
                    unint64_t v107 = a1 + 224 * v92;
                    __int128 v238 = *(_OWORD *)(v107 + 200);
                    uint64_t v239 = *(void *)(v107 + 216);
                    *(void *)(v107 + 200) = 0LL;
                    *(void *)(v107 + 208) = 0LL;
                    *(void *)(v107 + 216) = 0LL;
                    do
                    {
                      __int128 v108 = v94;
                      __int128 v109 = *v94;
                      __int128 v110 = v94[2];
                      *(_OWORD *)(v97 + 16) = v94[1];
                      *(_OWORD *)(v97 + 32) = v110;
                      *(_OWORD *)unint64_t v97 = v109;
                      __int128 v111 = v94[3];
                      __int128 v112 = v94[4];
                      __int128 v113 = v94[5];
                      *(void *)(v97 + 96) = *((void *)v94 + 12);
                      *(_OWORD *)(v97 + 64) = v112;
                      *(_OWORD *)(v97 + 80) = v113;
                      *(_OWORD *)(v97 + 48) = v111;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v97 + 104,  (__n128 *)((char *)v94 + 104));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 136,  (__n128 *)((char *)v108 + 136));
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v97 + 168,  (__n128 *)((char *)v108 + 168));
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v97 + 200));
                      *(_OWORD *)(v97 + 200) = *(__int128 *)((char *)v108 + 200);
                      *(void *)(v97 + 216) = *((void *)v108 + 27);
                      *((void *)v108 + 25) = 0LL;
                      *((void *)v108 + 26) = 0LL;
                      *((void *)v108 + 27) = 0LL;
                      if (v200 < v93) {
                        break;
                      }
                      __n128 v94 = (__int128 *)(a1 + 224 * ((2 * v93) | 1));
                      if (2 * v93 + 2 >= (uint64_t)v9)
                      {
                        unint64_t v114 = *(void *)v94;
                        uint64_t v93 = (2 * v93) | 1;
                      }

                      else
                      {
                        unint64_t v114 = *(void *)v94;
                        unint64_t v115 = *((void *)v94 + 28);
                        if (*(void *)v94 <= v115) {
                          unint64_t v114 = *((void *)v94 + 28);
                        }
                        if (*(void *)v94 >= v115)
                        {
                          uint64_t v93 = (2 * v93) | 1;
                        }

                        else
                        {
                          v94 += 14;
                          uint64_t v93 = 2 * v93 + 2;
                        }
                      }

                      unint64_t v97 = (unint64_t)v108;
                    }

                    while (v114 >= (unint64_t)v222);
                    __int128 v116 = v222;
                    __int128 v117 = v224;
                    v108[1] = v223;
                    v108[2] = v117;
                    *__int128 v108 = v116;
                    __int128 v118 = v225;
                    __int128 v119 = v226;
                    __int128 v120 = v227;
                    *((void *)v108 + 12) = v228;
                    v108[4] = v119;
                    v108[5] = v120;
                    v108[3] = v118;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v108 + 104,  &v229);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 136,  &v232);
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v108 + 168,  &__p);
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v108 + 25);
                    *(__int128 *)((char *)v108 + 200) = v238;
                    *((void *)v108 + 27) = v239;
                    __int128 v238 = 0uLL;
                    uint64_t v239 = 0LL;
                    *(void *)&__int128 v203 = &v238;
                    std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                    if (v237 && __p.n128_u64[0])
                    {
                      __p.n128_u64[1] = __p.n128_u64[0];
                      operator delete((void *)__p.n128_u64[0]);
                    }

                    if (v234 && v232.n128_u64[0])
                    {
                      v232.n128_u64[1] = v232.n128_u64[0];
                      operator delete((void *)v232.n128_u64[0]);
                    }

                    if (v231 && SHIBYTE(v230) < 0) {
                      operator delete((void *)v229.n128_u64[0]);
                    }
                    __int128 v7 = v202;
                    int64_t v92 = v198;
                  }
                }

                int64_t v91 = v92 - 1;
              }

              while (v92);
              uint64_t v121 = (((unint64_t)v8 >> 5) * (unsigned __int128)0x2492492492492493uLL) >> 64;
              v194 = (__n128 *)(a1 + 104);
              do
              {
                __int128 v122 = *(_OWORD *)a1;
                __int128 v123 = *(_OWORD *)(a1 + 32);
                __int128 v204 = *(_OWORD *)(a1 + 16);
                __int128 v205 = v123;
                __int128 v203 = v122;
                __int128 v124 = *(_OWORD *)(a1 + 48);
                __int128 v125 = *(_OWORD *)(a1 + 64);
                __int128 v126 = *(_OWORD *)(a1 + 80);
                uint64_t v209 = *(void *)(a1 + 96);
                __int128 v207 = v125;
                __int128 v208 = v126;
                __int128 v206 = v124;
                v210.n128_u8[0] = 0;
                char v212 = 0;
                if (*(_BYTE *)(a1 + 128))
                {
                  __n128 v127 = *v194;
                  uint64_t v211 = *(void *)(a1 + 120);
                  __n128 v210 = v127;
                  *(void *)(a1 + 112) = 0LL;
                  *(void *)(a1 + 120) = 0LL;
                  v194->n128_u64[0] = 0LL;
                  char v212 = 1;
                }

                v213.n128_u8[0] = 0;
                char v215 = 0;
                if (*(_BYTE *)(a1 + 160))
                {
                  __n128 v213 = *(__n128 *)(a1 + 136);
                  uint64_t v214 = *(void *)(a1 + 152);
                  *(void *)(a1 + 136) = 0LL;
                  *(void *)(a1 + 144) = 0LL;
                  *(void *)(a1 + 152) = 0LL;
                  char v215 = 1;
                }

                v201 = v7;
                v216.n128_u8[0] = 0;
                char v218 = 0;
                if (*(_BYTE *)(a1 + 192))
                {
                  __n128 v216 = *(__n128 *)(a1 + 168);
                  uint64_t v217 = *(void *)(a1 + 184);
                  *(void *)(a1 + 168) = 0LL;
                  *(void *)(a1 + 176) = 0LL;
                  *(void *)(a1 + 184) = 0LL;
                  char v218 = 1;
                }

                uint64_t v128 = 0LL;
                __int128 v219 = *(_OWORD *)(a1 + 200);
                uint64_t v220 = *(void *)(a1 + 216);
                *(void *)(a1 + 200) = 0LL;
                *(void *)(a1 + 208) = 0LL;
                *(void *)(a1 + 216) = 0LL;
                uint64_t v129 = a1;
                do
                {
                  uint64_t v130 = v129 + 224 * v128 + 224;
                  uint64_t v131 = 2 * v128;
                  uint64_t v128 = (2 * v128) | 1;
                  if (v131 + 2 < v121 && *(void *)v130 < *(void *)(v130 + 224))
                  {
                    v130 += 224LL;
                    uint64_t v128 = v131 + 2;
                  }

                  __int128 v132 = *(_OWORD *)v130;
                  __int128 v133 = *(_OWORD *)(v130 + 32);
                  *(_OWORD *)(v129 + 16) = *(_OWORD *)(v130 + 16);
                  *(_OWORD *)(v129 + 32) = v133;
                  *(_OWORD *)uint64_t v129 = v132;
                  __int128 v134 = *(_OWORD *)(v130 + 48);
                  __int128 v135 = *(_OWORD *)(v130 + 64);
                  __int128 v136 = *(_OWORD *)(v130 + 80);
                  *(void *)(v129 + 96) = *(void *)(v130 + 96);
                  *(_OWORD *)(v129 + 64) = v135;
                  *(_OWORD *)(v129 + 80) = v136;
                  *(_OWORD *)(v129 + 48) = v134;
                  __int128 v137 = (__n128 *)(v130 + 104);
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v129 + 104,  (__n128 *)(v130 + 104));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 136,  (__n128 *)(v130 + 136));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v129 + 168,  (__n128 *)(v130 + 168));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v129 + 200));
                  *(_OWORD *)(v129 + 200) = *(_OWORD *)(v130 + 200);
                  *(void *)(v129 + 216) = *(void *)(v130 + 216);
                  *(void *)(v130 + 200) = 0LL;
                  *(void *)(v130 + 208) = 0LL;
                  *(void *)(v130 + 216) = 0LL;
                  uint64_t v129 = v130;
                }

                while (v128 <= (uint64_t)((unint64_t)(v121 - 2) >> 1));
                if ((__int128 *)v130 == v201 - 14)
                {
                  __int128 v169 = v203;
                  __int128 v170 = v205;
                  *(_OWORD *)(v130 + 16) = v204;
                  *(_OWORD *)(v130 + 32) = v170;
                  *(_OWORD *)uint64_t v130 = v169;
                  __int128 v171 = v206;
                  __int128 v172 = v207;
                  __int128 v173 = v208;
                  *(void *)(v130 + 96) = v209;
                  *(_OWORD *)(v130 + 64) = v172;
                  *(_OWORD *)(v130 + 80) = v173;
                  *(_OWORD *)(v130 + 48) = v171;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  *(_OWORD *)(v130 + 200) = v219;
                  *(void *)(v130 + 216) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                }

                else
                {
                  __int128 v138 = *(v201 - 14);
                  __int128 v139 = *(v201 - 12);
                  *(_OWORD *)(v130 + 16) = *(v201 - 13);
                  *(_OWORD *)(v130 + 32) = v139;
                  *(_OWORD *)uint64_t v130 = v138;
                  __int128 v140 = *(v201 - 11);
                  __int128 v141 = *(v201 - 10);
                  __int128 v142 = *(v201 - 9);
                  *(void *)(v130 + 96) = *((void *)v201 - 16);
                  *(_OWORD *)(v130 + 64) = v141;
                  *(_OWORD *)(v130 + 80) = v142;
                  *(_OWORD *)(v130 + 48) = v140;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)((char *)v201 - 120));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)((char *)v201 - 88));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)((char *)v201 - 56));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                  uint64_t v143 = (void *)v201 - 3;
                  *(_OWORD *)(v130 + 200) = *(__int128 *)((char *)v201 - 24);
                  *(void *)(v130 + 216) = *((void *)v201 - 1);
                  void *v143 = 0LL;
                  v143[1] = 0LL;
                  v143[2] = 0LL;
                  __int128 v144 = v203;
                  __int128 v145 = v205;
                  *(v201 - 13) = v204;
                  *(v201 - 12) = v145;
                  *(v201 - 14) = v144;
                  __int128 v146 = v206;
                  __int128 v147 = v207;
                  __int128 v148 = v208;
                  *((void *)v201 - 16) = v209;
                  *(v201 - 10) = v147;
                  *(v201 - 9) = v148;
                  *(v201 - 11) = v146;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)v201 - 120,  &v210);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 88,  &v213);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)v201 - 56,  &v216);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)v201 - 3);
                  *(__int128 *)((char *)v201 - 24) = v219;
                  *((void *)v201 - 1) = v220;
                  __int128 v219 = 0uLL;
                  uint64_t v220 = 0LL;
                  uint64_t v149 = v130 + 224 - a1;
                  if (v149 >= 225)
                  {
                    uint64_t v151 = a1 + 224 * v150;
                    if (*(void *)v151 < *(void *)v130)
                    {
                      __int128 v152 = *(_OWORD *)v130;
                      __int128 v153 = *(_OWORD *)(v130 + 32);
                      __int128 v223 = *(_OWORD *)(v130 + 16);
                      __int128 v224 = v153;
                      __int128 v222 = v152;
                      __int128 v154 = *(_OWORD *)(v130 + 48);
                      __int128 v155 = *(_OWORD *)(v130 + 64);
                      __int128 v156 = *(_OWORD *)(v130 + 80);
                      uint64_t v228 = *(void *)(v130 + 96);
                      __int128 v226 = v155;
                      __int128 v227 = v156;
                      __int128 v225 = v154;
                      v229.n128_u8[0] = 0;
                      char v231 = 0;
                      if (*(_BYTE *)(v130 + 128))
                      {
                        __n128 v157 = *v137;
                        uint64_t v230 = *(void *)(v130 + 120);
                        __n128 v229 = v157;
                        *(void *)(v130 + 112) = 0LL;
                        *(void *)(v130 + 120) = 0LL;
                        v137->n128_u64[0] = 0LL;
                        char v231 = 1;
                      }

                      v232.n128_u8[0] = 0;
                      char v234 = 0;
                      if (*(_BYTE *)(v130 + 160))
                      {
                        __n128 v232 = *(__n128 *)(v130 + 136);
                        uint64_t v233 = *(void *)(v130 + 152);
                        *(void *)(v130 + 136) = 0LL;
                        *(void *)(v130 + 144) = 0LL;
                        *(void *)(v130 + 152) = 0LL;
                        char v234 = 1;
                      }

                      __p.n128_u8[0] = 0;
                      char v237 = 0;
                      if (*(_BYTE *)(v130 + 192))
                      {
                        __n128 __p = *(__n128 *)(v130 + 168);
                        uint64_t v236 = *(void *)(v130 + 184);
                        *(void *)(v130 + 168) = 0LL;
                        *(void *)(v130 + 176) = 0LL;
                        *(void *)(v130 + 184) = 0LL;
                        char v237 = 1;
                      }

                      __int128 v238 = *(_OWORD *)(v130 + 200);
                      uint64_t v239 = *(void *)(v130 + 216);
                      *(void *)(v130 + 200) = 0LL;
                      *(void *)(v130 + 208) = 0LL;
                      *(void *)(v130 + 216) = 0LL;
                      do
                      {
                        uint64_t v158 = v151;
                        __int128 v159 = *(_OWORD *)v151;
                        __int128 v160 = *(_OWORD *)(v151 + 32);
                        *(_OWORD *)(v130 + 16) = *(_OWORD *)(v151 + 16);
                        *(_OWORD *)(v130 + 32) = v160;
                        *(_OWORD *)uint64_t v130 = v159;
                        __int128 v161 = *(_OWORD *)(v151 + 48);
                        __int128 v162 = *(_OWORD *)(v151 + 64);
                        __int128 v163 = *(_OWORD *)(v151 + 80);
                        *(void *)(v130 + 96) = *(void *)(v151 + 96);
                        *(_OWORD *)(v130 + 64) = v162;
                        *(_OWORD *)(v130 + 80) = v163;
                        *(_OWORD *)(v130 + 48) = v161;
                        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v130 + 104,  (__n128 *)(v151 + 104));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 136,  (__n128 *)(v158 + 136));
                        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v130 + 168,  (__n128 *)(v158 + 168));
                        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v130 + 200));
                        *(_OWORD *)(v130 + 200) = *(_OWORD *)(v158 + 200);
                        *(void *)(v130 + 216) = *(void *)(v158 + 216);
                        *(void *)(v158 + 200) = 0LL;
                        *(void *)(v158 + 208) = 0LL;
                        *(void *)(v158 + 216) = 0LL;
                        if (!v150) {
                          break;
                        }
                        unint64_t v150 = (v150 - 1) >> 1;
                        uint64_t v151 = a1 + 224 * v150;
                        uint64_t v130 = v158;
                      }

                      while (*(void *)v151 < (unint64_t)v222);
                      __int128 v164 = v222;
                      __int128 v165 = v224;
                      *(_OWORD *)(v158 + 16) = v223;
                      *(_OWORD *)(v158 + 32) = v165;
                      *(_OWORD *)uint64_t v158 = v164;
                      __int128 v166 = v225;
                      __int128 v167 = v226;
                      __int128 v168 = v227;
                      *(void *)(v158 + 96) = v228;
                      *(_OWORD *)(v158 + 64) = v167;
                      *(_OWORD *)(v158 + 80) = v168;
                      *(_OWORD *)(v158 + 48) = v166;
                      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v158 + 104,  &v229);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 136,  &v232);
                      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v158 + 168,  &__p);
                      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v158 + 200));
                      *(_OWORD *)(v158 + 200) = v238;
                      *(void *)(v158 + 216) = v239;
                      __int128 v238 = 0uLL;
                      uint64_t v239 = 0LL;
                      v221 = (void **)&v238;
                      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v221);
                      if (v237 && __p.n128_u64[0])
                      {
                        __p.n128_u64[1] = __p.n128_u64[0];
                        operator delete((void *)__p.n128_u64[0]);
                      }

                      if (v234 && v232.n128_u64[0])
                      {
                        v232.n128_u64[1] = v232.n128_u64[0];
                        operator delete((void *)v232.n128_u64[0]);
                      }

                      if (v231 && SHIBYTE(v230) < 0) {
                        operator delete((void *)v229.n128_u64[0]);
                      }
                    }
                  }
                }

                *(void *)&__int128 v222 = &v219;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v222);
                if (v218 && v216.n128_u64[0])
                {
                  v216.n128_u64[1] = v216.n128_u64[0];
                  operator delete((void *)v216.n128_u64[0]);
                }

                if (v215 && v213.n128_u64[0])
                {
                  v213.n128_u64[1] = v213.n128_u64[0];
                  operator delete((void *)v213.n128_u64[0]);
                }

                if (v212 && SHIBYTE(v211) < 0) {
                  operator delete((void *)v210.n128_u64[0]);
                }
                BOOL v174 = v121-- <= 2;
                __int128 v7 = v201 - 14;
              }

              while (!v174);
            }

            return;
          }

          unint64_t v10 = v9 >> 1;
          int v11 = (__int128 *)(a1 + 224 * (v9 >> 1));
          if ((unint64_t)v8 <= 0x7000)
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224 * (v9 >> 1)),  (__int128 *)a1,  v197);
          }

          else
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)a1,  (__int128 *)(a1 + 224 * (v9 >> 1)),  v197);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 224),  (__int128 *)(224 * v10 + a1 - 224),  v196);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(a1 + 448),  (__int128 *)(a1 + 224 + 224 * v10),  v195);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( (__int128 *)(224 * v10 + a1 - 224),  v11,  (__int128 *)(a1 + 224 + 224 * v10));
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)a1, v11);
          }

          --a3;
          if ((a4 & 1) == 0 && *(void *)(a1 - 224) >= *(void *)a1)
          {
            __int128 v40 = *(_OWORD *)a1;
            __int128 v41 = *(_OWORD *)(a1 + 32);
            __int128 v223 = *(_OWORD *)(a1 + 16);
            __int128 v224 = v41;
            __int128 v222 = v40;
            __int128 v42 = *(_OWORD *)(a1 + 48);
            __int128 v43 = *(_OWORD *)(a1 + 64);
            __int128 v44 = *(_OWORD *)(a1 + 80);
            uint64_t v228 = *(void *)(a1 + 96);
            __int128 v226 = v43;
            __int128 v227 = v44;
            __int128 v225 = v42;
            v229.n128_u8[0] = 0;
            char v231 = 0;
            if (*(_BYTE *)(a1 + 128))
            {
              __n128 v45 = *(__n128 *)(a1 + 104);
              uint64_t v230 = *(void *)(a1 + 120);
              __n128 v229 = v45;
              *(void *)(a1 + 112) = 0LL;
              *(void *)(a1 + 120) = 0LL;
              *(void *)(a1 + 104) = 0LL;
              char v231 = 1;
            }

            v232.n128_u8[0] = 0;
            char v234 = 0;
            if (*(_BYTE *)(a1 + 160))
            {
              __n128 v232 = *(__n128 *)(a1 + 136);
              uint64_t v233 = *(void *)(a1 + 152);
              *(void *)(a1 + 136) = 0LL;
              *(void *)(a1 + 144) = 0LL;
              *(void *)(a1 + 152) = 0LL;
              char v234 = 1;
            }

            __p.n128_u8[0] = 0;
            char v237 = 0;
            if (*(_BYTE *)(a1 + 192))
            {
              __n128 __p = *(__n128 *)(a1 + 168);
              uint64_t v236 = *(void *)(a1 + 184);
              *(void *)(a1 + 168) = 0LL;
              *(void *)(a1 + 176) = 0LL;
              *(void *)(a1 + 184) = 0LL;
              char v237 = 1;
            }

            __int128 v238 = *(_OWORD *)(a1 + 200);
            uint64_t v239 = *(void *)(a1 + 216);
            *(void *)(a1 + 200) = 0LL;
            *(void *)(a1 + 208) = 0LL;
            *(void *)(a1 + 216) = 0LL;
            unint64_t v46 = v222;
            if ((unint64_t)v222 >= *(void *)v197)
            {
              unint64_t v48 = a1 + 224;
              do
              {
                unint64_t v6 = v48;
                v48 += 224LL;
              }

              while ((unint64_t)v222 >= *(void *)v6);
            }

            else
            {
              unint64_t v6 = a1;
              do
              {
                unint64_t v47 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while ((unint64_t)v222 >= v47);
            }

            __int128 v49 = v202;
            if (v6 < (unint64_t)v202)
            {
              __int128 v49 = v202;
              do
              {
                unint64_t v50 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while ((unint64_t)v222 < v50);
            }

            while (v6 < (unint64_t)v49)
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v49);
              do
              {
                unint64_t v51 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v46 >= v51);
              do
              {
                unint64_t v52 = *((void *)v49 - 28);
                v49 -= 14;
              }

              while (v46 < v52);
            }

            uint64_t v53 = (__int128 *)(v6 - 224);
            if (v6 - 224 != a1)
            {
              __int128 v54 = *v53;
              __int128 v55 = *(_OWORD *)(v6 - 192);
              *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
              *(_OWORD *)(a1 + 32) = v55;
              *(_OWORD *)a1 = v54;
              __int128 v56 = *(_OWORD *)(v6 - 176);
              __int128 v57 = *(_OWORD *)(v6 - 160);
              __int128 v58 = *(_OWORD *)(v6 - 144);
              *(void *)(a1 + 96) = *(void *)(v6 - 128);
              *(_OWORD *)(a1 + 64) = v57;
              *(_OWORD *)(a1 + 80) = v58;
              *(_OWORD *)(a1 + 48) = v56;
              std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
              std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
              std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
              *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
              *(void *)(a1 + 216) = *(void *)(v6 - 8);
              *(void *)(v6 - 24) = 0LL;
              *(void *)(v6 - 16) = 0LL;
              *(void *)(v6 - 8) = 0LL;
            }

            __int128 v59 = v222;
            __int128 v60 = v224;
            *(_OWORD *)(v6 - 208) = v223;
            *(_OWORD *)(v6 - 192) = v60;
            __int128 *v53 = v59;
            __int128 v61 = v225;
            __int128 v62 = v226;
            __int128 v63 = v227;
            *(void *)(v6 - 128) = v228;
            *(_OWORD *)(v6 - 160) = v62;
            *(_OWORD *)(v6 - 144) = v63;
            *(_OWORD *)(v6 - 176) = v61;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
            *(_OWORD *)(v6 - 24) = v238;
            *(void *)(v6 - 8) = v239;
            __int128 v238 = 0uLL;
            uint64_t v239 = 0LL;
            *(void *)&__int128 v203 = &v238;
            std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
            if (v237 && __p.n128_u64[0])
            {
              __p.n128_u64[1] = __p.n128_u64[0];
              operator delete((void *)__p.n128_u64[0]);
            }

            if (v234 && v232.n128_u64[0])
            {
              v232.n128_u64[1] = v232.n128_u64[0];
              operator delete((void *)v232.n128_u64[0]);
            }

            if (v231 && SHIBYTE(v230) < 0) {
              operator delete((void *)v229.n128_u64[0]);
            }
            goto LABEL_45;
          }

          __int128 v12 = *(_OWORD *)a1;
          __int128 v13 = *(_OWORD *)(a1 + 32);
          __int128 v223 = *(_OWORD *)(a1 + 16);
          __int128 v224 = v13;
          __int128 v222 = v12;
          __int128 v14 = *(_OWORD *)(a1 + 48);
          __int128 v15 = *(_OWORD *)(a1 + 64);
          __int128 v16 = *(_OWORD *)(a1 + 80);
          uint64_t v228 = *(void *)(a1 + 96);
          __int128 v226 = v15;
          __int128 v227 = v16;
          __int128 v225 = v14;
          v229.n128_u8[0] = 0;
          char v231 = 0;
          if (*(_BYTE *)(a1 + 128))
          {
            __n128 v17 = *(__n128 *)(a1 + 104);
            uint64_t v230 = *(void *)(a1 + 120);
            __n128 v229 = v17;
            *(void *)(a1 + 112) = 0LL;
            *(void *)(a1 + 120) = 0LL;
            *(void *)(a1 + 104) = 0LL;
            char v231 = 1;
          }

          v232.n128_u8[0] = 0;
          char v234 = 0;
          if (*(_BYTE *)(a1 + 160))
          {
            __n128 v232 = *(__n128 *)(a1 + 136);
            uint64_t v233 = *(void *)(a1 + 152);
            *(void *)(a1 + 136) = 0LL;
            *(void *)(a1 + 144) = 0LL;
            *(void *)(a1 + 152) = 0LL;
            char v234 = 1;
          }

          __p.n128_u8[0] = 0;
          char v237 = 0;
          if (*(_BYTE *)(a1 + 192))
          {
            __n128 __p = *(__n128 *)(a1 + 168);
            uint64_t v236 = *(void *)(a1 + 184);
            *(void *)(a1 + 168) = 0LL;
            *(void *)(a1 + 176) = 0LL;
            *(void *)(a1 + 184) = 0LL;
            char v237 = 1;
          }

          uint64_t v18 = 0LL;
          __int128 v238 = *(_OWORD *)(a1 + 200);
          uint64_t v239 = *(void *)(a1 + 216);
          *(void *)(a1 + 200) = 0LL;
          *(void *)(a1 + 208) = 0LL;
          *(void *)(a1 + 216) = 0LL;
          unint64_t v19 = v222;
          do
          {
            unint64_t v20 = *(void *)(a1 + v18 + 224);
            v18 += 224LL;
          }

          while (v20 < (unint64_t)v222);
          unint64_t v21 = a1 + v18;
          uint64_t v22 = v202;
          if (v18 == 224)
          {
            uint64_t v22 = v202;
            do
            {
              unint64_t v24 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v24 >= (unint64_t)v222);
          }

          else
          {
            do
            {
              unint64_t v23 = *((void *)v22 - 28);
              v22 -= 14;
            }

            while (v23 >= (unint64_t)v222);
          }

          unint64_t v6 = a1 + v18;
          if (v21 < (unint64_t)v22)
          {
            __int128 v25 = v22;
            do
            {
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>((__int128 *)v6, v25);
              do
              {
                unint64_t v26 = *(void *)(v6 + 224);
                v6 += 224LL;
              }

              while (v26 < v19);
              do
              {
                unint64_t v27 = *((void *)v25 - 28);
                v25 -= 14;
              }

              while (v27 >= v19);
            }

            while (v6 < (unint64_t)v25);
          }

          __int128 v28 = (__int128 *)(v6 - 224);
          if (v6 - 224 != a1)
          {
            __int128 v29 = *v28;
            __int128 v30 = *(_OWORD *)(v6 - 192);
            *(_OWORD *)(a1 + 16) = *(_OWORD *)(v6 - 208);
            *(_OWORD *)(a1 + 32) = v30;
            *(_OWORD *)a1 = v29;
            __int128 v31 = *(_OWORD *)(v6 - 176);
            __int128 v32 = *(_OWORD *)(v6 - 160);
            __int128 v33 = *(_OWORD *)(v6 - 144);
            *(void *)(a1 + 96) = *(void *)(v6 - 128);
            *(_OWORD *)(a1 + 64) = v32;
            *(_OWORD *)(a1 + 80) = v33;
            *(_OWORD *)(a1 + 48) = v31;
            std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + 104,  (__n128 *)(v6 - 120));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 136,  (__n128 *)(v6 - 88));
            std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + 168,  (__n128 *)(v6 - 56));
            std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + 200));
            *(_OWORD *)(a1 + 200) = *(_OWORD *)(v6 - 24);
            *(void *)(a1 + 216) = *(void *)(v6 - 8);
            *(void *)(v6 - 24) = 0LL;
            *(void *)(v6 - 16) = 0LL;
            *(void *)(v6 - 8) = 0LL;
          }

          __int128 v34 = v222;
          __int128 v35 = v224;
          *(_OWORD *)(v6 - 208) = v223;
          *(_OWORD *)(v6 - 192) = v35;
          *__int128 v28 = v34;
          __int128 v36 = v225;
          __int128 v37 = v226;
          __int128 v38 = v227;
          *(void *)(v6 - 128) = v228;
          *(_OWORD *)(v6 - 160) = v37;
          *(_OWORD *)(v6 - 144) = v38;
          *(_OWORD *)(v6 - 176) = v36;
          std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v6 - 120,  &v229);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 88,  &v232);
          std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v6 - 56,  &__p);
          std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v6 - 24));
          *(_OWORD *)(v6 - 24) = v238;
          *(void *)(v6 - 8) = v239;
          __int128 v238 = 0uLL;
          uint64_t v239 = 0LL;
          *(void *)&__int128 v203 = &v238;
          std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
          if (v237 && __p.n128_u64[0])
          {
            __p.n128_u64[1] = __p.n128_u64[0];
            operator delete((void *)__p.n128_u64[0]);
          }

          if (v234 && v232.n128_u64[0])
          {
            v232.n128_u64[1] = v232.n128_u64[0];
            operator delete((void *)v232.n128_u64[0]);
          }

          if (v231 && SHIBYTE(v230) < 0) {
            operator delete((void *)v229.n128_u64[0]);
          }
          BOOL v39 = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)a1,  (__int128 *)(v6 - 224));
          if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( (__int128 *)v6,  v202))
          {
            if (v39) {
              continue;
            }
LABEL_44:
            _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoLb0EEEvT1_SP_SI_NS_15iterator_traitsISP_E15difference_typeEb( a1,  v6 - 224,  a3,  a4 & 1);
LABEL_45:
            a4 = 0;
            continue;
          }

          a2 = (__int128 *)(v6 - 224);
          if (v39) {
            return;
          }
          goto LABEL_1;
        }

        if ((a4 & 1) != 0)
        {
          if ((__int128 *)a1 != v202)
          {
            unint64_t v67 = a1 + 224;
            if ((__int128 *)(a1 + 224) != v202)
            {
              uint64_t v68 = 0LL;
              unint64_t v69 = a1;
              do
              {
                unint64_t v70 = v67;
                if (*(void *)(v69 + 224) < *(void *)v69)
                {
                  __int128 v71 = *(_OWORD *)v67;
                  __int128 v72 = *(_OWORD *)(v67 + 32);
                  __int128 v223 = *(_OWORD *)(v67 + 16);
                  __int128 v224 = v72;
                  __int128 v222 = v71;
                  __int128 v73 = *(_OWORD *)(v67 + 48);
                  __int128 v74 = *(_OWORD *)(v67 + 64);
                  __int128 v75 = *(_OWORD *)(v67 + 80);
                  uint64_t v228 = *(void *)(v67 + 96);
                  __int128 v226 = v74;
                  __int128 v227 = v75;
                  __int128 v225 = v73;
                  v229.n128_u8[0] = 0;
                  char v231 = 0;
                  if (*(_BYTE *)(v69 + 352))
                  {
                    uint64_t v230 = *(void *)(v69 + 344);
                    __n128 v229 = *(__n128 *)(v69 + 328);
                    *(void *)(v69 + 336) = 0LL;
                    *(void *)(v69 + 344) = 0LL;
                    *(void *)(v69 + 328) = 0LL;
                    char v231 = 1;
                  }

                  unint64_t v76 = (__n128 *)(v69 + 360);
                  v232.n128_u8[0] = 0;
                  char v234 = 0;
                  if (*(_BYTE *)(v69 + 384))
                  {
                    __n128 v232 = *v76;
                    uint64_t v233 = *(void *)(v69 + 376);
                    v76->n128_u64[0] = 0LL;
                    *(void *)(v69 + 368) = 0LL;
                    *(void *)(v69 + 376) = 0LL;
                    char v234 = 1;
                  }

                  __p.n128_u8[0] = 0;
                  char v237 = 0;
                  if (*(_BYTE *)(v69 + 416))
                  {
                    __n128 __p = *(__n128 *)(v69 + 392);
                    uint64_t v236 = *(void *)(v69 + 408);
                    *(void *)(v69 + 392) = 0LL;
                    *(void *)(v69 + 400) = 0LL;
                    *(void *)(v69 + 408) = 0LL;
                    char v237 = 1;
                  }

                  __int128 v238 = *(_OWORD *)(v69 + 424);
                  uint64_t v239 = *(void *)(v69 + 440);
                  *(void *)(v69 + 424) = 0LL;
                  *(void *)(v69 + 432) = 0LL;
                  *(void *)(v69 + 440) = 0LL;
                  uint64_t v77 = v68;
                  while (1)
                  {
                    uint64_t v78 = v77;
                    uint64_t v79 = a1 + v77;
                    __int128 v80 = *(_OWORD *)(a1 + v77 + 80);
                    *(_OWORD *)(v79 + 288) = *(_OWORD *)(a1 + v77 + 64);
                    *(_OWORD *)(v79 + 304) = v80;
                    *(void *)(v79 + 320) = *(void *)(a1 + v77 + 96);
                    __int128 v81 = *(_OWORD *)(a1 + v77 + 16);
                    *(_OWORD *)(v79 + 224) = *(_OWORD *)v79;
                    *(_OWORD *)(v79 + 240) = v81;
                    __int128 v82 = *(_OWORD *)(a1 + v77 + 48);
                    *(_OWORD *)(v79 + 256) = *(_OWORD *)(a1 + v77 + 32);
                    *(_OWORD *)(v79 + 272) = v82;
                    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v77 + 328,  (__n128 *)(a1 + v77 + 104));
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v79 + 360,  (__n128 *)(v79 + 136));
                    uint64_t v83 = a1 + v78;
                    std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 392,  (__n128 *)(a1 + v78 + 168));
                    std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(a1 + v78 + 424));
                    *(_OWORD *)(v83 + 424) = *(_OWORD *)(v83 + 200);
                    *(void *)(v83 + 440) = *(void *)(v83 + 216);
                    *(void *)(v83 + 208) = 0LL;
                    *(void *)(v83 + 216) = 0LL;
                    *(void *)(v83 + 200) = 0LL;
                    if (!v78) {
                      break;
                    }
                    uint64_t v77 = v78 - 224;
                    if ((unint64_t)v222 >= *(void *)(a1 + v78 - 224))
                    {
                      unint64_t v84 = a1 + v78;
                      goto LABEL_107;
                    }
                  }

                  unint64_t v84 = a1;
LABEL_107:
                  __int128 v85 = v222;
                  __int128 v86 = v224;
                  *(_OWORD *)(v84 + 16) = v223;
                  *(_OWORD *)(v84 + 32) = v86;
                  *(_OWORD *)unint64_t v84 = v85;
                  __int128 v87 = v225;
                  __int128 v88 = v226;
                  __int128 v89 = v227;
                  *(void *)(v84 + 96) = v228;
                  *(_OWORD *)(v84 + 64) = v88;
                  *(_OWORD *)(v84 + 80) = v89;
                  *(_OWORD *)(v84 + 48) = v87;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( a1 + v78 + 104,  &v229);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 136,  &v232);
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( a1 + v78 + 168,  &__p);
                  __int128 v90 = (uint64_t *)(a1 + v78 + 200);
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v90);
                  *__int128 v90 = v238;
                  *(void *)(v84 + 208) = *((void *)&v238 + 1);
                  *(void *)(v84 + 216) = v239;
                  __int128 v238 = 0uLL;
                  uint64_t v239 = 0LL;
                  *(void *)&__int128 v203 = &v238;
                  std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                  if (v237 && __p.n128_u64[0])
                  {
                    __p.n128_u64[1] = __p.n128_u64[0];
                    operator delete((void *)__p.n128_u64[0]);
                  }

                  if (v234 && v232.n128_u64[0])
                  {
                    v232.n128_u64[1] = v232.n128_u64[0];
                    operator delete((void *)v232.n128_u64[0]);
                  }

                  if (v231 && SHIBYTE(v230) < 0) {
                    operator delete((void *)v229.n128_u64[0]);
                  }
                  __int128 v7 = v202;
                }

                unint64_t v67 = v70 + 224;
                v68 += 224LL;
                unint64_t v69 = v70;
              }

              while ((__int128 *)(v70 + 224) != v7);
            }
          }
        }

        else if ((__int128 *)a1 != v202)
        {
          unint64_t v175 = a1 + 224;
          if ((__int128 *)(a1 + 224) != v202)
          {
            unint64_t v176 = a1 - 224;
            do
            {
              unint64_t v177 = v175;
              if (*(void *)(a1 + 224) < *(void *)a1)
              {
                __int128 v178 = *(_OWORD *)v175;
                __int128 v179 = *(_OWORD *)(v175 + 32);
                __int128 v223 = *(_OWORD *)(v175 + 16);
                __int128 v224 = v179;
                __int128 v222 = v178;
                __int128 v180 = *(_OWORD *)(v175 + 48);
                __int128 v181 = *(_OWORD *)(v175 + 64);
                __int128 v182 = *(_OWORD *)(v175 + 80);
                uint64_t v228 = *(void *)(v175 + 96);
                __int128 v226 = v181;
                __int128 v227 = v182;
                __int128 v225 = v180;
                v229.n128_u8[0] = 0;
                char v231 = 0;
                if (*(_BYTE *)(a1 + 352))
                {
                  uint64_t v230 = *(void *)(a1 + 344);
                  __n128 v229 = *(__n128 *)(a1 + 328);
                  *(void *)(a1 + 336) = 0LL;
                  *(void *)(a1 + 344) = 0LL;
                  *(void *)(a1 + 328) = 0LL;
                  char v231 = 1;
                }

                v183 = (__n128 *)(a1 + 360);
                v232.n128_u8[0] = 0;
                char v234 = 0;
                if (*(_BYTE *)(a1 + 384))
                {
                  __n128 v232 = *v183;
                  uint64_t v233 = *(void *)(a1 + 376);
                  v183->n128_u64[0] = 0LL;
                  *(void *)(a1 + 368) = 0LL;
                  *(void *)(a1 + 376) = 0LL;
                  char v234 = 1;
                }

                __p.n128_u8[0] = 0;
                char v237 = 0;
                if (*(_BYTE *)(a1 + 416))
                {
                  __n128 __p = *(__n128 *)(a1 + 392);
                  uint64_t v236 = *(void *)(a1 + 408);
                  *(void *)(a1 + 392) = 0LL;
                  *(void *)(a1 + 400) = 0LL;
                  *(void *)(a1 + 408) = 0LL;
                  char v237 = 1;
                }

                __int128 v238 = *(_OWORD *)(a1 + 424);
                uint64_t v239 = *(void *)(a1 + 440);
                *(void *)(a1 + 424) = 0LL;
                *(void *)(a1 + 432) = 0LL;
                *(void *)(a1 + 440) = 0LL;
                unint64_t v184 = v176;
                do
                {
                  __int128 v185 = *(_OWORD *)(v184 + 304);
                  *(_OWORD *)(v184 + 512) = *(_OWORD *)(v184 + 288);
                  *(_OWORD *)(v184 + 528) = v185;
                  *(void *)(v184 + 544) = *(void *)(v184 + 320);
                  __int128 v186 = *(_OWORD *)(v184 + 240);
                  *(_OWORD *)(v184 + 448) = *(_OWORD *)(v184 + 224);
                  *(_OWORD *)(v184 + 464) = v186;
                  __int128 v187 = *(_OWORD *)(v184 + 272);
                  *(_OWORD *)(v184 + 480) = *(_OWORD *)(v184 + 256);
                  *(_OWORD *)(v184 + 496) = v187;
                  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  (__n128 *)(v184 + 328));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  (__n128 *)(v184 + 360));
                  std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  (__n128 *)(v184 + 392));
                  std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                  *(_OWORD *)(v184 + 648) = *(_OWORD *)(v184 + 424);
                  *(void *)(v184 + 664) = *(void *)(v184 + 440);
                  *(void *)(v184 + 424) = 0LL;
                  *(void *)(v184 + 432) = 0LL;
                  *(void *)(v184 + 440) = 0LL;
                  unint64_t v188 = *(void *)v184;
                  v184 -= 224LL;
                }

                while ((unint64_t)v222 < v188);
                __int128 v189 = v222;
                __int128 v190 = v224;
                *(_OWORD *)(v184 + 464) = v223;
                *(_OWORD *)(v184 + 480) = v190;
                *(_OWORD *)(v184 + 448) = v189;
                __int128 v191 = v225;
                __int128 v192 = v226;
                __int128 v193 = v227;
                *(void *)(v184 + 544) = v228;
                *(_OWORD *)(v184 + 512) = v192;
                *(_OWORD *)(v184 + 528) = v193;
                *(_OWORD *)(v184 + 496) = v191;
                std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( v184 + 552,  &v229);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 584,  &v232);
                std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( v184 + 616,  &__p);
                std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)(v184 + 648));
                *(_OWORD *)(v184 + 648) = v238;
                *(void *)(v184 + 664) = v239;
                __int128 v238 = 0uLL;
                uint64_t v239 = 0LL;
                *(void *)&__int128 v203 = &v238;
                std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v203);
                if (v237 && __p.n128_u64[0])
                {
                  __p.n128_u64[1] = __p.n128_u64[0];
                  operator delete((void *)__p.n128_u64[0]);
                }

                if (v234 && v232.n128_u64[0])
                {
                  v232.n128_u64[1] = v232.n128_u64[0];
                  operator delete((void *)v232.n128_u64[0]);
                }

                if (v231 && SHIBYTE(v230) < 0) {
                  operator delete((void *)v229.n128_u64[0]);
                }
                __int128 v7 = v202;
              }

              unint64_t v175 = v177 + 224;
              v176 += 224LL;
              a1 = v177;
            }

            while ((__int128 *)(v177 + 224) != v7);
          }
        }

        return;
    }
  }

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer6412LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E1_P23CSCppCoreFileRegionInfoEEbT1_SP_SI_( __int128 *a1, __int128 *a2)
{
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a2 - (char *)a1) >> 5);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      if (*((void *)a2 - 28) < *(void *)a1)
      {
        unint64_t v6 = a1;
        __int128 v7 = a2 - 14;
        goto LABEL_4;
      }

      return result;
    case 3LL:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a2 - 14);
      return 1LL;
    case 4LL:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a2 - 14);
      return 1LL;
    case 5LL:
      unint64_t v24 = a1 + 28;
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEvT1_SP_SP_SP_SI_( a1,  a1 + 14,  a1 + 28,  a1 + 42);
      unint64_t v26 = *((void *)a2 - 28);
      __int128 v25 = a2 - 14;
      if (v26 < *((void *)a1 + 84))
      {
        std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 42, v25);
        if (*((void *)a1 + 84) < *v24)
        {
          std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 28, a1 + 42);
          if (*v24 < *((void *)a1 + 28))
          {
            std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(a1 + 14, a1 + 28);
            if (*((void *)a1 + 28) < *(void *)a1)
            {
              unint64_t v6 = a1;
              __int128 v7 = a1 + 14;
LABEL_4:
              std::swap[abi:ne180100]<CSCppCoreFileRegionInfo>(v6, v7);
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v8 = a1 + 28;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZL48set_up_mapped_memory_cache_for_exclave_core_fileI17SizeAndEndiannessI9Pointer3212LittleEndianEEbPKcyRK21vas_segmentinfo_table21CSExclaveCoreFileTypeP15mapped_memory_tEUlRKT_RKT0_E0_P23CSCppCoreFileRegionInfoEEjT1_SP_SP_SI_( a1,  a1 + 14,  a1 + 28);
      unint64_t v9 = a1 + 42;
      BOOL result = 1LL;
      if (a1 + 42 == a2) {
        return result;
      }
      uint64_t v10 = 0LL;
      int v11 = 0;
      break;
  }

  while (1)
  {
    if (*(void *)v9 < *(void *)v8)
    {
      __int128 v31 = v9[4];
      __int128 v32 = v9[5];
      uint64_t v33 = *((void *)v9 + 12);
      __int128 v27 = *v9;
      __int128 v28 = v9[1];
      __int128 v29 = v9[2];
      __int128 v30 = v9[3];
      v34.n128_u8[0] = 0;
      char v36 = 0;
      if (*((_BYTE *)v9 + 128))
      {
        __n128 v34 = *(__n128 *)((char *)v9 + 104);
        uint64_t v35 = *((void *)v9 + 15);
        *((void *)v9 + 14) = 0LL;
        *((void *)v9 + 15) = 0LL;
        *((void *)v9 + 13) = 0LL;
        char v36 = 1;
      }

      v37.n128_u8[0] = 0;
      char v39 = 0;
      if (*((_BYTE *)v9 + 160))
      {
        __n128 v37 = *(__n128 *)((char *)v9 + 136);
        uint64_t v38 = *((void *)v9 + 19);
        *((void *)v9 + 18) = 0LL;
        *((void *)v9 + 19) = 0LL;
        *((void *)v9 + 17) = 0LL;
        char v39 = 1;
      }

      __p.n128_u8[0] = 0;
      char v42 = 0;
      if (*((_BYTE *)v9 + 192))
      {
        __n128 __p = *(__n128 *)((char *)v9 + 168);
        uint64_t v41 = *((void *)v9 + 23);
        *((void *)v9 + 22) = 0LL;
        *((void *)v9 + 23) = 0LL;
        *((void *)v9 + 21) = 0LL;
        char v42 = 1;
      }

      __int128 v43 = *(__int128 *)((char *)v9 + 200);
      uint64_t v44 = *((void *)v9 + 27);
      *((void *)v9 + 26) = 0LL;
      *((void *)v9 + 27) = 0LL;
      *((void *)v9 + 25) = 0LL;
      uint64_t v12 = v10;
      while (1)
      {
        uint64_t v13 = v12;
        __int128 v14 = (char *)a1 + v12;
        __int128 v15 = *(__int128 *)((char *)a1 + v12 + 528);
        *((_OWORD *)v14 + 46) = *(__int128 *)((char *)a1 + v12 + 512);
        *((_OWORD *)v14 + 47) = v15;
        *((void *)v14 + 96) = *(void *)((char *)a1 + v12 + 544);
        __int128 v16 = *(__int128 *)((char *)a1 + v12 + 464);
        *((_OWORD *)v14 + 42) = *((_OWORD *)v14 + 28);
        *((_OWORD *)v14 + 43) = v16;
        __int128 v17 = *(__int128 *)((char *)a1 + v12 + 496);
        *((_OWORD *)v14 + 44) = *(__int128 *)((char *)a1 + v12 + 480);
        *((_OWORD *)v14 + 45) = v17;
        std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)a1 + v12 + 776,  (__n128 *)((char *)a1 + v12 + 552));
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v14 + 808),  (__n128 *)(v14 + 584));
        uint64_t v18 = (char *)a1 + v13;
        std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)a1 + v13 + 840,  (__n128 *)((char *)a1 + v13 + 616));
        unint64_t v19 = (__int128 *)((char *)a1 + v13 + 648);
        std::vector<CSCppCoreFileRegionInfo>::__vdeallocate((uint64_t *)((char *)a1 + v13 + 872));
        *(_OWORD *)(v18 + 872) = *v19;
        *((void *)v18 + 111) = *((void *)v18 + 83);
        *((void *)v18 + 83) = 0LL;
        *unint64_t v19 = 0u;
        if (v13 == -448) {
          break;
        }
        uint64_t v12 = v13 - 224;
        if ((unint64_t)v27 >= *(void *)((char *)a1 + v13 + 224))
        {
          uint64_t v20 = (uint64_t)a1 + v12 + 672;
          goto LABEL_19;
        }
      }

      uint64_t v20 = (uint64_t)a1;
LABEL_19:
      *(_OWORD *)(v20 + 64) = v31;
      *(_OWORD *)(v20 + 80) = v32;
      *(void *)(v20 + 96) = v33;
      *(_OWORD *)uint64_t v20 = v27;
      *(_OWORD *)(v20 + 16) = v28;
      unint64_t v21 = (uint64_t *)((char *)a1 + v13);
      *(_OWORD *)(v20 + 32) = v29;
      *(_OWORD *)(v20 + 48) = v30;
      std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>( (uint64_t)(v21 + 69),  &v34);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 73),  &v37);
      std::__optional_storage_base<std::vector<unsigned long long>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::vector<unsigned long long>,false>>( (uint64_t)(v21 + 77),  &__p);
      std::vector<CSCppCoreFileRegionInfo>::__vdeallocate(v21 + 81);
      uint64_t v22 = *((void *)&v43 + 1);
      v21[81] = v43;
      uint64_t v23 = v44;
      *(void *)(v20 + 208) = v22;
      *(void *)(v20 + 216) = v23;
      uint64_t v44 = 0LL;
      __int128 v43 = 0uLL;
      __n128 v45 = (void **)&v43;
      std::vector<CSCppCoreFileRegionInfo>::__destroy_vector::operator()[abi:ne180100](&v45);
      if (v42 && __p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }

      if (v39 && v37.n128_u64[0])
      {
        v37.n128_u64[1] = v37.n128_u64[0];
        operator delete((void *)v37.n128_u64[0]);
      }

      if (v36 && SHIBYTE(v35) < 0) {
        operator delete((void *)v34.n128_u64[0]);
      }
      if (++v11 == 8) {
        return v9 + 14 == a2;
      }
    }

    uint64_t v8 = v9;
    v10 += 224LL;
    v9 += 14;
    if (v9 == a2) {
      return 1LL;
    }
  }

void *std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::__emplace_unique_key_args<unsigned int,unsigned int &,mapped_memory_t *&>( uint64_t a1, unsigned int *a2, _DWORD *a3, void *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v9 - 1) & v8;
    }

    int v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == (_DWORD)v8) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v4) {
              break;
            }
          }

          uint64_t v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  uint64_t v12 = operator new(0x20uLL);
  void *v12 = 0LL;
  v12[1] = v8;
  *((_DWORD *)v12 + 4) = *a3;
  v12[3] = *a4;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1LL;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v9 - 1) & v8;
    }
  }

  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *v12 = *v21;
LABEL_38:
    void *v21 = v12;
    goto LABEL_39;
  }

  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v22 = *(void *)(*v12 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }

    else
    {
      v22 &= v9 - 1;
    }

    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_18608B86C(_Unwind_Exception *a1)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::__erase_unique<unsigned int>( void *a1, unsigned int *a2)
{
  BOOL result = std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::find<unsigned int>( a1,  a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase( a1,  result);
    return (uint64_t *)1;
  }

  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase( void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,TRawSymbol<Pointer32>>>>::remove( a1,  a2,  (uint64_t)&__p);
  uint64_t v3 = __p;
  __n128 __p = 0LL;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void std::default_delete<mapped_memory_t>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a2 + 192);
    *(void *)(a2 + 192) = 0LL;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
    }
    std::mutex::~mutex((std::mutex *)(a2 + 128));
    unint64_t v4 = *(void **)(a2 + 64);
    if (v4)
    {
      *(void *)(a2 + 72) = v4;
      operator delete(v4);
    }

    std::__tree<TRange<Pointer64>>::destroy(a2 + 40, *(void **)(a2 + 48));
    operator delete((void *)a2);
  }

uint64_t **std::__tree<mapped_region_node_internal_t,CompareMappedRegionNode,std::allocator<mapped_region_node_internal_t>>::__emplace_unique_key_args<mapped_region_node_internal_t,mapped_region_node_internal_t const&>( uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v6 = a1 + 1;
  __int128 v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        __int128 v5 = *v8;
        unint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      __int128 v5 = v8[1];
      if (!v5)
      {
        unint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    uint8x8_t v10 = operator new(0x48uLL);
    __int128 v11 = *(_OWORD *)(a3 + 16);
    v10[2] = *(_OWORD *)a3;
    v10[3] = v11;
    *((void *)v10 + 8) = *(void *)(a3 + 32);
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }

  return v8;
}

uint64_t std::__tree<mapped_region_node_internal_t,CompareMappedRegionNode,std::allocator<mapped_region_node_internal_t>>::__erase_unique<mapped_region_node_internal_t>( uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  unint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v2 + 1;
    }
    if (v6) {
      unint64_t v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }

  while (*v7);
  std::__tree<TRangeValue<Pointer64,unsigned char *>>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1LL;
}

const char *CSDwarfExpression::Evaluate( uint64_t (*a1)(uint64_t, void, char *), uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3, CSBinaryDataRef *this, unsigned int a5, uint64_t a6, unint64_t *a7, void *a8)
{
  unint64_t v9 = a7;
  __n128 __p = 0LL;
  __int128 v148 = 0LL;
  uint64_t v149 = 0LL;
  if (a7)
  {
    BOOL v16 = (unint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>( (uint64_t)&v149,  1uLL);
    *BOOL v16 = *v9;
    unint64_t v9 = v16 + 1;
    __n128 __p = v16;
    uint64_t v149 = (char *)&v16[v17];
    __int128 v148 = v16 + 1;
  }

  unsigned int v146 = a5;
  v141[0] = 1;
  unint64_t v145 = 0LL;
  uint64_t v142 = 0LL;
  uint64_t v143 = 0LL;
  int v144 = 0;
  unint64_t v18 = *((void *)this + 1);
  if (*(void *)this >= v18) {
    goto LABEL_296;
  }
  uint64_t v19 = a5;
  unint64_t v20 = v18 - *(void *)this;
  uint64_t v21 = a6 - 1;
  if (!a6) {
    uint64_t v21 = 0LL;
  }
  if (v20 <= v21 + (unint64_t)a5)
  {
LABEL_296:
    __int128 v25 = "invalid offset and/or length for opcodes buffer";
    goto LABEL_297;
  }

  if (v20 <= a5)
  {
LABEL_294:
    if (__p != v9)
    {
      __int128 v25 = 0LL;
      *a8 = *(v9 - 1);
      goto LABEL_297;
    }

    __int128 v25 = "Stack empty after evaluation";
    if (v9) {
      goto LABEL_298;
    }
    return v25;
  }

  unint64_t v22 = 0LL;
  uint64_t v23 = a6 + a5;
  while (2)
  {
    if (v22 || v23 <= v19)
    {
LABEL_293:
      unint64_t v9 = v148;
      goto LABEL_294;
    }

    int v24 = CSBinaryDataRef::Get8(this, &v146);
    unint64_t v22 = 0LL;
    __int128 v25 = "error: UNIMPLEMENTED opcode DW_OP_xderef_size";
    switch(v24)
    {
      case 3:
        unint64_t Pointer = CSBinaryDataRef::GetPointer(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v90 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v91 = v90 + 1;
        uint64_t v92 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v91) {
          unint64_t v91 = v92 >> 2;
        }
        else {
          unint64_t v38 = v91;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v90];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v128 = *--v27;
          *--unint64_t v48 = v128;
        }

        goto LABEL_285;
      case 6:
        if (__p == v148 || !a1)
        {
          __int128 v138 = "DW_OP_deref: No read memory callback provided";
          __int128 v139 = "Stack empty for DW_OP_deref";
          BOOL v140 = __p == v148;
          goto LABEL_330;
        }

        uint64_t v142 = *((unsigned __int8 *)this + 17);
        v141[0] = 1;
        uint64_t v93 = a1(a3, *(v148 - 1), v141);
        goto LABEL_239;
      case 8:
        unint64_t Pointer = CSBinaryDataRef::Get8(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v102 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v103 = v102 + 1;
        uint64_t v104 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v103) {
          unint64_t v103 = v104 >> 2;
        }
        else {
          unint64_t v38 = v103;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v102];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v131 = *--v27;
          *--unint64_t v48 = v131;
        }

        goto LABEL_285;
      case 9:
        unint64_t Pointer = (char)CSBinaryDataRef::Get8(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v99 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v100 = v99 + 1;
        uint64_t v101 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v100) {
          unint64_t v100 = v101 >> 2;
        }
        else {
          unint64_t v38 = v100;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v99];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v130 = *--v27;
          *--unint64_t v48 = v130;
        }

        goto LABEL_285;
      case 10:
        unint64_t Pointer = CSBinaryDataRef::Get16(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v95 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v96 = v95 + 1;
        uint64_t v97 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v96) {
          unint64_t v96 = v97 >> 2;
        }
        else {
          unint64_t v38 = v96;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v95];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v129 = *--v27;
          *--unint64_t v48 = v129;
        }

        goto LABEL_285;
      case 11:
        unint64_t Pointer = (__int16)CSBinaryDataRef::Get16(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v109 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v110 = v109 + 1;
        uint64_t v111 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v110) {
          unint64_t v110 = v111 >> 2;
        }
        else {
          unint64_t v38 = v110;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v109];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v133 = *--v27;
          *--unint64_t v48 = v133;
        }

        goto LABEL_285;
      case 12:
        unint64_t Pointer = CSBinaryDataRef::Get32(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v114 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v115 = v114 + 1;
        uint64_t v116 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v115) {
          unint64_t v115 = v116 >> 2;
        }
        else {
          unint64_t v38 = v115;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v114];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v134 = *--v27;
          *--unint64_t v48 = v134;
        }

        goto LABEL_285;
      case 13:
        unint64_t Pointer = (int)CSBinaryDataRef::Get32(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v106 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v107 = v106 + 1;
        uint64_t v108 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v107) {
          unint64_t v107 = v108 >> 2;
        }
        else {
          unint64_t v38 = v107;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v106];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v132 = *--v27;
          *--unint64_t v48 = v132;
        }

        goto LABEL_285;
      case 14:
        unint64_t Pointer = CSBinaryDataRef::Get64(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v82 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v83 = v82 + 1;
        uint64_t v84 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v83) {
          unint64_t v83 = v84 >> 2;
        }
        else {
          unint64_t v38 = v83;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v82];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v127 = *--v27;
          *--unint64_t v48 = v127;
        }

        goto LABEL_285;
      case 15:
        unint64_t Pointer = CSBinaryDataRef::Get64(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v73 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v74 = v73 + 1;
        uint64_t v75 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v74) {
          unint64_t v74 = v75 >> 2;
        }
        else {
          unint64_t v38 = v74;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v73];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v125 = *--v27;
          *--unint64_t v48 = v125;
        }

        goto LABEL_285;
      case 16:
        unint64_t Pointer = CSBinaryDataRef::Get_ULEB128(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v79 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v80 = v79 + 1;
        uint64_t v81 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v80) {
          unint64_t v80 = v81 >> 2;
        }
        else {
          unint64_t v38 = v80;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v79];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v126 = *--v27;
          *--unint64_t v48 = v126;
        }

        goto LABEL_285;
      case 17:
        unint64_t Pointer = CSBinaryDataRef::Get_SLEB128(this, &v146);
        __int128 v27 = v148;
        __n128 v34 = (unint64_t *)__p;
        uint64_t v67 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v68 = v67 + 1;
        uint64_t v69 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v68) {
          unint64_t v68 = v69 >> 2;
        }
        else {
          unint64_t v38 = v68;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v67];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v124 = *--v27;
          *--unint64_t v48 = v124;
        }

        goto LABEL_285;
      case 18:
        if (__p == v148)
        {
          __int128 v25 = "Stack empty for DW_OP_dup";
          goto LABEL_297;
        }

        uint64_t v78 = v148 - 1;
        goto LABEL_187;
      case 19:
        if (__p == v148)
        {
          __int128 v25 = "Stack empty for DW_OP_drop";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        --v148;
        goto LABEL_289;
      case 20:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_over";
          goto LABEL_297;
        }

        uint64_t v78 = v148 - 2;
LABEL_187:
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, v78);
        goto LABEL_237;
      case 21:
        unsigned int v62 = CSBinaryDataRef::Get8(this, &v146);
        if (v62 >= (unint64_t)(((char *)v148 - (_BYTE *)__p) >> 3))
        {
          __int128 v25 = "Index out of range for DW_OP_pick";
          goto LABEL_297;
        }

        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, (void *)__p + v62);
LABEL_237:
        unint64_t v22 = 0LL;
        goto LABEL_289;
      case 22:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_swap";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v70 = *(v148 - 1);
        __int128 v71 = v148;
        *(v148 - 1) = *(v148 - 2);
        *(v71 - 2) = v70;
        goto LABEL_289;
      case 23:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x18)
        {
          __int128 v25 = "Stack size less than 3 elements for DW_OP_rot";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v76 = v148;
        unint64_t v77 = *(v148 - 1);
        *((_OWORD *)v148 - 1) = *(_OWORD *)(v148 - 3);
        *(v76 - 3) = v77;
        goto LABEL_289;
      case 24:
        __int128 v25 = "error: UNIMPLEMENTED opcode DW_OP_xderef";
        goto LABEL_297;
      case 25:
        __int128 v57 = v148;
        if (__p == v148)
        {
          __int128 v25 = "Stack empty for DW_OP_abs";
          goto LABEL_297;
        }

        uint64_t v64 = *(v148 - 1);
        if ((v64 & 0x8000000000000000LL) == 0) {
          goto LABEL_237;
        }
        unint64_t v22 = 0LL;
LABEL_182:
        uint64_t v59 = -v64;
        goto LABEL_233;
      case 26:
        unint64_t v22 = 0LL;
        uint64_t v72 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) & v72;
        goto LABEL_233;
      case 27:
        int64_t v65 = v148;
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
LABEL_305:
          __int128 v25 = "Stack size less than 2 elements for DW_OP_and";
          goto LABEL_297;
        }

        unint64_t v66 = *(v148 - 1);
        if (!v66)
        {
          __int128 v25 = "DW_OP_div divide by zero";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        --v148;
        *(v65 - 2) /= v66;
        goto LABEL_289;
      case 28:
        unint64_t v22 = 0LL;
        uint64_t v105 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) - v105;
        goto LABEL_233;
      case 29:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_mod";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v60 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) % v60;
        goto LABEL_233;
      case 30:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
LABEL_304:
          __int128 v25 = "Stack size less than 2 elements for DW_OP_minus";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v117 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) * v117;
        goto LABEL_233;
      case 31:
        __int128 v57 = v148;
        if (__p == v148)
        {
          __int128 v25 = "Stack empty for DW_OP_neg";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v64 = *(v148 - 1);
        goto LABEL_182;
      case 32:
        __int128 v57 = v148;
        if (__p == v148)
        {
          __int128 v25 = "Stack empty for DW_OP_not";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v59 = ~*(v148 - 1);
        goto LABEL_233;
      case 33:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_or";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v85 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) | v85;
        goto LABEL_233;
      case 34:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_plus";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v94 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) + v94;
        goto LABEL_233;
      case 35:
        if (__p == v148)
        {
          __int128 v25 = "Stack empty for DW_OP_plus_uconst";
          goto LABEL_297;
        }

        uint64_t ULEB128 = CSBinaryDataRef::Get_ULEB128(this, &v146);
        unint64_t v22 = 0LL;
        __int128 v57 = v148;
        uint64_t v59 = *(v148 - 1) + ULEB128;
LABEL_233:
        *(v57 - 1) = v59;
        goto LABEL_289;
      case 36:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_shl";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v118 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) << v118;
        goto LABEL_233;
      case 37:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_shr";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v113 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) >> v113;
        goto LABEL_233;
      case 38:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_shra";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v122 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = (uint64_t)*(v57 - 1) >> v122;
        goto LABEL_233;
      case 39:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_xor";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v112 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) ^ v112;
        goto LABEL_233;
      case 40:
        uint64_t v86 = *--v148;
        __int16 v87 = CSBinaryDataRef::Get16(this, &v146);
        if (!v86) {
          goto LABEL_237;
        }
        uint64_t v88 = v146 + v87;
        __int128 v25 = "DW_OP_bra has invalid opcode offset";
LABEL_226:
        unint64_t v22 = 0LL;
        unsigned int v146 = v88;
        goto LABEL_289;
      case 41:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_eq";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v58 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) == v58;
        goto LABEL_233;
      case 42:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_ge";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v61 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) >= v61;
        goto LABEL_233;
      case 43:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_gt";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v98 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) > v98;
        goto LABEL_233;
      case 44:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_le";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v119 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) <= v119;
        goto LABEL_233;
      case 45:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_lt";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        unint64_t v89 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) < v89;
        goto LABEL_233;
      case 46:
        if ((unint64_t)((char *)v148 - (_BYTE *)__p) < 0x10)
        {
          __int128 v25 = "Stack size less than 2 elements for DW_OP_ne";
          goto LABEL_297;
        }

        unint64_t v22 = 0LL;
        uint64_t v63 = *(v148 - 1);
        __int128 v57 = v148 - 1;
        __int128 v148 = v57;
        uint64_t v59 = *(v57 - 1) != v63;
        goto LABEL_233;
      case 47:
        __int16 v120 = CSBinaryDataRef::Get16(this, &v146);
        uint64_t v88 = v146 + v120;
        __int128 v25 = "DW_OP_skip has invalid opcode offset";
        goto LABEL_226;
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
        unint64_t Pointer = (v24 - 48);
        __int128 v27 = v148;
        if (v148 < (unint64_t *)v149)
        {
LABEL_13:
          *__int128 v27 = Pointer;
          __int128 v28 = v27 + 1;
          goto LABEL_22;
        }

        __n128 v34 = (unint64_t *)__p;
        uint64_t v35 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v36 = v35 + 1;
        uint64_t v37 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v36) {
          unint64_t v36 = v37 >> 2;
        }
        else {
          unint64_t v38 = v36;
        }
        if (v38)
        {
          char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
          __n128 v34 = (unint64_t *)__p;
          __int128 v27 = v148;
        }

        else
        {
          char v39 = 0LL;
        }

        unint64_t v48 = (unint64_t *)&v39[8 * v35];
        *unint64_t v48 = Pointer;
        uint64_t v33 = v48 + 1;
        while (v27 != v34)
        {
          unint64_t v49 = *--v27;
          *--unint64_t v48 = v49;
        }

        goto LABEL_285;
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
        if (!a2)
        {
          __int128 v25 = "DW_OP_reg: No read register callback provided";
          goto LABEL_297;
        }

        __int128 v25 = (const char *)a2(a3, (v24 - 80), v141);
        if (v25) {
          goto LABEL_297;
        }
        __int128 v32 = v148;
        if (v148 >= (unint64_t *)v149)
        {
          __n128 v34 = (unint64_t *)__p;
          uint64_t v40 = ((char *)v148 - (_BYTE *)__p) >> 3;
          unint64_t v41 = v40 + 1;
          uint64_t v42 = v149 - (_BYTE *)__p;
          if ((v149 - (_BYTE *)__p) >> 2 > v41) {
            unint64_t v41 = v42 >> 2;
          }
          else {
            unint64_t v38 = v41;
          }
          if (v38)
          {
            char v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v38);
            __n128 v34 = (unint64_t *)__p;
            __int128 v32 = v148;
          }

          else
          {
            char v39 = 0LL;
          }

          unint64_t v48 = (unint64_t *)&v39[8 * v40];
          *unint64_t v48 = v145;
          uint64_t v33 = v48 + 1;
          while (v32 != v34)
          {
            unint64_t v50 = *--v32;
            *--unint64_t v48 = v50;
          }

LABEL_285:
          uint64_t v53 = &v39[8 * v38];
          __n128 __p = v48;
LABEL_286:
          __int128 v148 = v33;
          uint64_t v149 = v53;
          if (v34) {
            operator delete(v34);
          }
        }

        else
        {
          *__int128 v148 = v145;
          __int128 v28 = v32 + 1;
LABEL_22:
          uint64_t v33 = v28;
        }

        unint64_t v22 = 0LL;
        __int128 v148 = v33;
        goto LABEL_289;
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
        if (!a2)
        {
          __int128 v25 = "DW_OP_breg: No read register callback provided";
          goto LABEL_297;
        }

        __int128 v25 = (const char *)a2(a3, (v24 - 112), v141);
        if (v25) {
          goto LABEL_297;
        }
        uint64_t SLEB128 = CSBinaryDataRef::Get_SLEB128(this, &v146);
        unint64_t v30 = v145 + SLEB128;
        v145 += SLEB128;
        __int128 v31 = v148;
        if (v148 < (unint64_t *)v149)
        {
          *__int128 v148 = v30;
          __int128 v28 = v31 + 1;
          goto LABEL_22;
        }

        __n128 v34 = (unint64_t *)__p;
        uint64_t v43 = ((char *)v148 - (_BYTE *)__p) >> 3;
        unint64_t v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 61) {
LABEL_347:
        }
          std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
        uint64_t v45 = v149 - (_BYTE *)__p;
        if ((v149 - (_BYTE *)__p) >> 2 > v44) {
          unint64_t v44 = v45 >> 2;
        }
        else {
          unint64_t v46 = v44;
        }
        if (v46)
        {
          unint64_t v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v149, v46);
          __n128 v34 = (unint64_t *)__p;
          __int128 v31 = v148;
          unint64_t v30 = v145;
        }

        else
        {
          unint64_t v47 = 0LL;
        }

        unint64_t v51 = &v47[8 * v43];
        *(void *)unint64_t v51 = v30;
        uint64_t v33 = (unint64_t *)(v51 + 8);
        while (v31 != v34)
        {
          uint64_t v52 = *--v31;
          *((void *)v51 - 1) = v52;
          v51 -= 8;
        }

        uint64_t v53 = &v47[8 * v46];
        __n128 __p = v51;
        goto LABEL_286;
      case 144:
        if (!a2)
        {
          __int128 v25 = "DW_OP_regx: No read register callback provided";
          goto LABEL_297;
        }

        uint64_t v123 = CSBinaryDataRef::Get_ULEB128(this, &v146);
        __int128 v25 = (const char *)a2(a3, v123, v141);
        if (v25) {
          goto LABEL_297;
        }
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, &v145);
        goto LABEL_237;
      case 145:
        __int128 v25 = "DW_OP_fbreg is not implemented";
        goto LABEL_297;
      case 146:
        if (!a2)
        {
          __int128 v25 = "DW_OP_bregx: No read register callback provided";
          goto LABEL_297;
        }

        uint64_t v54 = CSBinaryDataRef::Get_ULEB128(this, &v146);
        __int128 v25 = (const char *)a2(a3, v54, v141);
        if (v25) {
          goto LABEL_297;
        }
        uint64_t v55 = CSBinaryDataRef::Get_SLEB128(this, &v146);
        v145 += v55;
        std::vector<unsigned long long>::push_back[abi:ne180100]((uint64_t)&__p, &v145);
        goto LABEL_237;
      case 147:
        __int128 v25 = "DW_OP_piece is not implemented.";
        goto LABEL_297;
      case 148:
        if (__p != v148 && a1)
        {
          unsigned int v56 = CSBinaryDataRef::Get8(this, &v146);
          if (v56 <= *((unsigned __int8 *)this + 17))
          {
            uint64_t v142 = v56;
            v141[0] = 7;
            uint64_t v93 = a1(a3, *(v148 - 1), v141);
LABEL_239:
            __int128 v25 = (const char *)v93;
            if (v93) {
              goto LABEL_297;
            }
            unint64_t v22 = 0LL;
            *(v148 - 1) = v145;
          }

          else
          {
            unint64_t v22 = "error: DW_OP_deref_size attempted to dereference a value with a size larger than a target address.";
          }

LABEL_289:
          uint64_t v19 = v146;
          unint64_t v135 = *((void *)this + 1);
          continue;
        }

        __int128 v138 = "DW_OP_deref_size: No read memory callback provided";
        __int128 v139 = "Stack empty for DW_OP_deref_size";
        BOOL v140 = __p == v148;
LABEL_330:
        if (v140) {
          __int128 v25 = v139;
        }
        else {
          __int128 v25 = v138;
        }
LABEL_297:
        unint64_t v9 = (unint64_t *)__p;
        if (__p)
        {
LABEL_298:
          __int128 v148 = v9;
          operator delete(v9);
        }

        return v25;
      case 149:
        goto LABEL_297;
      case 150:
        goto LABEL_289;
      case 151:
        __int128 v25 = "DW_OP_push_object_address is not implemented.";
        goto LABEL_297;
      case 152:
        __int128 v25 = "DW_OP_call2 is not implemented.";
        goto LABEL_297;
      case 153:
        __int128 v25 = "DW_OP_call4 is not implemented.";
        goto LABEL_297;
      case 154:
        __int128 v25 = "DW_OP_call_ref is not implemented.";
        goto LABEL_297;
      case 157:
        __int128 v25 = "DW_OP_bit_piece is not implemented.";
        goto LABEL_297;
      case 240:
        __int128 v25 = "Value is not initialized";
        goto LABEL_297;
      default:
        __int128 v25 = "Unknown DWARF DW_OP value.";
        goto LABEL_297;
    }
  }

void sub_18608CD34( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned long long>::push_back[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  BOOL v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    unint64_t v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v12);
      unint64_t v8 = *(void **)a1;
      BOOL v6 = *(void **)(a1 + 8);
    }

    else
    {
      unint64_t v13 = 0LL;
    }

    float v14 = &v13[8 * v9];
    float v15 = &v13[8 * v12];
    *(void *)float v14 = *a2;
    unint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }

    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }

  else
  {
    void *v6 = *a2;
    unint64_t v7 = v6 + 1;
  }

  *(void *)(a1 + 8) = v7;
}

void SymbolicationSession::SymbolicationSession(SymbolicationSession *this, int a2)
{
  *((_DWORD *)this + 2) = 1;
  *(void *)this = off_189DFABC8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((void *)this + 13) = 0LL;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((void *)this + 21) = 0LL;
  *((_DWORD *)this + 44) = 1065353216;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 54) = 1065353216;
  *((void *)this + 28) = 0LL;
  *((void *)this + 29) = 0LL;
  *((void *)this + 30) = 0LL;
  uint64_t v4 = (char *)operator new(0x80uLL);
  *(void *)uint64_t v4 = this;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *((_DWORD *)v4 + 10) = 1065353216;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_DWORD *)v4 + 20) = 1065353216;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *((_DWORD *)v4 + 30) = 1065353216;
  *((void *)this + 31) = v4;
  *((_DWORD *)this + 64) = a2;
  *((void *)this + 33) = 0LL;
}

void sub_18608CFB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void SymbolicationSession::~SymbolicationSession(SymbolicationSession *this)
{
  *(void *)this = off_189DFABC8;
  for (i = (void *)*((void *)this + 25); i; i = (void *)*i)
  {
    uint64_t v3 = (unsigned int **)i[3];
    uint64_t v4 = (unsigned int **)i[4];
    while (v3 != v4)
      CSCppReferenceCount::release(*v3++, 1);
  }

  unint64_t v5 = (void *)*((void *)this + 31);
  *((void *)this + 31) = 0LL;
  if (v5) {
    std::default_delete<EventAggregator>::operator()[abi:ne180100]((uint64_t)this + 248, v5);
  }
  BOOL v6 = (void **)((char *)this + 224);
  std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__destroy_vector::operator()[abi:ne180100](&v6);
  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table((uint64_t)this + 184);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)this + 144);
  BOOL v6 = (void **)((char *)this + 120);
  std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__destroy_vector::operator()[abi:ne180100](&v6);
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)this + 80);
  BOOL v6 = (void **)((char *)this + 56);
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v6);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)this + 16);
}

{
  void *v1;
  SymbolicationSession::~SymbolicationSession(this);
  operator delete(v1);
}

unint64_t SymbolicationSession::register_library(SymbolicationSession *this, LibraryDescription *a2)
{
  unint64_t v4 = *((void *)this + 8);
  if (v4 >= *((void *)this + 9))
  {
    uint64_t v5 = std::vector<LibraryDescription>::__push_back_slow_path<LibraryDescription const&>( (uint64_t *)this + 7,  (__int128 *)a2);
  }

  else
  {
    std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>( *((void *)this + 8),  (__int128 *)a2);
    uint64_t v5 = v4 + 96;
    *((void *)this + 8) = v4 + 96;
  }

  *((void *)this + 8) = v5;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *((void *)this + 7)) >> 5) - 1;
  unint64_t v8 = a2;
  std::__hash_table<std::__hash_value_type<UUID,unsigned long>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,unsigned long>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>( (uint64_t)this + 80,  a2,  (uint64_t)&std::piecewise_construct,  &v8)[4] = v6;
  return v6;
}

void sub_18608D1A8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 64) = v2;
  _Unwind_Resume(a1);
}

void LibraryDescription::~LibraryDescription(LibraryDescription *this)
{
  uint64_t v2 = (void *)*((void *)this + 8);
  if (v2)
  {
    *((void *)this + 9) = v2;
    operator delete(v2);
  }

  if (*((_BYTE *)this + 48))
  {
  }

unint64_t SymbolicationSession::lookup_or_register_process(SymbolicationSession *this, int a2)
{
  int v36 = a2;
  uint64_t v3 = (char *)this + 144;
  unint64_t v4 = std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>( (void *)this + 18,  &v36);
  if (v4) {
    return v4[3];
  }
  unint64_t v6 = *((void *)this + 30);
  unint64_t v7 = (void *)*((void *)this + 29);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = *((void *)this + 28);
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - v9) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v9) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555LL) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    unint64_t v41 = (char *)this + 240;
    if (v13) {
      float v14 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>((uint64_t)this + 240, v13);
    }
    else {
      float v14 = 0LL;
    }
    float v15 = &v14[6 * v10];
    uint64_t v37 = v14;
    unint64_t v38 = v15;
    uint64_t v40 = &v14[6 * v13];
    *(void *)float v15 = 0LL;
    *((void *)v15 + 1) = 0LL;
    *((void *)v15 + 2) = 0LL;
    char v39 = v15 + 6;
    std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__swap_out_circular_buffer((uint64_t *)this + 28, &v37);
    unint64_t v8 = (void *)*((void *)this + 29);
    std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::~__split_buffer((void **)&v37);
  }

  else
  {
    *unint64_t v7 = 0LL;
    v7[1] = 0LL;
    v7[2] = 0LL;
    unint64_t v8 = v7 + 3;
    *((void *)this + 29) = v7 + 3;
  }

  *((void *)this + 29) = v8;
  uint64_t v16 = *((void *)this + 28);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v16) >> 3) - 1;
  if ((*((_BYTE *)this + 256) & 1) != 0)
  {
    uint64_t v17 = (char **)(v16 + 24 * v5);
    unint64_t v18 = (int **)(v17 + 1);
    uint64_t v19 = v17[1];
    uint64_t v21 = v17 + 2;
    unint64_t v20 = (unint64_t)v17[2];
    if ((unint64_t)v19 >= v20)
    {
      uint64_t v23 = (v19 - *v17) >> 3;
      uint64_t v24 = v20 - (void)*v17;
      uint64_t v25 = v24 >> 2;
      else {
        unint64_t v26 = v25;
      }
      unint64_t v41 = (char *)(v17 + 2);
      if (v26) {
        __int128 v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v21, v26);
      }
      else {
        __int128 v27 = 0LL;
      }
      __int128 v28 = &v27[8 * v23];
      __int128 v29 = &v27[8 * v26];
      uint64_t v40 = (int *)v29;
      *(void *)__int128 v28 = 0LL;
      unint64_t v22 = (int *)(v28 + 8);
      char v39 = (int *)(v28 + 8);
      unint64_t v30 = *v18;
      __int128 v31 = (int *)*v17;
      if (*v18 == (int *)*v17)
      {
        uint64_t v33 = *v18;
      }

      else
      {
        do
        {
          uint64_t v32 = *((void *)v30 - 1);
          v30 -= 2;
          *(void *)unint64_t v30 = 0LL;
          *((void *)v28 - 1) = v32;
          v28 -= 8;
        }

        while (v30 != v31);
        uint64_t v33 = (int *)*v17;
        unint64_t v30 = *v18;
        unint64_t v22 = v39;
        __int128 v29 = (char *)v40;
      }

      *uint64_t v17 = v28;
      unint64_t v38 = v33;
      *unint64_t v18 = v22;
      char v39 = v30;
      __n128 v34 = (int *)*v21;
      void *v21 = v29;
      uint64_t v40 = v34;
      uint64_t v37 = v33;
      std::__split_buffer<std::unique_ptr<AS::Operator>>::~__split_buffer((uint64_t)&v37);
    }

    else
    {
      *(void *)uint64_t v19 = 0LL;
      unint64_t v22 = (int *)(v19 + 8);
    }

    *unint64_t v18 = v22;
  }

  uint64_t v37 = &v36;
  std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>( (uint64_t)v3,  &v36,  (uint64_t)&std::piecewise_construct,  &v37)[3] = v5;
  return v5;
}

void sub_18608D47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void *SymbolicationSession::add_operator(SymbolicationSession *this, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = (char **)(*((void *)this + 28) + 24 * a2);
  unint64_t v7 = v6 + 1;
  unint64_t v8 = v6[1];
  unint64_t v10 = v6 + 2;
  unint64_t v9 = (unint64_t)v6[2];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v13 = (v8 - *v6) >> 3;
    uint64_t v14 = v9 - (void)*v6;
    uint64_t v15 = v14 >> 2;
    else {
      unint64_t v16 = v15;
    }
    unint64_t v30 = v6 + 2;
    if (v16) {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v10, v16);
    }
    else {
      uint64_t v17 = 0LL;
    }
    unint64_t v18 = &v17[8 * v13];
    uint64_t v19 = &v17[8 * v16];
    __int128 v29 = v19;
    uint64_t v20 = *a3;
    *a3 = 0LL;
    *(void *)unint64_t v18 = v20;
    unint64_t v12 = v18 + 8;
    __int128 v28 = v18 + 8;
    uint64_t v21 = *v7;
    unint64_t v22 = *v6;
    if (*v7 == *v6)
    {
      uint64_t v24 = *v7;
    }

    else
    {
      do
      {
        uint64_t v23 = *((void *)v21 - 1);
        v21 -= 8;
        *(void *)uint64_t v21 = 0LL;
        *((void *)v18 - 1) = v23;
        v18 -= 8;
      }

      while (v21 != v22);
      uint64_t v24 = *v6;
      uint64_t v21 = *v7;
      unint64_t v12 = v28;
      uint64_t v19 = v29;
    }

    void *v6 = v18;
    v27[1] = v24;
    *unint64_t v7 = v12;
    __int128 v28 = v21;
    uint64_t v25 = *v10;
    *unint64_t v10 = v19;
    __int128 v29 = v25;
    v27[0] = v24;
    std::__split_buffer<std::unique_ptr<AS::Operator>>::~__split_buffer((uint64_t)v27);
  }

  else
  {
    uint64_t v11 = *a3;
    *a3 = 0LL;
    *(void *)unint64_t v8 = v11;
    unint64_t v12 = v8 + 8;
  }

  *unint64_t v7 = v12;
  return SymbolicationSession::advance_managed_symbolicators(this, a2);
}

uint64_t SymbolicationSession::process_ats_dsc_and_pid_chunks( SymbolicationSession *this, const __CFData *a2, const __CFData *a3)
{
  uint64_t v5 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke;
  v8[3] = &__block_descriptor_tmp_16_1;
  v8[4] = this;
  _CSSymbolicatorForeachRawFlatbufferSymbolicatorInSignature<__CFData const*>(a2, 0, (uint64_t)v8);
  v7[0] = v5;
  v7[1] = 0x40000000LL;
  v7[2] = ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke_2;
  v7[3] = &__block_descriptor_tmp_17_1;
  v7[4] = this;
  return _CSSymbolicatorForeachRawFlatbufferSymbolicatorInSignature<__CFData const*>(a3, 0, (uint64_t)v7);
}

void ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke( uint64_t a1, FlatbufferSymbols::Symbolicator *this)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (unsigned __int16 *)((char *)this - *(int *)this);
  if (*v2 >= 9u && (uint64_t v3 = v2[4]) != 0) {
    unint64_t v4 = (unsigned int *)((char *)this + v3 + *(unsigned int *)((char *)this + v3));
  }
  else {
    unint64_t v4 = 0LL;
  }
  uint64_t v5 = *(uint64_t **)(a1 + 32);
  unint64_t v6 = (int *)FlatbufferSymbols::Symbolicator::metadata_as_DyldSharedCacheMetadata(this);
  unint64_t v7 = (unsigned __int16 *)((char *)v6 - *v6);
  if (*v7 < 5u)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = v7[2];
    if (v8) {
      v8 += (uint64_t)v6 + *(unsigned int *)((char *)v6 + v8);
    }
  }

  CSUUIDStringToCFUUIDBytes(v8 + 4, &v23);
  uint64_t v16 = 0LL;
  unint64_t v17 = 0LL;
  unint64_t v18 = 0LL;
  unsigned int v11 = *v4;
  unint64_t v10 = v4 + 1;
  uint64_t v9 = v11;
  if (v11)
  {
    uint64_t v12 = 4 * v9;
    do
    {
      uint64_t v13 = (FlatbufferSymbols::SymbolOwner *)((char *)v10 + *v10);
      v21[0] = 0;
      v21[16] = 0;
      SymbolicationSession::transform_fbs_owner(v13, (uint64_t)v5, 1, (uint64_t)v21, 0, (uint64_t)v22);
      std::__optional_copy_base<LibraryDescription,false>::__optional_copy_base[abi:ne180100](v19, (uint64_t)v22);
      if (!v20) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      unint64_t v14 = v17;
      if (v17 >= v18)
      {
        uint64_t v15 = std::vector<LibraryDescription>::__push_back_slow_path<LibraryDescription const&>(&v16, v19);
      }

      else
      {
        std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>(v17, v19);
        uint64_t v15 = v14 + 96;
      }

      unint64_t v17 = v15;
      std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v19);
      std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v22);
      ++v10;
      v12 -= 4LL;
    }

    while (v12);
  }

  SymbolicationSession::register_dsc(v5, &v23, &v16);
  v22[0] = (void **)&v16;
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](v22);
}

void sub_18608D830( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void **a29)
{
  a29 = (void **)&a10;
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&a29);
  _Unwind_Resume(a1);
}

void SymbolicationSession::transform_fbs_owner( FlatbufferSymbols::SymbolOwner *this@<X1>, uint64_t a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (const char *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(this);
  uint64_t v13 = v12;
  unint64_t v14 = &v12[-*(int *)v12];
  if (*(unsigned __int16 *)v14 < 5u)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = *((unsigned __int16 *)v14 + 2);
    if (v15) {
      v15 += (uint64_t)&v12[*(unsigned int *)&v12[v15]];
    }
  }

  CSUUIDStringToCFUUIDBytes(v15 + 4, &v108);
  if ((a3 & 1) == 0)
  {
    uint64_t v16 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::find<UUID>( (void *)(a2 + 80),  &v108);
    if (v16)
    {
      uint64_t v17 = v16[4];
      *(_BYTE *)a6 = 0;
      *(_BYTE *)(a6 + 96) = 0;
      *(void *)(a6 + 104) = v17;
      *(void *)(a6 + 112) = 1LL;
      return;
    }
  }

  int v83 = a5;
  uint64_t v81 = a4;
  uint64_t v82 = this;
  char v80 = a3;
  uint64_t v84 = a2;
  uint64_t v79 = a6;
  unint64_t v18 = (unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - *(int *)this + 8));
  uint64_t v19 = *v18;
  __int16 v87 = 0LL;
  uint64_t v88 = 0LL;
  unint64_t v89 = 0LL;
  uint64_t v21 = (unsigned int *)((char *)v18 + v19 + 4);
  uint64_t v20 = *(unsigned int *)((char *)v18 + v19);
  if ((_DWORD)v20)
  {
    unint64_t v22 = 0LL;
    __int128 v23 = &v21[v20];
    do
    {
      uint64_t v24 = (char *)v21 + *v21;
      uint64_t v25 = (unsigned __int16 *)&v24[-*(int *)v24];
      unsigned int v26 = *v25;
      if (v26 >= 5)
      {
        uint64_t v27 = v25[2];
        if (v25[2])
        {
          __int128 v28 = &v24[v27];
          if (!strstr(&v24[v27 + 4 + *(unsigned int *)&v24[v27]], "__LINKINFO"))
          {
            if (v26 < 7)
            {
              uint64_t v30 = 0LL;
              uint64_t v29 = -1LL;
            }

            else
            {
              if (v25[3]) {
                uint64_t v29 = *(void *)&v24[v25[3]];
              }
              else {
                uint64_t v29 = -1LL;
              }
              if (v26 >= 9 && v25[4]) {
                uint64_t v30 = *(void *)&v24[v25[4]];
              }
              else {
                uint64_t v30 = 0LL;
              }
            }

            __int128 v31 = (CSCppNamedRange *)&v28[*(unsigned int *)v28 + 4];
            if ((unint64_t)v22 >= v89)
            {
              uint64_t v32 = (v22 - (CSCppSegmentRange *)v87) >> 5;
              unint64_t v33 = (uint64_t)(v89 - (void)v87) >> 4;
              if (v33 <= v32 + 1) {
                unint64_t v33 = v32 + 1;
              }
              else {
                unint64_t v34 = v33;
              }
              if (v34)
              {
                uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>( (uint64_t)&v89,  v34);
                uint64_t v37 = v36;
              }

              else
              {
                uint64_t v35 = 0LL;
                uint64_t v37 = 0LL;
              }

              CSCppSegmentRange::CSCppSegmentRange((CSCppSegmentRange *)&v35[32 * v32], v29, v30, v31, 0);
              uint64_t v40 = (CSCppSegmentRange *)v87;
              char v39 = v88;
              unint64_t v41 = v38;
              if (v88 != v87)
              {
                do
                {
                  __int128 v42 = *((_OWORD *)v39 - 1);
                  *((_OWORD *)v41 - 2) = *((_OWORD *)v39 - 2);
                  *((_OWORD *)v41 - 1) = v42;
                  v41 -= 32;
                  char v39 = (CSCppSegmentRange *)((char *)v39 - 32);
                }

                while (v39 != v40);
                char v39 = v40;
              }

              uint64_t v43 = &v35[32 * v37];
              unint64_t v22 = (CSCppSegmentRange *)(v38 + 32);
              __int16 v87 = v41;
              uint64_t v88 = (CSCppSegmentRange *)(v38 + 32);
              unint64_t v89 = (unint64_t)v43;
              if (v39) {
                operator delete(v39);
              }
            }

            else
            {
              CSCppSegmentRange::CSCppSegmentRange(v22, v29, v30, (CSCppNamedRange *)&v28[*(unsigned int *)v28 + 4], 0);
              unint64_t v22 = (CSCppSegmentRange *)((char *)v22 + 32);
            }

            uint64_t v88 = v22;
          }
        }
      }

      ++v21;
    }

    while (v21 != v23);
  }

  unint64_t v44 = (unsigned __int16 *)&v13[-*(int *)v13];
  unsigned int v45 = *v44;
  unint64_t v46 = "<unknown>";
  if (v45 >= 7)
  {
    uint64_t v47 = v44[3];
    if (v44[3]) {
      v47 += (uint64_t)&v13[*(unsigned int *)&v13[v47]];
    }
    if (v45 < 0x13)
    {
      if (v45 < 0x11)
      {
        if (!v47)
        {
          uint64_t v49 = 0LL;
LABEL_56:
          if (v49) {
            unint64_t v46 = (char *)(v49 + 4);
          }
          goto LABEL_58;
        }

LABEL_58:
  unint64_t v50 = CSCppStringCache::intern((CSCppStringCache *)(v84 + 16), v46);
  uint64_t v51 = *(int *)v13;
  if (*(unsigned __int16 *)&v13[-v51] >= 0x17u
    && (uint64_t v52 = *(unsigned __int16 *)&v13[-v51 + 22], *(_WORD *)&v13[-v51 + 22]))
  {
    uint64_t v53 = &v13[v52];
    uint64_t v54 = *(unsigned int *)&v13[v52];
    v85.__r_.__value_.__s.__data_[0] = 0;
    char v86 = 0;
    *(void *)&__int128 v90 = &v53[v54 + 4];
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>(&v85, (std::string::value_type **)&v90);
    uint64_t v55 = -(uint64_t)*(int *)v13;
  }

  else
  {
    uint64_t v55 = -v51;
    v85.__r_.__value_.__s.__data_[0] = 0;
    char v86 = 0;
  }

  unsigned int v56 = &v13[v55];
  unsigned int v57 = *(unsigned __int16 *)v56;
  if (v57 < 0xD)
  {
LABEL_73:
    unsigned int v66 = 0;
    unint64_t v67 = 0LL;
    goto LABEL_77;
  }

  if (!*((_WORD *)v56 + 6))
  {
    if (v57 >= 0xF)
    {
      uint64_t v64 = *((unsigned __int16 *)v56 + 7);
      if (v64)
      {
        unint64_t ArchitectureForName = CSArchitectureGetArchitectureForName(&v13[v64 + 4 + *(unsigned int *)&v13[v64]]);
        unsigned int v66 = ArchitectureForName;
        unint64_t v67 = ArchitectureForName & 0xFFFFFFFF00000000LL;
        goto LABEL_77;
      }
    }

    goto LABEL_73;
  }

  uint64_t v58 = &v13[*((unsigned __int16 *)v56 + 6) + *(unsigned int *)&v13[*((unsigned __int16 *)v56 + 6)]];
  uint64_t v59 = &v58[-*(int *)v58];
  unsigned int v60 = *(unsigned __int16 *)v59;
  if (v60 < 7)
  {
    LODWORD(v61) = 0;
LABEL_75:
    uint64_t v63 = 0LL;
    goto LABEL_76;
  }

  uint64_t v61 = *((unsigned __int16 *)v59 + 3);
  if (*((_WORD *)v59 + 3)) {
    LODWORD(v61) = *(_DWORD *)&v58[v61];
  }
  if (v60 < 9) {
    goto LABEL_75;
  }
  uint64_t v62 = *((unsigned __int16 *)v59 + 4);
  if (!v62) {
    goto LABEL_75;
  }
  uint64_t v63 = *(unsigned int *)&v58[v62];
LABEL_76:
  unint64_t v67 = v63 << 32;
  unsigned int v66 = v61;
LABEL_77:
  int v68 = v83 | 1;
  uint64_t v69 = (unsigned __int16 *)((char *)v82 - *(int *)v82);
  if (*v69 >= 0xFu)
  {
    uint64_t v70 = v69[7];
    if (v70)
    {
      if (*((_BYTE *)v82 + v70)) {
        int v68 = v83 | 0x201;
      }
    }
  }

  if (*(_BYTE *)(v81 + 16) && *(_OWORD *)v81 == v108) {
    v68 |= 0x10u;
  }
  __int128 v99 = v108;
  unint64_t v100 = v50;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v101, (__int128 *)&v85);
  unint64_t v103 = v67 | v66;
  uint64_t v104 = 0LL;
  uint64_t v105 = 0LL;
  uint64_t v106 = 0LL;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>( &v104,  v87,  (uint64_t)v88,  (v88 - (CSCppSegmentRange *)v87) >> 5);
  int v107 = v68;
  if ((v80 & 1) != 0)
  {
    std::pair<LibraryDescription,std::nullopt_t>::pair[abi:ne180100]<LibraryDescription&,std::nullopt_t const&,0>( (uint64_t)&v90,  &v99);
    *(_OWORD *)uint64_t v79 = v90;
    *(void *)(v79 + 16) = v91;
    *(_BYTE *)(v79 + 24) = 0;
    *(_BYTE *)(v79 + 48) = 0;
    int v71 = v94;
    if (v94)
    {
      *(_OWORD *)(v79 + 24) = *(_OWORD *)__p;
      *(void *)(v79 + 40) = v93;
      __p[1] = 0LL;
      uint64_t v93 = 0LL;
      __p[0] = 0LL;
      *(_BYTE *)(v79 + 48) = 1;
    }

    *(void *)(v79 + 56) = v95;
    *(_OWORD *)(v79 + 64) = v96;
    *(void *)(v79 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v97;
    __int128 v96 = 0uLL;
    uint64_t v97 = 0LL;
    *(_DWORD *)(v79 + 88) = v98;
    *(_BYTE *)(v79 + 96) = 1;
    *(_BYTE *)(v79 + 104) = 0;
    *(_BYTE *)(v79 + 112) = 0;
    if (v71 && SHIBYTE(v93) < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    uint64_t v72 = (unsigned __int16 *)((char *)v82 - *(int *)v82);
    if (*v72 >= 0xBu && (uint64_t v73 = v72[5]) != 0) {
      uint64_t v74 = *(void *)((char *)v82 + v73);
    }
    else {
      uint64_t v74 = -1LL;
    }
    uint64_t v75 = v104;
    for (i = v105; v75 != i; v75 += 4)
    {
      if (!strcmp(v75[2], "__PAGEZERO")) {
        uint64_t v77 = 0LL;
      }
      else {
        uint64_t v77 = (uint64_t)&(*v75)[-v74];
      }
      *uint64_t v75 = (const char *)v77;
    }

    unint64_t v78 = SymbolicationSession::register_library((SymbolicationSession *)v84, (LibraryDescription *)&v99);
    *(_BYTE *)uint64_t v79 = 0;
    *(_BYTE *)(v79 + 96) = 0;
    *(void *)(v79 + 104) = v78;
    *(_BYTE *)(v79 + 112) = 1;
  }

  if (v104)
  {
    uint64_t v105 = v104;
    operator delete(v104);
  }

  if (v87)
  {
    uint64_t v88 = (CSCppSegmentRange *)v87;
    operator delete(v87);
  }

void sub_18608DF54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22, char a23, void *a24, uint64_t a25)
{
  if (a23 && a22 < 0) {
    operator delete(__p);
  }
  if (a24) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SymbolicationSession::register_dsc(uint64_t *a1, _OWORD *a2, uint64_t *a3)
{
  unint64_t v4 = a1 + 15;
  unint64_t v5 = a1[16];
  if (v5 >= a1[17])
  {
    uint64_t result = std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__emplace_back_slow_path<UUID const&,std::vector<LibraryDescription> const&>( v4,  a2,  a3);
  }

  else
  {
    std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__construct_one_at_end[abi:ne180100]<UUID const&,std::vector<LibraryDescription> const&>( (uint64_t)v4,  a2,  a3);
    uint64_t result = v5 + 40;
  }

  a1[16] = result;
  return result;
}

void ___ZN20SymbolicationSession30process_ats_dsc_and_pid_chunksEPK8__CFDataS2__block_invoke_2( uint64_t a1, FlatbufferSymbols::Symbolicator *a2)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(SymbolicationSession **)(a1 + 32);
  PrimarySharedCacheInFlatbufferSymbolicator = (FlatbufferSymbols::SymbolOwner *)_findPrimarySharedCacheInFlatbufferSymbolicator(a2);
  if (PrimarySharedCacheInFlatbufferSymbolicator)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)PrimarySharedCacheInFlatbufferSymbolicator
                            - *(int *)PrimarySharedCacheInFlatbufferSymbolicator);
    if (*v5 >= 9u && (uint64_t v6 = v5[4]) != 0) {
      uint64_t v7 = *(void *)((char *)PrimarySharedCacheInFlatbufferSymbolicator + v6);
    }
    else {
      uint64_t v7 = -1LL;
    }
    uint64_t v8 = (int *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(PrimarySharedCacheInFlatbufferSymbolicator);
    uint64_t v9 = v8;
    unint64_t v10 = (unsigned __int16 *)((char *)v8 - *v8);
    if (*v10 < 5u)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      uint64_t v11 = v10[2];
      if (v11) {
        v11 += (uint64_t)v8 + *(unsigned int *)((char *)v8 + v11);
      }
    }

    CSUUIDStringToCFUUIDBytes(v11 + 4, v61);
    uint64_t dsc = SymbolicationSession::find_dsc(v3, (const UUID *)v61);
    if (!v13) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    uint64_t v14 = dsc;
    uint64_t v15 = (unsigned __int16 *)((char *)v9 - *v9);
    if (*v15 >= 0x15u && (uint64_t v16 = v15[10]) != 0) {
      uint64_t v17 = *(void *)((char *)v9 + v16);
    }
    else {
      uint64_t v17 = -1LL;
    }
    unint64_t v18 = (int *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(a2);
    uint64_t v19 = v18;
    uint64_t v20 = (unsigned __int16 *)((char *)v18 - *v18);
    if (*v20 >= 7u && (uint64_t v21 = v20[3]) != 0) {
      uint64_t v22 = *(void *)((char *)v18 + v21);
    }
    else {
      LODWORD(v22) = -1;
    }
    unint64_t v46 = SymbolicationSession::lookup_or_register_process(v3, v22);
    __int128 v23 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v23 >= 0xBu)
    {
      uint64_t v24 = v23[5];
      if (v24) {
        CSUUIDStringToCFUUIDBytes((char *)v19 + v24 + *(unsigned int *)((char *)v19 + v24) + 4, &v60);
      }
    }

    uint64_t v47 = v17;
    uint64_t v48 = v14;
    uint64_t v25 = (unsigned int *)((char *)a2 + *(unsigned __int16 *)((char *)a2 - *(int *)a2 + 8));
    uint64_t v26 = *v25;
    __n128 __p = 0LL;
    uint64_t v51 = 0LL;
    unint64_t v52 = 0LL;
    __int128 v28 = (unsigned int *)((char *)v25 + v26 + 4);
    uint64_t v27 = *(unsigned int *)((char *)v25 + v26);
    if ((_DWORD)v27)
    {
      uint64_t v29 = &v28[v27];
      do
      {
        uint64_t v30 = (FlatbufferSymbols::SymbolOwner *)((char *)v28 + *v28);
        __int128 v53 = v60;
        char v54 = 1;
        SymbolicationSession::transform_fbs_owner(v30, (uint64_t)v3, 0, (uint64_t)&v53, 0, (uint64_t)&v55);
        __int128 v31 = (unsigned __int16 *)((char *)v30 - *(int *)v30);
        if (*v31 >= 0xBu && (uint64_t v32 = v31[5]) != 0) {
          uint64_t v33 = *(void *)((char *)v30 + v32);
        }
        else {
          uint64_t v33 = -1LL;
        }
        if (!v59) {
          std::__throw_bad_optional_access[abi:ne180100]();
        }
        uint64_t v34 = v58;
        uint64_t v35 = v51;
        if ((unint64_t)v51 >= v52)
        {
          uint64_t v37 = __p;
          uint64_t v38 = ((char *)v51 - (_BYTE *)__p) >> 4;
          unint64_t v39 = v38 + 1;
          uint64_t v40 = v52 - (void)__p;
          else {
            unint64_t v41 = v39;
          }
          if (v41)
          {
            __int128 v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)&v52,  v41);
            uint64_t v37 = __p;
            uint64_t v35 = v51;
          }

          else
          {
            __int128 v42 = 0LL;
          }

          uint64_t v43 = &v42[16 * v38];
          *(void *)uint64_t v43 = v34;
          *((void *)v43 + 1) = v33;
          unint64_t v44 = v43;
          if (v35 != v37)
          {
            do
            {
              *((_OWORD *)v44 - 1) = *((_OWORD *)v35 - 1);
              v44 -= 16;
              v35 -= 2;
            }

            while (v35 != v37);
            uint64_t v37 = __p;
          }

          uint64_t v36 = v43 + 16;
          __n128 __p = v44;
          uint64_t v51 = v43 + 16;
          unint64_t v52 = (unint64_t)&v42[16 * v41];
          if (v37) {
            operator delete(v37);
          }
        }

        else
        {
          *uint64_t v51 = v58;
          v35[1] = v33;
          uint64_t v36 = v35 + 2;
        }

        uint64_t v51 = v36;
        std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v55);
        ++v28;
      }

      while (v28 != v29);
    }

    unsigned int v45 = operator new(0x40uLL);
    uint64_t v55 = 0LL;
    unsigned int v56 = 0LL;
    uint64_t v57 = 0LL;
    std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( &v55,  __p,  (uint64_t)v51,  ((char *)v51 - (_BYTE *)__p) >> 4);
    *unsigned int v45 = &off_189DFADA0;
    v45[1] = 0LL;
    v45[2] = v48;
    v45[3] = v7;
    v45[4] = v47 + v7;
    v45[6] = 0LL;
    v45[7] = 0LL;
    v45[5] = 0LL;
    std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( v45 + 5,  v55,  (uint64_t)v56,  (v56 - (_BYTE *)v55) >> 4);
    if (v55)
    {
      unsigned int v56 = v55;
      operator delete(v55);
    }

    uint64_t v49 = v45;
    SymbolicationSession::add_operator(v3, v46, (uint64_t *)&v49);
    if (v49) {
      (*(void (**)(void *))(*v49 + 16LL))(v49);
    }
    if (__p)
    {
      uint64_t v51 = __p;
      operator delete(__p);
    }
  }

void sub_18608E410( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21)
{
  if (a13) {
    (*(void (**)(uint64_t))(*(void *)a13 + 16LL))(a13);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SymbolicationSession::find_dsc(SymbolicationSession *this, const UUID *a2)
{
  uint64_t v2 = (void *)*((void *)this + 15);
  uint64_t v3 = *((void *)this + 16) - (void)v2;
  if (!v3) {
    return 0LL;
  }
  uint64_t result = 0LL;
  unint64_t v5 = v3 / 40;
  if (v5 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  while (*v2 != *(void *)a2 || v2[1] != *(void *)&(*a2)[8])
  {
    ++result;
    v2 += 5;
    if (v6 == result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t SymbolicationSession::process_ats_kernel_chunk(SymbolicationSession *this, const __CFData *a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZN20SymbolicationSession24process_ats_kernel_chunkEPK8__CFData_block_invoke;
  v3[3] = &__block_descriptor_tmp_18_1;
  v3[4] = this;
  return _CSSymbolicatorForeachRawFlatbufferSymbolicatorInSignature<__CFData const*>(a2, 0, (uint64_t)v3);
}

void ___ZN20SymbolicationSession24process_ats_kernel_chunkEPK8__CFData_block_invoke( uint64_t a1, FlatbufferSymbols::SymbolOwner *this)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(SymbolicationSession **)(a1 + 32);
  unint64_t v4 = (int *)FlatbufferSymbols::SymbolOwner::metadata_as_MachoMetadata(this);
  unint64_t v5 = v4;
  uint64_t v6 = (unsigned __int16 *)((char *)v4 - *v4);
  if (*v6 >= 7u && (uint64_t v7 = v6[3]) != 0) {
    uint64_t v8 = *(void *)((char *)v4 + v7);
  }
  else {
    LODWORD(v8) = -1;
  }
  unint64_t v32 = SymbolicationSession::lookup_or_register_process(v3, v8);
  uint64_t v9 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v9 >= 0xBu)
  {
    uint64_t v10 = v9[5];
    if (v10) {
      CSUUIDStringToCFUUIDBytes((char *)v5 + v10 + *(unsigned int *)((char *)v5 + v10) + 4, &v44);
    }
  }

  uint64_t v11 = (unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - *(int *)this + 8));
  uint64_t v12 = *v11;
  __n128 __p = 0LL;
  uint64_t v35 = 0LL;
  unint64_t v36 = 0LL;
  uint64_t v14 = (unsigned int *)((char *)v11 + v12 + 4);
  uint64_t v13 = *(unsigned int *)((char *)v11 + v12);
  if ((_DWORD)v13)
  {
    uint64_t v15 = &v14[v13];
    do
    {
      uint64_t v16 = (FlatbufferSymbols::SymbolOwner *)((char *)v14 + *v14);
      __int128 v37 = v44;
      char v38 = 1;
      SymbolicationSession::transform_fbs_owner(v16, (uint64_t)v3, 0, (uint64_t)&v37, 4096, (uint64_t)&v39);
      uint64_t v17 = (unsigned __int16 *)((char *)v16 - *(int *)v16);
      if (*v17 >= 0xBu && (uint64_t v18 = v17[5]) != 0) {
        uint64_t v19 = *(void *)((char *)v16 + v18);
      }
      else {
        uint64_t v19 = -1LL;
      }
      if (!v43) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      uint64_t v20 = v42;
      uint64_t v21 = v35;
      if ((unint64_t)v35 >= v36)
      {
        __int128 v23 = __p;
        uint64_t v24 = ((char *)v35 - (_BYTE *)__p) >> 4;
        unint64_t v25 = v24 + 1;
        uint64_t v26 = v36 - (void)__p;
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          __int128 v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)&v36,  v27);
          __int128 v23 = __p;
          uint64_t v21 = v35;
        }

        else
        {
          __int128 v28 = 0LL;
        }

        uint64_t v29 = &v28[16 * v24];
        *(void *)uint64_t v29 = v20;
        *((void *)v29 + 1) = v19;
        uint64_t v30 = v29;
        if (v21 != v23)
        {
          do
          {
            *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
            v30 -= 16;
            v21 -= 2;
          }

          while (v21 != v23);
          __int128 v23 = __p;
        }

        uint64_t v22 = v29 + 16;
        __n128 __p = v30;
        uint64_t v35 = v29 + 16;
        unint64_t v36 = (unint64_t)&v28[16 * v27];
        if (v23) {
          operator delete(v23);
        }
      }

      else
      {
        *uint64_t v35 = v42;
        v21[1] = v19;
        uint64_t v22 = v21 + 2;
      }

      uint64_t v35 = v22;
      std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v39);
      ++v14;
    }

    while (v14 != v15);
  }

  __int128 v31 = operator new(0x30uLL);
  unint64_t v39 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( &v39,  __p,  (uint64_t)v35,  ((char *)v35 - (_BYTE *)__p) >> 4);
  v31[2] = 0LL;
  *__int128 v31 = &off_189DFAD48;
  v31[1] = 0LL;
  v31[3] = 0LL;
  v31[4] = 0LL;
  std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( v31 + 2,  v39,  (uint64_t)v40,  (v40 - (_BYTE *)v39) >> 4);
  *((_BYTE *)v31 + 40) = 1;
  if (v39)
  {
    uint64_t v40 = v39;
    operator delete(v39);
  }

  uint64_t v33 = v31;
  SymbolicationSession::add_operator(v3, v32, (uint64_t *)&v33);
  if (v33) {
    (*(void (**)(void *))(*v33 + 16LL))(v33);
  }
  if (__p)
  {
    uint64_t v35 = __p;
    operator delete(__p);
  }

void sub_18608E858( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
}

std::string *std::optional<std::string>::operator=[abi:ne180100]<char const*,void>( std::string *a1, std::string::value_type **a2)
{
  uint64_t v3 = *a2;
  if (a1[1].__r_.__value_.__s.__data_[0])
  {
    std::string::__assign_external(a1, v3);
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, v3);
    a1[1].__r_.__value_.__s.__data_[0] = 1;
  }

  return a1;
}

void *SymbolicationSession::advance_managed_symbolicators(SymbolicationSession *this, unint64_t a2)
{
  unint64_t v10 = a2;
  uint64_t v4 = *((void *)this + 28);
  uint64_t result = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::find<unsigned long long>( (void *)this + 23,  &v10);
  if (result)
  {
    uint64_t v6 = (uint64_t *)result[3];
    uint64_t v7 = (uint64_t *)result[4];
    if (v6 != v7)
    {
      uint64_t v8 = (void *)(v4 + 24 * a2 + 8);
      do
      {
        uint64_t v9 = *v6++;
        uint64_t result = (void *)(***(uint64_t (****)(void, uint64_t, SymbolicationSession *))(*v8 - 8LL))( *(void *)(*v8 - 8LL),  v9,  this);
      }

      while (v6 != v7);
    }
  }

  return result;
}

uint64_t SymbolicationSession::create_pid_symbolicator( SymbolicationSession *this, int a2, int a3, uint64_t a4)
{
  int v47 = a2;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>( (void *)this + 18,  &v47);
  if (!v7) {
    return 0LL;
  }
  unint64_t v46 = v7[3];
  uint64_t v8 = (CSCppFakeTask *)operator new(0x60uLL);
  CSCppFakeTask::CSCppFakeTask(v8, v47, 0);
  uint64_t v45 = v8;
  SymbolicationSession::create_symbolicator(this, &v45, v46, v47 == 0, a4, &v38);
  uint64_t v9 = v38;
  if (v45) {
    (*(void (**)(CSCppFakeTask *))(*(void *)v45 + 8LL))(v45);
  }
  if ((*((_BYTE *)this + 256) & 2) != 0)
  {
    if (!*(void *)(v9 + 80)) {
      *(void *)(v9 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = *((void *)this + 33);
    }
    *(_BYTE *)(v9 + 88) |= 1u;
  }

  if (a3)
  {
    unint64_t v10 = (char *)this + 184;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::find<unsigned long long>( (void *)this + 23,  &v46);
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v15 = v11[5];
      uint64_t v13 = (uint64_t)(v11 + 5);
      unint64_t v14 = v15;
      uint64_t v16 = *(uint64_t **)(v13 - 8);
      if ((unint64_t)v16 >= v15)
      {
        unint64_t v25 = (void **)(v13 - 16);
        uint64_t v26 = *(void *)(v13 - 16);
        uint64_t v27 = ((uint64_t)v16 - v26) >> 3;
        uint64_t v28 = v14 - v26;
        uint64_t v29 = v28 >> 2;
        else {
          unint64_t v30 = v29;
        }
        if (v30) {
          __int128 v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v13, v30);
        }
        else {
          __int128 v31 = 0LL;
        }
        unint64_t v32 = (uint64_t *)&v31[8 * v27];
        uint64_t v33 = &v31[8 * v30];
        *unint64_t v32 = v9;
        uint64_t v17 = v32 + 1;
        uint64_t v35 = (char *)v12[3];
        uint64_t v34 = (char *)v12[4];
        if (v34 != v35)
        {
          do
          {
            uint64_t v36 = *((void *)v34 - 1);
            v34 -= 8;
            *--unint64_t v32 = v36;
          }

          while (v34 != v35);
          uint64_t v34 = (char *)*v25;
        }

        v12[3] = v32;
        v12[4] = v17;
        v12[5] = v33;
        if (v34) {
          operator delete(v34);
        }
      }

      else
      {
        *uint64_t v16 = v9;
        uint64_t v17 = v16 + 1;
      }

      v12[4] = v17;
    }

    else
    {
      uint64_t v42 = 0LL;
      char v43 = 0LL;
      __int128 v44 = 0LL;
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v44, 1uLL);
      uint64_t v20 = &v18[8 * v19];
      *(void *)uint64_t v18 = v9;
      uint64_t v21 = v18 + 8;
      __int128 v23 = (char *)v42;
      uint64_t v22 = v43;
      if (v43 != v42)
      {
        do
        {
          uint64_t v24 = *((void *)v22 - 1);
          v22 -= 8;
          *((void *)v18 - 1) = v24;
          v18 -= 8;
        }

        while (v22 != v23);
        uint64_t v22 = (char *)v42;
      }

      uint64_t v42 = v18;
      char v43 = v21;
      __int128 v44 = v20;
      if (v22)
      {
        operator delete(v22);
        uint64_t v18 = (char *)v42;
        uint64_t v20 = v44;
      }

      uint64_t v38 = v46;
      __n128 __p = v18;
      uint64_t v40 = v21;
      uint64_t v41 = v20;
      char v43 = 0LL;
      __int128 v44 = 0LL;
      uint64_t v42 = 0LL;
      std::__hash_table<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,std::vector<CSCppSymbolicator *>>>( (uint64_t)v10,  (unint64_t *)&v38,  (uint64_t)&v38);
      if (__p)
      {
        uint64_t v40 = __p;
        operator delete(__p);
      }

      if (v42)
      {
        char v43 = (char *)v42;
        operator delete(v42);
      }
    }

    CSCppReferenceCount::retain(v9);
  }

  return v9;
}

void sub_18608EBF8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::create_symbolicator( SymbolicationSession *this@<X0>, void *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  int v12 = *((_DWORD *)this + 64);
  if ((v12 & 1) != 0)
  {
    SymbolicationSession::fixup_address_space(this, a3);
    int v12 = *((_DWORD *)this + 64);
  }

  uint64_t v13 = *((void *)this + 28);
  unint64_t v14 = (const void ***)(v13 + 24 * a3);
  __int128 v36 = 0uLL;
  uint64_t v37 = 0LL;
  if ((v12 & 2) == 0 || (a4 & 1) != 0)
  {
    if ((v12 & 2) != 0 && a4)
    {
      if (!v18) {
        __cxa_bad_cast();
      }
    }

    else
    {
      if (!v18) {
        __cxa_bad_cast();
      }
    }

    AS::LoadOperator::generate_owners(v18, this, (char **)&v30);
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vdeallocate((void **)&v36);
    __int128 v36 = v30;
    uint64_t v37 = v31;
    *(void *)&__int128 v31 = 0LL;
    __int128 v30 = 0uLL;
    *(void *)&__int128 v28 = &v30;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  }

  else
  {
    if (!v15) {
      __cxa_bad_cast();
    }
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)&__int128 v30 = &off_189DFADA0;
    *((void *)&v30 + 1) = v16;
    uint64_t v17 = *((void *)v15 + 4);
    __int128 v31 = *((_OWORD *)v15 + 1);
    uint64_t v32 = v17;
    __n128 __p = 0LL;
    uint64_t v34 = 0LL;
    uint64_t v35 = 0LL;
    std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( &__p,  *((const void **)v15 + 5),  *((void *)v15 + 6),  (uint64_t)(*((void *)v15 + 6) - *((void *)v15 + 5)) >> 4);
    (*(void (**)(void, uint64_t))(*(void *)*a2 + 80LL))(*a2, *((void *)this + 15) + 40 * v31);
    (*(void (**)(void, uint64_t))(*(void *)*a2 + 88LL))(*a2, v32);
    AS::FullCreationOperator::generate_owners((AS::FullCreationOperator *)&v30, this, (uint64_t)&v28);
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vdeallocate((void **)&v36);
    __int128 v36 = v28;
    uint64_t v37 = v29;
    uint64_t v29 = 0LL;
    __int128 v28 = 0uLL;
    uint64_t v38 = (void **)&v28;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v38);
    *(void *)&__int128 v30 = &off_189DFADA0;
    if (__p)
    {
      uint64_t v34 = __p;
      operator delete(__p);
    }
  }

  uint64_t v19 = operator new(0x80uLL);
  uint64_t v20 = *a2;
  *a2 = 0LL;
  *(void *)&__int128 v28 = v20;
  CSCppSymbolicator::CSCppSymbolicator(v19, &v36, &v28, a5, 0LL);
  *a6 = v19;
  uint64_t v21 = v28;
  *(void *)&__int128 v28 = 0LL;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8LL))(v21);
  }
  uint64_t v22 = v13 + 24 * a3;
  uint64_t v24 = *(void *)(v22 + 8);
  __int128 v23 = (void *)(v22 + 8);
  unint64_t v25 = *v14;
  if ((unint64_t)(v24 - (void)*v14) >= 9)
  {
    unsigned int v26 = 2;
    unint64_t v27 = 1LL;
    do
    {
      (**(void (***)(const void *, void *, SymbolicationSession *))v25[v27])(v25[v27], v19, this);
      unint64_t v27 = v26;
      unint64_t v25 = *v14;
      ++v26;
    }

    while (v27 < (uint64_t)(*v23 - (void)*v14) >> 3);
  }

  *(void *)&__int128 v30 = &v36;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
}

void sub_18608EF40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20, char a21)
{
  a13 = (char *)(v21 + 16);
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }

  a13 = &a21;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::fixup_address_space(SymbolicationSession *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 28) + 24 * a2;
  memset(v42, 0, sizeof(v42));
  int v43 = 1065353216;
  unint64_t v39 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v3 = (uint64_t **)(v2 + 8);
  uint64_t v4 = *(uint64_t **)v2;
  unint64_t v5 = ((uint64_t)(*(void *)(v2 + 8) - *(void *)v2) >> 3) - 1;
  if (v5 >= 2)
  {
    unint64_t v6 = 1LL;
    do
    {
      uint64_t v7 = (const void *)v4[v6];
      if (v7)
      {
        if (v8)
        {
          if (*((_BYTE *)v8 + 40))
          {
            uint64_t v9 = (void *)v8[2];
            unint64_t v10 = (void *)v8[3];
            while (v9 != v10)
            {
              std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::__emplace_unique_key_args<AS::LoadDescription,AS::LoadDescription const&>( (uint64_t)v42,  v9,  v9);
              v9 += 2;
            }
          }

          else
          {
            std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::__emplace_unique_key_args<AS::LoadDescription,AS::LoadDescription const&>( (uint64_t)v42,  v8 + 2,  (_OWORD *)v8 + 1);
          }
        }

        else
        {
          if (v11)
          {
            int v12 = v11 + 16;
            if (!std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::find<AS::LoadDescription>( v42,  (void *)v11 + 2))
            {
              if (v40 >= v41)
              {
                uint64_t v14 = (v40 - v39) >> 4;
                unint64_t v15 = v14 + 1;
                uint64_t v16 = v41 - v39;
                if ((v41 - v39) >> 3 > v15) {
                  unint64_t v15 = v16 >> 3;
                }
                else {
                  unint64_t v17 = v15;
                }
                if (v17) {
                  uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)&v41,  v17);
                }
                else {
                  uint64_t v18 = 0LL;
                }
                uint64_t v19 = &v18[16 * v14];
                *(_OWORD *)uint64_t v19 = *v12;
                uint64_t v20 = v40;
                uint64_t v21 = v19;
                if (v40 != v39)
                {
                  do
                  {
                    *((_OWORD *)v21 - 1) = *((_OWORD *)v20 - 1);
                    v21 -= 16;
                    v20 -= 16;
                  }

                  while (v20 != v39);
                  uint64_t v20 = v39;
                }

                uint64_t v13 = v19 + 16;
                unint64_t v39 = v21;
                uint64_t v41 = &v18[16 * v17];
                if (v20) {
                  operator delete(v20);
                }
              }

              else
              {
                *(_OWORD *)uint64_t v40 = *v12;
                uint64_t v13 = v40 + 16;
              }

              uint64_t v40 = v13;
            }
          }
        }
      }

      unint64_t v6 = (v6 + 1);
      uint64_t v4 = *(uint64_t **)v2;
      unint64_t v5 = (((uint64_t)*v3 - *(void *)v2) >> 3) - 1;
    }

    while (v5 > v6);
  }

  __int128 v23 = (void *)v22[2];
  for (i = (void *)v22[3]; v23 != i; v23 += 2)
  {
    if (!std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::find<AS::LoadDescription>( v42,  v23))
    {
      if (v40 >= v41)
      {
        uint64_t v26 = (v40 - v39) >> 4;
        unint64_t v27 = v26 + 1;
        uint64_t v28 = v41 - v39;
        if ((v41 - v39) >> 3 > v27) {
          unint64_t v27 = v28 >> 3;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29) {
          __int128 v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)&v41,  v29);
        }
        else {
          __int128 v30 = 0LL;
        }
        __int128 v31 = &v30[16 * v26];
        *(_OWORD *)__int128 v31 = *(_OWORD *)v23;
        uint64_t v32 = v40;
        uint64_t v33 = v31;
        if (v40 != v39)
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)v32 - 1);
            v33 -= 16;
            v32 -= 16;
          }

          while (v32 != v39);
          uint64_t v32 = v39;
        }

        unint64_t v25 = v31 + 16;
        unint64_t v39 = v33;
        uint64_t v41 = &v30[16 * v29];
        if (v32) {
          operator delete(v32);
        }
      }

      else
      {
        *(_OWORD *)uint64_t v40 = *(_OWORD *)v23;
        unint64_t v25 = v40 + 16;
      }

      uint64_t v40 = v25;
    }
  }

  uint64_t v34 = operator new(0x30uLL);
  __n128 __p = 0LL;
  uint64_t v45 = 0LL;
  uint64_t v46 = 0LL;
  std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( &__p,  v39,  (uint64_t)v40,  (v40 - v39) >> 4);
  v34[2] = 0LL;
  *uint64_t v34 = &off_189DFAD48;
  v34[1] = 0LL;
  v34[3] = 0LL;
  v34[4] = 0LL;
  std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( v34 + 2,  __p,  (uint64_t)v45,  (v45 - (_BYTE *)__p) >> 4);
  *((_BYTE *)v34 + 40) = 1;
  if (__p)
  {
    uint64_t v45 = __p;
    operator delete(__p);
  }

  uint64_t v35 = **(void **)v2;
  **(void **)uint64_t v2 = v34;
  if (v35) {
    (*(void (**)(uint64_t))(*(void *)v35 + 16LL))(v35);
  }
  uint64_t v37 = *v3 - 1;
  uint64_t v36 = *v37;
  *uint64_t v37 = 0LL;
  if (v36) {
    (*(void (**)(uint64_t))(*(void *)v36 + 16LL))(v36);
  }
  std::string::value_type *v3 = v37;
  if (v39) {
    operator delete(v39);
  }
  return std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)v42);
}

void sub_18608F3CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::foreach_pid(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t ***)(a1 + 160);
  if (!v2) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  do
  {
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *((unsigned int *)v2 + 4));
    ++v4;
    uint64_t v2 = (uint64_t **)*v2;
  }

  while (v2);
  return v4;
}

void *SymbolicationSession::dsc_slide_for_pid(SymbolicationSession *this, int a2)
{
  int v4 = a2;
  uint64_t result = std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>( (void *)this + 18,  &v4);
  if (result)
  {
    uint64_t result = **(void ***)(*((void *)this + 28) + 24LL * result[3]);
    if (result)
    {
      if (result) {
        return (void *)result[3];
      }
    }
  }

  return result;
}

void std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__destroy_vector::operator()[abi:ne180100]( void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    int v4 = (void **)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        unint64_t v6 = v4;
        std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }

      while (v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    int v4 = v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *int v4 = 0LL;
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16LL))(v6);
        }
      }

      while (v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__destroy_vector::operator()[abi:ne180100]( void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    int v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 40;
        uint64_t v7 = (void **)(v4 - 24);
        std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v7);
        int v4 = v6;
      }

      while (v6 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 96LL;
        std::__destroy_at[abi:ne180100]<LibraryDescription,0>(v4);
      }

      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void std::__destroy_at[abi:ne180100]<LibraryDescription,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }

  if (*(_BYTE *)(a1 + 48))
  {
  }

_BYTE *std::__optional_copy_base<LibraryDescription,false>::__optional_copy_base[abi:ne180100]( _BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[96] = 0;
  if (*(_BYTE *)(a2 + 96))
  {
    std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>( (uint64_t)a1,  (__int128 *)a2);
    a1[96] = 1;
  }

  return a1;
}

void sub_18608F764(_Unwind_Exception *a1)
{
}

uint64_t std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>( uint64_t a1, __int128 *a2)
{
  __int128 v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)(a1 + 24),  (__int128 *)((char *)a2 + 24));
  uint64_t v5 = *((void *)a2 + 7);
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = 0LL;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>( (void *)(a1 + 64),  *((const void **)a2 + 8),  *((void *)a2 + 9),  (uint64_t)(*((void *)a2 + 9) - *((void *)a2 + 8)) >> 5);
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return a1;
}

void sub_18608F7F0(_Unwind_Exception *exception_object)
{
  if (*(_BYTE *)(v1 + 48))
  {
  }

  _Unwind_Resume(exception_object);
}

uint64_t std::__optional_destruct_base<LibraryDescription,false>::~__optional_destruct_base[abi:ne180100]( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 96))
  {
    uint64_t v2 = *(void **)(a1 + 64);
    if (v2)
    {
      *(void *)(a1 + 72) = v2;
      operator delete(v2);
    }
  }

  return a1;
}

uint64_t std::vector<LibraryDescription>::__push_back_slow_path<LibraryDescription const&>( uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555LL) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  unint64_t v17 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TRawSymbol<Pointer32>>>(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  uint64_t v13 = v10;
  uint64_t v14 = &v10[96 * v4];
  uint64_t v16 = &v10[96 * v9];
  std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription const&,LibraryDescription*>((uint64_t)v14, a2);
  unint64_t v15 = v14 + 96;
  std::vector<LibraryDescription>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<LibraryDescription>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_18608F954(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void std::vector<LibraryDescription>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  unint64_t v5 = (__int128 *)*a1;
  unint64_t v4 = (__int128 *)a1[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 96LL;
    v4 -= 6;
    std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription,LibraryDescription*>(v6, v4);
  }

  a2[1] = v6;
  uint64_t v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

__n128 std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription,LibraryDescription*>( uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v2;
  *(_BYTE *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  if (*((_BYTE *)a2 + 48))
  {
    __int128 v3 = *(__int128 *)((char *)a2 + 24);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(a1 + 24) = v3;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    *(_BYTE *)(a1 + 48) = 1;
  }

  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = 0LL;
  __n128 result = (__n128)a2[4];
  *(__n128 *)(a1 + 64) = result;
  *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = *((void *)a2 + 10);
  *((void *)a2 + 8) = 0LL;
  *((void *)a2 + 9) = 0LL;
  *((void *)a2 + 10) = 0LL;
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return result;
}

uint64_t std::__split_buffer<LibraryDescription>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 96;
    std::__destroy_at[abi:ne180100]<LibraryDescription,0>(i - 96);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::pair<LibraryDescription,std::nullopt_t>::pair[abi:ne180100]<LibraryDescription&,std::nullopt_t const&,0>( uint64_t a1, __int128 *a2)
{
  __int128 v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)(a1 + 24),  (__int128 *)((char *)a2 + 24));
  uint64_t v5 = *((void *)a2 + 7);
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = 0LL;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>( (void *)(a1 + 64),  *((const void **)a2 + 8),  *((void *)a2 + 9),  (uint64_t)(*((void *)a2 + 9) - *((void *)a2 + 8)) >> 5);
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return a1;
}

void sub_18608FB30(_Unwind_Exception *exception_object)
{
  if (*(_BYTE *)(v1 + 48))
  {
  }

  _Unwind_Resume(exception_object);
}

void *std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__construct_one_at_end[abi:ne180100]<UUID const&,std::vector<LibraryDescription> const&>( uint64_t a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_OWORD *)uint64_t v4 = *a2;
  *(void *)(v4 + 24) = 0LL;
  *(void *)(v4 + 32) = 0LL;
  *(void *)(v4 + 16) = 0LL;
  __n128 result = std::vector<LibraryDescription>::__init_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>( (void *)(v4 + 16),  *a3,  a3[1],  0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 5));
  *(void *)(a1 + 8) = v4 + 40;
  return result;
}

void sub_18608FBAC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__emplace_back_slow_path<UUID const&,std::vector<LibraryDescription> const&>( uint64_t *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x666666666666666LL) {
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v4) >> 3);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x333333333333333LL) {
    unint64_t v11 = 0x666666666666666LL;
  }
  else {
    unint64_t v11 = v6;
  }
  uint64_t v19 = a1 + 2;
  if (v11) {
    int v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppDyldSplitSharedCacheMemory::CacheMemoryAndPath>>( v9,  v11);
  }
  else {
    int v12 = 0LL;
  }
  uint64_t v13 = &v12[40 * v5];
  v16[0] = v12;
  v16[1] = v13;
  unint64_t v17 = v13;
  uint64_t v18 = &v12[40 * v11];
  *(_OWORD *)uint64_t v13 = *a2;
  *((void *)v13 + 3) = 0LL;
  *((void *)v13 + 4) = 0LL;
  *((void *)v13 + 2) = 0LL;
  std::vector<LibraryDescription>::__init_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>( (void *)v13 + 2,  *a3,  a3[1],  0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 5));
  v17 += 40;
  std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__swap_out_circular_buffer(a1, v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::~__split_buffer(v16);
  return v14;
}

void sub_18608FCCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *std::vector<LibraryDescription>::__init_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>( void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    std::vector<TRawSymbol<Pointer32>>::__vallocate[abi:ne180100](result, a4);
    __n128 result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<LibraryDescription>,LibraryDescription*,LibraryDescription*,LibraryDescription*>( (uint64_t)(v6 + 2),  a2,  a3,  v6[1]);
    v6[1] = result;
  }

  return result;
}

void sub_18608FD44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<LibraryDescription>,LibraryDescription*,LibraryDescription*,LibraryDescription*>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0LL;
    do
    {
      std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription&,LibraryDescription*>( a4 + v7,  (__int128 *)(a2 + v7));
      v7 += 96LL;
    }

    while (a2 + v7 != a3);
    a4 += v7;
  }

  return a4;
}

void sub_18608FDC0(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 96;
    do
    {
      std::__destroy_at[abi:ne180100]<LibraryDescription,0>(v4 + v2);
      v2 -= 96LL;
    }

    while (v2);
  }

  _Unwind_Resume(exception_object);
}

uint64_t std::construct_at[abi:ne180100]<LibraryDescription,LibraryDescription&,LibraryDescription*>( uint64_t a1, __int128 *a2)
{
  __int128 v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]( (std::string *)(a1 + 24),  (__int128 *)((char *)a2 + 24));
  uint64_t v5 = *((void *)a2 + 7);
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = 0LL;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>( (void *)(a1 + 64),  *((const void **)a2 + 8),  *((void *)a2 + 9),  (uint64_t)(*((void *)a2 + 9) - *((void *)a2 + 8)) >> 5);
  *(_DWORD *)(a1 + 88) = *((_DWORD *)a2 + 22);
  return a1;
}

void sub_18608FE5C(_Unwind_Exception *exception_object)
{
  if (*(_BYTE *)(v1 + 48))
  {
  }

  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::pair<UUID,std::vector<LibraryDescription>>>::__swap_out_circular_buffer( uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>( (uint64_t)(a1 + 2),  a1[1],  a1[1],  *a1,  *a1,  a2[1],  a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v13 = a6;
  *((void *)&v13 + 1) = a7;
  __int128 v12 = v13;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  if (a3 == a5)
  {
    uint64_t v8 = a6;
  }

  else
  {
    do
    {
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - 8) = 0LL;
      *(void *)(v7 - 24) = 0LL;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(void *)(a3 - 24) = 0LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      uint64_t v7 = *((void *)&v13 + 1) - 40LL;
      *((void *)&v13 + 1) -= 40LL;
      a3 -= 40LL;
    }

    while (a3 != a5);
    uint64_t v8 = v13;
  }

  char v11 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v8;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<UUID,std::vector<LibraryDescription>>>,std::reverse_iterator<std::pair<UUID,std::vector<LibraryDescription>>*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    uint64_t v3 = (void **)(v1 + 16);
    std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 40LL;
  }

void **std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<UUID,std::vector<LibraryDescription>>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 40;
    __int128 v4 = (void **)(i - 24);
    std::vector<LibraryDescription>::__destroy_vector::operator()[abi:ne180100](&v4);
  }

uint64_t std::vector<std::vector<std::unique_ptr<AS::Operator>>>::__swap_out_circular_buffer( uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>( (uint64_t)(a1 + 2),  a1[1],  (void *)a1[1],  *a1,  (void *)*a1,  a2[1],  a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v14 = a6;
  *((void *)&v14 + 1) = a7;
  __int128 v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }

  else
  {
    do
    {
      *(void *)(v7 - 24) = 0LL;
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - 8) = 0LL;
      __int128 v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0LL;
      a3[1] = 0LL;
      a3[2] = 0LL;
      uint64_t v7 = *((void *)&v14 + 1) - 24LL;
      *((void *)&v14 + 1) -= 24LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unique_ptr<AS::Operator>>>,std::reverse_iterator<std::vector<std::unique_ptr<AS::Operator>>*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    uint64_t v3 = v1;
    std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 3;
  }

void **std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<std::unique_ptr<AS::Operator>>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    __int128 v4 = (void **)(i - 24);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    std::vector<std::unique_ptr<AS::Operator>>::__destroy_vector::operator()[abi:ne180100](&v5);
  }

uint64_t std::__split_buffer<std::unique_ptr<AS::Operator>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - 8) = 0LL;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
    }
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::vector<AS::LoadDescription>::__init_with_size[abi:ne180100]<AS::LoadDescription*,AS::LoadDescription*>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_186090374(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void std::default_delete<EventAggregator>::operator()[abi:ne180100](uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)a2 + 88);
    std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::~__hash_table((uint64_t)a2 + 48);
    std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table((uint64_t)a2 + 8);
    operator delete(a2);
  }

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,LibraryConstructionState>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,LibraryConstructionState>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,LibraryConstructionState>>>::__deallocate_node( uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,LibraryConstructionState>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

void std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,LibraryConstructionState>,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v2;
    operator delete(v2);
  }

  if (*(_BYTE *)(a1 + 56))
  {
  }

uint64_t *std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::find<int>( void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }

      else
      {
        v8 &= *(void *)&v2 - 1LL;
      }

      if (v8 != v5) {
        return 0LL;
      }
    }
  }

  return result;
}

void *std::__hash_table<std::__hash_value_type<int,unsigned long>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned long>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned long>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>( uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      char v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          char v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  char v11 = operator new(0x20uLL);
  *char v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  void v11[3] = 0LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *char v11 = *v20;
LABEL_38:
    *uint64_t v20 = v11;
    goto LABEL_39;
  }

  *char v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_186090750(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<UUID,unsigned long>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,unsigned long>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,unsigned long>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>( uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == a2[1]) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x28uLL);
  void *i = 0LL;
  i[1] = v7;
  *((_OWORD *)i + 1) = **a4;
  i[4] = 0LL;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1LL;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *i = *v21;
LABEL_42:
    void *v21 = i;
    goto LABEL_43;
  }

  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }

    else
    {
      v22 &= v8 - 1;
    }

    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_42;
  }

void sub_18609097C(_Unwind_Exception *a1)
{
}

char *std::__hash_table<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<CSCppSymbolicator *>>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,std::vector<CSCppSymbolicator *>>>( uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = (char *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = *((void *)v10 + 1);
          if (v11 == v6)
          {
            if (*((void *)v10 + 2) == v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          uint64_t v10 = *(char **)v10;
        }

        while (v10);
      }
    }
  }

  unint64_t v12 = (void *)(a1 + 16);
  uint64_t v10 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v10 = 0LL;
  *((void *)v10 + 1) = v6;
  *((void *)v10 + 2) = *(void *)a3;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(a3 + 8);
  *((void *)v10 + 5) = *(void *)(a3 + 24);
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = 0LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    BOOL v15 = 1LL;
    if (v7 >= 3) {
      BOOL v15 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v7);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v18);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v3);
  if (v20)
  {
    *(void *)uint64_t v10 = *v20;
LABEL_38:
    *uint64_t v20 = v10;
    goto LABEL_39;
  }

  *(void *)uint64_t v10 = *v12;
  void *v12 = v10;
  *(void *)(v19 + 8 * v3) = v12;
  if (*(void *)v10)
  {
    unint64_t v21 = *(void *)(*(void *)v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v21 >= v7) {
        v21 %= v7;
      }
    }

    else
    {
      v21 &= v7 - 1;
    }

    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_186090BD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void *std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::__emplace_unique_key_args<AS::LoadDescription,AS::LoadDescription const&>( uint64_t a1, void *a2, _OWORD *a3)
{
  uint64_t v6 = a2[1];
  unint64_t v7 = (v6 + (*a2 << 6) + (*a2 >> 2) + 2654435769LL) ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      uint64_t v3 = (v6 + (*a2 << 6) + (*a2 >> 2) + 2654435769LL) ^ *a2;
      if (v7 >= v8) {
        uint64_t v3 = v7 % v8;
      }
    }

    else
    {
      uint64_t v3 = v7 & (v8 - 1);
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == v6) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x20uLL);
  void *i = 0LL;
  i[1] = v7;
  *((_OWORD *)i + 1) = *a3;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1LL;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        uint64_t v3 = v7 % v8;
      }
      else {
        uint64_t v3 = v7;
      }
    }

    else
    {
      uint64_t v3 = (v8 - 1) & v7;
    }
  }

  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    void *i = *v21;
LABEL_42:
    void *v21 = i;
    goto LABEL_43;
  }

  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }

    else
    {
      v22 &= v8 - 1;
    }

    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_42;
  }

void sub_186090E0C(_Unwind_Exception *a1)
{
}

void *std::__hash_table<AS::LoadDescription,std::hash<AS::LoadDescription>,std::equal_to<AS::LoadDescription>,std::allocator<AS::LoadDescription>>::find<AS::LoadDescription>( void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  uint64_t v3 = a2[1];
  unint64_t v4 = (v3 + (*a2 << 6) + (*a2 >> 2) + 2654435769LL) ^ *a2;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = (v3 + (*a2 << 6) + (*a2 >> 2) + 2654435769LL) ^ *a2;
    if (v4 >= *(void *)&v2) {
      uint64_t v6 = v4 % *(void *)&v2;
    }
  }

  else
  {
    uint64_t v6 = v4 & (*(void *)&v2 - 1LL);
  }

  unint64_t v7 = *(void **)(*a1 + 8 * v6);
  if (!v7) {
    return 0LL;
  }
  uint64_t result = (void *)*v7;
  if (*v7)
  {
    do
    {
      unint64_t v9 = result[1];
      if (v9 == v4)
      {
        if (result[2] == *a2 && result[3] == v3) {
          return result;
        }
      }

      else
      {
        if (v5.u32[0] > 1uLL)
        {
          if (v9 >= *(void *)&v2) {
            v9 %= *(void *)&v2;
          }
        }

        else
        {
          v9 &= *(void *)&v2 - 1LL;
        }

        if (v9 != v6) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

uint64_t catch_mach_exception_raise()
{
  return 5LL;
}

uint64_t catch_mach_exception_raise_state( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, const void *a6, unsigned int a7, void *a8, unsigned int *a9)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (*a3 == 1LL) {
    return 5LL;
  }
  *(void *)ref_count = 0LL;
  vm_offset_t v12 = a3[1];
  if (vm_map_page_query(*MEMORY[0x1895FBBE0], v12, &ref_count[1], ref_count)) {
    return 5LL;
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    vm_offset_t v16 = v12;
    __int16 v17 = 1024;
    integer_t v18 = ref_count[1];
    _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Caught EXC_BAD_ACCESS at 0x%llx, valid page mapping, page query flags (0x%x)\n",  buf,  0x12u);
  }

  uint64_t result = 5LL;
  if (a7 <= 0xF5 && *a9 >= a7)
  {
    memcpy(a8, a6, 4LL * a7);
    uint64_t result = 0LL;
    *a9 = a7;
    a8[33] = thread_exit_due_to_bad_access;
  }

  return result;
}

void thread_exit_due_to_bad_access(void)
{
  v0 = (CSCppExceptionSafeThread *)pthread_getspecific(_exception_safe_thread_key(void)::est_key);
  CSCppExceptionSafeThread::runloop_exit_due_to_bad_access(v0);
}

uint64_t catch_mach_exception_raise_identity_protected( uint64_t a1, uint64_t a2, mach_port_name_t a3, uint64_t a4, void *a5)
{
  kern_return_t v8;
  mach_error_t v9;
  char *v10;
  FILE *v11;
  char *v12;
  unint64_t v13;
  thread_act_t v14;
  unint64_t v15;
  mach_port_name_t v16;
  uint64_t state;
  char *v18;
  FILE *v19;
  char *v20;
  vm_offset_t v21;
  integer_t thread_info_out[66];
  void (*v26)(void);
  mach_msg_type_number_t thread_info_outCnt;
  thread_act_array_t act_list;
  mach_msg_type_number_t act_listCnt;
  uint8_t buf[4];
  vm_offset_t v31;
  __int16 v32;
  mach_msg_type_number_t v33;
  uint64_t v34;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  task_threads(*MEMORY[0x1895FBBE0], &act_list, &act_listCnt);
  if (!act_listCnt)
  {
    float v14 = 0;
    float v13 = 0LL;
    goto LABEL_18;
  }

  unint64_t v6 = 0LL;
  unint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
  while (1)
  {
    thread_info_outCnt = 6;
    unint64_t v8 = thread_info(act_list[v6], 4u, thread_info_out, &thread_info_outCnt);
    unint64_t v9 = v8;
    if (v8)
    {
      if (v8 != 268435459)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = mach_error_string(v9);
          *(_DWORD *)buf = 136315138;
          __int128 v31 = (vm_offset_t)v10;
          _os_log_impl(&dword_185FC0000, v7, OS_LOG_TYPE_ERROR, "thread_info failed due to %s", buf, 0xCu);
        }

        uint64_t v11 = (FILE *)*MEMORY[0x1895F89D0];
        vm_offset_t v12 = mach_error_string(v9);
        fprintf(v11, "thread_info failed due to %s", v12);
      }

      goto LABEL_9;
    }

    if (*(void *)thread_info_out == a2) {
      break;
    }
LABEL_9:
    ++v6;
    float v13 = act_listCnt;
    if (v6 >= act_listCnt)
    {
      float v14 = 0;
      if (!act_listCnt) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
  }

  float v14 = act_list[v6];
  float v13 = act_listCnt;
  if (!act_listCnt) {
    goto LABEL_18;
  }
LABEL_14:
  float v15 = 0LL;
  do
  {
    vm_offset_t v16 = act_list[v15];
    if (v14 != v16)
    {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v16);
      float v13 = act_listCnt;
    }

    ++v15;
  }

  while (v15 < v13);
LABEL_18:
  mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)act_list, 4 * v13);
  LODWORD(act_list) = 70;
  state = thread_get_state(v14, 1, (thread_state_t)thread_info_out, (mach_msg_type_number_t *)&act_list);
  if ((_DWORD)state)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      integer_t v18 = mach_error_string(state);
      *(_DWORD *)buf = 136315138;
      __int128 v31 = (vm_offset_t)v18;
      _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "thread_get_state failed due to %s",  buf,  0xCu);
    }

    uint64_t v19 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v20 = mach_error_string(state);
    fprintf(v19, "thread_get_state failed due to %s", v20);
  }

  else if (*a5 == 1LL {
         || (act_listCnt = 0,
  }
             thread_info_outCnt = 0,
             unint64_t v21 = a5[1],
             vm_map_page_query(*MEMORY[0x1895FBBE0], v21, (integer_t *)&act_listCnt, (integer_t *)&thread_info_outCnt)))
  {
    state = 5LL;
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      __int128 v31 = v21;
      uint64_t v32 = 1024;
      uint64_t v33 = act_listCnt;
      _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Caught EXC_BAD_ACCESS at 0x%llx, valid page mapping, page query flags (0x%x)\n",  buf,  0x12u);
    }

    uint64_t v26 = thread_exit_due_to_bad_access;
    state = thread_set_state(v14, 1, (thread_state_t)thread_info_out, (mach_msg_type_number_t)act_list);
    if (!(_DWORD)state)
    {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], a3);
      state = 0LL;
    }
  }

  mach_port_deallocate(*MEMORY[0x1895FBBE0], v14);
  return state;
}

void sub_186091410(_Unwind_Exception *a1)
{
}

void CSCppExceptionSafeThread::CSCppExceptionSafeThread(CSCppExceptionSafeThread *this)
{
  *((void *)this + 1) = 0LL;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *(_OWORD *)((char *)this + 172) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0LL);
  pthread_cond_init((pthread_cond_t *)((char *)this + 80), 0LL);
  pthread_mutex_init((pthread_mutex_t *)this + 3, 0LL);
  pthread_cond_init((pthread_cond_t *)((char *)this + 256), 0LL);
  pthread_mutex_lock((pthread_mutex_t *)this + 3);
  if (pthread_create((pthread_t *)this, 0LL, (void *(__cdecl *)(void *))thread_runloop_init, this))
  {
    atomic_store(0x1001u, (unsigned int *)this + 3);
  }

  else
  {
    thread_act_t v2 = pthread_mach_thread_np(*(pthread_t *)this);
    CSCppExceptionSafeThread::register_for_exceptions((mach_port_name_t *)this, v2);
    pthread_cond_wait((pthread_cond_t *)((char *)this + 256), (pthread_mutex_t *)this + 3);
    pthread_mutex_unlock((pthread_mutex_t *)this + 3);
  }

void sub_186091528(_Unwind_Exception *a1)
{
}

void thread_runloop_init(CSCppExceptionSafeThread *a1)
{
}

uint64_t CSCppExceptionSafeThread::register_for_exceptions(mach_port_name_t *this, thread_act_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unint64_t v4 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  else {
    exception_behavior_t v5 = -2147483644;
  }
  unint64_t v6 = this + 2;
  mach_error_t inserted = mach_port_allocate(*v4, 1u, this + 2);
  if (inserted
    || (mach_error_t inserted = mach_port_insert_right(*v4, *v6, *v6, 0x14u)) != 0
    || (mach_error_t inserted = thread_set_exception_ports(a2, 2u, *v6, v5, 1)) != 0
    || (uint64_t result = MEMORY[0x186E313C8](*v4, this[2], this), (inserted = result) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      vm_offset_t v12 = mach_error_string(inserted);
      _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failure while allocating exception port: %s\n",  buf,  0xCu);
    }

    unint64_t v9 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v10 = mach_error_string(inserted);
    uint64_t result = fprintf(v9, "failure while allocating exception port: %s\n", v10);
    if (*v6)
    {
      mach_port_mod_refs(*v4, *v6, 1u, -1);
      uint64_t result = mach_port_deallocate(*v4, *v6);
      mach_port_name_t *v6 = 0;
    }
  }

  return result;
}

uint64_t CSCppExceptionSafeThread::run(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_return_t v8;
  mach_error_t v9;
  char *v10;
  FILE *v11;
  char *v12;
  unsigned int v13;
  uint64_t v14;
  os_unfair_lock_s *lock;
  _BYTE buf[12];
  __int16 v18;
  mach_error_t v19;
  uint64_t v20;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (CSCppExceptionSafeThread::is_current_thread((CSCppExceptionSafeThread *)a1))
  {
    *(void *)buf = a3;
    std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::push_back( (void *)(a1 + 136),  buf);
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    CSCppExceptionSafeThread::pop_recovery_block((CSCppExceptionSafeThread *)a1);
    return 4096LL;
  }

  if (!*(_DWORD *)(a1 + 8))
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    return 4096LL;
  }

  lock = (os_unfair_lock_s *)(a1 + 184);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 184));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(void *)(a1 + 128) = a2;
  *(void *)buf = a3;
  std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::push_back( (void *)(a1 + 136),  buf);
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  unint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
  unint64_t v7 = (FILE **)MEMORY[0x1895F89D0];
  do
  {
    unint64_t v8 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))_exception_handler_demux,  0x40000u,  *(_DWORD *)(a1 + 8),  0);
    if (v8)
    {
      unint64_t v9 = v8;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = mach_error_string(v9);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v10;
        integer_t v18 = 1024;
        uint64_t v19 = v9;
        _os_log_impl(&dword_185FC0000, v6, OS_LOG_TYPE_ERROR, "error handling EST message: %s (%u)\n", buf, 0x12u);
      }

      uint64_t v11 = *v7;
      vm_offset_t v12 = mach_error_string(v9);
      fprintf(v11, "error handling EST message: %s (%u)\n", v12, v9);
    }

    uint64_t v13 = atomic_load((unsigned int *)(a1 + 12));
  }

  while (v13 < 0x1000);
  float v14 = atomic_load((unsigned int *)(a1 + 12));
  os_unfair_lock_unlock(lock);
  return v14;
}

BOOL CSCppExceptionSafeThread::is_current_thread(CSCppExceptionSafeThread *this)
{
  return pthread_getspecific(_exception_safe_thread_key(void)::est_key) != 0LL;
}

uint64_t CSCppExceptionSafeThread::pop_recovery_block(CSCppExceptionSafeThread *this)
{
  uint64_t v1 = *((void *)this + 22);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1 - 1;
  uint64_t v3 = *(void *)(*(void *)(*((void *)this + 18)
  *((void *)this + 22) = v2;
  std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__maybe_remove_back_spare[abi:ne180100]( (void *)this + 17,  1);
  return v3;
}

uint64_t _exception_handler_demux(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  if (a1->msgh_id != 999) {
    return mach_exc_server(a1, (uint64_t)a2);
  }
  if (!mach_port_get_context(*MEMORY[0x1895FBBE0], a1->msgh_local_port, &context)) {
    atomic_store(a1[1].msgh_bits, (unsigned int *)(context + 12));
  }
  return 1LL;
}

uint64_t CSCppExceptionSafeThread::runloop_send_exit_notice(uint64_t this, int a2)
{
  mach_port_t v2 = *(_DWORD *)(this + 8);
  if (v2)
  {
    bzero(&v4, 0x1CuLL);
    v4.msgh_voucher_port = 0;
    v4.msgh_id = 999;
    v4.msgh_remote_port = v2;
    v4.msgh_local_port = 0;
    *(void *)&v4.msgh_bits = 0x1C00001413LL;
    int v5 = a2;
    return mach_msg_send(&v4);
  }

  return this;
}

uint64_t CSCppExceptionSafeThread::thread_init(CSCppExceptionSafeThread *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)this + 3);
}

void CSCppExceptionSafeThread::runloop(CSCppExceptionSafeThread *this)
{
  mach_port_t v2 = (pthread_mutex_t *)((char *)this + 16);
  uint64_t v3 = (pthread_cond_t *)((char *)this + 80);
  while (1)
  {
    pthread_mutex_lock(v2);
    while (1)
    {
      uint64_t v4 = *((void *)this + 16);
      if (v4) {
        break;
      }
      pthread_cond_wait(v3, v2);
    }

    atomic_store(0x100u, (unsigned int *)this + 3);
    (*(void (**)(void))(v4 + 16))();
    CSCppExceptionSafeThread::pop_recovery_block(this);
    CSCppExceptionSafeThread::runloop_send_exit_notice((uint64_t)this, 4096);
    *((void *)this + 16) = 0LL;
    pthread_mutex_unlock(v2);
  }

uint64_t CSCppExceptionSafeThread::runloop_prep_to_turn(CSCppExceptionSafeThread *this, unsigned int a2)
{
  if (a2 <= 0x1000)
  {
    CSCppExceptionSafeThread::pop_recovery_block(this);
  }

  else
  {
    while (*((void *)this + 22))
    {
      uint64_t v4 = CSCppExceptionSafeThread::pop_recovery_block(this);
      if (v4) {
        (*(void (**)(void))(v4 + 16))();
      }
    }
  }

  uint64_t result = CSCppExceptionSafeThread::runloop_send_exit_notice((uint64_t)this, a2);
  *((void *)this + 16) = 0LL;
  return result;
}

void CSCppExceptionSafeThread::runloop_exit_due_to_bad_access(CSCppExceptionSafeThread *this)
{
}

uint64_t ___ZL26_exception_safe_thread_keyv_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_exception_safe_thread_key(void)::est_key, 0LL);
}

void std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::push_back( void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }

  *(void *)(*(void *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

void std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__add_back_capacity( void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8LL;
      return;
    }

    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

void sub_186091F80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::deque<void({block_pointer})(void),std::allocator<void({block_pointer})(void)>>::__maybe_remove_back_spare[abi:ne180100]( void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = ((v2 - v3) << 6) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x200) {
    a2 = 1;
  }
  if (v5 < 0x400) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8LL;
  }

  return v7 ^ 1u;
}

void CSCallFrameInfoForBinary::ParseEHFrameData(CSCallFrameInfoForBinary *this)
{
  unsigned int v24 = 0;
  uint64_t v3 = (CSCallFrameInfoForBinary *)((char *)this + 56);
  unint64_t v2 = *((void *)this + 7);
  unint64_t v5 = (void *)((char *)this + 24);
  uint64_t v4 = *((void *)this + 3);
  v23[0] = *((void *)this + 5);
  v23[1] = v4;
  v23[2] = -1LL;
  unint64_t v6 = *((void *)this + 8);
  if (v2 < v6)
  {
    unsigned int v7 = 0;
    unint64_t v8 = (FILE **)MEMORY[0x1895F89D0];
    do
    {
      int v9 = CSBinaryDataRef::Get32(v3, &v24);
      unsigned int v13 = CSBinaryDataRef::Get32(v3, &v24);
      int v14 = v7 + v9;
      unsigned int v15 = v7 + v9 + 4;
      if (v13) {
        unsigned int v16 = CSCallFrameInfoForBinary::ParseFDE(this, v10, v11, v13, v24, (v14 + 4), v23, 1, v5);
      }
      else {
        unsigned int v16 = CSCallFrameInfoForBinary::ParseCIE((uint64_t)this, v7, v11, v12, v24, v14 + 4, v23);
      }
      unsigned int v24 = v16;
      if (v16 != v15)
      {
        if (v13) {
          uint64_t v17 = "FDE";
        }
        else {
          uint64_t v17 = "CIE";
        }
        uint64_t v18 = (const char *)this;
        fprintf( *v8,  "CoreSymbolication warning: error parsing %s at 0x%8.8llx in:\n \t__TEXT [0x%8.8llx - 0x%8.8llx) __eh_frame [0x%8.8llx - 0x%8.8llx) %s\n",  v17,  *((void *)this + 5) + v16,  *((void *)this + 3),  *((void *)this + 4) + *((void *)this + 3),  *((void *)this + 5),  *((void *)this + 6) + *((void *)this + 5),  v18);
        unsigned int v24 = v15;
      }

      unint64_t v2 = *((void *)this + 7);
      unint64_t v6 = *((void *)this + 8);
      unsigned int v7 = v15;
    }

    while (v2 < v6);
  }

  uint64_t v19 = *((void *)this + 17);
  int64_t v20 = (__int128 *)*((void *)this + 18);
  unint64_t v21 = 126 - 2 * __clz(((uint64_t)v20 - v19) >> 5);
  else {
    uint64_t v22 = v21;
  }
  std::__introsort<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *,false>( v19,  v20,  v22,  1);
  *((_BYTE *)this + 104) = 1;
}

uint64_t CSCallFrameInfoForBinary::ParseCIE( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, void *a7)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  unsigned int v27 = a5;
  unsigned int v28 = a2;
  LOBYTE(v32) = 0;
  uint64_t v10 = (CSBinaryDataRef *)(a1 + 56);
  unint64_t v11 = 0LL;
  LOBYTE(v30) = CSBinaryDataRef::Get8((CSBinaryDataRef *)(a1 + 56), &v27);
  while (1)
  {
    int v12 = CSBinaryDataRef::Get8(v10, &v27);
    *((_BYTE *)&v30 + v11 + 1) = v12;
    if (!v12) {
      break;
    }
    if (++v11 == 8) {
      goto LABEL_7;
    }
  }

  if (v11 <= 6)
  {
    bzero((char *)&v30 + v11 + 2, 7 - v11);
    goto LABEL_10;
  }

uint64_t CSCallFrameInfoForBinary::ParseFDE( void *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, void *a7, int a8, void *a9)
{
  uint64_t v9 = a5;
  unsigned int v40 = a5;
  if (a8) {
    unsigned int v10 = a5 - a4 - 4;
  }
  else {
    unsigned int v10 = a4;
  }
  uint64_t v11 = a1[15];
  if (!v11) {
    goto LABEL_15;
  }
  unsigned int v15 = a1 + 15;
  do
  {
    unsigned int v16 = *(_DWORD *)(v11 + 28);
    BOOL v17 = v16 >= v10;
    if (v16 >= v10) {
      size_t v18 = (uint64_t *)v11;
    }
    else {
      size_t v18 = (uint64_t *)(v11 + 8);
    }
    if (v17) {
      unsigned int v15 = (void *)v11;
    }
    uint64_t v11 = *v18;
  }

  while (*v18);
  if (v15 == a1 + 15 || *((_DWORD *)v15 + 7) > v10)
  {
LABEL_15:
    uint64_t v19 = (FILE *)*MEMORY[0x1895F89D0];
    if (a8) {
      fprintf(v19, "CoreSymbolication warning: Unable to locate CIE at 0x%8.8x = 0x%8.8x - (0x%8.8x + 4)\n");
    }
    else {
      fprintf(v19, "CoreSymbolication warning: Unable to locate CIE with ID 0x%8.8x\n");
    }
    return v9;
  }

  uint64_t DwarfEHPtr = CSBinaryDataRef::GetDwarfEHPtr((CSBinaryDataRef *)(a1 + 7), &v40, *((unsigned __int8 *)v15 + 64), a7);
  uint64_t v22 = CSBinaryDataRef::GetDwarfEHPtr((CSBinaryDataRef *)(a1 + 7), &v40, v15[8] & 0xF, a7);
  unint64_t v23 = a9[1];
  if (DwarfEHPtr - *a9 >= v23)
  {
    if (!DwarfEHPtr)
    {
      int v24 = 0;
      goto LABEL_23;
    }

    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "CoreSymbolication warning: fde.addrRange.location 0x%8.8llx isn't in  the __TEXT segment [0x%8.8llx - 0x%8.8llx)\n",  DwarfEHPtr,  *a9,  v23);
  }

  int v24 = 1;
LABEL_23:
  if (*((_BYTE *)v15 + 33) == 122)
  {
    int ULEB128 = CSBinaryDataRef::Get_ULEB128((CSBinaryDataRef *)(a1 + 7), &v40);
    uint64_t v26 = v40;
    if (ULEB128)
    {
      uint64_t v26 = v40 + ULEB128;
      v40 += ULEB128;
    }
  }

  else
  {
    uint64_t v26 = v40;
  }

  int v27 = a6 - v26;
  if (a6 <= v26)
  {
    int v27 = 0;
    a6 = v26;
  }

  else
  {
    unsigned int v40 = a6;
  }

  uint64_t v9 = a6;
  if (v24)
  {
    unint64_t v28 = a1[19];
    unint64_t v29 = (char *)a1[18];
    if ((unint64_t)v29 >= v28)
    {
      __int128 v31 = (char *)a1[17];
      uint64_t v32 = (v29 - v31) >> 5;
      unint64_t v33 = v32 + 1;
      uint64_t v34 = v28 - (void)v31;
      if (v34 >> 4 > v33) {
        unint64_t v33 = v34 >> 4;
      }
      else {
        unint64_t v35 = v33;
      }
      if (v35)
      {
        uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>((uint64_t)(a1 + 19), v35);
        __int128 v31 = (char *)a1[17];
        unint64_t v29 = (char *)a1[18];
      }

      else
      {
        uint64_t v36 = 0LL;
      }

      uint64_t v37 = &v36[32 * v32];
      *(_DWORD *)uint64_t v37 = v10;
      *((void *)v37 + 1) = DwarfEHPtr;
      *((void *)v37 + 2) = v22;
      uint64_t v38 = &v36[32 * v35];
      *((_DWORD *)v37 + 6) = v26;
      *((_DWORD *)v37 + 7) = v27;
      __int128 v30 = v37 + 32;
      if (v29 != v31)
      {
        do
        {
          __int128 v39 = *((_OWORD *)v29 - 1);
          *((_OWORD *)v37 - 2) = *((_OWORD *)v29 - 2);
          *((_OWORD *)v37 - 1) = v39;
          v37 -= 32;
          v29 -= 32;
        }

        while (v29 != v31);
        __int128 v31 = (char *)a1[17];
      }

      a1[17] = v37;
      a1[18] = v30;
      a1[19] = v38;
      if (v31) {
        operator delete(v31);
      }
    }

    else
    {
      *(_DWORD *)unint64_t v29 = v10;
      *((void *)v29 + 1) = DwarfEHPtr;
      *((void *)v29 + 2) = v22;
      __int128 v30 = v29 + 32;
      *((_DWORD *)v29 + 6) = v26;
      *((_DWORD *)v29 + 7) = v27;
    }

    a1[18] = v30;
    return v40;
  }

  return v9;
}

void CSCallFrameInfoForBinary::ParseInstructions( void *a1, CSThread *a2, unsigned int *a3, void (*a4)(CSThread *, unsigned int *, void *, uint64_t), uint64_t a5)
{
  if (a3)
  {
    uint64_t v6 = a1[15];
    if (v6)
    {
      unsigned int v9 = *a3;
      unsigned int v10 = a1 + 15;
      do
      {
        unsigned int v11 = *(_DWORD *)(v6 + 28);
        BOOL v12 = v11 >= v9;
        if (v11 >= v9) {
          unsigned int v13 = (uint64_t *)v6;
        }
        else {
          unsigned int v13 = (uint64_t *)(v6 + 8);
        }
        if (v12) {
          unsigned int v10 = (_DWORD *)v6;
        }
        uint64_t v6 = *v13;
      }

      while (*v13);
      if (v10 != (_DWORD *)(a1 + 15) && v10[7] <= v9)
      {
        v28[0] = a2;
        v28[1] = 0LL;
        v28[2] = 0xFFFFFFFFLL;
        CSCallFrameInfoForBinary::RegLocations::RegLocations((CSCallFrameInfoForBinary::RegLocations *)&v29, a2);
        CSCallFrameInfoForBinary::RegLocations::RegLocations((CSCallFrameInfoForBinary::RegLocations *)__p, a2);
        v26[0] = v26;
        v26[1] = v26;
        void v26[2] = 0LL;
        char v14 = 1;
        do
        {
          char v22 = v14;
          if ((v14 & 1) != 0)
          {
            unsigned int v16 = v10[14];
            unsigned int v15 = v10[15];
          }

          else
          {
            unsigned int v16 = a3[6];
            unsigned int v15 = a3[7];
            std::vector<CSCppSectionRange>::__assign_with_size[abi:ne180100]<CSCppSectionRange*,CSCppSectionRange*>( (char *)__p,  (char *)v29,  (uint64_t)v30,  0xAAAAAAAAAAAAAAABLL * ((v30 - (_BYTE *)v29) >> 3));
          }

          if (v15)
          {
            unsigned int v25 = v16;
            unint64_t v17 = a1[7];
            unint64_t v18 = a1[8];
            if (v18 > v17)
            {
              unsigned int v19 = v16 + v15;
              if ((v18 - v17) > (unint64_t)v16 && v16 < v19)
              {
                int v21 = (char *)&loc_186092838
                    + 4
                    * byte_1860A4CF0[(CSBinaryDataRef::Get8((CSBinaryDataRef *)(a1 + 7), &v25) >> 6) ^ 2];
                __asm { BR              X9 }
              }
            }
          }

          char v14 = 0;
        }

        while ((v22 & 1) != 0);
        if (a4) {
          a4(a2, a3, v28, a5);
        }
        std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::clear((uint64_t *)v26);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        if (v29)
        {
          __int128 v30 = v29;
          operator delete(v29);
        }
      }
    }
  }

void sub_186092F30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24, uint64_t a25)
{
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }

  if (a24)
  {
    a25 = (uint64_t)a24;
    operator delete(a24);
  }

  _Unwind_Resume(a1);
}

CSCallFrameInfoForBinary::RegLocations *CSCallFrameInfoForBinary::RegLocations::RegLocations( CSCallFrameInfoForBinary::RegLocations *this, const CSThread *a2)
{
  unsigned int v4 = (*(uint64_t (**)(const CSThread *))(*(void *)a2 + 32LL))(a2);
  unint64_t v5 = (CSCallFrameInfoForBinary::RegLocations *)std::vector<CSCallFrameInfoForBinary::RegLocation>::vector(this, v4);
  CSCallFrameInfoForBinary::RegLocations::SetABIDefaults(v5, a2);
  return this;
}

void sub_186092FDC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t CSCallFrameInfoForBinary::RegLocations::SetABIDefaults( CSCallFrameInfoForBinary::RegLocations *this, const CSThread *a2)
{
  uint64_t result = (*(uint64_t (**)(const CSThread *, void))(*(void *)a2 + 48LL))(a2, 0LL);
  uint64_t v4 = *(void *)this;
  if (*((void *)this + 1) != *(void *)this)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      if (result == v6)
      {
        *(void *)(v4 + 24LL * result + 8) = 0LL;
        int v7 = 4;
      }

      else
      {
        int v7 = 0;
      }

      *(_DWORD *)(v4 + v5) = v7;
      ++v6;
      uint64_t v4 = *(void *)this;
      v5 += 24LL;
    }

    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 3));
  }

  return result;
}

uint64_t CSCallFrameInfoForBinary::FindFDE(CSCallFrameInfoForBinary *this, unint64_t a2)
{
  if (!*((_BYTE *)this + 104))
  {
    CSCallFrameInfoForBinary::ParseEHFrameData(this);
    *((_BYTE *)this + 104) = 1;
  }

  uint64_t result = *((void *)this + 17);
  uint64_t v5 = *((void *)this + 18);
  if (result == v5) {
    return 0LL;
  }
  unint64_t v6 = (v5 - result) >> 5;
  do
  {
    unint64_t v7 = v6 >> 1;
    uint64_t v8 = result + 32 * (v6 >> 1);
    unint64_t v9 = *(void *)(v8 + 16) + *(void *)(v8 + 8);
    uint64_t v10 = v8 + 32;
    v6 += ~(v6 >> 1);
    if (v9 <= a2) {
      uint64_t result = v10;
    }
    else {
      unint64_t v6 = v7;
    }
  }

  while (v6);
  if (result == v5 || a2 - *(void *)(result + 8) >= *(void *)(result + 16)) {
    return 0LL;
  }
  return result;
}

uint64_t CSCallFrameInfoForBinary::UnwindThreadState( CSCallFrameInfoForBinary *a1, const CSThread *a2, uint64_t a3, CSThread *a4, void *a5)
{
  uint64_t FDE = CSCallFrameInfoForBinary::FindFDE(a1, (unint64_t)a5);
  if (!FDE) {
    return 0LL;
  }
  unsigned int v11 = (unsigned int *)FDE;
  v17[0] = a2;
  v17[1] = 0LL;
  v17[2] = 0xFFFFFFFFLL;
  CSCallFrameInfoForBinary::RegLocations::RegLocations((CSCallFrameInfoForBinary::RegLocations *)__p, a2);
  __p[3] = a5;
  char v19 = 0;
  CSCallFrameInfoForBinary::ParseInstructions( a1,  a2,  v11,  (void (*)(CSThread *, unsigned int *, void *, uint64_t))FindRowForAddress,  (uint64_t)v17);
  if (v19 && (v12 = (*(uint64_t (**)(const CSThread *))(*(void *)a2 + 32LL))(a2), (int v13 = v12) != 0))
  {
    uint64_t v14 = 0LL;
    LODWORD(v15) = 0;
    do
    {
      uint64_t v12 = CSCallFrameInfoForBinary::UnwindRegisterAtIndex(v12, v14, a2, (uint64_t)v17, a3, a4);
      uint64_t v15 = (v15 + v12);
      uint64_t v14 = (v14 + 1);
    }

    while (v13 != (_DWORD)v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v15;
}

void sub_18609322C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL FindRowForAddress(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  unint64_t v5 = *((void *)a3 + 1) + *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a4 + 48);
  if (v5 <= v6)
  {
    __int128 v7 = *a3;
    *(void *)(a4 + 16) = *((void *)a3 + 2);
    *(_OWORD *)a4 = v7;
    if ((__int128 *)a4 != a3)
    {
      std::vector<CSCppSectionRange>::__assign_with_size[abi:ne180100]<CSCppSectionRange*,CSCppSectionRange*>( (char *)(a4 + 24),  *((char **)a3 + 3),  *((void *)a3 + 4),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 4) - *((void *)a3 + 3)) >> 3));
      unint64_t v6 = *(void *)(a4 + 48);
    }
  }

  BOOL result = v5 < v6;
  *(_BYTE *)(a4 + 56) = v5 >= v6;
  return result;
}

uint64_t CSCallFrameInfoForBinary::UnwindRegisterAtIndex( uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, CSThread *a6)
{
  char v31 = 0;
  uint64_t v11 = *(void *)(a4 + 24);
  uint64_t v12 = v11 + 24LL * a2;
  else {
    uint64_t v13 = v11 + 24LL * a2;
  }
  if ((*(unsigned int (**)(_BYTE *, void))(*(void *)a3 + 64LL))(a3, 0LL) == (_DWORD)a2)
  {
    unsigned int v14 = (*(uint64_t (**)(_BYTE *, void))(*(void *)a3 + 72LL))(a3, 0LL);
    uint64_t v15 = *(void *)(a4 + 24);
    uint64_t v16 = v15 + 24LL * v14;
    if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a4 + 32) - v15) >> 3) <= v14) {
      uint64_t v17 = 0LL;
    }
    else {
      uint64_t v17 = v15 + 24LL * v14;
    }
    if (v13)
    {
      if (v17) {
        BOOL v18 = *(_DWORD *)v13 == 0;
      }
      else {
        BOOL v18 = 0;
      }
      if (v18) {
        uint64_t v13 = v16;
      }
      else {
        uint64_t v13 = v12;
      }
LABEL_17:
      uint64_t v30 = -1LL;
      uint64_t v19 = 1LL;
      switch(*(_DWORD *)v13)
      {
        case 0:
        case 2:
          return v19;
        case 1:
          CSThread::SetRegisterIsValid((uint64_t)a6, a2, 0LL, 0LL);
          return v19;
        case 3:
        case 4:
          uint64_t RegisterValue = CSThread::GetRegisterValue((uint64_t)a3, *(unsigned int *)(a4 + 16), 2LL, -1LL, (uint64_t)&v31);
          if (!v31) {
            goto LABEL_30;
          }
          int v21 = (tree *)(RegisterValue + *(int *)(a4 + 20) + *(void *)(v13 + 8));
          if (*(_DWORD *)v13 == 4) {
            goto LABEL_35;
          }
          int v21 = (tree *)v30;
LABEL_35:
          CSThread::SetRegisterValue((uint64_t)a6, a2, 0LL, (uint64_t)v21);
          break;
        case 5:
          uint64_t v24 = CSThread::GetRegisterValue((uint64_t)a3, *(unsigned int *)(v13 + 8), 2LL, 0LL, (uint64_t)&v31);
          uint64_t v30 = v24;
          if (!v31) {
            return 0LL;
          }
          int v21 = (tree *)v24;
          goto LABEL_35;
        case 6:
        case 7:
          v28[0] = a3;
          v28[1] = a5;
          char v29 = 0;
          int v27 = 0LL;
          CSBinaryDataRef::CSBinaryDataRef( (CSBinaryDataRef *)v26,  *(const unsigned __int8 **)(v13 + 8),  *(unsigned int *)(v13 + 16),  0);
          if (a3[9]) {
            char v23 = 8;
          }
          else {
            char v23 = 4;
          }
          v26[17] = v23;
          if (CSDwarfExpression::Evaluate( (uint64_t (*)(uint64_t, void, char *))DWARFExpressionReadMemoryCallback,  (uint64_t (*)(uint64_t, uint64_t, char *))DWARFExpressionReadRegisterCallback,  (uint64_t)v28,  (CSBinaryDataRef *)v26,  0,  *(unsigned int *)(v13 + 16),  0LL,  &v27))
          {
            goto LABEL_29;
          }

          if (*(_DWORD *)v13 == 7)
          {
            CSThread::SetRegisterValue((uint64_t)a6, a2, 0LL, (uint64_t)v27);
          }

          else if (mapped_memory_read_pointer(a5, v27, &v30))
          {
LABEL_29:
            CSThread::SetRegisterIsValid((uint64_t)a6, a2, 0LL, 0LL);
            uint64_t v19 = 0LL;
          }

          else
          {
            CSThread::SetRegisterValue((uint64_t)a6, a2, 0LL, v30);
          }

          CSCppAddressSet::sort((CSCppAddressSet *)v26);
          return v19;
        default:
          goto LABEL_22;
      }

      return v19;
    }

    uint64_t v13 = v17;
  }

  if (v13) {
    goto LABEL_17;
  }
LABEL_22:
  uint64_t v19 = 0LL;
  if ((*(unsigned int (**)(_BYTE *, void))(*(void *)a3 + 48LL))(a3, 0LL) == (_DWORD)a2)
  {
    uint64_t v22 = CSThread::GetRegisterValue((uint64_t)a3, *(unsigned int *)(a4 + 16), 2LL, 0LL, (uint64_t)&v31);
    if (v31)
    {
      return CSThread::SetSP(a6, v22 + *(int *)(a4 + 20));
    }

    else
    {
LABEL_30:
      CSThread::SetRegisterIsValid((uint64_t)a6, a2, 0LL, 0LL);
      return 0LL;
    }
  }

  return v19;
}

void sub_186093604(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

char *DWARFExpressionReadMemoryCallback(uint64_t a1, tree *a2, unsigned __int8 *a3)
{
  uint64_t v4 = *(const char **)(a1 + 8);
  int v5 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v16 = 0LL;
  mach_error_t v6 = mapped_memory_read(v4, a2, *((void *)a3 + 1), &v16);
  if (v6)
  {
    __int128 v7 = DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
    if (mach_error_string(v6)) {
      snprintf( DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error,  0x400uLL,  "memory read of %u bytes at address 0x%8.8llx failed: %s");
    }
    else {
      snprintf( DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error,  0x400uLL,  "memory read of %u bytes at address 0x%8.8llx failed: 0x%8.8x");
    }
  }

  else if (v16)
  {
    unsigned int v8 = *a3;
    if (v8 > 8 || ((1 << v8) & 0x1E2) == 0)
    {
      if (v8 == 128)
      {
        __int128 v7 = 0LL;
        *((void *)a3 + 4) = v16;
      }

      else
      {
        __int128 v7 = DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
        snprintf( DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error,  0x400uLL,  "Unsupported DW_ATE encoding in value argument: %u");
      }
    }

    else
    {
      unsigned int v15 = 0;
      CSBinaryDataRef::CSBinaryDataRef((CSBinaryDataRef *)v14, v16, *((void *)a3 + 1), v5 != 0);
      unint64_t Max64 = CSBinaryDataRef::GetMax64((CSBinaryDataRef *)v14, &v15, *((_DWORD *)a3 + 2));
      *((void *)a3 + 4) = Max64;
      if (*a3 - 5 <= 1)
      {
        unint64_t v11 = *((void *)a3 + 1);
        if (v11 <= 7)
        {
          char v12 = 8 * v11;
          if (((Max64 >> (v12 - 1)) & 1) != 0) {
            *((void *)a3 + 4) = (-1LL << v12) | Max64;
          }
        }
      }

      CSCppAddressSet::sort((CSCppAddressSet *)v14);
      return 0LL;
    }
  }

  else
  {
    __int128 v7 = DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
    snprintf( DWARFExpressionReadMemoryCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error,  0x400uLL,  "memory read of %u bytes at address 0x%8.8llx failed: NULL data returned");
  }

  return v7;
}

void sub_1860937A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

char *DWARFExpressionReadRegisterCallback(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  *(_BYTE *)a3 = 7;
  uint64_t v5 = 8LL;
  if (!*(_BYTE *)(v4 + 9)) {
    uint64_t v5 = 4LL;
  }
  *(void *)(a3 + 8) = v5;
  char v8 = 0;
  *(void *)(a3 + 32) = CSThread::GetRegisterValue(v4, a2, 2LL, 0xFFFFFFFFLL, (uint64_t)&v8);
  if (v8) {
    return 0LL;
  }
  mach_error_t v6 = DWARFExpressionReadRegisterCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error;
  snprintf( DWARFExpressionReadRegisterCallback(void *,unsigned long long,CSDwarfExpression::Value *)::g_expr_error,  0x400uLL,  "failed to read register number: %llu",  a2);
  return v6;
}

void std::__introsort<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *,false>( uint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
LABEL_1:
  unint64_t v8 = a1;
  while (2)
  {
    a1 = v8;
    uint64_t v9 = (uint64_t)a2 - v8;
    unint64_t v10 = (uint64_t)((uint64_t)a2 - v8) >> 5;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if (*((void *)a2 - 3) < *(void *)(v8 + 8))
        {
          __int128 v112 = *(_OWORD *)v8;
          __int128 v121 = *(_OWORD *)(v8 + 16);
          __int128 v42 = *(a2 - 1);
          *(_OWORD *)unint64_t v8 = *(a2 - 2);
          *(_OWORD *)(v8 + 16) = v42;
          *(a2 - 2) = v112;
          *(a2 - 1) = v121;
        }

        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)v8,  (__int128 *)(v8 + 32),  a2 - 2);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( v8,  v8 + 32,  v8 + 64,  (uint64_t)(a2 - 2));
        return;
      case 5uLL:
        int v43 = (__int128 *)(v8 + 32);
        __int128 v44 = (__int128 *)(v8 + 64);
        uint64_t v45 = (__int128 *)(v8 + 96);
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( v8,  v8 + 32,  v8 + 64,  v8 + 96);
        if (*((void *)a2 - 3) < *(void *)(v8 + 104))
        {
          __int128 v46 = *v45;
          __int128 v122 = *(_OWORD *)(v8 + 112);
          __int128 v47 = *(a2 - 1);
          *uint64_t v45 = *(a2 - 2);
          *(_OWORD *)(v8 + 112) = v47;
          *(a2 - 2) = v46;
          *(a2 - 1) = v122;
          if (*(void *)(v8 + 104) < *(void *)(v8 + 72))
          {
            __int128 v49 = *v44;
            __int128 v48 = *(_OWORD *)(v8 + 80);
            __int128 v50 = *(_OWORD *)(v8 + 112);
            *__int128 v44 = *v45;
            *(_OWORD *)(v8 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v50;
            *uint64_t v45 = v49;
            *(_OWORD *)(v8 + 112) = v48;
            if (*(void *)(v8 + 72) < *(void *)(v8 + 40))
            {
              __int128 v52 = *v43;
              __int128 v51 = *(_OWORD *)(v8 + 48);
              __int128 v53 = *(_OWORD *)(v8 + 80);
              *int v43 = *v44;
              *(_OWORD *)(v8 + 48) = v53;
              *__int128 v44 = v52;
              *(_OWORD *)(v8 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v51;
              if (*(void *)(v8 + 40) < *(void *)(v8 + 8))
              {
                __int128 v113 = *(_OWORD *)v8;
                __int128 v123 = *(_OWORD *)(v8 + 16);
                __int128 v54 = *(_OWORD *)(v8 + 48);
                *(_OWORD *)unint64_t v8 = *v43;
                *(_OWORD *)(v8 + 16) = v54;
                *int v43 = v113;
                *(_OWORD *)(v8 + 48) = v123;
              }
            }
          }
        }

        return;
      default:
        if (v9 <= 767)
        {
          __int128 v55 = (__int128 *)(v8 + 32);
          BOOL v57 = (__int128 *)v8 == a2 || v55 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v57)
            {
              uint64_t v58 = 0LL;
              char v59 = (void *)v8;
              do
              {
                __int128 v60 = v55;
                unint64_t v61 = v59[5];
                if (v61 < v59[1])
                {
                  uint64_t v62 = *(void *)v60;
                  __int128 v114 = *((_OWORD *)v59 + 3);
                  uint64_t v63 = v58;
                  while (1)
                  {
                    uint64_t v64 = v8 + v63;
                    __int128 v65 = *(_OWORD *)(v8 + v63 + 16);
                    *(_OWORD *)(v64 + 32) = *(_OWORD *)(v8 + v63);
                    *(_OWORD *)(v64 + 48) = v65;
                    if (!v63) {
                      break;
                    }
                    v63 -= 32LL;
                    if (v61 >= *(void *)(v64 - 24))
                    {
                      uint64_t v66 = v8 + v63 + 32;
                      goto LABEL_78;
                    }
                  }

                  uint64_t v66 = v8;
LABEL_78:
                  *(void *)uint64_t v66 = v62;
                  *(void *)(v66 + 8) = v61;
                  *(_OWORD *)(v66 + 16) = v114;
                }

                __int128 v55 = v60 + 2;
                v58 += 32LL;
                char v59 = v60;
              }

              while (v60 + 2 != a2);
            }
          }

          else if (!v57)
          {
            do
            {
              unint64_t v100 = v55;
              unint64_t v101 = *(void *)(a1 + 40);
              if (v101 < *(void *)(a1 + 8))
              {
                uint64_t v102 = *(void *)v55;
                __int128 v117 = *(_OWORD *)(a1 + 48);
                unint64_t v103 = v100;
                do
                {
                  __int128 v104 = *(v103 - 1);
                  *unint64_t v103 = *(v103 - 2);
                  v103[1] = v104;
                  unint64_t v105 = *((void *)v103 - 7);
                  v103 -= 2;
                }

                while (v101 < v105);
                *(void *)unint64_t v103 = v102;
                *((void *)v103 + 1) = v101;
                v103[1] = v117;
              }

              __int128 v55 = v100 + 2;
              a1 = (uint64_t)v100;
            }

            while (v100 + 2 != a2);
          }

          return;
        }

        if (!a3)
        {
          if ((__int128 *)v8 != a2)
          {
            int64_t v67 = (v10 - 2) >> 1;
            int64_t v68 = v67;
            do
            {
              int64_t v69 = v68;
              if (v67 >= v68)
              {
                uint64_t v70 = (2 * v68) | 1;
                unint64_t v71 = v8 + 32 * v70;
                if (2 * v69 + 2 < (uint64_t)v10)
                {
                  unint64_t v72 = *(void *)(v71 + 8);
                  unint64_t v73 = *(void *)(v71 + 40);
                  v71 += 32LL * (v72 < v73);
                  if (v72 < v73) {
                    uint64_t v70 = 2 * v69 + 2;
                  }
                }

                unint64_t v74 = *(void *)(v8 + 32 * v69 + 8);
                if (*(void *)(v71 + 8) >= v74)
                {
                  unint64_t v75 = v8 + 32 * v69;
                  uint64_t v76 = *(void *)v75;
                  __int128 v115 = *(_OWORD *)(v75 + 16);
                  do
                  {
                    uint64_t v77 = (_OWORD *)v75;
                    unint64_t v75 = v71;
                    __int128 v78 = *(_OWORD *)(v71 + 16);
                    *uint64_t v77 = *(_OWORD *)v71;
                    v77[1] = v78;
                    if (v67 < v70) {
                      break;
                    }
                    uint64_t v79 = (2 * v70) | 1;
                    unint64_t v71 = v8 + 32 * v79;
                    uint64_t v80 = 2 * v70 + 2;
                    if (v80 < (uint64_t)v10)
                    {
                      unint64_t v81 = *(void *)(v71 + 8);
                      unint64_t v82 = *(void *)(v71 + 40);
                      v71 += 32LL * (v81 < v82);
                      if (v81 < v82) {
                        uint64_t v79 = v80;
                      }
                    }

                    uint64_t v70 = v79;
                  }

                  while (*(void *)(v71 + 8) >= v74);
                  *(void *)unint64_t v75 = v76;
                  *(void *)(v75 + 8) = v74;
                  *(_OWORD *)(v75 + 16) = v115;
                }
              }

              int64_t v68 = v69 - 1;
            }

            while (v69);
            uint64_t v83 = (unint64_t)v9 >> 5;
            do
            {
              uint64_t v84 = 0LL;
              __int128 v116 = *(_OWORD *)v8;
              __int128 v124 = *(_OWORD *)(v8 + 16);
              std::string v85 = (_OWORD *)v8;
              do
              {
                char v86 = &v85[2 * v84 + 2];
                uint64_t v87 = (2 * v84) | 1;
                uint64_t v88 = 2 * v84 + 2;
                if (v88 < v83)
                {
                  unint64_t v89 = *((void *)v86 + 1);
                  unint64_t v90 = *((void *)v86 + 5);
                  v86 += 2 * (v89 < v90);
                  if (v89 < v90) {
                    uint64_t v87 = v88;
                  }
                }

                __int128 v91 = v86[1];
                *std::string v85 = *v86;
                v85[1] = v91;
                std::string v85 = v86;
                uint64_t v84 = v87;
              }

              while (v87 <= (uint64_t)((unint64_t)(v83 - 2) >> 1));
              a2 -= 2;
              if (v86 == a2)
              {
                *char v86 = v116;
                v86[1] = v124;
              }

              else
              {
                __int128 v92 = a2[1];
                *char v86 = *a2;
                v86[1] = v92;
                *a2 = v116;
                a2[1] = v124;
                uint64_t v93 = (uint64_t)v86 - v8 + 32;
                if (v93 >= 33)
                {
                  unint64_t v94 = (((unint64_t)v93 >> 5) - 2) >> 1;
                  unint64_t v95 = *((void *)v86 + 1);
                  if (*(void *)(v8 + 32 * v94 + 8) < v95)
                  {
                    uint64_t v96 = *(void *)v86;
                    __int128 v108 = v86[1];
                    do
                    {
                      uint64_t v97 = v86;
                      char v86 = (__int128 *)(v8 + 32 * v94);
                      __int128 v98 = v86[1];
                      *uint64_t v97 = *v86;
                      v97[1] = v98;
                      if (!v94) {
                        break;
                      }
                      unint64_t v94 = (v94 - 1) >> 1;
                    }

                    while (*(void *)(v8 + 32 * v94 + 8) < v95);
                    *(void *)char v86 = v96;
                    *((void *)v86 + 1) = v95;
                    v86[1] = v108;
                  }
                }
              }
            }

            while (v83-- > 2);
          }

          return;
        }

        unint64_t v11 = v10 >> 1;
        char v12 = (__int128 *)(v8 + 32 * (v10 >> 1));
        if ((unint64_t)v9 <= 0x1000)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)(a1 + 32 * (v10 >> 1)),  (__int128 *)a1,  a2 - 2);
        }

        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)a1,  (__int128 *)(a1 + 32 * (v10 >> 1)),  a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)(a1 + 32),  v12 - 2,  a2 - 4);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)(a1 + 64),  (__int128 *)(a1 + 32 + 32 * v11),  a2 - 6);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( v12 - 2,  v12,  (__int128 *)(a1 + 32 + 32 * v11));
          __int128 v109 = *(_OWORD *)a1;
          __int128 v118 = *(_OWORD *)(a1 + 16);
          __int128 v13 = v12[1];
          *(_OWORD *)a1 = *v12;
          *(_OWORD *)(a1 + 16) = v13;
          __int128 *v12 = v109;
          v12[1] = v118;
        }

        --a3;
        if ((a4 & 1) == 0)
        {
          unint64_t v14 = *(void *)(a1 + 8);
          if (*(void *)(a1 - 24) < v14) {
            goto LABEL_11;
          }
          uint64_t v30 = *(void *)a1;
          __int128 v107 = *(_OWORD *)(a1 + 16);
          if (v14 >= *((void *)a2 - 3))
          {
            unint64_t v33 = a1 + 32;
            do
            {
              unint64_t v8 = v33;
              unint64_t v34 = *(void *)(v33 + 8);
              v33 += 32LL;
            }

            while (v14 >= v34);
          }

          else
          {
            uint64_t v31 = a1;
            do
            {
              unint64_t v8 = v31 + 32;
              unint64_t v32 = *(void *)(v31 + 40);
              v31 += 32LL;
            }

            while (v14 >= v32);
          }

          unint64_t v35 = a2;
          if (v8 < (unint64_t)a2)
          {
            uint64_t v36 = a2;
            do
            {
              unint64_t v35 = v36 - 2;
              unint64_t v37 = *((void *)v36 - 3);
              v36 -= 2;
            }

            while (v14 < v37);
          }

          while (v8 < (unint64_t)v35)
          {
            __int128 v111 = *(_OWORD *)v8;
            __int128 v120 = *(_OWORD *)(v8 + 16);
            __int128 v38 = v35[1];
            *(_OWORD *)unint64_t v8 = *v35;
            *(_OWORD *)(v8 + 16) = v38;
            *unint64_t v35 = v111;
            v35[1] = v120;
            do
            {
              unint64_t v39 = *(void *)(v8 + 40);
              v8 += 32LL;
            }

            while (v14 >= v39);
            do
            {
              unint64_t v40 = *((void *)v35 - 3);
              v35 -= 2;
            }

            while (v14 < v40);
          }

          if (v8 - 32 != a1)
          {
            __int128 v41 = *(_OWORD *)(v8 - 16);
            *(_OWORD *)a1 = *(_OWORD *)(v8 - 32);
            *(_OWORD *)(a1 + 16) = v41;
          }

          a4 = 0;
          *(void *)(v8 - 32) = v30;
          *(void *)(v8 - 24) = v14;
          *(_OWORD *)(v8 - 16) = v107;
          continue;
        }

        unint64_t v14 = *(void *)(a1 + 8);
LABEL_11:
        uint64_t v15 = 0LL;
        uint64_t v16 = *(void *)a1;
        __int128 v106 = *(_OWORD *)(a1 + 16);
        do
        {
          unint64_t v17 = *(void *)(a1 + v15 + 40);
          v15 += 32LL;
        }

        while (v17 < v14);
        unint64_t v18 = a1 + v15;
        uint64_t v19 = a2;
        if (v15 == 32)
        {
          uint64_t v22 = a2;
          while (v18 < (unint64_t)v22)
          {
            int v20 = v22 - 2;
            unint64_t v23 = *((void *)v22 - 3);
            v22 -= 2;
            if (v23 < v14) {
              goto LABEL_21;
            }
          }

          int v20 = v22;
        }

        else
        {
          do
          {
            int v20 = v19 - 2;
            unint64_t v21 = *((void *)v19 - 3);
            v19 -= 2;
          }

          while (v21 >= v14);
        }

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( __int128 *result, __int128 *a2, __int128 *a3)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v4 = *((void *)a3 + 1);
  if (v3 >= *((void *)result + 1))
  {
    if (v4 < v3)
    {
      __int128 v9 = *a2;
      __int128 v8 = a2[1];
      __int128 v10 = a3[1];
      *a2 = *a3;
      a2[1] = v10;
      *a3 = v9;
      a3[1] = v8;
      if (*((void *)a2 + 1) < *((void *)result + 1))
      {
        __int128 v12 = *result;
        __int128 v11 = result[1];
        __int128 v13 = a2[1];
        *BOOL result = *a2;
        result[1] = v13;
        *a2 = v12;
        a2[1] = v11;
      }
    }
  }

  else
  {
    if (v4 >= v3)
    {
      __int128 v15 = *result;
      __int128 v14 = result[1];
      __int128 v16 = a2[1];
      *BOOL result = *a2;
      result[1] = v16;
      *a2 = v15;
      a2[1] = v14;
      if (*((void *)a3 + 1) >= *((void *)a2 + 1)) {
        return result;
      }
      __int128 v6 = *a2;
      __int128 v5 = a2[1];
      __int128 v17 = a3[1];
      *a2 = *a3;
      a2[1] = v17;
    }

    else
    {
      __int128 v6 = *result;
      __int128 v5 = result[1];
      __int128 v7 = a3[1];
      *BOOL result = *a3;
      result[1] = v7;
    }

    *a3 = v6;
    a3[1] = v5;
  }

  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 5;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      if (*(void *)(a2 - 24) < *(void *)(a1 + 8))
      {
        __int128 v7 = *(_OWORD *)a1;
        __int128 v6 = *(_OWORD *)(a1 + 16);
        __int128 v8 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 32);
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a2 - 32) = v7;
        *(_OWORD *)(a2 - 16) = v6;
      }

      return result;
    case 3LL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)a1,  (__int128 *)(a1 + 32),  (__int128 *)(a2 - 32));
      return 1LL;
    case 4LL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( a1,  a1 + 32,  a1 + 64,  a2 - 32);
      return 1LL;
    case 5LL:
      uint64_t v19 = (__int128 *)(a1 + 32);
      int v20 = (__int128 *)(a1 + 64);
      unint64_t v21 = (__int128 *)(a1 + 96);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( a1,  a1 + 32,  a1 + 64,  a1 + 96);
      if (*(void *)(a2 - 24) < *(void *)(a1 + 104))
      {
        __int128 v23 = *v21;
        __int128 v22 = *(_OWORD *)(a1 + 112);
        __int128 v24 = *(_OWORD *)(a2 - 16);
        __int128 *v21 = *(_OWORD *)(a2 - 32);
        *(_OWORD *)(a1 + 112) = v24;
        *(_OWORD *)(a2 - 32) = v23;
        *(_OWORD *)(a2 - 16) = v22;
        if (*(void *)(a1 + 104) < *(void *)(a1 + 72))
        {
          __int128 v26 = *v20;
          __int128 v25 = *(_OWORD *)(a1 + 80);
          __int128 v27 = *(_OWORD *)(a1 + 112);
          *int v20 = *v21;
          *(_OWORD *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v27;
          __int128 *v21 = v26;
          *(_OWORD *)(a1 + 112) = v25;
          if (*(void *)(a1 + 72) < *(void *)(a1 + 40))
          {
            __int128 v29 = *v19;
            __int128 v28 = *(_OWORD *)(a1 + 48);
            __int128 v30 = *(_OWORD *)(a1 + 80);
            *uint64_t v19 = *v20;
            *(_OWORD *)(a1 + 48) = v30;
            *int v20 = v29;
            *(_OWORD *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v28;
            if (*(void *)(a1 + 40) < *(void *)(a1 + 8))
            {
              __int128 v32 = *(_OWORD *)a1;
              __int128 v31 = *(_OWORD *)(a1 + 16);
              __int128 v33 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v33;
              *uint64_t v19 = v32;
              *(_OWORD *)(a1 + 48) = v31;
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v9 = a1 + 64;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( (__int128 *)a1,  (__int128 *)(a1 + 32),  (__int128 *)(a1 + 64));
      uint64_t v10 = a1 + 96;
      if (a1 + 96 == a2) {
        return 1LL;
      }
      uint64_t v11 = 0LL;
      int v12 = 0;
      break;
  }

  while (1)
  {
    unint64_t v13 = *(void *)(v10 + 8);
    if (v13 < *(void *)(v9 + 8))
    {
      uint64_t v14 = *(void *)v10;
      __int128 v34 = *(_OWORD *)(v10 + 16);
      uint64_t v15 = v11;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        __int128 v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64) {
          break;
        }
        v15 -= 32LL;
        if (v13 >= *(void *)(v16 + 40))
        {
          uint64_t v18 = a1 + v15 + 96;
          goto LABEL_12;
        }
      }

      uint64_t v18 = a1;
LABEL_12:
      *(void *)uint64_t v18 = v14;
      *(void *)(v18 + 8) = v13;
      *(_OWORD *)(v18 + 16) = v34;
      if (++v12 == 8) {
        return v10 + 32 == a2;
      }
    }

    uint64_t v9 = v10;
    v11 += 32LL;
    v10 += 32LL;
    if (v10 == a2) {
      return 1LL;
    }
  }

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,CSCallFrameInfoForBinary::ParseEHFrameData(void)::$_0 &,CSCallFrameInfoForBinary::FDE *>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a4 + 8) < *(void *)(a3 + 8))
  {
    __int128 v9 = *(_OWORD *)a3;
    __n128 result = *(__n128 *)(a3 + 16);
    __int128 v10 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)(a3 + 16) = v10;
    *(_OWORD *)a4 = v9;
    *(__n128 *)(a4 + 16) = result;
    if (*(void *)(a3 + 8) < *(void *)(a2 + 8))
    {
      __int128 v11 = *(_OWORD *)a2;
      __n128 result = *(__n128 *)(a2 + 16);
      __int128 v12 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 16) = v12;
      *(_OWORD *)a3 = v11;
      *(__n128 *)(a3 + 16) = result;
      if (*(void *)(a2 + 8) < *(void *)(a1 + 8))
      {
        __int128 v13 = *(_OWORD *)a1;
        __n128 result = *(__n128 *)(a1 + 16);
        __int128 v14 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v14;
        *(_OWORD *)a2 = v13;
        *(__n128 *)(a2 + 16) = result;
      }
    }
  }

  return result;
}

void *std::vector<CSCallFrameInfoForBinary::RegLocation>::vector(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    std::vector<CSCppFlatbufferRelocation>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (_DWORD *)a1[1];
    __int128 v5 = &v4[6 * a2];
    uint64_t v6 = 24 * a2;
    do
    {
      *uint64_t v4 = 2;
      v4 += 6;
      v6 -= 24LL;
    }

    while (v6);
    a1[1] = v5;
  }

  return a1;
}

void sub_186094420(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    unint64_t v2 = (uint64_t *)a1[1];
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0LL;
    while (v2 != a1)
    {
      __int128 v5 = (uint64_t *)v2[1];
      std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::__delete_node[abi:ne180100]<>((int)a1, v2);
      unint64_t v2 = v5;
    }
  }

void std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::__delete_node[abi:ne180100]<>( int a1, void *__p)
{
  uint64_t v3 = (void *)__p[2];
  if (v3)
  {
    __p[3] = v3;
    operator delete(v3);
  }

  operator delete(__p);
}

uint64_t **std::__tree<std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,CSCallFrameInfoForBinary::CIE>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  __int128 v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        __int128 v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        __int128 v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        __int128 v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    __int128 v9 = a1 + 1;
LABEL_10:
    __int128 v11 = operator new(0x48uLL);
    v11[7] = **a4;
    v11[16] = 0;
    *((_OWORD *)v11 + 2) = 0u;
    *((_OWORD *)v11 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = 0u;
    std::__tree<TRange<Pointer64>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }

  return v9;
}

void *std::__list_imp<CSCallFrameInfoForBinary::RegLocations>::__create_node[abi:ne180100]<CSCallFrameInfoForBinary::RegLocations const&>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v7 = operator new(0x28uLL);
  *__int128 v7 = a2;
  v7[1] = a3;
  v7[3] = 0LL;
  v7[4] = 0LL;
  v7[2] = 0LL;
  std::vector<CSCallFrameInfoForBinary::RegLocation>::__init_with_size[abi:ne180100]<CSCallFrameInfoForBinary::RegLocation*,CSCallFrameInfoForBinary::RegLocation*>( v7 + 2,  *(const void **)a4,  *(void *)(a4 + 8),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3));
  return v7;
}

void sub_1860945F8(_Unwind_Exception *a1)
{
}

void *std::vector<CSCallFrameInfoForBinary::RegLocation>::__init_with_size[abi:ne180100]<CSCallFrameInfoForBinary::RegLocation*,CSCallFrameInfoForBinary::RegLocation*>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<CSCppFlatbufferRelocation>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_186094668(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void CSCppCFDataMemory::CSCppCFDataMemory(CSCppCFDataMemory *this, CFTypeRef cf)
{
  *(void *)this = off_189DFACB0;
  uint64_t v3 = (const __CFData *)CFRetain(cf);
  *((void *)this + 1) = v3;
  *((void *)this + 2) = CFDataGetBytePtr(v3);
  *((void *)this + pthread_mutex_lock((pthread_mutex_t *)this + 3) = CFDataGetLength(*((CFDataRef *)this + 1));
}

void CSCppCFDataMemory::~CSCppCFDataMemory(CFTypeRef *this)
{
  *this = off_189DFACB0;
  CFRelease(this[1]);
}

{
  void *v1;
  CSCppCFDataMemory::~CSCppCFDataMemory(this);
  operator delete(v1);
}

uint64_t CSCppCFDataMemory::bytes_at(uint64_t a1, uint64_t a2, uint64_t a3)
{
  else {
    return 0LL;
  }
}

uint64_t CSCppCFDataMemory::footprint(CSCppCFDataMemory *this)
{
  return *((void *)this + 3) + 32LL;
}

void CSCppCFDataMemory::validate(CSCppCFDataMemory *this)
{
  uint64_t v1 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"Unimplemented: ", 15LL);
  unint64_t v2 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppCFDataMemory.cpp");
  size_t v3 = strlen(v2);
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)v2, v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)":", 1LL);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v9, &v7);
  Exception::Exception(v6, &v7);
  exception = __cxa_allocate_exception(0x20uLL);
  Exception::Exception(exception, (uint64_t)v6);
}

void sub_186094820( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  a19 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&a19 + *(void *)(a19 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  a20 = MEMORY[0x189614750] + 16LL;
  if (a33 < 0) {
    operator delete(a28);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x186E30F0C](&a36);
  _Unwind_Resume(a1);
}

uint64_t CSCppCFDataMemory::is_task(CSCppCFDataMemory *this)
{
  return 0LL;
}

uint64_t CSCppCFDataMemory::is_dyld_shared_cache(CSCppCFDataMemory *this)
{
  return 0LL;
}

void *CSCppCFDataMemory::to_string@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "CSCppCFDataMemory");
}

void AS::Operator::generate_owner(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v6 = *(void *)(a3 + 56) + 96LL * *a2;
  uint64_t v15 = (void *)v6;
  unsigned int v19 = 0;
  int v18 = *(_DWORD *)(v6 + 88) | 0x420;
  std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,void>( &v15,  &v19,  (void *)(a1 + 8),  &kCSEndOfTime,  (unsigned int *)&v18,  (void *)(v6 + 56),  (void *)(v6 + 16),  a4);
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>( &v15,  *(const void **)(v6 + 64),  *(void *)(v6 + 72),  (uint64_t)(*(void *)(v6 + 72) - *(void *)(v6 + 64)) >> 5);
  __int128 v7 = v15;
  uint64_t v8 = v16;
  if (v15 != v16)
  {
    uint64_t v9 = a2[1];
    unsigned int v10 = v15;
    do
    {
      __int128 v11 = (const char *)v10[3];
      if (!v11) {
        __int128 v11 = (const char *)v10[2];
      }
      if (strncmp(v11, "__PAGEZERO", 0xBuLL)) {
        *v10 += v9;
      }
      v10 += 4;
    }

    while (v10 != v8);
  }

  __int128 v12 = (void *)*a4;
  __int128 v13 = *(void **)(*a4 + 32LL);
  v12[4] = v7;
  v12[5] = v8;
  uint64_t v14 = v12[6];
  v12[6] = v17;
  uint64_t v15 = v13;
  uint64_t v17 = v14;
  if (v13)
  {
    uint64_t v16 = v13;
    operator delete(v13);
  }

void sub_186094A0C(_Unwind_Exception *a1)
{
}

void AS::LoadOperator::operator()(AS::LoadOperator *a1, uint64_t a2, SymbolicationSession *a3)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 1174405120LL;
  v4[2] = ___ZNK2AS12LoadOperatorclER17CSCppSymbolicatorR20SymbolicationSession_block_invoke;
  v4[3] = &__block_descriptor_tmp_22;
  memset(v5, 0, sizeof(v5));
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__init_with_size[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner>*,std::shared_ptr<CSCppSymbolOwner>*>( (char *)v5,  v6,  v7,  (v7 - v6) >> 4);
  CSCppSymbolicator::apply_mutable_context_block(a2, (uint64_t)v4);
  uint64_t v8 = (char **)v5;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  uint64_t v8 = &v6;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
}

void sub_186094AC8(_Unwind_Exception *a1)
{
  *(void *)(v2 - 24) = v1;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  *(void *)(v2 - 24) = v2 - 48;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

void AS::LoadOperator::generate_owners( AS::LoadOperator *this@<X0>, const SymbolicationSession *a2@<X1>, char **a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  if (*((_BYTE *)this + 40))
  {
    uint64_t v6 = (__int128 *)*((void *)this + 2);
    for (uint64_t i = (__int128 *)*((void *)this + 3); v6 != i; ++v6)
    {
      __int128 v47 = *v6;
      AS::Operator::generate_owner((uint64_t)this, &v47, (uint64_t)a2, &v46);
      uint64_t v9 = a3[1];
      unint64_t v8 = (unint64_t)a3[2];
      if ((unint64_t)v9 >= v8)
      {
        uint64_t v10 = (v9 - *a3) >> 4;
        unint64_t v11 = v10 + 1;
        uint64_t v12 = v8 - (void)*a3;
        if (v12 >> 3 > v11) {
          unint64_t v11 = v12 >> 3;
        }
        else {
          unint64_t v13 = v11;
        }
        __int128 v51 = a3 + 2;
        uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)(a3 + 2),  v13);
        uint64_t v16 = &v14[16 * v10];
        *(_OWORD *)uint64_t v16 = v46;
        __int128 v46 = 0uLL;
        int v18 = *a3;
        uint64_t v17 = a3[1];
        if (v17 == *a3)
        {
          int64x2_t v21 = vdupq_n_s64((unint64_t)v17);
          unsigned int v19 = &v14[16 * v10];
        }

        else
        {
          unsigned int v19 = &v14[16 * v10];
          do
          {
            __int128 v20 = *((_OWORD *)v17 - 1);
            v17 -= 16;
            *((_OWORD *)v19 - 1) = v20;
            v19 -= 16;
            *(void *)uint64_t v17 = 0LL;
            *((void *)v17 + 1) = 0LL;
          }

          while (v17 != v18);
          int64x2_t v21 = *(int64x2_t *)a3;
        }

        __int128 v22 = v16 + 16;
        *a3 = v19;
        a3[1] = v16 + 16;
        int64x2_t v49 = v21;
        __int128 v23 = a3[2];
        a3[2] = &v14[16 * v15];
        __int128 v50 = v23;
        uint64_t v48 = v21.i64[0];
        std::__split_buffer<std::shared_ptr<CSCppSymbolOwner>>::~__split_buffer((uint64_t)&v48);
        __int128 v24 = (std::__shared_weak_count *)*((void *)&v46 + 1);
        a3[1] = v22;
        if (v24)
        {
          p_shared_owners = (unint64_t *)&v24->__shared_owners_;
          do
            unint64_t v26 = __ldaxr(p_shared_owners);
          while (__stlxr(v26 - 1, p_shared_owners));
          if (!v26)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
      }

      else
      {
        *(_OWORD *)uint64_t v9 = v46;
        a3[1] = v9 + 16;
      }
    }
  }

  else
  {
    AS::Operator::generate_owner((uint64_t)this, (void *)this + 2, (uint64_t)a2, &v47);
    unint64_t v27 = (unint64_t)a3[2];
    __int128 v28 = a3[1];
    if ((unint64_t)v28 >= v27)
    {
      uint64_t v29 = (v28 - *a3) >> 4;
      unint64_t v30 = v29 + 1;
      uint64_t v31 = v27 - (void)*a3;
      if (v31 >> 3 > v30) {
        unint64_t v30 = v31 >> 3;
      }
      else {
        unint64_t v32 = v30;
      }
      __int128 v51 = a3 + 2;
      __int128 v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)(a3 + 2),  v32);
      unint64_t v35 = &v33[16 * v29];
      *(_OWORD *)unint64_t v35 = v47;
      __int128 v47 = 0uLL;
      unint64_t v37 = *a3;
      uint64_t v36 = a3[1];
      if (v36 == *a3)
      {
        int64x2_t v40 = vdupq_n_s64((unint64_t)v36);
        __int128 v38 = &v33[16 * v29];
      }

      else
      {
        __int128 v38 = &v33[16 * v29];
        do
        {
          __int128 v39 = *((_OWORD *)v36 - 1);
          v36 -= 16;
          *((_OWORD *)v38 - 1) = v39;
          v38 -= 16;
          *(void *)uint64_t v36 = 0LL;
          *((void *)v36 + 1) = 0LL;
        }

        while (v36 != v37);
        int64x2_t v40 = *(int64x2_t *)a3;
      }

      __int128 v41 = v35 + 16;
      *a3 = v38;
      a3[1] = v35 + 16;
      int64x2_t v49 = v40;
      __int128 v42 = a3[2];
      a3[2] = &v33[16 * v34];
      __int128 v50 = v42;
      uint64_t v48 = v40.i64[0];
      std::__split_buffer<std::shared_ptr<CSCppSymbolOwner>>::~__split_buffer((uint64_t)&v48);
      int v43 = (std::__shared_weak_count *)*((void *)&v47 + 1);
      a3[1] = v41;
      if (v43)
      {
        __int128 v44 = (unint64_t *)&v43->__shared_owners_;
        do
          unint64_t v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
    }

    else
    {
      *(_OWORD *)__int128 v28 = v47;
      a3[1] = v28 + 16;
    }
  }

void sub_186094DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void ___ZNK2AS12LoadOperatorclER17CSCppSymbolicatorR20SymbolicationSession_block_invoke( uint64_t a1, char **a2)
{
  uint64_t v2 = *(unint64_t **)(a1 + 32);
  for (uint64_t i = *(unint64_t **)(a1 + 40); v2 != i; v2 += 2)
  {
    unint64_t v5 = *v2;
    uint64_t v6 = (std::__shared_weak_count *)v2[1];
    unint64_t v17 = *v2;
    int v18 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
      *(void *)&__int128 v16 = v5;
      *((void *)&v16 + 1) = v6;
      do
        unint64_t v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }

    else
    {
      __int128 v16 = v5;
    }

    CSCppMutableContext::add_symbol_owner_no_copy(a2, &v16);
    uint64_t v10 = (std::__shared_weak_count *)*((void *)&v16 + 1);
    if (*((void *)&v16 + 1))
    {
      unint64_t v11 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    unint64_t v13 = v18;
    if (v18)
    {
      uint64_t v14 = (unint64_t *)&v18->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

void sub_186094F08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

char *__copy_helper_block_e8_32c76_ZTSNSt3__16vectorINS_10shared_ptrI16CSCppSymbolOwnerEENS_9allocatorIS3_EEEE( uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  uint64_t v2 = a1 + 32;
  *(void *)(v2 + 16) = 0LL;
  return std::vector<std::shared_ptr<CSCppSymbolOwner>>::__init_with_size[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner>*,std::shared_ptr<CSCppSymbolOwner>*>( (char *)v2,  *(void **)(a2 + 32),  *(void **)(a2 + 40),  (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 4);
}

void __destroy_helper_block_e8_32c76_ZTSNSt3__16vectorINS_10shared_ptrI16CSCppSymbolOwnerEENS_9allocatorIS3_EEEE( uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void AS::LoadOperator::~LoadOperator(AS::LoadOperator *this)
{
  *(void *)this = &off_189DFAD48;
  if (*((_BYTE *)this + 40))
  {
    uint64_t v2 = (void *)*((void *)this + 2);
    if (v2)
    {
      *((void *)this + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v2;
      operator delete(v2);
    }
  }

{
  void *v2;
  *(void *)this = &off_189DFAD48;
  if (*((_BYTE *)this + 40))
  {
    uint64_t v2 = (void *)*((void *)this + 2);
    if (v2)
    {
      *((void *)this + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v2;
      operator delete(v2);
    }
  }

  operator delete(this);
}

void AS::FullCreationOperator::generate_owners( AS::FullCreationOperator *this@<X0>, const SymbolicationSession *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  uint64_t v6 = *((void *)a2 + 15) + 40LL * *((void *)this + 2);
  uint64_t v7 = *(void *)(v6 + 16);
  for (uint64_t i = *(void *)(v6 + 24); v7 != i; v7 += 96LL)
  {
    __p[0] = (void *)v7;
    LODWORD(v41) = 0;
    int v42 = *(_DWORD *)(v7 + 88) | 0x420;
    std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,void>( __p,  (unsigned int *)&v41,  (void *)this + 1,  &kCSEndOfTime,  (unsigned int *)&v42,  (void *)(v7 + 56),  (void *)(v7 + 16),  v43);
    if (*(_BYTE *)(v7 + 48))
    {
      unint64_t v9 = (const char *)(v7 + 24);
      CSCppSymbolOwner::set_version((size_t)v43[0], v9);
    }

    memset(__p, 0, 24);
    std::vector<CSCppSegmentRange>::__init_with_size[abi:ne180100]<CSCppSegmentRange*,CSCppSegmentRange*>( __p,  *(const void **)(v7 + 64),  *(void *)(v7 + 72),  (uint64_t)(*(void *)(v7 + 72) - *(void *)(v7 + 64)) >> 5);
    uint64_t v10 = __p[0];
    unint64_t v11 = __p[1];
    if (__p[0] != __p[1])
    {
      uint64_t v12 = *((void *)this + 3);
      unint64_t v13 = __p[0];
      do
      {
        *v13 += v12;
        v13 += 4;
      }

      while (v13 != v11);
    }

    uint64_t v14 = v43[0];
    __int128 v15 = *((_OWORD *)v43[0] + 2);
    *((void *)v43[0] + 4) = v10;
    *((void *)v14 + 5) = v11;
    *(_OWORD *)__n128 __p = v15;
    __int128 v16 = (void *)*((void *)v14 + 6);
    *((void **)v14 + 6) = __p[2];
    __p[2] = v16;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)a3, (__int128 *)v43);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    unint64_t v17 = (std::__shared_weak_count *)v43[1];
    if (v43[1])
    {
      int v18 = (unint64_t *)((char *)v43[1] + 8);
      do
        unint64_t v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  __int128 v20 = (_OWORD *)*((void *)this + 5);
  for (j = (_OWORD *)*((void *)this + 6); v20 != j; ++v20)
  {
    *(_OWORD *)int v43 = *v20;
    AS::Operator::generate_owner((uint64_t)this, v43, (uint64_t)a2, &v41);
    __int128 v23 = *(_OWORD **)(a3 + 8);
    unint64_t v22 = *(void *)(a3 + 16);
    if ((unint64_t)v23 >= v22)
    {
      uint64_t v24 = ((uint64_t)v23 - *(void *)a3) >> 4;
      unint64_t v25 = v24 + 1;
      uint64_t v26 = v22 - *(void *)a3;
      if (v26 >> 3 > v25) {
        unint64_t v25 = v26 >> 3;
      }
      else {
        unint64_t v27 = v25;
      }
      __p[4] = (void *)(a3 + 16);
      __int128 v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( a3 + 16,  v27);
      unint64_t v30 = &v28[16 * v24];
      *(_OWORD *)unint64_t v30 = v41;
      __int128 v41 = 0uLL;
      unint64_t v32 = *(char **)a3;
      uint64_t v31 = *(char **)(a3 + 8);
      if (v31 == *(char **)a3)
      {
        int64x2_t v35 = vdupq_n_s64((unint64_t)v31);
        __int128 v33 = &v28[16 * v24];
      }

      else
      {
        __int128 v33 = &v28[16 * v24];
        do
        {
          __int128 v34 = *((_OWORD *)v31 - 1);
          v31 -= 16;
          *((_OWORD *)v33 - 1) = v34;
          v33 -= 16;
          *(void *)uint64_t v31 = 0LL;
          *((void *)v31 + 1) = 0LL;
        }

        while (v31 != v32);
        int64x2_t v35 = *(int64x2_t *)a3;
      }

      uint64_t v36 = v30 + 16;
      *(void *)a3 = v33;
      *(void *)(a3 + 8) = v30 + 16;
      *(int64x2_t *)&__p[1] = v35;
      unint64_t v37 = *(void **)(a3 + 16);
      *(void *)(a3 + 16) = &v28[16 * v29];
      __p[3] = v37;
      __p[0] = (void *)v35.i64[0];
      std::__split_buffer<std::shared_ptr<CSCppSymbolOwner>>::~__split_buffer((uint64_t)__p);
      __int128 v38 = (std::__shared_weak_count *)*((void *)&v41 + 1);
      *(void *)(a3 + 8) = v36;
      if (v38)
      {
        p_shared_owners = (unint64_t *)&v38->__shared_owners_;
        do
          unint64_t v40 = __ldaxr(p_shared_owners);
        while (__stlxr(v40 - 1, p_shared_owners));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
    }

    else
    {
      _OWORD *v23 = v41;
      *(void *)(a3 + 8) = v23 + 1;
    }
  }

void sub_1860952E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
}

void AS::FullCreationOperator::~FullCreationOperator(AS::FullCreationOperator *this)
{
  *(void *)this = &off_189DFADA0;
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }

{
  void *v2;
  *(void *)this = &off_189DFADA0;
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }

  operator delete(this);
}

void *std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,void>@<X0>( void *a1@<X1>, unsigned int *a2@<X2>, void *a3@<X3>, void *a4@<X4>, unsigned int *a5@<X5>, void *a6@<X6>, void *a7@<X7>, void *a8@<X8>)
{
  __int128 v16 = operator new(0xE8uLL);
  __n128 result = std::__shared_ptr_emplace<CSCppSymbolOwner>::__shared_ptr_emplace[abi:ne180100]<UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,std::allocator<CSCppSymbolOwner>,0>( v16,  a1,  a2,  a3,  a4,  a5,  a6,  a7);
  *a8 = v16 + 3;
  a8[1] = v16;
  return result;
}

void sub_18609543C(_Unwind_Exception *a1)
{
}

void *std::__shared_ptr_emplace<CSCppSymbolOwner>::__shared_ptr_emplace[abi:ne180100]<UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int,_CSArchitecture const&,char const* const&,std::allocator<CSCppSymbolOwner>,0>( void *a1, void *a2, unsigned int *a3, void *a4, void *a5, unsigned int *a6, void *a7, void *a8)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189DF5380;
  CSCppSymbolOwner::CSCppSymbolOwner(a1 + 3, *a2, *a3, *a4, *a5, *a6, *a7, *a8);
  return a1;
}

void sub_1860954A0(_Unwind_Exception *a1)
{
}

uint64_t CSCppMutableContext::CSCppMutableContext(uint64_t a1, void **a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__init_with_size[abi:ne180100]<std::shared_ptr<CSCppSymbolOwner>*,std::shared_ptr<CSCppSymbolOwner>*>( (char *)a1,  *a2,  a2[1],  ((char *)a2[1] - (char *)*a2) >> 4);
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return a1;
}

uint64_t CSCppMutableContext::add_symbol_owner_no_copy(char **a1, __int128 *a2)
{
  return std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](a1, a2);
}

uint64_t CSCppMutableContext::remove_symbol_owner(uint64_t a1, __int128 *a2)
{
  uint64_t v2 = (uint64_t)a2;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)(a1 + 24), a2);
  uint64_t v4 = v2 + 16;
  uint64_t v5 = *(void *)(a1 + 8);
  if (v2 + 16 != v5)
  {
    do
    {
      uint64_t v6 = v2 + 16;
      std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100](v2, (__int128 *)(v2 + 16));
      uint64_t v7 = v2 + 32;
      v2 += 16LL;
    }

    while (v7 != v5);
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v2 = v6;
  }

  while (v4 != v2)
    uint64_t v4 = std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v4 - 16);
  *(void *)(a1 + 8) = v2;
  return 1LL;
}

uint64_t CSCppMutableContext::copy_symbol_owner@<X0>( char **this@<X0>, CSCppSymbolOwner *a2@<X1>, char a3@<W2>, __int128 *a4@<X8>)
{
  uint64_t v8 = *(void *)a4;
  int v9 = *(_DWORD *)(*(void *)a4 + 108LL);
  if ((v9 & 0x800000) != 0) {
    unsigned int v10 = v9 & 0xFE7FFFFF | 0x1000000;
  }
  else {
    unsigned int v10 = v9 | 0x1000000;
  }
  *(_DWORD *)(v8 + 108) = v10;
  if ((a3 & 1) != 0)
  {
    uint64_t v11 = *((void *)a2 + 10);
    if (v11)
    {
      *(void *)(v8 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v11;
      CSCppReferenceCount::retain(v11);
    }
  }

  return std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](this + 6, a4);
}

void sub_186095630(_Unwind_Exception *a1)
{
}

char **CSCppMutableContext::add_symbol_owner@<X0>( char **this@<X0>, CSCppSymbolOwner *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if ((*((_BYTE *)a2 + 111) & 1) != 0)
  {
    *(void *)a4 = 0LL;
    *(void *)(a4 + 8) = 0LL;
  }

  else
  {
    uint64_t v5 = this;
    CSCppMutableContext::copy_symbol_owner(this, a2, a3, (__int128 *)a4);
    return (char **)std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100](v5, (__int128 *)a4);
  }

  return this;
}

void sub_186095688(_Unwind_Exception *a1)
{
}

uint64_t CSCppMutableContext::remove_symbol_owner(CSCppMutableContext *this, CSCppSymbolOwner *a2)
{
  if (*((void *)this + 1) - *(void *)this < 0x20uLL) {
    return 0LL;
  }
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a2);
  uint64_t v5 = (__int128 *)SymbolOwnerInList;
  uint64_t v6 = _findSymbolOwnerInList((uint64_t **)this + 6, (uint64_t)a2);
  uint64_t v7 = *((void *)this + 7);
  if ((uint64_t *)v7 == v6)
  {
    CSCppMutableContext::remove_symbol_owner((uint64_t)this, v5);
  }

  else
  {
    uint64_t v8 = (uint64_t)v6;
    if (v6 + 2 != (uint64_t *)v7)
    {
      do
      {
        uint64_t v9 = v8 + 16;
        std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100](v8, (__int128 *)(v8 + 16));
        uint64_t v10 = v8 + 32;
        v8 += 16LL;
      }

      while (v10 != v7);
      uint64_t v7 = *((void *)this + 7);
      uint64_t v8 = v9;
    }

    while (v7 != v8)
    {
      v7 -= 16LL;
      std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v7);
    }

    *((void *)this + 7) = v8;
    uint64_t v11 = (uint64_t)(v5 + 1);
    uint64_t v12 = (__int128 *)*((void *)this + 1);
    if (v5 + 1 != v12)
    {
      do
      {
        unint64_t v13 = v5 + 1;
        std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100]((uint64_t)v5, v5 + 1);
        uint64_t v14 = v5 + 2;
        ++v5;
      }

      while (v14 != v12);
      uint64_t v11 = *((void *)this + 1);
      uint64_t v5 = v13;
    }

    *((void *)this + 1) = v5;
  }

  return 1LL;
}

uint64_t *_findSymbolOwnerInList(uint64_t **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  size_t v3 = a1[1];
  if (*a1 != v3)
  {
    while (1)
    {
      uint64_t v6 = *v2;
      uint64_t v5 = (std::__shared_weak_count *)v2[1];
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v8 = __ldxr(p_shared_owners);
        while (__stxr(v8 + 1, p_shared_owners));
        do
          unint64_t v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }

      if (v6 == a2) {
        break;
      }
      v2 += 2;
      if (v2 == v3) {
        return v3;
      }
    }
  }

  return v2;
}

uint64_t CSCppMutableContext::replace_symbol_owner(char **this, CSCppSymbolOwner *a2, CSCppSymbolOwner *a3)
{
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a3);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v6;
}

void sub_1860958F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CSCppMutableContext::make_symbol_owner_mutable(CSCppMutableContext *this, CSCppSymbolOwner *a2)
{
  if ((*((_BYTE *)a2 + 111) & 1) != 0) {
    return 0LL;
  }
  SymbolOwnerInList = _findSymbolOwnerInList((uint64_t **)this, (uint64_t)a2);
  uint64_t v5 = (uint64_t)SymbolOwnerInList;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]( (char **)this + 3,  (__int128 *)SymbolOwnerInList);
  uint64_t v6 = v5 + 16;
  uint64_t v7 = *((void *)this + 1);
  if (v5 + 16 != v7)
  {
    do
    {
      uint64_t v8 = v5 + 16;
      std::shared_ptr<CSCppSymbolOwnerTimeline>::operator=[abi:ne180100](v5, (__int128 *)(v5 + 16));
      uint64_t v9 = v5 + 32;
      v5 += 16LL;
    }

    while (v9 != v7);
    uint64_t v6 = *((void *)this + 1);
    uint64_t v5 = v8;
  }

  while (v6 != v5)
    uint64_t v6 = std::shared_ptr<CSCppSymbolOwner>::~shared_ptr[abi:ne180100](v6 - 16);
  *((void *)this + 1) = v5;
  CSCppMutableContext::copy_symbol_owner((char **)this, a2, 0, &v15);
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)this, &v15);
  uint64_t v11 = (std::__shared_weak_count *)*((void *)&v15 + 1);
  uint64_t v10 = v15;
  if (*((void *)&v15 + 1))
  {
    uint64_t v12 = (unint64_t *)(*((void *)&v15 + 1) + 8LL);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  return v10;
}

void sub_186095A20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CSCppMutableContext::make_all_symbol_owners_immutable(uint64_t this)
{
  uint64_t v1 = *(uint64_t **)(this + 48);
  uint64_t v2 = *(uint64_t **)(this + 56);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    v1 += 2;
    *(_DWORD *)(v3 + 108) &= ~0x1000000u;
  }

  return this;
}

void CSCppMutableContext::mark_all_obsoleted_symbol_owners(CSCppMutableContext *this)
{
  for (uint64_t i = (uint64_t *)*((void *)this + 3); (unint64_t)i < *((void *)this + 4); i += 2)
  {
    uint64_t v3 = *i;
    uint64_t v4 = (std::__shared_weak_count *)i[1];
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        unint64_t v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
      *(_DWORD *)(v3 + 108) = *(_DWORD *)(v3 + 108) & 0xFE7FFFFF | 0x800000;
      do
        unint64_t v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }

    else
    {
      *(_DWORD *)(v3 + 108) = *(_DWORD *)(v3 + 108) & 0xFE7FFFFF | 0x800000;
    }
  }

void *CSGetBinaryPathForExclaveWithUUIDBytes(void *a1)
{
  uint64_t v2 = std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::find<UUID>( &get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map,  a1);
  uint64_t v3 = std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::find<UUID>( &get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map,  a1);
  uint64_t v4 = v3;
  if (!v2)
  {
    if (!v3) {
      return 0LL;
    }
    __n128 result = v3 + 4;
    return (void *)*result;
  }

  if (v3)
  {
    if (os_variant_has_internal_content())
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "UUID found in both ExclaveCore and ExclaveKit\n",  v6,  2u);
      }
    }

    return 0LL;
  }

  __n128 result = v2 + 4;
  return result;
}

void get_exclave_core_uuid_to_path_map(void)
{
  if ((v0 & 1) == 0
  {
    get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map = 0u;
    *(_OWORD *)&qword_18C685A50 = 0u;
    dword_18C685A60 = 1065353216;
  }

  unint64_t v1 = atomic_load(&get_exclave_core_uuid_to_path_map(void)::once);
  if (v1 != -1LL)
  {
    uint64_t v4 = &v2;
    uint64_t v3 = &v4;
    std::__call_once( &get_exclave_core_uuid_to_path_map(void)::once,  &v3,  (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_core_uuid_to_path_map(void)::$_0 &&>>);
  }

void get_exclave_kit_uuid_to_path_map(void)
{
  if ((v0 & 1) == 0
  {
    get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map = 0u;
    *(_OWORD *)&qword_18C685A88 = 0u;
    dword_18C685A98 = 1065353216;
  }

  unint64_t v1 = atomic_load(&get_exclave_kit_uuid_to_path_map(void)::once);
  if (v1 != -1LL)
  {
    uint64_t v4 = &v2;
    uint64_t v3 = &v4;
    std::__call_once( &get_exclave_kit_uuid_to_path_map(void)::once,  &v3,  (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_kit_uuid_to_path_map(void)::$_0 &&>>);
  }

uint64_t CSSymbolicatorCreateWithExclaveUUIDAndFlags(void *a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3802000000LL;
  uint64_t v11 = __Block_byref_object_copy__15;
  uint64_t v12 = __Block_byref_object_dispose__15;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v4 = (char *)CSGetBinaryPathForExclaveWithUUIDBytes(a1);
  if (v4)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __CSSymbolicatorCreateWithExclaveUUIDAndFlags_block_invoke;
    v7[3] = &unk_189DFADD8;
    v7[4] = &v8;
    void v7[5] = a1;
    CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v4, a2, 0LL, (uint64_t)v7);
  }

  uint64_t v5 = v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_186095DD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

__n128 __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void *__CSSymbolicatorCreateWithExclaveUUIDAndFlags_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char SymbolOwner = CSSymbolicatorGetSymbolOwner(a2, a3);
  __n128 result = CSSymbolOwnerGetCFUUIDBytes(SymbolOwner, v7);
  uint64_t v9 = *(uint64_t **)(a1 + 40);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  if (v11 == *result && v10 == result[1])
  {
    __n128 result = (void *)CSRetain(a2, a3);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(void *)(v13 + 40) = result;
    *(void *)(v13 + 4_Block_object_dispose(va, 8) = v14;
  }

  return result;
}

uint64_t CSSymbolicatorForeachExclaveCoreSymbolicator(uint64_t a1)
{
  return CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags(0LL, a1);
}

uint64_t CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  memset(v10, 0, sizeof(v10));
  int v11 = 1065353216;
  uint64_t v4 = qword_18C685A50;
  if (qword_18C685A50)
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      unint64_t v6 = (char *)(v4 + 32);
      if (!std::__hash_table<std::__hash_value_type<std::string,std::vector<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::string>>>>::find<std::string>( v10,  (unsigned __int8 *)(v4 + 32)))
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>( (uint64_t)v10,  (unsigned __int8 *)(v4 + 32),  v4 + 32);
        v9[0] = v5;
        v9[1] = 0x40000000LL;
        v9[2] = __CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags_block_invoke;
        v9[3] = &unk_189DFAE00;
        v9[4] = a2;
        v9[5] = &v12;
        CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v6, a1, 0LL, (uint64_t)v9);
      }

      uint64_t v4 = *(void *)v4;
    }

    while (v4);
    uint64_t v7 = v13[3];
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v10);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_186095F98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __CSSymbolicatorForeachExclaveCoreSymbolicatorWithFlags_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t CSSymbolicatorForeachExclaveKitSymbolicator(uint64_t a1)
{
  return CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags(0LL, a1);
}

uint64_t CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  memset(v10, 0, sizeof(v10));
  int v11 = 1065353216;
  uint64_t v4 = qword_18C685A88;
  if (qword_18C685A88)
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      unint64_t v6 = (char *)(v4 + 32);
      if (!std::__hash_table<std::__hash_value_type<std::string,std::vector<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::string>>>>::find<std::string>( v10,  (unsigned __int8 *)(v4 + 32)))
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>( (uint64_t)v10,  (unsigned __int8 *)(v4 + 32),  v4 + 32);
        v9[0] = v5;
        v9[1] = 0x40000000LL;
        v9[2] = __CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags_block_invoke;
        v9[3] = &unk_189DFAE28;
        v9[4] = a2;
        v9[5] = &v12;
        CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification(v6, a1, 0LL, (uint64_t)v9);
      }

      uint64_t v4 = *(void *)v4;
    }

    while (v4);
    uint64_t v7 = v13[3];
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v10);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_186096128( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __CSSymbolicatorForeachExclaveKitSymbolicatorWithFlags_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_core_uuid_to_path_map(void)::$_0 &&>>()
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100]<0>(&__p, "/System/ExclaveCore/");
  memset(&v18, 0, sizeof(v18));
  v16[0] = &v18;
  LOBYTE(v16[1]) = 0;
  v18.__begin_ = (std::vector<std::string>::pointer)operator new(0x18uLL);
  v18.__end_ = v18.__begin_;
  v18.__end_cap_.__value_ = v18.__begin_ + 1;
  v18.__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>( (uint64_t)&v18.__end_cap_,  (__int128 *)&__p,  (__int128 *)&__p.__end_cap_,  v18.__begin_);
  if (SHIBYTE(__p.__end_) < 0) {
    operator delete(__p.__first_);
  }
  if (os_variant_has_internal_content())
  {
    unsigned __int8 v0 = getenv("CS_TEST_EXCLAVECORE_DIR");
    if (v0)
    {
      unint64_t v1 = v0;
      if (!is_root_directory(v0))
      {
        std::string::basic_string[abi:ne180100]<0>(v16, v1);
        std::vector<std::string>::pointer end = v18.__end_;
        if (v18.__end_ >= v18.__end_cap_.__value_)
        {
          unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v18.__end_ - (char *)v18.__begin_) >> 3);
          unint64_t v5 = v4 + 1;
          if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          }
          else {
            unint64_t v6 = v5;
          }
          __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v18.__end_cap_;
          if (v6) {
            uint64_t v7 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>( (uint64_t)&v18.__end_cap_,  v6);
          }
          else {
            uint64_t v7 = 0LL;
          }
          uint64_t v8 = v7 + v4;
          __p.__first_ = v7;
          __p.__begin_ = v8;
          __p.__end_cap_.__value_ = &v7[v6];
          __int128 v9 = *(_OWORD *)v16;
          v8->__r_.__value_.__l.__cap_ = v17;
          *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
          v16[1] = 0LL;
          std::string::size_type v17 = 0LL;
          v16[0] = 0LL;
          __p.__end_ = v8 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v18, &__p);
          uint64_t v10 = v18.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__p);
          v18.__end_ = v10;
          if (SHIBYTE(v17) < 0) {
            operator delete(v16[0]);
          }
        }

        else
        {
          __int128 v3 = *(_OWORD *)v16;
          v18.__end_->__r_.__value_.__l.__cap_ = v17;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v3;
          v18.__end_ = end + 1;
        }
      }
    }
  }

  std::vector<std::string>::pointer begin = v18.__begin_;
  std::vector<std::string>::pointer v12 = v18.__end_;
  if (v18.__begin_ != v18.__end_)
  {
    while (1)
    {
      uint64_t v13 = (char *)begin;
      __p.__first_ = (std::__split_buffer<std::string>::pointer)off_189DFAE88;
      __p.__end_cap_.__value_ = (std::string *)&__p;
      recursively_list_files_and_uuids_in_directory(v13, (uint64_t)&__p);
      value = __p.__end_cap_.__value_;
      if ((std::__split_buffer<std::string> *)__p.__end_cap_.__value_ == &__p) {
        break;
      }
      if (__p.__end_cap_.__value_)
      {
        uint64_t v15 = 5LL;
LABEL_26:
        (*(void (**)(void))(value->__r_.__value_.__r.__words[0] + 8 * v15))();
      }

      if (++begin == v12) {
        goto LABEL_28;
      }
    }

    value = (std::string *)&__p;
    uint64_t v15 = 4LL;
    goto LABEL_26;
  }

LABEL_28:
  v16[0] = &v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
}

void sub_186096404( _Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, char *__pa, std::__split_buffer<std::string> *a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (a14 < 0) {
    operator delete(__pa);
  }
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(__p);
}

void recursively_list_files_and_uuids_in_directory(char *a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  unint64_t v37 = a1;
  if (access(a1, 4) && os_variant_has_internal_content())
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)a1;
    unint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    unint64_t v5 = "Failed to access directory: %s\n";
LABEL_22:
    _os_log_impl(&dword_185FC0000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&buf, 0xCu);
    return;
  }

  unint64_t v6 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>( &buf,  &v37);
  std::__fs::filesystem::__status(v6, 0LL);
  if (LOBYTE(__p.__imp_.__ptr_) != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
    unint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    unint64_t v5 = "Path is not a directory: %s\n";
    goto LABEL_22;
  }

  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&__p, &v37);
  MEMORY[0x186E30EA0](&buf, &__p, 0LL, 0LL);
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v7 = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&buf.__r_.__value_.__l.__data_;
  if (buf.__r_.__value_.__l.__size_)
  {
    uint64_t v8 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    size = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
    __p.__imp_ = v7;
    __p.__rec_ = buf.__r_.__value_.__s.__data_[16];
    if (buf.__r_.__value_.__l.__size_)
    {
      uint64_t v11 = (unint64_t *)(buf.__r_.__value_.__l.__size_ + 8);
      do
        unint64_t v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
      __int128 v33 = 0LL;
      __int128 v34 = 0LL;
      char v35 = 0;
      do
        unint64_t v13 = __ldaxr(v11);
      while (__stlxr(v13 - 1, v11));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }

      goto LABEL_25;
    }
  }

  else
  {
    __p.__imp_.__ptr_ = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)buf.__r_.__value_.__r.__words[0];
    __p.__imp_.__cntrl_ = 0LL;
    __p.__rec_ = buf.__r_.__value_.__s.__data_[16];
  }

  __int128 v33 = 0LL;
  __int128 v34 = 0LL;
  char v35 = 0;
LABEL_25:
  uint64_t v14 = v33;
  uint64_t v15 = MEMORY[0x1895F87A8];
  while (__p.__imp_.__ptr_ != v14)
  {
    __int128 v16 = std::__fs::filesystem::recursive_directory_iterator::__dereference(&__p);
    if ((char)v16->__p_.__pn_.__r_.__value_.__s.__size_ < 0) {
      std::string::__init_copy_ctor_external( &p,  v16->__p_.__pn_.__r_.__value_.__l.__data_,  v16->__p_.__pn_.__r_.__value_.__l.__size_);
    }
    else {
      std::string p = (std::string)v16->__p_;
    }
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v31.__pn_, (char *)&p);
    std::__fs::filesystem::__status(&v31, 0LL);
    int v17 = v38;
    if (v17 != 2)
    {
      std::vector<std::string> v18 = (p.__r_.__value_.__s.__size_ & 0x80u) == 0 ? &p : (std::string *)p.__r_.__value_.__r.__words[0];
      if ((CSFileIsSuitableForCS((const char *)v18) & 1) != 0)
      {
        if ((p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_std::string p = &p;
        }
        else {
          p_std::string p = (std::string *)p.__r_.__value_.__r.__words[0];
        }
        v31.__pn_.__r_.__value_.__r.__words[0] = -1LL;
        v39[0] = v15;
        v39[1] = 1174405120LL;
        v39[2] = ___ZL45recursively_list_files_and_uuids_in_directoryPKcNSt3__18functionIFvRKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERK4UUIDEEE_block_invoke;
        v39[3] = &__block_descriptor_tmp_9_3;
        std::__function::__value_func<void ()(CSCppMMapInlinedSymbol *,std::vector<TRawSymbol<Pointer32>> &,CSCppStringCache &)>::__value_func[abi:ne180100]( (uint64_t)v40,  a2);
        else {
          std::string v42 = p;
        }
        iterate_symbol_owners_from_path((char *)p_p, 0, 0, (unint64_t *)&v31, 0, (uint64_t)v39);
        uint64_t v20 = v41;
        if (v41 == v40)
        {
          uint64_t v20 = v40;
          uint64_t v21 = 4LL;
        }

        else
        {
          if (!v41) {
            goto LABEL_50;
          }
          uint64_t v21 = 5LL;
        }

        (*(void (**)(void))(*v20 + 8 * v21))();
      }
    }

void sub_186096928( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22, uint64_t a23, uint64_t a24, void *__p, uint64_t a26, int a27, __int16 a28, char a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, void *a41, uint64_t a42, int a43, __int16 a44, char a45, char a46)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL45recursively_list_files_and_uuids_in_directoryPKcNSt3__18functionIFvRKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEERK4UUIDEEE_block_invoke( uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v3 + 48LL))(v3, a1 + 64, *a2 + 16LL);
}

void __copy_helper_block_e8_32c93_ZTSNSt3__18functionIFvRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERK4UUIDEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (std::string *)(a1 + 64);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 64);
    *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = *(void *)(a2 + 80);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }

void sub_186096AA8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v2;
  __int128 v5 = *(void **)(v3 + 56);
  if (v5 == v1)
  {
    uint64_t v6 = 4LL;
  }

  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v6 = 5LL;
    unint64_t v1 = v5;
  }

  (*(void (**)(void *))(*v1 + 8 * v6))(v1);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *__destroy_helper_block_e8_32c93_ZTSNSt3__18functionIFvRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERK4UUIDEEE64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 56);
  if (result == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t result = v2;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v4 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__l.__cap_ = 0LL;
  uint64_t v3 = *a2;
  uint64_t v4 = v3 - 1;
  while (*++v4)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, v3, v4);
  return this;
}

void sub_186096B8C(_Unwind_Exception *exception_object)
{
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  uint64_t v4 = a2;
  LODWORD(v6) = (char)this->__r_.__value_.__s.__size_;
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    castd::string p = this->__r_.__value_.__l.__cap_;
    std::string::size_type v9 = (cap & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type v6 = HIBYTE(cap);
  }

  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__s.__size_;
    std::string::size_type v9 = 22LL;
    uint64_t v10 = this;
  }

  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0LL, 0LL);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = this->__r_.__value_.__s.__size_;
    }

    uint64_t v14 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      _BYTE *i = v16;
    }

    _BYTE *i = 0;
    std::string::size_type v17 = v7 + size;
    else {
      this->__r_.__value_.__s.__size_ = v17 & 0x7F;
    }
  }

  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      unint64_t v12 = __p;
    }
    else {
      unint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
  }

  return this;
}

void sub_186096D00( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<char const*,char const*>( void *result, char *a2, char *a3, unint64_t a4)
{
  uint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000LL;
    *uint64_t v4 = result;
    uint64_t v4 = result;
  }

  else
  {
    *((_BYTE *)result + 2pthread_mutex_lock((pthread_mutex_t *)this + 3) = a4;
  }

  while (a2 != a3)
  {
    char v10 = *a2++;
    *(_BYTE *)uint64_t v4 = v10;
    uint64_t v4 = (void *)((char *)v4 + 1);
  }

  *(_BYTE *)uint64_t v4 = 0;
  return result;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *a1, char *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0LL;
  a1->__r_.__value_.__l.__size_ = 0LL;
  a1->__r_.__value_.__l.__cap_ = 0LL;
  LODWORD(vpthread_mutex_lock((pthread_mutex_t *)this + 3) = a2[23];
  BOOL v4 = (int)v3 < 0;
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v3 = v3;
  if (v4) {
    uint64_t v3 = v5;
  }
  std::string::append[abi:ne180100]<char const*,0>(a1, a2, &a2[v3]);
  return a1;
}

void sub_186096E08(_Unwind_Exception *exception_object)
{
}

void *std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = off_189DFAE88;
  return result;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone( uint64_t a1, void *a2)
{
  *a2 = off_189DFAE88;
}

void std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::operator()( int a1, const std::string *a2, UUID *this)
{
  std::string::size_type size = a2->__r_.__value_.__s.__size_;
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  if (size)
  {
    if (!UUID::is_null(this))
    {
      unint64_t v7 = this;
      std::string::size_type v6 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>( (uint64_t)&get_exclave_core_uuid_to_path_map(void)::exclave_core_uuid_to_path_map,  this,  (uint64_t)&std::piecewise_construct,  &v7);
      std::string::operator=((std::string *)(v6 + 4), a2);
    }
  }

uint64_t std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_core_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target_type()
{
}

void *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>( uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    char v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == a2[1]) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  uint64_t v14 = (void *)(a1 + 16);
  uint64_t i = operator new(0x38uLL);
  void *i = 0LL;
  i[1] = v7;
  *((_OWORD *)i + 1) = **a4;
  i[5] = 0LL;
  i[6] = 0LL;
  i[4] = 0LL;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *i = *v22;
LABEL_42:
    void *v22 = i;
    goto LABEL_43;
  }

  void *i = *v14;
  *uint64_t v14 = i;
  *(void *)(v21 + 8 * v4) = v14;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }

    else
    {
      v23 &= v8 - 1;
    }

    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }

void sub_18609716C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<get_exclave_kit_uuid_to_path_map(void)::$_0 &&>>()
{
  *(void *)&__int128 v42 = *MEMORY[0x1895F89C0];
  memset(&v36, 0, sizeof(v36));
  std::string::basic_string[abi:ne180100]<0>(&buf, "/System/Volumes/Preboot/Cryptexes/ExclaveOS");
  std::string::basic_string[abi:ne180100]<0>(&buf.__end_cap_.__value_, "/private/preboot/Cryptexes/ExclaveOS");
  std::string::basic_string[abi:ne180100]<0>(v41, "/System/Cryptexes/ExclaveOS");
  __p[0] = 0LL;
  __p[1] = 0LL;
  v38[0] = 0LL;
  v38[1] = __p;
  char v39 = 0;
  __p[0] = operator new(0x48uLL);
  __p[1] = __p[0];
  v38[0] = (char *)__p[0] + 72;
  uint64_t v0 = 0LL;
  __p[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>( (uint64_t)v38,  (__int128 *)&buf,  &v42,  (std::string *)__p[0]);
  do
  {
    if (SHIBYTE(v41[v0 + 2]) < 0) {
      operator delete((void *)v41[v0]);
    }
    v0 -= 3LL;
  }

  while (v0 != -9);
  uint64_t v1 = (char *)__p[0];
  uint64_t v2 = (char *)__p[1];
  while (1)
  {
    if (v1 == v2)
    {
      char v4 = 0;
      v34.__r_.__value_.__s.__data_[0] = 0;
      goto LABEL_16;
    }

    uint64_t v3 = v1;
    if (v1[23] < 0) {
      uint64_t v3 = *(const char **)v1;
    }
    if (!access(v3, 4)) {
      break;
    }
    v1 += 24;
  }

  if (v1[23] < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v1, *((void *)v1 + 1));
  }

  else
  {
    __int128 v5 = *(_OWORD *)v1;
    v34.__r_.__value_.__l.__cap_ = *((void *)v1 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v5;
  }

  char v4 = 1;
LABEL_16:
  char v35 = v4;
  buf.__first_ = (std::__split_buffer<std::string>::pointer)__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v35)
  {
    if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      size_t size = v34.__r_.__value_.__s.__size_;
    }
    else {
      size_t size = v34.__r_.__value_.__l.__size_;
    }
    unint64_t v7 = __p;
    std::string::basic_string[abi:ne180100]((uint64_t)__p, size + 19);
    if (v38[0] < 0) {
      unint64_t v7 = (void **)__p[0];
    }
    if (size)
    {
      if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v8 = &v34;
      }
      else {
        unint64_t v8 = (std::string *)v34.__r_.__value_.__r.__words[0];
      }
      memmove(v7, v8, size);
    }

    strcpy((char *)v7 + size, "/System/ExclaveKit/");
    std::vector<std::string>::pointer end = v36.__end_;
    if (v36.__end_ >= v36.__end_cap_.__value_)
    {
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_ - (char *)v36.__begin_) >> 3);
      unint64_t v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
      }
      else {
        unint64_t v13 = v12;
      }
      buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v36.__end_cap_;
      if (v13) {
        uint64_t v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>( (uint64_t)&v36.__end_cap_,  v13);
      }
      else {
        uint64_t v14 = 0LL;
      }
      float v15 = v14 + v11;
      buf.__first_ = v14;
      buf.__begin_ = v15;
      buf.__end_cap_.__value_ = &v14[v13];
      __int128 v16 = *(_OWORD *)__p;
      v15->__r_.__value_.__l.__cap_ = v38[0];
      *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
      __p[1] = 0LL;
      v38[0] = 0LL;
      __p[0] = 0LL;
      buf.__end_ = v15 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v36, &buf);
      BOOL v17 = v36.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&buf);
      v36.__end_ = v17;
      if (SHIBYTE(v38[0]) < 0) {
        operator delete(__p[0]);
      }
    }

    else
    {
      __int128 v10 = *(_OWORD *)__p;
      v36.__end_->__r_.__value_.__l.__cap_ = v38[0];
      *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
      v36.__end_ = end + 1;
    }
  }

  else if (is_device_sptm_enabled() {
         && os_variant_has_internal_content()
  }
         && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.__first_) = 0;
    _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to locate official Exclave Kit binaries on disk",  (uint8_t *)&buf,  2u);
  }

  if (os_variant_has_internal_content())
  {
    unint64_t v18 = getenv("CS_TEST_EXCLAVEKIT_DIR");
    if (v18)
    {
      unint64_t v19 = v18;
      if (!is_root_directory(v18))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, v19);
        std::vector<std::string>::pointer v20 = v36.__end_;
        if (v36.__end_ >= v36.__end_cap_.__value_)
        {
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_ - (char *)v36.__begin_) >> 3);
          unint64_t v23 = v22 + 1;
          if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
          }
          else {
            unint64_t v24 = v23;
          }
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v36.__end_cap_;
          if (v24) {
            unint64_t v25 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>( (uint64_t)&v36.__end_cap_,  v24);
          }
          else {
            unint64_t v25 = 0LL;
          }
          uint64_t v26 = v25 + v22;
          buf.__first_ = v25;
          buf.__begin_ = v26;
          buf.__end_cap_.__value_ = &v25[v24];
          __int128 v27 = *(_OWORD *)__p;
          v26->__r_.__value_.__l.__cap_ = v38[0];
          *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v27;
          __p[1] = 0LL;
          v38[0] = 0LL;
          __p[0] = 0LL;
          buf.__end_ = v26 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v36, &buf);
          __int128 v28 = v36.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&buf);
          v36.__end_ = v28;
          if (SHIBYTE(v38[0]) < 0) {
            operator delete(__p[0]);
          }
        }

        else
        {
          __int128 v21 = *(_OWORD *)__p;
          v36.__end_->__r_.__value_.__l.__cap_ = v38[0];
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          v36.__end_ = v20 + 1;
        }
      }
    }
  }

  std::vector<std::string>::pointer begin = v36.__begin_;
  std::vector<std::string>::pointer v30 = v36.__end_;
  if (v36.__begin_ != v36.__end_)
  {
    while (1)
    {
      std::__fs::filesystem::path v31 = (char *)begin;
      buf.__first_ = (std::__split_buffer<std::string>::pointer)off_189DFAF18;
      buf.__end_cap_.__value_ = (std::string *)&buf;
      recursively_list_files_and_uuids_in_directory(v31, (uint64_t)&buf);
      value = buf.__end_cap_.__value_;
      if ((std::__split_buffer<std::string> *)buf.__end_cap_.__value_ == &buf) {
        break;
      }
      if (buf.__end_cap_.__value_)
      {
        uint64_t v33 = 5LL;
LABEL_67:
        (*(void (**)(void))(value->__r_.__value_.__r.__words[0] + 8 * v33))();
      }

      if (++begin == v30) {
        goto LABEL_69;
      }
    }

    value = (std::string *)&buf;
    uint64_t v33 = 4LL;
    goto LABEL_67;
  }

void sub_1860976C8( _Unwind_Exception *a1, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, int a8, uint64_t *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, void *__pa, std::__split_buffer<std::string> *a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  if (a24 < 0) {
    operator delete(__pa);
  }
  if ((_BYTE)__p)
  {
    if (SHIBYTE(a11) < 0) {
      operator delete(a9);
    }
  }

  a9 = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

void *std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = off_189DFAF18;
  return result;
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::__clone( uint64_t a1, void *a2)
{
  *a2 = off_189DFAF18;
}

void std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::operator()( int a1, const std::string *a2, UUID *this)
{
  std::string::size_type size = a2->__r_.__value_.__s.__size_;
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  if (size)
  {
    if (!UUID::is_null(this))
    {
      unint64_t v7 = this;
      std::string::size_type v6 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>( (uint64_t)&get_exclave_kit_uuid_to_path_map(void)::exclave_kit_uuid_to_path_map,  this,  (uint64_t)&std::piecewise_construct,  &v7);
      std::string::operator=((std::string *)(v6 + 4), a2);
    }
  }

uint64_t std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1},std::allocator<get_exclave_kit_uuid_to_path_map(void)::$_0::operator() const(void)::{lambda(std::string const&,UUID const&)#1}>,void ()(std::string const&,UUID const&)>::target_type()
{
}

void **CSCppDsymData::binary_path(CSCppDsymData *this)
{
  uint64_t v2 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0)
  {
    if (!*((void *)this + 7)) {
      goto LABEL_14;
    }
    uint64_t v3 = (const char *)*v2;
    if (*(_BYTE *)*v2 != 126) {
      goto LABEL_14;
    }
  }

  else
  {
    if (!*((_BYTE *)this + 71)) {
      return 0LL;
    }
    if (*(_BYTE *)v2 != 126) {
      return v2;
    }
    uint64_t v3 = (char *)this + 48;
  }

  memset(&v5, 0, sizeof(v5));
  if (!glob(v3, 2048, 0LL, &v6))
  {
    std::string::__assign_external(&v5, *(const std::string::value_type **)v6.gl_pathv);
    globfree(&v6);
  }

  *(std::string *)uint64_t v2 = v5;
  if ((*((_BYTE *)this + 71) & 0x80) != 0)
  {
LABEL_14:
    if (*((void *)this + 7)) {
      return (void **)*v2;
    }
    return 0LL;
  }

  if (!*((_BYTE *)this + 71)) {
    return 0LL;
  }
  return v2;
}

void sub_1860979E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CSCppDsymData::CSCppDsymData(CSCppDsymData *this, const char *a2)
{
  *((void *)this + _Block_object_dispose(va, 8) = 0LL;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + pthread_mutex_lock((pthread_mutex_t *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  strlcpy((char *)this + 72, a2, 0x400uLL);
}

void sub_186097A44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 24);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  a10 = (void **)v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void make_dsym_data_from_path_and_uuid(const char *a1@<X0>, const CFUUIDBytes *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1 && a2 && !access(a1, 0))
  {
    CSCppDsymData::CSCppDsymData((CSCppDsymData *)&v5, a1);
    *(_OWORD *)a3 = v5;
    *(void *)(a3 + 16) = v6;
    __int128 v5 = 0uLL;
    *(_OWORD *)(a3 + 24) = v7;
    *(void *)(a3 + 40) = v8;
    uint64_t v6 = 0LL;
    __int128 v7 = 0uLL;
    uint64_t v8 = 0LL;
    *(_OWORD *)(a3 + 4_Block_object_dispose(va, 8) = v9;
    *(void *)(a3 + 64) = v10;
    uint64_t v10 = 0LL;
    __int128 v9 = 0uLL;
    memcpy((void *)(a3 + 72), v11, 0x400uLL);
    *(_BYTE *)(a3 + 1096) = 1;
    CSCppDsymData::~CSCppDsymData((void **)&v5);
  }

  else
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 1096) = 0;
  }

uint64_t CSCppInternedPathTransformer::CSCppInternedPathTransformer( uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *(void *)a1 = &off_189DFAF98;
  *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v5 = a1 + 16;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 4_Block_object_dispose(va, 8) = 1065353216;
  else {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a4[1] - *a4) >> 3);
  }
  if (v6)
  {
    uint64_t v9 = 0LL;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string const&>( v5,  (unsigned __int8 *)(*a3 + v9),  (__int128 *)(*a3 + v9),  (__int128 *)(*a4 + v9));
      v9 += 24LL;
      --v6;
    }

    while (v6);
  }

  return a1;
}

void sub_186097C2C(_Unwind_Exception *a1)
{
}

uint64_t *CSCppInternedPathTransformer::find_replacement( CSCppInternedPathTransformer *this, const char *__s2)
{
  for (uint64_t i = (uint64_t *)*((void *)this + 4); i; uint64_t i = (uint64_t *)*i)
  {
    int v4 = *((char *)i + 39);
    if (v4 >= 0) {
      uint64_t v5 = (const char *)(i + 2);
    }
    else {
      uint64_t v5 = (const char *)i[2];
    }
    if (v4 >= 0) {
      size_t v6 = *((unsigned __int8 *)i + 39);
    }
    else {
      size_t v6 = i[3];
    }
    if (!strncmp(v5, __s2, v6)) {
      break;
    }
  }

  return i;
}

unsigned __int8 *CSCppInternedPathTransformer::transform(CSCppStringCache **this, char *a2)
{
  uint64_t v2 = (unsigned __int8 *)a2;
  replacement = CSCppInternedPathTransformer::find_replacement((CSCppInternedPathTransformer *)this, a2);
  if (replacement)
  {
    uint64_t v5 = replacement;
    else {
      uint64_t v6 = *((unsigned __int8 *)replacement + 39);
    }
    __int128 v7 = (const char *)&v2[v6];
    else {
      size_t v8 = replacement[6];
    }
    size_t v9 = strlen(v7);
    uint64_t v10 = __p;
    std::string::basic_string[abi:ne180100]((uint64_t)__p, v8 + v9);
    if (v15 < 0) {
      uint64_t v10 = (void **)__p[0];
    }
    if (v8)
    {
      else {
        unint64_t v11 = (const void *)v5[5];
      }
      memmove(v10, v11, v8);
    }

    if (v9) {
      memmove((char *)v10 + v8, v7, v9);
    }
    *((_BYTE *)v10 + v8 + v9) = 0;
    if (v15 >= 0) {
      uint64_t v12 = (char *)__p;
    }
    else {
      uint64_t v12 = (char *)__p[0];
    }
    uint64_t v2 = CSCppStringCache::intern(this[1], v12);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }

  return v2;
}

void sub_186097DB4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CSCppInternedPathTransformer::~CSCppInternedPathTransformer(CSCppInternedPathTransformer *this)
{
  *(void *)this = &off_189DFAF98;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)this + 16);
}

{
  *(void *)this = &off_189DFAF98;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)this + 16);
  operator delete(this);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string const&>( uint64_t a1, unsigned __int8 *a2, __int128 *a3, __int128 *a4)
{
  size_t v9 = (void *)(a1 + 24);
  unint64_t v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }

    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }

    char v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }

          else
          {
            v17 &= v12 - 1;
          }

          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }

  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string const&>( a1,  v11,  a3,  a4,  (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1LL;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>( a1,  v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }

    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }

  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *unint64_t v24 = v27[0];
  }

  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8LL);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }

      else
      {
        v25 &= v12 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v27[0];
  v27[0] = 0LL;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]( (uint64_t)v27,  0LL);
  return i;
}

void sub_1860980A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string const&>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  unint64_t v10 = (char *)operator new(0x40uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + _Block_object_dispose(va, 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *(void *)unint64_t v10 = 0LL;
  *((void *)v10 + 1) = a2;
  uint64_t result = std::pair<std::string const,std::string>::pair[abi:ne180100]<true,0>((std::string *)(v10 + 16), a3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_186098124(_Unwind_Exception *a1)
{
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100]<true,0>( std::string *this, __int128 *a2, __int128 *a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v5 = *a2;
    this->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }

  uint64_t v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }

  else
  {
    __int128 v7 = *a3;
    this[1].__r_.__value_.__l.__cap_ = *((void *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }

  return this;
}

void sub_1860981B4(_Unwind_Exception *exception_object)
{
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }

uint64_t _UUIDBytesToPath<CFUUIDBytes>(unsigned __int8 *a1, char *__str, size_t __size)
{
  if (a1) {
    BOOL v3 = __str == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v5 = !v3 && __size > 0x25;
  if ((_DWORD)v5 == 1) {
    snprintf( __str,  __size,  "%02hhX%02hhX%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX/%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX/",  *a1,  a1[1],  a1[2],  a1[3],  a1[4],  a1[5],  a1[6],  a1[7],  a1[8],  a1[9],  a1[10],  a1[11],  a1[12],  a1[13],  a1[14],  a1[15]);
  }
  return v5;
}

uint64_t CSSymbolicationSessionCreateWithFlags(unsigned int a1)
{
  uint64_t v2 = (SymbolicationSession *)operator new(0x110uLL);
  SymbolicationSession::SymbolicationSession(v2, a1);
  return 1LL;
}

void sub_186098310(_Unwind_Exception *a1)
{
}

uint64_t CSSymbolicationSessionCreateSymbolicatorForPidWithFlags( char a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if (!(a1 & 7 | (8 * (a2 & 3)))) {
    return 0LL;
  }
  uint64_t result = SymbolicationSession::create_pid_symbolicator( (SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL),  a3,  a4,  a5);
  uint64_t v6 = (unsigned int *)result;
  if (result)
  {
    CSCppReferenceCount::retain(result);
    CSCppReferenceCount::release(v6, 1);
    return 2LL;
  }

  return result;
}

uint64_t CSSymbolicationSessionCreateNonFaultingSymbolicatorForPid(char a1, uint64_t a2, int a3, int a4)
{
  uint64_t FlagsForNonFaultingBehavior = CSSymbolicatorGetFlagsForNonFaultingBehavior();
  return CSSymbolicationSessionCreateSymbolicatorForPidWithFlags(a1, a2, a3, a4, FlagsForNonFaultingBehavior);
}

uint64_t CSSymbolicationSessionProcessATRCProcessAndDSCChunks( uint64_t result, uint64_t a2, __CFData *a3, __CFData *a4)
{
  if (result & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::process_ats_dsc_and_pid_chunks( (SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL),  a3,  a4);
  }
  return result;
}

uint64_t CSSymbolicationSessionProcessATRCKernelChunk(uint64_t result, uint64_t a2, __CFData *a3)
{
  if (result & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::process_ats_kernel_chunk((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  }
  return result;
}

__CFString *CSSymbolicationSessionCopyDescriptionWithIndent(char a1, uint64_t a2, int a3)
{
  if (!(a1 & 7 | (8 * (a2 & 3)))) {
    return 0LL;
  }
  unint64_t v4 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  for (uint64_t i = CFStringCreateMutable(0LL, 0LL); a3; --a3)
    CFStringAppendCString(i, "\t", 0x8000100u);
  CFStringAppendFormat( i,  0LL,  @"<SymbolicationSession: %p> flags: 0x%x process count: %llu",  v4,  *(unsigned int *)(v4 + 256),  *(void *)(v4 + 168));
  return i;
}

uint64_t CSSymbolicationSessionSetGroupKey(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result & 7 | (8 * (a2 & 3))) {
    *(void *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + 264) = a3;
  }
  return result;
}

uint64_t CSSymbolicationSessionForeachPid(char a1, uint64_t a2, uint64_t a3)
{
  if (a1 & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::foreach_pid(a2 & 0xFFFFFFFFFFFFFFFCLL, a3);
  }
  else {
    return 0LL;
  }
}

void *CSSymbolicationSessionGetDSCSlideForPid(char a1, uint64_t a2, int a3)
{
  if (a1 & 7 | (8 * (a2 & 3))) {
    return SymbolicationSession::dsc_slide_for_pid((SymbolicationSession *)(a2 & 0xFFFFFFFFFFFFFFFCLL), a3);
  }
  else {
    return 0LL;
  }
}

uint64_t CSExceptionSafeThreadRunBlock(CSCppExceptionSafeThread *a1)
{
  uint64_t v2 = CSCppExceptionSafeThread::main(a1);
  return CSCppExceptionSafeThread::run((uint64_t)v2, (uint64_t)a1, 0LL);
}

void *CSCppExceptionSafeThread::main(CSCppExceptionSafeThread *this)
{
  {
    CSCppExceptionSafeThread::CSCppExceptionSafeThread((CSCppExceptionSafeThread *)&CSCppExceptionSafeThread::main(void)::thread_singleton);
  }

  return &CSCppExceptionSafeThread::main(void)::thread_singleton;
}

void sub_1860985AC(_Unwind_Exception *a1)
{
}

uint64_t CSExceptionSafeThreadRunBlockWithHandler(CSCppExceptionSafeThread *a1, uint64_t a2)
{
  unint64_t v4 = CSCppExceptionSafeThread::main(a1);
  return CSCppExceptionSafeThread::run((uint64_t)v4, (uint64_t)a1, a2);
}

uint64_t CSExceptionSafeThreadProtectBlockWithHandler(CSCppExceptionSafeThread *a1, uint64_t a2)
{
  BOOL is_current_thread = CSCppExceptionSafeThread::is_current_thread(a1);
  if (is_current_thread)
  {
    uint64_t v5 = CSCppExceptionSafeThread::main((CSCppExceptionSafeThread *)is_current_thread);
    return CSCppExceptionSafeThread::run((uint64_t)v5, (uint64_t)a1, a2);
  }

  else
  {
    (*((void (**)(CSCppExceptionSafeThread *))a1 + 2))(a1);
    return 4096LL;
  }

_OWORD *kCSTypeRetainCallBack(const __CFAllocator *a1, uint64_t *a2)
{
  BOOL v3 = malloc(0x10uLL);
  _OWORD *v3 = *(_OWORD *)a2;
  CSRetain(*a2, a2[1]);
  return v3;
}

void kCSTypeReleaseCallBack(const __CFAllocator *a1, void *a2)
{
}

BOOL kCSTypeEqualCallBack(uint64_t *a1, uint64_t *a2)
{
  return CSEqual(*a1, a1[1], *a2, a2[1]);
}

uint64_t kCSTypeHashCallBack(void *a1)
{
  return a1[1] ^ *a1;
}

__n128 kCSTypeWeakRetainCallBack(const __CFAllocator *a1, __n128 *a2)
{
  BOOL v3 = malloc(0x10uLL);
  __n128 result = *a2;
  _OWORD *v3 = *a2;
  return result;
}

void kCSTypeWeakReleaseCallBack(const __CFAllocator *a1, void *a2)
{
}

uint64_t CSCppMMapSourceInfo::path(CSCppMMapSourceInfo *this, uint64_t a2)
{
  return *((unsigned int *)this + 2) + a2;
}

uint64_t _copyMMapArchiveFromCacheWithUUID<CFUUIDBytes>( __n128 *a1, void *a2, unint64_t *a3, unsigned __int16 *a4)
{
  if (a1 && !UUID::is_null((UUID *)a1)) {
    return CSCppMMapArchiveCache::archive_for_uuid(a1, 0LL, 1, a2, a3, a4, 0LL, v8);
  }
  else {
    return 0LL;
  }
}

uint64_t CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory( uint64_t a1, uint64_t a2, char *a3, const char *a4, _OWORD *a5)
{
  *(void *)a1 = off_189DFAFD8;
  uint64_t v9 = (void *)(a1 + 40);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 16), a3);
  if (a4) {
    unint64_t v10 = (char *)a4;
  }
  else {
    unint64_t v10 = "";
  }
  unint64_t v11 = (UUID *)std::string::basic_string[abi:ne180100]<0>(v9, v10);
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 144) = 0LL;
  unint64_t v12 = (void *)(a1 + 144);
  *(void *)(a1 + 152) = 0LL;
  *(void *)(a1 + 160) = 0LL;
  *(_OWORD *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = 0u;
  *(_OWORD *)(a1 + 89) = 0u;
  *(_OWORD *)(a1 + 16_Block_object_dispose(va, 8) = *(_OWORD *)UUID::null_uuid(v11);
  *(_OWORD *)(a1 + 184) = *a5;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  uint8x8_t v13 = new_partial_file_memory((uint64_t)a3, 0LL, 0LL, (uint64_t)&__block_literal_global_4);
  unint64_t v45 = v13;
  unint64_t v14 = (CSCppDyldSharedCache *)TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::dyld_shared_cache_at(&v45, 0LL);
  char v15 = v14;
  if (v14)
  {
    *(_OWORD *)(a1 + 16_Block_object_dispose(va, 8) = *(_OWORD *)CSCppDyldSharedCache::dsc_uuid(v14);
    if (a4) {
      *(void *)(a1 + 64) = CSCppDyldSharedCacheMemory::TEXT_address_of_path( (CSCppDyldSharedCacheMemory *)a1,  a4,  (unint64_t *)(a1 + 72));
    }
    *(void *)(a1 + 216) = CSCppDyldSharedCache::text_segment_range(v15);
    *(void *)(a1 + 224) = v16;
    uint64_t v41 = 0LL;
    __int128 v42 = &v41;
    uint64_t v43 = 0x2000000000LL;
    uint64_t v44 = 0LL;
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 0x40000000LL;
    v40[2] = ___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke_2;
    v40[3] = &unk_189DFB058;
    v40[4] = &v41;
    v40[5] = a1;
    v40[6] = a3;
    CSCppDyldSharedCache::enumerate_mapping_infos((uint64_t)v15, (uint64_t)v40);
    unint64_t v17 = CSCppDyldSharedCache::local_symbols_range(v15);
    unint64_t v19 = v18;
    *(void *)(a1 + std::__hash_table<char const*,std::hash<char const*>,std::equal_to<char const*>,std::allocator<char const*>>::~__hash_table(v3 + 80) = v17;
    *(void *)(a1 + 8_Block_object_dispose(va, 8) = v18;
    if (v18)
    {
      BOOL v20 = operator new(0x78uLL);
      CSCppFileMemory::CSCppFileMemory((uint64_t)v20, a3, v17, v19);
      uint64_t v21 = *(void *)(a1 + 96);
      *(void *)(a1 + 96) = v20;
      if (!v21 || ((*(void (**)(uint64_t))(*(void *)v21 + 8LL))(v21), (BOOL v20 = *(void **)(a1 + 96)) != 0LL))
      {
        unint64_t v22 = (unsigned int *)(*(uint64_t (**)(void *, void, void))(*(void *)v20 + 32LL))( v20,  *(void *)(a1 + 80),  *(void *)(a1 + 88));
        if (v22) {
          *(_BYTE *)(a1 + 104) = CSCppDyldSharedCache::stripped_locals_data_for ((uint64_t)v15, v42[3], v22, a1 + 112);
        }
      }
    }

    unint64_t v23 = *(void *)(a1 + 160);
    uint64_t v24 = *(void *)(a1 + 216);
    uint64_t v25 = v13[4];
    *(void *)(a1 + 200) = v24;
    *(void *)(a1 + 20_Block_object_dispose(va, 8) = v25;
    uint64_t v26 = v13[6];
    __int128 v27 = *(void **)(a1 + 152);
    if ((unint64_t)v27 >= v23)
    {
      uint64_t v29 = ((uint64_t)v27 - *v12) >> 5;
      unint64_t v30 = v29 + 1;
      uint64_t v31 = v23 - *v12;
      if (v31 >> 4 > v30) {
        unint64_t v30 = v31 >> 4;
      }
      else {
        unint64_t v32 = v30;
      }
      v46[4] = a1 + 160;
      uint64_t v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>(a1 + 160, v32);
      std::string v34 = &v33[32 * v29];
      v46[0] = v33;
      v46[1] = v34;
      v46[3] = &v33[32 * v35];
      *(void *)std::string v34 = v24;
      *((void *)v34 + 1) = v25;
      *((void *)v34 + 2) = v26;
      *((void *)v34 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v13;
      v46[2] = v34 + 32;
      std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer( (uint64_t *)(a1 + 144),  v46);
      unint64_t v28 = *(void *)(a1 + 152);
      std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer((uint64_t)v46);
    }

    else
    {
      *__int128 v27 = v24;
      v27[1] = v25;
      void v27[2] = v26;
      void v27[3] = v13;
      unint64_t v28 = (unint64_t)(v27 + 4);
      *(void *)(a1 + 152) = v27 + 4;
    }

    uint64_t v36 = *(void *)(a1 + 144);
    unint64_t v37 = 126 - 2 * __clz((uint64_t)(v28 - v36) >> 5);
    *(void *)(a1 + 152) = v28;
    if (v28 == v36) {
      uint64_t v38 = 0LL;
    }
    else {
      uint64_t v38 = v37;
    }
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>( v36,  v28,  (uint64_t)v46,  v38,  1);
    _Block_object_dispose(&v41, 8);
  }

  else if (v13)
  {
    (*(void (**)(void *))(*v13 + 8LL))(v13);
  }

  return a1;
}

void sub_186098AB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
  }
  std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  uint64_t v14 = *(void *)(v9 + 96);
  *(void *)(v9 + 96) = 0LL;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
  }
  _Unwind_Resume(a1);
}

uint64_t CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory( UUID *a1, uint64_t a2, char *a3, const char *a4)
{
  __int128 v7 = UUID::null_uuid(a1);
  return CSCppDyldSharedCacheMemory::CSCppDyldSharedCacheMemory((uint64_t)a1, v8, a3, a4, v7);
}

const char *___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::needed_mapping_size_for_dyld_shared_cache_at(&v3, 0LL);
}

uint64_t CSCppDyldSharedCacheMemory::TEXT_address_of_path( CSCppDyldSharedCacheMemory *this, const char *a2, unint64_t *a3)
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 0LL;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2000000000LL;
  char v10 = 0;
  uint64_t v6 = (const char *)_dyld_shared_cache_real_path();
  if (v6) {
    strcmp(a2, v6);
  }
  CSCppDyldSharedCacheMemory::foreach_text_segment((uint64_t)this);
  if (a3) {
    *a3 = v12[3];
  }
  uint64_t v7 = v16[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

void sub_186098D18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t ___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke_2( uint64_t result, unint64_t *a2)
{
  uint64_t v3 = result;
  unint64_t v4 = *(void **)(result + 40);
  unint64_t v5 = *a2;
  uint64_t v7 = v4 + 9;
  uint64_t v6 = v4[9];
  if (v6 && (unint64_t v8 = v4[8], v8 >= v5) && v8 + v6 <= a2[1] + v5)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v8 - v5 + a2[2];
    unint64_t v13 = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
    unint64_t v14 = *v7;
    uint64_t v11 = operator new(0x78uLL);
    CSCppFileMemory::CSCppFileMemory((uint64_t)v11, *(char **)(v3 + 48), v13, v14);
    unint64_t v12 = *(void *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL);
    v5 += v12;
  }

  else
  {
    if (*((_DWORD *)a2 + 7) != 1) {
      return result;
    }
    unint64_t v9 = a2[1];
    unint64_t v10 = a2[2];
    uint64_t v7 = a2 + 1;
    uint64_t v11 = operator new(0x78uLL);
    CSCppFileMemory::CSCppFileMemory((uint64_t)v11, *(char **)(v3 + 48), v10, v9);
    unint64_t v12 = a2[2];
  }

  unint64_t v15 = *v7;
  __n128 result = (uint64_t)(v4 + 20);
  unint64_t v16 = v4[20];
  uint64_t v17 = (unint64_t *)v4[19];
  if ((unint64_t)v17 >= v16)
  {
    uint64_t v19 = v4[18];
    uint64_t v20 = ((uint64_t)v17 - v19) >> 5;
    unint64_t v21 = v20 + 1;
    uint64_t v22 = v16 - v19;
    if (v22 >> 4 > v21) {
      unint64_t v21 = v22 >> 4;
    }
    else {
      unint64_t v23 = v21;
    }
    v27[4] = v4 + 20;
    uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSegmentRange>>(result, v23);
    uint64_t v25 = &v24[32 * v20];
    v27[0] = v24;
    v27[1] = v25;
    void v27[3] = &v24[32 * v26];
    *(void *)uint64_t v25 = v5;
    *((void *)v25 + 1) = v15;
    *((void *)v25 + 2) = v12;
    *((void *)v25 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v11;
    void v27[2] = v25 + 32;
    std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer(v4 + 18, v27);
    uint64_t v18 = (void *)v4[19];
    __n128 result = std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer((uint64_t)v27);
  }

  else
  {
    *uint64_t v17 = v5;
    v17[1] = v15;
    v17[2] = v12;
    void v17[3] = (unint64_t)v11;
    uint64_t v18 = v17 + 4;
    v4[19] = v17 + 4;
  }

  v4[19] = v18;
  return result;
}

void sub_186098F00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void CSCppDyldSharedCacheMemory::~CSCppDyldSharedCacheMemory(CSCppDyldSharedCacheMemory *this)
{
  *(void *)this = off_189DFAFD8;
  uint64_t v3 = (void **)((char *)this + 144);
  std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *((void *)this + 12);
  *((void *)this + 12) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
}

{
  void *v1;
  CSCppDyldSharedCacheMemory::~CSCppDyldSharedCacheMemory(this);
  operator delete(v1);
}

unint64_t CSCppDyldSharedCacheMemory::file_range_for_memory_range( uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 144);
  uint64_t v4 = *(void *)(a1 + 152) - (void)v3;
  if (!v4) {
    return 0LL;
  }
  unint64_t v5 = v4 >> 5;
  uint64_t v6 = *(void **)(a1 + 144);
  do
  {
    unint64_t v7 = v5 >> 1;
    unint64_t v8 = &v6[4 * (v5 >> 1)];
    unint64_t v10 = *v8;
    unint64_t v9 = v8 + 4;
    v5 += ~(v5 >> 1);
    if (*a2 < v10) {
      unint64_t v5 = v7;
    }
    else {
      uint64_t v6 = v9;
    }
  }

  while (v5);
  if (v6 == v3) {
    return 0LL;
  }
  unint64_t v11 = *(v6 - 4);
  unint64_t v12 = *a2 - v11;
  if (*a2 < v11 || a2[1] + *a2 > *(v6 - 3) + v11) {
    return 0LL;
  }
  if (a3) {
    *a3 = *(v6 - 1);
  }
  return v12 + *(v6 - 2);
}

uint64_t CSCppDyldSharedCacheMemory::foreach_text_segment(uint64_t a1)
{
  v14[2] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  if (*(char *)(a1 + 39) < 0)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 24);
    if (!v2) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 39);
    uint64_t v3 = a1 + 16;
    if (!*(_BYTE *)(a1 + 39)) {
      goto LABEL_10;
    }
  }

  uint64_t v4 = v3 - 1;
  while (v2)
  {
    int v5 = *(unsigned __int8 *)(v4 + v2--);
    if (v5 == 47)
    {
      if (v2 == -1) {
        break;
      }
      std::string::basic_string(&v9, (const std::string *)(a1 + 16), 0LL, v2 + 1, (std::allocator<char> *)v14);
      goto LABEL_11;
    }
  }

void sub_1860991E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory20foreach_text_segmentEU13block_pointerFvPKcyyE_block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::foreach_text_memory(uint64_t a1)
{
  return CSCppDyldSharedCacheMemory::foreach_text_segment(a1);
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory19foreach_text_memoryEU13block_pointerFvPKcP15CSCppFileMemoryE_block_invoke( uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  v15[0] = a3;
  v15[1] = a4;
  unint64_t v7 = CSCppDyldSharedCacheMemory::file_range_for_memory_range(v6, v15, 0LL);
  if (v8)
  {
    unint64_t v9 = v7;
    uint64_t v10 = (void *)(v6 + 16);
    unint64_t v11 = operator new(0x78uLL);
    CSCppFileMemory::CSCppFileMemory(v11, v10, v9);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    return (*(uint64_t (**)(void *))(*(void *)v11 + 8LL))(v11);
  }

  unint64_t v12 = a3 - *(void *)(v6 + 216);
  if (v12 < *(void *)(v6 + 224))
  {
    uint64_t v13 = (void *)(v6 + 16);
    unint64_t v11 = operator new(0x78uLL);
    CSCppFileMemory::CSCppFileMemory(v11, v13, v12);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    return (*(uint64_t (**)(void *))(*(void *)v11 + 8LL))(v11);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1860993E8(_Unwind_Exception *a1)
{
}

uint64_t ___ZNK26CSCppDyldSharedCacheMemory20TEXT_address_of_pathEPKcPy_block_invoke( uint64_t result, char *__s1, uint64_t a3, uint64_t a4)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL))
  {
    uint64_t v7 = result;
    uint64_t result = strcmp(__s1, *(const char **)(result + 56));
    if (!(_DWORD)result || *(_BYTE *)(v7 + 72) && (uint64_t result = strcmp(__s1, *(const char **)(v7 + 64)), !(_DWORD)result))
    {
      *(void *)(*(void *)(*(void *)(v7 + 40) + 8LL) + 24LL) = a3;
      *(void *)(*(void *)(*(void *)(v7 + 48) + 8LL) + 24LL) = a4;
      *(_BYTE *)(*(void *)(*(void *)(v7 + 32) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

uint64_t CSCppDyldSharedCacheMemory::bytes_at(uint64_t a1, unint64_t a2, unint64_t a3)
{
  v7[0] = a2;
  v7[1] = a3;
  uint64_t v6 = 0LL;
  unint64_t v4 = CSCppDyldSharedCacheMemory::file_range_for_memory_range(a1, v7, &v6);
  uint64_t result = v6;
  if (v6) {
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v6 + 32LL))(v6, v4, v3);
  }
  return result;
}

uint64_t CSCppDyldSharedCacheMemory::footprint(CSCppDyldSharedCacheMemory *this)
{
  uint64_t v2 = *((void *)this + 18);
  uint64_t v3 = *((void *)this + 19);
  uint64_t v4 = v3 - v2 + 232;
  uint64_t v5 = *((void *)this + 12);
  if (v5)
  {
    v4 += (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40LL))(v5);
    uint64_t v2 = *((void *)this + 18);
    uint64_t v3 = *((void *)this + 19);
  }

  while (v2 != v3)
  {
    uint64_t v6 = *(void *)(v2 + 24);
    if (v6) {
      v4 += (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40LL))(v6);
    }
    v2 += 32LL;
  }

  return v4;
}

uint64_t CSCppDyldSharedCacheMemory::to_string@<X0>(CSCppDyldSharedCacheMemory *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v14,  (uint64_t)"CSCppDyldSharedCache path:",  26LL);
  int v5 = *((char *)this + 39);
  if (v5 >= 0) {
    uint64_t v6 = (char *)this + 16;
  }
  else {
    uint64_t v6 = (char *)*((void *)this + 2);
  }
  if (v5 >= 0) {
    uint64_t v7 = *((unsigned __int8 *)this + 39);
  }
  else {
    uint64_t v7 = *((void *)this + 3);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v6, v7);
  if (std::string::compare((const std::string *)((char *)this + 40), ""))
  {
    uint64_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v14,  (uint64_t)", (symbol owner: ",  17LL);
    int v9 = *((char *)this + 63);
    if (v9 >= 0) {
      uint64_t v10 = (char *)this + 40;
    }
    else {
      uint64_t v10 = (char *)*((void *)this + 5);
    }
    if (v9 >= 0) {
      uint64_t v11 = *((unsigned __int8 *)this + 63);
    }
    else {
      uint64_t v11 = *((void *)this + 6);
    }
    unint64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)v10, v11);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)")", 1LL);
  }

  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a2);
  uint64_t v14 = *MEMORY[0x189614738];
  *(void *)((char *)&v15[-1] + *(void *)(v14 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v15[0] = MEMORY[0x189614750] + 16LL;
  if (v16 < 0) {
    operator delete((void *)v15[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E30F0C](&v17);
}

void sub_1860996B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CSCppDyldSharedCacheMemory::is_task(CSCppDyldSharedCacheMemory *this)
{
  return 1LL;
}

uint64_t CSCppDyldSharedCacheMemory::is_dyld_shared_cache(CSCppDyldSharedCacheMemory *this)
{
  return 1LL;
}

uint64_t *std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__swap_out_circular_buffer( uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 == *result)
  {
    uint64_t v5 = a2[1];
  }

  else
  {
    do
    {
      uint64_t v5 = v4 - 32;
      *(_OWORD *)(v4 - 32) = *(_OWORD *)(v3 - 32);
      uint64_t v6 = *(void *)(v3 - 16);
      uint64_t v7 = *(void *)(v3 - 8);
      *(void *)(v3 - _Block_object_dispose((const void *)(v11 - 64), 8) = 0LL;
      *(void *)(v4 - 16) = v6;
      *(void *)(v4 - _Block_object_dispose((const void *)(v11 - 64), 8) = v7;
      v4 -= 32LL;
      v3 -= 32LL;
    }

    while (v3 != v2);
  }

  a2[1] = v5;
  uint64_t v8 = *result;
  *uint64_t result = v5;
  a2[1] = v8;
  uint64_t v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::~__split_buffer( uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - _Block_object_dispose((const void *)(v11 - 64), 8) = 0LL;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
    }
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>( uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v7 = (__int128 *)a2;
  uint64_t v8 = (__int128 *)result;
  unint64_t v22 = a2;
  unint64_t v23 = (__int128 *)result;
  while (2)
  {
    uint64_t v9 = 1 - a4;
LABEL_3:
    uint64_t v10 = (char *)v7 - (char *)v8;
    unint64_t v11 = ((char *)v7 - (char *)v8) >> 5;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        unint64_t v20 = *((void *)v7 - 4);
        unint64_t v22 = (unint64_t)(v7 - 2);
        if (v20 < *(void *)v8) {
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v23,  (uint64_t *)&v22);
        }
        return result;
      case 3uLL:
        unint64_t v22 = (unint64_t)(v7 - 2);
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v8,  v8 + 2,  (void *)v7 - 4);
      case 4uLL:
        unint64_t v22 = (unint64_t)(v7 - 2);
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v8,  v8 + 2,  v8 + 4,  (void *)v7 - 4);
      case 5uLL:
        unint64_t v22 = (unint64_t)(v7 - 2);
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v8,  v8 + 2,  v8 + 4,  v8 + 6,  (void *)v7 - 4);
      default:
        if (v10 <= 767)
        {
          if ((a5 & 1) != 0) {
            return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (uint64_t)v8,  (uint64_t)v7);
          }
          else {
            return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (uint64_t)v8,  (uint64_t)v7);
          }
        }

        if (v9 == 1)
        {
          if (v8 != v7) {
            return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (unint64_t *)v8,  v7,  v7,  a3);
          }
          return result;
        }

        unint64_t v12 = v11 >> 1;
        uint64_t v13 = v7 - 2;
        if ((unint64_t)v10 <= 0x1000)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( &v8[2 * (v11 >> 1)],  v8,  v13);
        }

        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v8,  &v8[2 * (v11 >> 1)],  v13);
          unint64_t v14 = v22;
          uint64_t v15 = 32 * v12 - 32;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v23 + 2,  (__int128 *)((char *)v23 + v15),  (void *)(v22 - 64));
          uint64_t v16 = 32 * v12 + 32;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v23 + 4,  (__int128 *)((char *)v23 + v16),  (void *)(v14 - 96));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (__int128 *)((char *)v23 + v15),  &v23[2 * v12],  (__int128 *)((char *)v23 + v16));
          unint64_t v21 = &v23[2 * v12];
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v23,  (uint64_t *)&v21);
        }

        if ((a5 & 1) == 0)
        {
          uint64_t v7 = (__int128 *)v22;
          if (*((void *)v23 - 4) < *(void *)v23) {
            goto LABEL_12;
          }
          uint64_t result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>( (uint64_t)v23,  v22);
          uint64_t v8 = (__int128 *)result;
LABEL_21:
          a5 = 0;
          unint64_t v23 = v8;
          a4 = -v9;
          continue;
        }

        uint64_t v7 = (__int128 *)v22;
LABEL_12:
        uint64_t v17 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>( (uint64_t)v23,  (unint64_t)v7);
        if ((v18 & 1) == 0)
        {
LABEL_19:
          uint64_t result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,false>( v23,  v17,  a3,  -v9,  a5 & 1);
          uint64_t v8 = v17 + 2;
          goto LABEL_21;
        }

        BOOL v19 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v23,  v17);
        uint64_t v8 = v17 + 2;
        uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v17 + 2,  v7);
        if (!(_DWORD)result)
        {
          if (v19)
          {
            unint64_t v23 = v17 + 2;
            goto LABEL_18;
          }

          goto LABEL_19;
        }

        if (!v19)
        {
          unint64_t v22 = (unint64_t)v17;
          uint64_t v8 = v23;
          uint64_t v7 = v17;
LABEL_18:
          ++v9;
          goto LABEL_3;
        }

        return result;
    }
  }

uint64_t std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( __int128 **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  __int128 v9 = **a1;
  uint64_t v4 = *((void *)*a1 + 2);
  uint64_t v5 = *((void *)*a1 + 3);
  *((void *)v2 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = 0LL;
  __int128 *v2 = *(_OWORD *)v3;
  *((void *)v2 + 2) = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = 0LL;
  uint64_t v7 = *((void *)v2 + 3);
  *((void *)v2 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  }
  *(_OWORD *)uint64_t v3 = v9;
  uint64_t result = *(void *)(v3 + 24);
  *(void *)(v3 + 16) = v4;
  *(void *)(v3 + 24) = v5;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 32;
    if (result + 32 != a2)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = result;
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = v4;
        unint64_t v8 = *(void *)(v7 + 32);
        if (v8 < *(void *)v7)
        {
          __int128 v17 = *(_OWORD *)(v7 + 40);
          uint64_t v9 = *(void *)(v7 + 56);
          uint64_t v10 = v5;
          *(void *)(v7 + 56) = 0LL;
          while (1)
          {
            uint64_t v11 = v3 + v10;
            *(_OWORD *)(v11 + 32) = *(_OWORD *)(v3 + v10);
            uint64_t v12 = *(void *)(v3 + v10 + 16);
            uint64_t v13 = *(void *)(v3 + v10 + 24);
            *(void *)(v11 + 24) = 0LL;
            uint64_t v14 = *(void *)(v3 + v10 + 56);
            *(void *)(v11 + 4_Block_object_dispose((const void *)(v11 - 64), 8) = v12;
            *(void *)(v11 + 56) = v13;
            if (v14) {
              (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
            }
            if (!v10) {
              break;
            }
            unint64_t v15 = *(void *)(v3 + v10 - 32);
            v10 -= 32LL;
            if (v8 >= v15)
            {
              uint64_t v16 = v3 + v10 + 32;
              goto LABEL_12;
            }
          }

          uint64_t v16 = v3;
LABEL_12:
          *(void *)uint64_t v16 = v8;
          *(_OWORD *)(v16 + _Block_object_dispose((const void *)(v11 - 64), 8) = v17;
          uint64_t result = *(void *)(v16 + 24);
          *(void *)(v16 + 24) = v9;
          if (result) {
            uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
          }
        }

        uint64_t v4 = v6 + 32;
        v5 += 32LL;
      }

      while (v6 + 32 != a2);
    }
  }

  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 32;
    if (result + 32 != a2)
    {
      uint64_t v5 = (void *)(result + 56);
      do
      {
        uint64_t v6 = v3;
        uint64_t v3 = v4;
        unint64_t v7 = *(void *)(v6 + 32);
        if (v7 < *(void *)v6)
        {
          __int128 v14 = *(_OWORD *)(v6 + 40);
          uint64_t v8 = *(void *)(v6 + 56);
          uint64_t v9 = v5;
          *(void *)(v6 + 56) = 0LL;
          do
          {
            *(_OWORD *)(v9 - pthread_mutex_lock((pthread_mutex_t *)this + 3) = *(_OWORD *)(v9 - 7);
            uint64_t v10 = *(v9 - 5);
            uint64_t v11 = *(v9 - 4);
            *(v9 - 4) = 0LL;
            uint64_t v12 = *v9;
            *(v9 - 1) = v10;
            *uint64_t v9 = v11;
            if (v12) {
              (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
            }
            unint64_t v13 = *(v9 - 11);
            v9 -= 4;
          }

          while (v7 < v13);
          *(v9 - pthread_mutex_lock((pthread_mutex_t *)this + 3) = v7;
          *((_OWORD *)v9 - 1) = v14;
          uint64_t result = *v9;
          *uint64_t v9 = v8;
          if (result) {
            uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
          }
        }

        uint64_t v4 = v3 + 32;
        v5 += 4;
      }

      while (v3 + 32 != a2);
    }
  }

  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( __int128 *a1, __int128 *a2, void *a3)
{
  uint64_t v10 = a1;
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  unint64_t v3 = *(void *)a2;
  unint64_t v4 = *a3;
  if (*(void *)a2 < *(void *)a1)
  {
    if (v4 < v3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v10,  (uint64_t *)&v8);
      return 1LL;
    }

    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v10,  (uint64_t *)&v9);
    if (*v8 >= *(void *)v9) {
      return 1LL;
    }
    uint64_t v5 = &v9;
    uint64_t v6 = (uint64_t *)&v8;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( v5,  v6);
    return 2LL;
  }

  if (v4 < v3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v9,  (uint64_t *)&v8);
    if (*(void *)v9 >= *(void *)v10) {
      return 1LL;
    }
    uint64_t v5 = &v10;
    uint64_t v6 = (uint64_t *)&v9;
    goto LABEL_9;
  }

  return 0LL;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>( uint64_t a1, unint64_t a2)
{
  unint64_t v20 = a2;
  __int128 v3 = *(_OWORD *)a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0LL;
  unint64_t v6 = v3;
  if ((unint64_t)v3 >= *(void *)(a2 - 32))
  {
    uint64_t v9 = (__int128 *)(a1 + 32);
    do
    {
      unint64_t v7 = v9;
      v9 += 2;
    }

    while ((unint64_t)v3 >= *(void *)v7);
  }

  else
  {
    unint64_t v7 = (__int128 *)a1;
    do
    {
      unint64_t v8 = *((void *)v7 + 4);
      v7 += 2;
    }

    while ((unint64_t)v3 >= v8);
  }

  unint64_t v21 = v7;
  __int128 v19 = v3;
  if ((unint64_t)v7 < a2)
  {
    do
    {
      unint64_t v10 = *(void *)(a2 - 32);
      a2 -= 32LL;
    }

    while ((unint64_t)v3 < v10);
    unint64_t v20 = a2;
  }

  if ((unint64_t)v7 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v21,  (uint64_t *)&v20);
      unint64_t v7 = v21;
      do
      {
        unint64_t v11 = *((void *)v7 + 4);
        v7 += 2;
      }

      while (v6 >= v11);
      unint64_t v21 = v7;
      unint64_t v12 = v20;
      do
      {
        unint64_t v13 = *(void *)(v12 - 32);
        v12 -= 32LL;
      }

      while (v6 < v13);
      unint64_t v20 = v12;
    }

    while ((unint64_t)v7 < v12);
  }

  if (v7 - 2 != (__int128 *)a1)
  {
    *(_OWORD *)a1 = *(v7 - 2);
    uint64_t v14 = *((void *)v7 - 2);
    uint64_t v15 = *((void *)v7 - 1);
    *((void *)v7 - 1) = 0LL;
    uint64_t v16 = *(void *)(a1 + 24);
    *(void *)(a1 + 16) = v14;
    *(void *)(a1 + 24) = v15;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
    }
  }

  *(v7 - 2) = v19;
  uint64_t v17 = *((void *)v7 - 1);
  *((void *)v7 - 2) = v4;
  *((void *)v7 - 1) = v5;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  return v21;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,std::__less<void,void> &>( uint64_t a1, unint64_t a2)
{
  uint64_t v4 = 0LL;
  __int128 v5 = *(_OWORD *)a1;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0LL;
  __int128 v22 = v5;
  unint64_t v8 = v5;
  do
  {
    unint64_t v9 = *(void *)(a1 + v4 + 32);
    v4 += 32LL;
  }

  while (v9 < (unint64_t)v5);
  unint64_t v10 = a1 + v4;
  uint64_t v24 = (__int128 *)(a1 + v4);
  if (v4 == 32)
  {
    do
    {
      if (v10 >= a2) {
        break;
      }
      unint64_t v12 = *(void *)(a2 - 32);
      a2 -= 32LL;
    }

    while (v12 >= (unint64_t)v5);
  }

  else
  {
    do
    {
      unint64_t v11 = *(void *)(a2 - 32);
      a2 -= 32LL;
    }

    while (v11 >= (unint64_t)v5);
  }

  unint64_t v23 = a2;
  unint64_t v13 = (__int128 *)(a1 + v4);
  if (v10 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v24,  (uint64_t *)&v23);
      unint64_t v13 = v24;
      do
      {
        unint64_t v14 = *((void *)v13 + 4);
        v13 += 2;
      }

      while (v14 < v8);
      uint64_t v24 = v13;
      unint64_t v15 = v23;
      do
      {
        unint64_t v16 = *(void *)(v15 - 32);
        v15 -= 32LL;
      }

      while (v16 >= v8);
      unint64_t v23 = v15;
    }

    while ((unint64_t)v13 < v15);
  }

  if (v13 - 2 != (__int128 *)a1)
  {
    *(_OWORD *)a1 = *(v13 - 2);
    uint64_t v17 = *((void *)v13 - 2);
    uint64_t v18 = *((void *)v13 - 1);
    *((void *)v13 - 1) = 0LL;
    uint64_t v19 = *(void *)(a1 + 24);
    *(void *)(a1 + 16) = v17;
    *(void *)(a1 + 24) = v18;
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 8LL))(v19);
    }
  }

  *(v13 - 2) = v22;
  uint64_t v20 = *((void *)v13 - 1);
  *((void *)v13 - 2) = v6;
  *((void *)v13 - 1) = v7;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8LL))(v20);
  }
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( __int128 *a1, __int128 *a2)
{
  __int128 v22 = a1;
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 5;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      unint64_t v6 = *((void *)a2 - 4);
      unint64_t v21 = a2 - 2;
      if (v6 < *(void *)a1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v22,  (uint64_t *)&v21);
        return 1LL;
      }

      return result;
    case 3LL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( a1,  a1 + 2,  (void *)a2 - 4);
      return 1LL;
    case 4LL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( a1,  a1 + 2,  a1 + 4,  (void *)a2 - 4);
      return 1LL;
    case 5LL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( a1,  a1 + 2,  a1 + 4,  a1 + 6,  (void *)a2 - 4);
      return 1LL;
    default:
      uint64_t v7 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( a1,  a1 + 2,  (void *)a1 + 8);
      unint64_t v8 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1LL;
      }
      int v9 = 0;
      unint64_t v10 = (uint64_t *)a1 + 15;
      break;
  }

  while (1)
  {
    unint64_t v11 = *(void *)v8;
    if (*(void *)v8 < *(void *)v7)
    {
      __int128 v20 = *(__int128 *)((char *)v8 + 8);
      uint64_t v12 = *((void *)v8 + 3);
      *((void *)v8 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = 0LL;
      unint64_t v13 = v10;
      unint64_t v14 = v22;
      while (1)
      {
        *(_OWORD *)(v13 - pthread_mutex_lock((pthread_mutex_t *)this + 3) = *(_OWORD *)(v13 - 7);
        uint64_t v15 = *(v13 - 5);
        uint64_t v16 = *(v13 - 4);
        *(v13 - 4) = 0LL;
        uint64_t v17 = *v13;
        *(v13 - 1) = v15;
        *unint64_t v13 = v16;
        if (v17) {
          (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
        }
        unint64_t v18 = *(v13 - 11);
        v13 -= 4;
        if (v11 >= v18)
        {
          unint64_t v14 = (__int128 *)(v13 - 3);
          break;
        }
      }

      *(void *)unint64_t v14 = v11;
      *(__int128 *)((char *)v14 + _Block_object_dispose((const void *)(v11 - 64), 8) = v20;
      uint64_t v19 = *((void *)v14 + 3);
      *((void *)v14 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v12;
      if (v19) {
        (*(void (**)(uint64_t))(*(void *)v19 + 8LL))(v19);
      }
      if (++v9 == 8) {
        return v8 + 2 == a2;
      }
    }

    uint64_t v7 = v8;
    v10 += 4;
    v8 += 2;
    if (v8 == a2) {
      return 1LL;
    }
  }

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( __int128 *a1, __int128 *a2, __int128 *a3, void *a4)
{
  unint64_t v11 = a2;
  uint64_t v12 = a1;
  int v9 = a4;
  unint64_t v10 = a3;
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( a1,  a2,  a3);
  if (*a4 < *(void *)a3)
  {
    uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v10,  (uint64_t *)&v9);
    if (*(void *)v10 < *(void *)a2)
    {
      uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v11,  (uint64_t *)&v10);
      if (*(void *)v11 < *(void *)a1) {
        return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v12,  (uint64_t *)&v11);
      }
    }
  }

  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( __int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, void *a5)
{
  unint64_t v14 = a2;
  uint64_t v15 = a1;
  uint64_t v12 = a4;
  unint64_t v13 = a3;
  unint64_t v11 = a5;
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( a1,  a2,  a3,  a4);
  if (*a5 < *(void *)a4)
  {
    uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v12,  (uint64_t *)&v11);
    if (*(void *)v12 < *(void *)a3)
    {
      uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v13,  (uint64_t *)&v12);
      if (*(void *)v13 < *(void *)a2)
      {
        uint64_t result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v14,  (uint64_t *)&v13);
        if (*(void *)v14 < *(void *)a1) {
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v15,  (uint64_t *)&v14);
        }
      }
    }
  }

  return result;
}

__int128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( unint64_t *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v15 = a1;
  if (a1 != (unint64_t *)a2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = ((char *)a2 - (char *)a1) >> 5;
    if ((char *)a2 - (char *)a1 >= 33)
    {
      unint64_t v9 = (unint64_t)(v8 - 2) >> 1;
      unint64_t v10 = v9 + 1;
      unint64_t v11 = &a1[4 * v9];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (uint64_t)v7,  a4,  v8,  v11);
        v11 -= 4;
        --v10;
      }

      while (v10);
    }

    unint64_t v14 = a2;
    if (a2 != a3)
    {
      uint64_t v12 = a2;
      do
      {
        if (*(void *)v12 < *v15)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *&>( &v14,  (uint64_t *)&v15);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (uint64_t)v15,  a4,  v8,  v15);
          uint64_t v12 = v14;
        }

        v12 += 2;
        unint64_t v14 = v12;
      }

      while (v12 != a3);
      uint64_t v7 = v15;
    }

    std::__sort_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (uint64_t)v7,  (uint64_t)a2,  a4);
    return v14;
  }

  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( uint64_t result, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    __int128 v5 = a4;
    uint64_t v6 = result;
    uint64_t v7 = (uint64_t)a4 - result;
    uint64_t v8 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 5)
    {
      uint64_t v10 = v7 >> 4;
      uint64_t v11 = (v7 >> 4) + 1;
      uint64_t v12 = (unint64_t *)(result + 32 * v11);
      uint64_t v13 = v10 + 2;
      if (v10 + 2 >= a3)
      {
        unint64_t v14 = *v12;
      }

      else
      {
        unint64_t v14 = *v12;
        unint64_t v15 = v12[4];
        if (*v12 <= v15) {
          unint64_t v14 = v12[4];
        }
        if (*v12 < v15)
        {
          v12 += 4;
          uint64_t v11 = v13;
        }
      }

      unint64_t v16 = *a4;
      if (v14 >= *a4)
      {
        __int128 v24 = *(_OWORD *)(a4 + 1);
        unint64_t v17 = a4[3];
        a4[3] = 0LL;
        do
        {
          unint64_t v18 = v5;
          __int128 v5 = v12;
          *(_OWORD *)unint64_t v18 = *(_OWORD *)v12;
          unint64_t v19 = v12[2];
          unint64_t v20 = v5[3];
          void v5[3] = 0LL;
          unint64_t v21 = v18[3];
          v18[2] = v19;
          uint64_t v18[3] = v20;
          if (v21) {
            (*(void (**)(unint64_t))(*(void *)v21 + 8LL))(v21);
          }
          if (v8 < v11) {
            break;
          }
          uint64_t v12 = (unint64_t *)(v6 + 32 * ((2 * v11) | 1));
          if (2 * v11 + 2 >= a3)
          {
            unint64_t v22 = *v12;
            uint64_t v11 = (2 * v11) | 1;
          }

          else
          {
            unint64_t v22 = *v12;
            unint64_t v23 = v12[4];
            if (*v12 <= v23) {
              unint64_t v22 = v12[4];
            }
            if (*v12 >= v23)
            {
              uint64_t v11 = (2 * v11) | 1;
            }

            else
            {
              v12 += 4;
              uint64_t v11 = 2 * v11 + 2;
            }
          }
        }

        while (v22 >= v16);
        unint64_t *v5 = v16;
        *(_OWORD *)(v5 + 1) = v24;
        uint64_t result = v5[3];
        void v5[3] = v17;
        if (result) {
          return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
        }
      }
    }
  }

  return result;
}

uint64_t std::__sort_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 - result >= 33)
  {
    unint64_t v4 = (char *)result;
    uint64_t v5 = (unint64_t)(a2 - result) >> 5;
    uint64_t v6 = (void *)(a2 - 32);
    do
    {
      __int128 v15 = *(_OWORD *)v4;
      uint64_t v8 = *((void *)v4 + 2);
      uint64_t v7 = *((void *)v4 + 3);
      *((void *)v4 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = 0LL;
      unint64_t v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( v4,  a3,  v5);
      uint64_t v10 = v9;
      if (v6 == v9)
      {
        *(_OWORD *)unint64_t v9 = v15;
        uint64_t result = v9[3];
        _OWORD v10[2] = v8;
        void v10[3] = v7;
        if (result) {
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
        }
      }

      else
      {
        *(_OWORD *)unint64_t v9 = *(_OWORD *)v6;
        v9[2] = v6[2];
        uint64_t v11 = v6[3];
        v6[3] = 0LL;
        uint64_t v12 = v9[3];
        void v10[3] = v11;
        if (v12) {
          (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
        }
        *(_OWORD *)uint64_t v6 = v15;
        uint64_t v13 = v6[3];
        v6[2] = v8;
        v6[3] = v7;
        if (v13) {
          (*(void (**)(uint64_t))(*(void *)v13 + 8LL))(v13);
        }
        uint64_t result = std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( (uint64_t)v4,  (uint64_t)(v10 + 4),  a3,  ((char *)(v10 + 4) - v4) >> 5);
      }

      v6 -= 4;
    }

    while (v5-- > 2);
  }

  return result;
}

void sub_18609A750(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = a3 - 2;
  if (a3 < 2) {
    uint64_t v5 = a3 - 1;
  }
  uint64_t v6 = v5 >> 1;
  do
  {
    uint64_t v7 = &a1[4 * v4 + 4];
    uint64_t v8 = 2 * v4;
    uint64_t v4 = (2 * v4) | 1;
    if (v8 + 2 < a3 && *v7 < v7[4])
    {
      v7 += 4;
      uint64_t v4 = v8 + 2;
    }

    *(_OWORD *)a1 = *(_OWORD *)v7;
    uint64_t v9 = v7[2];
    uint64_t v10 = v7[3];
    v7[3] = 0LL;
    uint64_t v11 = a1[3];
    a1[2] = v9;
    a1[3] = v10;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
    }
    a1 = v7;
  }

  while (v4 <= v6);
  return v7;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,CSCppDyldSharedCacheMemory::CSCppAddressTranslation *>( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v5 = result;
    unint64_t v6 = v4 >> 1;
    uint64_t v7 = result + 32 * (v4 >> 1);
    uint64_t v8 = a2 - 32;
    unint64_t v9 = *(void *)(a2 - 32);
    if (*(void *)v7 < v9)
    {
      __int128 v15 = *(_OWORD *)(a2 - 24);
      uint64_t v10 = *(void *)(a2 - 8);
      *(void *)(a2 - _Block_object_dispose((const void *)(v11 - 64), 8) = 0LL;
      do
      {
        uint64_t v11 = v8;
        uint64_t v8 = v7;
        *(_OWORD *)uint64_t v11 = *(_OWORD *)v7;
        uint64_t v12 = *(void *)(v7 + 16);
        uint64_t v13 = *(void *)(v8 + 24);
        *(void *)(v8 + 24) = 0LL;
        uint64_t v14 = *(void *)(v11 + 24);
        *(void *)(v11 + 16) = v12;
        *(void *)(v11 + 24) = v13;
        if (v14) {
          (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
        }
        if (!v6) {
          break;
        }
        unint64_t v6 = (v6 - 1) >> 1;
        uint64_t v7 = v5 + 32 * v6;
      }

      while (*(void *)v7 < v9);
      *(void *)uint64_t v8 = v9;
      *(_OWORD *)(v8 + _Block_object_dispose((const void *)(v11 - 64), 8) = v15;
      uint64_t result = *(void *)(v8 + 24);
      *(void *)(v8 + 24) = v10;
      if (result) {
        return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
      }
    }
  }

  return result;
}

void std::vector<CSCppDyldSharedCacheMemory::CSCppAddressTranslation>::__destroy_vector::operator()[abi:ne180100]( void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = *((void *)v4 - 1);
        *((void *)v4 - 1) = 0LL;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
        }
        v4 -= 32;
      }

      while (v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

TMMapArchive *CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked( CSCppMMapArchiveCache *this, TMMapArchive *a2, CSCppSymbolOwner *a3)
{
  archive_wrapper = a2;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    if (*((_DWORD *)this + 20)) {
      return 0LL;
    }
    CSCppTextSectionDataDescriptor::CSCppTextSectionDataDescriptor((CSCppTextSectionDataDescriptor *)v20, a2);
    uint64_t v16 = *((void *)archive_wrapper + 14);
    if ((CSCppArchitecture::is_64_bit((CSCppArchitecture *)&v16) & 1) != 0)
    {
      CSCppTextSectionDataDescriptor::get_text_section<Pointer64>((uint64_t)v20, (uint64_t)archive_wrapper, &v16);
      uint64_t v5 = v16;
      unint64_t v6 = v17;
      uint64_t v7 = v18;
    }

    else
    {
      unint64_t text = CSCppTextSectionDataDescriptor::get_text_section<Pointer32>( (unint64_t)v20,  (uint64_t)archive_wrapper);
      uint64_t v7 = v9;
      uint64_t v5 = text;
      unint64_t v6 = HIDWORD(text);
    }

    new_mmap_archive_with_unint64_t text = this;
    if (v7)
    {
      uint64_t v16 = v5;
      unint64_t v17 = v6;
      uint64_t v18 = v7;
      v15[0] = CSCppMMapArchiveCache::compute_text_section_slide_for_mmap<Pointer64>( (uint64_t)this,  (uint64_t)archive_wrapper,  &v16)
             + v5;
      v15[1] = v6;
      unint64_t v15[2] = v7;
      new_mmap_archive_with_unint64_t text = _create_new_mmap_archive_with_text_data<TRangeValue<Pointer64,unsigned char *>>( (unsigned int *)this,  (unsigned int *)v15);
    }

    std::mutex::~mutex(&v24);
    unint64_t v19 = (void **)&v23;
    std::vector<std::unique_ptr<CSCppMemory>>::__destroy_vector::operator()[abi:ne180100](&v19);
    if (v22 < 0) {
      operator delete(v21[4]);
    }
    std::__tree<TRange<Pointer64>>::destroy((uint64_t)v21, v21[1]);
    if (new_mmap_archive_with_text == this)
    {
      return 0LL;
    }

    else
    {
      uint64_t v11 = *((void *)archive_wrapper + 1);
      if ((*(_BYTE *)(v11 + 88) & 1) != 0)
      {
        if (*(void *)(v11 + 80)) {
          uint64_t v12 = *(void *)(v11 + 80);
        }
        else {
          uint64_t v12 = *((void *)archive_wrapper + 1);
        }
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      archive_wrapper = (TMMapArchive *)CSCppMMapArchiveCache::make_archive_wrapper( (uint64_t)new_mmap_archive_with_text,  0LL,  1,  *((unsigned int *)new_mmap_archive_with_text + 1),  v12,  7,  0);
      CSCppMMapArchiveCache::_add_archive_wrapper_locked(new_mmap_archive_with_text, archive_wrapper, v13);
    }
  }

  return archive_wrapper;
}

void sub_18609AB30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void *CSCppMMapArchiveCache::make_archive_wrapper( uint64_t a1, const void *a2, int a3, uint64_t a4, uint64_t a5, __int16 a6, __int16 a7)
{
  uint64_t v14 = operator new(0x40uLL);
  ArchiveWrapper::ArchiveWrapper((uint64_t)v14, a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

void sub_18609ABD4(_Unwind_Exception *a1)
{
}

void *CSCppMMapArchiveCache::_add_archive_wrapper_locked( CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  if ((*((_BYTE *)a2 + 24) & 8) != 0) {
    uint64_t v5 = (TMMapArchive *)*((void *)a2 + 5);
  }
  else {
    uint64_t v5 = 0LL;
  }
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked(this, v5);
  return CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill(this, a2, v6);
}

CSCppMMapArchiveCache *CSCppMMapArchiveCache::augment_mmap_archive_to_include_text_section( CSCppMMapArchiveCache *this, TMMapArchive *a2, CSCppSymbolOwner *a3)
{
  unint64_t v6 = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(this, a2, v5);
  if (v6) {
    this = (CSCppMMapArchiveCache *)*((void *)v6 + 2);
  }
  pthread_mutex_unlock(&_cache_lock);
  return this;
}

void sub_18609AC80(_Unwind_Exception *a1)
{
}

void *CSCppMMapArchiveCache::_lookup_archive_wrapper_in_local_cache_locked( __n128 *this, const UUID *a2, int a3, void *a4, unint64_t *a5, unsigned __int16 *a6, os_unfair_lock_s **a7, CSCppSymbolOwner *a8)
{
  if (!UUID::is_null((UUID *)this))
  {
    __int128 v15 = (_OWORD *)_mmap_archive_cache;
    if (!_mmap_archive_cache)
    {
      __int128 v15 = operator new(0x28uLL);
      *__int128 v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + _Block_object_dispose((const void *)(v11 - 64), 8) = 1065353216;
      _mmap_archive_cache = (uint64_t)v15;
    }

    unint64_t v17 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>( v15,  this);
    unint64_t v19 = v18;
    if (a7) {
      unsigned int v20 = (CSCppSymbolicator::flags(a7[1]) >> 2) & 1;
    }
    else {
      unsigned int v20 = 0;
    }
    while (1)
    {
      if (v17 == v19) {
        return 0LL;
      }
      uint64_t v21 = v17[4];
      int v22 = *(_DWORD *)(v21 + 24);
      if ((v22 & 8) != 0)
      {
        uint64_t v23 = *(const UUID **)(v21 + 40);
        if (v22 < 0) {
          goto LABEL_12;
        }
      }

      else
      {
        uint64_t v23 = 0LL;
        if (v22 < 0) {
          goto LABEL_12;
        }
      }

      if (v23 == a2)
      {
        uint64_t v25 = *(CSCppMMapArchiveCache **)(v21 + 16);
        int v26 = *((_DWORD *)v25 + 7);
        if ((v26 & 0x1000) != 0)
        {
          BOOL v27 = *((_DWORD *)v25 + 20) == 0;
          if (!a7) {
            goto LABEL_21;
          }
        }

        else
        {
          BOOL v27 = 1;
          if (!a7)
          {
LABEL_21:
            BOOL v28 = 0;
            goto LABEL_25;
          }
        }

        if ((*((_BYTE *)a7 + 110) & 0x40) == 0) {
          goto LABEL_21;
        }
        uint64_t v29 = a7[16];
        if (!v29) {
          uint64_t v29 = a7[15];
        }
        BOOL v28 = v29 != 0LL;
LABEL_25:
        BOOL v30 = (v26 & 0x10) == 0 && v28;
        if ((v27 & v20 & 1) == 0 && !v30)
        {
LABEL_30:
          CSCppReferenceCount::retain(v21);
          uint64_t result = (void *)v21;
          goto LABEL_31;
        }

        unsigned int v35 = v20;
        uint64_t result = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked( this,  a2,  a3,  a4,  a5,  a6,  (__int16 *)a7,  v16);
        if (!result)
        {
          if (!v35) {
            goto LABEL_30;
          }
          uint64_t result = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked( v25,  (TMMapArchive *)a7,  v31);
          goto LABEL_50;
        }

        uint64_t v32 = *((void *)result + 2);
        if (!v32) {
          goto LABEL_30;
        }
        if (v35)
        {
          if (*(_DWORD *)(v32 + 80)) {
            BOOL v33 = 0;
          }
          else {
            BOOL v33 = v30;
          }
          if (*(_DWORD *)(v32 + 80)) {
            std::string v34 = result;
          }
          else {
            std::string v34 = 0LL;
          }
          if (!v33)
          {
            uint64_t result = v34;
LABEL_50:
            if (!result) {
              goto LABEL_30;
            }
LABEL_31:
            if (a4) {
              *a4 = *(unsigned int *)(*((void *)result + 2) + 4LL);
            }
            if (a5) {
              *(_WORD *)a5 = *((_WORD *)result + 24);
            }
            if (a6) {
              *a6 = *((_WORD *)result + 25);
            }
            return result;
          }
        }

        else if (!v30)
        {
          goto LABEL_30;
        }

        if ((*(_BYTE *)(v32 + 28) & 0x10) == 0) {
          goto LABEL_30;
        }
        goto LABEL_31;
      }

_DWORD *CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked( __n128 *this, const UUID *a2, int a3, void *a4, unint64_t *a5, unsigned __int16 *a6, __int16 *a7, CSCppSymbolOwner *a8)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  if (a2)
  {
    if (*((void *)a7 + 18)) {
      return 0LL;
    }
    goto LABEL_6;
  }

  if (a7)
  {
LABEL_6:
    BOOL v13 = (CSCppSymbolicator::flags(*((os_unfair_lock_s **)a7 + 1)) & 4) == 0;
    goto LABEL_8;
  }

  BOOL v13 = 1;
LABEL_8:
  uid_t v14 = geteuid();
  MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry( (MMapArchiveFileSystem::ArchiveEntry *)v29,  this,  0LL,  v14,  0,  7,  0xFFFF);
  size_t v27 = 0LL;
  __int128 v15 = (_xpc_connection_s **)mmap_storage_daemon();
  unint64_t v19 = v28;
  if ((*((_BYTE *)v28 + 29) & 0x10) != 0
    || (*((_DWORD *)v28 + 20) ? (char v20 = 1) : (char v20 = v13),
        (v20 & 1) != 0
     || (unint64_t v17 = CSCppMMapArchiveCache::_augment_mmap_archive_to_include_text_section_locked(v28, (TMMapArchive *)a7, v16),
         unint64_t v19 = v28,
         !v17)))
  {
    unint64_t v17 = operator new(0x40uLL);
    size_t v21 = v27;
    unsigned __int16 v22 = v26;
    unsigned __int16 v23 = v25;
    v17[2] = 1;
    *((void *)v17 + 2) = v19;
    v17[6] = 2;
    *((_WORD *)v17 + 24) = v22;
    *((_WORD *)v17 + 25) = v23;
    *((void *)v17 + 4) = v21;
    *((void *)v17 + 5) = 0LL;
    *(void *)unint64_t v17 = off_189DFB118;
    *((void *)v17 + 7) = 0LL;
    CSCppMMapArchiveCache::_add_archive_wrapper_locked(v19, (TMMapArchive *)v17, v24);
  }

  else
  {
    munmap(v28, v27);
  }

  if (a4) {
    *a4 = *(unsigned int *)(*((void *)v17 + 2) + 4LL);
  }
  if (a5) {
    *(_WORD *)a5 = v26;
  }
  if (a6) {
    *a6 = v25;
  }
  return v17;
}

CSCppDaemonConnection *mmap_storage_daemon(void)
{
  uint64_t v0 = (CSCppDaemonConnection *)_mmap_storage_daemon;
  if (!_mmap_storage_daemon)
  {
    uint64_t v0 = (CSCppDaemonConnection *)operator new(8uLL);
    CSCppDaemonConnection::CSCppDaemonConnection(v0);
    _mmap_storage_daemon = (uint64_t)v0;
  }

  return v0;
}

void sub_18609B098(_Unwind_Exception *a1)
{
}

uint64_t CSCppMMapArchiveCache::archive_for_uuid( __n128 *this, const UUID *a2, int a3, void *a4, unint64_t *a5, unsigned __int16 *a6, os_unfair_lock_s **a7, CSCppSymbolOwner *a8)
{
  uint64_t v16 = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_local_cache_locked(this, a2, a3, a4, a5, a6, a7, v15);
  if (v16
    || (uint64_t v16 = CSCppMMapArchiveCache::_lookup_archive_wrapper_in_daemon_cache_locked( this,  a2,  a3,  a4,  a5,  a6,  (__int16 *)a7,  v17)) != 0LL)
  {
    uint64_t v18 = v16[2];
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  pthread_mutex_unlock(&_cache_lock);
  return v18;
}

void sub_18609B16C(_Unwind_Exception *a1)
{
}

uint64_t *CSCppMMapArchiveCache::_kill_existing_matching_entries_locked( CSCppMMapArchiveCache *this, TMMapArchive *a2)
{
  unint64_t v4 = (_OWORD *)_mmap_archive_cache;
  if (!_mmap_archive_cache)
  {
    unint64_t v4 = operator new(0x28uLL);
    *unint64_t v4 = 0u;
    v4[1] = 0u;
    *((_DWORD *)v4 + _Block_object_dispose((const void *)(v11 - 64), 8) = 1065353216;
    _mmap_archive_cache = (uint64_t)v4;
  }

  for (uint64_t result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>( v4,  (CSCppMMapArchiveCache *)((char *)this + 52)); result != v6; uint64_t result = (uint64_t *)*result)
  {
    uint64_t v7 = result[4];
    int v8 = *(_DWORD *)(v7 + 24);
    if ((v8 & 8) != 0) {
      uint64_t v9 = *(TMMapArchive **)(v7 + 40);
    }
    else {
      uint64_t v9 = 0LL;
    }
    if (v9 == a2) {
      *(_DWORD *)(v7 + 24) = v8 | 0x80000000;
    }
  }

  return result;
}

void *CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill( CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  unint64_t v6 = a2;
  unint64_t v4 = (_OWORD *)_mmap_archive_cache;
  if (!_mmap_archive_cache)
  {
    unint64_t v4 = operator new(0x28uLL);
    *unint64_t v4 = 0u;
    v4[1] = 0u;
    *((_DWORD *)v4 + _Block_object_dispose((const void *)(v11 - 64), 8) = 1065353216;
    _mmap_archive_cache = (uint64_t)v4;
  }

  return std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<UUID const&,ArchiveWrapper *&>( v4,  (CSCppMMapArchiveCache *)((char *)this + 52),  &v6);
}

uint64_t CSCppMMapArchiveCache::add_archive_wrapper( CSCppMMapArchiveCache *this, TMMapArchive *a2, ArchiveWrapper *a3)
{
  return pthread_mutex_unlock(&_cache_lock);
}

void sub_18609B2BC(_Unwind_Exception *a1)
{
}

TMMapArchive *CSCppMMapArchiveCache::_add_archive_to_daemon_locked( TMMapArchive *a1, unint64_t *a2, _DWORD *a3, char *__source)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (CSCppMMapArchiveCache::_should_store_to_daemon)
  {
    *(void *)__dst = 0LL;
    strlcpy(__dst, __source, 8uLL);
    MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry( (MMapArchiveFileSystem::ArchiveEntry *)v12,  (__n128 *)((char *)a1 + 52),  *(uint64_t *)__dst,  -1,  0,  7,  0);
    uint64_t v9 = a1;
    uint64_t v7 = (_xpc_connection_s **)mmap_storage_daemon();
    if (CSCppDaemonConnection::write_mmap_archive(v7, v12, &v10, &v9, a2))
    {
      if (v10 == 4) {
        CSCppMMapArchiveCache::_should_store_to_daemon = 0;
      }
    }

    else if (!v10)
    {
      mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)a1, *((unsigned int *)a1 + 1));
      a1 = v9;
      *a3 = 2;
    }
  }

  return a1;
}

unsigned int *CSCppMMapArchiveCache::add_archive( unsigned int *a1, int a2, TMMapArchive *a3, int a4, char *a5)
{
  int v17 = a2;
  pthread_mutex_lock(&_cache_lock);
  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked((CSCppMMapArchiveCache *)a1, a3);
  unint64_t v16 = a1[1];
  if (a2 == 1 && a4) {
    a1 = (unsigned int *)CSCppMMapArchiveCache::_add_archive_to_daemon_locked((TMMapArchive *)a1, &v16, &v17, a5);
  }
  int v10 = operator new(0x40uLL);
  int v12 = v17;
  unint64_t v13 = v16;
  _OWORD v10[2] = 1;
  *((void *)v10 + 2) = a1;
  v10[6] = v12;
  v10[12] = 7;
  if (a3)
  {
    v12 |= 8u;
    v10[6] = v12;
  }

  if ((v12 & 8) != 0) {
    uid_t v14 = a3;
  }
  else {
    uid_t v14 = 0LL;
  }
  *((void *)v10 + 4) = v13;
  *((void *)v10 + 5) = v14;
  *(void *)int v10 = off_189DFB118;
  *((void *)v10 + 7) = 0LL;
  CSCppMMapArchiveCache::_add_archive_wrapper_locked_no_kill((CSCppMMapArchiveCache *)a1, (TMMapArchive *)v10, v11);
  pthread_mutex_unlock(&_cache_lock);
  return a1;
}

void sub_18609B4D0(_Unwind_Exception *a1)
{
}

uint64_t CSCppMMapArchiveCache::release_archive(uint64_t this, TMMapArchive *a2)
{
  if (this)
  {
    uint64_t v2 = this;
    __int128 v3 = (void *)(this + 52);
    this = UUID::is_null((UUID *)(this + 52));
    if ((this & 1) == 0)
    {
      pthread_mutex_lock(&_cache_lock);
      unint64_t v4 = (void *)_mmap_archive_cache;
      if (!_mmap_archive_cache)
      {
        unint64_t v4 = operator new(0x28uLL);
        *(_OWORD *)unint64_t v4 = 0u;
        *((_OWORD *)v4 + 1) = 0u;
        *((_DWORD *)v4 + _Block_object_dispose((const void *)(v11 - 64), 8) = 1065353216;
        _mmap_archive_cache = (uint64_t)v4;
      }

      for (uint64_t i = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__equal_range_multi<UUID>( v4,  v3); i != v5; uint64_t i = (uint64_t *)*i)
      {
        uint64_t v7 = i[4];
        if (*(void *)(v7 + 16) == v2)
        {
          unsigned int v8 = atomic_load((unsigned int *)(v7 + 8));
          if (v8 == 1 || (*(_BYTE *)(v7 + 24) & 0x10) != 0 && (unsigned int v9 = atomic_load((unsigned int *)(v7 + 8)), v9 == 2)) {
            std::__hash_table<std::__hash_value_type<unsigned int,mapped_memory_t *>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,mapped_memory_t *>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,mapped_memory_t *>>>::erase( v4,  i);
          }
          else {
            int v11 = 1;
          }
          CSCppReferenceCount::release((unsigned int *)v7, v11);
          return pthread_mutex_unlock(&_cache_lock);
        }
      }

      return pthread_mutex_unlock(&_cache_lock);
    }
  }

  return this;
}

void sub_18609B608(_Unwind_Exception *a1)
{
}

uint64_t CSCppMMapArchiveCache::add_signature_archive<__CFData const*>( uint64_t a1, const void *a2, TMMapArchive *a3, int a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&_cache_lock);
  unsigned int v8 = (_OWORD *)_mmap_archive_cache;
  if (!_mmap_archive_cache)
  {
    unsigned int v8 = operator new(0x28uLL);
    *unsigned int v8 = 0u;
    v8[1] = 0u;
    *((_DWORD *)v8 + _Block_object_dispose((const void *)(v11 - 64), 8) = 1065353216;
    _mmap_archive_cache = (uint64_t)v8;
  }

  CSCppMMapArchiveCache::_kill_existing_matching_entries_locked((CSCppMMapArchiveCache *)a1, a3);
  uint64_t v16 = 0LL;
  int v9 = 4;
  int v15 = 4;
  if (a4)
  {
    mach_vm_size_t v10 = *(unsigned int *)(a1 + 4);
    address[0] = 0LL;
    address[1] = v10;
    mach_vm_allocate(*MEMORY[0x1895FBBE0], address, v10, 3);
    int v11 = (TMMapArchive *)address[0];
    if (address[0])
    {
      memcpy((void *)address[0], (const void *)a1, *(unsigned int *)(a1 + 4));
      int v11 = (TMMapArchive *)address[0];
    }

    int v12 = CSCppMMapArchiveCache::_add_archive_to_daemon_locked(v11, (unint64_t *)&v16, &v15, "system");
    int v9 = v15;
    if (v15 == 2)
    {
      a2 = 0LL;
      address[0] = 0LL;
      a1 = (uint64_t)v12;
    }

    MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr(address);
  }

  unint64_t v13 = operator new(0x40uLL);
  ArchiveWrapper::ArchiveWrapper((uint64_t)v13, a1, a2, v9, v16, (uint64_t)a3, 7, 0);
  *(_OWORD *)address = *(_OWORD *)(a1 + 52);
  uint64_t v18 = v13;
  std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<std::pair<UUID const,ArchiveWrapper *>>( v8,  (uint64_t)address);
  pthread_mutex_unlock(&_cache_lock);
  return a1;
}

void sub_18609B7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t CSCppMMapArchiveCache::compute_text_section_slide_for_mmap<Pointer64>( uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v4 = *(void **)(a2 + 32);
  uint64_t v5 = *(void **)(a2 + 40);
  if (v4 != v5)
  {
    uint64_t v6 = *a3;
    while (1)
    {
      uint64_t v7 = (const char *)(v4[3] ? v4[3] : v4[2]);
      v4 += 4;
      if (v4 == v5) {
        return 0LL;
      }
    }
  }

  if (v4 == v5) {
    return 0LL;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v8) {
    return 0LL;
  }
  int v9 = (const char *)v4[3];
  mach_vm_size_t v10 = (const char *)(a1 + 112);
  uint64_t v11 = 32 * v8;
  while (1)
  {
    int v12 = v9;
    if (!v9) {
      int v12 = (const char *)v4[2];
    }
    if (!strncmp(v10, v12, 0x10uLL)) {
      break;
    }
    v10 += 32;
    v11 -= 32LL;
    if (!v11) {
      return 0LL;
    }
  }

  return *((void *)v10 - 2) - *v4;
}

TMMapArchive *_create_new_mmap_archive_with_text_data<TRangeValue<Pointer64,unsigned char *>>( unsigned int *a1, unsigned int *a2)
{
  __int128 v3 = (TMMapArchive *)a1;
  unint64_t v4 = (TMMapArchive *)(*((void *)a2 + 1) + a1[1]);
  v15[0] = 0LL;
  v15[1] = v4;
  mach_vm_allocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t *)v15, (mach_vm_size_t)v4, 3);
  uint64_t v5 = v15[0];
  if (v15[0])
  {
    uint64_t v6 = *a2;
    uint64_t v8 = *((void *)a2 + 1);
    uint64_t v7 = (const void *)*((void *)a2 + 2);
    uint64_t v9 = v6 | (v8 << 32);
    __int128 v10 = *((_OWORD *)v3 + 1);
    *(_OWORD *)v15[0] = *(_OWORD *)v3;
    __int128 v11 = *((_OWORD *)v3 + 2);
    __int128 v12 = *((_OWORD *)v3 + 3);
    __int128 v13 = *((_OWORD *)v3 + 5);
    *((_OWORD *)v5 + 4) = *((_OWORD *)v3 + 4);
    *((_OWORD *)v5 + 5) = v13;
    *((_OWORD *)v5 + 2) = v11;
    *((_OWORD *)v5 + pthread_mutex_lock((pthread_mutex_t *)this + 3) = v12;
    *((_OWORD *)v5 + 1) = v10;
    *((_DWORD *)v5 + 1) = (_DWORD)v4;
    *((_DWORD *)v5 + 12) = TMMapArchive::calculate_checksum((int32x4_t *)v5);
    *(void *)((char *)v5 + 76) = v9;
    TMMapArchive::copy_payload_from_archive(v5, v3);
    *((_DWORD *)v5 + 7) |= 0x1000u;
    *((_DWORD *)v5 + 12) = TMMapArchive::calculate_checksum((int32x4_t *)v5);
    memcpy( (char *)v5 + 32 * *((_DWORD *)v5 + 2)
    + 24 * *((_DWORD *)v5 + 3)
    + (24 * *((_DWORD *)v5 + 4))
    + (unint64_t)(4 * *((_DWORD *)v5 + 4))
    + (36 * *((_DWORD *)v5 + 5))
    + (20 * *((_DWORD *)v5 + 6))
    + *((unsigned int *)v5 + 22)
    + 96,
      v7,
      v8);
    __int128 v3 = v15[0];
    v15[0] = 0LL;
  }

  MachVMAllocatePtr<TMMapArchive>::~MachVMAllocatePtr((mach_vm_address_t *)v15);
  return v3;
}

void sub_18609BA2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, mach_vm_address_t a9)
{
}

void CSCppTextSectionDataDescriptor::~CSCppTextSectionDataDescriptor(CSCppTextSectionDataDescriptor *this)
{
  uint64_t v2 = (void **)((char *)this + 88);
  std::vector<std::unique_ptr<CSCppMemory>>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__tree<TRange<Pointer64>>::destroy((uint64_t)this + 24, *((void **)this + 4));
}

char *TMMapArchive::copy_payload_from_archive(TMMapArchive *this, const TMMapArchive *a2)
{
  unint64_t v4 = (char *)this + 96;
  uint64_t v5 = (char *)a2 + 96;
  int v6 = *((_DWORD *)this + 2);
  uint64_t v7 = (32 * v6);
  unsigned int v8 = 32 * *((_DWORD *)a2 + 2);
  if (v8 >= 32 * v6) {
    size_t v9 = v7;
  }
  else {
    size_t v9 = v8;
  }
  memcpy((char *)this + 96, (char *)a2 + 96, v9);
  unsigned int v10 = 24 * *((_DWORD *)a2 + 3);
  if (v10 >= 24 * *((_DWORD *)this + 3)) {
    size_t v11 = (24 * *((_DWORD *)this + 3));
  }
  else {
    size_t v11 = v10;
  }
  memcpy(&v4[v7], &v5[32 * *((_DWORD *)a2 + 2)], v11);
  unsigned int v12 = 24 * *((_DWORD *)a2 + 4);
  if (v12 >= 24 * *((_DWORD *)this + 4)) {
    size_t v13 = (24 * *((_DWORD *)this + 4));
  }
  else {
    size_t v13 = v12;
  }
  memcpy( &v4[32 * *((_DWORD *)this + 2) + 24 * *((_DWORD *)this + 3)],  &v5[32 * *((_DWORD *)a2 + 2) + 24 * *((_DWORD *)a2 + 3)],  v13);
  unsigned int v14 = 36 * *((_DWORD *)a2 + 5);
  if (v14 >= 36 * *((_DWORD *)this + 5)) {
    size_t v15 = (36 * *((_DWORD *)this + 5));
  }
  else {
    size_t v15 = v14;
  }
  memcpy( &v4[32 * *((_DWORD *)this + 2) + 24 * *((_DWORD *)this + 3) + 24 * *((_DWORD *)this + 4)],  &v5[32 * *((_DWORD *)a2 + 2) + 24 * *((_DWORD *)a2 + 3) + 24 * *((_DWORD *)a2 + 4)],  v15);
  uint64_t v16 = &v4[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)this + 8), (int32x4_t)xmmword_1860A02E0))];
  int v17 = &v5[vaddlvq_u32((uint32x4_t)vmulq_s32(*(int32x4_t *)((char *)a2 + 8), (int32x4_t)xmmword_1860A02E0))];
  unsigned int v18 = 20 * *((_DWORD *)a2 + 6);
  if (v18 >= 20 * *((_DWORD *)this + 6)) {
    size_t v19 = (20 * *((_DWORD *)this + 6));
  }
  else {
    size_t v19 = v18;
  }
  memcpy(v16, v17, v19);
  unsigned int v22 = *((_DWORD *)this + 22);
  unsigned int v23 = *((_DWORD *)a2 + 22);
  if (v23 >= v22) {
    size_t v24 = v22;
  }
  else {
    size_t v24 = v23;
  }
  memcpy(v20, v21, v24);
  int32x4_t v25 = *(int32x4_t *)((char *)this + 12);
  unsigned __int16 v26 = &v4[*((unsigned int *)this + 22)
  size_t v27 = &v5[*((unsigned int *)a2 + 22)
  unsigned int v28 = 4 * HIDWORD(*(void *)((char *)a2 + 12));
  if (v28 >= 4 * v25.i32[1]) {
    size_t v29 = (4 * v25.i32[1]);
  }
  else {
    size_t v29 = v28;
  }
  memcpy(v26, v27, v29);
  unsigned int v30 = *((_DWORD *)this + 20);
  unsigned int v31 = *((_DWORD *)a2 + 20);
  if (v31 >= v30) {
    size_t v32 = v30;
  }
  else {
    size_t v32 = v31;
  }
  memcpy( &v4[32 * *((_DWORD *)this + 2)
      + 24 * *((_DWORD *)this + 3)
      + (24 * *((_DWORD *)this + 4))
      + (unint64_t)(4 * *((_DWORD *)this + 4))
      + (36 * *((_DWORD *)this + 5))
      + (20 * *((_DWORD *)this + 6))
      + *((unsigned int *)this + 22)],
    &v5[32 * *((_DWORD *)a2 + 2)
      + 24 * *((_DWORD *)a2 + 3)
      + (24 * *((_DWORD *)a2 + 4))
      + (unint64_t)(4 * *((_DWORD *)a2 + 4))
      + (36 * *((_DWORD *)a2 + 5))
      + (20 * *((_DWORD *)a2 + 6))
      + *((unsigned int *)a2 + 22)],
    v32);
  unsigned int v33 = *((_DWORD *)this + 21);
  unsigned int v34 = *((_DWORD *)a2 + 21);
  if (v34 >= v33) {
    size_t v35 = v33;
  }
  else {
    size_t v35 = v34;
  }
  memcpy( &v4[32 * *((_DWORD *)this + 2)
      + 24 * *((_DWORD *)this + 3)
      + (24 * *((_DWORD *)this + 4))
      + (unint64_t)(4 * *((_DWORD *)this + 4))
      + (36 * *((_DWORD *)this + 5))
      + (20 * *((_DWORD *)this + 6))
      + *((unsigned int *)this + 22)
      + *((unsigned int *)this + 20)],
    &v5[32 * *((_DWORD *)a2 + 2)
      + 24 * *((_DWORD *)a2 + 3)
      + (24 * *((_DWORD *)a2 + 4))
      + (unint64_t)(4 * *((_DWORD *)a2 + 4))
      + (36 * *((_DWORD *)a2 + 5))
      + (20 * *((_DWORD *)a2 + 6))
      + *((unsigned int *)a2 + 22)
      + *((unsigned int *)a2 + 20)],
    v35);
  uint64_t result = TMMapArchive::optional_data(a2);
  if (result)
  {
    __int128 __src = *(_OWORD *)result;
    uint64_t v42 = *((void *)result + 2);
    uint64_t result = (char *)TMMapArchive::strtab_end(this);
    unint64_t v37 = (char *)this + *((unsigned int *)this + 1);
    BOOL v38 = v37 > result;
    size_t v39 = v37 - result;
    if (v38)
    {
      if (DWORD2(__src) <= 0xC) {
        size_t v40 = 12LL;
      }
      else {
        size_t v40 = DWORD2(__src);
      }
      if (v39 >= v40) {
        return (char *)memcpy(result, &__src, v40);
      }
    }
  }

  return result;
}

uint64_t ArchiveWrapper::ArchiveWrapper( uint64_t a1, uint64_t a2, CFTypeRef cf, int a4, uint64_t a5, uint64_t a6, __int16 a7, __int16 a8)
{
  *(_DWORD *)(a1 + _Block_object_dispose((const void *)(v11 - 64), 8) = 1;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 4_Block_object_dispose((const void *)(v11 - 64), 8) = a7;
  *(_WORD *)(a1 + 50) = a8;
  if (a6)
  {
    a4 |= 8u;
    *(_DWORD *)(a1 + 24) = a4;
  }

  if ((a4 & 8) != 0) {
    uint64_t v9 = a6;
  }
  else {
    uint64_t v9 = 0LL;
  }
  *(void *)(a1 + 32) = a5;
  *(void *)(a1 + 40) = v9;
  *(void *)a1 = off_189DFB118;
  *(void *)(a1 + 56) = cf;
  if (cf && (a4 & 4) != 0) {
    CFRetain(cf);
  }
  return a1;
}

void ArchiveWrapper::~ArchiveWrapper(ArchiveWrapper *this)
{
}

{
  int v1;
  *(void *)this = off_189DFB118;
  uint64_t v1 = *((_DWORD *)this + 6);
  if ((v1 & 1) != 0)
  {
    mach_vm_deallocate(*MEMORY[0x1895FBBE0], *((void *)this + 2), *(unsigned int *)(*((void *)this + 2) + 4LL));
  }

  else if ((v1 & 0x12) != 0)
  {
    munmap(*((void **)this + 2), *((void *)this + 4));
  }

  else
  {
    CFRelease(*((CFTypeRef *)this + 7));
  }

void *std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<UUID const&,ArchiveWrapper *&>( void *a1, _OWORD *a2, void *a3)
{
  int v6 = operator new(0x28uLL);
  *((_OWORD *)v6 + 1) = *a2;
  void v6[4] = *a3;
  unint64_t v7 = v6[3] ^ v6[2];
  void *v6 = 0LL;
  v6[1] = v7;
  mach_error_t inserted = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_prepare( (uint64_t)a1,  v7,  v6 + 2);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_perform( a1,  v6,  inserted);
  return v6;
}

void sub_18609C064(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<UUID,ArchiveWrapper *>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,ArchiveWrapper *>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,ArchiveWrapper *>>>::__emplace_multi<std::pair<UUID const,ArchiveWrapper *>>( void *a1, uint64_t a2)
{
  unint64_t v4 = operator new(0x28uLL);
  *((_OWORD *)v4 + 1) = *(_OWORD *)a2;
  void v4[4] = *(void *)(a2 + 16);
  unint64_t v5 = v4[3] ^ v4[2];
  *unint64_t v4 = 0LL;
  v4[1] = v5;
  mach_error_t inserted = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_prepare( (uint64_t)a1,  v5,  v4 + 2);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDHashFunctor,UUIDEqualsFunctor,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>,UUIDEqualsFunctor,UUIDHashFunctor,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<CSCppSymbolOwner>>>>::__node_insert_multi_perform( a1,  v4,  inserted);
  return v4;
}

void sub_18609C0E8(_Unwind_Exception *a1)
{
}

char *utility_basename(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 == 1)
  {
    unint64_t v5 = (char *)malloc(2uLL);
    int v6 = v5;
    unint64_t v7 = a1;
  }

  else
  {
    size_t v3 = v2;
    if (!v2) {
      return strdup(a1);
    }
    uint64_t v8 = 0LL;
    do
    {
      size_t v9 = v2 + v8;
      int v10 = a1[v2 - 1 + v8--];
    }

    while (v9 != 1 && v10 != 47);
    if (v2 + v8)
    {
      if (v8 == -1)
      {
        int v6 = (char *)malloc(v2);
        strlcpy(v6, a1, v3);
        return v6;
      }

      size_t v11 = &a1[v2];
      unint64_t v5 = (char *)malloc(-v8);
      int v6 = v5;
      unint64_t v7 = &v11[v8 + 1];
    }

    else
    {
      if (v10 == 47) {
        unsigned int v12 = a1 + 1;
      }
      else {
        unsigned int v12 = a1;
      }
      unint64_t v5 = (char *)malloc(&a1[v2] - v12 + 1);
      int v6 = v5;
      unint64_t v7 = v12;
    }
  }

  strcpy(v5, v7);
  return v6;
}

BOOL do_candidate_sources_satisfy_existing(int a1, int a2)
{
  return (a1 & ~a2 & CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()) == 0;
}

BOOL deny_nfs_mount_lookup(const char *__s1)
{
  uint64_t v2 = 0LL;
  do
  {
    int v3 = strncmp(__s1, (&off_189DFB158)[v2], (size_t)(&off_189DFB158)[v2 + 1]);
    if (!v3) {
      break;
    }
    BOOL v4 = v2 == 6;
    v2 += 2LL;
  }

  while (!v4);
  return v3 == 0;
}

void CSCppDaemonConnection::CSCppDaemonConnection(CSCppDaemonConnection *this)
{
  *(void *)this = 0LL;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  mach_service = xpc_connection_create_mach_service("com.apple.coresymbolicationd", global_queue, 2uLL);
  *(void *)this = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_5);
    xpc_connection_resume(*(xpc_connection_t *)this);
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to acquire mach service port, symbol cache unavailable\n",  v4,  2u);
    }

    fwrite( "Unable to acquire mach service port, symbol cache unavailable\n",  0x3EuLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
    *(void *)this = 0LL;
  }

size_t ___ZN21CSCppDaemonConnectionC2Ev_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  size_t result = MEMORY[0x186E3186C](a2);
  if (result == MEMORY[0x1895F9268])
  {
    if (a2 == MEMORY[0x1895F91A0])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::__split_buffer<std::string> buf = 136315138;
        unint64_t v5 = "com.apple.coresymbolicationd";
        _os_log_impl(&dword_185FC0000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Invalid connection: %s\n", buf, 0xCu);
      }

      return fprintf((FILE *)*MEMORY[0x1895F89D0], "Invalid connection: %s\n", "com.apple.coresymbolicationd");
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Client side event: Unhandled xpc type\n",  buf,  2u);
    }

    return fwrite("Client side event: Unhandled xpc type\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }

  return result;
}

void CSCppDaemonConnection::send_sync_message( _xpc_connection_s **a1@<X0>, uint64_t a2@<X1>, XPCObject *a3@<X8>)
{
  BOOL v4 = *a1;
  if (*a1)
  {
    unint64_t v5 = (void *)XPCObject::operator*(a2);
    BOOL v4 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v4, v5);
    if (MEMORY[0x186E3186C]() == MEMORY[0x1895F9268])
    {
      xpc_release(v4);
      BOOL v4 = 0LL;
    }
  }

  XPCObject::XPCObject(a3, v4, 0);
}

uint64_t CSCppDaemonConnection::read_mmap_archive( _xpc_connection_s **this, int8x16_t *a2, TMMapArchive **a3, unint64_t *a4, unsigned __int16 *a5, unsigned __int16 *a6)
{
  unsigned int v12 = (void *)XPCObject::operator*((uint64_t)&region);
  XPCDictionary::set_object(&v32, "entry", v12);
  XPCObject::~XPCObject((XPCObject *)&region);
  *a3 = 0LL;
  XPCObject::XPCObject((XPCObject *)v30, &v32);
  CSCppDaemonConnection::send_sync_message(this, (uint64_t)v30, (XPCObject *)&v31);
  XPCObject::~XPCObject((XPCObject *)v30);
  if (!XPCObject::operator BOOL(&v31)
    || (uint64_t v13 = XPCObject::operator*((uint64_t)&v31), MEMORY[0x186E3186C](v13) != MEMORY[0x1895F9250]))
  {
    XPCObject::~XPCObject((XPCObject *)&v31);
    uint64_t v14 = 1LL;
    goto LABEL_4;
  }

  XPCObject::XPCObject((XPCObject *)&v29, &v31);
  uint64_t v16 = (void *)XPCObject::operator*((uint64_t)&v29);
  xpc_object_t value = xpc_dictionary_get_value(v16, "shmem");
  if (value)
  {
    region = 0LL;
    size_t v18 = xpc_shmem_map(value, &region);
    size_t v19 = v18;
    if (v18)
    {
      if (v18 >= 0x60)
      {
        char v20 = (TMMapArchive *)region;
        size_t v21 = *((unsigned int *)region + 1);
        if ((_DWORD)v21)
        {
          if (v18 >= v21)
          {
            int v22 = *((_DWORD *)region + 12);
            if (v22 == TMMapArchive::calculate_checksum((int32x4_t *)region)
              && TMMapArchive::are_offsets_in_bounds(v20))
            {
              *a4 = v19;
              unsigned int v23 = (void *)XPCObject::operator*((uint64_t)&v29);
              unsigned __int16 uint64 = xpc_dictionary_get_uint64(v23, "major_version");
              int32x4_t v25 = (void *)XPCObject::operator*((uint64_t)&v29);
              unsigned __int16 v26 = xpc_dictionary_get_uint64(v25, "minor_version");
              else {
                unsigned __int16 v27 = 0;
              }
              if (a5)
              {
                unsigned __int16 v28 = uint64;
                *a5 = v28;
              }

              if (a6) {
                *a6 = v27;
              }
              goto LABEL_23;
            }
          }
        }
      }

      munmap(region, v19);
    }
  }

  char v20 = 0LL;
LABEL_23:
  *a3 = v20;
  XPCObject::~XPCObject(&v29);
  if (v20) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = 3LL;
  }
  XPCObject::~XPCObject((XPCObject *)&v31);
LABEL_4:
  XPCObject::~XPCObject(&v32);
  return v14;
}

void sub_18609C70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5 = va_arg(va1, void);
  XPCObject::~XPCObject((XPCObject *)va);
  XPCObject::~XPCObject((void **)va1);
  _Unwind_Resume(a1);
}

uint64_t CSCppDaemonConnection::write_mmap_archive( _xpc_connection_s **this, int8x16_t *a2, int *a3, TMMapArchive **a4, unint64_t *a5)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  int v10 = (unsigned int *)*a4;
  XPCDictionary::XPCDictionary((XPCDictionary *)&v28);
  XPCDictionary::set_uint64(&v28, "cmd", 5uLL);
  MMapArchiveFileSystem::ArchiveEntry::encode(a2, v29);
  size_t v11 = (void *)XPCObject::operator*((uint64_t)v29);
  XPCDictionary::set_object(&v28, "entry", v11);
  XPCObject::~XPCObject((XPCObject *)v29);
  xpc_object_t v12 = xpc_shmem_create(v10, v10[1]);
  XPCDictionary::set_object(&v28, "archive_shmem", v12);
  xpc_release(v12);
  XPCObject::XPCObject((XPCObject *)v26, &v28);
  CSCppDaemonConnection::send_sync_message(this, (uint64_t)v26, (XPCObject *)&v27);
  XPCObject::~XPCObject((XPCObject *)v26);
  if (XPCObject::operator BOOL(&v27))
  {
    uint64_t v13 = XPCObject::operator*((uint64_t)&v27);
    if (MEMORY[0x186E3186C](v13) == MEMORY[0x1895F9250])
    {
      XPCObject::XPCObject((XPCObject *)&v25, &v27);
      int uint64 = XPCDictionary::get_uint64(&v25, "write_errno");
      *a3 = uint64;
      if (!uint64)
      {
        XPCDictionary::get_object(&v25, "results", &v24);
        if (XPCObject::operator BOOL(&v24) && XPCObject::xpc_type((XPCObject *)&v24) == MEMORY[0x1895F9220])
        {
          int v17 = (void *)XPCObject::operator*((uint64_t)&v27);
          xpc_object_t value = xpc_dictionary_get_value(v17, "shmem");
          if (value)
          {
            region = 0LL;
            unint64_t v19 = xpc_shmem_map(value, &region);
            if (v19)
            {
              char v20 = (TMMapArchive *)region;
              if (TMMapArchive::validate((TMMapArchive *)region))
              {
                XPCObject::XPCObject((XPCObject *)v22, &v24);
                MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(v29, v22);
                int8x16_t v21 = (int8x16_t)v29[1];
                *a2 = (int8x16_t)v29[0];
                a2[1] = v21;
                a2[2] = (int8x16_t)v29[2];
                a2[3].i8[0] = v30;
                XPCObject::~XPCObject((XPCObject *)v22);
                *a4 = v20;
                *a5 = v19;
                XPCObject::~XPCObject((XPCObject *)&v24);
                uint64_t v14 = 0LL;
                goto LABEL_10;
              }

              munmap(region, v19);
            }
          }
        }

        XPCObject::~XPCObject((XPCObject *)&v24);
      }

      uint64_t v14 = 3LL;
LABEL_10:
      XPCObject::~XPCObject(&v25);
      XPCObject::~XPCObject((XPCObject *)&v27);
      goto LABEL_4;
    }
  }

  XPCObject::~XPCObject((XPCObject *)&v27);
  uint64_t v14 = 1LL;
LABEL_4:
  XPCObject::~XPCObject(&v28);
  return v14;
}

void sub_18609C9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5 = va_arg(va1, void);
  va_copy(va2, va1);
  unint64_t v7 = va_arg(va2, void *);
  uint64_t v9 = va_arg(va2, void);
  va_copy(va3, va2);
  uint64_t v10 = va_arg(va3, void);
  XPCObject::~XPCObject((XPCObject *)va);
  XPCObject::~XPCObject((void **)va1);
  XPCObject::~XPCObject((XPCObject *)va2);
  XPCObject::~XPCObject((void **)va3);
  _Unwind_Resume(a1);
}

BOOL TMMapArchive::validate(TMMapArchive *this)
{
  if (*((_DWORD *)this + 1)
    && (int v2 = *((_DWORD *)this + 12), v2 == TMMapArchive::calculate_checksum((int32x4_t *)this)))
  {
    return TMMapArchive::are_offsets_in_bounds(this);
  }

  else
  {
    return 0LL;
  }

uint64_t *UUID::null_uuid(UUID *this)
{
  return &UUID::null_uuid(void)::fake;
}

BOOL UUID::is_null(UUID *this)
{
  if ((*this)[0]) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  do
  {
    unint64_t v4 = v3;
    if (v3 == 15) {
      break;
    }
    ++v3;
  }

  while (!(*this)[v4 + 1]);
  return v4 > 0xE;
}

double UUID::get_complement(int8x16_t *this)
{
  *(void *)&double result = vmvnq_s8(*this).u64[0];
  return result;
}

uint64_t _StringToUUIDBytes<CFUUIDBytes>(const char *a1, unsigned __int8 *a2)
{
  if (a1
    && a2
    && strlen(a1) >= 0x24
    && make_byte(*a1, a1[1], a2)
    && make_byte(a1[2], a1[3], a2 + 1)
    && make_byte(a1[4], a1[5], a2 + 2)
    && make_byte(a1[6], a1[7], a2 + 3)
    && a1[8] == 45
    && make_byte(a1[9], a1[10], a2 + 4)
    && make_byte(a1[11], a1[12], a2 + 5)
    && a1[13] == 45
    && make_byte(a1[14], a1[15], a2 + 6)
    && make_byte(a1[16], a1[17], a2 + 7)
    && a1[18] == 45
    && make_byte(a1[19], a1[20], a2 + 8)
    && make_byte(a1[21], a1[22], a2 + 9)
    && a1[23] == 45
    && make_byte(a1[24], a1[25], a2 + 10)
    && make_byte(a1[26], a1[27], a2 + 11)
    && make_byte(a1[28], a1[29], a2 + 12)
    && make_byte(a1[30], a1[31], a2 + 13)
    && make_byte(a1[32], a1[33], a2 + 14))
  {
    return make_byte(a1[34], a1[35], a2 + 15);
  }

  else
  {
    return 0LL;
  }

uint64_t _UUIDBytesToString<CFUUIDBytes>(unsigned __int8 *a1, char *__str, size_t __size)
{
  if (a1) {
    BOOL v3 = __str == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v5 = !v3 && __size > 0x24;
  if ((_DWORD)v5 == 1) {
    snprintf( __str,  __size,  "%02hhX%02hhX%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX",  *a1,  a1[1],  a1[2],  a1[3],  a1[4],  a1[5],  a1[6],  a1[7],  a1[8],  a1[9],  a1[10],  a1[11],  a1[12],  a1[13],  a1[14],  a1[15]);
  }
  return v5;
}

uint64_t make_byte(int a1, int a2, unsigned __int8 *a3)
{
  if ((a1 - 48) > 9)
  {
    unsigned __int8 v3 = 16 * a1 - 112;
  }

  else
  {
    unsigned __int8 v3 = 16 * a1;
  }

  *a3 = v3;
  char v4 = a2 - 48;
  if ((a2 - 48) < 0xA)
  {
LABEL_11:
    *a3 = v3 | v4;
    return 1LL;
  }

  if ((a2 - 65) <= 5)
  {
    char v4 = a2 - 55;
    goto LABEL_11;
  }

  if ((a2 - 97) <= 5)
  {
    char v4 = a2 - 87;
    goto LABEL_11;
  }

  return 0LL;
}

__n128 MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry( MMapArchiveFileSystem::ArchiveEntry *this, __n128 *a2, uint64_t a3, int a4, int a5, __int16 a6, __int16 a7)
{
  __n128 result = *a2;
  *(__n128 *)this = *a2;
  *((void *)this + 2) = 0LL;
  *((void *)this + pthread_mutex_lock((pthread_mutex_t *)this + 3) = a3;
  *((_DWORD *)this + _Block_object_dispose((const void *)(v11 - 64), 8) = a4;
  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 10) = a5;
  *((_WORD *)this + 22) = a6;
  *((_WORD *)this + 2pthread_mutex_lock((pthread_mutex_t *)this + 3) = a7;
  *((_BYTE *)this + 4_Block_object_dispose((const void *)(v11 - 64), 8) = 0;
  return result;
}

int8x16_t *MMapArchiveFileSystem::ArchiveEntry::ArchiveEntry(int8x16_t *a1, void **a2)
{
  *a1 = *(int8x16_t *)XPCArray::get_uuid(&v7, 0LL);
  a1[1].i64[0] = XPCArray::get_uint64(&v7, 1uLL);
  a1[1].i64[1] = XPCArray::get_uint64(&v7, 2uLL);
  a1[2].i32[0] = XPCArray::get_uint64(&v7, 3uLL);
  a1[2].i32[1] = XPCArray::get_uint64(&v7, 4uLL);
  a1[2].i32[2] = XPCArray::get_uint64(&v7, 5uLL);
  if (XPCArray::count(&v7) < 8)
  {
    a1[2].i32[3] = 1;
    a1[3].i8[0] = 0;
  }

  else
  {
    a1[2].i16[6] = XPCArray::get_uint64(&v7, 6uLL);
    a1[2].i16[7] = XPCArray::get_uint64(&v7, 7uLL);
    BOOL v3 = XPCArray::count(&v7) == 9 && XPCArray::get_uint64(&v7, 8uLL) != 0;
    a1[3].i8[0] = v3;
    if (a1[2].i16[6] == 3)
    {
      UUID::get_complement(a1);
      a1->i64[0] = v4;
      a1->i64[1] = v5;
    }
  }

  XPCObject::~XPCObject(&v7);
  return a1;
}

void sub_18609CF68(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void MMapArchiveFileSystem::ArchiveEntry::encode(int8x16_t *this@<X0>, void *a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  XPCArray::XPCArray((XPCArray *)&v6);
  if (this[2].i16[6] == 3)
  {
    UUID::get_complement(this);
    *(void *)&v7.byte0 = v4;
    *(void *)&v7.byte8 = v5;
    XPCArray::set_uuid(&v6, 0xFFFFFFFFFFFFFFFFLL, &v7);
  }

  else
  {
    XPCArray::set_uuid(&v6, 0xFFFFFFFFFFFFFFFFLL, (const CFUUIDBytes *)this);
  }

  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[1].u64[0]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[1].u64[1]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[0]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[1]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u32[2]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u16[6]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[2].u16[7]);
  XPCArray::set_uint64(&v6, 0xFFFFFFFFFFFFFFFFLL, this[3].u8[0]);
  XPCObject::XPCObject(a2, &v6);
  XPCObject::~XPCObject(&v6);
}

void sub_18609D0B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t CSMMapArchiveCacheSetShouldStoreToDaemon(uint64_t result)
{
  CSCppMMapArchiveCache::_should_store_to_daemon = result;
  return result;
}

BOOL CSCppDyldSharedCache::has_stripped_locals_data(CSCppDyldSharedCache *this)
{
  return *((void *)this + 9) && *((void *)this + 10) != 0LL;
}

uint64_t CSCppDyldSharedCache::local_symbols_range(CSCppDyldSharedCache *this)
{
  return *((void *)this + 9);
}

BOOL CSCppDyldSharedCache::uses_unmapped_symbols_file(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x18Fu && *((_OWORD *)this + 25) != 0LL;
}

BOOL CSCppDyldSharedCache::is_split_cache(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x18Fu;
}

BOOL CSCppDyldSharedCache::uses_universal_cache_struct_layout(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) > 0x1C8u;
}

BOOL CSCppDyldSharedCache::is_universal_cache(CSCppDyldSharedCache *this)
{
  return *((_DWORD *)this + 4) >= 0x1C9u && *((void *)this + 13) == 2LL;
}

uint64_t CSCppDyldSharedCache::for_each_subcache_entry_uuid(_DWORD *a1, uint64_t a2)
{
  unsigned int v4 = a1[4];
  if (v4 >= 0x1C9) {
    return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry,void({block_pointer})(unsigned char const*)>( (uint64_t)a1,  (uint64_t)a1 + a1[98],  a1[99],  a2);
  }
  if (v4 < 0x188)
  {
    uint64_t v6 = 0LL;
    goto LABEL_7;
  }

  uint64_t v6 = (uint64_t)a1 + a1[98];
  if (v4 < 0x18C)
  {
LABEL_7:
    int v7 = 0;
    return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>( (uint64_t)a1,  v6,  v7,  a2);
  }

  int v7 = a1[99];
  return _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>( (uint64_t)a1,  v6,  v7,  a2);
}

uint64_t _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry,void({block_pointer})(unsigned char const*)>( uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  LODWORD(v5) = a3;
  if (*(_DWORD *)(a1 + 16) >= 0x190u && *(_OWORD *)(a1 + 400) != 0LL) {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1 + 400);
  }
  if (!(_DWORD)v5) {
    return 0LL;
  }
  uint64_t v5 = v5;
  uint64_t v8 = v5;
  do
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a2);
    a2 += 56LL;
    --v8;
  }

  while (v8);
  return v5;
}

uint64_t _for_each_subcache_entry_uuid<CSCppDyldSharedCache const,dyld_subcache_entry_v1,void({block_pointer})(unsigned char const*)>( uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  LODWORD(v5) = a3;
  if (*(_DWORD *)(a1 + 16) >= 0x190u && *(_OWORD *)(a1 + 400) != 0LL) {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1 + 400);
  }
  if (!(_DWORD)v5) {
    return 0LL;
  }
  uint64_t v5 = v5;
  uint64_t v8 = v5;
  do
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a2);
    a2 += 24LL;
    --v8;
  }

  while (v8);
  return v5;
}

_DWORD *CSCppDyldSharedCache::extract_universal_subcache_paths@<X0>(_DWORD *this@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  if (this[4] >= 0x18Cu)
  {
    uint64_t v3 = this[99];
    if ((_DWORD)v3)
    {
      unsigned int v4 = 0LL;
      uint64_t v5 = (char *)this + this[98];
      uint64_t v6 = v5 + 24;
      do
      {
        if (v5)
        {
          if ((unint64_t)v4 >= a2[2])
          {
            this = (_DWORD *)std::vector<std::string>::__emplace_back_slow_path<char const(&)[32]>(a2, v6);
            unsigned int v4 = this;
          }

          else
          {
            this = std::string::basic_string[abi:ne180100]<0>(v4, v6);
            v4 += 3;
            a2[1] = (uint64_t)v4;
          }

          a2[1] = (uint64_t)v4;
        }

        v6 += 56;
        --v3;
      }

      while (v3);
    }
  }

  return this;
}

void sub_18609D464(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t CSCppDyldSharedCache::for_each_mapped_cache(char *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, a1);
  unsigned int v5 = *((_DWORD *)a1 + 4);
  if (v5 < 0x1C9)
  {
    if (v5 >= 0x18C)
    {
      size_t v11 = &a1[*((unsigned int *)a1 + 98)];
      if (v11)
      {
        uint64_t v12 = *((unsigned int *)a1 + 99);
        if ((_DWORD)v12)
        {
          uint64_t v13 = (uint64_t *)(v11 + 16);
          do
          {
            uint64_t v14 = *v13;
            v13 += 3;
            uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, &a1[v14]);
            --v12;
          }

          while (v12);
        }
      }
    }
  }

  else
  {
    uint64_t v6 = &a1[*((unsigned int *)a1 + 98)];
    uint64_t v7 = *((unsigned int *)a1 + 99);
    if (v6) {
      BOOL v8 = (_DWORD)v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v9 = (uint64_t *)(v6 + 16);
      do
      {
        uint64_t v10 = *v9;
        v9 += 7;
        uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, &a1[v10]);
        --v7;
      }

      while (v7);
    }
  }

  return result;
}

uint64_t CSCppDyldSharedCache::dsc_uuid(CSCppDyldSharedCache *this)
{
  return (uint64_t)this + 88;
}

void CSCppDyldSharedCache::ranges_with_permissions( CSCppDyldSharedCache *this@<X0>, int a2@<W1>, int a3@<W2>, void *a4@<X8>)
{
  unsigned int v5 = &v26;
  uint64_t v26 = 0LL;
  unsigned __int16 v27 = &v26;
  uint64_t v28 = 0x4002000000LL;
  size_t v29 = __Block_byref_object_copy__16;
  __int8 v30 = __Block_byref_object_dispose__16;
  size_t v32 = 0LL;
  uint64_t v33 = 0LL;
  std::__fs::filesystem::recursive_directory_iterator __p = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 0x40000000LL;
  int8x16_t v21 = ___ZNK20CSCppDyldSharedCache23ranges_with_permissionsEjj_block_invoke;
  int v22 = &unk_189DFB1E0;
  int v24 = a2;
  int v25 = a3;
  unsigned int v23 = &v26;
  if (*((_DWORD *)this + 5))
  {
    unint64_t v7 = 0LL;
    BOOL v8 = (char *)this + *((unsigned int *)this + 4);
    do
    {
      v21((uint64_t)v20, (uint64_t)v8);
      ++v7;
      v8 += 32;
    }

    while (v7 < *((unsigned int *)this + 5));
    unsigned int v5 = v27;
    uint64_t v9 = (void *)v27[5];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (v9 == (void *)v5[6])
  {
    unint64_t v10 = v5[7];
    if ((unint64_t)v9 >= v10)
    {
      uint64_t v12 = v10 - (void)v9;
      uint64_t v13 = v12 >> 3;
      else {
        unint64_t v14 = v13;
      }
      size_t v15 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)(v5 + 7),  v14);
      int v17 = &v15[2 * v16];
      size_t v11 = v15 + 2;
      *size_t v15 = 0LL;
      v15[1] = 0LL;
      unint64_t v19 = (char *)v5[5];
      size_t v18 = (char *)v5[6];
      if (v18 != v19)
      {
        do
        {
          *((_OWORD *)v15 - 1) = *((_OWORD *)v18 - 1);
          v15 -= 2;
          v18 -= 16;
        }

        while (v18 != v19);
        size_t v18 = (char *)v5[5];
      }

      v5[5] = (uint64_t)v15;
      v5[6] = (uint64_t)v11;
      v5[7] = (uint64_t)v17;
      if (v18) {
        operator delete(v18);
      }
    }

    else
    {
      size_t v11 = v9 + 2;
      *uint64_t v9 = 0LL;
      v9[1] = 0LL;
    }

    v5[6] = (uint64_t)v11;
    unsigned int v5 = v27;
  }

  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = 0LL;
  std::vector<TRange<Pointer64>>::__init_with_size[abi:ne180100]<TRange<Pointer64>*,TRange<Pointer64>*>( a4,  (const void *)v5[5],  v5[6],  (v5[6] - v5[5]) >> 4);
  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    size_t v32 = __p;
    operator delete(__p);
  }

void sub_18609D708( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__16(void *a1, uint64_t a2)
{
  a1[5] = 0LL;
  a1[6] = 0LL;
  a1[7] = 0LL;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 4_Block_object_dispose((const void *)(v11 - 64), 8) = 0LL;
  *(void *)(a2 + 56) = 0LL;
  return result;
}

uint64_t CSCppDyldSharedCache::enumerate_mapping_infos(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (*(_DWORD *)(result + 20))
    {
      unint64_t v4 = 0LL;
      uint64_t v5 = result + *(unsigned int *)(result + 16);
      do
      {
        __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
        ++v4;
        v5 += 32LL;
      }

      while (v4 < *(unsigned int *)(v2 + 20));
    }
  }

  return result;
}

void ___ZNK20CSCppDyldSharedCache23ranges_with_permissionsEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 28);
  if ((*(_DWORD *)(a1 + 40) & ~v2) == 0 && (*(_DWORD *)(a1 + 44) & v2) == 0)
  {
    unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
    uint64_t v5 = (_OWORD *)v4[6];
    unint64_t v6 = v4[7];
    if ((unint64_t)v5 >= v6)
    {
      uint64_t v8 = v4[5];
      uint64_t v9 = ((uint64_t)v5 - v8) >> 4;
      uint64_t v10 = v6 - v8;
      uint64_t v11 = v10 >> 3;
      else {
        unint64_t v12 = v11;
      }
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CSCppSymbolOwner>>>( (uint64_t)(v4 + 7),  v12);
      unint64_t v14 = &v13[16 * v9];
      uint64_t v16 = &v13[16 * v15];
      *(_OWORD *)unint64_t v14 = *(_OWORD *)a2;
      unint64_t v7 = v14 + 16;
      size_t v18 = (char *)v4[5];
      int v17 = (char *)v4[6];
      if (v17 != v18)
      {
        do
        {
          *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
          v14 -= 16;
          v17 -= 16;
        }

        while (v17 != v18);
        int v17 = (char *)v4[5];
      }

      v4[5] = v14;
      v4[6] = v7;
      v4[7] = v16;
      if (v17) {
        operator delete(v17);
      }
    }

    else
    {
      _OWORD *v5 = *(_OWORD *)a2;
      unint64_t v7 = v5 + 1;
    }

    v4[6] = v7;
  }

void CSCppDyldSharedCache::data_segment_ranges(CSCppDyldSharedCache *this@<X0>, void *a2@<X8>)
{
}

uint64_t CSCppDyldSharedCache::text_segment_range(CSCppDyldSharedCache *this)
{
  uint64_t v1 = *(void *)__p[0];
  __p[1] = __p[0];
  operator delete(__p[0]);
  return v1;
}

BOOL CSCppDyldSharedCache::stripped_locals_data_for (uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  if (!*(void *)(a1 + 72)) {
    return 0LL;
  }
  BOOL result = 0LL;
  if (a3 && *(void *)(a1 + 80))
  {
    unint64_t v6 = a3[5];
    unint64_t v7 = (unsigned int *)((char *)a3 + a3[4]);
    if (*(_DWORD *)(a1 + 16) < 0x190u)
    {
      if ((_DWORD)v6)
      {
        if (*v7 == a2)
        {
          unint64_t v9 = 0LL;
          BOOL result = 1LL;
LABEL_20:
          *(void *)a4 = *a3;
          int v17 = &v7[3 * v9];
          int v13 = v17[1];
          *(_DWORD *)(a4 + _Block_object_dispose((const void *)(v11 - 64), 8) = v13;
          unint64_t v14 = v17 + 2;
          goto LABEL_21;
        }

        unint64_t v9 = 0LL;
        uint64_t v15 = v7 + 3;
        while (v6 - 1 != v9)
        {
          int v16 = *v15;
          v15 += 3;
          ++v9;
          if (v16 == a2)
          {
            BOOL result = v9 < v6;
            goto LABEL_20;
          }
        }
      }
    }

    else if ((_DWORD)v6)
    {
      if (*(void *)v7 == a2)
      {
        unint64_t v8 = 0LL;
        BOOL result = 1LL;
LABEL_15:
        *(void *)a4 = *a3;
        unint64_t v12 = &v7[4 * v8];
        int v13 = v12[2];
        *(_DWORD *)(a4 + _Block_object_dispose((const void *)(v11 - 64), 8) = v13;
        unint64_t v14 = v12 + 3;
LABEL_21:
        int v18 = *v14 + v13;
        unsigned int v19 = a3[3];
        *(void *)(a4 + 24) = a3[2];
        *(_DWORD *)(a4 + 12) = v18;
        *(_DWORD *)(a4 + 16) = v19;
        return result;
      }

      unint64_t v8 = 0LL;
      uint64_t v10 = (uint64_t *)(v7 + 4);
      while (v6 - 1 != v8)
      {
        uint64_t v11 = *v10;
        v10 += 2;
        ++v8;
        if (v11 == a2)
        {
          BOOL result = v8 < v6;
          goto LABEL_15;
        }
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<char const(&)[32]>(uint64_t *a1, char *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSCppSectionRange>>(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  __v.__first_ = v10;
  __v.__begin_ = v10 + v4;
  __v.__end_cap_.__value_ = &v10[v9];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, a2);
  __v.__end_ = __v.__begin_ + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v11 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v11;
}

void sub_18609DB38( _Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::vector<TRange<Pointer64>>::__init_with_size[abi:ne180100]<TRange<Pointer64>*,TRange<Pointer64>*>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    BOOL result = std::vector<std::shared_ptr<CSCppSymbolOwner>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_18609DBA8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose((const void *)(v11 - 64), 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t (*mach_exc_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t _Xmach_exception_raise(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 2) {
      goto LABEL_3;
    }
    unsigned int v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x44 || v4 > 0x54) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }

    unsigned int v5 = *(_DWORD *)(result + 64);
    if (v5 <= 2 && v5 <= (v4 - 68) >> 3 && v4 == 8 * v5 + 68)
    {
      BOOL result = catch_mach_exception_raise();
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }

  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xmach_exception_raise_state(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  unsigned int v3 = *(_DWORD *)(result + 4);
  BOOL v4 = v3 < 0x30 || v3 > 0x1480;
  if (v4
    || (uint64_t v5 = *(unsigned int *)(result + 36), v5 > 2)
    || ((v6 = 8 * v5, v5 <= (v3 - 48) >> 3) ? (BOOL v7 = v3 >= 8 * (int)v5 + 48) : (BOOL v7 = 0),
        !v7
     || (uint64_t v8 = result + v6, v9 = *(_DWORD *)(v8 + 44), v9 > 0x510)
     || ((unsigned int v10 = v3 - v6, v9 <= (v10 - 48) >> 2) ? (v11 = v10 == 4 * v9 + 48) : (v11 = 0), !v11)))
  {
LABEL_17:
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v12 = *MEMORY[0x1895F8468];
LABEL_18:
    *(void *)(a2 + 24) = v12;
    return result;
  }

  uint64_t v13 = v8 - 16;
  *(_DWORD *)(a2 + 40) = 1296;
  unint64_t v14 = (_DWORD *)(v13 + 56);
  BOOL result = catch_mach_exception_raise_state( *(unsigned int *)(result + 12),  *(unsigned int *)(result + 32),  (void *)(result + 40),  v5,  v13 + 56,  (const void *)(v13 + 64),  v9,  (void *)(a2 + 44),  (unsigned int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v12 = *MEMORY[0x1895F8468];
  if ((_DWORD)result) {
    goto LABEL_18;
  }
  *(void *)(a2 + 24) = v12;
  *(_DWORD *)(a2 + 36) = *v14;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xmach_exception_raise_state_identity(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(result + 4);
  if (v5 < 0x4C || v5 > 0x149C) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }

  unsigned int v7 = *(_DWORD *)(result + 64);
  if (v7 > 2) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (v7 > (v5 - 76) >> 3) {
    goto LABEL_3;
  }
  unsigned int v8 = 8 * v7;
  if (v5 < 8 * v7 + 76) {
    goto LABEL_3;
  }
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(v9 + 72);
  if (v10 > 0x510 || (unsigned int v11 = v5 - v8, v10 > (v11 - 76) >> 2) || v11 != 4 * v10 + 76)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1895F8468];
LABEL_4:
    *(void *)(a2 + 24) = v4;
    return result;
  }

  *(_DWORD *)(a2 + 40) = 1296;
  uint64_t v12 = (_DWORD *)(v9 + 68);
  BOOL result = catch_mach_exception_raise();
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1895F8468];
  if ((_DWORD)result) {
    goto LABEL_4;
  }
  *(void *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 36) = *v12;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xmach_exception_raise_identity_protected(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    unsigned int v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x40 || v4 > 0x50) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }

    unsigned int v5 = *(_DWORD *)(result + 60);
    if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && v4 == 8 * v5 + 64)
    {
      BOOL result = catch_mach_exception_raise_identity_protected( *(unsigned int *)(result + 12),  *(void *)(result + 48),  *(_DWORD *)(result + 28),  *(unsigned int *)(result + 56),  (void *)(result + 64));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }

  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t mach_exc_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v11 - 64), 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2411) >= 0xFFFFFFFA
    && (unsigned int v5 = (void (*)(void))catch_mach_exc_subsystem[5 * (v4 - 2405) + 5]) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void elide_some_symbol_owners(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

void CSCppReferenceCount::retain()
{
  uint64_t v0 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppReferenceCount.hpp");
  printf("ASSERT(%s) %s %d, %s\n", "test_value != 0", v0, 27, "attempted object resurrection");
  if (qword_18C49FAB0) {
    printf("__crashreporter_info__: %s\n", (const char *)qword_18C49FAB0);
  }
  abort();
}

void CSCppReferenceCount::release()
{
  uint64_t v0 = utility_basename("/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/CSCppReferenceCount.hpp");
  printf("ASSERT(%s) %s %d, %s\n", "test_value >= value", v0, 43, "over release");
  if (qword_18C49FAB0) {
    printf("__crashreporter_info__: %s\n", (const char *)qword_18C49FAB0);
  }
  abort();
}

void new_file_memory_for_uuid_and_arch(void *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v1 = __cxa_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = (*(uint64_t (**)(void *))(*(void *)v1 + 16LL))(v1);
    int v3 = 136315394;
    int v4 = "CSCppFileMemory *new_file_memory_for_uuid_and_arch(const char *, const UUID &, CSCppArchitecture, uint32_t)";
    __int16 v5 = 2080;
    uint64_t v6 = v2;
    _os_log_impl( &dword_185FC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Caught exception in %s:\n %s\n",  (uint8_t *)&v3,  0x16u);
  }

void CSCppSymbolicator::get_symbol_owners_at_time(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + _Block_object_dispose((const void *)(v11 - 64), 8) = v2;
    operator delete(v2);
  }

uint64_t create_symbol_owner_data_arch_specific<SizeAndEndianness<Pointer32,LittleEndian>>(const char *a1)
{
  uint64_t result = printf( "ASSERT(%s) %s %d, %s\n",  "traw_symbol_owner_data->retain_count() == 1",  a1,  2243,  "Wrong refcount on traw_symbol_owner_data");
  if (qword_18C49FAB0) {
    return printf("__crashreporter_info__: %s\n", (const char *)qword_18C49FAB0);
  }
  return result;
}

void extract_dwarf_data_from_header<SizeAndEndianness<Pointer32,LittleEndian>>( void *a1, uint64_t a2, void **a3)
{
  *a3 = OUTLINED_FUNCTION_4(a1);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_2( &dword_185FC0000,  MEMORY[0x1895F8DA0],  v3,  "%s -- stopping DWARF analysis of %s\n",  v4,  v5,  v6,  v7,  v8);
  }

  OUTLINED_FUNCTION_3();
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](uint64_t a1)
{
}

void std::__optional_copy_base<std::vector<unsigned long long>,false>::__optional_copy_base[abi:ne180100]( void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    OUTLINED_FUNCTION_0_0(v2, (uint64_t)a1);
  }
}

void ___ZN20TMachOHeaderIteratorI17SizeAndEndiannessI9Pointer6412LittleEndianEE7iterateEv_block_invoke_cold_2( void *a1)
{
  size_t v2 = strlen(v1);
  uint64_t v10 = 1024LL;
  if (v2 < 0x400) {
    uint64_t v10 = v2;
  }
  if (v10)
  {
    do
    {
      OUTLINED_FUNCTION_0_1(v2, v3, v4, v5, v6, v7, v8, v9, v12);
      OUTLINED_FUNCTION_3_0();
    }

    while (!v11);
  }

  OUTLINED_FUNCTION_1_0();
}

void create_sampling_context_for_task_pid_symbolicator_cold_1(void *a1, uint64_t a2, void ***a3, char **a4)
{
  int v6 = __cxa_begin_catch(a1);
  int v7 = (FILE *)*MEMORY[0x1895F89D0];
  int v8 = (const char *)(*(uint64_t (**)(void *))(*(void *)v6 + 16LL))(v6);
  fprintf(v7, "Caught exception in create_sampling_context_for_task:\n%s\n", v8);
  int v9 = *a3;
  if (*a3)
  {
    char v11 = *a3;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v11);
    operator delete(v9);
    *a3 = 0LL;
  }

  sampling_context_t::~sampling_context_t(a4);
  operator delete(v10);
  __cxa_end_catch();
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1896025E0](allocator, context);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602800](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1896085D8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x189614180](this, __s);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference( const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1896141A8](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x189614220](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

void std::__call_once(unint64_t *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

void std::string::__grow_by_and_replace( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1896142E8](this, __n, __c);
}

std::string *__cdecl std::string::insert( std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x189614310](this, __pos, __s, __n);
}

void std::string::__grow_by( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string( std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x189614348](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1896143D8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143E0]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614418]();
}

{
  return MEMORY[0x189614438]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_system_error(int ev, const char *what_arg)
{
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment( std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x189614520](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator( std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x189614528](this, __p, __opt, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status( const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x189614530](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x189614668](retstr, __val);
}

{
  return (std::string *)MEMORY[0x189614678](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_189DF4A60(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189DF4A68(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_189DF4A70(__sz, a2);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1896147C8](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1896147F0](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x189614810](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1895F8C38]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895F8C40]();
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1895F8C90]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1895F8C98]();
}

uint64_t _dyld_process_info_get_cache()
{
  return MEMORY[0x1895F8CA0]();
}

uint64_t _dyld_process_info_get_platform()
{
  return MEMORY[0x1895F8CA8]();
}

uint64_t _dyld_process_info_get_state()
{
  return MEMORY[0x1895F8CB0]();
}

uint64_t _dyld_process_info_notify()
{
  return MEMORY[0x1895F8CB8]();
}

uint64_t _dyld_process_info_notify_main()
{
  return MEMORY[0x1895F8CC0]();
}

uint64_t _dyld_process_info_notify_release()
{
  return MEMORY[0x1895F8CC8]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1895F8CD0]();
}

uint64_t _dyld_shared_cache_real_path()
{
  return MEMORY[0x1895F8CF0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return MEMORY[0x1895FAFC8]();
}

uint64_t dyld_image_content_for_segment()
{
  return MEMORY[0x1895FB000]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1895FB008]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1895FB010]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x1895FB018]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1895FB020]();
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1895FB038]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1895FB048]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1895FB050]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1895FB060]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1895FB068]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x1895FB070]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1895FB078]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1895FB090]();
}

uint64_t dyld_shared_cache_file_path()
{
  return MEMORY[0x1895FB098]();
}

uint64_t dyld_shared_cache_find_iterate_text()
{
  return MEMORY[0x1895FB0A0]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1895FB0A8]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1895FB0B8]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1895FB0C0]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x1895FB0C8]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

char *__cdecl getwd(char *a1)
{
  return (char *)MEMORY[0x1895FB6F8](a1);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return MEMORY[0x1895FB710](a1, *(void *)&a2, a3, a4);
}

void globfree(glob_t *a1)
{
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1895FB780](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kas_info()
{
  return MEMORY[0x1895FB8A8]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return MEMORY[0x1895FBB00](a1);
}

mach_msg_return_t mach_msg_server_once( BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return MEMORY[0x1895FBB08](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_context( ipc_space_inspect_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return MEMORY[0x1895FBB50](*(void *)&task, *(void *)&name, context);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_context(ipc_space_t task, mach_port_name_t name, mach_port_context_t context)
{
  return MEMORY[0x1895FBB98](*(void *)&task, *(void *)&name, context);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1895FBBD8](*(void *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FBC00](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

kern_return_t mach_vm_protect( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1895FBC28]( *(void *)&target_task,  address,  size,  *(void *)&set_maximum,  *(void *)&new_protection);
}

kern_return_t mach_vm_read_overwrite( vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x1895FBC38](*(void *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_region_recurse( vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1895FBC48](*(void *)&target_task, address, size, nesting_depth, info, infoCnt);
}

kern_return_t mach_vm_remap_new( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FBC58]( *(void *)&target_task,  target_address,  size,  mask,  *(void *)&flags,  *(void *)&src_task,  src_address,  *(void *)&copy);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBC80](a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1895FBFB0](__rqtp, __rmtp);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1895FC788](*(void *)&t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1895FCA70](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1895FCB38](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1895FCB68](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1895FCB88](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1895FCC48](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1895FD340]();
}

kern_return_t task_resume(task_t target_task)
{
  return MEMORY[0x1895FD358](*(void *)&target_task);
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x1895FD360](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1895FD368](*(void *)&target_task, suspend_token);
}

kern_return_t task_threads( task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1895FD370](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state( thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1895FD3A8](*(void *)&target_act, *(void *)&flavor, old_state, old_stateCnt);
}

kern_return_t thread_info( thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1895FD3B0](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_set_exception_ports( thread_act_t thread, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x1895FD3D0]( *(void *)&thread,  *(void *)&exception_mask,  *(void *)&new_port,  *(void *)&behavior,  *(void *)&new_flavor);
}

kern_return_t thread_set_state( thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt)
{
  return MEMORY[0x1895FD3D8](*(void *)&target_act, *(void *)&flavor, new_state, *(void *)&new_stateCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_map_page_query( vm_map_t target_map, vm_offset_t offset, integer_t *disposition, integer_t *ref_count)
{
  return MEMORY[0x1895FD570](*(void *)&target_map, offset, disposition, ref_count);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1895FD848](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1895FD850](xarray, index);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FE020](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1895FE030](xshmem, region);
}