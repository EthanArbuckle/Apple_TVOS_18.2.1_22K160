double _citrus_mapper_none_mapper_init( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  double result;
  if (a7 >= 0x18)
  {
    *(void *)(a2 + 8) = 0LL;
    *(void *)(a6 + 16) = 1LL;
    result = 0.0;
    *(_OWORD *)a6 = xmmword_18907EF90;
  }

  return result;
}

uint64_t _citrus_mapper_none_mapper_convert(uint64_t a1, uint64_t *a2)
{
  v2 = (int *)a2[2];
  if (*v2 >= 1)
  {
    uint64_t v3 = 0LL;
    uint64_t v5 = *a2;
    uint64_t v4 = a2[1];
    do
    {
      *(_DWORD *)(v5 + 4 * v3) = *(_DWORD *)(v4 + 4 * v3);
      ++v3;
    }

    while (v3 < *v2);
  }

  return 0LL;
}

uint64_t _citrus_mapper_none_mapper_getops(_OWORD *a1)
{
  __int128 v1 = *(_OWORD *)&off_18C7672D8;
  *a1 = _citrus_mapper_none_mapper_ops;
  a1[1] = v1;
  return 0LL;
}