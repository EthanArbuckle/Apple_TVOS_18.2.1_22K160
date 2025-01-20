@interface CSStoreValidate
@end

@implementation CSStoreValidate

void ___CSStoreValidate_block_invoke_3(uint64_t a1, CSStore2::Table *this)
{
  if (*((_DWORD *)this + 18) == 0x3FFFFFFF)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = (id) CSStore2::Table::copyCFName(this);
    (*(void (**)(uint64_t, const char *, ...))(v4 + 16))( v4,  "Table %s (%llx) has no remaining unit identifiers.",  (const char *)-[__CFString UTF8String](v5, "UTF8String"),  (4 * *(_DWORD *)this));

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

void ___CSStoreValidate_block_invoke_4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a2[19];
  if ((_DWORD)v2 == -1) {
    return;
  }
  v5 = *(uint64_t **)(a1 + 48);
  uint64_t v6 = *(void *)(*v5 + 8);
  unsigned int v7 = *(_DWORD *)(v6 + 12);
  v8 = (unsigned int *)(v6 + v2);
  else {
    v9 = v8;
  }
  v10 = (void (**)(void, const char *, ...))*(id *)(a1 + 32);
  v11 = v10;
  unsigned int v12 = *v9;
  if (*v9 - 16 > 0x1FF0)
  {
    v10[2](v10, "Nonsensical bucket count %llu", *v9);
    goto LABEL_140;
  }

  v13 = v9 + 1;
  uint64_t v14 = *v5;
  if (*v5) {
    unint64_t v15 = *(void *)(v14 + 8);
  }
  else {
    unint64_t v15 = 0LL;
  }
  unint64_t v16 = (unint64_t)v13 - v15;
  if ((unint64_t)v13 < v15 || HIDWORD(v16))
  {
    unint64_t v17 = *(void *)(v14 + 8);
    unsigned int v18 = *(_DWORD *)(v17 + 12);
    LODWORD(v16) = -1;
  }

  else
  {
    unint64_t v17 = *(void *)(v14 + 8);
    unsigned int v18 = *(_DWORD *)(v17 + 12);
  }

  if (__CFADD__((_DWORD)v16, 8 * v12) || v16 + 8 * v12 > v18)
  {
    if (v14) {
      unint64_t v58 = v17;
    }
    else {
      unint64_t v58 = 0LL;
    }
    BOOL v55 = (unint64_t)v9 >= v58;
    unint64_t v59 = (unint64_t)v9 - v58;
    char v60 = !v55;
    BOOL v61 = (int)v59 + 1 > v18 || v59 == -1;
    BOOL v32 = !v61;
    uint64_t v62 = 0xFFFFFFFFLL;
    if (v32) {
      uint64_t v62 = v59;
    }
    if (HIDWORD(v59)) {
      uint64_t v62 = 0xFFFFFFFFLL;
    }
    if ((v60 & 1) != 0) {
      uint64_t v62 = 0xFFFFFFFFLL;
    }
    v10[2](v10, "Hash map at %llu has invalid buckets range %llu-(%llu*%zu)", v62, v16, *v9, 8uLL);
    goto LABEL_140;
  }

  uint64_t v20 = 0LL;
  uint64_t v21 = *MEMORY[0x189614738];
  uint64_t v79 = *(void *)(MEMORY[0x189614738] + 24LL);
  if (v12 <= 1) {
    uint64_t v22 = 1LL;
  }
  else {
    uint64_t v22 = v12;
  }
  do
  {
    v23 = &v9[2 * v20];
    uint64_t v24 = v23[2];
    if ((_DWORD)v24 != -1)
    {
      uint64_t v25 = v23[1];
      if (v25 >> 29
        || __CFADD__((_DWORD)v24, 8 * v25)
        || (uint64_t v26 = *(void *)(v14 + 8), v27 = *(_DWORD *)(v26 + 12), (int)v24 + 8 * (int)v25 > v27))
      {
        if (v14) {
          unint64_t v74 = v17;
        }
        else {
          unint64_t v74 = 0LL;
        }
        BOOL v55 = (unint64_t)v9 >= v74;
        unint64_t v75 = (unint64_t)v9 - v74;
        char v76 = !v55;
        unint64_t v77 = HIDWORD(v75);
        BOOL v78 = (int)v75 + 1 > v18 || v75 == -1;
        unint64_t v75 = v75;
        if (v78) {
          unint64_t v75 = 0xFFFFFFFFLL;
        }
        if (v77) {
          unint64_t v75 = 0xFFFFFFFFLL;
        }
        if ((v76 & 1) != 0) {
          unint64_t v75 = 0xFFFFFFFFLL;
        }
        v10[2]( v10,  "Bucket [%llu,%llu] has invalid key-value pairs offset range %llu-(%llu*%zu)",  v75,  v20,  v24,  v25,  8uLL);
        goto LABEL_140;
      }

      uint64_t v28 = v26 + v24;
      uint64_t v29 = v27 <= v24 ? 0LL : v28;
      if ((_DWORD)v25)
      {
        uint64_t v30 = 0LL;
        v31 = (unsigned int *)(v29 + 4);
        while (1)
        {
          if (*v31 != -1)
          {
            BOOL v32 = v18 <= *v31 || v17 == 0;
            if (v32)
            {
              std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)&v81);
              std::ostream::operator<<();
              uint64_t v63 = *v5;
              if (*v5) {
                unint64_t v64 = *(void *)(v63 + 8);
              }
              else {
                unint64_t v64 = 0LL;
              }
              uint64_t v70 = 0xFFFFFFFFLL;
              BOOL v55 = (unint64_t)v9 >= v64;
              unint64_t v71 = (unint64_t)v9 - v64;
              if (v55 && !HIDWORD(v71))
              {
                else {
                  uint64_t v70 = v71;
                }
              }

              std::stringbuf::str(&v80, &v82);
              if ((v80.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                v73 = &v80;
              }
              else {
                v73 = (std::stringbuf::string_type *)v80.__r_.__value_.__r.__words[0];
              }
              v11[2]( v11,  "Key-value pair [%llu,%llu,%llu] has invalid value (interpreted as Offset) %s",  v70,  v20,  v30,  (const char *)v73);
              uint64_t v81 = v21;
              *(uint64_t *)((char *)&v81 + *(void *)(v21 - 24)) = v79;
              v82.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
              std::streambuf::~streambuf();
              std::ostream::~ostream();
              MEMORY[0x186E277CC](&v83);
              goto LABEL_140;
            }

            uint64_t v33 = (unsigned __int16)(*(v31 - 1) >> 2) % v12;
            if (v20 != v33) {
              break;
            }
          }

          ++v30;
          v31 += 2;
          if (v25 == v30) {
            goto LABEL_39;
          }
        }

        if (v14) {
          unint64_t v65 = v17;
        }
        else {
          unint64_t v65 = 0LL;
        }
        BOOL v55 = (unint64_t)v9 >= v65;
        unint64_t v66 = (unint64_t)v9 - v65;
        char v67 = !v55;
        unint64_t v68 = HIDWORD(v66);
        BOOL v69 = (int)v66 + 1 > v18 || v66 == -1;
        unint64_t v66 = v66;
        if (v69) {
          unint64_t v66 = 0xFFFFFFFFLL;
        }
        if (v68) {
          unint64_t v66 = 0xFFFFFFFFLL;
        }
        if ((v67 & 1) != 0) {
          unint64_t v66 = 0xFFFFFFFFLL;
        }
        v10[2](v10, "Key-value pair [%llu,%llu,%llu] is in the wrong bucket (should be %llu)", v66, v20, v30, v33);
LABEL_140:

        return;
      }
    }

void ___CSStoreValidate_block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  v10 = (void *)MEMORY[0x186E27B50]();
  id v11 = objc_alloc(NSString);
  [NSString stringWithUTF8String:a2];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v11 initWithFormat:v12 arguments:&a9];

  uint64_t v14 = (FILE *)*MEMORY[0x1895F89D0];
  id v15 = v13;
  fprintf(v14, "*** %s ***\n", (const char *)[v15 UTF8String]);

  objc_autoreleasePoolPop(v10);
}

@end