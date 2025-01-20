unint64_t radix_tree_lookup(uint64_t a1, unint64_t a2)
{
  unint64_t v3[4];
  radix_tree_lookup_interval(a1, a2, 1uLL, v3);
  return v3[2];
}

uint64_t radix_tree_lookup_interval@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t result = radix_tree_lookup_recursive(a1, a2, a3, 0LL, 0xFFFFFFFFFFFFFFFFLL, (unsigned int *)(a1 + 20), 0, a4);
  if (a4[2] != -1LL)
  {
    if (!a3) {
      goto LABEL_15;
    }
    unint64_t v8 = a4[1];
    if (!v8) {
      goto LABEL_15;
    }
    unint64_t v9 = *a4;
    if (a2 < *a4 || a2 - *a4 >= v8)
    {
      unint64_t v10 = a3 + a2 - 1;
      BOOL v11 = v10 >= v9;
      unint64_t v12 = v10 - v9;
      if ((!v11 || v12 >= v8) && (v9 < a2 || v9 - a2 >= a3))
      {
        unint64_t v13 = v9 + v8 - 1;
        BOOL v11 = v13 >= a2;
        unint64_t v14 = v13 - a2;
        if (!v11 || v14 >= a3) {
LABEL_15:
        }
          radix_tree_lookup_interval_cold_1();
      }
    }
  }

  return result;
}

uint64_t radix_tree_insert(uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (__CFADD__(a2, a3))
  {
    radix_tree_panic( "MallocStackLogging INTERNAL ERROR: interval wraps around the end of the address space: %llx, size=%llx\n",  a2,  a3);
    goto LABEL_8;
  }

  uint64_t v4 = a4;
  if ((unint64_t)(a3 >> *(_DWORD *)(*a1 + 8)) << *(_DWORD *)(*a1 + 8) != a3)
  {
LABEL_8:
    radix_tree_panic( "MallocStackLogging INTERNAL ERROR: cannot represent value:%llx or size:%llx (key is %llx)\n",  v4,  a3,  a2);
    goto LABEL_9;
  }

  if ((a2 & 0xFFF) != 0)
  {
LABEL_9:
    unint64_t v9 = (char *)radix_tree_panic("MallocStackLogging INTERNAL ERROR: cannot represent key: %llx\n", a2);
    return radix_tree_panic(v9);
  }

  uint64_t result = radix_tree_delete(a1, a2, a3);
  if ((_DWORD)result) {
    return radix_tree_insert_recursive((mach_vm_address_t *)a1, a2, a3, v4, 0, 0);
  }
  return result;
}

uint64_t radix_tree_panic(char *__format, ...)
{
  uint64_t v1 = abort_with_reason();
  return radix_tree_delete(v1);
}

uint64_t radix_tree_delete(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v5 = a3 + a2;
    if (__CFADD__(a3, a2)) {
      return 0LL;
    }
    while (1)
    {
      radix_tree_lookup_interval(*a1, a2, a3, &v10);
      uint64_t v8 = v12;
      if (v12 == -1) {
        break;
      }
      unint64_t v9 = v10;
      if ((radix_tree_delete_recursive(*a1, v10, *a1 + 20, 0) & 1) == 0) {
        radix_tree_delete_cold_1();
      }
      if (a2 > v9)
      {
        uint64_t result = radix_tree_insert(a1, v9, a2 - v9, v8);
        if (!(_DWORD)result) {
          return result;
        }
      }

      if (v11 + v9 > v5 && (radix_tree_insert(a1, v5, v11 + v9 - v5, v8) & 1) == 0) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t radix_tree_insert_recursive( mach_vm_address_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, unsigned __int16 a5, int a6)
{
  uint64_t v8 = a1;
LABEL_2:
  while (2)
  {
    if (a6 >= 52) {
      radix_tree_insert_recursive_cold_1();
    }
    unsigned int v9 = a5;
    unint64_t v10 = v8;
    uint64_t v11 = 0LL;
    uint64_t v12 = *v8 + 12LL * a5 + 20;
    char v13 = 1;
    while (1)
    {
      char v14 = v13;
      unint64_t v15 = *(unsigned int *)(v12 + 6 * v11);
      int v16 = v15 & 0x7C000000;
      if ((v15 & 0x7C000000) == 0) {
        break;
      }
      int v17 = 0;
      unint64_t v18 = v15 & 0x3FFFFFF;
      uint64_t v19 = (v15 >> 26) & 0x1F;
      int v20 = -a6;
      while (v18 != ((a2 >> (v20 - v19)) & ~(-1 << (v19 + v17))))
      {
        int v21 = v19 + v17;
        v18 >>= 1;
        --v17;
        v16 -= 0x4000000;
        LOBYTE(v20) = v20 + 1;
        if (v21 == 1) {
          goto LABEL_11;
        }
      }

      if ((_DWORD)v19 + v17)
      {
        if (v17)
        {
          int v46 = a6;
          uint64_t result = radix_tree_allocate_node(v10);
          if (!(_DWORD)result) {
            return result;
          }
          a5 = result;
          int v47 = v46 + ((v15 >> 26) & 0x1F) + v17;
          unsigned int v30 = *(unsigned __int16 *)(*a1 + 12);
          uint64_t v31 = *a1 + 20;
          if (v30 >= v9) {
            v32 = (unsigned int *)(v31 + 12LL * v9);
          }
          else {
            v32 = 0LL;
          }
          v33 = (char *)v32 + 6 * v11;
          uint64_t v34 = v31 + 12LL * a5;
          if (v30 < a5) {
            uint64_t v34 = 0LL;
          }
          int v35 = (*(_DWORD *)v33 - v16) & 0x7C000000;
          unsigned int v36 = *(_DWORD *)v34 & 0x83FFFFFF | v35;
          *(_DWORD *)uint64_t v34 = v36;
          unsigned int v37 = *(_DWORD *)v33 & 0x80000000;
          *(_DWORD *)uint64_t v34 = v37 | v36 & 0x7FFFFFFF;
          *(_WORD *)(v34 + 4) = *((_WORD *)v33 + 2);
          *(_DWORD *)uint64_t v34 = v35 & 0xFC000000 | *(_DWORD *)v33 & ~(-1 << (((*(_DWORD *)v33 >> 26) & 0x1F)
          *(_DWORD *)v33 = ((*(_DWORD *)v33 & 0x3FFFFFFu) >> (((*(_DWORD *)v33 >> 26) & 0x1F)
                                                            - ((v15 >> 26) & 0x1F)
                                                            - v17))
                         + v16;
          *((_WORD *)v33 + 2) = a5;
          fixnode(v32);
          uint64_t v8 = a1;
          a6 = v47;
        }

        else
        {
          if ((v15 & 0x80000000) != 0) {
            radix_tree_insert_recursive_cold_4();
          }
          a5 = *(_WORD *)(v12 + 6 * v11 + 4);
          a6 += v19;
          uint64_t v8 = v10;
        }

        goto LABEL_2;
      }

LABEL_11:
      char v13 = 0;
      uint64_t v11 = 1LL;
      if ((v14 & 1) == 0)
      {
        radix_tree_panic("MallocStackLogging INTERNAL ERROR: at least one edge must prefix-match or be unused\n");
        goto LABEL_44;
      }
    }

    uint64_t v8 = v10;
    int v22 = a6;
    int node = radix_tree_allocate_node(v10);
    char v24 = v22;
    a5 = node;
    if (v22 < 26)
    {
      if (!node) {
        return 0LL;
      }
      else {
        v25 = 0LL;
      }
      v26 = (char *)v25 + 6 * v11;
      *((_WORD *)v26 + 2) = node;
      int v27 = v22 + 26;
      *(_DWORD *)v26 = (a2 >> (38 - v24)) & 0x3FFFFFF | 0x68000000;
      else {
        v28 = 0LL;
      }
      bzero(v28, 0xCuLL);
      fixnode(v25);
      a6 = v27;
      continue;
    }

    break;
  }

  if (node)
  {
    else {
      v38 = 0LL;
    }
    v39 = (char *)v38 + 6 * v11;
    *((_WORD *)v39 + 2) = a5;
    *(_DWORD *)v39 = (a2 >> 12) & ~(-1 << (52 - v22)) & 0x3FFFFFF | ((52 - v22) << 26) | 0x80000000;
    uint64_t v40 = *v8 + 12LL * a5 + 20;
    *(void *)uint64_t v40 = a4;
    mach_vm_address_t v41 = *v8;
    unint64_t v42 = a3 >> *(_DWORD *)(*v8 + 8);
    *(_DWORD *)(v40 + 8) = v42;
    if ((unint64_t)v42 << *(_DWORD *)(v41 + 8) == a3)
    {
      fixnode(v38);
      return 1LL;
    }

LABEL_44:
    radix_tree_insert_recursive_cold_3();
  }

  return 0LL;
}

uint64_t radix_tree_delete_recursive(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  if (a4 >= 52) {
    radix_tree_delete_recursive_cold_1();
  }
  if (!a3) {
    radix_tree_delete_recursive_cold_2();
  }
  uint64_t v5 = a1;
  uint64_t v6 = 0LL;
  char v7 = 1;
  while (1)
  {
    unsigned int v8 = *(_DWORD *)(a3 + 6 * v6);
    char v9 = v7;
    if ((v8 & 0x7C000000) != 0
      && ((a2 >> (-(char)a4 - ((v8 >> 26) & 0x1F))) & ~(-1 << (v8 >> 26))) == (v8 & 0x3FFFFFF))
    {
      break;
    }

    char v7 = 0;
    int v11 = 0;
    uint64_t v6 = 1LL;
    if ((v9 & 1) == 0) {
      return v11 & v8;
    }
  }

  uint64_t v12 = a3 + 6 * v6;
  unsigned int v15 = *(unsigned __int16 *)(v12 + 4);
  char v14 = (unsigned __int16 *)(v12 + 4);
  unsigned int v13 = v15;
  if ((v8 & 0x80000000) != 0)
  {
    unsigned int v16 = v13;
    goto LABEL_17;
  }

  if (!radix_tree_delete_recursive(a1))
  {
    unsigned int v8 = 0;
    int v11 = 1;
    return v11 & v8;
  }

  unsigned int v16 = *v14;
  if ((*(_BYTE *)(v5 + 12LL * *v14 + 23) & 0x7C) == 0 && (*(_BYTE *)(v5 + 12LL * *v14 + 29) & 0x7C) == 0)
  {
    a1 = v5;
LABEL_17:
    radix_tree_free_node(a1, v16);
    int v17 = (_DWORD *)(a3 + 6);
    if (!(_DWORD)v6)
    {
      *(_DWORD *)a3 = *v17;
      *(_WORD *)(a3 + 4) = *(_WORD *)(a3 + 10);
    }

    *v17 &= 0x83FFFFFF;
  }

  int v11 = 1;
  unsigned int v8 = 1;
  return v11 & v8;
}

uint64_t radix_tree_init(uint64_t a1, uint64_t a2)
{
  v3 = (void *)(a1 + 20);
  *(_WORD *)(a1 + 12) = ((int)a2 - 20) / 0xCu;
  *(_DWORD *)(a1 + 16) = 1;
  bzero(v3, 0xCuLL);
  bzero((void *)(a1 + 32), 0xCuLL);
  *(_WORD *)(a1 + 32) = 2;
  *(_DWORD *)(a1 + 8) = 12;
  return a1;
}

uint64_t radix_tree_create()
{
  uint64_t result = sld_allocate_pages(0x4000uLL);
  if (result) {
    return radix_tree_init(result, 0x4000LL);
  }
  return result;
}

uint64_t radix_tree_destroy(mach_vm_address_t a1)
{
  mach_vm_size_t v2 = radix_tree_size(a1);
  uint64_t result = mach_vm_deallocate(*MEMORY[0x1895FFD48], a1, v2);
  if ((_DWORD)result) {
    radix_tree_destroy_cold_1();
  }
  return result;
}

uint64_t radix_tree_size(uint64_t a1)
{
  uint64_t v1 = 3LL * *(unsigned __int16 *)(a1 + 12);
  uint64_t result = (12 * *(unsigned __int16 *)(a1 + 12) + 16403) & 0x1FC000LL;
  return result;
}

uint64_t radix_tree_count(uint64_t a1)
{
  return radix_tree_count_recursive(a1, a1 + 20);
}

uint64_t radix_tree_count_recursive(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  char v6 = 1;
  do
  {
    char v7 = v6;
    int v8 = *(_DWORD *)(a2 + 6 * v4);
    if ((v8 & 0x7C000000) != 0)
    {
      unsigned int v9 = *(unsigned __int16 *)(a2 + 6 * v4 + 4);
      else {
        uint64_t v10 = 0LL;
      }
      if (v8 < 0) {
        unint64_t v11 = (unint64_t)*(unsigned int *)(v10 + 8) << *(_DWORD *)(a1 + 8);
      }
      else {
        unint64_t v11 = radix_tree_count_recursive(a1, v10);
      }
      v5 += v11;
    }

    char v6 = 0;
    uint64_t v4 = 1LL;
  }

  while ((v7 & 1) != 0);
  return v5;
}

uint64_t radix_tree_lookup_recursive@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unsigned int *a6@<X5>, int a7@<W6>, unint64_t *a8@<X8>)
{
  if (!a6) {
    radix_tree_lookup_recursive_cold_1();
  }
  unint64_t v8 = a5;
  if (!a5) {
    goto LABEL_89;
  }
  unint64_t v9 = a3;
  if (!a3) {
    goto LABEL_89;
  }
  unint64_t v13 = a2;
  unint64_t v16 = a4 - a2;
  if (a4 < a2 || a3 <= v16)
  {
    unint64_t v17 = a5 + a4 - 1;
    BOOL v34 = v17 >= a2;
    unint64_t v18 = v17 - a2;
    if ((!v34 || v18 >= a3) && (a2 < a4 || a2 - a4 >= a5))
    {
      unint64_t v19 = a3 + a2 - 1;
      BOOL v34 = v19 >= a4;
      unint64_t v20 = v19 - a4;
      if (!v34 || v20 >= a5) {
LABEL_89:
      }
        radix_tree_lookup_recursive_cold_2();
    }
  }

  if (a7 >= 52) {
    radix_tree_lookup_recursive_cold_3();
  }
  uint64_t result = fixnode(a6);
  if ((_DWORD)result) {
    radix_tree_lookup_recursive_cold_4();
  }
  if (v13 < a4)
  {
    BOOL v22 = v9 == v16;
    BOOL v23 = v9 > v16;
    v9 -= v16;
    if (!v23)
    {
      *a8 = 0LL;
      a8[1] = 0LL;
      a8[2] = -1LL;
      a8[3] = a4;
      return result;
    }

    if (v22) {
LABEL_92:
    }
      radix_tree_lookup_recursive_cold_5();
    unint64_t v13 = a4;
  }

  if (a4 < v13 || a4 - v13 >= v9)
  {
    unint64_t v24 = v8 + a4 - 1;
    BOOL v34 = v24 >= v13;
    unint64_t v25 = v24 - v13;
    if ((!v34 || v25 >= v9) && (v13 < a4 || v13 - a4 >= v8))
    {
      unint64_t v26 = v9 + v13 - 1;
      BOOL v34 = v26 >= a4;
      unint64_t v27 = v26 - a4;
      if (!v34 || v27 >= v8) {
        goto LABEL_92;
      }
    }
  }

  uint64_t v28 = 0LL;
  unint64_t v45 = v9 + v13 - 1;
  while (1)
  {
    unsigned int v29 = *(unsigned int *)((char *)a6 + v28 + 6);
    if ((v29 & 0x7C000000) == 0) {
      goto LABEL_79;
    }
    if (((-1 << (v29 >> 26)) & v29 & 0x3FFFFFF) != 0) {
      radix_tree_lookup_recursive_cold_11();
    }
    int v30 = ((v29 >> 26) & 0x1F) + a7;
    unint64_t v31 = ((unint64_t)(v29 & 0x3FFFFFF) << (64 - v30)) | a4;
    if (v31 - a4 >= v8 || ((v32 = a4 - v31 + v8, v33 = a4 + v8 - 1, v33 >= a4) ? (BOOL v34 = v8 - 1 >= v8) : (BOOL v34 = 1), v34)) {
      radix_tree_lookup_recursive_cold_9();
    }
    if (!v32) {
      goto LABEL_79;
    }
    BOOL v35 = v31 < v13 || v31 - v13 >= v9;
    BOOL v36 = !v35;
    if (v35)
    {
      BOOL v34 = v33 >= v13;
      unint64_t v37 = v33 - v13;
      BOOL v38 = !v34 || v37 >= v9;
      if (v38 && (v13 < v31 || v13 - v31 >= v32) && (v45 < v31 || v45 - v31 >= v32)) {
        goto LABEL_79;
      }
    }

    v39 = (unint64_t *)(a1 + 12LL * *(unsigned __int16 *)((char *)a6 + v28 + 10) + 20);
    if ((v29 & 0x80000000) == 0)
    {
      uint64_t result = radix_tree_lookup_recursive(a1, v13, v9);
      if (a8[2] != -1LL) {
        return result;
      }
      unint64_t v40 = a8[3];
      BOOL v34 = v40 >= a4;
      unint64_t v41 = v40 - a4;
      if (v34) {
        unint64_t v8 = v41;
      }
      else {
        unint64_t v8 = 0LL;
      }
      goto LABEL_79;
    }

    if (v30 != 52) {
      radix_tree_lookup_recursive_cold_8();
    }
    unint64_t v42 = (unint64_t)*(unsigned int *)(a1 + 12LL * *(unsigned __int16 *)((char *)a6 + v28 + 10) + 28) << *(_DWORD *)(a1 + 8);
    if (v42 > v32) {
      radix_tree_lookup_recursive_cold_7();
    }
    if (v42)
    {
      if (v36) {
        break;
      }
      unint64_t v43 = v31 - 1 + v42;
      BOOL v34 = v43 >= v13;
      unint64_t v44 = v43 - v13;
      if (v34 && v44 < v9) {
        break;
      }
      if (v13 >= v31 && v13 - v31 < v42 || v45 >= v31 && v45 - v31 < v42) {
        break;
      }
    }

    if (v31 >= a4) {
      unint64_t v8 = v31 - a4;
    }
    else {
      unint64_t v8 = 0LL;
    }
LABEL_79:
    v28 -= 6LL;
    if (v28 == -12)
    {
      *a8 = 0LL;
      a8[1] = 0LL;
      a8[2] = -1LL;
      a8[3] = v8 + a4;
      return result;
    }
  }

  *a8 = v31;
  a8[1] = v42;
  a8[2] = *v39;
  a8[3] = 0LL;
  return result;
}

uint64_t fixnode(unsigned int *a1)
{
  unsigned int v1 = *a1;
  int v2 = (*a1 >> 26) & 0x1F;
  if (!v2 || (v3 = *(unsigned int *)((char *)a1 + 6), (int v4 = (v3 >> 26) & 0x1F) == 0))
  {
    if ((v1 & 0x7C000000) == 0 && (*((_BYTE *)a1 + 9) & 0x7C) != 0) {
      goto LABEL_8;
    }
    return 0LL;
  }

  if ((v3 & 0x3FFFFFF) << (26 - v4) >= (v1 & 0x3FFFFFF) << (26 - v2)) {
    return 0LL;
  }
LABEL_8:
  __int16 v6 = *((_WORD *)a1 + 2);
  unsigned int v7 = *a1;
  *a1 = *(unsigned int *)((char *)a1 + 6);
  *((_WORD *)a1 + 2) = *((_WORD *)a1 + 5);
  *(unsigned int *)((char *)a1 + 6) = v7;
  *((_WORD *)a1 + 5) = v6;
  return 1LL;
}

uint64_t radix_tree_allocate_node(mach_vm_address_t *a1)
{
  uint64_t v2 = *a1;
  if (!*(_DWORD *)(v2 + 16))
  {
    unint64_t v3 = radix_tree_size(v2);
    mach_vm_size_t v4 = v3 <= 0x60000 ? 2 * v3 : 786432LL;
    if (v4 > v3)
    {
      mach_vm_size_t v5 = v3;
      mach_vm_address_t pages = sld_allocate_pages(v4);
      if (pages)
      {
        mach_vm_address_t v7 = pages;
        unint64_t v8 = (vm_map_t *)MEMORY[0x1895FFD48];
        if (mach_vm_copy(*MEMORY[0x1895FFD48], *a1, v5, pages))
        {
          mach_vm_deallocate(*v8, v7, v4);
        }

        else
        {
          uint64_t v9 = *(unsigned __int16 *)(*a1 + 12);
          mach_vm_deallocate(*v8, *a1, v5);
          *a1 = v7;
          *(_WORD *)(v7 + 12) = ((v4 & 0x1FFFFC) - 20) / 0xC;
          *(_DWORD *)(v7 + 16) = v9;
          *(_BYTE *)(v7 + 12 * v9 + 22) = 0;
          *(_WORD *)(*a1 + 12 * v9 + 20) = v9 + 1;
        }
      }
    }
  }

  mach_vm_address_t v10 = *a1;
  uint64_t v11 = *(unsigned int *)(*a1 + 16);
  if (!(_DWORD)v11) {
    return v11;
  }
  unsigned int v12 = *(unsigned __int16 *)(v10 + 12);
  unint64_t v13 = (unsigned __int16 *)(v10 + 12LL * (unsigned __int16)v11 + 20);
  unsigned int v14 = *v13;
  *(_DWORD *)(v10 + 16) = v14;
  if (!v14 || *(_BYTE *)(v10 + 12LL * (unsigned __int16)v11 + 22))
  {
LABEL_19:
    bzero(v13, 0xCuLL);
    return v11;
  }

  if (v12 >= v14)
  {
    mach_vm_address_t v15 = v10 + 12LL * v14;
    if (v14 + 1 < v12) {
      __int16 v16 = v14 + 1;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)(v15 + 20) = v16;
    goto LABEL_19;
  }

  uint64_t v18 = radix_tree_panic("radix tree is corrupt, next_free=%d num_nodes=%d\n", v14, v12);
  return radix_tree_free_node(v18, v19);
}

uint64_t radix_tree_free_node(uint64_t result, int a2)
{
  uint64_t v2 = result + 12LL * (unsigned __int16)a2;
  *(_WORD *)(v2 + 20) = *(_DWORD *)(result + 16);
  *(_BYTE *)(v2 + 22) = 1;
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t uniquing_table_unwind_stack_remote( uint64_t result, unsigned int a2, uint64_t a3, _DWORD *a4, unsigned int a5)
{
  if (!result)
  {
LABEL_27:
    LODWORD(v6) = 0;
    goto LABEL_28;
  }

  if (a5 >= 0x200) {
    uint64_t v6 = 512LL;
  }
  else {
    uint64_t v6 = a5;
  }
  if ((_DWORD)v6)
  {
    uint64_t v7 = 0LL;
    char v8 = *(_BYTE *)(result + 60);
    int v9 = -1;
    while (1)
    {
      if (a2 == v9) {
        break;
      }
      uint64_t v10 = *(void *)(result + 44);
      if (!v10) {
        goto LABEL_24;
      }
      if (*(_DWORD *)v10 < a2)
      {
        int v11 = 0;
        while (1)
        {
          uint64_t v10 = *(void *)(v10 + 24);
          if (!v10) {
            break;
          }
          v11 += *(_DWORD *)v10;
          if (*(_DWORD *)v10 + v11 >= a2) {
            goto LABEL_17;
          }
        }

LABEL_24:
        uint64_t result = msl_printf(3LL);
LABEL_25:
        LODWORD(v6) = v7;
        goto LABEL_28;
      }

      int v11 = 0;
LABEL_17:
      uint64_t v12 = *(void *)(v10 + 16);
      if (!v12) {
        goto LABEL_24;
      }
      uint64_t v13 = v12 + 16LL * (a2 - v11);
      if ((v8 & 2) != 0)
      {
        if (*(void *)(v13 + 8) < 0x10000uLL) {
          goto LABEL_25;
        }
        *(void *)(a3 + 8 * v7) = *(void *)v13 & 0xFFFFFFFFFFFFLL;
        unsigned int v14 = *(_DWORD *)(v13 + 6);
      }

      else
      {
        atomic_load((unsigned int *)(v13 + 12));
        *(void *)(a3 + 8 * v7) = *(void *)v13;
        unsigned int v14 = *(_DWORD *)(v13 + 8);
      }

      ++v7;
      int v9 = a2;
      a2 = v14;
      if (v7 == v6) {
        goto LABEL_28;
      }
    }

    uint64_t result = msl_printf(3LL);
    goto LABEL_27;
  }

LABEL_28:
  *a4 = v6;
  return result;
}

  msl_printf(3LL);
  int v11 = 0LL;
  *(_BYTE *)__stack_log_file_path__ = 0;
  return v11;
}

unint64_t *uniquing_table_clone_from_task(vm_map_read_t a1, mach_vm_address_t a2)
{
  vm_offset_t data = 0LL;
  mach_msg_type_number_t dataCnt = 0;
  mach_vm_size_t v3 = (*MEMORY[0x189600148] + 67LL) & -*MEMORY[0x189600148];
  mach_error_t v4 = mach_vm_read(a1, a2, v3, &data, &dataCnt);
  if (v4)
  {
    mach_error_t v5 = v4;
    uint64_t v6 = (FILE *)*MEMORY[0x1895FEE10];
    uint64_t v7 = mach_error_string(v4);
    fprintf(v6, "error while attempting to mach_vm_read remote stack uniquing table (%d): %s\n", v5, v7);
    return 0LL;
  }

  else
  {
    if (v3 == dataCnt)
    {
      int v9 = (unint64_t *)malloc(0x44uLL);
      char v8 = v9;
      if (v9)
      {
        uint64_t v10 = (_OWORD *)data;
        __int128 v11 = *(_OWORD *)(data + 48);
        *((_OWORD *)v9 + 2) = *(_OWORD *)(data + 32);
        *((_OWORD *)v9 + 3) = v11;
        __int128 v12 = v10[1];
        *(_OWORD *)int v9 = *v10;
        *((_OWORD *)v9 + 1) = v12;
        *(unint64_t *)((char *)v9 + 44) = 0LL;
        uint64_t v13 = (unint64_t *)((char *)v9 + 44);
        *((_DWORD *)v9 + 16) = 1;
        unint64_t v14 = v9[2];
        if (v14)
        {
          mach_vm_address_t v15 = v9[4];
          do
          {
            vm_offset_t v27 = 0LL;
            mach_msg_type_number_t v26 = 0;
            if (v14 >= 0x80000000) {
              mach_vm_size_t v16 = 0x80000000LL;
            }
            else {
              mach_vm_size_t v16 = v14;
            }
            while (1)
            {
              mach_error_t v17 = mach_vm_read(a1, v15, v16, &v27, &v26);
              if (!v17) {
                break;
              }
              BOOL v18 = v16 > 0x200001;
              v16 >>= 1;
              if (!v18)
              {
                mach_error_t v22 = v17;
                BOOL v23 = (FILE *)*MEMORY[0x1895FEE10];
                unint64_t v24 = mach_error_string(v17);
                fprintf( v23,  "error while attempting to mach_vm_read remote stack uniquing table contents (%d): %s\n",  v22,  v24);
                free_uniquing_table_chunks((uint64_t)v8);
                free(v8);
                goto LABEL_15;
              }
            }

            int v19 = malloc(0x20uLL);
            *uint64_t v13 = v19;
            uint64_t v20 = v26;
            *(_DWORD *)int v19 = v26 >> 4;
            vm_offset_t v21 = v27;
            v19[1] = v20;
            v19[2] = v21;
            v19[3] = 0LL;
            v15 += v20;
            uint64_t v13 = v19 + 3;
            v14 -= v20;
          }

          while (v14);
        }
      }
    }

    else
    {
LABEL_15:
      char v8 = 0LL;
    }

    mach_vm_deallocate(*MEMORY[0x1895FFD48], data, dataCnt);
  }

  return v8;
}

void free_uniquing_table_chunks(uint64_t a1)
{
  unsigned int v1 = *(mach_vm_size_t **)(a1 + 44);
  if (v1)
  {
    uint64_t v2 = (vm_map_t *)MEMORY[0x1895FFD48];
    do
    {
      mach_vm_deallocate(*v2, v1[2], v1[1]);
      mach_vm_size_t v3 = (mach_vm_size_t *)v1[3];
      free(v1);
      unsigned int v1 = v3;
    }

    while (v3);
  }
}

void *uniquing_table_chunk_from_slots(mach_vm_address_t a1, unsigned int a2)
{
  mach_error_t v4 = malloc(0x20uLL);
  mach_error_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)mach_error_t v4 = a2;
    mach_vm_size_t v6 = 16LL * a2;
    v4[1] = v6;
    v4[3] = 0LL;
    mach_vm_address_t address = 0LL;
    uint64_t v7 = (vm_map_t *)MEMORY[0x1895FFD48];
    if (mach_vm_allocate(*MEMORY[0x1895FFD48], &address, v6, 167772161) || mach_vm_copy(*v7, a1, v6, address))
    {
      free(v5);
      return 0LL;
    }

    else
    {
      v5[2] = address;
    }
  }

  return v5;
}

uint64_t uniquing_table_remote_retain(uint64_t result)
{
  if (!result) {
    uniquing_table_remote_retain_cold_1();
  }
  int v1 = *(_DWORD *)(result + 64);
  if (!v1) {
    uniquing_table_remote_retain_cold_2();
  }
  *(_DWORD *)(result + 64) = v1 + 1;
  return result;
}

void uniquing_table_remote_release(_DWORD *a1)
{
  if (a1)
  {
    int v2 = a1[16];
    if (!v2) {
      uniquing_table_remote_release_cold_1();
    }
    int v3 = v2 - 1;
    a1[16] = v3;
    if (!v3)
    {
      free_uniquing_table_chunks((uint64_t)a1);
      free(a1);
    }
  }

uint64_t uniquing_table_remote_enumerate_chunks(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (!a2) {
      uniquing_table_remote_enumerate_chunks_cold_1();
    }
  }

  return result;
}

uint64_t uniquing_table_create(unsigned int a1, unsigned int a2)
{
  if (a2 < a1) {
    return 0LL;
  }
  int v2 = (void *)MEMORY[0x189600148];
  unint64_t v3 = 16 * (unint64_t)a1 / *MEMORY[0x189600148] * *MEMORY[0x189600148] <= 0x100000
     ? 0x100000LL
     : 16 * (unint64_t)a1 / *MEMORY[0x189600148] * *MEMORY[0x189600148];
  unint64_t v4 = 16 * (unint64_t)a2 / *MEMORY[0x189600148] * *MEMORY[0x189600148];
  if (v3 > v4) {
    return 0LL;
  }
  if (dword_18C6887A8
    || (bzero(&global_stack_uniquing_state, 0x2828uLL),
        qword_18C687F88 = (uint64_t)&global_stack_uniquing_state,
        qword_18C687F90 = (uint64_t)&global_stack_uniquing_state + 4104,
        dword_18C6887A8 = 1,
        pthread_key_create( (pthread_key_t *)&global_stack_uniquing_state + 1285,  (void (__cdecl *)(void *))msl_tsd_destroy)))
  {
    if (!dword_18C6887AC) {
      msl_printf(3LL);
    }
  }

  else
  {
    dword_18C6887AC = 1;
  }

  mach_vm_address_t pages = (void *)sld_allocate_pages((*v2 + 1679LL) & -*v2);
  uint64_t v5 = (uint64_t)pages;
  if (pages)
  {
    bzero(pages, 0x690uLL);
    unint64_t v8 = 0LL;
    uint64_t v9 = 96LL;
    do
    {
      *(void *)(v5 + v9) = v3;
      unint64_t v10 = 4 * v3;
      if (4 * v3 <= v3) {
        break;
      }
      if (v8 > 8) {
        break;
      }
      ++v8;
      v9 += 160LL;
      v3 *= 4LL;
    }

    while (v10 <= v4);
    uniquing_table_initialize(v5);
  }

  return v5;
}

mach_vm_address_t msl_tsd_destroy(mach_vm_address_t result)
{
  if (result) {
    return sld_deallocate_pages(result, 0x2828uLL);
  }
  return result;
}

uint64_t uniquing_table_initialize(uint64_t a1)
{
  mach_vm_size_t v2 = *(void *)(a1 + 96);
  uint64_t result = sld_allocate_pages(v2);
  *(void *)(a1 + 72) = result;
  uint64_t v4 = (v2 >> 4) & 0xFFFFFFFFFFFFFFELL;
  *(_DWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 84) = v4;
  *(_DWORD *)(a1 + 88) = 19;
  uint64_t v5 = (unsigned int *)(a1 + 224);
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));
  *(void *)(a1 + 16) = v2;
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a1 + 60) & 0xF9 | 4;
  *(void *)(a1 + 52) = *(void *)(a1 + 1536);
  *(void *)(a1 + 32) = result;
  *(void *)a1 = v2 / *MEMORY[0x189600148];
  *(void *)(a1 + 8) = v4;
  do
  {
    unsigned int v7 = __ldxr((unsigned int *)&uniquing_table_initialize_process_wide_generation);
    unsigned int v8 = v7 + 1;
  }

  while (__stxr(v8, (unsigned int *)&uniquing_table_initialize_process_wide_generation));
  *(_DWORD *)(a1 + 1676) = v8;
  atomic_store(0, (unsigned int *)(a1 + 1672));
  return result;
}

uint64_t uniquing_table_is_husk(uint64_t result)
{
  if (result)
  {
    unsigned int v1 = atomic_load((unsigned int *)(result + 1672));
    return v1 >> 31;
  }

  return result;
}

uint64_t uniquing_table_destroy_husk_exclusive(mach_vm_address_t a1)
{
  return sld_deallocate_pages(a1, 0x690uLL);
}

void uniquing_table_deinitialize(uint64_t a1, int a2)
{
  if (a1)
  {
    if (!a2) {
      __malloc_lock_stack_logging();
    }
    unsigned int v4 = atomic_load((unsigned int *)(a1 + 1672));
    if ((v4 & 0x80000000) == 0)
    {
      atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 1672));
      uniquing_table_release(a1 + 160LL * v4 + 72, 1);
      if (a2) {
        return;
      }
LABEL_8:
      __malloc_unlock_stack_logging();
      return;
    }

    msl_printf(3LL);
    if (!a2) {
      goto LABEL_8;
    }
  }

void uniquing_table_release(uint64_t a1, int a2)
{
  unsigned int v4 = (unsigned int *)(a1 + 152);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5) {
    uniquing_table_release_cold_1();
  }
  if (v5 == 1)
  {
    if (!a2) {
      __malloc_lock_stack_logging();
    }
    if (atomic_load(v4)) {
      uniquing_table_release_cold_2();
    }
    sld_deallocate_pages(*(void *)a1, *(void *)(a1 + 24));
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(_DWORD *)(a1 + 16) = 0;
    if (!a2) {
      __malloc_unlock_stack_logging();
    }
  }

uint64_t uniquing_table_stack_retain(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  if (!a1) {
    return 0LL;
  }
  int v14 = 0;
  hash_cache = msl_get_hash_cache(a3, &v14);
  int v9 = v14;
  thread_stack_pcs();
  uint64_t v10 = hash_cache[1026];
  if (*(_DWORD *)(v10 + 4096) <= (a2 + 2))
  {
    *a4 = -1;
LABEL_9:
    uint64_t v12 = 0LL;
    if (!v9) {
      return v12;
    }
    goto LABEL_5;
  }

  *(_DWORD *)(v10 + 4100) = a2 + 2;
  int v11 = uniquing_table_stack_retain_internal(a1, (uint64_t)hash_cache, v9 | a3);
  *a4 = v11;
  if (v11 == -1) {
    goto LABEL_9;
  }
  uint64_t v12 = 1LL;
  if (v9) {
LABEL_5:
  }
    __malloc_unlock_stack_logging();
  return v12;
}

void *msl_get_hash_cache(int a1, _DWORD *a2)
{
  if (!dword_18C6887AC) {
    return 0LL;
  }
  unsigned int v4 = pthread_getspecific(qword_18C6887A0);
  if (!v4)
  {
    if (pthread_self_is_exiting_np())
    {
      if (!a1)
      {
        __malloc_lock_stack_logging();
        *a2 = 1;
      }

      return &global_stack_uniquing_state;
    }

    else
    {
      mach_vm_address_t pages = (void *)sld_allocate_pages(0x2828uLL);
      if (!pages) {
        msl_get_hash_cache_cold_1();
      }
      unsigned int v4 = pages;
      bzero(pages, 0x2828uLL);
      v4[1026] = v4;
      v4[1027] = v4 + 513;
      pthread_setspecific(qword_18C6887A0, v4);
    }
  }

  return v4;
}

uint64_t uniquing_table_stack_retain_internal(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2;
  unsigned int v117 = *(_DWORD *)(*(void *)(a2 + 8208) + 4100LL);
  uint64_t v5 = uniquing_table_retain(a1);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)(v3 + 8208);
  uint64_t v9 = *(unsigned int *)(v8 + 4096);
  char v122 = *(_BYTE *)(a1 + 60);
  if ((v122 & 4) != 0)
  {
    int v10 = *(_DWORD *)(a1 + 1676);
    if (*(_DWORD *)(v3 + 10276) == v10)
    {
      if (*(_DWORD *)(v3 + 10272) == -1) {
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(v3 + 8216);
      uint64_t v12 = *(unsigned int *)(v11 + 4096);
      int v13 = v12 - *(_DWORD *)(v11 + 4100);
      if (v13 < 1) {
        goto LABEL_17;
      }
      uint64_t v14 = (v13 + 1);
      int v15 = ~v13;
      mach_vm_size_t v16 = (uint64_t *)(v8 + 8 * v9 - 8);
      mach_error_t v17 = (uint64_t *)(v11 + 8 * v12 - 8);
      uint64_t v18 = 1LL;
      while (1)
      {
        uint64_t v20 = *v17--;
        uint64_t v19 = v20;
        uint64_t v21 = *v16--;
        if (v19 != v21) {
          break;
        }
        if (v14 == ++v18) {
          goto LABEL_14;
        }
      }

      int v15 = -(int)v18;
      LODWORD(v14) = v18;
LABEL_14:
      uint64_t v9 = (v9 + v15 + 1);
      BOOL v23 = v14 >= 2;
      unsigned int v24 = v14 - 2;
      if (v23) {
        uint64_t v22 = *(unsigned int *)(v3 + 4LL * v24 + 8224);
      }
      else {
LABEL_17:
      }
        uint64_t v22 = 0xFFFFFFFFLL;
    }

    else
    {
      bzero(*(void **)(v3 + 8216), 0x1008uLL);
      LODWORD(__pattern4) = -1;
      memset_pattern4((void *)(v3 + 8224), &__pattern4, 0x800uLL);
      *(_DWORD *)(v3 + 10272) = -1;
      *(_DWORD *)(v3 + 10276) = v10;
      uint64_t v22 = 0xFFFFFFFFLL;
      uint64_t v9 = *(unsigned int *)(*(void *)(v3 + 8208) + 4096LL);
    }

    if (v9 <= v117)
    {
      v106 = (unsigned __int128 *)(*(void *)v7 + 16LL * v22);
      do
        unsigned __int128 v107 = __ldxp(v106);
      while (__stxp(__PAIR128__(*((void *)&v107 + 1) + 0x100000000LL, v107), v106));
      if (!HIDWORD(*((void *)&v107 + 1))) {
        uniquing_table_stack_retain_internal_cold_14();
      }
      if ((*((void *)&v107 + 1) & 0x8000000000000000LL) != 0)
      {
        do
          unsigned __int128 v109 = __ldxp(v106);
        while (__stxp(__PAIR128__(*((void *)&v109 + 1) - 0x100000000LL, v109), v106));
      }

      uniquing_table_release(v7, a3);
      return v22;
    }
  }

  else
  {
    uint64_t v22 = 0xFFFFFFFFLL;
  }

  uint64_t v124 = v3 + 8224;
  v120 = (unsigned int *)((unint64_t)&__pattern4 | 0xC);
  uint64_t v114 = a1;
  uint64_t v115 = v3;
  while (2)
  {
    int v26 = *(_DWORD *)(v7 + 8);
    int v25 = *(_DWORD *)(v7 + 12);
    uint64_t v27 = *(void *)(v3 + 8208);
    uint64_t v125 = *(unsigned int *)(v27 + 4096);
    uint64_t v128 = v27;
    unsigned int v28 = *(_DWORD *)(v27 + 4100);
    int v29 = *(_DWORD *)(v7 + 16);
    uint64_t v30 = *(void *)v7;
    if ((v122 & 4) == 0 && (_DWORD)v22 != -1) {
      uniquing_table_stack_retain_internal_cold_1();
    }
    if ((_DWORD)v22 != -1)
    {
      unint64_t v31 = (unsigned __int128 *)(v30 + 16LL * v22);
      do
        unsigned __int128 v32 = __ldxp(v31);
      while (__stxp(v32, v31));
      if (!HIDWORD(*((void *)&v32 + 1))) {
        uniquing_table_stack_retain_internal_cold_11();
      }
    }

    if ((v122 & 4) != 0) {
      uint64_t v33 = *(unsigned int *)(v3 + 10272);
    }
    else {
      uint64_t v33 = 0xFFFFFFFFLL;
    }
    uint64_t v118 = v9;
    unsigned int v116 = v22;
    if (v28 >= v9)
    {
      uint64_t v36 = v22;
      uint64_t v35 = v9;
      goto LABEL_152;
    }

    unsigned int v34 = v25 - v26;
    unint64_t v126 = (v25 - v26 - 1);
    uint64_t v35 = v9;
    uint64_t v36 = v22;
    uint64_t v37 = v9;
    uint64_t v38 = v22;
    unsigned int v123 = v34 / ((2 * v29) | 1u);
    do
    {
      uint64_t v9 = (v37 - 1);
      int v39 = *(_DWORD *)(v7 + 16);
      if (!v39)
      {
        uint64_t v22 = v38;
        uint64_t v9 = v37;
        break;
      }

      unsigned int v127 = v35;
      uint64_t v40 = 2LL * (v9 <= v28);
      unint64_t v41 = *(void *)(v128 + 8LL * v9);
      uint64_t v22 = *(_DWORD *)(v7 + 8) + (((16 * v38) ^ (v41 >> 2)) % v126);
      else {
        unsigned int v42 = 2 * (v9 <= v28);
      }
      unint64_t v43 = (unsigned __int128 *)(v30 + 16LL * v38);
      uint64_t v5 = (_DWORD)v38 == -1 || (_DWORD)v33 == (_DWORD)v38;
LABEL_41:
      --v39;
      unint64_t v45 = (unsigned __int128 *)(v30 + 16LL * v22);
      do
      {
        unsigned __int128 v47 = __ldxp(v45);
        unsigned int v46 = DWORD2(v47);
        uint64_t v6 = v47;
      }

      while (__stxp(v47, v45));
      BOOL v48 = 0;
      uint64_t v49 = HIDWORD(*((void *)&v47 + 1));
      while (1)
      {
        uint64_t v50 = v49;
        BOOL v51 = v49 == 0;
        if ((_DWORD)v50)
        {
          if ((_DWORD)v38 != -1 && v48)
          {
            do
              unsigned __int128 v52 = __ldxp(v43);
            while (__stxp(__PAIR128__(*((void *)&v52 + 1) - 0x100000000LL, v52), v43));
            if (!HIDWORD(*((void *)&v52 + 1))) {
              uniquing_table_stack_retain_internal_cold_8(v5, v33, v6);
            }
          }

          BOOL v54 = v6 != v41 || v46 != (_DWORD)v38;
          if (!(_DWORD)v40 || v54)
          {
            if (!v54)
            {
              uint64_t v5 = v33;
              uint64_t v35 = v127;
LABEL_111:
              *(_DWORD *)(v124 + 4LL * (v125 - v37)) = v22;
              uint64_t v33 = v5;
              goto LABEL_141;
            }

            uint64_t v22 = v22 + v39 * v123 + 1;
            unsigned int v69 = *(_DWORD *)(v7 + 12);
            BOOL v23 = v22 >= v69;
            int v70 = v22 - v69;
            if (v23) {
              uint64_t v22 = (v70 + *(_DWORD *)(v7 + 8));
            }
            if (!v39)
            {
              uint64_t v22 = v38;
              uint64_t v9 = v37;
              uint64_t v35 = v127;
              goto LABEL_152;
            }

            goto LABEL_41;
          }

          goto LABEL_56;
        }

LABEL_57:
        unint64_t v55 = v46 | (unint64_t)(v50 << 32);
        do
        {
          while (1)
          {
            unsigned __int128 v56 = __ldxp(v45);
            unsigned int v46 = DWORD2(v56);
            int v57 = (void)v56 != v6;
            if (*((void *)&v56 + 1) != v55) {
              ++v57;
            }
            if (!v57) {
              break;
            }
            if (!__stxp(v56, v45)) {
              goto LABEL_64;
            }
          }
        }

        while (__stxp(__PAIR128__(v38 | ((unint64_t)(v50 + v42) << 32), v41), v45));
LABEL_64:
        uint64_t v49 = HIDWORD(*((void *)&v56 + 1));
        BOOL v58 = *((void *)&v56 + 1) == v55 && (void)v56 == v6;
        uint64_t v6 = v56;
        if (v58)
        {
          if ((_DWORD)v50) {
            uint64_t v71 = 4294967293LL;
          }
          else {
            uint64_t v71 = v42;
          }
          int v72 = v71;
LABEL_107:
          if ((_DWORD)v38 == (_DWORD)v36)
          {
LABEL_108:
            uint64_t v5 = v22;
            uint64_t v36 = v22;
            uint64_t v35 = (v37 - 1);
            if (v72 != -3)
            {
              uint64_t v5 = v22;
              uint64_t v36 = v22;
              uint64_t v35 = (v37 - 1);
              if ((_DWORD)v33 != (_DWORD)v38)
              {
                uniquing_table_node_release_internal(v7, v33);
                uint64_t v5 = v22;
                uint64_t v36 = v22;
                uint64_t v35 = (v37 - 1);
              }
            }

            goto LABEL_111;
          }

          v73 = (uint64_t *)(v128 + 8LL * v37);
          unsigned int v74 = v38;
          while ((unint64_t)v73 < v128 + 8 * v125)
          {
            if (v74 == -1) {
              break;
            }
            v75 = (unsigned __int128 *)(v30 + 16LL * v74);
            do
            {
              unsigned __int128 v76 = __ldxp(v75);
              unsigned int v74 = DWORD2(v76);
              uint64_t v6 = __stxp(v76, v75);
            }

            while ((_DWORD)v6);
            uint64_t v5 = HIDWORD(*((void *)&v76 + 1));
            if (!HIDWORD(*((void *)&v76 + 1))) {
              break;
            }
            uint64_t v5 = *v73;
            if (*v73 != (void)v76) {
              break;
            }
            ++v73;
            if ((_DWORD)v36 == DWORD2(v76)) {
              goto LABEL_108;
            }
          }

          if (v72 != -3) {
            uint64_t v40 = v71;
          }
          if ((_DWORD)v22 != -1)
          {
            do
            {
              unsigned __int128 v77 = __ldxp(v45);
              uint64_t v5 = __stxp(__PAIR128__(*((void *)&v77 + 1) - (v40 << 32), v77), v45);
            }

            while ((_DWORD)v5);
            if (v72 != -3)
            {
              BOOL v79 = HIDWORD(v77) != (_DWORD)v40 || (_DWORD)v33 == (_DWORD)v38 || (_DWORD)v38 == -1;
              uint64_t v35 = v127;
              if (!v79)
              {
                do
                  unsigned __int128 v80 = __ldxp(v43);
                while (__stxp(__PAIR128__(*((void *)&v80 + 1) - 0x100000000LL, v80), v43));
                uint64_t v22 = v36;
                uint64_t v9 = v127;
                if (!HIDWORD(*((void *)&v80 + 1))) {
                  uniquing_table_stack_retain_internal_cold_8(v5, v33, v6);
                }
                goto LABEL_141;
              }

              uint64_t v22 = v36;
LABEL_140:
              uint64_t v9 = v35;
              goto LABEL_141;
            }
          }

          uint64_t v22 = v36;
LABEL_138:
          uint64_t v35 = v127;
          goto LABEL_140;
        }
      }

      do
      {
        unsigned __int128 v61 = __ldxp(v43);
        unsigned int v60 = DWORD2(v61);
        uint64_t v59 = v61;
      }

      while (__stxp(v61, v43));
      uint64_t v62 = HIDWORD(*((void *)&v61 + 1));
      if (HIDWORD(v61))
      {
        unsigned int v110 = v5;
        unsigned int v111 = v28;
        while ((v62 & 0x80000000) == 0)
        {
          *(void *)&unsigned __int128 __pattern4 = v59;
          *((void *)&__pattern4 + 1) = __PAIR64__(v62, v60);
          unsigned int v113 = v62;
          do
            unsigned int v63 = __ldaxr(v120);
          while (__stlxr(v63 + 1, v120));
          do
            unsigned __int128 v64 = __ldaxp(&__pattern4);
          while (__stlxp(v64, &__pattern4));
          do
          {
            while (1)
            {
              unsigned __int128 v65 = __ldxp(v43);
              int v66 = (void)v65 != v59;
              if (!v66) {
                break;
              }
              if (!__stxp(v65, v43)) {
                goto LABEL_84;
              }
            }
          }

          while (__stxp(v64, v43));
LABEL_84:
          unint64_t v112 = v65 ^ v59 | *((void *)&v65 + 1) ^ (v60 | ((unint64_t)v113 << 32));
          if (v112) {
            unsigned int v67 = HIDWORD(v65);
          }
          else {
            unsigned int v67 = v113;
          }
          if (v112)
          {
            unsigned int v60 = DWORD2(v65);
            uint64_t v59 = v65;
          }

          LODWORD(v62) = v67;
          if (v112) {
            BOOL v68 = v67 == 0;
          }
          else {
            BOOL v68 = 1;
          }
          uint64_t v5 = v110;
          unsigned int v28 = v111;
          if (v68)
          {
            if (!v112) {
              break;
            }
            goto LABEL_144;
          }
        }

LABEL_56:
        BOOL v48 = v51;
        if ((v50 & 0x80000000) != 0)
        {
          uint64_t v71 = 4294967293LL;
          int v72 = -3;
          goto LABEL_107;
        }

        goto LABEL_57;
      }

LABEL_144:
      if ((_DWORD)v36 == -1)
      {
        uint64_t v22 = 0xFFFFFFFFLL;
        goto LABEL_138;
      }

      v81 = (unsigned __int128 *)(v30 + 16LL * v36);
      uint64_t v35 = v127;
      do
        unsigned __int128 v82 = __ldxp(v81);
      while (__stxp(v82, v81));
      uint64_t v22 = v36;
      uint64_t v9 = v127;
      if (!HIDWORD(*((void *)&v82 + 1))) {
        uniquing_table_stack_retain_internal_cold_11();
      }
LABEL_141:
      uint64_t v37 = v9;
      uint64_t v38 = v22;
    }

    while (v9 > v28);
LABEL_152:
    if ((v122 & 4) != 0)
    {
      uint64_t v83 = v114;
      uint64_t v3 = v115;
      *(_DWORD *)(v115 + 10272) = v33;
      if (v9 > v28)
      {
        uint64_t v22 = v36;
        uint64_t v9 = v35;
        goto LABEL_164;
      }
    }

    else
    {
      uint64_t v83 = v114;
      uint64_t v3 = v115;
      if ((_DWORD)v33 != -1)
      {
        v84 = (unsigned __int128 *)(v30 + 16LL * v33);
        do
          unsigned __int128 v85 = __ldxp(v84);
        while (__stxp(__PAIR128__(*((void *)&v85 + 1) - 0x100000000LL, v85), v84));
        if (!HIDWORD(*((void *)&v85 + 1))) {
          uniquing_table_stack_retain_internal_cold_8(v5, v33, v6);
        }
      }

      if (v9 > v28)
      {
        uint64_t v9 = v118;
        uint64_t v22 = v116;
        if (*(_DWORD *)(*(void *)(v115 + 8208) + 4096LL) != (_DWORD)v118) {
          uniquing_table_stack_retain_internal_cold_5();
        }
        goto LABEL_164;
      }
    }

    if ((_DWORD)v22 != (_DWORD)v36) {
      uniquing_table_stack_retain_internal_cold_7();
    }
    if ((_DWORD)v9 != (_DWORD)v35) {
      uniquing_table_stack_retain_internal_cold_6();
    }
LABEL_164:
    if (v9 > v117)
    {
      uint64_t v86 = v22;
      if (!a3) {
        __malloc_lock_stack_logging();
      }
      signed int v87 = atomic_load((unsigned int *)(v83 + 1672));
      uint64_t v88 = v83 + 160LL * v87 + 72;
      uniquing_table_release(v7, 1);
      if (v7 != v88)
      {
        uint64_t v5 = uniquing_table_retain(v83);
        uint64_t v7 = v5;
        goto LABEL_178;
      }

      uint64_t v89 = atomic_load((unsigned int *)(v83 + 1672));
      if ((v89 & 0x80000000) != 0) {
        uniquing_table_stack_retain_internal_cold_3();
      }
      if (v89 >= 9)
      {
        uint64_t v5 = msl_printf(3LL);
        uint64_t v7 = 0LL;
        goto LABEL_178;
      }

      uint64_t v119 = v9;
      uint64_t v90 = v83 + 160LL * v89;
      mach_vm_address_t v93 = *(void *)(v90 + 72);
      uint64_t v92 = v90 + 72;
      mach_vm_address_t v91 = v93;
      mach_vm_size_t v94 = *(void *)(v92 + 24);
      int v95 = *(_DWORD *)(v92 + 12);
      int v129 = *(_DWORD *)(v92 + 16);
      uint64_t v96 = v89 + 1;
      uint64_t v97 = v83 + 160 * (v89 + 1);
      mach_vm_size_t v98 = *(void *)(v97 + 96);
      uint64_t pages = sld_allocate_pages(v98);
      *(void *)&unsigned __int128 __pattern4 = pages;
      if (pages)
      {
        mach_vm_address_t v100 = pages;
        if (mach_vm_remap( *MEMORY[0x1895FFD48],  (mach_vm_address_t *)&__pattern4,  v94,  0LL,  0x4000,  *MEMORY[0x1895FFD48],  v91,  0,  cur_protection,  &max_protection,  1u))
        {
          msl_printf(3LL);
          uint64_t v5 = sld_deallocate_pages(v100, v98);
          goto LABEL_177;
        }

        uint64_t v101 = (v98 >> 4) & 0xFFFFFFFFFFFFFFELL;
        *(void *)(v97 + 72) = v100;
        v102 = (_DWORD *)(v114 + 160 * v96);
        v102[20] = v95;
        v102[21] = v101;
        v102[22] = v129 + 3;
        v103 = v102 + 56;
        do
          unsigned int v104 = __ldaxr(v103);
        while (__stlxr(v104 + 1, v103));
        *(void *)(v114 + 32) = v100;
        uint64_t v105 = v114;
        *(void *)(v114 + 16) = v98;
        *(void *)uint64_t v114 = v98 / *MEMORY[0x189600148];
        *(void *)(v114 + 8) = v101;
        atomic_store(v96, (unsigned int *)(v114 + 1672));
        uniquing_table_release(v92, 1);
        uint64_t v5 = uniquing_table_retain(v105);
        uint64_t v7 = v5;
        uint64_t v3 = v115;
        uint64_t v9 = v119;
      }

      else
      {
        uint64_t v5 = msl_printf(3LL);
LABEL_177:
        uint64_t v7 = 0LL;
        uint64_t v3 = v115;
        uint64_t v9 = v119;
      }

LABEL_178:
      uint64_t v22 = v86;
      if (a3)
      {
        if (!v7) {
          return 0xFFFFFFFFLL;
        }
        continue;
      }

      __malloc_unlock_stack_logging();
      if (!v7) {
        return 0xFFFFFFFFLL;
      }
      continue;
    }

    break;
  }

  uniquing_table_release(v7, a3);
  if ((_DWORD)v22 == -1) {
    uniquing_table_stack_retain_internal_cold_4();
  }
  *(int8x16_t *)(v3 + 8208) = vextq_s8(*(int8x16_t *)(v3 + 8208), *(int8x16_t *)(v3 + 8208), 8uLL);
  return v22;
}

void uniquing_table_stack_release(uint64_t a1, unsigned int a2, int a3)
{
  if (a1)
  {
    if (a2 == -1)
    {
      msl_printf(3LL);
    }

    else
    {
      uint64_t v5 = uniquing_table_retain(a1);
      if (v5)
      {
        uint64_t v6 = v5;
        uniquing_table_node_release_internal(v5, a2);
        uniquing_table_release(v6, a3);
      }
    }
  }

uint64_t uniquing_table_retain(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 1672);
  while ((v1 & 0x80000000) == 0)
  {
    uint64_t v2 = a1 + 160 * v1;
    unsigned int v3 = *(_DWORD *)(v2 + 224);
    if (v3)
    {
      unsigned int v4 = (unsigned int *)(v2 + 224);
      do
      {
        unsigned int v5 = __ldaxr(v4);
        if (v5 == v3)
        {
          if (!__stlxr(v3 + 1, v4)) {
            break;
          }
        }

        else
        {
          __clrex();
        }

        unsigned int v3 = v5;
      }

      while (v5);
      if (v5) {
        return a1 + 160 * v1 + 72;
      }
    }

    BOOL v6 = *(unsigned int *)(a1 + 1672) == v1;
    uint64_t v1 = *(unsigned int *)(a1 + 1672);
    if (v6) {
      uniquing_table_retain_cold_1();
    }
  }

  return 0LL;
}

uint64_t uniquing_table_node_release_internal(uint64_t result, unsigned int a2)
{
  if (a2 != -1)
  {
    uint64_t v2 = 0LL;
    unint64_t v3 = *(unsigned int *)(result + 12);
    uint64_t v4 = 0xFFFFFFFFLL;
    unint64_t v5 = a2;
    while (1)
    {
      if (v5 == v4) {
        return msl_printf(3LL);
      }
      if (v2 == 512) {
        return msl_printf(3LL);
      }
      uint64_t v4 = v5;
      if (v5 >= v3) {
        return msl_printf(3LL);
      }
      BOOL v6 = (unsigned __int128 *)(*(void *)result + 16 * v5);
      do
        unsigned __int128 v7 = __ldxp(v6);
      while (__stxp(__PAIR128__(*((void *)&v7 + 1) - 0x100000000LL, v7), v6));
      if (HIDWORD(v7) != 1) {
        break;
      }
      unint64_t v5 = DWORD2(v7);
      ++v2;
      if (DWORD2(v7) == -1) {
        return result;
      }
    }

    if (!HIDWORD(v7)) {
      uniquing_table_node_release_internal_cold_1();
    }
  }

  return result;
}

uint64_t uniquing_table_node_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

uint64_t msl_get_lite_wrapped_zone()
{
  if (active_lite_zone) {
    return *(void *)(active_lite_zone + 200);
  }
  else {
    return 0LL;
  }
}

uint64_t msl_is_stack_logging_lite_enabled()
{
  return stack_logging_lite_enabled;
}

void enable_stack_logging_lite()
{
  stack_logging_lite_enabled = 1;
}

void disable_stack_logging_lite()
{
  stack_logging_lite_enabled = 0;
}

uint64_t create_and_insert_lite_zone(_BYTE *a1)
{
  *a1 = 0;
  if (active_lite_zone) {
    create_and_insert_lite_zone_cold_1();
  }
  mach_vm_size_t v2 = (*MEMORY[0x189600148] + 207LL) & -*MEMORY[0x189600148];
  uint64_t result = sld_allocate_pages(v2);
  if (result)
  {
    uint64_t v4 = (malloc_zone_t *)result;
    *(void *)uint64_t result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = stack_logging_lite_size;
    *(void *)(result + 24) = stack_logging_lite_malloc;
    *(void *)(result + 32) = stack_logging_lite_calloc;
    *(void *)(result + 40) = stack_logging_lite_valloc;
    *(void *)(result + 48) = stack_logging_lite_free;
    *(void *)(result + 56) = stack_logging_lite_realloc;
    *(void *)(result + 64) = stack_logging_lite_destroy;
    *(void *)(result + 72) = "MallocStackLoggingLiteZone_Wrapper";
    *(void *)(result + 80) = stack_logging_lite_batch_malloc;
    *(void *)(result + 88) = stack_logging_lite_batch_free;
    *(void *)(result + 96) = stack_logging_lite_zone_introspect;
    *(_DWORD *)(result + 104) = 15;
    *(void *)(result + 112) = stack_logging_lite_memalign;
    *(void *)(result + 120) = stack_logging_lite_free_definite_size;
    *(void *)(result + 128) = stack_logging_lite_pressure_relief;
    *(void *)(result + 136) = stack_logging_lite_claimed_address;
    *(void *)(result + 144) = 0LL;
    *(void *)(result + 152) = stack_logging_lite_malloc_with_options;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    zone = malloc_create_zone(0LL, 0x400u);
    malloc_zone_unregister(zone);
    v4[1].realloc = (void *(__cdecl *)(_malloc_zone_t *, void *, size_t))zone;
    active_lite_zone = (uint64_t)v4;
    uint64_t v6 = off_18C688C50();
    lite_helper_zone = v6;
    if (zone->version < 0xF || !zone[1].reserved2 || *(_DWORD *)(v6 + 104) < 0xFu || !*(void *)(v6 + 152)) {
      v4[1].reserved2 = 0LL;
    }
    mprotect(v4, v2, 1);
    malloc_zone_register(v4);
    malloc_zone_register(zone);
    malloc_set_zone_name(v4, "MallocStackLoggingLiteZone_Wrapper");
    malloc_set_zone_name(zone, "MallocStackLoggingLiteZone");
    uint64_t result = off_18C688C48(v4);
    *a1 = 1;
  }

  return result;
}

uint64_t stack_logging_lite_size(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16LL))();
  if (v3) {
    return v3 - msl_payload_get_size_info((void *)(v3 + a2 - 8), (unsigned int *)(v3 + a2 - 16), 0LL, 0LL) - 8;
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 16))(lite_helper_zone, a2);
  }
}

uint64_t stack_logging_lite_malloc(uint64_t a1, unint64_t a2)
{
  if (stack_logging_lite_enabled != 1) {
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 24))(lite_helper_zone, a2);
  }
  uint64_t v3 = *(void *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0) {
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 24))(lite_helper_zone, a2);
  }
  unint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v4 = 0LL;
  if (required_allocation_size(v3, a2, (unint64_t *)&v8, &v7))
  {
    unint64_t v5 = v7;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, unint64_t))(v3 + 24))(v3, v7);
    if (v4) {
      add_stack_to_ptr(v3, v4, a2, v8, v5);
    }
  }

  return v4;
}

uint64_t stack_logging_lite_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (stack_logging_lite_enabled != 1) {
    return (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(lite_helper_zone + 32))( lite_helper_zone,  a2,  a3);
  }
  uint64_t v5 = *(void *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0) {
    return (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(lite_helper_zone + 32))( lite_helper_zone,  a2,  a3);
  }
  if (is_mul_ok(a2, a3))
  {
    unint64_t v8 = a2 * a3;
    unint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v6 = 0LL;
    if (required_allocation_size(v5, v8, (unint64_t *)&v11, &v10))
    {
      unint64_t v9 = v10;
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v5 + 32))(v5, 1LL, v10);
      if (v6) {
        add_stack_to_ptr(v5, v6, v8, v11, v9);
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    *__error() = 12;
  }

  return v6;
}

uint64_t stack_logging_lite_valloc(uint64_t a1, unint64_t a2)
{
  if (stack_logging_lite_enabled != 1) {
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 40))(lite_helper_zone, a2);
  }
  uint64_t v3 = *(void *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0) {
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 40))(lite_helper_zone, a2);
  }
  unint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v4 = 0LL;
  if (required_allocation_size(v3, a2, (unint64_t *)&v8, &v7))
  {
    unint64_t v5 = v7;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, unint64_t))(v3 + 40))(v3, v7);
    if (v4) {
      add_stack_to_ptr(v3, v4, a2, v8, v5);
    }
  }

  return v4;
}

uint64_t stack_logging_lite_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 200);
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  if (v4)
  {
    unint64_t v5 = msl_payload_from_lite_zone_ptr_internal(a2, v4);
    unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(v5);
    if (uniquing_table_index != -1)
    {
      uint64_t v7 = global_uniquing_table();
      if (v7) {
        uniquing_table_stack_release(v7, uniquing_table_index, 0);
      }
    }

    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 48);
    uint64_t v9 = v3;
  }

  else
  {
    uint64_t v9 = lite_helper_zone;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 48);
  }

  return v8(v9, a2);
}

uint64_t stack_logging_lite_realloc(uint64_t a1, char *a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 200);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
  unint64_t v8 = v7;
  if ((stack_logging_lite_enabled & 1) != 0)
  {
    char thread_options = malloc_get_thread_options();
    BOOL v10 = v8 != 0;
    BOOL v11 = (thread_options & 4) == 0LL;
    if (v8) {
      BOOL v12 = (thread_options & 4) == 0LL;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      unint64_t v26 = 0LL;
      unint64_t v27 = 0LL;
      int v13 = 0LL;
      if (required_allocation_size(v6, a3, &v27, &v26))
      {
        uint64_t v24 = 0LL;
        unint64_t v25 = 0LL;
        msl_payload_get_size_info(&a2[v8 - 8], (unsigned int *)&a2[v8 - 16], &v25, &v24);
        unint64_t v14 = *(void *)&a2[v8 - 8];
        unint64_t v15 = v26;
        int v13 = (char *)(*(uint64_t (**)(uint64_t, char *, unint64_t))(v6 + 56))(v6, a2, v26);
        if (v13)
        {
          unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(v14);
          if (uniquing_table_index != -1)
          {
            uint64_t v17 = global_uniquing_table();
            if (v17) {
              uniquing_table_stack_release(v17, uniquing_table_index, 0);
            }
          }

          if (v13 == a2)
          {
            uint64_t v23 = (*(uint64_t (**)(uint64_t, char *))(v6 + 16))(v6, a2);
            uint64_t v18 = v27;
            if (v23 == v8)
            {
              if (v27 <= v8 - v24) {
                uint64_t v18 = v8 - v24;
              }
              unint64_t v15 = v8;
            }
          }

          else
          {
            uint64_t v18 = v27;
          }

          add_stack_to_ptr(v6, (uint64_t)v13, a3, v18, v15);
        }
      }

      return (uint64_t)v13;
    }
  }

  else
  {
    BOOL v11 = 0;
    BOOL v10 = v7 != 0;
  }

  if (!v10 && !v11) {
    return (*(uint64_t (**)(uint64_t, char *, unint64_t))(lite_helper_zone + 56))( lite_helper_zone,  a2,  a3);
  }
  int v13 = (char *)stack_logging_lite_malloc(a1, a3);
  if (v13)
  {
    size_t v20 = malloc_size(a2);
    size_t v21 = malloc_size(v13);
    if (v20 >= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    memcpy(v13, a2, v22);
  }

  stack_logging_lite_free(a1, (uint64_t)a2);
  return (uint64_t)v13;
}

uint64_t stack_logging_lite_destroy(mach_vm_address_t a1)
{
  if (!active_lite_zone) {
    stack_logging_lite_destroy_cold_1();
  }
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  uint64_t result = mach_vm_deallocate(*MEMORY[0x1895FFD48], a1, (*MEMORY[0x189600148] + 207LL) & -*MEMORY[0x189600148]);
  if ((_DWORD)result) {
    stack_logging_lite_destroy_cold_2();
  }
  active_lite_zone = 0LL;
  return result;
}

uint64_t stack_logging_lite_batch_malloc(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4)
{
  if (stack_logging_lite_enabled != 1) {
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(lite_helper_zone + 80))( lite_helper_zone,  a2,  a3,  a4);
  }
  uint64_t v7 = *(void *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0) {
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(lite_helper_zone + 80))( lite_helper_zone,  a2,  a3,  a4);
  }
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  unint64_t v8 = v15;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(v7 + 80))(v7, v15, a3, a4);
  uint64_t v10 = v9;
  if ((_DWORD)v9)
  {
    uint64_t v11 = v16;
    uint64_t v12 = v9;
    do
    {
      uint64_t v13 = *a3++;
      add_stack_to_ptr(v7, v13, a2, v11, v8);
      --v12;
    }

    while (v12);
  }

  return v10;
}

uint64_t stack_logging_lite_batch_free(uint64_t result, uint64_t *a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(result + 200);
    uint64_t v5 = a3;
    do
    {
      uint64_t v6 = *a2;
      if (*a2)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, *a2);
        if (v7)
        {
          unint64_t v8 = msl_payload_from_lite_zone_ptr_internal(v6, v7);
          unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(v8);
          if (uniquing_table_index != -1)
          {
            uint64_t v10 = global_uniquing_table();
            if (v10) {
              uniquing_table_stack_release(v10, uniquing_table_index, 0);
            }
          }

          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v4, v6);
        }

        else
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 48))(lite_helper_zone, v6);
        }
      }

      ++a2;
      --v5;
    }

    while (v5);
  }

  return result;
}

uint64_t stack_logging_lite_memalign(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (stack_logging_lite_enabled != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(lite_helper_zone + 112))( lite_helper_zone,  a2,  a3);
  }
  uint64_t v5 = *(void *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(lite_helper_zone + 112))( lite_helper_zone,  a2,  a3);
  }
  unint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v6 = 0LL;
  if (required_allocation_size(v5, a3, (unint64_t *)&v10, &v9))
  {
    unint64_t v7 = v9;
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v5 + 112))(v5, a2, v9);
    if (v6) {
      add_stack_to_ptr(v5, v6, a3, v10, v7);
    }
  }

  return v6;
}

uint64_t stack_logging_lite_pressure_relief()
{
  return 0LL;
}

uint64_t stack_logging_lite_claimed_address(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 136LL))();
}

uint64_t stack_logging_lite_malloc_with_options(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (stack_logging_lite_enabled != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(lite_helper_zone + 152))( lite_helper_zone,  a2,  a3,  a4);
  }
  uint64_t v7 = *(void *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(lite_helper_zone + 152))( lite_helper_zone,  a2,  a3,  a4);
  }
  unint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v8 = 0LL;
  if (required_allocation_size(v7, a3, (unint64_t *)&v12, &v11))
  {
    unint64_t v9 = v11;
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(v7 + 152))(v7, a2, v11, a4);
    if (v8) {
      add_stack_to_ptr(v7, v8, a3, v12, v9);
    }
  }

  return v8;
}

uint64_t msl_lite_block_size()
{
  if (active_lite_zone) {
    return (*(uint64_t (**)(void))(*(void *)(active_lite_zone + 200) + 16LL))();
  }
  else {
    return 0LL;
  }
}

uint64_t required_allocation_size( uint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t result = 0LL;
  if (a2 <= 1) {
    unint64_t v6 = 1LL;
  }
  else {
    unint64_t v6 = a2;
  }
  if (v6 < 0xFFFFFFFFFFFFFFF8LL && v6 + 8 < 0xFFFFFFFFFFFFFFF8LL)
  {
    unint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)(a1 + 96) + 8LL))(a1, v6);
    if (v9 >= v6
      && (unint64_t v10 = v9,
          unint64_t v11 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)(a1 + 96) + 8LL))(a1, v6 + 8),
          v11 >= v10)
      && ((unint64_t v12 = v11, v11 <= v10)
       || (unint64_t v13 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)(a1 + 96) + 8LL))(a1, v6 + 16),
           BOOL v14 = v13 >= v12,
           unint64_t v12 = v13,
           v14)))
    {
      *a3 = v10;
      *a4 = v12;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void add_stack_to_ptr(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t invalid = msl_payload_get_invalid();
  if (!__malloc_stack_logging_is_reentered())
  {
    unint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, a2);
    if (v11 > a5)
    {
      a5 = v11;
      a4 = v11;
    }

    if (stack_logging_lite_enabled == 1)
    {
      __prepare_to_log_stacks_unlocked(1);
      uint64_t v12 = global_uniquing_table();
      if (v12)
      {
        uint64_t v13 = v12;
        if (a3 <= 1) {
          uint64_t v14 = 1LL;
        }
        else {
          uint64_t v14 = a3;
        }
        char v15 = v14 + 8 < a5;
        int v16 = uniquing_table_stack_retain(v12, 2, 0, &v18);
        BOOL v17 = uniquing_table_node_count(v13) <= 0x400000;
        uint64_t invalid = msl_payload_create(v18, v17, v15);
        if (!v16)
        {
          malloc_printf("MallocStackLogging: stack id is invalid. Turning off stack logging\n");
          msl_turn_off_stack_logging();
        }
      }
    }
  }

  msl_payload_set_in_lite_zone_ptr(a2, a3, a4, a5, invalid);
}

uint64_t stack_logging_lite_introspect_enumerator()
{
  return 0LL;
}

uint64_t stack_logging_lite_introspect_good_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 200) + 96LL) + 8LL))();
}

uint64_t stack_logging_lite_introspect_check()
{
  return 1LL;
}

void stack_logging_lite_introspect_log()
{
}

double stack_logging_lite_introspect_statistics(uint64_t a1, _OWORD *a2)
{
  double result = 0.0;
  *a2 = 0u;
  a2[1] = 0u;
  return result;
}

uint64_t stack_logging_lite_introspect_zone_locked()
{
  return 0LL;
}

void stack_logging_lite_introspect_print_task()
{
}

double stack_logging_lite_introspect_task_statistics(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  double result = 0.0;
  *a4 = 0u;
  a4[1] = 0u;
  return result;
}

uint64_t msl_printf(uint64_t a1)
{
  return msl_printf_allowStdErr(a1, 1);
}

uint64_t msl_printf_allowStdErr(uint64_t a1, int a2)
{
  uint64_t result = _simple_salloc();
  if (result)
  {
    getprogname();
    getpid();
    _simple_sprintf();
    _simple_vsprintf();
    if (a2 && (debug_mode & 1) == 0) {
      _simple_put();
    }
    if (!*MEMORY[0x189600250])
    {
      _simple_string();
      _simple_asl_log();
    }

    return _simple_sfree();
  }

  else if (a2 && (debug_mode & 1) == 0)
  {
    getprogname();
    getpid();
    _simple_dprintf();
    return _simple_vdprintf();
  }

  return result;
}

uint64_t msl_printf_nostderr(uint64_t a1)
{
  return msl_printf_allowStdErr(a1, 0);
}

BOOL msl_should_reap_old_logs()
{
  return (msl_should_reap & 1) == 0;
}

BOOL msl_get_writable_log_dir(BOOL result, unint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (result)
  {
    uint64_t v3 = (_BYTE *)result;
    bzero(v4, 0x400uLL);
    if (msl_log_dir)
    {
      if (realpath_DARWIN_EXTSN(&msl_log_dir, v4)
        && access(v4, 2) != -1
        && !sandbox_query_approval_policy_for_path())
      {
        return _platform_strlcpy() < a2;
      }

      msl_printf(3LL);
    }

    if (realpath_DARWIN_EXTSN("/tmp/", v4) && access(v4, 2) != -1
      || tmp_dir && realpath_DARWIN_EXTSN(&tmp_dir, v4) && access(v4, 2) != -1)
    {
      return _platform_strlcpy() < a2;
    }

    uint64_t result = 0LL;
    _BYTE *v3 = 0;
  }

  return result;
}

char *msl_get_tmp_dir()
{
  return &tmp_dir;
}

char *msl_get_log_dir()
{
  return &msl_log_dir;
}

uint64_t msl_set_flags_from_environment(uint64_t a1)
{
  stack_logging_enable_logging = 0;
  stack_logging_dontcompact = 0;
  uint64_t v1 = (const char *)_simple_getenv();
  if (!v1)
  {
    uint64_t result = _simple_getenv();
    if (!result) {
      return result;
    }
    uint64_t v1 = (const char *)result;
    stack_logging_dontcompact = 1;
  }

  uint64_t result = strncmp(v1, "0", 1uLL);
  if ((_DWORD)result)
  {
    uint64_t result = strncmp(v1, "N", 1uLL);
    if ((_DWORD)result)
    {
      uint64_t result = _platform_strcmp();
      if ((_DWORD)result)
      {
        uint64_t result = _platform_strcmp();
        if ((_DWORD)result)
        {
          uint64_t result = _platform_strcmp();
          if ((_DWORD)result)
          {
            uint64_t result = _platform_strcmp();
            BOOL v3 = (_DWORD)result == 0;
            if ((_DWORD)result) {
              int v4 = 1;
            }
            else {
              int v4 = 5;
            }
          }

          else
          {
            BOOL v3 = 1;
            int v4 = 3;
          }
        }

        else
        {
          BOOL v3 = 0;
          int v4 = 2;
        }
      }

      else
      {
        BOOL v3 = 1;
        int v4 = 4;
      }

      stack_logging_mode = v4;
      if (stack_logging_dontcompact)
      {
        if (!v3) {
          return msl_printf(5LL);
        }
      }
    }
  }

  return result;
}

uint64_t msl_cache_environment(uint64_t a1)
{
  if (a1) {
    uint64_t v2 = _simple_getenv();
  }
  else {
    uint64_t v2 = (uint64_t)getenv("MallocStackLoggingDirectory");
  }
  if (a1) {
    uint64_t v3 = _simple_getenv();
  }
  else {
    uint64_t v3 = (uint64_t)getenv("TMPDIR");
  }
  if (a1) {
    int v4 = (const char *)_simple_getenv();
  }
  else {
    int v4 = getenv("MallocStackLoggingNoReaping");
  }
  debug_mode = 1;
  if (a1) {
    uint64_t v5 = _simple_getenv();
  }
  else {
    uint64_t v5 = (uint64_t)getenv("MallocDebugReport");
  }
  if (!v5)
  {
    if (!isatty(2)) {
      return initialize_no_footprint_for_debug_flag();
    }
LABEL_28:
    BOOL v6 = 0;
    goto LABEL_29;
  }

  if (_platform_strcmp())
  {
    BOOL v6 = _platform_strcmp() == 0;
LABEL_29:
    debug_mode = v6;
  }

  return initialize_no_footprint_for_debug_flag();
}

uint64_t msl_initialize()
{
  stack_logging_finished_init = 1;
  stack_logging_postponed = 0;
  uint64_t result = stack_logging_mode;
  if (stack_logging_mode)
  {
    if ((stack_logging_mode & 0xFFFFFFFE) == 4)
    {
      uint64_t result = create_lite_zone_if_has_default_zone0();
      if (!(_DWORD)result) {
        return result;
      }
      LODWORD(result) = stack_logging_mode;
    }

    return enable_stack_logging_for_mode_and_prepare_to_log_stacks(result);
  }

  return result;
}

uint64_t create_lite_zone_if_has_default_zone0()
{
  if (malloc_msl_lite_hooks())
  {
    if (lite_zone_created_predicate != -1) {
      _os_once();
    }
    return 1LL;
  }

  else
  {
    msl_printf(3LL);
    return 0LL;
  }

BOOL enable_stack_logging_for_mode_and_prepare_to_log_stacks(int a1)
{
  uint64_t v2 = global_uniquing_table();
  switch(a1)
  {
    case 1:
      int v4 = 1;
      int v5 = 1;
      goto LABEL_11;
    case 2:
      int v4 = 2;
      int v5 = 1;
      int v6 = 0;
      goto LABEL_12;
    case 3:
      int v4 = 3;
      goto LABEL_10;
    case 4:
      int v4 = 4;
      goto LABEL_10;
    case 5:
      int v4 = 5;
LABEL_10:
      int v5 = 0;
LABEL_11:
      int v6 = 1;
LABEL_12:
      BOOL result = enable_stack_logging_for_mode_and_prepare_to_log_stacks_helper(v4, v5, v6);
      break;
    default:
      msl_printf(3LL);
      return 0LL;
  }

  return result;
}

void *msl_copy_msl_lite_hooks(void *__src, unint64_t a2)
{
  if (a2 >= 0x18) {
    size_t v2 = 24LL;
  }
  else {
    size_t v2 = a2;
  }
  return memcpy(&malloc_msl_lite_hooks, __src, v2);
}

BOOL msl_turn_on_stack_logging(int a1)
{
  if (stack_logging_enable_logging)
  {
    msl_printf(5LL);
    return 0LL;
  }

  __malloc_lock_stack_logging();
  if (stack_logging_enable_logging)
  {
    msl_printf(5LL);
    BOOL v2 = 0LL;
  }

  else
  {
    msl_cache_environment(0LL);
    BOOL v2 = enable_stack_logging_for_mode_and_prepare_to_log_stacks(a1);
  }

  __malloc_unlock_stack_logging();
  return v2;
}

void msl_turn_off_stack_logging()
{
  if (stack_logging_enable_logging)
  {
    switch(stack_logging_mode)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        uint64_t v0 = 5LL;
        break;
      default:
        uint64_t v0 = 3LL;
        break;
    }

    msl_printf(v0);
    *MEMORY[0x189600298] = 0LL;
    *MEMORY[0x1895FF868] = 0LL;
    stack_logging_enable_logging = 0;
    disable_stack_logging_lite();
  }

  else
  {
    msl_printf(3LL);
  }

  __malloc_unlock_stack_logging();
}

uint64_t msl_set_mode_for_pid(unsigned int a1, unsigned int a2)
{
  if (a1 > 5) {
    uint64_t v2 = 0LL;
  }
  else {
    uint64_t v2 = qword_1860C2F18[a1];
  }
  uint64_t v7 = v2 | a2;
  uint64_t v3 = sysctlbyname("kern.memorystatus_vm_pressure_send", 0LL, 0LL, &v7, 8uLL);
  if ((_DWORD)v3)
  {
    int v4 = __error();
    strerror(*v4);
    uint64_t v5 = 3LL;
  }

  else
  {
    uint64_t v5 = 5LL;
  }

  msl_printf(v5);
  return v3;
}

void msl_handle_memory_event(int a1)
{
  if ((a1 & 0xF0000000) != 0 && (a1 & 0xFFFFFFF) == 0)
  {
    if (a1 < 0)
    {
      msl_turn_off_stack_logging();
    }

    else if ((a1 & 0x40000000) != 0)
    {
      if ((~a1 & 0x30000000) != 0)
      {
        if ((a1 & 0x20000000) != 0 && (msl_type_enabled_at_runtime == 5 || !msl_type_enabled_at_runtime))
        {
          msl_type_enabled_at_runtime = 5;
          msl_turn_on_stack_logging(5);
        }
      }

      else if ((msl_type_enabled_at_runtime & 0xFFFFFFFB) == 0)
      {
        msl_type_enabled_at_runtime = 4;
        msl_turn_on_stack_logging(4);
      }
    }

    else if ((~a1 & 0x30000000) != 0)
    {
      if ((a1 & 0x10000000) != 0)
      {
        if ((msl_type_enabled_at_runtime & 0xFFFFFFFD) == 0)
        {
          msl_type_enabled_at_runtime = 2;
          msl_turn_on_stack_logging(2);
        }
      }

      else if ((a1 & 0x20000000) != 0 && (msl_type_enabled_at_runtime == 3 || !msl_type_enabled_at_runtime))
      {
        msl_type_enabled_at_runtime = 3;
        msl_turn_on_stack_logging(3);
      }
    }

    else if (msl_type_enabled_at_runtime <= 1)
    {
      msl_type_enabled_at_runtime = 1;
      msl_turn_on_stack_logging(1);
    }
  }

BOOL msl_is_stack_logging_enabled()
{
  return stack_logging_enable_logging != 0;
}

BOOL enable_stack_logging_for_mode_and_prepare_to_log_stacks_helper(int a1, int a2, int a3)
{
  int v6 = __prepare_to_log_stacks((a1 & 0xFFFFFFFE) == 4);
  if (v6)
  {
    if (a2) {
      *MEMORY[0x189600298] = __disk_stack_logging_log_stack;
    }
    if (a3) {
      *MEMORY[0x1895FF868] = __disk_stack_logging_log_stack;
    }
    stack_logging_mode = a1;
    stack_logging_enable_logging = 1;
    if (a1 == 4) {
      enable_stack_logging_lite();
    }
    msl_printf(5LL);
    set_malloc_stack_logging_start_timestamp();
  }

  return v6 != 0;
}

uint64_t global_uniquing_table()
{
  if (pre_write_buffers) {
    return *(void *)(pre_write_buffers + 16);
  }
  else {
    return 0LL;
  }
}

void __delete_and_unlink_uniquing_table_while_locked()
{
  if (pre_write_buffers)
  {
    uint64_t v0 = *(void *)(pre_write_buffers + 16);
    if (v0)
    {
    }
  }

  *MEMORY[0x189600248] = 0LL;
}

uint64_t __prepare_to_log_stacks(int a1)
{
  if (pre_write_buffers) {
    return 1LL;
  }
  last_logged_malloc_mach_vm_address_t address = 0LL;
  if (stack_logging_dontcompact) {
    int v3 = 0;
  }
  else {
    int v3 = logging_use_compaction;
  }
  logging_use_compaction = v3;
  uint64_t pages = (char *)sld_allocate_pages(0x4000uLL);
  pre_write_buffers = (uint64_t)pages;
  if (!pages) {
    goto LABEL_11;
  }
  strcpy(pages, "mslshm1");
  uint64_t v5 = pre_write_buffers;
  *(void *)(pre_write_buffers + 8) = 0LL;
  *(_DWORD *)(v5 + 52) = 0;
  *(_BYTE *)(v5 + 56) = *(_BYTE *)(v5 + 56) & 0xFC | a1 & 1 | 2;
  *(void *)(v5 + 24) = 0LL;
  *(void *)(v5 + 32) = 0LL;
  uint64_t v6 = uniquing_table_create(0x10000u, 0x40000000u);
  if (v6)
  {
    mach_vm_address_t v7 = v6;
    if (a1 || create_log_file())
    {
      uint64_t v8 = pre_write_buffers;
      *(void *)(pre_write_buffers + 16) = v7;
      *MEMORY[0x189600248] = v8;
      return 1LL;
    }

    uniquing_table_deinitialize(v7, 1);
    uniquing_table_destroy_husk_exclusive(v7);
    munmap((void *)pre_write_buffers, 0x4000uLL);
    pre_write_buffers = 0LL;
    if (!stack_logging_postponed) {
      disable_stack_logging();
    }
  }

  else
  {
LABEL_11:
    msl_printf(3LL);
    msl_printf(3LL);
    stack_logging_enable_logging = 0;
    *MEMORY[0x189600298] = 0LL;
    *MEMORY[0x1895FF868] = 0LL;
    disable_stack_logging_lite();
  }

  return 0LL;
}

void disable_stack_logging()
{
  stack_logging_enable_logging = 0;
  *MEMORY[0x189600298] = 0LL;
  *MEMORY[0x1895FF868] = 0LL;
  disable_stack_logging_lite();
}

uint64_t create_log_file()
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  pid_t v0 = getpid();
  uint64_t v1 = getprogname();
  uint64_t pages = (char *)__stack_log_file_path__;
  if (!__stack_log_file_path__)
  {
    uint64_t pages = (char *)sld_allocate_pages((*MEMORY[0x189600148] + 1023LL) & -*MEMORY[0x189600148]);
    __stack_log_file_path__ = (uint64_t)pages;
    if (!pages) {
      goto LABEL_31;
    }
  }

  if (msl_get_writable_log_dir((BOOL)pages, 0x400uLL)) {
    goto LABEL_6;
  }
  if (!stack_logging_finished_init)
  {
    msl_printf(6LL);
    stack_logging_postponed = 1;
LABEL_30:
    *uint64_t pages = 0;
    if (stack_logging_postponed) {
      return 0LL;
    }
LABEL_31:
    msl_printf(3LL);
    return 0LL;
  }

  if (confstr(65537, pages, 0x400uLL) - 1024 < 0xFFFFFFFFFFFFFC01LL) {
    goto LABEL_30;
  }
LABEL_6:
  unint64_t v3 = _platform_strlen();
  if (v3 >= 0x400) {
    create_log_file_cold_1();
  }
  if ((!v3 || *(_BYTE *)(v3 + __stack_log_file_path__ - 1) != 47) && _platform_strlcat() != v3 + 1
    || (unint64_t)_platform_strlcat() > 0x3FF)
  {
    goto LABEL_14;
  }

  int appended = append_int(__stack_log_file_path__, v0, 0xAu);
  if (appended)
  {
    if ((unint64_t)_platform_strlcat() <= 0x3FF)
    {
      int appended = append_int(__stack_log_file_path__, pre_write_buffers, 0x10u);
      goto LABEL_15;
    }

LABEL_14:
    int appended = 0;
  }

LABEL_15:
  if (v1 && *v1)
  {
  }

  else if (!appended)
  {
    goto LABEL_28;
  }

  if ((unint64_t)_platform_strlcat() <= 0x3FF && (unint64_t)_platform_strlcat() <= 0x3FF)
  {
    uint64_t v5 = (const char *)__stack_log_file_path__;
    uint64_t v6 = _platform_strlen();
    uint64_t v7 = 0LL;
    uint64_t v8 = v6 << 32;
    while (v5[v7++])
      ;
    if (v7 - 1 > 1023)
    {
      int v10 = 63;
LABEL_37:
      int v16 = __error();
      int v17 = 0;
      *int v16 = v10;
LABEL_38:
      index_file_descriptor = v17;
      msl_printf(5LL);
      uint64_t v11 = __stack_log_file_path__;
      *(void *)(pre_write_buffers + 40) = __stack_log_file_path__;
      *(_DWORD *)(pre_write_buffers + 48) = _platform_strlen();
      return v11;
    }

    uint64_t v13 = &v5[v7 - (int)v6];
    uint64_t v14 = (char *)(v13 - 2);
    if (v13 - 2 < v5 || (char v15 = (char *)(v13 - 1), _platform_strchr()))
    {
      int v10 = 22;
      goto LABEL_37;
    }

    getentropy(buffer, 0x10uLL);
    unint64_t v18 = 0LL;
    do
    {
      if (*v14 != 88 || v18 > 0xE) {
        break;
      }
      unsigned int v20 = buffer[v18++];
      *v14-- = my_mkstemps_padchar[(v20 - 62 * ((133 * (v20 >> 1)) >> 12))];
    }

    while (v14 >= v5);
    memcpy(__dst, v14 + 1, &v5[-(v8 >> 32)] - v14 + v7 - 2);
    int v17 = open(v5, 553650690, 384LL);
    if ((v17 & 0x80000000) == 0) {
      goto LABEL_38;
    }
    while (2)
    {
      size_t v21 = __error();
      if (v15 != v14 + 1 && *v21 == 17)
      {
        size_t v22 = __dst;
        uint64_t v23 = v14 + 1;
        while (1)
        {
          uint64_t v24 = _platform_strchr();
          if (!v24)
          {
            *__error() = 5;
            goto LABEL_58;
          }

          int v25 = *(unsigned __int8 *)(v24 + 1);
          if (!*(_BYTE *)(v24 + 1)) {
            int v25 = 48;
          }
          *uint64_t v23 = v25;
          if (v25 != *v22) {
            break;
          }
          ++v23;
          ++v22;
          if (v15 == v23) {
            goto LABEL_58;
          }
        }

        int v17 = open(v5, 553650690, 384LL);
        if (v17 < 0) {
          continue;
        }
        goto LABEL_38;
      }

      break;
    }

LABEL_58:
    index_file_descriptor = -1;
  }

  if (v37 > v21) {
    fwrite( "insufficient data in remote stack index file; expected more records.\n",
  }
      0x45uLL,
      1uLL,
      (FILE *)*MEMORY[0x1895FEE10]);
  *((void *)v1 + 2053) += v21 * v11;
LABEL_61:
  if (v18)
  {
    uint64_t v28 = *((void *)v1 + 5);
    int v29 = v1[21] / v11;
    uint64_t v30 = v29 - v16;
    if (*(_DWORD *)(v0 + 8))
    {
      if (v29 > v16)
      {
        unint64_t v31 = v28 + v11 * (unint64_t)v16;
        unsigned __int128 v32 = 32LL * v16 + 104;
        do
        {
          insert_node((uint64_t)v1, *(void *)((char *)v1 + v32) ^ 0x5555LL, v31);
          v31 += v11;
          v32 += 32LL;
          --v30;
        }

        while (v30);
      }
    }

    else if (v29 > v16)
    {
      uint64_t v33 = v28 + v11 * (unint64_t)v16;
      unsigned int v34 = 24LL * v16 + 100;
      do
      {
        insert_node((uint64_t)v1, *(unsigned int *)((char *)v1 + v34) ^ 0x5555LL, v33);
        v33 += v11;
        v34 += 24LL;
        --v30;
      }

      while (v30);
    }
  }

  return 0LL;
}

uint64_t __prepare_to_log_stacks_unlocked(int a1)
{
  if (pre_write_buffers) {
    return 1LL;
  }
  __malloc_lock_stack_logging();
  uint64_t v3 = __prepare_to_log_stacks(a1);
  __malloc_unlock_stack_logging();
  return v3;
}

void reap_orphaned_log_files_once()
{
  if ((reap_orphaned_log_files_once_orphaned_log_files & 1) == 0)
  {
    do
      unsigned __int8 v0 = __ldxr((unsigned __int8 *)&reap_orphaned_log_files_once_orphaned_log_files);
    while (__stxr(1u, (unsigned __int8 *)&reap_orphaned_log_files_once_orphaned_log_files));
    if ((v0 & 1) == 0)
    {
      uint64_t v1 = getpid();
      get_remote_env_var(v1, "MallocStackLoggingDontDeleteStackLogFile", v2);
      if (v2[0] != 49) {
        atexit((void (*)(void))delete_log_files);
      }
      if ((!getprogname() || _platform_strcmp() && _platform_strcmp())
        && msl_should_reap_old_logs())
      {
        reap_orphaned_log_files(v1, 0LL);
      }
    }
  }

uint64_t get_remote_env_var(int a1, const char *a2, _BYTE *a3)
{
  uint64_t v25 = *MEMORY[0x1895FEE08];
  *a3 = 0;
  *(void *)size_t v22 = 0x800000001LL;
  size_t v19 = 8LL;
  size_t v20 = 0LL;
  uint64_t result = sysctl(v22, 2u, &v20, &v19, 0LL, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t v6 = (void *)MEMORY[0x189600148];
    uint64_t result = sld_allocate_pages((v20 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148]);
    if (result)
    {
      uint64_t v7 = (_DWORD *)result;
      size_t v21 = v20;
      *(void *)uint64_t v23 = 0x3100000001LL;
      int v24 = a1;
      if (!sysctl(v23, 3u, (void *)result, &v21, 0LL, 0LL))
      {
        int64_t v8 = v21;
        unint64_t v9 = (unint64_t)v7 + v21;
        *((_BYTE *)v7 + v21 - 1) = 0;
        uint64_t v11 = (const char *)(v7 + 1);
        int v10 = *v7;
        if (v8 >= 5 && (v10 & 0x80000000) == 0)
        {
          int v12 = 0;
          do
          {
            do
            {
              if (!*v11) {
                break;
              }
              ++v11;
            }

            while ((unint64_t)v11 < v9);
            if ((unint64_t)v11 < v9)
            {
              int64_t v13 = (char *)v7 + v8 - v11;
              while (!*v11)
              {
                ++v11;
                if (!--v13)
                {
                  uint64_t v11 = (char *)v7 + v8;
                  break;
                }
              }
            }

            if (v12 >= v10) {
              break;
            }
            ++v12;
          }

          while ((unint64_t)v11 < v9);
        }

        uint64_t v14 = _platform_strlen();
        char v15 = &v11[v14];
        if ((unint64_t)&v11[v14 + 1] < v9)
        {
          size_t v16 = v14;
          int v17 = (char *)v7 + v8;
          while (*v11)
          {
            if (!strncmp(v11, a2, v16) && *v15 == 61)
            {
              _platform_strlcpy();
              return sld_deallocate_pages((mach_vm_address_t)v7, (v20 + *v6 - 1) & -*v6);
            }

            if ((unint64_t)v11 < v9)
            {
              int64_t v18 = v17 - v11;
              while (*v11)
              {
                ++v11;
                if (!--v18)
                {
                  uint64_t v11 = v17;
                  break;
                }
              }
            }

            char v15 = &(++v11)[v16];
          }
        }
      }

      return sld_deallocate_pages((mach_vm_address_t)v7, (v20 + *v6 - 1) & -*v6);
    }
  }

  return result;
}

uint64_t delete_log_files()
{
  uint64_t result = __stack_log_file_path__;
  if (__stack_log_file_path__ && *(_BYTE *)__stack_log_file_path__)
  {
    if (delete_logging_file(__stack_log_file_path__))
    {
      return msl_printf(5LL);
    }

    else
    {
      uint64_t result = msl_printf(5LL);
      *(_BYTE *)__stack_log_file_path__ = 0;
    }
  }

  return result;
}

DIR *reap_orphaned_log_files(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  reap_orphaned_log_files_in_hierarchy((uint64_t)"/tmp/", 0LL, a1, a2);
  get_raw_log_dirs(a1, v9, v10);
  uint64_t v4 = 0LL;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = &v9[1024 * v4];
    char v5 = 0;
    uint64_t v4 = 1LL;
  }

  while ((v6 & 1) != 0);
  return reap_orphaned_log_files_in_hierarchy( (uint64_t)"/private/var/mobile/Containers/Data/Application",  "<application-UUID>/tmp",  a1,  a2);
}

void __disk_stack_logging_log_stack(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (stack_logging_enable_logging) {
    BOOL v6 = stack_logging_postponed == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v10 = (a6 + 1);
    while (1)
    {
      uint64_t v11 = a4;
      if ((malloc_get_thread_options() & 4) != 0) {
        return;
      }
      unsigned int v12 = stack_logging_mode & 0xFFFFFFFE;
      int v13 = a1 & 0x30;
      if ((a1 & 0x30) == 0 && v12 == 4) {
        return;
      }
      if ((~a1 & 6) != 0) {
        break;
      }
      if (!a3)
      {
        a1 ^= 4u;
        goto LABEL_20;
      }

      if (a5)
      {
        __disk_stack_logging_log_stack(4LL, a2, a3, 0LL, 0LL, v10);
        if (stack_logging_enable_logging)
        {
          a4 = 0LL;
          uint64_t v10 = (v10 + 1);
          a1 = 2;
          a3 = v11;
          if (!stack_logging_postponed) {
            continue;
          }
        }
      }

      return;
    }

    if ((a1 & 0x24) != 0)
    {
      a5 = a3;
      if (!a3) {
        return;
      }
    }

    else
    {
      if ((a1 & 0x12) == 0)
      {
        msl_printf(3LL);
        return;
      }

      uint64_t v11 = a3;
    }

LABEL_20:
    if ((!v13 || *MEMORY[0x1895FFD48] == (_DWORD)a2) && !__malloc_stack_logging_is_reentered())
    {
      if ((a1 & 2) != 0) {
        reap_orphaned_log_files_once();
      }
      __malloc_lock_stack_logging();
      if (v12 == 4 && (a1 & 0x20) != 0)
      {
        if (pre_write_buffers)
        {
          uint64_t v27 = *(void *)(pre_write_buffers + 24);
          if (v27)
          {
            radix_tree_delete( &v27,  a5 & -*MEMORY[0x189600148],  ((a5 + v11 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148]) - (a5 & -*MEMORY[0x189600148]));
            uint64_t v14 = v27;
            uint64_t v15 = pre_write_buffers;
            *(void *)(pre_write_buffers + 24) = v27;
            if (v14)
            {
              uint64_t v14 = radix_tree_size(v14);
              uint64_t v15 = pre_write_buffers;
            }

            *(void *)(v15 + 32) = v14;
            goto LABEL_41;
          }
        }
      }

      if (!stack_logging_enable_logging || stack_logging_postponed)
      {
LABEL_41:
        __malloc_unlock_stack_logging();
        return;
      }

      uint64_t v16 = a5 ^ 0x5555;
      if ((a5 ^ 0x5555) == last_logged_malloc_address && (a1 & 4) != 0 && last_logged_malloc_address)
      {
        *(_DWORD *)(pre_write_buffers + 52) -= 32;
        last_logged_malloc_mach_vm_address_t address = 0LL;
        goto LABEL_41;
      }

      uint64_t invalid = msl_payload_get_invalid();
      if (pre_write_buffers && (uint64_t v18 = *(void *)(pre_write_buffers + 16)) != 0)
      {
        BOOL v19 = uniquing_table_stack_retain(*(void *)(pre_write_buffers + 16), v10, 1, &v27) == 0;
        BOOL v20 = uniquing_table_node_count(v18) <= 0x400000;
        uint64_t invalid = msl_payload_create(v27, v20, 0);
      }

      else
      {
        BOOL v19 = 0;
      }

      if (msl_payload_is_invalid(invalid)) {
        goto LABEL_48;
      }
      if (v12 == 4 && (a1 & 0x10) != 0)
      {
        if (!pre_write_buffers) {
          goto LABEL_48;
        }
        uint64_t v27 = *(void *)(pre_write_buffers + 24);
        if (!v27)
        {
          uint64_t v21 = radix_tree_create();
          uint64_t v27 = v21;
          uint64_t v22 = pre_write_buffers;
          *(void *)(pre_write_buffers + 24) = v21;
          if (!v21)
          {
LABEL_58:
            *(void *)(v22 + 32) = v21;
            goto LABEL_48;
          }

          *(void *)(pre_write_buffers + 32) = radix_tree_size(v21);
        }

        radix_tree_insert( &v27,  a5 & -*MEMORY[0x189600148],  ((a5 + v11 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148]) - (a5 & -*MEMORY[0x189600148]),  invalid);
        uint64_t v21 = v27;
        uint64_t v22 = pre_write_buffers;
        *(void *)(pre_write_buffers + 24) = v27;
        if (v21)
        {
          uint64_t v21 = radix_tree_size(v21);
          uint64_t v22 = pre_write_buffers;
        }

        goto LABEL_58;
      }

      __src[0] = v11;
      __src[1] = a5 ^ 0x5555;
      LODWORD(__src[3]) = a1 & 0xFF0000B7;
      __src[2] = invalid;
      if ((a1 & 0x12) != 0)
      {
        if (!logging_use_compaction)
        {
LABEL_64:
          uint64_t v23 = pre_write_buffers;
          unsigned int v24 = *(_DWORD *)(pre_write_buffers + 52);
          if (v24 >> 5 >= 0x1FD)
          {
            uint64_t v23 = pre_write_buffers;
            unsigned int v24 = *(_DWORD *)(pre_write_buffers + 52);
          }

          memcpy((void *)(v23 + v24 + 64), __src, 0x20uLL);
          *(_DWORD *)(pre_write_buffers + 52) += 32;
LABEL_48:
          __malloc_unlock_stack_logging();
          if (v19) {
            msl_turn_off_stack_logging();
          }
          return;
        }
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      last_logged_malloc_mach_vm_address_t address = v16;
      goto LABEL_64;
    }
  }

uint64_t flush_data()
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (index_file_descriptor == -1)
  {
    uint64_t result = create_log_file();
    if (!result) {
      return result;
    }
  }

  uint64_t v1 = pre_write_buffers;
  size_t v2 = *(unsigned int *)(pre_write_buffers + 52);
  if (!(_DWORD)v2)
  {
    uint64_t v7 = 0LL;
LABEL_24:
    *(void *)(v1 + 8) += v7;
    *(_DWORD *)(v1 + 52) = 0;
    return 1LL;
  }

  uint64_t v3 = (char *)(pre_write_buffers + 64);
  while (1)
  {
    int v4 = index_file_descriptor;
    ssize_t v5 = write(index_file_descriptor, v3, v2);
    if (v5 != -1) {
      goto LABEL_19;
    }
    if (*__error() != 9) {
      goto LABEL_22;
    }
    if (index_file_descriptor != v4) {
      break;
    }
    int v6 = open((const char *)__stack_log_file_path__, 553648137);
    if (v6 < 3)
    {
      int v10 = 0;
      uint64_t v9 = 0LL;
      do
      {
        if (v6 == -1)
        {
          msl_printf(3LL);
          delete_log_files();
          goto LABEL_22;
        }

        *((_DWORD *)&v9 + v6) = 1;
        int v6 = dup(v6);
      }

      while (v6 < 3);
      if ((_DWORD)v9) {
        close(0);
      }
      if (HIDWORD(v9)) {
        close(1);
      }
      if (v10) {
        close(2);
      }
    }

    index_file_descriptor = v6;
    ssize_t v5 = write(v6, v3, v2);
    if (v5 == -1) {
      goto LABEL_22;
    }
LABEL_19:
    v3 += v5;
    v2 -= v5;
    if (!v2)
    {
      uint64_t v1 = pre_write_buffers;
      uint64_t v7 = *(unsigned int *)(pre_write_buffers + 52);
      goto LABEL_24;
    }
  }

  msl_printf(3LL);
LABEL_22:
  int64_t v8 = __error();
  strerror(*v8);
  msl_printf(3LL);
  msl_printf(3LL);
  stack_logging_enable_logging = 0;
  *MEMORY[0x189600298] = 0LL;
  *MEMORY[0x1895FF868] = 0LL;
  disable_stack_logging_lite();
  return 0LL;
}

void msl_fork_child()
{
  if (__stack_log_file_path__)
  {
    sld_deallocate_pages(__stack_log_file_path__, (*MEMORY[0x189600148] + 1023LL) & -*MEMORY[0x189600148]);
    __stack_log_file_path__ = 0LL;
  }

  if (index_file_descriptor != -1)
  {
    close(index_file_descriptor);
    index_file_descriptor = -1;
  }

  mach_vm_address_t v0 = pre_write_buffers;
  if (pre_write_buffers)
  {
    if (!*(void *)(pre_write_buffers + 24)
      || (radix_tree_destroy(*(void *)(pre_write_buffers + 24)), (mach_vm_address_t v0 = pre_write_buffers) != 0))
    {
      if (*(void *)(v0 + 16))
      {
        __delete_and_unlink_uniquing_table_while_locked();
        mach_vm_address_t v0 = pre_write_buffers;
      }
    }

    sld_deallocate_pages(v0, 0x4000uLL);
    pre_write_buffers = 0LL;
  }

  __malloc_unlock_stack_logging();
}

uint64_t msl_start_reading(mach_port_name_t a1, mach_vm_address_t a2, _DWORD *a3)
{
  ssize_t v5 = retain_file_streams_for_task_with_error(a1, a2, &v11);
  if (!v5) {
    return 5LL;
  }
  int v6 = v5;
  uint64_t updated = update_cache_for_file_streams();
  if ((_DWORD)updated)
  {
    uint64_t v8 = updated;
    release_file_streams_for_task(a1);
  }

  else
  {
    uint64_t v9 = v6[5];
    if (v9) {
      LODWORD(v9) = *(_BYTE *)(v9 + 56) & 1;
    }
    uint64_t v8 = 0LL;
    *a3 = v9;
  }

  return v8;
}

uint64_t update_cache_for_file_streams()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  __ptr[512] = *MEMORY[0x1895FEE08];
  uint64_t v1 = *(unsigned int **)(v0 + 32);
  if (!v1)
  {
    uint64_t v1 = (unsigned int *)calloc(1uLL, 0x4048uLL);
    *(void *)(v0 + 32) = v1;
    v1[4] = 17;
    *((void *)v1 + 2053) = 0LL;
    *(_OWORD *)uint64_t v1 = xmmword_1860C2F70;
    *((void *)v1 + 3) = calloc(0x4000uLL, 0x10uLL);
    uint64_t v7 = *(void *)(v0 + 40);
    if (v7)
    {
      mach_vm_address_t v8 = *(void *)(v7 + 24);
      if (v8)
      {
        mach_vm_address_t v9 = map_shared_memory_from_task(*(_DWORD *)v0, v8, *(void *)(v7 + 32));
        *((void *)v1 + 2056) = v9;
        if (!v9) {
          msl_printf(3LL);
        }
      }
    }
  }

  int v2 = *(_DWORD *)(v0 + 4);
  pid_t v3 = getpid();
  task_suspension_token_t suspend_token = 0;
  if (v2 != v3) {
    task_suspend2(*(_DWORD *)v0, &suspend_token);
  }
  int v4 = *(FILE **)(v0 + 16);
  if (v4)
  {
    int v5 = fileno(v4);
    fstat(v5, &v38);
    off_t st_size = v38.st_size;
  }

  else
  {
    off_t st_size = 0LL;
    v38.off_t st_size = 0LL;
  }

  int v10 = *(_DWORD *)(v0 + 8);
  if (v10) {
    size_t v11 = 32LL;
  }
  else {
    size_t v11 = 24LL;
  }
  uint64_t v12 = *((void *)v1 + 2053);
  size_t v13 = st_size - v12;
  uint64_t v14 = *(void *)(v0 + 40);
  if (v11 <= st_size - v12)
  {
    if (v14)
    {
      unsigned int v16 = 0;
      uint64_t v17 = v12 + v1[21];
      *((void *)v1 + 2053) = v17;
      size_t v13 = st_size - v17;
      BOOL v15 = 1;
      goto LABEL_20;
    }

LABEL_19:
    unsigned int v16 = 0;
    BOOL v15 = 0;
    goto LABEL_20;
  }

  if (!v14) {
    goto LABEL_19;
  }
  BOOL v15 = 0;
  unsigned int v16 = v1[21] / v11;
LABEL_20:
  if (v11 <= v13 || v15 || !v14)
  {
    if (!v14) {
      goto LABEL_26;
    }
  }

  else
  {
    BOOL v15 = *(_DWORD *)(v14 + 52) != v1[21];
  }

  if ((*(_BYTE *)(v14 + 56) & 1) != 0)
  {
    if (!*((void *)v1 + 2054)) {
      LOBYTE(v15) = 1;
    }
    if (v15) {
      goto LABEL_27;
    }
    goto LABEL_32;
  }

LABEL_26:
  if (v15)
  {
LABEL_27:
    memcpy(v1 + 8, (const void *)v14, 0x4000uLL);
    if (*(void *)(*(void *)(v0 + 40) + 16LL))
    {
      msl_uniquing_table_release(*((void *)v1 + 2054));
      *((void *)v1 + 2054) = uniquing_table_clone_from_task(*(_DWORD *)v0, *(void *)(*(void *)(v0 + 40) + 16LL));
      int v18 = 1;
    }

    else
    {
      int v18 = 1;
      fwrite( "Uniquing table deleted in remote task. This could be the result of memory pressure\n",  0x53uLL,  1uLL,  (FILE *)*MEMORY[0x1895FEE10]);
    }

    goto LABEL_34;
  }

LABEL_32:
  int v18 = 0;
LABEL_34:
  if (v2 != v3) {
    task_resume2(suspend_token);
  }
  if (v18)
  {
    if (!*((void *)v1 + 2054)) {
      return 5LL;
    }
  }

  else if (v11 > v13)
  {
    return 0LL;
  }

  if (v11 > v13) {
    goto LABEL_61;
  }
  if (v10) {
    size_t v20 = 128LL;
  }
  else {
    size_t v20 = 170LL;
  }
  uint64_t v36 = *(FILE **)(v0 + 16);
  if (fseeko(v36, *((void *)v1 + 2053), 0)) {
    fwrite( "error while attempting to cache information from remote stack index file. (update_cache_for_file_streams)\n",  0x6AuLL,  1uLL,  (FILE *)*MEMORY[0x1895FEE10]);
  }
  unint64_t v21 = 0LL;
  unint64_t v22 = *((void *)v1 + 2053);
  size_t v37 = v13 / v11;
  for (i = v0; ; uint64_t v0 = i)
  {
    if (v37 - v21 < v20) {
      size_t v20 = v37 - v21;
    }
    size_t v23 = fread(__ptr, v11, v20, v36);
    unint64_t v24 = v23;
    if (!*(_DWORD *)(v0 + 8)) {
      break;
    }
    if (!v23) {
      goto LABEL_58;
    }
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    do
    {
      insert_node((uint64_t)v1, __ptr[4 * v26 + 1] ^ 0x5555LL, v22);
      v22 += v11;
      uint64_t v26 = ++v25;
    }

    while (v24 > v25);
LABEL_57:
    v21 += v25;
  }

  if (v23)
  {
    uint64_t v25 = 0LL;
    uint64_t v27 = 0LL;
    do
    {
      insert_node((uint64_t)v1, HIDWORD(__ptr[3 * v27]) ^ 0x5555LL, v22);
      v22 += v11;
      uint64_t v27 = ++v25;
    }

    while (v24 > v25);
    goto LABEL_57;
  }

void release_file_streams_for_task(int a1)
{
  uint64_t v2 = remote_fds_count;
  if (remote_fds_count)
  {
    pid_t v3 = (_DWORD **)remote_fds;
    while (1)
    {
      int v4 = *v3;
      if (*v3)
      {
        if (*v4 == a1) {
          break;
        }
      }

      ++v3;
      if (!--v2) {
        goto LABEL_8;
      }
    }

    --v4[3];
  }

LABEL_8:
  int v5 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v6 = __ldxr(&remote_fd_list_lock._os_unfair_lock_opaque);
    if (v6 != v5) {
      break;
    }
    if (!__stlxr(0, &remote_fd_list_lock._os_unfair_lock_opaque)) {
      return;
    }
  }

  __clrex();
  os_unfair_lock_unlock(&remote_fd_list_lock);
}

uint64_t msl_stop_reading(int a1)
{
  uint64_t v2 = remote_fds_count;
  if (remote_fds_count)
  {
    pid_t v3 = (_DWORD **)remote_fds;
    while (1)
    {
      int v4 = *v3;
      if (*v3)
      {
        if (*v4 == a1) {
          break;
        }
      }

      ++v3;
      if (!--v2) {
        goto LABEL_6;
      }
    }

    if ((int)v4[3] > 0)
    {
      uint64_t v5 = 5LL;
      goto LABEL_7;
    }

    free_file_streams(v4);
  }

LABEL_6:
  uint64_t v5 = 0LL;
LABEL_7:
  int v6 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v7 = __ldxr(&remote_fd_list_lock._os_unfair_lock_opaque);
    if (v7 != v6) {
      break;
    }
    if (!__stlxr(0, &remote_fd_list_lock._os_unfair_lock_opaque)) {
      return v5;
    }
  }

  __clrex();
  os_unfair_lock_unlock(&remote_fd_list_lock);
  return v5;
}

void free_file_streams(void *a1)
{
  uint64_t v2 = (FILE *)*((void *)a1 + 2);
  if (v2) {
    fclose(v2);
  }
  pid_t v3 = (void *)*((void *)a1 + 5);
  if (v3) {
    munmap(v3, 0x4000uLL);
  }
  uint64_t v4 = *((void *)a1 + 4);
  if (v4)
  {
    free(*(void **)(v4 + 24));
    msl_uniquing_table_release(*(void *)(*((void *)a1 + 4) + 16432LL));
    free(*((void **)a1 + 4));
  }

  bzero(a1, 0x30uLL);
}

BOOL msl_payload_version_from_task(mach_port_name_t a1)
{
  uint64_t v2 = retain_file_streams_for_task_with_error(a1, 0LL, 0LL);
  if (v2) {
    release_file_streams_for_task(a1);
  }
  return v2 != 0LL;
}

uint64_t msl_coldest_frame_is_threadid(mach_port_name_t a1)
{
  uint64_t v2 = retain_file_streams_for_task_with_error(a1, 0LL, 0LL);
  if (!v2) {
    return 1LL;
  }
  uint64_t v3 = v2[5];
  if (v3) {
    BOOL v4 = (*(_BYTE *)(v3 + 56) & 3) == 0;
  }
  else {
    BOOL v4 = 1LL;
  }
  release_file_streams_for_task(a1);
  return v4;
}

uint64_t msl_payload_for_malloc_address_in_task(mach_port_name_t a1, unint64_t a2)
{
  BOOL v4 = retain_file_streams_for_task_with_error(a1, 0LL, 0LL);
  if (!v4) {
    return msl_payload_get_invalid();
  }
  uint64_t v5 = msl_payload_for_malloc_address_in_task_helper((uint64_t)v4, a2);
  release_file_streams_for_task(a1);
  return v5;
}

uint64_t msl_payload_for_malloc_address_in_task_helper(uint64_t a1, unint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(v5 + 8);
  unint64_t v7 = (a2 >> 2) % (v6 - 1);
  unsigned int v8 = *(_DWORD *)(v5 + 16);
  unsigned int v9 = 1;
  uint64_t v10 = *(void *)(v5 + 24);
  while (1)
  {
    uint64_t v11 = *(void *)(v10 + 16 * v7);
    if (v11 == a2) {
      break;
    }
    if (v11)
    {
      unint64_t v12 = v7 + v6 / ((2 * v8) | 1) * v9;
      unint64_t v13 = v12 >= v6 ? v6 : 0LL;
      unint64_t v7 = v12 - v13;
      if (v9++ <= v8) {
        continue;
      }
    }

    return msl_payload_get_invalid();
  }

  unint64_t v15 = *(void *)(v10 + 16 * v7 + 8);
  uint64_t invalid = msl_payload_get_invalid();
  uint64_t v17 = *(void *)(a1 + 32);
  if (v15 >= *(void *)(v17 + 16424))
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v20 = v17 + v15 - *(void *)(v17 + 40) + 96;
      if (*(_DWORD *)(a1 + 8)) {
        return *(void *)(v20 + 16);
      }
      else {
        return *(void *)(v20 + 8);
      }
    }
  }

  else
  {
    if (*(_DWORD *)(a1 + 8)) {
      size_t v18 = 32LL;
    }
    else {
      size_t v18 = 24LL;
    }
    fseeko(*(FILE **)(a1 + 16), v15, 0);
    if (fread(__ptr, v18, 1uLL, *(FILE **)(a1 + 16)))
    {
      uint64_t v19 = 16LL;
      if (!*(_DWORD *)(a1 + 8)) {
        uint64_t v19 = 8LL;
      }
      return *(void *)&__ptr[v19];
    }
  }

  return invalid;
}

uint64_t msl_get_frames_for_address( mach_port_name_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  uint64_t v10 = retain_file_streams_for_task_with_error(a1, 0LL, &v16);
  if (!v10) {
    return 5LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = msl_payload_for_malloc_address_in_task_helper((uint64_t)v10, a2);
  if (msl_payload_is_invalid(v12))
  {
    uint64_t frames_from_task_helper = 5LL;
  }

  else
  {
    unint64_t uniquing_table_index = msl_payload_get_uniquing_table_index(v12);
    uint64_t frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper(v11, uniquing_table_index, a3, a4, a5, 0LL);
  }

  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_uniquing_table_get_frames_from_task_helper( uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5, BOOL *a6)
{
  if (a2 > 0xFFFFFFFE) {
    return 5LL;
  }
  unsigned int v11 = a2;
  uint64_t result = update_cache_for_file_streams();
  if (!(_DWORD)result)
  {
    uniquing_table_unwind_stack_remote(*(void *)(*(void *)(a1 + 32) + 16432LL), v11, a3, a5, a4);
    if (a6)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        BOOL v14 = (*(_BYTE *)(v13 + 56) & 3) == 0;
      }
      else {
        BOOL v14 = 1;
      }
      *a6 = v14;
    }

    if (*a5) {
      return 0LL;
    }
    else {
      return 5LL;
    }
  }

  return result;
}

uint64_t msl_copy_disk_stack_logs(mach_port_name_t a1, uint64_t a2)
{
  BOOL v4 = (FILE **)retain_file_streams_for_task_with_error(a1, 0LL, &v19);
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = v4[2];
    if (v6)
    {
      unint64_t v7 = malloc(0x100000uLL);
      uint64_t updated = update_cache_for_file_streams();
      if (!(_DWORD)updated)
      {
        int v9 = *((_DWORD *)v5 + 2);
        fseeko(v6, 0LL, 0);
        if (v9) {
          size_t v10 = 32LL;
        }
        else {
          size_t v10 = 24LL;
        }
        if (v9) {
          unint64_t v11 = 0x8000LL;
        }
        else {
          unint64_t v11 = 43690LL;
        }
        size_t v12 = *(void *)&v5[4][108]._r / v10;
        while (1)
        {
          size_t v13 = v11 >= v12 ? v12 : v11;
          size_t v14 = fread(v7, v10, v13, v6);
          if (!v14) {
            break;
          }
          size_t v15 = v14;
          uint64_t v16 = (*(uint64_t (**)(uint64_t, void *, size_t))(a2 + 16))(a2, v7, v14 * v10);
          if ((_DWORD)v16) {
            goto LABEL_26;
          }
          v12 -= v15;
          if (!v12) {
            goto LABEL_23;
          }
        }

        if (ferror(v6))
        {
          uint64_t updated = 5LL;
          if (v7) {
            goto LABEL_28;
          }
          goto LABEL_29;
        }

LABEL_23:
        if (v5[5])
        {
          uint64_t v17 = v5[4];
          if (HIDWORD(v17->_write))
          {
            uint64_t v16 = (*(uint64_t (**)(uint64_t, int *))(a2 + 16))(a2, &v17->_ub._size);
LABEL_26:
            uint64_t updated = v16;
            goto LABEL_27;
          }
        }

        uint64_t updated = 0LL;
        if (!v7) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }

LABEL_27:
      if (v7) {
LABEL_28:
      }
        free(v7);
    }

    else
    {
      uint64_t updated = 5LL;
    }

LABEL_29:
    release_file_streams_for_task(a1);
    return updated;
  }

  return 5LL;
}

uint64_t msl_disk_stack_logs_enumerate_from_buffer(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  if (a3)
  {
    if (a2 >= 0x20)
    {
      unint64_t v5 = a2 >> 5;
      unint64_t v6 = (uint64_t *)(a1 + 16);
      do
      {
        uint64_t v7 = *(v6 - 2);
        uint64_t v8 = *(v6 - 1) ^ 0x5555;
        uint64_t v9 = *v6;
        size_t v10 = *(void (**)(uint64_t, int *))(a4 + 16);
        int v18 = *((_DWORD *)v6 + 2);
        uint64_t v19 = v9;
        uint64_t v20 = v7;
        uint64_t v21 = v8;
        v10(a4, &v18);
        v6 += 4;
        --v5;
      }

      while (v5);
    }
  }

  else if (a2 >= 0x18)
  {
    unint64_t v11 = a2 / 0x18;
    size_t v12 = (uint64_t *)(a1 + 8);
    do
    {
      uint64_t v13 = *((unsigned int *)v12 - 2);
      uint64_t v14 = *((unsigned int *)v12 - 1) ^ 0x5555LL;
      uint64_t v15 = *v12;
      uint64_t v16 = *(void (**)(uint64_t, int *))(a4 + 16);
      int v18 = *((_DWORD *)v12 + 2);
      uint64_t v19 = v15;
      uint64_t v20 = v13;
      uint64_t v21 = v14;
      v16(a4, &v18);
      v12 += 3;
      --v11;
    }

    while (v11);
  }

  return 0LL;
}

uint64_t msl_disk_stack_logs_enumerate_from_task(mach_port_name_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __msl_disk_stack_logs_enumerate_from_task_block_invoke;
  v5[3] = &__block_descriptor_tmp;
  v5[4] = a3;
  v5[5] = a4;
  return msl_disk_stack_logs_enumerate_from_task_with_block(a1, a2, (uint64_t)v5);
}

uint64_t msl_disk_stack_logs_enumerate_from_task_with_block(mach_port_name_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x1895FEE08];
  unint64_t v6 = retain_file_streams_for_task_with_error(a1, 0LL, __ptr);
  if (!v6) {
    return 5LL;
  }
  uint64_t v7 = v6;
  uint64_t updated = update_cache_for_file_streams();
  if (!(_DWORD)updated)
  {
    unint64_t v10 = 0LL;
    if (*((_DWORD *)v7 + 2)) {
      unint64_t v11 = 32LL;
    }
    else {
      unint64_t v11 = 24LL;
    }
    uint64_t v12 = 64LL;
    if (!*((_DWORD *)v7 + 2)) {
      uint64_t v12 = 85LL;
    }
    size_t __nitems = v12;
    char v41 = 1;
    uint64_t v13 = __ptr;
    size_t __size = v11;
    __stream = (FILE *)*((void *)v7 + 2);
    size_t v42 = *(void *)(*((void *)v7 + 4) + 16424LL) / v11;
    stat v38 = v7;
    while (1)
    {
      size_t v14 = __nitems;
      if (__nitems >= v42) {
        size_t v14 = v42;
      }
      size_t __nitems = v14;
      if (v14)
      {
        if (!__stream) {
          goto LABEL_39;
        }
        fseeko(__stream, v10, 0);
        size_t v15 = fread(__ptr, __size, __nitems, __stream);
        off_t v16 = ftello(__stream);
        if (v16 < 0) {
          goto LABEL_39;
        }
        unint64_t v10 = v16;
        v42 -= v15;
        if (!v15) {
          goto LABEL_39;
        }
      }

      else
      {
        if (!*((void *)v7 + 5)) {
          goto LABEL_39;
        }
        uint64_t v17 = *((void *)v7 + 4);
        unint64_t v18 = *(void *)(v17 + 40) + *(unsigned int *)(v17 + 84);
        BOOL v19 = v18 > v10;
        unint64_t v20 = v18 - v10;
        if (!v19) {
          goto LABEL_39;
        }
        char v41 = 0;
        uint64_t v13 = (int *)(v17 + 96);
        unint64_t v21 = 16320LL;
        if (v20 < 0x3FC0) {
          unint64_t v21 = v20;
        }
        size_t v15 = v21 / __size;
        v10 += v21 / __size * __size;
        if (!(v21 / __size))
        {
LABEL_39:
          release_file_streams_for_task(a1);
          return 0LL;
        }
      }

      if (*((_DWORD *)v7 + 2))
      {
        uint64_t v22 = 0LL;
        unsigned int v23 = 1;
        do
        {
          unint64_t v24 = &v13[8 * v22];
          uint64_t v25 = *((void *)v24 + 1);
          if (!a2 || (v26 = v25 == (a2 ^ 0x5555), uint64_t v25 = a2 ^ 0x5555, v26))
          {
            uint64_t v27 = *(void *)v24;
            uint64_t v28 = *((void *)v24 + 2);
            unsigned int v29 = *(void (**)(uint64_t, unsigned int *))(a3 + 16);
            unsigned int v44 = v24[6];
            uint64_t v45 = v28;
            uint64_t v46 = v27;
            uint64_t v47 = v25 ^ 0x5555;
            v29(a3, &v44);
          }

          uint64_t v22 = v23;
          BOOL v19 = v15 > v23++;
        }

        while (v19);
      }

      else
      {
        uint64_t v30 = 0LL;
        unsigned int v31 = 1;
        do
        {
          int v32 = v13[6 * v30 + 1];
          if (!a2 || (BOOL v26 = v32 == (a2 ^ 0x5555), v32 = a2 ^ 0x5555, v26))
          {
            unint64_t v33 = &v13[6 * v30];
            uint64_t v34 = *v33;
            uint64_t v35 = *((void *)v33 + 1);
            uint64_t v36 = *(void (**)(uint64_t, unsigned int *))(a3 + 16);
            unsigned int v44 = v33[4];
            uint64_t v45 = v35;
            uint64_t v46 = v34;
            uint64_t v47 = v32 ^ 0x5555u;
            v36(a3, &v44);
          }

          uint64_t v30 = v31;
          BOOL v19 = v15 > v31++;
        }

        while (v19);
      }

      uint64_t v7 = v38;
      if ((v41 & 1) == 0) {
        goto LABEL_39;
      }
    }
  }

  uint64_t v9 = updated;
  release_file_streams_for_task(a1);
  return v9;
}

uint64_t __msl_disk_stack_logs_enumerate_from_task_block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(uint64_t (**)(_OWORD *, uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  __int128 v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  return v3(v6, v2);
}

uint64_t msl_payload_for_vm_region_in_task(mach_port_name_t a1, unint64_t a2)
{
  __int128 v4 = retain_file_streams_for_task_with_error(a1, 0LL, &v10);
  if (!v4) {
    return msl_payload_get_invalid();
  }
  unint64_t v5 = v4;
  if (update_cache_for_file_streams())
  {
    release_file_streams_for_task(a1);
    return msl_payload_get_invalid();
  }

  unint64_t invalid = msl_payload_get_invalid();
  uint64_t v7 = v5[4];
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 16448);
    if (v8) {
      unint64_t invalid = radix_tree_lookup(v8, a2);
    }
  }

  release_file_streams_for_task(a1);
  return invalid;
}

uint64_t msl_uniquing_table_get_frames_from_task( mach_port_name_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5, BOOL *a6)
{
  if (a2 > 0xFFFFFFFE) {
    return 5LL;
  }
  uint64_t v12 = retain_file_streams_for_task_with_error(a1, 0LL, &v15);
  if (!v12) {
    return 5LL;
  }
  uint64_t frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper((uint64_t)v12, a2, a3, a4, a5, a6);
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_get_frames_for_stackid( mach_port_name_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5, BOOL *a6)
{
  uint64_t v12 = retain_file_streams_for_task_with_error(a1, 0LL, &v17);
  if (!v12) {
    return 5LL;
  }
  uint64_t v13 = (uint64_t)v12;
  unint64_t uniquing_table_index = msl_payload_get_uniquing_table_index(a2);
  uint64_t frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper(v13, uniquing_table_index, a3, a4, a5, a6);
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_uniquing_table_read_stack( uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4, unsigned int a5)
{
  uint64_t v10 = 5LL;
  if (!msl_payload_is_invalid(a2))
  {
    unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(a2);
    uniquing_table_unwind_stack_remote(a1, uniquing_table_index, a3, a4, a5);
    if (*a4) {
      return 0LL;
    }
    else {
      return 5LL;
    }
  }

  return v10;
}

void *msl_uniquing_table_copy_from_task(mach_port_name_t a1)
{
  uint64_t v2 = retain_file_streams_for_task_with_error(a1, 0LL, 0LL);
  if (v2)
  {
    if (update_cache_for_file_streams())
    {
      uint64_t v2 = 0LL;
    }

    else
    {
      uint64_t v3 = v2[4];
      uint64_t v2 = *(void **)(v3 + 16432);
      if (v2) {
        *(void *)(v3 + 16432) = 0LL;
      }
    }

    release_file_streams_for_task(a1);
  }

  return v2;
}

uint64_t append_int(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6 = _platform_strlen();
  LODWORD(v7) = 0;
  unint64_t v8 = a2;
  do
  {
    uint64_t v7 = (v7 + 1);
    BOOL v9 = v8 >= a3;
    v8 /= a3;
  }

  while (v9);
  unint64_t v10 = v6 + v7;
  if (v10 > 0x3FF) {
    return 0LL;
  }
  *(_BYTE *)(a1 + v10) = 0;
  if ((_DWORD)v7)
  {
    unint64_t v11 = (_BYTE *)(v6 + a1 + v7 - 1);
    do
    {
      *v11-- = a0123456789abcd[a2 % a3];
      a2 /= a3;
      --v7;
    }

    while (v7);
  }

  return 1LL;
}

uint64_t delete_logging_file(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (const char *)result;
    else {
      return 0LL;
    }
  }

  return result;
}

DIR *reap_orphaned_log_files_in_hierarchy(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  _platform_strlcpy();
  uint64_t result = (DIR *)_platform_strlen();
  if ((unint64_t)&result[-8].__dd_lock.__sig + 1 >= 0xFFFFFFFFFFFFFC02LL)
  {
    unint64_t v8 = result;
    uint64_t result = opendir(v27);
    if (result)
    {
      BOOL v9 = result;
      if (v27[(void)v8 - 1] != 47) {
        v27[(void)v8] = 47;
      }
      if (a2)
      {
        for (size_t i = 0LL; ; ++i)
        {
          int v11 = a2[i];
          if (!a2[i] || v11 == 47) {
            break;
          }
        }

        if (*a2 == 60) {
          size_t v12 = 0LL;
        }
        else {
          size_t v12 = i;
        }
        uint64_t v13 = &a2[i];
        if (v11) {
          size_t v14 = v13 + 1;
        }
        else {
          size_t v14 = 0LL;
        }
        int v15 = readdir(result);
        if (v15)
        {
          off_t v16 = v15;
          do
          {
            if (v16->d_type == 4)
            {
              int v18 = v16->d_name[0];
              d_name = v16->d_name;
              if (v18 != 46 && (!v12 || !strncmp(d_name, a2, v12)))
              {
                _platform_strlcpy();
                reap_orphaned_log_files_in_hierarchy(v27, v14, a3, a4);
              }
            }

            off_t v16 = readdir(v9);
          }

          while (v16);
        }
      }

      else
      {
        if (__stack_log_file_path__) {
          uint64_t v25 = strrchr((const char *)__stack_log_file_path__, 47) + 1;
        }
        else {
          uint64_t v25 = 0LL;
        }
        pid_t v19 = getpid();
        size_t v20 = _platform_strlen();
        unint64_t v21 = readdir(v9);
        if (v21)
        {
          uint64_t v22 = v21;
          do
          {
            if ((v22->d_type | 2) == 0xA && !strncmp(v22->d_name, "stack-logs.", v20))
            {
              uint64_t v23 = strtol(&v22->d_name[v20], 0LL, 10);
              uint64_t v24 = v23;
              if (a4 && v23 == (int)a3)
              {
                _platform_strlcpy();
                open_log_file_at_path(v27, a4);
              }

              else
              {
                size_t v26 = 648LL;
                *(void *)uint64_t v28 = 0xE00000001LL;
                int v29 = 1;
                int v30 = v23;
                sysctl(v28, 4u, v31, &v26, 0LL, 0LL);
                if (v26 != 648 || v24 == v19 && v25 && _platform_strcmp())
                {
                  _platform_strlcpy();
                }
              }
            }

            uint64_t v22 = readdir(v9);
          }

          while (v22);
        }
      }

      return (DIR *)closedir(v9);
    }
  }

  return result;
}

char *get_raw_log_dirs(int a1, _BYTE *a2, _BYTE *a3)
{
  if (getpid() == a1)
  {
    if (msl_get_tmp_dir()) {
      _platform_strlcpy();
    }
    else {
      *a2 = 0;
    }
    uint64_t result = msl_get_log_dir();
    if (result) {
      return (char *)_platform_strlcpy();
    }
    else {
      *a3 = 0;
    }
  }

  else
  {
    get_remote_env_var(a1, "TMPDIR", a2);
    return (char *)get_remote_env_var(a1, "MallocStackLoggingDirectory", a3);
  }

  return result;
}

FILE *open_log_file_at_path(const char *a1, uint64_t a2)
{
  __int128 v4 = fopen(a1, "re");
  if (v4)
  {
    if (strrchr(a1, 47) && _platform_strchr() && (uint64_t v5 = _platform_strchr()) != 0)
    {
      uint64_t v6 = strtoll((const char *)(v5 + 1), 0LL, 16);
      *(void *)(a2 + 16) = v4;
      *(void *)(a2 + 24) = v6;
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

void *retain_file_streams_for_task_with_error(mach_port_name_t a1, mach_vm_address_t a2, int *a3)
{
  kern_return_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  mach_vm_address_t v20;
  size_t v21;
  char *v22;
  mach_vm_address_t v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  int v28;
  unsigned int v29;
  size_t v31;
  mach_vm_size_t outsize;
  int x;
  _BYTE v34[648];
  int v35[2];
  int v36;
  int v37;
  uint64_t v38;
  stat v38 = *MEMORY[0x1895FEE08];
  if (!a1)
  {
    unint64_t v8 = 0LL;
    uint64_t v7 = 5;
    if (!a3) {
      return v8;
    }
LABEL_58:
    *a3 = v7;
    return v8;
  }

  uint64_t v6 = pid_for_task(a1, &x);
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0LL;
    if (!a3) {
      return v8;
    }
    goto LABEL_58;
  }

  os_unfair_lock_lock_with_options();
  BOOL v9 = remote_fds_count;
  if (remote_fds_count)
  {
    unint64_t v10 = (void **)remote_fds;
    int v11 = remote_fds_count;
    do
    {
      unint64_t v8 = *v10;
      if (*v10 && *(_DWORD *)v8 == a1)
      {
        uint64_t v7 = 0;
        ++*((_DWORD *)v8 + 3);
        goto LABEL_54;
      }

      ++v10;
      --v11;
    }

    while (v11);
    size_t v12 = (void **)remote_fds;
    uint64_t v13 = remote_fds_count;
    do
    {
      unint64_t v8 = *v12;
      if (*v12 && !*((_DWORD *)v8 + 3))
      {
        free_file_streams(*v12);
        goto LABEL_30;
      }

      ++v12;
      --v13;
    }

    while (v13);
    size_t v14 = remote_fds_count;
    int v15 = (char *)remote_fds;
    while (*(void *)v15)
    {
      v15 += 8;
      if (!--v14) {
        goto LABEL_19;
      }
    }
  }

  else
  {
LABEL_19:
    if (remote_fds_count) {
      off_t v16 = (2 * remote_fds_count);
    }
    else {
      off_t v16 = 1LL;
    }
    int v17 = (char *)realloc((void *)remote_fds, 8LL * v16);
    if (!v17)
    {
      unint64_t v8 = 0LL;
LABEL_28:
      uint64_t v7 = 5;
      goto LABEL_54;
    }

    remote_fds = (uint64_t)v17;
    remote_fds_count = v16;
    int v15 = &v17[8 * v9];
    bzero(v15, 8 * (v16 - v9));
  }

  unint64_t v8 = calloc(1uLL, 0x30uLL);
  *(void *)int v15 = v8;
  if (!v8) {
    goto LABEL_28;
  }
LABEL_30:
  int v18 = x;
  *(_DWORD *)unint64_t v8 = a1;
  *((_DWORD *)v8 + 1) = v18;
  if (a2)
  {
    uint64_t v7 = map_shared_memory((uint64_t)v8, a2);
    if (v7 == 257) {
      goto LABEL_42;
    }
  }

  else
  {
    uint64_t v7 = 0;
  }

  pid_t v19 = *((void *)v8 + 5);
  if (v19)
  {
    size_t v20 = *(void *)(v19 + 40);
    if (!v20) {
      goto LABEL_46;
    }
    unint64_t v21 = (*(_DWORD *)(v19 + 48) + 1);
    uint64_t v22 = (char *)malloc(v21);
    outsize = 0LL;
    mach_vm_read_overwrite(*(_DWORD *)v8, v20, v21, (mach_vm_address_t)v22, &outsize);
    if (outsize == v21) {
      open_log_file_at_path(v22, (uint64_t)v8);
    }
    free(v22);
    if (*((void *)v8 + 5)) {
      goto LABEL_46;
    }
  }

  if (!*((void *)v8 + 2))
  {
    open_log_file((void *)x, (uint64_t)v8);
    if (*((void *)v8 + 5)) {
      goto LABEL_46;
    }
  }

  uint64_t v23 = *((void *)v8 + 3);
  if (!v23) {
    goto LABEL_52;
  }
  uint64_t v24 = map_shared_memory((uint64_t)v8, v23);
  if (v24 == 257)
  {
LABEL_42:
    free_file_streams(v8);
    unint64_t v8 = 0LL;
    uint64_t v7 = 257;
    goto LABEL_54;
  }

  uint64_t v7 = v24;
  if (*((void *)v8 + 5))
  {
LABEL_46:
    *(void *)uint64_t v35 = 0xE00000001LL;
    uint64_t v36 = 1;
    size_t v37 = x;
    unsigned int v31 = 648LL;
    uint64_t v25 = sysctl(v35, 4u, v34, &v31, 0LL, 0LL);
    if (v31) {
      size_t v26 = v25 == 0;
    }
    else {
      size_t v26 = 0;
    }
    uint64_t v27 = v34[32] & 4;
    if (!v26) {
      uint64_t v27 = 0;
    }
    *((_DWORD *)v8 + 2) = v27;
    *((_DWORD *)v8 + 3) = 1;
  }

  else
  {
LABEL_52:
    free_file_streams(v8);
    unint64_t v8 = 0LL;
    if (!v7) {
      uint64_t v7 = 5;
    }
  }

LABEL_54:
  uint64_t v28 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    int v29 = __ldxr(&remote_fd_list_lock._os_unfair_lock_opaque);
    if (v29 != v28) {
      break;
    }
    if (!__stlxr(0, &remote_fd_list_lock._os_unfair_lock_opaque))
    {
      if (!a3) {
        return v8;
      }
      goto LABEL_58;
    }
  }

  __clrex();
  os_unfair_lock_unlock(&remote_fd_list_lock);
  if (a3) {
    goto LABEL_58;
  }
  return v8;
}

uint64_t map_shared_memory(uint64_t a1, mach_vm_address_t a2)
{
  mach_vm_address_t v4 = map_shared_memory_from_task(*(_DWORD *)a1, a2, 0x4000uLL);
  *(void *)(a1 + 40) = v4;
  if (v4)
  {
    uint64_t result = _platform_memcmp();
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v6 = *(void **)(a1 + 40);
    size_t v7 = 0x4000LL;
  }

  else
  {
    size_t v7 = 8LL;
    uint64_t v6 = (void *)map_shared_memory_from_task(*(_DWORD *)a1, a2, 8uLL);
    *(void *)(a1 + 40) = v6;
    if (!v6)
    {
      msl_printf(3LL);
      return 5LL;
    }
  }

  munmap(v6, v7);
  *(void *)(a1 + 40) = 0LL;
  return 257LL;
}

void *open_log_file(void *result, uint64_t a2)
{
  int v3 = (int)result;
  uint64_t v10 = *MEMORY[0x1895FEE08];
  if ((open_log_file_already_reaped & 1) == 0)
  {
    uint64_t result = reap_orphaned_log_files((uint64_t)result, a2);
    open_log_file_already_reaped = 1;
  }

  if (!*(void *)(a2 + 16))
  {
    uint64_t result = open_log_file_from_directory(v3, "/tmp/", a2);
    if (!result)
    {
      uint64_t result = get_raw_log_dirs(v3, v8, v9);
      uint64_t v4 = 0LL;
      char v5 = 1;
      do
      {
        char v6 = v5;
        size_t v7 = &v8[1024 * v4];
        if (*v7) {
          uint64_t result = open_log_file_from_directory(v3, v7, a2);
        }
        char v5 = 0;
        uint64_t v4 = 1LL;
      }

      while ((v6 & 1) != 0);
    }
  }

  return result;
}

mach_vm_address_t map_shared_memory_from_task( vm_map_read_t src_task, mach_vm_address_t src_address, mach_vm_size_t a3)
{
  target_mach_vm_address_t address = 0LL;
  vm_prot_t v4 = 1;
  vm_prot_t cur_protection = 0;
  if (mach_vm_remap_new( *MEMORY[0x1895FFD48],  &target_address,  a3,  0LL,  33,  src_task,  src_address,  0,  &cur_protection,  &v4,  2u))
  {
    return 0LL;
  }

  else
  {
    return target_address;
  }

FILE *open_log_file_from_directory(int a1, char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  char v6 = opendir(a2);
  if (!v6) {
    return 0LL;
  }
  size_t v7 = v6;
  snprintf(__str, 0x400uLL, "%s%d.", "stack-logs.", a1);
  size_t v8 = _platform_strlen();
  while (1)
  {
    BOOL v9 = readdir(v7);
    if (!v9) {
      break;
    }
    d_name = v9->d_name;
    if (!strncmp(v9->d_name, __str, v8))
    {
      snprintf(v13, 0x400uLL, "%s/%s", a2, d_name);
      int v11 = open_log_file_at_path(v13, a3);
      goto LABEL_8;
    }
  }

  int v11 = 0LL;
LABEL_8:
  closedir(v7);
  return v11;
}

void insert_node(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v31 = a2 >> 2;
  unint64_t v5 = (a2 >> 2) % (v4 - 1);
  char v6 = *(void **)(a1 + 24);
  uint64_t v7 = v6[2 * v5];
  if (v7) {
    BOOL v8 = v7 == a2;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    LODWORD(v10) = 0;
    unsigned int v11 = *(_DWORD *)(a1 + 16);
    size_t v12 = (FILE **)MEMORY[0x1895FEE10];
    unint64_t v13 = v4 / ((2 * v11) | 1);
    do
    {
      uint64_t v10 = (v10 + 1);
      unint64_t v14 = v5 + v13 * v10;
      if (v14 >= v4) {
        unint64_t v15 = v4;
      }
      else {
        unint64_t v15 = 0LL;
      }
      if (v10 <= v11)
      {
        unint64_t v5 = v14 - v15;
      }

      else
      {
        *(void *)a1 *= 4LL;
        *(void *)(a1 + 8) = 4 * v4;
        *(_DWORD *)(a1 + 16) = v11 + 3;
        *(void *)(a1 + 24) = calloc(4 * v4, 0x10uLL);
        if (v4)
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            int v17 = &v6[2 * i];
            unint64_t v18 = *v17;
            if (*v17)
            {
              LODWORD(v19) = 0;
              unint64_t v20 = *(void *)(a1 + 8);
              unint64_t v21 = (v18 >> 2) % (v20 - 1);
              unsigned int v22 = *(_DWORD *)(a1 + 16);
              uint64_t v23 = *(void *)(a1 + 24);
              while (1)
              {
                uint64_t v24 = *(void *)(v23 + 16 * v21);
                if (v24 == v18)
                {
                  fwrite("impossible collision! two address==address lists! (transfer_node)\n", 0x42uLL, 1uLL, *v12);
                  goto LABEL_23;
                }

                if (!v24) {
                  break;
                }
                uint64_t v19 = (v19 + 1);
                unint64_t v25 = v21 + v20 / ((2 * v22) | 1) * v19;
                if (v25 >= v20) {
                  uint64_t v26 = *(void *)(a1 + 8);
                }
                else {
                  uint64_t v26 = 0LL;
                }
                unint64_t v21 = v25 - v26;
              }

              *(_OWORD *)(v23 + 16 * v21) = *(_OWORD *)v17;
LABEL_23:
            }
          }
        }

        free(v6);
        LODWORD(v10) = 0;
        unint64_t v4 = *(void *)(a1 + 8);
        unint64_t v5 = v31 % (v4 - 1);
        unsigned int v11 = *(_DWORD *)(a1 + 16);
        char v6 = *(void **)(a1 + 24);
        unint64_t v13 = v4 / ((2 * v11) | 1);
      }

      uint64_t v27 = v6[2 * v5];
      if (v27) {
        BOOL v28 = v27 == a2;
      }
      else {
        BOOL v28 = 1;
      }
    }

    while (!v28);
  }

  int v29 = &v6[2 * v5];
  *int v29 = a2;
  v29[1] = a3;
}

uint64_t initialize_no_footprint_for_debug_flag()
{
  int v2 = 1;
  mach_error_t v0 = sysctlbyname("vm.task_no_footprint_for_debug", 0LL, 0LL, &v2, 4uLL);
  if (v0)
  {
    mach_error_string(v0);
    return msl_printf(3LL);
  }

  else
  {
    uint64_t result = msl_printf_nostderr(5LL);
    enabled_no_footprint = 1;
  }

  return result;
}

uint64_t sld_allocate_pages(mach_vm_size_t size)
{
  int v2 = (vm_map_t *)MEMORY[0x1895FFD48];
  if (!stack_logging_enable_logging || (mach_vm_address_t address = 0LL, object_handle = 0, (enabled_no_footprint & 1) == 0))
  {
LABEL_13:
    mach_vm_address_t address = 0LL;
    mach_error_t v7 = mach_vm_allocate(*v2, &address, size, 167772161);
    if (!v7) {
      return address;
    }
    mach_error_string(v7);
    msl_printf(3LL);
    return 0LL;
  }

  memory_object_size_t sizea = size;
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x1895FFD48], &sizea, 0LL, 139267, &object_handle, 0);
  if (memory_entry_64 || (vm_size_t v4 = sizea, sizea < size) || object_handle + 1 <= 1)
  {
    do
      unsigned __int8 v5 = __ldaxr((unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce);
    while (__stlxr(1u, (unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce));
    if ((v5 & 1) != 0) {
      goto LABEL_10;
    }
    mach_error_string(memory_entry_64);
    goto LABEL_9;
  }

  mach_error_t v8 = mach_memory_entry_ownership(object_handle, *v2, 1, 2);
  if (v8)
  {
    do
      unsigned __int8 v9 = __ldaxr((unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_5);
    while (__stlxr(1u, (unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_5));
    if ((v9 & 1) != 0) {
      goto LABEL_10;
    }
    mach_error_string(v8);
LABEL_9:
    msl_printf(3LL);
    goto LABEL_10;
  }

  mach_error_t v10 = vm_map(*v2, &address, v4, 0LL, 167772161, object_handle, 0LL, 0, 3, 3, 1u);
  if (v10)
  {
    do
      unsigned __int8 v11 = __ldaxr((unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_7);
    while (__stlxr(1u, (unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_7));
    if ((v11 & 1) == 0)
    {
      mach_error_string(v10);
      msl_printf(3LL);
    }

    mach_vm_address_t address = 0LL;
  }

LABEL_10:
  if (object_handle) {
    mach_port_deallocate(*v2, object_handle);
  }
  uint64_t result = address;
  if (!address) {
    goto LABEL_13;
  }
  return result;
}

uint64_t sld_deallocate_pages(mach_vm_address_t address, mach_vm_size_t size)
{
  return mach_vm_deallocate(*MEMORY[0x1895FFD48], address, size);
}

void set_malloc_stack_logging_start_timestamp()
{
  kern_return_t v0;
  double v1;
  if (!malloc_stack_logging_start_timestamp)
  {
    malloc_stack_logging_start_timestamp = mach_continuous_approximate_time();
    mach_error_t v0 = mach_timebase_info((mach_timebase_info_t)&set_malloc_stack_logging_start_timestamp_mach_time_info);
    uint64_t v1 = 1.0;
    if (!v0 && dword_18C6887DC)
    {
      LODWORD(v1) = set_malloc_stack_logging_start_timestamp_mach_time_info;
      uint64_t v1 = (double)*(unint64_t *)&v1 / (double)dword_18C6887DC;
      if ((*(void *)&v1 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000LL
        || *(void *)&v1 == 0x7FF0000000000000LL
        || (unint64_t)(*(void *)&v1 - 1LL) < 0xFFFFFFFFFFFFFLL
        || *(void *)&v1 == 0LL)
      {
        uint64_t v1 = 1.0;
      }
    }

    mach_to_ns_factor = *(void *)&v1;
  }

uint64_t msl_payload_create(uint64_t a1, int a2, char a3)
{
  if ((_DWORD)a1 == -1)
  {
    uint64_t v11 = -256LL;
    unsigned __int8 v10 = -1;
  }

  else
  {
    double v6 = *(double *)&mach_to_ns_factor
       * (double)(mach_continuous_approximate_time() - malloc_stack_logging_start_timestamp);
    if (a2 && (unint64_t v7 = (unint64_t)(v6 / 1000.0), !(v7 >> 39)))
    {
      uint64_t v12 = (8 * (v7 & 0x7FFFFFFFFFLL)) | (2LL * (a3 & 1)) | (a1 << 42);
      unsigned __int8 v10 = (8 * v7) | (2 * (a3 & 1)) | 1;
      uint64_t v11 = v12 & 0xFFFFFFFFFFFFFF00LL;
    }

    else
    {
      double v8 = v6 / 1000000.0;
      unint64_t v9 = 0x7FFFFFFFLL;
      unsigned __int8 v10 = (2 * (a3 & 1)) & 7 | (8 * v9);
      uint64_t v11 = (8 * v9) & 0x3FFFFFF00LL | (a1 << 34);
    }
  }

  return v11 | v10;
}

void msl_payload_set_in_lite_zone_ptr( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a2 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = a2;
  }
  uint64_t v6 = a1 + a4;
  *(void *)(a1 + a4 - 8) = a5;
  if (v5 + 8 > a4) {
    msl_payload_set_in_lite_zone_ptr_cold_1();
  }
  unint64_t v7 = a4 - v5;
  if (a4 - v5 - 8 < 8)
  {
    if (a4 - v5 == 8)
    {
      size_t v8 = 0LL;
    }

    else
    {
      if (a4 != a3) {
        msl_payload_set_in_lite_zone_ptr_cold_2();
      }
      *(_BYTE *)(v6 - 9) = 2 * (a4 - a2);
      size_t v8 = v7 - 9;
    }
  }

  else
  {
    *(_DWORD *)(v6 - 16) = a3 - a2;
    *(_WORD *)(v6 - 12) = (a3 - a2) >> 32;
    *(_BYTE *)(v6 - 10) = a4 - a3;
    *(_BYTE *)(v6 - 9) = ((a4 - a3) >> 7) | 1;
    size_t v8 = v7 - 16;
  }

  bzero((void *)(v5 + a1), v8);
}

uint64_t msl_payload_get_allocation_timestamp(unint64_t a1)
{
  if (a1 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
    return 0LL;
  }
  if ((a1 & 1) != 0) {
    return malloc_stack_logging_start_timestamp + 1000 * ((a1 >> 3) & 0x7FFFFFFFFFLL);
  }
  return malloc_stack_logging_start_timestamp + 1000000 * ((a1 >> 3) & 0x7FFFFFFF);
}

BOOL msl_payload_is_invalid(uint64_t a1)
{
  return (unint64_t)(a1 + 1) < 2;
}

uint64_t msl_payload_get_uniquing_table_index(unint64_t a1)
{
  char v1 = 42;
  if ((a1 & 1) == 0) {
    char v1 = 34;
  }
  unint64_t v2 = a1 >> v1;
  if (a1 - 1 >= 0xFFFFFFFFFFFFFFFELL) {
    return -1LL;
  }
  else {
    return v2;
  }
}

uint64_t msl_payload_get_size_info(void *a1, unsigned int *a2, unint64_t *a3, uint64_t *a4)
{
  if (a1 && a2 && ((unint64_t)(*a1 + 1LL) >= 2 ? (BOOL v4 = (*a1 & 2LL) == 0) : (BOOL v4 = 1), !v4))
  {
    unint64_t v7 = *((unsigned __int8 *)a2 + 7);
    if ((v7 & 1) != 0)
    {
      unint64_t v8 = *a2 | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 32);
      if (a3) {
        *a3 = v8;
      }
      if (!a4) {
        return 8LL;
      }
      int v9 = *((unsigned __int8 *)a2 + 7) >> 1;
      else {
        BOOL v10 = v8 >= 8;
      }
      uint64_t v5 = 0x8000LL;
      if (v10) {
        uint64_t v5 = *((unsigned __int8 *)a2 + 6) | ((v9 & 0x7F) << 8);
      }
      uint64_t result = 8LL;
      goto LABEL_11;
    }

    if (a3) {
      *a3 = v7 >> 1;
    }
    uint64_t result = 1LL;
    if (a4)
    {
      uint64_t v5 = 0LL;
LABEL_11:
      *a4 = v5;
    }
  }

  else
  {
    if (a3) {
      *a3 = 8LL;
    }
    uint64_t v5 = 0LL;
    uint64_t result = 0LL;
    if (a4) {
      goto LABEL_11;
    }
  }

  return result;
}

uint64_t msl_payload_get_invalid()
{
  return -1LL;
}

uint64_t msl_payload_create_from_index(uint64_t a1)
{
  uint64_t v1 = a1 << 34;
  if (a1 == 0xFFFFFFFFLL) {
    uint64_t v1 = -1LL;
  }
  if (a1 == -1) {
    return -1LL;
  }
  else {
    return v1;
  }
}

uint64_t msl_payload_from_lite_zone_ptr_internal(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + a1 - 8);
}

uint64_t msl_payload_from_lite_zone_ptr(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3) {
    return *(void *)(a2 + a1 - 8);
  }
  uint64_t result = -1LL;
  if (a1 && a2 >= 8 && !__CFADD__(a1, a2))
  {
    uint64_t v5 = *(void *)(a2 + a1 - 8);
    BOOL v6 = v5 == -1 || v5 == 0xFFFFFFFFLL;
    uint64_t v7 = v5 << 34;
    if (v6) {
      return -1LL;
    }
    else {
      return v7;
    }
  }

  return result;
}

uint64_t msl_uniquing_table_enumerate(uint64_t a1, uint64_t a2)
{
  int v2 = (*(unsigned __int8 *)(a1 + 60) >> 1) & 1;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = __msl_uniquing_table_enumerate_block_invoke;
  v4[3] = &unk_189DFB920;
  int v5 = v2;
  v4[4] = a2;
  return uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v4);
}

uint64_t __msl_uniquing_table_enumerate_block_invoke(uint64_t result, void *a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v4 = result;
    uint64_t v5 = a3;
    while (*(_DWORD *)(v4 + 40))
    {
      if ((*a2 & 0xFFFFFFFFFFFFLL) != 0) {
        goto LABEL_5;
      }
LABEL_6:
      a2 += 2;
      if (!--v5) {
        return result;
      }
    }

    if (!*a2) {
      goto LABEL_6;
    }
LABEL_5:
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16LL))();
    goto LABEL_6;
  }

  return result;
}

uint64_t msl_uniquing_table_get_frames_from_table( uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  uint64_t v5 = 5LL;
  if (a2 <= 0xFFFFFFFE)
  {
    uniquing_table_unwind_stack_remote(a1, a2, a3, a5, a4);
    if (*a5) {
      return 0LL;
    }
    else {
      return 5LL;
    }
  }

  return v5;
}

uint64_t msl_uniquing_table_sizeof(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0x4000LL;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = __msl_uniquing_table_sizeof_block_invoke;
  v3[3] = &unk_189DFB948;
  v3[4] = &v4;
  uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __msl_uniquing_table_sizeof_block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) += 16LL * a3;
  return result;
}

mach_vm_address_t msl_uniquing_table_serialize(uint64_t a1, mach_vm_size_t *a2)
{
  mach_vm_size_t v4 = msl_uniquing_table_sizeof(a1);
  *a2 = v4;
  mach_vm_address_t address = 0LL;
  if (mach_vm_allocate(*MEMORY[0x1895FFD48], &address, v4, 1))
  {
    mach_vm_address_t v5 = 0LL;
    *a2 = 0LL;
  }

  else
  {
    mach_vm_address_t v5 = address;
    v15[0] = 0LL;
    v15[1] = v15;
    v15[2] = 0x2000000000LL;
    *(_OWORD *)mach_vm_address_t address = *(_OWORD *)"MslUniquingTable";
    *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
    __int128 v7 = *(_OWORD *)(a1 + 32);
    __int128 v6 = *(_OWORD *)(a1 + 48);
    __int128 v8 = *(_OWORD *)(a1 + 16);
    *(_DWORD *)(v5 + 80) = *(_DWORD *)(a1 + 64);
    *(_OWORD *)(v5 + 48) = v7;
    *(_OWORD *)(v5 + 64) = v6;
    *(_OWORD *)(v5 + 32) = v8;
    v15[3] = v5 + 0x4000;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895FED80];
    v10[1] = 0x40000000LL;
    v10[2] = __msl_uniquing_table_serialize_block_invoke;
    v10[3] = &unk_189DFB970;
    v10[4] = &v11;
    v10[5] = v15;
    uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v10);
    if (v12[3] != *(void *)(a1 + 8)) {
      msl_uniquing_table_serialize_cold_1();
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(v15, 8);
  }

  return v5;
}

void *__msl_uniquing_table_serialize_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += a3;
  mach_vm_size_t v5 = 16LL * a3;
  uint64_t result = (void *)mach_vm_copy( *MEMORY[0x1895FFD48],  (mach_vm_address_t)a2,  v5,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if ((_DWORD)result) {
    uint64_t result = memcpy(*(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), a2, v5);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v5;
  return result;
}

char *msl_uniquing_table_copy_from_serialized(uint64_t a1, unint64_t a2)
{
  mach_vm_size_t v4 = (char *)malloc(0x44uLL);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)mach_vm_size_t v4 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v4 + 1) = v5;
  __int128 v6 = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v4 + 3) = v6;
  *((_DWORD *)v4 + 16) = *(_DWORD *)(a1 + 80);
  uint64_t v7 = *((void *)v4 + 1);
  if (16 * v7 + 0x4000 < a2
    || (__int128 v8 = uniquing_table_chunk_from_slots(a1 + 0x4000, v7), (*(void *)(v4 + 44) = v8) == 0LL))
  {
    free(v4);
    return 0LL;
  }

  *((_DWORD *)v4 + 16) = 1;
  return v4;
}

void msl_lock_init()
{
  stack_logging_lock = 0;
  thread_doing_logging = 0LL;
}

pthread_t __malloc_lock_stack_logging()
{
  pthread_t result = pthread_self();
  thread_doing_logging = (uint64_t)result;
  return result;
}

void __malloc_unlock_stack_logging()
{
  thread_doing_logging = 0LL;
  int v0 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v1 = __ldxr((unsigned int *)&stack_logging_lock);
    if (v1 != v0) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&stack_logging_lock);
}

BOOL __malloc_stack_logging_is_reentered()
{
  pthread_t v0 = (pthread_t)thread_doing_logging;
  return v0 == pthread_self();
}

uint64_t msl_stack_logging_locked()
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v1 = *(_DWORD *)(StatusReg + 24);
  do
  {
    if (__ldaxr((unsigned int *)&stack_logging_lock))
    {
      int v3 = 0;
      __clrex();
      return v3 ^ 1u;
    }
  }

  while (__stxr(v1, (unsigned int *)&stack_logging_lock));
  int v3 = 1;
  int v4 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v5 = __ldxr((unsigned int *)&stack_logging_lock);
    if (v5 != v4) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&stack_logging_lock);
  return v3 ^ 1u;
}

void radix_tree_lookup_interval_cold_1()
{
}

void radix_tree_delete_cold_1()
{
}

void radix_tree_insert_recursive_cold_1()
{
}

void radix_tree_insert_recursive_cold_2()
{
}

void radix_tree_insert_recursive_cold_3()
{
  __assert_rtn("set_leaf_size", "radix_tree_internal.h", 129, "leaf_size(tree, node) == size");
}

void radix_tree_insert_recursive_cold_4()
{
}

void radix_tree_delete_recursive_cold_1()
{
}

void radix_tree_delete_recursive_cold_2()
{
}

void radix_tree_delete_recursive_cold_3()
{
}

void radix_tree_init_cold_1()
{
  __assert_rtn("radix_tree_init", "radix_tree.c", 516, "tree->num_nodes >= 3");
}

void radix_tree_init_cold_2()
{
}

void radix_tree_destroy_cold_1()
{
  __assert_rtn("radix_tree_destroy", "radix_tree.c", 578, "result == KERN_SUCCESS");
}

void radix_tree_size_cold_1()
{
}

void radix_tree_lookup_recursive_cold_1()
{
}

void radix_tree_lookup_recursive_cold_2()
{
}

void radix_tree_lookup_recursive_cold_3()
{
}

void radix_tree_lookup_recursive_cold_4()
{
}

void radix_tree_lookup_recursive_cold_5()
{
}

void radix_tree_lookup_recursive_cold_6()
{
}

void radix_tree_lookup_recursive_cold_7()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 201, "size <= edgekeys.size");
}

void radix_tree_lookup_recursive_cold_8()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 199, "keyshift + edge->labelBits == RADIX_TREE_KEY_BITS");
}

void radix_tree_lookup_recursive_cold_9()
{
}

void radix_tree_lookup_recursive_cold_10()
{
  __assert_rtn("extend_key", "radix_tree_internal.h", 178, "(key & (mask << shift)) == 0");
}

void radix_tree_lookup_recursive_cold_11()
{
  __assert_rtn("extend_key", "radix_tree_internal.h", 176, "(label & ~mask) == 0");
}

void radix_tree_allocate_node_cold_1()
{
}

void radix_tree_free_node_cold_1()
{
}

void uniquing_table_remote_retain_cold_1()
{
  __assert_rtn("uniquing_table_remote_retain", "uniquing_table_reader.c", 237, "table != NULL");
}

void uniquing_table_remote_retain_cold_2()
{
}

void uniquing_table_remote_release_cold_1()
{
}

void uniquing_table_remote_enumerate_chunks_cold_1()
{
  __assert_rtn("uniquing_table_remote_enumerate_chunks", "uniquing_table_reader.c", 263, "enumerator != NULL");
}

void uniquing_table_destroy_husk_exclusive_cold_1()
{
}

void uniquing_table_release_cold_1()
{
  __assert_rtn("uniquing_table_release", "uniquing_table_mutator.c", 445, "previous_refcount >= 1");
}

void uniquing_table_release_cold_2()
{
  __assert_rtn( "uniquing_table_release",  "uniquing_table_mutator.c",  457,  "atomic_load(&table_of_specific_size->refcount) == 0");
}

void msl_get_hash_cache_cold_1()
{
  __assert_rtn("msl_get_hash_cache", "uniquing_table_mutator.c", 812, "hash_cache != NULL");
}

void uniquing_table_stack_retain_internal_cold_1()
{
  __assert_rtn( "enter_frames_in_table",  "uniquing_table_mutator.c",  902,  "*in_out_parent == UNIQUING_TABLE_INVALID_INDEX || cache_allowed");
}

void uniquing_table_stack_retain_internal_cold_2()
{
}

void uniquing_table_stack_retain_internal_cold_3()
{
  __assert_rtn("uniquing_table_expand", "uniquing_table_mutator.c", 594, "size_info_index >= 0");
}

void uniquing_table_stack_retain_internal_cold_4()
{
  __assert_rtn( "uniquing_table_stack_retain_internal",  "uniquing_table_mutator.c",  1150,  "parent_slot != UNIQUING_TABLE_INVALID_INDEX");
}

void uniquing_table_stack_retain_internal_cold_5()
{
  __assert_rtn( "enter_frames_in_table",  "uniquing_table_mutator.c",  1079,  "input_remaining_frames == thread_local_buffer->cur_cache->num_frames");
}

void uniquing_table_stack_retain_internal_cold_6()
{
  __assert_rtn( "enter_frames_in_table",  "uniquing_table_mutator.c",  1068,  "remaining_frames == checkpoint_remaining_frames");
}

void uniquing_table_stack_retain_internal_cold_7()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1067, "parent == checkpoint_parent");
}

void uniquing_table_stack_retain_internal_cold_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0( "release_nonzero_slot",  "uniquing_table_mutator.c",  a3,  "sub_result.normal_slot.refcount >= amount");
}

void uniquing_table_stack_retain_internal_cold_11()
{
}

void uniquing_table_stack_retain_internal_cold_14()
{
}

void uniquing_table_stack_retain_internal_cold_15()
{
}

void uniquing_table_retain_cold_1()
{
  __assert_rtn("uniquing_table_retain", "uniquing_table_mutator.c", 571, "updated_index != index");
}

void uniquing_table_node_release_internal_cold_1()
{
  __assert_rtn("uniquing_table_node_release_internal", "uniquing_table_mutator.c", 1275, "previous_refcount >= refs");
}

void create_and_insert_lite_zone_cold_1()
{
  __assert_rtn("create_and_insert_lite_zone", "magazine_lite.c", 728, "active_lite_zone == NULL");
}

void stack_logging_lite_destroy_cold_1()
{
  __assert_rtn("stack_logging_lite_destroy", "magazine_lite.c", 569, "active_lite_zone != NULL");
}

void stack_logging_lite_destroy_cold_2()
{
  __assert_rtn("stack_logging_lite_destroy", "magazine_lite.c", 579, "deallocate_zone_error == KERN_SUCCESS");
}

void create_log_file_cold_1()
{
}

void msl_payload_set_in_lite_zone_ptr_cold_1()
{
  __assert_rtn( "msl_payload_set_in_lite_zone_ptr",  "msl_payload.c",  205,  "expanded_size >= guaranteed_size + sizeof(msl_payload_t)");
}

void msl_payload_set_in_lite_zone_ptr_cold_2()
{
  __assert_rtn("msl_payload_set_in_lite_zone_ptr", "msl_payload.c", 229, "expanded_size == unexpanded_size");
}

void msl_uniquing_table_serialize_cold_1()
{
  __assert_rtn( "msl_uniquing_table_serialize",  "msl_uniquing_table_reader_adapter.c",  146,  "num_nodes == table->numNodes");
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x189600438]();
}

uint64_t _platform_memcmp()
{
  return MEMORY[0x189600450]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x189600460]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x189600470]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x189600478]();
}

uint64_t _platform_strlcat()
{
  return MEMORY[0x189600488]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x189600490]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x189600498]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x1896004A0]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1896004C0]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1896004D8]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1896004E0]();
}

uint64_t _simple_put()
{
  return MEMORY[0x1896004E8]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1896004F0]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x189600500]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x189600508]();
}

uint64_t _simple_string()
{
  return MEMORY[0x189600518]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x189600520]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x189600528]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1895FF8F8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895FF908](a1, *(void *)&a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1895FEF58](a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FEFB8](a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FEFC0](*(void *)&a1, a2, a3);
}

int dup(int a1)
{
  return MEMORY[0x1895FF998](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FF000](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FF020](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FF038](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FF068](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF070](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF088](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FF098](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1895FF0B0](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF0D8](__ptr, __size, __nitems, __stream);
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x1895FFAA0](buffer, size);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FF100]();
}

int isatty(int a1)
{
  return MEMORY[0x1895FF140](*(void *)&a1);
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1895FFC18]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FFC28](*(void *)&error_value);
}

kern_return_t mach_make_memory_entry_64( vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1895FFC80]( *(void *)&target_task,  size,  offset,  *(void *)&permission,  object_handle,  *(void *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership( mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x1895FFC88](*(void *)&mem_entry, *(void *)&owner, *(void *)&ledger_tag, *(void *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FFD60](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_copy( vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return MEMORY[0x1895FFD68](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FFD70](*(void *)&target, address, size);
}

kern_return_t mach_vm_read( vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1895FFD98](*(void *)&target_task, address, size, data, dataCnt);
}

kern_return_t mach_vm_read_overwrite( vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x1895FFDA0](*(void *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_remap( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFDB0]( *(void *)&target_task,  target_address,  size,  mask,  *(void *)&flags,  *(void *)&src_task,  src_address,  *(void *)&copy);
}

kern_return_t mach_vm_remap_new( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFDB8]( *(void *)&target_task,  target_address,  size,  mask,  *(void *)&flags,  *(void *)&src_task,  src_address,  *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x189600270](start_size, *(void *)&flags);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
}

uint64_t malloc_get_thread_options()
{
  return MEMORY[0x189600290]();
}

void malloc_printf(const char *format, ...)
{
}

uint64_t malloc_register_stack_logger()
{
  return MEMORY[0x1896002D0]();
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1896002E8](ptr);
}

void malloc_zone_register(malloc_zone_t *zone)
{
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FFE38](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FF1C0](a1);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1895FFE98](*(void *)&t, x);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x189600740]();
}

uint64_t pthread_self_is_exiting_np()
{
  return MEMORY[0x189600748]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FF210](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FF220](a1, a2);
}

uint64_t sandbox_query_approval_policy_for_path()
{
  return MEMORY[0x1896007E8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FF2C8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FF308](*(void *)&__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF370](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A0](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FF3E8](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FF3F0](a1, a2, a3, a4, a5);
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x189600098](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1896000B0](*(void *)&target_task, suspend_token);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x1895FF408]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1896000E8](a1);
}

kern_return_t vm_map( vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x189600130]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FF488](__str, __size, __format, a4);
}