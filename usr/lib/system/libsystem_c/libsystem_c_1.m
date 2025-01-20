int hcreate(size_t a1)
{
  int *v1;
  int result;
  int v3;
  size_t v4;
  unint64_t v5;
  char v6;
  BOOL v7;
  if (htable)
  {
    v1 = __error();
    result = 0;
    v3 = 22;
LABEL_3:
    *v1 = v3;
    return result;
  }

  v4 = 16LL;
  if (a1 > 0x10) {
    v4 = a1;
  }
  if (v4 >= 0x400000000000000LL) {
    v5 = 0x400000000000000LL;
  }
  else {
    v5 = v4;
  }
  if ((v5 & (v5 - 1)) != 0)
  {
    v6 = -1;
    do
    {
      ++v6;
      v7 = v5 > 1;
      v5 >>= 1;
    }

    while (v7);
    v5 = 2 << v6;
  }

  htablesize = v5;
  htable = (uint64_t)malloc(8 * v5);
  if (!htable)
  {
    v1 = __error();
    result = 0;
    v3 = 12;
    goto LABEL_3;
  }

  _platform_bzero();
  return 1;
}

void hdestroy_0(void)
{
  v0 = (void *)htable;
  if (htable)
  {
    unint64_t v1 = htablesize;
    if (htablesize)
    {
      unint64_t v2 = 0LL;
      do
      {
        v3 = (void *)v0[v2];
        if (v3)
        {
          do
          {
            v4 = (void *)v3[1];
            v0[v2] = *v3;
            free(v4);
            free(v3);
            v3 = (void *)v0[v2];
          }

          while (v3);
          unint64_t v1 = htablesize;
        }

        ++v2;
      }

      while (v2 < v1);
    }

    free(v0);
    htable = 0LL;
  }

ENTRY *__cdecl hsearch(ENTRY a1, ACTION a2)
{
  data = (char *)a1.data;
  key = a1.key;
  uint64_t v5 = _platform_strlen();
  v6 = (char **)(htable + 8LL * (((_DWORD)htablesize - 1) & __default_hash((uint64_t)key, v5)));
  v7 = v6;
  while (1)
  {
    v7 = (char **)*v7;
    if (!v7) {
      break;
    }
  }

  if (a2 == FIND) {
    return 0LL;
  }
  result = (ENTRY *)malloc(0x18uLL);
  if (result)
  {
    v9 = result;
    result->data = key;
    result = (ENTRY *)((char *)result + 8);
    v9[1].key = data;
    v9->key = *v6;
    *v6 = (char *)v9;
  }

  return result;
}

int heapsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  if (__nel < 2) {
    return 0;
  }
  if (!__width)
  {
    *__error() = 22;
    return -1;
  }

  size_t v7 = __nel;
  v9 = malloc(__width);
  if (!v9) {
    return -1;
  }
  v10 = v9;
  v40 = (char *)__base;
  v11 = (char *)__base - __width;
  size_t v12 = v7 >> 1;
  do
  {
    unint64_t v13 = 2 * v12;
    size_t v42 = v12;
    while (v13 <= v7)
    {
      v14 = &v11[v13 * __width];
      if (v13 >= v7)
      {
        unint64_t v16 = v13;
      }

      else
      {
        int v15 = ((uint64_t (*)(char *, char *))__compar)(&v11[v13 * __width], &v14[__width]);
        unint64_t v16 = v13 | (v15 >> 31);
        if (v15 < 0) {
          v14 += __width;
        }
      }

      v17 = &v11[v12 * __width];
      size_t v18 = __width;
      do
      {
        char v19 = *v17;
        *v17++ = *v14;
        *v14++ = v19;
        --v18;
      }

      while (v18);
      unint64_t v13 = 2 * v16;
      size_t v12 = v16;
    }

    size_t v12 = v42 - 1;
  }

  while (v42 != 1);
  uint64_t v20 = 0LL;
  size_t v41 = v7 - 1;
  uint64_t v22 = -(uint64_t)__width;
  i = v40;
  v23 = &v40[(v7 - 1) * __width];
  v44 = __compar;
  do
  {
    uint64_t v43 = v20;
    _platform_memmove();
    uint64_t v24 = 0LL;
    do
    {
      v23[v24] = i[v24];
      ++v24;
    }

    while (__width != v24);
    --v7;
    v25 = i;
    if (v7 >= 2)
    {
      unint64_t v26 = 2LL;
      uint64_t v27 = 1LL;
      do
      {
        v28 = &v11[v26 * __width];
        if (v26 >= v7)
        {
          unint64_t v30 = v26;
        }

        else
        {
          int v29 = ((uint64_t (*)(char *, char *))v44)(&v11[v26 * __width], &v28[__width]);
          unint64_t v30 = v26 | (v29 >> 31);
          if (v29 < 0) {
            v28 += __width;
          }
        }

        v31 = &v11[v27 * __width];
        size_t v32 = __width;
        do
        {
          char v33 = *v28++;
          *v31++ = v33;
          --v32;
        }

        while (v32);
        unint64_t v26 = 2 * v30;
        uint64_t v27 = v30;
      }

      while (2 * v30 <= v7);
      v25 = &v11[v30 * __width];
      v34 = v25;
      uint64_t v22 = -(uint64_t)__width;
      for (i = v40; v30 != 1; v25 = &v11[v30 * __width])
      {
        v25 = v34;
        v30 >>= 1;
        v34 = &v11[v30 * __width];
        int v35 = ((uint64_t (*)(_BYTE *, char *))v44)(v10, v34);
        size_t v36 = __width;
        v37 = v34;
        if (v35 < 0) {
          break;
        }
        do
        {
          char v38 = *v37++;
          *v25++ = v38;
          --v36;
        }

        while (v36);
      }
    }

    uint64_t v39 = 0LL;
    do
    {
      v25[v39] = v10[v39];
      ++v39;
    }

    while (__width != v39);
    uint64_t v20 = v43 + 1;
    v23 += v22;
  }

  while (v43 + 1 != v41);
  free(v10);
  return 0;
}

intmax_t imaxabs(intmax_t j)
{
  if (j < 0) {
    return -j;
  }
  return j;
}

imaxdiv_t imaxdiv(intmax_t __numer, intmax_t __denom)
{
  intmax_t v2 = __numer % __denom;
  uint64_t v3 = (__numer >= 0) & (__numer % __denom < 0);
  intmax_t v4 = __numer / __denom + v3;
  if ((_DWORD)v3) {
    intmax_t v5 = __denom;
  }
  else {
    intmax_t v5 = 0LL;
  }
  intmax_t v6 = v2 - v5;
  result.rem = v6;
  result.quot = v4;
  return result;
}

void insque(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)a2;
    if (*(void *)a2) {
      *(void *)(v2 + 8) = a1;
    }
    *(void *)a2 = a1;
    *(void *)a1 = v2;
    *((void *)a1 + 1) = a2;
  }

  else
  {
    *(void *)a1 = 0LL;
    *((void *)a1 + 1) = 0LL;
  }

uint64_t labs(uint64_t result)
{
  if (result < 0) {
    return -result;
  }
  return result;
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 % a2;
  uint64_t v3 = (a1 >= 0) & (a1 % a2 < 0);
  uint64_t v4 = a1 / a2 + v3;
  if ((_DWORD)v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v2 - v5;
  result.rem = v6;
  result.quot = v4;
  return result;
}

uint64_t llabs(uint64_t result)
{
  if (result < 0) {
    return -result;
  }
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 % a2;
  uint64_t v3 = (a1 >= 0) & (a1 % a2 < 0);
  uint64_t v4 = a1 / a2 + v3;
  if ((_DWORD)v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v2 - v5;
  result.rem = v6;
  result.quot = v4;
  return result;
}

void *__cdecl lsearch(const void *a1, void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  int64_t v8 = *a3 * a4;
  v9 = (char *)a2 + v8;
  if (v8 < 1)
  {
LABEL_5:
    _platform_memmove();
    ++*a3;
    return v9;
  }

  else
  {
    v11 = (char *)a2;
    while (((unsigned int (*)(const void *, char *))a5)(a1, v11))
    {
      v11 += a4;
      if (v11 >= v9) {
        goto LABEL_5;
      }
    }
  }

  return v11;
}

void *__cdecl lfind( const void *a1, const void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  int64_t v5 = *a3 * a4;
  if (v5 < 1) {
    return 0LL;
  }
  int64_t v8 = (char *)a2;
  v10 = (char *)a2 + v5;
  while (((unsigned int (*)(const void *, char *))a5)(a1, v8))
  {
    v8 += a4;
    if (v8 >= v10) {
      return 0LL;
    }
  }

  return v8;
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  if (__width <= 3)
  {
    *__error() = 22;
    return -1;
  }

  if (__nel)
  {
    size_t j = __width;
    size_t v73 = __width * __nel;
    int64_t v8 = (char *)malloc(__width * __nel + 8);
    if (!v8) {
      return -1;
    }
    v9 = v8;
    size_t v91 = j;
    if (__nel <= 5)
    {
      insertionsort((uint64_t)__base, __nel, j, (uint64_t (*)(unint64_t, unint64_t))__compar);
      *(void *)((unint64_t)(v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) = &v9[v73];
LABEL_43:
      v37 = &v9[v73];
      if (*(char **)((unint64_t)(v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) == &v9[v73])
      {
        uint64_t v39 = (char *)__base;
      }

      else
      {
        BOOL v89 = 0;
        uint64_t v87 = (__base | j) & 3;
        uint64_t v81 = -(uint64_t)j;
        char v38 = (char *)__base;
        v90 = __compar;
        do
        {
          uint64_t v39 = v9;
          v9 = v38;
          if (v39 != v37)
          {
            v40 = v39;
            size_t v41 = v38;
            size_t v42 = v39;
            v76 = v37;
            v78 = v38;
            v75 = v39;
            do
            {
              uint64_t v43 = *(char **)((unint64_t)(v40 + 7) & 0xFFFFFFFFFFFFFFF8LL);
              v44 = v37;
              if (v43 != v37) {
                v44 = *(char **)((unint64_t)(v43 + 7) & 0xFFFFFFFFFFFFFFF8LL);
              }
              uint64_t v45 = v43 - v39;
              v46 = &v9[v43 - v39];
              v79 = v44;
              v80 = v41;
              uint64_t v47 = v44 - v39;
              v48 = &v9[v44 - v39];
              BOOL v49 = v43 - v39 < v44 - v39;
              BOOL v50 = v41 < v46;
              BOOL v51 = v41 < v46 && v45 < v47;
              v52 = v46;
              if (v51)
              {
                unint64_t v83 = (unint64_t)v48;
                unint64_t v85 = (unint64_t)v46;
                do
                {
                  int v53 = ((uint64_t (*)(char *, char *))__compar)(v41, v52);
                  if (v53 >= 1) {
                    int v54 = 0;
                  }
                  else {
                    int v54 = -1;
                  }
                  if (v53 >= 1) {
                    v55 = v48;
                  }
                  else {
                    v55 = v46;
                  }
                  if (v53 >= 1) {
                    v56 = v52;
                  }
                  else {
                    v56 = v41;
                  }
                  if (v53 >= 1) {
                    v57 = v41;
                  }
                  else {
                    v57 = v52;
                  }
                  if (v89)
                  {
LABEL_68:
                    v58 = &v56[j];
                    if (&v56[j] >= v55)
                    {
LABEL_85:
                      v61 = &v55[v81];
                      if (&v55[v81] <= v56)
                      {
                        v56 = v55;
                      }

                      else
                      {
                        int v62 = ((uint64_t (*)(char *, char *))__compar)(v57, &v55[v81]);
                        if (v62 > v54) {
                          v63 = v55;
                        }
                        else {
                          v63 = &v55[v81];
                        }
                        if (v62 <= v54) {
                          v61 = v56;
                        }
                        v56 = v63;
                      }

                      while (v56 > &v61[j])
                      {
                        else {
                          v56 = &v61[(((v56 - v61) / j) >> 1) * j];
                        }
                      }

                      BOOL v89 = 1;
                    }

                    else
                    {
                      while (((int (*)(char *, char *))__compar)(v57, v58) > v54)
                      {
                        v56 = v58;
                        v58 += 2 * j;
                        if (v58 >= v55)
                        {
                          size_t j = v91;
                          goto LABEL_85;
                        }

                        j *= 2LL;
                      }

                      BOOL v89 = j != v91;
                      if (j > v91)
                      {
                        do
                        {
                          size_t v60 = j >> 1;
                          else {
                            v58 = &v56[j >> 1];
                          }
                          j >>= 1;
                        }

                        while (v60 > v91);
                      }

                      v56 = v58;
                      __compar = v90;
                      size_t j = v91;
                    }
                  }

                  else
                  {
                    uint64_t v59 = 6LL;
                    while (1)
                    {
                      v56 += j;
                      if (!--v59) {
                        goto LABEL_68;
                      }
                    }

                    BOOL v89 = 0;
                  }

                  v48 = (char *)v83;
                  if (v57 == v41)
                  {
                    if (v87)
                    {
                      do
                      {
                        char v67 = *v52++;
                        *v42++ = v67;
                      }

                      while (v52 < v56);
                      for (uint64_t i = 0LL; i != j; ++i)
                        v42[i] = v41[i];
                    }

                    else
                    {
                      do
                      {
                        int v68 = *(_DWORD *)v52;
                        v52 += 4;
                        *(_DWORD *)size_t v42 = v68;
                        v42 += 4;
                      }

                      while (v52 < v56);
                      for (uint64_t i = 0LL; i != j; i += 4LL)
                        *(_DWORD *)&v42[i] = *(_DWORD *)&v41[i];
                    }

                    v41 += i;
                  }

                  else
                  {
                    if (v87)
                    {
                      do
                      {
                        char v64 = *v41++;
                        *v42++ = v64;
                      }

                      while (v41 < v56);
                      for (uint64_t i = 0LL; i != j; ++i)
                        v42[i] = v52[i];
                    }

                    else
                    {
                      do
                      {
                        int v66 = *(_DWORD *)v41;
                        v41 += 4;
                        *(_DWORD *)size_t v42 = v66;
                        v42 += 4;
                      }

                      while (v41 < v56);
                      for (uint64_t i = 0LL; i != j; i += 4LL)
                        *(_DWORD *)&v42[i] = *(_DWORD *)&v52[i];
                    }

                    v52 += i;
                  }

                  v42 += i;
                  v46 = (char *)v85;
                  BOOL v49 = (unint64_t)v52 < v83;
                  BOOL v50 = (unint64_t)v41 < v85;
                }

                while ((unint64_t)v41 < v85 && (unint64_t)v52 < v83);
              }

              if (v49)
              {
                v40 = v79;
                if (v87)
                {
                  v9 = v78;
                  uint64_t v39 = v75;
                  do
                  {
                    char v69 = *v52++;
                    *v42++ = v69;
                  }

                  while (v52 < v48);
                }

                else
                {
                  v9 = v78;
                  uint64_t v39 = v75;
                  do
                  {
                    int v71 = *(_DWORD *)v52;
                    v52 += 4;
                    *(_DWORD *)size_t v42 = v71;
                    v42 += 4;
                  }

                  while (v52 < v48);
                }
              }

              else if (v50)
              {
                if (v87)
                {
                  v9 = v78;
                  v40 = v79;
                  uint64_t v39 = v75;
                  do
                  {
                    char v70 = *v41++;
                    *v42++ = v70;
                  }

                  while (v41 < v46);
                }

                else
                {
                  v9 = v78;
                  v40 = v79;
                  uint64_t v39 = v75;
                  do
                  {
                    int v72 = *(_DWORD *)v41;
                    v41 += 4;
                    *(_DWORD *)size_t v42 = v72;
                    v42 += 4;
                  }

                  while (v41 < v46);
                }
              }

              else
              {
                v9 = v78;
                v40 = v79;
                uint64_t v39 = v75;
              }

              *(void *)((unint64_t)(v80 + 7) & 0xFFFFFFFFFFFFFFF8LL) = v48;
              size_t v41 = v48;
              v37 = v76;
            }

            while (v40 != v76);
          }

          v37 = &v9[v73];
          char v38 = v39;
        }

        while (*(char **)((unint64_t)(v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) != &v9[v73]);
      }

      if (v9 == __base)
      {
        _platform_memmove();
        v9 = v39;
      }

      free(v9);
      return 0;
    }

    size_t v10 = __nel & 1 | 4;
    int64_t v11 = (__nel - v10) * j;
    insertionsort((uint64_t)__base + v11, v10, j, (uint64_t (*)(unint64_t, unint64_t))__compar);
    v82 = &v9[v73];
    *(void *)((unint64_t)&v9[v11 + 7] & 0xFFFFFFFFFFFFFFF8LL) = &v9[v73];
    int v12 = ((uint64_t (*)(void *, char *))__compar)(__base, (char *)__base + j);
    if (v11 < 1) {
      goto LABEL_43;
    }
    unint64_t v13 = (char *)__base + v11;
    uint64_t v14 = 2 * j;
    int v15 = v12 > 0;
    uint64_t v16 = -(uint64_t)j;
    v17 = v9;
    size_t v18 = (char *)__base;
    uint64_t v86 = 3 * j;
    v88 = v13;
    v77 = v9;
    uint64_t v84 = -(uint64_t)j;
    while (1)
    {
      char v19 = &v18[v14];
      if (&v18[v14] < v13)
      {
        unsigned int v20 = 2;
        v21 = v18;
        while (1)
        {
          uint64_t v22 = &v21[v14];
          v20 += 2;
          v23 = &v22[v14];
          v21 = v22;
          if (&v22[v14] >= v88) {
            goto LABEL_16;
          }
        }

        v23 = v22;
LABEL_16:
        uint64_t v16 = v84;
        if (v20 > 0xF)
        {
          for (size_t j = v91; v19 < v23; v19 += v14)
          {
            v28 = &v19[v16];
            if (((v15 ^ (((int (*)(char *, char *))__compar)(v28, v19) < 1)) & 1) == 0)
            {
              *(void *)((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) = &v77[v19 - (_BYTE *)__base];
              if ((v15 & 1) != 0)
              {
                int v29 = v18 + 1;
                size_t v30 = v91;
                while (1)
                {
                  char v31 = *(v29 - 1);
                  *(v29 - 1) = *v28;
                  *v28++ = v31;
                  if (!--v30)
                  {
                    v28 -= v14;
                    size_t v30 = v91;
                    if (v29 >= v28) {
                      break;
                    }
                  }

                  ++v29;
                }
              }

              size_t v18 = v19;
              v17 = &v77[v19 - (_BYTE *)__base];
            }

            uint64_t v16 = v84;
          }

          v9 = v77;
          if ((v15 & 1) != 0)
          {
            size_t v32 = &v19[v16];
            char v33 = v18 + 1;
            size_t v34 = v91;
            while (1)
            {
              char v35 = *(v33 - 1);
              *(v33 - 1) = *v32;
              *v32++ = v35;
              if (!--v34)
              {
                v32 -= v14;
                size_t v34 = v91;
                if (v33 >= v32) {
                  break;
                }
              }

              ++v33;
            }
          }

          if (v19 < v88
            || (v36 = ((uint64_t (*)(char *, char *))__compar)(&v19[v16], v19), uint64_t v24 = v82, v36 >= 1))
          {
            uint64_t v24 = &v77[v19 - (_BYTE *)__base];
          }

          *(void *)((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) = v24;
          size_t v18 = v19;
          goto LABEL_42;
        }

        char v19 = v23;
        size_t j = v91;
        v9 = v77;
      }

      do
      {
        uint64_t v24 = &v9[&v18[v14] - (_BYTE *)__base];
        *(void *)((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) = v24;
        if ((v15 & 1) != 0)
        {
          uint64_t v25 = 0LL;
          unint64_t v26 = &v18[j];
          do
          {
            char v27 = v18[v25];
            v18[v25] = v26[v25];
            v26[v25++] = v27;
          }

          while (j != v25);
          v18 += v16 + v25;
        }

        v18 += v14;
        v17 = v24;
      }

      while (v18 < v19);
LABEL_42:
      v15 ^= 1u;
      v17 = v24;
      unint64_t v13 = v88;
      if (v18 >= v88) {
        goto LABEL_43;
      }
    }
  }

  return 0;
}

uint64_t insertionsort( uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(unint64_t, unint64_t))
{
  uint64_t v4 = a2 - 1;
  if (a2 != 1)
  {
    unint64_t v7 = result;
    uint64_t v8 = -a3;
    unint64_t v9 = result;
    do
    {
      unint64_t v10 = v9;
      v9 += a3;
      if (v9 > v7)
      {
        unint64_t v11 = v9;
        do
        {
          unint64_t v12 = v11 + v8;
          lldiv_t result = a4(v11 + v8, v11);
          uint64_t v13 = 0LL;
          do
          {
            char v14 = *(_BYTE *)(v10 + v13);
            *(_BYTE *)(v10 + v13) = *(_BYTE *)(v11 + v13);
            *(_BYTE *)(v11 + v13++) = v14;
          }

          while ((_DWORD)a3 != (_DWORD)v13);
          v10 += v8;
          v11 += v8;
        }

        while (v12 > v7);
      }

      --v4;
    }

    while (v4);
  }

  return result;
}

uint64_t _putenvp(unsigned __int8 *a1, char **a2, uint64_t a3)
{
  if (__init__env_owned_locked(1))
  {
    uint64_t v6 = 0xFFFFFFFFLL;
  }

  else
  {
    if (a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = __env_owned;
    }
    uint64_t v6 = __setenv_locked(a1, 0LL, 1, 0, a2, v7);
  }

  environ_unlock_np();
  return v6;
}

int putenv(char *a1)
{
  if (!a1 || !*a1 || !_platform_strchr())
  {
    *__error() = 22;
    return -1;
  }

  environ_lock_np();
  if (__init__env_owned_locked(1))
  {
    environ_unlock_np();
    return -1;
  }

  uint64_t v3 = (char **)_NSGetEnviron();
  int v4 = __setenv_locked((unsigned __int8 *)a1, 0LL, 1, 0, v3, __env_owned);
  environ_unlock_np();
  return v4;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  int v8 = 2 * flsl(__nel) - 2;
  _qsort((unint64_t)__base, __nel, __width, __compar, v8);
}

uint64_t _qsort( unint64_t a1, size_t a2, size_t a3, int (__cdecl *a4)(const void *, const void *), int a5)
{
  uint64_t v7 = (char *)a1;
  int v8 = a3 != 4;
  if (a5 < 1) {
    return heapsort(v7, a2, a3, a4);
  }
  int v9 = a5;
  uint64_t v117 = -(uint64_t)a3;
  BOOL v113 = ((a1 | a3) & 3) == 0;
  BOOL v104 = a3 != 4;
  BOOL v105 = a3 != 8;
  if (((a1 | a3) & 3) != 0) {
    int v8 = 2;
  }
  BOOL v114 = ((a1 | a3) & 7) == 0LL;
  int v115 = v8;
  else {
    int v10 = a3 != 8;
  }
  int v116 = v10;
  size_t v11 = a3 >> 2;
  size_t v12 = a3 >> 3;
  while (a2 > 7)
  {
    uint64_t v13 = &v7[(a2 >> 1) * a3];
    char v14 = &v7[(a2 - 1) * a3];
    unint64_t v108 = a2;
    int v109 = v9;
    if (a2 < 0x29)
    {
      uint64_t v24 = &v7[(a2 - 1) * a3];
      uint64_t v25 = v7;
      goto LABEL_40;
    }

    size_t v15 = (a2 >> 3) * a3;
    uint64_t v16 = &v7[v15];
    size_t v106 = v15;
    v17 = &v7[2 * v15];
    int v18 = ((uint64_t (*)(char *, char *))a4)(v7, &v7[v15]);
    v110 = v16;
    char v19 = v16;
    unsigned int v20 = v17;
    int v21 = ((uint64_t (*)(char *, char *))a4)(v19, v17);
    if (v18 < 0)
    {
      size_t v22 = v106;
      if ((v21 & 0x80000000) == 0)
      {
        else {
          v23 = v20;
        }
        goto LABEL_20;
      }
    }

    else
    {
      size_t v22 = v106;
      if (v21 <= 0)
      {
        else {
          v23 = v7;
        }
LABEL_20:
        v110 = v23;
      }
    }

    v107 = &v13[-v22];
    int v26 = ((uint64_t (*)(void))a4)();
    int v27 = ((uint64_t (*)(char *, char *))a4)(v13, &v13[v22]);
    if (v26 < 0)
    {
      if ((v27 & 0x80000000) == 0)
      {
        else {
          v13 += v22;
        }
      }
    }

    else if (v27 <= 0)
    {
      else {
        v13 -= v22;
      }
    }

    uint64_t v28 = -(uint64_t)v22;
    int v29 = &v14[-2 * v22];
    uint64_t v24 = &v14[v28];
    int v30 = ((uint64_t (*)(char *, char *))a4)(v29, &v14[v28]);
    int v31 = ((uint64_t (*)(char *, char *))a4)(v24, v14);
    if (v30 < 0)
    {
      if ((v31 & 0x80000000) == 0)
      {
        else {
          uint64_t v24 = v14;
        }
      }
    }

    else if (v31 <= 0)
    {
      else {
        uint64_t v24 = v29;
      }
    }

    int v9 = v109;
    uint64_t v25 = v110;
LABEL_40:
    v111 = v25;
    int v32 = ((uint64_t (*)(void))a4)();
    uint64_t result = ((uint64_t (*)(char *, char *))a4)(v13, v24);
    if (v32 < 0)
    {
      if ((result & 0x80000000) == 0)
      {
        uint64_t result = ((uint64_t (*)(char *, char *))a4)(v111, v24);
        else {
          uint64_t v13 = v24;
        }
      }
    }

    else if ((int)result <= 0)
    {
      uint64_t result = ((uint64_t (*)(char *, char *))a4)(v111, v24);
      else {
        uint64_t v13 = v111;
      }
    }

    if (v116)
    {
      if (v115)
      {
        if (v114)
        {
          size_t v34 = v7;
          size_t v35 = a3 >> 3;
          do
          {
            uint64_t v36 = *(void *)v34;
            *(void *)size_t v34 = *(void *)v13;
            v34 += 8;
            *(void *)uint64_t v13 = v36;
            v13 += 8;
            --v35;
          }

          while (v35);
        }

        else if (v113)
        {
          size_t v39 = a3 >> 2;
          v40 = v7;
          do
          {
            int v41 = *(_DWORD *)v40;
            *(_DWORD *)v40 = *(_DWORD *)v13;
            v40 += 4;
            *(_DWORD *)uint64_t v13 = v41;
            v13 += 4;
            --v39;
          }

          while (v39);
        }

        else
        {
          size_t v42 = a3;
          uint64_t v43 = v7;
          do
          {
            char v44 = *v43;
            *v43++ = *v13;
            *v13++ = v44;
            --v42;
          }

          while (v42);
        }
      }

      else
      {
        int v38 = *(_DWORD *)v7;
        *(_DWORD *)uint64_t v7 = *(_DWORD *)v13;
        *(_DWORD *)uint64_t v13 = v38;
      }
    }

    else
    {
      uint64_t v37 = *(void *)v7;
      *(void *)uint64_t v7 = *(void *)v13;
      *(void *)uint64_t v13 = v37;
    }

    int v45 = 0;
    unsigned int v112 = v9 - 1;
    v46 = v14;
    uint64_t v47 = &v7[a3];
    v48 = &v7[a3];
LABEL_64:
    while (v48 <= v46)
    {
      uint64_t result = ((uint64_t (*)(char *, char *))a4)(v48, v7);
      if (!(_DWORD)result)
      {
        if (v116)
        {
          if (v115)
          {
            if (v114)
            {
              uint64_t v49 = 0LL;
              do
              {
                uint64_t v50 = *(void *)&v47[8 * v49];
                *(void *)&v47[8 * v49] = *(void *)&v48[8 * v49];
                *(void *)&v48[8 * v49++] = v50;
              }

              while (v12 != v49);
            }

            else if (v113)
            {
              uint64_t v64 = 0LL;
              do
              {
                int v65 = *(_DWORD *)&v47[4 * v64];
                *(_DWORD *)&v47[4 * v64] = *(_DWORD *)&v48[4 * v64];
                *(_DWORD *)&v48[4 * v64++] = v65;
              }

              while (v11 != v64);
            }

            else
            {
              uint64_t v66 = 0LL;
              do
              {
                char v67 = v47[v66];
                v47[v66] = v48[v66];
                v48[v66++] = v67;
              }

              while (a3 != v66);
            }
          }

          else
          {
            int v63 = *(_DWORD *)v47;
            *(_DWORD *)uint64_t v47 = *(_DWORD *)v48;
            *(_DWORD *)v48 = v63;
          }
        }

        else
        {
          uint64_t v62 = *(void *)v47;
          *(void *)uint64_t v47 = *(void *)v48;
          *(void *)v48 = v62;
        }

        v47 += a3;
        int v45 = 1;
      }

      v48 += a3;
    }

    while (v48 <= v46)
    {
      uint64_t result = ((uint64_t (*)(char *, char *))a4)(v46, v7);
      if ((result & 0x80000000) != 0)
      {
        if (v116)
        {
          if (v115)
          {
            if (v114)
            {
              uint64_t v60 = 0LL;
              do
              {
                uint64_t v61 = *(void *)&v48[8 * v60];
                *(void *)&v48[8 * v60] = *(void *)&v46[8 * v60];
                *(void *)&v46[8 * v60++] = v61;
              }

              while (v12 != v60);
            }

            else if (v113)
            {
              uint64_t v70 = 0LL;
              do
              {
                int v71 = *(_DWORD *)&v48[4 * v70];
                *(_DWORD *)&v48[4 * v70] = *(_DWORD *)&v46[4 * v70];
                *(_DWORD *)&v46[4 * v70++] = v71;
              }

              while (v11 != v70);
            }

            else
            {
              uint64_t v72 = 0LL;
              do
              {
                char v73 = v48[v72];
                v48[v72] = v46[v72];
                v46[v72++] = v73;
              }

              while (a3 != v72);
            }
          }

          else
          {
            int v69 = *(_DWORD *)v48;
            *(_DWORD *)v48 = *(_DWORD *)v46;
            *(_DWORD *)v46 = v69;
          }
        }

        else
        {
          uint64_t v68 = *(void *)v48;
          *(void *)v48 = *(void *)v46;
          *(void *)v46 = v68;
        }

        v48 += a3;
        v46 += v117;
        int v45 = 1;
        goto LABEL_64;
      }

      if ((_DWORD)result)
      {
        uint64_t v51 = v117;
      }

      else
      {
        if (v116)
        {
          if (v115)
          {
            if (v114)
            {
              uint64_t v52 = 0LL;
              do
              {
                uint64_t v53 = *(void *)&v46[8 * v52];
                *(void *)&v46[8 * v52] = *(void *)&v14[8 * v52];
                *(void *)&v14[8 * v52++] = v53;
              }

              while (v12 != v52);
            }

            else if (v113)
            {
              uint64_t v56 = 0LL;
              do
              {
                int v57 = *(_DWORD *)&v46[4 * v56];
                *(_DWORD *)&v46[4 * v56] = *(_DWORD *)&v14[4 * v56];
                *(_DWORD *)&v14[4 * v56++] = v57;
              }

              while (v11 != v56);
            }

            else
            {
              uint64_t v58 = 0LL;
              do
              {
                char v59 = v46[v58];
                v46[v58] = v14[v58];
                v14[v58++] = v59;
              }

              while (a3 != v58);
            }
          }

          else
          {
            int v55 = *(_DWORD *)v46;
            *(_DWORD *)v46 = *(_DWORD *)v14;
            *(_DWORD *)char v14 = v55;
          }
        }

        else
        {
          uint64_t v54 = *(void *)v46;
          *(void *)v46 = *(void *)v14;
          *(void *)char v14 = v54;
        }

        uint64_t v51 = v117;
        v14 += v117;
        int v45 = 1;
      }

      v46 += v51;
    }

    size_t v74 = v48 - v47;
    if (v47 - v7 >= v48 - v47) {
      unint64_t v75 = v48 - v47;
    }
    else {
      unint64_t v75 = v47 - v7;
    }
    if (v75)
    {
      v76 = &v48[-v75];
      if (v114)
      {
        unint64_t v77 = v75 >> 3;
        v78 = v7;
        do
        {
          uint64_t v79 = *(void *)v78;
          *(void *)v78 = *(void *)v76;
          v78 += 8;
          *(void *)v76 = v79;
          v76 += 8;
          --v77;
        }

        while (v77);
      }

      else if (v113)
      {
        unint64_t v80 = v75 >> 2;
        uint64_t v81 = v7;
        do
        {
          int v82 = *(_DWORD *)v81;
          *(_DWORD *)uint64_t v81 = *(_DWORD *)v76;
          v81 += 4;
          *(_DWORD *)v76 = v82;
          v76 += 4;
          --v80;
        }

        while (v80);
      }

      else
      {
        uint64_t v83 = -(uint64_t)v75;
        uint64_t v84 = v7;
        do
        {
          char v85 = *v84;
          *v84++ = v48[v83];
          v48[v83] = v85;
          BOOL v86 = __CFADD__(v83++, 1LL);
        }

        while (!v86);
      }
    }

    uint64_t v87 = &v7[v108 * a3];
    size_t v88 = v14 - v46;
    if (v88 >= v87 - &v14[a3]) {
      size_t v89 = v87 - &v14[a3];
    }
    else {
      size_t v89 = v88;
    }
    if (v89)
    {
      v90 = &v87[-v89];
      if (v114)
      {
        size_t v91 = v89 >> 3;
        do
        {
          uint64_t v92 = *(void *)v48;
          *(void *)v48 = *(void *)v90;
          v48 += 8;
          *(void *)v90 = v92;
          v90 += 8;
          --v91;
        }

        while (v91);
      }

      else if (v113)
      {
        size_t v93 = v89 >> 2;
        do
        {
          int v94 = *(_DWORD *)v48;
          *(_DWORD *)v48 = *(_DWORD *)v90;
          v48 += 4;
          *(_DWORD *)v90 = v94;
          v90 += 4;
          --v93;
        }

        while (v93);
      }

      else
      {
        uint64_t v95 = -(uint64_t)v89;
        do
        {
          char v96 = *v48;
          *v48++ = v87[v95];
          v87[v95] = v96;
          BOOL v86 = __CFADD__(v95++, 1LL);
        }

        while (!v86);
      }
    }

    int v9 = v112;
    if (!v45)
    {
      size_t v97 = v74;
      uint64_t result = _isort( (unint64_t)v7,  v108,  a3,  (int (*)(char *, _DWORD *))a4,  (v108 >> 2) + 1,  v116,  v115);
      size_t v74 = v97;
      if ((result & 1) != 0) {
        return result;
      }
    }

    if (v74 <= v88)
    {
      if (v74 > a3) {
        uint64_t result = _qsort(v7, v74 / a3, a3, a4, v112);
      }
      if (v88 <= a3) {
        return result;
      }
      uint64_t v7 = &v87[-v88];
      char v100 = ((_BYTE)v87 - v88) | a3;
      int v101 = v105;
      if ((v100 & 7) != 0) {
        int v101 = 2;
      }
      BOOL v102 = (v100 & 3) == 0LL;
      BOOL v113 = v102;
      BOOL v114 = (v100 & 7) == 0LL;
      int v103 = v104;
      if (!v102) {
        int v103 = 2;
      }
      int v115 = v103;
      int v116 = v101;
      a2 = v88 / a3;
      if (v109 < 2) {
        return heapsort(v7, a2, a3, a4);
      }
    }

    else
    {
      if (v88 > a3)
      {
        v98 = &v87[-v88];
        size_t v99 = v74;
        uint64_t result = _qsort(v98, v88 / a3, a3, a4, v112);
        size_t v74 = v99;
      }

      if (v74 <= a3) {
        return result;
      }
      a2 = v74 / a3;
      if (v109 < 2) {
        return heapsort(v7, a2, a3, a4);
      }
    }
  }

  return _isort((unint64_t)v7, a2, a3, (int (*)(char *, _DWORD *))a4, 0, v116, v115);
}

uint64_t _isort( unint64_t a1, uint64_t a2, unint64_t a3, int (*a4)(char *, _DWORD *), int a5, int a6, int a7)
{
  if ((uint64_t)(a3 * a2) > (uint64_t)a3)
  {
    int v10 = 0;
    unint64_t v28 = a1 + a3 * a2;
    size_t v11 = (_DWORD *)(a1 + a3);
    uint64_t v12 = -(uint64_t)a3;
    unint64_t v13 = a3 >> 2;
    unint64_t v14 = a3 >> 3;
    unint64_t v15 = a1;
    do
    {
      unint64_t v29 = v15;
      int v30 = v11;
      if ((unint64_t)v11 > a1)
      {
        do
        {
          uint64_t v16 = (_DWORD *)((char *)v11 + v12);
          if (a6)
          {
            if (a7)
            {
              if (a6 > 1)
              {
                if (a7 >= 2)
                {
                  uint64_t v24 = 0LL;
                  unint64_t v25 = v15 + a3;
                  do
                  {
                    char v26 = *(_BYTE *)(v25 + v24);
                    *(_BYTE *)(v25 + v24) = *(_BYTE *)(v15 + v24);
                    *(_BYTE *)(v15 + v24++) = v26;
                  }

                  while (a3 != v24);
                }

                else
                {
                  uint64_t v22 = 0LL;
                  do
                  {
                    int v23 = v11[v22];
                    v11[v22] = *(_DWORD *)(v15 + 4 * v22);
                    *(_DWORD *)(v15 + 4 * v22++) = v23;
                  }

                  while (v13 != v22);
                }
              }

              else
              {
                uint64_t v17 = 0LL;
                unint64_t v18 = v15 + a3;
                do
                {
                  uint64_t v19 = *(void *)(v18 + 8 * v17);
                  *(void *)(v18 + 8 * v17) = *(void *)(v15 + 8 * v17);
                  *(void *)(v15 + 8 * v17++) = v19;
                }

                while (v14 != v17);
              }
            }

            else
            {
              int v21 = *v11;
              _DWORD *v11 = *v16;
              *uint64_t v16 = v21;
            }
          }

          else
          {
            uint64_t v20 = *(void *)v11;
            *(void *)size_t v11 = *(void *)v16;
            *(void *)uint64_t v16 = v20;
          }

          if (a5)
          {
            if (v10 >= a5) {
              return 0LL;
            }
            ++v10;
          }

          v15 += v12;
          size_t v11 = (_DWORD *)((char *)v11 + v12);
        }

        while ((unint64_t)v16 > a1);
      }

      size_t v11 = (_DWORD *)((char *)v30 + a3);
      unint64_t v15 = v29 + a3;
    }

    while ((unint64_t)v30 + a3 < v28);
  }

  return 1LL;
}

void qsort_r( void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  int v10 = 2 * flsl(__nel) - 2;
  _qsort_0((char *)__base, __nel, __width, (uint64_t)a4, (uint64_t (*)(uint64_t, char *, char *))__compar, v10);
}

uint64_t _qsort_0( char *a1, unint64_t a2, size_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, char *, char *), int a6)
{
  int v8 = a1;
  int v9 = a3 != 4;
  if (a6 < 1) {
    return __heapsort_r(v8, a2, a3, a4, a5);
  }
  int v10 = a6;
  uint64_t v118 = -(uint64_t)a3;
  BOOL v114 = (((unint64_t)a1 | a3) & 3) == 0;
  BOOL v102 = a3 != 4;
  BOOL v103 = a3 != 8;
  BOOL v115 = ((a1 | a3) & 7) == 0LL;
  int v116 = v9;
  else {
    int v11 = a3 != 8;
  }
  int v117 = v11;
  size_t v12 = a3 >> 2;
  size_t v13 = a3 >> 3;
  while (2)
  {
    int v113 = v10;
    while (1)
    {
      if (a2 <= 7) {
        return _isort_0( (unint64_t)v8,  a2,  a3,  a4,  (int (*)(uint64_t, char *, _DWORD *))a5,  0,  v117,  v116);
      }
      unint64_t v14 = &v8[(a2 >> 1) * a3];
      unint64_t v15 = &v8[(a2 - 1) * a3];
      unint64_t v109 = a2;
      if (a2 < 0x29)
      {
        uint64_t v22 = &v8[(a2 - 1) * a3];
        int v23 = v8;
        goto LABEL_41;
      }

      unint64_t v16 = (a2 >> 3) * a3;
      uint64_t v17 = &v8[v16];
      unint64_t v107 = v16;
      unint64_t v18 = &v8[2 * v16];
      int v105 = a5(a4, v8, &v8[v16]);
      v110 = v17;
      int v19 = a5(a4, v17, v18);
      if (v105 < 0)
      {
        unint64_t v20 = v107;
        if ((v19 & 0x80000000) == 0)
        {
          else {
            int v21 = v18;
          }
          goto LABEL_21;
        }
      }

      else
      {
        unint64_t v20 = v107;
        if (v19 <= 0)
        {
          else {
            int v21 = v8;
          }
LABEL_21:
          v110 = v21;
        }
      }

      size_t v106 = &v14[-v20];
      int v24 = ((uint64_t (*)(uint64_t))a5)(a4);
      BOOL v104 = &v14[v20];
      int v25 = a5(a4, v14, &v14[v20]);
      if (v24 < 0)
      {
        unint64_t v26 = v107;
        if ((v25 & 0x80000000) == 0)
        {
          else {
            v14 += v20;
          }
        }
      }

      else
      {
        unint64_t v26 = v107;
        if (v25 <= 0)
        {
          else {
            v14 -= v20;
          }
        }
      }

      int v27 = &v15[-2 * v26];
      uint64_t v22 = &v15[-v26];
      unint64_t v108 = v27;
      int v28 = ((uint64_t (*)(uint64_t))a5)(a4);
      int v29 = a5(a4, v22, v15);
      if (v28 < 0)
      {
        if ((v29 & 0x80000000) == 0)
        {
          else {
            uint64_t v22 = v15;
          }
        }
      }

      else if (v29 <= 0)
      {
        else {
          uint64_t v22 = v108;
        }
      }

      int v23 = v110;
LABEL_41:
      v111 = v23;
      int v30 = ((uint64_t (*)(uint64_t))a5)(a4);
      uint64_t result = a5(a4, v14, v22);
      if (v30 < 0)
      {
        if ((result & 0x80000000) == 0)
        {
          uint64_t result = a5(a4, v111, v22);
          else {
            unint64_t v14 = v22;
          }
        }
      }

      else if ((int)result <= 0)
      {
        uint64_t result = a5(a4, v111, v22);
        else {
          unint64_t v14 = v111;
        }
      }

      if (v117)
      {
        if (v116)
        {
          if (v115)
          {
            int v32 = v8;
            size_t v33 = a3 >> 3;
            do
            {
              uint64_t v34 = *(void *)v32;
              *(void *)int v32 = *(void *)v14;
              v32 += 8;
              *(void *)unint64_t v14 = v34;
              v14 += 8;
              --v33;
            }

            while (v33);
          }

          else if (v114)
          {
            size_t v37 = a3 >> 2;
            int v38 = v8;
            do
            {
              int v39 = *(_DWORD *)v38;
              *(_DWORD *)int v38 = *(_DWORD *)v14;
              v38 += 4;
              *(_DWORD *)unint64_t v14 = v39;
              v14 += 4;
              --v37;
            }

            while (v37);
          }

          else
          {
            size_t v40 = a3;
            int v41 = v8;
            do
            {
              char v42 = *v41;
              *v41++ = *v14;
              *v14++ = v42;
              --v40;
            }

            while (v40);
          }
        }

        else
        {
          int v36 = *(_DWORD *)v8;
          *(_DWORD *)int v8 = *(_DWORD *)v14;
          *(_DWORD *)unint64_t v14 = v36;
        }
      }

      else
      {
        uint64_t v35 = *(void *)v8;
        *(void *)int v8 = *(void *)v14;
        *(void *)unint64_t v14 = v35;
      }

      int v43 = 0;
      unsigned int v112 = v113 - 1;
      char v44 = v15;
      int v45 = &v8[a3];
      v46 = &v8[a3];
LABEL_65:
      while (v46 <= v44)
      {
        uint64_t result = a5(a4, v46, v8);
        if (!(_DWORD)result)
        {
          if (v117)
          {
            if (v116)
            {
              if (v115)
              {
                uint64_t v47 = 0LL;
                do
                {
                  uint64_t v48 = *(void *)&v45[8 * v47];
                  *(void *)&v45[8 * v47] = *(void *)&v46[8 * v47];
                  *(void *)&v46[8 * v47++] = v48;
                }

                while (v13 != v47);
              }

              else if (v114)
              {
                uint64_t v62 = 0LL;
                do
                {
                  int v63 = *(_DWORD *)&v45[4 * v62];
                  *(_DWORD *)&v45[4 * v62] = *(_DWORD *)&v46[4 * v62];
                  *(_DWORD *)&v46[4 * v62++] = v63;
                }

                while (v12 != v62);
              }

              else
              {
                uint64_t v64 = 0LL;
                do
                {
                  char v65 = v45[v64];
                  v45[v64] = v46[v64];
                  v46[v64++] = v65;
                }

                while (a3 != v64);
              }
            }

            else
            {
              int v61 = *(_DWORD *)v45;
              *(_DWORD *)int v45 = *(_DWORD *)v46;
              *(_DWORD *)v46 = v61;
            }
          }

          else
          {
            uint64_t v60 = *(void *)v45;
            *(void *)int v45 = *(void *)v46;
            *(void *)v46 = v60;
          }

          v45 += a3;
          int v43 = 1;
        }

        v46 += a3;
      }

      while (v46 <= v44)
      {
        uint64_t result = a5(a4, v44, v8);
        if ((result & 0x80000000) != 0)
        {
          if (v117)
          {
            if (v116)
            {
              if (v115)
              {
                uint64_t v58 = 0LL;
                do
                {
                  uint64_t v59 = *(void *)&v46[8 * v58];
                  *(void *)&v46[8 * v58] = *(void *)&v44[8 * v58];
                  *(void *)&v44[8 * v58++] = v59;
                }

                while (v13 != v58);
              }

              else if (v114)
              {
                uint64_t v68 = 0LL;
                do
                {
                  int v69 = *(_DWORD *)&v46[4 * v68];
                  *(_DWORD *)&v46[4 * v68] = *(_DWORD *)&v44[4 * v68];
                  *(_DWORD *)&v44[4 * v68++] = v69;
                }

                while (v12 != v68);
              }

              else
              {
                uint64_t v70 = 0LL;
                do
                {
                  char v71 = v46[v70];
                  v46[v70] = v44[v70];
                  v44[v70++] = v71;
                }

                while (a3 != v70);
              }
            }

            else
            {
              int v67 = *(_DWORD *)v46;
              *(_DWORD *)v46 = *(_DWORD *)v44;
              *(_DWORD *)char v44 = v67;
            }
          }

          else
          {
            uint64_t v66 = *(void *)v46;
            *(void *)v46 = *(void *)v44;
            *(void *)char v44 = v66;
          }

          v46 += a3;
          v44 += v118;
          int v43 = 1;
          goto LABEL_65;
        }

        if ((_DWORD)result)
        {
          uint64_t v49 = v118;
        }

        else
        {
          if (v117)
          {
            if (v116)
            {
              if (v115)
              {
                uint64_t v50 = 0LL;
                do
                {
                  uint64_t v51 = *(void *)&v44[8 * v50];
                  *(void *)&v44[8 * v50] = *(void *)&v15[8 * v50];
                  *(void *)&v15[8 * v50++] = v51;
                }

                while (v13 != v50);
              }

              else if (v114)
              {
                uint64_t v54 = 0LL;
                do
                {
                  int v55 = *(_DWORD *)&v44[4 * v54];
                  *(_DWORD *)&v44[4 * v54] = *(_DWORD *)&v15[4 * v54];
                  *(_DWORD *)&v15[4 * v54++] = v55;
                }

                while (v12 != v54);
              }

              else
              {
                uint64_t v56 = 0LL;
                do
                {
                  char v57 = v44[v56];
                  v44[v56] = v15[v56];
                  v15[v56++] = v57;
                }

                while (a3 != v56);
              }
            }

            else
            {
              int v53 = *(_DWORD *)v44;
              *(_DWORD *)char v44 = *(_DWORD *)v15;
              *(_DWORD *)unint64_t v15 = v53;
            }
          }

          else
          {
            uint64_t v52 = *(void *)v44;
            *(void *)char v44 = *(void *)v15;
            *(void *)unint64_t v15 = v52;
          }

          uint64_t v49 = v118;
          v15 += v118;
          int v43 = 1;
        }

        v44 += v49;
      }

      size_t v72 = v46 - v45;
      if (v45 - v8 >= v46 - v45) {
        unint64_t v73 = v46 - v45;
      }
      else {
        unint64_t v73 = v45 - v8;
      }
      if (v73)
      {
        size_t v74 = &v46[-v73];
        if (v115)
        {
          unint64_t v75 = v73 >> 3;
          v76 = v8;
          do
          {
            uint64_t v77 = *(void *)v76;
            *(void *)v76 = *(void *)v74;
            v76 += 8;
            *(void *)size_t v74 = v77;
            v74 += 8;
            --v75;
          }

          while (v75);
        }

        else if (v114)
        {
          unint64_t v78 = v73 >> 2;
          uint64_t v79 = v8;
          do
          {
            int v80 = *(_DWORD *)v79;
            *(_DWORD *)uint64_t v79 = *(_DWORD *)v74;
            v79 += 4;
            *(_DWORD *)size_t v74 = v80;
            v74 += 4;
            --v78;
          }

          while (v78);
        }

        else
        {
          uint64_t v81 = -(uint64_t)v73;
          int v82 = v8;
          do
          {
            char v83 = *v82;
            *v82++ = v46[v81];
            v46[v81] = v83;
            BOOL v84 = __CFADD__(v81++, 1LL);
          }

          while (!v84);
        }
      }

      char v85 = &v8[v109 * a3];
      size_t v86 = v15 - v44;
      if (v86 >= v85 - &v15[a3]) {
        size_t v87 = v85 - &v15[a3];
      }
      else {
        size_t v87 = v86;
      }
      int v10 = v113 - 1;
      if (v87)
      {
        size_t v88 = &v85[-v87];
        if (v115)
        {
          size_t v89 = v87 >> 3;
          do
          {
            uint64_t v90 = *(void *)v46;
            *(void *)v46 = *(void *)v88;
            v46 += 8;
            *(void *)size_t v88 = v90;
            v88 += 8;
            --v89;
          }

          while (v89);
        }

        else if (v114)
        {
          size_t v91 = v87 >> 2;
          do
          {
            int v92 = *(_DWORD *)v46;
            *(_DWORD *)v46 = *(_DWORD *)v88;
            v46 += 4;
            *(_DWORD *)size_t v88 = v92;
            v88 += 4;
            --v91;
          }

          while (v91);
        }

        else
        {
          uint64_t v93 = -(uint64_t)v87;
          do
          {
            char v94 = *v46;
            *v46++ = v85[v93];
            v85[v93] = v94;
            BOOL v84 = __CFADD__(v93++, 1LL);
          }

          while (!v84);
        }
      }

      if (!v43)
      {
        size_t v95 = v72;
        uint64_t result = _isort_0( (unint64_t)v8,  v109,  a3,  a4,  (int (*)(uint64_t, char *, _DWORD *))a5,  (v109 >> 2) + 1,  v117,  v116);
        size_t v72 = v95;
        if ((result & 1) != 0) {
          return result;
        }
      }

      if (v72 <= v86) {
        break;
      }
      if (v86 > a3)
      {
        size_t v96 = v72;
        uint64_t result = _qsort_0(&v85[-v86], v86 / a3, a3, a4, a5, v112);
        size_t v72 = v96;
      }

      if (v72 <= a3) {
        return result;
      }
      a2 = v72 / a3;
      if (v113-- < 2) {
        return __heapsort_r(v8, a2, a3, a4, a5);
      }
    }

    if (v72 > a3) {
      uint64_t result = _qsort_0(v8, v72 / a3, a3, a4, a5, v112);
    }
    if (v86 > a3)
    {
      int v8 = &v85[-v86];
      char v98 = ((_BYTE)v85 - v86) | a3;
      int v99 = v103;
      if ((v98 & 7) != 0) {
        int v99 = 2;
      }
      BOOL v100 = (v98 & 3) == 0LL;
      BOOL v114 = v100;
      BOOL v115 = (v98 & 7) == 0LL;
      int v101 = v102;
      if (!v100) {
        int v101 = 2;
      }
      int v116 = v101;
      int v117 = v99;
      a2 = v86 / a3;
      if (v113 < 2) {
        return __heapsort_r(v8, a2, a3, a4, a5);
      }
      continue;
    }

    return result;
  }

uint64_t _isort_0( unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int (*a5)(uint64_t, char *, _DWORD *), int a6, int a7, int a8)
{
  if ((uint64_t)(a3 * a2) > (uint64_t)a3)
  {
    int v11 = 0;
    unint64_t v29 = a1 + a3 * a2;
    size_t v12 = (_DWORD *)(a1 + a3);
    uint64_t v13 = -(uint64_t)a3;
    unint64_t v14 = a3 >> 2;
    unint64_t v15 = a3 >> 3;
    unint64_t v16 = a1;
    do
    {
      unint64_t v30 = v16;
      int v31 = v12;
      if ((unint64_t)v12 > a1)
      {
        do
        {
          uint64_t v17 = (_DWORD *)((char *)v12 + v13);
          if (a7)
          {
            if (a8)
            {
              if (a7 > 1)
              {
                if (a8 >= 2)
                {
                  uint64_t v25 = 0LL;
                  unint64_t v26 = v16 + a3;
                  do
                  {
                    char v27 = *(_BYTE *)(v26 + v25);
                    *(_BYTE *)(v26 + v25) = *(_BYTE *)(v16 + v25);
                    *(_BYTE *)(v16 + v25++) = v27;
                  }

                  while (a3 != v25);
                }

                else
                {
                  uint64_t v23 = 0LL;
                  do
                  {
                    int v24 = v12[v23];
                    v12[v23] = *(_DWORD *)(v16 + 4 * v23);
                    *(_DWORD *)(v16 + 4 * v23++) = v24;
                  }

                  while (v14 != v23);
                }
              }

              else
              {
                uint64_t v18 = 0LL;
                unint64_t v19 = v16 + a3;
                do
                {
                  uint64_t v20 = *(void *)(v19 + 8 * v18);
                  *(void *)(v19 + 8 * v18) = *(void *)(v16 + 8 * v18);
                  *(void *)(v16 + 8 * v18++) = v20;
                }

                while (v15 != v18);
              }
            }

            else
            {
              int v22 = *v12;
              *size_t v12 = *v17;
              _DWORD *v17 = v22;
            }
          }

          else
          {
            uint64_t v21 = *(void *)v12;
            *(void *)size_t v12 = *(void *)v17;
            *(void *)uint64_t v17 = v21;
          }

          if (a6)
          {
            if (v11 >= a6) {
              return 0LL;
            }
            ++v11;
          }

          v16 += v13;
          size_t v12 = (_DWORD *)((char *)v12 + v13);
        }

        while ((unint64_t)v17 > a1);
      }

      size_t v12 = (_DWORD *)((char *)v31 + a3);
      unint64_t v16 = v30 + a3;
    }

    while ((unint64_t)v31 + a3 < v29);
  }

  return 1LL;
}

int radixsort( const unsigned __int8 **__base, int __nel, const unsigned __int8 *__table, unsigned int __endbyte)
{
  if (__table)
  {
    if (__table[__endbyte] - 1 <= 0xFD)
    {
      *__error() = 22;
      return -1;
    }
  }

  else
  {
    if (__endbyte)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = __endbyte;
      do
      {
        v8[v5] = v5 + 1;
        ++v5;
      }

      while (__endbyte != v5);
      v8[__endbyte] = 0;
      if (__endbyte > 0xFE) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
      v8[0] = 0;
    }

    uint64_t v7 = v6 + 1;
    do
    {
      v8[v7] = v7;
      ++v7;
    }

    while (v7 != 256);
  }

unint64_t r_sort_a(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1895FE128](a1, a2);
  int v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  int v10 = v9;
  uint64_t v11 = v2;
  unint64_t result = pthread_once(&r_sort_count_control, (void (*)(void))r_sort_count_allocate);
  if (!(_DWORD)result)
  {
    r_sort_a_count = r_sort_a_count;
    uint64_t v60 = v11;
    int v61 = v10;
    int v62 = v8;
    uint64_t v13 = r_sort_a_nc;
    uint64_t v14 = 1LL;
    unsigned int v15 = r_sort_a_bmin;
    uint64_t v16 = r_sort_a_nc;
    do
    {
      uint64_t v17 = &v60 + 2 * v14--;
      uint64_t v18 = (unint64_t *)(&v60 + 2 * v14);
      unint64_t result = *v18;
      uint64_t v19 = *((unsigned int *)v17 - 2);
      int v20 = *((_DWORD *)v17 - 1);
      uint64_t v21 = v20;
      if ((int)v19 >= 20)
      {
        unint64_t v24 = result + 8 * v19;
        uint64_t v25 = (int *)r_sort_a_count;
        for (uint64_t i = v20; ; ++i)
        {
          if (!(_DWORD)v16)
          {
            unsigned int v15 = 255;
            r_sort_a_bmin = 255;
            char v27 = (uint64_t *)result;
            do
            {
              uint64_t v28 = *v27++;
              uint64_t v29 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(v28 + i));
              int v30 = v25[v29];
              v25[v29] = v30 + 1;
              if ((_DWORD)v29 != v4 && v30 == 0)
              {
                if ((int)v15 > (int)v29)
                {
                  r_sort_a_bmin = v29;
                  unsigned int v15 = v29;
                }

                uint64_t v13 = (v16 + 1);
                r_sort_a_nc = v16 + 1;
                LODWORD(v16) = v16 + 1;
              }
            }

            while ((unint64_t)v27 < v24);
            if (v14 + (int)v16 >= 513)
            {
              *((_DWORD *)v17 - 1) = i;
              unint64_t result = r_sort_a(result, v19);
              uint64_t v22 = r_sort_a_nc;
              unsigned int v15 = r_sort_a_bmin;
              goto LABEL_55;
            }
          }

          if ((_DWORD)v16 != 1 || v25[v15] != (_DWORD)v19) {
            break;
          }
          LODWORD(v16) = 0;
          uint64_t v13 = 0LL;
          v25[v15] = 0;
          r_sort_a_nc = 0;
        }

        *((_DWORD *)v17 - 1) = i;
        if (v4)
        {
          v59[255] = result + 8 * v19;
          unint64_t v44 = result;
        }

        else
        {
          unint64_t v44 = result + 8LL * *v25;
          v59[0] = v44;
        }

        if ((int)v13 < 1)
        {
          uint64_t v22 = v13;
          uint64_t v47 = &v60 + 2 * v14;
        }

        else
        {
          uint64_t v45 = -4LL - (void)v25;
          int v46 = 2;
          uint64_t v47 = &v60 + 2 * v14;
          uint64_t v48 = &v25[v15];
          do
          {
            uint64_t v49 = (char *)v48 + v45;
            do
            {
              int v51 = *v48++;
              int v50 = v51;
              v49 += 4;
            }

            while (!v51);
            if (v50 >= 2)
            {
              uint64_t v52 = (unint64_t *)(&v60 + 2 * v14);
              if (v50 > v46)
              {
                uint64_t v47 = &v60 + 2 * v14;
                int v46 = v50;
              }

              unint64_t *v52 = v44;
              ++v14;
              *((_DWORD *)v52 + 2) = v50;
              *((_DWORD *)v52 + 3) = i + 1;
              int v50 = *(v48 - 1);
            }

            v44 += 8LL * v50;
            *(void *)((char *)v59 + 2 * (void)v49) = v44;
            BOOL v53 = __OFSUB__((_DWORD)v13, 1);
            LODWORD(v13) = v13 - 1;
          }

          while (!(((int)v13 < 0) ^ v53 | ((_DWORD)v13 == 0)));
          uint64_t v22 = 0LL;
          r_sort_a_nc = 0;
        }

        __int128 v54 = *(_OWORD *)v18;
        *(_OWORD *)uint64_t v18 = *(_OWORD *)v47;
        *(_OWORD *)uint64_t v47 = v54;
        do
        {
          uint64_t v55 = *(void *)result;
          uint64_t v56 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(*(void *)result + (int)i));
          char v57 = (uint64_t *)(v59[v56] - 8LL);
          v59[v56] = v57;
          if (result >= (unint64_t)v57)
          {
            uint64_t v58 = v55;
          }

          else
          {
            do
            {
              uint64_t v58 = *v57;
              uint64_t *v57 = v55;
              uint64_t v56 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(v58 + (int)i));
              char v57 = (uint64_t *)(v59[v56] - 8LL);
              v59[v56] = v57;
              uint64_t v55 = v58;
            }

            while (result < (unint64_t)v57);
          }

          *(void *)unint64_t result = v58;
          result += 8LL * *(int *)(r_sort_a_count + 4 * v56);
          *(_DWORD *)(r_sort_a_count + 4 * v56) = 0;
        }

        while (result < v24);
LABEL_55:
        uint64_t v23 = v22;
      }

      else
      {
        uint64_t v22 = v13;
        uint64_t v23 = v16;
        *((_DWORD *)v17 - 1) = v20;
        if ((int)v19 >= 2)
        {
          int v32 = (void *)result;
          do
          {
            if ((unint64_t)++v32 > result)
            {
              uint64_t v33 = *v32;
              uint64_t v34 = *v32 + v21 + 1;
              uint64_t v35 = v32;
              int v36 = v32;
              do
              {
                uint64_t v38 = *--v36;
                uint64_t v37 = v38;
                int v39 = (unsigned __int8 *)(v38 + v21);
                unsigned int v40 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(v33 + v21));
                if (v40 != v4)
                {
                  int v41 = (unsigned __int8 *)v34;
                  do
                  {
                    ++v39;
                    unsigned int v42 = *v41++;
                    unsigned int v40 = *(unsigned __int8 *)(v6 + v42);
                  }

                  while (v40 != v4);
                }

                *(v35 - 1) = v33;
                *uint64_t v35 = v37;
                uint64_t v35 = v36;
              }

              while ((unint64_t)v36 > result);
            }

            BOOL v43 = (int)v19 <= 2;
            LODWORD(v19) = v19 - 1;
          }

          while (!v43);
        }
      }

      uint64_t v13 = v22;
      uint64_t v16 = v23;
    }

    while (v14 > 0);
  }

  return result;
}

int sradixsort( const unsigned __int8 **__base, int __nel, const unsigned __int8 *__table, unsigned int __endbyte)
{
  int v4 = __nel;
  if (!__table)
  {
    if (__endbyte)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = __endbyte;
      do
      {
        v26[v8] = v8 + 1;
        ++v8;
      }

      while (__endbyte != v8);
      uint64_t v6 = v26;
      v26[__endbyte] = 0;
      if (__endbyte > 0xFE) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v9 = 0LL;
      v26[0] = 0;
    }

    uint64_t v10 = v9 + 1;
    do
    {
      uint64_t v6 = v26;
      v26[v10] = v10;
      ++v10;
    }

    while (v10 != 256);
LABEL_12:
    int v7 = 0;
LABEL_13:
    if (__nel > 19)
    {
      uint64_t v23 = malloc(8LL * __nel);
      if (!v23) {
        return -1;
      }
      unint64_t v24 = v23;
      r_sort_b((uint64_t)__base, (uint64_t)v23);
      free(v24);
    }

    else if (__nel >= 2)
    {
      uint64_t v11 = __base;
      do
      {
        if (++v11 > __base)
        {
          size_t v12 = *v11;
          uint64_t v13 = (uint64_t)(*v11 + 1);
          uint64_t v14 = v11;
          unint64_t v15 = (unint64_t)v11;
          do
          {
            uint64_t v17 = *(unsigned __int8 **)(v15 - 8);
            v15 -= 8LL;
            uint64_t v16 = v17;
            unsigned int v18 = v6[*v12];
            if (v7 == v18)
            {
              uint64_t v19 = v16;
            }

            else
            {
              int v20 = (unsigned __int8 *)v13;
              uint64_t v19 = v16;
              do
              {
                if (v18 != v6[*v19]) {
                  break;
                }
                ++v19;
                int v21 = *v20++;
                unsigned int v18 = v6[v21];
              }

              while (v7 != v18);
            }

            if (v18 >= v6[*v19]) {
              break;
            }
            *(v14 - 1) = v12;
            void *v14 = v16;
            uint64_t v14 = (void *)v15;
          }

          while (v15 > (unint64_t)__base);
        }
      }

      while (v4-- > 2);
    }

    return 0;
  }

  uint64_t v6 = __table;
  int v7 = __table[__endbyte];
  *__error() = 22;
  return -1;
}

unint64_t r_sort_b(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1895FE128](a1, a2);
  int v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  int v10 = v9;
  unint64_t v12 = v11;
  uint64_t v13 = v2;
  unint64_t result = pthread_once(&r_sort_count_control, (void (*)(void))r_sort_count_allocate);
  if (!(_DWORD)result)
  {
    r_sort_b_count = r_sort_b_count;
    uint64_t v58 = v13;
    uint64_t v15 = 1LL;
    int v59 = v10;
    int v60 = v8;
    do
    {
      uint64_t v16 = &v58 + 2 * v15--;
      uint64_t v17 = (unint64_t *)(&v58 + 2 * v15);
      unint64_t result = *v17;
      uint64_t v18 = *((unsigned int *)v16 - 2);
      uint64_t v19 = *((int *)v16 - 1);
      if ((int)v18 > 19)
      {
        int v32 = r_sort_b_nc;
        if (r_sort_b_nc) {
          goto LABEL_30;
        }
        int v33 = 255;
        r_sort_b_bmin = 255;
        uint64_t v34 = (void *)(result + 8 * v18 - 8);
        uint64_t v35 = r_sort_b_count;
        do
        {
          uint64_t v36 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(*v34 + v19));
          int v37 = *(_DWORD *)(v35 + 4 * v36);
          *(_DWORD *)(v35 + 4 * v36) = v37 + 1;
          if ((_DWORD)v36 != v4 && v37 == 0)
          {
            if (v33 > (int)v36)
            {
              r_sort_b_bmin = v36;
              int v33 = v36;
            }

            r_sort_b_nc = ++v32;
          }

          --v34;
        }

        while ((unint64_t)v34 >= result);
        if (v15 + v32 < 513)
        {
LABEL_30:
          if (v4)
          {
            v57[255] = result + 8 * v18;
            uint64_t v39 = r_sort_b_count;
            unsigned int v40 = (_DWORD *)(r_sort_b_count + 1020);
            unint64_t v41 = result;
          }

          else
          {
            unsigned int v40 = (_DWORD *)r_sort_b_count;
            unint64_t v41 = result + 8LL * *(int *)r_sort_b_count;
            v57[0] = v41;
            uint64_t v39 = r_sort_b_count;
          }

          _DWORD *v40 = 0;
          if (v32 < 1)
          {
            uint64_t v45 = &v58 + 2 * v15;
          }

          else
          {
            unsigned int v42 = (int *)(v39 + 4LL * r_sort_b_bmin);
            uint64_t v43 = -4 - v39;
            int v44 = 2;
            uint64_t v45 = &v58 + 2 * v15;
            do
            {
              int v46 = (char *)v42 + v43;
              do
              {
                int v48 = *v42++;
                int v47 = v48;
                v46 += 4;
              }

              while (!v48);
              if (v47 >= 2)
              {
                uint64_t v49 = (unint64_t *)(&v58 + 2 * v15);
                *uint64_t v49 = v41;
                if (v47 > v44)
                {
                  uint64_t v45 = &v58 + 2 * v15;
                  int v44 = v47;
                }

                ++v15;
                *((_DWORD *)v49 + 2) = v47;
                *((_DWORD *)v49 + 3) = v19 + 1;
              }

              v41 += 8LL * v47;
              *(void *)((char *)v57 + 2 * (void)v46) = v41;
              *(v42 - 1) = 0;
              BOOL v50 = __OFSUB__(v32--, 1);
            }

            while (!((v32 < 0) ^ v50 | (v32 == 0)));
            r_sort_b_nc = 0;
          }

          __int128 v51 = *(_OWORD *)v17;
          *(_OWORD *)uint64_t v17 = *(_OWORD *)v45;
          *(_OWORD *)uint64_t v45 = v51;
          uint64_t v52 = 8 * v18;
          do
          {
            *(void *)(v12 + v52 - 8) = *(void *)(result - 8 + v52);
            v52 -= 8LL;
          }

          while (v12 + v52 > v12);
          BOOL v53 = (uint64_t *)(v12 + 8 * v18 - 8);
          do
          {
            uint64_t v54 = *v53--;
            uint64_t v55 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(v54 + v19));
            uint64_t v56 = v57[v55];
            *(void *)(v56 - 8) = v54;
            v57[v55] = v56 - 8;
          }

          while ((unint64_t)v53 >= v12);
        }

        else
        {
          unint64_t result = r_sort_b(result, v12, v18);
        }
      }

      else if ((int)v18 >= 2)
      {
        int v20 = (void *)*v17;
        do
        {
          if ((unint64_t)++v20 > result)
          {
            uint64_t v21 = *v20;
            uint64_t v22 = *v20 + v19 + 1;
            uint64_t v23 = v20;
            unint64_t v24 = v20;
            do
            {
              uint64_t v26 = *--v24;
              uint64_t v25 = v26;
              char v27 = (unsigned __int8 *)(v26 + v19);
              unsigned int v28 = *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(v21 + v19));
              if (v28 != v4)
              {
                uint64_t v29 = (unsigned __int8 *)v22;
                do
                {
                  ++v27;
                  unsigned int v30 = *v29++;
                  unsigned int v28 = *(unsigned __int8 *)(v6 + v30);
                }

                while (v28 != v4);
              }

              *(v23 - 1) = v21;
              void *v23 = v25;
              uint64_t v23 = v24;
            }

            while ((unint64_t)v24 > result);
          }

          BOOL v31 = (int)v18 <= 2;
          LODWORD(v18) = v18 - 1;
        }

        while (!v31);
      }
    }

    while (v15 > 0);
  }

  return result;
}

void *r_sort_count_allocate()
{
  r_sort_a_count = (uint64_t)calloc(0x100uLL, 4uLL);
  unint64_t result = calloc(0x100uLL, 4uLL);
  r_sort_b_count = (uint64_t)result;
  return result;
}

int rand_r(unsigned int *a1)
{
  unsigned int v1 = *a1;
  if (!*a1) {
    unsigned int v1 = 123459876;
  }
  uint64_t v2 = 16807 * (v1 % 0x1F31D) - 2836LL * (v1 / 0x1F31D);
  unsigned int v3 = v2 + 0x7FFFFFFF;
  if (v2 >= 0) {
    unsigned int v3 = v2;
  }
  *a1 = v3;
  return v3 & 0x7FFFFFFF;
}

int rand(void)
{
  unint64_t v0 = next;
  if (!next) {
    unint64_t v0 = 123459876LL;
  }
  int64_t v1 = 16807 * (v0 % 0x1F31D) - 2836 * (v0 / 0x1F31D);
  next = v1 + (v1 < 0 ? 0x7FFFFFFFuLL : 0);
  return next & 0x7FFFFFFF;
}

void srand(unsigned int a1)
{
  next = a1;
}

void sranddev(void)
{
  if ((open_NOCANCEL() & 0x80000000) != 0 || (uint64_t NOCANCEL = read_NOCANCEL(), close_NOCANCEL(), NOCANCEL != 8))
  {
    gettimeofday(&v1, 0LL);
    next = LODWORD(v1.tv_sec) ^ (getpid() << 16) ^ v1.tv_usec;
  }

void srandom(unsigned int a1)
{
  timeval v1 = state;
  *state = a1;
  if (!rand_type)
  {
    int v7 = 50;
    do
    {
LABEL_13:
      random();
      --v7;
    }

    while (v7);
    return;
  }

  int v2 = rand_deg;
  if (rand_deg > 1)
  {
    unsigned int v3 = (unsigned int *)(v1 + 1);
    uint64_t v4 = rand_deg - 1LL;
    do
    {
      if (a1) {
        signed int v5 = a1;
      }
      else {
        signed int v5 = 123459876;
      }
      signed int v6 = 16807 * (v5 % 127773) - 2836 * (v5 / 127773);
      a1 = v6 + 0x7FFFFFFF;
      if (v6 >= 0) {
        a1 = v6;
      }
      *v3++ = a1;
      --v4;
    }

    while (v4);
  }

  fptr[0] = &v1[rand_sep];
  rptr = v1;
  if (v2 >= 1)
  {
    int v7 = 10 * v2;
    goto LABEL_13;
  }

uint64_t random(void)
{
  if (rand_type)
  {
    unint64_t v0 = fptr[0];
    timeval v1 = rptr + 1;
    unsigned int v2 = *fptr[0] + *rptr;
    *fptr[0] = v2;
    unsigned int v3 = v0 + 1;
    unsigned int v4 = v2 >> 1;
    else {
      signed int v5 = v1;
    }
    else {
      unsigned int v3 = state;
    }
    fptr[0] = v3;
    rptr = v1;
  }

  else
  {
    int v6 = *state;
    if (!*state) {
      int v6 = 123459876;
    }
    int v7 = 16807 * (v6 % 127773) - 2836 * (v6 / 127773);
    if (v7 < 0) {
      --v7;
    }
    unsigned int v4 = v7 & 0x7FFFFFFF;
    *state = v4;
  }

  return v4;
}

void srandomdev(void)
{
  int v0 = rand_type;
  uint64_t v1 = rand_deg;
  if ((open_NOCANCEL() & 0x80000000) != 0
    || (v0 ? (uint64_t v2 = 4 * v1) : (uint64_t v2 = 4LL), NOCANCEL = read_NOCANCEL(), close_NOCANCEL(), NOCANCEL != v2))
  {
    gettimeofday(&v5, 0LL);
    pid_t v4 = getpid();
    srandom(LODWORD(v5.tv_sec) ^ (v4 << 16) ^ v5.tv_usec);
  }

  else if (rand_type)
  {
    fptr[0] = &state[rand_sep];
    rptr = state;
  }

char *__cdecl initstate(unsigned int a1, char *a2, size_t a3)
{
  timeval v5 = (char *)(state - 1);
  if (rand_type) {
    int v6 = 5 * ((unint64_t)((char *)rptr - (char *)state) >> 2) + rand_type;
  }
  else {
    int v6 = 0;
  }
  *(_DWORD *)timeval v5 = v6;
  if (a3 > 7)
  {
    if (a3 >= 0x20)
    {
      int v9 = 3;
      if (a3 >= 0x40)
      {
        if (a3 < 0x100) {
          int v11 = 3;
        }
        else {
          int v11 = 4;
        }
        uint64_t v12 = 63LL;
        if (a3 >= 0x100) {
          int v13 = 63;
        }
        else {
          int v13 = 31;
        }
        if (a3 >= 0x100) {
          int v9 = 1;
        }
        else {
          int v9 = 3;
        }
        if (a3 < 0x100) {
          uint64_t v12 = 31LL;
        }
        if (a3 >= 0x80) {
          int v7 = v11;
        }
        else {
          int v7 = 2;
        }
        if (a3 >= 0x80) {
          int v8 = v13;
        }
        else {
          int v8 = 15;
        }
        if (a3 >= 0x80)
        {
          uint64_t v10 = v12;
        }

        else
        {
          int v9 = 1;
          uint64_t v10 = 15LL;
        }
      }

      else
      {
        int v8 = 7;
        int v7 = 1;
        uint64_t v10 = 7LL;
      }
    }

    else
    {
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      uint64_t v10 = 0LL;
    }

    rand_type = v7;
    rand_deg = v8;
    rand_sep = v9;
    state = (int *)(a2 + 4);
    end_ptr = (uint64_t)&a2[4 * v10 + 4];
    srandom(a1);
    if (a3 >= 0x20) {
      int v14 = 5 * ((unint64_t)((char *)rptr - (a2 + 4)) >> 2) + v7;
    }
    else {
      int v14 = 0;
    }
    *(_DWORD *)a2 = v14;
  }

  else
  {
    fprintf(__stderrp, "random: not enough state (%ld bytes); ignored.\n", a3);
    return 0LL;
  }

  return v5;
}

char *__cdecl setstate(const char *a1)
{
  unsigned int v2 = *(_DWORD *)a1 / 5u;
  unsigned int v3 = *(_DWORD *)a1 % 5u;
  unint64_t result = (char *)(state - 1);
  if (rand_type) {
    int v5 = 5 * ((unint64_t)((char *)rptr - (char *)state) >> 2) + rand_type;
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)unint64_t result = v5;
  rand_type = v3;
  uint64_t v6 = degrees[v3];
  rand_deg = degrees[v3];
  int v7 = seps[v3];
  rand_sep = v7;
  int v8 = (int *)(a1 + 4);
  state = v8;
  if (v3)
  {
    rptr = &v8[v2];
    fptr[0] = &v8[(v7 + v2) % v6];
  }

  end_ptr = (uint64_t)&v8[v6];
  return result;
}

char *__cdecl realpath(const char *a1, char *a2)
{
  unsigned int v3 = (_BYTE *)MEMORY[0x1895FE128](a1, a2);
  if (!v3)
  {
    uint64_t v12 = __error();
    int v7 = 0LL;
    int v13 = 22;
LABEL_14:
    *uint64_t v12 = v13;
    return v7;
  }

  int v5 = v3;
  if (!*v3)
  {
    uint64_t v12 = __error();
    int v7 = 0LL;
    int v13 = 2;
    goto LABEL_14;
  }

  uint64_t v6 = v4;
  int v7 = v4;
  if (!v4)
  {
    int v7 = (char *)malloc(0x400uLL);
    if (!v7) {
      return v7;
    }
  }

  if ((realpath_rootdev_inited & 1) == 0)
  {
    realpath_rootdev_inited = 1;
    if (stat("/", &v40) < 0) {
      goto LABEL_86;
    }
    realpath_rootdev = v40.st_dev;
  }

  __error();
  if (*v5 == 47)
  {
    *(_WORD *)int v7 = 47;
    if (!v5[1]) {
      return v7;
    }
    unint64_t v8 = _platform_strlcpy();
    if (v8 >= 0x400) {
      goto LABEL_83;
    }
    uint64_t v9 = v8;
    uint64_t v10 = (stat *)&realpath_rootdev;
    unint64_t v11 = 1LL;
  }

  else
  {
    if (!__private_getcwd(v7, 1024LL, 0))
    {
      *(_WORD *)int v7 = 46;
      goto LABEL_86;
    }

    unint64_t v11 = _platform_strlen();
    unint64_t v15 = _platform_strlcpy();
    if (v15 > 0x3FF || v11 > 0x3FF) {
      goto LABEL_83;
    }
    uint64_t v9 = v15;
    if (v11 < 2)
    {
      uint64_t v10 = (stat *)&realpath_rootdev;
    }

    else
    {
      uint64_t v10 = &v40;
      if (stat(v7, &v40) < 0) {
        goto LABEL_86;
      }
    }
  }

  if (!v9)
  {
    unint64_t v17 = v11;
LABEL_90:
    if (v17 >= 2 && v7[v17 - 1] == 47) {
      v7[v17 - 1] = 0;
    }
    return v7;
  }

  unsigned int v38 = 0;
  uint64_t st_dev = v10->st_dev;
  while (2)
  {
    unsigned int v39 = v2;
    uint64_t v2 = st_dev;
    unint64_t v17 = v11;
    while (1)
    {
      uint64_t v18 = _platform_strchr();
      uint64_t v19 = v18;
      uint64_t v20 = v18 - (void)v46;
      if (v18) {
        uint64_t v21 = v18 - (void)v46;
      }
      else {
        uint64_t v21 = v9;
      }
      _platform_memmove();
      *((_BYTE *)&v44 + v21) = 0;
      if (v19)
      {
        _platform_memmove();
        v9 += ~v20;
      }

      else
      {
        uint64_t v9 = 0LL;
        v46[0] = 0;
      }

      if (v7[v17 - 1] != 47)
      {
        if (v17 + 1 >= 0x400) {
          goto LABEL_83;
        }
        v7[v17] = 47;
        v7[++v17] = 0;
      }

      if (!(_BYTE)v44 || v44 == 46) {
        goto LABEL_41;
      }
      if (v44 ^ 0x2E2E | v45) {
        break;
      }
      if (v17 >= 2)
      {
        v7[v17 - 1] = 0;
        uint64_t v22 = strrchr(v7, 47);
        v22[1] = 0;
        unint64_t v17 = v22 + 1 - v7;
      }

LABEL_86:
  if (v6) {
    return 0LL;
  }
  int v35 = *__error();
  free(v7);
  int v7 = 0LL;
  *__error() = v35;
  return v7;
}

  if (v6) {
    return 0LL;
  }
  int v35 = *__error();
  free(v7);
  int v7 = 0LL;
  *__error() = v35;
  return v7;
}

void remque(void *a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v1 = (void *)*((void *)a1 + 1);
  if (v1) {
    *uint64_t v1 = v2;
  }
  if (v2) {
    *(void *)(v2 + 8) = v1;
  }
}

uint64_t _do_nothing()
{
  return 0LL;
}

uint64_t _owned_ptr_add(uint64_t a1, unint64_t a2)
{
  uint64_t result = _owned_ptr_search(a1, a2, &v8);
  if ((_DWORD)result)
  {
    int v5 = *(_DWORD *)(a1 + 8);
    uint64_t v6 = *(int *)(a1 + 12);
    int v7 = *(void **)a1;
    if (v5 >= (int)v6)
    {
      uint64_t result = (uint64_t)realloc(*(void **)a1, 16 * v6);
      if (!result) {
        return result;
      }
      int v7 = (void *)result;
      *(void *)a1 = result;
      *(_DWORD *)(a1 + 12) = 2 * v6;
    }

    uint64_t result = _platform_memmove();
    v7[v8 + 1] = a2;
    *(_DWORD *)(a1 + 8) = v5 + 1;
  }

  return result;
}

uint64_t _owned_ptr_search(uint64_t a1, unint64_t a2, int *a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  int v4 = v3 - 1;
  unint64_t v5 = *(void *)(*(void *)a1 + 8LL * (v3 - 1));
  if (v5 < a2)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a3) {
      return result;
    }
    goto LABEL_3;
  }

  if (v5 == a2)
  {
LABEL_14:
    uint64_t result = 0LL;
    if (!a3) {
      return result;
    }
LABEL_3:
    *a3 = v4;
    return result;
  }

  if (v3 < 3)
  {
    int v7 = 0;
  }

  else
  {
    int v7 = 0;
    int v8 = v4;
    do
    {
      int v4 = (v8 + v7) / 2;
      unint64_t v9 = *(void *)(*(void *)a1 + 8LL * v4);
      if (v9 >= a2)
      {
        if (v9 <= a2) {
          goto LABEL_14;
        }
        int v8 = (v8 + v7) / 2;
      }

      else
      {
        int v7 = (v8 + v7) / 2;
      }
    }

    while (v8 - v7 > 1);
  }

  uint64_t result = 0xFFFFFFFFLL;
  int v4 = v7;
  if (a3) {
    goto LABEL_3;
  }
  return result;
}

void *_owned_ptr_alloc()
{
  int v0 = malloc(0x10uLL);
  if (v0)
  {
    uint64_t v1 = malloc(0x40uLL);
    void *v0 = v1;
    if (v1)
    {
      *uint64_t v1 = 0LL;
      v0[1] = 0x800000001LL;
    }

    else
    {
      int v2 = *__error();
      free(v0);
      int v0 = 0LL;
      *__error() = v2;
    }
  }

  return v0;
}

uint64_t __init__env_owned_locked(int a1)
{
  if (__env_owned) {
    return 0LL;
  }
  if (!a1) {
    int v1 = *__error();
  }
  int v4 = _owned_ptr_alloc();
  __env_owned = (uint64_t)v4;
  if (v4) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = 0xFFFFFFFFLL;
  }
  if (!a1 && !v4)
  {
    *__error() = v1;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t __setenv_locked(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int a4, char **a5, uint64_t a6)
{
  unint64_t v11 = a1;
  uint64_t v12 = __findenv_locked(a1, &v39, *a5);
  if (!v12)
  {
    uint64_t v20 = *a5;
    if (*(void *)*a5)
    {
      uint64_t v14 = 0LL;
      while (*(void *)&v20[8 * v14++ + 8])
        ;
    }

    else
    {
      LODWORD(v14) = 0;
    }

    if (_owned_ptr_search(a6, (unint64_t)*a5, &v38))
    {
      uint64_t v22 = malloc(8LL * (v14 + 2));
      if (!v22) {
        return 0xFFFFFFFFLL;
      }
      unint64_t v23 = (unint64_t)v22;
      _owned_ptr_add(a6, (unint64_t)v22);
      _platform_memmove();
    }

    else
    {
      int v24 = (char *)realloc(v20, 8LL * (v14 + 2));
      if (!v24) {
        return 0xFFFFFFFFLL;
      }
      unint64_t v23 = (unint64_t)v24;
      if (*a5 == v24) {
        goto LABEL_28;
      }
      if (v38 && *(_DWORD *)(a6 + 8) > v38)
      {
        _platform_memmove();
        --*(_DWORD *)(a6 + 8);
      }

      _owned_ptr_add(a6, v23);
    }

    *a5 = (char *)v23;
LABEL_28:
    *(void *)(v23 + 8LL * (v14 + 1)) = 0LL;
    int v39 = v14;
    goto LABEL_29;
  }

  if (a3)
  {
    int v13 = v12;
    LODWORD(v14) = v39;
    unint64_t v15 = *(char **)&(*a5)[8 * v39];
    if (!_owned_ptr_search(a6, (unint64_t)v15, &v38))
    {
      if (a4 >= 1)
      {
        unint64_t v16 = _platform_strlen();
        if (_platform_strlen() >= v16) {
          goto LABEL_59;
        }
        unint64_t v17 = (char *)realloc(v15, v13 - v15 + v16 + 1);
        unint64_t v18 = (unint64_t)v17;
        if (v17) {
          BOOL v19 = v17 == v15;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          *(void *)&(*a5)[8 * v39] = v17;
          int v13 = &v17[v13 - v15];
          if (v38 && *(_DWORD *)(a6 + 8) > v38)
          {
            _platform_memmove();
            --*(_DWORD *)(a6 + 8);
          }

          _owned_ptr_add(a6, v18);
          goto LABEL_55;
        }

        if (v17)
        {
LABEL_59:
          do
          {
LABEL_55:
            int v37 = *a2++;
            *v13++ = v37;
          }

          while (v37);
          return 0LL;
        }

        return 0xFFFFFFFFLL;
      }

      if (v38 && *(_DWORD *)(a6 + 8) > v38)
      {
        _platform_memmove();
        --*(_DWORD *)(a6 + 8);
      }

      free(v15);
      goto LABEL_46;
    }

_BYTE *__unsetenv_locked(_BYTE *a1, char *a2, uint64_t a3)
{
  for (uint64_t result = __findenv_locked(a1, &v12, a2); result; uint64_t result = __findenv_locked(a1, &v12, a2))
  {
    uint64_t v7 = v12;
    int v8 = *(void **)&a2[8 * v12];
    if (!_owned_ptr_search(a3, (unint64_t)v8, &v11))
    {
      if (v11 && *(_DWORD *)(a3 + 8) > v11)
      {
        _platform_memmove();
        --*(_DWORD *)(a3 + 8);
        int v8 = *(void **)&a2[8 * v12];
      }

      free(v8);
      uint64_t v7 = v12;
    }

    unint64_t v9 = &a2[8 * v7 + 8];
    do
    {
      uint64_t v10 = *(void *)v9;
      *((void *)v9 - 1) = *(void *)v9;
      v9 += 8;
    }

    while (v10);
  }

  return result;
}

void *_copyenv(void *a1)
{
  if (a1)
  {
    if (*a1)
    {
      size_t v1 = 1LL;
      while (a1[v1++])
        ;
    }

    else
    {
      size_t v1 = 1LL;
    }

    int v4 = malloc(v1 * 8);
    if (v4) {
      _platform_memmove();
    }
  }

  else
  {
    int v3 = malloc(8uLL);
    int v4 = v3;
    if (v3) {
      void *v3 = 0LL;
    }
  }

  return v4;
}

uint64_t _deallocenvstate(void **a1)
{
  if (!a1 || (void **)__env_owned == a1)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  else
  {
    free(*a1);
    free(a1);
    return 0LL;
  }

uint64_t _setenvp(unsigned __int8 *a1, unsigned __int8 *a2, int a3, char **a4, uint64_t a5)
{
  uint64_t v10 = (void *)__env_owned;
  if (__env_owned || (uint64_t v10 = _owned_ptr_alloc(), (__env_owned = (uint64_t)v10) != 0))
  {
    if (a5) {
      uint64_t v11 = a5;
    }
    else {
      uint64_t v11 = (uint64_t)v10;
    }
    uint64_t v12 = __setenv_locked(a1, a2, a3, 1, a4, v11);
  }

  else
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }

  environ_unlock_np();
  return v12;
}

uint64_t _unsetenvp(_BYTE *a1, char **a2, uint64_t a3)
{
  uint64_t v6 = (void *)__env_owned;
  if (__env_owned || (uint64_t v6 = _owned_ptr_alloc(), (__env_owned = (uint64_t)v6) != 0))
  {
    if (a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = (uint64_t)v6;
    }
    __unsetenv_locked(a1, *a2, v7);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  environ_unlock_np();
  return v8;
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  if (!__name || !*__name || _platform_strchr())
  {
    *__error() = 22;
    return -1;
  }

  environ_lock_np();
  if (!__env_owned)
  {
    __env_owned = (uint64_t)_owned_ptr_alloc();
    if (!__env_owned)
    {
      environ_unlock_np();
      return -1;
    }
  }

  uint64_t v7 = (char **)_NSGetEnviron();
  int v8 = __setenv_locked((unsigned __int8 *)__name, (unsigned __int8 *)__value, __overwrite, 1, v7, __env_owned);
  environ_unlock_np();
  return v8;
}

int unsetenv(const char *a1)
{
  if (!a1 || !*a1 || _platform_strchr())
  {
    *__error() = 22;
    return -1;
  }

  environ_lock_np();
  if (!__env_owned)
  {
    __env_owned = (uint64_t)_owned_ptr_alloc();
    if (!__env_owned)
    {
      environ_unlock_np();
      return -1;
    }
  }

  int v3 = (char **)_NSGetEnviron();
  __unsetenv_locked(a1, *v3, __env_owned);
  environ_unlock_np();
  return 0;
}

hash_table *__cdecl hash_create(int size)
{
  int v2 = (hash_table *)malloc(0x10uLL);
  uint64_t result = 0LL;
  if ((size & 0x80000000) == 0 && v2)
  {
    if (size) {
      unsigned int v4 = size;
    }
    else {
      unsigned int v4 = 97;
    }
    uint64_t result = (hash_table *)malloc(8LL * v4);
    v2->buckets = (hash_node **)result;
    if (result)
    {
      _platform_bzero();
      v2->size = v4;
      return v2;
    }
  }

  return result;
}

void hash_destroy(hash_table *table, char *key, void (__cdecl *nukefunc)(char *, void *))
{
  int v4 = *key;
  if (*key)
  {
    unsigned int v5 = 0;
    uint64_t v6 = key + 1;
    do
    {
      v5 ^= v4 ^ (2 * v5);
      int v7 = *v6++;
      int v4 = v7;
    }

    while (v7);
  }

  else
  {
    unsigned int v5 = 0;
  }

  p_next = &table->buckets[v5 % table->size];
  unint64_t v9 = *p_next;
  if (*p_next)
  {
    if (_platform_strcmp())
    {
      while (1)
      {
        uint64_t v10 = v9;
        unint64_t v9 = v9->next;
        if (!v9) {
          break;
        }
        if (!_platform_strcmp())
        {
          p_next = &v10->next;
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      *p_next = v9->next;
      if (nukefunc) {
        ((void (*)(char *, void *))nukefunc)(v9->key, v9->data);
      }
      free(v9);
    }
  }

void *__cdecl hash_search(hash_table *table, char *key, void *datum, void (__cdecl *replace_func)(void *))
{
  unsigned int size = table->size;
  int v8 = *key;
  if (*key)
  {
    unsigned int v9 = 0;
    uint64_t v10 = key + 1;
    do
    {
      v9 ^= v8 ^ (2 * v9);
      int v11 = *v10++;
      int v8 = v11;
    }

    while (v11);
  }

  else
  {
    unsigned int v9 = 0;
  }

  int v12 = v9 % size;
  buckets = table->buckets;
  uint64_t v14 = buckets[v9 % size];
  if (!v14)
  {
LABEL_10:
    if (datum)
    {
      data = (hash_node *)malloc(0x18uLL);
      if (!data) {
        return data;
      }
      uint64_t v17 = _platform_strlen();
      unint64_t v18 = (char *)malloc(v17 + 1);
      data->key = v18;
      if (v18)
      {
        *unint64_t v18 = 0;
        strcat(v18, key);
        data->data = datum;
        data->next = v14;
        buckets[v12] = data;
        return data;
      }
    }

    return 0LL;
  }

  unint64_t v15 = buckets[v12];
  while (_platform_strcmp())
  {
    unint64_t v15 = v15->next;
    if (!v15) {
      goto LABEL_10;
    }
  }

  data = (hash_node *)v15->data;
  if (replace_func)
  {
    ((void (*)(void *))replace_func)(v15->data);
    data = 0LL;
    v15->data = datum;
  }

  return data;
}

void hash_traverse(hash_table *table, int (__cdecl *func)(char *, void *, void *), void *arg)
{
  if (func)
  {
    uint64_t size = table->size;
    if ((int)size >= 1)
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        int v8 = table->buckets[v7];
        if (v8) {
          break;
        }
LABEL_7:
        if (++v7 == size) {
          return;
        }
      }

      while (((unsigned int (*)(char *, void *, void *))func)(v8->key, v8->data, arg))
      {
        int v8 = v8->next;
        if (!v8) {
          goto LABEL_7;
        }
      }
    }
  }

void hash_purge(hash_table *table, void (__cdecl *purge_func)(char *, void *))
{
  uint64_t size = table->size;
  if ((int)size >= 1)
  {
    for (uint64_t i = 0LL; i != size; ++i)
    {
      uint64_t v6 = table->buckets[i];
      if (v6)
      {
        do
        {
          if (purge_func) {
            ((void (*)(char *, void *))purge_func)(v6->key, v6->data);
          }
          next = v6->next;
          free(v6);
          uint64_t v6 = next;
        }

        while (next);
        table->buckets[i] = 0LL;
      }
    }
  }

uint64_t hash_stats(unsigned int *a1, int a2)
{
  uint64_t v15 = *a1;
  if ((int)v15 <= 0)
  {
    putchar(10);
    return printf("%d element%s in storage.\n");
  }

  uint64_t v3 = 0LL;
  int v4 = 0;
  int v5 = 0;
  int v6 = 0;
  int v7 = 0;
  do
  {
    int v16 = v6;
    uint64_t v8 = *(void *)(*((void *)a1 + 1) + 8 * v3);
    if (v8)
    {
      int v9 = 0;
      char v10 = 1;
      while (1)
      {
        if ((v10 & 1) != 0)
        {
          ++v7;
          if (a2)
          {
            printf("bucket %2d: ", v3);
LABEL_9:
            printf(" %s", *(const char **)v8);
          }
        }

        else if (a2)
        {
          goto LABEL_9;
        }

        char v10 = 0;
        ++v9;
        uint64_t v8 = *(void *)(v8 + 16);
        if (!v8) {
          goto LABEL_13;
        }
      }
    }

    int v9 = 0;
LABEL_13:
    if (v9 == v16) {
      int v11 = v5 + 1;
    }
    else {
      int v11 = v5;
    }
    if (v9 <= v16) {
      int v6 = v16;
    }
    else {
      int v6 = v9;
    }
    if (v9 > v16) {
      int v5 = 1;
    }
    else {
      int v5 = v11;
    }
    if (a2 && v9) {
      printf(" (%d)\n", v9);
    }
    v4 += v9;
    ++v3;
  }

  while (v3 != v15);
  putchar(10);
  int v12 = "s";
  if (v4 == 1) {
    int v12 = "";
  }
  uint64_t result = printf("%d element%s in storage.\n", v4, v12);
  if (v4)
  {
    printf("%d of %d (%.2f%%) buckets are in use\n", v7, v15, (double)v7 * 100.0 / (double)(int)v15);
    printf("the maximum number of elements in a bucket is %d (%d times)\n", v6, v5);
    printf("average per bucket is %f\n", (double)v4 / (double)v7);
    return printf("optimal would be %f\n");
  }

  return result;
}

intmax_t strtoimax_l(const char *nptr, char **endptr, int base, locale_t a4)
{
  locale_t v6 = (locale_t)&__global_locale;
  if (a4 == (locale_t)-1LL) {
    locale_t v7 = (locale_t)&__global_locale;
  }
  else {
    locale_t v7 = a4;
  }
  if (!a4) {
    locale_t v7 = (locale_t)&__c_locale;
  }
  if (v7 != (locale_t)-1LL) {
    locale_t v6 = v7;
  }
  if (!v7) {
    locale_t v6 = (locale_t)&__c_locale;
  }
  uint64_t v8 = nptr;
  do
  {
    int v10 = *v8++;
    int v9 = v10;
    int v11 = &_DefaultRuneLocale;
    if (v10 < 0) {
      int v11 = *(_RuneLocale **)(*((void *)v6 + 166) + 120LL);
    }
  }

  while ((v11->__runetype[v9] & 0x4000) != 0);
  if (v9 == 43 || v9 == 45)
  {
    char v13 = *v8++;
    char v12 = v13;
  }

  else
  {
    char v12 = v9;
  }

  if ((base & 0xFFFFFFEF) != 0 || v12 != 48)
  {
    BOOL v16 = base == 0;
    if (v12 != 48)
    {
      int v17 = 10;
      goto LABEL_29;
    }
  }

  else
  {
    if ((*(unsigned __int8 *)v8 | 0x20) == 0x78)
    {
      char v12 = v8[1];
      if ((v12 - 48) < 0xAu
        || (unsigned int v14 = *((unsigned __int8 *)v8 + 1) - 65, v14 <= 0x25) && ((1LL << v14) & 0x3F0000003FLL) != 0)
      {
        v8 += 2;
        unsigned int v15 = 16;
        goto LABEL_34;
      }
    }

    BOOL v16 = base == 0;
    char v12 = 48;
  }

  int v17 = 8;
LABEL_29:
  if (v16) {
    unsigned int v15 = v17;
  }
  else {
    unsigned int v15 = base;
  }
  if (v15 - 37 < 0xFFFFFFDD)
  {
    unint64_t v18 = 0LL;
LABEL_58:
    *__error() = 22;
    int v25 = 1;
    unint64_t v20 = v18;
    if (!endptr) {
      return v20;
    }
    goto LABEL_59;
  }

intmax_t strtoimax(const char *__nptr, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoimax_l(__nptr, __endptr, __base, v5);
}

uint64_t strtol_l(const char *a1, char **a2, int a3, locale_t a4)
{
  locale_t v6 = (locale_t)&__global_locale;
  if (a4 == (locale_t)-1LL) {
    locale_t v7 = (locale_t)&__global_locale;
  }
  else {
    locale_t v7 = a4;
  }
  if (!a4) {
    locale_t v7 = (locale_t)&__c_locale;
  }
  if (v7 != (locale_t)-1LL) {
    locale_t v6 = v7;
  }
  if (!v7) {
    locale_t v6 = (locale_t)&__c_locale;
  }
  uint64_t v8 = a1;
  do
  {
    int v10 = *v8++;
    int v9 = v10;
    int v11 = &_DefaultRuneLocale;
    if (v10 < 0) {
      int v11 = *(_RuneLocale **)(*((void *)v6 + 166) + 120LL);
    }
  }

  while ((v11->__runetype[v9] & 0x4000) != 0);
  if (v9 == 43 || v9 == 45)
  {
    char v13 = *v8++;
    char v12 = v13;
  }

  else
  {
    char v12 = v9;
  }

  if ((a3 & 0xFFFFFFEF) != 0 || v12 != 48)
  {
    BOOL v16 = a3 == 0;
    if (v12 != 48)
    {
      int v17 = 10;
      goto LABEL_29;
    }
  }

  else
  {
    if ((*(unsigned __int8 *)v8 | 0x20) == 0x78)
    {
      char v12 = v8[1];
      if ((v12 - 48) < 0xAu
        || (unsigned int v14 = *((unsigned __int8 *)v8 + 1) - 65, v14 <= 0x25) && ((1LL << v14) & 0x3F0000003FLL) != 0)
      {
        v8 += 2;
        unsigned int v15 = 16;
        goto LABEL_34;
      }
    }

    BOOL v16 = a3 == 0;
    char v12 = 48;
  }

  int v17 = 8;
LABEL_29:
  if (v16) {
    unsigned int v15 = v17;
  }
  else {
    unsigned int v15 = a3;
  }
  if (v15 - 37 < 0xFFFFFFDD)
  {
    unint64_t v18 = 0LL;
LABEL_58:
    *__error() = 22;
    int v25 = 1;
    unint64_t v20 = v18;
    if (!a2) {
      return v20;
    }
    goto LABEL_59;
  }

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtol_l(__str, __endptr, __base, v5);
}

uint64_t strtoll_l(const char *a1, char **a2, int a3, locale_t a4)
{
  locale_t v6 = (locale_t)&__global_locale;
  if (a4 == (locale_t)-1LL) {
    locale_t v7 = (locale_t)&__global_locale;
  }
  else {
    locale_t v7 = a4;
  }
  if (!a4) {
    locale_t v7 = (locale_t)&__c_locale;
  }
  if (v7 != (locale_t)-1LL) {
    locale_t v6 = v7;
  }
  if (!v7) {
    locale_t v6 = (locale_t)&__c_locale;
  }
  uint64_t v8 = a1;
  do
  {
    int v10 = *v8++;
    int v9 = v10;
    int v11 = &_DefaultRuneLocale;
    if (v10 < 0) {
      int v11 = *(_RuneLocale **)(*((void *)v6 + 166) + 120LL);
    }
  }

  while ((v11->__runetype[v9] & 0x4000) != 0);
  if (v9 == 43 || v9 == 45)
  {
    char v13 = *v8++;
    char v12 = v13;
  }

  else
  {
    char v12 = v9;
  }

  if ((a3 & 0xFFFFFFEF) != 0 || v12 != 48)
  {
    BOOL v16 = a3 == 0;
    if (v12 != 48)
    {
      int v17 = 10;
      goto LABEL_29;
    }
  }

  else
  {
    if ((*(unsigned __int8 *)v8 | 0x20) == 0x78)
    {
      char v12 = v8[1];
      if ((v12 - 48) < 0xAu
        || (unsigned int v14 = *((unsigned __int8 *)v8 + 1) - 65, v14 <= 0x25) && ((1LL << v14) & 0x3F0000003FLL) != 0)
      {
        v8 += 2;
        unsigned int v15 = 16;
        goto LABEL_34;
      }
    }

    BOOL v16 = a3 == 0;
    char v12 = 48;
  }

  int v17 = 8;
LABEL_29:
  if (v16) {
    unsigned int v15 = v17;
  }
  else {
    unsigned int v15 = a3;
  }
  if (v15 - 37 < 0xFFFFFFDD)
  {
    unint64_t v18 = 0LL;
LABEL_58:
    *__error() = 22;
    int v25 = 1;
    unint64_t v20 = v18;
    if (!a2) {
      return v20;
    }
    goto LABEL_59;
  }

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoll_l(__str, __endptr, __base, v5);
}

uint64_t strtoq(const char *__str, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoll_l(__str, __endptr, __base, v5);
}

unint64_t strtoul_l(const char *a1, char **a2, int a3, locale_t a4)
{
  locale_t v6 = (locale_t)&__global_locale;
  if (a4 == (locale_t)-1LL) {
    locale_t v7 = (locale_t)&__global_locale;
  }
  else {
    locale_t v7 = a4;
  }
  if (!a4) {
    locale_t v7 = (locale_t)&__c_locale;
  }
  if (v7 != (locale_t)-1LL) {
    locale_t v6 = v7;
  }
  if (!v7) {
    locale_t v6 = (locale_t)&__c_locale;
  }
  uint64_t v8 = a1;
  do
  {
    int v10 = *v8++;
    int v9 = v10;
    int v11 = &_DefaultRuneLocale;
    if (v10 < 0) {
      int v11 = *(_RuneLocale **)(*((void *)v6 + 166) + 120LL);
    }
  }

  while ((v11->__runetype[v9] & 0x4000) != 0);
  if (v9 == 43 || v9 == 45)
  {
    char v13 = *v8++;
    char v12 = v13;
  }

  else
  {
    char v12 = v9;
  }

  if ((a3 & 0xFFFFFFEF) != 0 || v12 != 48)
  {
    BOOL v16 = a3 == 0;
    if (v12 != 48)
    {
      int v17 = 10;
      goto LABEL_29;
    }
  }

  else
  {
    if ((*(unsigned __int8 *)v8 | 0x20) == 0x78)
    {
      char v12 = v8[1];
      if ((v12 - 48) < 0xAu
        || (unsigned int v14 = *((unsigned __int8 *)v8 + 1) - 65, v14 <= 0x25) && ((1LL << v14) & 0x3F0000003FLL) != 0)
      {
        v8 += 2;
        unsigned int v15 = 16;
        goto LABEL_34;
      }
    }

    BOOL v16 = a3 == 0;
    char v12 = 48;
  }

  int v17 = 8;
LABEL_29:
  if (v16) {
    unsigned int v15 = v17;
  }
  else {
    unsigned int v15 = a3;
  }
  if (v15 - 37 < 0xFFFFFFDD)
  {
    unint64_t v18 = 0LL;
    goto LABEL_54;
  }

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoul_l(__str, __endptr, __base, v5);
}

unint64_t strtoull_l(const char *a1, char **a2, int a3, locale_t a4)
{
  locale_t v6 = (locale_t)&__global_locale;
  if (a4 == (locale_t)-1LL) {
    locale_t v7 = (locale_t)&__global_locale;
  }
  else {
    locale_t v7 = a4;
  }
  if (!a4) {
    locale_t v7 = (locale_t)&__c_locale;
  }
  if (v7 != (locale_t)-1LL) {
    locale_t v6 = v7;
  }
  if (!v7) {
    locale_t v6 = (locale_t)&__c_locale;
  }
  uint64_t v8 = a1;
  do
  {
    int v10 = *v8++;
    int v9 = v10;
    int v11 = &_DefaultRuneLocale;
    if (v10 < 0) {
      int v11 = *(_RuneLocale **)(*((void *)v6 + 166) + 120LL);
    }
  }

  while ((v11->__runetype[v9] & 0x4000) != 0);
  if (v9 == 43 || v9 == 45)
  {
    char v13 = *v8++;
    char v12 = v13;
  }

  else
  {
    char v12 = v9;
  }

  if ((a3 & 0xFFFFFFEF) != 0 || v12 != 48)
  {
    BOOL v16 = a3 == 0;
    if (v12 != 48)
    {
      int v17 = 10;
      goto LABEL_29;
    }
  }

  else
  {
    if ((*(unsigned __int8 *)v8 | 0x20) == 0x78)
    {
      char v12 = v8[1];
      if ((v12 - 48) < 0xAu
        || (unsigned int v14 = *((unsigned __int8 *)v8 + 1) - 65, v14 <= 0x25) && ((1LL << v14) & 0x3F0000003FLL) != 0)
      {
        v8 += 2;
        unsigned int v15 = 16;
        goto LABEL_34;
      }
    }

    BOOL v16 = a3 == 0;
    char v12 = 48;
  }

  int v17 = 8;
LABEL_29:
  if (v16) {
    unsigned int v15 = v17;
  }
  else {
    unsigned int v15 = a3;
  }
  if (v15 - 37 < 0xFFFFFFDD)
  {
    unint64_t v18 = 0LL;
    goto LABEL_54;
  }

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoull_l(__str, __endptr, __base, v5);
}

uintmax_t strtoumax_l(const char *nptr, char **endptr, int base, locale_t a4)
{
  locale_t v6 = (locale_t)&__global_locale;
  if (a4 == (locale_t)-1LL) {
    locale_t v7 = (locale_t)&__global_locale;
  }
  else {
    locale_t v7 = a4;
  }
  if (!a4) {
    locale_t v7 = (locale_t)&__c_locale;
  }
  if (v7 != (locale_t)-1LL) {
    locale_t v6 = v7;
  }
  if (!v7) {
    locale_t v6 = (locale_t)&__c_locale;
  }
  uint64_t v8 = nptr;
  do
  {
    int v10 = *v8++;
    int v9 = v10;
    int v11 = &_DefaultRuneLocale;
    if (v10 < 0) {
      int v11 = *(_RuneLocale **)(*((void *)v6 + 166) + 120LL);
    }
  }

  while ((v11->__runetype[v9] & 0x4000) != 0);
  if (v9 == 43 || v9 == 45)
  {
    char v13 = *v8++;
    char v12 = v13;
  }

  else
  {
    char v12 = v9;
  }

  if ((base & 0xFFFFFFEF) != 0 || v12 != 48)
  {
    BOOL v16 = base == 0;
    if (v12 != 48)
    {
      int v17 = 10;
      goto LABEL_29;
    }
  }

  else
  {
    if ((*(unsigned __int8 *)v8 | 0x20) == 0x78)
    {
      char v12 = v8[1];
      if ((v12 - 48) < 0xAu
        || (unsigned int v14 = *((unsigned __int8 *)v8 + 1) - 65, v14 <= 0x25) && ((1LL << v14) & 0x3F0000003FLL) != 0)
      {
        v8 += 2;
        unsigned int v15 = 16;
        goto LABEL_34;
      }
    }

    BOOL v16 = base == 0;
    char v12 = 48;
  }

  int v17 = 8;
LABEL_29:
  if (v16) {
    unsigned int v15 = v17;
  }
  else {
    unsigned int v15 = base;
  }
  if (v15 - 37 < 0xFFFFFFDD)
  {
    uintmax_t v18 = 0LL;
    goto LABEL_54;
  }

uintmax_t strtoumax(const char *__nptr, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoumax_l(__nptr, __endptr, __base, v5);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  int v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoull_l(__str, __endptr, __base, v5);
}

void system_NOCANCEL()
{
}

void *__cdecl tdelete(const void *a1, void **a2, int (__cdecl *a3)(const void *, const void *))
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = a2;
  int v4 = *a2;
  if (*a2)
  {
    for (int i = ((uint64_t (*)(const void *, void))a3)(a1, *v4);
          i;
          int i = ((uint64_t (*)(const void *, void))a3)(a1, *v9))
    {
      int v4 = *v3;
      uint64_t v8 = i >= 0 ? 16LL : 8LL;
      uint64_t v3 = (void **)(i >= 0 ? (char *)*v3 + 16 : (char *)*v3 + 8);
      int v9 = *(void **)((char *)v4 + v8);
      if (!v9) {
        return 0LL;
      }
    }

    uint64_t v10 = *((void *)*v3 + 1);
    int v11 = (void *)*((void *)*v3 + 2);
    if (v10)
    {
      if (v11)
      {
        char v12 = (void *)v11[1];
        if (v12)
        {
          do
          {
            char v13 = v11;
            int v11 = v12;
            char v12 = (void *)v12[1];
          }

          while (v12);
          v13[1] = v11[2];
          v11[1] = *((void *)*v3 + 1);
          v11[2] = *((void *)*v3 + 2);
        }

        else
        {
          v11[1] = v10;
        }
      }

      else
      {
        int v11 = (void *)*((void *)*v3 + 1);
      }
    }

    free(*v3);
    void *v3 = v11;
  }

  return v4;
}

void *__cdecl tfind(const void *a1, void *const *a2, int (__cdecl *a3)(const void *, const void *))
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = a2;
  int v4 = *a2;
  if (!*a2) {
    return 0LL;
  }
  while (1)
  {
    int v7 = ((uint64_t (*)(const void *, void))a3)(a1, *v4);
    if (!v7) {
      break;
    }
    uint64_t v8 = (char *)*v3;
    if (v7 >= 0) {
      uint64_t v9 = 16LL;
    }
    else {
      uint64_t v9 = 8LL;
    }
    if (v7 >= 0) {
      uint64_t v3 = (void *const *)((char *)*v3 + 16);
    }
    else {
      uint64_t v3 = (void *const *)((char *)*v3 + 8);
    }
    int v4 = *(void **)&v8[v9];
    if (!v4) {
      return 0LL;
    }
  }

  return *v3;
}

void *__cdecl tsearch(const void *a1, void **a2, int (__cdecl *a3)(const void *, const void *))
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = a2;
  int v5 = *a2;
  if (*a2)
  {
    while (1)
    {
      int v7 = ((uint64_t (*)(const void *, void))a3)(a1, *v5);
      if (!v7) {
        return *v3;
      }
      uint64_t v8 = (char *)*v3;
      if (v7 >= 0) {
        uint64_t v9 = 16LL;
      }
      else {
        uint64_t v9 = 8LL;
      }
      if (v7 >= 0) {
        uint64_t v3 = (void **)((char *)*v3 + 16);
      }
      else {
        uint64_t v3 = (void **)((char *)*v3 + 8);
      }
      int v5 = *(void **)&v8[v9];
      if (!v5) {
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    uint64_t result = malloc(0x18uLL);
    if (result)
    {
      void *const *v3 = result;
      *((void *)result + 1) = 0LL;
      *((void *)result + 2) = 0LL;
      *(void *)uint64_t result = a1;
    }
  }

  return result;
}

void twalk(const void *a1, void (__cdecl *a2)(const void *, VISIT, int))
{
  if (a1)
  {
    if (a2) {
      trecurse((uint64_t)a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))a2, 0LL);
    }
  }

uint64_t trecurse(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  int v4 = a2;
  if (*(void *)(a1 + 8) || *(void *)(a1 + 16))
  {
    a2(a1, 0LL, a3);
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6) {
      trecurse(v6, a2, (a3 + 1));
    }
    a2(a1, 1LL, a3);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7) {
      trecurse(v7, a2, (a3 + 1));
    }
    uint64_t v8 = 2LL;
    int v4 = a2;
  }

  else
  {
    uint64_t v8 = 3LL;
  }

  return v4(a1, v8, a3);
}

int posix_openpt(int a1)
{
  int result = open_NOCANCEL();
  if (result < 0) {
    return -1;
  }
  return result;
}

int grantpt(int a1)
{
  return ioctl(a1, 0x20007454uLL);
}

char *__cdecl ptsname(int a1)
{
  if (ptsname_once != -1) {
    _os_once();
  }
  int v2 = (char *)pthread_getspecific(ptsname_buffer_specific_key);
  if (!v2)
  {
    uint64_t v3 = (char *)malloc(0x80uLL);
    if (!v3) {
      ptsname_cold_1();
    }
    int v2 = v3;
    if (pthread_setspecific(ptsname_buffer_specific_key, v3)) {
      ptsname_cold_2();
    }
  }

  if (ptsname_r(a1, v2, 0x80uLL)) {
    return 0LL;
  }
  else {
    return v2;
  }
}

uint64_t ptsname_once_init()
{
  uint64_t result = pthread_key_create( (pthread_key_t *)&ptsname_buffer_specific_key,  (void (__cdecl *)(void *))MEMORY[0x189600260]);
  if ((_DWORD)result) {
    ptsname_cold_2();
  }
  return result;
}

int ptsname_r(int fildes, char *buffer, size_t buflen)
{
  if (buffer)
  {
    if (ioctl(fildes, 0x40807453uLL, v8) || stat(v8, &v7)) {
      return -1;
    }
    if (_platform_strlen() + 1 <= buflen)
    {
      _platform_memmove();
      return 0;
    }

    int v4 = __error();
    int v5 = 34;
  }

  else
  {
    int v4 = __error();
    int v5 = 22;
  }

  int *v4 = v5;
  return -1;
}

int unlockpt(int a1)
{
  return ioctl(a1, 0x20007452uLL);
}

char *__cdecl l64a(uint64_t a1)
{
  size_t v1 = l64a_buf;
  if ((_DWORD)a1)
  {
    uint64_t v2 = 0LL;
    do
    {
      unsigned int v3 = a1 & 0x3F;
      char v4 = (a1 & 0x3F) + 59;
      if (v3 <= 0x25) {
        char v4 = (a1 & 0x3F) + 53;
      }
      if (v3 <= 0xB) {
        char v4 = v3 + 46;
      }
      if (v3 <= 1) {
        char v5 = v3 + 46;
      }
      else {
        char v5 = v4;
      }
      l64a_buf[v2] = v5;
      uint64_t v6 = v2 + 1;
      LODWORD(a1) = (int)a1 >> 6;
    }

    while (v2++ < 5);
    size_t v1 = &l64a_buf[v6];
  }

  *size_t v1 = 0;
  return l64a_buf;
}

char *__cdecl ecvt(double a1, int a2, int *a3, int *a4)
{
  return __cvt(a2, a3, a4, 0, a1);
}

char *__cvt(int a1, int *a2, _DWORD *a3, int a4, double a5)
{
  if (!a1)
  {
    *a3 = a5 < 0.0;
    *a2 = 0;
    return "";
  }

  if (__cvt_s)
  {
    free((void *)__cvt_s);
    __cvt_s = 0LL;
  }

  if (a1 >= 0) {
    int v10 = a1;
  }
  else {
    int v10 = -a1;
  }
  size_t v11 = (v10 + 1);
  if (a5 == 0.0)
  {
    *a2 = 1 - a4;
    *a3 = 0;
    uint64_t result = (char *)malloc(v11);
    __cvt_s = (uint64_t)result;
    if (!result) {
      return result;
    }
    *(_WORD *)uint64_t result = 48;
    char v13 = result + 1;
    int v19 = result + 1;
  }

  else
  {
    uint64_t result = __dtoa(a4 + 2, a1, a2, a3, &v19, a5);
    if (!result) {
      return result;
    }
    uint64_t v16 = (uint64_t)result;
    int v17 = *a2;
    if (*a2 == 9999)
    {
      *a2 = 0;
      int v18 = *result;
      __freedtoa((uint64_t)result);
      if (v18 == 73) {
        return "inf";
      }
      else {
        return "nan";
      }
    }

    if (!a4) {
      int v17 = 0;
    }
    v11 += v17;
    __cvt_s = (uint64_t)malloc(v11);
    if (!__cvt_s)
    {
      __freedtoa(v16);
      return 0LL;
    }

    _platform_strlcpy();
    int v19 = &v19[__cvt_s - v16];
    __freedtoa(v16);
    char v13 = v19;
    uint64_t result = (char *)__cvt_s;
  }

  uint64_t v14 = (uint64_t)&result[v11 - (void)v13 - 1];
  if (&result[v11 - (void)v13] != (char *)1)
  {
    do
    {
      unsigned int v15 = v19++;
      *unsigned int v15 = 48;
      --v14;
    }

    while (v14);
    char v13 = v19;
  }

  *char v13 = 0;
  return (char *)__cvt_s;
}

char *__cdecl fcvt(double a1, int a2, int *a3, int *a4)
{
  return __cvt(a2, a3, a4, 1, a1);
}

char *__cdecl gcvt(double a1, int a2, char *a3)
{
  uint64_t v6 = localeconv();
  if (a2)
  {
    p_decimal_point = (const char **)&v6->decimal_point;
    uint64_t v8 = __dtoa(2u, a2, &v36, &v35, 0LL, a1);
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = v36;
      if (v36 == 9999)
      {
        size_t v11 = "-";
        if (!v35) {
          size_t v11 = "";
        }
        if (*v8 == 73) {
          char v12 = "inf";
        }
        else {
          char v12 = "nan";
        }
        snprintf(a3, a2 + 1, "%s%s", v11, v12);
      }

      else
      {
        char v13 = a3;
        if (v35)
        {
          *a3 = 45;
          char v13 = a3 + 1;
        }

        if (v10 < 0 || v10 > a2)
        {
          int v17 = 1 - v10;
          BOOL v18 = __OFSUB__(v10, 1);
          int v19 = v10 - 1;
          BOOL v20 = v19 < 0 != v18;
          if (v19 < 0 != v18) {
            int v19 = v17;
          }
          BOOL v35 = v20;
          int v36 = v19;
          *char v13 = *v9;
          unsigned __int8 v21 = stpcpy(v13 + 1, *p_decimal_point);
          char v22 = v9[1];
          if (v22)
          {
            char v23 = (unsigned __int8 *)(v9 + 2);
            do
            {
              *v21++ = v22;
              int v24 = *v23++;
              char v22 = v24;
            }

            while (v24);
          }

          char *v21 = 101;
          if (v35) {
            char v25 = 45;
          }
          else {
            char v25 = 43;
          }
          v21[1] = v25;
          int v26 = v36;
          if (v36 >= 10)
          {
            uint64_t v27 = v21 + 1;
            do
            {
              unsigned int v28 = v26 + 9;
              v26 /= 10;
              ++v27;
            }

            while (v28 > 0x12);
            BOOL v35 = v26;
            v27[1] = 0;
            int v29 = v36;
            if (v36)
            {
              do
              {
                *v27-- = v29 - 10 * (((unint64_t)(1717986919LL * v29) >> 34) + (1717986919LL * v29 < 0)) + 48;
                int v30 = v36;
                int v29 = v36 / 10;
                v36 /= 10;
              }

              while ((v30 + 9) >= 0x13);
            }

            goto LABEL_50;
          }

          v21[2] = 48;
          char v13 = v21 + 4;
          v21[3] = v36 + 48;
        }

        else
        {
          if (v10)
          {
            uint64_t v14 = v9;
            do
            {
              int v15 = *v14;
              BOOL v16 = v15 == 0;
              if (!*v14) {
                LOBYTE(v15) = 48;
              }
              if (!v16) {
                ++v14;
              }
              *v13++ = v15;
              --v10;
            }

            while (v10);
          }

          else
          {
            uint64_t v14 = v9;
          }

          if (*v14)
          {
            if (v14 == v9) {
              *v13++ = 48;
            }
            char v13 = stpcpy(v13, *p_decimal_point);
            char v31 = v9[v36];
            if (v31)
            {
              int v32 = &v9[v36 + 1];
              do
              {
                *v13++ = v31;
                int v33 = *v32++;
                char v31 = v33;
              }

              while (v33);
            }
          }
        }

        *char v13 = 0;
      }

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int heapsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  if (__nel < 2) {
    return 0;
  }
  if (!__width)
  {
    *__error() = 22;
    return -1;
  }

  size_t v7 = __nel;
  uint64_t v9 = malloc(__width);
  if (!v9) {
    return -1;
  }
  int v39 = v9;
  stat v40 = (char *)__base;
  int v10 = (char *)__base - __width;
  size_t v11 = v7 >> 1;
  do
  {
    unint64_t v12 = 2 * v11;
    size_t v42 = v11;
    while (v12 <= v7)
    {
      char v13 = &v10[v12 * __width];
      if (v12 >= v7)
      {
        unint64_t v15 = v12;
      }

      else
      {
        int v14 = (*((uint64_t (**)(void *, char *, char *))__compar + 2))( __compar,  &v10[v12 * __width],  &v13[__width]);
        unint64_t v15 = v12 | (v14 >> 31);
        if (v14 < 0) {
          v13 += __width;
        }
      }

      BOOL v16 = &v10[v11 * __width];
      size_t v17 = __width;
      do
      {
        char v18 = *v16;
        *v16++ = *v13;
        *v13++ = v18;
        --v17;
      }

      while (v17);
      unint64_t v12 = 2 * v15;
      size_t v11 = v15;
    }

    size_t v11 = v42 - 1;
  }

  while (v42 != 1);
  uint64_t v19 = 0LL;
  size_t v41 = v7 - 1;
  unsigned __int8 v21 = v39;
  int i = v40;
  char v22 = &v40[(v7 - 1) * __width];
  do
  {
    uint64_t v43 = v19;
    _platform_memmove();
    uint64_t v23 = 0LL;
    do
    {
      v22[v23] = i[v23];
      ++v23;
    }

    while (__width != v23);
    --v7;
    int v24 = i;
    if (v7 >= 2)
    {
      unint64_t v25 = 2LL;
      uint64_t v26 = 1LL;
      do
      {
        uint64_t v27 = &v10[v25 * __width];
        if (v25 >= v7)
        {
          unint64_t v29 = v25;
        }

        else
        {
          int v28 = (*((uint64_t (**)(void *, char *, char *))__compar + 2))( __compar,  &v10[v25 * __width],  &v27[__width]);
          unint64_t v29 = v25 | (v28 >> 31);
          if (v28 < 0) {
            v27 += __width;
          }
        }

        int v30 = &v10[v26 * __width];
        size_t v31 = __width;
        do
        {
          char v32 = *v27++;
          *v30++ = v32;
          --v31;
        }

        while (v31);
        unint64_t v25 = 2 * v29;
        uint64_t v26 = v29;
      }

      while (2 * v29 <= v7);
      int v24 = &v10[v29 * __width];
      int v33 = v24;
      unsigned __int8 v21 = v39;
      for (i = v40; v29 != 1; int v24 = &v10[v29 * __width])
      {
        int v24 = v33;
        v29 >>= 1;
        int v33 = &v10[v29 * __width];
        int v34 = (*((uint64_t (**)(void *, _BYTE *, char *))__compar + 2))(__compar, v39, v33);
        size_t v35 = __width;
        int v36 = v33;
        if (v34 < 0) {
          break;
        }
        do
        {
          char v37 = *v36++;
          *v24++ = v37;
          --v35;
        }

        while (v35);
      }
    }

    uint64_t v38 = 0LL;
    do
    {
      v24[v38] = v21[v38];
      ++v38;
    }

    while (__width != v38);
    uint64_t v19 = v43 + 1;
    v22 -= __width;
  }

  while (v43 + 1 != v41);
  free(v21);
  return 0;
}

uint64_t __heapsort_r( _BYTE *a1, unint64_t a2, size_t __size, uint64_t a4, uint64_t (*a5)(uint64_t, char *, char *))
{
  if (a2 < 2) {
    return 0LL;
  }
  if (!__size)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  unint64_t v9 = a2;
  size_t v11 = malloc(__size);
  if (!v11) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v12 = v11;
  uint64_t v48 = a4;
  size_t v42 = a1;
  char v13 = &a1[-__size];
  unint64_t v14 = v9 >> 1;
  int v46 = &a1[-__size];
  do
  {
    unint64_t v15 = 2 * v14;
    unint64_t v44 = v14;
    while (v15 <= v9)
    {
      BOOL v16 = &v13[v15 * __size];
      if (v15 >= v9)
      {
        unint64_t v18 = v15;
        uint64_t v19 = v48;
      }

      else
      {
        int v17 = a5(v48, v16, &v16[__size]);
        unint64_t v18 = v15 | (v17 >> 31);
        uint64_t v19 = v48;
        char v13 = v46;
        if (v17 < 0) {
          v16 += __size;
        }
      }

      BOOL v20 = &v13[v14 * __size];
      size_t v21 = __size;
      do
      {
        char v22 = *v20;
        *v20++ = *v16;
        *v16++ = v22;
        --v21;
      }

      while (v21);
      unint64_t v15 = 2 * v18;
      unint64_t v14 = v18;
    }

    unint64_t v14 = v44 - 1;
  }

  while (v44 != 1);
  uint64_t v23 = 0LL;
  unint64_t v43 = v9 - 1;
  int i = v42;
  unint64_t v25 = &v42[(v9 - 1) * __size];
  int v47 = a5;
  do
  {
    uint64_t v45 = v23;
    _platform_memmove();
    uint64_t v26 = 0LL;
    do
    {
      v25[v26] = i[v26];
      ++v26;
    }

    while (__size != v26);
    --v9;
    uint64_t v27 = i;
    if (v9 >= 2)
    {
      unint64_t v28 = 2LL;
      uint64_t v29 = 1LL;
      do
      {
        int v30 = &v13[v28 * __size];
        if (v28 >= v9)
        {
          unint64_t v32 = v28;
        }

        else
        {
          int v31 = v47(v48, &v13[v28 * __size], &v30[__size]);
          unint64_t v32 = v28 | (v31 >> 31);
          if (v31 < 0) {
            v30 += __size;
          }
        }

        int v33 = &v13[v29 * __size];
        size_t v34 = __size;
        do
        {
          char v35 = *v30++;
          *v33++ = v35;
          --v34;
        }

        while (v34);
        unint64_t v28 = 2 * v32;
        uint64_t v29 = v32;
      }

      while (2 * v32 <= v9);
      uint64_t v27 = &v13[v32 * __size];
      int v36 = v27;
      for (i = v42; v32 != 1; uint64_t v27 = &v13[v32 * __size])
      {
        uint64_t v27 = v36;
        v32 >>= 1;
        int v36 = &v13[v32 * __size];
        int v37 = v47(v48, v12, v36);
        size_t v38 = __size;
        int v39 = v36;
        if (v37 < 0) {
          break;
        }
        do
        {
          char v40 = *v39++;
          *v27++ = v40;
          --v38;
        }

        while (v38);
      }
    }

    uint64_t v41 = 0LL;
    do
    {
      v27[v41] = v12[v41];
      ++v41;
    }

    while (__size != v41);
    uint64_t v23 = v45 + 1;
    v25 -= __size;
  }

  while (v45 + 1 != v43);
  free(v12);
  return 0LL;
}

char *__ldtoa(double *a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5, char **a6)
{
  uint64_t result = __dtoa(a2, a3, a4, a5, a6, *a1);
  if (*a4 == 9999) {
    *a4 = 0x7FFFFFFF;
  }
  return result;
}

int timespec_get(timespec *ts, int base)
{
  return base == 1 && clock_gettime(_CLOCK_REALTIME, ts) != -1;
}

char *_Read_RuneMagi(FILE *a1)
{
  int v2 = fileno(a1);
  if (fstat(v2, &v124) < 0) {
    return 0LL;
  }
  st_uint64_t size = v124.st_size;
  if (v124.st_size <= 0xC3BuLL)
  {
LABEL_3:
    char v4 = __error();
    char v5 = 0LL;
    int v6 = 79;
LABEL_10:
    int *v4 = v6;
    return v5;
  }

  int v7 = fileno(a1);
  uint64_t v8 = mmap(0LL, st_size, 3, 2, v7, 0LL);
  if (v8 == (_DWORD *)-1LL)
  {
    char v4 = __error();
    char v5 = 0LL;
    int v6 = 22;
    goto LABEL_10;
  }

  unint64_t v9 = (char *)v8;
  unint64_t v10 = (unint64_t)v8 + v124.st_size;
  if (*(void *)v8 == 0x4167614D656E7552LL)
  {
    if (v124.st_size <= 0xC5BuLL) {
      goto LABEL_3;
    }
    v8[12] = bswap32(v8[12]);
    signed int v14 = bswap32(v8[788]);
    v8[788] = v14;
    signed int v15 = bswap32(v8[789]);
    v8[789] = v15;
    uint64_t v16 = bswap32(v8[781]);
    v8[781] = v16;
    signed int v17 = bswap32(v8[783]);
    v8[783] = v17;
    signed int v18 = bswap32(v8[785]);
    v8[785] = v18;
    uint64_t v19 = (int8x8_t *)&v8[4 * (int)v16 + 791];
    BOOL v20 = &v19[2 * v17];
    size_t v21 = &v20[2 * v18];
    if ((int)v16 < 1)
    {
      int v22 = 0;
    }

    else
    {
      int v22 = 0;
      uint64_t v23 = v8 + 793;
      uint64_t v24 = v16;
      do
      {
        unsigned int v25 = bswap32(*(v23 - 2));
        unsigned int v26 = bswap32(*(v23 - 1));
        *(v23 - 2) = v25;
        *(v23 - 1) = v26;
        unsigned int v27 = *v23;
        unsigned int *v23 = bswap32(*v23);
        if (!v27)
        {
          int v28 = v26 - v25 + 1;
          size_t v21 = (int8x8_t *)((char *)v21 + 4 * v28);
          v22 += v28;
        }

        v23 += 4;
        --v24;
      }

      while (v24);
    }

    if ((unint64_t)v21 + 20 * v15 + v14 > v10)
    {
LABEL_56:
      char v71 = __error();
      size_t v72 = 0LL;
      char v5 = 0LL;
LABEL_57:
      *char v71 = 22;
LABEL_58:
      int v73 = *__error();
      free(v72);
      free(v5);
      char v5 = 0LL;
      *__error() = v73;
LABEL_59:
      int v74 = *__error();
      munmap(v9, v124.st_size);
      if (!v5) {
        *__error() = v74;
      }
      return v5;
    }

    int v75 = v14 + 20 * v15 + 24 * (v17 + v16 + v18) + 4 * v22 + 128;
    v76 = (char *)calloc(1uLL, v14 + 20LL * v15 + 24LL * (v17 + (int)v16 + v18) + 4LL * v22 + 128);
    char v5 = v76;
    if (!v76)
    {
      size_t v72 = 0LL;
      goto LABEL_58;
    }

    *(_DWORD *)v76 = 1;
    *((void *)v76 + 1) = destruct_ctype;
    uint64_t v77 = (char *)calloc(1uLL, 0xC88uLL);
    size_t v72 = (int *)v77;
    *((void *)v5 + 15) = v77;
    if (!v77)
    {
      free(v5);
      goto LABEL_58;
    }

    uint64_t v78 = 0LL;
    uint64_t v79 = v5 + 128;
    *((void *)v77 + 398) = v5 + 128;
    *(void *)uint64_t v77 = 0x4167614D656E7552LL;
    __int128 v80 = *(_OWORD *)(v9 + 8);
    *(_OWORD *)(v77 + 24) = *(_OWORD *)(v9 + 24);
    *(_OWORD *)(v77 + 8) = v80;
    *((_DWORD *)v77 + 14) = *((_DWORD *)v9 + 12);
    *((_DWORD *)v77 + 784) = *((_DWORD *)v9 + 781);
    *((_DWORD *)v77 + 788) = *((_DWORD *)v9 + 783);
    *((_DWORD *)v77 + 792) = *((_DWORD *)v9 + 785);
    *((void *)v77 + 399) = *((void *)v9 + 394);
    do
    {
      uint64_t v81 = &v77[v78];
      *((_DWORD *)v81 + 15) = bswap32(*(_DWORD *)&v9[v78 + 52]);
      *((_DWORD *)v81 + 271) = bswap32(*(_DWORD *)&v9[v78 + 1076]);
      *((_DWORD *)v81 + 527) = bswap32(*(_DWORD *)&v9[v78 + 2100]);
      v78 += 4LL;
    }

    while (v78 != 1024);
    *((void *)v77 + 393) = v79;
    int v82 = *((_DWORD *)v77 + 784);
    int v83 = v82;
    BOOL v84 = &v79[24 * v82];
    *((void *)v77 + 395) = v84;
    int v85 = *((_DWORD *)v77 + 788);
    size_t v86 = &v84[24 * v85];
    *((void *)v77 + 397) = v86;
    size_t v87 = &v86[24 * *((int *)v77 + 792)];
    *((void *)v77 + 400) = v87;
    size_t v88 = &v87[20 * *((int *)v77 + 799)];
    *((void *)v72 + 398) = v88;
    size_t v89 = &v20[2 * *((int *)v9 + 785)];
    if (v82 < 1)
    {
      LODWORD(v100) = v85;
    }

    else
    {
      for (uint64_t i = 0LL; i < v82; ++i)
      {
        uint64_t v91 = (uint64_t)&v9[16 * i + 3164];
        int v92 = &v79[24 * i];
        int32x2_t v93 = *(int32x2_t *)v91;
        *(void *)int v92 = *(void *)v91;
        LODWORD(v91) = *(_DWORD *)(v91 + 8);
        *((_DWORD *)v92 + 2) = v91;
        if ((_DWORD)v91)
        {
          *(void *)&v79[24 * i + 16] = 0LL;
        }

        else
        {
          unsigned __int32 v94 = vsub_s32(vdup_lane_s32(v93, 1), v93).u32[0];
          size_t v95 = (int8x8_t *)((char *)v89 + 4 * (int)(v94 + 1));
          *(void *)&v79[24 * i + 16] = v88;
          *((void *)v72 + 398) = &v88[4 * (v94 + 1)];
          if ((v94 & 0x80000000) == 0)
          {
            int v96 = v94 + 2;
            size_t v97 = &v88[4 * v94];
            char v98 = (unsigned int *)v89 + v94;
            do
            {
              unsigned int v99 = *v98--;
              *(_DWORD *)size_t v97 = bswap32(v99);
              v97 -= 4;
              --v96;
            }

            while (v96 > 1);
            int v82 = v72[784];
          }

          v88 += 4 * (int)(v94 + 1);
          size_t v89 = v95;
        }
      }

      LODWORD(v100) = v72[788];
    }

    if ((int)v100 >= 1)
    {
      uint64_t v100 = v100;
      unsigned int v112 = (int8x8_t *)&v5[24 * v83 + 136];
      do
      {
        v112[-1] = vrev32_s8(*v19);
        v112->i32[0] = bswap32(v19[1].u32[0]);
        v112 += 3;
        v19 += 2;
        --v100;
      }

      while (v100);
    }

    uint64_t v113 = *((unsigned int *)v9 + 785);
    if ((int)v113 >= 1)
    {
      uint64_t v114 = 0LL;
      int v115 = v85;
      uint64_t v116 = 24 * v113;
      int v117 = &v5[24 * v115 + 24 * v83];
      do
      {
        uint64_t v118 = (int8x8_t *)&v117[v114];
        v118[16] = vrev32_s8(*v20);
        v118[17].i32[0] = bswap32(v20[1].u32[0]);
        v114 += 24LL;
        v20 += 2;
      }

      while (v116 != v114);
    }

    int v119 = *((_DWORD *)v9 + 789);
    if (v119 >= 1)
    {
      if ((unint64_t)v89 + 20 * v119 > v10)
      {
        char v71 = __error();
        goto LABEL_57;
      }

      unint64_t v120 = 0LL;
      uint64_t v121 = 0LL;
      *((void *)v72 + 400) = v88;
      *((void *)v72 + 398) = &v88[20 * v72[799]];
      do
      {
        v122 = &v88[v120];
        uint64_t v123 = *(uint64_t *)((char *)v89 + v120);
        *(int8x8_t *)(v122 + 6) = *(int8x8_t *)((char *)v89 + v120 + 6);
        *(void *)v122 = v123;
        size_t v88 = (char *)*((void *)v72 + 400);
        *(_DWORD *)&v88[v120 + 16] = bswap32(v89[2].u32[v120 / 4]);
        ++v121;
        v120 += 20LL;
      }

      while (v121 < *((int *)v9 + 789));
    }

    _platform_memmove();
    if (!v72[798]) {
      *((void *)v72 + 398) = 0LL;
    }
    if (!v72[784]) {
      *((void *)v72 + 393) = 0LL;
    }
    if (!v72[788]) {
      *((void *)v72 + 395) = 0LL;
    }
    if (!v72[792]) {
      *((void *)v72 + 397) = 0LL;
    }
    *((_DWORD *)v5 + 28) = v75;
    goto LABEL_59;
  }

  if (*(void *)v8 != 0x4267614D656E7552LL)
  {
    size_t v11 = __error();
    unint64_t v12 = 0LL;
    char v5 = 0LL;
    int v13 = 79;
LABEL_36:
    int *v11 = v13;
LABEL_37:
    int v42 = *__error();
    munmap(v9, v124.st_size);
    free(v12);
    free(v5);
    char v5 = 0LL;
    *__error() = v42;
    return v5;
  }

  unint64_t v29 = (unint64_t)&v8[3 * v8[778] + 783];
  if (v29 > v10) {
    goto LABEL_34;
  }
  uint64_t v30 = (int)v8[779];
  unint64_t v31 = v29 + 12LL * (int)v30;
  if (v31 > v10) {
    goto LABEL_34;
  }
  uint64_t v32 = (int)v8[780];
  unint64_t v33 = v31 + 12LL * (int)v32;
  if (v33 > v10) {
    goto LABEL_34;
  }
  int v34 = v8[778];
  if (v34 < 1)
  {
    int v35 = 0;
  }

  else
  {
    int v35 = 0;
    int v36 = v8 + 785;
    uint64_t v37 = v8[778];
    do
    {
      if (!*v36)
      {
        int v38 = *(v36 - 1) - *(v36 - 2) + 1;
        v33 += 4LL * v38;
        if (v33 > v10) {
          goto LABEL_34;
        }
        v35 += v38;
      }

      v36 += 3;
      --v37;
    }

    while (v37);
  }

  int v39 = v8[782];
  unint64_t v40 = v33 + 20LL * v39;
  uint64_t v41 = (int)v8[781];
  if (v40 + v41 > v10)
  {
LABEL_34:
    size_t v11 = __error();
    unint64_t v12 = 0LL;
    char v5 = 0LL;
LABEL_35:
    int v13 = 22;
    goto LABEL_36;
  }

  int v44 = 20 * v39 + 4 * v35 + v41 + 24 * (v30 + v34 + v32) + 128;
  uint64_t v45 = (char *)calloc(1uLL, 20LL * v39 + 4LL * v35 + v41 + 24 * (v30 + v34 + v32) + 128);
  char v5 = v45;
  if (!v45)
  {
    unint64_t v12 = 0LL;
    goto LABEL_37;
  }

  *(_DWORD *)uint64_t v45 = 1;
  *((void *)v45 + 1) = destruct_ctype;
  int v46 = (char *)calloc(1uLL, 0xC88uLL);
  unint64_t v12 = (int *)v46;
  *((void *)v5 + 15) = v46;
  if (!v46)
  {
    free(v5);
    goto LABEL_37;
  }

  int v47 = v5 + 128;
  *((void *)v46 + 398) = v5 + 128;
  *(void *)int v46 = 0x4167614D656E7552LL;
  __int128 v48 = *(_OWORD *)(v9 + 8);
  *(_OWORD *)(v46 + 24) = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(v46 + 8) = v48;
  *((_DWORD *)v46 + 14) = 0;
  *((_DWORD *)v46 + 784) = *((_DWORD *)v9 + 778);
  *((_DWORD *)v46 + 788) = *((_DWORD *)v9 + 779);
  *((_DWORD *)v46 + 792) = *((_DWORD *)v9 + 780);
  *((void *)v46 + 399) = *(void *)(v9 + 3124);
  uint64_t v49 = -1024LL;
  do
  {
    BOOL v50 = &v46[v49];
    *((_DWORD *)v50 + 271) = *(_DWORD *)&v9[v49 + 1064];
    *((_DWORD *)v50 + 527) = *(_DWORD *)&v9[v49 + 2088];
    *((_DWORD *)v50 + 783) = *(_DWORD *)&v9[v49 + 3112];
    v49 += 4LL;
  }

  while (v49);
  *((void *)v46 + 393) = v47;
  int v51 = *((_DWORD *)v46 + 784);
  int v52 = v51;
  BOOL v53 = &v47[24 * v51];
  *((void *)v46 + 395) = v53;
  int v54 = *((_DWORD *)v46 + 788);
  uint64_t v55 = &v53[24 * v54];
  *((void *)v46 + 397) = v55;
  uint64_t v56 = &v55[24 * *((int *)v46 + 792)];
  *((void *)v46 + 400) = v56;
  char v57 = &v56[20 * *((int *)v46 + 799)];
  *((void *)v12 + 398) = v57;
  unint64_t v58 = v31 + 12LL * *((int *)v9 + 780);
  if (v51 < 1)
  {
    LODWORD(v70) = v54;
  }

  else
  {
    for (uint64_t j = 0LL; j < v51; ++j)
    {
      uint64_t v60 = (uint64_t)&v9[12 * j + 3132];
      int v61 = &v47[24 * j];
      int32x2_t v62 = *(int32x2_t *)v60;
      *(void *)int v61 = *(void *)v60;
      LODWORD(v60) = *(_DWORD *)(v60 + 8);
      *((_DWORD *)v61 + 2) = v60;
      if ((_DWORD)v60)
      {
        *(void *)&v47[24 * j + 16] = 0LL;
      }

      else
      {
        unsigned __int32 v63 = vsub_s32(vdup_lane_s32(v62, 1), v62).u32[0];
        unint64_t v64 = v58 + 4LL * (int)(v63 + 1);
        *(void *)&v47[24 * j + 16] = v57;
        char v65 = &v57[4 * (v63 + 1)];
        *((void *)v12 + 398) = v65;
        if ((v63 & 0x80000000) == 0)
        {
          int v66 = v63 + 2;
          int v67 = &v57[4 * v63];
          uint64_t v68 = (int *)(v58 + 4LL * v63);
          do
          {
            int v69 = *v68--;
            *(_DWORD *)int v67 = v69;
            v67 -= 4;
            --v66;
          }

          while (v66 > 1);
          int v51 = v12[784];
        }

        char v57 = v65;
        unint64_t v58 = v64;
      }
    }

    LODWORD(v70) = v12[788];
  }

  if ((int)v70 >= 1)
  {
    uint64_t v70 = v70;
    int v101 = &v5[24 * v52 + 136];
    do
    {
      *((void *)v101 - 1) = *(void *)v29;
      *(_DWORD *)int v101 = *(_DWORD *)(v29 + 8);
      v101 += 24;
      v29 += 12LL;
      --v70;
    }

    while (v70);
  }

  uint64_t v102 = *((unsigned int *)v9 + 780);
  if ((int)v102 >= 1)
  {
    uint64_t v103 = 0LL;
    BOOL v104 = &v5[24 * v54 + 24 * v52];
    uint64_t v105 = 24 * v102;
    do
    {
      size_t v106 = &v104[v103];
      *((void *)v106 + 16) = *(void *)v31;
      *((_DWORD *)v106 + 34) = *(_DWORD *)(v31 + 8);
      v103 += 24LL;
      v31 += 12LL;
    }

    while (v105 != v103);
  }

  int v107 = *((_DWORD *)v9 + 782);
  if (v107 >= 1)
  {
    if (v58 + 20LL * v107 > v10)
    {
      size_t v11 = __error();
      goto LABEL_35;
    }

    uint64_t v108 = 0LL;
    uint64_t v109 = 0LL;
    *((void *)v12 + 400) = v57;
    *((void *)v12 + 398) = &v57[20 * v12[799]];
    do
    {
      v110 = &v57[v108];
      uint64_t v111 = *(void *)(v58 + v108);
      *(void *)(v110 + 6) = *(void *)(v58 + v108 + 6);
      *(void *)v110 = v111;
      char v57 = (char *)*((void *)v12 + 400);
      *(_DWORD *)&v57[v108 + 16] = *(_DWORD *)(v58 + v108 + 16);
      ++v109;
      v108 += 20LL;
    }

    while (v109 < *((int *)v9 + 782));
  }

  _platform_memmove();
  munmap(v9, v124.st_size);
  if (!v12[798]) {
    *((void *)v12 + 398) = 0LL;
  }
  if (!v12[784]) {
    *((void *)v12 + 393) = 0LL;
  }
  if (!v12[788]) {
    *((void *)v12 + 395) = 0LL;
  }
  if (!v12[792]) {
    *((void *)v12 + 397) = 0LL;
  }
  *((_DWORD *)v5 + 28) = v44;
  return v5;
}

void destruct_ctype(void *a1)
{
  int v2 = (_RuneLocale *)a1[15];
  if (v2 != &_DefaultRuneLocale) {
    free(v2);
  }
  free(a1);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  if (__width <= 3)
  {
    *__error() = 22;
    return -1;
  }

  if (__nel)
  {
    size_t k = __width;
    size_t v75 = __width * __nel;
    uint64_t v8 = (char *)malloc(__width * __nel + 8);
    if (!v8) {
      return -1;
    }
    unint64_t v9 = v8;
    size_t v93 = k;
    if (__nel <= 5)
    {
      insertionsort_0((uint64_t)__base, __nel, k, (uint64_t)__compar);
      *(void *)((unint64_t)(v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) = &v9[v75];
LABEL_43:
      uint64_t v37 = &v9[v75];
      if (*(char **)((unint64_t)(v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) == &v9[v75])
      {
        int v39 = (char *)__base;
      }

      else
      {
        BOOL v90 = 0;
        uint64_t v88 = (__base | k) & 3;
        uint64_t v83 = -(uint64_t)k;
        int v38 = (char *)__base;
        do
        {
          int v39 = v9;
          unint64_t v9 = v38;
          if (v39 != v37)
          {
            unint64_t v40 = v39;
            uint64_t v41 = v38;
            int v42 = v39;
            uint64_t v78 = v37;
            __int128 v80 = v38;
            uint64_t v77 = v39;
            do
            {
              unint64_t v43 = *(char **)((unint64_t)(v40 + 7) & 0xFFFFFFFFFFFFFFF8LL);
              int v44 = v37;
              if (v43 != v37) {
                int v44 = *(char **)((unint64_t)(v43 + 7) & 0xFFFFFFFFFFFFFFF8LL);
              }
              uint64_t v45 = v43 - v39;
              int v46 = &v9[v43 - v39];
              uint64_t v81 = v44;
              int v82 = v41;
              uint64_t v47 = v44 - v39;
              __int128 v48 = &v9[v44 - v39];
              BOOL v49 = v43 - v39 < v44 - v39;
              BOOL v50 = v41 < v46;
              BOOL v51 = v41 < v46 && v45 < v47;
              int v52 = v46;
              if (v51)
              {
                BOOL v84 = v48;
                unint64_t v86 = (unint64_t)v46;
                do
                {
                  int v53 = (*((uint64_t (**)(void *, char *, char *))__compar + 2))(__compar, v41, v52);
                  if (v53 >= 1) {
                    int v54 = 0;
                  }
                  else {
                    int v54 = -1;
                  }
                  if (v53 >= 1) {
                    uint64_t v55 = v48;
                  }
                  else {
                    uint64_t v55 = v46;
                  }
                  if (v53 >= 1) {
                    uint64_t v56 = v52;
                  }
                  else {
                    uint64_t v56 = v41;
                  }
                  if (v53 >= 1) {
                    char v57 = v41;
                  }
                  else {
                    char v57 = v52;
                  }
                  unint64_t v58 = v57;
                  if (v90)
                  {
LABEL_68:
                    int v59 = &v56[k];
                    if (&v56[k] >= v55)
                    {
LABEL_87:
                      unsigned __int32 v63 = &v55[v83];
                      if (&v55[v83] <= v56)
                      {
                        uint64_t v56 = v55;
                      }

                      else
                      {
                        int v64 = (*((uint64_t (**)(void *, char *, char *))__compar + 2))( __compar,  v58,  &v55[v83]);
                        char v57 = v58;
                        if (v64 > v54) {
                          char v65 = v55;
                        }
                        else {
                          char v65 = &v55[v83];
                        }
                        if (v64 <= v54) {
                          unsigned __int32 v63 = v56;
                        }
                        uint64_t v56 = v65;
                      }

                      if (v56 > &v63[k])
                      {
                        do
                        {
                          if ((*((int (**)(void *, char *, char *))__compar + 2))( __compar,  v58,  &v63[(((v56 - v63) / k) >> 1) * k]) > v54) {
                            v63 += (((v56 - v63) / k) >> 1) * k;
                          }
                          else {
                            uint64_t v56 = &v63[(((v56 - v63) / k) >> 1) * k];
                          }
                        }

                        while (v56 > &v63[k]);
                        char v57 = v58;
                      }

                      BOOL v90 = 1;
LABEL_102:
                      __int128 v48 = v84;
                    }

                    else
                    {
                      for (int i = (*((uint64_t (**)(void *))__compar + 2))(__compar);
                            i > v54;
                            int i = (*((uint64_t (**)(void *))__compar + 2))(__compar))
                      {
                        uint64_t v56 = v59;
                        v59 += 2 * k;
                        if (v59 >= v55)
                        {
                          size_t k = v93;
                          char v57 = v58;
                          goto LABEL_87;
                        }

                        k *= 2LL;
                      }

                      BOOL v90 = k != v93;
                      int v92 = v58;
                      if (k > v93)
                      {
                        do
                        {
                          size_t v62 = k >> 1;
                          if ((*((int (**)(void *, char *, char *))__compar + 2))( __compar,  v92,  &v56[k >> 1]) > v54) {
                            v56 += k >> 1;
                          }
                          else {
                            int v59 = &v56[k >> 1];
                          }
                          k >>= 1;
                        }

                        while (v62 > v93);
                      }

                      uint64_t v56 = v59;
                      size_t k = v93;
                      __int128 v48 = v84;
                      char v57 = v92;
                    }
                  }

                  else
                  {
                    uint64_t v61 = 6LL;
                    while (1)
                    {
                      v56 += k;
                      if (v56 >= v55)
                      {
                        BOOL v90 = 0;
                        goto LABEL_102;
                      }

                      --v61;
                      char v57 = v58;
                      if (!v61) {
                        goto LABEL_68;
                      }
                    }

                    BOOL v90 = 0;
                    __int128 v48 = v84;
                    char v57 = v58;
                  }

                  if (v57 == v41)
                  {
                    if (v88)
                    {
                      do
                      {
                        char v69 = *v52++;
                        *v42++ = v69;
                      }

                      while (v52 < v56);
                      for (uint64_t j = 0LL; j != k; ++j)
                        v42[j] = v41[j];
                    }

                    else
                    {
                      do
                      {
                        int v70 = *(_DWORD *)v52;
                        v52 += 4;
                        *(_DWORD *)int v42 = v70;
                        v42 += 4;
                      }

                      while (v52 < v56);
                      for (uint64_t j = 0LL; j != k; j += 4LL)
                        *(_DWORD *)&v42[j] = *(_DWORD *)&v41[j];
                    }

                    v41 += j;
                  }

                  else
                  {
                    if (v88)
                    {
                      do
                      {
                        char v66 = *v41++;
                        *v42++ = v66;
                      }

                      while (v41 < v56);
                      for (uint64_t j = 0LL; j != k; ++j)
                        v42[j] = v52[j];
                    }

                    else
                    {
                      do
                      {
                        int v68 = *(_DWORD *)v41;
                        v41 += 4;
                        *(_DWORD *)int v42 = v68;
                        v42 += 4;
                      }

                      while (v41 < v56);
                      for (uint64_t j = 0LL; j != k; j += 4LL)
                        *(_DWORD *)&v42[j] = *(_DWORD *)&v52[j];
                    }

                    v52 += j;
                  }

                  v42 += j;
                  int v46 = (char *)v86;
                  BOOL v49 = v52 < v48;
                  BOOL v50 = (unint64_t)v41 < v86;
                }

                while ((unint64_t)v41 < v86 && v52 < v48);
              }

              if (v49)
              {
                unint64_t v40 = v81;
                if (v88)
                {
                  unint64_t v9 = v80;
                  int v39 = v77;
                  do
                  {
                    char v71 = *v52++;
                    *v42++ = v71;
                  }

                  while (v52 < v48);
                }

                else
                {
                  unint64_t v9 = v80;
                  int v39 = v77;
                  do
                  {
                    int v73 = *(_DWORD *)v52;
                    v52 += 4;
                    *(_DWORD *)int v42 = v73;
                    v42 += 4;
                  }

                  while (v52 < v48);
                }
              }

              else if (v50)
              {
                if (v88)
                {
                  unint64_t v9 = v80;
                  unint64_t v40 = v81;
                  int v39 = v77;
                  do
                  {
                    char v72 = *v41++;
                    *v42++ = v72;
                  }

                  while (v41 < v46);
                }

                else
                {
                  unint64_t v9 = v80;
                  unint64_t v40 = v81;
                  int v39 = v77;
                  do
                  {
                    int v74 = *(_DWORD *)v41;
                    v41 += 4;
                    *(_DWORD *)int v42 = v74;
                    v42 += 4;
                  }

                  while (v41 < v46);
                }
              }

              else
              {
                unint64_t v9 = v80;
                unint64_t v40 = v81;
                int v39 = v77;
              }

              *(void *)((unint64_t)(v82 + 7) & 0xFFFFFFFFFFFFFFF8LL) = v48;
              uint64_t v41 = v48;
              uint64_t v37 = v78;
            }

            while (v40 != v78);
          }

          uint64_t v37 = &v9[v75];
          int v38 = v39;
        }

        while (*(char **)((unint64_t)(v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) != &v9[v75]);
      }

      if (v9 == __base)
      {
        _platform_memmove();
        unint64_t v9 = v39;
      }

      free(v9);
      return 0;
    }

    size_t v10 = __nel & 1 | 4;
    int64_t v11 = (__nel - v10) * k;
    insertionsort_0((uint64_t)__base + v11, v10, k, (uint64_t)__compar);
    int v85 = &v9[v75];
    *(void *)((unint64_t)&v9[v11 + 7] & 0xFFFFFFFFFFFFFFF8LL) = &v9[v75];
    int v12 = (*((uint64_t (**)(void *, void *, char *))__compar + 2))(__compar, __base, (char *)__base + k);
    if (v11 < 1) {
      goto LABEL_43;
    }
    int v13 = (char *)__base + v11;
    uint64_t v14 = 2 * k;
    int v15 = v12 > 0;
    uint64_t v16 = -(uint64_t)k;
    signed int v17 = v9;
    signed int v18 = (char *)__base;
    uint64_t v89 = 3 * k;
    uint64_t v91 = v13;
    uint64_t v79 = v9;
    uint64_t v87 = -(uint64_t)k;
    while (1)
    {
      uint64_t v19 = &v18[v14];
      if (&v18[v14] < v13)
      {
        unsigned int v20 = 2;
        size_t v21 = v18;
        while (1)
        {
          int v22 = &v21[v14];
          if ((v15 & 1) == (*((int (**)(void *, char *, char *))__compar + 2))( __compar,  &v21[v14],  &v21[v89]) < 1) {
            break;
          }
          v20 += 2;
          uint64_t v23 = &v22[v14];
          size_t v21 = v22;
          if (&v22[v14] >= v91) {
            goto LABEL_16;
          }
        }

        uint64_t v23 = v22;
LABEL_16:
        uint64_t v16 = v87;
        if (v20 > 0xF)
        {
          for (size_t k = v93; v19 < v23; v19 += v14)
          {
            int v28 = &v19[v16];
            if (((v15 ^ ((*((int (**)(void *, char *, char *))__compar + 2))(__compar, v28, v19) < 1)) & 1) == 0)
            {
              *(void *)((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) = &v79[v19 - (_BYTE *)__base];
              if ((v15 & 1) != 0)
              {
                unint64_t v29 = v18 + 1;
                size_t v30 = v93;
                while (1)
                {
                  char v31 = *(v29 - 1);
                  *(v29 - 1) = *v28;
                  *v28++ = v31;
                  if (!--v30)
                  {
                    v28 -= v14;
                    size_t v30 = v93;
                    if (v29 >= v28) {
                      break;
                    }
                  }

                  ++v29;
                }
              }

              signed int v18 = v19;
              signed int v17 = &v79[v19 - (_BYTE *)__base];
            }

            uint64_t v16 = v87;
          }

          unint64_t v9 = v79;
          if ((v15 & 1) != 0)
          {
            uint64_t v32 = &v19[v16];
            unint64_t v33 = v18 + 1;
            size_t v34 = v93;
            while (1)
            {
              char v35 = *(v33 - 1);
              *(v33 - 1) = *v32;
              *v32++ = v35;
              if (!--v34)
              {
                v32 -= v14;
                size_t v34 = v93;
                if (v33 >= v32) {
                  break;
                }
              }

              ++v33;
            }
          }

          if (v19 < v91
            || (int v36 = (*((uint64_t (**)(void *, char *, char *))__compar + 2))(__compar, &v19[v16], v19),
                uint64_t v24 = v85,
                v36 >= 1))
          {
            uint64_t v24 = &v79[v19 - (_BYTE *)__base];
          }

          *(void *)((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) = v24;
          signed int v18 = v19;
          goto LABEL_42;
        }

        uint64_t v19 = v23;
        size_t k = v93;
        unint64_t v9 = v79;
      }

      do
      {
        uint64_t v24 = &v9[&v18[v14] - (_BYTE *)__base];
        *(void *)((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) = v24;
        if ((v15 & 1) != 0)
        {
          uint64_t v25 = 0LL;
          unsigned int v26 = &v18[k];
          do
          {
            char v27 = v18[v25];
            v18[v25] = v26[v25];
            v26[v25++] = v27;
          }

          while (k != v25);
          v18 += v16 + v25;
        }

        v18 += v14;
        signed int v17 = v24;
      }

      while (v18 < v19);
LABEL_42:
      v15 ^= 1u;
      signed int v17 = v24;
      int v13 = v91;
      if (v18 >= v91) {
        goto LABEL_43;
      }
    }
  }

  return 0;
}

uint64_t insertionsort_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - 1;
  if (a2 != 1)
  {
    unint64_t v7 = result;
    uint64_t v8 = -a3;
    unint64_t v9 = result;
    do
    {
      unint64_t v10 = v9;
      v9 += a3;
      if (v9 > v7)
      {
        unint64_t v11 = v9;
        do
        {
          unint64_t v12 = v11 + v8;
          uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(a4 + 16))(a4, v11 + v8, v11);
          uint64_t v13 = 0LL;
          do
          {
            char v14 = *(_BYTE *)(v10 + v13);
            *(_BYTE *)(v10 + v13) = *(_BYTE *)(v11 + v13);
            *(_BYTE *)(v11 + v13++) = v14;
          }

          while ((_DWORD)a3 != (_DWORD)v13);
          v10 += v8;
          v11 += v8;
        }

        while (v12 > v7);
      }

      --v4;
    }

    while (v4);
  }

  return result;
}

void psort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  if (__nel >= 0x7D0
    && (_get_cpu_capabilities() & 0xFE0000) != 0
    && (v18 = 0LL, v16 = 0u, *(_OWORD *)group = 0u, v14 = 0u, *(_OWORD *)int v15 = 0u, (v8 = getargs((uint64_t)&v14)) != 0LL))
  {
    uint64_t v9 = (uint64_t)v8;
    *(void *)&__int128 v14 = "psort";
    v15[1] = __compar;
    *(void *)&__int128 v16 = __width;
    group[0] = (dispatch_group_t)dispatch_get_global_queue(0LL, 0LL);
    group[1] = dispatch_group_create();
    *(void *)(v9 + 8) = __base;
    *(void *)(v9 + 16) = __nel;
    *(_DWORD *)(v9 + 24) = 2 * flsl(__nel) - 2;
    *(void *)uint64_t v9 = &v14;
    int v10 = flsl(__nel);
    if (v10 >= 0) {
      int v11 = v10;
    }
    else {
      int v11 = v10 + 1;
    }
    *((void *)&v16 + 1) = ((1LL << (v11 >> 1)) + (__nel >> (v11 >> 1))) >> 1;
    _psort_parallel(v9);
    dispatch_group_wait(group[1], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(group[1]);
    unint64_t v12 = v15[0];
    if (v15[0])
    {
      do
      {
        uint64_t v13 = (void *)*v12;
        munmap(v12, 0x1000uLL);
        unint64_t v12 = v13;
      }

      while (v13);
    }
  }

  else
  {
    qsort(__base, __nel, __width, __compar);
  }

void *getargs(uint64_t a1)
{
  int v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  unsigned int v3 = *(void **)(a1 + 8);
  if (!v3)
  {
    uint64_t v4 = mmap(0LL, 0x1000uLL, 3, 4098, -1, 0LL);
    if (!v4) {
      return 0LL;
    }
    char v5 = 0LL;
    void *v4 = *(void *)(a1 + 16);
    unsigned int v3 = v4 - 3;
    *(void *)(a1 + 16) = v4;
    int v6 = v4 + 1;
    for (unsigned int i = 128; i > 1; --i)
    {
      v3[4] = v5;
      v3 += 4;
      char v5 = v6;
      v6 += 4;
    }

    *(void *)(a1 + 8) = v3;
  }

  *(void *)(a1 + 8) = *v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

void _psort_parallel(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  _psort( *(char **)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(v2 + 32),  *(int (__cdecl **)(const void *, const void *))(v2 + 24),  *(_DWORD *)(a1 + 24),  v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  *(void *)a1 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
}

void _psort( char *a1, size_t a2, int64_t a3, int (__cdecl *a4)(const void *, const void *), int a5, uint64_t a6)
{
  if (a5 < 1)
  {
LABEL_137:
    heapsort(a1, a2, a3, a4);
    return;
  }

  int v9 = a5;
  int64_t v10 = -a3;
  BOOL v107 = a3 != 8;
  uint64_t v105 = (int)a3;
  uint64_t v121 = (int)a3 + 1LL;
  unint64_t v106 = (unint64_t)(int)a3 >> 3;
  size_t __width = a3;
  while (1)
  {
    uint64_t v122 = (a1 | a3) & 7;
    else {
      int v11 = v107;
    }
    int64_t v12 = a2 * a3;
    if (a2 <= 6)
    {
      if (v12 > a3)
      {
        int v119 = &a1[v12];
        int v92 = &a1[__width];
        size_t v93 = a1;
        do
        {
          if (v92 > a1)
          {
            unsigned __int32 v94 = v93;
            size_t v95 = v92;
            do
            {
              int v96 = v95;
              v95 += v10;
              if (v11)
              {
                uint64_t v97 = v122;
                if (v122)
                {
                  uint64_t v98 = 0LL;
                  uint64_t v99 = v105 + 1;
                  do
                  {
                    char v100 = v96[v98];
                    v96[v98] = *((_BYTE *)v94 + v98);
                    *((_BYTE *)v94 + v98) = v100;
                    --v99;
                    ++v98;
                  }

                  while (v99 > 1);
                }

                else
                {
                  size_t v102 = (size_t)v94 + __width;
                  unint64_t v103 = v106 + 1;
                  do
                  {
                    uint64_t v104 = *(void *)(v102 + v97);
                    *(void *)(v102 + v97) = *(void *)((char *)v94 + v97);
                    *(void *)((char *)v94 + v97) = v104;
                    v97 += 8LL;
                    --v103;
                  }

                  while (v103 > 1);
                }
              }

              else
              {
                uint64_t v101 = *(void *)v96;
                *(void *)int v96 = *(void *)v95;
                *(void *)size_t v95 = v101;
              }

              unsigned __int32 v94 = (void *)((char *)v94 + v10);
            }

            while (v95 > a1);
          }

          v92 += __width;
          size_t v93 = (void *)((char *)v93 + __width);
        }

        while (v92 < v119);
      }

      return;
    }

    uint64_t v13 = &a1[(a2 >> 1) * a3];
    int v111 = v9;
    size_t v112 = a2;
    int64_t v110 = a2 * a3;
    if (a2 != 7)
    {
      __int128 v14 = &a1[(a2 - 1) * a3];
      if (a2 < 0x29)
      {
        uint64_t v19 = a1;
        goto LABEL_40;
      }

      int v115 = &a1[(a2 - 1) * a3];
      size_t v15 = (a2 >> 3) * a3;
      int v16 = ((uint64_t (*)(char *, char *))a4)(a1, &a1[v15]);
      int v117 = &a1[v15];
      int v17 = ((uint64_t (*)(char *, char *))a4)(&a1[v15], &a1[2 * v15]);
      if (v16 < 0)
      {
        if (v17 < 0) {
          goto LABEL_20;
        }
        else {
          uint64_t v18 = &a1[2 * v15];
        }
      }

      else
      {
        if (v17 > 0) {
          goto LABEL_20;
        }
        else {
          uint64_t v18 = a1;
        }
      }

      int v117 = v18;
LABEL_20:
      int v20 = ((uint64_t (*)(char *, char *))a4)(&v13[-v15], v13);
      int v21 = ((uint64_t (*)(char *, char *))a4)(v13, &v13[v15]);
      __int128 v14 = v115;
      if (v20 < 0)
      {
        if ((v21 & 0x80000000) == 0)
        {
          else {
            v13 += v15;
          }
        }
      }

      else if (v21 <= 0)
      {
        else {
          v13 -= v15;
        }
      }

      int v22 = &v115[-2 * v15];
      uint64_t v23 = &v115[-v15];
      int v24 = ((uint64_t (*)(char *, char *))a4)(v22, &v115[-v15]);
      int v25 = ((uint64_t (*)(char *, char *))a4)(&v115[-v15], v115);
      if (v24 < 0)
      {
        uint64_t v19 = v117;
        if ((v25 & 0x80000000) == 0)
        {
          goto LABEL_39;
        }
      }

      else
      {
        uint64_t v19 = v117;
        if (v25 <= 0)
        {
          goto LABEL_39;
        }
      }

      __int128 v14 = v23;
LABEL_39:
      int v9 = v111;
      a2 = v112;
LABEL_40:
      int v26 = ((uint64_t (*)(char *, char *))a4)(v19, v13);
      int v27 = ((uint64_t (*)(char *, char *))a4)(v13, v14);
      if (v26 < 0)
      {
        if ((v27 & 0x80000000) == 0)
        {
          else {
            uint64_t v13 = v14;
          }
        }
      }

      else if (v27 <= 0)
      {
        else {
          uint64_t v13 = v19;
        }
      }
    }

    if (v11)
    {
      if (v122)
      {
        uint64_t v28 = v121;
        unint64_t v29 = a1;
        do
        {
          char v30 = *v29;
          *v29++ = *v13;
          *v13++ = v30;
          --v28;
        }

        while (v28 > 1);
      }

      else
      {
        unint64_t v32 = v106 + 1;
        unint64_t v33 = a1;
        do
        {
          uint64_t v34 = *(void *)v33;
          *(void *)unint64_t v33 = *(void *)v13;
          v33 += 8;
          *(void *)uint64_t v13 = v34;
          v13 += 8;
          --v32;
        }

        while (v32 > 1);
      }
    }

    else
    {
      uint64_t v31 = *(void *)a1;
      *(void *)a1 = *(void *)v13;
      *(void *)uint64_t v13 = v31;
    }

    int v35 = 0;
    unsigned int v113 = v9 - 1;
    int v36 = &a1[__width];
    uint64_t v37 = &a1[(a2 - 1) * __width];
    int v38 = v37;
    int v39 = &a1[__width];
LABEL_58:
    while (v39 <= v38)
    {
      int v40 = ((uint64_t (*)(char *, char *))a4)(v39, a1);
      if (v40 > 0) {
        break;
      }
      if (!v40)
      {
        if (v11)
        {
          uint64_t v41 = v122;
          if (v122)
          {
            uint64_t v42 = 0LL;
            uint64_t v43 = v121;
            do
            {
              char v44 = v36[v42];
              v36[v42] = v39[v42];
              v39[v42] = v44;
              --v43;
              ++v42;
            }

            while (v43 > 1);
          }

          else
          {
            unint64_t v58 = v106 + 1;
            do
            {
              uint64_t v59 = *(void *)&v36[v41];
              *(void *)&v36[v41] = *(void *)&v39[v41];
              *(void *)&v39[v41] = v59;
              v41 += 8LL;
              --v58;
            }

            while (v58 > 1);
          }
        }

        else
        {
          uint64_t v57 = *(void *)v36;
          *(void *)int v36 = *(void *)v39;
          *(void *)int v39 = v57;
        }

        v36 += __width;
        int v35 = 1;
      }

      v39 += __width;
    }

    while (v39 <= v38)
    {
      int v52 = ((uint64_t (*)(char *, char *))a4)(v38, a1);
      if (v52 < 0)
      {
        if (v11)
        {
          uint64_t v53 = v122;
          if (v122)
          {
            uint64_t v54 = 0LL;
            uint64_t v55 = v121;
            do
            {
              char v56 = v39[v54];
              v39[v54] = v38[v54];
              v38[v54] = v56;
              --v55;
              ++v54;
            }

            while (v55 > 1);
          }

          else
          {
            unint64_t v61 = v106 + 1;
            do
            {
              uint64_t v62 = *(void *)&v39[v53];
              *(void *)&v39[v53] = *(void *)&v38[v53];
              *(void *)&v38[v53] = v62;
              v53 += 8LL;
              --v61;
            }

            while (v61 > 1);
          }
        }

        else
        {
          uint64_t v60 = *(void *)v39;
          *(void *)int v39 = *(void *)v38;
          *(void *)int v38 = v60;
        }

        v39 += __width;
        v38 += v10;
        int v35 = 1;
        goto LABEL_58;
      }

      if (!v52)
      {
        if (v11)
        {
          uint64_t v45 = v122;
          if (v122)
          {
            uint64_t v46 = 0LL;
            uint64_t v47 = v121;
            do
            {
              char v48 = v38[v46];
              v38[v46] = v37[v46];
              v37[v46] = v48;
              --v47;
              ++v46;
            }

            while (v47 > 1);
          }

          else
          {
            unint64_t v50 = v106 + 1;
            do
            {
              uint64_t v51 = *(void *)&v38[v45];
              *(void *)&v38[v45] = *(void *)&v37[v45];
              *(void *)&v37[v45] = v51;
              v45 += 8LL;
              --v50;
            }

            while (v50 > 1);
          }
        }

        else
        {
          uint64_t v49 = *(void *)v38;
          *(void *)int v38 = *(void *)v37;
          *(void *)uint64_t v37 = v49;
        }

        v37 += v10;
        int v35 = 1;
      }

      v38 += v10;
    }

    int64_t v63 = v39 - v36;
    size_t v109 = v39 - v36;
    if (v36 - a1 < v39 - v36) {
      int64_t v63 = v36 - a1;
    }
    if (v63)
    {
      int v64 = &v39[-v63];
      if (v122)
      {
        uint64_t v65 = (int)v63 + 1LL;
        char v66 = a1;
        do
        {
          char v67 = *v66;
          *v66++ = *v64;
          *v64++ = v67;
          --v65;
        }

        while (v65 > 1);
      }

      else
      {
        unint64_t v68 = ((unint64_t)(int)v63 >> 3) + 1;
        char v69 = a1;
        do
        {
          uint64_t v70 = *(void *)v69;
          *(void *)char v69 = *(void *)v64;
          v69 += 8;
          *(void *)int v64 = v70;
          v64 += 8;
          --v68;
        }

        while (v68 > 1);
      }
    }

    int64_t v71 = v37 - v38;
    uint64_t v118 = &a1[v110];
    size_t v114 = v37 - v38;
    if (v71)
    {
      char v72 = &v118[-v71];
      if (v122)
      {
        uint64_t v73 = (int)v71 + 1LL;
        do
        {
          char v74 = *v39;
          *v39++ = *v72;
          *v72++ = v74;
          --v73;
        }

        while (v73 > 1);
      }

      else
      {
        unint64_t v75 = ((unint64_t)(int)v71 >> 3) + 1;
        do
        {
          uint64_t v76 = *(void *)v39;
          *(void *)int v39 = *(void *)v72;
          v39 += 8;
          *(void *)char v72 = v76;
          v72 += 8;
          --v75;
        }

        while (v75 > 1);
      }
    }

    if (!v35) {
      break;
    }
LABEL_112:
    if (v109 > __width)
    {
      size_t v77 = v109 / __width;
      if (a6 && v77 > *(void *)(a6 + 40))
      {
        uint64_t v78 = getargs(a6);
        if (!v78) {
          _psort_cold_1();
        }
        void *v78 = a6;
        v78[1] = a1;
        v78[2] = v77;
        *((_DWORD *)v78 + 6) = v113;
        dispatch_group_async_f( *(dispatch_group_t *)(a6 + 56),  *(dispatch_queue_t *)(a6 + 48),  v78,  (dispatch_function_t)_psort_parallel);
      }

      else
      {
        _psort(a1, v109 / __width, __width, a4, v113, 0LL);
      }
    }

    if (v114 <= __width) {
      return;
    }
    a1 = &v118[-v114];
    a3 = __width;
    a2 = v114 / __width;
    int v9 = v113;
    if (v111 < 2) {
      goto LABEL_137;
    }
  }

  uint64_t v79 = &a1[__width];
  if (v110 > (uint64_t)__width)
  {
    LODWORD(v80) = 0;
    uint64_t v81 = a1;
    do
    {
      unint64_t v80 = (int)v80;
      int v82 = v81;
      uint64_t v116 = v79;
      while (v79 > a1)
      {
        uint64_t v83 = v79;
        v79 += v10;
        if (v11)
        {
          uint64_t v84 = v122;
          if (v122)
          {
            uint64_t v85 = 0LL;
            uint64_t v86 = v121;
            do
            {
              char v87 = v83[v85];
              v83[v85] = *((_BYTE *)v82 + v85);
              *((_BYTE *)v82 + v85) = v87;
              --v86;
              ++v85;
            }

            while (v86 > 1);
          }

          else
          {
            unint64_t v89 = v106 + 1;
            size_t v90 = (size_t)v82 + __width;
            do
            {
              uint64_t v91 = *(void *)(v90 + v84);
              *(void *)(v90 + v84) = *(void *)((char *)v82 + v84);
              *(void *)((char *)v82 + v84) = v91;
              v84 += 8LL;
              --v89;
            }

            while (v89 > 1);
          }
        }

        else
        {
          uint64_t v88 = *(void *)v83;
          *(void *)uint64_t v83 = *(void *)v79;
          *(void *)uint64_t v79 = v88;
        }

        ++v80;
        int v82 = (void *)((char *)v82 + v10);
        if ((v112 >> 2) + 1 < v80) {
          goto LABEL_112;
        }
      }

      uint64_t v79 = (char *)v116 + __width;
      uint64_t v81 = (void *)((char *)v81 + __width);
    }

    while ((char *)v116 + __width < v118);
  }

void psort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  if (__nel >= 0x7D0
    && (_get_cpu_capabilities() & 0xFE0000) != 0
    && (v18 = 0LL, v16 = 0u, *(_OWORD *)group = 0u, v14 = 0u, *(_OWORD *)size_t v15 = 0u, (v8 = getargs((uint64_t)&v14)) != 0LL))
  {
    uint64_t v9 = (uint64_t)v8;
    *(void *)&__int128 v14 = "psort_b";
    v15[1] = __compar;
    *(void *)&__int128 v16 = __width;
    group[0] = (dispatch_group_t)dispatch_get_global_queue(0LL, 0LL);
    group[1] = dispatch_group_create();
    *(void *)(v9 + 8) = __base;
    *(void *)(v9 + 16) = __nel;
    *(_DWORD *)(v9 + 24) = 2 * flsl(__nel) - 2;
    *(void *)uint64_t v9 = &v14;
    int v10 = flsl(__nel);
    if (v10 >= 0) {
      int v11 = v10;
    }
    else {
      int v11 = v10 + 1;
    }
    *((void *)&v16 + 1) = ((1LL << (v11 >> 1)) + (__nel >> (v11 >> 1))) >> 1;
    _psort_parallel_0(v9);
    dispatch_group_wait(group[1], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(group[1]);
    int64_t v12 = v15[0];
    if (v15[0])
    {
      do
      {
        uint64_t v13 = (void *)*v12;
        munmap(v12, 0x1000uLL);
        int64_t v12 = v13;
      }

      while (v13);
    }
  }

  else
  {
    qsort_b(__base, __nel, __width, __compar);
  }

void _psort_parallel_0(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  _psort_0( *(char **)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(v2 + 32),  *(int (***)(void, void, void))(v2 + 24),  *(_DWORD *)(a1 + 24),  v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  *(void *)a1 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
}

void _psort_0( char *a1, size_t a2, unint64_t a3, int (**a4)(void, void, void), int a5, uint64_t a6)
{
  int64_t v7 = a3;
  if (a5 < 1)
  {
LABEL_137:
    heapsort_b(a1, a2, v7, a4);
    return;
  }

  int v10 = a5;
  uint64_t v11 = -(uint64_t)a3;
  BOOL v112 = a3 != 8;
  uint64_t v109 = (int)a3;
  unint64_t v110 = (unint64_t)(int)a3 >> 3;
  uint64_t v122 = (int)a3 + 1LL;
  while (1)
  {
    uint64_t v124 = (a1 | v7) & 7;
    int v12 = v112;
    int v125 = v12;
    int64_t v13 = a2 * v7;
    if (a2 <= 6)
    {
      if (v13 > v7)
      {
        uint64_t v123 = &a1[v13];
        int v96 = &a1[a3];
        uint64_t v97 = a1;
        do
        {
          if (v96 > a1)
          {
            uint64_t v98 = v97;
            uint64_t v99 = v96;
            do
            {
              char v100 = v99;
              v99 += v11;
              if (v125)
              {
                uint64_t v101 = v124;
                if (v124)
                {
                  uint64_t v102 = 0LL;
                  uint64_t v103 = v109 + 1;
                  do
                  {
                    char v104 = v100[v102];
                    v100[v102] = *((_BYTE *)v98 + v102);
                    *((_BYTE *)v98 + v102) = v104;
                    --v103;
                    ++v102;
                  }

                  while (v103 > 1);
                }

                else
                {
                  uint64_t v106 = (uint64_t)v98 + a3;
                  unint64_t v107 = v110 + 1;
                  do
                  {
                    uint64_t v108 = *(void *)(v106 + v101);
                    *(void *)(v106 + v101) = *(void *)((char *)v98 + v101);
                    *(void *)((char *)v98 + v101) = v108;
                    v101 += 8LL;
                    --v107;
                  }

                  while (v107 > 1);
                }
              }

              else
              {
                uint64_t v105 = *(void *)v100;
                *(void *)char v100 = *(void *)v99;
                *(void *)uint64_t v99 = v105;
              }

              uint64_t v98 = (void *)((char *)v98 + v11);
            }

            while (v99 > a1);
          }

          v96 += a3;
          uint64_t v97 = (void *)((char *)v97 + a3);
        }

        while (v96 < v123);
      }

      return;
    }

    __int128 v14 = &a1[(a2 >> 1) * v7];
    int v115 = v10;
    int64_t v114 = a2 * v7;
    if (a2 != 7)
    {
      size_t v15 = &a1[(a2 - 1) * v7];
      if (a2 < 0x29)
      {
        int v20 = a1;
        goto LABEL_39;
      }

      int v117 = &a1[(a2 - 1) * v7];
      size_t v16 = (a2 >> 3) * v7;
      int v17 = ((int (**)(void, char *, char *))a4)[2](a4, a1, &a1[v16]);
      int v119 = &a1[v16];
      int v18 = ((int (**)(void, char *, char *))a4)[2](a4, &a1[v16], &a1[2 * v16]);
      if (v17 < 0)
      {
        if (v18 < 0) {
          goto LABEL_19;
        }
        else {
          uint64_t v19 = &a1[2 * v16];
        }
      }

      else
      {
        if (v18 > 0) {
          goto LABEL_19;
        }
        else {
          uint64_t v19 = a1;
        }
      }

      int v119 = v19;
LABEL_19:
      int v21 = ((int (**)(void, char *, char *))a4)[2](a4, &v14[-v16], v14);
      int v22 = ((int (**)(void, char *, char *))a4)[2](a4, v14, &v14[v16]);
      size_t v15 = v117;
      if (v21 < 0)
      {
        if ((v22 & 0x80000000) == 0)
        {
          else {
            v14 += v16;
          }
        }
      }

      else if (v22 <= 0)
      {
        else {
          v14 -= v16;
        }
      }

      uint64_t v23 = &v117[-2 * v16];
      int v24 = &v117[-v16];
      int v25 = ((int (**)(void, char *, char *))a4)[2](a4, v23, &v117[-v16]);
      int v26 = ((int (**)(void, char *, char *))a4)[2](a4, &v117[-v16], v117);
      if (v25 < 0)
      {
        int v20 = v119;
        if ((v26 & 0x80000000) == 0)
        {
          goto LABEL_38;
        }
      }

      else
      {
        int v20 = v119;
        if (v26 <= 0)
        {
          goto LABEL_38;
        }
      }

      size_t v15 = v24;
LABEL_38:
      int v10 = v115;
LABEL_39:
      int v27 = ((int (**)(void, char *, char *))a4)[2](a4, v20, v14);
      int v28 = ((int (**)(void, char *, char *))a4)[2](a4, v14, v15);
      if (v27 < 0)
      {
        int64_t v7 = a3;
        if ((v28 & 0x80000000) == 0)
        {
          else {
            __int128 v14 = v15;
          }
        }
      }

      else
      {
        int64_t v7 = a3;
        if (v28 <= 0)
        {
          else {
            __int128 v14 = v20;
          }
        }
      }
    }

    if (v125)
    {
      if (v124)
      {
        uint64_t v29 = v122;
        char v30 = a1;
        do
        {
          char v31 = *v30;
          *v30++ = *v14;
          *v14++ = v31;
          --v29;
        }

        while (v29 > 1);
      }

      else
      {
        unint64_t v33 = v110 + 1;
        uint64_t v34 = a1;
        do
        {
          uint64_t v35 = *(void *)v34;
          *(void *)uint64_t v34 = *(void *)v14;
          v34 += 8;
          *(void *)__int128 v14 = v35;
          v14 += 8;
          --v33;
        }

        while (v33 > 1);
      }
    }

    else
    {
      uint64_t v32 = *(void *)a1;
      *(void *)a1 = *(void *)v14;
      *(void *)__int128 v14 = v32;
    }

    int v36 = 0;
    unsigned int v116 = v10 - 1;
    uint64_t v37 = &a1[v7];
    int v38 = &a1[(a2 - 1) * v7];
    int v39 = v38;
    int v40 = &a1[v7];
    unint64_t v120 = &a1[v7];
LABEL_57:
    while (v40 <= v39)
    {
      int v41 = ((int (**)(void, char *, char *))a4)[2](a4, v40, a1);
      if (v41 > 0) {
        break;
      }
      if (!v41)
      {
        if (v125)
        {
          uint64_t v42 = v124;
          if (v124)
          {
            uint64_t v43 = 0LL;
            uint64_t v44 = v122;
            do
            {
              char v45 = v37[v43];
              v37[v43] = v40[v43];
              v40[v43] = v45;
              --v44;
              ++v43;
            }

            while (v44 > 1);
          }

          else
          {
            unint64_t v59 = v110 + 1;
            do
            {
              uint64_t v60 = *(void *)&v37[v42];
              *(void *)&v37[v42] = *(void *)&v40[v42];
              *(void *)&v40[v42] = v60;
              v42 += 8LL;
              --v59;
            }

            while (v59 > 1);
          }
        }

        else
        {
          uint64_t v58 = *(void *)v37;
          *(void *)uint64_t v37 = *(void *)v40;
          *(void *)int v40 = v58;
        }

        v37 += v7;
        int v36 = 1;
      }

      v40 += v7;
    }

    while (v40 <= v39)
    {
      int v53 = ((int (**)(void, char *, char *))a4)[2](a4, v39, a1);
      if (v53 < 0)
      {
        if (v125)
        {
          uint64_t v54 = v124;
          if (v124)
          {
            uint64_t v55 = 0LL;
            uint64_t v56 = v122;
            do
            {
              char v57 = v40[v55];
              v40[v55] = v39[v55];
              v39[v55] = v57;
              --v56;
              ++v55;
            }

            while (v56 > 1);
          }

          else
          {
            unint64_t v62 = v110 + 1;
            do
            {
              uint64_t v63 = *(void *)&v40[v54];
              *(void *)&v40[v54] = *(void *)&v39[v54];
              *(void *)&v39[v54] = v63;
              v54 += 8LL;
              --v62;
            }

            while (v62 > 1);
          }
        }

        else
        {
          uint64_t v61 = *(void *)v40;
          *(void *)int v40 = *(void *)v39;
          *(void *)int v39 = v61;
        }

        v40 += v7;
        v39 += v11;
        int v36 = 1;
        goto LABEL_57;
      }

      if (!v53)
      {
        if (v125)
        {
          uint64_t v46 = v124;
          if (v124)
          {
            uint64_t v47 = 0LL;
            uint64_t v48 = v122;
            do
            {
              char v49 = v39[v47];
              v39[v47] = v38[v47];
              v38[v47] = v49;
              --v48;
              ++v47;
            }

            while (v48 > 1);
          }

          else
          {
            unint64_t v51 = v110 + 1;
            do
            {
              uint64_t v52 = *(void *)&v39[v46];
              *(void *)&v39[v46] = *(void *)&v38[v46];
              *(void *)&v38[v46] = v52;
              v46 += 8LL;
              --v51;
            }

            while (v51 > 1);
          }
        }

        else
        {
          uint64_t v50 = *(void *)v39;
          *(void *)int v39 = *(void *)v38;
          *(void *)int v38 = v50;
        }

        v38 += v11;
        int v36 = 1;
      }

      v39 += v11;
    }

    int64_t v64 = v40 - v37;
    unint64_t v113 = v40 - v37;
    if (v37 - a1 < v40 - v37) {
      int64_t v64 = v37 - a1;
    }
    if (v64)
    {
      uint64_t v65 = &v40[-v64];
      if (v124)
      {
        uint64_t v66 = (int)v64 + 1LL;
        char v67 = a1;
        do
        {
          char v68 = *v67;
          *v67++ = *v65;
          *v65++ = v68;
          --v66;
        }

        while (v66 > 1);
      }

      else
      {
        unint64_t v69 = ((unint64_t)(int)v64 >> 3) + 1;
        uint64_t v70 = a1;
        do
        {
          uint64_t v71 = *(void *)v70;
          *(void *)uint64_t v70 = *(void *)v65;
          v70 += 8;
          *(void *)uint64_t v65 = v71;
          v65 += 8;
          --v69;
        }

        while (v69 > 1);
      }
    }

    unint64_t v72 = v38 - v39;
    uint64_t v118 = &a1[v114];
    if (v72 >= &a1[v114] - &v38[v7]) {
      int64_t v73 = &a1[v114] - &v38[v7];
    }
    else {
      int64_t v73 = v72;
    }
    if (v73)
    {
      char v74 = &v118[-v73];
      if (v124)
      {
        uint64_t v75 = (int)v73 + 1LL;
        do
        {
          char v76 = *v40;
          *v40++ = *v74;
          *v74++ = v76;
          --v75;
        }

        while (v75 > 1);
      }

      else
      {
        unint64_t v77 = ((unint64_t)(int)v73 >> 3) + 1;
        do
        {
          uint64_t v78 = *(void *)v40;
          *(void *)int v40 = *(void *)v74;
          v40 += 8;
          *(void *)char v74 = v78;
          v74 += 8;
          --v77;
        }

        while (v77 > 1);
      }
    }

    if (!v36) {
      break;
    }
LABEL_112:
    unint64_t v79 = a3;
    if (v113 > a3)
    {
      unint64_t v80 = v113 / a3;
      if (a6 && v80 > *(void *)(a6 + 40))
      {
        uint64_t v81 = getargs(a6);
        if (!v81) {
          _psort_cold_1_0();
        }
        *uint64_t v81 = a6;
        v81[1] = a1;
        v81[2] = v80;
        *((_DWORD *)v81 + 6) = v116;
        dispatch_group_async_f( *(dispatch_group_t *)(a6 + 56),  *(dispatch_queue_t *)(a6 + 48),  v81,  (dispatch_function_t)_psort_parallel_0);
        unint64_t v79 = a3;
      }

      else
      {
        unint64_t v79 = a3;
        _psort_0(a1, v113 / a3, a3, a4, v116, 0LL);
      }
    }

    if (v72 <= v79) {
      return;
    }
    a1 = &v118[-v72];
    int64_t v7 = a3;
    a2 = v72 / a3;
    int v10 = v116;
    if (v115 < 2) {
      goto LABEL_137;
    }
  }

  if (v114 > (uint64_t)a3)
  {
    LODWORD(v82) = 0;
    unint64_t v83 = (a2 >> 2) + 1;
    uint64_t v84 = a1;
    do
    {
      unint64_t v82 = (int)v82;
      uint64_t v85 = v84;
      uint64_t v86 = v120;
      while (v86 > a1)
      {
        char v87 = v86;
        v86 += v11;
        if (v125)
        {
          uint64_t v88 = v124;
          if (v124)
          {
            uint64_t v89 = 0LL;
            uint64_t v90 = v122;
            do
            {
              char v91 = v87[v89];
              v87[v89] = *((_BYTE *)v85 + v89);
              *((_BYTE *)v85 + v89) = v91;
              --v90;
              ++v89;
            }

            while (v90 > 1);
          }

          else
          {
            unint64_t v93 = v110 + 1;
            uint64_t v94 = (uint64_t)v85 + a3;
            do
            {
              uint64_t v95 = *(void *)(v94 + v88);
              *(void *)(v94 + v88) = *(void *)((char *)v85 + v88);
              *(void *)((char *)v85 + v88) = v95;
              v88 += 8LL;
              --v93;
            }

            while (v93 > 1);
          }
        }

        else
        {
          uint64_t v92 = *(void *)v87;
          *(void *)char v87 = *(void *)v86;
          *(void *)uint64_t v86 = v92;
        }

        ++v82;
        uint64_t v85 = (void *)((char *)v85 + v11);
        if (v83 < v82) {
          goto LABEL_112;
        }
      }

      uint64_t v84 = (void *)((char *)v84 + a3);
      v120 += a3;
    }

    while (v120 < v118);
  }

void psort_r( void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  if (__nel >= 0x7D0
    && (_get_cpu_capabilities() & 0xFE0000) != 0
    && (__int128 v19 = 0u, *(_OWORD *)group = 0u,
                  *(_OWORD *)int v17 = 0u,
                  __int128 v18 = 0u,
                  __int128 v16 = 0u,
                  (int v10 = getargs_0((uint64_t)&v16)) != 0LL))
  {
    uint64_t v11 = (uint64_t)v10;
    *(void *)&__int128 v16 = "psort_r";
    v17[1] = a4;
    *(void *)&__int128 v18 = __compar;
    *((void *)&v18 + 1) = __width;
    *((void *)&v19 + 1) = dispatch_get_global_queue(0LL, 0LL);
    group[0] = dispatch_group_create();
    *(void *)(v11 + 8) = __base;
    *(void *)(v11 + 16) = __nel;
    *(_DWORD *)(v11 + 24) = 2 * flsl(__nel) - 2;
    *(void *)uint64_t v11 = &v16;
    int v12 = flsl(__nel);
    if (v12 >= 0) {
      int v13 = v12;
    }
    else {
      int v13 = v12 + 1;
    }
    *(void *)&__int128 v19 = ((1LL << (v13 >> 1)) + (__nel >> (v13 >> 1))) >> 1;
    _psort_parallel_1(v11);
    dispatch_group_wait(group[0], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(group[0]);
    __int128 v14 = v17[0];
    if (v17[0])
    {
      do
      {
        size_t v15 = (void *)*v14;
        munmap(v14, 0x1000uLL);
        __int128 v14 = v15;
      }

      while (v15);
    }
  }

  else
  {
    qsort_r(__base, __nel, __width, a4, __compar);
  }

void *getargs_0(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 72);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  unsigned int v3 = *(void **)(a1 + 8);
  if (!v3)
  {
    uint64_t v4 = mmap(0LL, 0x1000uLL, 3, 4098, -1, 0LL);
    if (!v4) {
      return 0LL;
    }
    char v5 = 0LL;
    void *v4 = *(void *)(a1 + 16);
    unsigned int v3 = v4 - 3;
    *(void *)(a1 + 16) = v4;
    int v6 = v4 + 1;
    for (unsigned int i = 128; i > 1; --i)
    {
      v3[4] = v5;
      v3 += 4;
      char v5 = v6;
      v6 += 4;
    }

    *(void *)(a1 + 8) = v3;
  }

  *(void *)(a1 + 8) = *v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

void _psort_parallel_1(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  _psort_1( *(char **)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(v2 + 40),  *(void *)(v2 + 24),  *(uint64_t (**)(uint64_t, char *, char *))(v2 + 32),  *(_DWORD *)(a1 + 24),  v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 72));
  *(void *)a1 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 72));
}

void _psort_1( char *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, char *, char *), int a6, uint64_t a7)
{
  int64_t v9 = a3;
  if (a6 < 1)
  {
LABEL_135:
    __heapsort_r(a1, a2, v9, a4, a5);
    return;
  }

  int v12 = a6;
  uint64_t v13 = -(uint64_t)a3;
  BOOL v113 = a3 != 8;
  uint64_t v111 = (int)a3;
  unint64_t v112 = (unint64_t)(int)a3 >> 3;
  uint64_t v129 = (int)a3 + 1LL;
  while (1)
  {
    uint64_t v130 = (a1 | v9) & 7;
    int v14 = v113;
    int v131 = v14;
    int64_t v15 = a2 * v9;
    if (a2 <= 6)
    {
      if (v15 > v9)
      {
        v127 = &a1[v15];
        uint64_t v98 = &a1[a3];
        uint64_t v99 = a1;
        do
        {
          if (v98 > a1)
          {
            char v100 = v99;
            uint64_t v101 = v98;
            do
            {
              uint64_t v102 = v101;
              v101 += v13;
              if (v131)
              {
                uint64_t v103 = v130;
                if (v130)
                {
                  uint64_t v104 = 0LL;
                  uint64_t v105 = v111 + 1;
                  do
                  {
                    char v106 = v102[v104];
                    v102[v104] = v100[v104];
                    v100[v104] = v106;
                    --v105;
                    ++v104;
                  }

                  while (v105 > 1);
                }

                else
                {
                  unint64_t v108 = v112 + 1;
                  uint64_t v109 = &v100[a3];
                  do
                  {
                    uint64_t v110 = *(void *)&v109[v103];
                    *(void *)&v109[v103] = *(void *)&v100[v103];
                    *(void *)&v100[v103] = v110;
                    v103 += 8LL;
                    --v108;
                  }

                  while (v108 > 1);
                }
              }

              else
              {
                uint64_t v107 = *(void *)v102;
                *(void *)uint64_t v102 = *(void *)v101;
                *(void *)uint64_t v101 = v107;
              }

              v100 += v13;
            }

            while (v101 > a1);
          }

          v98 += a3;
          v99 += a3;
        }

        while (v98 < v127);
      }

      return;
    }

    __int128 v16 = &a1[(a2 >> 1) * v9];
    int v118 = v12;
    unint64_t v115 = a2;
    int64_t v117 = a2 * v9;
    if (a2 != 7)
    {
      int v17 = &a1[(a2 - 1) * v9];
      if (a2 < 0x29)
      {
        int v24 = a1;
        goto LABEL_39;
      }

      unint64_t v18 = (a2 >> 3) * v9;
      __int128 v19 = &a1[v18];
      unint64_t v120 = v18;
      uint64_t v122 = &a1[(a2 - 1) * v9];
      int v20 = &a1[2 * v18];
      int v21 = a5(a4, a1, &a1[v18]);
      uint64_t v124 = v19;
      int v22 = a5(a4, v19, v20);
      if (v21 < 0)
      {
        if (v22 < 0) {
          goto LABEL_19;
        }
        else {
          uint64_t v23 = v20;
        }
      }

      else
      {
        if (v22 > 0) {
          goto LABEL_19;
        }
        else {
          uint64_t v23 = a1;
        }
      }

      uint64_t v124 = v23;
LABEL_19:
      int v25 = &v16[-v120];
      int v26 = &v16[v120];
      int v27 = a5(a4, &v16[-v120], &a1[(a2 >> 1) * v9]);
      int v28 = a5(a4, v16, &v16[v120]);
      if (v27 < 0)
      {
        if ((v28 & 0x80000000) == 0)
        {
          else {
            v16 += v120;
          }
        }
      }

      else if (v28 <= 0)
      {
        else {
          v16 -= v120;
        }
      }

      int v17 = v122;
      uint64_t v29 = &v122[-2 * v120];
      int v30 = a5(a4, v29, &v122[-v120]);
      int v31 = a5(a4, &v122[-v120], v122);
      if (v30 < 0)
      {
        if ((v31 & 0x80000000) == 0)
        {
          goto LABEL_38;
        }
      }

      else if (v31 <= 0)
      {
        goto LABEL_38;
      }

      int v17 = &v122[-v120];
LABEL_38:
      int v12 = v118;
      a2 = v115;
      int v24 = v124;
LABEL_39:
      int v125 = v24;
      int v32 = ((uint64_t (*)(uint64_t))a5)(a4);
      int v33 = a5(a4, v16, v17);
      if (v32 < 0)
      {
        if ((v33 & 0x80000000) == 0)
        {
          __int128 v16 = v125;
        }
      }

      else if (v33 <= 0)
      {
        __int128 v16 = v125;
      }
    }

    if (v131)
    {
      if (((a1 | v9) & 7) != 0)
      {
        uint64_t v34 = v129;
        uint64_t v35 = a1;
        do
        {
          char v36 = *v35;
          *v35++ = *v16;
          *v16++ = v36;
          --v34;
        }

        while (v34 > 1);
      }

      else
      {
        unint64_t v38 = v112 + 1;
        int v39 = a1;
        do
        {
          uint64_t v40 = *(void *)v39;
          *(void *)int v39 = *(void *)v16;
          v39 += 8;
          *(void *)__int128 v16 = v40;
          v16 += 8;
          --v38;
        }

        while (v38 > 1);
      }
    }

    else
    {
      uint64_t v37 = *(void *)a1;
      *(void *)a1 = *(void *)v16;
      *(void *)__int128 v16 = v37;
    }

    int v41 = 0;
    unsigned int v119 = v12 - 1;
    uint64_t v42 = &a1[v9];
    uint64_t v43 = &a1[(a2 - 1) * v9];
    uint64_t v44 = v43;
    char v45 = &a1[v9];
LABEL_56:
    while (v45 <= v44)
    {
      int v46 = a5(a4, v45, a1);
      if (v46 > 0) {
        break;
      }
      if (!v46)
      {
        if (v131)
        {
          uint64_t v47 = (a1 | v9) & 7;
          if (((a1 | v9) & 7) != 0)
          {
            uint64_t v48 = 0LL;
            uint64_t v49 = v129;
            do
            {
              char v50 = v42[v48];
              v42[v48] = v45[v48];
              v45[v48] = v50;
              --v49;
              ++v48;
            }

            while (v49 > 1);
          }

          else
          {
            unint64_t v64 = v112 + 1;
            do
            {
              uint64_t v65 = *(void *)&v42[v47];
              *(void *)&v42[v47] = *(void *)&v45[v47];
              *(void *)&v45[v47] = v65;
              v47 += 8LL;
              --v64;
            }

            while (v64 > 1);
          }
        }

        else
        {
          uint64_t v63 = *(void *)v42;
          *(void *)uint64_t v42 = *(void *)v45;
          *(void *)char v45 = v63;
        }

        v42 += v9;
        int v41 = 1;
      }

      v45 += v9;
    }

    while (v45 <= v44)
    {
      int v58 = a5(a4, v44, a1);
      if (v58 < 0)
      {
        if (v131)
        {
          uint64_t v59 = (a1 | v9) & 7;
          if (((a1 | v9) & 7) != 0)
          {
            uint64_t v60 = 0LL;
            uint64_t v61 = v129;
            do
            {
              char v62 = v45[v60];
              v45[v60] = v44[v60];
              v44[v60] = v62;
              --v61;
              ++v60;
            }

            while (v61 > 1);
          }

          else
          {
            unint64_t v67 = v112 + 1;
            do
            {
              uint64_t v68 = *(void *)&v45[v59];
              *(void *)&v45[v59] = *(void *)&v44[v59];
              *(void *)&v44[v59] = v68;
              v59 += 8LL;
              --v67;
            }

            while (v67 > 1);
          }
        }

        else
        {
          uint64_t v66 = *(void *)v45;
          *(void *)char v45 = *(void *)v44;
          *(void *)uint64_t v44 = v66;
        }

        v45 += v9;
        v44 += v13;
        int v41 = 1;
        goto LABEL_56;
      }

      if (!v58)
      {
        if (v131)
        {
          uint64_t v51 = (a1 | v9) & 7;
          if (((a1 | v9) & 7) != 0)
          {
            uint64_t v52 = 0LL;
            uint64_t v53 = v129;
            do
            {
              char v54 = v44[v52];
              v44[v52] = v43[v52];
              v43[v52] = v54;
              --v53;
              ++v52;
            }

            while (v53 > 1);
          }

          else
          {
            unint64_t v56 = v112 + 1;
            do
            {
              uint64_t v57 = *(void *)&v44[v51];
              *(void *)&v44[v51] = *(void *)&v43[v51];
              *(void *)&v43[v51] = v57;
              v51 += 8LL;
              --v56;
            }

            while (v56 > 1);
          }
        }

        else
        {
          uint64_t v55 = *(void *)v44;
          *(void *)uint64_t v44 = *(void *)v43;
          *(void *)uint64_t v43 = v55;
        }

        v43 += v13;
        int v41 = 1;
      }

      v44 += v13;
    }

    int64_t v69 = v45 - v42;
    unint64_t v116 = v45 - v42;
    if (v42 - a1 < v45 - v42) {
      int64_t v69 = v42 - a1;
    }
    if (v69)
    {
      uint64_t v70 = &v45[-v69];
      if (((a1 | v9) & 7) != 0)
      {
        uint64_t v71 = (int)v69 + 1LL;
        unint64_t v72 = a1;
        do
        {
          char v73 = *v72;
          *v72++ = *v70;
          *v70++ = v73;
          --v71;
        }

        while (v71 > 1);
      }

      else
      {
        unint64_t v74 = ((unint64_t)(int)v69 >> 3) + 1;
        uint64_t v75 = a1;
        do
        {
          uint64_t v76 = *(void *)v75;
          *(void *)uint64_t v75 = *(void *)v70;
          v75 += 8;
          *(void *)uint64_t v70 = v76;
          v70 += 8;
          --v74;
        }

        while (v74 > 1);
      }
    }

    int64_t v77 = v43 - v44;
    v126 = &a1[v117];
    unint64_t v121 = v43 - v44;
    if (v77)
    {
      uint64_t v78 = &v126[-v77];
      if (((a1 | v9) & 7) != 0)
      {
        uint64_t v79 = (int)v77 + 1LL;
        do
        {
          char v80 = *v45;
          *v45++ = *v78;
          *v78++ = v80;
          --v79;
        }

        while (v79 > 1);
      }

      else
      {
        unint64_t v81 = ((unint64_t)(int)v77 >> 3) + 1;
        do
        {
          uint64_t v82 = *(void *)v45;
          *(void *)char v45 = *(void *)v78;
          v45 += 8;
          *(void *)uint64_t v78 = v82;
          v78 += 8;
          --v81;
        }

        while (v81 > 1);
      }
    }

    if (!v41) {
      break;
    }
LABEL_110:
    if (v116 > a3)
    {
      unint64_t v83 = v116 / a3;
      if (a7 && v83 > *(void *)(a7 + 48))
      {
        uint64_t v84 = getargs_0(a7);
        if (!v84) {
          _psort_cold_1_1();
        }
        *uint64_t v84 = a7;
        v84[1] = a1;
        v84[2] = v83;
        *((_DWORD *)v84 + 6) = v119;
        dispatch_group_async_f( *(dispatch_group_t *)(a7 + 64),  *(dispatch_queue_t *)(a7 + 56),  v84,  (dispatch_function_t)_psort_parallel_1);
      }

      else
      {
        _psort_1(a1, v116 / a3, a3, a4, a5, v119, 0LL);
      }
    }

    if (v121 <= a3) {
      return;
    }
    a1 = &v126[-v121];
    int64_t v9 = a3;
    a2 = v121 / a3;
    int v12 = v119;
    if (v118 < 2) {
      goto LABEL_135;
    }
  }

  uint64_t v85 = &a1[v9];
  if (v117 > (uint64_t)a3)
  {
    LODWORD(v86) = 0;
    char v87 = a1;
    do
    {
      unint64_t v86 = (int)v86;
      uint64_t v88 = v87;
      uint64_t v123 = v85;
      while (v85 > a1)
      {
        uint64_t v89 = v85;
        v85 += v13;
        if (v131)
        {
          uint64_t v90 = v130;
          if (v130)
          {
            uint64_t v91 = 0LL;
            uint64_t v92 = v129;
            do
            {
              char v93 = v89[v91];
              v89[v91] = v88[v91];
              v88[v91] = v93;
              --v92;
              ++v91;
            }

            while (v92 > 1);
          }

          else
          {
            unint64_t v95 = v112 + 1;
            int v96 = &v88[a3];
            do
            {
              uint64_t v97 = *(void *)&v96[v90];
              *(void *)&v96[v90] = *(void *)&v88[v90];
              *(void *)&v88[v90] = v97;
              v90 += 8LL;
              --v95;
            }

            while (v95 > 1);
          }
        }

        else
        {
          uint64_t v94 = *(void *)v89;
          *(void *)uint64_t v89 = *(void *)v85;
          *(void *)uint64_t v85 = v94;
        }

        ++v86;
        v88 += v13;
        if ((v115 >> 2) + 1 < v86) {
          goto LABEL_110;
        }
      }

      uint64_t v85 = &v123[a3];
      v87 += a3;
    }

    while (&v123[a3] < v126);
  }

int scandir_b(const char *a1, dirent ***a2, void *a3, void *a4)
{
  int64_t v7 = opendir(a1);
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  int64_t v9 = malloc(0x100uLL);
  if (!v9)
  {
LABEL_19:
    free(v9);
    closedir(v8);
LABEL_20:
    LODWORD(v10) = -1;
    return v10;
  }

  int v20 = a2;
  size_t v10 = 0LL;
  uint64_t v11 = -1LL;
  unint64_t v12 = 32LL;
  while (1)
  {
    uint64_t v13 = readdir(v8);
    if (!v13) {
      break;
    }
    int v14 = v13;
    if (!a3 || (*((unsigned int (**)(void *, dirent *))a3 + 2))(a3, v13))
    {
      int d_namlen = v14->d_namlen;
      __int128 v16 = malloc(((d_namlen + 4) & 0x1FFFC) + 24LL);
      if (!v16) {
        goto LABEL_17;
      }
      int v17 = v16;
      *__int128 v16 = v14->d_ino;
      *((_BYTE *)v16 + 20) = v14->d_type;
      *((_WORD *)v16 + 8) = v14->d_reclen;
      *((_WORD *)v16 + 9) = d_namlen;
      _platform_memmove();
      if (v10 >= v12)
      {
        unint64_t v18 = realloc(v9, 16 * v12);
        if (!v18)
        {
          free(v17);
LABEL_17:
          if (v10)
          {
            do
              free(*((void **)v9 + v11--));
            while (v11 != -1);
          }

          goto LABEL_19;
        }

        v12 *= 2LL;
        int64_t v9 = v18;
      }

      *((void *)v9 + v10++) = v17;
      ++v11;
    }
  }

  closedir(v8);
  if (a4 && v10) {
    qsort_b(v9, v10, 8uLL, a4);
  }
  *int v20 = (dirent **)v9;
  return v10;
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  if (a1 == 30 && a2) {
    return (const char *)inet_ntop6((uint64_t)a2, (uint64_t)a3, a4);
  }
  if (a1 == 2 && a2) {
    return (const char *)inet_ntop4((unsigned __int8 *)a2, (uint64_t)a3, a4);
  }
  *__error() = 47;
  return 0LL;
}

uint64_t inet_ntop6(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4 = 0;
  uint64_t v5 = 0LL;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  do
  {
    *((_DWORD *)&v32 + (v5 >> 1)) |= *(unsigned __int8 *)(a1 + v5) << (~(_BYTE)v4 & 8);
    ++v5;
    v4 += 8;
  }

  while (v5 != 16);
  uint64_t v6 = 0LL;
  int v7 = 0;
  int v8 = 0;
  int v9 = -1;
  int v10 = -1;
  do
  {
    BOOL v12 = v10 == -1 || v7 > v8;
    BOOL v13 = !v12;
    if (v12) {
      int v14 = v7;
    }
    else {
      int v14 = v8;
    }
    if (v13) {
      int v15 = v10;
    }
    else {
      int v15 = v9;
    }
    if (v9 == -1)
    {
      int v14 = v8;
      int v15 = v10;
      int v16 = 1;
    }

    else
    {
      int v16 = v7 + 1;
    }

    if (v9 == -1) {
      int v9 = v6;
    }
    if (*((_DWORD *)&v32 + v6))
    {
      int v8 = v14;
      int v10 = v15;
      int v9 = -1;
    }

    else
    {
      int v7 = v16;
    }

    ++v6;
  }

  while (v6 != 8);
  uint64_t v17 = 0LL;
  if (v10 == -1 || v7 > v8)
  {
    int v20 = v9;
  }

  else
  {
    int v7 = v8;
    int v20 = v10;
  }

  if (v9 == -1) {
    int v21 = v8;
  }
  else {
    int v21 = v7;
  }
  if (v9 == -1) {
    unsigned int v22 = v10;
  }
  else {
    unsigned int v22 = v20;
  }
  if (v21 >= 2 || v22 == -1) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = 0xFFFFFFFFLL;
  }
  uint64_t v25 = (int)v24 + v21;
  int v26 = v34;
  while (1)
  {
    if ((_DWORD)v24 != -1 && v17 >= (int)v24 && v17 < v25)
    {
      if (v24 == v17) {
        *v26++ = 58;
      }
      goto LABEL_61;
    }

    if (v17)
    {
      *v26++ = 58;
      if (!(_DWORD)v24 && v17 == 6 && (v21 == 6 || v21 == 7 && HIDWORD(v33) != 1 || v21 == 5 && DWORD1(v33) == 0xFFFF)) {
        break;
      }
    }

    v26 += sprintf(v26, "%x", *((_DWORD *)&v32 + v17));
LABEL_61:
    if (++v17 == 8) {
      goto LABEL_65;
    }
  }

  int v31 = *(_DWORD *)(a1 + 12);
  v26 += _platform_strlen();
LABEL_65:
  if ((_DWORD)v24 != -1 && (_DWORD)v25 == 8) {
    *v26++ = 58;
  }
  *int v26 = 0;
  if (v26 - v34 + 1 > a3)
  {
LABEL_69:
    uint64_t v27 = 0LL;
    *__error() = 28;
    return v27;
  }

  uint64_t v27 = a2;
  _platform_strcpy();
  return v27;
}

uint64_t inet_ntop4(unsigned __int8 *a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      *(void *)__str = 0LL;
      uint64_t v15 = 0LL;
      uint64_t v6 = __str;
      snprintf(__str, 4uLL, "%d", *a1);
      uint64_t v7 = _platform_strlen();
      unint64_t v8 = v7 + 4;
      uint64_t v9 = 1LL;
      do
      {
        int v10 = &v6[v7];
        char *v10 = 46;
        uint64_t v6 = v10 + 1;
        snprintf(v6, 4uLL, "%d", a1[v9]);
        uint64_t v7 = _platform_strlen();
        v8 += v7;
        ++v9;
      }

      while ((_DWORD)v9 != 4);
      if (v8 <= a3)
      {
        _platform_memmove();
        return v3;
      }

      uint64_t v11 = __error();
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v11 = __error();
    }

    int v12 = 28;
  }

  else
  {
    uint64_t v11 = __error();
    uint64_t v3 = 0LL;
    int v12 = 47;
  }

  int *v11 = v12;
  return v3;
}

int inet_pton(int a1, const char *a2, void *a3)
{
  int v4 = (char *)a2;
  if (a1 != 30)
  {
    if (a1 == 2) {
      return inet_pton4(a2, a3);
    }
    uint64_t v9 = __error();
    int v10 = 47;
    goto LABEL_9;
  }

  if (a2 && (uint64_t v6 = strrchr(a2, 37)) != 0LL)
  {
    uint64_t v7 = v6;
    unint64_t v8 = strdup(v4);
    if (!v8)
    {
      uint64_t v9 = __error();
      int v10 = 12;
LABEL_9:
      int *v9 = v10;
      return -1;
    }

    int v34 = 0;
    __int128 v32 = v7;
    v8[v7 - v4] = 0;
    int v4 = v8;
  }

  else
  {
    __int128 v32 = 0LL;
    int v34 = 1;
  }

  __int128 v35 = 0uLL;
  int v11 = *v4;
  if (!*v4 || (int v12 = v4, v11 == 58) && (int v12 = v4 + 1, v4[1] != 58))
  {
LABEL_52:
    if ((v34 & 1) == 0) {
      free(v4);
    }
    return 0;
  }

  unsigned int v13 = 0;
  int v14 = 0LL;
  uint64_t v15 = 0LL;
  int v16 = (char *)&v35;
  while (2)
  {
    int v30 = v12;
    int v31 = v14;
    uint64_t v33 = v15;
    uint64_t v17 = (char *)&v35 + v15;
    ++v12;
    char v18 = 1;
    __int128 v19 = v16;
    while (1)
    {
      int v20 = (char)v11;
      uint64_t v21 = _platform_memchr();
      if (!v21) {
        break;
      }
      unsigned int v22 = "0123456789abcdef";
LABEL_20:
      unsigned int v13 = (v21 - (_DWORD)v22) | (16 * v13);
      if (HIWORD(v13)) {
        goto LABEL_52;
      }
      char v18 = 0;
      int v23 = *v12++;
      LOBYTE(v11) = v23;
      __int128 v19 = v17;
      if (!v23)
      {
        if (v33 > 14) {
          goto LABEL_52;
        }
        *(_WORD *)((char *)&v35 + v33) = bswap32(v13) >> 16;
        uint64_t v15 = v33 + 2;
LABEL_34:
        __int128 v19 = v31;
        goto LABEL_35;
      }
    }

    uint64_t v21 = _platform_memchr();
    if (v21)
    {
      unsigned int v22 = "0123456789ABCDEF";
      goto LABEL_20;
    }

    if (v20 != 58)
    {
      uint64_t v15 = v33 + 4;
      goto LABEL_34;
    }

    if ((v18 & 1) != 0)
    {
      if (v31) {
        goto LABEL_52;
      }
    }

    else
    {
      if (!*v12 || v33 > 14) {
        goto LABEL_52;
      }
      uint64_t v24 = (char *)&v35 + v33;
      *__int128 v19 = BYTE1(v13);
      v33 += 2LL;
      v24[1] = v13;
      __int128 v19 = v31;
      unsigned int v13 = 0;
    }

    uint64_t v15 = v33;
    int v16 = (char *)&v35 + v33;
    LOBYTE(v11) = *v12;
    int v14 = v19;
    if (*v12) {
      continue;
    }
    break;
  }

uint64_t inet_pton4(_BYTE *a1, _DWORD *a2)
{
  LOBYTE(v11) = 0;
  char v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  LOBYTE(v4) = 0;
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = a1 + 1;
  unint64_t v8 = &v11;
  do
  {
    uint64_t result = _platform_memchr();
    if (result)
    {
      uint64_t v4 = result - (void)"0123456789" + 10LL * v4;
      if ((v4 & 0xFFFFFF00) != 0) {
        return 0LL;
      }
      *(_BYTE *)unint64_t v8 = v4;
      if (!v5)
      {
        if (v6 > 3) {
          return 0LL;
        }
        ++v6;
      }

      int v5 = 1;
    }

    else
    {
      if (!v5 || v2 != 46 || v6 == 4) {
        return result;
      }
      LOBYTE(v4) = 0;
      int v5 = 0;
      *((_BYTE *)v8 + 1) = 0;
      unint64_t v8 = (int *)((char *)v8 + 1);
    }

    int v10 = *v7++;
    char v2 = v10;
  }

  while (v10);
  if (v6 < 4) {
    return 0LL;
  }
  *a2 = v11;
  return 1LL;
}

uint64_t __printf_arginfo_errno(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_errno_cold_1();
  }
  *a3 = 1;
  return 1LL;
}

uint64_t __printf_render_errno(uint64_t *a1, uint64_t a2, int **a3)
{
  int v5 = **a3;
  if (v5 < 0 || v5 >= 107)
  {
    sprintf(v11, "errno=%d/0x%x", **a3, v5);
    uint64_t v9 = _platform_strlen();
    uint64_t v10 = __printf_out((uint64_t)a1, a2, (uint64_t)v11, v9);
    __printf_flush(a1);
    return v10;
  }

  else
  {
    int v6 = strerror(v5);
    uint64_t v7 = _platform_strlen();
    return __printf_out((uint64_t)a1, a2, (uint64_t)v6, v7);
  }

uint64_t __printf_arginfo_float(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_float_cold_1();
  }
  if (*(__int16 *)(a1 + 40) < 0)
  {
    int v3 = 256;
  }

  else
  {
    *a3 = 128;
    if ((*(_WORD *)(a1 + 40) & 1) != 0) {
      int v3 = 65664;
    }
    else {
      int v3 = 128;
    }
  }

  *a3 = v3;
  return 1LL;
}

uint64_t __printf_render_float(uint64_t *a1, uint64_t a2, double **a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2;
  uint64_t v6 = (uint64_t)a1;
  int v7 = *(_DWORD *)(a2 + 20);
  char v74 = 0;
  char v76 = *(_DWORD *)(a2 + 36);
  thousands_sep = localeconv_l(*(locale_t *)(a2 + 8))->thousands_sep;
  uint64_t v70 = _platform_strlen();
  if ((*(_WORD *)(v5 + 40) & 0x100) != 0)
  {
    uint64_t v10 = localeconv_l(*(locale_t *)(v5 + 8));
    fixed = __fix_nogrouping(v10->grouping);
  }

  else
  {
    fixed = 0LL;
  }

  decimal_point = localeconv_l(*(locale_t *)(v5 + 8))->decimal_point;
  uint64_t v12 = _platform_strlen();
  LOBYTE(v13) = 0;
  int v14 = *(_DWORD *)(v5 + 28);
  uint64_t v62 = (uint64_t)decimal_point;
  uint64_t v63 = v12;
  switch(v14)
  {
    case 'A':
LABEL_9:
      BOOL v15 = v14 == 97;
      if (v14 == 97) {
        char v16 = 120;
      }
      else {
        char v16 = 88;
      }
      if (v15) {
        LOBYTE(v13) = 112;
      }
      else {
        LOBYTE(v13) = 80;
      }
      if (v15) {
        uint64_t v17 = &__lowercase_hex;
      }
      else {
        uint64_t v17 = &__uppercase_hex;
      }
      char v74 = v16;
      int v18 = v7 + (v7 >= 0);
      if ((*(_WORD *)(v5 + 40) & 1) != 0)
      {
        double v75 = **v4;
        __int128 v19 = (char *)__hldtoa(v17, v7 + (v7 >= 0), &v79, &v78, &v77);
      }

      else
      {
        __int128 v19 = (char *)__hdtoa((uint64_t)v17, v7 + (v7 >= 0), &v79, &v78, &v77, **v4);
      }

      uint64_t v21 = v19;
      if (v18 < 0) {
        int v18 = (_DWORD)v77 - (_DWORD)v19;
      }
      if (v79 == 0x7FFFFFFF) {
        char v74 = 0;
      }
      goto LABEL_44;
    case 'B':
    case 'C':
    case 'D':
LABEL_178:
      __printf_render_float_cold_1();
    case 'E':
LABEL_20:
      if (v7 >= 0) {
        ++v7;
      }
      else {
        int v7 = 7;
      }
      int v13 = *(_DWORD *)(v5 + 28);
      goto LABEL_26;
    case 'F':
      goto LABEL_26;
    case 'G':
LABEL_24:
      LOBYTE(v13) = v14 - 2;
LABEL_26:
      if (v7 >= 0) {
        int v18 = v7;
      }
      else {
        int v18 = 6;
      }
      if ((*(_WORD *)(v5 + 40) & 1) != 0)
      {
        double v75 = **v4;
        if ((_BYTE)v13) {
          unsigned int v22 = 2;
        }
        else {
          unsigned int v22 = 3;
        }
        uint64_t v21 = __ldtoa(&v75, v22, v18, &v79, &v78, &v77);
      }

      else
      {
        if ((_BYTE)v13) {
          unsigned int v20 = 2;
        }
        else {
          unsigned int v20 = 3;
        }
        uint64_t v21 = __dtoa(v20, v18, &v79, &v78, &v77, **v4);
        if (v79 == 9999) {
          int v79 = 0x7FFFFFFF;
        }
      }

LABEL_44:
      uint64_t v72 = v6;
      if (v78) {
        char v76 = 45;
      }
      int v66 = v79;
      if (v79 != 0x7FFFFFFF)
      {
        int v61 = (_DWORD)v77 - (_DWORD)v21;
        if ((*(_DWORD *)(v5 + 28) | 0x20) == 0x67)
        {
          if ((*(_WORD *)(v5 + 40) & 0x10) != 0) {
            LODWORD(v6) = v18;
          }
          else {
            LODWORD(v6) = (_DWORD)v77 - (_DWORD)v21;
          }
          if (v79 >= -3 && v79 <= v18)
          {
            LODWORD(v6) = (v6 - v79) & ~(((int)v6 - v79) >> 31);
            goto LABEL_79;
          }
        }

        else
        {
          LODWORD(v6) = v18;
        }

        if ((_BYTE)v13)
        {
          unsigned int v27 = v79 - 1;
          v82[0] = v13;
          if (v79 >= 1) {
            char v28 = 43;
          }
          else {
            char v28 = 45;
          }
          if (v79 - 1 < 0) {
            unsigned int v27 = 1 - v79;
          }
          uint64_t v29 = &v83;
          v82[1] = v28;
          if (v27 < 0xA)
          {
            if ((v13 & 0xDF) == 0x45)
            {
              uint64_t v29 = v84;
              char v83 = 48;
            }

            *uint64_t v29 = v27 + 48;
            LODWORD(v29) = (_DWORD)v29 + 1;
          }

          else
          {
            uint64_t v30 = 0LL;
            do
            {
              unsigned int v31 = v27;
              v27 /= 0xAu;
              v80[v30-- + 5] = (v31 - 10 * v27) | 0x30;
            }

            while (v31 > 0x63);
            uint64_t v32 = v30 + 5;
            v80[v30 + 5] = v27 + 48;
            if (v30 + 7 <= 7)
            {
              uint64_t v4 = (double **)&v82[-v30 - 2];
              _platform_memmove();
              if (v32 <= 5) {
                int v33 = 5;
              }
              else {
                int v33 = v32;
              }
              LODWORD(v29) = (_DWORD)v4 + v33;
            }
          }

          unsigned int v60 = (_DWORD)v29 - (&vars0 - 104);
          uint64_t v26 = v6 + v60;
          int v65 = v6;
          char v64 = 1;
          goto LABEL_111;
        }

LABEL_111:
        uint64_t v68 = v21;
        goto LABEL_112;
      }

      char v64 = v13;
      int v23 = *(_DWORD *)(v5 + 28);
      if (*v21 == 78)
      {
        if (v23 <= 96) {
          uint64_t v24 = "NAN";
        }
        else {
          uint64_t v24 = "nan";
        }
        uint64_t v68 = (char *)v24;
        char v76 = 0;
      }

      else
      {
        if (v23 <= 96) {
          uint64_t v25 = "INF";
        }
        else {
          uint64_t v25 = "inf";
        }
        uint64_t v68 = (char *)v25;
      }

      uint64_t v26 = 3LL;
      int v65 = v18;
LABEL_112:
      else {
        int v36 = v26;
      }
      if (v76) {
        ++v36;
      }
      if (v74) {
        int v37 = v36 + 2;
      }
      else {
        int v37 = v36;
      }
      if (*(_DWORD *)(v5 + 32) == 48 || (*(_WORD *)(v5 + 40) & 0x40) != 0)
      {
        int v38 = 0;
        if (!v76) {
          goto LABEL_126;
        }
        goto LABEL_125;
      }

      int v38 = __printf_pad(v72, (*(_DWORD *)(v5 + 24) - v37), 0);
      if (v76) {
LABEL_125:
      }
        v38 += __printf_puts(v72, (uint64_t)&v76, 1LL);
LABEL_126:
      if (v74)
      {
        char v73 = 48;
        v38 += __printf_puts(v72, (uint64_t)&v73, 2LL);
      }

      int v69 = v37;
      if (*(_DWORD *)(v5 + 32) != 48 || (*(_WORD *)(v5 + 40) & 0x40) != 0)
      {
        int v39 = v21;
      }

      else
      {
        int v39 = v21;
        v38 += __printf_pad(v72, (*(_DWORD *)(v5 + 24) - v37), 1);
      }

      int v40 = __printf_pad(v72, ~(_DWORD)v26, 1) + v38;
      if (v66 == 0x7FFFFFFF)
      {
        uint64_t v41 = __printf_puts(v72, (uint64_t)v68, v26) + v40;
        uint64_t v42 = (uint64_t *)v72;
        uint64_t v43 = (uint64_t)v39;
      }

      else
      {
        uint64_t v44 = v68;
        if (!v64)
        {
          uint64_t v43 = (uint64_t)v39;
          if (v79 <= 0)
          {
            int v57 = __printf_puts(v72, (uint64_t)"0", 1LL) + v40;
            if (v65 || (*(_WORD *)(v5 + 40) & 0x10) != 0) {
              v57 += __printf_puts(v72, v62, v63);
            }
            int v50 = __printf_pad(v72, -v79, 1) + v57;
            int v56 = v79 + v65;
            int v48 = v69;
          }

          else
          {
            uint64_t v67 = v5;
            else {
              uint64_t v49 = v6;
            }
            int v50 = __printf_pad(v72, v6 - (v49 & ~((int)v49 >> 31)), 1) + v40;
            uint64_t v44 = &v68[(int)v6];
            if (fixed)
            {
              BOOL v51 = (int)v4 > 0;
              if (v3 > 0 || (int)v4 >= 1)
              {
                do
                {
                  fixed -= !v51;
                  int v52 = __printf_puts(v72, (uint64_t)thousands_sep, v70) + v50;
                  int v53 = (char)*fixed;
                  uint64_t v54 = (uint64_t)v44;
                  else {
                    uint64_t v55 = ((_DWORD)v77 - (_DWORD)v44);
                  }
                  if ((int)v55 >= 1)
                  {
                    v52 += __printf_puts(v72, v54, v55);
                    int v53 = (char)*fixed;
                  }

                  v3 -= !v51;
                  LODWORD(v4) = (_DWORD)v4 - v51;
                  int v50 = __printf_pad(v72, v53 - (v55 & ~((int)v55 >> 31)), 1) + v52;
                  uint64_t v44 = (char *)(v54 + (char)*fixed);
                  BOOL v51 = (int)v4 > 0;
                }

                while (v3 > 0 || (int)v4 > 0);
              }

              if (v44 > v77) {
                uint64_t v44 = v77;
              }
            }

            int v56 = v65;
            int v48 = v69;
            uint64_t v5 = v67;
            if (v65 || (*(_WORD *)(v67 + 40) & 0x10) != 0) {
              v50 += __printf_puts(v72, v62, v63);
            }
            else {
              int v56 = 0;
            }
          }

          uint64_t v58 = (uint64_t)v44;
          else {
            uint64_t v59 = v56;
          }
          uint64_t v42 = (uint64_t *)v72;
          uint64_t v41 = __printf_pad(v72, v56 - (v59 & ~((int)v59 >> 31)), 1) + v50;
          goto LABEL_141;
        }

        uint64_t v42 = (uint64_t *)v72;
        uint64_t v43 = (uint64_t)v39;
        if (v65 > 1 || (*(_WORD *)(v5 + 40) & 0x10) != 0)
        {
          v80[0] = *v68;
          _platform_memmove();
          int v46 = __printf_puts(v72, (uint64_t)v80, (v63 + 1));
          int v47 = v46 + __printf_puts(v72, (uint64_t)(v68 + 1), (v61 - 1));
          int v45 = v47 + __printf_pad(v72, (v65 - v61), 1) + v40;
        }

        else
        {
          int v45 = __printf_puts(v72, (uint64_t)v68, 1LL) + v40;
        }

        uint64_t v41 = __printf_puts(v72, (uint64_t)v82, v60) + v45;
      }

      int v48 = v69;
LABEL_141:
      if ((*(_WORD *)(v5 + 40) & 0x40) != 0) {
      __printf_flush(v42);
      }
      if (v43) {
        __freedtoa(v43);
      }
      return v41;
    default:
      switch(v14)
      {
        case 'a':
          goto LABEL_9;
        case 'e':
          goto LABEL_20;
        case 'f':
          goto LABEL_26;
        case 'g':
          goto LABEL_24;
        default:
          goto LABEL_178;
      }
  }

uint64_t __printf_arginfo_hexdump(uint64_t a1, unint64_t a2, void *a3)
{
  if (a2 <= 1) {
    __printf_arginfo_hexdump_cold_1();
  }
  *a3 = 0x100000020LL;
  return 2LL;
}

uint64_t __printf_render_hexdump(uint64_t *a1, uint64_t a2, unsigned __int8 ***a3)
{
  int v3 = *(_DWORD *)(a2 + 24);
  unsigned int v4 = v3 - 1;
  unsigned int v26 = v3;
  unsigned int v5 = *(_DWORD *)a3[1];
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = a2;
  LODWORD(v7) = 0;
  int v8 = 0;
  uint64_t v9 = **a3;
  if (v4 >= 0xF) {
    unsigned int v4 = 15;
  }
  unsigned int v24 = v4;
  unsigned int v23 = v4 + 1;
  do
  {
    if ((*(_WORD *)(v6 + 40) & 0x80) != 0) {
      uint64_t v10 = &v28[sprintf(&v27, " %04x", v8) - 1];
    }
    else {
      uint64_t v10 = &v27;
    }
    uint64_t v11 = v6;
    if (v26 >= v5) {
      uint64_t v12 = v5;
    }
    else {
      uint64_t v12 = v26;
    }
    if ((_DWORD)v12)
    {
      uint64_t v13 = v12;
      int v14 = v9;
      do
      {
        int v15 = *v14++;
        v10 += sprintf(v10, " %02x", v15);
        --v13;
      }

      while (v13);
    }

    uint64_t v6 = v11;
    if ((*(_WORD *)(v11 + 40) & 0x10) != 0)
    {
      if (v26 > v5)
      {
        int v16 = v23 - v12;
        do
        {
          *(_DWORD *)uint64_t v10 = 2105376;
          v10 += 3;
          --v16;
        }

        while (v16);
      }

      *(_DWORD *)uint64_t v10 = 8134688;
      uint64_t v17 = v10 + 3;
      if ((_DWORD)v12)
      {
        uint64_t v18 = v12;
        __int128 v19 = v9;
        do
        {
          int v21 = *v19++;
          char v20 = v21;
          *v17++ = v20;
          --v18;
        }

        while (v18);
      }

      if (v26 > v5)
      {
        _platform_memset();
        v17 += v24 - v12 + 1;
      }

      char *v17 = 124;
      uint64_t v10 = v17 + 1;
    }

    v5 -= v12;
    if (v5)
    {
      char *v10 = 10;
      LODWORD(v10) = (_DWORD)v10 + 1;
    }

    v9 += v12;
    v8 += v12;
    __printf_flush(a1);
  }

  while (v5);
  return v7;
}

uint64_t __printf_arginfo_int(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_int_cold_1();
  }
  *a3 = 1;
  if (*(__int16 *)(a1 + 40) < 0)
  {
    int v4 = 256;
    goto LABEL_19;
  }

  __int16 v3 = *(_WORD *)(a1 + 40);
  int v4 = 65537;
  if ((v3 & 0x2000) != 0)
  {
    int v4 = 8388609;
    goto LABEL_19;
  }

  if ((*(_WORD *)(a1 + 40) & 0x4000) != 0)
  {
    int v4 = 4194305;
    goto LABEL_19;
  }

  if ((v3 & 8) != 0)
  {
    int v4 = 131073;
    goto LABEL_19;
  }

  if ((*(_WORD *)(a1 + 40) & 0x1000) != 0)
  {
    int v4 = 2097153;
    goto LABEL_19;
  }

  if ((*(_WORD *)(a1 + 40) & 0x800) != 0)
  {
    int v4 = 1048577;
    goto LABEL_19;
  }

  if ((v3 & 1) != 0)
  {
LABEL_19:
    *a3 = v4;
    return 1LL;
  }

  if ((v3 & 4) != 0)
  {
    int v4 = 262145;
    goto LABEL_19;
  }

  if ((v3 & 2) != 0)
  {
    int v4 = 2;
    goto LABEL_19;
  }

  return 1LL;
}

uint64_t __printf_render_int(uint64_t *a1, uint64_t a2, unint64_t **a3)
{
  int v6 = *(__int16 *)(a2 + 40);
  if (v6 < 0) {
    return __xprintf_vector(a1, a2, a3);
  }
  __int16 v7 = *(_WORD *)(a2 + 40);
  char v57 = 0;
  if ((v6 & 0x100) != 0)
  {
    localeconv_l(*(locale_t *)(a2 + 8));
    int v8 = _platform_strlen();
    uint64_t v11 = localeconv_l(*(locale_t *)(a2 + 8));
    fixed = __fix_nogrouping(v11->grouping);
  }

  else
  {
    int v8 = 0;
    fixed = 0LL;
  }

  uint64_t v12 = *(unsigned int *)(a2 + 28);
  if ((int)v12 > 104)
  {
    if ((int)v12 <= 116)
    {
      if ((_DWORD)v12 != 105)
      {
        if ((_DWORD)v12 != 111) {
          goto LABEL_137;
        }
        goto LABEL_14;
      }

LABEL_94:
  if (v34 > 127)
  {
    if ((*(_WORD *)(a2 + 40) & 0x40) != 0 || (int v43 = *(_DWORD *)(a2 + 24), v43 <= v34)) {
      int v44 = 0;
    }
    else {
      int v44 = __printf_pad((uint64_t)a1, (v43 - v34), 0);
    }
    if (v57)
    {
      int v45 = &v57;
      uint64_t v46 = (uint64_t)a1;
      uint64_t v47 = 1LL;
    }

    else
    {
      if (!v27) {
        goto LABEL_119;
      }
      uint64_t v46 = (uint64_t)a1;
      int v45 = (char *)v27;
      uint64_t v47 = 2LL;
    }

    v44 += __printf_puts(v46, (uint64_t)v45, v47);
LABEL_119:
    if (v37) {
      v44 += __printf_pad((uint64_t)a1, v36, 1);
    }
    goto LABEL_121;
  }

  if (v57)
  {
    *--unsigned int v24 = v57;
  }

  else if (v27)
  {
    *(v24 - 1) = v27[1];
    *(v24 - 2) = *v27;
    v24 -= 2;
  }

  uint64_t v48 = *(int *)(a2 + 24);
  if (&v60 - v24 >= v48 || (*(_WORD *)(a2 + 40) & 0x40) != 0) {
    goto LABEL_115;
  }
  uint64_t v49 = v48 - (&v60 - (_DWORD)v24);
  if (v24 > v58 && (int)v49 >= 1)
  {
    unint64_t v50 = (_DWORD)v48 + (_DWORD)v24 - v58 - 128;
    else {
      unint64_t v51 = (unint64_t)&v24[~(unint64_t)v58];
    }
    v24 += ~v51;
    _platform_memset();
    uint64_t v49 = (v50 - v51);
  }

  if (!(_DWORD)v49) {
LABEL_115:
  }
    int v44 = 0;
  else {
    int v44 = __printf_pad((uint64_t)a1, v49, 0);
  }
LABEL_121:
  uint64_t v52 = __printf_puts((uint64_t)a1, (uint64_t)v24, &v60 - v24) + v44;
  int v53 = *(_DWORD *)(a2 + 24);
  __printf_flush(a1);
  return v52;
}

uint64_t __printf_arginfo_ptr(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_ptr_cold_1();
  }
  else {
    int v3 = 32;
  }
  *a3 = v3;
  return 1LL;
}

uint64_t __printf_render_ptr(uint64_t *a1, __int128 *a2, uint64_t **a3)
{
  uint64_t v3 = **a3;
  __int128 v4 = a2[3];
  __int128 v11 = a2[2];
  __int128 v12 = v4;
  __int128 v13 = a2[4];
  uint64_t v14 = *((void *)a2 + 10);
  __int128 v5 = a2[1];
  __int128 v9 = *a2;
  __int128 v10 = v5;
  HIDWORD(v10) = 120;
  WORD4(v11) |= 0x11u;
  __int16 v7 = (unint64_t *)&v8;
  uint64_t v8 = v3;
  return __printf_render_int(a1, (uint64_t)&v9, &v7);
}

uint64_t __printf_arginfo_quote(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_quote_cold_1();
  }
  *a3 = 32;
  return 1LL;
}

uint64_t __printf_render_quote(uint64_t a1, uint64_t a2, unsigned __int8 ***a3)
{
  uint64_t v3 = a2;
  __int128 v4 = (uint64_t *)a1;
  __int128 v5 = **a3;
  if (!v5)
  {
    __int16 v22 = "(null)";
    uint64_t v23 = 8LL;
    return __printf_out(a1, a2, (uint64_t)v22, v23);
  }

  LOBYTE(v6) = *v5;
  if (!*v5)
  {
    __int16 v22 = "";
    uint64_t v23 = 2LL;
    return __printf_out(a1, a2, (uint64_t)v22, v23);
  }

  int v7 = 0;
  uint64_t v8 = 1LL;
  do
  {
    int v9 = (char)v6;
    if ((v6 & 0x80) != 0) {
      __uint32_t v10 = ___runetype((char)v6);
    }
    else {
      __uint32_t v10 = _DefaultRuneLocale.__runetype[(char)v6];
    }
    int v11 = (v10 >> 14) & 1;
    if (v9 == 92) {
      int v11 = 1;
    }
    if (v9 == 34) {
      int v11 = 1;
    }
    v7 += v11;
    int v6 = v5[v8++];
  }

  while (v6);
  if (!v7)
  {
    uint64_t v23 = _platform_strlen();
    a1 = (uint64_t)v4;
    a2 = v3;
    __int16 v22 = (const char *)v5;
    return __printf_out(a1, a2, (uint64_t)v22, v23);
  }

  int v12 = __printf_out((uint64_t)v4, v3, (uint64_t)"", 1LL);
  char v13 = *v5;
  if (!*v5) {
    goto LABEL_38;
  }
  uint64_t v14 = v5 + 1;
  int v15 = (int)v5;
  do
  {
    if (v13 <= 0x1Fu)
    {
      switch(v13)
      {
        case 9:
          int v16 = "\\t";
          goto LABEL_32;
        case 10:
          int v16 = "\\n";
          goto LABEL_32;
        case 13:
          int v16 = "\\r";
          goto LABEL_32;
      }

uint64_t __printf_arginfo_str(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_str_cold_1();
  }
  int v3 = 16;
  if ((*(_WORD *)(a1 + 40) & 8) == 0)
  {
    if (*(_DWORD *)(a1 + 28) == 67) {
      int v3 = 16;
    }
    else {
      int v3 = 8;
    }
  }

  *a3 = v3;
  return 1LL;
}

uint64_t __printf_render_str(uint64_t a1, uint64_t a2, const __int32 ***a3)
{
  uint64_t v3 = a2;
  __int128 v4 = (uint64_t *)a1;
  if ((*(_WORD *)(a2 + 40) & 8) == 0 && *(_DWORD *)(a2 + 28) != 83)
  {
    int v9 = **a3;
    if (v9)
    {
      int v10 = _platform_strlen();
      int v11 = *(_DWORD *)(v3 + 20);
      if (v11 >= v10 || v11 <= -1) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = v11;
      }
      a1 = (uint64_t)v4;
      a2 = v3;
      uint64_t v14 = (const char *)v9;
      return __printf_out(a1, a2, (uint64_t)v14, v13);
    }

uint64_t __printf_arginfo_chr(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_chr_cold_1();
  }
  if (*(__int16 *)(a1 + 40) < 0)
  {
    int v3 = 256;
  }

  else
  {
    int v3 = 4;
    if ((*(_WORD *)(a1 + 40) & 8) == 0)
    {
      if (*(_DWORD *)(a1 + 28) == 67) {
        int v3 = 4;
      }
      else {
        int v3 = 1;
      }
    }
  }

  *a3 = v3;
  return 1LL;
}

uint64_t __printf_render_chr(uint64_t *a1, uint64_t a2)
{
  int v6 = &v17.__mbstate8[-((v5 + 15) & 0x1FFFFFFF0LL)];
  int v8 = *(__int16 *)(v7 + 40);
  if (v8 < 0) {
    return __xprintf_vector(a1, a2, v4);
  }
  if ((v8 & 8) == 0 && *(_DWORD *)(a2 + 28) != 67)
  {
    v17.__mbstate8[0] = **v4;
    uint64_t v14 = &v17;
    uint64_t v12 = (uint64_t)a1;
    uint64_t v13 = a2;
    uint64_t v11 = 1LL;
    goto LABEL_9;
  }

  __int32 v9 = **v4;
  memset(&v17, 0, sizeof(v17));
  size_t v10 = wcrtomb_l(v6, v9, &v17, *(locale_t *)(a2 + 8));
  if (v10 != -1LL)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (uint64_t)a1;
    uint64_t v13 = a2;
    uint64_t v14 = (mbstate_t *)v6;
LABEL_9:
    uint64_t v15 = __printf_out(v12, v13, (uint64_t)v14, v11);
    __printf_flush(a1);
    return v15;
  }

  return 0xFFFFFFFFLL;
}

uint64_t __printf_arginfo_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_time_cold_1();
  }
  *a3 = 32;
  return 1LL;
}

uint64_t __printf_render_time(uint64_t *a1, uint64_t a2, uint64_t **a3)
{
  __int16 v5 = *(_WORD *)(a2 + 40);
  if ((v5 & 8) != 0)
  {
    uint64_t v9 = **a3;
    int v8 = 1000 * *(_DWORD *)(v9 + 8);
    uint64_t v10 = *(void *)v9;
    int v7 = 6;
  }

  else
  {
    uint64_t v6 = **a3;
    if ((v5 & 1) != 0)
    {
      int v8 = *(_DWORD *)(v6 + 8);
      int v7 = 9;
    }

    else
    {
      int v7 = 0;
      int v8 = 0;
    }

    uint64_t v10 = *(void *)v6;
    if ((v5 & 9) == 0) {
      goto LABEL_11;
    }
  }

  if (!v7) {
    int v8 = 0;
  }
LABEL_11:
  if ((v5 & 0x10) == 0)
  {
    uint64_t v11 = v20;
    int v12 = sprintf(v20, "%jd");
    goto LABEL_34;
  }

  if (v10 <= 31535999)
  {
    uint64_t v11 = v20;
    LODWORD(v13) = v10;
    if (v10 <= 86399)
    {
      if (v10 <= 3599)
      {
        uint64_t v14 = v10;
        if (v10 <= 59) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }

      goto LABEL_22;
    }

    goto LABEL_18;
  }

  uint64_t v11 = &v20[sprintf(v20, "%jdy", v10 / 0x1E13380uLL)];
  unint64_t v13 = v10 % 0x1E13380uLL;
  if (v7 || v13)
  {
LABEL_18:
    v11 += sprintf(v11, "%jdd", v13 / 0x15180uLL);
    unint64_t v13 = v13 % 0x15180;
    if (v7) {
      goto LABEL_22;
    }
  }

  if (!v13)
  {
LABEL_23:
    if (!v13)
    {
      uint64_t v14 = 0LL;
      goto LABEL_27;
    }

    goto LABEL_26;
  }

uint64_t __printf_arginfo_vis(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_vis_cold_1();
  }
  *a3 = 32;
  return 1LL;
}

uint64_t __printf_render_vis(uint64_t *a1, uint64_t a2, const char ***a3)
{
  __int16 v5 = **a3;
  if (!v5) {
    return __printf_out((uint64_t)a1, a2, (uint64_t)"(null)", 6LL);
  }
  unsigned int v6 = *(_DWORD *)(a2 + 20);
  if ((v6 & 0x80000000) != 0) {
    unsigned int v6 = _platform_strlen();
  }
  int v7 = (char *)malloc((4 * v6) | 1);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  int v8 = v7;
  __int16 v9 = *(_WORD *)(a2 + 40);
  if ((v9 & 0x80) != 0)
  {
    size_t v10 = v6;
    uint64_t v11 = v5;
    int v12 = 156;
  }

  else if (*(_DWORD *)(a2 + 32) == 48)
  {
    size_t v10 = v6;
    uint64_t v11 = v5;
    int v12 = 29;
  }

  else
  {
    size_t v10 = v6;
    uint64_t v11 = v5;
    if ((v9 & 0x10) != 0) {
      int v12 = 28;
    }
    else {
      int v12 = 31;
    }
  }

  uint64_t v15 = strvisx(v7, v11, v10, v12);
  uint64_t v14 = __printf_out((uint64_t)a1, a2, (uint64_t)v8, v15) + v15;
  __printf_flush(a1);
  free(v8);
  return v14;
}

uint64_t __printf_flush(uint64_t *a1)
{
  uint64_t result = __sfvwrite(*a1, (uint64_t)(a1 + 1));
  a1[19] = (uint64_t)(a1 + 3);
  a1[1] = (uint64_t)(a1 + 3);
  a1[2] = 0LL;
  return result;
}

uint64_t __printf_puts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a3)
  {
    __int16 v5 = *(void **)(a1 + 152);
    *__int16 v5 = a2;
    v5[1] = (int)a3;
    int v6 = *(_DWORD *)(a1 + 16);
    int v7 = *(_DWORD *)(a1 + 20) + a3;
    *(void *)(a1 + 152) = v5 + 2;
    *(_DWORD *)(a1 + 16) = v6 + 1;
    *(_DWORD *)(a1 + 20) = v7;
    if (v6 >= 7)
    {
      __sfvwrite(*(void *)a1, a1 + 8);
      *(void *)(a1 + 152) = a1 + 24;
      *(void *)(a1 + 8) = a1 + 24;
      *(void *)(a1 + 16) = 0LL;
    }
  }

  return a3;
}

uint64_t __printf_pad(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    int v3 = &zeroes_1;
  }
  else {
    int v3 = &blanks_1;
  }
  uint64_t v4 = a2;
  if (a2 < 0x11)
  {
    int v8 = 0;
  }

  else
  {
    int v6 = 0;
    do
    {
      __printf_puts(a1, (uint64_t)v3, 16LL);
      v6 -= 16;
      uint64_t v7 = (v4 + v6);
    }

    while ((v7 + 16) > 0x20);
    int v8 = -v6;
    uint64_t v4 = v7;
  }

  __printf_puts(a1, (uint64_t)v3, v4);
  return (v8 + v4);
}

uint64_t __printf_out(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  else {
    int v9 = __printf_pad(a1, (v8 - a4), *(_DWORD *)(a2 + 32) == 48);
  }
  __printf_puts(a1, a3, a4);
  uint64_t v10 = (v9 + a4);
  if ((*(_WORD *)(a2 + 40) & 0x40) != 0)
  {
    int v11 = *(_DWORD *)(a2 + 24);
  }

  return v10;
}

uint64_t __printf_arginfo_pct()
{
  return 0LL;
}

uint64_t __printf_render_pct(uint64_t a1)
{
  return __printf_puts(a1, (uint64_t)"%", 1LL);
}

uint64_t __printf_arginfo_n(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_n_cold_1();
  }
  *a3 = 32;
  return 1LL;
}

uint64_t __printf_render_n(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = (_BYTE *)*a3;
  __int16 v4 = *(_WORD *)(a2 + 40);
  if ((v4 & 2) != 0)
  {
    int v6 = *(_DWORD *)(a2 + 44);
    if (off_18C52C3D8) {
      off_18C52C3D8(*a3, 1LL);
    }
    _BYTE *v3 = v6;
  }

  else if ((v4 & 4) != 0)
  {
    int v7 = *(_DWORD *)(a2 + 44);
    if (off_18C52C3D8) {
      off_18C52C3D8(*a3, 2LL);
    }
    *(_WORD *)int v3 = v7;
  }

  else
  {
    if ((v4 & 8) != 0
      || (v4 & 1) != 0
      || (*(_WORD *)(a2 + 40) & 0x1000) != 0
      || (*(_WORD *)(a2 + 40) & 0x2000) != 0
      || (*(_WORD *)(a2 + 40) & 0x800) != 0)
    {
      uint64_t v5 = *(int *)(a2 + 44);
    }

    else
    {
      LODWORD(v5) = *(_DWORD *)(a2 + 44);
      if ((*(_WORD *)(a2 + 40) & 0x4000) == 0)
      {
        if (off_18C52C3D8) {
          off_18C52C3D8(*a3, 4LL);
        }
        *(_DWORD *)int v3 = v5;
        return 0LL;
      }

      uint64_t v5 = (int)v5;
    }

    if (off_18C52C3D8) {
      off_18C52C3D8(*a3, 8LL);
    }
    *(void *)int v3 = v5;
  }

  return 0LL;
}

uint64_t __printf_comp(uint64_t a1, uint64_t a2)
{
  __int16 v4 = *(_BYTE **)(a1 + 64);
  uint64_t v5 = calloc(8uLL, 0x58uLL);
  v56[0] = v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  v56[1] = (void *)0x800000058LL;
  v55[0] = calloc(8uLL, 4uLL);
  if (!v55[0])
  {
    int v45 = v6;
    goto LABEL_110;
  }

  uint64_t v54 = a2;
  v55[1] = (void *)0x800000004LL;
  int v7 = arrayget(v56, 0);
  if (!v7) {
    goto LABEL_109;
  }
  int v8 = v7;
  int v9 = 0;
  int v53 = 0;
  uint64_t v10 = 1LL;
LABEL_5:
  if (!*v4) {
    goto LABEL_97;
  }
  *((_DWORD *)v8 + 8) = 32;
  *((void *)v8 + 2) = -4294967208LL;
  int v11 = v4 + 1;
  *((void *)v8 + 7) = v4;
  for (*((void *)v8 + 8) = v4; ; *((void *)v8 + 8) = v11++)
  {
    if (!*(v11 - 1))
    {
      v8 += 88;
LABEL_97:
      else {
        int v46 = v10;
      }
      uint64_t v47 = v55[0];
      *(void *)(a1 + 96) = v8;
      *(void *)(a1 + 104) = v47;
      uint64_t v48 = (char *)v56[0];
      *(void **)(a1 + 88) = v56[0];
      *(_DWORD *)(a1 + 120) = v46;
      if (v46 <= 1) {
        int v46 = 1;
      }
      uint64_t v49 = (char *)malloc(16LL * v46);
      *(void *)(a1 + 112) = v49;
      if (!v49) {
        goto LABEL_109;
      }
      while (v48 < v8)
      {
        uint64_t v50 = *((void *)v48 + 9);
        if (v50) {
          *((void *)v48 + 9) = &v49[16 * v50];
        }
        uint64_t v51 = *((void *)v48 + 10);
        if (v51) {
          *((void *)v48 + 10) = &v49[16 * v51];
        }
        v48 += 88;
      }

      uint64_t result = 0LL;
      *(void *)(a1 + 72) = v54;
      return result;
    }

    if (*(v11 - 1) == 37) {
      break;
    }
  }

  while (2)
  {
    while (1)
    {
      uint64_t v12 = *v11;
      *((_DWORD *)v8 + 7) = v12;
      switch((int)v12)
      {
        case ' ':
          __int16 v19 = *((_WORD *)v8 + 20);
          if ((v19 & 0x80) != 0) {
            goto LABEL_59;
          }
          *((_WORD *)v8 + 20) = v19 | 0x20;
          int v20 = 32;
          goto LABEL_56;
        case '#':
          __int16 v18 = *((_WORD *)v8 + 20) | 0x10;
          goto LABEL_58;
        case '\'':
          __int16 v18 = *((_WORD *)v8 + 20) | 0x100;
          goto LABEL_58;
        case '*':
          int v21 = v11 + 1;
          int v22 = v11[1];
          if (!v11[1]) {
            goto LABEL_73;
          }
          int v23 = v22 - 48;
          if ((v22 - 48) > 9)
          {
            int v24 = 0;
            int v26 = v11[1];
          }

          else
          {
            int v24 = 0;
            int v21 = v11 + 2;
            do
            {
              int v25 = *v21;
              if (!*v21) {
                goto LABEL_73;
              }
              int v24 = v23 + 10 * v24;
              int v23 = v25 - 48;
              ++v21;
            }

            while ((v25 - 48) <= 9);
            int v26 = v25;
            int v11 = v21 - 2;
            --v21;
          }

          if (v26 != 36)
          {
LABEL_73:
            uint64_t v36 = (v10 + 1);
            int v11 = v21;
            goto LABEL_74;
          }

          if (v24 >= v9) {
            int v9 = v24 + 1;
          }
          v11 += 2;
          uint64_t v36 = v10;
          LODWORD(v10) = v24;
LABEL_74:
          *((_DWORD *)v8 + 12) = v10;
          goto LABEL_83;
        case '+':
          *((_WORD *)v8 + 20) |= 0x80u;
          int v20 = 43;
LABEL_56:
          *((_DWORD *)v8 + 9) = v20;
          goto LABEL_59;
        case ',':
        case ':':
        case ';':
          goto LABEL_30;
        case '-':
          __int16 v18 = *((_WORD *)v8 + 20) | 0x40;
          goto LABEL_58;
        case '.':
          *((_DWORD *)v8 + 5) = 0;
          mbstate_t v17 = v11 + 1;
          int v27 = v11[1];
          if (v27 == 42)
          {
            char v28 = v11[2];
            if (v28)
            {
              int v29 = 0;
              v11 += 3;
              while (1)
              {
                unsigned int v30 = v28 - 48;
                if (v30 > 9) {
                  break;
                }
                int v29 = v30 + 10 * v29;
                int v31 = *v11++;
                char v28 = v31;
                if (!v31) {
                  goto LABEL_80;
                }
              }

              if (v28 != 36)
              {
LABEL_80:
                --v11;
                goto LABEL_81;
              }

              if (v29 >= v9) {
                int v9 = v29 + 1;
              }
              uint64_t v36 = v10;
              LODWORD(v10) = v29;
            }

            else
            {
              v11 += 2;
LABEL_81:
              uint64_t v36 = (v10 + 1);
            }

            *((_DWORD *)v8 + 13) = v10;
LABEL_83:
            BOOL v37 = arrayget(v55, v10);
            if (!v37) {
              goto LABEL_109;
            }
            *(_DWORD *)BOOL v37 = 1;
            uint64_t v10 = v36;
          }

          else
          {
            ++v11;
            if ((v27 - 48) <= 9)
            {
              int v33 = 0;
              do
              {
                int v34 = 5 * v33;
                *((_DWORD *)v8 + 5) = 2 * v34;
                int v33 = *v17 + 2 * v34 - 48;
                *((_DWORD *)v8 + 5) = v33;
                int v35 = *++v17;
              }

              while ((v35 - 48) < 0xA);
LABEL_63:
              int v11 = v17;
            }
          }

          continue;
        case '0':
          *((_DWORD *)v8 + 8) = 48;
          goto LABEL_59;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          char v13 = *v11;
          if (!*v11)
          {
            LODWORD(v14) = 0;
LABEL_26:
            *((_DWORD *)v8 + 6) = v14;
            continue;
          }

          uint64_t v14 = 0LL;
          ++v11;
          while (1)
          {
            unsigned int v15 = v13 - 48;
            if (v15 > 9) {
              break;
            }
            uint64_t v14 = v15 + 10 * (_DWORD)v14;
            int v16 = *v11++;
            char v13 = v16;
            if (!v16) {
              goto LABEL_25;
            }
          }

          if (v13 != 36)
          {
LABEL_25:
            --v11;
            goto LABEL_26;
          }

          uint64_t v10 = v14;
          break;
        case 'L':
          __int16 v18 = *((_WORD *)v8 + 20) | 1;
          goto LABEL_58;
        default:
          goto LABEL_85;
      }
    }

    switch((int)v12)
    {
      case 'h':
        mbstate_t v17 = v11 + 1;
        if (v11[1] == 104)
        {
          v11 += 2;
          *((_WORD *)v8 + 20) |= 2u;
          continue;
        }

        __int16 v32 = *((_WORD *)v8 + 20) | 4;
        goto LABEL_62;
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 's':
      case 'u':
        goto LABEL_85;
      case 'j':
        __int16 v18 = *((_WORD *)v8 + 20) | 0x1000;
        goto LABEL_58;
      case 'l':
        mbstate_t v17 = v11 + 1;
        if (v11[1] == 108)
        {
          v11 += 2;
          *((_WORD *)v8 + 20) = *((_WORD *)v8 + 20) & 0xF7FE | 1;
          continue;
        }

        __int16 v32 = *((_WORD *)v8 + 20) & 0xF7F7 | 8;
LABEL_62:
        *((_WORD *)v8 + 20) = v32;
        goto LABEL_63;
      case 'q':
        __int16 v18 = *((_WORD *)v8 + 20) & 0xF7F7 | 0x800;
        goto LABEL_58;
      case 't':
        __int16 v18 = *((_WORD *)v8 + 20) | 0x2000;
        goto LABEL_58;
      case 'v':
        __int16 v18 = *((_WORD *)v8 + 20) | 0x8000;
        goto LABEL_58;
      default:
        if ((_DWORD)v12 == 95)
        {
LABEL_30:
          *((_DWORD *)v8 + 4) = v12;
          goto LABEL_59;
        }

        if ((_DWORD)v12 == 122)
        {
          __int16 v18 = *((_WORD *)v8 + 20) | 0x4000;
LABEL_58:
          *((_WORD *)v8 + 20) = v18;
LABEL_59:
          ++v11;
          continue;
        }

char *arrayget(void **a1, int a2)
{
  __int16 v4 = (char *)*a1;
  if (*((_DWORD *)a1 + 3) <= a2)
  {
    int v5 = a2 + 8;
    uint64_t result = (char *)realloc(*a1, *((_DWORD *)a1 + 2) * (a2 + 8));
    if (!result) {
      return result;
    }
    __int16 v4 = result;
    _platform_bzero();
    *a1 = v4;
    *((_DWORD *)a1 + 3) = v5;
  }

  return &v4[*((int *)a1 + 2) * (uint64_t)a2];
}

uint64_t __printf_exec(uint64_t a1, uint64_t a2, __int16 *a3)
{
  int v39 = v38;
  uint64_t v40 = a3;
  uint64_t v36 = v38;
  uint64_t v37 = 0LL;
  uint64_t v35 = a2;
  if (*(int *)(a1 + 120) >= 2)
  {
    uint64_t v5 = 1LL;
    uint64_t v6 = 16LL;
    uint64_t v7 = *(void *)(a1 + 104);
    do
    {
      int v8 = *(_DWORD *)(v7 + 4 * v5);
      if (v8 > 0x10000)
      {
        if (v8 > 0x100000)
        {
          if (v8 > 0x400000)
          {
            if (v8 != 4194305)
            {
              int v11 = 8388609;
LABEL_27:
              if (v8 != v11) {
LABEL_60:
              }
                errx(1, "argtype = %x (fmt = %s)\n", *(_DWORD *)(v7 + 4 * v5), *(const char **)(a1 + 64));
            }
          }

          else if (v8 != 1048577)
          {
            int v11 = 2097153;
            goto LABEL_27;
          }
        }

        else if (v8 > 0x20000)
        {
          if (v8 != 131073)
          {
            if (v8 != 262145) {
              goto LABEL_60;
            }
            uint64_t v12 = v40;
            v40 += 4;
            int v10 = *v12;
LABEL_31:
            *(_DWORD *)(*(void *)(a1 + 112) + v6) = v10;
            goto LABEL_35;
          }
        }

        else if (v8 != 65537)
        {
          if (v8 != 65664) {
            goto LABEL_60;
          }
LABEL_29:
          unsigned int v15 = v40;
          v40 += 4;
          *(void *)(*(void *)(a1 + 112) + v6) = *v15;
          goto LABEL_35;
        }
      }

      else
      {
        if (v8 <= 15)
        {
          switch(v8)
          {
            case 1:
            case 4:
              int v9 = (int *)v40;
              v40 += 4;
              int v10 = *v9;
              goto LABEL_31;
            case 2:
              int v16 = (char *)v40;
              v40 += 4;
              int v10 = *v16;
              goto LABEL_31;
            case 8:
              mbstate_t v17 = (uint64_t *)v40;
              v40 += 4;
              uint64_t v18 = *v17;
              __int16 v19 = (void (*)(uint64_t))off_18C52C3C8;
              if (off_18C52C3C8) {
                goto LABEL_33;
              }
              goto LABEL_34;
            default:
              goto LABEL_60;
          }
        }

        if (v8 > 127)
        {
          if (v8 != 128)
          {
            if (v8 != 256) {
              goto LABEL_60;
            }
            char v13 = (_OWORD *)(((unint64_t)v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v40 = (__int16 *)(v13 + 1);
            *(_OWORD *)(*(void *)(a1 + 112) + v6) = *v13;
            goto LABEL_35;
          }

          goto LABEL_29;
        }

        if (v8 == 16)
        {
          int v20 = (uint64_t *)v40;
          v40 += 4;
          uint64_t v18 = *v20;
          __int16 v19 = (void (*)(uint64_t))qword_18C52C3D0;
          if (qword_18C52C3D0) {
LABEL_33:
          }
            v19(v18);
LABEL_34:
          *(void *)(*(void *)(a1 + 112) + v6) = v18;
          goto LABEL_35;
        }

        if (v8 != 32) {
          goto LABEL_60;
        }
      }

      uint64_t v14 = v40;
      v40 += 4;
      *(void *)(*(void *)(a1 + 112) + v6) = *v14;
LABEL_35:
      ++v5;
      v6 += 16LL;
    }

    while (v5 < *(int *)(a1 + 120));
  }

  unint64_t v21 = *(void *)(a1 + 88);
  if (v21 < *(void *)(a1 + 96))
  {
    LODWORD(v22) = 0;
    while (1)
    {
      uint64_t v23 = *(unsigned int *)(v21 + 48);
      if ((_DWORD)v23)
      {
        int v24 = *(_DWORD *)(*(void *)(a1 + 112) + 16 * v23);
        *(_DWORD *)(v21 + 24) = v24;
        if (v24 < 0)
        {
          *(_WORD *)(v21 + 40) |= 0x40u;
          *(_DWORD *)(v21 + 24) = -v24;
        }
      }

      uint64_t v25 = *(unsigned int *)(v21 + 52);
      if ((_DWORD)v25) {
        *(_DWORD *)(v21 + 20) = *(_DWORD *)(*(void *)(a1 + 112) + 16 * v25);
      }
      uint64_t v26 = *(void *)(v21 + 56);
      unsigned int v27 = *(_DWORD *)(v21 + 64) - v26;
      __printf_puts((uint64_t)&v35, v26, v27);
      uint64_t v22 = v22 + v27;
      int v28 = *(_DWORD *)(v21 + 28);
      if (!v28) {
        goto LABEL_53;
      }
      unsigned int v29 = v28 - 33;
      uint64_t v30 = *(void *)(a1 + 72);
      int v31 = *(char *)(v30 + v29 + 200);
      if (v31 == 2)
      {
        *(_DWORD *)(v21 + 44) = v22;
        int v32 = (*(uint64_t (**)(uint64_t *, unint64_t, unint64_t))(v30 + 24LL * v29 + 304))( &v35,  v21,  v21 + 72);
        if (v32 < 0)
        {
          *(_WORD *)(v35 + 16) |= 0x40u;
          goto LABEL_53;
        }

        goto LABEL_52;
      }

      if (v31 == 1)
      {
        __sfvwrite(v35, (uint64_t)&v36);
        int v39 = v38;
        uint64_t v36 = v38;
        uint64_t v37 = 0LL;
        *(_DWORD *)(v21 + 44) = v22;
        int v32 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(v30
                                                                                     + 24LL * *(int *)(v21 + 28)
                                                                                     - 488))( a2,  v21,  v21 + 72);
        goto LABEL_52;
      }

      if (!*(_BYTE *)(v30 + v29 + 200)) {
        break;
      }
LABEL_53:
      v21 += 88LL;
      if (v21 >= *(void *)(a1 + 96)) {
        goto LABEL_59;
      }
    }

    char v34 = *(_DWORD *)(v21 + 28);
    int v32 = __printf_out((uint64_t)&v35, v21, (uint64_t)&v34, 1LL);
LABEL_52:
    uint64_t v22 = (v32 + v22);
    goto LABEL_53;
  }

  uint64_t v22 = 0LL;
LABEL_59:
  __sfvwrite(v35, (uint64_t)&v36);
  return v22;
}

uint64_t __v2printf( pthread_mutex_t *a1, pthread_rwlock_t *a2, uint64_t a3, unsigned int *a4, unsigned __int8 *a5, __int16 *a6)
{
  if (*((void *)&libc_hooks + 1)) {
    (*((void (**)(unsigned int *, uint64_t))&libc_hooks + 1))(a4, 1472LL);
  }
  if (off_18C52C3C8) {
    off_18C52C3C8(a5);
  }
  if (((*(_WORD *)(a3 + 16) & 8) == 0 || (*(_WORD *)(a3 + 16) & 0x200) == 0 && !*(void *)(a3 + 24))
    && __swsetup(a3))
  {
    uint64_t v12 = __error();
    int v13 = 9;
LABEL_10:
    *uint64_t v12 = v13;
    return 0xFFFFFFFFLL;
  }

  uint64_t v15 = *(void *)(a3 + 104);
  if ((*(_BYTE *)(v15 + 72) & 7) != 0)
  {
    if (a1) {
      goto LABEL_14;
    }
LABEL_22:
    if (!a2)
    {
      uint64_t v12 = __error();
      int v13 = 22;
      goto LABEL_10;
    }

    pthread_once(&__xprintf_domain_once, (void (*)(void))__xprintf_domain_init);
    memset(v31, 0, 64);
    *(_OWORD *)int v32 = 0u;
    *(_OWORD *)int v33 = 0u;
    *(_OWORD *)char v34 = 0u;
    v31[4] = (unint64_t)a5;
    if (a4)
    {
      else {
        __int16 v19 = a4;
      }
    }

    else
    {
      uint64_t v21 = __locale_key;
      uint64_t v22 = *(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v21);
      if (v22) {
        __int16 v19 = v22;
      }
      else {
        __int16 v19 = (unsigned int *)&__global_locale;
      }
    }

    do
      unsigned int v23 = __ldaxr(v19);
    while (__stlxr(v23 + 1, v19));
    v32[0] = v19;
    pthread_rwlock_rdlock(a2);
    if ((__printf_comp((uint64_t)v31, (uint64_t)a2) & 0x80000000) != 0)
    {
      int v27 = *__error();
      pthread_rwlock_unlock(a2);
      do
      {
        unsigned int v28 = __ldaxr(v19);
        unsigned int v29 = v28 - 1;
      }

      while (__stlxr(v29, v19));
      if (!v29)
      {
        uint64_t v30 = (void (*)(unsigned int *))*((void *)v19 + 1);
        if (v30) {
          v30(v19);
        }
      }

      *__error() = v27;
      return 0xFFFFFFFFLL;
    }

    uint64_t v14 = __printf_exec((uint64_t)v31, a3, a6);
    int v20 = *__error();
    pthread_rwlock_unlock(a2);
    do
    {
      unsigned int v24 = __ldaxr(v19);
      unsigned int v25 = v24 - 1;
    }

    while (__stlxr(v25, v19));
    if (!v25)
    {
      uint64_t v26 = (void (*)(unsigned int *))*((void *)v19 + 1);
      if (v26) {
        v26(v19);
      }
    }

    free(v32[1]);
    free(v33[1]);
    free(v34[0]);
LABEL_40:
    *__error() = v20;
    return v14;
  }

  *(_BYTE *)(v15 + 72) |= 7u;
  if (!a1) {
    goto LABEL_22;
  }
LABEL_14:
  if (a1 != (pthread_mutex_t *)-1LL)
  {
    pthread_mutex_lock(a1);
    pthread_rwlock_rdlock(*(pthread_rwlock_t **)a1[1].__opaque);
    uint64_t v14 = __printf_exec((uint64_t)a1, a3, a6);
    int v20 = *__error();
    pthread_rwlock_unlock(*(pthread_rwlock_t **)a1[1].__opaque);
    pthread_mutex_unlock(a1);
    goto LABEL_40;
  }

  int v16 = (_xlocale *)&__global_locale;
  if (a4) {
    mbstate_t v17 = v16;
  }
  else {
    mbstate_t v17 = (_xlocale *)&__c_locale;
  }
  return __vfprintf(a3, v17, a5, (int *)a6);
}

uint64_t __xvprintf(pthread_mutex_t *a1, int a2, uint64_t a3)
{
  __int16 v4 = *(_WORD *)(a3 + 16);
  if ((v4 & 0x1A) != 0xA) {
    return __v2printf(a1, a2, a3);
  }
  int v5 = *(__int16 *)(a3 + 18);
  if (v5 < 0) {
    return __v2printf(a1, a2, a3);
  }
  unsigned int v25 = v27;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v31 = 0LL;
  v27[0] = 0LL;
  v27[1] = 850045858LL;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  char v32 = 0;
  __int16 v18 = v4 & 0xFFFD;
  __int16 v19 = v5;
  uint64_t v6 = *(void *)(a3 + 80);
  uint64_t v23 = *(void *)(a3 + 48);
  uint64_t v24 = v6;
  uint64_t v7 = *(void *)(a3 + 104);
  char v32 = *(_BYTE *)(v7 + 72) & 7;
  __int128 v9 = *(_OWORD *)(v7 + 176);
  __int128 v8 = *(_OWORD *)(v7 + 192);
  __int128 v10 = *(_OWORD *)(v7 + 160);
  __int128 v37 = *(_OWORD *)(v7 + 144);
  __int128 v38 = v10;
  __int128 v39 = v9;
  __int128 v40 = v8;
  __int128 v12 = *(_OWORD *)(v7 + 112);
  __int128 v11 = *(_OWORD *)(v7 + 128);
  __int128 v13 = *(_OWORD *)(v7 + 96);
  __int128 v33 = *(_OWORD *)(v7 + 80);
  __int128 v34 = v13;
  __int128 v35 = v12;
  __int128 v36 = v11;
  int v16 = v26;
  int v20 = v26;
  int v17 = 1024;
  int v21 = 1024;
  int v22 = 0;
  uint64_t v14 = __v2printf(a1, a2, (int)&v16);
  if ((v14 & 0x80000000) == 0)
  {
    else {
      uint64_t v14 = v14;
    }
  }

  if ((v18 & 0x40) != 0) {
    *(_WORD *)(a3 + 16) = v4 | 0x40;
  }
  return v14;
}

uint64_t __xprintf_vector(uint64_t *a1, uint64_t a2, _DWORD **a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v32 = *(_OWORD *)(a2 + 32);
  __int128 v33 = v4;
  __int128 v34 = *(_OWORD *)(a2 + 64);
  uint64_t v35 = *(void *)(a2 + 80);
  __int128 v5 = *(_OWORD *)(a2 + 16);
  v31[0] = *(_OWORD *)a2;
  v31[1] = v5;
  uint64_t v6 = *a3;
  char v36 = *(_DWORD *)(a2 + 16);
  if (v36 == 88)
  {
    if (*(_DWORD *)(a2 + 28) == 99)
    {
      char v36 = 0;
      *((void *)&v33 + 1) = &v36;
      *(void *)&__int128 v34 = &v36;
      goto LABEL_8;
    }

    char v36 = 32;
    *((void *)&v33 + 1) = &v36;
    goto LABEL_7;
  }

  *((void *)&v33 + 1) = &v36;
  *(void *)&__int128 v34 = &v36;
  if (v36) {
LABEL_7:
  }
    *(void *)&__int128 v34 = &v37;
LABEL_8:
  __int16 v7 = WORD4(v32);
  __int16 v8 = WORD4(v32) & 0x7FFF;
  WORD4(v32) &= ~0x8000u;
  __int16 v9 = *(_WORD *)(a2 + 40);
  if ((v9 & 4) != 0)
  {
    if (*(_DWORD *)(a2 + 28) == 112)
    {
      unint64_t v30 = *(unsigned __int16 *)v6;
      __int128 v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (uint64_t i = 2LL; i != 16; i += 2LL)
      {
        int v15 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        unint64_t v30 = *(unsigned __int16 *)((char *)v6 + i);
        uint64_t v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v15;
      }
    }

    else
    {
      LODWORD(v29) = *(unsigned __int16 *)v6;
      *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
      LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
      for (uint64_t j = 2LL; j != 16; j += 2LL)
      {
        int v19 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        LODWORD(v29) = *(unsigned __int16 *)((char *)v6 + j);
        uint64_t v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v19;
      }
    }
  }

  else if ((v9 & 8) != 0)
  {
    WORD4(v32) = v7 & 0x7FF7;
    if (*(_DWORD *)(a2 + 28) == 112)
    {
      unint64_t v30 = *v6;
      __int128 v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (uint64_t k = 1LL; k != 4; ++k)
      {
        int v17 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        unint64_t v30 = v6[k];
        uint64_t v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v17;
      }
    }

    else
    {
      LODWORD(v29) = *v6;
      *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
      LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
      for (uint64_t m = 1LL; m != 4; ++m)
      {
        int v21 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        LODWORD(v29) = v6[m];
        uint64_t v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v21;
      }
    }
  }

  else
  {
    uint64_t v10 = (*(_DWORD *)(a2 + 28) - 65);
    if (v10 > 0x37)
    {
LABEL_37:
      unint64_t v30 = *(unsigned __int8 *)v6;
      __int128 v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (uint64_t n = 1LL; n != 16; ++n)
      {
        int v28 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        unint64_t v30 = *((unsigned __int8 *)v6 + n);
        uint64_t v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v28;
      }

      return v11;
    }

    if (((1LL << (*(_BYTE *)(a2 + 28) - 65)) & 0x7100000051LL) == 0)
    {
      if (((1LL << (*(_BYTE *)(a2 + 28) - 65)) & 0x90410800800000LL) != 0)
      {
        WORD4(v32) = v8 | 2;
        LODWORD(v29) = *(unsigned __int8 *)v6;
        *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
        LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
        for (iuint64_t i = 1LL; ii != 16; ++ii)
        {
          int v13 = v34 - DWORD2(v33);
          __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
          LODWORD(v29) = *((unsigned __int8 *)v6 + ii);
          uint64_t v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v13;
        }

        return v11;
      }

      if (v10 == 34)
      {
        LODWORD(v29) = *(unsigned __int8 *)v6;
        *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
        LODWORD(v11) = __printf_render_chr(a1, (uint64_t)v31);
        for (juint64_t j = 1LL; jj != 16; ++jj)
        {
          int v26 = v34 - DWORD2(v33);
          __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
          LODWORD(v29) = *((unsigned __int8 *)v6 + jj);
          uint64_t v11 = v11 + __printf_render_chr(a1, (uint64_t)v31) + v26;
        }

        return v11;
      }

      goto LABEL_37;
    }

    *(double *)&unint64_t v30 = *(float *)v6;
    __int128 v29 = &v30;
    LODWORD(v11) = __printf_render_float(a1, v31, &v29);
    for (kuint64_t k = 1LL; kk != 4; ++kk)
    {
      int v23 = v34 - DWORD2(v33);
      __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
      *(double *)&unint64_t v30 = *(float *)&v6[kk];
      uint64_t v11 = v11 + __printf_render_float(a1, v31, &v29) + v23;
    }
  }

  return v11;
}

uint64_t at_quick_exit(uint64_t a1)
{
  char v2 = (uint64_t *)calloc(1uLL, 0x10uLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  v2[1] = a1;
  uint64_t v3 = *v2;
  while (1)
  {
    unint64_t v4 = __ldaxr(&handlers);
    if (v4 != v3) {
      break;
    }
  }

  __clrex();
  do
  {
    *char v2 = v4;
    while (1)
    {
      unint64_t v6 = __ldaxr(&handlers);
      if (v6 != v4) {
        break;
      }
      if (!__stlxr((unint64_t)v2, &handlers))
      {
        int v7 = 1;
        goto LABEL_13;
      }
    }

    int v7 = 0;
    __clrex();
LABEL_13:
    unint64_t v4 = v6;
  }

  while (!v7);
  return 0LL;
}

void quick_exit(int a1)
{
  for (unint64_t i = atomic_load(&handlers); i; unint64_t i = *(void *)i)
    (*(void (**)(void))(i + 8))();
  _Exit(a1);
}

uint64_t __default_utx()
{
  return __utx__;
}

uint64_t __default_utx_init()
{
  int v0 = (char *)calloc(1uLL, 0x2E0uLL);
  __utx__ = (uint64_t)v0;
  *(void *)int v0 = 0x17600787475LL;
  uint64_t result = pthread_mutex_init((pthread_mutex_t *)(v0 + 648), 0LL);
  uint64_t v2 = __utx__;
  *(void *)(__utx__ + 712) = "/var/run/utmpx";
  *(_BYTE *)(v2 + 728) |= 1u;
  return result;
}

uint64_t _setutxent(uint64_t a1)
{
  if (!a1) {
    _setutxent_cold_1();
  }
  if (*(void *)a1 != 0x17600787475LL) {
    _setutxent_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  _platform_bzero();
  uint64_t v2 = *(FILE **)(a1 + 720);
  if (v2) {
    fseeko(v2, 628LL, 0);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
}

void setutxent(void)
{
}

_DWORD *__endutxent(uint64_t a1)
{
  uint64_t result = (_DWORD *)_platform_bzero();
  if (*(void *)(a1 + 720))
  {
    int v3 = *__error();
    fclose(*(FILE **)(a1 + 720));
    uint64_t result = __error();
    _DWORD *result = v3;
    *(void *)(a1 + 720) = 0LL;
    *(_BYTE *)(a1 + 728) &= ~2u;
  }

  return result;
}

uint64_t _endutxent(uint64_t a1)
{
  if (!a1) {
    _endutxent_cold_1();
  }
  if (*(void *)a1 != 0x17600787475LL) {
    _endutxent_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  __endutxent(a1);
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
}

void endutxent(void)
{
}

uint64_t __getutxent(uint64_t a1)
{
  uint64_t v2 = *(FILE **)(a1 + 720);
  if (!v2)
  {
    unint64_t v4 = fopen(*(const char **)(a1 + 712), "r+");
    *(void *)(a1 + 720) = v4;
    if (!v4)
    {
      unint64_t v4 = fopen(*(const char **)(a1 + 712), "w+");
      *(void *)(a1 + 720) = v4;
      if (!v4)
      {
        unint64_t v4 = fopen(*(const char **)(a1 + 712), "r");
        *(void *)(a1 + 720) = v4;
        if (!v4) {
          goto LABEL_17;
        }
        *(_BYTE *)(a1 + 728) |= 2u;
      }
    }

    fileno(v4);
    fcntl_NOCANCEL();
    int v5 = fileno(*(FILE **)(a1 + 720));
    if (fstat(v5, &v8) != -1)
    {
      if (!v8.st_size)
      {
        _platform_bzero();
        __int16 v10 = 10;
        strcpy(__ptr, "utmpx-1.00");
        if (fwrite(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) != 1) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }

      if (fread(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) == 1)
      {
        if (*(void *)__ptr ^ 0x2E312D78706D7475LL | *(void *)&__ptr[3] ^ 0x30302E312D7870LL || v10 != 10)
        {
          *__error() = 22;
          goto LABEL_16;
        }

uint64_t _getutxent(uint64_t a1)
{
  if (!a1) {
    _getutxent_cold_1();
  }
  if (*(void *)a1 != 0x17600787475LL) {
    _getutxent_cold_2();
  }
  uint64_t v2 = (pthread_mutex_t *)(a1 + 648);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v3 = __getutxent(a1);
  pthread_mutex_unlock(v2);
  return v3;
}

utmpx *getutxent(void)
{
  return (utmpx *)_getutxent(__utx__);
}

uint64_t _getutxid(uint64_t a1, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 296)) {
    return 0LL;
  }
  if (!a1) {
    _getutxid_cold_1();
  }
  if (*(void *)a1 != 0x17600787475LL) {
    _getutxid_cold_2();
  }
  unint64_t v4 = (pthread_mutex_t *)(a1 + 648);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v5 = _utmpx_working_copy(a2, (uint64_t)v8, 1);
  if (v5) {
    uint64_t v6 = __getutxid(a1, v5);
  }
  else {
    uint64_t v6 = 0LL;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t __getutxid(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v4 = *(__int16 *)(a1 + 304);
    if (!*(_WORD *)(a1 + 304)) {
      goto LABEL_8;
    }
    int v5 = *(__int16 *)(a2 + 296);
LABEL_8:
    uint64_t result = __getutxent(a1);
    if (!result) {
      return result;
    }
  }

  if ((v5 - 1) <= 3)
  {
    goto LABEL_8;
  }

  return 0LL;
}

utmpx *__cdecl getutxid(const utmpx *a1)
{
  return (utmpx *)_getutxid(__utx__, (uint64_t)a1);
}

uint64_t _getutxline(uint64_t a1)
{
  if (!a1) {
    _getutxline_cold_1();
  }
  if (*(void *)a1 != 0x17600787475LL) {
    _getutxline_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v2 = a1 + 8;
  while ((*(_WORD *)(a1 + 304) & 0xFFFE) != 6 || _platform_strncmp())
  {
    if (!__getutxent(a1))
    {
      uint64_t v2 = 0LL;
      break;
    }
  }

  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
  return v2;
}

utmpx *__cdecl getutxline(const utmpx *a1)
{
  return (utmpx *)_getutxline(__utx__);
}

uint64_t _pututxline(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    if (!a1) {
      _pututxline_cold_1();
    }
    if (*(void *)a1 != 0x17600787475LL) {
      _pututxline_cold_2();
    }
    uint64_t v3 = (pthread_mutex_t *)(a1 + 648);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
    pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
    uint64_t v2 = __pututxline(__utx__, v2);
    if (v2)
    {
      pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
      if ((*(_BYTE *)(__utx__ + 728) & 1) != 0) {
        _utmpx_asl(v2);
      }
    }

    pthread_mutex_unlock(v3);
  }

  else
  {
    *__error() = 22;
  }

  return v2;
}

uint64_t __pututxline(uint64_t a1, uint64_t a2)
{
  off_t v16 = -1LL;
  if ((*(_BYTE *)(a1 + 728) & 1) != 0
    && ((uint64_t v4 = *(void *)(a1 + 720), (*(_BYTE *)(a1 + 728) & 2) != 0) && v4 || !v4 && geteuid())
    || !*(void *)(a1 + 720) && ((__getutxent(a1), !*(void *)(a1 + 720)) || (*(_BYTE *)(a1 + 728) & 2) != 0))
  {
    uint64_t v11 = __error();
    uint64_t v9 = 0LL;
    int v12 = 1;
LABEL_28:
    int *v11 = v12;
    return v9;
  }

  uint64_t v5 = _utmpx_working_copy(a2, (uint64_t)v18, 0);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = __getutxid(a1, v5);
  if (v7) {
    goto LABEL_11;
  }
  _platform_bzero();
  stat v8 = *(FILE **)(a1 + 720);
  if (v8) {
    fseeko(v8, 628LL, 0);
  }
  uint64_t v7 = __getutxid(a1, v6);
  if (v7) {
    goto LABEL_11;
  }
  if (*(_WORD *)(v6 + 296) == 8 && (*(_WORD *)(a2 + 296) & 0x4000) != 0) {
    goto LABEL_37;
  }
  int v13 = fileno(*(FILE **)(a1 + 720));
  off_t v16 = lseek(v13, 0LL, 1);
  if (v16 < 0) {
    return 0LL;
  }
  fileno(*(FILE **)(a1 + 720));
  int v14 = fseeko(*(FILE **)(a1 + 720), 0LL, 2);
  uint64_t v7 = 0LL;
  uint64_t v9 = 0LL;
  if (v14 != -1)
  {
LABEL_11:
    if ((v16 & 0x8000000000000000LL) == 0)
    {
LABEL_16:
      _utmpx64_32(v6, (uint64_t)__ptr);
      if (fwrite(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) != 1 || fflush(*(FILE **)(a1 + 720)) == -1)
      {
        uint64_t v9 = 0LL;
      }

      else
      {
        uint64_t v9 = a1 + 8;
        _platform_memmove();
        notify_post("com.apple.system.utmpx");
      }

      goto LABEL_23;
    }

    if (*(_WORD *)(v6 + 296) != 8 || (*(_WORD *)(a2 + 296) & 0x4000) == 0 || *(_WORD *)(v7 + 296) == 7)
    {
      if (fseeko(*(FILE **)(a1 + 720), -628LL, 1) == -1) {
        return 0LL;
      }
      goto LABEL_16;
    }

utmpx *__cdecl pututxline(const utmpx *a1)
{
  return (utmpx *)_pututxline(__utx__, (uint64_t)a1);
}

uint64_t __utmpxname(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    char v8 = *(_BYTE *)(a1 + 728);
    if ((v8 & 1) == 0)
    {
      free(*(void **)(a1 + 712));
      char v8 = *(_BYTE *)(a1 + 728);
    }

    *(void *)(a1 + 712) = "/var/run/utmpx";
    *(_BYTE *)(a1 + 728) = v8 | 1;
    goto LABEL_13;
  }

  unint64_t v4 = _platform_strlen();
  if (v4 > 0x3FF || *(_BYTE *)(v4 + a2 - 1) != 120) {
    return 0LL;
  }
  char v5 = *(_BYTE *)(a1 + 728);
  if ((v5 & 1) != 0)
  {
    uint64_t v6 = 0LL;
    *(void *)(a1 + 712) = 0LL;
  }

  else
  {
    uint64_t v6 = *(void **)(a1 + 712);
  }

  *(_BYTE *)(a1 + 728) = v5 & 0xFE;
  uint64_t result = (uint64_t)reallocf(v6, v4 + 1);
  *(void *)(a1 + 712) = result;
  if (result)
  {
    _platform_strcpy();
LABEL_13:
    __endutxent(a1);
    return 1LL;
  }

  return result;
}

uint64_t _utmpxname(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    _utmpxname_cold_1();
  }
  if (*(void *)a1 != 0x17600787475LL) {
    _utmpxname_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v4 = __utmpxname(a1, a2);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
  return v4;
}

int utmpxname(const char *a1)
{
  return _utmpxname(__utx__, (uint64_t)a1);
}

ssize_t strfmon(char *a1, size_t a2, const char *a3, ...)
{
  uint64_t v4 = __locale_key;
  char v5 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (_xlocale *)&__global_locale;
  }
  return _strfmon(a1, a2, v6, (unsigned __int8 *)a3, (double *)va);
}

uint64_t _strfmon(_BYTE *a1, unint64_t a2, locale_t a3, unsigned __int8 *a4, double *a5)
{
  v141 = a5;
  uint64_t v9 = localeconv_l(a3);
  int v10 = 0;
  uint64_t v11 = 0LL;
  int v12 = 0LL;
  unint64_t v135 = a2;
  int v13 = &a1[a2];
  locale_t v14 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1LL) {
    locale_t v14 = a3;
  }
  v136 = a3;
  if (a3) {
    locale_t v15 = v14;
  }
  else {
    locale_t v15 = (locale_t)&__c_locale;
  }
  int v16 = 32;
  unint64_t v17 = (unint64_t)a1;
LABEL_7:
  while (2)
  {
    while (2)
    {
      uint64_t v18 = -(uint64_t)v17;
      for (unint64_t i = (_BYTE *)v17; ; ++i)
      {
        int v20 = *a4;
        if (v20 == 37) {
          break;
        }
        if (!*a4)
        {
          if (i < v13)
          {
            _BYTE *i = 0;
            free(v12);
            free(v11);
            return i - a1;
          }

          goto LABEL_255;
        }

LABEL_262:
              int v118 = 22;
              goto LABEL_256;
            }

            break;
          }

          if ((char)v22 == 33)
          {
            v21 |= 0x10u;
            continue;
          }

          break;
        }

        if ((char)v22 == 40)
        {
          if ((v21 & 2) == 0)
          {
            v21 |= 0xAu;
            continue;
          }

          goto LABEL_262;
        }

        break;
      }

LABEL_171:
        if (v138 != 4)
        {
          if (v139 == 1)
          {
            *(_BYTE *)v17++ = v16;
          }

          goto LABEL_192;
        }

        if (v139 == 2)
        {
          *(_BYTE *)v17++ = v16;
        }

        char v92 = *v137;
        if (*v137)
        {
          char v93 = v137 + 1;
          while (v17 < (unint64_t)v13)
          {
            *(_BYTE *)v17++ = v92;
            int v94 = *(unsigned __int8 *)v93++;
            char v92 = v94;
            if (!v94) {
              goto LABEL_179;
            }
          }

          goto LABEL_255;
        }

LABEL_179:
        if (v139 == 1) {
          goto LABEL_187;
        }
      }

LABEL_197:
      if (v140) {
        goto LABEL_229;
      }
      if (v138 == 3)
      {
        if (v139 == 1)
        {
          *(_BYTE *)v17++ = 32;
        }

        char v100 = *v137;
        if (*v137)
        {
          uint64_t v101 = v137 + 1;
          while (v17 < (unint64_t)v13)
          {
            *(_BYTE *)v17++ = v100;
            int v102 = *(unsigned __int8 *)v101++;
            char v100 = v102;
            if (!v102) {
              goto LABEL_206;
            }
          }

          goto LABEL_255;
        }
      }

LABEL_206:
      if ((v75 & 0x10) != 0)
      {
LABEL_229:
        int v106 = v138;
      }

      else
      {
        BOOL v103 = v138 == 3 && v139 == 2;
        if (v103 || v139 == 1 && v138 <= 4u && v138 != 3)
        {
          *(_BYTE *)v17++ = v16;
        }

        LOBYTE(v104) = *v11;
        if (*v11)
        {
          uint64_t v105 = 0LL;
          while (v17 + v105 < (unint64_t)v13)
          {
            *(_BYTE *)(v17 + v105) = v104;
            int v104 = v11[++v105];
            if (!v104)
            {
              v17 += v105;
              goto LABEL_221;
            }
          }

          goto LABEL_255;
        }

LABEL_238:
      if (!v138)
      {
        if ((v75 & 0x80) != 0)
        {
          char v113 = 41;
LABEL_245:
          *(_BYTE *)v17++ = v113;
        }

        else if ((v128 & 0x80000000) == 0)
        {
          char v113 = 32;
          goto LABEL_245;
        }
      }

      ++a4;
      int v114 = v17 - (_DWORD)i;
      break;
    }

    if ((v132 & 0x20) == 0)
    {
      unint64_t v115 = v15;
      _platform_memmove();
      _platform_memset();
      int v16 = v125;
      locale_t v15 = v115;
      uint64_t v9 = (lconv *)v133;
      v17 += v26 - (uint64_t)v114;
      int v10 = v114;
      continue;
    }

    break;
  }

  unint64_t v116 = (_BYTE *)(v17 + v18);
  while (v17 < (unint64_t)v13)
  {
    *(_BYTE *)v17++ = 32;
  }

LABEL_255:
  int v118 = 7;
LABEL_256:
  *__error() = v118;
LABEL_257:
  int v119 = *__error();
  if (v12) {
    free(v12);
  }
  if (v11) {
LABEL_260:
  }
    free(v11);
  *__error() = v119;
  return -1LL;
}

ssize_t strfmon_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  locale_t v4 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1LL) {
    locale_t v4 = a3;
  }
  if (a3) {
    char v5 = v4;
  }
  else {
    char v5 = (_xlocale *)&__c_locale;
  }
  return _strfmon(a1, a2, v5, (unsigned __int8 *)a4, (double *)va);
}

uint64_t __calc_left_pad(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = a1;
  __setup_vars(a1, &v11, &v10, &v9, &v8, a3);
  int v4 = v11;
  if (v11)
  {
    unsigned int v5 = _platform_strlen();
    if (v10) {
      uint64_t v6 = v5 + 1;
    }
    else {
      uint64_t v6 = v5;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if ((v9 - 3) < 2)
  {
    if (!v4) {
      return v6;
    }
    return v6 + _platform_strlen();
  }

  if (v9 == 1) {
    return v6 + _platform_strlen();
  }
  if (v9) {
    return v6;
  }
  else {
    return v6 + ((v3 >> 7) & 1);
  }
}

uint64_t __setup_vars(uint64_t result, _BYTE *a2, _BYTE *a3, _BYTE *a4, const char **a5, uint64_t a6)
{
  if ((~(_DWORD)result & 0xC0) == 0)
  {
    *a2 = *(_BYTE *)(a6 + 89);
    *a3 = *(_BYTE *)(a6 + 91);
    if ((result & 8) == 0)
    {
      char v6 = *(_BYTE *)(a6 + 93);
      goto LABEL_15;
    }

    goto LABEL_14;
  }

  if ((result & 0x40) != 0)
  {
    *a2 = *(_BYTE *)(a6 + 88);
    *a3 = *(_BYTE *)(a6 + 90);
    if ((result & 8) == 0)
    {
      char v7 = *(_BYTE *)(a6 + 92);
      goto LABEL_11;
    }

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  if (!__s) {
    return 22;
  }
  if ((__smax & 0x8000000000000000LL) != 0) {
    return 7;
  }
  if ((__n & 0x8000000000000000LL) == 0LL) {
    rsize_t v4 = __n;
  }
  else {
    rsize_t v4 = __smax;
  }
  if (v4 <= __smax) {
    errno_t v5 = ((uint64_t)__n >> 63) & 7;
  }
  else {
    errno_t v5 = 84;
  }
  _platform_memset();
  return v5;
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
  a1->opaque[0] = 0LL;
  a1->opaque[1] = (void *)a2;
  a1->opaque[3] = 0LL;
  a1->opaque[4] = 0LL;
  a1->opaque[2] = 0LL;
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  uint64_t v2 = a1->opaque[0];
  if (!a1->opaque[0]) {
    return 0LL;
  }
  rsize_t v4 = a1->opaque[1];
  errno_t v5 = (uint64_t (*)(void, char *, const void *))v4[1];
  while (1)
  {
    char v6 = (char *)v2 - v4[2];
    unsigned int v7 = v5(v4[3], v6, a2);
    if (!v7) {
      break;
    }
    uint64_t v2 = (void *)v2[v7 >> 31];
    if (!v2) {
      return 0LL;
    }
  }

  return v6;
}

void *__cdecl rb_tree_find_node_geq(rb_tree_t *a1, const void *a2)
{
  uint64_t v2 = a1->opaque[0];
  if (!a1->opaque[0]) {
    return 0LL;
  }
  rsize_t v4 = 0LL;
  errno_t v5 = a1->opaque[1];
  char v6 = (uint64_t (*)(void, char *, const void *))v5[1];
  while (1)
  {
    unsigned int v7 = (char *)v2 - v5[2];
    int v8 = v6(v5[3], v7, a2);
    if (!v8) {
      break;
    }
    if (v8 > 0) {
      rsize_t v4 = v2;
    }
    uint64_t v2 = (void *)v2[v8 >> 31];
    if (!v2)
    {
      if (!v4) {
        return 0LL;
      }
      return (char *)v4 - v5[2];
    }
  }

  return v7;
}

void *__cdecl rb_tree_find_node_leq(rb_tree_t *a1, const void *a2)
{
  uint64_t v2 = a1->opaque[0];
  if (!a1->opaque[0]) {
    return 0LL;
  }
  rsize_t v4 = 0LL;
  errno_t v5 = a1->opaque[1];
  char v6 = (uint64_t (*)(void, char *, const void *))v5[1];
  while (1)
  {
    unsigned int v7 = (char *)v2 - v5[2];
    int v8 = v6(v5[3], v7, a2);
    if (!v8) {
      break;
    }
    if (v8 < 0) {
      rsize_t v4 = v2;
    }
    uint64_t v2 = (void *)v2[v8 >> 31];
    if (!v2)
    {
      if (!v4) {
        return 0LL;
      }
      return (char *)v4 - v5[2];
    }
  }

  return v7;
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  uint64_t v2 = a2;
  rsize_t v4 = (rb_tree_t *)a1->opaque[0];
  errno_t v5 = a1->opaque[1];
  char v6 = (unint64_t *)((char *)a2 + v5[2]);
  if (a1->opaque[0])
  {
    unsigned int v7 = (uint64_t (*)(void, char *, void *))*v5;
    do
    {
      int v8 = v4;
      char v9 = (char *)v4 - v5[2];
      unsigned int v10 = v7(v5[3], v9, v2);
      if (!v10) {
        return v9;
      }
      unsigned int v11 = v10 >> 31;
      rsize_t v4 = (rb_tree_t *)v8->opaque[v10 >> 31];
    }

    while (v4);
    int v12 = v6 + 2;
    unint64_t v13 = (unint64_t)v8 & 0xFFFFFFFFFFFFFFFDLL;
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_8;
    }
    uint64_t v14 = 2LL;
  }

  else
  {
    unsigned int v11 = 0;
    int v12 = v6 + 2;
    unint64_t v13 = (unint64_t)a1 & 0xFFFFFFFFFFFFFFFDLL;
    int v8 = a1;
LABEL_8:
    uint64_t v14 = 0LL;
  }

  unint64_t v15 = v13 | v14;
  if (v8 == a1)
  {
    int v21 = 0;
    unint64_t v20 = v15 & 0xFFFFFFFFFFFFFFFELL;
    v6[2] = v20;
    a1->opaque[2] = v6;
    a1->opaque[3] = v6;
    uint64_t v16 = v11;
  }

  else
  {
    uint64_t v16 = v11;
    unint64_t v17 = &a1->opaque[v11];
    int v19 = (rb_tree_t *)v17[2];
    uint64_t v18 = (unint64_t **)(v17 + 2);
    if (v8 == v19) {
      *uint64_t v18 = v6;
    }
    unint64_t v20 = v15 | 1;
    *int v12 = v20;
    int v21 = (uint64_t)v8->opaque[2] & 1;
  }

  *char v6 = (unint64_t)v8->opaque[v16];
  v6[1] = (unint64_t)v8->opaque[v16];
  v8->opaque[v16] = v6;
  ++a1->opaque[4];
  if (v21)
  {
    unint64_t v22 = v20 & 0xFFFFFFFFFFFFFFFCLL;
    int v23 = (void *)((v20 & 0xFFFFFFFFFFFFFFFCLL) + 16);
    unint64_t v24 = *v23 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v25 = *(void *)(v24 + 8);
    unsigned int v26 = v25 == (v20 & 0xFFFFFFFFFFFFFFFCLL);
    BOOL v27 = v25 != (v20 & 0xFFFFFFFFFFFFFFFCLL);
    uint64_t v28 = *(void *)(v24 + 8 * v27);
    if (v28 && (v31 = *(void *)(v28 + 16), int v29 = (unint64_t *)(v28 + 16), v30 = v31, (v31 & 1) != 0))
    {
      unsigned __int8 v33 = a1->opaque[0];
      while (1)
      {
        *int v29 = v30 & 0xFFFFFFFFFFFFFFFELL;
        *v23 &= ~1uLL;
        char v6 = (unint64_t *)v24;
        uint64_t v34 = *(void *)(v24 + 16);
        *(void *)(v24 + 16) = v34 | 1;
        unint64_t v22 = v34 & 0xFFFFFFFFFFFFFFFCLL;
        if ((v34 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
          break;
        }
        int v23 = (void *)(v22 + 16);
        uint64_t v35 = *(void *)(v22 + 16);
        if ((v35 & 1) == 0) {
          break;
        }
        unint64_t v24 = v35 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFFFCLL) + 8);
        unsigned int v26 = v36 == v22;
        BOOL v27 = v36 != v22;
        uint64_t v37 = *(void *)(v24 + 8 * v27);
        if (v37)
        {
          uint64_t v38 = *(void *)(v37 + 16);
          int v29 = (unint64_t *)(v37 + 16);
          uint64_t v30 = v38;
          if ((v38 & 1) != 0) {
            continue;
          }
        }

        goto LABEL_18;
      }
    }

    else
    {
LABEL_18:
      rb_tree_reparent_nodes(v24, v26);
      *((void *)a1->opaque[0] + 2) &= ~1uLL;
    }
  }

  return v2;
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *((void *)a1->opaque[1] + 2);
  rsize_t v4 = (char *)a2 + v3;
  if (!((char *)a2 + v3))
  {
    unint64_t v18 = MEMORY[0x10];
    uint64_t v19 = MEMORY[0];
    goto LABEL_18;
  }

  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *((void *)v4 + 1);
  if (!*(void *)v4)
  {
    if (v6) {
      goto LABEL_25;
    }
    unint64_t v18 = *((void *)v4 + 2);
    if ((v18 & 1) != 0)
    {
      uint64_t v19 = 0LL;
      BOOL v21 = 0;
      unint64_t v20 = (char *)a1->opaque[0];
      goto LABEL_19;
    }

    uint64_t v19 = 0LL;
LABEL_18:
    unint64_t v20 = (char *)a1->opaque[0];
    BOOL v21 = a1->opaque[0] != v4;
LABEL_19:
    LODWORD(v10) = (v18 >> 1) & 1;
    int v12 = (char *)(v18 & 0xFFFFFFFFFFFFFFFCLL);
    *(void *)((v18 & 0xFFFFFFFFFFFFFFFCLL) + 8LL * v10) = v19;
    --a1->opaque[4];
    unint64_t v22 = &a1->opaque[(v18 >> 1) & 1];
    unint64_t v24 = (char *)v22[2];
    int v23 = (char **)(v22 + 2);
    if (v24 == v4)
    {
      void *v23 = v12;
      if (v20 == v4) {
        a1->opaque[3] = v12;
      }
    }

    *((void *)v4 + 2) = v18 & 3;
    if (v21) {
      goto LABEL_41;
    }
    return;
  }

  if (!v6)
  {
LABEL_25:
    unint64_t v25 = *((void *)v4 + 2);
    unsigned int v26 = *(void **)&v4[8 * (v5 == 0)];
    BOOL v27 = (char *)a1->opaque[0];
    *(void *)((v25 & 0xFFFFFFFFFFFFFFFCLL) + 8 * ((v25 >> 1) & 1)) = v26;
    v26[2] = v25;
    --a1->opaque[4];
    if (v27 == v4)
    {
      a1->opaque[(v5 != 0) + 2] = v26;
      unint64_t v28 = *((void *)v4 + 2);
    }

    else
    {
      unint64_t v28 = *((void *)v4 + 2);
      int v29 = &a1->opaque[(v28 >> 1) & 1];
      uint64_t v31 = (char *)v29[2];
      uint64_t v30 = v29 + 2;
      if (v31 == v4) {
        *uint64_t v30 = v26;
      }
    }

    *((void *)v4 + 2) = v28 & 3;
    return;
  }

  unsigned int v7 = (char *)rb_tree_iterate(a1, a2, ((*((_DWORD *)v4 + 4) >> 1) & 1) == 0);
  unint64_t v8 = (unint64_t)&v7[v3];
  unint64_t v9 = *(void *)&v7[v3 + 16];
  uint64_t v10 = (v9 >> 1) & 1;
  BOOL v11 = (v9 & 2) == 0;
  int v12 = (char *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
  BOOL v14 = (v9 & 1) == 0 || v8 == 0;
  if (v12 == v4) {
    BOOL v15 = (v9 >> 1) & 1;
  }
  else {
    BOOL v15 = (v9 & 2) == 0;
  }
  uint64_t v16 = *(void *)(v8 + 8LL * v15);
  if (!v16 || (uint64_t v17 = *(void *)(v16 + 16), (v17 & 1) == 0))
  {
    if (v12 == v4) {
      goto LABEL_36;
    }
LABEL_33:
    *(void *)&v12[8 * v10] = v16;
    uint64_t v32 = *(void *)&v4[8 * ((v9 & 2) == 0)];
    *(void *)(v8 + 8LL * ((v9 & 2) == 0)) = v32;
    *(void *)(v32 + 16) = *(void *)(v32 + 16) & 3LL | v8;
    BOOL v11 = (v9 >> 1) & 1;
    goto LABEL_37;
  }

  *(void *)(v16 + 16) = v17 & 0xFFFFFFFFFFFFFFFELL;
  if (v12 != v4)
  {
    BOOL v14 = 0;
    *(void *)(v16 + 16) = v9 & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_33;
  }

  BOOL v14 = 0;
LABEL_36:
  int v12 = &v7[v3];
LABEL_37:
  uint64_t v33 = *(void *)&v4[8 * v11];
  *(void *)(v8 + 8LL * v11) = v33;
  *(void *)(v33 + 16) = *(void *)(v33 + 16) & 3LL | v8;
  unint64_t v34 = *((void *)v4 + 2);
  *(void *)(v8 + 16) = *(void *)(v8 + 16) & 0xFFFFFFFFFFFFFFFCLL | v34 & 3;
  unint64_t v35 = *((void *)v4 + 2) & 0xFFFFFFFFFFFFFFFCLL;
  *(void *)(v8 + 16) = v35 | v34 & 3;
  *(void *)(v35 + 8 * ((v34 >> 1) & 1)) = v8;
  --v2->opaque[4];
  unint64_t v36 = *((void *)v4 + 2);
  uint64_t v37 = &v2->opaque[(v36 >> 1) & 1];
  unsigned int v39 = (char *)v37[2];
  uint64_t v38 = (unint64_t *)(v37 + 2);
  if (v39 == v4) {
    *uint64_t v38 = v36 & 0xFFFFFFFFFFFFFFFCLL;
  }
  *((void *)v4 + 2) = v36 & 3;
  if (v14)
  {
    a1 = v2;
LABEL_41:
    rb_tree_removal_rebalance(a1, (unint64_t)v12, v10);
  }

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  uint64_t v3 = a1->opaque[1];
  if (!a2)
  {
    if (a1->opaque[0]) {
      return (char *)a1->opaque[(a3 == 0) + 2] - v3[2];
    }
    return 0LL;
  }

  uint64_t v4 = a3 ^ 1;
  uint64_t v5 = v3[2];
  uint64_t v6 = (char *)a2 + v5;
  unsigned int v7 = *(void **)((char *)a2 + 8 * a3 + v5);
  if (!v7)
  {
    while (a1->opaque[0] != v6)
    {
      uint64_t v9 = v6[2];
      unsigned int v10 = (v9 >> 1) & 1;
      uint64_t v6 = (void *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
      if ((_DWORD)v4 == v10) {
        return (char *)v6 - v5;
      }
    }

    return 0LL;
  }

  do
  {
    uint64_t v6 = v7;
    unsigned int v7 = (void *)v7[v4];
  }

  while (v7);
  return (char *)v6 - v5;
}

size_t rb_tree_count(size_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t rb_tree_reparent_nodes(uint64_t result, unsigned int a2)
{
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(result + 8LL * a2);
  *(void *)((v2 & 0xFFFFFFFFFFFFFFFCLL) + 8 * ((v2 >> 1) & 1)) = v3;
  *(void *)(result + 8LL * a2) = *(void *)(v3 + 8LL * (a2 ^ 1));
  *(void *)(v3 + 8LL * (a2 ^ 1)) = result;
  *(void *)(v3 + 16) = v2 & 0xFFFFFFFFFFFFFFFCLL | *(void *)(v3 + 16) & 3LL;
  uint64_t v4 = *(void *)(result + 16) & 3LL | v3;
  *(void *)(result + 16) = v4;
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = (v5 ^ v4) & 3;
  *(void *)(v3 + 16) = v6 ^ v5;
  *(void *)(result + 16) = (*(void *)(result + 16) ^ v6) & 0xFFFFFFFFFFFFFFFDLL | (2LL * (a2 != 1));
  uint64_t v7 = *(void *)(result + 8LL * a2);
  if (v7) {
    *(void *)(v7 + 16) = *(void *)(v7 + 16) & 1LL | result & 0xFFFFFFFFFFFFFFFDLL | (2LL * (a2 != 0));
  }
  return result;
}

void *rb_tree_removal_rebalance(void *result, unint64_t a2, unsigned int a3)
{
  uint64_t v5 = result;
  while (1)
  {
    uint64_t v6 = *(void *)(a2 + 8LL * a3);
    if (v6)
    {
      if ((*(_BYTE *)(v6 + 16) & 1) != 0) {
        return result;
      }
    }

    uint64_t v7 = a3 ^ 1;
    uint64_t result = *(void **)(a2 + 8LL * v7);
    uint64_t v8 = *(void *)(a2 + 16);
    if ((v8 & 1) != 0)
    {
      int v12 = (void **)(a2 + 8 * v7);
      goto LABEL_15;
    }

    if (*result && (*(_BYTE *)(*result + 16LL) & 1) != 0 || (uint64_t v9 = result[1]) != 0 && (*(_BYTE *)(v9 + 16) & 1) != 0)
    {
      int v12 = (void **)(a2 + 8 * v7);
      goto LABEL_23;
    }

    uint64_t v10 = result[2];
    if ((v10 & 1) != 0)
    {
      int v12 = (void **)(a2 + 8 * v7);
      rb_tree_reparent_nodes(a2, a3 ^ 1);
      uint64_t result = *v12;
      uint64_t v8 = *(void *)(a2 + 16);
      if ((v8 & 1) == 0)
      {
LABEL_23:
        uint64_t v14 = result[v7];
        if (!v14 || (uint64_t v15 = *(void *)(v14 + 16), (v15 & 1) == 0))
        {
          rb_tree_reparent_nodes((uint64_t)result, a3);
          uint64_t v14 = (*v12)[v7];
          uint64_t v15 = *(void *)(v14 + 16);
        }

        *(void *)(v14 + 16) = v15 & 0xFFFFFFFFFFFFFFFELL;
        return (void *)rb_tree_reparent_nodes(a2, a3 ^ 1);
      }

int regncomp_l(regex_t *a1, const char *a2, size_t a3, int a4, locale_t a5)
{
  unint64_t v7 = a3;
  uint64_t v10 = malloc(4 * a3 + 4);
  if (!v10) {
    return 12;
  }
  uint64_t v11 = v10;
  locale_t v12 = (locale_t)&__global_locale;
  if (a5 != (locale_t)-1LL) {
    locale_t v12 = a5;
  }
  if (a5) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = (_xlocale *)&__c_locale;
  }
  if (*(_DWORD *)(*((void *)v13 + 166) + 64LL) == 1)
  {
    if (v7)
    {
      uint64_t v14 = 0LL;
      do
      {
        *(_DWORD *)&v10[4 * v14] = a2[v14];
        ++v14;
      }

      while (v7 > v14);
    }

    goto LABEL_22;
  }

  uint64_t v16 = (__int32 *)v10;
  memset(&v19, 0, sizeof(v19));
  if (!v7)
  {
LABEL_21:
    unint64_t v7 = ((char *)v16 - v11) >> 2;
LABEL_22:
    *(_DWORD *)&v11[4 * v7] = 0;
    int v15 = tre_compile((uint64_t)a1, (uint64_t)v11, v7, a4, (size_t)v13);
    goto LABEL_23;
  }

  uint64_t v16 = (__int32 *)v10;
  while (1)
  {
    size_t v17 = mbrtowc_l(v16, a2, v7, &v19, v13);
    if (!v17) {
      break;
    }
    if (v17 >= 0xFFFFFFFFFFFFFFFELL)
    {
      int v15 = 17;
      goto LABEL_23;
    }

int regncomp(regex_t *a1, const char *a2, size_t a3, int a4)
{
  uint64_t v4 = __locale_key;
  uint64_t v5 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (_xlocale *)&__global_locale;
  }
  return regncomp_l(a1, a2, a3, a4, v6);
}

int regcomp_l(regex_t *a1, const char *a2, int a3, locale_t a4)
{
  if ((a3 & 0x20) != 0)
  {
    re_endp = a1->re_endp;
    size_t v8 = re_endp - a2;
    if (re_endp < a2) {
      return 16;
    }
  }

  else
  {
    size_t v8 = _platform_strlen();
  }

  return regncomp_l(a1, a2, v8, a3, a4);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  uint64_t v3 = __locale_key;
  uint64_t v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (_xlocale *)&__global_locale;
  }
  return regcomp_l(a1, a2, a3, v5);
}

uint64_t regwncomp_l(uint64_t a1, uint64_t a2, int a3, unsigned int a4, void *a5)
{
  uint64_t v5 = &__global_locale;
  if (a5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = &__c_locale;
  }
  return tre_compile(a1, a2, a3, a4, (size_t)v6);
}

int regwncomp(regex_t *a1, const __int32 *a2, size_t a3, int a4)
{
  uint64_t v4 = __locale_key;
  uint64_t v5 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = &__global_locale;
  }
  return tre_compile((uint64_t)a1, (uint64_t)a2, a3, a4, (size_t)v6);
}

int regwcomp_l(regex_t *a1, const __int32 *a2, int a3, locale_t a4)
{
  locale_t v7 = (locale_t)&__global_locale;
  if (a4 != (locale_t)-1LL) {
    locale_t v7 = a4;
  }
  if (a4) {
    locale_t v8 = v7;
  }
  else {
    locale_t v8 = (locale_t)&__c_locale;
  }
  int v9 = wcslen(a2);
  return tre_compile((uint64_t)a1, (uint64_t)a2, v9, a3, (size_t)v8);
}

int regwcomp(regex_t *a1, const __int32 *a2, int a3)
{
  int v6 = wcslen(a2);
  uint64_t v7 = __locale_key;
  locale_t v8 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v7);
  if (v8) {
    int v9 = v8;
  }
  else {
    int v9 = &__global_locale;
  }
  return tre_compile((uint64_t)a1, (uint64_t)a2, v6, a3, (size_t)v9);
}

uint64_t tre_fill_pmatch(unint64_t a1, void *a2, char a3, uint64_t a4, _DWORD *a5, unsigned int a6)
{
  if ((a3 & 4) != 0) {
    return 0LL;
  }
  unsigned int v9 = 0;
  if (a5 && (a6 & 0x80000000) == 0)
  {
    uint64_t v12 = *(void *)(a4 + 48);
    uint64_t v13 = a5;
    if (v12)
    {
      int v14 = *(_DWORD *)(v12 + 16);
      uint64_t v13 = a5;
      if (v14 >= 1)
      {
        int v15 = malloc(16LL * *(int *)(a4 + 80));
        if (!v15) {
          return 12LL;
        }
        uint64_t v13 = v15;
        _platform_memmove();
        tre_reset_last_matched_branches((uint64_t)v13, *(int **)(v12 + 8), v14, 0, 0);
      }
    }

    unsigned int v9 = 0;
    int v16 = *(_DWORD *)(a4 + 72);
    if (v16 && a1)
    {
      int v17 = *(_DWORD *)(a4 + 88);
      unint64_t v18 = (v16 - 1);
      if (a1 - 1 < v18) {
        unint64_t v18 = a1 - 1;
      }
      unint64_t v19 = v18 + 1;
      unint64_t v20 = (int *)(*(void *)(a4 + 24) + 4LL);
      BOOL v21 = a2;
      do
      {
        uint64_t v22 = *(v20 - 1);
        uint64_t v23 = a6;
        if ((_DWORD)v22 != v17)
        {
          else {
            LODWORD(v23) = v13[4 * v22 + 2];
          }
          uint64_t v23 = (int)v23;
        }

        void *v21 = v23;
        uint64_t v24 = *v20;
        uint64_t v25 = a6;
        if ((_DWORD)v24 != v17)
        {
          else {
            LODWORD(v25) = v13[4 * v24 + 2];
          }
          uint64_t v25 = (int)v25;
        }

        v21[1] = v25;
        if (v23 == -1 || v25 == -1)
        {
          void *v21 = -1LL;
          v21[1] = -1LL;
        }

        v21 += 2;
        v20 += 2;
        --v19;
      }

      while (v19);
      unsigned int v9 = v18 + 1;
    }

    if (v13 != a5) {
      free(v13);
    }
  }

  unint64_t v26 = v9;
  if (v9 < a1)
  {
    unsigned int v27 = v9 + 1;
    do
    {
      unint64_t v28 = &a2[2 * v26];
      unint64_t v26 = v27;
      void *v28 = -1LL;
      v28[1] = -1LL;
      ++v27;
    }

    while (v26 < a1);
  }

  return 0LL;
}

uint64_t tre_reset_last_matched_branches(uint64_t result, int *a2, int a3, int a4, int a5)
{
  if (a3 >= 1)
  {
    int v8 = a3;
    uint64_t v10 = result;
    uint64_t v11 = (_DWORD *)(result + 16LL * a4 + 12);
    do
    {
      int v12 = a2[2];
      if (v12 == 1)
      {
        uint64_t v13 = *(int ***)a2;
        if (a4 >= 1 && (a5 || *(_DWORD *)(v10 + 16LL * *((int *)v13 + 5) + 12) < *v11))
        {
          int v14 = *((_DWORD *)v13 + 6);
          if (v14 >= 1)
          {
            int v15 = *v13;
            unsigned int v16 = v14 + 1;
            do
            {
              uint64_t v17 = *v15++;
              *(_DWORD *)(v10 + 16 * v17) = 0;
              --v16;
            }

            while (v16 > 1);
          }
        }
      }

      else
      {
        if (a5) {
          goto LABEL_17;
        }
        if (v12 >= 1)
        {
          int v5 = 0;
          unint64_t v18 = (int *)(*(void *)a2 + 20LL);
          unsigned int v19 = v12 + 1;
          do
          {
            uint64_t v20 = *v18;
            v18 += 8;
            int v21 = *(_DWORD *)(v10 + 16 * v20 + 12);
            if (v21 > v5) {
              int v5 = v21;
            }
            --v19;
          }

          while (v19 > 1);
LABEL_17:
          if (v12 >= 1)
          {
            uint64_t v22 = *(int ***)a2;
            do
            {
              if (a5 || *(_DWORD *)(v10 + 16LL * *((int *)v22 + 5) + 12) < v5)
              {
                int v23 = *((_DWORD *)v22 + 6);
                if (v23 >= 1)
                {
                  uint64_t v24 = *v22;
                  unsigned int v25 = v23 + 1;
                  do
                  {
                    uint64_t v26 = *v24++;
                    *(_DWORD *)(v10 + 16 * v26) = 0;
                    --v25;
                  }

                  while (v25 > 1);
                }
              }

              v22 += 4;
              BOOL v27 = __OFSUB__(v12--, 1);
            }

            while (!((v12 < 0) ^ v27 | (v12 == 0)));
          }

          goto LABEL_32;
        }

        int v5 = 0;
      }

int regnexec(const regex_t *a1, const char *a2, size_t a3, size_t a4, regmatch_t __pmatch[], int a6)
{
  if (a1->re_magic != 62053) {
    return 2;
  }
  re_g = a1->re_g;
  if (*(_DWORD *)(*(void *)(*((void *)re_g + 7) + 1328LL) + 64LL) == 1) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  return tre_match(re_g, (uint64_t)a2, a3, v10, a4, &__pmatch->rm_so, a6);
}

uint64_t tre_match( _DWORD *a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t *a6, unsigned int a7)
{
  __int16 v7 = a7;
  unint64_t v9 = a5;
  int v11 = a3;
  if (a6) {
    int v14 = (a7 >> 2) & 1;
  }
  else {
    int v14 = 0;
  }
  if (v14 != 1)
  {
    int v28 = v14;
    uint64_t v18 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_13;
  }

  uint64_t v15 = *a6;
  if (*a6 < 0) {
    return 16LL;
  }
  if (a3 != -1 || (uint64_t v16 = a6[1], v17 = 16LL, (v16 & 0x8000000000000000LL) == 0) && (v11 = v16 - v15, v16 >= v15))
  {
    int v28 = 1;
    if (a4) {
      uint64_t v18 = *a6;
    }
    else {
      uint64_t v18 = 4 * v15;
    }
LABEL_13:
    unsigned int v19 = 0LL;
    if (a5 && (v20 = a1[20], (int)v20 >= 1) && (unsigned int v19 = (int *)malloc(16 * v20)) == 0LL)
    {
      return 12LL;
    }

    else
    {
      int v21 = (__darwin_ct_rune_t *)(a2 + v18);
      if (a1[25] | v7 & 0x400) {
        uint64_t v22 = tre_tnfa_run_backtrack(a1, v21, v11, a4, (uint64_t)v19, v7, &v29);
      }
      else {
        uint64_t v22 = tre_tnfa_run_parallel((uint64_t)a1, (const char *)v21, v11, a4, v19, v7, &v29);
      }
      uint64_t v17 = v22;
      if (!(_DWORD)v22)
      {
        uint64_t v17 = tre_fill_pmatch(v9, a6, a1[24], (uint64_t)a1, v19, v29);
        if (!(_DWORD)v17)
        {
          BOOL v23 = (a1[24] & 4) != 0 || v9 == 0;
          int v24 = v28;
          if (v23) {
            int v24 = 0;
          }
          if (v24 == 1)
          {
            unsigned int v25 = a6 + 1;
            do
            {
              uint64_t v26 = *(v25 - 1);
              if ((v26 & 0x8000000000000000LL) == 0) {
                *(v25 - 1) = v26 + v15;
              }
              if ((*v25 & 0x8000000000000000LL) == 0) {
                *v25 += v15;
              }
              v25 += 2;
              --v9;
            }

            while (v9);
          }

          uint64_t v17 = 0LL;
        }
      }

      if (v19) {
        free(v19);
      }
    }
  }

  return v17;
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return regnexec(a1, a2, 0xFFFFFFFFFFFFFFFFLL, a3, __pmatch, a5);
}

int regwnexec(const regex_t *a1, const __int32 *a2, size_t a3, size_t a4, regmatch_t __pmatch[], int a6)
{
  if (a1->re_magic == 62053) {
    return tre_match((_DWORD *)a1->re_g, (uint64_t)a2, a3, 0, a4, &__pmatch->rm_so, a6);
  }
  else {
    return 2;
  }
}

int regwexec(const regex_t *a1, const __int32 *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  if (a1->re_magic == 62053) {
    return tre_match((_DWORD *)a1->re_g, (uint64_t)a2, -1LL, 0, a3, &__pmatch->rm_so, a5);
  }
  else {
    return 2;
  }
}

char *tre_ast_new_node(uint64_t a1, int a2, size_t a3)
{
  int v6 = tre_mem_alloc_impl(a1, 0, 0LL, 1, 0x48uLL);
  if (v6)
  {
    __int16 v7 = tre_mem_alloc_impl(a1, 0, 0LL, 1, a3);
    *(void *)int v6 = v7;
    if (v7)
    {
      *((_WORD *)v6 + 32) = -1;
      *((_DWORD *)v6 + 12) = a2;
      *((_DWORD *)v6 + 13) = -1;
    }

    else
    {
      return 0LL;
    }
  }

  return v6;
}

char *tre_ast_new_literal(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t result = tre_ast_new_node(a1, 0, 0x18uLL);
  if (result)
  {
    int v8 = *(_DWORD **)result;
    *int v8 = a2;
    v8[1] = a3;
    v8[2] = a4;
  }

  return result;
}

char *tre_ast_new_iter(uint64_t a1, uint64_t a2, int a3, int a4, char a5)
{
  uint64_t result = tre_ast_new_node(a1, 2, 0x20uLL);
  if (result)
  {
    uint64_t v10 = *(void *)result;
    *(void *)uint64_t v10 = a2;
    *(_DWORD *)(v10 + 8) = a3;
    *(_DWORD *)(v10 + 12) = a4;
    *(_BYTE *)(v10 + 16) = *(_BYTE *)(v10 + 16) & 0xFE | a5 & 1;
    *((_DWORD *)result + 14) = *(_DWORD *)(a2 + 56);
  }

  return result;
}

char *tre_ast_new_union(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = tre_ast_new_node(a1, 3, 0x18uLL);
  if (result)
  {
    int v6 = *(void **)result;
    *int v6 = a2;
    v6[1] = a3;
    *((_DWORD *)result + 14) = *(_DWORD *)(a3 + 56) + *(_DWORD *)(a2 + 56);
  }

  return result;
}

char *tre_ast_new_catenation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = tre_ast_new_node(a1, 1, 0x10uLL);
  if (result)
  {
    int v6 = *(void **)result;
    *int v6 = a2;
    v6[1] = a3;
    *((_DWORD *)result + 14) = *(_DWORD *)(a3 + 56) + *(_DWORD *)(a2 + 56);
  }

  return result;
}

uint64_t tre_compile(uint64_t a1, uint64_t a2, int a3, unsigned int a4, size_t a5)
{
  uint64_t v10 = (void **)tre_stack_new(512, 10240, 128);
  if (!v10) {
    return 12LL;
  }
  int v11 = v10;
  int v12 = (uint64_t *)tre_mem_new_impl(0, 0LL);
  if (!v12)
  {
    tre_stack_destroy(v11);
    return 12LL;
  }

  uint64_t v13 = v12;
  *(_OWORD *)__count = 0u;
  memset(v92, 0, sizeof(v92));
  uint64_t v88 = 0LL;
  __int128 v90 = 0u;
  v87[0] = v12;
  v87[1] = v11;
  uint64_t v89 = a2;
  if ((~a4 & 0x101) != 0) {
    unsigned int v14 = a4 & 0xFFFFFFBF;
  }
  else {
    unsigned int v14 = a4;
  }
  DWORD1(v92[1]) = v14;
  DWORD2(v92[0]) = -1;
  __count[0] = a5;
  LODWORD(__count[1]) = a3;
  LODWORD(v92[0]) = 0x40000000;
  uint64_t v15 = tre_parse((uint64_t)v87);
  if ((_DWORD)v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
LABEL_47:
    tre_mem_destroy(v13);
    tre_stack_destroy(v11);
    if (v17) {
      free(v17);
    }
    if (v18) {
      free(v18);
    }
    *(void *)(a1 + 24) = v19;
    if (v19) {
      *(void *)(v19 + 56) = 0LL;
    }
    tre_free(a1);
    return v16;
  }

  int v20 = HIDWORD(__count[1]);
  int v21 = DWORD2(v92[0]);
  *(void *)(a1 + 8) = SHIDWORD(__count[1]) - 1LL;
  uint64_t v22 = v88;
  if ((v21 & 0x80000000) == 0 && LODWORD(v92[1]))
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v16 = 2LL;
    goto LABEL_47;
  }

  if (v21 >= v20)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v16 = 6LL;
    goto LABEL_47;
  }

  BOOL v23 = calloc(1uLL, 0x78uLL);
  uint64_t v19 = (uint64_t)v23;
  if (!v23) {
    goto LABEL_44;
  }
  v23[25] = (DWORD2(v92[0]) & 0x80000000) == 0;
  int v24 = LODWORD(v92[0]) - 0x40000000;
  v23[18] = HIDWORD(__count[1]);
  v23[19] = v24;
  int v25 = HIDWORD(v92[0]);
  *((void *)v23 + 13) = *(void *)((char *)v92 + 12);
  *((void *)v23 + 7) = __count[0];
  if ((v14 & 4) != 0 && v25 < 1)
  {
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v26 = tre_add_tags(0LL, (int *)v11, v22, (uint64_t)v23);
    if ((_DWORD)v26) {
      goto LABEL_32;
    }
    uint64_t v37 = *(unsigned int *)(v19 + 80);
    if ((int)v37 < 1)
    {
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v38 = malloc(4 * v37 + 4);
      uint64_t v17 = v38;
      if (!v38) {
        goto LABEL_45;
      }
      *(void *)(v19 + 32) = v38;
      _platform_memset();
      LODWORD(v37) = *(_DWORD *)(v19 + 80);
    }

    unsigned int v39 = calloc((2 * v37 + 3), 4uLL);
    *(void *)(v19 + 40) = v39;
    if (!v39) {
      goto LABEL_44;
    }
    __int128 v40 = (char *)calloc(HIDWORD(__count[1]), 8uLL);
    if (!v40) {
      goto LABEL_44;
    }
    uint64_t v41 = HIDWORD(__count[1]);
    if (SHIDWORD(__count[1]) >= 1)
    {
      int v42 = v40 + 4;
      do
      {
        *int v42 = -1;
        v42 += 2;
        --v41;
      }

      while (v41);
    }

    *(void *)(v19 + 24) = v40;
    uint64_t v26 = tre_add_tags((unsigned int *)v13, (int *)v11, v22, v19);
    if ((_DWORD)v26) {
      goto LABEL_32;
    }
  }

  uint64_t v26 = tre_expand_ast((uint64_t)v13, (int *)v11, v22, (int *)v92 + 1, (uint64_t)v17);
  if ((_DWORD)v26)
  {
LABEL_32:
    uint64_t v16 = v26;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_47;
  }

  int v27 = DWORD1(v92[0])++;
  int v28 = tre_ast_new_literal((uint64_t)v13, 0, 0, v27);
  if (!v28 || (unsigned int v29 = tre_ast_new_catenation((uint64_t)v13, v22, (uint64_t)v28)) == 0LL)
  {
LABEL_44:
    uint64_t v17 = 0LL;
    goto LABEL_45;
  }

  uint64_t v30 = v29;
  uint64_t v26 = tre_compute_nfl((uint64_t)v13, (int *)v11, (uint64_t)v29);
  if ((_DWORD)v26) {
    goto LABEL_32;
  }
  int v31 = DWORD1(v92[0]);
  size_t v32 = 4LL * SDWORD1(v92[0]);
  uint64_t v17 = malloc(v32);
  if (!v17)
  {
LABEL_45:
    uint64_t v18 = 0LL;
LABEL_46:
    uint64_t v16 = 12LL;
    goto LABEL_47;
  }

  uint64_t v18 = (int *)malloc(v32);
  if (!v18) {
    goto LABEL_46;
  }
  if (v31 >= 1) {
    _platform_bzero();
  }
  tre_ast_to_tnfa(v30, 0LL, (uint64_t)v17, 0LL);
  uint64_t v33 = DWORD1(v92[0]);
  if (SDWORD1(v92[0]) < 1)
  {
    int v34 = 0;
  }

  else
  {
    int v34 = 0;
    unint64_t v35 = v18;
    unint64_t v36 = v17;
    do
    {
      *v35++ = v34;
      v34 += *v36 + 1;
      *v36++ = 0;
      --v33;
    }

    while (v33);
  }

  double v44 = calloc((v34 + 1), 0x38uLL);
  if (!v44) {
    goto LABEL_46;
  }
  *(void *)uint64_t v19 = v44;
  *(_DWORD *)(v19 + 64) = v34;
  int v84 = v44;
  uint64_t v45 = tre_ast_to_tnfa(v30, (uint64_t)v44, (uint64_t)v17, (uint64_t)v18);
  if ((_DWORD)v45)
  {
    uint64_t v16 = v45;
    goto LABEL_47;
  }

  *(_DWORD *)(v19 + 68) = -1;
  int v82 = v30;
  double v46 = (_DWORD *)*((void *)v30 + 3);
  if (*(_WORD *)(v22 + 64)) {
    goto LABEL_76;
  }
  uint64_t v47 = *v46;
  if ((v47 & 0x80000000) != 0) {
    goto LABEL_76;
  }
  int v48 = -1;
  uint64_t v49 = *((void *)v30 + 3);
  do
  {
    int v50 = v18[v47];
    if (v84[7 * v50 + 1])
    {
      uint64_t v51 = (char *)&v84[7 * v50];
      do
      {
        int v52 = *(_DWORD *)v51;
        int v53 = *((_DWORD *)v51 + 1);
        if (*(_DWORD *)v51 <= v53)
        {
          if (v52 == -1 || v53 != v52 || v48 != -1)
          {
            *(_DWORD *)(v19 + 68) = -1;
            goto LABEL_76;
          }

          *(_DWORD *)(v19 + 68) = v52;
          int v48 = v52;
        }

        uint64_t v56 = *((void *)v51 + 8);
        v51 += 56;
      }

      while (v56);
    }

    unsigned int v57 = *(_DWORD *)(v49 + 64);
    v49 += 64LL;
    uint64_t v47 = v57;
  }

  while ((v57 & 0x80000000) == 0);
LABEL_76:
  if ((*v46 & 0x80000000) != 0)
  {
    size_t v59 = 1LL;
  }

  else
  {
    int v58 = v46 + 16;
    size_t v59 = 1LL;
    do
    {
      int v60 = *v58;
      v58 += 16;
      ++v59;
    }

    while ((v60 & 0x80000000) == 0);
  }

  unsigned int v83 = calloc(v59, 0x38uLL);
  if (!v83) {
    goto LABEL_46;
  }
  *(void *)(v19 + 8) = v83;
  int v61 = (unsigned int *)*((void *)v30 + 3);
  uint64_t v62 = *v61;
  if ((v62 & 0x80000000) != 0)
  {
    unsigned int v79 = 0;
  }

  else
  {
    uint64_t v63 = 0LL;
    size_t v64 = v83;
    do
    {
      int v65 = (char *)&v84[7 * v18[v62]];
      uint64_t v66 = &v64[7 * v63];
      v66[3] = 0LL;
      int v67 = v66 + 3;
      *(v67 - 2) = v65;
      *((_DWORD *)v67 - 2) = v62;
      uint64_t v68 = *((void *)v61 + 2);
      uint64_t v85 = v63;
      BOOL v86 = v61;
      if (v68)
      {
        uint64_t v69 = 0LL;
        do
        {
          int v70 = *(_DWORD *)(v68 + v69);
          v69 += 4LL;
        }

        while ((v70 & 0x80000000) == 0);
        uint64_t v71 = malloc(v69 & 0x3FFFFFFFCLL);
        *int v67 = v71;
        if (!v71) {
          goto LABEL_46;
        }
        _platform_memmove();
        size_t v64 = v83;
        uint64_t v63 = v85;
        int v61 = v86;
      }

      int v72 = &v64[7 * v63];
      v72[4] = 0LL;
      int v73 = v72 + 4;
      uint64_t v74 = (__int128 *)*((void *)v61 + 6);
      if (v74)
      {
        uint64_t v75 = malloc(0x24uLL);
        *int v73 = v75;
        if (!v75) {
          goto LABEL_46;
        }
        __int128 v76 = *v74;
        __int128 v77 = v74[1];
        v75[8] = *((_DWORD *)v74 + 8);
        *(_OWORD *)uint64_t v75 = v76;
        *((_OWORD *)v75 + 1) = v77;
        size_t v64 = v83;
        uint64_t v63 = v85;
        int v61 = v86;
      }

      unsigned int v78 = v61[16];
      v61 += 16;
      uint64_t v62 = v78;
      LODWORD(v64[7 * v63++ + 5]) = *(v61 - 10);
    }

    while ((v78 & 0x80000000) == 0);
    unsigned int v79 = v63;
  }

  v83[7 * v79 + 1] = 0LL;
  *(_DWORD *)(v19 + 64) = v34;
  *(void *)(v19 + 16) = &v84[7 * v18[**((int **)v82 + 4)]];
  *(_DWORD *)(v19 + 92) = DWORD1(v92[0]);
  *(_DWORD *)(v19 + 96) = v14;
  tre_mem_destroy(v13);
  tre_stack_destroy(v11);
  free(v17);
  free(v18);
  *(_DWORD *)a1 = 62053;
  *(void *)(a1 + 24) = v19;
  int v80 = *(unsigned int **)(v19 + 56);
  if (!v80) {
    return 0LL;
  }
  uint64_t v16 = 0LL;
  do
    unsigned int v81 = __ldaxr(v80);
  while (__stlxr(v81 + 1, v80));
  return v16;
}

uint64_t tre_add_tags(unsigned int *a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v8 = tre_stack_num_objects((uint64_t)a2);
  if (a1)
  {
    *(_DWORD *)(a4 + 88) = 0;
    **(_DWORD **)(a4 + 40) = -1;
  }

  unint64_t v9 = malloc(4LL * (2 * (*(_DWORD *)(a4 + 76) + *(_DWORD *)(a4 + 72)) + 2));
  if (v9)
  {
    uint64_t v10 = v9;
    _DWORD *v9 = -1;
    uint64_t v219 = (uint64_t)a1;
    if (a1)
    {
      uint64_t v11 = (2LL * *(int *)(a4 + 104)) | 1;
      int v12 = (signed int *)malloc(4LL * ((int)v11 + *(_DWORD *)(a4 + 80)));
      if (!v12)
      {
        uint64_t v13 = 12LL;
LABEL_389:
        free(v10);
        return v13;
      }

      v205 = v12;
      v206 = &v12[v11];
      a1 = (unsigned int *)v12;
    }

    tre_stack_push_voidptr(a2, a3);
    uint64_t v13 = tre_stack_push_int(a2, 0);
    int v14 = tre_stack_num_objects((uint64_t)a2);
    BOOL v15 = (_DWORD)v13 != 0;
    int v215 = v8;
    v211 = v10;
    v212 = a1;
    uint64_t v207 = a3;
    if (v14 <= v8 || (_DWORD)v13)
    {
      int v213 = 2;
      int v208 = 0;
      signed int v217 = 0;
      LODWORD(v214) = 0;
      uint64_t v16 = (unsigned int *)v10;
      goto LABEL_277;
    }

    int v218 = 0;
    uint64_t v214 = 0LL;
    int v208 = 0;
    uint64_t v16 = (unsigned int *)v10;
    uint64_t v17 = 1LL;
    int v216 = -1;
    signed int v217 = 0;
    int v213 = 2;
    uint64_t v209 = a4;
    while (2)
    {
      char v18 = 1;
      switch(tre_stack_pop_int((uint64_t)a2))
      {
        case 0u:
          char v18 = 0;
          goto LABEL_13;
        case 1u:
LABEL_13:
          uint64_t v19 = a4;
          uint64_t v20 = tre_stack_pop_voidptr((uint64_t)a2);
          unsigned int v21 = *(_DWORD *)(v20 + 52);
          if ((v21 & 0x80000000) == 0)
          {
            uint64_t v22 = 0LL;
            do
              unsigned int v23 = v16[v22++];
            while (v23 != -1);
            v16[v22 - 1] = 2 * v21;
            v16[v22] = -1;
            v218 |= 1u;
            tre_stack_push_voidptr(a2, v20);
            uint64_t v24 = tre_stack_push_int(a2, v21);
            if ((_DWORD)v24) {
              goto LABEL_152;
            }
            uint64_t v24 = tre_stack_push_int(a2, 7u);
            if ((_DWORD)v24) {
              goto LABEL_152;
            }
          }

          break;
        case 2u:
          uint64_t v37 = tre_stack_pop_voidptr((uint64_t)a2);
          uint64_t v38 = v37;
          unsigned int v39 = *(_BYTE ***)(v37 + 40);
          if (!v39) {
            unsigned int v39 = (_BYTE **)v37;
          }
          __int128 v40 = *v39;
          int v41 = tre_stack_pop_int((uint64_t)a2);
          int v42 = v216;
          if ((v40[16] & 1) != 0) {
            int v42 = v41;
          }
          int v216 = v42;
          uint64_t v43 = *(void *)v40;
          if (!v219)
          {
            int v92 = *(_DWORD *)(v43 + 60);
            uint64_t v13 = 0LL;
            *(_DWORD *)(v38 + 60) = tre_stack_pop_int((uint64_t)a2) + v92;
            goto LABEL_104;
          }

          double v44 = *(_DWORD **)(v43 + 8);
          if ((v214 & 0x80000000) != 0) {
            goto LABEL_55;
          }
          uint64_t v45 = 0LL;
          double v46 = (unsigned __int8 *)(v44 + 10);
          while (1)
          {
            unsigned int v48 = *v46++;
            unsigned int v47 = v48;
            if (v48) {
              break;
            }
            v45 += 8LL;
            if ((v214 & 0xFFFFFFF8) + 8LL == v45)
            {
LABEL_55:
              LODWORD(v45) = -1;
              goto LABEL_56;
            }
          }

          if ((v47 & 1) == 0)
          {
            do
            {
              char v109 = v47;
              LODWORD(v45) = v45 + 1;
              v47 >>= 1;
            }

            while ((v109 & 2) == 0);
          }

LABEL_241:
              uint64_t v76 = v17;
              a4 = v209;
LABEL_242:
              int v8 = v215;
              goto LABEL_155;
            }
          }

          else
          {
            int v93 = (*v59)[7].i32[1] + v60 + v59[1][7].i32[1];
            *(_DWORD *)(v57 + 60) = v93;
            uint64_t v16 = (unsigned int *)tre_stack_pop_voidptr((uint64_t)a2);
          }

          uint64_t v13 = 0LL;
          int v213 = 1;
LABEL_104:
          uint64_t v76 = v17;
LABEL_155:
          int v111 = tre_stack_num_objects((uint64_t)a2);
          BOOL v15 = (_DWORD)v13 != 0;
          if (v111 <= v8 || (uint64_t v17 = v76, (_DWORD)v13))
          {
LABEL_277:
            if (v15)
            {
              uint64_t v10 = v211;
              v147 = v212;
              goto LABEL_388;
            }

            v147 = v212;
            int v148 = v214;
            if (v219)
            {
              if ((_DWORD)v214 != *(_DWORD *)(a4 + 80)) {
                goto LABEL_290;
              }
              unsigned int v149 = *v16;
              if (*v16 != -1)
              {
                v150 = v16 + 1;
                do
                {
                  if ((v149 & 0x80000000) == 0)
                  {
                    if ((v149 & 1) != 0) {
                      v151 = (signed int *)(*(void *)(a4 + 24) + 8LL * (v149 >> 1) + 4);
                    }
                    else {
                      v151 = (signed int *)(*(void *)(a4 + 24) + 8LL * (v149 >> 1));
                    }
                    signed int *v151 = v217;
                  }

                  unsigned int v152 = *v150++;
                  unsigned int v149 = v152;
                }

                while (v152 != -1);
              }

              *uint64_t v16 = -1;
              *(_DWORD *)(*(void *)(a4 + 32) + 4LL * (int)v214) = v213;
              if (v205 > (signed int *)&v212[2 * *(int *)(a4 + 104)])
              {
LABEL_290:
                uint64_t v13 = 2LL;
                uint64_t v10 = v211;
                goto LABEL_388;
              }

              signed int *v205 = -1;
              if ((int)v214 >= 1)
              {
                uint64_t v153 = 0LL;
                do
                {
                  v206[v153] = v153;
                  ++v153;
                }

                while (v214 != v153);
              }

              uint64_t v154 = *v212;
              if ((v154 & 0x80000000) == 0)
              {
                v155 = v212;
                do
                {
                  if ((int)v154 < (int)v214)
                  {
                    int v156 = v206[v154];
                    int v157 = v206[v155[1]];
                    if (v157 <= v156)
                    {
                      if ((int)v214 >= 1)
                      {
                        uint64_t v158 = v214;
                        v159 = v206;
                        do
                        {
                          int v160 = *v159;
                          if (*v159 > v157 && v160 < v156) {
                            int *v159 = v160 + 1;
                          }
                          ++v159;
                          --v158;
                        }

                        while (v158);
                      }

                      v206[v154] = v157 + 1;
                    }
                  }

                  unsigned int v162 = v155[2];
                  v155 += 2;
                  uint64_t v154 = v162;
                }

                while ((v162 & 0x80000000) == 0);
              }

              if ((int)v214 < 1)
              {
LABEL_314:
                free(v212);
                int v148 = v214;
                v147 = 0LL;
                goto LABEL_342;
              }

              uint64_t v163 = 0LL;
              while (v163 == v206[v163])
              {
              }
            }

            if (v212)
            {
              uint64_t v164 = *(unsigned int *)(a4 + 72);
              uint64_t v10 = v211;
              if ((int)v164 >= 1)
              {
                v165 = (int *)(*(void *)(a4 + 24) + 4LL);
                do
                {
                  int v166 = *v165;
                  *(v165 - 1) = v206[*(v165 - 1)];
                  int *v165 = v166;
                  v165 += 2;
                  --v164;
                }

                while (v164);
              }

              v167 = malloc(4LL * (int)v214);
              if (!v167) {
                goto LABEL_347;
              }
              v168 = v167;
              if ((int)v214 >= 1)
              {
                uint64_t v169 = v214;
                v170 = *(int **)(a4 + 32);
                v171 = v206;
                do
                {
                  int v173 = *v170++;
                  int v172 = v173;
                  uint64_t v174 = *v171++;
                  *((_DWORD *)v167 + v174) = v172;
                  --v169;
                }

                while (v169);
              }

              _platform_memmove();
              free(v168);
              v175 = *(unsigned int **)(a4 + 40);
              uint64_t v176 = *v175;
              if ((v176 & 0x80000000) == 0)
              {
                v177 = v175 + 1;
                do
                {
                  *(v177 - 1) = v176;
                  unsigned int v178 = *v177++;
                  uint64_t v176 = v178;
                }

                while ((v178 & 0x80000000) == 0);
              }

              uint64_t v179 = tre_stack_push_voidptr(a2, v207);
              if ((_DWORD)v179) {
                goto LABEL_346;
              }
              while ((int)tre_stack_num_objects((uint64_t)a2) > v8)
              {
                uint64_t v180 = tre_stack_pop_voidptr((uint64_t)a2);
                switch(*(_DWORD *)(v180 + 48))
                {
                  case 0:
                    if (**(_DWORD **)v180 != -3) {
                      goto LABEL_337;
                    }
                    uint64_t v13 = 0LL;
                    *(_DWORD *)(*(void *)v180 + 4LL) = v206[*(int *)(*(void *)v180 + 4LL)];
                    break;
                  case 1:
                  case 3:
                    v181 = *(uint64_t **)v180;
                    uint64_t v179 = tre_stack_push_voidptr(a2, *(void *)(*(void *)v180 + 8LL));
                    if ((_DWORD)v179) {
                      goto LABEL_346;
                    }
                    uint64_t v182 = *v181;
LABEL_339:
                    uint64_t v13 = tre_stack_push_voidptr(a2, v182);
                    break;
                  case 2:
                    uint64_t v182 = **(void **)v180;
                    goto LABEL_339;
                  default:
LABEL_337:
                    uint64_t v13 = 0LL;
                    break;
                }

                if ((_DWORD)v13) {
                  goto LABEL_388;
                }
              }

              int v148 = v214;
              if (!v219) {
                goto LABEL_387;
              }
LABEL_343:
              v183 = *(int **)(v207 + 8);
              if (!v183) {
                goto LABEL_387;
              }
              v184 = (char *)calloc(1uLL, 32LL * v183[7] + 16LL * v183[8] + 4LL * v183[9]);
              if (v184)
              {
                v185 = v184;
                uint64_t v186 = *(void *)(v207 + 8);
                uint64_t v188 = *(int *)(v186 + 28);
                uint64_t v187 = *(int *)(v186 + 32);
                tre_stack_push_voidptr(a2, v186);
                tre_stack_push_int(a2, 1u);
                uint64_t v179 = tre_stack_push_int(a2, 0);
                if ((_DWORD)v179)
                {
LABEL_346:
                  uint64_t v13 = v179;
                  goto LABEL_388;
                }

                uint64_t v210 = a4;
                v189 = &v185[32 * v188];
                v190 = &v189[16 * v187];
                v220 = v185;
                v191 = v147;
                while ((int)tre_stack_num_objects((uint64_t)a2) > v215)
                {
                  switch(tre_stack_pop_int((uint64_t)a2))
                  {
                    case 0u:
                      int v192 = tre_stack_pop_int((uint64_t)a2);
                      uint64_t v179 = tre_stack_push_voidptr(a2, v220);
                      if ((_DWORD)v179) {
                        goto LABEL_346;
                      }
                      uint64_t v13 = tre_stack_push_int(a2, 1u);
                      if (!(_DWORD)v13)
                      {
                        v220 += 32 * v192;
                        goto LABEL_381;
                      }

                      goto LABEL_388;
                    case 1u:
                      v193 = v16;
                      uint64_t v194 = tre_stack_pop_voidptr((uint64_t)a2);
                      uint64_t v195 = tre_stack_pop_voidptr((uint64_t)a2);
                      uint64_t v196 = v195;
                      *(void *)(v194 + 16) = *(void *)(v195 + 16);
                      int v197 = *(_DWORD *)(v195 + 24);
                      if (v197 < 1) {
                        goto LABEL_362;
                      }
                      *(_DWORD *)(v194 + 24) = v197;
                      *(void *)uint64_t v194 = v190;
                      unsigned int v198 = 0;
                      while (1)
                      {
                        if (((*(unsigned __int8 *)(v195 + (v198 >> 3) + 40) >> (v198 & 7)) & 1) != 0)
                        {
                          *(_DWORD *)v190 = v198;
                          v190 += 4;
                          if (v197 < 2) {
                            goto LABEL_362;
                          }
                          --v197;
                        }

                        if ((_DWORD)v214 == ++v198)
                        {
LABEL_362:
                          if (!*(void *)v195
                            || (uint64_t v199 = tre_stack_push_voidptr(a2, *(void *)v195), !(_DWORD)v199)
                            && (uint64_t v199 = tre_stack_push_voidptr(a2, v194 + 32), !(_DWORD)v199)
                            && (uint64_t v199 = tre_stack_push_int(a2, 1u), !(_DWORD)v199))
                          {
                            if (*(int *)(v196 + 16) < 1)
                            {
                              uint64_t v13 = 0LL;
                              v147 = v191;
                              uint64_t v16 = v193;
                              goto LABEL_381;
                            }

                            *(void *)(v194 + 8) = v189;
                            uint64_t v199 = tre_stack_push_voidptr(a2, *(void *)(v196 + 8));
                            if (!(_DWORD)v199)
                            {
                              uint64_t v199 = tre_stack_push_int(a2, *(_DWORD *)(v196 + 16));
                              if (!(_DWORD)v199)
                              {
                                uint64_t v16 = v193;
                                uint64_t v13 = tre_stack_push_int(a2, 2u);
                                v147 = v191;
                                goto LABEL_381;
                              }
                            }
                          }

                          goto LABEL_385;
                        }
                      }

                    case 2u:
                      int v200 = tre_stack_pop_int((uint64_t)a2);
                      uint64_t v179 = tre_stack_push_voidptr(a2, v189);
                      if ((_DWORD)v179) {
                        goto LABEL_346;
                      }
                      uint64_t v13 = tre_stack_push_int(a2, 3u);
                      if ((_DWORD)v13) {
                        goto LABEL_388;
                      }
                      v189 += 16 * v200;
                      goto LABEL_381;
                    case 3u:
                      v201 = (void *)tre_stack_pop_voidptr((uint64_t)a2);
                      uint64_t v202 = tre_stack_pop_voidptr((uint64_t)a2);
                      void *v201 = v220;
                      v201[1] = *(void *)(v202 + 16);
                      if (*(void *)v202
                        && ((uint64_t v199 = tre_stack_push_voidptr(a2, *(void *)v202), (_DWORD)v199)
                         || (uint64_t v199 = tre_stack_push_voidptr(a2, v201 + 2), (_DWORD)v199)
                         || (uint64_t v199 = tre_stack_push_int(a2, 3u), (_DWORD)v199))
                        || (uint64_t v199 = tre_stack_push_voidptr(a2, *(void *)(v202 + 8)), (_DWORD)v199))
                      {
LABEL_385:
                        uint64_t v13 = v199;
                        v147 = v191;
                        goto LABEL_388;
                      }

                      uint64_t v179 = tre_stack_push_int(a2, *(_DWORD *)(v202 + 16));
                      v147 = v191;
                      if ((_DWORD)v179) {
                        goto LABEL_346;
                      }
                      uint64_t v13 = tre_stack_push_int(a2, 0);
LABEL_381:
                      if ((_DWORD)v13) {
                        goto LABEL_388;
                      }
                      break;
                    default:
                      uint64_t v13 = 0LL;
                      goto LABEL_381;
                  }
                }

                a4 = v210;
                *(void *)(v210 + 48) = v185;
                int v148 = v214;
LABEL_387:
                uint64_t v13 = 0LL;
                *(_DWORD *)(a4 + 80) = v148;
                *(_DWORD *)(a4 + 84) = v208;
                *(_DWORD *)(a4 + 88) = v148;
LABEL_388:
                free(v147);
                goto LABEL_389;
              }

LABEL_347:
              uint64_t v13 = 12LL;
              goto LABEL_388;
            }

LABEL_342:
            uint64_t v10 = v211;
            if (!v219) {
              goto LABEL_387;
            }
            goto LABEL_343;
          }

          continue;
        case 5u:
          int v75 = tre_stack_pop_int((uint64_t)a2);
          uint64_t v76 = tre_stack_pop_int((uint64_t)a2);
          uint64_t v13 = 0LL;
          signed int v77 = v217;
          if (v75 >= 0) {
            signed int v77 = v75;
          }
          signed int v217 = v77;
          goto LABEL_155;
        case 6u:
          uint64_t v78 = tre_stack_pop_voidptr((uint64_t)a2);
          uint64_t v79 = v78;
          int v80 = *(uint64_t **)v78;
          uint64_t v81 = **(void **)v78;
          uint64_t v13 = v219;
          if (!v219)
          {
            *(_DWORD *)(v78 + 60) = *(_DWORD *)(v80[1] + 60) + *(_DWORD *)(v81 + 60);
            goto LABEL_145;
          }

          uint64_t v82 = tre_merge_branches(v219, v81, v80[1], 0, *(_DWORD *)(a4 + 80));
          if (!(_DWORD)v82) {
            uint64_t v82 = tre_merge_branches(v219, v79, *v80, 0, *(_DWORD *)(a4 + 80));
          }
          goto LABEL_93;
        case 7u:
          int v83 = tre_stack_pop_int((uint64_t)a2);
          uint64_t v84 = tre_stack_pop_voidptr((uint64_t)a2);
          uint64_t v85 = v84;
          uint64_t v86 = 0LL;
          do
            unsigned int v87 = v16[v86++];
          while (v87 != -1);
          v16[v86 - 1] = (2 * v83) | 1;
          v16[v86] = -1;
          v218 |= 2u;
          if (v216 < 0) {
            goto LABEL_144;
          }
          if (v219)
          {
            uint64_t v82 = tre_merge_branches(v219, v84, 0LL, v217, *(_DWORD *)(a4 + 80));
            if ((_DWORD)v82 || (uint64_t v82 = tre_add_tag_right(v219, v85, v217), (_DWORD)v82))
            {
LABEL_93:
              uint64_t v13 = v82;
              goto LABEL_145;
            }

            uint64_t v124 = 0LL;
            *(_DWORD *)(*(void *)(a4 + 32) + 4LL * v217) = 0;
            uint64_t v125 = *(void *)(a4 + 40);
            do
              int v126 = *(_DWORD *)(v125 + 4 * v124++);
            while ((v126 & 0x80000000) == 0);
            *(_DWORD *)(v125 + 4 * v124 - 4) = v217;
            *(_DWORD *)(v125 + 4LL * v124) = v216;
            *(_DWORD *)(v125 + 4LL * (v124 + 1)) = -1;
            signed int *v205 = v217;
            v205[1] = v216;
            ++v208;
            unsigned int v127 = *v16;
            int v94 = v214;
            if (*v16 != -1)
            {
              int v128 = v16 + 1;
              do
              {
                if ((v127 & 0x80000000) == 0)
                {
                  if ((v127 & 1) != 0) {
                    uint64_t v129 = (signed int *)(*(void *)(a4 + 24) + 8LL * (v127 >> 1) + 4);
                  }
                  else {
                    uint64_t v129 = (signed int *)(*(void *)(a4 + 24) + 8LL * (v127 >> 1));
                  }
                  *uint64_t v129 = v217;
                }

                unsigned int v130 = *v128++;
                unsigned int v127 = v130;
              }

              while (v130 != -1);
            }

            v205 += 2;
          }

          else
          {
            ++*(_DWORD *)(v84 + 60);
            int v94 = v214;
          }

          int v218 = 0;
          uint64_t v13 = 0LL;
          int v216 = -1;
          *uint64_t v16 = -1;
          uint64_t v214 = (v94 + 1);
LABEL_108:
          uint64_t v76 = (v17 + 1);
          signed int v217 = v17;
          goto LABEL_155;
        case 0xAu:
          uint64_t v88 = tre_stack_pop_voidptr((uint64_t)a2);
          int v89 = tre_stack_pop_int((uint64_t)a2);
          __int128 v90 = tre_mem_alloc_impl(v219, 0, 0LL, 1, ((*(_DWORD *)(a4 + 80) + 7) >> 3) + 40);
          if (!v90) {
            goto LABEL_96;
          }
          uint64_t v13 = 0LL;
          uint64_t v91 = *(void *)(v88 + 16);
          *(_DWORD *)(v91 + 20) = v89;
          *((_DWORD *)v90 + 7) = *(_DWORD *)(v91 + 24) + 1;
          *((void *)v90 + 4) = *(void *)(v91 + 28);
          *((void *)v90 + 1) = v91;
          *((_DWORD *)v90 + 4) = 1;
          *(void *)(v88 + 8) = v90;
          *(void *)(v88 + 16) = 0LL;
          goto LABEL_104;
        default:
          goto LABEL_144;
      }

      break;
    }

    switch(*(_DWORD *)(v20 + 48))
    {
      case 0:
        int v25 = *(int **)v20;
        int v26 = **(_DWORD **)v20;
        if ((v26 & 0x80000000) == 0 || (v26 != -4 ? (BOOL v27 = v26 == -1) : (BOOL v27 = 1), v27))
        {
          uint64_t v28 = v219;
          if (!v218)
          {
            int v218 = 0;
            goto LABEL_187;
          }
        }

        else
        {
          BOOL v135 = v26 != -2 || v218 == 0;
          uint64_t v28 = v219;
          if (v135)
          {
LABEL_187:
            uint64_t v13 = 0LL;
            goto LABEL_153;
          }
        }

        if (!v28)
        {
          *(_DWORD *)(v20 + 60) = 1;
          a4 = v19;
          int v8 = v215;
          int v34 = v214;
LABEL_204:
          int v218 = 0;
          uint64_t v13 = 0LL;
          *uint64_t v16 = -1;
          uint64_t v214 = (v34 + 1);
          goto LABEL_108;
        }

        uint64_t v24 = tre_merge_branches(v28, v20, 0LL, v217, *(_DWORD *)(v19 + 80));
        if ((_DWORD)v24 || (uint64_t v24 = tre_add_tag_left(v28, v20, v217), (_DWORD)v24))
        {
LABEL_152:
          uint64_t v13 = v24;
LABEL_153:
          uint64_t v76 = v17;
          goto LABEL_154;
        }

        a4 = v19;
        if (v218 == 1) {
          int v29 = 2;
        }
        else {
          int v29 = v213;
        }
        *(_DWORD *)(*(void *)(v19 + 32) + 4LL * v217) = v29;
        unsigned int v30 = *v16;
        int v8 = v215;
        if (*v16 != -1)
        {
          int v31 = v16 + 1;
          do
          {
            if ((v30 & 0x80000000) == 0)
            {
              if ((v30 & 1) != 0) {
                size_t v32 = (signed int *)(*(void *)(a4 + 24) + 8LL * (v30 >> 1) + 4);
              }
              else {
                size_t v32 = (signed int *)(*(void *)(a4 + 24) + 8LL * (v30 >> 1));
              }
              *size_t v32 = v217;
            }

            unsigned int v33 = *v31++;
            unsigned int v30 = v33;
          }

          while (v33 != -1);
        }

        *uint64_t v16 = -1;
        int v34 = v214;
        if (*v25 != -4) {
          goto LABEL_204;
        }
        unint64_t v35 = (signed int *)(*(void *)(a4 + 24) + 8LL * v25[1]);
        if ((v35[1] & 0x80000000) == 0)
        {
          signed int v36 = *v35;
          if (v36 < v217)
          {
            signed int *v205 = v217;
            v205[1] = v36 - (v36 > 0);
            v205 += 2;
          }

          goto LABEL_204;
        }

        uint64_t v13 = 6LL;
LABEL_145:
        uint64_t v76 = v17;
        goto LABEL_155;
      case 1:
        uint64_t v96 = **(void **)v20;
        uint64_t v95 = *(void *)(*(void *)v20 + 8LL);
        uint64_t v97 = tre_stack_push_voidptr(a2, v20);
        if ((_DWORD)v97)
        {
          uint64_t v13 = v97;
          uint64_t v76 = v17;
          goto LABEL_113;
        }

        uint64_t v110 = tre_stack_push_int(a2, 6u);
        a4 = v19;
        if ((_DWORD)v110)
        {
          uint64_t v13 = v110;
          uint64_t v76 = v17;
          goto LABEL_242;
        }

        uint64_t v54 = tre_stack_push_voidptr(a2, v95);
        int v8 = v215;
        if (!(_DWORD)v54)
        {
          uint64_t v54 = tre_stack_push_int(a2, 0);
          if (!(_DWORD)v54)
          {
            uint64_t v54 = tre_stack_push_int(a2, *(_DWORD *)(v96 + 60) + (int)v17);
            if (!(_DWORD)v54)
            {
              if (*(int *)(v96 + 60) < 1)
              {
                unsigned int v134 = -1;
              }

              else
              {
                int v133 = *(_DWORD *)(v95 + 60);
                unsigned int v134 = v133 <= 0 ? -1 : v17;
                uint64_t v17 = v133 <= 0 ? v17 : (v17 + 1);
              }

              uint64_t v54 = tre_stack_push_int(a2, v134);
              if (!(_DWORD)v54)
              {
                uint64_t v54 = tre_stack_push_int(a2, 5u);
                if (!(_DWORD)v54)
                {
                  uint64_t v54 = tre_stack_push_voidptr(a2, v96);
                  if (!(_DWORD)v54) {
                    uint64_t v54 = tre_stack_push_int(a2, 0);
                  }
                }
              }
            }
          }
        }

        goto LABEL_59;
      case 2:
        int v98 = *(uint64_t **)v20;
        if (!v219)
        {
          uint64_t v24 = tre_stack_push_int(a2, v218 != 0);
          if ((_DWORD)v24) {
            goto LABEL_152;
          }
        }

        uint64_t v24 = tre_stack_push_int(a2, v217);
        if ((_DWORD)v24) {
          goto LABEL_152;
        }
        uint64_t v24 = tre_stack_push_voidptr(a2, v20);
        if ((_DWORD)v24) {
          goto LABEL_152;
        }
        uint64_t v24 = tre_stack_push_int(a2, 2u);
        if ((_DWORD)v24) {
          goto LABEL_152;
        }
        uint64_t v24 = tre_stack_push_voidptr(a2, *v98);
        if ((_DWORD)v24) {
          goto LABEL_152;
        }
        uint64_t v24 = tre_stack_push_int(a2, 0);
        if ((_DWORD)v24) {
          goto LABEL_152;
        }
        if (!v218)
        {
          int v218 = 0;
          uint64_t v13 = 0LL;
          int v213 = 2;
          goto LABEL_153;
        }

        int v99 = v214;
        if (!v219) {
          goto LABEL_135;
        }
        uint64_t v24 = tre_merge_branches(v219, v20, 0LL, v217, *(_DWORD *)(v19 + 80));
        if (!(_DWORD)v24)
        {
          uint64_t v24 = tre_add_tag_left(v219, v20, v217);
          if (!(_DWORD)v24)
          {
            if (v218 == 1 && v217) {
              int v213 = ~(2 * *((unsigned __int8 *)v98 + 16)) & 2;
            }
            *(_DWORD *)(*(void *)(v19 + 32) + 4LL * v217) = v213;
            unsigned int v100 = *v16;
            int v99 = v214;
            if (*v16 != -1)
            {
              uint64_t v101 = v16 + 1;
              do
              {
                if ((v100 & 0x80000000) == 0)
                {
                  if ((v100 & 1) != 0) {
                    int v102 = (signed int *)(*(void *)(v19 + 24) + 8LL * (v100 >> 1) + 4);
                  }
                  else {
                    int v102 = (signed int *)(*(void *)(v19 + 24) + 8LL * (v100 >> 1));
                  }
                  *int v102 = v217;
                }

                unsigned int v103 = *v101++;
                unsigned int v100 = v103;
              }

              while (v103 != -1);
            }

LABEL_274:
          int v218 = 0;
          uint64_t v13 = 0LL;
          *uint64_t v16 = -1;
        }

LABEL_113:
        a4 = v19;
        goto LABEL_242;
      default:
        goto LABEL_187;
    }
  }

  return 12LL;
}

uint64_t tre_expand_ast(uint64_t a1, int *a2, uint64_t a3, int *a4, uint64_t a5)
{
  int v10 = tre_stack_num_objects((uint64_t)a2);
  int v51 = 0;
  uint64_t result = tre_stack_push_voidptr(a2, a3);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t result = tre_stack_push_int(a2, 0);
  if ((_DWORD)result) {
    return result;
  }
  double v44 = a4;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  uint64_t v14 = 0LL;
  int v47 = v10;
  int v48 = 0;
  while (1)
  {
    while (1)
    {
      if ((int)tre_stack_num_objects((uint64_t)a2) <= v10)
      {
        uint64_t result = 0LL;
LABEL_81:
        int v42 = *v44 + v14;
        if (v51 > v42) {
          int v42 = v51;
        }
        int *v44 = v42;
        return result;
      }

      int v15 = tre_stack_pop_int((uint64_t)a2);
      uint64_t v16 = tre_stack_pop_voidptr((uint64_t)a2);
      uint64_t v17 = v16;
      if (v15 == 1) {
        break;
      }
      if (!v15)
      {
        switch(*(_DWORD *)(v16 + 48))
        {
          case 0:
            uint64_t v28 = *(int **)v16;
            int v29 = **(_DWORD **)v16;
            if (v29 < 0 && v29 != -4) {
              continue;
            }
            int v32 = v28[2] + v12;
            v28[2] = v32;
            int v33 = v51;
            if (v32 > v51) {
              int v33 = v32;
            }
            int v51 = v33;
            goto LABEL_78;
          case 1:
          case 3:
            char v18 = *(int **)v16;
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)(*(void *)v16 + 8LL));
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)v18);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            continue;
          case 2:
            unsigned int v30 = *(int **)v16;
            uint64_t result = tre_stack_push_int(a2, v13);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_voidptr(a2, v17);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 1u);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)v30);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result) {
              goto LABEL_81;
            }
            if (v30[2] > 1 || v30[3] >= 2)
            {
              unsigned int v12 = 0;
              unsigned int v13 = 0;
              unsigned int v52 = 0;
            }

            ++v48;
            continue;
          default:
            continue;
        }
      }
    }

    uint64_t v19 = *(int **)v16;
    unsigned int v20 = tre_stack_pop_int((uint64_t)a2);
    unsigned int v21 = v20;
    unsigned int v52 = v20;
    int v22 = v19[2];
    if (!v22)
    {
      int v23 = v19[3];
      if (v23)
      {
        if (v23 >= 2)
        {
          uint64_t v24 = 0LL;
          int v22 = 0;
          int v50 = 0LL;
          goto LABEL_52;
        }
      }

      else
      {
        int v31 = tre_ast_new_literal(a1, -1, -1, -1);
        if (!v31) {
          return 12LL;
        }
        *(void *)uint64_t v17 = *(void *)v31;
        *(_DWORD *)(v17 + 48) = *((_DWORD *)v31 + 12);
      }

      goto LABEL_47;
    }

    if (v22 >= 2) {
      break;
    }
    if (v19[3] > 1)
    {
      int v50 = 0LL;
      if (v22 >= 1) {
        goto LABEL_22;
      }
      uint64_t v24 = 0LL;
LABEL_52:
      unsigned int v27 = v20;
LABEL_53:
      int v34 = v19[3];
      unsigned int v46 = v21;
      if (v34 == -1)
      {
        unsigned int v27 = v52;
        uint64_t result = tre_copy_ast(a1, a2, *(void *)v19, 0, &v52, 0LL, &v50, &v51);
        int v10 = v47;
        if ((_DWORD)result) {
          return result;
        }
        __int128 v40 = tre_ast_new_iter(a1, (uint64_t)v50, 0, -1, 0);
        int v50 = v40;
        if (!v40) {
          return 12LL;
        }
        unint64_t v35 = v40;
      }

      else
      {
        if (v22 < v34)
        {
          unint64_t v35 = 0LL;
          uint64_t v43 = a5;
          while (1)
          {
            unsigned int v27 = v52;
            uint64_t result = tre_copy_ast(a1, a2, *(void *)v19, 0, &v52, 0LL, &v49, &v51);
            if ((_DWORD)result) {
              return result;
            }
            uint64_t v36 = v14;
            uint64_t v37 = v49;
            if (v35) {
              uint64_t v37 = tre_ast_new_catenation(a1, (uint64_t)v49, (uint64_t)v35);
            }
            if (!v37) {
              return 12LL;
            }
            uint64_t v38 = tre_ast_new_literal(a1, -1, -1, -1);
            if (!v38) {
              return 12LL;
            }
            unsigned int v39 = tre_ast_new_union(a1, (uint64_t)v38, (uint64_t)v37);
            if (!v39) {
              return 12LL;
            }
            unint64_t v35 = v39;
            ++v22;
            uint64_t v14 = v36;
            a5 = v43;
            if (v22 >= v19[3]) {
              goto LABEL_68;
            }
          }
        }

        unint64_t v35 = 0LL;
LABEL_68:
        int v50 = v35;
        int v10 = v47;
      }

      if (v24)
      {
        if (v35)
        {
          unint64_t v35 = tre_ast_new_catenation(a1, (uint64_t)v24, (uint64_t)v35);
          goto LABEL_72;
        }
      }

      else
      {
LABEL_72:
        uint64_t v24 = v35;
        if (!v35) {
          return 12LL;
        }
      }

      *(void *)uint64_t v17 = *(void *)v24;
      *(_DWORD *)(v17 + 48) = *((_DWORD *)v24 + 12);
      unsigned int v21 = v46;
      goto LABEL_74;
    }

uint64_t tre_compute_nfl(uint64_t a1, int *a2, uint64_t a3)
{
  int v6 = tre_stack_num_objects((uint64_t)a2);
  uint64_t v7 = tre_stack_push_voidptr(a2, a3);
  if ((_DWORD)v7) {
    return v7;
  }
  uint64_t v7 = tre_stack_push_int(a2, 0);
  if ((_DWORD)v7) {
    return v7;
  }
  while (2)
  {
    int v8 = tre_stack_pop_int((uint64_t)a2);
    uint64_t v9 = tre_stack_pop_voidptr((uint64_t)a2);
    int v10 = (void *)v9;
    switch(v8)
    {
      case 0:
        switch(*(_DWORD *)(v9 + 48))
        {
          case 0:
            uint64_t v11 = *(int **)v9;
            int v12 = **(_DWORD **)v9;
            if (v12 != -4)
            {
              if (v12 < 0)
              {
                *(_WORD *)(v9 + 64) = 1;
                tre_set_empty(a1);
                v10[3] = v47;
                if (!v47) {
                  return 12LL;
                }
                tre_set_empty(a1);
              }

              else
              {
                *(_WORD *)(v9 + 64) = 0;
                int v44 = v11[1];
                int v45 = v11[2];
                unsigned int v46 = tre_mem_alloc_impl(a1, 0, 0LL, 1, 0x80uLL);
                if (!v46)
                {
LABEL_80:
                  v10[3] = 0LL;
                  return 12LL;
                }

                *(_DWORD *)unsigned int v46 = v45;
                *((_DWORD *)v46 + 1) = v12;
                *((_DWORD *)v46 + 2) = v44;
                *((void *)v46 + 4) = 0LL;
                *((_DWORD *)v46 + 10) = -1;
                *((void *)v46 + 8) = -1LL;
                *((_DWORD *)v46 + 18) = -1;
                v10[3] = v46;
                tre_set_one(a1, v11[2], *v11, v11[1], *((void *)v11 + 2), -1);
              }

uint64_t tre_ast_to_tnfa(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  while (1)
  {
    int v7 = a1[12];
    if (v7 != 1) {
      break;
    }
    uint64_t v11 = *(void **)a1;
    uint64_t v10 = *(void *)a1 + 8LL;
    uint64_t result = tre_make_trans(*(int **)(**(void **)a1 + 32LL), *(int **)(*(void *)v10 + 24LL), a2, a3, a4);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t result = tre_ast_to_tnfa(*v11, a2, a3, a4);
    if ((_DWORD)result) {
      return result;
    }
LABEL_11:
    a1 = *(_DWORD **)v10;
  }

  if (v7 == 2)
  {
    uint64_t v10 = *(void *)a1;
    if (*(_DWORD *)(*(void *)a1 + 12LL) == -1)
    {
      uint64_t result = tre_make_trans(*(int **)(*(void *)v10 + 32LL), *(int **)(*(void *)v10 + 24LL), a2, a3, a4);
      if ((_DWORD)result) {
        return result;
      }
    }

    goto LABEL_11;
  }

  if (v7 == 3)
  {
    uint64_t v8 = *(void *)a1;
    uint64_t result = tre_ast_to_tnfa(**(void **)a1, a2, a3, a4);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v10 = v8 + 8;
    goto LABEL_11;
  }

  return 0LL;
}

void tre_free(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1)
  {
    *(void *)(a1 + 24) = 0LL;
    if (*(_DWORD *)(v1 + 64))
    {
      uint64_t v2 = 0LL;
      unint64_t v3 = 0LL;
      do
      {
        uint64_t v4 = *(_BYTE **)v1;
        uint64_t v5 = *(void *)v1 + v2;
        if (*(void *)(v5 + 8))
        {
          int v6 = *(void **)(v5 + 24);
          if (v6)
          {
            free(v6);
            uint64_t v4 = *(_BYTE **)v1;
          }

          if ((v4[v2 + 40] & 4) != 0)
          {
            free(*(void **)&v4[v2 + 48]);
            uint64_t v4 = *(_BYTE **)v1;
          }

          int v7 = *(void **)&v4[v2 + 32];
          if (v7) {
            free(v7);
          }
        }

        ++v3;
        v2 += 56LL;
      }

      while (v3 < *(unsigned int *)(v1 + 64));
    }

    if (*(void *)v1) {
      free(*(void **)v1);
    }
    uint64_t v8 = *(void ***)(v1 + 8);
    if (v8)
    {
      if (v8[1])
      {
        uint64_t v9 = v8 + 4;
        do
        {
          uint64_t v10 = *(v9 - 1);
          if (v10) {
            free(v10);
          }
          if (*v9) {
            free(*v9);
          }
          uint64_t v11 = v9[4];
          v9 += 7;
        }

        while (v11);
        uint64_t v8 = *(void ***)(v1 + 8);
      }

      free(v8);
    }

    int v12 = *(void **)(v1 + 24);
    if (v12) {
      free(v12);
    }
    int v13 = *(void **)(v1 + 32);
    if (v13) {
      free(v13);
    }
    uint64_t v14 = *(void **)(v1 + 40);
    if (v14) {
      free(v14);
    }
    uint64_t v15 = *(void *)(v1 + 56);
    if (v15)
    {
      do
      {
        unsigned int v16 = __ldaxr((unsigned int *)v15);
        unsigned int v17 = v16 - 1;
      }

      while (__stlxr(v17, (unsigned int *)v15));
      if (!v17)
      {
        char v18 = *(void (**)(void))(v15 + 8);
        if (v18) {
          v18();
        }
      }
    }

    uint64_t v19 = *(void **)(v1 + 48);
    if (v19) {
      free(v19);
    }
    free((void *)v1);
  }

uint64_t tre_merge_branches(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v8 = *(char **)(a2 + 8);
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 8);
    if (!v8)
    {
      uint64_t v8 = *(char **)(a3 + 8);
      goto LABEL_18;
    }

    if (!v9) {
      goto LABEL_18;
    }
    if (a5 >= 1)
    {
      uint64_t v10 = (char *)(v9 + 40);
      uint64_t v11 = v8 + 40;
      unsigned int v12 = ((a5 + 7) >> 3) + 1;
      do
      {
        char v13 = *v10++;
        *v11++ |= v13;
        --v12;
      }

      while (v12 > 1);
    }

    *((_DWORD *)v8 + 6) += *(_DWORD *)(v9 + 24);
    *((_DWORD *)v8 + 9) += *(_DWORD *)(v9 + 36);
    uint64_t v14 = (void *)*((void *)v8 + 1);
    uint64_t v15 = *(void *)(v9 + 8);
    if (v14)
    {
      if (!v15) {
        goto LABEL_18;
      }
      do
      {
        unsigned int v16 = v14;
        uint64_t v14 = (void *)*v14;
      }

      while (v14);
      *unsigned int v16 = v15;
      *((_DWORD *)v8 + 4) += *(_DWORD *)(v9 + 16);
      int32x2_t v17 = vadd_s32(*(int32x2_t *)(v8 + 28), *(int32x2_t *)(v9 + 28));
    }

    else
    {
      if (!v15) {
        goto LABEL_18;
      }
      *((void *)v8 + 1) = v15;
      *((_DWORD *)v8 + 4) = *(_DWORD *)(v9 + 16);
      int32x2_t v17 = *(int32x2_t *)(v9 + 28);
    }

    *(int32x2_t *)(v8 + 28) = v17;
  }

  else if (!v8)
  {
    if (a4) {
      goto LABEL_20;
    }
    uint64_t v8 = 0LL;
    goto LABEL_24;
  }

uint64_t tre_add_tag_right(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = tre_mem_alloc_impl(a1, 0, 0LL, 0, 0x10uLL);
  if (!v6) {
    return 12LL;
  }
  int v7 = v6;
  uint64_t v8 = tre_ast_new_literal(a1, -3, a3, -1);
  v7[1] = v8;
  if (!v8) {
    return 12LL;
  }
  uint64_t v9 = tre_mem_alloc_impl(a1, 0, 0LL, 1, 0x48uLL);
  *int v7 = v9;
  if (!v9) {
    return 12LL;
  }
  uint64_t v10 = v9;
  uint64_t result = 0LL;
  int v12 = *(_DWORD *)(a2 + 48);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a2;
  *((_WORD *)v10 + 32) = -1;
  *((_DWORD *)v10 + 12) = v12;
  *((_DWORD *)v10 + 13) = -1;
  *(void *)a2 = v7;
  *(_DWORD *)(a2 + 48) = 1;
  *(void *)(a2 + 40) = v10;
  return result;
}

uint64_t tre_add_tag_left(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = tre_mem_alloc_impl(a1, 0, 0LL, 0, 0x10uLL);
  if (!v6) {
    return 12LL;
  }
  int v7 = v6;
  uint64_t v8 = tre_ast_new_literal(a1, -3, a3, -1);
  *int v7 = v8;
  if (!v8) {
    return 12LL;
  }
  uint64_t v9 = tre_mem_alloc_impl(a1, 0, 0LL, 1, 0x48uLL);
  v7[1] = v9;
  if (!v9) {
    return 12LL;
  }
  uint64_t v10 = v9;
  uint64_t result = 0LL;
  int v12 = *(_DWORD *)(a2 + 48);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a2;
  *((_WORD *)v10 + 32) = -1;
  *((_DWORD *)v10 + 12) = v12;
  *((_DWORD *)v10 + 13) = -1;
  *(void *)a2 = v7;
  *(_DWORD *)(a2 + 48) = 1;
  *(void *)(a2 + 40) = v10;
  return result;
}

uint64_t tre_copy_ast(uint64_t a1, int *a2, uint64_t a3, char a4, _DWORD *a5, uint64_t a6, void *a7, int *a8)
{
  int v16 = tre_stack_num_objects((uint64_t)a2);
  tre_stack_push_voidptr(a2, a3);
  uint64_t result = tre_stack_push_int(a2, 0);
  if ((_DWORD)result)
  {
    int v18 = 0;
  }

  else
  {
    unsigned int v39 = a8;
    uint64_t v37 = a6;
    int v18 = 0;
    int v38 = 1;
    while ((int)tre_stack_num_objects((uint64_t)a2) > v16)
    {
      int v19 = tre_stack_pop_int((uint64_t)a2);
      if (v19)
      {
        if (v19 == 1) {
          a7 = (void *)tre_stack_pop_voidptr((uint64_t)a2);
        }
LABEL_9:
        uint64_t result = 0LL;
      }

      else
      {
        uint64_t v20 = (int **)tre_stack_pop_voidptr((uint64_t)a2);
        switch(*((_DWORD *)v20 + 12))
        {
          case 0:
            uint64_t v21 = *v20;
            int v22 = (*v20)[1];
            int v23 = (*v20)[2];
            int v24 = **v20;
            if ((v24 & 0x80000000) == 0)
            {
              uint64_t v25 = *((void *)v21 + 2);
LABEL_33:
              v23 += *a5;
              ++v18;
              goto LABEL_34;
            }

            if (v24 == -4)
            {
              uint64_t v25 = 0LL;
              goto LABEL_33;
            }

            if ((a4 & 1) != 0 && v24 == -3)
            {
              uint64_t v25 = 0LL;
              int v23 = -1;
              int v24 = -1;
              int v22 = -1;
            }

            else if (v24 == -3)
            {
              uint64_t v25 = 0LL;
              if ((a4 & 2) != 0 && v38)
              {
                uint64_t v25 = 0LL;
                int v38 = 0;
                if (*(_DWORD *)(v37 + 4LL * v22) == 2) {
                  *(_DWORD *)(v37 + 4LL * v22) = 1;
                }
                int v24 = -3;
              }
            }

            else
            {
              uint64_t v25 = 0LL;
            }

LABEL_3:
  *a5 += v18;
  return result;
}

double tre_set_one(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  uint64_t v11 = tre_mem_alloc_impl(a1, 0, 0LL, 1, 0x80uLL);
  if (v11)
  {
    *(_DWORD *)uint64_t v11 = a2;
    *((_DWORD *)v11 + 1) = a3;
    *((_DWORD *)v11 + 2) = a4;
    *((void *)v11 + 4) = a5;
    *((_DWORD *)v11 + 10) = a6;
    double result = NAN;
    *((void *)v11 + 8) = -1LL;
    *((_DWORD *)v11 + 18) = -1;
  }

  return result;
}

double tre_set_empty(uint64_t a1)
{
  uint64_t v1 = tre_mem_alloc_impl(a1, 0, 0LL, 1, 0x40uLL);
  if (v1)
  {
    double result = NAN;
    *(void *)uint64_t v1 = -1LL;
    *((_DWORD *)v1 + 2) = -1;
  }

  return result;
}

char *tre_set_union(uint64_t a1, int *a2, int *a3, unint64_t a4, int a5, char *a6)
{
  if (a4)
  {
    unsigned int v10 = -1;
    uint64_t v11 = (int *)a4;
    do
    {
      int v12 = *v11++;
      ++v10;
    }

    while ((v12 & 0x80000000) == 0);
  }

  else
  {
    unsigned int v10 = 0;
  }

  uint64_t v13 = 0LL;
  do
  {
    int v14 = a2[v13];
    v13 += 16LL;
  }

  while ((v14 & 0x80000000) == 0);
  uint64_t v15 = v13 * 4 - 64;
  int v16 = a3;
  do
  {
    int v17 = *v16;
    v16 += 16;
    v15 += 64LL;
  }

  while ((v17 & 0x80000000) == 0);
  int v18 = tre_mem_alloc_impl(a1, 0, 0LL, 1, v15 & 0x3FFFFFFFC0LL);
  if (v18)
  {
    int v19 = *a2;
    if ((*a2 & 0x80000000) == 0)
    {
      uint64_t v20 = 0LL;
      int v69 = a5;
      while (1)
      {
        uint64_t v21 = &a2[16 * v20];
        unint64_t v24 = *((void *)v21 + 2);
        int v23 = v21 + 4;
        int v22 = (int *)v24;
        uint64_t v25 = &v18[64 * v20];
        *(_DWORD *)uint64_t v25 = v19;
        *(void *)(v25 + 4) = *(void *)(v23 - 3);
        *((_DWORD *)v25 + 6) = v23[2] | a5;
        *((void *)v25 + 4) = *((void *)v23 + 2);
        *((_DWORD *)v25 + 10) = v23[6];
        if (a4 | v24)
        {
          if (v22)
          {
            unsigned int v27 = -1;
            do
            {
              int v28 = *v22++;
              ++v27;
            }

            while ((v28 & 0x80000000) == 0);
          }

          else
          {
            unsigned int v27 = 0;
          }

          char v26 = tre_mem_alloc_impl(a1, 0, 0LL, 0, 4LL * (v10 + 1 + v27));
          if (!v26) {
            return 0LL;
          }
          if (v27)
          {
            int v29 = *(int **)v23;
            uint64_t v30 = v27;
            uint64_t v31 = v26;
            do
            {
              int v32 = *v29++;
              *(_DWORD *)uint64_t v31 = v32;
              v31 += 4;
              --v30;
            }

            while (v30);
          }

          if (v10)
          {
            int v33 = &v26[4 * v27];
            uint64_t v34 = v10;
            unint64_t v35 = (int *)a4;
            do
            {
              int v36 = *v35++;
              *(_DWORD *)int v33 = v36;
              v33 += 4;
              --v34;
            }

            while (v34);
          }

          *(_DWORD *)&v26[4 * v10 + 4 * v27] = -1;
          a5 = v69;
        }

        else
        {
          char v26 = 0LL;
        }

        *((void *)v25 + 2) = v26;
        uint64_t v37 = *(void *)&a2[16 * v20 + 12];
        if (v37) {
          *(void *)&v18[64 * v20 + 48] = v37;
        }
        if (a6)
        {
          int v38 = &v18[64 * v20];
          uint64_t v40 = *((void *)v38 + 6);
          unsigned int v39 = (char **)(v38 + 48);
          if (v40)
          {
            unsigned int v41 = tre_mem_alloc_impl(a1, 0, 0LL, 0, 0x24uLL);
            *unsigned int v39 = v41;
            if (!v41) {
              return 0LL;
            }
            for (uint64_t i = 0LL; i != 36; i += 4LL)
            {
              int v43 = *(_DWORD *)&a6[i];
              if (v43 != -1) {
                *(_DWORD *)&v41[i] = v43;
              }
            }
          }

          else
          {
            *unsigned int v39 = a6;
          }
        }

        int v19 = a2[16 * ++v20];
        if (v19 < 0) {
          goto LABEL_42;
        }
      }
    }

    LODWORD(v20) = 0;
LABEL_42:
    int v44 = a3;
    int v45 = *a3;
    if (*a3 < 0)
    {
      LODWORD(v46) = 0;
    }

    else
    {
      uint64_t v46 = 0LL;
      do
      {
        uint64_t v47 = v46 + v20;
        int v48 = &v18[64 * v47];
        *(_DWORD *)int v48 = v45;
        int v49 = &v44[16 * v46];
        uint64_t v50 = *((void *)v49 + 2);
        *(void *)(v48 + 4) = *(void *)(v49 + 1);
        *((_DWORD *)v48 + 6) = v49[6];
        *((void *)v48 + 4) = *((void *)v49 + 4);
        *((_DWORD *)v48 + 10) = v49[10];
        if (v50)
        {
          uint64_t v51 = 0LL;
          uint64_t v52 = 0LL;
          uint64_t v53 = -1LL;
          do
          {
            uint64_t v54 = v51;
            int v55 = *(_DWORD *)(v50 + v52);
            ++v53;
            v52 += 4LL;
            ++v51;
          }

          while ((v55 & 0x80000000) == 0);
          uint64_t v56 = tre_mem_alloc_impl(a1, 0, 0LL, 0, v52 & 0x3FFFFFFFCLL);
          if (!v56) {
            return 0LL;
          }
          if (v53)
          {
            uint64_t v57 = (int *)*((void *)v49 + 2);
            int v58 = v56;
            do
            {
              int v59 = *v57++;
              *(_DWORD *)int v58 = v59;
              v58 += 4;
              --v54;
            }

            while (v54);
            uint64_t v60 = v53;
          }

          else
          {
            uint64_t v60 = 0LL;
          }

          int v44 = a3;
          *(_DWORD *)&v56[4 * v60] = -1;
        }

        else
        {
          uint64_t v56 = 0LL;
        }

        *((void *)v48 + 2) = v56;
        uint64_t v61 = *((void *)v49 + 6);
        if (v61) {
          *(void *)&v18[64 * v47 + 48] = v61;
        }
        if (a6)
        {
          uint64_t v62 = &v18[64 * v47];
          uint64_t v64 = *((void *)v62 + 6);
          int32x2_t v63 = (char **)(v62 + 48);
          if (v64)
          {
            int v65 = tre_mem_alloc_impl(a1, 0, 0LL, 0, 0x24uLL);
            char *v63 = v65;
            if (!v65) {
              return 0LL;
            }
            for (uint64_t j = 0LL; j != 36; j += 4LL)
            {
              int v67 = *(_DWORD *)&a6[j];
              if (v67 != -1) {
                *(_DWORD *)&v65[j] = v67;
              }
            }
          }

          else
          {
            char *v63 = a6;
          }
        }

        int v45 = v44[16 * ++v46];
      }

      while ((v45 & 0x80000000) == 0);
    }

    *(_DWORD *)&v18[64 * (unint64_t)(v46 + v20)] = -1;
  }

  return v18;
}

uint64_t tre_match_empty(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4, uint64_t a5, _DWORD *a6, _DWORD *a7)
{
  int v14 = tre_stack_num_objects(a1);
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  uint64_t result = tre_stack_push_voidptr(a1, a2);
  if (!(_DWORD)result)
  {
    while ((int)tre_stack_num_objects(a1) > v14)
    {
      int v16 = (int **)tre_stack_pop_voidptr(a1);
      switch(*((_DWORD *)v16 + 12))
      {
        case 0:
          int v17 = *v16;
          int v18 = **v16;
          switch(v18)
          {
            case -5:
              if (a5)
              {
                for (uint64_t i = 0LL; i != 36; i += 4LL)
                  *(_DWORD *)(a5 + i) = *(_DWORD *)(*((void *)v17 + 2) + i);
              }

              if (a7) {
                *a7 = 1;
              }
              break;
            case -2:
              if (a4) {
                *a4 |= v17[1];
              }
              break;
            case -3:
              int v19 = v17[1];
              if ((v19 & 0x80000000) == 0)
              {
                if (a3)
                {
                  int v20 = *a3;
                  if (*a3 < 0)
                  {
                    uint64_t v22 = 0LL;
LABEL_34:
                    a3[v22] = v19;
                    a3[(v22 + 1)] = -1;
                  }

                  else
                  {
                    uint64_t v21 = 0LL;
                    while (v20 != v19)
                    {
                      uint64_t v22 = v21 + 1;
                      int v20 = a3[++v21];
                      if (v20 < 0) {
                        goto LABEL_34;
                      }
                    }
                  }
                }

                if (a6) {
                  ++*a6;
                }
                continue;
              }

              break;
          }

          break;
        case 1:
          int v23 = *v16;
          uint64_t result = tre_stack_push_voidptr(a1, *(void *)*v16);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v24 = *((void *)v23 + 1);
          goto LABEL_24;
        case 2:
          uint64_t v24 = *(void *)*v16;
          goto LABEL_23;
        case 3:
          uint64_t v24 = *(void *)*v16;
          if (*(_WORD *)(v24 + 64)) {
            goto LABEL_24;
          }
          uint64_t v24 = *((void *)*v16 + 1);
LABEL_23:
          if (!*(_WORD *)(v24 + 64)) {
            continue;
          }
LABEL_24:
          uint64_t result = tre_stack_push_voidptr(a1, v24);
          if ((_DWORD)result) {
            return result;
          }
          continue;
        default:
          continue;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t tre_make_trans(int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = a1;
  int v7 = *a1;
  if (!a3)
  {
    if ((v7 & 0x80000000) == 0)
    {
      do
      {
        if ((*a2 & 0x80000000) == 0)
        {
          int v48 = a2 + 16;
          do
          {
            ++*(_DWORD *)(a4 + 4LL * *v6);
            int v49 = *v48;
            v48 += 16;
          }

          while ((v49 & 0x80000000) == 0);
        }

        int v50 = v6[16];
        v6 += 16;
      }

      while ((v50 & 0x80000000) == 0);
    }

    return 0LL;
  }

  if (v7 < 0) {
    return 0LL;
  }
  uint64_t v52 = a3 - 56;
  while (1)
  {
    int v10 = *a2;
    if ((*a2 & 0x80000000) == 0) {
      break;
    }
LABEL_65:
    int v47 = v6[16];
    v6 += 16;
    if (v47 < 0) {
      return 0LL;
    }
  }

  int v11 = -1;
  int v12 = a2;
  while (1)
  {
    int v13 = v11;
    v12 += 16;
    int v11 = v10;
    while (v11 == v13)
    {
      int v14 = *v12;
      v12 += 16;
      int v11 = v14;
      if (v14 < 0) {
        goto LABEL_65;
      }
    }

    uint64_t v15 = v52 + 56LL * *(int *)(a5 + 4LL * *v6);
    do
    {
      uint64_t v16 = *(void *)(v15 + 64);
      v15 += 56LL;
    }

    while (v16);
    *(void *)(v15 + 64) = 0LL;
    *(void *)uint64_t v15 = *(void *)(v6 + 1);
    *(void *)(v15 + 8) = a3 + 56LL * *(int *)(a5 + 4LL * v11);
    *(_DWORD *)(v15 + 16) = v11;
    int v17 = (int *)*((void *)v6 + 4);
    int v18 = *(v12 - 10) | v6[6] | (4 * (v17 != 0LL));
    *(_DWORD *)(v15 + 40) = v18;
    int v19 = v6[10];
    if ((v19 & 0x80000000) == 0)
    {
      *(_DWORD *)(v15 + 48) = v19;
      *(_DWORD *)(v15 + 40) = v18 | 0x80;
      int v17 = (int *)*((void *)v6 + 4);
    }

    if (v17)
    {
      int v20 = malloc(8LL * *v17 + 8);
      *(void *)(v15 + 48) = v20;
      if (!v20) {
        return 12LL;
      }
      _platform_memmove();
    }

    uint64_t v21 = (int *)*((void *)v6 + 2);
    if (v21)
    {
      int v22 = -1;
      do
      {
        int v23 = *v21++;
        ++v22;
      }

      while ((v23 & 0x80000000) == 0);
    }

    else
    {
      int v22 = 0;
    }

    uint64_t v24 = (int *)*((void *)v12 - 6);
    if (v24)
    {
      int v25 = -1;
      do
      {
        int v26 = *v24++;
        ++v25;
      }

      while ((v26 & 0x80000000) == 0);
    }

    else
    {
      int v25 = 0;
    }

    unsigned int v27 = *(void **)(v15 + 24);
    if (v27) {
      free(v27);
    }
    *(void *)(v15 + 24) = 0LL;
    if (v25 + v22)
    {
      int v28 = (int *)malloc(4LL * (v25 + v22 + 1));
      *(void *)(v15 + 24) = v28;
      if (!v28) {
        return 12LL;
      }
      int v29 = (int *)*((void *)v6 + 2);
      if (!v29 || (int v30 = *v29, *v29 < 0))
      {
        LODWORD(v31) = 0;
      }

      else
      {
        uint64_t v31 = 0LL;
        int v32 = v29 + 1;
        do
        {
          v28[v31] = v30;
          int v30 = v32[v31++];
        }

        while ((v30 & 0x80000000) == 0);
      }

      int v33 = (int *)*((void *)v12 - 6);
      if (!v33 || (int v34 = *v33, *v33 < 0))
      {
        int v36 = v31;
      }

      else
      {
        uint64_t v35 = 0LL;
        int v36 = v31;
        do
        {
          uint64_t v37 = v31;
          int v38 = v28;
          if ((_DWORD)v31)
          {
            while (1)
            {
              int v39 = *v38++;
              if (v39 == v34) {
                break;
              }
              if (!--v37) {
                goto LABEL_43;
              }
            }
          }

          else
          {
LABEL_43:
            v28[v36++] = v34;
          }

          int v34 = v33[++v35];
        }

        while ((v34 & 0x80000000) == 0);
      }

      v28[v36] = -1;
    }

    uint64_t v40 = *((void *)v6 + 6);
    if (!v40 && !*((void *)v12 - 2))
    {
      uint64_t v46 = *(void **)(v15 + 32);
      if (v46) {
        free(v46);
      }
      *(void *)(v15 + 32) = 0LL;
      goto LABEL_60;
    }

    unsigned int v41 = *(char **)(v15 + 32);
    if (!v41)
    {
      unsigned int v41 = (char *)malloc(0x24uLL);
      *(void *)(v15 + 32) = v41;
      if (!v41) {
        return 12LL;
      }
    }

    uint64_t v42 = 0LL;
    uint64_t v43 = *((void *)v12 - 2);
    do
    {
      *(_DWORD *)&v41[v42] = -1;
      if (v40)
      {
        int v44 = *(_DWORD *)(v40 + v42);
        if (v44 != -1) {
          *(_DWORD *)&v41[v42] = v44;
        }
      }

      if (v43)
      {
        int v45 = *(_DWORD *)(v43 + v42);
        if (v45 != -1) {
          *(_DWORD *)&v41[v42] = v45;
        }
      }

      v42 += 4LL;
    }

    while (v42 != 36);
LABEL_60:
    int v10 = *v12;
    if (*v12 < 0) {
      goto LABEL_65;
    }
  }

uint64_t tre_tnfa_run_backtrack( _DWORD *a1, __darwin_ct_rune_t *a2, int a3, int a4, uint64_t a5, char a6, unsigned int *a7)
{
  __darwin_ct_rune_t v359 = 0;
  unsigned int v10 = a1[24];
  int v11 = (uint64_t *)tre_mem_new_impl(0, 0LL);
  uint64_t v12 = (int)a1[20];
  memset(&v364, 0, sizeof(v364));
  if (!v11) {
    return 12LL;
  }
  int v13 = v11;
  int v14 = tre_mem_alloc_impl((uint64_t)v11, 0, 0LL, 0, 0xC0uLL);
  if (!v14)
  {
    tre_mem_destroy(v13);
    return 12LL;
  }

  *((void *)v14 + 22) = 0LL;
  *((void *)v14 + 23) = 0LL;
  v323 = v14;
  uint64_t v15 = a1;
  int v16 = a1[18];
  uint64_t v347 = (uint64_t)v15;
  uint64_t v17 = 4 * (int)v12;
  int v18 = malloc((v17 * 4 + 16 * v16 + 4 * v15[23] + 14));
  if (!v18) {
    return 12LL;
  }
  int v19 = v18;
  v332 = v13;
  v292 = a7;
  unsigned int v350 = 0;
  int v337 = a6 & 2;
  uint64_t v20 = 16 * v12;
  uint64_t v21 = (char *)&v18[v17];
  uint64_t v22 = 8 - ((unint64_t)&v18[v17] & 7);
  v326 = &v21[v22];
  uint64_t v23 = (uint64_t)&v21[16 * v16 + v22];
  uint64_t v24 = 8 - (v23 & 7);
  if ((v23 & 7) == 0) {
    uint64_t v24 = 0LL;
  }
  v331 = (_DWORD *)(v23 + v24);
  v327 = v18;
  v293 = v18 + 2;
  v294 = (int *)(a5 + 8);
  unsigned int v339 = -1;
  uint64_t v25 = 1LL;
  int v26 = -1;
  v333 = a2;
  LODWORD(v349) = 1;
  v334 = (char *)a2;
  uint64_t v338 = a5;
  int v27 = a3;
  uint64_t v28 = v347;
  size_t v355 = v20;
  int v29 = v323;
  unsigned int v301 = v10;
LABEL_9:
  _platform_bzero();
  if (a5) {
    _platform_bzero();
  }
  if (!a4)
  {
    int v34 = v26 + 1;
    int v348 = v34;
    if (v27 < 0 || v34 < v27)
    {
      __darwin_ct_rune_t v33 = *v333++;
      goto LABEL_29;
    }

LABEL_168:
          if (v91 <= 0x7F)
          {
            int v99 = &_DefaultRuneLocale;
            goto LABEL_177;
          }

          unsigned int v100 = *(_xlocale **)(v347 + 56);
          if (v91 < 0x100)
          {
            int v102 = &__global_locale;
            if (v100 != (_xlocale *)-1LL) {
              int v102 = *(void **)(v347 + 56);
            }
            if (!v100) {
              int v102 = &__c_locale;
            }
            int v99 = *(_RuneLocale **)(v102[166] + 120LL);
LABEL_177:
            __uint32_t v101 = v99->__runetype[v91];
          }

          else
          {
            LOWORD(v101) = ___runetype_l(v91, v100);
            BOOL v43 = v356;
          }

          char v103 = v92 ^ ((v101 & 0x500) != 0);
          uint64_t v28 = v347;
          if ((v103 & 1) != 0) {
            goto LABEL_141;
          }
          goto LABEL_126;
        }

        if (v359 != 95)
        {
          BOOL v92 = 1;
          goto LABEL_168;
        }
      }

LABEL_126:
      if (v41)
      {
        if (*((void *)v29 + 23))
        {
          int v29 = (char *)*((void *)v29 + 23);
        }

        else
        {
          int v75 = tre_mem_alloc_impl((uint64_t)v332, 0, 0LL, 0, 0xC0uLL);
          if (!v75)
          {
            v289 = v332;
LABEL_625:
            tre_mem_destroy(v289);
            v287 = v19;
            goto LABEL_626;
          }

          uint64_t v76 = v75;
          *((void *)v75 + 22) = v29;
          *((void *)v75 + 23) = 0LL;
          signed int v77 = tre_mem_alloc_impl((uint64_t)v332, 0, 0LL, 0, v355);
          *((void *)v76 + 5) = v77;
          if (!v77)
          {
            v289 = v332;
            goto LABEL_625;
          }

          *((void *)v29 + 23) = v76;
          int v29 = v76;
          uint64_t v28 = v347;
          unsigned int v44 = v350;
        }

        *(_DWORD *)int v29 = v348;
        *((_DWORD *)v29 + 1) = v349;
        *((void *)v29 + 1) = v334;
        *((void *)v29 + 2) = v333;
        *((void *)v29 + 3) = *v39;
        __darwin_ct_rune_t v78 = v359;
        *((_DWORD *)v29 + 8) = *(_DWORD *)(v37 + 16);
        *((_DWORD *)v29 + 9) = v78;
        _platform_memmove();
        __int128 v79 = *((_OWORD *)&v364._mbstateL + 3);
        *((_OWORD *)v29 + 5) = *((_OWORD *)&v364._mbstateL + 2);
        *((_OWORD *)v29 + 6) = v79;
        __int128 v80 = *((_OWORD *)&v364._mbstateL + 1);
        *((_OWORD *)v29 + 3) = *(_OWORD *)v364.__mbstate8;
        *((_OWORD *)v29 + 4) = v80;
        __int128 v81 = *((_OWORD *)&v364._mbstateL + 7);
        *((_OWORD *)v29 + 9) = *((_OWORD *)&v364._mbstateL + 6);
        *((_OWORD *)v29 + 10) = v81;
        __int128 v82 = *((_OWORD *)&v364._mbstateL + 5);
        *((_OWORD *)v29 + 7) = *((_OWORD *)&v364._mbstateL + 4);
        *((_OWORD *)v29 + 8) = v82;
        int v83 = *(unsigned int **)(v37 + 24);
        if (v83)
        {
          uint64_t v84 = *v83;
          if ((v84 & 0x80000000) == 0)
          {
            uint64_t v85 = *((void *)v29 + 5);
            uint64_t v86 = v83 + 1;
            do
            {
              int v87 = *(_DWORD *)(v85 + 16 * v84);
              *(_DWORD *)(v85 + 16 * v84) = v87 + 1;
              if (!v87) {
                *(_DWORD *)(v85 + 16 * v84 + 4) = v348;
              }
              uint64_t v88 = v85 + 16 * v84;
              *(_DWORD *)(v88 + 8) = v348;
              *(_DWORD *)(v88 + 12) = v25;
              unsigned int v89 = *v86++;
              uint64_t v84 = v89;
            }

            while ((v89 & 0x80000000) == 0);
          }

          uint64_t v25 = (v25 + 1);
        }

        BOOL v43 = v356;
      }

      else
      {
        uint64_t v41 = *v39;
        uint64_t v40 = *(unsigned int **)(v37 + 24);
      }

LABEL_141:
      uint64_t v90 = *(void *)(v37 + 64);
      int v39 = (void *)(v37 + 64);
      v37 += 56LL;
      if (!v90)
      {
        uint64_t v104 = v338;
        if (v40)
        {
          uint64_t v105 = *v40;
          int v26 = v348;
          if ((v105 & 0x80000000) != 0)
          {
            int v27 = a3;
            uint64_t v38 = v340;
          }

          else
          {
            int v27 = a3;
            uint64_t v38 = v340;
            do
            {
              int v106 = v19[4 * v105];
              v19[4 * v105] = v106 + 1;
              if (!v106) {
                v19[4 * v105 + 1] = v348;
              }
              char v107 = &v19[4 * v105];
              v107[2] = v348;
              v107[3] = v25;
              unsigned int v108 = v40[1];
              ++v40;
              uint64_t v105 = v108;
            }

            while ((v108 & 0x80000000) == 0);
          }

          uint64_t v25 = (v25 + 1);
        }

        else
        {
          int v27 = a3;
          int v26 = v348;
          uint64_t v38 = v340;
        }

        goto LABEL_191;
      }
    }

    if (v359 > 0x7F)
    {
      int v67 = *(_xlocale **)(v28 + 56);
      if (v359 >= 0x100)
      {
        LOWORD(v68) = ___runetype_l(v359, v67);
        BOOL v43 = v356;
        goto LABEL_158;
      }

      uint64_t v96 = &__global_locale;
      if (v67 != (_xlocale *)-1LL) {
        uint64_t v96 = *(void **)(v28 + 56);
      }
      if (!v67) {
        uint64_t v96 = &__c_locale;
      }
      int v59 = *(_RuneLocale **)(v96[166] + 120LL);
    }

    else
    {
      int v59 = &_DefaultRuneLocale;
    }

    __uint32_t v68 = v59->__runetype[v359];
LABEL_158:
    if ((v68 & 0x500) == 0) {
      goto LABEL_141;
    }
    goto LABEL_54;
  }

  uint64_t v41 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v104 = v338;
  int v26 = v348;
LABEL_191:
  v346 = v333;
  signed int v109 = v26;
  uint64_t v110 = v334;
  if (v41) {
    goto LABEL_202;
  }
  while (1)
  {
    while (1)
    {
LABEL_600:
      if (!*((void *)v29 + 22))
      {
        unsigned int v10 = v301;
        if ((v339 & 0x80000000) == 0) {
          goto LABEL_629;
        }
        if (v109 == v26)
        {
          if (v27 < 0)
          {
            if (!v359)
            {
LABEL_629:
              uint64_t v288 = v339 >> 31;
              unsigned int *v292 = v339;
              goto LABEL_630;
            }
          }

          else if (v26 >= v27)
          {
            goto LABEL_629;
          }
        }

        __darwin_ct_rune_t v359 = v304;
        mbstate_t v364 = v363;
        unsigned int v350 = v304;
        a5 = v104;
        goto LABEL_9;
      }

      uint64_t v277 = v104;
      uint64_t v41 = *((void *)v29 + 3);
      if ((*(_BYTE *)(v41 + 40) & 0x80) != 0) {
        v331[*((int *)v29 + 8)] = 0;
      }
      signed int v109 = *(_DWORD *)v29;
      LODWORD(v349) = *((_DWORD *)v29 + 1);
      v278 = (const char *)*((void *)v29 + 1);
      v346 = (__darwin_ct_rune_t *)*((void *)v29 + 2);
      __darwin_ct_rune_t v359 = *((_DWORD *)v29 + 9);
      _platform_memmove();
      uint64_t v110 = v278;
      __int128 v279 = *((_OWORD *)v29 + 3);
      __int128 v280 = *((_OWORD *)v29 + 6);
      __int128 v281 = *((_OWORD *)v29 + 8);
      __int128 v282 = *((_OWORD *)v29 + 9);
      *((_OWORD *)&v364._mbstateL + 4) = *((_OWORD *)v29 + 7);
      *((_OWORD *)&v364._mbstateL + 5) = v281;
      __int128 v283 = *((_OWORD *)v29 + 10);
      *((_OWORD *)&v364._mbstateL + 6) = v282;
      *((_OWORD *)&v364._mbstateL + 7) = v283;
      __int128 v284 = *((_OWORD *)v29 + 4);
      __int128 v285 = *((_OWORD *)v29 + 5);
      *(_OWORD *)v364.__mbstate8 = v279;
      *((_OWORD *)&v364._mbstateL + 1) = v284;
      *((_OWORD *)&v364._mbstateL + 2) = v285;
      *((_OWORD *)&v364._mbstateL + 3) = v280;
      int v29 = (char *)*((void *)v29 + 22);
      uint64_t v104 = v277;
      uint64_t v38 = v340;
      uint64_t v28 = v347;
LABEL_202:
      if ((v339 & 0x80000000) != 0)
      {
        int v27 = a3;
        if (v41 == *(void *)(v28 + 16)) {
          goto LABEL_567;
        }
        break;
      }

      int v27 = a3;
      if (!*(_DWORD *)(v28 + 84))
      {
        if (v41 == *(void *)(v28 + 16)) {
          goto LABEL_567;
        }
        break;
      }

      int v113 = *(unsigned int **)(v28 + 40);
      uint64_t v114 = *v113;
      if ((v114 & 0x80000000) == 0)
      {
        unint64_t v115 = v113 + 2;
        do
        {
          uint64_t v116 = (int)*(v115 - 1);
          if (*(_DWORD *)(v104 + 16 * v116) && v19[4 * v116] && *(_DWORD *)(v104 + 16 * v116 + 8) == v19[4 * v116 + 2])
          {
            int v117 = v19[4 * v114];
            if (*(_DWORD *)(v104 + 16 * v114))
            {
              if (!v117) {
                goto LABEL_600;
              }
LABEL_211:
              if (v19[4 * v114 + 2] > *(_DWORD *)(v104 + 16 * v114 + 8)) {
                goto LABEL_600;
              }
              goto LABEL_214;
            }

            if (!v117) {
              goto LABEL_211;
            }
          }

LABEL_214:
          unsigned int v118 = *v115;
          v115 += 2;
          uint64_t v114 = v118;
        }

        while ((v118 & 0x80000000) == 0);
      }

      if (v41 != *(void *)(v28 + 16)) {
        break;
      }
      v255 = *(unsigned int **)(v28 + 40);
      uint64_t v256 = *v255;
      if ((v256 & 0x80000000) != 0)
      {
LABEL_567:
        int v262 = v339;
        goto LABEL_568;
      }

      v257 = v255 + 2;
      while (1)
      {
        uint64_t v258 = (int)*(v257 - 1);
        if (*(_DWORD *)(v104 + 16 * v258) && v19[4 * v258] && *(_DWORD *)(v104 + 16 * v258 + 8) == v19[4 * v258 + 2])
        {
          int v259 = v19[4 * v256];
          if (*(_DWORD *)(v104 + 16 * v256))
          {
            if (!v259) {
              goto LABEL_600;
            }
          }

          else if (v259)
          {
            int v262 = -1;
            goto LABEL_568;
          }

          int v260 = v19[4 * v256 + 2] - *(_DWORD *)(v104 + 16 * v256 + 8);
          if (v260) {
            break;
          }
        }

        unsigned int v261 = *v257;
        v257 += 2;
        uint64_t v256 = v261;
        if ((v261 & 0x80000000) != 0) {
          goto LABEL_567;
        }
      }

      int v262 = v339;
      if (v260 < 0) {
        int v262 = -1;
      }
      if (v260 <= 0)
      {
LABEL_568:
        if (v262 < v109)
        {
          if (!v104) {
            goto LABEL_571;
          }
          goto LABEL_570;
        }

        if (v104 && v262 == v109)
        {
          uint64_t v264 = *(unsigned int *)(v28 + 80);
          v265 = *(int **)(v28 + 32);
          v266 = v293;
          v267 = v294;
          while (2)
          {
            int v269 = *v265++;
            int v268 = v269;
            if (v269 == 2)
            {
              int v272 = *(v266 - 2);
              int v273 = *(v267 - 2);
              if (v272)
              {
                if (!v273) {
                  goto LABEL_570;
                }
                int v274 = *(v267 - 1);
                int v275 = *(v266 - 1);
                goto LABEL_586;
              }
            }

            else
            {
              if (v268 != 1)
              {
                if (!v268)
                {
                  int v270 = *v267;
                  int v271 = *v266;
LABEL_590:
                  int v276 = v270 - v271;
                  if (v276) {
                    goto LABEL_611;
                  }
                }

                goto LABEL_596;
              }

              int v272 = *(v266 - 2);
              int v273 = *(v267 - 2);
              if (v272)
              {
                if (!v273) {
                  goto LABEL_570;
                }
                int v274 = *(v266 - 1);
                int v275 = *(v267 - 1);
LABEL_586:
                int v276 = v274 - v275;
                if (v276) {
                  goto LABEL_611;
                }
                int v276 = v273 - v272;
                if (v273 != v272) {
                  goto LABEL_611;
                }
                if (v272 != 1)
                {
                  int v270 = *v266;
                  int v271 = *v267;
                  goto LABEL_590;
                }

LABEL_596:
                v267 += 4;
                v266 += 4;
                if (!--v264) {
                  goto LABEL_571;
                }
                continue;
              }
            }

            break;
          }

          if (v273) {
            int v276 = -1;
          }
          else {
            int v276 = 0;
          }
          if (v276)
          {
LABEL_611:
            if (v276 < 1)
            {
LABEL_571:
              unsigned int v339 = v109;
              continue;
            }

LABEL_570:
            uint64_t v263 = v104;
            _platform_memmove();
            uint64_t v28 = v347;
            uint64_t v104 = v263;
            goto LABEL_571;
          }

          goto LABEL_596;
        }

        unsigned int v339 = v262;
      }
    }

    uint64_t v119 = (uint64_t *)(v41 + 8);
    if (!*(void *)(v41 + 8) || (*(_BYTE *)(v41 + 40) & 0x80) == 0) {
      break;
    }
    uint64_t v122 = v29;
    uint64_t v123 = v104;
    *(void *)v351 = v25;
    v357 = v110;
    uint64_t v124 = *(int *)(v41 + 48);
    uint64_t v125 = tre_fill_pmatch(v124 + 1, v326, *(_DWORD *)(v28 + 96) & 0xFB, v28, v19, v109);
    if ((_DWORD)v125)
    {
      uint64_t v288 = v125;
LABEL_630:
      tre_mem_destroy(v332);
      free(v19);
      return v288;
    }

    int v126 = &v326[16 * v124];
    uint64_t v127 = *(void *)v126;
    if ((*(void *)v126 & 0x80000000) == 0)
    {
      uint64_t v128 = *(void *)v126;
      int v129 = *((_DWORD *)v126 + 2);
      int v130 = v129 - v127;
      if (a3 < 0)
      {
        if (a4) {
          int v137 = _platform_strncmp();
        }
        else {
          int v137 = wcsncmp(&a2[v128], v346 - 1, v130);
        }
        int v29 = v122;
        uint64_t v38 = v340;
        if (v137) {
          goto LABEL_555;
        }
      }

      else
      {
        int v29 = v122;
        if (a3 - v109 < v130) {
          goto LABEL_555;
        }
        int v131 = a4 ? _platform_memcmp() : wmemcmp(&a2[v128], v346 - 1, v130);
        uint64_t v38 = v340;
        if (v131) {
          goto LABEL_555;
        }
      }

      uint64_t v138 = *(int *)(v41 + 16);
      if (v129 != (_DWORD)v127 || !v331[v138])
      {
        v331[v138] = v129 == v127;
        uint64_t v110 = &v357[v130 - 1];
        unsigned __int32 v121 = v359;
        v346 += v130 - 1;
        if (!a4)
        {
          v109 += v130;
          if (a3 < 0 || v109 < a3)
          {
            __darwin_ct_rune_t v140 = *v346++;
            __darwin_ct_rune_t v359 = v140;
          }

          else
          {
            __darwin_ct_rune_t v359 = 0;
          }

          uint64_t v25 = *(void *)v351;
          goto LABEL_278;
        }

        if (a4 == 2)
        {
          uint64_t v25 = *(void *)v351;
          v109 += v130 - 1 + v349;
          if (a3 < 0 || a3 > v109)
          {
            int v133 = *v110;
            if (v133 < 0)
            {
              uint64_t v253 = v38;
              v324 = v29;
              int v254 = a3 - v109;
              if (a3 < 0) {
                int v254 = 32;
              }
              BOOL v135 = &v357[v130 - 1];
              size_t v349 = mbrtowc_l(&v359, v110, v254, &v364, *(locale_t *)(v347 + 56));
              if (v349 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                uint64_t v38 = v253;
                if (a3 < 0 || v349)
                {
                  uint64_t v110 = &v135[v349];
                  goto LABEL_551;
                }

                goto LABEL_549;
              }

              return 17LL;
            }

            goto LABEL_273;
          }

LABEL_543:
          __darwin_ct_rune_t v359 = 0;
          goto LABEL_274;
        }

        uint64_t v25 = *(void *)v351;
        if (a4 != 1)
        {
          v109 += v130 - 1;
          goto LABEL_278;
        }

        v109 += v130;
        if ((a3 & 0x80000000) == 0 && v109 >= a3) {
          goto LABEL_264;
        }
LABEL_265:
        __darwin_ct_rune_t v139 = *(unsigned __int8 *)v110++;
        __darwin_ct_rune_t v132 = v139;
LABEL_266:
        __darwin_ct_rune_t v359 = v132;
        goto LABEL_278;
      }

LABEL_555:
      uint64_t v104 = v338;
      int v27 = a3;
      uint64_t v28 = v347;
      int v26 = v348;
      uint64_t v25 = *(void *)v351;
      goto LABEL_600;
    }

    int v27 = a3;
    uint64_t v28 = v347;
    int v26 = v348;
    uint64_t v104 = v123;
    int v29 = v122;
  }

  if (v27 < 0)
  {
    unsigned __int32 v121 = v359;
    int v120 = a4;
    if (!v359) {
      goto LABEL_553;
    }
  }

  else
  {
    int v120 = a4;
    if (v27 <= v109) {
      goto LABEL_554;
    }
    unsigned __int32 v121 = v359;
  }

  switch(v120)
  {
    case 0:
      ++v109;
      if ((v27 & 0x80000000) == 0 && v109 >= v27) {
        goto LABEL_264;
      }
      __darwin_ct_rune_t v132 = *v346++;
      goto LABEL_266;
    case 2:
      v109 += v349;
      if (v27 < 0 || v27 > v109)
      {
        int v133 = *v110;
        if (v133 < 0)
        {
          v324 = v29;
          *(void *)v351 = v25;
          int v134 = v27 - v109;
          if (v27 < 0) {
            int v134 = 32;
          }
          BOOL v135 = v110;
          size_t v136 = mbrtowc_l(&v359, v110, v134, &v364, *(locale_t *)(v347 + 56));
          if (v136 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            uint64_t v38 = v340;
            if (v27 < 0 || v136)
            {
              uint64_t v110 = &v135[v136];
              LODWORD(v349) = v136;
LABEL_551:
              uint64_t v25 = *(void *)v351;
              int v29 = v324;
              break;
            }

LABEL_549:
            __darwin_ct_rune_t v359 = 0;
            uint64_t v110 = v135 + 1;
            LODWORD(v349) = 1;
            goto LABEL_551;
          }

          return 17LL;
        }

LABEL_375:
  if ((*(_BYTE *)(v41 + 40) & 4) == 0) {
    goto LABEL_515;
  }
  uint64_t v185 = *(void *)(v41 + 48);
  unsigned int v362 = v121;
  int v300 = *(_DWORD *)(v347 + 96);
  if ((v300 & 2) == 0)
  {
LABEL_377:
    char v186 = 1;
    goto LABEL_434;
  }

  if (v121 < 0x80)
  {
    if ((*v335 & 0x1000) == 0)
    {
      if ((*v335 & 0x8000) == 0) {
        goto LABEL_377;
      }
      __darwin_ct_rune_t v361 = v121;
      __darwin_ct_rune_t v189 = *v329;
LABEL_433:
      char v186 = 0;
      __darwin_ct_rune_t v360 = v189;
      goto LABEL_434;
    }

    __darwin_ct_rune_t v360 = v121;
    __darwin_ct_rune_t v197 = *v330;
LABEL_411:
    char v186 = 0;
    __darwin_ct_rune_t v361 = v197;
    goto LABEL_434;
  }

  uint64_t v302 = v185;
  v191 = *(_xlocale **)(v347 + 56);
  *(void *)v352 = v141;
  if (v121 < 0x100)
  {
    unsigned int v198 = &__global_locale;
    if (v191 != (_xlocale *)-1LL) {
      unsigned int v198 = *(void **)(v347 + 56);
    }
    if (!v191) {
      unsigned int v198 = &__c_locale;
    }
    int v192 = *(_DWORD *)(*(void *)(v198[166] + 120LL) + 4LL * v121 + 60);
    if ((v192 & 0x1000) == 0) {
      goto LABEL_408;
    }
LABEL_410:
    __darwin_ct_rune_t v360 = v121;
    __darwin_ct_rune_t v197 = ___toupper_l(v121, v191);
    uint64_t v110 = v358;
    uint64_t v38 = v340;
    uint64_t v141 = *(void *)v352;
    int v144 = v343;
    BOOL v143 = v344;
    uint64_t v185 = v302;
    goto LABEL_411;
  }

  if ((___runetype_l(v121, v191) & 0x1000) != 0) {
    goto LABEL_410;
  }
  LOWORD(v192) = ___runetype_l(v121, v191);
LABEL_408:
  if ((v192 & 0x8000) != 0)
  {
    __darwin_ct_rune_t v361 = v121;
    __darwin_ct_rune_t v189 = ___tolower_l(v121, v191);
    uint64_t v110 = v358;
    uint64_t v38 = v340;
    uint64_t v141 = *(void *)v352;
    int v144 = v343;
    BOOL v143 = v344;
    uint64_t v185 = v302;
    goto LABEL_433;
  }

  char v186 = 1;
  uint64_t v110 = v358;
  uint64_t v38 = v340;
  uint64_t v141 = *(void *)v352;
  int v144 = v343;
  BOOL v143 = v344;
  uint64_t v185 = v302;
LABEL_434:
  int v206 = *(_DWORD *)v185;
  if (*(int *)v185 < 1)
  {
    int v207 = 0;
    int v232 = 1;
    goto LABEL_511;
  }

  int v207 = 0;
  int v208 = 0;
  uint64_t v303 = v185;
  uint64_t v209 = (_DWORD *)(v185 + 8);
  int v305 = *(_DWORD *)v185;
  char v306 = v186;
  v325 = v29;
  *(void *)v353 = v141;
  while (2)
  {
    switch(*v209)
    {
      case 1:
        int v210 = v209[1];
        if ((v186 & 1) != 0)
        {
          if (v210 != v362) {
            goto LABEL_501;
          }
          goto LABEL_504;
        }

        if (v210 == v361 || v210 == v360) {
          goto LABEL_504;
        }
        goto LABEL_501;
      case 2:
        if (++v208 >= v206) {
          goto LABEL_502;
        }
        v211 = v209 + 2;
        if (v209[2] != 3)
        {
          int v207 = 0;
          int v232 = 1;
          goto LABEL_509;
        }

        int v212 = v209[1];
        int v213 = v209[3];
        if (v207)
        {
          if ((v186 & 1) == 0)
          {
LABEL_477:
            if (v212 <= (int)v38 && (int)v38 <= v213)
            {
              int v232 = 0;
              int v207 = 1;
              goto LABEL_509;
            }

            int v207 = 1;
            if (v212 <= v31 && v31 <= v213) {
              goto LABEL_507;
            }
            goto LABEL_481;
          }
        }

        else
        {
          int v297 = v212;
          uint64_t v221 = *(void *)(v347 + 56);
          if ((v186 & 1) == 0)
          {
            uint64_t v311 = *(void *)(v347 + 56);
            int v315 = v30;
            int v321 = __collate_equiv_value(v221, &v361, 1uLL);
            int v227 = __collate_equiv_value(v311, &v360, 1uLL);
            int v30 = v315;
            LODWORD(v38) = v321;
            int v31 = v227;
            uint64_t v110 = v358;
            uint64_t v141 = *(void *)v353;
            int v144 = v343;
            BOOL v143 = v344;
            int v206 = v305;
            char v186 = v306;
            int v212 = v297;
            goto LABEL_477;
          }

          int v318 = v38;
          int v308 = v31;
          int v222 = __collate_equiv_value(v221, (const __int32 *)&v362, 1uLL);
          char v186 = v306;
          int v31 = v308;
          LODWORD(v38) = v318;
          int v30 = v222;
          uint64_t v110 = v358;
          uint64_t v141 = *(void *)v353;
          int v144 = v343;
          BOOL v143 = v344;
          int v206 = v305;
          int v212 = v297;
        }

        int v207 = 1;
        if (v212 > v30 || v30 > v213)
        {
LABEL_481:
          uint64_t v209 = v211;
          int v29 = v325;
LABEL_501:
          ++v208;
          v209 += 2;
          if (v208 >= v206)
          {
LABEL_502:
            int v207 = 0;
            int v232 = 1;
            goto LABEL_510;
          }

          continue;
        }

LABEL_507:
        int v232 = 0;
LABEL_509:
        int v29 = v325;
LABEL_510:
        uint64_t v38 = v340;
        uint64_t v185 = v303;
LABEL_511:
        if ((*(_BYTE *)(v185 + 4) & 1) == 0)
        {
LABEL_514:
          if (!v207) {
            goto LABEL_529;
          }
          goto LABEL_515;
        }

        if ((v300 & 8) != 0)
        {
          int v207 = v232;
          if (v362 != 10) {
            goto LABEL_514;
          }
LABEL_529:
          uint64_t v249 = *(void *)(v41 + 64);
          uint64_t v119 = (uint64_t *)(v41 + 64);
          v41 += 56LL;
          if (!v249)
          {
LABEL_534:
            uint64_t v104 = v338;
            if (v141)
            {
              uint64_t v40 = 0LL;
              uint64_t v41 = v141;
              uint64_t v28 = v347;
              int v26 = v348;
              if (v146)
              {
                uint64_t v250 = *v146;
                if ((v250 & 0x80000000) != 0)
                {
                  uint64_t v40 = v146;
                }

                else
                {
                  do
                  {
                    int v251 = v19[4 * v250];
                    v19[4 * v250] = v251 + 1;
                    if (!v251) {
                      v19[4 * v250 + 1] = v109;
                    }
                    uint64_t v40 = v146 + 1;
                    v252 = &v19[4 * v250];
                    v252[2] = v109;
                    v252[3] = v25;
                    uint64_t v250 = v146[1];
                    ++v146;
                  }

                  while ((v250 & 0x80000000) == 0);
                }

                uint64_t v25 = (v25 + 1);
                uint64_t v41 = v141;
              }

              goto LABEL_202;
            }

            uint64_t v40 = v146;
            int v27 = a3;
LABEL_553:
            uint64_t v28 = v347;
LABEL_554:
            int v26 = v348;
            goto LABEL_600;
          }

          goto LABEL_289;
        }

        if (!v232) {
          goto LABEL_529;
        }
LABEL_515:
        if (!v141)
        {
          uint64_t v141 = *v119;
          unsigned int v146 = *(unsigned int **)(v41 + 24);
          goto LABEL_529;
        }

        *(void *)v354 = v141;
        if (*((void *)v29 + 23))
        {
          uint64_t v233 = v38;
          int v29 = (char *)*((void *)v29 + 23);
          goto LABEL_522;
        }

        v234 = tre_mem_alloc_impl((uint64_t)v332, 0, 0LL, 0, 0xC0uLL);
        if (v234)
        {
          v235 = v234;
          *((void *)v234 + 22) = v29;
          *((void *)v234 + 23) = 0LL;
          v236 = tre_mem_alloc_impl((uint64_t)v332, 0, 0LL, 0, v355);
          *((void *)v235 + 5) = v236;
          if (v236)
          {
            *((void *)v29 + 23) = v235;
            int v29 = v235;
            uint64_t v233 = v340;
            uint64_t v110 = v358;
            int v19 = v327;
LABEL_522:
            *(_DWORD *)int v29 = v109;
            *((_DWORD *)v29 + 1) = v349;
            *((void *)v29 + 1) = v110;
            *((void *)v29 + 2) = v346;
            *((void *)v29 + 3) = *v119;
            __darwin_ct_rune_t v237 = v359;
            *((_DWORD *)v29 + 8) = *(_DWORD *)(v41 + 16);
            *((_DWORD *)v29 + 9) = v237;
            _platform_memmove();
            __int128 v238 = *((_OWORD *)&v364._mbstateL + 3);
            *((_OWORD *)v29 + 5) = *((_OWORD *)&v364._mbstateL + 2);
            *((_OWORD *)v29 + 6) = v238;
            __int128 v239 = *((_OWORD *)&v364._mbstateL + 1);
            *((_OWORD *)v29 + 3) = *(_OWORD *)v364.__mbstate8;
            *((_OWORD *)v29 + 4) = v239;
            __int128 v240 = *((_OWORD *)&v364._mbstateL + 7);
            *((_OWORD *)v29 + 9) = *((_OWORD *)&v364._mbstateL + 6);
            *((_OWORD *)v29 + 10) = v240;
            __int128 v241 = *((_OWORD *)&v364._mbstateL + 5);
            *((_OWORD *)v29 + 7) = *((_OWORD *)&v364._mbstateL + 4);
            *((_OWORD *)v29 + 8) = v241;
            v242 = *(unsigned int **)(v41 + 24);
            int v144 = v343;
            BOOL v143 = v344;
            if (v242)
            {
              uint64_t v243 = *v242;
              if ((v243 & 0x80000000) == 0)
              {
                uint64_t v244 = *((void *)v29 + 5);
                v245 = v242 + 1;
                do
                {
                  int v246 = *(_DWORD *)(v244 + 16 * v243);
                  *(_DWORD *)(v244 + 16 * v243) = v246 + 1;
                  if (!v246) {
                    *(_DWORD *)(v244 + 16 * v243 + 4) = v109;
                  }
                  uint64_t v247 = v244 + 16 * v243;
                  *(_DWORD *)(v247 + 8) = v109;
                  *(_DWORD *)(v247 + 12) = v25;
                  unsigned int v248 = *v245++;
                  uint64_t v243 = v248;
                }

                while ((v248 & 0x80000000) == 0);
              }
            }

            uint64_t v25 = (v25 + 1);
            uint64_t v110 = v358;
            uint64_t v38 = v233;
            uint64_t v141 = *(void *)v354;
            goto LABEL_529;
          }

          v286 = v332;
        }

        else
        {
          v286 = v332;
        }

        tre_mem_destroy(v286);
        v287 = v327;
LABEL_626:
        free(v287);
        free(v326);
        free(v331);
        return 12LL;
      case 4:
        int v214 = v209[1];
        int v215 = *(_xlocale **)(v347 + 56);
        if ((v186 & 1) != 0)
        {
          uint64_t v216 = v362;
        }

        else
        {
          if (v361 > 0x7F)
          {
            if (v361 < 0x100)
            {
              v228 = &__global_locale;
              if (v215 != (_xlocale *)-1LL) {
                v228 = *(void **)(v347 + 56);
              }
              if (!v215) {
                v228 = &__c_locale;
              }
              int v223 = *(_DWORD *)(*(void *)(v228[166] + 120LL) + 4LL * v361 + 60);
            }

            else
            {
              int v295 = v209[1];
              int v298 = v207;
              int v313 = v30;
              int v319 = v38;
              int v309 = v31;
              v291 = *(_xlocale **)(v347 + 56);
              int v223 = ___runetype_l(v361, v215);
              int v215 = v291;
              int v214 = v295;
              int v207 = v298;
              char v186 = v306;
              int v31 = v309;
              int v30 = v313;
              LODWORD(v38) = v319;
              int v206 = v305;
              int v144 = v343;
              BOOL v143 = v344;
              uint64_t v141 = *(void *)v353;
              uint64_t v110 = v358;
            }

            uint64_t v218 = v223 & v214;
          }

          else
          {
            uint64_t v218 = _DefaultRuneLocale.__runetype[v361] & v214;
          }

          if (v218)
          {
LABEL_504:
            int v232 = 0;
            int v207 = 1;
            goto LABEL_510;
          }

          uint64_t v216 = v360;
        }

        if (v216 > 0x7F)
        {
          if (v216 < 0x100)
          {
            v231 = (_xlocale *)&__global_locale;
            if (v215 != (_xlocale *)-1LL) {
              v231 = v215;
            }
            if (!v215) {
              v231 = (_xlocale *)&__c_locale;
            }
            int v230 = *(_DWORD *)(*(void *)(*((void *)v231 + 166) + 120LL) + 4 * v216 + 60);
          }

          else
          {
            int v296 = v214;
            int v299 = v207;
            int v316 = v30;
            int v322 = v38;
            int v312 = v31;
            int v230 = ___runetype_l(v216, v215);
            int v214 = v296;
            int v207 = v299;
            char v186 = v306;
            int v31 = v312;
            int v30 = v316;
            LODWORD(v38) = v322;
            int v206 = v305;
            int v144 = v343;
            BOOL v143 = v344;
            uint64_t v141 = *(void *)v353;
            uint64_t v110 = v358;
          }

          uint64_t v229 = v230 & v214;
        }

        else
        {
          uint64_t v229 = _DefaultRuneLocale.__runetype[v216] & v214;
        }

        if (v229) {
          goto LABEL_504;
        }
        goto LABEL_501;
      case 5:
        if (v207)
        {
          if ((v186 & 1) != 0) {
            goto LABEL_460;
          }
        }

        else
        {
          uint64_t v219 = *(void *)(v347 + 56);
          if ((v186 & 1) != 0)
          {
            int v317 = v38;
            int v307 = v31;
            int v220 = __collate_equiv_value(v219, (const __int32 *)&v362, 1uLL);
            char v186 = v306;
            int v31 = v307;
            LODWORD(v38) = v317;
            int v30 = v220;
            uint64_t v110 = v358;
            uint64_t v141 = *(void *)v353;
            int v144 = v343;
            BOOL v143 = v344;
            int v206 = v305;
LABEL_460:
            int v207 = 1;
            if (v209[1] == v30) {
              goto LABEL_505;
            }
            goto LABEL_501;
          }

          uint64_t v310 = *(void *)(v347 + 56);
          int v314 = v30;
          int v320 = __collate_equiv_value(v219, &v361, 1uLL);
          int v224 = __collate_equiv_value(v310, &v360, 1uLL);
          int v30 = v314;
          LODWORD(v38) = v320;
          int v31 = v224;
          uint64_t v110 = v358;
          uint64_t v141 = *(void *)v353;
          int v144 = v343;
          BOOL v143 = v344;
          int v206 = v305;
          char v186 = v306;
        }

        int v225 = v209[1];
        int v207 = 1;
        if (v225 == (_DWORD)v38 || v225 == v31)
        {
LABEL_505:
          int v232 = 0;
          goto LABEL_510;
        }

        goto LABEL_501;
      default:
        goto LABEL_501;
    }
  }

uint64_t tre_tnfa_run_parallel( uint64_t a1, const char *a2, int a3, int a4, int *a5, char a6, unsigned int *a7)
{
  __int32 v313 = 0;
  unsigned int v11 = *(_DWORD *)(a1 + 96);
  memset(&v317, 0, sizeof(v317));
  unsigned int v308 = v11;
  if (a5) {
    int v12 = *(_DWORD *)(a1 + 80);
  }
  else {
    int v12 = 0;
  }
  uint64_t v13 = 16LL * v12;
  uint64_t v14 = *(int *)(a1 + 92);
  uint64_t v15 = 16 * v14;
  uint64_t v16 = 16 * v14 + 16;
  uint64_t v17 = (char *)malloc(16 * v14 + v13 + 2 * (v16 + v13 * v14) + 28);
  if (!v17) {
    return 12LL;
  }
  int v266 = a4;
  int v267 = a3;
  v257 = a7;
  uint64_t v18 = v12;
  uint64_t v306 = 16LL * v12;
  int v19 = &v17[v13];
  else {
    uint64_t v20 = 0LL;
  }
  uint64_t v303 = &v19[v20];
  uint64_t v21 = (uint64_t)&v19[v20 + v16];
  if ((v21 & 7) != 0) {
    uint64_t v22 = 8 - (v21 & 7);
  }
  else {
    uint64_t v22 = 0LL;
  }
  uint64_t v23 = (char *)(v21 + v22);
  uint64_t v24 = v21 + v22 + v16;
  if ((v24 & 7) != 0) {
    uint64_t v25 = 8 - (v24 & 7);
  }
  else {
    uint64_t v25 = 0LL;
  }
  uint64_t v258 = v17;
  _platform_bzero();
  uint64_t v305 = v24 + v25;
  if ((int)v14 >= 1)
  {
    if ((((_BYTE)v305 + (_BYTE)v15) & 7) != 0) {
      uint64_t v29 = 8LL - (((_BYTE)v305 + (_BYTE)v15) & 7);
    }
    else {
      uint64_t v29 = 0LL;
    }
    uint64_t v30 = v14;
    uint64_t v31 = (uint64_t)v258 + v306 + v22 + v15 + 24;
    uint64_t v32 = (uint64_t)v258 + v306 + 8;
    uint64_t v33 = v29 + v25 + v22 + 48LL * (int)v14;
    uint64_t v34 = (uint64_t)v258 + v306 + v33 + 32;
    uint64_t v35 = 32 * v18;
    uint64_t v36 = (uint64_t)v258 + 32 * v18 + v33 + 32;
    uint64_t v37 = v14;
    do
    {
      *(void *)(v31 + v20) = v34 + v20;
      *(void *)(v32 + v20) = v36 + v20;
      v31 += 16LL;
      v32 += 16LL;
      v34 += v35;
      v36 += v35;
      --v37;
    }

    while (v37);
    uint64_t v38 = (_DWORD *)(v24 + v25);
    do
    {
      *uint64_t v38 = -1;
      v38 += 4;
      --v30;
    }

    while (v30);
  }

  int v39 = v266;
  int v40 = v267;
  uint64_t v41 = a1;
  uint64_t v42 = v23;
  if (!a2) {
    goto LABEL_71;
  }
  unsigned int v43 = *(_DWORD *)(a1 + 68);
  if ((v43 & 0x80000000) != 0) {
    goto LABEL_71;
  }
  if (v266 == 2)
  {
    if (v43 <= 0x7F)
    {
      if (v267 < 0)
      {
        char v53 = *a2;
        if (*a2)
        {
          unsigned int v44 = a2;
          while (v43 != v53)
          {
            if (v53 < 0) {
              goto LABEL_66;
            }
            int v54 = *(unsigned __int8 *)++v44;
            char v53 = v54;
            if (!v54) {
              goto LABEL_65;
            }
          }

          goto LABEL_46;
        }
      }

      else if (v267)
      {
        int v46 = v267;
        unsigned int v44 = a2;
        do
        {
          int v47 = *v44;
          if (v43 == v47) {
            goto LABEL_46;
          }
          if ((v47 & 0x80) != 0) {
            goto LABEL_66;
          }
          ++v44;
        }

        while (--v46);
      }

LABEL_66:
    if (v44 != a2)
    {
      uint64_t v263 = (char *)v44;
      unsigned int v48 = *((unsigned __int8 *)v44 - 1);
      __int32 v313 = v48;
      int v51 = (_DWORD)v44 - (_DWORD)a2;
      if ((v267 & 0x80000000) == 0 && v267 <= v51)
      {
        __int32 v313 = 0;
        goto LABEL_83;
      }

      if ((*v44 & 0x80000000) == 0)
      {
        __int32 v57 = *(unsigned __int8 *)v44;
        uint64_t v263 = (char *)(v44 + 1);
LABEL_82:
        __int32 v313 = v57;
LABEL_83:
        int v259 = (__int32 *)a2;
        LODWORD(v260) = 1;
LABEL_88:
        unsigned int v50 = v308;
        goto LABEL_89;
      }

      int v256 = v267 - v51;
      if (v267 < 0) {
        int v256 = 32;
      }
      size_t v255 = mbrtowc_l(&v313, v44, v256, &v317, *(locale_t *)(a1 + 56));
      if (v255 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        if ((v267 & 0x80000000) == 0 && !v255)
        {
          __int32 v313 = 0;
          ++v263;
          LODWORD(v260) = 1;
          int v259 = (__int32 *)a2;
          goto LABEL_592;
        }

        v263 += v255;
        int v259 = (__int32 *)a2;
        goto LABEL_591;
      }

      return 17LL;
    }

LABEL_220:
        uint64_t v113 = *((void *)v66 + 3);
        v66 += 14;
        if (!v113) {
          goto LABEL_244;
        }
      }

      uint64_t v62 = v66 + 4;
    }

    while (*((void *)v66 + 3));
LABEL_244:
    *(void *)uint64_t v303 = 0LL;
    int v39 = v266;
    int v40 = v267;
    uint64_t v41 = a1;
    uint64_t v42 = v276;
    if ((v267 & 0x80000000) == 0) {
      goto LABEL_94;
    }
LABEL_245:
    unsigned int v48 = v313;
    if (!v313) {
      goto LABEL_581;
    }
LABEL_246:
    if (!v39)
    {
      ++v51;
      if (v40 < 0 || v51 < v40)
      {
        __int32 v128 = *v259++;
        __int32 v313 = v128;
      }

      else
      {
        __int32 v313 = 0;
      }

      goto LABEL_261;
    }

    if (v39 != 2)
    {
      if (v39 == 1)
      {
        ++v51;
        uint64_t v125 = 16LL * v18;
        if (v40 < 0 || v51 < v40)
        {
          __int32 v127 = *v263++;
          __int32 v313 = v127;
        }

        else
        {
          __int32 v313 = 0;
        }

        goto LABEL_262;
      }

LABEL_261:
      uint64_t v125 = 16LL * v18;
      goto LABEL_262;
    }

    v51 += v260;
    if ((v40 & 0x80000000) == 0 && v40 <= v51)
    {
      __int32 v313 = 0;
      LODWORD(v260) = 1;
      goto LABEL_261;
    }

    int v126 = *v263;
    uint64_t v125 = 16LL * v18;
    if ((v126 & 0x80000000) == 0)
    {
      ++v263;
      __int32 v313 = v126;
      LODWORD(v260) = 1;
      goto LABEL_262;
    }

    uint64_t v252 = v58;
    int v253 = v40 - v51;
    if (v40 < 0) {
      int v253 = 32;
    }
    size_t v260 = mbrtowc_l(&v313, v263, v253, &v317, *(locale_t *)(v41 + 56));
    if (v260 > 0xFFFFFFFFFFFFFFFDLL) {
      return 17LL;
    }
    uint64_t v58 = v252;
    if (v40 < 0 || v260)
    {
      v263 += v260;
    }

    else
    {
      __int32 v313 = 0;
      ++v263;
      LODWORD(v260) = 1;
    }

    __int16 v61 = v275;
LABEL_262:
    int v129 = v61;
    uint64_t v130 = *(void *)v61;
    if (!v130)
    {
      uint64_t v303 = v42;
      goto LABEL_571;
    }

    BOOL v132 = (a6 & 1) == 0 && v51 < 1;
    int v133 = v302;
    if (v48 != 10) {
      int v133 = 0;
    }
    int v307 = v133;
    BOOL v309 = v132;
    int v134 = &_DefaultRuneLocale.__magic[4 * v48];
    int v299 = (int *)(v134 + 60);
    uint64_t v264 = (__darwin_ct_rune_t *)(v134 + 2108);
    unsigned int v261 = (__darwin_ct_rune_t *)(v134 + 1084);
    int v312 = v129;
    uint64_t v303 = v42;
    while (2)
    {
      BOOL v135 = (uint64_t *)(v130 + 8);
      if (!*(void *)(v130 + 8)) {
        goto LABEL_568;
      }
      while (2)
      {
        int v136 = *(_DWORD *)(v130 + 40);
        if (!v136) {
          goto LABEL_499;
        }
        int v137 = v309;
        if ((v136 & 1) == 0) {
          int v137 = 1;
        }
        if ((v137 | v307) != 1) {
          goto LABEL_564;
        }
        if ((v136 & 2) != 0)
        {
          int v141 = v302;
          if (v313 != 10) {
            int v141 = 0;
          }
          if (v313 | v301 && !v141) {
            goto LABEL_564;
          }
        }

        if ((v136 & 8) != 0)
        {
          if (v48 == 95) {
            goto LABEL_564;
          }
          if (v48 > 0x7F)
          {
            int v144 = *(_xlocale **)(v41 + 56);
            if (v48 < 0x100)
            {
              int v149 = &__global_locale;
              if (v144 != (_xlocale *)-1LL) {
                int v149 = *(void **)(v41 + 56);
              }
              if (!v144) {
                int v149 = &__c_locale;
              }
              int v142 = *(_DWORD *)(*(void *)(v149[166] + 120LL) + 4LL * v48 + 60);
            }

            else
            {
              uint64_t v145 = v58;
              LOWORD(v142) = ___runetype_l(v48, v144);
              uint64_t v58 = v145;
            }
          }

          else
          {
            int v142 = *v299;
          }

          if ((v142 & 0x500) != 0) {
            goto LABEL_564;
          }
          if (v313 != 95)
          {
            if (v313 <= 0x7F)
            {
              int v150 = &_DefaultRuneLocale;
              goto LABEL_382;
            }

            uint64_t v160 = *(_xlocale **)(v41 + 56);
            if (v313 < 0x100)
            {
              v181 = &__global_locale;
              if (v160 != (_xlocale *)-1LL) {
                v181 = *(void **)(v41 + 56);
              }
              if (!v160) {
                v181 = &__c_locale;
              }
              int v150 = *(_RuneLocale **)(v181[166] + 120LL);
LABEL_382:
              __uint32_t v162 = v150->__runetype[v313];
            }

            else
            {
              uint64_t v161 = v58;
              LOWORD(v162) = ___runetype_l(v313, v160);
              uint64_t v58 = v161;
            }

            if ((v162 & 0x500) == 0) {
              goto LABEL_564;
            }
          }
        }

        int v138 = *(_DWORD *)(v130 + 40);
        if ((v138 & 0x10) != 0)
        {
          if (v48 != 95)
          {
            if (v48 > 0x7F)
            {
              int v147 = *(_xlocale **)(v41 + 56);
              if (v48 < 0x100)
              {
                int v154 = &__global_locale;
                if (v147 != (_xlocale *)-1LL) {
                  int v154 = *(void **)(v41 + 56);
                }
                if (!v147) {
                  int v154 = &__c_locale;
                }
                int v143 = *(_DWORD *)(*(void *)(v154[166] + 120LL) + 4LL * v48 + 60);
              }

              else
              {
                uint64_t v148 = v58;
                LOWORD(v143) = ___runetype_l(v48, v147);
                uint64_t v58 = v148;
              }
            }

            else
            {
              int v143 = *v299;
            }

            if ((v143 & 0x500) == 0) {
              goto LABEL_564;
            }
          }

          if (v313 == 95) {
            goto LABEL_564;
          }
          if (v313 <= 0x7F)
          {
            v155 = &_DefaultRuneLocale;
            goto LABEL_332;
          }

          uint64_t v156 = *(_xlocale **)(v41 + 56);
          if (v313 < 0x100)
          {
            v159 = &__global_locale;
            if (v156 != (_xlocale *)-1LL) {
              v159 = *(void **)(v41 + 56);
            }
            if (!v156) {
              v159 = &__c_locale;
            }
            v155 = *(_RuneLocale **)(v159[166] + 120LL);
LABEL_332:
            __uint32_t v158 = v155->__runetype[v313];
          }

          else
          {
            uint64_t v157 = v58;
            LOWORD(v158) = ___runetype_l(v313, v156);
            uint64_t v58 = v157;
          }

          if ((v158 & 0x500) != 0) {
            goto LABEL_564;
          }
          if ((*(_DWORD *)(v130 + 40) & 0x20) == 0) {
            goto LABEL_357;
          }
LABEL_283:
          if (!v51) {
            goto LABEL_357;
          }
          unsigned int v139 = v313;
          if (!v313) {
            goto LABEL_357;
          }
          if (v48 == 95)
          {
            if (v313 == 95) {
              goto LABEL_564;
            }
            BOOL v140 = 1;
          }

          else
          {
            if (v48 > 0x7F)
            {
              unsigned int v151 = *(_xlocale **)(v41 + 56);
              if (v48 < 0x100)
              {
                uint64_t v163 = &__global_locale;
                if (v151 != (_xlocale *)-1LL) {
                  uint64_t v163 = *(void **)(v41 + 56);
                }
                if (!v151) {
                  uint64_t v163 = &__c_locale;
                }
                int v146 = *(_DWORD *)(*(void *)(v163[166] + 120LL) + 4LL * v48 + 60);
              }

              else
              {
                uint64_t v152 = v58;
                __int16 v153 = ___runetype_l(v48, v151);
                uint64_t v58 = v152;
                LOWORD(v146) = v153;
                unsigned int v139 = v313;
              }
            }

            else
            {
              int v146 = *v299;
            }

            int v164 = v146 & 0x500;
            BOOL v140 = v164 != 0;
            if (v139 == 95)
            {
              uint64_t v125 = 16LL * v18;
              if (v164) {
                goto LABEL_564;
              }
              goto LABEL_357;
            }
          }

          if (v139 <= 0x7F)
          {
            uint64_t v165 = &_DefaultRuneLocale;
            goto LABEL_355;
          }

          __int16 v166 = *(_xlocale **)(v41 + 56);
          if (v139 < 0x100)
          {
            uint64_t v169 = &__global_locale;
            if (v166 != (_xlocale *)-1LL) {
              uint64_t v169 = *(void **)(v41 + 56);
            }
            if (!v166) {
              uint64_t v169 = &__c_locale;
            }
            uint64_t v165 = *(_RuneLocale **)(v169[166] + 120LL);
LABEL_355:
            __uint32_t v168 = v165->__runetype[v139];
          }

          else
          {
            uint64_t v167 = v58;
            LOWORD(v168) = ___runetype_l(v139, v166);
            uint64_t v58 = v167;
          }

          BOOL v203 = v140 == ((v168 & 0x500) != 0);
          uint64_t v125 = 16LL * v18;
          if (v203) {
            goto LABEL_564;
          }
          goto LABEL_357;
        }

        if ((v138 & 0x20) != 0) {
          goto LABEL_283;
        }
LABEL_357:
        if ((*(_BYTE *)(v130 + 40) & 0x40) != 0)
        {
          if (!v51) {
            goto LABEL_564;
          }
          unsigned int v172 = v313;
          if (!v313) {
            goto LABEL_564;
          }
          if (v48 == 95)
          {
            if (v313 == 95) {
              goto LABEL_358;
            }
            BOOL v173 = 1;
          }

          else
          {
            if (v48 > 0x7F)
            {
              unsigned int v178 = *(_xlocale **)(v41 + 56);
              if (v48 < 0x100)
              {
                v184 = &__global_locale;
                if (v178 != (_xlocale *)-1LL) {
                  v184 = *(void **)(v41 + 56);
                }
                if (!v178) {
                  v184 = &__c_locale;
                }
                int v175 = *(_DWORD *)(*(void *)(v184[166] + 120LL) + 4LL * v48 + 60);
              }

              else
              {
                uint64_t v179 = v58;
                __int16 v180 = ___runetype_l(v48, v178);
                uint64_t v58 = v179;
                LOWORD(v175) = v180;
                unsigned int v172 = v313;
              }
            }

            else
            {
              int v175 = *v299;
            }

            int v185 = v175 & 0x500;
            BOOL v173 = v185 != 0;
            if (v172 == 95)
            {
              uint64_t v125 = 16LL * v18;
              if (!v185) {
                goto LABEL_564;
              }
              goto LABEL_358;
            }
          }

          if (v172 <= 0x7F)
          {
            char v186 = &_DefaultRuneLocale;
            goto LABEL_412;
          }

          unsigned int v187 = *(_xlocale **)(v41 + 56);
          if (v172 < 0x100)
          {
            int v190 = &__global_locale;
            if (v187 != (_xlocale *)-1LL) {
              int v190 = *(void **)(v41 + 56);
            }
            if (!v187) {
              int v190 = &__c_locale;
            }
            char v186 = *(_RuneLocale **)(v190[166] + 120LL);
LABEL_412:
            __uint32_t v189 = v186->__runetype[v172];
          }

          else
          {
            uint64_t v188 = v58;
            LOWORD(v189) = ___runetype_l(v172, v187);
            uint64_t v58 = v188;
          }

          char v191 = v173 ^ ((v189 & 0x500) != 0);
          uint64_t v125 = 16LL * v18;
          if ((v191 & 1) != 0) {
            goto LABEL_564;
          }
        }

LABEL_491:
              int v217 = 0;
LABEL_493:
              uint64_t v41 = a1;
              uint64_t v125 = 16LL * v18;
              goto LABEL_494;
            case 4:
              int v200 = v195[1];
              v201 = *(_xlocale **)(a1 + 56);
              if ((v171 & 1) != 0)
              {
                uint64_t v202 = v316;
              }

              else
              {
                if (v315 > 0x7F)
                {
                  if (v315 < 0x100)
                  {
                    int v213 = &__global_locale;
                    if (v201 != (_xlocale *)-1LL) {
                      int v213 = *(void **)(a1 + 56);
                    }
                    if (!v201) {
                      int v213 = &__c_locale;
                    }
                    int v208 = *(_DWORD *)(*(void *)(v213[166] + 120LL) + 4LL * v315 + 60);
                  }

                  else
                  {
                    int v284 = v26;
                    int v286 = v28;
                    int v272 = v193;
                    int v295 = v27;
                    int v268 = v195[1];
                    int v262 = *(_xlocale **)(a1 + 56);
                    int v208 = ___runetype_l(v315, v201);
                    v201 = v262;
                    int v200 = v268;
                    int v26 = v284;
                    int v28 = v286;
                    int v27 = v295;
                    int v193 = v272;
                    int v192 = v280;
                    char v171 = v281;
                    uint64_t v58 = v292;
                  }

                  if ((v208 & v200) != 0)
                  {
LABEL_487:
                    int v217 = 0;
                    int v193 = 1;
                    goto LABEL_489;
                  }
                }

                else if ((_DefaultRuneLocale.__runetype[v315] & v200) != 0)
                {
                  goto LABEL_487;
                }

                uint64_t v202 = v314;
              }

              if (v202 > 0x7F)
              {
                if (v202 < 0x100)
                {
                  uint64_t v216 = (_xlocale *)&__global_locale;
                  if (v201 != (_xlocale *)-1LL) {
                    uint64_t v216 = v201;
                  }
                  if (!v201) {
                    uint64_t v216 = (_xlocale *)&__c_locale;
                  }
                  int v215 = *(_DWORD *)(*(void *)(*((void *)v216 + 166) + 120LL) + 4 * v202 + 60);
                }

                else
                {
                  int v285 = v26;
                  int v289 = v28;
                  int v274 = v193;
                  int v298 = v27;
                  int v270 = v200;
                  int v215 = ___runetype_l(v202, v201);
                  int v200 = v270;
                  int v26 = v285;
                  int v28 = v289;
                  int v27 = v298;
                  int v193 = v274;
                  int v192 = v280;
                  char v171 = v281;
                  uint64_t v58 = v292;
                }

                uint64_t v214 = v215 & v200;
              }

              else
              {
                uint64_t v214 = _DefaultRuneLocale.__runetype[v202] & v200;
              }

              if (v214) {
                goto LABEL_487;
              }
              goto LABEL_484;
            case 5:
              if (v193)
              {
                if ((v171 & 1) != 0) {
                  goto LABEL_444;
                }
              }

              else
              {
                uint64_t v204 = *(void *)(a1 + 56);
                if ((v171 & 1) != 0)
                {
                  int v282 = v26;
                  int v293 = v27;
                  int v205 = __collate_equiv_value(v204, (const __int32 *)&v316, 1uLL);
                  char v171 = v281;
                  int v26 = v282;
                  int v27 = v293;
                  int v28 = v205;
                  uint64_t v58 = v292;
                  int v192 = v280;
LABEL_444:
                  int v193 = 1;
                  if (v195[1] == v28) {
                    goto LABEL_488;
                  }
LABEL_484:
                  ++v194;
                  v195 += 2;
                  if (v194 >= v192)
                  {
LABEL_485:
                    int v193 = 0;
                    int v217 = 1;
                    goto LABEL_489;
                  }

                  continue;
                }

                uint64_t v273 = *(void *)(a1 + 56);
                int v287 = v28;
                int v296 = __collate_equiv_value(v204, (const __int32 *)&v315, 1uLL);
                int v209 = __collate_equiv_value(v273, (const __int32 *)&v314, 1uLL);
                int v28 = v287;
                int v27 = v296;
                int v26 = v209;
                uint64_t v58 = v292;
                int v192 = v280;
                char v171 = v281;
              }

              int v210 = v195[1];
              int v193 = 1;
              if (v210 != v27 && v210 != v26) {
                goto LABEL_484;
              }
LABEL_488:
              int v217 = 0;
LABEL_489:
              uint64_t v41 = a1;
LABEL_494:
              uint64_t v170 = v279;
LABEL_495:
              if ((*(_BYTE *)(v170 + 4) & 1) != 0)
              {
                if ((v277 & 8) != 0)
                {
                  int v193 = v217;
                  if (v316 == 10) {
                    goto LABEL_564;
                  }
                  goto LABEL_498;
                }

                if (!v217) {
                  goto LABEL_564;
                }
              }

              else
              {
LABEL_498:
                if (!v193) {
                  goto LABEL_564;
                }
              }

LABEL_499:
              uint64_t v218 = v58;
              _platform_memmove();
              uint64_t v219 = *(unsigned int **)(v130 + 24);
              if (v219)
              {
                uint64_t v220 = *v219;
                if ((v220 & 0x80000000) == 0)
                {
                  uint64_t v221 = v219 + 1;
                  do
                  {
                    if ((int)v220 < (int)v18)
                    {
                      int v222 = v59[4 * v220];
                      v59[4 * v220] = v222 + 1;
                      if (!v222) {
                        v59[4 * v220 + 1] = v51;
                      }
                      int v223 = &v59[4 * v220];
                      v223[2] = v51;
                      v223[3] = v218;
                    }

                    unsigned int v224 = *v221++;
                    uint64_t v220 = v224;
                  }

                  while ((v224 & 0x80000000) == 0);
                }

                uint64_t v58 = (v218 + 1);
              }

              else
              {
                uint64_t v58 = v218;
              }

              if (*(_DWORD *)(v41 + 84))
              {
                if ((v304 & 0x80000000) == 0)
                {
                  int v225 = *(unsigned int **)(v41 + 40);
                  uint64_t v226 = *v225;
                  if ((v226 & 0x80000000) == 0)
                  {
                    int v227 = v225 + 2;
                    do
                    {
                      uint64_t v228 = (int)*(v227 - 1);
                      if (a5[4 * v228] && v59[4 * v228] && a5[4 * v228 + 2] == v59[4 * v228 + 2])
                      {
                        int v229 = v59[4 * v226];
                        if (a5[4 * v226])
                        {
                          if (!v229) {
                            goto LABEL_564;
                          }
LABEL_518:
                          if (v59[4 * v226 + 2] > a5[4 * v226 + 2]) {
                            goto LABEL_564;
                          }
                          goto LABEL_521;
                        }

                        if (!v229) {
                          goto LABEL_518;
                        }
                      }

LABEL_521:
                      unsigned int v230 = *v227;
                      v227 += 2;
                      uint64_t v226 = v230;
                    }

                    while ((v230 & 0x80000000) == 0);
                  }
                }
              }

              uint64_t v231 = v305 + 16LL * *(int *)(v130 + 16);
              if (*(_DWORD *)v231 < v51)
              {
                uint64_t v232 = *v135;
                uint64_t v233 = (int *)*((void *)v303 + 1);
                *(void *)uint64_t v303 = *v135;
                *((void *)v303 + 1) = v59;
                *(_DWORD *)uint64_t v231 = v51;
                *(void *)(v231 + 8) = v303 + 8;
                if (v232 == *(void *)(v41 + 16))
                {
                  if (v304 == -1
                    || (int)v18 >= 1
                    && (*v59 < 1 ? (v234 = -1) : (v234 = v59[2]), *a5 < 1 ? (int v249 = -1) : (int v249 = a5[2]), v234 <= v249))
                  {
                    uint64_t v250 = v58;
                    _platform_memmove();
                    uint64_t v58 = v250;
                    unsigned int v304 = v51;
                  }
                }

                v303 += 16;
                int v59 = v233;
                goto LABEL_563;
              }

              unint64_t v235 = 0LL;
              v236 = *(int **)(v41 + 32);
              __darwin_ct_rune_t v237 = *(int ***)(v231 + 8);
              __int128 v238 = *v237;
              break;
            default:
              goto LABEL_484;
          }

          break;
        }

        while (1)
        {
          int v240 = *v236++;
          int v239 = v240;
          if (v240 == 2) {
            break;
          }
          if (v239 != 1)
          {
            if (v239) {
              goto LABEL_550;
            }
            int v241 = v238[v235 / 4 + 2];
            v242 = &v59[v235 / 4];
            goto LABEL_544;
          }

          int v243 = v59[v235 / 4];
          int v244 = v238[v235 / 4];
          if (!v243) {
            goto LABEL_546;
          }
          if (!v244) {
            goto LABEL_553;
          }
          int v245 = v59[v235 / 4 + 1];
          int v246 = &v238[v235 / 4];
LABEL_540:
          int v247 = v245 - v246[1];
          if (v247) {
            goto LABEL_552;
          }
          int v247 = v244 - v243;
          if (v244 != v243) {
            goto LABEL_552;
          }
          if (v243 != 1)
          {
            int v241 = v59[v235 / 4 + 2];
            v242 = &v238[v235 / 4];
LABEL_544:
            int v247 = v241 - v242[2];
            if (v247) {
              goto LABEL_552;
            }
          }

LABEL_550:
          v235 += 16LL;
          if (v125 == v235) {
            goto LABEL_564;
          }
        }

        int v243 = v59[v235 / 4];
        int v244 = v238[v235 / 4];
        if (v243)
        {
          if (!v244) {
            goto LABEL_553;
          }
          int v245 = v238[v235 / 4 + 1];
          int v246 = &v59[v235 / 4];
          goto LABEL_540;
        }

LABEL_546:
        if (v244) {
          int v247 = -1;
        }
        else {
          int v247 = 0;
        }
        if (!v247) {
          goto LABEL_550;
        }
LABEL_552:
        if (v247 < 1) {
          goto LABEL_564;
        }
LABEL_553:
        *__darwin_ct_rune_t v237 = v59;
        if (*v135 != *(void *)(v41 + 16))
        {
          int v59 = v238;
          goto LABEL_564;
        }

        uint64_t v248 = v58;
        _platform_memmove();
        uint64_t v58 = v248;
        unsigned int v304 = v51;
        int v59 = v238;
LABEL_563:
        uint64_t v125 = 16LL * v18;
LABEL_564:
        uint64_t v251 = *(void *)(v130 + 64);
        BOOL v135 = (uint64_t *)(v130 + 64);
        v130 += 56LL;
        if (v251) {
          continue;
        }
        break;
      }

LABEL_568:
      uint64_t v130 = *((void *)v312 + 2);
      v312 += 16;
      if (v130) {
        continue;
      }
      break;
    }

LABEL_571:
    *(void *)uint64_t v303 = 0LL;
    uint64_t v42 = v275;
    uint64_t v60 = v276;
    int v39 = v266;
    int v40 = v267;
  }

  if ((_DWORD)v18 && v303 != v60)
  {
    if (v40 < 0) {
      goto LABEL_245;
    }
LABEL_94:
    if (v51 < v40)
    {
      unsigned int v48 = v313;
      goto LABEL_246;
    }
  }

LABEL_581:
  unsigned int *v257 = v304;
  free(v258);
  return v304 >> 31;
}

_OWORD *tre_mem_new_impl(int a1, _OWORD *a2)
{
  if (!a1) {
    return calloc(1uLL, 0x30uLL);
  }
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return a2;
}

void tre_mem_destroy(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    do
    {
      free(*(void **)v2);
      uint64_t v3 = *(void *)(v2 + 8);
      free((void *)v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  free(a1);
}

char *tre_mem_alloc_impl(uint64_t a1, int a2, char *a3, int a4, size_t a5)
{
  if (*(_DWORD *)(a1 + 32)) {
    return 0LL;
  }
  size_t v9 = *(void *)(a1 + 24);
  if (v9 >= a5)
  {
    uint64_t v5 = *(char **)(a1 + 16);
    goto LABEL_8;
  }

  if (!a2)
  {
    if (8 * a5 <= 0x400) {
      size_t v9 = 1024LL;
    }
    else {
      size_t v9 = 8 * a5;
    }
    unsigned int v11 = malloc(0x10uLL);
    if (v11)
    {
      int v12 = v11;
      uint64_t v5 = (char *)malloc(v9);
      *int v12 = v5;
      if (v5)
      {
        v12[1] = 0LL;
        uint64_t v13 = *(void *)(a1 + 8);
        if (v13) {
          *(void *)(v13 + 8) = v12;
        }
        if (!*(void *)a1) {
          *(void *)a1 = v12;
        }
        *(void *)(a1 + 8) = v12;
        goto LABEL_8;
      }

      free(v12);
    }

    else
    {
      uint64_t v5 = 0LL;
    }

uint64_t tre_parse(uint64_t a1)
{
  int v209 = 0LL;
  uint64_t v2 = *(int **)(a1 + 8);
  int v3 = tre_stack_num_objects((uint64_t)v2);
  int v4 = v3;
  if (!*(_DWORD *)(a1 + 88))
  {
    tre_stack_push_int(v2, *(_DWORD *)(a1 + 84));
    tre_stack_push_int(v2, *(_DWORD *)(a1 + 60));
    tre_stack_push_int(v2, 2u);
    ++*(_DWORD *)(a1 + 60);
  }

  tre_stack_push_int(v2, 0);
  uint64_t v5 = tre_stack_push_int(v2, 0);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = v6 + 4LL * *(int *)(a1 + 56);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  if ((int)tre_stack_num_objects((uint64_t)v2) <= v4 || (_DWORD)v5 != 0)
  {
    if ((_DWORD)v5) {
      return v5;
    }
    goto LABEL_9;
  }

  uint64_t v9 = 0LL;
  int v10 = 0;
  unsigned int v11 = &__c_locale;
LABEL_11:
  switch(tre_stack_pop_int((uint64_t)v2))
  {
    case 0u:
      unsigned int v12 = tre_stack_pop_int((uint64_t)v2);
      int v13 = *(_DWORD *)(a1 + 84);
      if ((v13 & 0x10) == 0 && (v13 & 0x101) != 0)
      {
        uint64_t v14 = tre_stack_push_int(v2, 7u);
        if ((_DWORD)v14) {
          goto LABEL_293;
        }
      }

      uint64_t v14 = tre_stack_push_int(v2, v12);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v15 = v2;
      unsigned int v16 = 3;
      goto LABEL_46;
    case 1u:
      int v17 = tre_stack_pop_int((uint64_t)v2);
      uint64_t v18 = *(int **)(a1 + 24);
      unint64_t v19 = *(void *)(a1 + 40);
      unsigned int v20 = *(_DWORD *)(a1 + 84);
      if ((v20 & 0x10) != 0) {
        goto LABEL_304;
      }
      int v21 = *v18;
      if (*v18 <= 45)
      {
        if (v21 == 36)
        {
          if ((v20 & 1) == 0)
          {
            if ((unint64_t)(v18 + 2) < v19 && v18[1] == 92)
            {
            }

            else if (v18 + 1 != (int *)v19)
            {
              goto LABEL_304;
            }
          }

          uint64_t v57 = *(void *)a1;
          int v58 = 2;
          goto LABEL_377;
        }

        if (v21 != 40)
        {
LABEL_93:
          int v209 = tre_ast_new_literal(*(void *)a1, -1, -1, -1);
          if (!v209) {
            return 12LL;
          }
          if ((*(_BYTE *)(a1 + 84) & 1) != 0) {
            goto LABEL_372;
          }
          goto LABEL_140;
        }

        if ((~v20 & 0x101) == 0 && v18[1] == 63)
        {
          int v207 = v11;
          BOOL v64 = v18 + 2;
          int v65 = v18 + 3;
          int v66 = 1;
          unsigned int v67 = *(_DWORD *)(a1 + 84);
          while (1)
          {
            int v68 = *v64;
            if (*v64 > 84)
            {
              switch(v68)
              {
                case 'U':
                  unsigned int v67 = v67 & 0xFFFFFFBF | ((v66 != 0) << 6);
                  break;
                case 'i':
                  unsigned int v67 = v67 & 0xFFFFFFFD | (2 * (v66 != 0));
                  break;
                case 'n':
                  unsigned int v67 = v67 & 0xFFFFFFF7 | (8 * (v66 != 0));
                  break;
                default:
                  goto LABEL_512;
              }
            }

            else
            {
              if (v68 <= 44)
              {
                if (v68 == 35)
                {
                  *(void *)(a1 + 24) = v64;
                  do
                  {
                    *(void *)(a1 + 24) = v65;
                    int v162 = *v65++;
                  }

                  while (v162 != 41);
                  BOOL v64 = v65 - 1;
                }

                else
                {
                  if (v68 != 41) {
                    goto LABEL_512;
                  }
                  *(void *)(a1 + 24) = v64;
                }

                *(void *)(a1 + 24) = v64 + 1;
                uint64_t v154 = tre_stack_push_int(v2, 0);
                if ((_DWORD)v154) {
                  goto LABEL_427;
                }
                v155 = v2;
                unsigned int v156 = 1;
LABEL_426:
                uint64_t v154 = tre_stack_push_int(v155, v156);
                if ((_DWORD)v154)
                {
LABEL_427:
                  uint64_t v5 = v154;
                }

                else
                {
                  uint64_t v5 = 0LL;
                  *(_DWORD *)(a1 + 84) = v67;
                }

LABEL_428:
                unsigned int v11 = v207;
LABEL_373:
                if ((int)tre_stack_num_objects((uint64_t)v2) <= v4 || (_DWORD)v5)
                {
                  if ((_DWORD)v5) {
                    return v5;
                  }
LABEL_9:
                  uint64_t v5 = 0LL;
                  *(void *)(a1 + 16) = v209;
                  return v5;
                }

                goto LABEL_11;
              }

              if (v68 != 45)
              {
                if (v68 == 58)
                {
                  *(void *)(a1 + 24) = v64 + 1;
                  uint64_t v9 = (v9 + 1);
                  uint64_t v154 = tre_stack_push_int(v2, v20);
                  if (!(_DWORD)v154)
                  {
                    uint64_t v154 = tre_stack_push_int(v2, *(_DWORD *)(a1 + 64));
                    if (!(_DWORD)v154)
                    {
                      uint64_t v154 = tre_stack_push_int(v2, 2u);
                      if (!(_DWORD)v154)
                      {
                        ++*(_DWORD *)(a1 + 64);
                        uint64_t v154 = tre_stack_push_int(v2, 0);
                        if (!(_DWORD)v154)
                        {
                          v155 = v2;
                          unsigned int v156 = 0;
                          goto LABEL_426;
                        }
                      }
                    }
                  }

                  goto LABEL_427;
                }

LABEL_512:
                *(void *)(a1 + 24) = v64;
                return 13LL;
              }

              int v66 = 0;
            }

            ++v64;
            ++v65;
          }
        }

        if ((v20 & 1) == 0) {
          goto LABEL_304;
        }
        int v69 = *(int **)(a1 + 24);
        goto LABEL_289;
      }

      if (v21 > 91)
      {
        if (v21 != 92)
        {
          if (v21 == 94 && (*(_DWORD *)(a1 + 84) & 1 | v17 || v18 == *(int **)(a1 + 32)))
          {
            uint64_t v57 = *(void *)a1;
            int v58 = 1;
LABEL_377:
            int v209 = tre_ast_new_literal(v57, -2, v58, -1);
            if (!v209) {
              return 12LL;
            }
            uint64_t v5 = 0LL;
            goto LABEL_367;
          }

LABEL_304:
          if (v10 && (unint64_t)(v18 + 1) < v19 && *v18 == 92 && v18[1] == 69)
          {
            *(_DWORD *)(a1 + 84) &= ~v10;
            *(void *)(a1 + 24) = v18 + 2;
            if ((unint64_t)(v18 + 2) < v19)
            {
              uint64_t v122 = tre_stack_push_int(v2, 0);
              if (!(_DWORD)v122) {
                uint64_t v122 = tre_stack_push_int(v2, 1u);
              }
              uint64_t v5 = v122;
              int v10 = 0;
              goto LABEL_373;
            }

            int v209 = tre_ast_new_literal(*(void *)a1, -1, -1, -1);
            if (v209)
            {
              int v10 = 0;
              goto LABEL_372;
            }

            return 12LL;
          }

          int v123 = *(_DWORD *)(a1 + 84);
          if ((v123 & 0x10) != 0)
          {
LABEL_328:
            if ((v123 & 2) == 0) {
              goto LABEL_329;
            }
            uint64_t v127 = *v18;
            if (v127 > 0x7F)
            {
              int v129 = *(_xlocale **)(a1 + 48);
              if (v127 >= 0x100)
              {
                __int16 v130 = ___runetype_l(v127, v129);
                uint64_t v18 = *(int **)(a1 + 24);
                if (v130 < 0) {
                  goto LABEL_352;
                }
LABEL_342:
                uint64_t v132 = *v18;
                int v133 = &_DefaultRuneLocale;
                if (v132 > 0x7F)
                {
                  int v134 = *(_xlocale **)(a1 + 48);
                  if (v132 >= 0x100)
                  {
                    __int16 v135 = ___runetype_l(v132, v134);
                    uint64_t v18 = *(int **)(a1 + 24);
                    if ((v135 & 0x1000) != 0)
                    {
LABEL_352:
                      uint64_t v137 = *(void *)a1;
                      uint64_t v138 = *v18;
                      if (v138 > 0x7F)
                      {
                        __darwin_ct_rune_t v139 = ___toupper_l(v138, *(locale_t *)(a1 + 48));
                        LODWORD(v138) = **(_DWORD **)(a1 + 24);
                        if (v138 > 0x7F)
                        {
                          __darwin_ct_rune_t v140 = ___toupper_l(v138, *(locale_t *)(a1 + 48));
LABEL_357:
                          int v141 = tre_ast_new_literal(v137, v139, v140, *(_DWORD *)(a1 + 68));
                          if (!v141) {
                            return 12LL;
                          }
                          uint64_t v142 = (uint64_t)v141;
                          int v143 = v11;
                          uint64_t v144 = *(void *)a1;
                          uint64_t v145 = **(unsigned int **)(a1 + 24);
                          if (v145 > 0x7F)
                          {
                            __darwin_ct_rune_t v146 = ___tolower_l(v145, *(locale_t *)(a1 + 48));
                            LODWORD(v145) = **(_DWORD **)(a1 + 24);
                            if (v145 > 0x7F)
                            {
                              __darwin_ct_rune_t v147 = ___tolower_l(v145, *(locale_t *)(a1 + 48));
                              goto LABEL_363;
                            }
                          }

                          else
                          {
                            __darwin_ct_rune_t v146 = _DefaultRuneLocale.__maplower[v145];
                          }

                          __darwin_ct_rune_t v147 = _DefaultRuneLocale.__maplower[v145];
LABEL_363:
                          uint64_t v148 = tre_ast_new_literal(v144, v146, v147, *(_DWORD *)(a1 + 68));
                          if (!v148) {
                            return 12LL;
                          }
                          int v209 = tre_ast_new_union(*(void *)a1, v142, (uint64_t)v148);
                          unsigned int v11 = v143;
                          if (!v209) {
                            return 12LL;
                          }
LABEL_365:
                          uint64_t v5 = 0LL;
                          int v117 = *(_DWORD *)(a1 + 68) + 1;
LABEL_366:
                          *(_DWORD *)(a1 + 68) = v117;
LABEL_367:
                          int v40 = *(int **)(a1 + 24);
LABEL_368:
                          BOOL v52 = v40 + 1;
                          goto LABEL_369;
                        }
                      }

                      else
                      {
                        __darwin_ct_rune_t v139 = _DefaultRuneLocale.__mapupper[v138];
                      }

                      __darwin_ct_rune_t v140 = _DefaultRuneLocale.__mapupper[v138];
                      goto LABEL_357;
                    }

LABEL_329:
                    int v209 = tre_ast_new_literal(*(void *)a1, *v18, *v18, *(_DWORD *)(a1 + 68));
                    if (!v209) {
                      return 12LL;
                    }
                    goto LABEL_365;
                  }

                  int v136 = &__global_locale;
                  if (v134 != (_xlocale *)-1LL) {
                    int v136 = *(void **)(a1 + 48);
                  }
                  if (!v134) {
                    int v136 = v11;
                  }
                  int v133 = *(_RuneLocale **)(v136[166] + 120LL);
                }

                if ((v133->__runetype[v132] & 0x1000) != 0) {
                  goto LABEL_352;
                }
                goto LABEL_329;
              }

              int v131 = &__global_locale;
              if (v129 != (_xlocale *)-1LL) {
                int v131 = *(void **)(a1 + 48);
              }
              if (!v129) {
                int v131 = v11;
              }
              __int32 v128 = *(_RuneLocale **)(v131[166] + 120LL);
            }

            else
            {
              __int32 v128 = &_DefaultRuneLocale;
            }

            if ((v128->__runetype[v127] & 0x8000) != 0) {
              goto LABEL_352;
            }
            goto LABEL_342;
          }

          if ((unint64_t)v18 >= v19)
          {
            else {
              return 8LL;
            }
          }

          if ((v123 & 1) == 0)
          {
            uint64_t v124 = 2LL;
            goto LABEL_322;
          }

          int v125 = *v18;
          if (*v18 <= 122)
          {
            goto LABEL_328;
          }

          if (v125 == 123)
          {
            uint64_t v124 = 1LL;
LABEL_322:
            *(void *)(a1 + 24) = &v18[v124];
            uint64_t v126 = tre_parse_bound(a1, 0LL);
            if ((_DWORD)v126 != 1)
            {
              uint64_t v5 = v126;
              if ((_DWORD)v126) {
                return v5;
              }
              return 13LL;
            }

            uint64_t v18 = (int *)(*(void *)(a1 + 24) - 4LL);
            *(void *)(a1 + 24) = v18;
            int v123 = *(_DWORD *)(a1 + 84);
            goto LABEL_328;
          }

          if (v125 != 124) {
            goto LABEL_328;
          }
          return 14LL;
        }

        if ((v20 & 1) != 0 || (int v69 = v18 + 1, (unint64_t)(v18 + 1) >= v19))
        {
LABEL_181:
          int v207 = v11;
          BOOL v71 = v18 + 1;
          if ((v20 & 0x100) == 0)
          {
            *(void *)(a1 + 24) = v71;
LABEL_184:
            if ((v20 & 0x101) == 1
              || (v72 = iswdigit_l(*v71, *(locale_t *)(a1 + 48)), BOOL v71 = *(int **)(a1 + 24), !v72)
              || (int v73 = *v71 - 48, *v71 == 48))
            {
              uint64_t v24 = tre_ast_new_literal(*(void *)a1, *v71, *v71, *(_DWORD *)(a1 + 68));
              int v209 = v24;
              ++*(_DWORD *)(a1 + 68);
            }

            else
            {
              uint64_t v24 = tre_ast_new_literal(*(void *)a1, -4, *v71 - 48, *(_DWORD *)(a1 + 68));
              int v209 = v24;
              if (!v24) {
                return 12LL;
              }
              int32x2_t v163 = *(int32x2_t *)(a1 + 64);
              *((_DWORD *)v24 + 13) = v163.i32[0];
              *(int32x2_t *)(a1 + 64) = vadd_s32(v163, (int32x2_t)0x100000001LL);
              int v164 = *(_DWORD *)(a1 + 72);
              int v165 = *(_DWORD *)(a1 + 76) + 1;
              if (v73 > v164) {
                int v164 = v73;
              }
              *(_DWORD *)(a1 + 72) = v164;
              *(_DWORD *)(a1 + 76) = v165;
            }

            unsigned int v11 = v207;
            uint64_t v25 = *(void *)(a1 + 24) + 4LL;
LABEL_189:
            *(void *)(a1 + 24) = v25;
            goto LABEL_190;
          }

          tre_expand_macro(v18 + 1, v19, __str);
          if (*(_DWORD *)__str)
          {
            __int128 v118 = *(_OWORD *)(a1 + 80);
            *((_OWORD *)&v215._mbstateL + 4) = *(_OWORD *)(a1 + 64);
            *((_OWORD *)&v215._mbstateL + 5) = v118;
            __int128 v119 = *(_OWORD *)(a1 + 112);
            *((_OWORD *)&v215._mbstateL + 6) = *(_OWORD *)(a1 + 96);
            *((_OWORD *)&v215._mbstateL + 7) = v119;
            __int128 v120 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)v215.__mbstate8 = *(_OWORD *)a1;
            *((_OWORD *)&v215._mbstateL + 1) = v120;
            __int128 v121 = *(_OWORD *)(a1 + 48);
            *((_OWORD *)&v215._mbstateL + 2) = *(_OWORD *)(a1 + 32);
            *((_OWORD *)&v215._mbstateL + 3) = v121;
            *(&v215._mbstateL + 3) = (uint64_t)__str;
            *((_DWORD *)&v215._mbstateL + 14) = wcslen((const __int32 *)__str);
            *((_DWORD *)&v215._mbstateL + 22) = 1;
            uint64_t v5 = tre_parse(&v215);
            if ((_DWORD)v5) {
              return v5;
            }
            *(void *)(a1 + 24) += 8LL;
            *(_DWORD *)(a1 + 68) = *((_DWORD *)&v215._mbstateL + 17);
            int v209 = (char *)*(&v215._mbstateL + 2);
            goto LABEL_428;
          }

          int v153 = *v71;
          if (*v71 == 81)
          {
            *(_DWORD *)(a1 + 84) = v20 | 0x10;
            v10 |= 0x10u;
            *(void *)(a1 + 24) = v18 + 2;
            uint64_t v154 = tre_stack_push_int(v2, 0);
            if (!(_DWORD)v154) {
              uint64_t v154 = tre_stack_push_int(v2, 1u);
            }
            goto LABEL_427;
          }

          *(void *)(a1 + 24) = v71;
          if (v153 <= 65)
          {
            if (v153 == 60)
            {
              uint64_t v160 = *(void *)a1;
              int v161 = 8;
            }

            else
            {
              if (v153 != 62) {
                goto LABEL_184;
              }
              uint64_t v160 = *(void *)a1;
              int v161 = 16;
            }
          }

          else
          {
            switch(v153)
            {
              case 'B':
                uint64_t v160 = *(void *)a1;
                int v161 = 64;
                break;
              case 'x':
                BOOL v71 = v18 + 2;
                wint_t v186 = v18[2];
                *(void *)(a1 + 24) = v18 + 2;
                if (v186 == 123 || (unint64_t)v71 >= v19)
                {
                  int v194 = v18 + 3;
                  *(void *)(a1 + 24) = v18 + 3;
                  if ((uint64_t)(v19 - (void)(v18 + 3)) < 0)
                  {
                    LODWORD(v195) = 0;
                  }

                  else
                  {
                    uint64_t v195 = 0LL;
                    do
                    {
                      if (v195 == 32) {
                        return 9LL;
                      }
                      if (*v194 == 125) {
                        break;
                      }
                      if (!iswxdigit_l(*v194, *(locale_t *)(a1 + 48))) {
                        return 9LL;
                      }
                      BOOL v71 = *(int **)(a1 + 24);
                      int v194 = v71 + 1;
                      __str[v195++] = *v71;
                      *(void *)(a1 + 24) = v71 + 1;
                    }

                    while ((uint64_t)(*(void *)(a1 + 40) - (void)(v71 + 1)) >= 0);
                  }

                  *(void *)(a1 + 24) = v71 + 2;
                  __str[v195] = 0;
                }

                else
                {
                  __str[2] = 0;
                  *(_WORD *)__str = 0;
                  int v187 = iswxdigit_l(v186, *(locale_t *)(a1 + 48));
                  uint64_t v188 = *(wint_t **)(a1 + 24);
                  if (v187 && (unint64_t)v188 < *(void *)(a1 + 40))
                  {
                    wint_t v189 = *v188++;
                    __str[0] = v189;
                    *(void *)(a1 + 24) = v188;
                  }

                  if (iswxdigit_l(*v188, *(locale_t *)(a1 + 48)))
                  {
                    int v190 = *(_DWORD **)(a1 + 24);
                    if ((unint64_t)v190 < *(void *)(a1 + 40))
                    {
                      __str[1] = *v190;
                      *(void *)(a1 + 24) = v190 + 1;
                    }
                  }
                }

                int v196 = strtol(__str, 0LL, 16);
                uint64_t v24 = tre_ast_new_literal(*(void *)a1, v196, v196, *(_DWORD *)(a1 + 68));
                int v209 = v24;
                ++*(_DWORD *)(a1 + 68);
LABEL_471:
                unsigned int v11 = v207;
LABEL_190:
                if (!v24) {
                  return 12LL;
                }
LABEL_372:
                uint64_t v5 = 0LL;
                goto LABEL_373;
              case 'b':
                uint64_t v160 = *(void *)a1;
                int v161 = 32;
                break;
              default:
                goto LABEL_184;
            }
          }

          uint64_t v24 = tre_ast_new_literal(v160, -2, v161, -1);
          int v209 = v24;
          *(void *)(a1 + 24) += 4LL;
          goto LABEL_471;
        }

        int v70 = *v69;
        if (*v69 != 40)
        {
          if (v70 != 41)
          {
            if (v70 == 123) {
              goto LABEL_304;
            }
            goto LABEL_181;
          }

          *(void *)(a1 + 24) = v69;
          if (!(_DWORD)v9) {
            return 8LL;
          }
          goto LABEL_93;
        }

LABEL_289:
        *(void *)(a1 + 24) = v69 + 1;
        uint64_t v14 = tre_stack_push_int(v2, v20);
        if (!(_DWORD)v14)
        {
          uint64_t v14 = tre_stack_push_int(v2, *(_DWORD *)(a1 + 60));
          if (!(_DWORD)v14)
          {
            uint64_t v14 = tre_stack_push_int(v2, 2u);
            if (!(_DWORD)v14)
            {
              uint64_t v14 = tre_stack_push_int(v2, (*(_DWORD *)(a1 + 84) & 1) == 0);
              if (!(_DWORD)v14)
              {
                uint64_t v5 = tre_stack_push_int(v2, 0);
                if (!(_DWORD)v5)
                {
                  ++*(_DWORD *)(a1 + 60);
                  uint64_t v9 = (v9 + 1);
                }

                goto LABEL_373;
              }
            }
          }
        }

LABEL_293:
        uint64_t v5 = v14;
        goto LABEL_373;
      }

      if (v21 == 46)
      {
        uint64_t v61 = *(void *)a1;
        int v62 = *(_DWORD *)(a1 + 68);
        if ((v20 & 8) != 0)
        {
          uint64_t v114 = tre_ast_new_literal(v61, 0, 9, v62);
          if (!v114) {
            return 12LL;
          }
          uint64_t v115 = (uint64_t)v114;
          uint64_t v116 = tre_ast_new_literal(*(void *)a1, 11, 0x7FFFFFFF, *(_DWORD *)(a1 + 68) + 1);
          if (!v116) {
            return 12LL;
          }
          int v209 = tre_ast_new_union(*(void *)a1, v115, (uint64_t)v116);
          if (!v209) {
            return 12LL;
          }
          int v63 = 2;
        }

        else
        {
          int v209 = tre_ast_new_literal(v61, 0, 0x7FFFFFFF, v62);
          if (!v209) {
            return 12LL;
          }
          int v63 = 1;
        }

        uint64_t v5 = 0LL;
        int v117 = *(_DWORD *)(a1 + 68) + v63;
        goto LABEL_366;
      }

      if (v21 != 91) {
        goto LABEL_304;
      }
      *(void *)(a1 + 24) = v18 + 1;
      if ((uint64_t)(v19 - (void)(v18 + 1)) >= 21 && v18[1] == 91 && v18[2] == 58)
      {
        int v22 = v18[3];
        if ((v22 | 2) == 0x3E && v18[4] == 58 && v18[5] == 93 && v18[6] == 93)
        {
          if (v22 == 60) {
            int v23 = 8;
          }
          else {
            int v23 = 16;
          }
          uint64_t v24 = tre_ast_new_literal(*(void *)a1, -2, v23, -1);
          int v209 = v24;
          uint64_t v25 = *(void *)(a1 + 24) + 24LL;
          goto LABEL_189;
        }
      }

      int v74 = calloc(1uLL, 0x108uLL);
      int v210 = v74;
      if (!v74) {
        return 12LL;
      }
      uint64_t v75 = *(__int32 **)(a1 + 24);
      if (*v75 == 94)
      {
        v74[1] |= 1u;
        *(void *)(a1 + 24) = ++v75;
      }

      unint64_t v76 = *(void *)(a1 + 40);
      int v214 = 32;
      int v208 = v11;
      if ((unint64_t)v75 >= v76)
      {
        uint64_t v5 = 7LL;
LABEL_410:
        __uint32_t v158 = 0LL;
        v159 = v210;
        goto LABEL_411;
      }

      uint64_t v202 = 0LL;
      __ptr = 0LL;
      *(_DWORD *)&v201[8] = 0;
      int v77 = 0;
      unsigned int v205 = v9;
      int v206 = 0;
      *(void *)v201 = v74[1];
      int v78 = -1;
      int v204 = v10;
      while (1)
      {
        __int32 v79 = *v75;
        if (*v75 == 93) {
          break;
        }
        if (v79 != 91)
        {
          if (v79 != 45)
          {
            __int32 v212 = *v75;
            goto LABEL_222;
          }

          if (v75 != *(__int32 **)(a1 + 24))
          {
            if (v78 >= 1)
            {
              __int32 v212 = 45;
              goto LABEL_223;
            }

            if (v75[1] != 93)
            {
              if (v78 < 0) {
                goto LABEL_472;
              }
              int v78 = 1;
              goto LABEL_251;
            }

            __int32 v79 = 45;
            __int32 v212 = 45;
            goto LABEL_244;
          }

          int v78 = 0;
          __int32 v80 = 45;
          goto LABEL_239;
        }

        __int128 v81 = v75 + 1;
        int v82 = *v81;
        if (*v81 == 61 || v82 == 58)
        {
          if (v78 > 0) {
            goto LABEL_472;
          }
          if (!(v206 | v78))
          {
            int v93 = v77;
            uint64_t v94 = tre_new_item(1, v213, &v214, (int **)&v210);
            int v77 = v93;
            if ((_DWORD)v94)
            {
LABEL_480:
              uint64_t v5 = v94;
              goto LABEL_406;
            }
          }

          __int16 v95 = v75 + 2;
          uint64_t v96 = 0LL;
          uint64_t v97 = 0LL;
          uint64_t v98 = 0LL;
          while (1)
          {
            if (v75[v98 + 2] == v82)
            {
              int v99 = &v75[v98 + 3];
              if (*v99 == 93) {
                break;
              }
            }

            ++v98;
            v97 += 0x100000000LL;
            --v96;
          }

          if (!v96)
          {
LABEL_388:
            if (v82 == 61) {
              uint64_t v5 = 3LL;
            }
            else {
              uint64_t v5 = 4LL;
            }
LABEL_406:
            uint64_t v157 = __ptr;
LABEL_407:
            if (v157) {
              free(v157);
            }
LABEL_409:
            uint64_t v9 = v205;
            goto LABEL_410;
          }

          int v101 = v77;
          uint64_t v75 = (__int32 *)((char *)v75 + v98 * 4 + 12);
          if (v82 != 61)
          {
            uint64_t v9 = v205;
            if (!v206)
            {
              uint64_t v105 = v97 >> 32;
              else {
                size_t v106 = v105;
              }
              int v107 = v95;
              size_t v108 = v106;
              wcsncpy((__int32 *)__str, v107, v106);
              *(_DWORD *)&__str[4 * v108] = 0;
              v211 = (__int32 *)__str;
              memset(&v215, 0, sizeof(v215));
              v224[(int)wcsrtombs_l(v224, (const __int32 **)&v211, 0x40uLL, &v215, *(locale_t *)(a1 + 48))] = 0;
              wctype_t v109 = wctype_l(v224, *(locale_t *)(a1 + 48));
              if (!v109)
              {
                uint64_t v5 = 4LL;
                goto LABEL_406;
              }

              int v103 = v109;
              int v104 = 4;
LABEL_272:
              uint64_t v94 = tre_new_item(v104, v103, &v214, (int **)&v210);
              if ((_DWORD)v94) {
                goto LABEL_480;
              }
            }

LABEL_244:
          if (v206)
          {
LABEL_245:
            int v78 = 0;
            goto LABEL_250;
          }

          if (!v78)
          {
            int v100 = v77;
            uint64_t v94 = tre_new_item(1, v213, &v214, (int **)&v210);
            if ((_DWORD)v94) {
              goto LABEL_480;
            }
            __int32 v79 = v212;
            int v77 = v100;
          }

LABEL_249:
          int v78 = 0;
          __int32 v213 = v79;
          goto LABEL_250;
        }

        if ((v201[0] & 1) != 0) {
          goto LABEL_397;
        }
        if (v78 > 0)
        {
LABEL_472:
          uint64_t v5 = 11LL;
          goto LABEL_406;
        }

        uint64_t v110 = *(void *)&v201[4];
        uint64_t v111 = (uint64_t)v202;
        if (!v202)
        {
          __ptr = (uint64_t *)malloc(0x120uLL);
          if (!__ptr) {
            goto LABEL_500;
          }
          uint64_t v111 = (uint64_t)(__ptr + 2);
          uint64_t v110 = 16LL;
        }

        uint64_t v112 = (int)v110;
        if ((int)v110 >= (v111 - (uint64_t)__ptr) >> 4)
        {
          *(void *)&v201[4] = v110;
        }

        else
        {
          *(void *)&v201[4] = (2 * v110);
          uint64_t v113 = (uint64_t *)realloc(__ptr, 16LL * (*(_DWORD *)&v201[4] + 2));
          if (!v113)
          {
            free(__ptr);
LABEL_500:
            uint64_t v5 = 12LL;
            goto LABEL_409;
          }

          uint64_t v111 = (uint64_t)&v113[2 * v112 + 2];
          __ptr = v113;
        }

        *(void *)uint64_t v111 = v198;
        *(_DWORD *)(v111 + 8) = (unint64_t)(v85 * 4) >> 2;
        uint64_t v202 = (void *)(v111 + 16);
        int v78 = -1;
        int v206 = 1;
        uint64_t v9 = v205;
        int v77 = v200;
LABEL_251:
        if ((unint64_t)++v75 >= v76)
        {
LABEL_405:
          uint64_t v5 = 7LL;
          goto LABEL_406;
        }
      }

      if (v75 == *(__int32 **)(a1 + 24))
      {
        int v78 = 0;
        __int32 v80 = 93;
LABEL_239:
        __int32 v213 = v80;
LABEL_250:
        ++v77;
        goto LABEL_251;
      }

      if (!v206)
      {
        uint64_t v157 = __ptr;
        if (!v78)
        {
          uint64_t v5 = tre_new_item(1, v213, &v214, (int **)&v210);
          if ((_DWORD)v5) {
            goto LABEL_407;
          }
        }

        *(void *)(a1 + 24) = v75 + 1;
        uint64_t v9 = v205;
        goto LABEL_477;
      }

      __int16 v166 = __ptr;
      if (!__ptr)
      {
LABEL_477:
        char v191 = tre_ast_new_literal(*(void *)a1, 0, 0x7FFFFFFF, *(_DWORD *)(a1 + 68));
        __uint32_t v158 = v191;
        v159 = v210;
        if (v191
          && (uint64_t v192 = *(void *)v191,
              int v193 = tre_mem_alloc_impl(*(void *)a1, 0, 0LL, 0, 8LL * *(int *)v210 + 8),
              (*(void *)(v192 + 16) = v193) != 0LL))
        {
          _platform_memmove();
          uint64_t v5 = 0LL;
        }

        else
        {
          uint64_t v5 = 12LL;
        }

LABEL_411:
        free(v159);
        ++*(_DWORD *)(a1 + 68);
        int v209 = v158;
LABEL_412:
        unsigned int v11 = v208;
        goto LABEL_413;
      }

      uint64_t *__ptr = (uint64_t)(v75 + 1);
      *((_DWORD *)__ptr + 2) = v77;
      *uint64_t v202 = 0LL;
      free(v210);
      uint64_t v167 = *__ptr;
      uint64_t v168 = *(void *)(a1 + 24);
      uint64_t v169 = malloc(*__ptr - v168 + 8);
      if (!v169)
      {
        free(__ptr);
        uint64_t v5 = 12LL;
        goto LABEL_412;
      }

      uint64_t v170 = v9;
      char v171 = v169;
      unsigned int v172 = (char *)v169;
      if (*((int *)__ptr + 2) >= 1)
      {
        *uint64_t v169 = 91;
        BOOL v173 = v169 + 1;
        uint64_t v174 = __ptr[2];
        if (v174)
        {
          int v175 = __ptr + 4;
          uint64_t v176 = v168;
          do
          {
            if (v174 - v176 >= 9)
            {
              uint64_t v177 = v174 - v176 - 8;
              _platform_memmove();
              BOOL v173 = (_DWORD *)((char *)v173 + v177);
              uint64_t v174 = *(v175 - 2);
            }

            uint64_t v176 = v174 + 4LL * *((int *)v175 - 2) + 8;
            uint64_t v178 = *v175;
            v175 += 2;
            uint64_t v174 = v178;
          }

          while (v178);
          uint64_t v168 = v176;
          uint64_t v167 = *__ptr;
        }

        _platform_memmove();
        uint64_t v179 = (_DWORD *)((char *)v173 + v167 - v168);
        *uint64_t v179 = 124;
        unsigned int v172 = (char *)(v179 + 1);
        __int16 v166 = __ptr;
      }

      if (v166[2])
      {
        __int16 v180 = v166 + 4;
        do
        {
          _platform_memmove();
          v172 += 4 * *((int *)v180 - 2);
          if (*v180)
          {
            *(_DWORD *)unsigned int v172 = 124;
            v172 += 4;
          }

          uint64_t v181 = *v180;
          v180 += 2;
        }

        while (v181);
      }

      *(_DWORD *)unsigned int v172 = 0;
      __int128 v182 = *(_OWORD *)(a1 + 80);
      __int128 v220 = *(_OWORD *)(a1 + 64);
      __int128 v221 = v182;
      __int128 v183 = *(_OWORD *)(a1 + 112);
      __int128 v222 = *(_OWORD *)(a1 + 96);
      __int128 v223 = v183;
      __int128 v184 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)__str = *(_OWORD *)a1;
      __int128 v217 = v184;
      __int128 v185 = *(_OWORD *)(a1 + 48);
      __int128 v218 = *(_OWORD *)(a1 + 32);
      __int128 v219 = v185;
      *((void *)&v217 + 1) = v171;
      DWORD2(v221) = 1;
      DWORD2(v219) = (unint64_t)(v172 - v171) >> 2;
      DWORD1(v221) |= 1u;
      uint64_t v5 = tre_parse(__str);
      free(v171);
      if ((_DWORD)v5)
      {
        free(__ptr);
      }

      else
      {
        *(void *)(a1 + 24) = *__ptr;
        *(_DWORD *)(a1 + 68) = DWORD1(v220);
        free(__ptr);
        int v209 = (char *)v217;
      }

      uint64_t v9 = v170;
      unsigned int v11 = v208;
      int v10 = v204;
LABEL_413:
      if (!(_DWORD)v5) {
        goto LABEL_373;
      }
      return v5;
    case 2u:
      int v26 = tre_stack_pop_int((uint64_t)v2);
      *(_DWORD *)(a1 + 84) = tre_stack_pop_int((uint64_t)v2);
      int v27 = v209;
      if (*((_DWORD *)v209 + 13) >> 30)
      {
        *((_DWORD *)v209 + 13) = v26;
        if (v26 > 0x3FFFFFFF) {
          goto LABEL_372;
        }
        int v29 = *((_DWORD *)v27 + 14);
      }

      else
      {
        if (v26 > 0x3FFFFFFF) {
          goto LABEL_372;
        }
        int v28 = tre_ast_new_literal(*(void *)a1, -1, -1, -1);
        if (!v28) {
          return 12LL;
        }
        int v27 = tre_ast_new_catenation(*(void *)a1, (uint64_t)v28, (uint64_t)v209);
        if (!v27) {
          return 12LL;
        }
        int v29 = *((_DWORD *)v209 + 14);
        int v209 = v27;
        *((_DWORD *)v27 + 13) = v26;
        *((_DWORD *)v27 + 14) = v29;
      }

      uint64_t v5 = 0LL;
      *((_DWORD *)v27 + 14) = v29 + 1;
      goto LABEL_373;
    case 3u:
      unsigned int v30 = tre_stack_pop_int((uint64_t)v2);
      uint64_t v14 = tre_stack_push_int(v2, 5u);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v31 = v2;
      unsigned int v32 = v30;
      goto LABEL_41;
    case 4u:
      unsigned int v33 = tre_stack_pop_int((uint64_t)v2);
      uint64_t v14 = tre_stack_push_int(v2, 9u);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v14 = tre_stack_push_int(v2, v33);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v15 = v2;
      unsigned int v16 = 1;
      goto LABEL_46;
    case 5u:
      uint64_t v34 = *(int **)(a1 + 24);
      unint64_t v35 = *(void *)(a1 + 40);
      int v36 = *(_DWORD *)(a1 + 84);
      if ((v36 & 0x10) != 0) {
        goto LABEL_130;
      }
      int v37 = *v34;
      if ((v36 & 1) != 0 && v37 == 124) {
        goto LABEL_372;
      }
      if ((*(_DWORD *)(a1 + 84) & 0x101) == 0x100 && (unint64_t)(v34 + 1) < v35 && v37 == 92)
      {
        if (v34[1] == 124) {
          goto LABEL_372;
        }
      }

      else if ((v36 & 1) != 0 && v37 == 41 && (int)v9 > 0)
      {
        goto LABEL_109;
      }

      if ((v36 & 1) != 0 || (unint64_t)(v34 + 1) >= v35 || v37 != 92 || v34[1] != 41)
      {
LABEL_130:
        uint64_t v14 = tre_stack_push_voidptr(v2, v209);
        if (!(_DWORD)v14)
        {
          uint64_t v14 = tre_stack_push_int(v2, 6u);
          if (!(_DWORD)v14)
          {
            uint64_t v14 = tre_stack_push_int(v2, 5u);
            if (!(_DWORD)v14)
            {
              uint64_t v31 = v2;
              unsigned int v32 = 0;
LABEL_41:
              uint64_t v14 = tre_stack_push_int(v31, v32);
              if (!(_DWORD)v14)
              {
                uint64_t v15 = v2;
                unsigned int v16 = 4;
LABEL_46:
                uint64_t v14 = tre_stack_push_int(v15, v16);
              }
            }
          }
        }

        goto LABEL_293;
      }

      if (!(_DWORD)v9) {
        return 8LL;
      }
LABEL_109:
      uint64_t v9 = (v9 - 1);
      if ((v36 & 0x101) != 0) {
        goto LABEL_372;
      }
      uint64_t v5 = 0LL;
      BOOL v52 = v34 + 2;
LABEL_369:
      *(void *)(a1 + 24) = v52;
      goto LABEL_373;
    case 6u:
      uint64_t v38 = tre_stack_pop_voidptr((uint64_t)v2);
      int v39 = tre_ast_new_catenation(*(void *)a1, v38, (uint64_t)v209);
      if (!v39) {
        return 12LL;
      }
      goto LABEL_77;
    case 7u:
      int v40 = *(int **)(a1 + 24);
      unint64_t v41 = *(void *)(a1 + 40);
      int v42 = *(_DWORD *)(a1 + 84);
      if ((v42 & 0x10) != 0) {
        goto LABEL_372;
      }
      if ((v42 & 1) != 0) {
        goto LABEL_66;
      }
      int v43 = *v40++;
      *(void *)(a1 + 24) = v40;
LABEL_66:
      if (*v40 == 41)
      {
        uint64_t v5 = 0LL;
        goto LABEL_368;
      }

      if (*v40 != 124)
      {
        if ((v42 & 1) != 0) {
          goto LABEL_372;
        }
        uint64_t v5 = 0LL;
        goto LABEL_141;
      }

      uint64_t v14 = tre_stack_push_int(v2, 7u);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v14 = tre_stack_push_voidptr(v2, *(void *)(a1 + 24));
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v14 = tre_stack_push_voidptr(v2, v209);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v14 = tre_stack_push_int(v2, 8u);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v14 = tre_stack_push_int(v2, (*(_DWORD *)(a1 + 84) & 0x101) == 256);
      if ((_DWORD)v14) {
        goto LABEL_293;
      }
      uint64_t v5 = tre_stack_push_int(v2, 3u);
      if ((_DWORD)v5) {
        goto LABEL_373;
      }
      goto LABEL_367;
    case 8u:
      uint64_t v45 = tre_stack_pop_voidptr((uint64_t)v2);
      int v39 = tre_ast_new_union(*(void *)a1, v45, (uint64_t)v209);
      if (!v39) {
        return 12LL;
      }
LABEL_77:
      uint64_t v5 = 0LL;
      int v209 = v39;
      goto LABEL_373;
    case 9u:
      int v46 = *(int **)(a1 + 24);
      unint64_t v47 = *(void *)(a1 + 40);
      unsigned int v48 = *(_DWORD *)(a1 + 84);
      if ((v48 & 0x10) != 0) {
        goto LABEL_372;
      }
      uint64_t v5 = 0LL;
      int v49 = *v46;
      if (*v46 <= 62)
      {
        if (v49 != 42)
        {
          if (v49 != 43) {
            goto LABEL_373;
          }
LABEL_98:
          if ((v48 & 1) == 0) {
            goto LABEL_372;
          }
        }

uint64_t tre_parse_bound(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(_DWORD **)(a1 + 24);
  unsigned int v3 = *(_DWORD *)(a1 + 84);
  unint64_t v4 = *(void *)(a1 + 40);
  if ((unint64_t)v2 >= v4)
  {
    BOOL v13 = (*(_DWORD *)(a1 + 84) & 1) == 0;
    unsigned int v14 = 9;
    goto LABEL_14;
  }

  if ((*v2 - 48) > 9)
  {
    BOOL v13 = (*(_DWORD *)(a1 + 84) & 1) == 0;
    unsigned int v14 = 10;
LABEL_14:
    if (v13) {
      return v14;
    }
    else {
      return 1LL;
    }
  }

  int v7 = (v3 >> 6) & 1;
  int v8 = -1;
  uint64_t v9 = *(_DWORD **)(a1 + 24);
  do
  {
    unsigned int v10 = *v9 - 48;
    if (v10 > 9) {
      break;
    }
    int v8 = v10 + 10 * (v8 & ~(v8 >> 31));
    ++v9;
  }

  while ((unint64_t)v9 < v4);
  if ((unint64_t)v9 < v4 && *v9 == 44)
  {
    ++v9;
    int v11 = -1;
    do
    {
      unsigned int v12 = *v9 - 48;
      if (v12 > 9) {
        break;
      }
      int v11 = v12 + 10 * (v11 & ~(v11 >> 31));
      ++v9;
    }

    while ((unint64_t)v9 < v4);
  }

  else
  {
    int v11 = v8;
  }

  if ((v11 & 0x80000000) == 0)
  {
    uint64_t result = 10LL;
    goto LABEL_25;
  }

LABEL_43:
  if (v7) {
    ++*(_DWORD *)(a1 + 76);
  }
  if (a2)
  {
    int v17 = tre_ast_new_iter(*(void *)a1, *a2, v8, v11, v7);
    *a2 = (uint64_t)v17;
    if (!v17) {
      return 12LL;
    }
  }

  uint64_t result = 0LL;
  *(void *)(a1 + 24) = v16;
  return result;
}

_DWORD *tre_expand_macro(_DWORD *result, unint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  if ((unint64_t)result < a2)
  {
    uint64_t v3 = 0LL;
    while (*result != tre_macros[v3])
    {
      v3 += 16LL;
      if (v3 == 192) {
        return result;
      }
    }

    unint64_t v4 = *(_BYTE **)&tre_macros[v3 + 8];
    LOBYTE(v5) = *v4;
    if (*v4)
    {
      unint64_t v6 = 0LL;
      int v7 = v4 + 1;
      do
      {
        a3[v6] = (char)v5;
        unint64_t v8 = v6 + 1;
        if (v6 > 0x3E) {
          break;
        }
        int v5 = v7[v6++];
      }

      while (v5);
    }

    else
    {
      unint64_t v8 = 0LL;
    }

    a3[v8] = 0;
  }

  return result;
}

uint64_t tre_search_cnames(__int32 *a1, size_t a2)
{
  unint64_t v4 = 0LL;
  unint64_t v5 = 95LL;
  while (1)
  {
    unint64_t v6 = (v4 + v5) >> 1;
    int v7 = (const __int32 *)*(&cnames + 2 * v6);
    int v8 = wcsncmp(a1, v7, a2);
    if (!v8 && !v7[a2]) {
      break;
    }
    if (v8 > 0) {
      unint64_t v4 = v6 + 1;
    }
    else {
      unint64_t v5 = v6 - 1;
    }
    if (v4 > v5) {
      return 0xFFFFFFFFLL;
    }
  }

  return *((unsigned int *)&cnames + 4 * v6 + 2);
}

uint64_t tre_new_item(int a1, int a2, int *a3, int **a4)
{
  unint64_t v6 = *a4;
  int v7 = **a4;
  uint64_t v8 = *a3;
  if (v7 >= (int)v8)
  {
    *a3 = 2 * v8;
    unint64_t v6 = realloc(v6, (16 * v8) | 8);
    if (!v6) {
      return 12LL;
    }
    *a4 = v6;
    int v9 = *v6;
  }

  else
  {
    int v9 = **a4;
  }

  uint64_t v11 = 0LL;
  unsigned int v12 = &v6[2 * v7];
  v12[2] = a1;
  v12[3] = a2;
  *unint64_t v6 = v9 + 1;
  return v11;
}

void *tre_stack_new(int a1, int a2, int a3)
{
  unint64_t v6 = malloc(0x18uLL);
  if (v6)
  {
    int v7 = malloc(8LL * a1);
    v6[2] = v7;
    if (v7)
    {
      *(_DWORD *)unint64_t v6 = a1;
      *((_DWORD *)v6 + 1) = a2;
      *((_DWORD *)v6 + 2) = a3;
      *((_DWORD *)v6 + 3) = 0;
    }

    else
    {
      free(v6);
      return 0LL;
    }
  }

  return v6;
}

void tre_stack_destroy(void **a1)
{
}

uint64_t tre_stack_num_objects(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t tre_stack_push_int(int *a1, unsigned int a2)
{
  return tre_stack_push(a1, a2);
}

uint64_t tre_stack_push(int *a1, uint64_t a2)
{
  int v4 = a1[3];
  int v5 = *a1;
  BOOL v6 = v4 >= *a1;
  if (v4 < *a1)
  {
    int v9 = (void *)*((void *)a1 + 2);
LABEL_12:
    unsigned int v10 = 0;
    v9[v4] = a2;
    ++a1[3];
    char v8 = v6;
  }

  else
  {
    int v7 = a1[1];
    if (v5 >= v7)
    {
      char v8 = 0;
    }

    else
    {
      char v8 = 0;
      do
      {
        if (a1[2] + v5 >= v7) {
          int v5 = v7;
        }
        else {
          v5 += a1[2];
        }
        int v9 = realloc(*((void **)a1 + 2), 8LL * v5);
        if (!v9) {
          break;
        }
        *a1 = v5;
        *((void *)a1 + 2) = v9;
        int v4 = a1[3];
        if (v4 < v5) {
          goto LABEL_12;
        }
        int v7 = a1[1];
        char v8 = 1;
      }

      while (v5 < v7);
    }

    unsigned int v10 = 12;
  }

  if ((v8 & 1) != 0) {
    return 0LL;
  }
  else {
    return v10;
  }
}

uint64_t tre_stack_pop_int(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(int *)(a1 + 12) - 1LL;
  *(_DWORD *)(a1 + 12) = v2;
  return *(unsigned int *)(v1 + 8 * v2);
}

uint64_t tre_stack_pop_voidptr(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(int *)(a1 + 12) - 1LL;
  *(_DWORD *)(a1 + 12) = v2;
  return *(void *)(v1 + 8 * v2);
}

int creat(const char *a1, mode_t a2)
{
  return __open();
}

int sigpause(int a1)
{
  if (!*MEMORY[0x1896005A8]) {
    *MEMORY[0x1896005A8] = 1;
  }
  pthread_testcancel();
  if ((a1 - 32) > 0xFFFFFFE0)
  {
    if ((sigprocmask(1, 0LL, &v3) & 0x80000000) == 0)
    {
      v3 &= ~(1 << (a1 - 1));
      return sigsuspend_NOCANCEL();
    }
  }

  else
  {
    *__error() = 22;
  }

  return -1;
}

int lockf(int a1, int a2, off_t a3)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      int result = __fcntl();
      break;
    case 3:
      int result = __fcntl();
      if (result != -1)
      {
        if (v6 != getpid())
        {
          int v4 = __error();
          int v5 = 35;
          goto LABEL_4;
        }

        int result = 0;
      }

      break;
    default:
      int v4 = __error();
      int v5 = 22;
LABEL_4:
      int *v4 = v5;
      int result = -1;
      break;
  }

  return result;
}

int pause(void)
{
  return sigsuspend(&v1);
}

unsigned int sleep(unsigned int a1)
{
  unsigned int v1 = a1;
  if ((a1 & 0x80000000) != 0) {
    return a1 - 0x7FFFFFFF + sleep(0x7FFFFFFFu);
  }
  __rqtp.tv_sec = a1;
  __rqtp.tv_nsec = 0LL;
  if (nanosleep(&__rqtp, &v3) != -1) {
    return 0;
  }
  if (*__error() == 4)
  {
    if (v3.tv_nsec) {
      return LODWORD(v3.tv_sec) + 1;
    }
    else {
      return v3.tv_sec;
    }
  }

  return v1;
}

int tcdrain(int a1)
{
  return ioctl(a1, 0x2000745EuLL, 0LL);
}

int usleep(useconds_t a1)
{
  v2.tv_sec = a1 / 0xF4240uLL;
  v2.tv_nsec = 1000 * (a1 % 0xF4240);
  return nanosleep(&v2, 0LL);
}

pid_t wait(int *a1)
{
  return __wait4();
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  if ((a3 & 0xFFFFFFEC) == 0) {
    return __wait4();
  }
  *__error() = 22;
  return -1;
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  if (!*MEMORY[0x1896005A8]) {
    *MEMORY[0x1896005A8] = 1;
  }
  pthread_testcancel();
  if (!__rqtp || __rqtp->tv_sec < 0 || __rqtp->tv_nsec >= 0x3B9ACA00uLL) {
    goto LABEL_9;
  }
  if (__rmtp)
  {
    mach_error_t time = clock_get_time(clock_port, &cur_time);
    if (time)
    {
      int v5 = __stderrp;
      int v6 = mach_error_string(time);
      fprintf(v5, "clock_get_time() failed: %s\n", v6);
      goto LABEL_9;
    }
  }

  if ((__semwait_signal() & 0x80000000) == 0) {
    return -1;
  }
  if (*__error() != 60)
  {
    if (*__error() == 4)
    {
      if (__rmtp)
      {
        mach_error_t v8 = clock_get_time(clock_port, &v19);
        if (!v8)
        {
          clock_res_t v11 = cur_time.tv_nsec + LODWORD(__rqtp->tv_nsec);
          if (v11 <= 999999999)
          {
            unsigned int tv_sec = cur_time.tv_sec;
          }

          else
          {
            v11 -= 1000000000;
            unsigned int tv_sec = cur_time.tv_sec + 1;
          }

          unsigned int v13 = tv_sec + LODWORD(__rqtp->tv_sec);
          if (v13 <= v19.tv_sec)
          {
            if (v13 < v19.tv_sec || (clock_res_t tv_nsec = v19.tv_nsec, v11 <= v19.tv_nsec))
            {
              __rmtp->unsigned int tv_sec = 0LL;
              __rmtp->clock_res_t tv_nsec = 0LL;
              return -1;
            }
          }

          else
          {
            clock_res_t tv_nsec = v19.tv_nsec;
          }

          BOOL v15 = __OFSUB__(v11, tv_nsec);
          int v16 = v11 - tv_nsec;
          if (v16 < 0 != v15) {
            int v17 = v16 + 1000000000;
          }
          else {
            int v17 = v16;
          }
          __rmtp->unsigned int tv_sec = v13 + (v16 >> 31) - v19.tv_sec;
          __rmtp->clock_res_t tv_nsec = v17;
          return -1;
        }

        int v9 = __stderrp;
        unsigned int v10 = mach_error_string(v8);
        fprintf(v9, "clock_get_time() failed: %s\n", v10);
      }

      return -1;
    }

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return __recvfrom();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return __sendto();
}

int system(const char *a1)
{
}

FILE *popen_DARWIN_EXTSN(char *a1, char *a2)
{
  if (off_18C52C3C8)
  {
    off_18C52C3C8(a1);
    if (off_18C52C3C8) {
      off_18C52C3C8(a2);
    }
  }

  if (!a2) {
    goto LABEL_9;
  }
  int v4 = _platform_strcmp();
  if (!v4)
  {
    if ((socketpair(1, 1, 0, &v20) & 0x80000000) == 0)
    {
      a2 = "r+";
      goto LABEL_13;
    }

    return 0LL;
  }

  int v5 = *a2;
  if (v5 != 119 && v5 != 114 || a2[1])
  {
LABEL_9:
    int v6 = 0LL;
    *__error() = 22;
    return v6;
  }

  if (pipe(&v20) < 0) {
    return 0LL;
  }
LABEL_13:
  if (*a2 == 114)
  {
    int v6 = (FILE *)fdopen_DARWIN_EXTSN(v20, a2);
    if (v6) {
      goto LABEL_15;
    }
LABEL_19:
    close_NOCANCEL();
    close_NOCANCEL();
    return v6;
  }

  int v6 = (FILE *)fdopen_DARWIN_EXTSN(v21, a2);
  if (!v6) {
    goto LABEL_19;
  }
LABEL_15:
  int v7 = malloc(0x18uLL);
  if (!v7)
  {
    fclose(v6);
    close_NOCANCEL();
    return 0LL;
  }

  mach_error_t v8 = v7;
  int v9 = posix_spawn_file_actions_init(&v17);
  if (v9)
  {
    int v10 = v9;
    fclose(v6);
    close_NOCANCEL();
    free(v8);
    int v6 = 0LL;
    *__error() = v10;
  }

  else
  {
    if (*a2 == 114)
    {
      posix_spawn_file_actions_addclose(&v17, v20);
      if (v21 != 1)
      {
        posix_spawn_file_actions_adddup2(&v17, v21, 1);
        posix_spawn_file_actions_addclose(&v17, v21);
      }

      if (!v4) {
        posix_spawn_file_actions_adddup2(&v17, 1, 0);
      }
    }

    else
    {
      if (v20)
      {
        posix_spawn_file_actions_adddup2(&v17, v20, 0);
        posix_spawn_file_actions_addclose(&v17, v20);
      }

      posix_spawn_file_actions_addclose(&v17, v21);
    }

    pthread_mutex_lock(&__popen_pidlist_mutex);
    for (uint64_t i = __popen_pidlist; i; uint64_t i = *(void *)i)
      posix_spawn_file_actions_addclose(&v17, *(_DWORD *)(i + 16));
    __argv[0] = "sh";
    __argv[1] = "-c";
    __argv[2] = a1;
    __argv[3] = 0LL;
    unsigned int v13 = _NSGetEnviron();
    int v14 = posix_spawn(&v18, "/bin/sh", &v17, 0LL, __argv, *v13);
    pthread_mutex_unlock(&__popen_pidlist_mutex);
    posix_spawn_file_actions_destroy(&v17);
    if (v14)
    {
      if (v14 == 35 || v14 == 12)
      {
        fclose(v6);
        close_NOCANCEL();
        free(v8);
        int v6 = 0LL;
        *__error() = v14;
        return v6;
      }

      pid_t v18 = -1;
    }

    if (*a2 == 114) {
      int v16 = v20;
    }
    else {
      int v16 = v21;
    }
    *((_DWORD *)v8 + 4) = v16;
    close_NOCANCEL();
    v8[1] = v6;
    *((_DWORD *)v8 + 5) = v18;
    pthread_mutex_lock(&__popen_pidlist_mutex);
    *mach_error_t v8 = __popen_pidlist;
    __popen_pidlist = (uint64_t)v8;
    pthread_mutex_unlock(&__popen_pidlist_mutex);
    fwide(v6, -1);
  }

  return v6;
}

uint64_t fdopen_DARWIN_EXTSN(int a1, char *a2)
{
  if (off_18C52C3C8) {
    off_18C52C3C8(a2);
  }
  if (a1 >= 0x8000)
  {
    int v4 = __error();
    uint64_t result = 0LL;
    int v6 = 24;
LABEL_5:
    int *v4 = v6;
    return result;
  }

  int v7 = __sflags(a2, &v11);
  if (!v7) {
    return 0LL;
  }
  __int16 v8 = v7;
  int v9 = fcntl_NOCANCEL();
  if (v9 < 0) {
    return 0LL;
  }
  char v10 = v9;
  if ((v9 & 3) != 2 && (v9 & 3) != (v11 & 3))
  {
    int v4 = __error();
    uint64_t result = 0LL;
    int v6 = 22;
    goto LABEL_5;
  }

  uint64_t result = __sfp(0);
  if (result)
  {
    *(_WORD *)(result + 16) = v8;
    if ((v10 & 8) == 0 && (v11 & 8) != 0) {
      *(_WORD *)(result + 16) = v8 | 0x100;
    }
    *(_WORD *)(result + 18) = a1;
    *(void *)(result + 80) = __swrite;
    *(void *)(result + 64) = __sread;
    *(void *)(result + 72) = __sseek;
    *(void *)(result + 48) = result;
    *(void *)(result + 56) = __sclose;
  }

  return result;
}

uint64_t fopen_DARWIN_EXTSN(uint64_t a1, char *a2)
{
  if (off_18C52C3C8)
  {
    off_18C52C3C8(a1);
    if (off_18C52C3C8) {
      off_18C52C3C8(a2);
    }
  }

  int v3 = __sflags(a2, &v8);
  if (!v3) {
    return 0LL;
  }
  __int16 v4 = v3;
  uint64_t v5 = __sfp(0);
  if (!v5) {
    return v5;
  }
  unsigned int v6 = open_NOCANCEL();
  if ((v6 & 0x80000000) != 0)
  {
    __sfprelease(v5);
    return 0LL;
  }

  if (v6 < 0x8000)
  {
    *(_WORD *)(v5 + 18) = v6;
    *(_WORD *)(v5 + 16) = v4;
    *(void *)(v5 + 80) = __swrite;
    *(void *)(v5 + 64) = __sread;
    *(void *)(v5 + 72) = __sseek;
    *(void *)(v5 + 48) = v5;
    *(void *)(v5 + 56) = __sclose;
    if ((v8 & 8) != 0) {
      _sseek(v5, 0LL, 2LL);
    }
  }

  else
  {
    *(_WORD *)(v5 + 16) = 0;
    close_NOCANCEL();
    uint64_t v5 = 0LL;
    *__error() = 24;
  }

  return v5;
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  int v3 = (_BYTE *)MEMORY[0x1895FE128](a1, a2);
  if (!v3)
  {
    unsigned int v12 = __error();
    int v7 = 0LL;
    int v13 = 22;
LABEL_14:
    *unsigned int v12 = v13;
    return v7;
  }

  uint64_t v5 = v3;
  if (!*v3)
  {
    unsigned int v12 = __error();
    int v7 = 0LL;
    int v13 = 2;
    goto LABEL_14;
  }

  unsigned int v6 = v4;
  int v7 = v4;
  if (!v4)
  {
    int v7 = (char *)malloc(0x400uLL);
    if (!v7) {
      return v7;
    }
  }

  if ((realpath_DARWIN_EXTSN_rootdev_inited & 1) == 0)
  {
    realpath_DARWIN_EXTSN_rootdev_inited = 1;
    if (stat("/", &v40) < 0) {
      goto LABEL_86;
    }
    realpath_DARWIN_EXTSN_rootdev = v40.st_dev;
  }

  __error();
  if (*v5 == 47)
  {
    *(_WORD *)int v7 = 47;
    if (!v5[1]) {
      return v7;
    }
    unint64_t v8 = _platform_strlcpy();
    if (v8 >= 0x400) {
      goto LABEL_83;
    }
    uint64_t v9 = v8;
    char v10 = (stat *)&realpath_DARWIN_EXTSN_rootdev;
    unint64_t v11 = 1LL;
  }

  else
  {
    if (!__private_getcwd(v7, 1024LL, 1))
    {
      *(_WORD *)int v7 = 46;
      goto LABEL_86;
    }

    unint64_t v11 = _platform_strlen();
    unint64_t v15 = _platform_strlcpy();
    if (v15 > 0x3FF || v11 > 0x3FF) {
      goto LABEL_83;
    }
    uint64_t v9 = v15;
    if (v11 < 2)
    {
      char v10 = (stat *)&realpath_DARWIN_EXTSN_rootdev;
    }

    else
    {
      char v10 = &v40;
      if (stat(v7, &v40) < 0) {
        goto LABEL_86;
      }
    }
  }

  if (!v9)
  {
    unint64_t v17 = v11;
LABEL_90:
    if (v17 >= 2 && v7[v17 - 1] == 47) {
      v7[v17 - 1] = 0;
    }
    return v7;
  }

  unsigned int v38 = 0;
  uint64_t st_dev = v10->st_dev;
  while (2)
  {
    unsigned int v39 = v2;
    uint64_t v2 = st_dev;
    unint64_t v17 = v11;
    while (1)
    {
      uint64_t v18 = _platform_strchr();
      uint64_t v19 = v18;
      uint64_t v20 = v18 - (void)v46;
      if (v18) {
        uint64_t v21 = v18 - (void)v46;
      }
      else {
        uint64_t v21 = v9;
      }
      _platform_memmove();
      *((_BYTE *)&v44 + v21) = 0;
      if (v19)
      {
        _platform_memmove();
        v9 += ~v20;
      }

      else
      {
        uint64_t v9 = 0LL;
        v46[0] = 0;
      }

      if (v7[v17 - 1] != 47)
      {
        if (v17 + 1 >= 0x400) {
          goto LABEL_83;
        }
        v7[v17] = 47;
        v7[++v17] = 0;
      }

      if (!(_BYTE)v44 || v44 == 46) {
        goto LABEL_41;
      }
      if (v44 ^ 0x2E2E | v45) {
        break;
      }
      if (v17 >= 2)
      {
        v7[v17 - 1] = 0;
        int v22 = strrchr(v7, 47);
        v22[1] = 0;
        unint64_t v17 = v22 + 1 - v7;
      }

uint64_t getgroups_DARWIN_EXTSN(unsigned int a1, uint64_t a2)
{
  uid_t v4 = getuid();
  uint64_t v5 = getpwuid(v4);
  if (v5)
  {
    if (a1)
    {
      unsigned int v7 = a1;
      if ((MEMORY[0x186DFC2DC](v5->pw_name, v5->pw_gid, a2, &v7) & 0x80000000) == 0) {
        return v7;
      }
    }

    else
    {
      uint64_t result = getgroupcount();
      if ((_DWORD)result) {
        return result;
      }
    }
  }

  *__error() = 22;
  return 0xFFFFFFFFLL;
}

unint64_t __strlcat_chk( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  unint64_t v7 = _platform_strlen();
  uint64_t v8 = _platform_strnlen();
  unint64_t v9 = a3 - v8;
  if (a3 == v8)
  {
    unint64_t v10 = a3;
  }

  else
  {
    unint64_t v10 = v8;
    if (v7 >= v9)
    {
      __chk_overlap(a1, a3, a2, v9 - 1);
      _platform_memmove();
      *(_BYTE *)(a3 + a1 - 1) = 0;
    }

    else
    {
      __chk_overlap(a1, v7 + 1 + v8, a2, v7 + 1);
      _platform_memmove();
    }
  }

  return v10 + v7;
}

void __chk_fail_overflow()
{
}

void __chk_fail_overlap()
{
}

unint64_t __chk_overlap(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 && a4)
  {
    if (result == a3) {
      goto LABEL_6;
    }
    if (result >= a3)
    {
      if (a3 + a4 > result) {
LABEL_6:
      }
        __chk_fail_overlap();
    }

    else if (result + a2 > a3)
    {
      goto LABEL_6;
    }
  }

  return result;
}

uint64_t __memset_chk(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  return _platform_memset();
}

unint64_t __strlcpy_chk( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  unint64_t v7 = _platform_strlcpy();
  unint64_t v8 = v7;
  if (v7 < a3) {
    uint64_t v9 = v7 + 1;
  }
  else {
    uint64_t v9 = a3;
  }
  __chk_overlap(a1, v9, a2, v9);
  return v8;
}

unint64_t __strncat_chk(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = _platform_strlen();
  uint64_t v8 = _platform_strnlen();
  uint64_t v9 = v8 + v7;
  unint64_t v10 = v8 + v7 + 1;
  if (v10 > a4) {
    __chk_fail_overflow();
  }
  if (__chk_assert_no_overlap) {
    __chk_overlap(a1, v10, a2, v8 + 1);
  }
  _platform_memmove();
  *(_BYTE *)(a1 + v9) = 0;
  return a1;
}

char *__strncpy_chk(char *a1, const char *a2, size_t a3, size_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  uint64_t v7 = stpncpy(a1, a2, a3);
  if (__chk_assert_no_overlap)
  {
    if (v7 - a1 == a3) {
      uint64_t v8 = v7 - a1;
    }
    else {
      uint64_t v8 = v7 - a1 + 1;
    }
    __chk_overlap((unint64_t)a1, v8, (unint64_t)a2, v8);
  }

  return a1;
}

uint64_t __memmove_chk(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  return _platform_memmove();
}

unint64_t __strcpy_chk(unint64_t a1, const char *a2, unint64_t a3)
{
  unsigned int v6 = &stpcpy((char *)a1, a2)[-a1 + 1];
  if (__chk_assert_no_overlap) {
    __chk_overlap(a1, (uint64_t)v6, (unint64_t)a2, (uint64_t)v6);
  }
  return a1;
}

uint64_t __memccpy_chk( unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  if (a5 < a4) {
    __chk_fail_overflow();
  }
  uint64_t v8 = _platform_memccpy();
  uint64_t v9 = v8;
  if (v8) {
    uint64_t v10 = v8 - a1;
  }
  else {
    uint64_t v10 = a4;
  }
  __chk_overlap(a1, v10, a2, v10);
  return v9;
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  if (a4 < a2) {
    __chk_fail_overflow();
  }
  return vsnprintf(a1, a2, a5, va);
}

uint64_t __snprintf_object_size_chk(char *a1, size_t a2, size_t __size, char *__format, ...)
{
  if (a2 < __size) {
    __chk_fail_overflow();
  }
  return vsnprintf(a1, __size, __format, va);
}

unint64_t __strcat_chk(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = _platform_strlen();
  uint64_t v7 = _platform_strlen() + 1;
  if (v7 + v6 > a3) {
    __chk_fail_overflow();
  }
  if (__chk_assert_no_overlap) {
    __chk_overlap(a1, v7 + v6, a2, v7);
  }
  _platform_memmove();
  return a1;
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  if (a3 >> 31) {
    return vsprintf(a1, a4, a5);
  }
  int result = vsnprintf(a1, a3, a4, a5);
  if ((result & 0x80000000) == 0 && result >= a3) {
    __chk_fail_overflow();
  }
  return result;
}

char *__stpcpy_chk(char *a1, const char *a2, unint64_t a3)
{
  uint64_t v6 = stpcpy(a1, a2);
  unint64_t v7 = v6 - a1 + 1;
  if (v7 > a3) {
    __chk_fail_overflow();
  }
  uint64_t v8 = v6;
  if (__chk_assert_no_overlap) {
    __chk_overlap((unint64_t)a1, v7, (unint64_t)a2, v7);
  }
  return v8;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  if (a3 >> 31) {
    return vsprintf(a1, a4, va);
  }
  int result = vsnprintf(a1, a3, a4, va);
  if ((result & 0x80000000) == 0 && result >= a3) {
    __chk_fail_overflow();
  }
  return result;
}

uint64_t __sprintf_object_size_chk(char *a1, size_t a2, char *a3, ...)
{
  if (a2 >> 31) {
    return vsprintf(a1, a3, va);
  }
  uint64_t result = vsnprintf(a1, a2, a3, va);
  return result;
}

uint64_t __memcpy_chk(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  return _platform_memmove();
}

char *__stpncpy_chk(char *a1, const char *a2, size_t a3, size_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  unint64_t v7 = stpncpy(a1, a2, a3);
  uint64_t v8 = v7;
  if (__chk_assert_no_overlap)
  {
    if (v7 - a1 == a3) {
      uint64_t v9 = v7 - a1;
    }
    else {
      uint64_t v9 = v7 - a1 + 1;
    }
    __chk_overlap((unint64_t)a1, v9, (unint64_t)a2, v9);
  }

  return v8;
}

int __vsnprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, va_list a6)
{
  if (a4 < a2) {
    __chk_fail_overflow();
  }
  return vsnprintf(a1, a2, a5, a6);
}

void _ffpp_strtoencf32_l_cold_1()
{
  __assert_rtn("_ffpp_strtoencf32_l", "strtofp.c", 2901, "normalizeDigits <= 4 || info.digitCount < 20");
}

void _ffpp_strtoencf32_l_cold_2()
{
  __assert_rtn("_ffpp_strtoencf32_l", "strtofp.c", 2919, "normalizeProduct <= 1");
}

void _ffpp_strtoencf64_l_cold_1()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3156, "normalizeDigits <= 4 || info.digitCount < 20");
}

void _ffpp_strtoencf64_l_cold_2()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3176, "normalizeProduct <= 2");
}

void _ffpp_strtoencf64_l_cold_3()
{
}

void generalSlowpath_cold_1()
{
}

void generalSlowpath_cold_2()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1879, "(workMP.msw - workMP.lsw) <= totalWordsNeeded");
}

void generalSlowpath_cold_3()
{
}

void generalSlowpath_cold_4()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1940, "(denominator.msw - denominator.lsw) <= denominatorWordsNeeded");
}

void generalSlowpath_cold_5()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1941, "denominator.msw[-1] != 0");
}

void generalSlowpath_cold_6()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1946, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_7()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1950, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_8()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1345, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_9()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1346, "denominator.msw[-1] != 0");
}

void generalSlowpath_cold_10()
{
}

void generalSlowpath_cold_11()
{
}

void generalSlowpath_cold_12()
{
}

void generalSlowpath_cold_13()
{
}

void bitCountMP_cold_1()
{
  __assert_rtn("bitCountMP", "strtofp.c", 1056, "work.msw[-1] != 0");
}

void fts_build_cold_1()
{
  int v0 = OUTLINED_FUNCTION_0();
  _os_crash((uint64_t)v0);
  __break(1u);
}

uint64_t _os_debug_log_error_str(uint64_t a1)
{
  return _os_debug_log_write(3LL, a1);
}

void _os_debug_log(char *a1, ...)
{
  uint64_t v2 = MEMORY[0x1895FF8E0];
  if (*(void *)(MEMORY[0x1895FF8E0] + 192LL) == -1LL) {
    uint64_t v3 = *(void *)(MEMORY[0x1895FF8E0] + 200LL);
  }
  else {
    uint64_t v3 = _os_alloc_once();
  }
  if ((*(_BYTE *)(v3 + 20) & 2) == 0)
  {
    unsigned int v4 = vasprintf(&v10, a1, va);
    uint64_t v5 = v10;
    if (v10)
    {
      uint64_t v6 = v10;
      if (v4 >= 0x15)
      {
        if ((*(_BYTE *)(v3 + 20) & 1) != 0)
        {
          char v7 = v10[16];
          uint64_t v8 = mach_absolute_time();
          if (*(void *)(v2 + 192) == -1LL) {
            uint64_t v9 = *(void **)(v2 + 200);
          }
          else {
            uint64_t v9 = (void *)_os_alloc_once();
          }
          snprintf(v5, 0x11uLL, "%16llu", v8 - *v9);
          uint64_t v6 = v10;
          v10[16] = v7;
        }

        else
        {
          uint64_t v6 = v10 + 20;
          v10 += 20;
        }
      }

      _os_debug_log_write(7LL, (uint64_t)v6);
      free(v5);
    }
  }

void __xprintf_domain_init_cold_1()
{
}

void sigaction_cold_1()
{
  qword_18C52A990 = (uint64_t)"sigaction on fatal signals is not supported";
  __break(1u);
}

void libc_set_introspection_hooks_cold_1()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 33, "size >= sizeof(libc_hooks_version)");
}

void libc_set_introspection_hooks_cold_2()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 50, "new_hooks->version >= libc_hooks_version");
}

void libc_set_introspection_hooks_cold_3()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 54, "size >= sizeof(libc_hooks)");
}

void libc_set_introspection_hooks_cold_4()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 37, "size >= sizeof(libc_hooks)");
}

uint64_t _os_crash(uint64_t result)
{
  qword_18C52A990 = result;
  if (_os_crash_callback) {
    return _os_crash_callback();
  }
  return result;
}

char *_os_assumes_log()
{
  uint64_t v2 = dladdr(v1, &v53);
  if ((_DWORD)v2)
  {
    OUTLINED_FUNCTION_7( v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v38,  v41,  v44,  v47,  v50,  (uint64_t)v53.dli_fname,  (uint64_t)v53.dli_fbase);
    OUTLINED_FUNCTION_6();
    dli_fname = v53.dli_fname;
    OUTLINED_FUNCTION_9(v53.dli_fname);
    OUTLINED_FUNCTION_4();
  }

  else
  {
    uint64_t v0 = 0LL;
    dli_fname = 0LL;
  }

  uint64_t v11 = OUTLINED_FUNCTION_3(v2, v3, "%s:%lu");
  OUTLINED_FUNCTION_0_0(v11, v12, "0x%llx");
  int v13 = OUTLINED_FUNCTION_8();
  uint64_t v20 = OUTLINED_FUNCTION_1( v13,  v14,  "assertion failed: %s: %s + %lu [%s]: %s",  v15,  v16,  v17,  v18,  v19,  (uint64_t)v57,  (uint64_t)dli_fname,  v0,  (uint64_t)v59,  (uint64_t)v58,  (uint64_t)v53.dli_fname,  (uint64_t)v53.dli_fbase,  (uint64_t)v53.dli_sname,  (uint64_t)v53.dli_saddr,  v54,  v55,  v56[0]);
  uint64_t v28 = OUTLINED_FUNCTION_14( v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v39,  v42,  v45,  v48,  v51,  (uint64_t)v53.dli_fname,  (const mach_header_64 *)v53.dli_fbase,  (uint64_t)v53.dli_sname,  (uint64_t)v53.dli_saddr,  v54,  v55,  v56[0]);
  if ((v28 & 1) == 0) {
    OUTLINED_FUNCTION_13( v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v40,  v43,  v46,  v49,  v52,  (uint64_t)v53.dli_fname,  (uint64_t)v53.dli_fbase,  (uint64_t)v53.dli_sname,  (uint64_t)v53.dli_saddr,  v54,  v55,  v56[0]);
  }
  pid_t v36 = getpid();
  uint64_t result = OUTLINED_FUNCTION_12(v36, "OS_ASSUMES_FATAL");
  if (result)
  {
    qword_18C52A990 = (uint64_t)v56;
    if (_os_crash_callback) {
      _os_crash_callback(v56);
    }
    __break(1u);
  }

  return result;
}

char *_os_assert_log()
{
  uint64_t v2 = dladdr(v1, &v41);
  if ((_DWORD)v2)
  {
    _os_get_image_uuid((uint64_t)v41.dli_fbase, uu);
    uuid_unparse(uu, out);
    dli_fname = v41.dli_fname;
    OUTLINED_FUNCTION_9(v41.dli_fname);
    OUTLINED_FUNCTION_4();
  }

  else
  {
    uint64_t v0 = 0LL;
    dli_fname = 0LL;
  }

  uint64_t v5 = OUTLINED_FUNCTION_3(v2, v3, "%s:%lu");
  OUTLINED_FUNCTION_0_0(v5, v6, "0x%llx");
  int v7 = OUTLINED_FUNCTION_8();
  uint64_t v14 = OUTLINED_FUNCTION_1( v7,  v8,  "assertion failed: %s: %s + %lu [%s]: %s",  v9,  v10,  v11,  v12,  v13,  (uint64_t)v45,  (uint64_t)dli_fname,  v0,  (uint64_t)out,  (uint64_t)v46,  (uint64_t)v41.dli_fname,  (uint64_t)v41.dli_fbase,  (uint64_t)v41.dli_sname,  (uint64_t)v41.dli_saddr,  v42,  v43,  uu[0]);
  uint64_t v22 = OUTLINED_FUNCTION_14( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v31,  v33,  v35,  v37,  v39,  (uint64_t)v41.dli_fname,  (const mach_header_64 *)v41.dli_fbase,  (uint64_t)v41.dli_sname,  (uint64_t)v41.dli_saddr,  v42,  v43,  uu[0]);
  if ((v22 & 1) == 0) {
    OUTLINED_FUNCTION_13( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v32,  v34,  v36,  v38,  v40,  (uint64_t)v41.dli_fname,  (uint64_t)v41.dli_fbase,  (uint64_t)v41.dli_sname,  (uint64_t)v41.dli_saddr,  v42,  v43,  uu[0]);
  }
  return strdup((const char *)uu);
}

char *_os_assumes_log_ctx()
{
  uint64_t v1 = v0;
  int v2 = OUTLINED_FUNCTION_2(__stack_chk_guard[0]);
  uint64_t v10 = OUTLINED_FUNCTION_11(v2, v3, v4, v5, v6, v7, v8, v9, v38, v41, v44, v47, v50, v53);
  if ((_DWORD)v10)
  {
    OUTLINED_FUNCTION_7(v10, v11, v12, v13, v14, v15, v16, v17, v39, v42, v45, v48, v51, (uint64_t)v54, v56);
    OUTLINED_FUNCTION_6();
    uint64_t v18 = (uint64_t)v54;
    OUTLINED_FUNCTION_9(v54);
    OUTLINED_FUNCTION_5();
  }

  else
  {
    uint64_t v1 = 0LL;
    uint64_t v18 = 0LL;
  }

  uint64_t v19 = OUTLINED_FUNCTION_3(v10, v11, "%s:%lu");
  OUTLINED_FUNCTION_0_0(v19, v20, "0x%llx");
  int v21 = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1( v21,  v22,  "assertion failed: %s: %s + %lu [%s]: %s",  v23,  v24,  v25,  v26,  v27,  (uint64_t)v66,  v18,  v1,  (uint64_t)v68,  (uint64_t)v67,  (uint64_t)v54,  v56,  v58,  v60,  *(__int16 *)v62,  v62[2],  v65[0]);
  uint64_t v28 = _simple_asl_msg_new();
  OUTLINED_FUNCTION_10( v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v40,  v43,  v46,  v49,  v52,  v55,  v57,  v59,  v61,  v63,  v64,  v65[0]);
  _simple_sfree();
  pid_t v36 = getpid();
  uint64_t result = OUTLINED_FUNCTION_12(v36, "OS_ASSUMES_FATAL");
  if (result)
  {
    qword_18C52A990 = (uint64_t)v65;
    if (_os_crash_callback) {
      _os_crash_callback(v65);
    }
    __break(1u);
  }

  return result;
}

char *_os_assert_log_ctx()
{
  uint64_t v1 = v0;
  int v2 = OUTLINED_FUNCTION_2(__stack_chk_guard[0]);
  uint64_t v10 = OUTLINED_FUNCTION_11(v2, v3, v4, v5, v6, v7, v8, v9, v37, v40, v43, v46, v49, v52);
  if ((_DWORD)v10)
  {
    OUTLINED_FUNCTION_7(v10, v11, v12, v13, v14, v15, v16, v17, v38, v41, v44, v47, v50, (uint64_t)v53, v55);
    OUTLINED_FUNCTION_6();
    uint64_t v18 = (uint64_t)v53;
    OUTLINED_FUNCTION_9(v53);
    OUTLINED_FUNCTION_5();
  }

  else
  {
    uint64_t v1 = 0LL;
    uint64_t v18 = 0LL;
  }

  uint64_t v19 = OUTLINED_FUNCTION_3(v10, v11, "%s:%lu");
  OUTLINED_FUNCTION_0_0(v19, v20, "0x%llx");
  int v21 = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1( v21,  v22,  "assertion failed: %s: %s + %lu [%s]: %s",  v23,  v24,  v25,  v26,  v27,  (uint64_t)v65,  v18,  v1,  (uint64_t)v67,  (uint64_t)v66,  (uint64_t)v53,  v55,  v57,  v59,  *(__int16 *)v61,  v61[2],  __s1[0]);
  uint64_t v28 = _simple_asl_msg_new();
  OUTLINED_FUNCTION_10( v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v39,  v42,  v45,  v48,  v51,  v54,  v56,  v58,  v60,  v62,  v63,  __s1[0]);
  _simple_sfree();
  return strdup(__s1);
}

void _os_crash_fmt_cold_1()
{
}

void mpool_new_cold_1()
{
}

void arc4_init_cold_1(uint64_t *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg(*a1);
  __break(1u);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  if (a1)
  {
    if (a1 == (const char *)-1LL)
    {
      OUTLINED_FUNCTION_0_1();
      if (qword_18C52A990) {
        goto LABEL_13;
      }
      if (!_simple_salloc()) {
        goto LABEL_12;
      }
    }

    else
    {
      OUTLINED_FUNCTION_0_1();
      if (qword_18C52A990) {
        goto LABEL_13;
      }
      if (!_simple_salloc())
      {
LABEL_12:
        qword_18C52A990 = (uint64_t)a4;
LABEL_13:
        abort();
      }
    }
  }

  else
  {
    OUTLINED_FUNCTION_0_1();
    if (qword_18C52A990) {
      goto LABEL_13;
    }
    if (!_simple_salloc()) {
      goto LABEL_12;
    }
  }

  _simple_sprintf();
  a4 = (const char *)_simple_string();
  goto LABEL_12;
}

void err(int a1, const char *a2, ...)
{
  int v4 = OUTLINED_FUNCTION_1_0();
  verrc(a1, *v4, a2, v5);
}

void verrc(int a1, int a2, const char *a3, __darwin_va_list a4)
{
  uint64_t v7 = *(void *)&a1;
  int v8 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    int v8 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }

  int v9 = getprogname();
  fprintf(v8, "%s: ", v9);
  if (a3)
  {
    _e_visprintf((FILE *)_e_err_file, a3, a4);
    OUTLINED_FUNCTION_3_0(": ", v10, v11, (FILE *)_e_err_file);
  }

  uint64_t v12 = (FILE *)_e_err_file;
  uint64_t v13 = strerror(a2);
  fprintf(v12, "%s\n", v13);
  if (_e_err_exit)
  {
    if (_e_err_exit == 1) {
      OUTLINED_FUNCTION_2_0((uint64_t)off_18C52C3F0);
    }
    else {
      off_18C52C3F0(v7);
    }
  }

  exit(v7);
}

void verr(int a1, const char *a2, __darwin_va_list a3)
{
  int v6 = __error();
  verrc(a1, *v6, a2, a3);
}

void errc(int a1, int a2, const char *a3, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void verrx(int a1, const char *a2, __darwin_va_list a3)
{
  uint64_t v4 = *(void *)&a1;
  int v5 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    int v5 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }

  int v6 = getprogname();
  fprintf(v5, "%s: ", v6);
  if (a2) {
    OUTLINED_FUNCTION_0_2();
  }
  fputc(10, (FILE *)_e_err_file);
  if (_e_err_exit)
  {
    if (_e_err_exit == 1) {
      OUTLINED_FUNCTION_2_0((uint64_t)off_18C52C3F0);
    }
    else {
      off_18C52C3F0(v4);
    }
  }

  exit(v4);
}

void warn(const char *a1, ...)
{
  int v2 = OUTLINED_FUNCTION_1_0();
  vwarnc(*v2, a1, v3);
}

void vwarnc(int a1, const char *a2, __darwin_va_list a3)
{
  int v5 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    int v5 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }

  int v6 = getprogname();
  fprintf(v5, "%s: ", v6);
  if (a2)
  {
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_3_0(": ", v7, v8, (FILE *)_e_err_file);
  }

  int v9 = (FILE *)_e_err_file;
  uint64_t v10 = strerror(a1);
  fprintf(v9, "%s\n", v10);
}

void vwarn(const char *a1, __darwin_va_list a2)
{
  uint64_t v4 = __error();
  vwarnc(*v4, a1, a2);
}

void warnc(int a1, const char *a2, ...)
{
}

void warnx(const char *a1, ...)
{
}

void vwarnx(const char *a1, __darwin_va_list a2)
{
  uint64_t v4 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    uint64_t v4 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }

  int v5 = getprogname();
  fprintf(v4, "%s: ", v5);
  if (a1) {
    _e_visprintf((FILE *)_e_err_file, a1, a2);
  }
  fputc(10, (FILE *)_e_err_file);
}

void sl_init_cold_1()
{
}

void unvis_cold_1()
{
  __assert_rtn("unvis", "unvis.c", 210, "cp != ((void *)0)");
}

void unvis_cold_2()
{
  __assert_rtn("unvis", "unvis.c", 211, "astate != ((void *)0)");
}

void strnunvisx_cold_1()
{
  __assert_rtn("strnunvisx", "unvis.c", 504, "src != ((void *)0)");
}

void strnunvisx_cold_2()
{
  __assert_rtn("strnunvisx", "unvis.c", 505, "dst != ((void *)0)");
}

void strnunvisx_cold_3()
{
}

void istrsenvisx_cold_1()
{
  __assert_rtn("istrsenvisx", "vis.c", 394, "mbdstp != ((void *)0)");
}

void istrsenvisx_cold_2()
{
  __assert_rtn("istrsenvisx", "vis.c", 395, "mbsrc != ((void *)0) || mblength == 0");
}

void istrsenvisx_cold_3()
{
  __assert_rtn("istrsenvisx", "vis.c", 396, "mbextra != ((void *)0)");
}

void istrsenvisx_cold_4()
{
}

void lookup_substsearch_cold_1()
{
  __assert_rtn("lookup_substsearch", "collate.c", 596, "p->val == key");
}

void localeconv_l_cold_1()
{
}

void localeconv_l_cold_2()
{
}

void memstream_update_cold_1()
{
  __assert_rtn("memstream_update", "open_memstream.c", 96, "ms->len >= 0 && ms->offset >= 0");
}

void memstream_seek_cold_1()
{
  __assert_rtn("memstream_seek", "open_memstream.c", 136, "pos >= 0");
}

void memstream_seek_cold_2()
{
  __assert_rtn("memstream_seek", "open_memstream.c", 141, "pos == 0");
}

void inet_net_pton_cold_1()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 110, "n >= 0 && n <= 9");
}

void inet_net_pton_cold_2()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 139, "n >= 0 && n <= 9");
}

void inet_net_pton_cold_3()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 87, "n >= 0 && n <= 15");
}

void setipv4sourcefilter_cold_1()
{
  __assert_rtn("setipv4sourcefilter", "sourcefilter.c", 160, "s != -1");
}

void __inaddr_to_index_cold_1()
{
  __assert_rtn("__inaddr_to_index", "sourcefilter.c", 134, "ifindex != 0");
}

void getipv4sourcefilter_cold_1()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 229, "s != -1");
}

void getipv4sourcefilter_cold_2()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 230, "fmode != NULL");
}

void getipv4sourcefilter_cold_3()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 231, "numsrc != NULL");
}

void _mkstemp_dprotected_np_action_cold_1()
{
  __assert_rtn("_mkstemp_dprotected_np_action", "mktemp.c", 321, "dfd == AT_FDCWD");
}

void perror(const char *a1)
{
  if (a1)
  {
    uint64_t v1 = (char **)v6;
    if (*a1)
    {
      v6[0] = a1;
      v6[1] = _platform_strlen();
      v6[2] = ": ";
      v6[3] = 2LL;
      uint64_t v1 = (char **)&v7;
    }
  }

  else
  {
    uint64_t v1 = (char **)v6;
  }

  int v2 = __error();
  strerror_r(*v2, __strerrbuf, 0x800uLL);
  *uint64_t v1 = __strerrbuf;
  uint64_t v3 = _platform_strlen();
  v1[2] = "\n";
  uint64_t v4 = v1 + 2;
  *(v4 - 1) = v3;
  v4[1] = 1LL;
  flockfile(__stderrp);
  __sflush((uint64_t)__stderrp);
  writev_NOCANCEL();
  int v5 = __stderrp;
  __stderrp->_flags &= ~0x1000u;
  funlockfile(v5);
}

void __vfprintf_cold_1(uint64_t *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg(*a1);
  __break(1u);
}

void wmemstream_update_cold_1()
{
  __assert_rtn("wmemstream_update", "open_wmemstream.c", 86, "ms->len >= 0 && ms->offset >= 0");
}

void wmemstream_seek_cold_1()
{
  __assert_rtn("wmemstream_seek", "open_wmemstream.c", 183, "pos >= 0");
}

void wmemstream_seek_cold_2()
{
  __assert_rtn("wmemstream_seek", "open_wmemstream.c", 188, "pos == 0");
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  if (a1 == 255)
  {
    if (_platform_strcmp())
    {
      int v6 = off_18965D360;
      while (*((_DWORD *)v6 - 2))
      {
        v6 += 3;
      }
    }

    else
    {
LABEL_16:
      sprintf(v13, "%d");
    }
  }

  else
  {
    uint64_t v7 = &rerrs;
    do
    {
      int v9 = *v7;
      v7 += 6;
      int v8 = v9;
      if (v9) {
        BOOL v10 = v8 == (a1 & 0xFFFFFEFF);
      }
      else {
        BOOL v10 = 1;
      }
    }

    while (!v10);
    if ((a1 & 0x100) != 0)
    {
      if (v8) {
        _platform_strcpy();
      }
      else {
        sprintf(v13, "REG_0x%x");
      }
    }
  }

  unint64_t v11 = _platform_strlen() + 1;
  if (a4)
  {
    if (v11 >= a4)
    {
      _platform_strncpy();
      a3[a4 - 1] = 0;
    }

    else
    {
      _platform_strcpy();
    }
  }

  return v11;
}

void abort(void)
{
  if (!qword_18C52A990) {
    qword_18C52A990 = (uint64_t)"abort() called";
  }
  pthread_self();
  if (__cleanup) {
    _cleanup();
  }
  OUTLINED_FUNCTION_0_3(-1569, v0, v1, HIDWORD(v1), v2, v3);
  __pthread_workqueue_setkill();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  usleep_NOCANCEL(0x2710u);
  __abort();
}

void __abort()
{
  if (!qword_18C52A990) {
    qword_18C52A990 = (uint64_t)"__abort() called";
  }
  pthread_self();
  v2.__sigaction_u.__sa_handler = 0LL;
  *(void *)&v2.sa_masuint64_t k = 0xFFFFFFFFLL;
  sigaction(6, &v2, 0LL);
  OUTLINED_FUNCTION_0_3( v2.sa_mask & 0xFFFFFFDF,  v0,  v1,  HIDWORD(v1),  (uint64_t)v2.__sigaction_u.__sa_handler,  v2.sa_mask);
  __pthread_workqueue_setkill();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  usleep_NOCANCEL(0x2710u);
  v2.sa_masuint64_t k = -25;
  sigprocmask(3, &v2.sa_mask, 0LL);
  __break(1u);
}

void abort_report_np(uint64_t a1)
{
  if (_simple_salloc())
  {
    _simple_vsprintf();
    a1 = _simple_string();
  }

  qword_18C52A990 = a1;
  abort();
}

void atexit_register_cold_1()
{
}

void getopt_internal_cold_1()
{
  else {
    warnx("invalid option -- %c");
  }
}

void ptsname_cold_1()
{
  uint64_t v0 = _os_assert_log();
  _os_crash((uint64_t)v0);
  __break(1u);
}

void ptsname_cold_2()
{
  uint64_t v0 = _os_assert_log();
  _os_crash((uint64_t)v0);
  __break(1u);
}

void _psort_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void _psort_cold_1_0()
{
  uint64_t v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void _psort_cold_1_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void __printf_arginfo_errno_cold_1()
{
  __assert_rtn("__printf_arginfo_errno", "xprintf_errno.c", 44, "n >= 1");
}

void __printf_arginfo_float_cold_1()
{
}

void __printf_render_float_cold_1()
{
  __assert_rtn("__printf_render_float", "xprintf_float.c", 263, "pi->spec == 'f'");
}

void __printf_arginfo_hexdump_cold_1()
{
  __assert_rtn("__printf_arginfo_hexdump", "xprintf_hexdump.c", 42, "n >= 2");
}

void __printf_arginfo_int_cold_1()
{
}

void __printf_render_int_cold_1(uint64_t a1)
{
  fprintf(__stderrp, "pi->spec = '%c'\n", a1);
  __assert_rtn("__printf_render_int", "xprintf_int.c", 328, "1 == 0");
}

void __printf_render_int_cold_2()
{
  __assert_rtn("__ultoa", "xprintf_int.c", 162, "base == 16");
}

void __printf_arginfo_ptr_cold_1()
{
}

void __printf_arginfo_quote_cold_1()
{
  __assert_rtn("__printf_arginfo_quote", "xprintf_quote.c", 45, "n >= 1");
}

void __printf_arginfo_str_cold_1()
{
}

void __printf_arginfo_chr_cold_1()
{
}

void __printf_arginfo_time_cold_1()
{
  __assert_rtn("__printf_arginfo_time", "xprintf_time.c", 48, "n >= 1");
}

void __printf_arginfo_vis_cold_1()
{
  __assert_rtn("__printf_arginfo_vis", "xprintf_vis.c", 44, "n >= 1");
}

void __printf_arginfo_n_cold_1()
{
  __assert_rtn("__printf_arginfo_n", "xprintf.c", 233, "n >= 1");
}

void _setutxent_cold_1()
{
}

void _setutxent_cold_2()
{
}

void _endutxent_cold_1()
{
}

void _endutxent_cold_2()
{
}

void _getutxent_cold_1()
{
}

void _getutxent_cold_2()
{
}

void _getutxid_cold_1()
{
}

void _getutxid_cold_2()
{
}

void _getutxline_cold_1()
{
}

void _getutxline_cold_2()
{
}

void _pututxline_cold_1()
{
}

void _pututxline_cold_2()
{
}

void _utmpxname_cold_1()
{
}

void _utmpxname_cold_2()
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895FED58](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t __chmod_extended()
{
  return MEMORY[0x1895FF6B0]();
}

uint64_t __commpage_gettimeofday()
{
  return MEMORY[0x1895FF6B8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

void __exit()
{
}

uint64_t __fchmod_extended()
{
  return MEMORY[0x1895FF6E0]();
}

uint64_t __fcntl()
{
  return MEMORY[0x1895FF6E8]();
}

uint64_t __fcntl_nocancel()
{
  return MEMORY[0x1895FF6F0]();
}

uint64_t __fork()
{
  return MEMORY[0x1895FF6F8]();
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x189600228](a1);
}

uint64_t __fstat64_extended()
{
  return MEMORY[0x1895FF700]();
}

uint64_t __getdirentries64()
{
  return MEMORY[0x1895FF708]();
}

uint64_t __getlogin()
{
  return MEMORY[0x1895FF710]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1895FF718]();
}

uint64_t __kill()
{
  return MEMORY[0x1895FF728]();
}

uint64_t __lstat64_extended()
{
  return MEMORY[0x1895FF748]();
}

uint64_t __mkdir_extended()
{
  return MEMORY[0x1895FF750]();
}

uint64_t __mkfifo_extended()
{
  return MEMORY[0x1895FF758]();
}

uint64_t __open()
{
  return MEMORY[0x1895FF760]();
}

uint64_t __open_extended()
{
  return MEMORY[0x1895FF768]();
}

uint64_t __open_nocancel()
{
  return MEMORY[0x1895FF770]();
}

uint64_t __os_log_simple_offset()
{
  return MEMORY[0x1896003E8]();
}

uint64_t __platform_sigaction()
{
  return MEMORY[0x1896003F8]();
}

uint64_t __pthread_workqueue_setkill()
{
  return MEMORY[0x1896005A0]();
}

uint64_t __recvfrom()
{
  return MEMORY[0x1895FF7F8]();
}

uint64_t __recvfrom_nocancel()
{
  return MEMORY[0x1895FF800]();
}

uint64_t __semwait_signal()
{
  return MEMORY[0x1895FF810]();
}

uint64_t __semwait_signal_nocancel()
{
  return MEMORY[0x1895FF818]();
}

uint64_t __sendto()
{
  return MEMORY[0x1895FF820]();
}

uint64_t __sendto_nocancel()
{
  return MEMORY[0x1895FF828]();
}

uint64_t __setlogin()
{
  return MEMORY[0x1895FF830]();
}

uint64_t __settimeofday()
{
  return MEMORY[0x1895FF838]();
}

uint64_t __sigaltstack()
{
  return MEMORY[0x1895FF848]();
}

uint64_t __stat64_extended()
{
  return MEMORY[0x1895FF860]();
}

uint64_t __sysctl()
{
  return MEMORY[0x1895FF870]();
}

uint64_t __thread_selfusage()
{
  return MEMORY[0x1895FF880]();
}

uint64_t __umask_extended()
{
  return MEMORY[0x1895FF8A0]();
}

uint64_t __wait4()
{
  return MEMORY[0x1895FF8A8]();
}

uint64_t __wait4_nocancel()
{
  return MEMORY[0x1895FF8B0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1895FEC00]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1895FEC18]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895FEC20]();
}

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x1895FEC30]();
}

void _exit(int a1)
{
}

uint64_t _get_cpu_capabilities()
{
  return MEMORY[0x1895FF8D8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x189600400]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x189600858]();
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x189600438]();
}

uint64_t _platform_memccpy()
{
  return MEMORY[0x189600440]();
}

uint64_t _platform_memchr()
{
  return MEMORY[0x189600448]();
}

uint64_t _platform_memcmp()
{
  return MEMORY[0x189600450]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x189600460]();
}

uint64_t j___platform_memmove()
{
  return MEMORY[0x189600460]();
}

uint64_t j___platform_memmove_0()
{
  return MEMORY[0x189600460]();
}

uint64_t _platform_memset()
{
  return MEMORY[0x189600468]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x189600470]();
}

uint64_t j___platform_strchr()
{
  return MEMORY[0x189600470]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x189600478]();
}

uint64_t _platform_strcpy()
{
  return MEMORY[0x189600480]();
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

uint64_t _platform_strncpy()
{
  return MEMORY[0x1896004A8]();
}

uint64_t _platform_strnlen()
{
  return MEMORY[0x1896004B0]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1896004C0]();
}

uint64_t _simple_asl_log_prog()
{
  return MEMORY[0x1896004C8]();
}

uint64_t _simple_asl_msg_new()
{
  return MEMORY[0x1896004D0]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1896004D8]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1896004E0]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1896004F0]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1896004F8]();
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

uint64_t _simple_vsprintf()
{
  return MEMORY[0x189600528]();
}

uint64_t _tlv_exit()
{
  return MEMORY[0x1895FEC60]();
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1895FF8F0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895FF908](a1, *(void *)&a2);
}

void asl_append(asl_object_t obj, asl_object_t obj_to_add)
{
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  return (const char *)MEMORY[0x1895FECF8](msg, key);
}

asl_object_t asl_match( asl_object_t data, asl_object_t querylist, size_t *last, size_t start, size_t count, uint32_t duration, int32_t direction)
{
  return (asl_object_t)MEMORY[0x1895FED00]( data,  querylist,  last,  start,  count,  *(void *)&duration,  *(void *)&direction);
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1895FED08](*(void *)&type);
}

asl_object_t asl_next(asl_object_t obj)
{
  return (asl_object_t)MEMORY[0x1895FED10](obj);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1895FED18](ident, facility, *(void *)&opts);
}

void asl_release(asl_object_t obj)
{
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  return MEMORY[0x1895FED28](obj, msg);
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  return MEMORY[0x1895FED30](obj, key, value);
}

int asl_set_query(asl_object_t msg, const char *key, const char *value, uint32_t op)
{
  return MEMORY[0x1895FED40](msg, key, value, *(void *)&op);
}

kern_return_t bootstrap_parent(mach_port_t bp, mach_port_t *parent_port)
{
  return MEMORY[0x1896009D8](*(void *)&bp, parent_port);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

uint64_t ccrng()
{
  return MEMORY[0x1895FE520]();
}

uint64_t ccrng_uniform()
{
  return MEMORY[0x1895FE528]();
}

int chdir(const char *a1)
{
  return MEMORY[0x1895FF930](a1);
}

kern_return_t clock_get_time(clock_serv_t clock_serv, mach_timespec_t *cur_time)
{
  return MEMORY[0x1895FF950](*(void *)&clock_serv, cur_time);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1895FF968]();
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FE940](identifier, flags);
}

void dispatch_group_async_f( dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FE950]();
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FE968](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1895FEC68](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FEC80](__path, *(void *)&__mode);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1895FF9A0](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1895FECA0]();
}

int execve(const char *__file, char *const *__argv, char *const *__envp)
{
  return MEMORY[0x1895FF9A8](__file, __argv, __envp);
}

int fchdir(int a1)
{
  return MEMORY[0x1895FF9B0](*(void *)&a1);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1895FF9C8](*(void *)&a1, a2, a3, *(void *)&a4);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1895FF9E0]();
}

int fegetenv(fenv_t *a1)
{
  return MEMORY[0x189600230](a1);
}

int fegetround(void)
{
  return MEMORY[0x189600238]();
}

int fesetenv(const fenv_t *a1)
{
  return MEMORY[0x189600240](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FF9E8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x189600538](a1);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FFA30](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FFA58](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FFA60](*(void *)&a1, a2);
}

uint64_t fsync_NOCANCEL()
{
  return MEMORY[0x1895FFA70]();
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FFA78](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFA80](a1, a2, a3, a4, *(void *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1895FFA88](*(void *)&a1, a2, a3, a4, a5);
}

int getdtablesize(void)
{
  return MEMORY[0x1895FFA90]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1895FFAB0](a1, *(void *)&a2, *(void *)&a3);
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x1895FF610](*(void *)&a1);
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1895FF618](a1);
}

uint64_t getgroupcount()
{
  return MEMORY[0x1895FF620]();
}

int getgrouplist(const char *a1, int a2, int *a3, int *a4)
{
  return MEMORY[0x1895FF628](a1, *(void *)&a2, a3, a4);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FF630](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x1895FFAD8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

int getpriority(int a1, id_t a2)
{
  return MEMORY[0x1895FFAE8](*(void *)&a1, *(void *)&a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FF638](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FF648](*(void *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FF650](*(void *)&a1, a2, a3, a4, a5);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1895FFAF0](*(void *)&a1, a2);
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1895FFAF8](*(void *)&a1, a2);
}

uint8_t *__cdecl getsectiondata( const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FECE0](mhp, segname, sectname, size);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1895FFB08](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

kern_return_t host_get_clock_service(host_t host, clock_id_t clock_id, clock_serv_t *clock_serv)
{
  return MEMORY[0x1895FFB38](*(void *)&host, *(void *)&clock_id, clock_serv);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FF658](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FFB78](*(void *)&a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1895FFB80]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FFBA8](*(void *)&a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FFBF0](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FFBF8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

uint64_t mach_approximate_time(void)
{
  return MEMORY[0x1895FFC08]();
}

uint64_t mach_boottime_usec()
{
  return MEMORY[0x1895FFC10]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1895FFC18]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FFC20]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FFC28](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FFC78]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1895FF668](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FF670](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1895FF678](uu, uid_or_gid, id_type);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1895FFE28](*(void *)&a1, a2, a3);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x189600358](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x189600360](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x189600368](*(void *)&token, state64);
}

uint64_t notify_monitor_file()
{
  return MEMORY[0x189600370]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x189600380](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x189600388](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1896003A8](*(void *)&token, state64);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1895FFE60]();
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FFE68](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

uint64_t openat_NOCANCEL()
{
  return MEMORY[0x1895FFE78]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x189600898]();
}

uint64_t os_log_simple_type_from_asl()
{
  return MEMORY[0x189600540]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1895FFE90](a1, *(void *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FFEA0](a1);
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FFEA8](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1895FFEB0](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1895FFEB8](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FFEC0](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FFEC8](a1);
}

uint64_t pread_NOCANCEL()
{
  return MEMORY[0x1895FFF00]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FFF08](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x189600698]();
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1896006A0](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x1896006A8](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1896006D0]();
}

int pthread_kill(pthread_t a1, int a2)
{
  return MEMORY[0x1896006D8](a1, *(void *)&a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1896006E8](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1896006F0](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1896006F8](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x189600700](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x189600708](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x189600710](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x189600720](a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x189600728](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x189600730](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x189600738](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x189600740]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x189600760](*(void *)&a1, a2, a3);
}

uintptr_t pthread_stack_frame_decode_np(uintptr_t frame_addr, uintptr_t *return_addr)
{
  return MEMORY[0x189600768](frame_addr, return_addr);
}

void pthread_testcancel(void)
{
}

uint64_t pwrite_NOCANCEL()
{
  return MEMORY[0x1895FFF40]();
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1895FFF50]();
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FFF58](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

uint64_t reallocarray_DARWIN_EXTSN()
{
  return MEMORY[0x189600328]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600330](__ptr, __size);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FFF70](a1);
}

uint64_t select_NOCANCEL()
{
  return MEMORY[0x1895FFF78]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1895FFF80](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFFB8](a1, a2, a3, a4, *(void *)&a5);
}

int setitimer(int a1, const itimerval *a2, itimerval *a3)
{
  return MEMORY[0x1895FFFC8](*(void *)&a1, a2, a3);
}

int setpgid(pid_t a1, pid_t a2)
{
  return MEMORY[0x1895FFFD0](*(void *)&a1, *(void *)&a2);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1895FFFD8](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setregid(gid_t a1, gid_t a2)
{
  return MEMORY[0x1895FFFE0](*(void *)&a1, *(void *)&a2);
}

int setreuid(uid_t a1, uid_t a2)
{
  return MEMORY[0x1895FFFE8](*(void *)&a1, *(void *)&a2);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1895FFFF0](*(void *)&a1, a2);
}

pid_t setsid(void)
{
  return MEMORY[0x1895FFFF8]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x189600000](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x189600018](*(void *)&a1, a2, a3);
}

int sigsuspend(const sigset_t *a1)
{
  return MEMORY[0x189600020](a1);
}

uint64_t sigsuspend_NOCANCEL()
{
  return MEMORY[0x189600028]();
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x189600030](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x189600038](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x189600048](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x1896000A8](*(void *)&task, *(void *)&which_port, *(void *)&special_port);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1896000E0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1896000E8](a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1896000F8](a1, a2);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x189600100](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_region_64( vm_map_t target_task, vm_address_t *address, vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x189600158](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x189600170](*(void *)&a1, a2, *(void *)&a3, a4);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x189600210]();
}