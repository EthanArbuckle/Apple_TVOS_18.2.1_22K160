void DYTraceEncode_MTLTexture_resourceUsage( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  if (a3 <= 0x23 && a5)
  {
    v10 = *a5;
    v19 = 0u;
    v20 = 0u;
    v16 = v10;
    v17 = 500;
    v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    v11 = 14;
  }
  else {
    v11 = 6;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 6911299;
  *(void *)a2 = 0xFFFFD80600000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  v12 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    v13 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v13 + 8);
    v14 = (v13 + 60);
    v12 = (v13 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      v15 = *a5;
      v19 = 0u;
      v20 = 0u;
      v16 = v15;
      v17 = 500;
      v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_saveSlice_level_zPlane_normalize_blitOption_toPath( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFD82700000024LL;
  if (a4) {
    int v11 = 12;
  }
  else {
    int v11 = 4;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CulululuiulS");
  *(_WORD *)((char *)a2 + 49) = 0;
  *((_BYTE *)a2 + 51) = 0;
  *a2 = 52;
  *(void *)(a2 + 13) = *(void *)a1;
  *a2 = 60;
  *(void *)(a2 + 15) = *(void *)(a1 + 8);
  *a2 = 68;
  *(void *)(a2 + 17) = *(void *)(a1 + 16);
  *a2 = 76;
  *(void *)(a2 + 19) = *(void *)(a1 + 24);
  *a2 = 84;
  a2[21] = *(_DWORD *)(a1 + 48);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 32);
  *a2 = 96;
  AppendString(*(const char **)(a1 + 40), (int *)a2);
  uint64_t v12 = *a2;
  unint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  if (a4)
  {
    int v14 = 8 * *a4 + 8;
    memcpy((char *)a2 + v13, a4, v14);
    uint64_t v15 = v14 + *a2;
    unint64_t v13 = ((_DWORD)v15 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v15, v13 - v15);
    *a2 = v13;
  }

  if (v13 > a3)
  {
    if (a5)
    {
      int v16 = *a5;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      int v17 = v16;
      int v18 = 500;
      v19 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v17);
    }
  }

void DYTraceEncode_MTLTexture_timeSinceTouched( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    int v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 78;
  }
  else {
    int v11 = 70;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD81C00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      int v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_uniqueIdentifier( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    int v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 12;
  }
  else {
    int v11 = 4;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD80D00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      int v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_setLabel( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21315;
  *(void *)a2 = 0xFFFFC09000000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MTLTexture_setResponsibleProcess( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    int v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 14;
  }
  else {
    int v11 = 6;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 26947;
  *(void *)a2 = 0xFFFFC09100000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v12 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v13 + 8);
    uint64_t v14 = (v13 + 60);
    unint64_t v12 = (v13 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      int v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_dealloc(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC09200000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLTexture_didModifyData( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC35200000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLTexture_getBytes_bytesPerRow_fromRegion_mipmapLevel( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    int v22 = v10;
    int v23 = 500;
    v24 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v22);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFC09500000024LL;
  if (a4) {
    int v11 = 10;
  }
  else {
    int v11 = 2;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CU<b>ul@6ulul");
  *((_WORD *)a2 + 25) = 0;
  *a2 = 52;
  *(void *)(a2 + 13) = *(void *)a1;
  *a2 = 60;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 16);
  uint64_t v14 = *a2 + 8;
  *a2 = v14;
  int v15 = (_OWORD *)((char *)a2 + v14);
  __int128 v16 = *(_OWORD *)(a1 + 24);
  __int128 v17 = *(_OWORD *)(a1 + 56);
  v15[1] = *(_OWORD *)(a1 + 40);
  v15[2] = v17;
  *int v15 = v16;
  LODWORD(v15) = *a2 + 48;
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 72);
  unint64_t v18 = *a2 + 8;
  *a2 = v18;
  if (a4)
  {
    int v19 = 8 * *a4 + 8;
    memcpy((char *)a2 + v18, a4, v19);
    uint64_t v20 = v19 + *a2;
    unint64_t v18 = ((_DWORD)v20 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v20, v18 - v20);
    *a2 = v18;
  }

  if (a5)
  {
    if (v18 > a3)
    {
      int v21 = *a5;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      int v22 = v21;
      int v23 = 500;
      v24 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v22);
    }
  }

void DYTraceEncode_MTLTexture_isAliasable( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    unint64_t v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC11400000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)(a2 + 48) = 26997;
  *(_DWORD *)a2 = 52;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a1 + 8);
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      unint64_t v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_isPurgeable( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    unint64_t v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC09900000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)(a2 + 48) = 26997;
  *(_DWORD *)a2 = 52;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a1 + 8);
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      unint64_t v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_makeAliasable( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC10E00000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLTexture_newRemoteTextureViewForDevice( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFC1D700000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[2];
  *(_DWORD *)(a2 + 56) = 116;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[1];
  unint64_t v12 = 68LL;
  *(_DWORD *)a2 = 68;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 68), __src, v13 + 8);
    uint64_t v14 = (v13 + 76);
    unint64_t v12 = (v13 + 79) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newSharedTextureHandle( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC1DA00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)(a2 + 48) = 116;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  unint64_t v12 = 60LL;
  *(_DWORD *)a2 = 60;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 60), __src, v13 + 8);
    uint64_t v14 = (v13 + 68);
    unint64_t v12 = (v13 + 71) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newTextureViewWithPixelFormat( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFC09700000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[2];
  *(_DWORD *)(a2 + 56) = 116;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[1];
  unint64_t v12 = 68LL;
  *(_DWORD *)a2 = 68;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 68), __src, v13 + 8);
    uint64_t v14 = (v13 + 76);
    unint64_t v12 = (v13 + 79) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newTextureViewWithPixelFormat_resourceIndex( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC2B600000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(a2 + 36) = 0x77756C7543LL;
  *(_DWORD *)a2 = 44;
  *(void *)(a2 + 44) = *a1;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[2];
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[3];
  *(_DWORD *)(a2 + 68) = 116;
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[1];
  unint64_t v12 = 80LL;
  *(_DWORD *)a2 = 80;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 80), __src, v13 + 8);
    uint64_t v14 = (v13 + 88);
    unint64_t v12 = (v13 + 91) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC0BC00000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Culul@2ul@2ul");
  *(_WORD *)(a2 + 50) = 0;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = *(void *)a1;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 76;
  *(_OWORD *)(a2 + 76) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)a2 = 92;
  *(_OWORD *)(a2 + 92) = *(_OWORD *)(a1 + 48);
  *(_DWORD *)(a2 + 108) = 116;
  *(_DWORD *)a2 = 112;
  *(void *)(a2 + 112) = *(void *)(a1 + 8);
  unint64_t v12 = 120LL;
  *(_DWORD *)a2 = 120;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 120), __src, v13 + 8);
    uint64_t v14 = (v13 + 128);
    unint64_t v12 = (v13 + 131) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_resourceIndex( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC2B700000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Culul@2ul@2uluw");
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = *(void *)a1;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 76;
  *(_OWORD *)(a2 + 76) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)a2 = 92;
  *(_OWORD *)(a2 + 92) = *(_OWORD *)(a1 + 48);
  *(_DWORD *)a2 = 108;
  *(void *)(a2 + 108) = *(void *)(a1 + 64);
  *(_DWORD *)(a2 + 116) = 116;
  *(_DWORD *)a2 = 120;
  *(void *)(a2 + 120) = *(void *)(a1 + 8);
  unint64_t v12 = 128LL;
  *(_DWORD *)a2 = 128;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 128), __src, v13 + 8);
    uint64_t v14 = (v13 + 136);
    unint64_t v12 = (v13 + 139) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC26100000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 52) = 98;
  *(_OWORD *)(a2 + 36) = *(_OWORD *)"Culul@2ul@2ul@4ub";
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = *(void *)a1;
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 80;
  *(_OWORD *)(a2 + 80) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)a2 = 96;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 48);
  *(_DWORD *)a2 = 112;
  *(_DWORD *)(a2 + 112) = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(a2 + 116) = 116;
  *(_DWORD *)a2 = 120;
  *(void *)(a2 + 120) = *(void *)(a1 + 8);
  unint64_t v12 = 128LL;
  *(_DWORD *)a2 = 128;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 128), __src, v13 + 8);
    uint64_t v14 = (v13 + 136);
    unint64_t v12 = (v13 + 139) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_resourceIndex( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC2B800000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Culul@2ul@2ul@4ubuw");
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = *(void *)a1;
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 80;
  *(_OWORD *)(a2 + 80) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)a2 = 96;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 48);
  *(_DWORD *)a2 = 112;
  *(_DWORD *)(a2 + 112) = *(_DWORD *)(a1 + 72);
  *(_DWORD *)a2 = 116;
  *(void *)(a2 + 116) = *(void *)(a1 + 64);
  *(_DWORD *)(a2 + 124) = 116;
  *(_DWORD *)a2 = 128;
  *(void *)(a2 + 128) = *(void *)(a1 + 8);
  unint64_t v12 = 136LL;
  *(_DWORD *)a2 = 136;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 136), __src, v13 + 8);
    uint64_t v14 = (v13 + 144);
    unint64_t v12 = (v13 + 147) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLTexture_replaceRegion_mipmapLevel_withBytes_bytesPerRow( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFC09600000024LL;
  a2[8] = 8 * (a4 != 0LL);
  strcpy((char *)a2 + 36, "C@6ululU<b>ul");
  *((_WORD *)a2 + 25) = 0;
  *a2 = 52;
  *(void *)(a2 + 13) = *(void *)a1;
  *a2 = 60;
  __int128 v11 = *(_OWORD *)(a1 + 40);
  __int128 v12 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 15) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 19) = v12;
  *(_OWORD *)(a2 + 23) = v11;
  *a2 = 108;
  *(void *)(a2 + 27) = *(void *)(a1 + 56);
  *a2 = 116;
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v13 = *a2;
  uint64_t v14 = ((_DWORD)v13 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v13, v14 - v13);
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 72);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MTLTextureLayout_dealloc( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC11F00000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_setLabel( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21315;
  *(void *)a2 = 0xFFFFC1EE00000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MTLVideoCommandEncoder_dealloc( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC1EF00000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_endEncoding( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC1F400000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_generateMotionVectorsForTexture_previousTexture_resultBuffer_bufferOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC1F100000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "Ctttul");
  *(_BYTE *)(a2 + 43) = 0;
  *(_DWORD *)a2 = 44;
  *(void *)(a2 + 44) = *a1;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[2];
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = a1[3];
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = a1[4];
  unint64_t v11 = 84LL;
  *(_DWORD *)a2 = 84;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 84), __src, v12 + 8);
    uint64_t v13 = (v12 + 92);
    unint64_t v11 = (v12 + 95) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_insertDebugSignpost( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21315;
  *(void *)a2 = 0xFFFFC1F500000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MTLVideoCommandEncoder_popDebugGroup( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC1F700000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_pushDebugGroup( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21315;
  *(void *)a2 = 0xFFFFC1F600000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MTLVideoCommandEncoder_setMotionEstimationPipeline( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFC1F000000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_updateFence( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFC1F300000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVideoCommandEncoder_waitForFence( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFC1F200000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_allocatedSize( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFD84200000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_allocationID( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD83F00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_gpuAddress( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD85700000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_gpuResourceID( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 12;
  }
  else {
    int v11 = 4;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD85000000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_setFunctions_withRange( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFC31300000024LL;
  a2[8] = 8 * (a4 != 0LL);
  strcpy((char *)a2 + 36, "CU@2ul");
  *((_BYTE *)a2 + 43) = 0;
  *a2 = 44;
  *(void *)(a2 + 11) = *(void *)a1;
  *a2 = 52;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  uint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  *(_OWORD *)((char *)a2 + v12) = *(_OWORD *)(a1 + 16);
  unint64_t v13 = *a2 + 16;
  *a2 = v13;
  if (a4)
  {
    int v14 = 8 * *a4 + 8;
    memcpy((char *)a2 + v13, a4, v14);
    uint64_t v15 = v14 + *a2;
    unint64_t v13 = ((_DWORD)v15 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v15, v13 - v15);
    *a2 = v13;
  }

  if (a5)
  {
    if (v13 > a3)
    {
      int v16 = *a5;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      int v17 = v16;
      int v18 = 500;
      __int128 v19 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v17);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_timeSinceTouched( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD83E00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_uniqueIdentifier( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 12;
  }
  else {
    int v11 = 4;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7828803;
  *(void *)a2 = 0xFFFFD82F00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_setLabel( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21315;
  *(void *)a2 = 0xFFFFC30900000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MTLVisibleFunctionTable_setResponsibleProcess( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26947;
  *(void *)a2 = 0xFFFFC30A00000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_dealloc( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFC30B00000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLVisibleFunctionTable_setFunction_atIndex( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFC31200000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "Ctul");
  *(_WORD *)(a2 + 41) = 0;
  *(_BYTE *)(a2 + 43) = 0;
  *(_DWORD *)a2 = 44;
  *(void *)(a2 + 44) = *a1;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[2];
  unint64_t v11 = 68LL;
  *(_DWORD *)a2 = 68;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 68), __src, v12 + 8);
    uint64_t v13 = (v12 + 76);
    unint64_t v11 = (v12 + 79) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_NSHMDMetalSession_initWithMetalDevice_deviceReference_hmdName( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    __int128 v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE60200000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CtUS");
  *(_WORD *)((char *)a2 + 41) = 0;
  *((_BYTE *)a2 + 43) = 0;
  *a2 = 44;
  *(void *)(a2 + 11) = *(void *)a1;
  *a2 = 52;
  *(void *)(a2 + 13) = *(void *)(a1 + 16);
  *a2 = 60;
  AppendString(*(const char **)(a1 + 24), (int *)a2);
  AppendString(*(const char **)(a1 + 32), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      __int128 v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_NSHMDMetalSession_nextDrawable( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    int v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFE60100000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)(a2 + 48) = 116;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  unint64_t v12 = 60LL;
  *(_DWORD *)a2 = 60;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 60), __src, v13 + 8);
    uint64_t v14 = (v13 + 68);
    unint64_t v12 = (v13 + 71) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      int v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_NSHMDMetalSession_setDrawablePixelFormat( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFE60000000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_NSHMDMetalSession_setDrawableSize( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE60300000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "C@2d");
  *(_WORD *)(a2 + 41) = 0;
  *(_BYTE *)(a2 + 43) = 0;
  *(_DWORD *)a2 = 44;
  *(void *)(a2 + 44) = *(void *)a1;
  *(_DWORD *)a2 = 52;
  *(_OWORD *)(a2 + 52) = *(_OWORD *)(a1 + 8);
  unint64_t v11 = 68LL;
  *(_DWORD *)a2 = 68;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 68), __src, v12 + 8);
    uint64_t v13 = (v12 + 76);
    unint64_t v11 = (v12 + 79) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_UIScreen_setInterfaceOrientation( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26947;
  *(void *)a2 = 0xFFFFE40D00000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNConvolutionWithDescriptor_dataSource_fullyConnected( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    int v20 = v10;
    int v21 = 500;
    __int128 v22 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v20);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE80D00000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CUUi");
  *(_WORD *)((char *)a2 + 41) = 0;
  *((_BYTE *)a2 + 43) = 0;
  *a2 = 44;
  *(void *)(a2 + 11) = *(void *)a1;
  *a2 = 52;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  AppendString(*(const char **)(a1 + 24), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(unsigned int *)((char *)a2 + v13) = *(_DWORD *)(a1 + 32);
  unsigned int v14 = *a2 + 4;
  *a2 = v14;
  *(_WORD *)((char *)a2 + v14) = 116;
  uint64_t v15 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v15 - (*a2 + 2));
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 8);
  unint64_t v16 = *a2 + 8;
  *a2 = v16;
  if (a4)
  {
    int v17 = 8 * *a4 + 8;
    memcpy((char *)a2 + v16, a4, v17);
    uint64_t v18 = v17 + *a2;
    unint64_t v16 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v18, v16 - v18);
    *a2 = v16;
  }

  if (a5)
  {
    if (v16 > a3)
    {
      int v19 = *a5;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      int v20 = v19;
      int v21 = 500;
      __int128 v22 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v20);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNConvolutionWithDescriptor_convolutionData( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 5592387;
  *(void *)a2 = 0xFFFFE80100000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  AppendString(*(const char **)(a1 + 24), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNConvolutionGradientWithDescriptor_convolutionData( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 5592387;
  *(void *)a2 = 0xFFFFE82100000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  AppendString(*(const char **)(a1 + 24), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNNeuronWithNeuronType_neuronParameterA_neuronParameterB_neuronParameterC( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    int v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE80B00000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(a2 + 36) = 0x6666666943LL;
  *(_DWORD *)a2 = 44;
  *(void *)(a2 + 44) = *(void *)a1;
  *(_DWORD *)a2 = 52;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)a2 = 56;
  *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)a2 = 60;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)(a1 + 24);
  *(_DWORD *)a2 = 64;
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(a1 + 28);
  *(_DWORD *)(a2 + 68) = 116;
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)(a1 + 8);
  unint64_t v12 = 80LL;
  *(_DWORD *)a2 = 80;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 80), __src, v13 + 8);
    uint64_t v14 = (v13 + 88);
    unint64_t v12 = (v13 + 91) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      int v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNNeuronWithNeuronType_neuronParameterAArray_count( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    int v20 = v10;
    int v21 = 500;
    __int128 v22 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v20);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE80F00000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  *(void *)(a2 + 9) = 0x6C75556943LL;
  *a2 = 44;
  *(void *)(a2 + 11) = *(void *)a1;
  *a2 = 52;
  a2[13] = *(_DWORD *)(a1 + 16);
  *a2 = 56;
  AppendString(*(const char **)(a1 + 24), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 32);
  unsigned int v14 = *a2 + 8;
  *a2 = v14;
  *(_WORD *)((char *)a2 + v14) = 116;
  uint64_t v15 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v15 - (*a2 + 2));
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 8);
  unint64_t v16 = *a2 + 8;
  *a2 = v16;
  if (a4)
  {
    int v17 = 8 * *a4 + 8;
    memcpy((char *)a2 + v16, a4, v17);
    uint64_t v18 = v17 + *a2;
    unint64_t v16 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v18, v16 - v18);
    *a2 = v16;
  }

  if (a5)
  {
    if (v16 > a3)
    {
      int v19 = *a5;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      int v20 = v19;
      int v21 = 500;
      __int128 v22 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v20);
    }
  }

void DYTraceEncode_MPSPlugin_newMatrixMultiplicationWithTransposeLeft_transposeRight_resultRows_resultColumns_interiorColumns_alpha_beta( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE81600000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Ciiulululdd");
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *(void *)a1;
  *(_DWORD *)a2 = 56;
  *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)a2 = 60;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = *(void *)(a1 + 56);
  unint64_t v12 = 116LL;
  *(_DWORD *)(a2 + 104) = 116;
  *(_DWORD *)a2 = 108;
  *(void *)(a2 + 108) = *(void *)(a1 + 8);
  *(_DWORD *)a2 = 116;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 116), __src, v13 + 8);
    unint64_t v12 = (v13 + 127) & 0xFFFFFFFC;
    bzero((void *)(a2 + (v13 + 124)), v12 - (v13 + 124));
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSPlugin_newMatrixVectorMultiplicationWithTranspose_rows_columns_alpha_beta( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE80A00000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Ciululdd");
  *(_WORD *)(a2 + 45) = 0;
  *(_BYTE *)(a2 + 47) = 0;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *(void *)a1;
  *(_DWORD *)a2 = 56;
  *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = *(void *)(a1 + 48);
  *(_DWORD *)(a2 + 92) = 116;
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = *(void *)(a1 + 8);
  unint64_t v12 = 104LL;
  *(_DWORD *)a2 = 104;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 104), __src, v13 + 8);
    uint64_t v14 = (v13 + 112);
    unint64_t v12 = (v13 + 115) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newMatrixFullyConnected( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFE82200000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)(a2 + 48) = 116;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  unint64_t v12 = 60LL;
  *(_DWORD *)a2 = 60;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 60), __src, v13 + 8);
    uint64_t v14 = (v13 + 68);
    unint64_t v12 = (v13 + 71) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNPoolingMaxWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE80300000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 44) = 108;
  *(void *)(a2 + 36) = *(void *)"Culululul";
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[2];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[3];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[4];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[5];
  *(_DWORD *)(a2 + 88) = 116;
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = a1[1];
  unint64_t v12 = 100LL;
  *(_DWORD *)a2 = 100;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 100), __src, v13 + 8);
    uint64_t v14 = (v13 + 108);
    unint64_t v12 = (v13 + 111) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNPoolingAverageWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82300000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 44) = 108;
  *(void *)(a2 + 36) = *(void *)"Culululul";
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[2];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[3];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[4];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[5];
  *(_DWORD *)(a2 + 88) = 116;
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = a1[1];
  unint64_t v12 = 100LL;
  *(_DWORD *)a2 = 100;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 100), __src, v13 + 8);
    uint64_t v14 = (v13 + 108);
    unint64_t v12 = (v13 + 111) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNDilatedPoolingMaxWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY_dilationRateX_dilationRateY( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE81C00000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Culululululul");
  *(_WORD *)(a2 + 50) = 0;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = *a1;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[2];
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = a1[3];
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = a1[4];
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = a1[5];
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = a1[6];
  *(_DWORD *)a2 = 100;
  *(void *)(a2 + 100) = a1[7];
  *(_DWORD *)(a2 + 108) = 116;
  *(_DWORD *)a2 = 112;
  *(void *)(a2 + 112) = a1[1];
  unint64_t v12 = 120LL;
  *(_DWORD *)a2 = 120;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 120), __src, v13 + 8);
    uint64_t v14 = (v13 + 128);
    unint64_t v12 = (v13 + 131) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newCNNSoftMax( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFE81900000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)(a2 + 48) = 116;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  unint64_t v12 = 60LL;
  *(_DWORD *)a2 = 60;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 60), __src, v13 + 8);
    uint64_t v14 = (v13 + 68);
    unint64_t v12 = (v13 + 71) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSPlugin_newNDArrayConvolution2DWithDescriptor( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFE83100000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSPlugin_newNDArrayConvolution2DGradientWithDescriptor( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFE83000000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSExternalPluginBase_dealloc( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFE80500000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNUnary_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_sourceInfo_destinationTexture_destinationInfo( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    int v21 = v10;
    int v22 = 500;
    __int128 v23 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v21);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE80900000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[11] = 85;
  *(void *)(a2 + 9) = *(void *)"CttultUtU";
  *a2 = 48;
  *((void *)a2 + 6) = *(void *)a1;
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)(a1 + 16);
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 24);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 32);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 40);
  *a2 = 88;
  AppendString(*(const char **)(a1 + 48), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 56);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  strcpy((char *)a2 + v15, "ul");
  uint64_t v16 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v16 - (*a2 + 3));
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 8);
  unint64_t v17 = *a2 + 8;
  *a2 = v17;
  if (a4)
  {
    int v18 = 8 * *a4 + 8;
    memcpy((char *)a2 + v17, a4, v18);
    uint64_t v19 = v18 + *a2;
    unint64_t v17 = ((_DWORD)v19 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v19, v17 - v19);
    *a2 = v17;
  }

  if (a5)
  {
    if (v17 > a3)
    {
      int v20 = *a5;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v21 = v20;
      int v22 = 500;
      __int128 v23 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v21);
    }
  }

void DYTraceEncode_MPSExternalCNNUnary_encodeToCommandBuffer_computeCommandEncoder_options_pluginOptions_sourceTexture_sourceInfo_destinationTexture_destinationInfo( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    int v21 = v10;
    int v22 = 500;
    __int128 v23 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v21);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  *(void *)a2 = 0xFFFFE81B00000024LL;
  strcpy((char *)a2 + 36, "CttulultUtU");
  *a2 = 48;
  *((void *)a2 + 6) = *(void *)a1;
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)(a1 + 16);
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 24);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 32);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 40);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 48);
  *a2 = 96;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  strcpy((char *)a2 + v15, "ul");
  uint64_t v16 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v16 - (*a2 + 3));
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 8);
  unint64_t v17 = *a2 + 8;
  *a2 = v17;
  if (a4)
  {
    int v18 = 8 * *a4 + 8;
    memcpy((char *)a2 + v17, a4, v18);
    uint64_t v19 = v18 + *a2;
    unint64_t v17 = ((_DWORD)v19 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v19, v17 - v19);
    *a2 = v17;
  }

  if (a5)
  {
    if (v17 > a3)
    {
      int v20 = *a5;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v21 = v20;
      int v22 = 500;
      __int128 v23 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v21);
    }
  }

void DYTraceEncode_MPSExternalCNNUnary_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_sourceTextures_sourceInfo_destinationTextures_destinationInfo_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    int v30 = v10;
    int v31 = 500;
    v32 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v30);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE81D00000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  int v12 = snprintf((char *)a2 + 36, a3 - 36, "Cttulul@%llutU@%llutUtul", *(void *)(a1 + 56), *(void *)(a1 + 80)) + *a2;
  uint64_t v13 = (v12 + 4) & 0xFFFFFFFC;
  bzero((char *)a2 + (v12 + 1), v13 - (v12 + 1));
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)a1;
  unsigned int v14 = *a2 + 8;
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 16);
  unsigned int v15 = *a2 + 8;
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 24);
  unsigned int v16 = *a2 + 8;
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 32);
  unsigned int v17 = *a2 + 8;
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 40);
  uint64_t v18 = *a2 + 8;
  *a2 = v18;
  memcpy((char *)a2 + v18, *(const void **)(a1 + 48), 8LL * *(void *)(a1 + 56));
  *a2 += 8 * *(_DWORD *)(a1 + 56);
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v19 = *a2;
  uint64_t v20 = ((_DWORD)v19 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v19, v20 - v19);
  *a2 = v20;
  memcpy((char *)a2 + v20, *(const void **)(a1 + 72), 8LL * *(void *)(a1 + 80));
  *a2 += 8 * *(_DWORD *)(a1 + 80);
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v21 = *a2;
  uint64_t v22 = ((_DWORD)v21 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v21, v22 - v21);
  *a2 = v22;
  *(void *)((char *)a2 + v22) = *(void *)(a1 + 96);
  unsigned int v23 = *a2 + 8;
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 104);
  uint64_t v24 = *a2 + 8;
  *a2 = v24;
  strcpy((char *)a2 + v24, "ul");
  uint64_t v25 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v25 - (*a2 + 3));
  *a2 = v25;
  *(void *)((char *)a2 + v25) = *(void *)(a1 + 8);
  unint64_t v26 = *a2 + 8;
  *a2 = v26;
  if (a4)
  {
    int v27 = 8 * *a4 + 8;
    memcpy((char *)a2 + v26, a4, v27);
    uint64_t v28 = v27 + *a2;
    unint64_t v26 = ((_DWORD)v28 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v28, v26 - v28);
    *a2 = v26;
  }

  if (a5)
  {
    if (v26 > a3)
    {
      int v29 = *a5;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      int v30 = v29;
      int v31 = 500;
      v32 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v30);
    }
  }

void DYTraceEncode_MPSExternalCNNUnary_maxBatchSize( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    uint64_t v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFE80600000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)(a2 + 48) = 27765;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  unint64_t v12 = 60LL;
  *(_DWORD *)a2 = 60;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 60), __src, v13 + 8);
    uint64_t v14 = (v13 + 68);
    unint64_t v12 = (v13 + 71) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      uint64_t v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSExternalCNNBinary_encodeToCommandBuffer_computeCommandEncoder_options_pluginOptions_primaryTexture_primaryInfo_secondaryTexture_secondaryInfo_destinationTexture_destinationInfo( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    int v23 = v10;
    int v24 = 500;
    uint64_t v25 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v23);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE81300000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CttulultUtUtU");
  *((_WORD *)a2 + 25) = 0;
  *a2 = 52;
  *(void *)(a2 + 13) = *(void *)a1;
  *a2 = 60;
  *(void *)(a2 + 15) = *(void *)(a1 + 16);
  *a2 = 68;
  *(void *)(a2 + 17) = *(void *)(a1 + 24);
  *a2 = 76;
  *(void *)(a2 + 19) = *(void *)(a1 + 32);
  *a2 = 84;
  *(void *)(a2 + 21) = *(void *)(a1 + 40);
  *a2 = 92;
  *(void *)(a2 + 23) = *(void *)(a1 + 48);
  *a2 = 100;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 80);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v16 = *a2;
  uint64_t v17 = ((_DWORD)v16 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v16, v17 - v16);
  *a2 = v17;
  strcpy((char *)a2 + v17, "ul");
  uint64_t v18 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v18 - (*a2 + 3));
  *a2 = v18;
  *(void *)((char *)a2 + v18) = *(void *)(a1 + 8);
  unint64_t v19 = *a2 + 8;
  *a2 = v19;
  if (a4)
  {
    int v20 = 8 * *a4 + 8;
    memcpy((char *)a2 + v19, a4, v20);
    uint64_t v21 = v20 + *a2;
    unint64_t v19 = ((_DWORD)v21 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v21, v19 - v21);
    *a2 = v19;
  }

  if (a5)
  {
    if (v19 > a3)
    {
      int v22 = *a5;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      int v23 = v22;
      int v24 = 500;
      uint64_t v25 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v23);
    }
  }

void DYTraceEncode_MPSExternalCNNBinary_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_primaryTextures_primaryInfo_secondaryTextures_secondaryInfo_destinationTextures_destinationInfo_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    int v32 = v10;
    int v33 = 500;
    __int128 v34 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v32);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE81A00000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  int v12 = snprintf( (char *)a2 + 36,  a3 - 36,  "Cttulul@%llutU@%llutU@%llutUtul",  *(void *)(a1 + 56),  *(void *)(a1 + 80),  *(void *)(a1 + 104))
      + *a2;
  uint64_t v13 = (v12 + 4) & 0xFFFFFFFC;
  bzero((char *)a2 + (v12 + 1), v13 - (v12 + 1));
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)a1;
  unsigned int v14 = *a2 + 8;
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 16);
  unsigned int v15 = *a2 + 8;
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 24);
  unsigned int v16 = *a2 + 8;
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 32);
  unsigned int v17 = *a2 + 8;
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 40);
  uint64_t v18 = *a2 + 8;
  *a2 = v18;
  memcpy((char *)a2 + v18, *(const void **)(a1 + 48), 8LL * *(void *)(a1 + 56));
  *a2 += 8 * *(_DWORD *)(a1 + 56);
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v19 = *a2;
  uint64_t v20 = ((_DWORD)v19 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v19, v20 - v19);
  *a2 = v20;
  memcpy((char *)a2 + v20, *(const void **)(a1 + 72), 8LL * *(void *)(a1 + 80));
  *a2 += 8 * *(_DWORD *)(a1 + 80);
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v21 = *a2;
  uint64_t v22 = ((_DWORD)v21 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v21, v22 - v21);
  *a2 = v22;
  memcpy((char *)a2 + v22, *(const void **)(a1 + 96), 8LL * *(void *)(a1 + 104));
  *a2 += 8 * *(_DWORD *)(a1 + 104);
  AppendString(*(const char **)(a1 + 112), (int *)a2);
  uint64_t v23 = *a2;
  uint64_t v24 = ((_DWORD)v23 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v23, v24 - v23);
  *a2 = v24;
  *(void *)((char *)a2 + v24) = *(void *)(a1 + 120);
  unsigned int v25 = *a2 + 8;
  *a2 = v25;
  *(void *)((char *)a2 + v25) = *(void *)(a1 + 128);
  uint64_t v26 = *a2 + 8;
  *a2 = v26;
  strcpy((char *)a2 + v26, "ul");
  uint64_t v27 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v27 - (*a2 + 3));
  *a2 = v27;
  *(void *)((char *)a2 + v27) = *(void *)(a1 + 8);
  unint64_t v28 = *a2 + 8;
  *a2 = v28;
  if (a4)
  {
    int v29 = 8 * *a4 + 8;
    memcpy((char *)a2 + v28, a4, v29);
    uint64_t v30 = v29 + *a2;
    unint64_t v28 = ((_DWORD)v30 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v30, v28 - v30);
    *a2 = v28;
  }

  if (a5)
  {
    if (v28 > a3)
    {
      int v31 = *a5;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      int v32 = v31;
      int v33 = 500;
      __int128 v34 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v32);
    }
  }

void DYTraceEncode_MPSExternalCNNBinary_maxBatchSize( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    uint64_t v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFE81500000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)(a2 + 48) = 27765;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  unint64_t v12 = 60LL;
  *(_DWORD *)a2 = 60;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 60), __src, v13 + 8);
    uint64_t v14 = (v13 + 68);
    unint64_t v12 = (v13 + 71) & 0xFFFFFFFC;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      uint64_t v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolution_reloadWeightsAndBiases( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFE81800000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MPSExternalCNNConvolution_reloadWeightsAndBiasesWithCommandBuffer_encoder_weights_biases_predicationBuffer_predicationOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE80800000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "Ctttttul");
  *(_WORD *)(a2 + 45) = 0;
  *(_BYTE *)(a2 + 47) = 0;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[1];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[2];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[3];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[4];
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = a1[5];
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = a1[6];
  unint64_t v11 = 104LL;
  *(_DWORD *)a2 = 104;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 104), __src, v12 + 8);
    uint64_t v13 = (v12 + 112);
    unint64_t v11 = (v12 + 115) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolution_exportWeightsAndBiasesWithCommandBuffer_encoder_weights_biases_predicationBuffer_predicationOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82000000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "Ctttttul");
  *(_WORD *)(a2 + 45) = 0;
  *(_BYTE *)(a2 + 47) = 0;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[1];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[2];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[3];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[4];
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = a1[5];
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = a1[6];
  unint64_t v11 = 104LL;
  *(_DWORD *)a2 = 104;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 104), __src, v12 + 8);
    uint64_t v13 = (v12 + 112);
    unint64_t v11 = (v12 + 115) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolution_reloadWeightsAndBiasesWithCommandBuffer_encoder_weights_weightsDataType_biases_predicationBuffer_predicationOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82400000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "Ctttulttul");
  *(_BYTE *)(a2 + 47) = 0;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[1];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[2];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[3];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[4];
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = a1[5];
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = a1[6];
  *(_DWORD *)a2 = 104;
  *(void *)(a2 + 104) = a1[7];
  unint64_t v11 = 112LL;
  *(_DWORD *)a2 = 112;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 112), __src, v12 + 8);
    uint64_t v13 = (v12 + 120);
    unint64_t v11 = (v12 + 123) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolution_exportWeightsAndBiasesWithCommandBuffer_encoder_weights_weightsDataType_biases_predicationBuffer_predicationOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82600000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  strcpy((char *)(a2 + 36), "Ctttulttul");
  *(_BYTE *)(a2 + 47) = 0;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[1];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[2];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[3];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[4];
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = a1[5];
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = a1[6];
  *(_DWORD *)a2 = 104;
  *(void *)(a2 + 104) = a1[7];
  unint64_t v11 = 112LL;
  *(_DWORD *)a2 = 112;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 112), __src, v12 + 8);
    uint64_t v13 = (v12 + 120);
    unint64_t v11 = (v12 + 123) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolutionGradient_reloadWeights( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v10;
    int v18 = 500;
    __int128 v19 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  a2[8] = 8 * (a4 != 0LL);
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFE81100000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 8), (int *)a2);
  uint64_t v11 = *a2;
  unint64_t v12 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v11, v12 - v11);
  *a2 = v12;
  if (a4)
  {
    int v13 = 8 * *a4 + 8;
    memcpy((char *)a2 + v12, a4, v13);
    uint64_t v14 = v13 + *a2;
    unint64_t v12 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v14, v12 - v14);
    *a2 = v12;
  }

  if (v12 > a3 && a5 != 0LL)
  {
    int v16 = *a5;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v17 = v16;
    int v18 = 500;
    __int128 v19 = "bytes->length <= length";
    GTError_addError(a5, (uint64_t)&v17);
  }

void DYTraceEncode_MPSExternalCNNConvolutionGradient_reloadWeightsWithCommandBuffer_encoder_weights_predicationBuffer_predicationOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(void *)(a2 + 36) = 0x6C757474747443LL;
  *(void *)a2 = 0xFFFFE81F0000002CLL;
  *(void *)(a2 + 44) = *a1;
  *(_DWORD *)a2 = 52;
  *(void *)(a2 + 52) = a1[1];
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = a1[2];
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = a1[3];
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = a1[4];
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = a1[5];
  unint64_t v11 = 92LL;
  *(_DWORD *)a2 = 92;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 92), __src, v12 + 8);
    uint64_t v13 = (v12 + 100);
    unint64_t v11 = (v12 + 103) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolutionGradient_reloadWeightsWithCommandBuffer_encoder_weights_weightsDataType_predicationBuffer_predicationOffset( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82500000024LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 44) = 108;
  *(void *)(a2 + 36) = *(void *)"Ctttultul";
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = *a1;
  *(_DWORD *)a2 = 56;
  *(void *)(a2 + 56) = a1[1];
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = a1[2];
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = a1[3];
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = a1[4];
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = a1[5];
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = a1[6];
  unint64_t v11 = 104LL;
  *(_DWORD *)a2 = 104;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 104), __src, v12 + 8);
    uint64_t v13 = (v12 + 112);
    unint64_t v11 = (v12 + 115) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MPSExternalCNNConvolutionGradient_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_primaryTextures_primaryInfo_secondaryTextures_secondaryInfo_weightsGradient_biasesGradient_accumulate_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    int v33 = v10;
    int v34 = 500;
    __int128 v35 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v33);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE81E00000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  uint64_t v13 = (v12 + 4) & 0xFFFFFFFC;
  bzero((char *)a2 + (v12 + 1), v13 - (v12 + 1));
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)a1;
  unsigned int v14 = *a2 + 8;
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 16);
  unsigned int v15 = *a2 + 8;
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 24);
  unsigned int v16 = *a2 + 8;
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 32);
  unsigned int v17 = *a2 + 8;
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 40);
  uint64_t v18 = *a2 + 8;
  *a2 = v18;
  memcpy((char *)a2 + v18, *(const void **)(a1 + 48), 8LL * *(void *)(a1 + 56));
  *a2 += 8 * *(_DWORD *)(a1 + 56);
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v19 = *a2;
  uint64_t v20 = ((_DWORD)v19 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v19, v20 - v19);
  *a2 = v20;
  memcpy((char *)a2 + v20, *(const void **)(a1 + 72), 8LL * *(void *)(a1 + 80));
  *a2 += 8 * *(_DWORD *)(a1 + 80);
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v21 = *a2;
  uint64_t v22 = ((_DWORD)v21 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v21, v22 - v21);
  *a2 = v22;
  *(void *)((char *)a2 + v22) = *(void *)(a1 + 96);
  unsigned int v23 = *a2 + 8;
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 104);
  unsigned int v24 = *a2 + 8;
  *a2 = v24;
  *(unsigned int *)((char *)a2 + v24) = *(_DWORD *)(a1 + 112);
  unsigned int v25 = *a2 + 4;
  *a2 = v25;
  *(void *)((char *)a2 + v25) = *(void *)(a1 + 120);
  unsigned int v26 = *a2 + 8;
  *a2 = v26;
  *(void *)((char *)a2 + v26) = *(void *)(a1 + 128);
  uint64_t v27 = *a2 + 8;
  *a2 = v27;
  strcpy((char *)a2 + v27, "ul");
  uint64_t v28 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v28 - (*a2 + 3));
  *a2 = v28;
  *(void *)((char *)a2 + v28) = *(void *)(a1 + 8);
  unint64_t v29 = *a2 + 8;
  *a2 = v29;
  if (a4)
  {
    int v30 = 8 * *a4 + 8;
    memcpy((char *)a2 + v29, a4, v30);
    uint64_t v31 = v30 + *a2;
    unint64_t v29 = ((_DWORD)v31 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v31, v29 - v31);
    *a2 = v29;
  }

  if (a5)
  {
    if (v29 > a3)
    {
      int v32 = *a5;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      int v33 = v32;
      int v34 = 500;
      __int128 v35 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v33);
    }
  }

void DYTraceEncode_MPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_A_aInfo_B_bInfo_C_cInfo( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    uint64_t v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE80E00000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Cttulult@4ult@4ult@4ul");
  *(_BYTE *)(a2 + 59) = 0;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = *(void *)a1;
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 100;
  *(void *)(a2 + 100) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 108;
  __int128 v12 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 108) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 124) = v12;
  *(_DWORD *)a2 = 140;
  *(void *)(a2 + 140) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 148;
  __int128 v13 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 148) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 164) = v13;
  *(_DWORD *)a2 = 180;
  *(void *)(a2 + 180) = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 188;
  __int128 v14 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 188) = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 204) = v14;
  *(_DWORD *)(a2 + 220) = 27765;
  *(_DWORD *)a2 = 224;
  *(void *)(a2 + 224) = *(void *)(a1 + 8);
  unint64_t v15 = 232LL;
  *(_DWORD *)a2 = 232;
  if (__src)
  {
    int v16 = 8 * *__src;
    memcpy((void *)(a2 + 232), __src, v16 + 8);
    uint64_t v17 = (v16 + 240);
    unint64_t v15 = (v16 + 243) & 0xFFFFFFF8;
    bzero((void *)(a2 + v17), v15 - v17);
    *(_DWORD *)a2 = v15;
  }

  if (v15 > a3)
  {
    if (a5)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      uint64_t v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resultColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    uint64_t v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)a2 = 0xFFFFE80C00000024LL;
  strcpy((char *)(a2 + 36), "Cttulululululddt@4ult@4ult@4ul");
  *(_BYTE *)(a2 + 67) = 0;
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = *(void *)a1;
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 100;
  *(void *)(a2 + 100) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 108;
  *(void *)(a2 + 108) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 116;
  *(void *)(a2 + 116) = *(void *)(a1 + 56);
  *(_DWORD *)a2 = 124;
  *(void *)(a2 + 124) = *(void *)(a1 + 64);
  *(_DWORD *)a2 = 132;
  *(void *)(a2 + 132) = *(void *)(a1 + 72);
  *(_DWORD *)a2 = 140;
  *(void *)(a2 + 140) = *(void *)(a1 + 80);
  *(_DWORD *)a2 = 148;
  *(void *)(a2 + 148) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 156;
  __int128 v12 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 156) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 172) = v12;
  *(_DWORD *)a2 = 188;
  *(void *)(a2 + 188) = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 196;
  __int128 v13 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 196) = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 212) = v13;
  *(_DWORD *)a2 = 228;
  *(void *)(a2 + 228) = *(void *)(a1 + 168);
  *(_DWORD *)a2 = 236;
  __int128 v14 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 236) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 252) = v14;
  *(_DWORD *)(a2 + 268) = 27765;
  *(_DWORD *)a2 = 272;
  *(void *)(a2 + 272) = *(void *)(a1 + 8);
  unint64_t v15 = 280LL;
  *(_DWORD *)a2 = 280;
  if (__src)
  {
    int v16 = 8 * *__src;
    memcpy((void *)(a2 + 280), __src, v16 + 8);
    uint64_t v17 = (v16 + 288);
    unint64_t v15 = (v16 + 291) & 0xFFFFFFF8;
    bzero((void *)(a2 + v17), v15 - v17);
    *(_DWORD *)a2 = v15;
  }

  if (v15 > a3)
  {
    if (a5)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      uint64_t v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRowsAndResultColumnsAndInteriorColumns_alphaAndBeta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    int v20 = v10;
    int v21 = 500;
    __int128 v22 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v20);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82700000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Cttulul@3ul@2dt@4ult@4ult@4ultul");
  *(_WORD *)(a2 + 69) = 0;
  *(_BYTE *)(a2 + 71) = 0;
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)a1;
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 104;
  *(void *)(a2 + 104) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 112;
  uint64_t v12 = *(void *)(a1 + 64);
  *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 48);
  *(void *)(a2 + 128) = v12;
  *(_DWORD *)a2 = 136;
  *(_OWORD *)(a2 + 136) = *(_OWORD *)(a1 + 72);
  *(_DWORD *)a2 = 152;
  *(void *)(a2 + 152) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 160;
  __int128 v13 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 176) = v13;
  *(_DWORD *)a2 = 192;
  *(void *)(a2 + 192) = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 200;
  __int128 v14 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 200) = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 216) = v14;
  *(_DWORD *)a2 = 232;
  *(void *)(a2 + 232) = *(void *)(a1 + 168);
  *(_DWORD *)a2 = 240;
  __int128 v15 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 240) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 256) = v15;
  *(_DWORD *)a2 = 272;
  *(void *)(a2 + 272) = *(void *)(a1 + 208);
  *(_DWORD *)a2 = 280;
  *(void *)(a2 + 280) = *(void *)(a1 + 216);
  *(_DWORD *)(a2 + 288) = 27765;
  *(_DWORD *)a2 = 292;
  *(void *)(a2 + 292) = *(void *)(a1 + 8);
  unint64_t v16 = 300LL;
  *(_DWORD *)a2 = 300;
  if (__src)
  {
    int v17 = 8 * *__src;
    memcpy((void *)(a2 + 300), __src, v17 + 8);
    uint64_t v18 = (v17 + 308);
    unint64_t v16 = (v17 + 311) & 0xFFFFFFFC;
    bzero((void *)(a2 + v18), v16 - v18);
    *(_DWORD *)a2 = v16;
  }

  if (v16 > a3)
  {
    if (a5)
    {
      int v19 = *a5;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      int v20 = v19;
      int v21 = 500;
      __int128 v22 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v20);
    }
  }

void DYTraceEncode_MPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resultColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset_transA_transB( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    int v20 = v10;
    int v21 = 500;
    __int128 v22 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v20);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82B00000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Cttulul@3ul@2dt@4ult@4ult@4ultulii");
  *(_BYTE *)(a2 + 71) = 0;
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)a1;
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 104;
  *(void *)(a2 + 104) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 112;
  uint64_t v12 = *(void *)(a1 + 64);
  *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 48);
  *(void *)(a2 + 128) = v12;
  *(_DWORD *)a2 = 136;
  *(_OWORD *)(a2 + 136) = *(_OWORD *)(a1 + 72);
  *(_DWORD *)a2 = 152;
  *(void *)(a2 + 152) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 160;
  __int128 v13 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 176) = v13;
  *(_DWORD *)a2 = 192;
  *(void *)(a2 + 192) = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 200;
  __int128 v14 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 200) = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 216) = v14;
  *(_DWORD *)a2 = 232;
  *(void *)(a2 + 232) = *(void *)(a1 + 168);
  *(_DWORD *)a2 = 240;
  __int128 v15 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 240) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 256) = v15;
  *(_DWORD *)a2 = 272;
  *(void *)(a2 + 272) = *(void *)(a1 + 208);
  *(_DWORD *)a2 = 280;
  *(void *)(a2 + 280) = *(void *)(a1 + 216);
  *(_DWORD *)a2 = 288;
  *(_DWORD *)(a2 + 288) = *(_DWORD *)(a1 + 224);
  *(_DWORD *)a2 = 292;
  *(_DWORD *)(a2 + 292) = *(_DWORD *)(a1 + 228);
  *(_DWORD *)(a2 + 296) = 27765;
  *(_DWORD *)a2 = 300;
  *(void *)(a2 + 300) = *(void *)(a1 + 8);
  unint64_t v16 = 308LL;
  *(_DWORD *)a2 = 308;
  if (__src)
  {
    int v17 = 8 * *__src;
    memcpy((void *)(a2 + 308), __src, v17 + 8);
    uint64_t v18 = (v17 + 316);
    unint64_t v16 = (v17 + 319) & 0xFFFFFFFC;
    bzero((void *)(a2 + v18), v16 - v18);
    *(_DWORD *)a2 = v16;
  }

  if (v16 > a3)
  {
    if (a5)
    {
      int v19 = *a5;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      int v20 = v19;
      int v21 = 500;
      __int128 v22 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v20);
    }
  }

void DYTraceEncode_MPSExternalMatrixVectorMultiplication_encodeToCommandBuffer_encoder_options_batchSize_matrix_matrixStructure_vector_vectorStructure_result_resultStructure( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE80700000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Cttulult@4ult@3ult@3ul");
  *(_BYTE *)(a2 + 59) = 0;
  *(_DWORD *)a2 = 60;
  *(void *)(a2 + 60) = *(void *)a1;
  *(_DWORD *)a2 = 68;
  *(void *)(a2 + 68) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 100;
  *(void *)(a2 + 100) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 108;
  __int128 v12 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 108) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 124) = v12;
  *(_DWORD *)a2 = 140;
  *(void *)(a2 + 140) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 148;
  uint64_t v13 = *(void *)(a1 + 112);
  *(_OWORD *)(a2 + 148) = *(_OWORD *)(a1 + 96);
  *(void *)(a2 + 164) = v13;
  *(_DWORD *)a2 = 172;
  *(void *)(a2 + 172) = *(void *)(a1 + 120);
  *(_DWORD *)a2 = 180;
  uint64_t v14 = *(void *)(a1 + 144);
  *(_OWORD *)(a2 + 180) = *(_OWORD *)(a1 + 128);
  *(void *)(a2 + 196) = v14;
  *(_DWORD *)(a2 + 204) = 27765;
  *(_DWORD *)a2 = 208;
  *(void *)(a2 + 208) = *(void *)(a1 + 8);
  unint64_t v15 = 216LL;
  *(_DWORD *)a2 = 216;
  if (__src)
  {
    int v16 = 8 * *__src;
    memcpy((void *)(a2 + 216), __src, v16 + 8);
    uint64_t v17 = (v16 + 224);
    unint64_t v15 = (v16 + 227) & 0xFFFFFFF8;
    bzero((void *)(a2 + v17), v15 - v17);
    *(_DWORD *)a2 = v15;
  }

  if (v15 > a3)
  {
    if (a5)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSExternalMatrixVectorMultiplication_encodeToCommandBuffer_encoder_options_batchSize_matrix_matrixStructure_vector_vectorStructure_result_resultStructure_predicationBuffer_predicationOffset( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)a2 = 0xFFFFE80400000024LL;
  strcpy((char *)(a2 + 36), "Cttulult@4ult@3ult@3ultul");
  *(_WORD *)(a2 + 62) = 0;
  *(_DWORD *)a2 = 64;
  *(void *)(a2 + 64) = *(void *)a1;
  *(_DWORD *)a2 = 72;
  *(void *)(a2 + 72) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 80;
  *(void *)(a2 + 80) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 88;
  *(void *)(a2 + 88) = *(void *)(a1 + 32);
  *(_DWORD *)a2 = 96;
  *(void *)(a2 + 96) = *(void *)(a1 + 40);
  *(_DWORD *)a2 = 104;
  *(void *)(a2 + 104) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 112;
  __int128 v12 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 128) = v12;
  *(_DWORD *)a2 = 144;
  *(void *)(a2 + 144) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 152;
  uint64_t v13 = *(void *)(a1 + 112);
  *(_OWORD *)(a2 + 152) = *(_OWORD *)(a1 + 96);
  *(void *)(a2 + 168) = v13;
  *(_DWORD *)a2 = 176;
  *(void *)(a2 + 176) = *(void *)(a1 + 120);
  *(_DWORD *)a2 = 184;
  uint64_t v14 = *(void *)(a1 + 144);
  *(_OWORD *)(a2 + 184) = *(_OWORD *)(a1 + 128);
  *(void *)(a2 + 200) = v14;
  *(_DWORD *)a2 = 208;
  *(void *)(a2 + 208) = *(void *)(a1 + 152);
  *(_DWORD *)a2 = 216;
  *(void *)(a2 + 216) = *(void *)(a1 + 160);
  *(_DWORD *)(a2 + 224) = 27765;
  *(_DWORD *)a2 = 228;
  *(void *)(a2 + 228) = *(void *)(a1 + 8);
  unint64_t v15 = 236LL;
  *(_DWORD *)a2 = 236;
  if (__src)
  {
    int v16 = 8 * *__src;
    memcpy((void *)(a2 + 236), __src, v16 + 8);
    uint64_t v17 = (v16 + 244);
    unint64_t v15 = (v16 + 247) & 0xFFFFFFFC;
    bzero((void *)(a2 + v17), v15 - v17);
    *(_DWORD *)a2 = v15;
  }

  if (v15 > a3)
  {
    if (a5)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_optionsAndBatchSize_inputMatrix_inputMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_alpha_numberOfFeatureVectorsAndInputFeatureChannelsAndOutputFeatureChannels_neuronType_neuronParameters( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    int v21 = v10;
    int v22 = 500;
    __int128 v23 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v21);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82800000024LL;
  if (__src) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  *(_DWORD *)(a2 + 32) = v11;
  strcpy((char *)(a2 + 36), "Ctt@2ult@4ult@4ult@3ult@4uld@3uli@3f");
  *(_WORD *)(a2 + 73) = 0;
  *(_BYTE *)(a2 + 75) = 0;
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = *(void *)a1;
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 100;
  *(_OWORD *)(a2 + 100) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)a2 = 116;
  *(void *)(a2 + 116) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 124;
  __int128 v12 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 124) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 140) = v12;
  *(_DWORD *)a2 = 156;
  *(void *)(a2 + 156) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 164;
  __int128 v13 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 164) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 180) = v13;
  *(_DWORD *)a2 = 196;
  *(void *)(a2 + 196) = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 204;
  uint64_t v14 = *(void *)(a1 + 152);
  *(_OWORD *)(a2 + 204) = *(_OWORD *)(a1 + 136);
  *(void *)(a2 + 220) = v14;
  *(_DWORD *)a2 = 228;
  *(void *)(a2 + 228) = *(void *)(a1 + 160);
  *(_DWORD *)a2 = 236;
  __int128 v15 = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(a2 + 236) = *(_OWORD *)(a1 + 168);
  *(_OWORD *)(a2 + 252) = v15;
  *(_DWORD *)a2 = 268;
  *(void *)(a2 + 268) = *(void *)(a1 + 200);
  *(_DWORD *)a2 = 276;
  uint64_t v16 = *(void *)(a1 + 224);
  *(_OWORD *)(a2 + 276) = *(_OWORD *)(a1 + 208);
  *(void *)(a2 + 292) = v16;
  *(_DWORD *)a2 = 300;
  *(_DWORD *)(a2 + 300) = *(_DWORD *)(a1 + 232);
  *(_DWORD *)a2 = 304;
  LODWORD(v14) = *(_DWORD *)(a1 + 244);
  *(void *)(a2 + 304) = *(void *)(a1 + 236);
  *(_DWORD *)(a2 + 312) = v14;
  *(_DWORD *)(a2 + 316) = 27765;
  *(_DWORD *)a2 = 320;
  *(void *)(a2 + 320) = *(void *)(a1 + 8);
  unint64_t v17 = 328LL;
  *(_DWORD *)a2 = 328;
  if (__src)
  {
    int v18 = 8 * *__src;
    memcpy((void *)(a2 + 328), __src, v18 + 8);
    uint64_t v19 = (v18 + 336);
    unint64_t v17 = (v18 + 339) & 0xFFFFFFF8;
    bzero((void *)(a2 + v19), v17 - v19);
    *(_DWORD *)a2 = v17;
  }

  if (v17 > a3)
  {
    if (a5)
    {
      int v20 = *a5;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v21 = v20;
      int v22 = 500;
      __int128 v23 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v21);
    }
  }

void DYTraceEncode_MPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_optionsAndBatchSize_inputMatrix_inputMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_alpha_numberOfFeatureVectorsAndInputFeatureChannelsAndOutputFeatureChannelsAndNeuronTypeAndPredicationOffset_neuronParameters_predicationBuffer( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  int v10 = (void *)(a2 + 268);
  if (a3 <= 0x23 && a5)
  {
    int v11 = *a5;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    int v24 = v11;
    int v25 = 500;
    unsigned int v26 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v24);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)a2 = 0xFFFFE82900000024LL;
  if (__src) {
    int v12 = 9;
  }
  else {
    int v12 = 1;
  }
  *(_DWORD *)(a2 + 32) = v12;
  strcpy((char *)(a2 + 36), "Ctt@2ult@4ult@4ult@3ult@4uld@5ul@3ft");
  *(_WORD *)(a2 + 73) = 0;
  *(_BYTE *)(a2 + 75) = 0;
  *(_DWORD *)a2 = 76;
  *(void *)(a2 + 76) = *(void *)a1;
  *(_DWORD *)a2 = 84;
  *(void *)(a2 + 84) = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 92;
  *(void *)(a2 + 92) = *(void *)(a1 + 24);
  *(_DWORD *)a2 = 100;
  *(_OWORD *)(a2 + 100) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)a2 = 116;
  *(void *)(a2 + 116) = *(void *)(a1 + 48);
  *(_DWORD *)a2 = 124;
  __int128 v13 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 124) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 140) = v13;
  *(_DWORD *)a2 = 156;
  *(void *)(a2 + 156) = *(void *)(a1 + 88);
  *(_DWORD *)a2 = 164;
  __int128 v14 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 164) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 180) = v14;
  *(_DWORD *)a2 = 196;
  *(void *)(a2 + 196) = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 204;
  uint64_t v15 = *(void *)(a1 + 152);
  *(_OWORD *)(a2 + 204) = *(_OWORD *)(a1 + 136);
  *(void *)(a2 + 220) = v15;
  *(_DWORD *)a2 = 228;
  *(void *)(a2 + 228) = *(void *)(a1 + 160);
  *(_DWORD *)a2 = 236;
  __int128 v16 = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(a2 + 236) = *(_OWORD *)(a1 + 168);
  *(_OWORD *)(a2 + 252) = v16;
  *(_DWORD *)a2 = 268;
  *int v10 = *(void *)(a1 + 200);
  *(_DWORD *)a2 = 276;
  uint64_t v17 = *(void *)(a1 + 240);
  __int128 v18 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 276) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 292) = v18;
  *(void *)(a2 + 308) = v17;
  *(_DWORD *)a2 = 316;
  uint64_t v19 = *(void *)(a1 + 248);
  *(_DWORD *)(a2 + 324) = *(_DWORD *)(a1 + 256);
  *(void *)(a2 + 316) = v19;
  *(_DWORD *)a2 = 328;
  *(void *)(a2 + 328) = *(void *)(a1 + 264);
  *(_DWORD *)(a2 + 336) = 27765;
  *(_DWORD *)a2 = 340;
  v10[9] = *(void *)(a1 + 8);
  unint64_t v20 = 348LL;
  *(_DWORD *)a2 = 348;
  if (__src)
  {
    int v21 = 8 * *__src;
    memcpy((void *)(a2 + 348), __src, v21 + 8);
    uint64_t v22 = (v21 + 356);
    unint64_t v20 = (v21 + 359) & 0xFFFFFFFC;
    bzero((void *)(a2 + v22), v20 - v22);
    *(_DWORD *)a2 = v20;
  }

  if (v20 > a3)
  {
    if (a5)
    {
      int v23 = *a5;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      int v24 = v23;
      int v25 = 500;
      unsigned int v26 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v24);
    }
  }

void DYTraceEncode_MPSExternalCNNPoolingAverage_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_sourceInfo_destinationTexture_destinationInfo_zeroPadSizeX_zeroPadSizeY( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    int v23 = v10;
    int v24 = 500;
    int v25 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v23);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE81700000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CttultUtUulul");
  *((_WORD *)a2 + 25) = 0;
  *a2 = 52;
  *(void *)(a2 + 13) = *(void *)a1;
  *a2 = 60;
  *(void *)(a2 + 15) = *(void *)(a1 + 16);
  *a2 = 68;
  *(void *)(a2 + 17) = *(void *)(a1 + 24);
  *a2 = 76;
  *(void *)(a2 + 19) = *(void *)(a1 + 32);
  *a2 = 84;
  *(void *)(a2 + 21) = *(void *)(a1 + 40);
  *a2 = 92;
  AppendString(*(const char **)(a1 + 48), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 56);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 72);
  unsigned int v16 = *a2 + 8;
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 80);
  uint64_t v17 = *a2 + 8;
  *a2 = v17;
  strcpy((char *)a2 + v17, "ul");
  uint64_t v18 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v18 - (*a2 + 3));
  *a2 = v18;
  *(void *)((char *)a2 + v18) = *(void *)(a1 + 8);
  unint64_t v19 = *a2 + 8;
  *a2 = v19;
  if (a4)
  {
    int v20 = 8 * *a4 + 8;
    memcpy((char *)a2 + v19, a4, v20);
    uint64_t v21 = v20 + *a2;
    unint64_t v19 = ((_DWORD)v21 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v21, v19 - v21);
    *a2 = v19;
  }

  if (a5)
  {
    if (v19 > a3)
    {
      int v22 = *a5;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      int v23 = v22;
      int v24 = 500;
      int v25 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v23);
    }
  }

void DYTraceEncode_MPSExternalCNNPoolingAverage_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_sourceInfo_destinationTexture_destinationInfo( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    int v21 = v10;
    int v22 = 500;
    int v23 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v21);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE81200000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[11] = 85;
  *(void *)(a2 + 9) = *(void *)"CttultUtU";
  *a2 = 48;
  *((void *)a2 + 6) = *(void *)a1;
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)(a1 + 16);
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 24);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 32);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 40);
  *a2 = 88;
  AppendString(*(const char **)(a1 + 48), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 56);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 64), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  strcpy((char *)a2 + v15, "ul");
  uint64_t v16 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v16 - (*a2 + 3));
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 8);
  unint64_t v17 = *a2 + 8;
  *a2 = v17;
  if (a4)
  {
    int v18 = 8 * *a4 + 8;
    memcpy((char *)a2 + v17, a4, v18);
    uint64_t v19 = v18 + *a2;
    unint64_t v17 = ((_DWORD)v19 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v19, v17 - v19);
    *a2 = v17;
  }

  if (a5)
  {
    if (v17 > a3)
    {
      int v20 = *a5;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v21 = v20;
      int v22 = 500;
      int v23 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v21);
    }
  }

void DYTraceEncode_MPSExternalCNNPoolingAverage_encodeBatchToCommandBuffer_computeCommandEncoder_options_sourceTextures_sourceInfo_destinationTextures_destinationInfo_zeroPadSizeX_zeroPadSizeY_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    int v31 = v10;
    int v32 = 500;
    int v33 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v31);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE80200000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  uint64_t v13 = (v12 + 4) & 0xFFFFFFFC;
  bzero((char *)a2 + (v12 + 1), v13 - (v12 + 1));
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)a1;
  unsigned int v14 = *a2 + 8;
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 16);
  unsigned int v15 = *a2 + 8;
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 24);
  unsigned int v16 = *a2 + 8;
  *a2 = v16;
  *(void *)((char *)a2 + v16) = *(void *)(a1 + 32);
  uint64_t v17 = *a2 + 8;
  *a2 = v17;
  memcpy((char *)a2 + v17, *(const void **)(a1 + 40), 8LL * *(void *)(a1 + 48));
  *a2 += 8 * *(_DWORD *)(a1 + 48);
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v18 = *a2;
  uint64_t v19 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v18, v19 - v18);
  *a2 = v19;
  memcpy((char *)a2 + v19, *(const void **)(a1 + 64), 8LL * *(void *)(a1 + 72));
  *a2 += 8 * *(_DWORD *)(a1 + 72);
  AppendString(*(const char **)(a1 + 80), (int *)a2);
  uint64_t v20 = *a2;
  uint64_t v21 = ((_DWORD)v20 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v20, v21 - v20);
  *a2 = v21;
  *(void *)((char *)a2 + v21) = *(void *)(a1 + 88);
  unsigned int v22 = *a2 + 8;
  *a2 = v22;
  *(void *)((char *)a2 + v22) = *(void *)(a1 + 96);
  unsigned int v23 = *a2 + 8;
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 104);
  unsigned int v24 = *a2 + 8;
  *a2 = v24;
  *(void *)((char *)a2 + v24) = *(void *)(a1 + 112);
  uint64_t v25 = *a2 + 8;
  *a2 = v25;
  strcpy((char *)a2 + v25, "ul");
  uint64_t v26 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v26 - (*a2 + 3));
  *a2 = v26;
  *(void *)((char *)a2 + v26) = *(void *)(a1 + 8);
  unint64_t v27 = *a2 + 8;
  *a2 = v27;
  if (a4)
  {
    int v28 = 8 * *a4 + 8;
    memcpy((char *)a2 + v27, a4, v28);
    uint64_t v29 = v28 + *a2;
    unint64_t v27 = ((_DWORD)v29 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v29, v27 - v29);
    *a2 = v27;
  }

  if (a5)
  {
    if (v27 > a3)
    {
      int v30 = *a5;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      int v31 = v30;
      int v32 = 500;
      int v33 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v31);
    }
  }

void DYTraceEncode_MPSExternalNDArrayBinary_encodeToCommandBuffer_encoder_options_pluginOptions_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_destinationBuffer_destinationInfo_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    int v25 = v10;
    int v26 = 500;
    unint64_t v27 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v25);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  *(void *)a2 = 0xFFFFE82F00000024LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  strcpy((char *)a2 + 36, "CttulultUtUtUtul");
  *(_WORD *)((char *)a2 + 53) = 0;
  *((_BYTE *)a2 + 55) = 0;
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)a1;
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 16);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 24);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 32);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 40);
  *a2 = 96;
  *((void *)a2 + 12) = *(void *)(a1 + 48);
  *a2 = 104;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 80);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v16 = *a2;
  uint64_t v17 = ((_DWORD)v16 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v16, v17 - v16);
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 96);
  unsigned int v18 = *a2 + 8;
  *a2 = v18;
  *(void *)((char *)a2 + v18) = *(void *)(a1 + 104);
  uint64_t v19 = *a2 + 8;
  *a2 = v19;
  strcpy((char *)a2 + v19, "ul");
  uint64_t v20 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v20 - (*a2 + 3));
  *a2 = v20;
  *(void *)((char *)a2 + v20) = *(void *)(a1 + 8);
  unint64_t v21 = *a2 + 8;
  *a2 = v21;
  if (a4)
  {
    int v22 = 8 * *a4 + 8;
    memcpy((char *)a2 + v21, a4, v22);
    uint64_t v23 = v22 + *a2;
    unint64_t v21 = ((_DWORD)v23 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v23, v21 - v23);
    *a2 = v21;
  }

  if (a5)
  {
    if (v21 > a3)
    {
      int v24 = *a5;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      int v25 = v24;
      int v26 = 500;
      unint64_t v27 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v25);
    }
  }

void DYTraceEncode_MPSExternalNDArrayBinaryGradient_encodePrimaryGradientToCommandBuffer_encoder_options_pluginOptions_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_gradientBuffer_gradientInfo_destination_destinationInfo_accumulate_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    int v28 = v10;
    int v29 = 500;
    int v30 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v28);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  *(void *)a2 = 0xFFFFE82D00000024LL;
  strcpy((char *)a2 + 36, "CttulultUtUtUtUitul");
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)a1;
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 16);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 24);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 32);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 40);
  *a2 = 96;
  *((void *)a2 + 12) = *(void *)(a1 + 48);
  *a2 = 104;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 80);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v16 = *a2;
  uint64_t v17 = ((_DWORD)v16 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v16, v17 - v16);
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 96);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 104), (int *)a2);
  uint64_t v18 = *a2;
  uint64_t v19 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v18, v19 - v18);
  *a2 = v19;
  *(unsigned int *)((char *)a2 + v19) = *(_DWORD *)(a1 + 112);
  unsigned int v20 = *a2 + 4;
  *a2 = v20;
  *(void *)((char *)a2 + v20) = *(void *)(a1 + 120);
  unsigned int v21 = *a2 + 8;
  *a2 = v21;
  *(void *)((char *)a2 + v21) = *(void *)(a1 + 128);
  uint64_t v22 = *a2 + 8;
  *a2 = v22;
  strcpy((char *)a2 + v22, "ul");
  uint64_t v23 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v23 - (*a2 + 3));
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 8);
  unint64_t v24 = *a2 + 8;
  *a2 = v24;
  if (a4)
  {
    int v25 = 8 * *a4 + 8;
    memcpy((char *)a2 + v24, a4, v25);
    uint64_t v26 = v25 + *a2;
    unint64_t v24 = ((_DWORD)v26 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v26, v24 - v26);
    *a2 = v24;
  }

  if (a5)
  {
    if (v24 > a3)
    {
      int v27 = *a5;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      int v28 = v27;
      int v29 = 500;
      int v30 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v28);
    }
  }

void DYTraceEncode_MPSExternalNDArrayBinaryGradient_encodeSecondaryGradientToCommandBuffer_encoder_options_pluginOptions_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_gradientBuffer_gradientInfo_destination_destinationInfo_accumulate_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    int v28 = v10;
    int v29 = 500;
    int v30 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v28);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  *(void *)a2 = 0xFFFFE82E00000024LL;
  strcpy((char *)a2 + 36, "CttulultUtUtUtUitul");
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)a1;
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 16);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 24);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 32);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 40);
  *a2 = 96;
  *((void *)a2 + 12) = *(void *)(a1 + 48);
  *a2 = 104;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 80);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v16 = *a2;
  uint64_t v17 = ((_DWORD)v16 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v16, v17 - v16);
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 96);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 104), (int *)a2);
  uint64_t v18 = *a2;
  uint64_t v19 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v18, v19 - v18);
  *a2 = v19;
  *(unsigned int *)((char *)a2 + v19) = *(_DWORD *)(a1 + 112);
  unsigned int v20 = *a2 + 4;
  *a2 = v20;
  *(void *)((char *)a2 + v20) = *(void *)(a1 + 120);
  unsigned int v21 = *a2 + 8;
  *a2 = v21;
  *(void *)((char *)a2 + v21) = *(void *)(a1 + 128);
  uint64_t v22 = *a2 + 8;
  *a2 = v22;
  strcpy((char *)a2 + v22, "ul");
  uint64_t v23 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v23 - (*a2 + 3));
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 8);
  unint64_t v24 = *a2 + 8;
  *a2 = v24;
  if (a4)
  {
    int v25 = 8 * *a4 + 8;
    memcpy((char *)a2 + v24, a4, v25);
    uint64_t v26 = v25 + *a2;
    unint64_t v24 = ((_DWORD)v26 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v26, v24 - v26);
    *a2 = v24;
  }

  if (a5)
  {
    if (v24 > a3)
    {
      int v27 = *a5;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      int v28 = v27;
      int v29 = 500;
      int v30 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v28);
    }
  }

void DYTraceEncode_MPSExternalNDArrayConvolution2DGradient_encodePrimaryGradientToCommandBuffer_encoder_options_pluginOptions_primary_primaryInfo_secondary_secondaryInfo_gradient_gradientInfo_destination_destinationInfo_accumulate_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    int v28 = v10;
    int v29 = 500;
    int v30 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v28);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  *(void *)a2 = 0xFFFFE82A00000024LL;
  strcpy((char *)a2 + 36, "CttulultUtUtUtUitul");
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)a1;
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 16);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 24);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 32);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 40);
  *a2 = 96;
  *((void *)a2 + 12) = *(void *)(a1 + 48);
  *a2 = 104;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 80);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v16 = *a2;
  uint64_t v17 = ((_DWORD)v16 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v16, v17 - v16);
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 96);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 104), (int *)a2);
  uint64_t v18 = *a2;
  uint64_t v19 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v18, v19 - v18);
  *a2 = v19;
  *(unsigned int *)((char *)a2 + v19) = *(_DWORD *)(a1 + 112);
  unsigned int v20 = *a2 + 4;
  *a2 = v20;
  *(void *)((char *)a2 + v20) = *(void *)(a1 + 120);
  unsigned int v21 = *a2 + 8;
  *a2 = v21;
  *(void *)((char *)a2 + v21) = *(void *)(a1 + 128);
  uint64_t v22 = *a2 + 8;
  *a2 = v22;
  strcpy((char *)a2 + v22, "ul");
  uint64_t v23 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v23 - (*a2 + 3));
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 8);
  unint64_t v24 = *a2 + 8;
  *a2 = v24;
  if (a4)
  {
    int v25 = 8 * *a4 + 8;
    memcpy((char *)a2 + v24, a4, v25);
    uint64_t v26 = v25 + *a2;
    unint64_t v24 = ((_DWORD)v26 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v26, v24 - v26);
    *a2 = v24;
  }

  if (a5)
  {
    if (v24 > a3)
    {
      int v27 = *a5;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      int v28 = v27;
      int v29 = 500;
      int v30 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v28);
    }
  }

void DYTraceEncode_MPSExternalNDArrayConvolution2DGradient_encodeSecondaryGradientToCommandBuffer_encoder_options_pluginOptions_primary_primaryInfo_secondary_secondaryInfo_gradient_gradientInfo_destination_destinationInfo_accumulate_predicationBuffer_predicationOffset( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    int v28 = v10;
    int v29 = 500;
    int v30 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v28);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  *(void *)a2 = 0xFFFFE82C00000024LL;
  strcpy((char *)a2 + 36, "CttulultUtUtUtUitul");
  *a2 = 56;
  *((void *)a2 + 7) = *(void *)a1;
  *a2 = 64;
  *((void *)a2 + 8) = *(void *)(a1 + 16);
  *a2 = 72;
  *((void *)a2 + 9) = *(void *)(a1 + 24);
  *a2 = 80;
  *((void *)a2 + 10) = *(void *)(a1 + 32);
  *a2 = 88;
  *((void *)a2 + 11) = *(void *)(a1 + 40);
  *a2 = 96;
  *((void *)a2 + 12) = *(void *)(a1 + 48);
  *a2 = 104;
  AppendString(*(const char **)(a1 + 56), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(void *)((char *)a2 + v13) = *(void *)(a1 + 64);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 72), (int *)a2);
  uint64_t v14 = *a2;
  uint64_t v15 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v14, v15 - v14);
  *a2 = v15;
  *(void *)((char *)a2 + v15) = *(void *)(a1 + 80);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 88), (int *)a2);
  uint64_t v16 = *a2;
  uint64_t v17 = ((_DWORD)v16 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v16, v17 - v16);
  *a2 = v17;
  *(void *)((char *)a2 + v17) = *(void *)(a1 + 96);
  *a2 += 8;
  AppendString(*(const char **)(a1 + 104), (int *)a2);
  uint64_t v18 = *a2;
  uint64_t v19 = ((_DWORD)v18 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v18, v19 - v18);
  *a2 = v19;
  *(unsigned int *)((char *)a2 + v19) = *(_DWORD *)(a1 + 112);
  unsigned int v20 = *a2 + 4;
  *a2 = v20;
  *(void *)((char *)a2 + v20) = *(void *)(a1 + 120);
  unsigned int v21 = *a2 + 8;
  *a2 = v21;
  *(void *)((char *)a2 + v21) = *(void *)(a1 + 128);
  uint64_t v22 = *a2 + 8;
  *a2 = v22;
  strcpy((char *)a2 + v22, "ul");
  uint64_t v23 = (*a2 + 6) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 3, v23 - (*a2 + 3));
  *a2 = v23;
  *(void *)((char *)a2 + v23) = *(void *)(a1 + 8);
  unint64_t v24 = *a2 + 8;
  *a2 = v24;
  if (a4)
  {
    int v25 = 8 * *a4 + 8;
    memcpy((char *)a2 + v24, a4, v25);
    uint64_t v26 = v25 + *a2;
    unint64_t v24 = ((_DWORD)v26 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v26, v24 - v26);
    *a2 = v24;
  }

  if (a5)
  {
    if (v24 > a3)
    {
      int v27 = *a5;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      int v28 = v27;
      int v29 = 500;
      int v30 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v28);
    }
  }

void DYTraceEncode_MTLDevice_newSpatialScalerWithDescriptor( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    unsigned int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFB80000000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      unsigned int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MTLDevice_newTemporalScalerWithDescriptor( uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v19 = v10;
    int v20 = 500;
    unsigned int v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }

  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *((void *)a2 + 3) = 0LL;
  if (a4) {
    int v11 = 9;
  }
  else {
    int v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFB80100000028LL;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  uint64_t v12 = *a2;
  uint64_t v13 = ((_DWORD)v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  uint64_t v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  unint64_t v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    int v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    uint64_t v17 = v16 + *a2;
    unint64_t v15 = ((_DWORD)v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }

  if (a5)
  {
    if (v15 > a3)
    {
      int v18 = *a5;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v19 = v18;
      int v20 = 500;
      unsigned int v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_setColorTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00000000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_setFence( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00100000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_setInputContentHeight( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00200000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_setInputContentWidth( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00300000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_setOutputTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00400000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_dealloc( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFB00500000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXSpatialScaler_encodeToCommandBuffer( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    uint64_t v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00600000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      uint64_t v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_executionMode( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    __int128 v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  if (__src) {
    int v11 = 12;
  }
  else {
    int v11 = 4;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB80200000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v12 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }

  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      __int128 v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setColorTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00700000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setDepthReversed( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 6911299;
  *(void *)a2 = 0xFFFFB00800000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setDepthTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00900000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setExposureTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00A00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setFence( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00B00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setInputContentHeight( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00C00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setInputContentWidth( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00D00000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setJitterOffsetX( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB00E00000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setJitterOffsetY( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB00F00000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setMotionTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01000000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setMotionVectorScaleX( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB01100000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setMotionVectorScaleY( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB01200000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setOutputTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01300000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setPreExposure( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB01400000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setReactiveMaskTexture( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01800000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_setReset( uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 6911299;
  *(void *)a2 = 0xFFFFB01500000028LL;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52LL;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_dealloc( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFB01600000028LL;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48LL;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

void DYTraceEncode_MTLFXTemporalScaler_encodeToCommandBuffer( void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }

  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0LL);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01700000028LL;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56LL;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }

  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }

uint64_t GTMTLGPUAddressResource_compare(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 != *a2;
  }
}

void *GTMTLGPUAddressResource_resourceForGPUAddress(void *a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  v3 = a1;
  do
  {
    v4 = &a1[3 * (a2 >> 1)];
    unint64_t v6 = *v4;
    v5 = v4 + 3;
    BOOL v7 = v6 > a3;
    if (v6 <= a3) {
      a2 += ~(a2 >> 1);
    }
    else {
      a2 >>= 1;
    }
    if (!v7) {
      a1 = v5;
    }
  }

  while (a2);
  if (a1 == v3) {
    return 0LL;
  }
  uint64_t v9 = *(a1 - 3);
  uint64_t v10 = *(a1 - 2);
  result = a1 - 3;
  if (v10 + v9 <= a3) {
    return 0LL;
  }
  return result;
}

uint64_t GTMTLGPUAddressResource_translateToBufferOffset(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t GTMTLUniqueIdentifierResource_resourceForIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  entry = find_entry(a1, &v4, 8uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLUniqueIdentifierResource_resourceForGPUResourceID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  entry = find_entry(a1, &v4, 8uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLUniqueIdentifierResource_resourceForGPUResourceIDWithType(uint64_t *a1, int a2, uint64_t a3)
{
  v3 = a1 + 6;
  if (a2 != 115) {
    v3 = a1 + 7;
  }
  else {
    uint64_t v4 = a1 + 8;
  }
  v5 = a1 + 3;
  unint64_t v6 = a1 + 4;
  if (a2 != 79) {
    unint64_t v6 = a1 + 5;
  }
  if (a2 != 78) {
    v5 = v6;
  }
  BOOL v7 = a1 + 1;
  if (a2 != 58) {
    BOOL v7 = a1 + 2;
  }
  if (a2 <= 77) {
    v5 = v7;
  }
  if (a2 <= 114) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = *v4;
  uint64_t v11 = a3;
  entry = find_entry(v8, &v11, 8uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLIndirectResources_renderPipelineIdForUniqueIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0LL);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32LL)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLIndirectResources_computePipelineIdForUniqueIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0LL);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32LL)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLIndirectResources_renderPipelineIdForGPUResourceID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0LL);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32LL)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLIndirectResources_computePipelineIdForGPUResourceID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0LL);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32LL)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0LL;
  }
}

uint64_t GTMTLIndirectResources_visibleFunctionTableIdForGPUAddress(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  entry = find_entry(*(void *)(a1 + 72), &v5, 8uLL, 0LL);
  if (*entry && (uint64_t v3 = *(void *)(*entry + 32LL)) != 0) {
    return *(void *)(v3 + 8);
  }
  else {
    return 0LL;
  }
}

void GTMTLUniqueIdentifierResource_fillHashMap(char *key, int a2, apr_hash_t *ht)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    do
    {
      apr_hash_set(ht, key, 8LL, key);
      key += 32;
      --v5;
    }

    while (v5);
  }

void GTMTLUniqueIdentifierResource_fillHashMapByKey(char *val, int a2, int a3, apr_hash_t *ht)
{
  if (a2 >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a2;
    uint64_t v9 = val;
    do
    {
      uint64_t v10 = &val[32 * v7];
      if (a3 == 1) {
        v10 += 16;
      }
      if (a3 == 2) {
        uint64_t v11 = v9 + 24;
      }
      else {
        uint64_t v11 = v10;
      }
      apr_hash_set(ht, v11, 8LL, v9);
      ++v7;
      v9 += 32;
      --v8;
    }

    while (v8);
  }

void GTMTLIndirectResources_optimize(apr_pool_t *pool@<X1>, uint64_t *a2@<X0>, uint64_t *a3@<X8>)
{
}

void GTMTLIndirectResources_optimizeByKey( apr_pool_t *pool@<X2>, uint64_t *a2@<X0>, int a3@<W1>, uint64_t *a4@<X8>)
{
  uint64_t v8 = *a2;
  *a4 = *a2;
  uint64_t v9 = apr_hash_make(pool);
  a4[1] = (uint64_t)v9;
  uint64_t v10 = apr_hash_make(pool);
  a4[2] = (uint64_t)v10;
  uint64_t v11 = apr_hash_make(pool);
  a4[3] = (uint64_t)v11;
  int v12 = apr_hash_make(pool);
  a4[4] = (uint64_t)v12;
  uint64_t v13 = apr_hash_make(pool);
  a4[5] = (uint64_t)v13;
  ht = apr_hash_make(pool);
  a4[6] = (uint64_t)ht;
  __int128 v19 = apr_hash_make(pool);
  a4[7] = (uint64_t)v19;
  __int128 v20 = apr_hash_make(pool);
  a4[8] = (uint64_t)v20;
  int v14 = apr_hash_make(pool);
  a4[9] = (uint64_t)v14;
  a4[10] = 0LL;
  qsort( *(void **)(v8 + 24),  *(int *)(v8 + 12),  *(int *)(v8 + 8),  (int (__cdecl *)(const void *, const void *))GTMTLGPUAddressResource_compare);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[1] + 24), *(_DWORD *)(a2[1] + 12), a3, v9);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[2] + 24), *(_DWORD *)(a2[2] + 12), a3, v10);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[3] + 24), *(_DWORD *)(a2[3] + 12), a3, v11);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[4] + 24), *(_DWORD *)(a2[4] + 12), a3, v12);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[5] + 24), *(_DWORD *)(a2[5] + 12), a3, v13);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[6] + 24), *(_DWORD *)(a2[6] + 12), a3, ht);
  uint64_t v15 = a2[6];
  uint64_t v16 = *(unsigned int *)(v15 + 12);
  if ((int)v16 >= 1)
  {
    uint64_t v17 = *(void *)(v15 + 24);
    do
    {
      apr_hash_set(v14, (const void *)(v17 + 24), 8LL, (const void *)v17);
      v17 += 32LL;
      --v16;
    }

    while (v16);
  }

  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[7] + 24), *(_DWORD *)(a2[7] + 12), a3, v19);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[8] + 24), *(_DWORD *)(a2[8] + 12), a3, v20);
}

void GTMTLIndirectResources_allResources( apr_pool_t *p@<X2>, _DWORD **a2@<X0>, unint64_t a3@<X1>, uint64_t *a4@<X8>)
{
}

void GTMTLIndirectResources_allResourcesByKey( apr_pool_t *p@<X3>, _DWORD **a2@<X0>, unint64_t a3@<X1>, int a4@<W2>, uint64_t *a5@<X8>)
{
  uint64_t v10 = apr_array_make(p, 32, 8);
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[1], a3, v10);
  uint64_t v11 = apr_array_make(p, v10->nelts, 24);
  v60[0] = (uint64_t)v11;
  if (v10->nelts >= 1)
  {
    int v12 = v11;
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = *(void *)&v10->elts[8 * v13];
      uint64_t v15 = (int8x16_t *)apr_array_push(v12);
      *uint64_t v15 = vextq_s8(*(int8x16_t *)(v14 + 104), *(int8x16_t *)(v14 + 104), 8uLL);
      v15[1].i64[0] = *(void *)(v14 + 8);
      ++v13;
    }

    while (v13 < v10->nelts);
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[2], a3, v10);
  uint64_t v16 = apr_array_make(p, v10->nelts, 32);
  v60[1] = (uint64_t)v16;
  if (v10->nelts >= 1)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0LL;
    do
    {
      __int128 v19 = *(void **)&v10->elts[8 * v18];
      __int128 v20 = apr_array_push(v17);
      v20[1] = v19[1];
      *__int128 v20 = v19[21];
      v20[2] = v19[25];
      ++v18;
    }

    while (v18 < v10->nelts);
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[3], a3, v10);
  unsigned int v21 = apr_array_make(p, v10->nelts, 32);
  v60[2] = (uint64_t)v21;
  int nelts = v10->nelts;
  if (nelts >= 1)
  {
    __int128 v23 = v21;
    for (uint64_t i = 0LL; i < nelts; ++i)
    {
      int v25 = *(void **)&v10->elts[8 * i];
      uint64_t v26 = v25[6];
      if (v26 && *(_BYTE *)(v26 + 62))
      {
        int v27 = apr_array_push(v23);
        v27[1] = v25[1];
        *int v27 = v25[8];
        v27[2] = v25[9];
        int nelts = v10->nelts;
      }
    }
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[4], a3, v10);
  int v28 = apr_array_make(p, v10->nelts, 32);
  v60[3] = (uint64_t)v28;
  int v29 = v10->nelts;
  if (v29 >= 1)
  {
    int v30 = v28;
    for (uint64_t j = 0LL; j < v29; ++j)
    {
      __int128 v32 = *(void **)&v10->elts[8 * j];
      if (GTMTLSMPipelineState_supportsIndirectCommandBuffers((uint64_t)v32))
      {
        int v33 = apr_array_push(v30);
        v33[1] = v32[1];
        *int v33 = v32[12];
        v33[2] = v32[14];
        int v29 = v10->nelts;
      }
    }
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[5], a3, v10);
  __int128 v34 = apr_array_make(p, v10->nelts, 32);
  v60[4] = (uint64_t)v34;
  int v35 = v10->nelts;
  if (v35 >= 1)
  {
    __int128 v36 = v34;
    for (uint64_t k = 0LL; k < v35; ++k)
    {
      v38 = *(void **)&v10->elts[8 * k];
      if (GTMTLSMPipelineState_supportsIndirectCommandBuffers((uint64_t)v38))
      {
        v39 = apr_array_push(v36);
        v39[1] = v38[1];
        void *v39 = v38[12];
        v39[2] = v38[14];
        int v35 = v10->nelts;
      }
    }
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[6], a3, v10);
  v40 = apr_array_make(p, v10->nelts, 32);
  v60[5] = (uint64_t)v40;
  if (v10->nelts >= 1)
  {
    v41 = v40;
    uint64_t v42 = 0LL;
    do
    {
      v43 = *(void **)&v10->elts[8 * v42];
      v44 = apr_array_push(v41);
      v44[1] = v43[1];
      void *v44 = v43[15];
      v44[2] = v43[16];
      ++v42;
    }

    while (v42 < v10->nelts);
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[7], a3, v10);
  v45 = apr_array_make(p, v10->nelts, 32);
  v60[6] = (uint64_t)v45;
  if (v10->nelts >= 1)
  {
    v46 = v45;
    uint64_t v47 = 0LL;
    do
    {
      uint64_t v48 = *(void *)&v10->elts[8 * v47];
      v49 = apr_array_push(v46);
      v49[1] = *(void *)(v48 + 8);
      void *v49 = *(void *)(v48 + 136);
      *((_OWORD *)v49 + 1) = *(_OWORD *)(v48 + 152);
      ++v47;
    }

    while (v47 < v10->nelts);
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[8], a3, v10);
  v50 = apr_array_make(p, v10->nelts, 32);
  v60[7] = (uint64_t)v50;
  if (v10->nelts >= 1)
  {
    v51 = v50;
    uint64_t v52 = 0LL;
    do
    {
      v53 = *(void **)&v10->elts[8 * v52];
      v54 = apr_array_push(v51);
      v54[1] = v53[1];
      void *v54 = v53[18];
      v54[2] = v53[19];
      ++v52;
    }

    while (v52 < v10->nelts);
  }

  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[9], a3, v10);
  v55 = apr_array_make(p, v10->nelts, 32);
  v60[8] = (uint64_t)v55;
  if (v10->nelts >= 1)
  {
    v56 = v55;
    uint64_t v57 = 0LL;
    do
    {
      v58 = *(void **)&v10->elts[8 * v57];
      v59 = apr_array_push(v56);
      v59[1] = v58[1];
      void *v59 = v58[16];
      v59[2] = v58[17];
      ++v57;
    }

    while (v57 < v10->nelts);
  }

  GTMTLIndirectResources_optimizeByKey(p, v60, a4, a5);
}

apr_hash_index_t *GTMTLIndirectResources_rehash@<X0>( apr_pool_t *p@<X2>, apr_hash_index_t *result@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  uint64_t v4 = (uint64_t *)result;
  if (*((unsigned __int8 *)result + 80) == a3)
  {
    __int128 v6 = *((_OWORD *)result + 3);
    *(_OWORD *)(a4 + 32) = *((_OWORD *)result + 2);
    *(_OWORD *)(a4 + 48) = v6;
    *(_OWORD *)(a4 + 64) = *((_OWORD *)result + 4);
    *(void *)(a4 + 80) = *((void *)result + 10);
    __int128 v7 = *((_OWORD *)result + 1);
    *(_OWORD *)a4 = *(_OWORD *)result;
    *(_OWORD *)(a4 + 16) = v7;
  }

  else
  {
    *(void *)a4 = apr_array_copy(p, *(const apr_array_header_t **)result);
    uint64_t v10 = apr_hash_make(p);
    *(void *)(a4 + 8) = v10;
    uint64_t v11 = apr_hash_make(p);
    *(void *)(a4 + 16) = v11;
    int v12 = apr_hash_make(p);
    *(void *)(a4 + 24) = v12;
    uint64_t v13 = apr_hash_make(p);
    *(void *)(a4 + 32) = v13;
    uint64_t v14 = apr_hash_make(p);
    *(void *)(a4 + 40) = v14;
    uint64_t v15 = apr_hash_make(p);
    *(void *)(a4 + 48) = v15;
    uint64_t v18 = apr_hash_make(p);
    *(void *)(a4 + 56) = v18;
    uint64_t v17 = apr_hash_make(p);
    *(void *)(a4 + 64) = v17;
    uint64_t v16 = apr_hash_make(p);
    *(void *)(a4 + 72) = v16;
    *(_BYTE *)(a4 + 80) = a3;
    *(_DWORD *)(a4 + 81) = 0;
    *(_DWORD *)(a4 + 84) = 0;
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[1], a3, v10);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[2], a3, v11);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[3], a3, v12);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[4], a3, v13);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[5], a3, v14);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[6], a3, v15);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[9], 2, v16);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[7], a3, v18);
    return GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[8], a3, v17);
  }

  return result;
}

apr_hash_index_t *GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(uint64_t a1, int a2, apr_hash_t *a3)
{
  uint64_t v5 = *(apr_pool_t **)a3;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = a1;
  *(_DWORD *)(a1 + 40) = 0;
  result = apr_hash_next((apr_hash_index_t *)(a1 + 16));
  if (result)
  {
    __int128 v7 = result;
    do
    {
      uint64_t v8 = *(_OWORD **)(*((void *)v7 + 1) + 32LL);
      uint64_t v9 = apr_palloc(v5, 0x20uLL);
      __int128 v10 = v8[1];
      *uint64_t v9 = *v8;
      v9[1] = v10;
      uint64_t v11 = v9 + 1;
      if (a2 != 1) {
        uint64_t v11 = v9;
      }
      if (a2 == 2) {
        int v12 = (char *)v9 + 24;
      }
      else {
        int v12 = v11;
      }
      apr_hash_set(a3, v12, 8LL, v9);
      result = apr_hash_next(v7);
      __int128 v7 = result;
    }

    while (result);
  }

  return result;
}

unint64_t SaveResourceMapsData(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  __int128 v7 = a1;
  if (a3 > 7)
  {
    *a2 = 81LL;
    uint64_t v8 = *a1;
    uint64_t v9 = (int *)(*a1 + 12LL);
    int v10 = *v9;
    if (a3 < 0x10) {
      goto LABEL_6;
    }
    a2[1] = v10;
  }

  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = (int *)(*a1 + 12LL);
  }

  int v10 = *(_DWORD *)(v8 + 12);
LABEL_6:
  if (v10 < 1)
  {
    uint64_t v17 = 16LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = a2 + 2;
    do
    {
      uint64_t v14 = *(void **)(*(void *)(v8 + 24) + 8 * v12);
      if (v14) {
        uint64_t v15 = v14[1];
      }
      else {
        uint64_t v15 = 0LL;
      }
      uint64_t v93 = v15;
      uint64_t v16 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v16) {
        uint64_t v16 = *(void *)(v16 + 32);
      }
      if (v11 * 8 + 24 <= a3) {
        v13[v11] = *(void *)(v16 + 8);
      }
      if (v11 * 8 + 32 <= a3) {
        v13[v11 + 1] = v14[14];
      }
      if (v11 * 8 + 40 <= a3) {
        v13[v11 + 2] = v14[13];
      }
      ++v12;
      v11 += 3LL;
    }

    while (v12 < *v9);
    uint64_t v17 = v11 * 8 + 16;
  }

  uint64_t v18 = v7[1];
  int v19 = *(_DWORD *)(v18 + 12);
  uint64_t v20 = v17 + 8;
  if (v17 + 8 <= a3)
  {
    *(void *)((char *)a2 + v17) = v19;
    int v19 = *(_DWORD *)(v18 + 12);
  }

  if (v19 >= 1)
  {
    uint64_t v21 = 0LL;
    unint64_t v22 = v17 + 32;
    do
    {
      __int128 v23 = *(void **)(*(void *)(v18 + 24) + 8 * v21);
      if (v23) {
        uint64_t v24 = v23[1];
      }
      else {
        uint64_t v24 = 0LL;
      }
      uint64_t v93 = v24;
      uint64_t v25 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v25) {
        uint64_t v25 = *(void *)(v25 + 32);
      }
      if (v22 - 16 <= a3) {
        *(void *)((char *)a2 + v22 - 24) = *(void *)(v25 + 8);
      }
      if (v22 - 8 <= a3) {
        *(void *)((char *)a2 + v22 - 16) = v23[21];
      }
      if (v22 <= a3) {
        *(void *)((char *)a2 + v22 - 8) = v23[25];
      }
      ++v21;
      v22 += 24LL;
    }

    while (v21 < *(int *)(v18 + 12));
    uint64_t v20 = v22 - 24;
  }

  uint64_t v26 = v7[2];
  uint64_t v27 = *(unsigned int *)(v26 + 12);
  if ((int)v27 < 1)
  {
    int v28 = 0;
  }

  else
  {
    int v28 = 0;
    int v29 = *(uint64_t **)(v26 + 24);
    int v30 = v29;
    do
    {
      uint64_t v31 = *v30;
      if (*(_BYTE *)(*(void *)(*v30 + 48) + 62LL))
      {
        *int v30 = v29[v28];
        v29[v28++] = v31;
      }

      ++v30;
      --v27;
    }

    while (v27);
  }

  uint64_t v32 = v20 + 8;
  if (v20 + 8 <= a3) {
    *(void *)((char *)a2 + v20) = v28;
  }
  v92 = v7;
  if (v28 >= 1)
  {
    uint64_t v33 = 0LL;
    uint64_t v34 = 0LL;
    int v35 = (char *)a2 + v20;
    uint64_t v36 = 24LL * v28;
    do
    {
      __int128 v37 = *(void **)(*(void *)(v26 + 24) + v33);
      if (v37) {
        uint64_t v38 = v37[1];
      }
      else {
        uint64_t v38 = 0LL;
      }
      uint64_t v93 = v38;
      uint64_t v39 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v39) {
        uint64_t v39 = *(void *)(v39 + 32);
      }
      if (v20 + v34 + 16 <= a3) {
        *(void *)&v35[v34 + 8] = *(void *)(v39 + 8);
      }
      if (v20 + v34 + 24 <= a3) {
        *(void *)&v35[v34 + 16] = v37[8];
      }
      if (v20 + v34 + 32 <= a3) {
        *(void *)&v35[v34 + 24] = v37[9];
      }
      v34 += 24LL;
      v33 += 8LL;
    }

    while (v36 != v34);
    uint64_t v32 = v20 + v34 + 8;
    __int128 v7 = v92;
  }

  uint64_t v40 = v7[3];
  int v41 = GTMTLSMPipelineState_sortIndirectResources(*(uint64_t **)(v40 + 24), *(_DWORD *)(v40 + 12));
  uint64_t v42 = v32 + 8;
  if (v32 + 8 <= a3) {
    *(void *)((char *)a2 + v32) = v41;
  }
  if (v41 >= 1)
  {
    uint64_t v43 = 0LL;
    uint64_t v44 = 0LL;
    v45 = (char *)a2 + v32;
    uint64_t v46 = 24LL * v41;
    do
    {
      uint64_t v47 = *(void **)(*(void *)(v40 + 24) + v43);
      if (v47) {
        uint64_t v48 = v47[1];
      }
      else {
        uint64_t v48 = 0LL;
      }
      uint64_t v93 = v48;
      uint64_t v49 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v49) {
        uint64_t v49 = *(void *)(v49 + 32);
      }
      if (v32 + v44 + 16 <= a3) {
        *(void *)&v45[v44 + 8] = *(void *)(v49 + 8);
      }
      if (v32 + v44 + 24 <= a3) {
        *(void *)&v45[v44 + 16] = v47[12];
      }
      if (v32 + v44 + 32 <= a3) {
        *(void *)&v45[v44 + 24] = v47[14];
      }
      v44 += 24LL;
      v43 += 8LL;
    }

    while (v46 != v44);
    uint64_t v42 = v32 + v44 + 8;
    __int128 v7 = v92;
  }

  uint64_t v50 = v7[4];
  int v51 = GTMTLSMPipelineState_sortIndirectResources(*(uint64_t **)(v50 + 24), *(_DWORD *)(v50 + 12));
  uint64_t v52 = v42 + 8;
  if (v42 + 8 <= a3) {
    *(void *)((char *)a2 + v42) = v51;
  }
  if (v51 >= 1)
  {
    uint64_t v53 = 0LL;
    uint64_t v54 = 0LL;
    v55 = (char *)a2 + v42;
    uint64_t v56 = 24LL * v51;
    do
    {
      uint64_t v57 = *(void **)(*(void *)(v50 + 24) + v53);
      if (v57) {
        uint64_t v58 = v57[1];
      }
      else {
        uint64_t v58 = 0LL;
      }
      uint64_t v93 = v58;
      uint64_t v59 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v59) {
        uint64_t v59 = *(void *)(v59 + 32);
      }
      if (v42 + v54 + 16 <= a3) {
        *(void *)&v55[v54 + 8] = *(void *)(v59 + 8);
      }
      if (v42 + v54 + 24 <= a3) {
        *(void *)&v55[v54 + 16] = v57[12];
      }
      if (v42 + v54 + 32 <= a3) {
        *(void *)&v55[v54 + 24] = v57[14];
      }
      v54 += 24LL;
      v53 += 8LL;
    }

    while (v56 != v54);
    uint64_t v52 = v42 + v54 + 8;
    __int128 v7 = v92;
  }

  uint64_t v60 = v7[5];
  int v61 = *(_DWORD *)(v60 + 12);
  uint64_t v62 = v52 + 8;
  if (v52 + 8 <= a3)
  {
    *(void *)((char *)a2 + v52) = v61;
    int v61 = *(_DWORD *)(v60 + 12);
  }

  if (v61 >= 1)
  {
    uint64_t v63 = 0LL;
    unint64_t v64 = v52 + 32;
    do
    {
      v65 = *(void **)(*(void *)(v60 + 24) + 8 * v63);
      if (v65) {
        uint64_t v66 = v65[1];
      }
      else {
        uint64_t v66 = 0LL;
      }
      uint64_t v93 = v66;
      uint64_t v67 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v67) {
        uint64_t v67 = *(void *)(v67 + 32);
      }
      if (v64 - 16 <= a3) {
        *(void *)((char *)a2 + v64 - 24) = *(void *)(v67 + 8);
      }
      if (v64 - 8 <= a3) {
        *(void *)((char *)a2 + v64 - 16) = v65[15];
      }
      if (v64 <= a3) {
        *(void *)((char *)a2 + v64 - 8) = v65[16];
      }
      ++v63;
      v64 += 24LL;
    }

    while (v63 < *(int *)(v60 + 12));
    uint64_t v62 = v64 - 24;
  }

  uint64_t v68 = v7[6];
  int v69 = *(_DWORD *)(v68 + 12);
  uint64_t v70 = v62 + 8;
  if (v62 + 8 <= a3)
  {
    *(void *)((char *)a2 + v62) = v69;
    int v69 = *(_DWORD *)(v68 + 12);
  }

  if (v69 >= 1)
  {
    uint64_t v71 = 0LL;
    unint64_t v72 = v62 + 32;
    do
    {
      v73 = *(void **)(*(void *)(v68 + 24) + 8 * v71);
      if (v73) {
        uint64_t v74 = v73[1];
      }
      else {
        uint64_t v74 = 0LL;
      }
      uint64_t v93 = v74;
      uint64_t v75 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v75) {
        uint64_t v75 = *(void *)(v75 + 32);
      }
      if (v72 - 16 <= a3) {
        *(void *)((char *)a2 + v72 - 24) = *(void *)(v75 + 8);
      }
      if (v72 - 8 <= a3) {
        *(void *)((char *)a2 + v72 - 16) = v73[17];
      }
      if (v72 <= a3) {
        *(void *)((char *)a2 + v72 - 8) = v73[19];
      }
      ++v71;
      v72 += 24LL;
    }

    while (v71 < *(int *)(v68 + 12));
    uint64_t v70 = v72 - 24;
  }

  uint64_t v76 = v7[7];
  int v77 = *(_DWORD *)(v76 + 12);
  unint64_t v78 = v70 + 8;
  if (v70 + 8 <= a3)
  {
    *(void *)((char *)a2 + v70) = v77;
    int v77 = *(_DWORD *)(v76 + 12);
  }

  if (v77 >= 1)
  {
    uint64_t v79 = 0LL;
    unint64_t v80 = v70 + 32;
    do
    {
      v81 = *(void **)(*(void *)(v76 + 24) + 8 * v79);
      if (v81) {
        uint64_t v82 = v81[1];
      }
      else {
        uint64_t v82 = 0LL;
      }
      uint64_t v93 = v82;
      uint64_t v83 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v83) {
        uint64_t v83 = *(void *)(v83 + 32);
      }
      if (v80 - 16 <= a3) {
        *(void *)((char *)a2 + v80 - 24) = *(void *)(v83 + 8);
      }
      if (v80 - 8 <= a3) {
        *(void *)((char *)a2 + v80 - 16) = v81[18];
      }
      if (v80 <= a3) {
        *(void *)((char *)a2 + v80 - 8) = v81[19];
      }
      ++v79;
      v80 += 24LL;
    }

    while (v79 < *(int *)(v76 + 12));
    unint64_t v78 = v80 - 24;
  }

  uint64_t v84 = v7[8];
  int v85 = *(_DWORD *)(v84 + 12);
  unint64_t result = v78 + 8;
  if (v78 + 8 <= a3)
  {
    *(void *)((char *)a2 + v78) = v85;
    int v85 = *(_DWORD *)(v84 + 12);
  }

  if (v85 >= 1)
  {
    uint64_t v87 = 0LL;
    unint64_t v88 = v78 + 32;
    do
    {
      v89 = *(void **)(*(void *)(v84 + 24) + 8 * v87);
      if (v89) {
        uint64_t v90 = v89[1];
      }
      else {
        uint64_t v90 = 0LL;
      }
      uint64_t v93 = v90;
      uint64_t v91 = *find_entry(a4, &v93, 8uLL, 0LL);
      if (v91) {
        uint64_t v91 = *(void *)(v91 + 32);
      }
      if (v88 - 16 <= a3) {
        *(void *)((char *)a2 + v88 - 24) = *(void *)(v91 + 8);
      }
      if (v88 - 8 <= a3) {
        *(void *)((char *)a2 + v88 - 16) = v89[16];
      }
      if (v88 <= a3) {
        *(void *)((char *)a2 + v88 - 8) = v89[17];
      }
      ++v87;
      v88 += 24LL;
    }

    while (v87 < *(int *)(v84 + 12));
    return v88 - 24;
  }

  return result;
}

apr_array_header_t *MakeResourceMapsData(apr_array_header_t **a1, unsigned int *a2, int a3, apr_pool_t *p)
{
  unsigned int v6 = *a2;
  int v7 = a2[2];
  uint64_t v8 = a2 + 4;
  uint64_t v9 = apr_array_make(p, v7, 24);
  if (v7 >= 1)
  {
    do
    {
      int v10 = apr_array_push(v9);
      v10[2] = *(void *)v8;
      *int v10 = *((void *)v8 + 1);
      uint64_t v11 = *((void *)v8 + 2);
      v8 += 6;
      v10[1] = v11;
      --v7;
    }

    while (v7);
  }

  uint64_t v13 = v8;
  *a1 = v9;
  a1[1] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  a1[2] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  if (v6 <= 0x16)
  {
    a1[3] = apr_array_make(p, 0, 32);
    a1[4] = apr_array_make(p, 0, 32);
    a1[5] = apr_array_make(p, 0, 32);
    goto LABEL_8;
  }

  a1[3] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  a1[4] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  a1[5] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  if (v6 <= 0x2E)
  {
LABEL_8:
    a1[6] = apr_array_make(p, 0, 32);
    goto LABEL_9;
  }

  a1[6] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  if (v6 < 0x36)
  {
LABEL_9:
    a1[7] = apr_array_make(p, 0, 32);
    unint64_t result = apr_array_make(p, 0, 32);
    goto LABEL_10;
  }

  a1[7] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  unint64_t result = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
LABEL_10:
  a1[8] = result;
  return result;
}

apr_array_header_t *LoadUniqueIdentifierResourceGroup(int **a1, unsigned int a2, apr_pool_t *p)
{
  int v5 = **a1;
  *a1 += 2;
  unsigned int v6 = apr_array_make(p, v5, 32);
  if (v5 >= 1)
  {
    do
    {
      int v7 = apr_array_push(v6);
      uint64_t v8 = *a1;
      uint64_t v9 = *(void *)*a1;
      *a1 += 2;
      v7[1] = v9;
      uint64_t v10 = *((void *)v8 + 1);
      *a1 = v8 + 4;
      *int v7 = v10;
      if (a2 >= 0x41)
      {
        uint64_t v11 = *((void *)v8 + 2);
        *a1 = v8 + 6;
        v7[2] = v11;
      }

      --v5;
    }

    while (v5);
  }

  return v6;
}

uint64_t SaveDYMTLMutableBufferAncestorMaps(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (a3 > 7)
  {
    *a2 = 81LL;
    int v7 = (int *)(a1 + 12);
    int v8 = *(_DWORD *)(a1 + 12);
    if (a3 < 0x10) {
      goto LABEL_6;
    }
    a2[1] = v8;
  }

  else
  {
    int v7 = (int *)(a1 + 12);
  }

  int v8 = *v7;
LABEL_6:
  if (v8 < 1) {
    return 16LL;
  }
  uint64_t v9 = 0LL;
  uint64_t v10 = a2 + 3;
  uint64_t v11 = 16LL;
  uint64_t v26 = a1;
  do
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 24) + 8 * v9);
    uint64_t v13 = v11 + 8;
    if (v11 + 8 <= a3) {
      *(void *)((char *)a2 + v11) = *(unsigned int *)(v12 + 48);
    }
    uint64_t v14 = (apr_hash_index_t *)(v12 + 16);
    *(void *)(v12 + 24) = 0LL;
    *(void *)(v12 + 32) = 0LL;
    *(void *)(v12 + 16) = v12;
    *(_DWORD *)(v12 + 40) = 0;
    while (1)
    {
      uint64_t v15 = apr_hash_next(v14);
      uint64_t v16 = v15;
      if (!v15) {
        break;
      }
      uint64_t v17 = *((void *)v15 + 1);
      uint64_t v18 = *(void *)(v17 + 32);
      uint64_t v27 = **(void **)(v17 + 16);
      entry = find_entry(a4, &v27, 8uLL, 0LL);
      if (*entry) {
        uint64_t v20 = *(void *)(*entry + 32LL);
      }
      else {
        uint64_t v20 = 0LL;
      }
      if (v13 + 8 <= a3) {
        *(void *)((char *)a2 + v13) = *(void *)(v20 + 8);
      }
      if (v13 + 16 <= a3) {
        *(void *)((char *)a2 + v13 + 8) = *(unsigned int *)(v18 + 48);
      }
      *(void *)(v18 + 24) = 0LL;
      *(void *)(v18 + 32) = 0LL;
      *(void *)(v18 + 16) = v18;
      *(_DWORD *)(v18 + 40) = 0;
      uint64_t v21 = apr_hash_next((apr_hash_index_t *)(v18 + 16));
      if (v21)
      {
        do
        {
          uint64_t v22 = *((void *)v21 + 1);
          __int128 v23 = *(void **)(v22 + 32);
          uint64_t v27 = **(void **)(v22 + 16);
          uint64_t v24 = *find_entry(a4, &v27, 8uLL, 0LL);
          if (v24) {
            uint64_t v24 = *(void *)(v24 + 32);
          }
          if (v13 + 24 <= a3) {
            *(void *)((char *)v10 + v13 - 8) = *(void *)(v24 + 8);
          }
          if (v13 + 32 <= a3) {
            *(void *)((char *)v10 + v13) = *v23;
          }
          uint64_t v21 = apr_hash_next(v21);
          v13 += 16LL;
        }

        while (v21);
        v13 += 16LL;
      }

      else
      {
        v13 += 16LL;
      }

      uint64_t v14 = v16;
    }

    ++v9;
    uint64_t v11 = v13;
    a1 = v26;
  }

  while (v9 < *v7);
  return v13;
}

uint64_t SaveDYMTLIndirectArgumentBufferInfos( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8 = a1;
  if (a4 > 7)
  {
    *a3 = 81LL;
    uint64_t v9 = (int *)(a1 + 12);
    int v10 = *(_DWORD *)(a1 + 12);
    if (a4 < 0x10) {
      goto LABEL_6;
    }
    a3[1] = v10;
  }

  else
  {
    uint64_t v9 = (int *)(a1 + 12);
  }

  int v10 = *v9;
LABEL_6:
  if (v10 < 1) {
    return 16LL;
  }
  uint64_t v11 = 0LL;
  uint64_t v25 = a3 + 5;
  uint64_t v26 = v9;
  uint64_t v12 = 16LL;
  int v28 = a3;
  do
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v8 + 24) + 16 * v11);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t result = v12 + 8;
    if (v12 + 8 <= a4) {
      *(void *)((char *)a3 + v12) = v15;
    }
    unint64_t v17 = v15 + v14;
    if (v17 > (int)v14)
    {
      uint64_t v18 = 0LL;
      int v19 = (char *)v25 + v12;
      uint64_t v20 = 40LL * (int)v14;
      unint64_t v21 = v17 - (int)v14;
      do
      {
        uint64_t v22 = *(void *)(a2 + 24);
        uint64_t v29 = *(void *)(v22 + v20 + v18);
        uint64_t v23 = *find_entry(a5, &v29, 8uLL, 0LL);
        if (v23) {
          uint64_t v23 = *(void *)(v23 + 32);
        }
        if (v12 + v18 + 16 <= a4) {
          *(void *)&v19[v18 - 32] = *(void *)(v23 + 8);
        }
        if (v12 + v18 + 24 <= a4) {
          *(void *)&v19[v18 - 24] = *(void *)(v22 + v20 + v18 + 8);
        }
        if (v12 + v18 + 32 <= a4) {
          *(void *)&v19[v18 - 16] = *(void *)(v22 + v20 + v18 + 16);
        }
        uint64_t v29 = *(void *)(v22 + v20 + v18 + 24);
        uint64_t v24 = *find_entry(a5, &v29, 8uLL, 0LL);
        if (v24) {
          uint64_t v24 = *(void *)(v24 + 32);
        }
        if (v12 + v18 + 40 <= a4) {
          *(void *)&v19[v18 - 8] = *(void *)(v24 + 8);
        }
        if (v12 + v18 + 48 <= a4) {
          *(void *)&v19[v18] = *(void *)(v22 + v20 + v18 + 32);
        }
        v18 += 40LL;
        --v21;
      }

      while (v21);
      uint64_t result = v12 + v18 + 8;
      uint64_t v8 = a1;
      a3 = v28;
      uint64_t v9 = v26;
    }

    ++v11;
    uint64_t v12 = result;
  }

  while (v11 < *v9);
  return result;
}

uint64_t fbuf_header_length(_BYTE *a1)
{
  uint64_t v1 = *(unsigned int *)a1;
  if ((a1[33] & 0x10) == 0) {
    return *(unsigned int *)a1;
  }
  uint64_t v2 = *(unsigned int *)a1;
  do
  {
    a1 += v1;
    uint64_t v1 = *(unsigned int *)a1;
    v2 += v1;
  }

  while ((a1[33] & 0x20) == 0);
  return v2;
}

uint64_t fbuf_header_fits(unsigned int *a1, unint64_t a2)
{
  if (a2 < 0x24) {
    return 0LL;
  }
  unint64_t v2 = *a1;
  if (v2 > a2) {
    return 0LL;
  }
  if ((*((_BYTE *)a1 + 33) & 0x10) != 0)
  {
    while (1)
    {
      a2 -= v2;
      if (a2 < 0x24) {
        break;
      }
      a1 = (unsigned int *)((char *)a1 + v2);
      unint64_t v2 = *a1;
      if (a2 < v2) {
        break;
      }
      if ((*((_BYTE *)a1 + 33) & 0x20) != 0) {
        return 1LL;
      }
    }

    return 0LL;
  }

  return 1LL;
}

uint64_t FBDecoder_DecodeArguments(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int v7 = a2;
  unint64_t v9 = a2 + a3;
  uint64_t v10 = *a1;
  uint64_t v11 = (char *)(a2 + v10);
  uint64_t v12 = (char *)memchr((const void *)(a2 + v10), 0, a3 - v10);
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = v12;
  int v39 = v7;
  uint64_t v40 = a1;
  unsigned int v14 = a1[1];
  uint64_t v15 = v12 + 1;
  if (v11 == v12)
  {
LABEL_36:
    uint64_t result = 0LL;
    _DWORD *v40 = (((_DWORD)v15 + 3) & 0xFFFFFFFC) - v39;
    v40[1] = v14;
    return result;
  }

  while (1)
  {
    uint64_t v16 = v14;
    if (v14 >= a5) {
      return 2LL;
    }
    unint64_t v17 = (unint64_t *)(a4 + 16LL * v14);
    uint64_t v18 = a4 + 16 * v16;
    *(_BYTE *)(v18 + 11) = 0;
    int v19 = (char *)(v18 + 11);
    uint64_t v20 = a4 + 16 * v16;
    *(_WORD *)(v20 + 8) = 1;
    unint64_t v21 = (unsigned __int16 *)(v20 + 8);
    int v22 = *v11;
    if (v22 == 64)
    {
      unsigned __int16 v23 = 0;
      uint64_t v25 = v11 + 1;
      int v24 = v11[1];
      if (v11 + 1 != v13)
      {
        __int16 v26 = v24 - 48;
        if ((v24 - 48) <= 9)
        {
          unsigned __int16 v23 = 0;
          uint64_t v27 = v11 + 2;
          do
          {
            unsigned __int16 v23 = v26 + 10 * v23;
            BOOL v28 = v27 == v13;
            int v30 = *v27++;
            int v29 = v30;
            if (v28) {
              break;
            }
            __int16 v26 = v29 - 48;
          }

          while ((v29 - 48) < 0xA);
          uint64_t v25 = v27 - 1;
        }
      }

      char *v19 = 1;
      uint64_t v31 = v23;
      *unint64_t v21 = v23;
      int v22 = *v25;
      char v32 = 3;
      uint64_t v11 = v25;
    }

    else
    {
      char v32 = 2;
      uint64_t v31 = 1LL;
    }

    if (v22 == 117)
    {
      char *v19 = v32;
      char v33 = *++v11;
      LOBYTE(v22) = v33;
    }

    *(_BYTE *)(a4 + 16 * v16 + 10) = v22;
    uint64_t result = 0xFFFFFFFFLL;
    if ((char)v22 <= 97)
    {
      if ((char)v22 != 67)
      {
        if (v9 - (unint64_t)v15 >= 8 && *v15 == 0xFFFFFFFFLL)
        {
          *unint64_t v17 = 0LL;
          *unint64_t v21 = 0;
          ++v15;
        }

        else
        {
          *unint64_t v17 = (unint64_t)v15;
          __int128 v37 = (char *)memchr(v15, 0, v9 - (void)v15);
          if (!v37) {
            return 0xFFFFFFFFLL;
          }
          *unint64_t v21 = (_WORD)v37 - (_WORD)v15;
          uint64_t v15 = v37 + 1;
        }

        goto LABEL_31;
      }
    }

    else
    {
      unsigned int v35 = (char)v22 - 98;
      if (v35 > 0x15) {
        return result;
      }
      if (((1 << v35) & 0x244404) == 0)
      {
        if (((1 << v35) & 0x90) != 0)
        {
          unint64_t v38 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          *unint64_t v17 = v38;
          uint64_t v15 = (void *)(v38 + 4 * v31);
        }

        else
        {
          *unint64_t v17 = (unint64_t)v15;
          uint64_t v15 = (void *)((char *)v15 + v31);
        }

        goto LABEL_31;
      }
    }

    unint64_t v36 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    *unint64_t v17 = v36;
    uint64_t v15 = (void *)(v36 + 8 * v31);
LABEL_31:
    unsigned int v14 = v16 + 1;
    if (++v11 == v13) {
      goto LABEL_36;
    }
  }

uint64_t Fbuf_ReturnValue(_DWORD *a1)
{
  uint64_t v1 = (uint64_t)(a1 + 9);
  uint64_t v2 = (*a1 - 36);
  uint64_t v4 = 0LL;
  FBDecoder_DecodeArguments((unsigned int *)&v4, (uint64_t)(a1 + 9), v2, (uint64_t)v5, 0x10uLL);
  HIDWORD(v4) = 0;
  FBDecoder_DecodeArguments((unsigned int *)&v4, v1, v2, (uint64_t)v5, 0x10uLL);
  return *(void *)v5[0];
}

uint64_t GetStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  entry = find_entry(a1, &v4, 8uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

uint64_t GetObjectDownloadRequest_(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  entry = find_entry(a1, &v4, 8uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

uint64_t GetObjectChildren_(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  entry = find_entry(a1, &v4, 8uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

uint64_t FetchData(uint64_t result)
{
  if (result) {
    result += 16LL;
  }
  return result;
}

uint64_t CommandBufferCommitIndex(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    unsigned int v2 = 0;
    while (1)
    {
      unsigned int v3 = atomic_load((unsigned int *)(v1 + 4));
      uint64_t v4 = v2 + (v3 >> 6) - 1;
      uint64_t v1 = *(void *)(v1 + 40);
      unsigned int v2 = v4;
      if (!v1)
      {
        unsigned int v2 = v4;
        goto LABEL_8;
      }
    }
  }

  else
  {
    unsigned int v2 = 0;
  }

  uint64_t v4 = 0LL;
LABEL_8:
  unint64_t v5 = v2 | (unint64_t)(v4 << 32);
LABEL_9:
  uint64_t v6 = v1 + 64;
  while (v1)
  {
    int v7 = HIDWORD(v5) - v5;
    int v8 = *(_DWORD *)(v6 + ((uint64_t)v7 << 6) + 8);
    if (v8 > -15344)
    {
      unsigned int v11 = v8 + 15343;
      BOOL v12 = v11 > 0x1B;
      int v13 = (1 << v11) & 0xA000001;
      if (!v12 && v13 != 0) {
        return *(void *)(v6 + ((uint64_t)v7 << 6));
      }
    }

    else if (v8 == -16361 || v8 == -16202 || v8 == -15908)
    {
      return *(void *)(v6 + ((uint64_t)v7 << 6));
    }

    unsigned int v15 = atomic_load((unsigned int *)(v1 + 4));
    uint64_t v16 = (HIDWORD(v5) + 1);
    int v17 = v5 + (v15 >> 6) - 1;
    unint64_t v5 = (v16 << 32) | v5;
    if ((_DWORD)v16 == v17)
    {
      unint64_t v5 = (v16 << 32) | v16;
      uint64_t v1 = *(void *)(v1 + 40);
      goto LABEL_9;
    }
  }

  return -1LL;
}

uint64_t CommandBufferQueue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    unsigned int v4 = 0;
    while (1)
    {
      unsigned int v5 = atomic_load((unsigned int *)(v3 + 4));
      uint64_t v6 = v4 + (v5 >> 6) - 1;
      uint64_t v3 = *(void *)(v3 + 40);
      unsigned int v4 = v6;
      if (!v3)
      {
        unsigned int v4 = v6;
        goto LABEL_8;
      }
    }
  }

  else
  {
    unsigned int v4 = 0;
  }

  uint64_t v6 = 0LL;
LABEL_8:
  unint64_t v7 = v4 | (unint64_t)(v6 << 32);
LABEL_9:
  uint64_t v8 = v3 + 64;
  while (1)
  {
    uint64_t v9 = v8 + ((uint64_t)(HIDWORD(v7) - (int)v7) << 6);
    unsigned int v10 = atomic_load((unsigned int *)(v3 + 4));
    int v11 = v7 + (v10 >> 6);
    uint64_t v12 = (HIDWORD(v7) + 1);
    unint64_t v7 = (v12 << 32) | v7;
    if ((_DWORD)v12 == v11 - 1)
    {
      unint64_t v7 = (v12 << 32) | v12;
      uint64_t v3 = *(void *)(v3 + 40);
      goto LABEL_9;
    }
  }

void GatherResidencySetAllocationsUpToIndex( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

void GatherResidencySetAllocationsUpToIndexInternal( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, int a6)
{
  if (a5) {
    unint64_t v7 = a5;
  }
  else {
    unint64_t v7 = a4;
  }
  uint64_t v8 = *(void *)(a2 + 32);
  if (v8)
  {
    unsigned int v9 = 0;
    while (1)
    {
      unsigned int v10 = atomic_load((unsigned int *)(v8 + 4));
      uint64_t v11 = v9 + (v10 >> 6) - 1;
      uint64_t v8 = *(void *)(v8 + 40);
      unsigned int v9 = v11;
      if (!v8)
      {
        unsigned int v9 = v11;
        goto LABEL_11;
      }
    }
  }

  else
  {
    unsigned int v9 = 0;
  }

  uint64_t v11 = 0LL;
LABEL_11:
  unint64_t v12 = 0LL;
  unint64_t v13 = v9 | (unint64_t)(v11 << 32);
LABEL_12:
  uint64_t v14 = v8 + 64;
  while (v8)
  {
    int v15 = HIDWORD(v13) - v13;
    uint64_t v16 = v15;
    unint64_t v17 = *(void *)(v14 + ((uint64_t)v15 << 6));
    if (v17 >= v7) {
      break;
    }
    int v18 = *(_DWORD *)(v14 + (v16 << 6) + 8);
    unsigned int v20 = atomic_load((unsigned int *)(v8 + 4));
    uint64_t v21 = (HIDWORD(v13) + 1);
    int v22 = v13 + (v20 >> 6) - 1;
    unint64_t v13 = (v21 << 32) | v13;
    if ((_DWORD)v21 == v22)
    {
      unint64_t v13 = (v21 << 32) | v21;
      uint64_t v8 = *(void *)(v8 + 40);
      goto LABEL_12;
    }
  }

  uint64_t v23 = *(void *)(a2 + 32);
  unint64_t v54 = v7;
  unsigned int v24 = 0;
  if (v23)
  {
    while (1)
    {
      unsigned int v25 = atomic_load((unsigned int *)(v23 + 4));
      uint64_t v26 = v24 + (v25 >> 6) - 1;
      uint64_t v23 = *(void *)(v23 + 40);
      unsigned int v24 = v26;
      if (!v23)
      {
        unsigned int v24 = v26;
        goto LABEL_28;
      }
    }
  }

  uint64_t v26 = 0LL;
LABEL_28:
  unint64_t v27 = v24 | (unint64_t)(v26 << 32);
LABEL_29:
  uint64_t v28 = v23 + 64;
  while (v23)
  {
    int v29 = HIDWORD(v27) - v27;
    int v30 = (unint64_t *)(v28 + ((uint64_t)v29 << 6));
    unint64_t v31 = *v30;
    if (*v30 >= v12 && (v31 < a4 || *(char *)(v28 + ((uint64_t)(HIDWORD(v27) - (int)v27) << 6) + 15) < 0))
    {
      if (v31 >= v54) {
        return;
      }
      int v32 = *(_DWORD *)(v28 + ((uint64_t)v29 << 6) + 8);
      if (!a6 || (v32 + 15208) >= 3)
      {
        switch(v32)
        {
          case -15220:
            *(void *)(a1 + 8) = apr_hash_copy(**(apr_pool_t ***)a1, *(const apr_hash_t **)a1);
            break;
          case -15212:
            unint64_t v36 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            entry = find_entry(*(void *)a1, v36, 8uLL, 0LL);
            if (!*entry || !*(void *)(*entry + 32LL))
            {
              unint64_t v38 = (char *)apr_palloc(**(apr_pool_t ***)a1, 8uLL);
              *(void *)unint64_t v38 = *(void *)v36;
              int v39 = *(apr_pool_t ***)a1;
              uint64_t v40 = v38;
              goto LABEL_57;
            }

            break;
          case -15211:
            int v41 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            uint64_t v42 = GTTraceFunc_argumentBytesWithMap(v30, v41[16], a3);
            if (*((void *)v41 + 1))
            {
              uint64_t v43 = v42;
              uint64_t v44 = 0LL;
              unint64_t v45 = 0LL;
              do
              {
                uint64_t v46 = *find_entry(*(void *)a1, &v43[v44], 8uLL, 0LL);
                if (!v46 || !*(void *)(v46 + 32))
                {
                  if (v43)
                  {
                    uint64_t v47 = apr_palloc(**(apr_pool_t ***)a1, 8uLL);
                    *uint64_t v47 = *(void *)&v43[8 * v45];
                  }

                  else
                  {
                    uint64_t v47 = 0LL;
                  }

                  apr_hash_set(*(apr_hash_t **)a1, v47, 8LL, v47);
                }

                ++v45;
                v44 += 8LL;
              }

              while (*((void *)v41 + 1) > v45);
            }

            break;
          case -15208:
            apr_hash_clear(*(apr_hash_t **)a1);
            break;
          case -15207:
            unint64_t v38 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            int v39 = *(apr_pool_t ***)a1;
            uint64_t v40 = 0LL;
LABEL_57:
            apr_hash_set((apr_hash_t *)v39, v38, 8LL, v40);
            break;
          case -15206:
            uint64_t v48 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            uint64_t v49 = GTTraceFunc_argumentBytesWithMap(v30, v48[16], a3);
            if (*((void *)v48 + 1))
            {
              uint64_t v50 = v49;
              unint64_t v51 = 0LL;
              do
              {
                apr_hash_set(*(apr_hash_t **)a1, v50, 8LL, 0LL);
                ++v51;
                v50 += 8;
              }

              while (*((void *)v48 + 1) > v51);
            }

            break;
          default:
            break;
        }
      }
    }

    unsigned int v33 = atomic_load((unsigned int *)(v23 + 4));
    int v34 = v27 + (v33 >> 6);
    uint64_t v35 = (HIDWORD(v27) + 1);
    unint64_t v27 = (v35 << 32) | v27;
    if ((_DWORD)v35 == v34 - 1)
    {
      unint64_t v27 = (v35 << 32) | v35;
      uint64_t v23 = *(void *)(v23 + 40);
      goto LABEL_29;
    }
  }

void GatherResidencySetAllocationsUpToIndexIgnoringRemoves( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

void GatherCommandQueueResidencySetsUpToIndex( apr_pool_t **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

void GatherCommandQueueResidencySetsUpToIndexInternal( apr_pool_t **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, int a6)
{
  if (a5) {
    unint64_t v7 = a5;
  }
  else {
    unint64_t v7 = a4;
  }
  uint64_t v8 = *(void *)(a2 + 32);
  if (v8)
  {
    unsigned int v9 = 0;
    while (1)
    {
      unsigned int v10 = atomic_load((unsigned int *)(v8 + 4));
      uint64_t v11 = v9 + (v10 >> 6) - 1;
      uint64_t v8 = *(void *)(v8 + 40);
      unsigned int v9 = v11;
      if (!v8)
      {
        unsigned int v9 = v11;
        goto LABEL_11;
      }
    }
  }

  else
  {
    unsigned int v9 = 0;
  }

  uint64_t v11 = 0LL;
LABEL_11:
  unint64_t v12 = 0LL;
  unint64_t v13 = v9 | (unint64_t)(v11 << 32);
LABEL_12:
  uint64_t v14 = v8 + 64;
  while (v8)
  {
    int v15 = HIDWORD(v13) - v13;
    uint64_t v16 = v15;
    unint64_t v17 = *(void *)(v14 + ((uint64_t)v15 << 6));
    if (v17 >= v7) {
      break;
    }
    int v18 = *(_DWORD *)(v14 + (v16 << 6) + 8);
    unsigned int v20 = atomic_load((unsigned int *)(v8 + 4));
    uint64_t v21 = (HIDWORD(v13) + 1);
    int v22 = v13 + (v20 >> 6) - 1;
    unint64_t v13 = (v21 << 32) | v13;
    if ((_DWORD)v21 == v22)
    {
      unint64_t v13 = (v21 << 32) | v21;
      uint64_t v8 = *(void *)(v8 + 40);
      goto LABEL_12;
    }
  }

  uint64_t v23 = *(void *)(a2 + 32);
  unint64_t v54 = v7;
  unsigned int v24 = 0;
  if (v23)
  {
    while (1)
    {
      unsigned int v25 = atomic_load((unsigned int *)(v23 + 4));
      uint64_t v26 = v24 + (v25 >> 6) - 1;
      uint64_t v23 = *(void *)(v23 + 40);
      unsigned int v24 = v26;
      if (!v23)
      {
        unsigned int v24 = v26;
        goto LABEL_28;
      }
    }
  }

  uint64_t v26 = 0LL;
LABEL_28:
  unint64_t v27 = v24 | (unint64_t)(v26 << 32);
LABEL_29:
  uint64_t v28 = v23 + 64;
  while (v23)
  {
    int v29 = HIDWORD(v27) - v27;
    int v30 = (unint64_t *)(v28 + ((uint64_t)v29 << 6));
    unint64_t v31 = *v30;
    if (*v30 >= v12 && (v31 < a4 || *(char *)(v28 + ((uint64_t)(HIDWORD(v27) - (int)v27) << 6) + 15) < 0))
    {
      if (v31 >= v54) {
        return;
      }
      int v32 = *(_DWORD *)(v28 + ((uint64_t)v29 << 6) + 8);
      if (!a6 || (v32 & 0xFFFFFFFE) != 0xFFFFC46E)
      {
        switch(v32)
        {
          case -15252:
            unsigned int v33 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            uint64_t v34 = *find_entry((uint64_t)a1, v33, 8uLL, 0LL);
            if (!v34 || !*(void *)(v34 + 32))
            {
              uint64_t v35 = (char *)apr_palloc(*a1, 8uLL);
              *(void *)uint64_t v35 = *(void *)v33;
              unint64_t v36 = (apr_hash_t *)a1;
              __int128 v37 = v35;
              goto LABEL_53;
            }

            break;
          case -15251:
            unint64_t v38 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            int v39 = GTTraceFunc_argumentBytesWithMap(v30, v38[16], a3);
            if (*((void *)v38 + 1))
            {
              uint64_t v40 = v39;
              uint64_t v41 = 0LL;
              unint64_t v42 = 0LL;
              do
              {
                uint64_t v43 = *find_entry((uint64_t)a1, &v40[v41], 8uLL, 0LL);
                if (!v43 || !*(void *)(v43 + 32))
                {
                  if (v40)
                  {
                    uint64_t v44 = apr_palloc(*a1, 8uLL);
                    void *v44 = *(void *)&v40[8 * v42];
                  }

                  else
                  {
                    uint64_t v44 = 0LL;
                  }

                  apr_hash_set((apr_hash_t *)a1, v44, 8LL, v44);
                }

                ++v42;
                v41 += 8LL;
              }

              while (*((void *)v38 + 1) > v42);
            }

            break;
          case -15250:
            uint64_t v35 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            unint64_t v36 = (apr_hash_t *)a1;
            __int128 v37 = 0LL;
LABEL_53:
            apr_hash_set(v36, v35, 8LL, v37);
            break;
          case -15249:
            unint64_t v45 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            uint64_t v46 = GTTraceFunc_argumentBytesWithMap(v30, v45[16], a3);
            if (*((void *)v45 + 1))
            {
              uint64_t v47 = v46;
              unint64_t v48 = 0LL;
              do
              {
                apr_hash_set((apr_hash_t *)a1, v47, 8LL, 0LL);
                ++v48;
                v47 += 8;
              }

              while (*((void *)v45 + 1) > v48);
            }

            break;
          default:
            break;
        }
      }
    }

    unsigned int v49 = atomic_load((unsigned int *)(v23 + 4));
    int v50 = v27 + (v49 >> 6);
    uint64_t v51 = (HIDWORD(v27) + 1);
    unint64_t v27 = (v51 << 32) | v27;
    if ((_DWORD)v51 == v50 - 1)
    {
      unint64_t v27 = (v51 << 32) | v51;
      uint64_t v23 = *(void *)(v23 + 40);
      goto LABEL_29;
    }
  }

void GatherCommandQueueResidencySetsUpToIndexIgnoringRemoves( apr_pool_t **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

char *GTResourceDownloaderGetResourceFilename(uint64_t a1, int a2, char *__str, size_t __size)
{
  unsigned int v5 = *(unsigned __int8 *)(a1 + 46);
  if (v5 > 0x3B)
  {
    if (*(unsigned __int8 *)(a1 + 46) > 0x52u)
    {
      if (v5 == 83)
      {
        snprintf(__str, __size, "MTLVisibleFunctionTable-%llu-%u");
      }

      else if (v5 == 86)
      {
        snprintf(__str, __size, "IOSurface-%llu-%d-%u");
      }
    }

    else if (v5 == 60)
    {
      if (a2 == 1)
      {
        snprintf(__str, __size, "MTLIntersectionFunctionTable-buffers-%llu-%u");
      }

      else if (!a2)
      {
        snprintf(__str, __size, "MTLIntersectionFunctionTable-functions-%llu-%u");
      }
    }

    else if (v5 == 80)
    {
      if ((*(_BYTE *)(a1 + 47) & 1) != 0)
      {
        snprintf( __str,  __size,  "MTLTexture-%llu-%u-Origin:%u-%u-%u-Size:%u-%u-%u-Level%u-Slice%u",  *(void *)(a1 + 8),  *(unsigned int *)(a1 + 40),  *(unsigned int *)(a1 + 88LL * a2 + 52));
      }

      else if ((*(_BYTE *)(a1 + 47) & 4) != 0)
      {
        snprintf(__str, __size, "CAMetalLayer-%llu-index-%llu");
      }

      else
      {
        snprintf(__str, __size, "MTLTexture-%llu-%u-mipmap%u-slice%u");
      }
    }
  }

  else if (*(unsigned __int8 *)(a1 + 46) > 0x31u)
  {
    if (v5 == 50)
    {
      if (*(void *)(a1 + 48)) {
        snprintf(__str, __size, "MTLHeap-%llu-%u-0x%llx");
      }
      else {
        snprintf(__str, __size, "MTLHeap-%llu-%u");
      }
    }

    else if (v5 == 57)
    {
      snprintf(__str, __size, "MTLIndirectCmdBuf-%llu-%u");
    }
  }

  else if (v5 == 16)
  {
    if (a2 == 1)
    {
      snprintf(__str, __size, "MTLAccelerationStructure-primitive-%llu-%u");
    }

    else if (!a2)
    {
      snprintf(__str, __size, "MTLAccelerationStructure-data-%llu-%u");
    }
  }

  else if (v5 == 22)
  {
    if (*(void *)(a1 + 48)) {
      snprintf(__str, __size, "MTLBuffer-%llu-%u-0x%llx");
    }
    else {
      snprintf(__str, __size, "MTLBuffer-%llu-%u");
    }
  }

  return __str;
}

uint64_t GetFuncEnumConstructorType(int a1)
{
  if (a1 <= -15716)
  {
    if (a1 > -16121)
    {
      if (a1 > -16015)
      {
        if (a1 <= -15892)
        {
          if (a1 > -15970)
          {
            switch(a1)
            {
              case -15922:
                return 59LL;
              case -15921:
                return 58LL;
              case -15920:
              case -15919:
              case -15918:
              case -15917:
              case -15916:
              case -15915:
              case -15911:
              case -15910:
                return 0LL;
              case -15914:
                return 22LL;
              case -15913:
                return 80LL;
              case -15912:
              case -15909:
                return 76LL;
              default:
                if (a1 == -15969)
                {
                  uint64_t result = 57LL;
                }

                else
                {
                  if (a1 != -15900) {
                    return 0LL;
                  }
                  uint64_t result = 73LL;
                }

                break;
            }

            return result;
          }

          if (a1 <= -15997)
          {
            switch(a1)
            {
              case -16014:
                return 28LL;
              case -16013:
                return 82LL;
              case -15997:
                return 38LL;
            }

            return 0LL;
          }

          if ((a1 + 15980) >= 2)
          {
            if (a1 == -15996) {
              return 76LL;
            }
            int v6 = -15972;
            goto LABEL_119;
          }

          return 80LL;
        }

        if (a1 <= -15778)
        {
          if (a1 <= -15848)
          {
            switch(a1)
            {
              case -15891:
                return 64LL;
              case -15870:
                return 74LL;
              case -15848:
                return 31LL;
            }

            return 0LL;
          }

          if (a1 > -15794)
          {
            if (a1 == -15793) {
              return 68LL;
            }
            int v6 = -15778;
LABEL_119:
            if (a1 != v6) {
              return 0LL;
            }
            return 22LL;
          }

          if (a1 == -15847) {
            return 62LL;
          }
          if (a1 != -15830) {
            return 0LL;
          }
          return 43LL;
        }

        if (a1 > -15739)
        {
          if ((a1 + 15731) >= 2)
          {
            if (a1 == -15738) {
              return 71LL;
            }
            if (a1 == -15717) {
              return 19LL;
            }
            return 0LL;
          }

          return 43LL;
        }

        if (a1 == -15777 || a1 == -15775) {
          return 80LL;
        }
        int v5 = -15740;
LABEL_67:
        if (a1 == v5) {
          return 29LL;
        }
        return 0LL;
      }

      if (a1 > -16054)
      {
        switch(a1)
        {
          case -16039:
          case -16029:
            return 62LL;
          case -16038:
            return 43LL;
          case -16037:
            return 18LL;
          case -16036:
          case -16035:
          case -16034:
          case -16033:
          case -16032:
            return 0LL;
          case -16031:
          case -16030:
            return 80LL;
          default:
            if (a1 == -16018) {
              return 62LL;
            }
            return 0LL;
        }
      }

      switch(a1)
      {
        case -16120:
          uint64_t result = 50LL;
          break;
        case -16119:
        case -16118:
        case -16115:
        case -16114:
        case -16113:
        case -16112:
        case -16111:
        case -16110:
        case -16109:
        case -16108:
        case -16105:
        case -16103:
        case -16102:
        case -16100:
        case -16097:
        case -16094:
        case -16093:
        case -16092:
        case -16087:
        case -16086:
        case -16085:
        case -16084:
        case -16083:
          return 0LL;
        case -16117:
          return 22LL;
        case -16116:
        case -16104:
        case -16098:
        case -16096:
          return 80LL;
        case -16107:
        case -16106:
        case -16082:
        case -16081:
          return 43LL;
        case -16101:
          return 29LL;
        case -16099:
          uint64_t result = 81LL;
          break;
        case -16095:
          return 62LL;
        case -16091:
        case -16090:
        case -16089:
        case -16088:
          return 71LL;
        default:
          if (a1 != -16075) {
            return 0LL;
          }
          uint64_t result = 67LL;
          break;
      }

      return result;
    }

    if (a1 > -16234)
    {
      if (a1 > -16197)
      {
        if (a1 > -16164)
        {
          if (a1 != -16163)
          {
            if (a1 == -16128) {
              return 41LL;
            }
            return 0LL;
          }

          return 22LL;
        }

        if (a1 != -16196)
        {
          if (a1 == -16165) {
            return 27LL;
          }
          return 0LL;
        }

        return 80LL;
      }

      int v3 = -16233;
    }

    else
    {
      if (a1 > -16355)
      {
        switch(a1)
        {
          case -16354:
            goto LABEL_39;
          case -16353:
          case -16286:
            uint64_t result = 70LL;
            break;
          case -16352:
            return 28LL;
          case -16351:
            uint64_t result = 65LL;
            break;
          case -16343:
          case -16342:
            return 25LL;
          case -16316:
          case -16315:
            return 27LL;
          case -16314:
          case -16313:
          case -16312:
            return 22LL;
          case -16311:
            uint64_t result = 34LL;
            break;
          case -16310:
          case -16294:
            return 80LL;
          case -16309:
            uint64_t result = 75LL;
            break;
          case -16308:
          case -16307:
          case -16306:
          case -16305:
          case -16304:
            return 62LL;
          case -16303:
          case -16302:
          case -16301:
          case -16300:
            return 71LL;
          case -16299:
          case -16298:
          case -16297:
          case -16296:
            return 29LL;
          case -16290:
            return 43LL;
          default:
            return 0LL;
        }

        return result;
      }

      if (a1 == -18432) {
        return 39LL;
      }
      if (a1 == -18431) {
        return 40LL;
      }
      int v3 = -16368;
    }

LABEL_88:
    if (a1 == v3) {
      return 80LL;
    }
    return 0LL;
  }

  if (a1 > -15365)
  {
    if (a1 <= -12545)
    {
      if (a1 <= -15318)
      {
        switch(a1)
        {
          case -15359:
          case -15358:
          case -15356:
          case -15355:
          case -15354:
          case -15353:
          case -15352:
          case -15351:
LABEL_19:
            uint64_t result = 16LL;
            break;
          case -15357:
          case -15349:
          case -15347:
          case -15346:
          case -15345:
          case -15344:
          case -15343:
          case -15342:
          case -15341:
          case -15340:
          case -15339:
          case -15338:
          case -15337:
          case -15336:
          case -15335:
          case -15334:
            return 0LL;
          case -15350:
            uint64_t result = 52LL;
            break;
          case -15348:
            return 53LL;
          case -15333:
            return 51LL;
          default:
            int v7 = -15364;
LABEL_148:
            if (a1 != v7) {
              return 0LL;
            }
            uint64_t result = 17LL;
            break;
        }

        return result;
      }

      if (a1 > -15262)
      {
        if ((a1 + 15260) >= 2)
        {
          if (a1 == -15261) {
            return 18LL;
          }
          if (a1 == -15245) {
            return 72LL;
          }
          return 0LL;
        }
      }

      else
      {
        if (a1 <= -15300)
        {
          if (a1 == -15317) {
            return 33LL;
          }
          int v2 = -15306;
          goto LABEL_48;
        }

        if (a1 == -15299) {
          return 55LL;
        }
        if (a1 != -15296) {
          return 0LL;
        }
      }

      return 53LL;
    }

    if (a1 > -6123)
    {
      int v4 = a1 + 6122;
      uint64_t result = 6LL;
      switch(v4)
      {
        case 0:
          uint64_t result = 10LL;
          break;
        case 3:
        case 6:
LABEL_63:
          uint64_t result = 8LL;
          break;
        case 11:
          return result;
        case 12:
          uint64_t result = 9LL;
          break;
        case 13:
          uint64_t result = 7LL;
          break;
        default:
          return 0LL;
      }

      return result;
    }

    if (a1 > -7167)
    {
      switch(a1)
      {
        case -6143:
        case -6131:
          uint64_t result = 5LL;
          break;
        case -6142:
        case -6140:
        case -6139:
        case -6138:
        case -6137:
        case -6136:
        case -6135:
        case -6132:
        case -6130:
          return 0LL;
        case -6141:
        case -6133:
        case -6129:
          goto LABEL_63;
        case -6134:
          uint64_t result = 11LL;
          break;
        default:
          if (a1 != -7166 && a1 != -6655) {
            return 0LL;
          }
          uint64_t result = 2LL;
          break;
      }

      return result;
    }

    if (a1 > -10238)
    {
      if (a1 == -10237) {
        return 22LL;
      }
      int v3 = -7167;
      goto LABEL_88;
    }

    if (a1 == -12544) {
      return 25LL;
    }
    int v2 = -12543;
LABEL_48:
    if (a1 == v2) {
      return 51LL;
    }
    return 0LL;
  }

  if (a1 <= -15507)
  {
    if (a1 > -15588)
    {
      if (a1 > -15552)
      {
        if (a1 > -15541)
        {
          if (a1 == -15540) {
            return 60LL;
          }
          if (a1 == -15531) {
            return 37LL;
          }
          int v6 = -15509;
          goto LABEL_119;
        }

        int v5 = -15541;
        goto LABEL_67;
      }

      switch(a1)
      {
        case -15587:
LABEL_39:
          uint64_t result = 21LL;
          break;
        case -15586:
        case -15584:
          return 28LL;
        case -15585:
          return 74LL;
        case -15578:
LABEL_69:
          uint64_t result = 83LL;
          break;
        case -15577:
          return 60LL;
        default:
          return 0LL;
      }
    }

    else
    {
      if (a1 <= -15674)
      {
        switch(a1)
        {
          case -15707:
          case -15705:
            return 22LL;
          case -15706:
          case -15704:
          case -15703:
          case -15702:
          case -15700:
          case -15699:
          case -15698:
          case -15697:
          case -15696:
          case -15694:
          case -15692:
          case -15691:
            return 0LL;
          case -15701:
            return 25LL;
          case -15695:
            return 37LL;
          case -15693:
            return 62LL;
          case -15690:
          case -15689:
          case -15688:
            return 80LL;
          default:
            return 0LL;
        }
      }

      switch(a1)
      {
        case -15620:
LABEL_11:
          uint64_t result = 44LL;
          break;
        case -15619:
        case -15618:
        case -15617:
        case -15616:
        case -15612:
        case -15611:
        case -15610:
          return 0LL;
        case -15615:
        case -15614:
          goto LABEL_19;
        case -15613:
          return 37LL;
        case -15609:
        case -15608:
          return 43LL;
        default:
          int v7 = -15673;
          goto LABEL_148;
      }
    }
  }

  else
  {
    switch(a1)
    {
      case -15464:
        goto LABEL_19;
      case -15463:
      case -15444:
      case -15437:
      case -15436:
        goto LABEL_11;
      case -15462:
      case -15443:
      case -15442:
      case -15441:
        return 60LL;
      case -15461:
      case -15406:
      case -15405:
      case -15404:
      case -15403:
        return 71LL;
      case -15460:
      case -15440:
      case -15439:
      case -15438:
        goto LABEL_69;
      case -15459:
      case -15458:
      case -15457:
      case -15456:
      case -15455:
      case -15454:
      case -15453:
      case -15452:
      case -15451:
      case -15450:
      case -15449:
      case -15448:
      case -15447:
      case -15446:
      case -15445:
      case -15433:
      case -15432:
      case -15431:
      case -15426:
      case -15424:
      case -15423:
      case -15422:
      case -15418:
      case -15417:
      case -15416:
      case -15415:
      case -15414:
      case -15413:
      case -15412:
      case -15411:
      case -15410:
      case -15409:
      case -15408:
      case -15407:
        return 0LL;
      case -15435:
      case -15434:
      case -15425:
      case -15421:
      case -15420:
      case -15419:
        return 62LL;
      case -15430:
      case -15429:
      case -15428:
      case -15427:
        return 43LL;
      default:
        if (a1 == -15506) {
          goto LABEL_19;
        }
        if (a1 != -15496) {
          return 0LL;
        }
        uint64_t result = 61LL;
        break;
    }
  }

  return result;
}

    uint64_t result = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
    goto LABEL_161;
  }

  if (a2 <= -15367)
  {
    if (a2 > -15498)
    {
      switch(a2)
      {
        case -15475:
          goto LABEL_56;
        case -15474:
        case -15472:
        case -15471:
        case -15470:
        case -15469:
        case -15468:
        case -15467:
        case -15464:
        case -15463:
        case -15459:
        case -15458:
        case -15457:
        case -15456:
        case -15455:
        case -15454:
        case -15453:
        case -15452:
        case -15451:
        case -15450:
        case -15449:
        case -15448:
        case -15447:
        case -15446:
        case -15445:
        case -15444:
        case -15437:
        case -15436:
        case -15433:
        case -15432:
        case -15431:
        case -15424:
        case -15423:
        case -15422:
          return result;
        case -15473:
          uint64_t v41 = *(void *)(a3 + 80);
          if (v41) {
            uint64_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v41 + 16),  (const void *)*(unsigned int *)(v41 + 12),  (uint64_t)a4);
          }
          else {
            uint64_t v8 = 0LL;
          }
          *(void *)(a3 + 80) = v8;
          break;
        case -15466:
          *(void *)(a3 + 16) = UnwrapMTLArray_( *(void *)(result + 32),  *(unint64_t **)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
          uint64_t result = StoreMTLAccelerationStructureDescriptorUsingEncode( v11,  *(unsigned __int8 **)(a3 + 40),  (uint64_t)&v10[-v49],  &v49,  a6);
          goto LABEL_238;
        case -15465:
          uint64_t v35 = *(unsigned __int8 **)(a3 + 32);
          __int128 v37 = *(void *)(result + 32);
          unint64_t v36 = (uint64_t)a4;
LABEL_240:
          uint64_t result = StoreMTLAccelerationStructureDescriptorUsingEncode(v37, v35, v36, &v49, a6);
          goto LABEL_241;
        case -15462:
        case -15443:
        case -15442:
        case -15441:
          goto LABEL_84;
        case -15461:
          uint64_t result = StoreMTLRenderPipelineFunctionsDescriptorUsingEncode( *(void *)(result + 32),  *(void **)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
          goto LABEL_161;
        case -15460:
        case -15440:
        case -15439:
        case -15438:
          goto LABEL_89;
        case -15435:
        case -15434:
        case -15425:
        case -15421:
        case -15420:
        case -15419:
          uint64_t result = StoreMTLStitchedLibraryDescriptorUsingEncode( *(void *)(result + 32),  *(uint64_t **)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
          goto LABEL_161;
        case -15430:
        case -15428:
          goto LABEL_218;
        case -15429:
        case -15427:
          goto LABEL_129;
        case -15426:
          uint64_t result = StoreMTLStitchedLibraryDescriptorUsingEncode( *(void *)(result + 32),  *(uint64_t **)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
          goto LABEL_245;
        default:
          switch(a2)
          {
            case -15411:
              uint64_t result = StoreMTLRasterizationRateMapDescriptorUsingEncode( *(void *)(result + 32),  *(const char ***)(a3 + 8),  (uint64_t)a4,  &v49);
              goto LABEL_245;
            case -15410:
            case -15409:
            case -15408:
            case -15407:
            case -15402:
            case -15401:
            case -15400:
            case -15397:
            case -15396:
            case -15394:
            case -15393:
            case -15392:
            case -15391:
            case -15390:
            case -15387:
            case -15386:
              return result;
            case -15406:
            case -15405:
            case -15404:
            case -15403:
              uint64_t result = StoreMTLMeshRenderPipelineDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
              goto LABEL_161;
            case -15399:
            case -15389:
              goto LABEL_218;
            case -15398:
            case -15388:
              goto LABEL_158;
            case -15395:
            case -15385:
              goto LABEL_129;
            default:
              if (a2 != -15497) {
                return result;
              }
              *(void *)(a3 + 8) = UnwrapMTLArray_( *(void *)(result + 32),  *(unint64_t **)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
              unint64_t v31 = *(void *)(a3 + 16);
              int v32 = v49;
              unsigned int v33 = -v49;
              if (v31)
              {
                uint64_t v34 = (uint64_t)&v10[-v49];
                v49 -= 65LL;
                SavePointer(v11, (uint64_t *)(v31 + 16), (const void *)*(unsigned int *)(v31 + 12), v34);
                unsigned int v33 = 65 - v32;
              }

              else
              {
                uint64_t v34 = 0LL;
              }

              *(void *)(a3 + 16) = v34;
              unsigned int v20 = *(unint64_t **)(a3 + 24);
              int v22 = (uint64_t)&v10[v33];
              uint64_t v21 = v11;
              break;
          }

          goto LABEL_275;
      }

      return result;
    }

    if (a2 <= -15532)
    {
      if (a2 <= -15551)
      {
        if (a2 == -15552)
        {
          uint64_t result = StoreMTLAccelerationStructureDescriptorUsingEncode( *(void *)(result + 32),  *(unsigned __int8 **)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
          goto LABEL_245;
        }
      }

      else if (a2 != -15550)
      {
        if (a2 != -15541)
        {
          if (a2 != -15540) {
            return result;
          }
LABEL_84:
          uint64_t result = StoreMTLIntersectionFunctionTableDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
          goto LABEL_161;
        }

        goto LABEL_96;
      }

      uint64_t result = StoreMTLIntersectionFunctionDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
      goto LABEL_161;
    }

    if (a2 > -15510)
    {
      switch(a2)
      {
        case -15509:
          uint64_t result = StoreMTLBufferDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
          break;
        case -15499:
          goto LABEL_158;
        case -15498:
          *(void *)(a3 + 8) = UnwrapMTLArray_( *(void *)(result + 32),  *(unint64_t **)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
          unint64_t v13 = *(void *)(a3 + 16);
          int v15 = (uint64_t)&v10[-v49];
          uint64_t v14 = v11;
LABEL_95:
          uint64_t result = StoreMTLComputePipelineDescriptorUsingEncode(v14, v13, v15, &v49, a6);
          break;
        default:
          return result;
      }

uint64_t IsFuncEnumDestructor(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -15894)
  {
    if (a1 <= -16294)
    {
      if (a1 > -16371)
      {
        unsigned int v7 = a1 + 16370;
        if (v7 > 0x35) {
          return 0LL;
        }
        uint64_t v4 = 1LL << v7;
        uint64_t v5 = 0x26000104000081LL;
        goto LABEL_29;
      }

      if (a1 == -20475 || a1 == -20458) {
        return result;
      }
      int v10 = -16383;
    }

    else
    {
      if (a1 > -16119)
      {
        unsigned int v9 = a1 + 16118;
        if (v9 > 0x38) {
          return 0LL;
        }
        uint64_t v4 = 1LL << v9;
        uint64_t v5 = 0x100000000200001LL;
        goto LABEL_29;
      }

      int v10 = -16127;
    }

LABEL_43:
    if (a1 == v10) {
      return result;
    }
    return 0LL;
  }

  if (a1 > -15496)
  {
    if (a1 <= -15232)
    {
      if ((a1 + 15341) > 0x34 || ((1LL << (a1 - 19)) & 0x10000000201601LL) == 0)
      {
        unsigned int v6 = a1 + 15495;
        if (v6 > 6 || ((1 << v6) & 0x43) == 0) {
          return 0LL;
        }
      }

      return result;
    }

    if (a1 <= -7162)
    {
      if (a1 == -15231) {
        return result;
      }
      int v10 = -10206;
    }

    else
    {
      if (a1 == -7161 || a1 == -6652) {
        return result;
      }
      int v10 = -6139;
    }

    goto LABEL_43;
  }

  if (a1 <= -15686)
  {
    unsigned int v3 = a1 + 15801;
    if (v3 <= 0x3B)
    {
      uint64_t v4 = 1LL << v3;
      uint64_t v5 = 0x800000100000801LL;
      goto LABEL_29;
    }

    return 0LL;
  }

  unsigned int v8 = a1 + 15610;
  if (v8 > 0x2A) {
    return 0LL;
  }
  uint64_t v4 = 1LL << v8;
  uint64_t v5 = 0x40000000021LL;
LABEL_29:
  if ((v4 & v5) == 0) {
    return 0LL;
  }
  return result;
}

uint64_t IsFuncEnumDrawCall(int a1)
{
  uint64_t result = 1LL;
  if ((a1 + 16251) > 0x24 || ((1LL << (a1 + 123)) & 0x1E0000000FLL) == 0)
  {
    unsigned int v3 = a1 + 16147;
    BOOL v4 = (a1 + 15416) < 3;
    return v3 < 4 || v4;
  }

  return result;
}

uint64_t IsFuncEnumIOCall(int a1)
{
  return ((a1 + 15345) < 0x39) & (0x17C40BE00017E7FuLL >> (a1 - 15));
}

BOOL IsFuncEnumComputeCall(int a1)
{
  return (a1 + 16079) < 2 || a1 == -16327 || a1 == -16220;
}

uint64_t IsFuncEnumTileCall(int a1)
{
  BOOL v1 = a1 == -15486 || a1 == -15297;
  return a1 == -16137 || v1;
}

BOOL IsFuncEnumMeshCall(int a1)
{
  return (a1 + 15416) < 3;
}

uint64_t IsFuncEnumBlitCall(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -15879)
  {
    if (((a1 + 15995) > 0x25 || ((1LL << (a1 + 123)) & 0x38000C000FLL) == 0)
      && (a1 + 16382) >= 6
      && (a1 + 16213) >= 5)
    {
      return 0LL;
    }
  }

  else if ((a1 + 15474) >= 6 && (a1 + 15878) >= 2 && (a1 + 15756) >= 2)
  {
    return 0LL;
  }

  return result;
}

BOOL IsFuncEnumVideoCall(int a1)
{
  return a1 == -15887;
}

BOOL IsFuncEnumSampleCall(int a1)
{
  return (a1 + 15756) <= 6 && ((1 << (a1 - 116)) & 0x47) != 0 || a1 == -15637;
}

BOOL IsFuncEnumSampledBlitCall(int a1)
{
  return (a1 + 16382) < 6 || (a1 + 16210) < 2 || (a1 + 15878) < 2;
}

BOOL IsFuncEnumSampledBlitCallAGX(int a1)
{
  BOOL result = 1LL;
  if (((a1 + 15995) > 0x25 || ((1LL << (a1 + 123)) & 0x38000C000FLL) == 0)
    && ((a1 + 15802) > 4 || ((1 << (a1 - 70)) & 0x15) == 0))
  {
    return (a1 + 15470) < 2;
  }

  return result;
}

BOOL IsFuncEnumGPUCommandCall(int a1)
{
  if ((IsFuncEnumDrawCall(a1) & 1) != 0) {
    return 1LL;
  }
  BOOL result = 1LL;
  if ((a1 + 16079) >= 2 && a1 != -16327 && a1 != -16220)
  {
    if (IsFuncEnumSampledBlitCall(a1) || IsFuncEnumSampledBlitCallAGX(a1)) {
      return 1LL;
    }
    BOOL result = 1LL;
    if (a1 != -16137 && a1 != -15486 && a1 != -15297) {
      return (a1 + 15416) < 3;
    }
  }

  return result;
}

uint64_t IsFuncEnumPushDebugGroup(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -16066)
  {
    if (a1 > -16284)
    {
      if (a1 == -16283) {
        return result;
      }
      int v3 = -16244;
    }

    else
    {
      if (a1 == -16374) {
        return result;
      }
      int v3 = -16323;
    }

    goto LABEL_13;
  }

  if (a1 <= -15787)
  {
    if (a1 == -16065) {
      return result;
    }
    int v3 = -15882;
    goto LABEL_13;
  }

  if (a1 != -15786 && a1 != -15639)
  {
    int v3 = -15292;
LABEL_13:
    if (a1 != v3) {
      return 0LL;
    }
  }

  return result;
}

uint64_t IsFuncEnumPopDebugGroup(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -16065)
  {
    if (a1 > -16283)
    {
      if (a1 == -16282) {
        return result;
      }
      int v3 = -16243;
    }

    else
    {
      if (a1 == -16373) {
        return result;
      }
      int v3 = -16322;
    }

    goto LABEL_13;
  }

  if (a1 <= -15788)
  {
    if (a1 == -16064) {
      return result;
    }
    int v3 = -15881;
    goto LABEL_13;
  }

  if (a1 != -15787 && a1 != -15640)
  {
    int v3 = -15293;
LABEL_13:
    if (a1 != v3) {
      return 0LL;
    }
  }

  return result;
}

uint64_t IsFuncEnumSetLabel(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -15926)
  {
    if (a1 <= -16293)
    {
      unsigned int v4 = a1 + 0x4000;
      if (v4 > 0x2D || ((1LL << v4) & 0x200800081001LL) == 0) {
        return 0LL;
      }
      return result;
    }

    if (a1 > -16124)
    {
      int v3 = -15974;
    }

    else
    {
      int v3 = -16136;
    }

    goto LABEL_30;
  }

  if (a1 <= -15608)
  {
    if (a1 <= -15677)
    {
      if ((a1 + 15925) <= 0x2D && ((1LL << (a1 + 53)) & 0x200800000001LL) != 0
        || a1 == -15794)
      {
        return result;
      }

      int v3 = -15743;
      goto LABEL_30;
    }

    unsigned int v5 = a1 + 15676;
    if (v5 <= 0x1C)
    {
      int v6 = 1 << v5;
      int v7 = 268468481;
      goto LABEL_26;
    }

    return 0LL;
  }

  if (a1 > -15314)
  {
    unsigned int v8 = a1 + 15313;
    if (v8 <= 0x17)
    {
      int v6 = 1 << v8;
      int v7 = 8388673;
LABEL_26:
      if ((v6 & v7) == 0) {
        return 0LL;
      }
      return result;
    }

    return 0LL;
  }

  if (a1 == -15607 || a1 == -15570) {
    return result;
  }
  int v3 = -15491;
LABEL_30:
  if (a1 != v3) {
    return 0LL;
  }
  return result;
}

uint64_t IsFuncEnumEndEncoding(int a1)
{
  uint64_t result = 1LL;
  if (a1 > -16247)
  {
    if (a1 > -15790)
    {
      if (a1 == -15789) {
        return result;
      }
      int v3 = -15642;
    }

    else
    {
      if (a1 == -16246) {
        return result;
      }
      int v3 = -15884;
    }

    goto LABEL_10;
  }

  if (a1 != -16376 && a1 != -16325)
  {
    int v3 = -16285;
LABEL_10:
    if (a1 != v3) {
      return 0LL;
    }
  }

  return result;
}

BOOL IsFuncEnumIndirectExecuteCall(unsigned int a1)
{
  return a1 >> 2 == 1073737833;
}

BOOL IsFuncEnumPresent(int a1)
{
  return (a1 + 7158) < 3 || (a1 + 16359) < 2 || a1 == -16133;
}

uint64_t IsFuncEnumMPSEncodeCall(int a1)
{
  return ((a1 + 6144) < 0x30) & (0x8BF1EC9D5395uLL >> a1);
}

BOOL IsFuncEnumResourceCall(int a1)
{
  return (a1 + 15784) < 3 || a1 == -15271;
}

BOOL IsFuncEnumAccelerationEncodeCall(int a1)
{
  return (a1 + 15647) <= 0x13 && ((1 << (a1 + 31)) & 0xC0207) != 0 || (a1 + 15366) < 2;
}

BOOL IsCommandEncoder(int a1)
{
  BOOL result = 1LL;
  return result;
}

uint64_t IsFuncEnumUseResourceCall(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -15822)
  {
    return 0LL;
  }

  if (a1 <= -15635)
  {
    return 0LL;
  }

  return result;
}

uint64_t IsFuncEnumUseResidencySetCall(int a1)
{
  return ((a1 + 15254) < 0xC) & (0xCCFu >> (a1 - 106));
}

const char *GetReceiverTypeString(int a1)
{
  else {
    return off_20E2C0[a1 - 1];
  }
}

const char *GetFuncEnumAsString(int a1)
{
  if (a1 > -12545)
  {
    if (a1 > -7169)
    {
      switch(a1)
      {
        case -6144:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resul"
                   "tColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset";
          break;
        case -6143:
          uint64_t result = "kDYFEMPSPlugin_newCNNConvolutionWithDescriptor_convolutionData";
          break;
        case -6142:
          uint64_t result = "kDYFEMPSExternalCNNPoolingAverage_encodeBatchToCommandBuffer_computeCommandEncoder_options_sourceText"
                   "ures_sourceInfo_destinationTextures_destinationInfo_zeroPadSizeX_zeroPadSizeY_predicationBuffer_predicationOffset";
          break;
        case -6141:
          uint64_t result = "kDYFEMPSPlugin_newCNNPoolingMaxWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY";
          break;
        case -6140:
          uint64_t result = "kDYFEMPSExternalMatrixVectorMultiplication_encodeToCommandBuffer_encoder_options_batchSize_matrix_mat"
                   "rixStructure_vector_vectorStructure_result_resultStructure_predicationBuffer_predicationOffset";
          break;
        case -6139:
          uint64_t result = "kDYFEMPSExternalPluginBase_dealloc";
          break;
        case -6138:
          uint64_t result = "kDYFEMPSExternalCNNUnary_maxBatchSize";
          break;
        case -6137:
          uint64_t result = "kDYFEMPSExternalMatrixVectorMultiplication_encodeToCommandBuffer_encoder_options_batchSize_matrix_mat"
                   "rixStructure_vector_vectorStructure_result_resultStructure";
          break;
        case -6136:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_reloadWeightsAndBiasesWithCommandBuffer_encoder_weights_biases_predica"
                   "tionBuffer_predicationOffset";
          break;
        case -6135:
          uint64_t result = "kDYFEMPSExternalCNNUnary_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_sourceInfo"
                   "_destinationTexture_destinationInfo";
          break;
        case -6134:
          uint64_t result = "kDYFEMPSPlugin_newMatrixVectorMultiplicationWithTranspose_rows_columns_alpha_beta";
          break;
        case -6133:
          uint64_t result = "kDYFEMPSPlugin_newCNNNeuronWithNeuronType_neuronParameterA_neuronParameterB_neuronParameterC";
          break;
        case -6132:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resul"
                   "tColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo";
          break;
        case -6131:
          uint64_t result = "kDYFEMPSPlugin_newCNNConvolutionWithDescriptor_dataSource_fullyConnected";
          break;
        case -6130:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_A_aInfo_B_bInfo_C_cInfo";
          break;
        case -6129:
          uint64_t result = "kDYFEMPSPlugin_newCNNNeuronWithNeuronType_neuronParameterAArray_count";
          break;
        case -6128:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_options_batchSize_inputMatrix_inpu"
                   "tMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_alp"
                   "ha_numberOfFeatureVectors_inputFeatureChannels_outputFeatureChannels_neuronType_neuronParameterA_neur"
                   "onParameterB_neuronParameterC";
          break;
        case -6127:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_reloadWeights";
          break;
        case -6126:
          uint64_t result = "kDYFEMPSExternalCNNPoolingAverage_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_s"
                   "ourceInfo_destinationTexture_destinationInfo";
          break;
        case -6125:
          uint64_t result = "kDYFEMPSExternalCNNBinary_encodeToCommandBuffer_computeCommandEncoder_options_pluginOptions_primaryTe"
                   "xture_primaryInfo_secondaryTexture_secondaryInfo_destinationTexture_destinationInfo";
          break;
        case -6124:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_options_batchSize_inputMatrix_inpu"
                   "tMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_alp"
                   "ha_numberOfFeatureVectors_inputFeatureChannels_outputFeatureChannels_neuronType_neuronParameterA_neur"
                   "onParameterB_neuronParameterC_predicationBuffer_predicationOffset";
          break;
        case -6123:
          uint64_t result = "kDYFEMPSExternalCNNBinary_maxBatchSize";
          break;
        case -6122:
          uint64_t result = "kDYFEMPSPlugin_newMatrixMultiplicationWithTransposeLeft_transposeRight_resultRows_resultColumns_inter"
                   "iorColumns_alpha_beta";
          break;
        case -6121:
          uint64_t result = "kDYFEMPSExternalCNNPoolingAverage_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_s"
                   "ourceInfo_destinationTexture_destinationInfo_zeroPadSizeX_zeroPadSizeY";
          break;
        case -6120:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_reloadWeightsAndBiases";
          break;
        case -6119:
          uint64_t result = "kDYFEMPSPlugin_newCNNSoftMax";
          break;
        case -6118:
          uint64_t result = "kDYFEMPSExternalCNNBinary_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_prim"
                   "aryTextures_primaryInfo_secondaryTextures_secondaryInfo_destinationTextures_destinationInfo_predicati"
                   "onBuffer_predicationOffset";
          break;
        case -6117:
          uint64_t result = "kDYFEMPSExternalCNNUnary_encodeToCommandBuffer_computeCommandEncoder_options_pluginOptions_sourceText"
                   "ure_sourceInfo_destinationTexture_destinationInfo";
          break;
        case -6116:
          uint64_t result = "kDYFEMPSPlugin_newCNNDilatedPoolingMaxWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY_di"
                   "lationRateX_dilationRateY";
          break;
        case -6115:
          uint64_t result = "kDYFEMPSExternalCNNUnary_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_sourc"
                   "eTextures_sourceInfo_destinationTextures_destinationInfo_predicationBuffer_predicationOffset";
          break;
        case -6114:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_encodeBatchToCommandBuffer_computeCommandEncoder_options_plugi"
                   "nOptions_primaryTextures_primaryInfo_secondaryTextures_secondaryInfo_weightsGradient_biasesGradient_a"
                   "ccumulate_predicationBuffer_predicationOffset";
          break;
        case -6113:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_reloadWeightsWithCommandBuffer_encoder_weights_predicationBuff"
                   "er_predicationOffset";
          break;
        case -6112:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_exportWeightsAndBiasesWithCommandBuffer_encoder_weights_biases_predica"
                   "tionBuffer_predicationOffset";
          break;
        case -6111:
          uint64_t result = "kDYFEMPSPlugin_newCNNConvolutionGradientWithDescriptor_convolutionData";
          break;
        case -6110:
          uint64_t result = "kDYFEMPSPlugin_newMatrixFullyConnected";
          break;
        case -6109:
          uint64_t result = "kDYFEMPSPlugin_newCNNPoolingAverageWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY";
          break;
        case -6108:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_reloadWeightsAndBiasesWithCommandBuffer_encoder_weights_weightsDataTyp"
                   "e_biases_predicationBuffer_predicationOffset";
          break;
        case -6107:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_reloadWeightsWithCommandBuffer_encoder_weights_weightsDataType"
                   "_predicationBuffer_predicationOffset";
          break;
        case -6106:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_exportWeightsAndBiasesWithCommandBuffer_encoder_weights_weightsDataTyp"
                   "e_biases_predicationBuffer_predicationOffset";
          break;
        case -6105:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRowsAndRes"
                   "ultColumnsAndInteriorColumns_alphaAndBeta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset";
          break;
        case -6104:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_optionsAndBatchSize_inputMatrix_in"
                   "putMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_a"
                   "lpha_numberOfFeatureVectorsAndInputFeatureChannelsAndOutputFeatureChannels_neuronType_neuronParameters";
          break;
        case -6103:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_optionsAndBatchSize_inputMatrix_in"
                   "putMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_a"
                   "lpha_numberOfFeatureVectorsAndInputFeatureChannelsAndOutputFeatureChannelsAndNeuronTypeAndPredication"
                   "Offset_neuronParameters_predicationBuffer";
          break;
        case -6102:
          uint64_t result = "kDYFEMPSExternalNDArrayConvolution2DGradient_encodePrimaryGradientToCommandBuffer_encoder_options_plu"
                   "ginOptions_primary_primaryInfo_secondary_secondaryInfo_gradient_gradientInfo_destination_destinationI"
                   "nfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6101:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resul"
                   "tColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset_transA_transB";
          break;
        case -6100:
          uint64_t result = "kDYFEMPSExternalNDArrayConvolution2DGradient_encodeSecondaryGradientToCommandBuffer_encoder_options_p"
                   "luginOptions_primary_primaryInfo_secondary_secondaryInfo_gradient_gradientInfo_destination_destinatio"
                   "nInfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6099:
          uint64_t result = "kDYFEMPSExternalNDArrayBinaryGradient_encodePrimaryGradientToCommandBuffer_encoder_options_pluginOpti"
                   "ons_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_gradientBuffer_gradientInfo_destination_d"
                   "estinationInfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6098:
          uint64_t result = "kDYFEMPSExternalNDArrayBinaryGradient_encodeSecondaryGradientToCommandBuffer_encoder_options_pluginOp"
                   "tions_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_gradientBuffer_gradientInfo_destination"
                   "_destinationInfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6097:
          uint64_t result = "kDYFEMPSExternalNDArrayBinary_encodeToCommandBuffer_encoder_options_pluginOptions_primaryBuffer_prima"
                   "ryInfo_secondaryBuffer_secondaryInfo_destinationBuffer_destinationInfo_predicationBuffer_predicationOffset";
          break;
        case -6096:
          uint64_t result = "kDYFEMPSPlugin_newNDArrayConvolution2DGradientWithDescriptor";
          break;
        case -6095:
          uint64_t result = "kDYFEMPSPlugin_newNDArrayConvolution2DWithDescriptor";
          break;
        default:
          switch(a1)
          {
            case -7168:
              uint64_t result = "kDYFECAMetalLayer_setPresentsWithTransaction";
              break;
            case -7167:
              uint64_t result = "kDYFECAMetalDrawable_texture";
              break;
            case -7166:
              uint64_t result = "kDYFECAMetalLayer_nextDrawable";
              break;
            case -7165:
              uint64_t result = "kDYFECAMetalLayer_setPixelFormat";
              break;
            case -7164:
              uint64_t result = "kDYFECAMetalLayer_setDrawableSize";
              break;
            case -7163:
              uint64_t result = "kDYFECAMetalLayer_setDevice";
              break;
            case -7162:
              uint64_t result = "kDYFECAMetalLayer_setBounds_contentsScale";
              break;
            case -7161:
              uint64_t result = "kDYFECAMetalDrawable_dealloc";
              break;
            case -7160:
              uint64_t result = "kDYFECAMetalLayer_setFramebufferOnly";
              break;
            case -7159:
              uint64_t result = "kDYFECAMetalLayer_setBounds_contentsScale_windowBounds_windowProperties";
              break;
            case -7158:
              uint64_t result = "kDYFECAMetalDrawable_present";
              break;
            case -7157:
              uint64_t result = "kDYFECAMetalDrawable_presentAtTime";
              break;
            case -7156:
              uint64_t result = "kDYFECAMetalDrawable_presentAfterMinimumDuration";
              break;
            case -7155:
              uint64_t result = "kDYFEUIScreen_setInterfaceOrientation";
              break;
            case -7154:
              uint64_t result = "kDYFECAMetalLayer_setWantsExtendedDynamicRangeContent";
              break;
            case -7153:
              uint64_t result = "kDYFECAMetalLayer_setColorspace";
              break;
            default:
              switch(a1)
              {
                case -6656:
                  uint64_t result = "kDYFENSHMDMetalSession_setDrawablePixelFormat";
                  break;
                case -6655:
                  uint64_t result = "kDYFENSHMDMetalSession_nextDrawable";
                  break;
                case -6654:
                  uint64_t result = "kDYFENSHMDMetalSession_initWithMetalDevice_deviceReference_hmdName";
                  break;
                case -6653:
                  uint64_t result = "kDYFENSHMDMetalSession_setDrawableSize";
                  break;
                case -6652:
                  uint64_t result = "kDYFENSHMDMetalSession_dealloc";
                  break;
                default:
LABEL_1384:
                  uint64_t result = 0LL;
                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      switch(a1)
      {
        case -10240:
          uint64_t result = "kDYFEMTLCommandBuffer_restoreMTLBufferContents";
          break;
        case -10239:
          uint64_t result = "kDYFEMTLDevice_deviceReference";
          break;
        case -10238:
          uint64_t result = "kDYFEMTLTexture_harvested_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage";
          break;
        case -10237:
          uint64_t result = "kDYFEMTLDevice_harvested_newBufferWithBytes_length_options";
          break;
        case -10236:
          uint64_t result = "kDYFEMTLTexture_harvested_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_totalBytes";
          break;
        case -10235:
          uint64_t result = "kDYFEMTLBuffer_resourceUsage";
          break;
        case -10234:
          uint64_t result = "kDYFEMTLTexture_resourceUsage";
          break;
        case -10233:
          uint64_t result = "kDYFEMTLDevice_setSelectedCommandQueueAddress";
          break;
        case -10232:
          uint64_t result = "kDYFEMTLTexture_restoreIOSurfaceData_length_forPlane";
          break;
        case -10231:
          uint64_t result = "kDYFEMTLTexture_mipmapInfo";
          break;
        case -10230:
          uint64_t result = "kDYFEMTLDevice_setCapturingCommandQueueAddress";
          break;
        case -10229:
          uint64_t result = "kDYFEMTLCommandBuffer_indirectArgumentBufferData";
          break;
        case -10228:
          uint64_t result = "kDYFEMTLBuffer_gpuVirtualAddress";
          break;
        case -10227:
          uint64_t result = "kDYFEMTLTexture_uniqueIdentifier";
          break;
        case -10226:
          uint64_t result = "kDYFEMTLSamplerState_uniqueIdentifier";
          break;
        case -10225:
          uint64_t result = "kDYFEMTLCommandBuffer_encodeIndirectArgumentsForBuffer_data";
          break;
        case -10224:
          uint64_t result = "kDYFEFrameEnd";
          break;
        case -10223:
          uint64_t result = "kDYFEMTLBuffer_allocatedSize";
          break;
        case -10222:
          uint64_t result = "kDYFEMTLTexture_allocatedSize";
          break;
        case -10221:
          uint64_t result = "kDYFEMTLBuffer_indirectCommandBufferData";
          break;
        case -10220:
          uint64_t result = "kDYFEMTLRenderPipelineState_uniqueIdentifier";
          break;
        case -10219:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_restoreData";
          break;
        case -10218:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_uniqueIdentifier";
          break;
        case -10217:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_indirectCommandNop";
          break;
        case -10216:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_restoreOptimizedRanges";
          break;
        case -10215:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_allocatedSize";
          break;
        case -10214:
          uint64_t result = "kDYFEMTLComputePipelineState_uniqueIdentifier";
          break;
        case -10213:
          uint64_t result = "kDYFEMTLResourceStateCommandEncoder_harvested_updateTextureMapping_mode_region_mipLevel_slice";
          break;
        case -10212:
          uint64_t result = "kDYFEMTLTexture_timeSinceTouched";
          break;
        case -10211:
          uint64_t result = "kDYFEMTLHeap_timeSinceTouched";
          break;
        case -10210:
          uint64_t result = "kDYFEMTLBuffer_timeSinceTouched";
          break;
        case -10209:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_timeSinceTouched";
          break;
        case -10208:
          uint64_t result = "kDYFEMTLHeap_usedSize";
          break;
        case -10207:
          uint64_t result = "kDYFEMTLHeap_currentAllocatedSize";
          break;
        case -10206:
          uint64_t result = "kDYFEMTLSharedEventHandle_dealloc";
          break;
        case -10205:
          uint64_t result = "kDYFEMTLTexture_compressionFeedback";
          break;
        case -10204:
          uint64_t result = "kDYFEMTLTexture_allocationID";
          break;
        case -10203:
          uint64_t result = "kDYFEMTLBuffer_allocationID";
          break;
        case -10202:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_allocationID";
          break;
        case -10201:
          uint64_t result = "kDYFEMTLTexture_saveSlice_level_zPlane_normalize_blitOption_toPath";
          break;
        case -10200:
          uint64_t result = "kDYFEMTLBuffer_saveContentsToPath";
          break;
        case -10199:
          uint64_t result = "kDYFEMTLRenderPipelineState_resourceIndex";
          break;
        case -10198:
          uint64_t result = "kDYFEMTLTexture_resourceIndex";
          break;
        case -10197:
          uint64_t result = "kDYFEMTLAccelerationStructure_allocationID";
          break;
        case -10196:
          uint64_t result = "kDYFEMTLAccelerationStructure_allocatedSize";
          break;
        case -10195:
          uint64_t result = "kDYFEMTLAccelerationStructure_resourceUsage";
          break;
        case -10194:
          uint64_t result = "kDYFEMTLAccelerationStructure_restoreMTLAccelerationStructure";
          break;
        case -10193:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_uniqueIdentifier";
          break;
        case -10192:
          uint64_t result = "kDYFEMTLRenderPipelineState_allocatedSize";
          break;
        case -10191:
          uint64_t result = "kDYFEMTLComputePipelineState_allocatedSize";
          break;
        case -10190:
          uint64_t result = "kDYFEMTLAccelerationStructure_restoreMTLAccelerationStructure_instance";
          break;
        case -10189:
          uint64_t result = "kDYFEMTLDynamicLibrary_installName";
          break;
        case -10188:
          uint64_t result = "kDYFEMTLLibrary_libraryIdentifier";
          break;
        case -10187:
          uint64_t result = "kDYFEMTLBuffer_heapOffset";
          break;
        case -10186:
          uint64_t result = "kDYFEMTLBuffer_parentGPUAddress_parentGPUSize";
          break;
        case -10185:
          uint64_t result = "kDYFEMTLTexture_heapOffset";
          break;
        case -10184:
          uint64_t result = "kDYFEMTLRenderPipelineState_imageblockSampleLength";
          break;
        case -10183:
          uint64_t result = "kDYFEMTLLibrary_type";
          break;
        case -10182:
          uint64_t result = "kDYFEMTLAccelerationStructure_allocationInfo";
          break;
        case -10181:
          uint64_t result = "kDYFEMTLAccelerationStructure_uniqueIdentifier";
          break;
        case -10180:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_timeSinceTouched";
          break;
        case -10179:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_allocatedSize";
          break;
        case -10178:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_timeSinceTouched";
          break;
        case -10177:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_allocationID";
          break;
        case -10176:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_allocationID";
          break;
        case -10175:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_uniqueIdentifier";
          break;
        case -10174:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_allocatedSize";
          break;
        case -10173:
          uint64_t result = "kDYFEMTLAccelerationStructure_timeSinceTouched";
          break;
        case -10172:
          uint64_t result = "kDYFEMTLRenderPipelineState_timeSinceTouched";
          break;
        case -10171:
          uint64_t result = "kDYFEMTLComputePipelineState_timeSinceTouched";
          break;
        case -10170:
          uint64_t result = "kDYFEMTLAccelerationStructure_resourceIndex";
          break;
        case -10169:
          uint64_t result = "kDYFEMTLAccelerationStructure_heapOffset";
          break;
        case -10168:
          uint64_t result = "kDYFEBoundary_Frame";
          break;
        case -10167:
          uint64_t result = "kDYFEMTLAccelerationStructure_gpuResourceID";
          break;
        case -10166:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_gpuResourceID";
          break;
        case -10165:
          uint64_t result = "kDYFEMTLRenderPipelineState_gpuResourceID";
          break;
        case -10164:
          uint64_t result = "kDYFEMTLTexture_gpuResourceID";
          break;
        case -10163:
          uint64_t result = "kDYFEMTLSamplerState_gpuResourceID";
          break;
        case -10162:
          uint64_t result = "kDYFEMTLComputePipelineState_gpuResourceID";
          break;
        case -10161:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_gpuResourceID";
          break;
        case -10160:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_gpuResourceID";
          break;
        case -10159:
          uint64_t result = "kDYFEMTLAccelerationStructure_state";
          break;
        case -10158:
          uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setAccelerationStructureState";
          break;
        case -10157:
          uint64_t result = "kDYFEMTLFunction_setDescriptor_library";
          break;
        case -10156:
          uint64_t result = "kDYFEMTLAccelerationStructure_children";
          break;
        case -10155:
          uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setAccelerationStructureChildren";
          break;
        case -10154:
          uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setAccelerationStructureDescriptor";
          break;
        case -10153:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_gpuAddress";
          break;
        case -10152:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_setBuffers";
          break;
        case -10151:
          uint64_t result = "kDYFEMTLCaptureManager_sharedCaptureManager";
          break;
        default:
          if (a1 == -12544)
          {
            uint64_t result = "kDYFEMTLCommandQueue_continueCommandBuffer_retainReferences";
          }

          else
          {
            if (a1 != -12543) {
              goto LABEL_1384;
            }
            uint64_t result = "kDYFEMTLIOCommandQueue_continueCommandBuffer_retainReferences";
          }

          break;
      }
    }
  }

  else if (a1 <= -18431)
  {
    switch(a1)
    {
      case -20480:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setColorTexture";
        break;
      case -20479:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setFence";
        break;
      case -20478:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setInputContentHeight";
        break;
      case -20477:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setInputContentWidth";
        break;
      case -20476:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setOutputTexture";
        break;
      case -20475:
        uint64_t result = "kDYFEMTLFXSpatialScaler_dealloc";
        break;
      case -20474:
        uint64_t result = "kDYFEMTLFXSpatialScaler_encodeToCommandBuffer";
        break;
      case -20473:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setColorTexture";
        break;
      case -20472:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setDepthReversed";
        break;
      case -20471:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setDepthTexture";
        break;
      case -20470:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setExposureTexture";
        break;
      case -20469:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setFence";
        break;
      case -20468:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setInputContentHeight";
        break;
      case -20467:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setInputContentWidth";
        break;
      case -20466:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setJitterOffsetX";
        break;
      case -20465:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setJitterOffsetY";
        break;
      case -20464:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setMotionTexture";
        break;
      case -20463:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setMotionVectorScaleX";
        break;
      case -20462:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setMotionVectorScaleY";
        break;
      case -20461:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setOutputTexture";
        break;
      case -20460:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setPreExposure";
        break;
      case -20459:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setReset";
        break;
      case -20458:
        uint64_t result = "kDYFEMTLFXTemporalScaler_dealloc";
        break;
      case -20457:
        uint64_t result = "kDYFEMTLFXTemporalScaler_encodeToCommandBuffer";
        break;
      case -20456:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setReactiveMaskTexture";
        break;
      default:
        if (a1 == -18432)
        {
          uint64_t result = "kDYFEMTLDevice_newSpatialScalerWithDescriptor";
        }

        else
        {
          if (a1 != -18431) {
            goto LABEL_1384;
          }
          uint64_t result = "kDYFEMTLDevice_newTemporalScalerWithDescriptor";
        }

        break;
    }
  }

  else
  {
    int v1 = a1 + 0x4000;
    uint64_t result = "kDYFEMTLBlitCommandEncoder_setLabel";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_dealloc";
        break;
      case 2:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_de"
                 "stinationSlice_destinationLevel_destinationOrigin";
        break;
      case 3:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize"
                 "_toTexture_destinationSlice_destinationLevel_destinationOrigin";
        break;
      case 4:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_des"
                 "tinationOffset_destinationBytesPerRow_destinationBytesPerImage";
        break;
      case 5:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_generateMipmapsForTexture";
        break;
      case 6:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillBuffer_range_value";
        break;
      case 7:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size";
        break;
      case 8:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_endEncoding";
        break;
      case 9:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_insertDebugSignpost";
        break;
      case 10:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_pushDebugGroup";
        break;
      case 11:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_popDebugGroup";
        break;
      case 12:
        uint64_t result = "kDYFEMTLBuffer_setLabel";
        break;
      case 13:
        uint64_t result = "kDYFEMTLBuffer_setResponsibleProcess";
        break;
      case 14:
        uint64_t result = "kDYFEMTLBuffer_dealloc";
        break;
      case 15:
        uint64_t result = "kDYFEMTLBuffer_contents";
        break;
      case 16:
        uint64_t result = "kDYFEMTLBuffer_newTextureWithDescriptor_offset_bytesPerRow";
        break;
      case 17:
        uint64_t result = "kDYFEMTLBuffer_setPurgeableState";
        break;
      case 18:
        uint64_t result = "kDYFEMTLBuffer_isPurgeable";
        break;
      case 19:
        uint64_t result = "kDYFEMTLCommandBuffer_setLabel";
        break;
      case 20:
        uint64_t result = "kDYFEMTLCommandBuffer_setProfilingEnabled";
        break;
      case 21:
        uint64_t result = "kDYFEMTLCommandBuffer_dealloc";
        break;
      case 22:
        uint64_t result = "kDYFEMTLCommandBuffer_enqueue";
        break;
      case 23:
        uint64_t result = "kDYFEMTLCommandBuffer_commit";
        break;
      case 24:
        uint64_t result = "kDYFEMTLCommandBuffer_addScheduledHandler";
        break;
      case 25:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable";
        break;
      case 26:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable_atTime";
        break;
      case 27:
        uint64_t result = "kDYFEMTLCommandBuffer_waitUntilScheduled";
        break;
      case 28:
        uint64_t result = "kDYFEMTLCommandBuffer_addCompletedHandler";
        break;
      case 29:
        uint64_t result = "kDYFEMTLCommandBuffer_waitUntilCompleted";
        break;
      case 30:
        uint64_t result = "kDYFEMTLCommandBuffer_blitCommandEncoder";
        break;
      case 31:
        uint64_t result = "kDYFEMTLCommandBuffer_renderCommandEncoderWithDescriptor";
        break;
      case 32:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoder";
        break;
      case 33:
        uint64_t result = "kDYFEMTLCommandBuffer_parallelRenderCommandEncoderWithDescriptor";
        break;
      case 34:
        uint64_t result = "kDYFEMTLCommandBuffer_debugCommandEncoder";
        break;
      case 35:
        uint64_t result = "kDYFEMTLCommandQueue_setLabel";
        break;
      case 36:
        uint64_t result = "kDYFEMTLCommandQueue_setBackgroundTrackingPID";
        break;
      case 37:
        uint64_t result = "kDYFEMTLCommandQueue_setSkipRender";
        break;
      case 38:
        uint64_t result = "kDYFEMTLCommandQueue_setExecutionEnabled";
        break;
      case 39:
        uint64_t result = "kDYFEMTLCommandQueue_setProfilingEnabled";
        break;
      case 40:
        uint64_t result = "kDYFEMTLCommandQueue_dealloc";
        break;
      case 41:
        uint64_t result = "kDYFEMTLCommandQueue_commandBuffer";
        break;
      case 42:
        uint64_t result = "kDYFEMTLCommandQueue_commandBufferWithUnretainedReferences";
        break;
      case 43:
        uint64_t result = "kDYFEMTLCommandQueue_insertDebugCaptureBoundary";
        break;
      case 44:
        uint64_t result = "kDYFEMTLCommandQueue_finish";
        break;
      case 45:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setLabel";
        break;
      case 46:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dealloc";
        break;
      case 47:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setComputePipelineState";
        break;
      case 48:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffer_offset_atIndex";
        break;
      case 49:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffers_offsets_withRange";
        break;
      case 50:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setTexture_atIndex";
        break;
      case 51:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setTextures_withRange";
        break;
      case 52:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerState_atIndex";
        break;
      case 53:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerStates_withRange";
        break;
      case 54:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 55:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 56:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupMemoryLength_atIndex";
        break;
      case 57:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreadgroups_threadsPerThreadgroup";
        break;
      case 58:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeBarrier";
        break;
      case 59:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_endEncoding";
        break;
      case 60:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_insertDebugSignpost";
        break;
      case 61:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_pushDebugGroup";
        break;
      case 62:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_popDebugGroup";
        break;
      case 63:
        uint64_t result = "kDYFEMTLComputePipelineState_dealloc";
        break;
      case 64:
        uint64_t result = "kDYFEMTLDepthStencilState_dealloc";
        break;
      case 65:
        uint64_t result = "kDYFEMTLDevice_setShaderDebugInfoCaching";
        break;
      case 66:
        uint64_t result = "kDYFEMTLDevice_setMetalAssertionsEnabled";
        break;
      case 67:
        uint64_t result = "kDYFEMTLDevice_dealloc";
        break;
      case 68:
        uint64_t result = "kDYFEMTLDevice_newCommandQueue";
        break;
      case 69:
        uint64_t result = "kDYFEMTLDevice_newCommandQueueWithMaxCommandBufferCount";
        break;
      case 70:
        uint64_t result = "kDYFEMTLDevice_newBufferWithLength_options";
        break;
      case 71:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytes_length_options";
        break;
      case 72:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytesNoCopy_length_options_deallocator";
        break;
      case 73:
        uint64_t result = "kDYFEMTLDevice_newDepthStencilStateWithDescriptor";
        break;
      case 74:
        uint64_t result = "kDYFEMTLDevice_newTextureWithDescriptor";
        break;
      case 75:
        uint64_t result = "kDYFEMTLDevice_newSamplerStateWithDescriptor";
        break;
      case 76:
        uint64_t result = "kDYFEMTLDevice_newDefaultLibrary";
        break;
      case 77:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithFile_error";
        break;
      case 78:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithData_error";
        break;
      case 79:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithSource_options_error";
        break;
      case 80:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithSource_options_completionHandler";
        break;
      case 81:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_error";
        break;
      case 82:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_options_reflection_error";
        break;
      case 83:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_completionHandler";
        break;
      case 84:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler";
        break;
      case 85:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_error";
        break;
      case 86:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_options_reflection_error";
        break;
      case 87:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_completionHandler";
        break;
      case 88:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_options_completionHandler";
        break;
      case 89:
        uint64_t result = "kDYFEMTLDevice_unmapShaderSampleBuffer";
        break;
      case 90:
        uint64_t result = "kDYFEMTLDevice_newTextureWithDescriptor_iosurface_plane";
        break;
      case 91:
        uint64_t result = "kDYFEMTLFunction_dealloc";
        break;
      case 92:
        uint64_t result = "kDYFEMTLLibrary_setLabel";
        break;
      case 93:
        uint64_t result = "kDYFEMTLLibrary_dealloc";
        break;
      case 94:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName";
        break;
      case 95:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setSeparateCommits";
        break;
      case 96:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setLabel";
        break;
      case 97:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_dealloc";
        break;
      case 98:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_renderCommandEncoder";
        break;
      case 99:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_endEncoding";
        break;
      case 100:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_insertDebugSignpost";
        break;
      case 101:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_pushDebugGroup";
        break;
      case 102:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_popDebugGroup";
        break;
      case 103:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setLabel";
        break;
      case 104:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dealloc";
        break;
      case 105:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setRenderPipelineState";
        break;
      case 106:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffer_offset_atIndex";
        break;
      case 107:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffers_offsets_withRange";
        break;
      case 108:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexTexture_atIndex";
        break;
      case 109:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexTextures_withRange";
        break;
      case 110:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerState_atIndex";
        break;
      case 111:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerStates_withRange";
        break;
      case 112:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 113:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 114:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setViewport";
        break;
      case 115:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFrontFacingWinding";
        break;
      case 116:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setCullMode";
        break;
      case 117:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthClipMode";
        break;
      case 118:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthBias_slopeScale_clamp";
        break;
      case 119:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setScissorRect";
        break;
      case 120:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTriangleFillMode";
        break;
      case 121:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBuffer_offset_atIndex";
        break;
      case 122:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBuffers_offsets_withRange";
        break;
      case 123:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTexture_atIndex";
        break;
      case 124:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTextures_withRange";
        break;
      case 125:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerState_atIndex";
        break;
      case 126:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerStates_withRange";
        break;
      case 127:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 128:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 129:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setBlendColorRed_green_blue_alpha";
        break;
      case 130:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthStencilState";
        break;
      case 131:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilReferenceValue";
        break;
      case 132:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVisibilityResultMode_offset";
        break;
      case 133:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_vertexStart_vertexCount_instanceCount";
        break;
      case 134:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_vertexStart_vertexCount";
        break;
      case 135:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount";
        break;
      case 136:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset";
        break;
      case 137:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setLineWidth";
        break;
      case 138:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_endEncoding";
        break;
      case 139:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_insertDebugSignpost";
        break;
      case 140:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_pushDebugGroup";
        break;
      case 141:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_popDebugGroup";
        break;
      case 142:
        uint64_t result = "kDYFEMTLRenderPipelineState_dealloc";
        break;
      case 143:
        uint64_t result = "kDYFEMTLSamplerState_dealloc";
        break;
      case 144:
        uint64_t result = "kDYFEMTLTexture_setLabel";
        break;
      case 145:
        uint64_t result = "kDYFEMTLTexture_setResponsibleProcess";
        break;
      case 146:
        uint64_t result = "kDYFEMTLTexture_dealloc";
        break;
      case 147:
        uint64_t result = "kDYFEMTLTexture_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice";
        break;
      case 148:
        uint64_t result = "kDYFEMTLTexture_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage";
        break;
      case 149:
        uint64_t result = "kDYFEMTLTexture_getBytes_bytesPerRow_fromRegion_mipmapLevel";
        break;
      case 150:
        uint64_t result = "kDYFEMTLTexture_replaceRegion_mipmapLevel_withBytes_bytesPerRow";
        break;
      case 151:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat";
        break;
      case 152:
        uint64_t result = "kDYFEMTLTexture_setPurgeableState";
        break;
      case 153:
        uint64_t result = "kDYFEMTLTexture_isPurgeable";
        break;
      case 154:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_flushResource";
        break;
      case 155:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_flushTexture_slice_mipmapLevel";
        break;
      case 156:
        uint64_t result = "kDYFEMTLBuffer_invalidateRange";
        break;
      case 157:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBytes_length_atIndex";
        break;
      case 158:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBufferOffset_atIndex";
        break;
      case 159:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBytes_length_atIndex";
        break;
      case 160:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBufferOffset_atIndex";
        break;
      case 161:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBytes_length_atIndex";
        break;
      case 162:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBufferOffset_atIndex";
        break;
      case 163:
        uint64_t result = "kDYFEMTLTexture_invalidateRegion";
        break;
      case 164:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup";
        break;
      case 165:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilFrontReferenceValue_backReferenceValue";
        break;
      case 166:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance";
        break;
      case 167:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_i"
                 "nstanceCount_baseVertex_baseInstance";
        break;
      case 168:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_indirectBuffer_indirectBufferOffset";
        break;
      case 169:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuff"
                 "er_indirectBufferOffset";
        break;
      case 170:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex";
        break;
      case 171:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_synchronizeResource";
        break;
      case 172:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_synchronizeTexture_slice_level";
        break;
      case 173:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_de"
                 "stinationSlice_destinationLevel_destinationOrigin_options";
        break;
      case 174:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize"
                 "_toTexture_destinationSlice_destinationLevel_destinationOrigin_options";
        break;
      case 175:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_des"
                 "tinationOffset_destinationBytesPerRow_destinationBytesPerImage_options";
        break;
      case 176:
        uint64_t result = "kDYFEMTLBuffer_didModifyRange";
        break;
      case 177:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setTexture_baseLevel_atIndex";
        break;
      case 178:
        uint64_t result = "kDYFEMTLDevice_supportsFeatureSet";
        break;
      case 179:
        uint64_t result = "kDYFEMTLDevice_supportsSampleCount";
        break;
      case 180:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexTexture_baseLevel_atIndex";
        break;
      case 181:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTexture_baseLevel_atIndex";
        break;
      case 182:
        uint64_t result = "kDYFEMTLCommandBuffer_commitAndHold";
        break;
      case 183:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_textureBarrier";
        break;
      case 184:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_error";
        break;
      case 185:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_options_reflection_error";
        break;
      case 186:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_completionHandler";
        break;
      case 187:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler";
        break;
      case 188:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices";
        break;
      case 189:
        uint64_t result = "kDYFEMTLCommandBuffer_fragmentRenderCommandEncoderWithDescriptor";
        break;
      case 190:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setLabel";
        break;
      case 191:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_dealloc";
        break;
      case 192:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setRenderPipelineState";
        break;
      case 193:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthBias_slopeScale_clamp";
        break;
      case 194:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setScissorRect";
        break;
      case 195:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBytes_length_atIndex";
        break;
      case 196:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBuffer_offset_atIndex";
        break;
      case 197:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBufferOffset_atIndex";
        break;
      case 198:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBuffers_offsets_withRange";
        break;
      case 199:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTexture_atIndex";
        break;
      case 200:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTextures_withRange";
        break;
      case 201:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTexture_baseLevel_atIndex";
        break;
      case 202:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex";
        break;
      case 203:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerState_atIndex";
        break;
      case 204:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerStates_withRange";
        break;
      case 205:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 206:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 207:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setBlendColorRed_green_blue_alpha";
        break;
      case 208:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthStencilState";
        break;
      case 209:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilReferenceValue";
        break;
      case 210:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilFrontReferenceValue_backReferenceValue";
        break;
      case 211:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_drawTrianglesWithPositions_vertexCount_triangleIndices_triangleCount";
        break;
      case 212:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_drawTrianglesWithPositions_vertexCount_vertexVaryings_varyingCount"
                 "PerVertex_triangleIndices_triangleCount";
        break;
      case 213:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_drawTrianglesWithPositions_vertexCount_vertexVaryings_varyingCountPerVertex";
        break;
      case 214:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_endEncoding";
        break;
      case 215:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_insertDebugSignpost";
        break;
      case 216:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_pushDebugGroup";
        break;
      case 217:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_popDebugGroup";
        break;
      case 218:
        uint64_t result = "kDYFEMTLDevice_supportsTextureSampleCount";
        break;
      case 219:
        uint64_t result = "kDYFEMTLDevice_newCommandQueueWithDescriptor";
        break;
      case 220:
        uint64_t result = "kDYFEMTLCommandBuffer_setListIndex";
        break;
      case 221:
        uint64_t result = "kDYFEMTLDevice_newBufferWithIOSurface";
        break;
      case 222:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setColorStoreAction_atIndex";
        break;
      case 223:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setDepthStoreAction";
        break;
      case 224:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setStencilStoreAction";
        break;
      case 225:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorStoreAction_atIndex";
        break;
      case 226:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthStoreAction";
        break;
      case 227:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilStoreAction";
        break;
      case 228:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorResolveTexture_slice_depthPlane_level_atIndex";
        break;
      case 229:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthResolveTexture_slice_depthPlane_level";
        break;
      case 230:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setColorStoreAction_atIndex";
        break;
      case 231:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthStoreAction";
        break;
      case 232:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilStoreAction";
        break;
      case 233:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithParallelExecution";
        break;
      case 234:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchBarrier";
        break;
      case 235:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setImageblockWidth_height";
        break;
      case 236:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTessellationFactorBuffer_offset_instanceStride";
        break;
      case 237:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_"
                 "instanceCount_baseInstance";
        break;
      case 238:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset";
        break;
      case 239:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffer"
                 "Offset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance";
        break;
      case 240:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointInd"
                 "exBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset";
        break;
      case 241:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBytes_length_atIndex";
        break;
      case 242:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBuffer_offset_atIndex";
        break;
      case 243:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBufferOffset_atIndex";
        break;
      case 244:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileTexture_atIndex";
        break;
      case 245:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerState_atIndex";
        break;
      case 246:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 247:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dispatchThreadsPerTile";
        break;
      case 248:
        uint64_t result = "kDYFEMTLFence_setLabel";
        break;
      case 249:
        uint64_t result = "kDYFEMTLFunction_functionConstantIndexByName_type";
        break;
      case 250:
        uint64_t result = "kDYFEMTLCommandQueue_setIsOpenGLQueue";
        break;
      case 251:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable_afterMinimumDuration";
        break;
      case 252:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTessellationFactorScale";
        break;
      case 253:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_waitForFence";
        break;
      case 254:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_updateFence";
        break;
      case 255:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_waitForFence";
        break;
      case 256:
        uint64_t result = "kDYFEMTLDevice_newFence";
        break;
      case 257:
        uint64_t result = "kDYFEMTLFence_dealloc";
        break;
      case 258:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_updateFence_afterStages";
        break;
      case 259:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_waitForFence_beforeStages";
        break;
      case 260:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateFence";
        break;
      case 261:
        uint64_t result = "kDYFEMTLFunction_setLabel";
        break;
      case 262:
        uint64_t result = "kDYFEMTLBuffer_makeAliasable";
        break;
      case 263:
        uint64_t result = "kDYFEMTLDevice_heapTextureSizeWithDescriptor";
        break;
      case 264:
        uint64_t result = "kDYFEMTLDevice_newHeapWithDescriptor";
        break;
      case 265:
        uint64_t result = "kDYFEMTLHeap_setLabel";
        break;
      case 266:
        uint64_t result = "kDYFEMTLHeap_dealloc";
        break;
      case 267:
        uint64_t result = "kDYFEMTLHeap_newBufferWithLength_options";
        break;
      case 268:
        uint64_t result = "kDYFEMTLHeap_newTextureWithDescriptor";
        break;
      case 269:
        uint64_t result = "kDYFEMTLHeap_setPurgeableState";
        break;
      case 270:
        uint64_t result = "kDYFEMTLTexture_makeAliasable";
        break;
      case 271:
        uint64_t result = "kDYFEMTLBuffer_isAliasable";
        break;
      case 272:
        uint64_t result = "kDYFEMTLDevice_heapTextureSizeAndAlignWithDescriptor";
        break;
      case 273:
        uint64_t result = "kDYFEMTLDevice_heapBufferSizeAndAlignWithLength_options";
        break;
      case 274:
        uint64_t result = "kDYFEMTLHeap_setResponsibleProcess";
        break;
      case 275:
        uint64_t result = "kDYFEMTLHeap_isPurgeable";
        break;
      case 276:
        uint64_t result = "kDYFEMTLTexture_isAliasable";
        break;
      case 277:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_error";
        break;
      case 278:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_completionHandler";
        break;
      case 279:
        uint64_t result = "kDYFEMTLHeap_maxAvailableSizeWithAlignment";
        break;
      case 280:
        uint64_t result = "kDYFEMTLBuffer_newTiledTextureWithDescriptor_offset_bytesPerRow";
        break;
      case 281:
        uint64_t result = "kDYFEMTLBuffer_addDebugMarker_range";
        break;
      case 282:
        uint64_t result = "kDYFEMTLBuffer_removeAllDebugMarkers";
        break;
      case 283:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithImageFilterFunctionsSPI_imageFilterFunctionInfo_error";
        break;
      case 284:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setStageInRegion";
        break;
      case 285:
        uint64_t result = "kDYFEMTLDevice_newTextureLayoutWithDescriptor_isHeapOrBufferBacked";
        break;
      case 286:
        uint64_t result = "kDYFEMTLBuffer_newLinearTextureWithDescriptor_offset_bytesPerRow_bytesPerImage";
        break;
      case 287:
        uint64_t result = "kDYFEMTLTextureLayout_dealloc";
        break;
      case 288:
        uint64_t result = "kDYFEMTLDevice_newTextureWithBytesNoCopy_length_descriptor_deallocator";
        break;
      case 289:
        uint64_t result = "kDYFEMTLDevice_newDefaultLibraryWithBundle_error";
        break;
      case 290:
        uint64_t result = "kDYFEMTLTexture_formattedDescription";
        break;
      case 291:
        uint64_t result = "kDYFEMTLDevice_minLinearTextureAlignmentForPixelFormat";
        break;
      case 292:
        uint64_t result = "kDYFEMTLComputePipelineState_getComputeKernelTelemetryID";
        break;
      case 293:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_error";
        break;
      case 294:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_options_reflection_error";
        break;
      case 295:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_completionHandler";
        break;
      case 296:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler";
        break;
      case 297:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBuffers_offsets_withRange";
        break;
      case 298:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileTextures_withRange";
        break;
      case 299:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerStates_withRange";
        break;
      case 300:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 301:
        uint64_t result = "kDYFEMTLLibrary_setOverrideTriple";
        break;
      case 302:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_error";
        break;
      case 303:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler";
        break;
      case 304:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setThreadgroupMemoryLength_atIndex";
        break;
      case 305:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreadsWithIndirectBuffer_indirectBufferOffset";
        break;
      case 306:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreads_threadsPerThreadgroup";
        break;
      case 307:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setViewports_count";
        break;
      case 308:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setScissorRects_count";
        break;
      case 309:
        uint64_t result = "kDYFEMTLDevice_newPipelineLibraryWithFilePath_error";
        break;
      case 310:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setThreadgroupMemoryLength_offset_atIndex";
        break;
      case 311:
        uint64_t result = "kDYFEMTLCaptureScope_setLabel";
        break;
      case 312:
        uint64_t result = "kDYFEMTLCaptureScope_dealloc";
        break;
      case 313:
        uint64_t result = "kDYFEMTLCaptureScope_beginScope";
        break;
      case 314:
        uint64_t result = "kDYFEMTLCaptureScope_endScope";
        break;
      case 315:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithDevice";
        break;
      case 316:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithCommandQueue";
        break;
      case 317:
        uint64_t result = "kDYFEMTLCaptureManager_stopCapture";
        break;
      case 318:
        uint64_t result = "kDYFEMTLDevice_startCollectingPipelineDescriptors";
        break;
      case 319:
        uint64_t result = "kDYFEMTLCommandBuffer_pushDebugGroup";
        break;
      case 320:
        uint64_t result = "kDYFEMTLCommandBuffer_popDebugGroup";
        break;
      case 321:
        uint64_t result = "kDYFEMTLArgumentEncoder_setLabel";
        break;
      case 322:
        uint64_t result = "kDYFEMTLArgumentEncoder_dealloc";
        break;
      case 323:
        uint64_t result = "kDYFEMTLArgumentEncoder_setArgumentBuffer_offset";
        break;
      case 324:
        uint64_t result = "kDYFEMTLArgumentEncoder_setBuffer_offset_atIndex";
        break;
      case 325:
        uint64_t result = "kDYFEMTLArgumentEncoder_setBuffers_offsets_withRange";
        break;
      case 326:
        uint64_t result = "kDYFEMTLArgumentEncoder_setTexture_atIndex";
        break;
      case 327:
        uint64_t result = "kDYFEMTLArgumentEncoder_setTextures_withRange";
        break;
      case 328:
        uint64_t result = "kDYFEMTLArgumentEncoder_setSamplerState_atIndex";
        break;
      case 329:
        uint64_t result = "kDYFEMTLArgumentEncoder_setSamplerStates_withRange";
        break;
      case 330:
        uint64_t result = "kDYFEMTLArgumentEncoder_constantDataAtIndex";
        break;
      case 331:
        uint64_t result = "kDYFEMTLArgumentEncoder_newArgumentEncoderForBufferAtIndex";
        break;
      case 332:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex";
        break;
      case 333:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection";
        break;
      case 334:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithArguments_count";
        break;
      case 335:
        uint64_t result = "kDYFEMTLDevice_newArgumentBufferLayoutWithStructType";
        break;
      case 336:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithLayout";
        break;
      case 337:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResource_usage";
        break;
      case 338:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResources_count_usage";
        break;
      case 339:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useHeap";
        break;
      case 340:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useHeaps_count";
        break;
      case 341:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResource_usage";
        break;
      case 342:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResources_count_usage";
        break;
      case 343:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeap";
        break;
      case 344:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeaps_count";
        break;
      case 345:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithURL_error";
        break;
      case 346:
        uint64_t result = "kDYFEMTLLibrary_newExternFunctionWithName";
        break;
      case 347:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithArguments";
        break;
      case 348:
        uint64_t result = "kDYFEMTLDevice_indirectArgumentBufferDecodingData";
        break;
      case 349:
        uint64_t result = "kDYFEMTLDevice_setIndirectArgumentBufferDecodingData";
        break;
      case 350:
        uint64_t result = "kDYFEMTLCaptureManager_notifySubmissionForEyeSPI_iosurface_bounds_submitFlags";
        break;
      case 351:
        uint64_t result = "kDYFEMTLArgumentEncoder_setArgumentBuffer_startOffset_arrayElement";
        break;
      case 352:
        uint64_t result = "kDYFEMTLTextureLayout_initializeTextureMemory";
        break;
      case 353:
        uint64_t result = "kDYFEMTLDevice_newTiledTextureWithBytesNoCopy_length_descriptor_offset_bytesPerRow";
        break;
      case 354:
        uint64_t result = "kDYFEMTLDevice_newTiledTextureWithBytesNoCopy_length_deallocator_descriptor_offset_bytesPerRow";
        break;
      case 355:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithCIFilters_imageFilterFunctionInfo_error";
        break;
      case 356:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setColorStoreActionOptions_atIndex";
        break;
      case 357:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setDepthStoreActionOptions";
        break;
      case 358:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setStencilStoreActionOptions";
        break;
      case 359:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setColorStoreActionOptions_atIndex";
        break;
      case 360:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthStoreActionOptions";
        break;
      case 361:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilStoreActionOptions";
        break;
      case 362:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorStoreActionOptions_atIndex";
        break;
      case 363:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthStoreActionOptions";
        break;
      case 364:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilStoreActionOptions";
        break;
      case 365:
        uint64_t result = "kDYFEMTLCaptureManager_notifyPostPresentHandoffSPI";
        break;
      case 366:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithCIFiltersForComputePipeline_imageFilterFunctionInfo_error";
        break;
      case 367:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setStageInRegionWithIndirectBuffer_indirectBufferOffset";
        break;
      case 368:
        uint64_t result = "kDYFEMTLDevice_newIndirectRenderCommandEncoderWithBuffer";
        break;
      case 369:
        uint64_t result = "kDYFEMTLDevice_newIndirectComputeCommandEncoderWithBuffer";
        break;
      case 370:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithDispatchType";
        break;
      case 371:
        uint64_t result = "kDYFEMTLCommandBuffer_videoCommandEncoder";
        break;
      case 372:
        uint64_t result = "kDYFEMTLCommandBuffer_doCorruptCBSPI";
        break;
      case 373:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useComputePipelineState";
        break;
      case 374:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useComputePipelineStates_count";
        break;
      case 375:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_memoryBarrierWithScope";
        break;
      case 376:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_memoryBarrierWithResources_count";
        break;
      case 377:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useRenderPipelineState";
        break;
      case 378:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useRenderPipelineStates_count";
        break;
      case 379:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_executeCommandsInBuffer_startIndex";
        break;
      case 380:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_memoryBarrierWithScope_afterStages_beforeStages";
        break;
      case 381:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_memoryBarrierWithResources_count_afterStages_beforeStages";
        break;
      case 382:
        uint64_t result = "kDYFEMTLArgumentEncoder_setRenderPipelineState_atIndex";
        break;
      case 383:
        uint64_t result = "kDYFEMTLArgumentEncoder_setRenderPipelineStates_withRange";
        break;
      case 384:
        uint64_t result = "kDYFEMTLArgumentEncoder_setComputePipelineState_atIndex";
        break;
      case 385:
        uint64_t result = "kDYFEMTLArgumentEncoder_setComputePipelineStates_withRange";
        break;
      case 386:
        uint64_t result = "kDYFEMTLDevice_minimumTextureBufferAlignmentForPixelFormat";
        break;
      case 387:
        uint64_t result = "kDYFEMTLDevice_newEvent";
        break;
      case 388:
        uint64_t result = "kDYFEMTLDevice_newSharedEvent";
        break;
      case 389:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForGPUAccess";
        break;
      case 390:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForGPUAccess_slice_level";
        break;
      case 391:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForCPUAccess";
        break;
      case 392:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForCPUAccess_slice_level";
        break;
      case 393:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeWaitForEvent_value";
        break;
      case 394:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeSignalEvent_value";
        break;
      case 395:
        uint64_t result = "kDYFEMTLComputePipelineState_resourceIndex";
        break;
      case 396:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setPointSize";
        break;
      case 397:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setClipPlane_p2_p3_p4_atIndex";
        break;
      case 398:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerState_lodMinClamp_lodMaxClamp_lodBias_atIndex";
        break;
      case 399:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerState_lodMinClamp_lodMaxClamp_lodBias_atIndex";
        break;
      case 400:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setPrimitiveRestartEnabled_index";
        break;
      case 401:
        uint64_t result = "kDYFEMTLSamplerState_resourceIndex";
        break;
      case 402:
        uint64_t result = "kDYFEMTLSharedTextureHandle_dealloc";
        break;
      case 403:
        uint64_t result = "kDYFEMTLTexture_newSharedHandle";
        break;
      case 404:
        uint64_t result = "kDYFEMTLDevice_newSharedTextureWithDescriptor";
        break;
      case 405:
        uint64_t result = "kDYFEMTLDevice_newSharedTextureWithHandle";
        break;
      case 406:
        uint64_t result = "kDYFEMTLDevice_tileSizeWithTextureType_pixelFormat_sampleCount";
        break;
      case 407:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_"
                 "countersBufferOffset";
        break;
      case 408:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resetTextureAccessCounters_region_mipLevel_slice";
        break;
      case 409:
        uint64_t result = "kDYFEMTLSharedEvent_setSignaledValue";
        break;
      case 410:
        uint64_t result = "kDYFEMTLSharedEvent_setLabel";
        break;
      case 411:
        uint64_t result = "kDYFEMTLSharedEvent_dealloc";
        break;
      case 412:
        uint64_t result = "kDYFEMTLDevice_newIndirectCommandBufferWithDescriptor_maxCount_options";
        break;
      case 413:
        uint64_t result = "kDYFEMTLDevice_reserveResourceIndicesForResourceType_indices_indexCount";
        break;
      case 414:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setPrimitiveRestartEnabled";
        break;
      case 415:
        uint64_t result = "kDYFEMTLDevice_newIndirectCommandBufferWithDescriptor_maxCommandCount_options";
        break;
      case 416:
        uint64_t result = "kDYFEMTLDevice_getIndirectCommandBufferHeaderSize";
        break;
      case 417:
        uint64_t result = "kDYFEMTLCommandBuffer_addPurgedResource";
        break;
      case 418:
        uint64_t result = "kDYFEMTLCommandBuffer_addPurgedHeap";
        break;
      case 419:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeCommandsInBuffer_startIndex";
        break;
      case 420:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeCommandsInBuffer_withRange";
        break;
      case 421:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset";
        break;
      case 422:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_executeCommandsInBuffer_withRange";
        break;
      case 423:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset";
        break;
      case 424:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resetCommandsInBuffer_withRange";
        break;
      case 425:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex";
        break;
      case 426:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeIndirectCommandBuffer_withRange";
        break;
      case 427:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_dealloc";
        break;
      case 428:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setRenderPipelineState";
        break;
      case 429:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setVertexBuffer_offset_atIndex";
        break;
      case 430:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setFragmentBuffer_offset_atIndex";
        break;
      case 431:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset"
                 "_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorB"
                 "ufferInstanceStride_tessellationFactorBufferScale";
        break;
      case 432:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset"
                 "_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorB"
                 "ufferInstanceStride";
        break;
      case 433:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffe"
                 "rOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFa"
                 "ctorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_tessellationFactorBufferScale";
        break;
      case 434:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffe"
                 "rOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFa"
                 "ctorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride";
        break;
      case 435:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance";
        break;
      case 436:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_"
                 "instanceCount_baseVertex_baseInstance";
        break;
      case 437:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_nop";
        break;
      case 438:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_end";
        break;
      case 439:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setTessellationFactorBuffer_offset_instanceStride";
        break;
      case 440:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setTessellationFactorScale";
        break;
      case 441:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset"
                 "_instanceCount_baseInstance";
        break;
      case 442:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffe"
                 "rOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance";
        break;
      case 443:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_dispatchThreadsPerTile";
        break;
      case 444:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setVertexArgument_offset_atIndex";
        break;
      case 445:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setFragmentArgument_offset_atIndex";
        break;
      case 446:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setTileArgument_offset_atIndex";
        break;
      case 447:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setThreadgroupMemoryLength_offset_atIndex";
        break;
      case 448:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_endIndirectCommandBuffer";
        break;
      case 449:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_dealloc";
        break;
      case 450:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setComputePipelineState";
        break;
      case 451:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setKernelBuffer_offset_atIndex";
        break;
      case 452:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_dispatchThreadgroups_threadsPerThreadgroup";
        break;
      case 453:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_concurrentDispatchThreadgroups_threadsPerThreadgroup";
        break;
      case 454:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_nop";
        break;
      case 455:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_endIndirectCommandBuffer";
        break;
      case 456:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setKernelArgument_offset_atIndex";
        break;
      case 457:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setThreadgroupMemoryLength_atIndex";
        break;
      case 458:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setStageInRegion";
        break;
      case 459:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_setLabel";
        break;
      case 460:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_setResponsibleProcess";
        break;
      case 461:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_dealloc";
        break;
      case 462:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_indirectRenderCommandAtIndex";
        break;
      case 463:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_indirectComputeCommandAtIndex";
        break;
      case 464:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_setPurgeableState";
        break;
      case 465:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_makeAliasable";
        break;
      case 466:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_isAliasable";
        break;
      case 467:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_isPurgeable";
        break;
      case 468:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIndirectCommandBuffer_atIndex";
        break;
      case 469:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIndirectCommandBuffers_withRange";
        break;
      case 470:
        uint64_t result = "kDYFEMTLBuffer_newRemoteBufferViewForDevice";
        break;
      case 471:
        uint64_t result = "kDYFEMTLTexture_newRemoteTextureViewForDevice";
        break;
      case 472:
        uint64_t result = "kDYFEMTLDevice_newSharedEventWithMachPort";
        break;
      case 473:
        uint64_t result = "kDYFEMTLSharedEvent_eventPort";
        break;
      case 474:
        uint64_t result = "kDYFEMTLTexture_newSharedTextureHandle";
        break;
      case 475:
        uint64_t result = "kDYFEMTLDevice_newSharedEventWithHandle";
        break;
      case 476:
        uint64_t result = "kDYFEMTLCommandBuffer_commitAndWaitUntilSubmitted";
        break;
      case 477:
        uint64_t result = "kDYFEMTLSharedEvent_newSharedEventHandle";
        break;
      case 478:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_reset";
        break;
      case 479:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_reset";
        break;
      case 480:
        uint64_t result = "kDYFEMTLBuffer_containsResource";
        break;
      case 481:
        uint64_t result = "kDYFEMTLTexture_containsResource";
        break;
      case 482:
        uint64_t result = "kDYFEMTLDevice_supportsPrimitiveType";
        break;
      case 483:
        uint64_t result = "kDYFEMTLDevice_startCollectingPipelineDescriptorsUsingPrefixForNames";
        break;
      case 484:
        uint64_t result = "kDYFEMTLDevice_newResourceGroupFromResources_count";
        break;
      case 485:
        uint64_t result = "kDYFEMTLCommandBuffer_sampledComputeCommandEncoderWithDispatchType_programInfoBuffer_capacity";
        break;
      case 486:
        uint64_t result = "kDYFEMTLCommandBuffer_setResourceGroups_count";
        break;
      case 487:
        uint64_t result = "kDYFEMTLCommandBuffer_dropResourceGroups_count";
        break;
      case 488:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_resetWithRange";
        break;
      case 489:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_containsResource";
        break;
      case 490:
        uint64_t result = "kDYFEMTLTexture_isShareable";
        break;
      case 491:
        uint64_t result = "kDYFEMTLMotionEstimationPipeline_dealloc";
        break;
      case 492:
        uint64_t result = "kDYFEMTLDevice_motionEstimatorCapabilities";
        break;
      case 493:
        uint64_t result = "kDYFEMTLDevice_newMotionEstimationPipelineWithDescriptor";
        break;
      case 494:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_setLabel";
        break;
      case 495:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_dealloc";
        break;
      case 496:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_setMotionEstimationPipeline";
        break;
      case 497:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_generateMotionVectorsForTexture_previousTexture_resultBuffer_bufferOffset";
        break;
      case 498:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_waitForFence";
        break;
      case 499:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_updateFence";
        break;
      case 500:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_endEncoding";
        break;
      case 501:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_insertDebugSignpost";
        break;
      case 502:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_pushDebugGroup";
        break;
      case 503:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_popDebugGroup";
        break;
      case 504:
        uint64_t result = "kDYFEMTLEvent_setLabel";
        break;
      case 505:
        uint64_t result = "kDYFEMTLEvent_dealloc";
        break;
      case 506:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinati"
                 "onLevel_sliceCount_levelCount";
        break;
      case 507:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_toTexture";
        break;
      case 508:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resolveCountersWithIndexRange_sampleBuffer_resolvedBuffer";
        break;
      case 509:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_sampleCountersInBuffer_atIndex_allowOverlap";
        break;
      case 510:
        uint64_t result = "kDYFEMTLBuffer_setResourceIndex";
        break;
      case 511:
        uint64_t result = "kDYFEMTLCommandBuffer_debugBufferContentsWithLength";
        break;
      case 512:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeCacheControlFinalizeOperation_resourceGroups_count";
        break;
      case 513:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeCacheControlTagOperation_resourceGroups_count";
        break;
      case 514:
        uint64_t result = "kDYFEMTLCommandBuffer_resourceStateCommandEncoder";
        break;
      case 515:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_sampleCountersInBuffer_atIndex_allowOverlap";
        break;
      case 516:
        uint64_t result = "kDYFEMTLComputePipelineState_setResourceIndex";
        break;
      case 517:
        uint64_t result = "kDYFEMTLCounterSampleBuffer_dealloc";
        break;
      case 518:
        uint64_t result = "kDYFEMTLDeserializationContext_dealloc";
        break;
      case 519:
        uint64_t result = "kDYFEMTLDeserializationContext_functionWithFunctionRef";
        break;
      case 520:
        uint64_t result = "kDYFEMTLDevice_setCurrentUtilityBufferIndex";
        break;
      case 521:
        uint64_t result = "kDYFEMTLDevice_setResourceIndirectionEnabled";
        break;
      case 522:
        uint64_t result = "kDYFEMTLDevice_setUtilityBuffers";
        break;
      case 523:
        uint64_t result = "kDYFEMTLDevice_addBufferToGlobalResourceTable";
        break;
      case 524:
        uint64_t result = "kDYFEMTLDevice_addComputePipelineStateToGlobalResourceTable";
        break;
      case 525:
        uint64_t result = "kDYFEMTLDevice_addIndirectCommandBufferToGlobalResourceTable";
        break;
      case 526:
        uint64_t result = "kDYFEMTLDevice_addRenderPipelineStateToGlobalResourceTable";
        break;
      case 527:
        uint64_t result = "kDYFEMTLDevice_addSamplerStateToGlobalResourceTable";
        break;
      case 528:
        uint64_t result = "kDYFEMTLDevice_addTextureToGlobalResourceTable";
        break;
      case 529:
        uint64_t result = "kDYFEMTLDevice_allowLibrariesFromOtherPlatforms";
        break;
      case 530:
        uint64_t result = "kDYFEMTLDevice_createNewUtilityBuffer";
        break;
      case 531:
        uint64_t result = "kDYFEMTLDevice_describeCounter";
        break;
      case 532:
        uint64_t result = "kDYFEMTLDevice_indirectBufferAddressForResourceIndex_offset";
        break;
      case 533:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytes_length_options_atResourceIndex";
        break;
      case 534:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytesNoCopy_length_options_atResourceIndex_deallocator";
        break;
      case 535:
        uint64_t result = "kDYFEMTLDevice_newBufferWithLength_options_atResourceIndex";
        break;
      case 536:
        uint64_t result = "kDYFEMTLDevice_newCounterSampleBufferWithDescriptor_error";
        break;
      case 537:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithImageFilterFunctionsSPI_imageFilterFunctionInfo_error";
        break;
      case 538:
        uint64_t result = "kDYFEMTLDevice_newRasterizationRateMapWithScreenSize_layerCount_layers";
        break;
      case 539:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineDescriptorWithSerializedData_deserializationContext";
        break;
      case 540:
        uint64_t result = "kDYFEMTLDevice_offsetFromIndirectBufferAddress";
        break;
      case 541:
        uint64_t result = "kDYFEMTLDevice_pollSampleBuffer_resolvedBuffer";
        break;
      case 542:
        uint64_t result = "kDYFEMTLDevice_removeResourceFromGlobalResourceTable_resourceType";
        break;
      case 543:
        uint64_t result = "kDYFEMTLDevice_requiresIndirectionForAllResourceTypes";
        break;
      case 544:
        uint64_t result = "kDYFEMTLDevice_resolveCountersWithIndexRange_sampleBuffer";
        break;
      case 545:
        uint64_t result = "kDYFEMTLDevice_resourceIndexFromIndirectBufferAddress";
        break;
      case 546:
        uint64_t result = "kDYFEMTLDevice_sampleCountersAtInterval_sampleBuffer_error";
        break;
      case 547:
        uint64_t result = "kDYFEMTLDevice_sampleTimeStamps_gpuTimeStamp";
        break;
      case 548:
        uint64_t result = "kDYFEMTLDevice_serializeRenderPipelineDescriptor";
        break;
      case 549:
        uint64_t result = "kDYFEMTLDevice_setGPUAssertionsEnabled";
        break;
      case 550:
        uint64_t result = "kDYFEMTLDevice_setResourcesPurgeableState_newState_oldState_count";
        break;
      case 551:
        uint64_t result = "kDYFEMTLDevice_useDeviceResourceTableForType";
        break;
      case 552:
        uint64_t result = "kDYFEMTLDevice_utilityBufferForComputeCommandEncoder";
        break;
      case 553:
        uint64_t result = "kDYFEMTLDevice_utilityBufferForRenderCommandEncoder";
        break;
      case 554:
        uint64_t result = "kDYFEMTLFunction_newFunctionWithPluginData_bitcodeType";
        break;
      case 555:
        uint64_t result = "kDYFEMTLHeap_newBufferWithLength_options_atOffset";
        break;
      case 556:
        uint64_t result = "kDYFEMTLHeap_newTextureWithDescriptor_atOffset";
        break;
      case 557:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_clearBarrier";
        break;
      case 558:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_concurrentDispatchThreads_threadsPerThreadgroup";
        break;
      case 559:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setBarrier";
        break;
      case 560:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setImageBlockWidth_height";
        break;
      case 561:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_sampleCountersInBuffer_atIndex_allowOverlap";
        break;
      case 562:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexAmplificationCount_viewMappings";
        break;
      case 563:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeap_stages";
        break;
      case 564:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeaps_count_stages";
        break;
      case 565:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResource_usage_stages";
        break;
      case 566:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResources_count_usage_stages";
        break;
      case 567:
        uint64_t result = "kDYFEMTLRenderPipelineState_setResourceIndex";
        break;
      case 568:
        uint64_t result = "kDYFEMTLSamplerState_setResourceIndex";
        break;
      case 569:
        uint64_t result = "kDYFEMTLTexture_setResourceIndex";
        break;
      case 570:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineDescriptorWithSerializedData_deserializationContext";
        break;
      case 571:
        uint64_t result = "kDYFEMTLDevice_serializeComputePipelineDescriptor";
        break;
      case 572:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexAmplificationMode_value";
        break;
      case 573:
        uint64_t result = "kDYFEMTLCommandQueue_getBackgroundGPUPriority";
        break;
      case 574:
        uint64_t result = "kDYFEMTLCommandQueue_getGPUPriority";
        break;
      case 575:
        uint64_t result = "kDYFEMTLCommandQueue_setBackgroundGPUPriority";
        break;
      case 576:
        uint64_t result = "kDYFEMTLCommandQueue_setBackgroundGPUPriority_offset";
        break;
      case 577:
        uint64_t result = "kDYFEMTLCommandQueue_setCompletionQueue";
        break;
      case 578:
        uint64_t result = "kDYFEMTLCommandQueue_setGPUPriority";
        break;
      case 579:
        uint64_t result = "kDYFEMTLCommandQueue_setGPUPriority_offset";
        break;
      case 580:
        uint64_t result = "kDYFEMTLCommandQueue_setSubmissionQueue";
        break;
      case 581:
        uint64_t result = "kDYFEMTLRasterizationRateMap_copyParameterDataToBuffer_atOffset";
        break;
      case 582:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset";
        break;
      case 583:
        uint64_t result = "kDYFEMTLRasterizationRateMap_dealloc";
        break;
      case 584:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateTextureMapping_mode_region_mipLevel_slice";
        break;
      case 585:
        uint64_t result = "kDYFEMTLRasterizationRateMap_physicalCoordinate_forLayer";
        break;
      case 586:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateTextureMappings_mode_regions_mipLevels_slices_numRegions";
        break;
      case 587:
        uint64_t result = "kDYFEMTLRasterizationRateMap_physicalSizeForLayer";
        break;
      case 588:
        uint64_t result = "kDYFEMTLDevice_tileSizeWithSparsePageSize_textureType_pixelFormat_sampleCount";
        break;
      case 589:
        uint64_t result = "kDYFEMTLRasterizationRateMap_screenCoordinate_forLayer";
        break;
      case 590:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_setLabel";
        break;
      case 591:
        uint64_t result = "kDYFEMTLDevice_newRasterizationRateMapWithDescriptor";
        break;
      case 592:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_copyMappingStateFromTexture_mipLevel_slice_toBuffer_offset_numTiles";
        break;
      case 593:
        uint64_t result = "kDYFEMTLDevice_supportsRasterizationRateMapWithLayerCount";
        break;
      case 594:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_dealloc";
        break;
      case 595:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_endEncoding";
        break;
      case 596:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_insertDebugSignpost";
        break;
      case 597:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_popDebugGroup";
        break;
      case 598:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_pushDebugGroup";
        break;
      case 599:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateFence";
        break;
      case 600:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset";
        break;
      case 601:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateTextureMapping_mode_region_mipLevel_slice";
        break;
      case 602:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateTextureMappings_mode_regions_mipLevels_slices_numRegions";
        break;
      case 603:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_waitForFence";
        break;
      case 604:
        uint64_t result = "kDYFEMTLDevice_supportsFamily";
        break;
      case 605:
        uint64_t result = "kDYFEMTLDevice_supportsVersion";
        break;
      case 606:
        uint64_t result = "kDYFEMTLHeap_newBufferWithLength_options_offset";
        break;
      case 607:
        uint64_t result = "kDYFEMTLHeap_newTextureWithDescriptor_offset";
        break;
      case 608:
        uint64_t result = "kDYFEMTLRasterizationRateMap_copyParameterDataToBuffer_offset";
        break;
      case 609:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle";
        break;
      case 610:
        uint64_t result = "kDYFEMTLDevice_newPrecompiledComputePipelineStateWithDescriptor_options_pipelineCache_completionHandler";
        break;
      case 611:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setImageblockWidth_height";
        break;
      case 612:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_functionCache_error";
        break;
      case 613:
        uint64_t result = "kDYFEMTLRasterizationRateMap_mapPhysicalToScreenCoordinates_forLayer";
        break;
      case 614:
        uint64_t result = "kDYFEMTLRasterizationRateMap_mapScreenToPhysicalCoordinates_forLayer";
        break;
      case 615:
        uint64_t result = "kDYFEMTLResourceGroup_dealloc";
        break;
      case 616:
        uint64_t result = "kDYFEMTLBuffer_isComplete";
        break;
      case 617:
        uint64_t result = "kDYFEMTLBuffer_waitUntilComplete";
        break;
      case 618:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_doesAliasAllResources_count";
        break;
      case 619:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_doesAliasAnyResources_count";
        break;
      case 620:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_doesAliasResource";
        break;
      case 621:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_isComplete";
        break;
      case 622:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_waitUntilComplete";
        break;
      case 623:
        uint64_t result = "kDYFEMTLTexture_isComplete";
        break;
      case 624:
        uint64_t result = "kDYFEMTLTexture_waitUntilComplete";
        break;
      case 625:
        uint64_t result = "kDYFEMTLDevice_convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions";
        break;
      case 626:
        uint64_t result = "kDYFEMTLDevice_convertSparseTileRegions_toPixelRegions_withTileSize_numRegions";
        break;
      case 627:
        uint64_t result = "kDYFEMTLDevice_supportsVertexAmplificationCount";
        break;
      case 628:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resolveCounters_inRange_destinationBuffer_destinationOffset";
        break;
      case 629:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 630:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 631:
        uint64_t result = "kDYFEMTLCounterSampleBuffer_resolveCounterRange";
        break;
      case 632:
        uint64_t result = "kDYFEMTLCounterSet_dealloc";
        break;
      case 633:
        uint64_t result = "kDYFEMTLDevice_sampleTimestamps_gpuTimestamp";
        break;
      case 634:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 635:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeWaitForEvent_value_timeout";
        break;
      case 636:
        uint64_t result = "kDYFEMTLCounter_dealloc";
        break;
      case 637:
        uint64_t result = "kDYFEMTLDevice_copyShaderCacheToPath";
        break;
      case 638:
        uint64_t result = "kDYFEMTLDevice_serializeStructType_version";
        break;
      case 639:
        uint64_t result = "kDYFEMTLPipelineCache_dealloc";
        break;
      case 640:
        uint64_t result = "kDYFEMTLPipelineLibrary_setDisableRunTimeCompilation";
        break;
      case 641:
        uint64_t result = "kDYFEMTLPipelineLibrary_setLabel";
        break;
      case 642:
        uint64_t result = "kDYFEMTLPipelineLibrary_dealloc";
        break;
      case 643:
        uint64_t result = "kDYFEMTLPipelineLibrary_newComputePipelineDescriptorWithName_error";
        break;
      case 644:
        uint64_t result = "kDYFEMTLPipelineLibrary_newComputePipelineStateWithName_options_reflection_error";
        break;
      case 645:
        uint64_t result = "kDYFEMTLPipelineLibrary_newRenderPipelineDescriptorWithName_error";
        break;
      case 646:
        uint64_t result = "kDYFEMTLPipelineLibrary_newRenderPipelineStateWithName_options_reflection_error";
        break;
      case 647:
        uint64_t result = "kDYFEMTLDevice_sparseTileSizeWithTextureType_pixelFormat_sampleCount";
        break;
      case 648:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithDescriptor_error";
        break;
      case 649:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithScope";
        break;
      case 650:
        uint64_t result = "kDYFEMTLCaptureManager_newCaptureScopeWithDevice";
        break;
      case 651:
        uint64_t result = "kDYFEMTLCaptureManager_newCaptureScopeWithCommandQueue";
        break;
      case 652:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_enableNullBufferBinds";
        break;
      case 653:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLIR_functionType";
        break;
      case 654:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLIR_inputsDescription_functionType";
        break;
      case 655:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setAlphaTestReferenceValue";
        break;
      case 656:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorResolveTexture_slice_depthPlane_level_yInvert_atIndex";
        break;
      case 657:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthCleared";
        break;
      case 658:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthResolveTexture_slice_depthPlane_level_yInvert";
        break;
      case 659:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setProvokingVertexMode";
        break;
      case 660:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilCleared";
        break;
      case 661:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilResolveTexture_slice_depthPlane_level";
        break;
      case 662:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilResolveTexture_slice_depthPlane_level_yInvert";
        break;
      case 663:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTriangleFrontFillMode_backFillMode";
        break;
      case 664:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setViewportTransformEnabled";
        break;
      case 665:
        uint64_t result = "kDYFEMTLDevice_minLinearTextureBaseAddressAlignmentForDescriptor";
        break;
      case 666:
        uint64_t result = "kDYFEMTLDevice_minLinearTexturePitchAlignmentForDescriptor_mustMatchExactly";
        break;
      case 667:
        uint64_t result = "kDYFEMTLDevice_newBinaryArchiveWithDescriptor_error";
        break;
      case 668:
        uint64_t result = "kDYFEMTLDevice_requiredLinearTextureBytesPerRowForDescriptor";
        break;
      case 669:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_pipelineLibrary";
        break;
      case 670:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection_pipelineLibrary";
        break;
      case 671:
        uint64_t result = "kDYFEMTLFunction_reflectionWithOptions_pipelineLibrary";
        break;
      case 672:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithDispatchType_substreamCount";
        break;
      case 673:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSubstream";
        break;
      case 674:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_signalProgress";
        break;
      case 675:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_waitForProgress";
        break;
      case 676:
        uint64_t result = "kDYFEMTLDevice_maximumComputeSubstreams";
        break;
      case 677:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytes_length_options_gpuAddress";
        break;
      case 678:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytesNoCopy_length_options_gpuAddress_deallocator";
        break;
      case 679:
        uint64_t result = "kDYFEMTLDevice_newBufferWithLength_options_gpuAddress";
        break;
      case 680:
        uint64_t result = "kDYFEMTLDevice_reserveGPUAddressRange";
        break;
      case 681:
        uint64_t result = "kDYFEMTLCommandBuffer_addLoggingForType_handler";
        break;
      case 682:
        uint64_t result = "kDYFEMTLCommandBufferEncoderInfo_dealloc";
        break;
      case 683:
        uint64_t result = "kDYFEMTLCommandQueue_commandBufferWithDescriptor";
        break;
      case 684:
        uint64_t result = "kDYFEMTLComputePipelineState_functionPointerHandleWithFunction";
        break;
      case 685:
        uint64_t result = "kDYFEMTLComputePipelineState_functionPointerHandlesWithFunctions_range";
        break;
      case 686:
        uint64_t result = "kDYFEMTLDevice_setCommandBufferErrorOptions";
        break;
      case 687:
        uint64_t result = "kDYFEMTLDevice_newBinaryLibraryWithOptions_url_error";
        break;
      case 688:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibrary_computeDescriptor_error";
        break;
      case 689:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibrary_error";
        break;
      case 690:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibraryFromURL_error";
        break;
      case 691:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDAG_functions_error";
        break;
      case 692:
        uint64_t result = "kDYFEMTLFunctionLog_dealloc";
        break;
      case 693:
        uint64_t result = "kDYFEMTLStackTraceEntry_dealloc";
        break;
      case 694:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_resourceIndex";
        break;
      case 695:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_resourceIndex";
        break;
      case 696:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_resourceIndex";
        break;
      case 697:
        uint64_t result = "kDYFEMTLBinaryArchive_addComputePipelineStateWithDescriptor_error";
        break;
      case 698:
        uint64_t result = "kDYFEMTLBinaryArchive_addLibrary_computePipelineDescriptor_error";
        break;
      case 699:
        uint64_t result = "kDYFEMTLBinaryArchive_dealloc";
        break;
      case 700:
        uint64_t result = "kDYFEMTLBinaryArchive_writeToURL_error";
        break;
      case 701:
        uint64_t result = "kDYFEMTLBinaryLibrary_setLabel";
        break;
      case 702:
        uint64_t result = "kDYFEMTLBinaryLibrary_addBinaryEntry";
        break;
      case 703:
        uint64_t result = "kDYFEMTLBinaryLibrary_addComputePipelineFunctionsWithDescriptor_error";
        break;
      case 704:
        uint64_t result = "kDYFEMTLBinaryLibrary_dealloc";
        break;
      case 705:
        uint64_t result = "kDYFEMTLBinaryLibrary_getBinaryDataWithKey";
        break;
      case 706:
        uint64_t result = "kDYFEMTLBinaryLibrary_removeComputePipelineFunctionsWithDescriptor_error";
        break;
      case 707:
        uint64_t result = "kDYFEMTLBinaryLibrary_serializeToURL_error";
        break;
      case 708:
        uint64_t result = "kDYFEMTLDynamicLibrary_setLabel";
        break;
      case 709:
        uint64_t result = "kDYFEMTLDynamicLibrary_dealloc";
        break;
      case 710:
        uint64_t result = "kDYFEMTLDynamicLibrary_serializeToURL_error";
        break;
      case 711:
        uint64_t result = "kDYFEMTLCommandBuffer_accelerationStructureCommandEncoder";
        break;
      case 712:
        uint64_t result = "kDYFEMTLDevice_accelerationStructureSizesWithDescriptor";
        break;
      case 713:
        uint64_t result = "kDYFEMTLDevice_loadDynamicLibrariesForComputeDescriptor_error";
        break;
      case 714:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection_binaryArchives";
        break;
      case 715:
        uint64_t result = "kDYFEMTLFunction_reflectionWithOptions_binaryArchives";
        break;
      case 716:
        uint64_t result = "kDYFEMTLBinaryArchive_setLabel";
        break;
      case 717:
        uint64_t result = "kDYFEMTLBinaryArchive_addBinaryEntry_forKey";
        break;
      case 718:
        uint64_t result = "kDYFEMTLBinaryArchive_addComputePipelineFunctionsWithDescriptor_error";
        break;
      case 719:
        uint64_t result = "kDYFEMTLBinaryArchive_addRenderPipelineFunctionsWithDescriptor_error";
        break;
      case 720:
        uint64_t result = "kDYFEMTLBinaryArchive_addTileRenderPipelineFunctionsWithDescriptor_error";
        break;
      case 721:
        uint64_t result = "kDYFEMTLBinaryArchive_getBinaryDataForKey";
        break;
      case 722:
        uint64_t result = "kDYFEMTLBinaryArchive_serializeToURL_error";
        break;
      case 723:
        uint64_t result = "kDYFEMTLAccelerationStructure_setLabel";
        break;
      case 724:
        uint64_t result = "kDYFEMTLAccelerationStructure_setResponsibleProcess";
        break;
      case 725:
        uint64_t result = "kDYFEMTLAccelerationStructure_dealloc";
        break;
      case 726:
        uint64_t result = "kDYFEMTLAccelerationStructure_doesAliasAllResources_count";
        break;
      case 727:
        uint64_t result = "kDYFEMTLAccelerationStructure_doesAliasAnyResources_count";
        break;
      case 728:
        uint64_t result = "kDYFEMTLAccelerationStructure_doesAliasResource";
        break;
      case 729:
        uint64_t result = "kDYFEMTLAccelerationStructure_isAliasable";
        break;
      case 730:
        uint64_t result = "kDYFEMTLAccelerationStructure_isComplete";
        break;
      case 731:
        uint64_t result = "kDYFEMTLAccelerationStructure_isPurgeable";
        break;
      case 732:
        uint64_t result = "kDYFEMTLAccelerationStructure_isWriteComplete";
        break;
      case 733:
        uint64_t result = "kDYFEMTLAccelerationStructure_makeAliasable";
        break;
      case 734:
        uint64_t result = "kDYFEMTLAccelerationStructure_setPurgeableState";
        break;
      case 735:
        uint64_t result = "kDYFEMTLAccelerationStructure_waitUntilComplete";
        break;
      case 736:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setLabel";
        break;
      case 737:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset";
        break;
      case 738:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure";
        break;
      case 739:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure";
        break;
      case 740:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_dealloc";
        break;
      case 741:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeAccelerationStructure_fromBuffer_offset";
        break;
      case 742:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_endEncoding";
        break;
      case 743:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_insertDebugSignpost";
        break;
      case 744:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_popDebugGroup";
        break;
      case 745:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_pushDebugGroup";
        break;
      case 746:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBu"
                 "ffer_scratchBufferOffset";
        break;
      case 747:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 748:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializeAccelerationStructure_toBuffer_offset";
        break;
      case 749:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_updateFence";
        break;
      case 750:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useHeap";
        break;
      case 751:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useHeaps_count";
        break;
      case 752:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useResource_usage";
        break;
      case 753:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useResources_count_usage";
        break;
      case 754:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_waitForFence";
        break;
      case 755:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset";
        break;
      case 756:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_offset";
        break;
      case 757:
        uint64_t result = "kDYFEMTLArgumentEncoder_setAccelerationStructure_atIndex";
        break;
      case 758:
        uint64_t result = "kDYFEMTLArgumentEncoder_setFunctionTable_atIndex";
        break;
      case 759:
        uint64_t result = "kDYFEMTLArgumentEncoder_setFunctionTables_withRange";
        break;
      case 760:
        uint64_t result = "kDYFEMTLCommandQueue_getSPIStats";
        break;
      case 761:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setAccelerationStructure_atBufferIndex";
        break;
      case 762:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setFunctionTable_atIndex";
        break;
      case 763:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setFunctionTables_withRange";
        break;
      case 764:
        uint64_t result = "kDYFEMTLComputePipelineState_functionHandleWithFunction";
        break;
      case 765:
        uint64_t result = "kDYFEMTLComputePipelineState_functionHandlesWithFunctions";
        break;
      case 766:
        uint64_t result = "kDYFEMTLComputePipelineState_newComputePipelineStateWithAdditionalDynamicFunctions";
        break;
      case 767:
        uint64_t result = "kDYFEMTLDevice_compileVisibleFunction_withDescriptor_completionHandler";
        break;
      case 768:
        uint64_t result = "kDYFEMTLDevice_compileVisibleFunction_withDescriptor_error";
        break;
      case 769:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithDescriptor";
        break;
      case 770:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithSize";
        break;
      case 771:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibraryWithURL_error";
        break;
      case 772:
        uint64_t result = "kDYFEMTLDevice_newVisibleFunctionTableWithDescriptor";
        break;
      case 773:
        uint64_t result = "kDYFEMTLDynamicLibrary_serializeToURL_options_error";
        break;
      case 774:
        uint64_t result = "kDYFEMTLFunctionHandle_dealloc";
        break;
      case 775:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithDescriptor_completionHandler";
        break;
      case 776:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithDescriptor_error";
        break;
      case 777:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setLabel";
        break;
      case 778:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setResponsibleProcess";
        break;
      case 779:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_dealloc";
        break;
      case 780:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_doesAliasAllResources_count";
        break;
      case 781:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_doesAliasAnyResources_count";
        break;
      case 782:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_doesAliasResource";
        break;
      case 783:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_isAliasable";
        break;
      case 784:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_isPurgeable";
        break;
      case 785:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_makeAliasable";
        break;
      case 786:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setFunction_atIndex";
        break;
      case 787:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setFunctions_withRange";
        break;
      case 788:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setPurgeableState";
        break;
      case 789:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeAccelerationStructure_fromBuffer_serializedBufferOffset";
        break;
      case 790:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeAccelerationStructure_primitiveAccelerationStruc"
                 "tures_fromBuffer_serializedBufferOffset";
        break;
      case 791:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializeAccelerationStructure_toBuffer_serializedBufferOffset";
        break;
      case 792:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset"
                 "_toBuffer_sizeBufferOffset";
        break;
      case 793:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serial"
                 "izedOffset_toBuffer_sizesBufferOffset";
        break;
      case 794:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset";
        break;
      case 795:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset";
        break;
      case 796:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset";
        break;
      case 797:
        uint64_t result = "kDYFEMTLCommandBuffer_blitCommandEncoderWithDescriptor";
        break;
      case 798:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithDescriptor";
        break;
      case 799:
        uint64_t result = "kDYFEMTLCommandBuffer_resourceStateCommandEncoderWithDescriptor";
        break;
      case 800:
        uint64_t result = "kDYFEMTLCommandBuffer_sampledComputeCommandEncoderWithDescriptor_programInfoBuffer_capacity";
        break;
      case 801:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setIntersectionFunctionTable_atBufferIndex";
        break;
      case 802:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setIntersectionFunctionTables_withBufferRange";
        break;
      case 803:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setVisibleFunctionTable_atBufferIndex";
        break;
      case 804:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setVisibleFunctionTables_withBufferRange";
        break;
      case 805:
        uint64_t result = "kDYFEMTLComputePipelineState_newComputePipelineStateWithAdditionalBinaryFunctions";
        break;
      case 806:
        uint64_t result = "kDYFEMTLComputePipelineState_newVisibleFunctionTableWithDescriptor";
        break;
      case 807:
        uint64_t result = "kDYFEMTLDevice_newIntersectionFunctionTableWithDescriptor";
        break;
      case 808:
        uint64_t result = "kDYFEMTLDevice_supportsCounterSampling";
        break;
      case 809:
        uint64_t result = "kDYFEMTLDevice_supportsTextureWriteFPRoundingMode";
        break;
      case 810:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setGlobalBuffer";
        break;
      case 811:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setGlobalBufferOffset";
        break;
      case 812:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setGlobalBuffer";
        break;
      case 813:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setGlobalBufferOffset";
        break;
      case 814:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setLabel";
        break;
      case 815:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setResponsibleProcess";
        break;
      case 816:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_dealloc";
        break;
      case 817:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_doesAliasAllResources_count";
        break;
      case 818:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_doesAliasAnyResources_count";
        break;
      case 819:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_doesAliasResource";
        break;
      case 820:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isAliasable";
        break;
      case 821:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isComplete";
        break;
      case 822:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isPurgeable";
        break;
      case 823:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isWriteComplete";
        break;
      case 824:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_makeAliasable";
        break;
      case 825:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setFunction_atIndex";
        break;
      case 826:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setFunctions_withRange";
        break;
      case 827:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setPurgeableState";
        break;
      case 828:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_waitUntilComplete";
        break;
      case 829:
        uint64_t result = "kDYFEMTLBinaryArchive_addComputePipelineFunctionsWithDescriptor_options_error";
        break;
      case 830:
        uint64_t result = "kDYFEMTLBinaryArchive_addRenderPipelineFunctionsWithDescriptor_options_error";
        break;
      case 831:
        uint64_t result = "kDYFEMTLBinaryArchive_addTileRenderPipelineFunctionsWithDescriptor_options_error";
        break;
      case 832:
        uint64_t result = "kDYFEMTLAccelerationStructure_setDescriptor";
        break;
      case 833:
        uint64_t result = "kDYFEMTLLibrary_newIntersectionFunctionWithDescriptor_completionHandler";
        break;
      case 834:
        uint64_t result = "kDYFEMTLLibrary_newIntersectionFunctionWithDescriptor_error";
        break;
      case 835:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTable_atBufferIndex";
        break;
      case 836:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTables_withBufferRange";
        break;
      case 837:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTable_atBufferIndex";
        break;
      case 838:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTables_withBufferRange";
        break;
      case 839:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setBuffer_offset_atIndex";
        break;
      case 840:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setBuffers_offsets_withRange";
        break;
      case 841:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setBuffer_offset_atIndex";
        break;
      case 842:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setBuffers_offsets_withRange";
        break;
      case 843:
        uint64_t result = "kDYFEMTLComputePipelineState_newComputePipelineStateWithAdditionalBinaryFunctions_error";
        break;
      case 844:
        uint64_t result = "kDYFEMTLComputePipelineState_newIntersectionFunctionTableWithDescriptor";
        break;
      case 845:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTable_atIndex";
        break;
      case 846:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTables_withRange";
        break;
      case 847:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTable_atIndex";
        break;
      case 848:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTables_withRange";
        break;
      case 849:
        uint64_t result = "kDYFEMTLDevice_supportsTextureWriteRoundingMode";
        break;
      case 850:
        uint64_t result = "kDYFEMTLTexture_didModifyData";
        break;
      case 851:
        uint64_t result = "kDYFEMTLCommandBuffer_setSharedIndirectionTable";
        break;
      case 852:
        uint64_t result = "kDYFEMTLDevice_newPrecompiledRenderPipelineStateWithDescriptor_options_pipelineCache_completionHandler";
        break;
      case 853:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibraryWithURL_options_error";
        break;
      case 854:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueTriangleIntersectionFunctionWithSignature_atIndex";
        break;
      case 855:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueTriangleIntersectionFunctionWithSignature_withRange";
        break;
      case 856:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setValue_atIndex";
        break;
      case 857:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setValue_withRange";
        break;
      case 858:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setVisibleFunctionTable_atBufferIndex";
        break;
      case 859:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setVisibleFunctionTables_withBufferRange";
        break;
      case 860:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerat"
                 "ionStructures_fromBuffer_serializedBufferOffset";
        break;
      case 861:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serial"
                 "izedBufferOffset";
        break;
      case 862:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAcceleratio"
                 "nStructures_toBuffer_serializedBufferOffset";
        break;
      case 863:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset";
        break;
      case 864:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffe"
                 "r_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiv"
                 "eBuffer_primitiveBufferOffset";
        break;
      case 865:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuff"
                 "er_sizesBufferOffset";
        break;
      case 866:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeEndDoWhile_offset_comparison_referenceValue";
        break;
      case 867:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeEndIf";
        break;
      case 868:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeEndWhile";
        break;
      case 869:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartDoWhile";
        break;
      case 870:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartElse";
        break;
      case 871:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartIf_offset_comparison_referenceValue";
        break;
      case 872:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartWhile_offset_comparison_referenceValue";
        break;
      case 873:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_insertCompressedTextureReinterpretationFlush";
        break;
      case 874:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResourceGroup_usage";
        break;
      case 875:
        uint64_t result = "kDYFEMTLDevice_newBufferWithDescriptor";
        break;
      case 876:
        uint64_t result = "kDYFEMTLRelocation_dealloc";
        break;
      case 877:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResourceGroup_usage_stages";
        break;
      case 878:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithSize_resourceIndex";
        break;
      case 879:
        uint64_t result = "kDYFEMTLBuffer_setParentGPUAddress";
        break;
      case 880:
        uint64_t result = "kDYFEMTLBuffer_setParentGPUSize";
        break;
      case 881:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_insertUncompressedToCompressedFlush";
        break;
      case 882:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType";
        break;
      case 883:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeDashboardFinalizeForResourceGroup_dashboard_value_forIndex";
        break;
      case 884:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeDashboardTagForResourceGroup";
        break;
      case 885:
        uint64_t result = "kDYFEMTLDevice_setPluginData";
        break;
      case 886:
        uint64_t result = "kDYFEMTLDevice_loadDynamicLibrariesForComputeDescriptor_options_error";
        break;
      case 887:
        uint64_t result = "kDYFEMTLDevice_loadDynamicLibrariesForFunction_insertLibraries_options_error";
        break;
      case 888:
        uint64_t result = "kDYFEMTLDevice_newLateEvalEvent";
        break;
      case 889:
        uint64_t result = "kDYFEMTLFunctionPointerHandle_dealloc";
        break;
      case 890:
        uint64_t result = "kDYFEMTLFunctionPrivateArgument_dealloc";
        break;
      case 891:
        uint64_t result = "kDYFEMTLFunctionStitchingAttribute_dealloc";
        break;
      case 892:
        uint64_t result = "kDYFEMTLFunctionStitchingNode_dealloc";
        break;
      case 893:
        uint64_t result = "kDYFEMTLLateEvalEvent_setLabel";
        break;
      case 894:
        uint64_t result = "kDYFEMTLLateEvalEvent_setSignaledValue";
        break;
      case 895:
        uint64_t result = "kDYFEMTLLateEvalEvent_dealloc";
        break;
      case 896:
        uint64_t result = "kDYFEMTLLateEvalEvent_newSharedEventHandle";
        break;
      case 897:
        uint64_t result = "kDYFEMTLLibrary_setShaderValidationEnabled";
        break;
      case 898:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dispatchThreadsPerTile_inRegion";
        break;
      case 899:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshAccelerationStructure_atBufferIndex";
        break;
      case 900:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTable_atBufferIndex";
        break;
      case 901:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTables_withBufferRange";
        break;
      case 902:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTable_atBufferIndex";
        break;
      case 903:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTables_withBufferRange";
        break;
      case 904:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectAccelerationStructure_atBufferIndex";
        break;
      case 905:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTable_atBufferIndex";
        break;
      case 906:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTables_withBufferRange";
        break;
      case 907:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTable_atBufferIndex";
        break;
      case 908:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTables_withBufferRange";
        break;
      case 909:
        uint64_t result = "kDYFEMTLDevice_compileVisibleFunction_withDescriptor_destinationBinaryArchive_error";
        break;
      case 910:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillBuffer_range_pattern4";
        break;
      case 911:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillTexture_level_slice_region_bytes_length";
        break;
      case 912:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillTexture_level_slice_region_color";
        break;
      case 913:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillTexture_level_slice_region_color_pixelFormat";
        break;
      case 914:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_invalidateCompressedTexture";
        break;
      case 915:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_invalidateCompressedTexture_slice_level";
        break;
      case 916:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithGraphs_functions_error";
        break;
      case 917:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithGraphsSPI_functions_error";
        break;
      case 918:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerat"
                 "ionStructures_fromBuffer_serializedBufferOffset_withDescriptor";
        break;
      case 919:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serial"
                 "izedBufferOffset_withDescriptor";
        break;
      case 920:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithBuffer_offset";
        break;
      case 921:
        uint64_t result = "kDYFEMTLRenderPipelineState_functionHandleWithFunction_stage";
        break;
      case 922:
        uint64_t result = "kDYFEMTLRenderPipelineState_newIntersectionFunctionTableWithDescriptor_stage";
        break;
      case 923:
        uint64_t result = "kDYFEMTLRenderPipelineState_newRenderPipelineStateWithAdditionalBinaryFunctions_error";
        break;
      case 924:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableWithDescriptor_stage";
        break;
      case 925:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentAccelerationStructure_atBufferIndex";
        break;
      case 926:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentIntersectionFunctionTable_atBufferIndex";
        break;
      case 927:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentIntersectionFunctionTables_withBufferRange";
        break;
      case 928:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentVisibleFunctionTable_atBufferIndex";
        break;
      case 929:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentVisibleFunctionTables_withBufferRange";
        break;
      case 930:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileAccelerationStructure_atBufferIndex";
        break;
      case 931:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileIntersectionFunctionTable_atBufferIndex";
        break;
      case 932:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileIntersectionFunctionTables_withBufferRange";
        break;
      case 933:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileVisibleFunctionTable_atBufferIndex";
        break;
      case 934:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileVisibleFunctionTables_withBufferRange";
        break;
      case 935:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexAccelerationStructure_atBufferIndex";
        break;
      case 936:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexIntersectionFunctionTable_atBufferIndex";
        break;
      case 937:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexIntersectionFunctionTables_withBufferRange";
        break;
      case 938:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexVisibleFunctionTable_atBufferIndex";
        break;
      case 939:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexVisibleFunctionTables_withBufferRange";
        break;
      case 940:
        uint64_t result = "kDYFEMTLRenderPipelineState_fragmentFunctionHandleWithFunction";
        break;
      case 941:
        uint64_t result = "kDYFEMTLRenderPipelineState_newFragmentIntersectionFunctionTableWithDescriptor";
        break;
      case 942:
        uint64_t result = "kDYFEMTLRenderPipelineState_newTileIntersectionFunctionTableWithDescriptor";
        break;
      case 943:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVertexIntersectionFunctionTableWithDescriptor";
        break;
      case 944:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromFragmentStageWithDescriptor";
        break;
      case 945:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromTileStageWithDescriptor";
        break;
      case 946:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromVertexStageWithDescriptor";
        break;
      case 947:
        uint64_t result = "kDYFEMTLRenderPipelineState_tileFunctionHandleWithFunction";
        break;
      case 948:
        uint64_t result = "kDYFEMTLRenderPipelineState_vertexFunctionHandleWithFunction";
        break;
      case 949:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDescriptor_error";
        break;
      case 950:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDescriptorSPI_error";
        break;
      case 951:
        uint64_t result = "kDYFEMTLDevice_getBVHBuilderLock";
        break;
      case 952:
        uint64_t result = "kDYFEMTLDevice_getRawBVHBuilderPtr";
        break;
      case 953:
        uint64_t result = "kDYFEMTLDevice_setRawBVHBuilderPtr";
        break;
      case 954:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLCoreIR_functionType";
        break;
      case 955:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLCoreIR_inputsDescription_functionType";
        break;
      case 956:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLESIR_functionType";
        break;
      case 957:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLESIR_inputsDescription_functionType";
        break;
      case 958:
        uint64_t result = "kDYFEMTLBinaryArchive_addLibraryWithDescriptor_error";
        break;
      case 959:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDescriptor_completionHandler";
        break;
      case 960:
        uint64_t result = "kDYFEMTLLateEvalEvent_waitUntilSignaledValue_timeoutMS";
        break;
      case 961:
        uint64_t result = "kDYFEMTLLibrary_serializeToURL_error";
        break;
      case 962:
        uint64_t result = "kDYFEMTLSharedEvent_waitUntilSignaledValue_timeoutMS";
        break;
      case 963:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithStitchedDescriptor_completionHandler";
        break;
      case 964:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithStitchedDescriptor_error";
        break;
      case 965:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithStitchedDescriptorSPI_error";
        break;
      case 966:
        uint64_t result = "kDYFEMTLDevice_deserializeInstanceAccelerationStructureFromBytes_primitiveAccelerationStructures_withDescriptor";
        break;
      case 967:
        uint64_t result = "kDYFEMTLDevice_deserializePrimitiveAccelerationStructureFromBytes_withDescriptor";
        break;
      case 968:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 969:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObje"
                 "ctThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 970:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 971:
        uint64_t result = "kDYFEMTLRenderPipelineState_setUsesMeshShaderEmulation";
        break;
      case 972:
        uint64_t result = "kDYFEMTLRasterizationRateMap_formattedDescription";
        break;
      case 973:
        uint64_t result = "kDYFEMTLRasterizationRateMap_resetUsingDescriptor";
        break;
      case 974:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeDashboardFinalizeForResourceGroup_dashboard_values_indices_count";
        break;
      case 975:
        uint64_t result = "kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_error";
        break;
      case 976:
        uint64_t result = "kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_options_error";
        break;
      case 977:
        uint64_t result = "kDYFEMTLBinaryArchive_storeMeshRenderPipelineDescriptor";
        break;
      case 978:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler";
        break;
      case 979:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_error";
        break;
      case 980:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler";
        break;
      case 981:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_reflection_error";
        break;
      case 982:
        uint64_t result = "kDYFEMTLDevice_writeMeshShaderEmulatorDataStructureHeader_meshShaderPSO_scalingFactor";
        break;
      case 983:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBuffer_offset_atIndex";
        break;
      case 984:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBufferOffset_atIndex";
        break;
      case 985:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBuffers_offsets_withRange";
        break;
      case 986:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBytes_length_atIndex";
        break;
      case 987:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerState_atIndex";
        break;
      case 988:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 989:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 990:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerStates_withRange";
        break;
      case 991:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshTexture_atIndex";
        break;
      case 992:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshTextures_withRange";
        break;
      case 993:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBuffer_offset_atIndex";
        break;
      case 994:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBufferOffset_atIndex";
        break;
      case 995:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBuffers_offsets_withRange";
        break;
      case 996:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBytes_length_atIndex";
        break;
      case 997:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerState_atIndex";
        break;
      case 998:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 999:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 1000:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerStates_withRange";
        break;
      case 1001:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectTexture_atIndex";
        break;
      case 1002:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectTextures_withRange";
        break;
      case 1003:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectThreadgroupMemoryLength_atIndex";
        break;
      case 1004:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshMaxPrimitiveCount";
        break;
      case 1005:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshMaxVertexCount";
        break;
      case 1006:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshShaderIntermediateBufferSlot";
        break;
      case 1007:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshShaderPSO";
        break;
      case 1008:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshSize";
        break;
      case 1009:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationObjectShaderIntermediateBufferSlot";
        break;
      case 1010:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationObjectShaderPSO";
        break;
      case 1011:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationVertexShaderIntermediateBufferSlot";
        break;
      case 1012:
        uint64_t result = "kDYFEMTLRenderPipelineState_meshFunctionHandleWithFunction";
        break;
      case 1013:
        uint64_t result = "kDYFEMTLRenderPipelineState_newMeshIntersectionFunctionTableWithDescriptor";
        break;
      case 1014:
        uint64_t result = "kDYFEMTLRenderPipelineState_newObjectIntersectionFunctionTableWithDescriptor";
        break;
      case 1015:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromMeshStageWithDescriptor";
        break;
      case 1016:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromObjectStageWithDescriptor";
        break;
      case 1017:
        uint64_t result = "kDYFEMTLRenderPipelineState_objectFunctionHandleWithFunction";
        break;
      case 1018:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBu"
                 "ffer_scratchBufferOffset_options";
        break;
      case 1019:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset";
        break;
      case 1020:
        uint64_t result = "kDYFEMTLCommandBuffer_accelerationStructureCommandEncoderWithDescriptor";
        break;
      case 1021:
        uint64_t result = "kDYFEMTLDevice_deserializeInstanceAccelerationStructure_fromBytes_primitiveAccelerationStructures_withDescriptor";
        break;
      case 1022:
        uint64_t result = "kDYFEMTLDevice_deserializePrimitiveAccelerationStructure_fromBytes_withDescriptor";
        break;
      case 1023:
        uint64_t result = "kDYFEMTLDevice_heapAccelerationStructureSizeAndAlignWithDescriptor";
        break;
      case 1024:
        uint64_t result = "kDYFEMTLDevice_heapAccelerationStructureSizeAndAlignWithSize";
        break;
      case 1025:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithBuffer_offset_resourceIndex";
        break;
      case 1026:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithSize_withDescriptor";
        break;
      case 1027:
        uint64_t result = "kDYFEMTLBuffer__aneIOSurface";
        break;
      case 1028:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithDescriptor";
        break;
      case 1029:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithDescriptor_offset";
        break;
      case 1030:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize";
        break;
      case 1031:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize_offset";
        break;
      case 1032:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize_offset_resourceIndex";
        break;
      case 1033:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize_resourceIndex";
        break;
      case 1034:
        uint64_t result = "kDYFEMTLDevice_newIOCommandQueueWithDescriptor_error";
        break;
      case 1035:
        uint64_t result = "kDYFEMTLDevice_newIOHandleWithURL_compressionType_error";
        break;
      case 1036:
        uint64_t result = "kDYFEMTLDevice_newIOHandleWithURL_error";
        break;
      case 1037:
        uint64_t result = "kDYFEMTLDevice_newPerformanceStateAssertion_error";
        break;
      case 1038:
        uint64_t result = "kDYFEMTLIOCommandBuffer_setStatus";
        break;
      case 1039:
        uint64_t result = "kDYFEMTLIOCommandBuffer_addCompletedHandler";
        break;
      case 1040:
        uint64_t result = "kDYFEMTLIOCommandBuffer_barrier";
        break;
      case 1041:
        uint64_t result = "kDYFEMTLIOCommandBuffer_commit";
        break;
      case 1042:
        uint64_t result = "kDYFEMTLIOCommandBuffer_copyStatusToBuffer_offset";
        break;
      case 1043:
        uint64_t result = "kDYFEMTLIOCommandBuffer_dealloc";
        break;
      case 1044:
        uint64_t result = "kDYFEMTLIOCommandBuffer_encodeSignalEvent_value";
        break;
      case 1045:
        uint64_t result = "kDYFEMTLIOCommandBuffer_encodeWaitForEvent_value";
        break;
      case 1046:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadBuffer_offset_size_handle_handleOffset";
        break;
      case 1047:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadTexture_slice_level_size_bytesPerRow_bytesPerImage_dstOrigin_handle_handleOffset";
        break;
      case 1048:
        uint64_t result = "kDYFEMTLIOCommandBuffer_tryCancel";
        break;
      case 1049:
        uint64_t result = "kDYFEMTLIOCommandBuffer_waitUntilCompleted";
        break;
      case 1050:
        uint64_t result = "kDYFEMTLIOCommandQueue_barrier";
        break;
      case 1051:
        uint64_t result = "kDYFEMTLIOCommandQueue_commandBuffer";
        break;
      case 1052:
        uint64_t result = "kDYFEMTLIOCommandQueue_dealloc";
        break;
      case 1053:
        uint64_t result = "kDYFEMTLIOScratchBuffer_dealloc";
        break;
      case 1054:
        uint64_t result = "kDYFEMTLIOScratchBufferAllocator_allocateScratchBufferWithMinimumSize";
        break;
      case 1055:
        uint64_t result = "kDYFEMTLIOScratchBufferAllocator_dealloc";
        break;
      case 1056:
        uint64_t result = "kDYFEMTLIOHandle_dealloc";
        break;
      case 1057:
        uint64_t result = "kDYFEMTLBinaryArchive_getArchiveIDWithError";
        break;
      case 1058:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable_options";
        break;
      case 1059:
        uint64_t result = "kDYFEMTLEvent_setEnableBarrier";
        break;
      case 1060:
        uint64_t result = "kDYFEMTLLateEvalEvent_setEnableBarrier";
        break;
      case 1061:
        uint64_t result = "kDYFEMTLLibrary_bitCodeListForFunctions";
        break;
      case 1062:
        uint64_t result = "kDYFEMTLLibrary_bitCodeWithHash";
        break;
      case 1063:
        uint64_t result = "kDYFEMTLSharedEvent_setEnableBarrier";
        break;
      case 1064:
        uint64_t result = "kDYFEMTLDeadlineProfile_dealloc";
        break;
      case 1065:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationPrimitiveTopology";
        break;
      case 1066:
        uint64_t result = "kDYFEMTLCommandBuffer_commitWithDeadline";
        break;
      case 1067:
        uint64_t result = "kDYFEMTLDevice_newProfileWithExecutionSize";
        break;
      case 1068:
        uint64_t result = "kDYFEMTLCommandBuffer_commitAndWaitUntilSubmittedWithDeadline";
        break;
      case 1069:
        uint64_t result = "kDYFEMTLDevice_sparseTileSizeInBytesForSparsePageSize";
        break;
      case 1070:
        uint64_t result = "kDYFEMTLDevice_sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize";
        break;
      case 1071:
        uint64_t result = "kDYFEMTLIOCommandBuffer_setLabel";
        break;
      case 1072:
        uint64_t result = "kDYFEMTLIOCommandBuffer_enqueue";
        break;
      case 1073:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset";
        break;
      case 1074:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationO"
                 "rigin_sourceHandle_sourceHandleOffset";
        break;
      case 1075:
        uint64_t result = "kDYFEMTLIOCommandBuffer_signalEvent_value";
        break;
      case 1076:
        uint64_t result = "kDYFEMTLIOCommandBuffer_waitForEvent_value";
        break;
      case 1077:
        uint64_t result = "kDYFEMTLIOCommandQueue_setLabel";
        break;
      case 1078:
        uint64_t result = "kDYFEMTLIOCommandQueue_commandBufferWithUnretainedReferences";
        break;
      case 1079:
        uint64_t result = "kDYFEMTLIOHandle_setLabel";
        break;
      case 1080:
        uint64_t result = "kDYFEMTLIOHandle_decompress_size_offset_stagingBuffer_stagingBufferSize";
        break;
      case 1081:
        uint64_t result = "kDYFEMTLIOHandle_getHandleOffset_offset";
        break;
      case 1082:
        uint64_t result = "kDYFEMTLIOHandle_read_size_offset_stagingBuffer_stagingBufferSize";
        break;
      case 1083:
        uint64_t result = "kDYFEMTLIOHandle_readIntoStagingBuffer_offset_stagingBuffer_stagingBufferSize";
        break;
      case 1084:
        uint64_t result = "kDYFEMTLIOHandle_stagingBufferSize_offset";
        break;
      case 1085:
        uint64_t result = "kDYFEMTLIOScratchBufferAllocator_newScratchBufferWithMinimumSize";
        break;
      case 1086:
        uint64_t result = "kDYFEMTLDevice_getMostCompatibleArchitecture";
        break;
      case 1087:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dispatchThreadsPerTile_inRegion_withRenderTargetArrayIndex";
        break;
      case 1088:
        uint64_t result = "kDYFEMTLDevice_newIOHandleWithURL_compressionMethod_error";
        break;
      case 1089:
        uint64_t result = "kDYFEMTLIOCommandBuffer_addBarrier";
        break;
      case 1090:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset";
        break;
      case 1091:
        uint64_t result = "kDYFEMTLIOCommandBuffer_popDebugGroup";
        break;
      case 1092:
        uint64_t result = "kDYFEMTLIOCommandBuffer_pushDebugGroup";
        break;
      case 1093:
        uint64_t result = "kDYFEMTLIOCommandQueue_enqueueBarrier";
        break;
      case 1094:
        uint64_t result = "kDYFEMTLIOFileHandle_setLabel";
        break;
      case 1095:
        uint64_t result = "kDYFEMTLIOFileHandle_dealloc";
        break;
      case 1096:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationPayloadMemoryLength";
        break;
      case 1097:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset";
        break;
      case 1098:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeConditionalAbortEvent";
        break;
      case 1099:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeSignalEvent_value_agentMask";
        break;
      case 1100:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffer_offset_attributeStride_atIndex";
        break;
      case 1101:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBufferOffset_attributeStride_atIndex";
        break;
      case 1102:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffers_offsets_attributeStrides_withRange";
        break;
      case 1103:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBytes_length_attributeStride_atIndex";
        break;
      case 1104:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupDistributionMode";
        break;
      case 1105:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupDistributionModeWithClusterGroupIndex";
        break;
      case 1106:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupPackingDisabled";
        break;
      case 1107:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setKernelBuffer_offset_attributeStride_atIndex";
        break;
      case 1108:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setVertexBuffer_offset_attributeStride_atIndex";
        break;
      case 1109:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffer_offset_attributeStride_atIndex";
        break;
      case 1110:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBufferOffset_attributeStride_atIndex";
        break;
      case 1111:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffers_offsets_attributeStrides_withRange";
        break;
      case 1112:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBytes_length_attributeStride_atIndex";
        break;
      case 1113:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin"
                 "_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin";
        break;
      case 1114:
        uint64_t result = "kDYFEMTLDevice_setShouldMaximizeConcurrentCompilation";
        break;
      case 1115:
        uint64_t result = "kDYFEMTLDevice_newEventWithOptions";
        break;
      case 1116:
        uint64_t result = "kDYFEMTLDevice_newSharedEventWithOptions";
        break;
      case 1117:
        uint64_t result = "kDYFEMTLDevice_setCompilerProcessesCount";
        break;
      case 1118:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 1119:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 1120:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setMeshBuffer_offset_atIndex";
        break;
      case 1121:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setObjectBuffer_offset_atIndex";
        break;
      case 1122:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setObjectThreadgroupMemoryLength_atIndex";
        break;
      case 1123:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithBufferBinding";
        break;
      case 1124:
        uint64_t result = "kDYFEMTLDevice_newIOFileHandleWithURL_compressionMethod_error";
        break;
      case 1125:
        uint64_t result = "kDYFEMTLDevice_newIOFileHandleWithURL_error";
        break;
      case 1126:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueCurveIntersectionFunctionWithSignature_atIndex";
        break;
      case 1127:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueCurveIntersectionFunctionWithSignature_withRange";
        break;
      case 1128:
        uint64_t result = "kDYFEMTLCommandBuffer_setPrivateLoggingBuffer";
        break;
      case 1129:
        uint64_t result = "kDYFEMTLCommandBuffer_setResponsibleTaskIDs_count";
        break;
      case 1130:
        uint64_t result = "kDYFEMTLCommandBuffer_useResidencySet";
        break;
      case 1131:
        uint64_t result = "kDYFEMTLCommandBuffer_useResidencySets_count";
        break;
      case 1132:
        uint64_t result = "kDYFEMTLCommandQueue_addResidencySet";
        break;
      case 1133:
        uint64_t result = "kDYFEMTLCommandQueue_addResidencySets_count";
        break;
      case 1134:
        uint64_t result = "kDYFEMTLCommandQueue_removeResidencySet";
        break;
      case 1135:
        uint64_t result = "kDYFEMTLCommandQueue_removeResidencySets_count";
        break;
      case 1136:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResidencySet";
        break;
      case 1137:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResidencySets_count";
        break;
      case 1138:
        uint64_t result = "kDYFEMTLDevice_setWritableHeapsEnabled";
        break;
      case 1139:
        uint64_t result = "kDYFEMTLDevice_newResidencySetWithDescriptor_error";
        break;
      case 1140:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResidencySet";
        break;
      case 1141:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResidencySets_count";
        break;
      case 1142:
        uint64_t result = "kDYFEMTLResidencySet_addHeap";
        break;
      case 1143:
        uint64_t result = "kDYFEMTLResidencySet_addHeaps_count";
        break;
      case 1144:
        uint64_t result = "kDYFEMTLResidencySet_addResource";
        break;
      case 1145:
        uint64_t result = "kDYFEMTLResidencySet_addResources_count";
        break;
      case 1146:
        uint64_t result = "kDYFEMTLResidencySet_commitAdds";
        break;
      case 1147:
        uint64_t result = "kDYFEMTLResidencySet_commitRemoves";
        break;
      case 1148:
        uint64_t result = "kDYFEMTLResidencySet_commitResidency";
        break;
      case 1149:
        uint64_t result = "kDYFEMTLResidencySet_containsHeap";
        break;
      case 1150:
        uint64_t result = "kDYFEMTLResidencySet_containsResource";
        break;
      case 1151:
        uint64_t result = "kDYFEMTLResidencySet_countForHeap";
        break;
      case 1152:
        uint64_t result = "kDYFEMTLResidencySet_countForResource";
        break;
      case 1153:
        uint64_t result = "kDYFEMTLResidencySet_dealloc";
        break;
      case 1154:
        uint64_t result = "kDYFEMTLResidencySet_endResidency";
        break;
      case 1155:
        uint64_t result = "kDYFEMTLResidencySet_removeAllHeaps";
        break;
      case 1156:
        uint64_t result = "kDYFEMTLResidencySet_removeAllResources";
        break;
      case 1157:
        uint64_t result = "kDYFEMTLResidencySet_removeHeap";
        break;
      case 1158:
        uint64_t result = "kDYFEMTLResidencySet_removeHeaps_count";
        break;
      case 1159:
        uint64_t result = "kDYFEMTLResidencySet_removeResource";
        break;
      case 1160:
        uint64_t result = "kDYFEMTLResidencySet_removeResources_count";
        break;
      case 1161:
        uint64_t result = "kDYFEMTLResidencySet_requestResidency";
        break;
      case 1162:
        uint64_t result = "kDYFEMTLResidencySet_setCurrentGeneration";
        break;
      case 1163:
        uint64_t result = "kDYFEMTLResidencySet_setExpiredGeneration";
        break;
      case 1164:
        uint64_t result = "kDYFEMTLResidencySet_commit";
        break;
      case 1165:
        uint64_t result = "kDYFEMTLResidencySet_generationForHeap";
        break;
      case 1166:
        uint64_t result = "kDYFEMTLResidencySet_generationForResource";
        break;
      case 1167:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeSignalEventScheduled_value";
        break;
      case 1168:
        uint64_t result = "kDYFEMTLCommandBuffer_setPrivateData";
        break;
      case 1169:
        uint64_t result = "kDYFEMTLCommandBuffer_setPrivateDataOffset";
        break;
      case 1170:
        uint64_t result = "kDYFEMTLDevice_newLogStateWithDescriptor_error";
        break;
      case 1171:
        uint64_t result = "kDYFEMTLLogState_dealloc";
        break;
      case 1172:
        uint64_t result = "kDYFEMTLResidencySet_addAllocation";
        break;
      case 1173:
        uint64_t result = "kDYFEMTLResidencySet_addAllocations_count";
        break;
      case 1174:
        uint64_t result = "kDYFEMTLResidencySet_containsAllocation";
        break;
      case 1175:
        uint64_t result = "kDYFEMTLResidencySet_generationForAllocation";
        break;
      case 1176:
        uint64_t result = "kDYFEMTLResidencySet_removeAllAllocations";
        break;
      case 1177:
        uint64_t result = "kDYFEMTLResidencySet_removeAllocation";
        break;
      case 1178:
        uint64_t result = "kDYFEMTLResidencySet_removeAllocations_count";
        break;
      default:
        uint64_t result = "kDYFEMTLFXTemporalScaler_executionMode";
        break;
    }
  }

  return result;
}

uint64_t GetFuncEnumReceiverType(int a1)
{
  if (a1 > -12545)
  {
    if (a1 > -7169)
    {
      switch(a1)
      {
        case -6144:
        case -6132:
        case -6130:
        case -6105:
        case -6101:
          uint64_t result = 10LL;
          break;
        case -6143:
        case -6141:
        case -6134:
        case -6133:
        case -6131:
        case -6129:
        case -6122:
        case -6119:
        case -6116:
        case -6111:
        case -6110:
        case -6109:
        case -6096:
        case -6095:
LABEL_4:
          uint64_t result = 36LL;
          break;
        case -6142:
        case -6126:
        case -6121:
          uint64_t result = 7LL;
          break;
        case -6140:
        case -6137:
          uint64_t result = 11LL;
          break;
        case -6139:
          uint64_t result = 15LL;
          break;
        case -6138:
        case -6135:
        case -6117:
        case -6115:
          uint64_t result = 8LL;
          break;
        case -6136:
        case -6120:
        case -6112:
        case -6108:
        case -6106:
          uint64_t result = 5LL;
          break;
        case -6128:
        case -6124:
        case -6104:
        case -6103:
          uint64_t result = 9LL;
          break;
        case -6127:
        case -6114:
        case -6113:
        case -6107:
          uint64_t result = 6LL;
          break;
        case -6125:
        case -6123:
        case -6118:
          uint64_t result = 4LL;
          break;
        case -6102:
        case -6100:
          uint64_t result = 14LL;
          break;
        case -6099:
        case -6098:
          uint64_t result = 13LL;
          break;
        case -6097:
          uint64_t result = 12LL;
          break;
        default:
          switch(a1)
          {
            case -7168:
            case -7166:
            case -7165:
            case -7164:
            case -7163:
            case -7162:
            case -7160:
            case -7159:
            case -7154:
            case -7153:
              uint64_t result = 3LL;
              break;
            case -7167:
            case -7161:
            case -7158:
            case -7157:
            case -7156:
              uint64_t result = 2LL;
              break;
            case -7155:
              uint64_t result = 85LL;
              break;
            default:
              switch(a1)
              {
                case -6656:
                case -6655:
                case -6654:
                case -6653:
                case -6652:
                  uint64_t result = 84LL;
                  break;
                default:
LABEL_75:
                  uint64_t result = 0LL;
                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      int v2 = a1 + 10240;
      uint64_t result = 1LL;
      switch(v2)
      {
        case 0:
        case 11:
        case 15:
LABEL_12:
          uint64_t result = 25LL;
          break;
        case 1:
        case 3:
        case 7:
        case 10:
          goto LABEL_4;
        case 2:
        case 4:
        case 6:
        case 8:
        case 9:
        case 13:
        case 18:
        case 28:
        case 35:
        case 36:
        case 39:
        case 42:
        case 55:
        case 76:
LABEL_8:
          uint64_t result = 80LL;
          break;
        case 5:
        case 12:
        case 17:
        case 19:
        case 30:
        case 37:
        case 40:
        case 53:
        case 54:
LABEL_18:
          uint64_t result = 22LL;
          break;
        case 14:
        case 77:
LABEL_50:
          uint64_t result = 75LL;
          break;
        case 20:
        case 41:
        case 48:
        case 56:
        case 68:
        case 75:
LABEL_15:
          uint64_t result = 71LL;
          break;
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 31:
        case 38:
        case 74:
LABEL_25:
          uint64_t result = 57LL;
          break;
        case 26:
        case 49:
        case 69:
        case 78:
LABEL_34:
          uint64_t result = 29LL;
          break;
        case 27:
LABEL_36:
          uint64_t result = 74LL;
          break;
        case 29:
        case 32:
        case 33:
LABEL_30:
          uint64_t result = 50LL;
          break;
        case 34:
          uint64_t result = 77LL;
          break;
        case 43:
        case 44:
        case 45:
        case 46:
        case 50:
        case 58:
        case 59:
        case 67:
        case 70:
        case 71:
        case 73:
        case 81:
        case 84:
LABEL_24:
          uint64_t result = 16LL;
          break;
        case 47:
        case 62:
        case 63:
        case 66:
        case 80:
        case 87:
LABEL_26:
          uint64_t result = 83LL;
          break;
        case 51:
LABEL_49:
          uint64_t result = 37LL;
          break;
        case 52:
        case 57:
LABEL_31:
          uint64_t result = 62LL;
          break;
        case 60:
        case 61:
        case 64:
        case 65:
        case 79:
        case 88:
LABEL_19:
          uint64_t result = 60LL;
          break;
        case 72:
          return result;
        case 82:
        case 85:
        case 86:
LABEL_14:
          uint64_t result = 17LL;
          break;
        case 83:
LABEL_37:
          uint64_t result = 43LL;
          break;
        case 89:
LABEL_40:
          uint64_t result = 23LL;
          break;
        default:
          goto LABEL_75;
      }
    }
  }

  else if (a1 <= -18431)
  {
    switch(a1)
    {
      case -20480:
      case -20479:
      case -20478:
      case -20477:
      case -20476:
      case -20475:
      case -20474:
        uint64_t result = 39LL;
        break;
      case -20473:
      case -20472:
      case -20471:
      case -20470:
      case -20469:
      case -20468:
      case -20467:
      case -20466:
      case -20465:
      case -20464:
      case -20463:
      case -20462:
      case -20461:
      case -20460:
      case -20459:
      case -20458:
      case -20457:
      case -20456:
LABEL_23:
        uint64_t result = 40LL;
        break;
      default:
        if (a1 != -18432 && a1 != -18431) {
          goto LABEL_75;
        }
        goto LABEL_4;
    }
  }

  else
  {
    switch(a1)
    {
      case -16384:
      case -16383:
      case -16382:
      case -16381:
      case -16380:
      case -16379:
      case -16378:
      case -16377:
      case -16376:
      case -16375:
      case -16374:
      case -16373:
      case -16230:
      case -16229:
      case -16213:
      case -16212:
      case -16211:
      case -16210:
      case -16209:
      case -16131:
      case -16124:
      case -15995:
      case -15994:
      case -15993:
      case -15992:
      case -15977:
      case -15976:
      case -15960:
      case -15959:
      case -15958:
      case -15878:
      case -15877:
      case -15876:
      case -15875:
      case -15802:
      case -15800:
      case -15798:
      case -15756:
      case -15755:
      case -15474:
      case -15473:
      case -15472:
      case -15471:
      case -15470:
      case -15469:
        uint64_t result = 21LL;
        break;
      case -16372:
      case -16371:
      case -16370:
      case -16369:
      case -16368:
      case -16367:
      case -16366:
      case -16228:
      case -16208:
      case -16122:
      case -16113:
      case -16104:
      case -16103:
      case -16102:
      case -16098:
      case -15914:
      case -15904:
      case -15874:
      case -15768:
      case -15767:
      case -15505:
      case -15504:
      case -15357:
        goto LABEL_18;
      case -16365:
      case -16364:
      case -16363:
      case -16362:
      case -16361:
      case -16360:
      case -16359:
      case -16358:
      case -16357:
      case -16356:
      case -16355:
      case -16354:
      case -16353:
      case -16352:
      case -16351:
      case -16350:
      case -16202:
      case -16195:
      case -16164:
      case -16151:
      case -16133:
      case -16065:
      case -16064:
      case -16014:
      case -16013:
      case -16012:
      case -15991:
      case -15990:
      case -15967:
      case -15966:
      case -15908:
      case -15899:
      case -15898:
      case -15897:
      case -15873:
      case -15872:
      case -15871:
      case -15870:
      case -15749:
      case -15712:
      case -15703:
      case -15673:
      case -15587:
      case -15586:
      case -15585:
      case -15584:
      case -15533:
      case -15501:
      case -15500:
      case -15410:
      case -15364:
      case -15326:
      case -15318:
      case -15316:
      case -15286:
      case -15285:
      case -15256:
      case -15255:
      case -15254:
      case -15253:
      case -15217:
      case -15216:
      case -15215:
        goto LABEL_12;
      case -16349:
      case -16348:
      case -16347:
      case -16346:
      case -16345:
      case -16344:
      case -16343:
      case -16342:
      case -16341:
      case -16340:
      case -16134:
      case -15811:
      case -15810:
      case -15809:
      case -15808:
      case -15807:
      case -15806:
      case -15805:
      case -15804:
      case -15701:
      case -15624:
      case -15252:
      case -15251:
      case -15250:
      case -15249:
        uint64_t result = 27LL;
        break;
      case -16339:
      case -16338:
      case -16337:
      case -16336:
      case -16335:
      case -16334:
      case -16333:
      case -16332:
      case -16331:
      case -16330:
      case -16329:
      case -16328:
      case -16327:
      case -16326:
      case -16325:
      case -16324:
      case -16323:
      case -16322:
      case -16227:
      case -16226:
      case -16220:
      case -16207:
      case -16150:
      case -16149:
      case -16130:
      case -16129:
      case -16100:
      case -16079:
      case -16078:
      case -16047:
      case -16046:
      case -16045:
      case -16044:
      case -16017:
      case -16011:
      case -16010:
      case -16009:
      case -16008:
      case -15965:
      case -15964:
      case -15963:
      case -15869:
      case -15754:
      case -15732:
      case -15711:
      case -15710:
      case -15709:
      case -15623:
      case -15622:
      case -15621:
      case -15583:
      case -15582:
      case -15581:
      case -15580:
      case -15518:
      case -15517:
      case -15516:
      case -15515:
      case -15514:
      case -15513:
      case -15512:
      case -15511:
      case -15510:
      case -15503:
      case -15284:
      case -15283:
      case -15282:
      case -15281:
      case -15280:
      case -15279:
      case -15278:
      case -15248:
      case -15247:
        uint64_t result = 28LL;
        break;
      case -16321:
      case -16092:
      case -15989:
      case -15868:
      case -15700:
      case -15699:
      case -15620:
      case -15619:
      case -15618:
      case -15579:
      case -15578:
      case -15541:
      case -15540:
        goto LABEL_34;
      case -16320:
        uint64_t result = 34LL;
        break;
      case -16319:
      case -16318:
      case -16317:
      case -16316:
      case -16315:
      case -16314:
      case -16313:
      case -16312:
      case -16311:
      case -16310:
      case -16309:
      case -16308:
      case -16307:
      case -16306:
      case -16305:
      case -16304:
      case -16303:
      case -16302:
      case -16301:
      case -16300:
      case -16299:
      case -16298:
      case -16297:
      case -16296:
      case -16295:
      case -16294:
      case -16206:
      case -16205:
      case -16200:
      case -16199:
      case -16198:
      case -16197:
      case -16166:
      case -16165:
      case -16163:
      case -16128:
      case -16121:
      case -16120:
      case -16112:
      case -16111:
      case -16101:
      case -16099:
      case -16096:
      case -16095:
      case -16093:
      case -16091:
      case -16090:
      case -16089:
      case -16088:
      case -16075:
      case -16066:
      case -16050:
      case -16049:
      case -16048:
      case -16039:
      case -16037:
      case -16036:
      case -16035:
      case -16031:
      case -16030:
      case -16029:
      case -16018:
      case -16016:
      case -16015:
      case -15998:
      case -15997:
      case -15996:
      case -15980:
      case -15979:
      case -15978:
      case -15972:
      case -15971:
      case -15969:
      case -15968:
      case -15912:
      case -15909:
      case -15902:
      case -15901:
      case -15900:
      case -15892:
      case -15891:
      case -15864:
      case -15863:
      case -15862:
      case -15861:
      case -15860:
      case -15859:
      case -15858:
      case -15857:
      case -15856:
      case -15855:
      case -15854:
      case -15853:
      case -15852:
      case -15851:
      case -15850:
      case -15849:
      case -15848:
      case -15847:
      case -15846:
      case -15845:
      case -15844:
      case -15843:
      case -15842:
      case -15841:
      case -15840:
      case -15839:
      case -15838:
      case -15837:
      case -15836:
      case -15835:
      case -15834:
      case -15833:
      case -15832:
      case -15831:
      case -15814:
      case -15813:
      case -15796:
      case -15793:
      case -15791:
      case -15780:
      case -15779:
      case -15774:
      case -15759:
      case -15758:
      case -15757:
      case -15751:
      case -15747:
      case -15746:
      case -15737:
      case -15731:
      case -15730:
      case -15719:
      case -15718:
      case -15717:
      case -15716:
      case -15708:
      case -15707:
      case -15706:
      case -15705:
      case -15704:
      case -15698:
      case -15697:
      case -15696:
      case -15695:
      case -15694:
      case -15693:
      case -15672:
      case -15671:
      case -15617:
      case -15616:
      case -15615:
      case -15614:
      case -15613:
      case -15612:
      case -15577:
      case -15576:
      case -15575:
      case -15535:
      case -15532:
      case -15531:
      case -15509:
      case -15506:
      case -15499:
      case -15498:
      case -15497:
      case -15496:
      case -15475:
      case -15468:
      case -15467:
      case -15464:
      case -15435:
      case -15434:
      case -15433:
      case -15432:
      case -15431:
      case -15430:
      case -15429:
      case -15428:
      case -15427:
      case -15425:
      case -15421:
      case -15420:
      case -15419:
      case -15418:
      case -15417:
      case -15406:
      case -15405:
      case -15404:
      case -15403:
      case -15402:
      case -15363:
      case -15362:
      case -15361:
      case -15360:
      case -15359:
      case -15358:
      case -15350:
      case -15349:
      case -15348:
      case -15347:
      case -15317:
      case -15315:
      case -15314:
      case -15298:
      case -15296:
      case -15270:
      case -15269:
      case -15268:
      case -15267:
      case -15261:
      case -15260:
      case -15259:
      case -15246:
      case -15245:
      case -15214:
        goto LABEL_4;
      case -16293:
      case -16135:
      case -16123:
      case -16052:
      case -16051:
      case -15830:
      case -15715:
      case -15714:
      case -15713:
      case -15670:
      case -15669:
        goto LABEL_37;
      case -16292:
      case -16291:
      case -16290:
      case -16107:
      case -16106:
      case -16083:
      case -16082:
      case -16081:
      case -16038:
      case -15772:
      case -15609:
      case -15608:
      case -15551:
      case -15550:
      case -15487:
      case -15423:
      case -15323:
      case -15322:
        goto LABEL_31;
      case -16289:
      case -16288:
      case -16287:
      case -16286:
      case -16285:
      case -16284:
      case -16283:
      case -16282:
      case -16162:
      case -16161:
      case -16160:
      case -16028:
      case -16027:
      case -16026:
        uint64_t result = 65LL;
        break;
      case -16281:
      case -16280:
      case -16279:
      case -16278:
      case -16277:
      case -16276:
      case -16275:
      case -16274:
      case -16273:
      case -16272:
      case -16271:
      case -16270:
      case -16269:
      case -16268:
      case -16267:
      case -16266:
      case -16265:
      case -16264:
      case -16263:
      case -16262:
      case -16261:
      case -16260:
      case -16259:
      case -16258:
      case -16257:
      case -16256:
      case -16255:
      case -16254:
      case -16253:
      case -16252:
      case -16251:
      case -16250:
      case -16249:
      case -16248:
      case -16247:
      case -16246:
      case -16245:
      case -16244:
      case -16243:
      case -16225:
      case -16224:
      case -16223:
      case -16222:
      case -16219:
      case -16218:
      case -16217:
      case -16216:
      case -16215:
      case -16214:
      case -16204:
      case -16203:
      case -16201:
      case -16159:
      case -16158:
      case -16157:
      case -16156:
      case -16155:
      case -16148:
      case -16147:
      case -16146:
      case -16145:
      case -16144:
      case -16143:
      case -16142:
      case -16141:
      case -16140:
      case -16139:
      case -16138:
      case -16137:
      case -16132:
      case -16126:
      case -16125:
      case -16087:
      case -16086:
      case -16085:
      case -16084:
      case -16080:
      case -16077:
      case -16076:
      case -16074:
      case -16043:
      case -16042:
      case -16041:
      case -16040:
      case -16022:
      case -16021:
      case -16020:
      case -16007:
      case -16006:
      case -16005:
      case -16004:
      case -16003:
      case -15988:
      case -15987:
      case -15986:
      case -15985:
      case -15984:
      case -15970:
      case -15962:
      case -15961:
      case -15823:
      case -15822:
      case -15821:
      case -15820:
      case -15819:
      case -15818:
      case -15812:
      case -15750:
      case -15729:
      case -15728:
      case -15727:
      case -15726:
      case -15725:
      case -15724:
      case -15723:
      case -15722:
      case -15721:
      case -15720:
      case -15507:
      case -15486:
      case -15485:
      case -15484:
      case -15483:
      case -15482:
      case -15481:
      case -15480:
      case -15479:
      case -15478:
      case -15477:
      case -15476:
      case -15459:
      case -15458:
      case -15457:
      case -15456:
      case -15455:
      case -15454:
      case -15453:
      case -15452:
      case -15451:
      case -15450:
      case -15449:
      case -15448:
      case -15447:
      case -15446:
      case -15445:
      case -15416:
      case -15415:
      case -15414:
      case -15401:
      case -15400:
      case -15399:
      case -15398:
      case -15397:
      case -15396:
      case -15395:
      case -15394:
      case -15393:
      case -15392:
      case -15391:
      case -15390:
      case -15389:
      case -15388:
      case -15387:
      case -15386:
      case -15385:
      case -15384:
      case -15383:
      case -15382:
      case -15381:
      case -15297:
      case -15275:
      case -15274:
      case -15273:
      case -15272:
      case -15244:
      case -15243:
        uint64_t result = 70LL;
        break;
      case -16242:
      case -15817:
      case -15463:
      case -15462:
      case -15461:
      case -15460:
      case -15444:
      case -15443:
      case -15442:
      case -15441:
      case -15440:
      case -15439:
      case -15438:
      case -15437:
      case -15436:
      case -15413:
      case -15380:
      case -15379:
      case -15378:
      case -15377:
      case -15376:
      case -15375:
      case -15374:
      case -15373:
      case -15372:
      case -15371:
      case -15370:
      case -15369:
      case -15368:
      case -15367:
      case -15319:
      case -15288:
        goto LABEL_15;
      case -16241:
      case -15983:
      case -15816:
        goto LABEL_50;
      case -16240:
      case -16239:
      case -16238:
      case -16237:
      case -16236:
      case -16235:
      case -16234:
      case -16233:
      case -16232:
      case -16231:
      case -16221:
      case -16196:
      case -16114:
      case -16108:
      case -16094:
      case -15981:
      case -15913:
      case -15910:
      case -15903:
      case -15894:
      case -15815:
      case -15775:
      case -15761:
      case -15760:
      case -15690:
      case -15689:
      case -15688:
      case -15534:
        goto LABEL_8;
      case -16194:
      case -16193:
      case -16192:
      case -16191:
      case -16190:
      case -16189:
      case -16188:
      case -16187:
      case -16186:
      case -16185:
      case -16184:
      case -16183:
      case -16182:
      case -16181:
      case -16180:
      case -16179:
      case -16178:
      case -16177:
      case -16176:
      case -16175:
      case -16174:
      case -16173:
      case -16172:
      case -16171:
      case -16170:
      case -16169:
      case -16168:
      case -16167:
      case -16154:
      case -16153:
      case -16152:
      case -16025:
      case -16024:
      case -16023:
        uint64_t result = 42LL;
        break;
      case -16136:
      case -16127:
        uint64_t result = 41LL;
        break;
      case -16119:
      case -16118:
      case -16117:
      case -16116:
      case -16115:
      case -16110:
      case -16109:
      case -16105:
      case -15829:
      case -15828:
      case -15778:
      case -15777:
      case -15356:
      case -15355:
      case -15354:
      case -15353:
      case -15352:
      case -15351:
        goto LABEL_30;
      case -16097:
      case -16032:
        uint64_t result = 81LL;
        break;
      case -16073:
      case -16072:
      case -16071:
      case -16070:
        uint64_t result = 24LL;
        break;
      case -16069:
      case -16068:
      case -16067:
      case -16034:
      case -16019:
      case -15736:
      case -15735:
      case -15734:
      case -15733:
        goto LABEL_40;
      case -16063:
      case -16062:
      case -16061:
      case -16060:
      case -16059:
      case -16058:
      case -16057:
      case -16056:
      case -16055:
      case -16054:
      case -16053:
      case -16033:
      case -16002:
      case -16001:
      case -16000:
      case -15999:
      case -15916:
      case -15915:
      case -15627:
      case -15626:
      case -15625:
      case -15549:
      case -15548:
      case -15547:
      case -15546:
      case -15539:
      case -15538:
      case -15537:
      case -15536:
        uint64_t result = 18LL;
        break;
      case -15982:
        uint64_t result = 78LL;
        break;
      case -15975:
      case -15974:
      case -15973:
      case -15911:
      case -15907:
      case -15422:
      case -15321:
        uint64_t result = 76LL;
        break;
      case -15957:
      case -15956:
      case -15955:
      case -15954:
      case -15953:
      case -15952:
      case -15951:
      case -15950:
      case -15949:
      case -15948:
      case -15947:
      case -15946:
      case -15945:
      case -15944:
      case -15943:
      case -15942:
      case -15941:
      case -15940:
      case -15939:
      case -15938:
      case -15937:
      case -15936:
      case -15906:
      case -15276:
      case -15266:
      case -15265:
      case -15264:
      case -15263:
      case -15262:
        uint64_t result = 59LL;
        break;
      case -15935:
      case -15934:
      case -15933:
      case -15932:
      case -15931:
      case -15930:
      case -15929:
      case -15928:
      case -15927:
      case -15926:
      case -15905:
      case -15827:
      case -15826:
      case -15825:
      case -15824:
      case -15773:
      case -15277:
        uint64_t result = 58LL;
        break;
      case -15925:
      case -15924:
      case -15923:
      case -15922:
      case -15921:
      case -15920:
      case -15919:
      case -15918:
      case -15917:
      case -15896:
      case -15895:
      case -15766:
      case -15765:
      case -15764:
      case -15763:
      case -15762:
        goto LABEL_25;
      case -15893:
        uint64_t result = 64LL;
        break;
      case -15890:
      case -15889:
      case -15888:
      case -15887:
      case -15886:
      case -15885:
      case -15884:
      case -15883:
      case -15882:
      case -15881:
        uint64_t result = 82LL;
        break;
      case -15880:
      case -15879:
      case -15325:
        uint64_t result = 38LL;
        break;
      case -15867:
      case -15753:
        uint64_t result = 31LL;
        break;
      case -15866:
      case -15865:
        uint64_t result = 35LL;
        break;
      case -15803:
      case -15801:
      case -15799:
      case -15797:
      case -15795:
      case -15776:
      case -15771:
      case -15770:
      case -15412:
      case -15411:
        uint64_t result = 68LL;
        break;
      case -15794:
      case -15792:
      case -15790:
      case -15789:
      case -15788:
      case -15787:
      case -15786:
      case -15785:
      case -15784:
      case -15783:
      case -15782:
      case -15781:
      case -15271:
        goto LABEL_36;
      case -15769:
        uint64_t result = 73LL;
        break;
      case -15752:
        uint64_t result = 32LL;
        break;
      case -15748:
        uint64_t result = 30LL;
        break;
      case -15745:
        uint64_t result = 66LL;
        break;
      case -15744:
      case -15743:
      case -15742:
      case -15741:
      case -15740:
      case -15739:
      case -15738:
        uint64_t result = 67LL;
        break;
      case -15702:
        uint64_t result = 26LL;
        break;
      case -15692:
        uint64_t result = 45LL;
        break;
      case -15691:
        uint64_t result = 79LL;
        break;
      case -15687:
      case -15686:
      case -15685:
      case -15684:
      case -15668:
      case -15667:
      case -15666:
      case -15665:
      case -15664:
      case -15663:
      case -15662:
      case -15555:
      case -15554:
      case -15553:
      case -15426:
      case -15409:
      case -15408:
      case -15407:
      case -15327:
        uint64_t result = 19LL;
        break;
      case -15683:
      case -15682:
      case -15681:
      case -15680:
      case -15679:
      case -15678:
      case -15677:
        uint64_t result = 20LL;
        break;
      case -15676:
      case -15675:
      case -15674:
      case -15611:
        goto LABEL_49;
      case -15661:
      case -15660:
      case -15659:
      case -15658:
      case -15657:
      case -15656:
      case -15655:
      case -15654:
      case -15653:
      case -15652:
      case -15651:
      case -15650:
      case -15649:
      case -15552:
        goto LABEL_24;
      case -15648:
      case -15647:
      case -15646:
      case -15645:
      case -15644:
      case -15643:
      case -15642:
      case -15641:
      case -15640:
      case -15639:
      case -15638:
      case -15637:
      case -15636:
      case -15635:
      case -15634:
      case -15633:
      case -15632:
      case -15631:
      case -15630:
      case -15629:
      case -15628:
      case -15595:
      case -15594:
      case -15593:
      case -15592:
      case -15591:
      case -15590:
      case -15589:
      case -15588:
      case -15524:
      case -15523:
      case -15522:
      case -15521:
      case -15520:
      case -15519:
      case -15502:
      case -15466:
      case -15465:
      case -15366:
      case -15365:
      case -15287:
        goto LABEL_14;
      case -15610:
        uint64_t result = 44LL;
        break;
      case -15607:
      case -15606:
      case -15605:
      case -15604:
      case -15603:
      case -15602:
      case -15601:
      case -15600:
      case -15599:
      case -15598:
      case -15597:
      case -15596:
      case -15574:
      case -15573:
      case -15543:
      case -15542:
      case -15528:
      case -15527:
        goto LABEL_26;
      case -15572:
      case -15571:
      case -15570:
      case -15569:
      case -15568:
      case -15567:
      case -15566:
      case -15565:
      case -15564:
      case -15563:
      case -15562:
      case -15561:
      case -15560:
      case -15559:
      case -15558:
      case -15557:
      case -15556:
      case -15545:
      case -15544:
      case -15530:
      case -15529:
      case -15526:
      case -15525:
      case -15258:
      case -15257:
        goto LABEL_19;
      case -15508:
        uint64_t result = 69LL;
        break;
      case -15495:
        uint64_t result = 46LL;
        break;
      case -15494:
        uint64_t result = 47LL;
        break;
      case -15493:
        uint64_t result = 48LL;
        break;
      case -15492:
        uint64_t result = 49LL;
        break;
      case -15491:
      case -15490:
      case -15489:
      case -15488:
      case -15424:
      case -15324:
        uint64_t result = 61LL;
        break;
      case -15346:
      case -15345:
      case -15344:
      case -15343:
      case -15342:
      case -15341:
      case -15340:
      case -15339:
      case -15338:
      case -15337:
      case -15336:
      case -15335:
      case -15313:
      case -15312:
      case -15311:
      case -15310:
      case -15309:
      case -15308:
      case -15295:
      case -15294:
      case -15293:
      case -15292:
        uint64_t result = 51LL;
        break;
      case -15334:
      case -15333:
      case -15332:
      case -15307:
      case -15306:
      case -15291:
        uint64_t result = 52LL;
        break;
      case -15331:
        uint64_t result = 55LL;
        break;
      case -15330:
      case -15329:
      case -15299:
        uint64_t result = 56LL;
        break;
      case -15328:
      case -15305:
      case -15304:
      case -15303:
      case -15302:
      case -15301:
      case -15300:
        uint64_t result = 54LL;
        break;
      case -15320:
        uint64_t result = 33LL;
        break;
      case -15290:
      case -15289:
        uint64_t result = 53LL;
        break;
      case -15242:
      case -15241:
      case -15240:
      case -15239:
      case -15238:
      case -15237:
      case -15236:
      case -15235:
      case -15234:
      case -15233:
      case -15232:
      case -15231:
      case -15230:
      case -15229:
      case -15228:
      case -15227:
      case -15226:
      case -15225:
      case -15224:
      case -15223:
      case -15222:
      case -15221:
      case -15220:
      case -15219:
      case -15218:
      case -15212:
      case -15211:
      case -15210:
      case -15209:
      case -15208:
      case -15207:
      case -15206:
        uint64_t result = 72LL;
        break;
      case -15213:
        uint64_t result = 63LL;
        break;
      default:
        if (a1 != -18430) {
          goto LABEL_75;
        }
        goto LABEL_23;
    }
  }

  return result;
}

BOOL IsFuncEnumVRSubmitCall(int a1)
{
  return a1 == -16034;
}

BOOL IsFuncEnumPatchCall(int a1)
{
  return (a1 + 16147) < 4;
}

BOOL IsFuncEnumConstructor(int a1)
{
  return GetFuncEnumConstructorType(a1) != 0;
}

BOOL IsFuncEnumCreateCommandBuffer(int a1)
{
  return GetFuncEnumConstructorType(a1) == 25;
}

BOOL IsFuncEnumCreateIOCommandBuffer(int a1)
{
  return GetFuncEnumConstructorType(a1) == 51;
}

BOOL IsFuncEnumCreateCommandEncoder(int a1)
{
  int FuncEnumConstructorType = GetFuncEnumConstructorType(a1);
  return IsCommandEncoder(FuncEnumConstructorType);
}

uint64_t IsFuncEnumEncodeWaitForEvent(int a1)
{
  uint64_t result = 1LL;
  if (a1 > -15340)
  {
    if (a1 == -15339) {
      return result;
    }
    int v3 = -15308;
  }

  else
  {
    if (a1 == -15991) {
      return result;
    }
    int v3 = -15749;
  }

  if (a1 != v3) {
    return 0LL;
  }
  return result;
}

uint64_t IsFuncEnumEncodeSignalEvent(int a1)
{
  BOOL v1 = a1 == -15340 || a1 == -15309;
  return a1 == -15990 || v1;
}

BOOL IsFuncEnumCreateResource(int a1)
{
  unsigned int FuncEnumConstructorType = GetFuncEnumConstructorType(a1);
}

BOOL IsFuncEnumDisplayableCall(int a1)
{
  if ((IsFuncEnumDrawCall(a1) & 1) != 0
    || (a1 + 16079) < 2
    || a1 == -16327
    || a1 == -16220
    || (IsFuncEnumBlitCall(a1) & 1) != 0)
  {
    return 1LL;
  }

  if (a1 <= -15298)
  {
    if (a1 <= -15785)
    {
      if (a1 == -16137 || a1 == -16034) {
        return 1LL;
      }
      int v3 = -15887;
    }

    else
    {
      int v3 = -15486;
    }
  }

  else
  {
    int v3 = -15271;
  }

  if (a1 == v3 || IsFuncEnumAccelerationEncodeCall(a1)) {
    return 1LL;
  }
  return IsFuncEnumPresent(a1);
}

uint64_t IsFuncEnumCommandBufferCommit(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -15909)
  {
    if (a1 == -16361) {
      return result;
    }
    int v3 = -16202;
    goto LABEL_7;
  }

  if (a1 != -15908 && a1 != -15318)
  {
    int v3 = -15316;
LABEL_7:
    if (a1 != v3) {
      return 0LL;
    }
  }

  return result;
}

BOOL IsFuncEnumIOCommandBufferCommit(int a1)
{
  return a1 == -15343;
}

uint64_t IsFuncEnumSharedResourceConstructor(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= -16097)
  {
    if (a1 > -16164)
    {
      if (a1 == -16163) {
        return result;
      }
      int v3 = -16104;
    }

    else
    {
      if (a1 == -16312) {
        return result;
      }
      int v3 = -16294;
    }

    goto LABEL_11;
  }

  if (((a1 + 16031) > 0x34 || ((1LL << (a1 - 97)) & 0x18000000000003LL) == 0)
    && (a1 + 15914) >= 2)
  {
    int v3 = -16096;
LABEL_11:
    if (a1 != v3) {
      return 0LL;
    }
  }

  return result;
}

uint64_t IsFuncEnumParallelCommandEncoderCall(int a1)
{
  uint64_t result = 1LL;
  if (a1 > -16163)
  {
  }

  else if (((a1 + 16289) > 7 || a1 == -16286) && a1 != -16351)
  {
    return 0LL;
  }

  return result;
}

uint64_t IsFuncEnumMPSDispatchCall(int a1)
{
  return ((a1 + 6144) < 0x2A) & (0x3806C9D5295uLL >> a1);
}

BOOL IsFuncEnumIndirectExecuteRenderCall(unsigned int a1)
{
  return a1 >> 1 == 2147475667;
}

BOOL IsFuncEnumIndirectExecuteComputeCall(unsigned int a1)
{
  return a1 >> 1 == 2147475666;
}

BOOL IsFuncEnumCommandBufferRelated(int a1)
{
  int FuncEnumReceiverType = GetFuncEnumReceiverType(a1);
  if (FuncEnumReceiverType == 25) {
    return 1LL;
  }
  int v3 = FuncEnumReceiverType;
  return a1 == -20474 || a1 == -20457;
}

BOOL IsFuncEnumMetalFXEncode(int a1)
{
  return a1 == -20474 || a1 == -20457;
}

BOOL IsFuncIOCommandBufferRelated(int a1)
{
  int FuncEnumReceiverType = GetFuncEnumReceiverType(a1);
  if (FuncEnumReceiverType == 51) {
    return 1LL;
  }
  if (FuncEnumReceiverType == 52) {
    return GetFuncEnumConstructorType(a1) != 0;
  }
  return 0LL;
}

uint64_t IsFuncEnumFrameBoundary(int a1)
{
  BOOL v2 = IsFuncEnumPresent(a1);
  BOOL v4 = a1 == -10168 || a1 == -16341;
  return v2 || v4;
}

void FlushChainedRenderPipelineStateInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  __int128 v10 = *(_OWORD *)(a1 + 16);
  __int128 v11 = *(_OWORD *)(a1 + 32);
  v88[0] = *(_OWORD *)a1;
  v88[1] = v10;
  uint64_t v12 = *(void *)(a2 + 56);
  v88[2] = v11;
  uint64_t v89 = *(void *)(a1 + 48);
  *(void *)&v88[0] = v9;
  *(_DWORD *)(*(void *)(a1 + 8) + 32LL) |= a4 | 0x1000;
  if (*(_WORD *)(v12 + 208))
  {
    uint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 72) + v13, 102);
      ++v14;
      v13 += 56LL;
    }

    while (v14 < *(unsigned __int16 *)(v12 + 208));
  }

  if (*(_WORD *)(v12 + 198))
  {
    uint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 24) + v15, 103);
      ++v16;
      v15 += 56LL;
    }

    while (v16 < *(unsigned __int16 *)(v12 + 198));
  }

  if (*(_WORD *)(v12 + 204))
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 40) + v17, 130);
      ++v18;
      v17 += 56LL;
    }

    while (v18 < *(unsigned __int16 *)(v12 + 204));
  }

  if (*(_WORD *)(v12 + 210))
  {
    uint64_t v19 = 0LL;
    unint64_t v20 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 80) + v19, 133);
      ++v20;
      v19 += 56LL;
    }

    while (v20 < *(unsigned __int16 *)(v12 + 210));
  }

  if (*(_WORD *)(v12 + 206))
  {
    uint64_t v21 = 0LL;
    unint64_t v22 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 48) + v21, 131);
      ++v22;
      v21 += 56LL;
    }

    while (v22 < *(unsigned __int16 *)(v12 + 206));
  }

  if (*(_WORD *)(v12 + 212))
  {
    uint64_t v23 = 0LL;
    unint64_t v24 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 88) + v23, 134);
      ++v24;
      v23 += 56LL;
    }

    while (v24 < *(unsigned __int16 *)(v12 + 212));
  }

  if (*(_WORD *)(v12 + 200))
  {
    uint64_t v25 = 0LL;
    unint64_t v26 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 32) + v25, 104);
      ++v26;
      v25 += 56LL;
    }

    while (v26 < *(unsigned __int16 *)(v12 + 200));
  }

  unsigned int v27 = *(unsigned __int16 *)(v12 + 202);
  if (*(_WORD *)(v12 + 202))
  {
    uint64_t v28 = 0LL;
    unint64_t v29 = 0LL;
    char v30 = 0;
    do
    {
      uint64_t v31 = *(void *)(v12 + 56);
      uint64_t v32 = v31 + v28;
      int v33 = *(unsigned __int8 *)(v31 + v28 + 16);
      if (v33 != 17 || *(_BYTE *)(v32 + 38))
      {
        if (*(void *)(v12 + 64) && (v33 == 16 || v33 == 17 && *(_BYTE *)(v31 + v28 + 38) == 1))
        {
          char v30 = 1;
          uint64_t v32 = *(void *)(v12 + 64);
        }

        EncodeGTMTLBinding((uint64_t *)v88, v32, 121);
        unsigned int v27 = *(unsigned __int16 *)(v12 + 202);
      }

      ++v29;
      v28 += 56LL;
    }

    while (v29 < v27);
  }

  else
  {
    char v30 = 0;
  }

  uint64_t v34 = *(void *)(v12 + 64);
  if (v34)
  {
    int v35 = *(unsigned __int8 *)(v34 + 16);
    if (v35 == 16 || v35 == 17 && *(_BYTE *)(v34 + 38) == 1)
    {
      int v36 = *(unsigned __int16 *)(v12 + 208)
          + *(unsigned __int16 *)(v12 + 198)
          + *(unsigned __int16 *)(v12 + 200)
          + *(unsigned __int16 *)(v12 + 204)
      int v37 = *(unsigned __int16 *)(v12 + 212);
      uint64_t v38 = 56LL;
      if (v36 + v37) {
        uint64_t v38 = 32LL;
      }
      uint64_t v39 = 200LL;
      if (!(v36 + v37)) {
        uint64_t v39 = 202LL;
      }
      uint64_t v40 = *(unsigned __int16 *)(v12 + v39);
      if (v40)
      {
        uint64_t v41 = (_BYTE *)(*(void *)(v12 + v38) + 38LL);
        do
        {
          int v42 = *(v41 - 22);
          if (v42 == 17)
          {
            if (*v41 == 1) {
              goto LABEL_59;
            }
          }

          else if (v42 == 16)
          {
            goto LABEL_59;
          }

          v41 += 56;
          --v40;
        }

        while (v40);
      }

      if ((v30 & 1) == 0)
      {
        if (v36 == -v37) {
          int v43 = 121;
        }
        else {
          int v43 = 104;
        }
        EncodeGTMTLBinding((uint64_t *)v88, v34, v43);
      }
    }
  }

void EncodeGTMTLBinding(uint64_t *a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a2 + 16) != 17 || *(_BYTE *)(a2 + 38))
  {
    fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
    uint64_t v6 = a1[1];
    *(_DWORD *)(v6 + 32) = 0;
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    uint64_t v7 = a1[1];
    *(_DWORD *)(v7 + 32) = 198;
    *(void *)uint64_t v7 = 0xFFFFD01000000024LL;
    unsigned int v8 = *(unsigned __int8 *)(a2 + 16);
    if (v8 <= 0x10)
    {
      switch(*(_BYTE *)(a2 + 16))
      {
        case 0:
          uint64_t v9 = *(unsigned __int8 **)(a2 + 8);
          if (!v9) {
            goto LABEL_24;
          }
          int v10 = *v9;
          if (v10 != 1)
          {
            if (v10 == 60 && v9[22] == 1) {
              uint64_t v9 = (unsigned __int8 *)*((void *)v9 + 1);
            }
            else {
LABEL_24:
            }
              uint64_t v9 = 0LL;
          }

          EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"ulululbb");
          unsigned int v55 = (_DWORD *)a1[1];
          *(void *)((char *)v55 + *v55) = *(unsigned __int16 *)(a2 + 28);
          *v55 += 8;
          unsigned int v56 = (_DWORD *)a1[1];
          *(void *)((char *)v56 + *v56) = *(unsigned int *)(a2 + 24);
          *v56 += 8;
          unint64_t v57 = (_DWORD *)a1[1];
          *(void *)((char *)v57 + *v57) = *(unsigned __int8 *)(a2 + 30);
          *v57 += 8;
          uint64_t v58 = (_DWORD *)a1[1];
          *((_BYTE *)v58 + (*v58)++) = v9 != 0LL;
          uint64_t v59 = (_DWORD *)a1[1];
          *((_BYTE *)v59 + (*v59)++) = *(_BYTE *)(a2 + 31);
          uint64_t v60 = (_DWORD *)a1[1];
          uint64_t v61 = *v60;
          int v62 = (v61 + 3) & 0xFFFFFFFC;
          bzero((char *)v60 + v61, (v62 - v61));
          *uint64_t v60 = v62;
          if (!v9) {
            return;
          }
          uint64_t v23 = a1;
          uint64_t v22 = (uint64_t)v9;
          break;
        case 1:
          uint64_t v31 = *(void *)(a2 + 8);
          if (v31)
          {
            uint64_t v32 = *(unsigned __int8 *)(v31 + 22);
            uint64_t v33 = *(unsigned int *)(v31 + 16);
            BOOL v34 = *(void *)(v31 + 8) != 0LL;
          }

          else
          {
            BOOL v34 = 0;
            uint64_t v33 = 0LL;
            uint64_t v32 = 0LL;
          }

          EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"ululululb");
          unint64_t v64 = (_DWORD *)a1[1];
          *(void *)((char *)v64 + *v64) = *(unsigned __int16 *)(a2 + 28);
          *v64 += 8;
          uint64_t v65 = (_DWORD *)a1[1];
          *(void *)((char *)v65 + *v65) = *(unsigned int *)(a2 + 24);
          *v65 += 8;
          uint64_t v66 = (_DWORD *)a1[1];
          *(void *)((char *)v66 + *v66) = v32;
          *v66 += 8;
          uint64_t v67 = (_DWORD *)a1[1];
          *(void *)((char *)v67 + *v67) = v33;
          *v67 += 8;
          uint64_t v68 = (_DWORD *)a1[1];
          *((_BYTE *)v68 + (*v68)++) = v34;
          int v69 = (_DWORD *)a1[1];
          uint64_t v70 = *v69;
          int v71 = (v70 + 3) & 0xFFFFFFFC;
          bzero((char *)v69 + v70, (v71 - v70));
          *int v69 = v71;
          if (!v34) {
            return;
          }
          uint64_t v22 = *(void *)(v31 + 8);
          uint64_t v23 = a1;
          goto LABEL_31;
        case 2:
          EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"ulululb");
          int v35 = (_DWORD *)a1[1];
          *(void *)((char *)v35 + *v35) = *(unsigned __int8 *)(a2 + 25);
          *v35 += 8;
          int v36 = (_DWORD *)a1[1];
          *(void *)((char *)v36 + *v36) = *(unsigned __int8 *)(a2 + 24);
          *v36 += 8;
          int v37 = (_DWORD *)a1[1];
          *(void *)((char *)v37 + *v37) = *(unsigned __int8 *)(a2 + 26);
          *v37 += 8;
          uint64_t v38 = (_DWORD *)a1[1];
          *((_BYTE *)v38 + (*v38)++) = *(_BYTE *)(a2 + 27);
          uint64_t v39 = (_DWORD *)a1[1];
          uint64_t v40 = *v39;
          int v41 = (v40 + 3) & 0xFFFFFFFC;
          bzero((char *)v39 + v40, (v41 - v40));
          _DWORD *v39 = v41;
          return;
        case 3:
          goto LABEL_5;
        default:
          if (v8 != 16) {
            return;
          }
          uint64_t v24 = *(void *)(a2 + 24);
          BOOL v25 = *(void *)(a2 + 8) != 0LL;
          BOOL v26 = v24 != 0;
          EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"bulbbul");
          unsigned int v27 = (_DWORD *)a1[1];
          *((_BYTE *)v27 + (*v27)++) = v25;
          uint64_t v28 = (_DWORD *)a1[1];
          uint64_t v29 = *v28;
          int v30 = (v29 + 3) & 0xFFFFFFFC;
          bzero((char *)v28 + v29, (v30 - v29));
          *uint64_t v28 = v30;
          goto LABEL_21;
      }
    }

    else
    {
      if (v8 - 24 < 4)
      {
LABEL_5:
        EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"");
        return;
      }

      if (v8 == 17)
      {
        uint64_t v24 = *(void *)(a2 + 24);
        BOOL v42 = *(void *)(a2 + 8) != 0LL;
        BOOL v26 = v24 != 0;
        EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"bululbbul");
        int v43 = (_DWORD *)a1[1];
        *((_BYTE *)v43 + (*v43)++) = v42;
        uint64_t v44 = (_DWORD *)a1[1];
        uint64_t v45 = *v44;
        int v46 = (v45 + 3) & 0xFFFFFFFC;
        bzero((char *)v44 + v45, (v46 - v45));
        _DWORD *v44 = v46;
        uint64_t v47 = (_DWORD *)a1[1];
        *(void *)((char *)v47 + *v47) = *(unsigned __int8 *)(a2 + 38);
        *v47 += 8;
LABEL_21:
        uint64_t v48 = (_DWORD *)a1[1];
        *(void *)((char *)v48 + *v48) = *(unsigned int *)(a2 + 32);
        *v48 += 8;
        uint64_t v49 = (_DWORD *)a1[1];
        *((_BYTE *)v49 + (*v49)++) = v26;
        unint64_t v50 = (_DWORD *)a1[1];
        *((_BYTE *)v50 + (*v50)++) = *(_BYTE *)(a2 + 37);
        uint64_t v51 = (_DWORD *)a1[1];
        uint64_t v52 = *v51;
        int v53 = (v52 + 3) & 0xFFFFFFFC;
        bzero((char *)v51 + v52, (v53 - v52));
        _DWORD *v51 = v53;
        unint64_t v54 = (_DWORD *)a1[1];
        *(void *)((char *)v54 + *v54) = *(unsigned __int8 *)(a2 + 36);
        *v54 += 8;
        if (!v24) {
          uint64_t v24 = *(void *)(a2 + 8);
        }
        uint64_t v23 = a1;
        uint64_t v22 = v24;
LABEL_31:
        unsigned int v63 = 1;
        goto LABEL_32;
      }

      if (v8 != 35) {
        return;
      }
      EncodeGTMTLBindingStart(a1, a2, a3, (uint64_t)"bbuiuib");
      __int128 v11 = (_DWORD *)a1[1];
      *((_BYTE *)v11 + (*v11)++) = *(_BYTE *)(a2 + 24);
      uint64_t v12 = (_DWORD *)a1[1];
      *((_BYTE *)v12 + (*v12)++) = *(_BYTE *)(a2 + 25);
      uint64_t v13 = (_DWORD *)a1[1];
      uint64_t v14 = *v13;
      int v15 = (v14 + 3) & 0xFFFFFFFC;
      bzero((char *)v13 + v14, (v15 - v14));
      *uint64_t v13 = v15;
      unint64_t v16 = (_DWORD *)a1[1];
      *(_DWORD *)((char *)v16 + *v16) = *(unsigned __int16 *)(a2 + 48);
      *v16 += 4;
      uint64_t v17 = (_DWORD *)a1[1];
      *(_DWORD *)((char *)v17 + *v17) = *(unsigned __int16 *)(a2 + 50);
      *v17 += 4;
      unint64_t v18 = (_DWORD *)a1[1];
      *((_BYTE *)v18 + (*v18)++) = *(_BYTE *)(a2 + 52);
      uint64_t v19 = (_DWORD *)a1[1];
      uint64_t v20 = *v19;
      int v21 = (v20 + 3) & 0xFFFFFFFC;
      bzero((char *)v19 + v20, (v21 - v20));
      _DWORD *v19 = v21;
      EncodeGTMTLStructType(a1, *(void *)(a2 + 32), 0);
      uint64_t v22 = *(void *)(a2 + 40);
      uint64_t v23 = a1;
    }

    unsigned int v63 = 0;
LABEL_32:
    EncodeGTMTLStructType(v23, v22, v63);
  }

void EncodeGTMTLBindingStart(uint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  v21[0] = *(_OWORD *)"CiSululuiul";
  memset(&v21[1], 0, 48);
  __strcat_chk(v21, a4, 64LL);
  uint64_t v7 = *a1;
  unsigned int v8 = (_DWORD *)a1[1];
  size_t v9 = strlen((const char *)v21);
  int v10 = v9 + 1;
  memcpy((char *)v8 + *v8, v21, v9 + 1);
  *v8 += v10;
  __int128 v11 = (_DWORD *)a1[1];
  uint64_t v12 = *v11;
  LODWORD(v8) = (v12 + 3) & 0xFFFFFFFC;
  bzero((char *)v11 + v12, ((_DWORD)v8 - v12));
  *__int128 v11 = (_DWORD)v8;
  uint64_t v13 = (_DWORD *)a1[1];
  *(void *)((char *)v13 + *v13) = v7;
  *v13 += 8;
  uint64_t v14 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v14 + *v14) = a3;
  *v14 += 4;
  EncodeString((int *)a1[1], *(char **)a2);
  int v15 = (_DWORD *)a1[1];
  uint64_t v16 = *v15;
  LODWORD(v11) = (v16 + 3) & 0xFFFFFFFC;
  bzero((char *)v15 + v16, ((_DWORD)v11 - v16));
  *int v15 = (_DWORD)v11;
  uint64_t v17 = (_DWORD *)a1[1];
  *(void *)((char *)v17 + *v17) = *(unsigned __int8 *)(a2 + 16);
  *v17 += 8;
  unint64_t v18 = (_DWORD *)a1[1];
  *(void *)((char *)v18 + *v18) = *(unsigned __int8 *)(a2 + 17);
  *v18 += 8;
  uint64_t v19 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v19 + *v19) = *(_BYTE *)(a2 + 19) & 1;
  *v19 += 4;
  uint64_t v20 = (_DWORD *)a1[1];
  *(void *)((char *)v20 + *v20) = *(unsigned __int8 *)(a2 + 18);
  *v20 += 8;
}

void EncodeGTMTLStructType(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = *a1;
  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v6 = a1[1];
  *(_DWORD *)(v6 + 32) = 0;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  uint64_t v7 = a1[1];
  *(_DWORD *)(v7 + 32) = 198;
  *(void *)uint64_t v7 = 0xFFFFD01000000024LL;
  unsigned int v8 = (char *)a1[1];
  strcpy(&v8[*(unsigned int *)v8], "Ci");
  *(_DWORD *)v8 += 3;
  size_t v9 = (_DWORD *)a1[1];
  uint64_t v10 = *v9;
  int v11 = (v10 + 3) & 0xFFFFFFFC;
  bzero((char *)v9 + v10, (v11 - v10));
  *size_t v9 = v11;
  uint64_t v12 = (_DWORD *)a1[1];
  uint64_t v58 = v5;
  *(void *)((char *)v12 + *v12) = v5;
  *v12 += 8;
  uint64_t v13 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v13 + *v13) = *(_DWORD *)(a2 + 16);
  *v13 += 4;
  if (*(_DWORD *)(a2 + 16))
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = 0LL;
    uint64_t v57 = a2;
    do
    {
      uint64_t v16 = *(void *)(a2 + 8);
      uint64_t v17 = v16 + v14;
      int v18 = *(unsigned __int8 *)(v16 + v14 + 24);
      if (v18 == 60)
      {
        BOOL v19 = 0;
        BOOL v20 = 0;
        BOOL v21 = *(void *)(v17 + 8) != 0LL;
      }

      else
      {
        if (v18 == 2)
        {
          BOOL v20 = 0;
          BOOL v19 = *(void *)(v16 + v14 + 8) != 0LL;
        }

        else
        {
          BOOL v19 = 0;
          BOOL v20 = v18 == 1 && *(void *)(v16 + v14 + 8) != 0LL;
        }

        BOOL v21 = 0;
      }

      fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
      uint64_t v22 = a1[1];
      *(_DWORD *)(v22 + 32) = 0;
      *(_OWORD *)uint64_t v22 = 0u;
      *(_OWORD *)(v22 + 16) = 0u;
      uint64_t v23 = a1[1];
      *(_DWORD *)(v23 + 32) = 198;
      *(void *)uint64_t v23 = 0xFFFFD01000000024LL;
      uint64_t v24 = (char *)a1[1];
      strcpy(&v24[*(unsigned int *)v24], "CiSulbbulbb");
      *(_DWORD *)v24 += 12;
      BOOL v25 = (_DWORD *)a1[1];
      uint64_t v26 = *v25;
      int v27 = (v26 + 3) & 0xFFFFFFFC;
      bzero((char *)v25 + v26, (v27 - v26));
      *BOOL v25 = v27;
      uint64_t v28 = (_DWORD *)a1[1];
      *(void *)((char *)v28 + *v28) = v58;
      *v28 += 8;
      uint64_t v29 = (_DWORD *)a1[1];
      uint64_t v60 = v16 + v14;
      *(_DWORD *)((char *)v29 + *v29) = *(unsigned __int8 *)(v17 + 24);
      *v29 += 4;
      EncodeString((int *)a1[1], *(char **)(v16 + v14));
      int v30 = (_DWORD *)a1[1];
      uint64_t v31 = *v30;
      int v32 = (v31 + 3) & 0xFFFFFFFC;
      bzero((char *)v30 + v31, (v32 - v31));
      *int v30 = v32;
      uint64_t v33 = (_DWORD *)a1[1];
      *(void *)((char *)v33 + *v33) = *(unsigned int *)(v16 + v14 + 16);
      *v33 += 8;
      BOOL v34 = (_DWORD *)a1[1];
      *((_BYTE *)v34 + (*v34)++) = v20;
      int v35 = (_DWORD *)a1[1];
      *((_BYTE *)v35 + (*v35)++) = v19;
      int v36 = (_DWORD *)a1[1];
      uint64_t v37 = *v36;
      int v38 = (v37 + 3) & 0xFFFFFFFC;
      bzero((char *)v36 + v37, (v38 - v37));
      *int v36 = v38;
      uint64_t v39 = (_DWORD *)a1[1];
      *(void *)((char *)v39 + *v39) = *(unsigned __int16 *)(v16 + v14 + 22);
      *v39 += 8;
      uint64_t v40 = (_DWORD *)a1[1];
      *((_BYTE *)v40 + (*v40)++) = a3;
      int v41 = (_DWORD *)a1[1];
      *((_BYTE *)v41 + (*v41)++) = v21;
      BOOL v42 = (_DWORD *)a1[1];
      uint64_t v43 = *v42;
      LODWORD(v25) = (v43 + 3) & 0xFFFFFFFC;
      bzero((char *)v42 + v43, ((_DWORD)v25 - v43));
      *BOOL v42 = (_DWORD)v25;
      if (a3)
      {
        else {
          uint64_t v44 = word_1C8410[(*(_BYTE *)(v60 + 24) - 62)];
        }
        fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
        uint64_t v45 = a1[1];
        *(_DWORD *)(v45 + 32) = 0;
        *(_OWORD *)uint64_t v45 = 0u;
        *(_OWORD *)(v45 + 16) = 0u;
        uint64_t v46 = a1[1];
        *(_DWORD *)(v46 + 32) = 198;
        *(void *)uint64_t v46 = 0xFFFFD01000000024LL;
        uint64_t v47 = (char *)a1[1];
        strcpy(&v47[*(unsigned int *)v47], "Culul");
        *(_DWORD *)v47 += 6;
        uint64_t v48 = (_DWORD *)a1[1];
        uint64_t v49 = *v48;
        int v50 = (v49 + 3) & 0xFFFFFFFC;
        bzero((char *)v48 + v49, (v50 - v49));
        *uint64_t v48 = v50;
        uint64_t v51 = (_DWORD *)a1[1];
        *(void *)((char *)v51 + *v51) = v58;
        *v51 += 8;
        uint64_t v52 = (_DWORD *)a1[1];
        *(void *)((char *)v52 + *v52) = v44;
        *v52 += 8;
        int v53 = (_DWORD *)a1[1];
        *(void *)((char *)v53 + *v53) = *(unsigned __int8 *)(v16 + v14 + 25);
        *v53 += 8;
      }

      a2 = v57;
      if (v20)
      {
        if (*(_BYTE *)(v60 + 24) == 1) {
          uint64_t v54 = *(void *)(v16 + v14 + 8);
        }
        else {
          uint64_t v54 = 0LL;
        }
        EncodeGTMTLStructType(a1, v54, a3);
        if (v19)
        {
LABEL_24:
          if (*(_BYTE *)(v60 + 24) == 2) {
            uint64_t v55 = *(void *)(v16 + v14 + 8);
          }
          else {
            uint64_t v55 = 0LL;
          }
          EncodeGTMTLArrayType(a1, v55, a3);
          if (!v21) {
            goto LABEL_32;
          }
LABEL_28:
          if (*(_BYTE *)(v60 + 24) == 60) {
            uint64_t v56 = *(void *)(v16 + v14 + 8);
          }
          else {
            uint64_t v56 = 0LL;
          }
          EncodeGTMTLPointerType(a1, v56, a3);
          goto LABEL_32;
        }
      }

      else if (v19)
      {
        goto LABEL_24;
      }

      if (v21) {
        goto LABEL_28;
      }
LABEL_32:
      ++v15;
      v14 += 32LL;
    }

    while (v15 < *(unsigned int *)(v57 + 16));
  }

int *EncodeString(int *result, char *__s)
{
  BOOL v2 = result;
  if (__s)
  {
    size_t v4 = strlen(__s);
    int v5 = v4 + 1;
    uint64_t result = (int *)memcpy((char *)v2 + *v2, __s, v4 + 1);
    int v6 = *v2 + v5;
  }

  else
  {
    *(void *)((char *)result + *result) = 0xFFFFFFFFLL;
    int v6 = *result + 8;
  }

  *BOOL v2 = v6;
  return result;
}

void EncodeGTMTLArrayType(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  int v7 = *(unsigned __int8 *)(a2 + 24);
  if (v7 == 60)
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
    BOOL v10 = *(void *)(a2 + 8) != 0LL;
  }

  else
  {
    if (v7 == 2)
    {
      BOOL v9 = 0;
      BOOL v8 = *(void *)(a2 + 8) != 0LL;
    }

    else
    {
      BOOL v8 = 0;
      BOOL v9 = v7 == 1 && *(void *)(a2 + 8) != 0LL;
    }

    BOOL v10 = 0;
  }

  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v11 = a1[1];
  *(_DWORD *)(v11 + 32) = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  uint64_t v12 = a1[1];
  *(_DWORD *)(v12 + 32) = 198;
  *(void *)uint64_t v12 = 0xFFFFD01000000024LL;
  uint64_t v13 = (char *)a1[1];
  strcpy(&v13[*(unsigned int *)v13], "Ciululbbbulb");
  *(_DWORD *)v13 += 13;
  uint64_t v14 = (_DWORD *)a1[1];
  uint64_t v15 = *v14;
  int v16 = (v15 + 3) & 0xFFFFFFFC;
  bzero((char *)v14 + v15, (v16 - v15));
  *uint64_t v14 = v16;
  uint64_t v17 = (_DWORD *)a1[1];
  *(void *)((char *)v17 + *v17) = v6;
  *v17 += 8;
  int v18 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v18 + *v18) = *(unsigned __int16 *)(a2 + 20);
  *v18 += 4;
  BOOL v19 = (_DWORD *)a1[1];
  *(void *)((char *)v19 + *v19) = *(unsigned __int8 *)(a2 + 24);
  *v19 += 8;
  BOOL v20 = (_DWORD *)a1[1];
  *(void *)((char *)v20 + *v20) = *(unsigned int *)(a2 + 16);
  *v20 += 8;
  BOOL v21 = (_DWORD *)a1[1];
  *((_BYTE *)v21 + (*v21)++) = v9;
  uint64_t v22 = (_DWORD *)a1[1];
  *((_BYTE *)v22 + (*v22)++) = v8;
  uint64_t v23 = (_DWORD *)a1[1];
  *((_BYTE *)v23 + (*v23)++) = a3;
  uint64_t v24 = (_DWORD *)a1[1];
  uint64_t v25 = *v24;
  int v26 = (v25 + 3) & 0xFFFFFFFC;
  bzero((char *)v24 + v25, (v26 - v25));
  _DWORD *v24 = v26;
  int v27 = (_DWORD *)a1[1];
  *(void *)((char *)v27 + *v27) = *(unsigned __int16 *)(a2 + 22);
  *v27 += 8;
  uint64_t v28 = (_DWORD *)a1[1];
  *((_BYTE *)v28 + (*v28)++) = v10;
  uint64_t v29 = (_DWORD *)a1[1];
  uint64_t v30 = *v29;
  int v31 = (v30 + 3) & 0xFFFFFFFC;
  bzero((char *)v29 + v30, (v31 - v30));
  *uint64_t v29 = v31;
  if ((_DWORD)a3)
  {
    else {
      uint64_t v32 = word_1C8410[(*(_BYTE *)(a2 + 24) - 62)];
    }
    fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
    uint64_t v33 = a1[1];
    *(_DWORD *)(v33 + 32) = 0;
    *(_OWORD *)uint64_t v33 = 0u;
    *(_OWORD *)(v33 + 16) = 0u;
    uint64_t v34 = a1[1];
    *(_DWORD *)(v34 + 32) = 198;
    *(void *)uint64_t v34 = 0xFFFFD01000000024LL;
    int v35 = (char *)a1[1];
    strcpy(&v35[*(unsigned int *)v35], "Culul");
    *(_DWORD *)v35 += 6;
    int v36 = (_DWORD *)a1[1];
    uint64_t v37 = *v36;
    int v38 = (v37 + 3) & 0xFFFFFFFC;
    bzero((char *)v36 + v37, (v38 - v37));
    *int v36 = v38;
    uint64_t v39 = (_DWORD *)a1[1];
    *(void *)((char *)v39 + *v39) = v6;
    *v39 += 8;
    uint64_t v40 = (_DWORD *)a1[1];
    *(void *)((char *)v40 + *v40) = v32;
    *v40 += 8;
    int v41 = (_DWORD *)a1[1];
    *(void *)((char *)v41 + *v41) = *(unsigned __int8 *)(a2 + 25);
    *v41 += 8;
  }

  if (v9)
  {
    if (*(_BYTE *)(a2 + 24) == 1) {
      uint64_t v43 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v43 = 0LL;
    }
    EncodeGTMTLStructType(a1, v43, a3);
    if (!v8)
    {
LABEL_16:
      if (!v10) {
        return;
      }
      goto LABEL_17;
    }
  }

  else if (!v8)
  {
    goto LABEL_16;
  }

  if (*(_BYTE *)(a2 + 24) == 2) {
    uint64_t v44 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v44 = 0LL;
  }
  EncodeGTMTLArrayType(a1, v44, a3);
  if (v10)
  {
LABEL_17:
    if (*(_BYTE *)(a2 + 24) == 60) {
      uint64_t v42 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v42 = 0LL;
    }
    EncodeGTMTLPointerType(a1, v42, a3);
  }

void EncodeGTMTLPointerType(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  int v7 = *(unsigned __int8 *)(a2 + 22);
  if (v7 == 2)
  {
    BOOL v9 = 0;
    BOOL v8 = *(void *)(a2 + 8) != 0LL;
  }

  else if (v7 == 1)
  {
    BOOL v8 = 0;
    BOOL v9 = *(void *)(a2 + 8) != 0LL;
  }

  else
  {
    BOOL v9 = 0;
    BOOL v8 = 0;
  }

  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v10 = a1[1];
  *(_DWORD *)(v10 + 32) = 0;
  *(_OWORD *)uint64_t v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  uint64_t v11 = a1[1];
  *(_DWORD *)(v11 + 32) = 198;
  *(void *)uint64_t v11 = 0xFFFFD01000000024LL;
  uint64_t v12 = (char *)a1[1];
  strcpy(&v12[*(unsigned int *)v12], "Cululululbb");
  *(_DWORD *)v12 += 12;
  uint64_t v13 = (_DWORD *)a1[1];
  uint64_t v14 = *v13;
  int v15 = (v14 + 3) & 0xFFFFFFFC;
  bzero((char *)v13 + v14, (v15 - v14));
  *uint64_t v13 = v15;
  int v16 = (_DWORD *)a1[1];
  *(void *)((char *)v16 + *v16) = v6;
  *v16 += 8;
  uint64_t v17 = (_DWORD *)a1[1];
  *(void *)((char *)v17 + *v17) = *(unsigned __int8 *)(a2 + 22);
  *v17 += 8;
  int v18 = (_DWORD *)a1[1];
  *(void *)((char *)v18 + *v18) = *(unsigned __int8 *)(a2 + 23);
  *v18 += 8;
  BOOL v19 = (_DWORD *)a1[1];
  *(void *)((char *)v19 + *v19) = *(unsigned __int16 *)(a2 + 20);
  *v19 += 8;
  BOOL v20 = (_DWORD *)a1[1];
  *(void *)((char *)v20 + *v20) = *(unsigned int *)(a2 + 16);
  *v20 += 8;
  BOOL v21 = (_DWORD *)a1[1];
  *((_BYTE *)v21 + (*v21)++) = v9;
  uint64_t v22 = (_DWORD *)a1[1];
  *((_BYTE *)v22 + (*v22)++) = v8;
  uint64_t v23 = (_DWORD *)a1[1];
  uint64_t v24 = *v23;
  LODWORD(v13) = (v24 + 3) & 0xFFFFFFFC;
  bzero((char *)v23 + v24, ((_DWORD)v13 - v24));
  *uint64_t v23 = (_DWORD)v13;
  if (v9)
  {
    if (*(_BYTE *)(a2 + 22) == 1) {
      uint64_t v25 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v25 = 0LL;
    }
    EncodeGTMTLStructType(a1, v25, a3);
  }

  if (v8)
  {
    if (*(_BYTE *)(a2 + 22) == 2) {
      uint64_t v26 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v26 = 0LL;
    }
    EncodeGTMTLArrayType(a1, v26, a3);
  }

void FlushChainedComputePipelineStateInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  __int128 v10 = *(_OWORD *)(a1 + 16);
  __int128 v11 = *(_OWORD *)(a1 + 32);
  v61[0] = *(_OWORD *)a1;
  v61[1] = v10;
  uint64_t v12 = *(void *)(a2 + 64);
  v61[2] = v11;
  uint64_t v62 = *(void *)(a1 + 48);
  *(void *)&v61[0] = v9;
  *(_DWORD *)(*(void *)(a1 + 8) + 32LL) |= a4 | 0x1000;
  if (*(_WORD *)(v12 + 92))
  {
    uint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v61, *(void *)(v12 + 24) + v13, 105);
      ++v14;
      v13 += 56LL;
    }

    while (v14 < *(unsigned __int16 *)(v12 + 92));
  }

  if (*(_WORD *)(v12 + 94))
  {
    uint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v61, *(void *)(v12 + 32) + v15, 106);
      ++v16;
      v15 += 56LL;
    }

    while (v16 < *(unsigned __int16 *)(v12 + 94));
  }

  if (*(void *)(v12 + 64))
  {
    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v17 = *(void *)(a1 + 8);
    *(_DWORD *)(v17 + 32) = 0;
    *(_OWORD *)uint64_t v17 = 0u;
    *(_OWORD *)(v17 + 16) = 0u;
    uint64_t v18 = *(void *)(a1 + 8);
    *(_DWORD *)(v18 + 32) = 198;
    *(void *)uint64_t v18 = 0xFFFFD01000000024LL;
    BOOL v19 = *(uint64_t **)(v12 + 56);
    BOOL v20 = *(const void **)(v12 + 64);
    uint64_t v21 = *(void *)(a1 + 32);
    HashBytes(v19, (unint64_t)v20, __s);
    GTMTLCaptureState_storePointer(v21, __s, v19, v20);
    __int128 v65 = v70;
    __int128 v66 = v71;
    char v67 = v72;
    __int128 v63 = *(_OWORD *)__s;
    __int128 v64 = v69;
    *(void *)__s = v9;
    *(void *)&__s[8] = 116LL;
    *(void *)&__int128 v69 = &v63;
    *((void *)&v69 + 1) = v20;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v22, 0LL);
  }

  if (*(_WORD *)(v12 + 96))
  {
    unint64_t v23 = 0LL;
    do
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v24 = *(void *)(a1 + 8);
      *(_DWORD *)(v24 + 32) = 0;
      *(_OWORD *)uint64_t v24 = 0u;
      *(_OWORD *)(v24 + 16) = 0u;
      uint64_t v25 = *(void *)(a1 + 8);
      *(_DWORD *)(v25 + 32) = 198;
      *(void *)uint64_t v25 = 0xFFFFD01000000024LL;
      SaveFileWithURL(*(void *)(a1 + 32), *(char **)(*(void *)(v12 + 48) + 8 * v23), __s, 0LL, 1);
      *(void *)&__int128 v63 = v9;
      *((void *)&v63 + 1) = 126LL;
      *(void *)&__int128 v64 = __s;
      *((void *)&v64 + 1) = *(void *)(*(void *)(v12 + 48) + 8 * v23);
      DYTraceEncode_InternalData((uint64_t)&v63, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v26, 0LL);
      ++v23;
    }

    while (v23 < *(unsigned __int16 *)(v12 + 96));
  }

  int v27 = *(unsigned int **)(a1 + 8);
  unsigned int v28 = v27[8];
  if ((v28 & 0x1000) != 0) {
    unsigned int v29 = v28 & 0xFFFFEFFF;
  }
  else {
    unsigned int v29 = v28 | 0x2000;
  }
  v27[8] = v29;
  unint64_t v30 = *v27;
  if ((v29 & 0x1000) != 0)
  {
    uint64_t v31 = *v27;
    uint64_t v32 = v27;
    do
    {
      uint64_t v32 = (unsigned int *)((char *)v32 + v31);
      uint64_t v31 = *v32;
      v30 += v31;
    }

    while ((*((_BYTE *)v32 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v27, v30);
  uint64_t v33 = *(void *)(a2 + 104);
  if (v33)
  {
    uint64_t v34 = *(void **)(a1 + 8);
    v34[2] = 0LL;
    v34[3] = 0LL;
    v34[1] = 0LL;
    v34[4] = 0x77754300000004LL;
    *uint64_t v34 = 0xFFFFC18B00000028LL;
    v34[5] = v9;
    v34[6] = v33;
    *(_DWORD *)uint64_t v34 = 56;
    int v35 = *(unsigned int **)(a1 + 8);
    int v36 = v35[8] | a4;
    v35[8] = v36;
    unint64_t v37 = *v35;
    if ((v36 & 0x1000) != 0)
    {
      uint64_t v38 = *v35;
      uint64_t v39 = v35;
      do
      {
        uint64_t v39 = (unsigned int *)((char *)v39 + v38);
        uint64_t v38 = *v39;
        v37 += v38;
      }

      while ((*((_BYTE *)v39 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v35, v37);
  }

  uint64_t v40 = *(void *)(a2 + 96);
  if (v40)
  {
    int v41 = *(void **)(a1 + 8);
    v41[2] = 0LL;
    v41[3] = 0LL;
    v41[1] = 0LL;
    v41[4] = 0x77754300000004LL;
    void *v41 = 0xFFFFD81A00000028LL;
    v41[5] = v9;
    v41[6] = v40;
    *(_DWORD *)int v41 = 56;
    uint64_t v42 = *(unsigned int **)(a1 + 8);
    int v43 = v42[8] | a4;
    v42[8] = v43;
    unint64_t v44 = *v42;
    if ((v43 & 0x1000) != 0)
    {
      uint64_t v45 = *v42;
      uint64_t v46 = v42;
      do
      {
        uint64_t v46 = (unsigned int *)((char *)v46 + v45);
        uint64_t v45 = *v46;
        v44 += v45;
      }

      while ((*((_BYTE *)v46 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v42, v44);
  }

  int v47 = *(_DWORD *)(a2 + 192);
  uint64_t v48 = *(void *)(a1 + 8);
  *(void *)(v48 + 16) = 0LL;
  *(void *)(v48 + 24) = 0LL;
  *(void *)(v48 + 8) = 0LL;
  *(void *)(v48 + 32) = 0x69754300000006LL;
  *(void *)uint64_t v48 = 0xFFFFD83100000028LL;
  *(void *)(v48 + 40) = v9;
  *(_DWORD *)(v48 + 48) = v47;
  *(_DWORD *)uint64_t v48 = 52;
  uint64_t v49 = *(unsigned int **)(a1 + 8);
  int v50 = v49[8] | a4;
  v49[8] = v50;
  unint64_t v51 = *v49;
  if ((v50 & 0x1000) != 0)
  {
    uint64_t v52 = *v49;
    int v53 = v49;
    do
    {
      int v53 = (unsigned int *)((char *)v53 + v52);
      uint64_t v52 = *v53;
      v51 += v52;
    }

    while ((*((_BYTE *)v53 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v49, v51);
  uint64_t v54 = *(void *)(a2 + 112);
  if (v54)
  {
    uint64_t v55 = *(void **)(a1 + 8);
    v55[2] = 0LL;
    v55[3] = 0LL;
    v55[1] = 0LL;
    v55[4] = 0x77754300000004LL;
    void *v55 = 0xFFFFD84E00000028LL;
    v55[5] = v9;
    v55[6] = v54;
    *(_DWORD *)uint64_t v55 = 56;
    uint64_t v56 = *(unsigned int **)(a1 + 8);
    int v57 = v56[8] | a4;
    v56[8] = v57;
    unint64_t v58 = *v56;
    if ((v57 & 0x1000) != 0)
    {
      uint64_t v59 = *v56;
      uint64_t v60 = v56;
      do
      {
        uint64_t v60 = (unsigned int *)((char *)v60 + v59);
        uint64_t v59 = *v60;
        v58 += v59;
      }

      while ((*((_BYTE *)v60 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v56, v58);
  }

void FlushChainedFunctionInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *(unsigned int **)(a1 + 8);
  int v7 = v6[8] | a4;
  v6[8] = v7;
  if (a2 && *(void *)(a2 + 80))
  {
    entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
    if (*entry && (uint64_t v9 = *(void *)(*entry + 32LL)) != 0) {
      uint64_t v10 = *(void *)(v9 + 8);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v14 = *(void *)(a2 + 80);
    uint64_t v15 = *(unsigned int **)(a1 + 8);
    v15[8] |= 0x1000u;
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v15, *v15);
    uint64_t v16 = *(void *)(a1 + 8);
    *(_DWORD *)(v16 + 32) = 0;
    *(_OWORD *)uint64_t v16 = 0u;
    *(_OWORD *)(v16 + 16) = 0u;
    uint64_t v17 = *(void *)(a1 + 8);
    *(_DWORD *)(v17 + 32) = 198;
    *(void *)uint64_t v17 = 0xFFFFD01000000024LL;
    *(void *)&__s[0] = v10;
    *((void *)&__s[0] + 1) = 101LL;
    uint64_t v18 = *(unsigned __int16 *)(v14 + 42);
    *(void *)&__s[1] = *(unsigned __int16 *)(v14 + 40);
    *((void *)&__s[1] + 1) = v18;
    __s[2] = *(_OWORD *)(v14 + 8);
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v19, 0LL);
    if (*(_BYTE *)(v14 + 46))
    {
      uint64_t v20 = 0LL;
      unint64_t v21 = 0LL;
      do
      {
        fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
        uint64_t v22 = *(void *)(a1 + 8);
        *(_DWORD *)(v22 + 32) = 0;
        *(_OWORD *)uint64_t v22 = 0u;
        *(_OWORD *)(v22 + 16) = 0u;
        uint64_t v23 = *(void *)(a1 + 8);
        *(_DWORD *)(v23 + 32) = 198;
        *(void *)uint64_t v23 = 0xFFFFD01000000024LL;
        uint64_t v24 = *(void *)(v14 + 24) + v20;
        *(void *)&__s[0] = v10;
        *((void *)&__s[0] + 1) = 109LL;
        *(void *)&__s[1] = *(unsigned int *)(v24 + 8);
        *((void *)&__s[1] + 1) = *(unsigned __int8 *)(v24 + 12);
        *(void *)&__s[2] = *(void *)v24;
        BYTE8(__s[2]) = *(_BYTE *)(v24 + 13);
        HIDWORD(__s[2]) = 0;
        *(_DWORD *)((char *)&__s[2] + 9) = 0;
        DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v25, 0LL);
        ++v21;
        v20 += 16LL;
      }

      while (v21 < *(unsigned __int8 *)(v14 + 46));
    }

    if (*(_BYTE *)(v14 + 47))
    {
      uint64_t v26 = 0LL;
      unint64_t v27 = 0LL;
      do
      {
        fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
        uint64_t v28 = *(void *)(a1 + 8);
        *(_DWORD *)(v28 + 32) = 0;
        *(_OWORD *)uint64_t v28 = 0u;
        *(_OWORD *)(v28 + 16) = 0u;
        uint64_t v29 = *(void *)(a1 + 8);
        *(_DWORD *)(v29 + 32) = 198;
        *(void *)uint64_t v29 = 0xFFFFD01000000024LL;
        uint64_t v30 = *(void *)(v14 + 32) + v26;
        *(void *)&__s[0] = v10;
        *((void *)&__s[0] + 1) = 120LL;
        *(void *)&__s[1] = *(unsigned int *)(v30 + 8);
        *((void *)&__s[1] + 1) = *(unsigned __int8 *)(v30 + 12);
        *(void *)&__s[2] = *(void *)v30;
        BYTE8(__s[2]) = *(_BYTE *)(v30 + 13);
        HIDWORD(__s[2]) = 0;
        *(_DWORD *)((char *)&__s[2] + 9) = 0;
        DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v31, 0LL);
        ++v27;
        v26 += 16LL;
      }

      while (v27 < *(unsigned __int8 *)(v14 + 47));
    }

    if (*(void *)(a2 + 72))
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v32 = *(void *)(a1 + 8);
      *(_DWORD *)(v32 + 32) = 0;
      *(_OWORD *)uint64_t v32 = 0u;
      *(_OWORD *)(v32 + 16) = 0u;
      uint64_t v33 = *(void *)(a1 + 8);
      *(_DWORD *)(v33 + 32) = 198;
      *(void *)uint64_t v33 = 0xFFFFD01000000024LL;
      uint64_t v34 = (const void *)EncodeDYMTLFunctionConstantValues( *(uint64_t **)(a2 + 72),  *(void **)(a1 + 8),  *(unsigned int *)(a1 + 16));
      uint64_t v35 = *(void *)(a1 + 32);
      int v36 = *(uint64_t **)(a1 + 8);
      HashBytes(v36, (unint64_t)v34, (char *)__s);
      GTMTLCaptureState_storePointer(v35, (char *)__s, v36, v34);
      v51[2] = __s[2];
      v51[3] = __s[3];
      char v52 = v54;
      v51[0] = __s[0];
      v51[1] = __s[1];
      *(void *)&__s[0] = v10;
      DWORD2(__s[0]) = 111;
      memset((char *)__s + 12, 0, 36);
      *(void *)&__s[1] = v51;
      DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v37, 0LL);
    }

    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v39 = *(void *)(a1 + 8);
    *(_DWORD *)(v39 + 32) = 0;
    *(_OWORD *)uint64_t v39 = 0u;
    *(_OWORD *)(v39 + 16) = 0u;
    uint64_t v40 = *(void *)(a1 + 8);
    *(_DWORD *)(v40 + 32) = 198;
    *(void *)uint64_t v40 = 0xFFFFD01000000024LL;
    *(void *)&__s[0] = v10;
    DWORD2(__s[0]) = 117;
    memset((char *)__s + 12, 0, 36);
    int v41 = "";
    if (*(void *)(a2 + 64)) {
      int v41 = *(const char **)(a2 + 64);
    }
    *(void *)&__s[1] = v41;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v38, 0LL);
    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v43 = *(void *)(a1 + 8);
    *(_DWORD *)(v43 + 32) = 0;
    *(_OWORD *)uint64_t v43 = 0u;
    *(_OWORD *)(v43 + 16) = 0u;
    uint64_t v44 = *(void *)(a1 + 8);
    *(_DWORD *)(v44 + 32) = 198;
    *(void *)uint64_t v44 = 0xFFFFD01000000024LL;
    *(void *)&__s[0] = v10;
    *((void *)&__s[0] + 1) = 110LL;
    *(void *)&__s[1] = *(unsigned __int8 *)(v14 + 48);
    if (*(void *)(a2 + 72)) {
      unsigned int v45 = -1;
    }
    else {
      unsigned int v45 = *(__int16 *)(v14 + 44);
    }
    *((void *)&__s[1] + 1) = v45;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v42, 0LL);
    uint64_t v46 = *(unsigned int **)(a1 + 8);
    unsigned int v47 = v46[8];
    v46[8] = v47 | 0x2000;
    unint64_t v48 = *v46;
    if ((v47 & 0x1000) != 0)
    {
      uint64_t v49 = *v46;
      int v50 = v46;
      do
      {
        int v50 = (unsigned int *)((char *)v50 + v49);
        uint64_t v49 = *v50;
        v48 += v49;
      }

      while ((*((_BYTE *)v50 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v46, v48);
  }

  else
  {
    uint64_t v11 = *v6;
    if ((v7 & 0x1000) != 0)
    {
      uint64_t v13 = v6;
      unint64_t v12 = *v6;
      do
      {
        uint64_t v13 = (unsigned int *)((char *)v13 + v11);
        uint64_t v11 = *v13;
        v12 += v11;
      }

      while ((*((_BYTE *)v13 + 33) & 0x20) == 0);
    }

    else
    {
      unint64_t v12 = *v6;
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v6, v12);
  }

void FlushChainedDynamicLibraryInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *(unsigned int **)(a1 + 8);
  int v7 = v6[8] | a4;
  v6[8] = v7;
  if (a2)
  {
    entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
    if (*entry && (uint64_t v9 = *(void *)(*entry + 32LL)) != 0) {
      uint64_t v10 = *(void *)(v9 + 8);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = *(unsigned int **)(a1 + 8);
    v11[8] |= 0x1000u;
    if (*(void *)(a2 + 72))
    {
      fbstream_write(*(void *)(a1 + 24), (uint64_t)v11, *v11);
      uint64_t v12 = *(void *)(a1 + 8);
      *(_DWORD *)(v12 + 32) = 0;
      *(_OWORD *)uint64_t v12 = 0u;
      *(_OWORD *)(v12 + 16) = 0u;
      uint64_t v13 = *(void *)(a1 + 8);
      *(_DWORD *)(v13 + 32) = 198;
      *(void *)uint64_t v13 = 0xFFFFD01000000024LL;
      uint64_t v32 = v10;
      int v33 = 128;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      int v36 = 0;
      *(void *)((char *)&v34 + 4) = *(void *)(a2 + 72);
      DYTraceEncode_InternalData((uint64_t)&v32, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v14, 0LL);
    }

    if (*(void *)(a2 + 88))
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v15 = *(void *)(a1 + 8);
      *(_DWORD *)(v15 + 32) = 0;
      *(_OWORD *)uint64_t v15 = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      uint64_t v16 = *(void *)(a1 + 8);
      *(_DWORD *)(v16 + 32) = 198;
      *(void *)uint64_t v16 = 0xFFFFD01000000024LL;
      uint64_t v32 = v10;
      int v33 = 127;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      int v36 = 0;
      *(void *)((char *)&v34 + 4) = *(void *)(a2 + 88);
      DYTraceEncode_InternalData((uint64_t)&v32, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v17, 0LL);
    }

    if (*(_WORD *)(a2 + 104))
    {
      unint64_t v18 = 0LL;
      do
      {
        fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
        uint64_t v19 = *(void *)(a1 + 8);
        *(_DWORD *)(v19 + 32) = 0;
        *(_OWORD *)uint64_t v19 = 0u;
        *(_OWORD *)(v19 + 16) = 0u;
        uint64_t v20 = *(void *)(a1 + 8);
        *(_DWORD *)(v20 + 32) = 198;
        *(void *)uint64_t v20 = 0xFFFFD01000000024LL;
        uint64_t v32 = v10;
        int v33 = 129;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        int v36 = 0;
        *(void *)((char *)&v34 + 4) = *(void *)(*(void *)(a2 + 96) + 8 * v18);
        DYTraceEncode_InternalData((uint64_t)&v32, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v21, 0LL);
        ++v18;
      }

      while (v18 < *(unsigned __int16 *)(a2 + 104));
    }

    uint64_t v22 = *(unsigned int **)(a1 + 8);
    unsigned int v23 = v22[8];
    if ((v23 & 0x1000) != 0) {
      unsigned int v24 = v23 & 0xFFFFEFFF;
    }
    else {
      unsigned int v24 = v23 | 0x2000;
    }
    v22[8] = v24;
    unint64_t v25 = *v22;
    if ((v24 & 0x1000) != 0)
    {
      uint64_t v26 = *v22;
      unint64_t v27 = v22;
      do
      {
        unint64_t v27 = (unsigned int *)((char *)v27 + v26);
        uint64_t v26 = *v27;
        v25 += v26;
      }

      while ((*((_BYTE *)v27 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v22, v25);
  }

  else
  {
    uint64_t v28 = *(void *)(a1 + 24);
    uint64_t v29 = *v6;
    if ((v7 & 0x1000) != 0)
    {
      uint64_t v31 = v6;
      unint64_t v30 = *v6;
      do
      {
        uint64_t v31 = (unsigned int *)((char *)v31 + v29);
        uint64_t v29 = *v31;
        v30 += v29;
      }

      while ((*((_BYTE *)v31 + 33) & 0x20) == 0);
    }

    else
    {
      unint64_t v30 = *v6;
    }

    fbstream_write(v28, (uint64_t)v6, v30);
  }

void WriteBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 112);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[1] = 0LL;
  v11[4] = 0x77754300000004LL;
  *uint64_t v11 = 0xFFFFD80C00000028LL;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }

    while ((*((_BYTE *)v15 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  int v16 = *(_DWORD *)(a2 + 88);
  uint64_t v17 = *(void *)(a1 + 8);
  *(void *)(v17 + 16) = 0LL;
  *(void *)(v17 + 24) = 0LL;
  *(void *)(v17 + 8) = 0LL;
  *(_DWORD *)(v17 + 32) = 6;
  *(_DWORD *)(v17 + 36) = 26947;
  *(void *)uint64_t v17 = 0xFFFFC00D00000028LL;
  *(void *)(v17 + 40) = v9;
  *(_DWORD *)(v17 + 48) = v16;
  *(_DWORD *)uint64_t v17 = 52;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  int v19 = v18[8] | a4;
  v18[8] = v19;
  unint64_t v20 = *v18;
  if ((v19 & 0x1000) != 0)
  {
    uint64_t v21 = *v18;
    uint64_t v22 = v18;
    do
    {
      uint64_t v22 = (unsigned int *)((char *)v22 + v21);
      uint64_t v21 = *v22;
      v20 += v21;
    }

    while ((*((_BYTE *)v22 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v20);
  uint64_t v23 = *(unsigned int *)(a2 + 84);
  unsigned int v24 = *(void **)(a1 + 8);
  v24[2] = 0LL;
  v24[3] = 0LL;
  v24[1] = 0LL;
  v24[4] = 0x6C754300000006LL;
  void *v24 = 0xFFFFD81100000028LL;
  v24[5] = v9;
  v24[6] = v23;
  *(_DWORD *)unsigned int v24 = 56;
  unint64_t v25 = *(unsigned int **)(a1 + 8);
  LODWORD(v23) = v25[8] | a4;
  v25[8] = v23;
  unint64_t v26 = *v25;
  if ((v23 & 0x1000) != 0)
  {
    uint64_t v27 = *v25;
    uint64_t v28 = v25;
    do
    {
      uint64_t v28 = (unsigned int *)((char *)v28 + v27);
      uint64_t v27 = *v28;
      v26 += v27;
    }

    while ((*((_BYTE *)v28 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v25, v26);
  uint64_t v29 = *(void *)(a2 + 56);
  if (v29)
  {
    unint64_t v30 = *(void **)(a1 + 8);
    v30[2] = 0LL;
    v30[3] = 0LL;
    v30[1] = 0LL;
    v30[4] = 0x77754300000006LL;
    *unint64_t v30 = 0xFFFFD82500000028LL;
    v30[5] = v9;
    v30[6] = v29;
    *(_DWORD *)unint64_t v30 = 56;
    uint64_t v31 = *(unsigned int **)(a1 + 8);
    int v32 = v31[8] | a4;
    v31[8] = v32;
    unint64_t v33 = *v31;
    if ((v32 & 0x1000) != 0)
    {
      uint64_t v34 = *v31;
      __int128 v35 = v31;
      do
      {
        __int128 v35 = (unsigned int *)((char *)v35 + v34);
        uint64_t v34 = *v35;
        v33 += v34;
      }

      while ((*((_BYTE *)v35 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v31, v33);
  }

  if (*(void *)(a2 + 48))
  {
    uint64_t v36 = *(void *)(a2 + 112) - *(void *)(a2 + 128);
    uint64_t v37 = *(void **)(a1 + 8);
    v37[1] = 0LL;
    v37[2] = 0LL;
    v37[3] = 0LL;
    v37[4] = 0x6C754300000000LL;
    *uint64_t v37 = 0xFFFFD83500000028LL;
    v37[5] = v9;
    v37[6] = v36;
    *(_DWORD *)uint64_t v37 = 56;
  }

  else
  {
    __int128 v38 = *(_OWORD *)(a2 + 128);
    uint64_t v39 = *(void *)(a1 + 8);
    *(void *)(v39 + 8) = 0LL;
    *(void *)(v39 + 16) = 0LL;
    *(void *)(v39 + 24) = 0LL;
    *(void *)uint64_t v39 = 0xFFFFD83600000024LL;
    *(_DWORD *)(v39 + 32) = 4;
    *(void *)(v39 + 36) = 0x7775777543LL;
    *(void *)(v39 + 44) = v9;
    *(_OWORD *)(v39 + 52) = v38;
    *(_DWORD *)uint64_t v39 = 68;
  }

  uint64_t v40 = *(unsigned int **)(a1 + 8);
  int v41 = v40[8] | a4;
  v40[8] = v41;
  unint64_t v42 = *v40;
  if ((v41 & 0x1000) != 0)
  {
    uint64_t v43 = *v40;
    uint64_t v44 = v40;
    do
    {
      uint64_t v44 = (unsigned int *)((char *)v44 + v43);
      uint64_t v43 = *v44;
      v42 += v43;
    }

    while ((*((_BYTE *)v44 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v40, v42);
}

void WriteTextureInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 168);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[1] = 0LL;
  v11[4] = 0x77754300000004LL;
  *uint64_t v11 = 0xFFFFD80D00000028LL;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }

    while ((*((_BYTE *)v15 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  int v16 = *(_DWORD *)(a2 + 88);
  uint64_t v17 = *(void *)(a1 + 8);
  *(void *)(v17 + 16) = 0LL;
  *(void *)(v17 + 24) = 0LL;
  *(void *)(v17 + 8) = 0LL;
  *(_DWORD *)(v17 + 32) = 6;
  *(_DWORD *)(v17 + 36) = 26947;
  *(void *)uint64_t v17 = 0xFFFFC09100000028LL;
  *(void *)(v17 + 40) = v9;
  *(_DWORD *)(v17 + 48) = v16;
  *(_DWORD *)uint64_t v17 = 52;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  int v19 = v18[8] | a4;
  v18[8] = v19;
  unint64_t v20 = *v18;
  if ((v19 & 0x1000) != 0)
  {
    uint64_t v21 = *v18;
    uint64_t v22 = v18;
    do
    {
      uint64_t v22 = (unsigned int *)((char *)v22 + v21);
      uint64_t v21 = *v22;
      v20 += v21;
    }

    while ((*((_BYTE *)v22 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v20);
  int v23 = *(_DWORD *)(a2 + 84);
  uint64_t v24 = *(void *)(a1 + 8);
  *(void *)(v24 + 16) = 0LL;
  *(void *)(v24 + 24) = 0LL;
  *(void *)(v24 + 8) = 0LL;
  *(void *)(v24 + 32) = 0x69754300000006LL;
  *(void *)uint64_t v24 = 0xFFFFD81200000028LL;
  *(void *)(v24 + 40) = v9;
  *(_DWORD *)(v24 + 48) = v23;
  *(_DWORD *)uint64_t v24 = 52;
  unint64_t v25 = *(unsigned int **)(a1 + 8);
  int v26 = v25[8] | a4;
  v25[8] = v26;
  unint64_t v27 = *v25;
  if ((v26 & 0x1000) != 0)
  {
    uint64_t v28 = *v25;
    uint64_t v29 = v25;
    do
    {
      uint64_t v29 = (unsigned int *)((char *)v29 + v28);
      uint64_t v28 = *v29;
      v27 += v28;
    }

    while ((*((_BYTE *)v29 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v25, v27);
  unint64_t v30 = *(uint64_t **)(a2 + 112);
  uint64_t v31 = *(void *)(a1 + 8) + *(unsigned int *)(a1 + 16) - 512LL;
  uint64_t v74 = 512LL;
  int v32 = (const char *)StoreMTLTextureMipmapInfo2UsingEncode(*(void *)(a1 + 32), v30, v31, &v74);
  unint64_t v33 = *(unsigned int **)(a1 + 8);
  *((void *)v33 + 1) = 0LL;
  *((void *)v33 + 2) = 0LL;
  *((void *)v33 + 3) = 0LL;
  *((void *)v33 + 4) = 0x554300000006LL;
  *(void *)unint64_t v33 = 0xFFFFD80900000028LL;
  *((void *)v33 + 5) = v9;
  *unint64_t v33 = 48;
  AppendString(v32, (int *)v33);
  uint64_t v34 = *v33;
  uint64_t v35 = ((_DWORD)v34 + 3) & 0xFFFFFFFC;
  bzero((char *)v33 + v34, v35 - v34);
  *unint64_t v33 = v35;
  uint64_t v36 = *(unsigned int **)(a1 + 8);
  int v37 = v36[8] | a4;
  v36[8] = v37;
  unint64_t v38 = *v36;
  if ((v37 & 0x1000) != 0)
  {
    uint64_t v39 = *v36;
    uint64_t v40 = v36;
    do
    {
      uint64_t v40 = (unsigned int *)((char *)v40 + v39);
      uint64_t v39 = *v40;
      v38 += v39;
    }

    while ((*((_BYTE *)v40 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v36, v38);
  int v41 = *(unsigned __int16 *)(a2 + 212);
  uint64_t v42 = *(void *)(a1 + 8);
  *(void *)(v42 + 16) = 0LL;
  *(void *)(v42 + 24) = 0LL;
  *(void *)(v42 + 8) = 0LL;
  *(void *)(v42 + 32) = 0x69754300000006LL;
  *(void *)uint64_t v42 = 0xFFFFD82300000028LL;
  *(void *)(v42 + 40) = v9;
  *(_DWORD *)(v42 + 48) = v41;
  *(_DWORD *)uint64_t v42 = 52;
  uint64_t v43 = *(unsigned int **)(a1 + 8);
  int v44 = v43[8] | a4;
  v43[8] = v44;
  unint64_t v45 = *v43;
  if ((v44 & 0x1000) != 0)
  {
    uint64_t v46 = *v43;
    unsigned int v47 = v43;
    do
    {
      unsigned int v47 = (unsigned int *)((char *)v47 + v46);
      uint64_t v46 = *v47;
      v45 += v46;
    }

    while ((*((_BYTE *)v47 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v43, v45);
  uint64_t v48 = *(void *)(a2 + 56);
  uint64_t v49 = *(void **)(a1 + 8);
  v49[2] = 0LL;
  v49[3] = 0LL;
  v49[1] = 0LL;
  v49[4] = 0x77754300000006LL;
  void *v49 = 0xFFFFD82400000028LL;
  v49[5] = v9;
  v49[6] = v48;
  *(_DWORD *)uint64_t v49 = 56;
  int v50 = *(unsigned int **)(a1 + 8);
  LODWORD(v48) = v50[8] | a4;
  v50[8] = v48;
  unint64_t v51 = *v50;
  if ((v48 & 0x1000) != 0)
  {
    uint64_t v52 = *v50;
    int v53 = v50;
    do
    {
      int v53 = (unsigned int *)((char *)v53 + v52);
      uint64_t v52 = *v53;
      v51 += v52;
    }

    while ((*((_BYTE *)v53 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v50, v51);
  uint64_t v54 = *(void *)(a2 + 176);
  uint64_t v55 = *(void **)(a1 + 8);
  v55[2] = 0LL;
  v55[3] = 0LL;
  v55[1] = 0LL;
  v55[4] = 0x77754300000004LL;
  void *v55 = 0xFFFFD82A00000028LL;
  v55[5] = v9;
  v55[6] = v54;
  *(_DWORD *)uint64_t v55 = 56;
  uint64_t v56 = *(unsigned int **)(a1 + 8);
  LODWORD(v54) = v56[8] | a4;
  v56[8] = v54;
  unint64_t v57 = *v56;
  if ((v54 & 0x1000) != 0)
  {
    uint64_t v58 = *v56;
    uint64_t v59 = v56;
    do
    {
      uint64_t v59 = (unsigned int *)((char *)v59 + v58);
      uint64_t v58 = *v59;
      v57 += v58;
    }

    while ((*((_BYTE *)v59 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v56, v57);
  if (*(void *)(a2 + 48))
  {
    uint64_t v60 = *(void *)(a2 + 128);
    if (v60) {
      int v61 = *(_DWORD *)(v60 + 64) - *(_DWORD *)(v60 + 72);
    }
    else {
      int v61 = *(_DWORD *)(a2 + 80);
    }
    uint64_t v62 = *(void **)(a1 + 8);
    v62[2] = 0LL;
    v62[3] = 0LL;
    v62[1] = 0LL;
    v62[4] = 0x6C754300000000LL;
    *uint64_t v62 = 0xFFFFD83700000028LL;
    v62[5] = v9;
    v62[6] = v61;
    *(_DWORD *)uint64_t v62 = 56;
    __int128 v63 = *(unsigned int **)(a1 + 8);
    int v64 = v63[8] | a4;
    v63[8] = v64;
    unint64_t v65 = *v63;
    if ((v64 & 0x1000) != 0)
    {
      uint64_t v66 = *v63;
      char v67 = v63;
      do
      {
        char v67 = (unsigned int *)((char *)v67 + v66);
        uint64_t v66 = *v67;
        v65 += v66;
      }

      while ((*((_BYTE *)v67 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v63, v65);
  }

  uint64_t v68 = *(void *)(a2 + 200);
  __int128 v69 = *(void **)(a1 + 8);
  v69[2] = 0LL;
  v69[3] = 0LL;
  v69[1] = 0LL;
  v69[4] = 0x77754300000004LL;
  *__int128 v69 = 0xFFFFD84C00000028LL;
  v69[5] = v9;
  v69[6] = v68;
  *(_DWORD *)__int128 v69 = 56;
  __int128 v70 = *(unsigned int **)(a1 + 8);
  LODWORD(v68) = v70[8] | a4;
  v70[8] = v68;
  unint64_t v71 = *v70;
  if ((v68 & 0x1000) != 0)
  {
    uint64_t v72 = *v70;
    v73 = v70;
    do
    {
      v73 = (unsigned int *)((char *)v73 + v72);
      uint64_t v72 = *v73;
      v71 += v72;
    }

    while ((*((_BYTE *)v73 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v70, v71);
}

void WriteSamplerStateInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 64);
  if (v10)
  {
    uint64_t v11 = *(void **)(a1 + 8);
    v11[2] = 0LL;
    v11[3] = 0LL;
    v11[1] = 0LL;
    v11[4] = 0x77754300000004LL;
    *uint64_t v11 = 0xFFFFD80E00000028LL;
    v11[5] = v9;
    v11[6] = v10;
    *(_DWORD *)uint64_t v11 = 56;
    uint64_t v12 = *(unsigned int **)(a1 + 8);
    int v13 = v12[8] | a4;
    v12[8] = v13;
    unint64_t v14 = *v12;
    if ((v13 & 0x1000) != 0)
    {
      uint64_t v15 = *v12;
      int v16 = v12;
      do
      {
        int v16 = (unsigned int *)((char *)v16 + v15);
        uint64_t v15 = *v16;
        v14 += v15;
      }

      while ((*((_BYTE *)v16 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v14);
  }

  uint64_t v17 = *(void *)(a2 + 72);
  if (v17)
  {
    unint64_t v18 = *(void **)(a1 + 8);
    v18[2] = 0LL;
    v18[3] = 0LL;
    v18[1] = 0LL;
    v18[4] = 0x77754300000004LL;
    *unint64_t v18 = 0xFFFFD84D00000028LL;
    v18[5] = v9;
    v18[6] = v17;
    *(_DWORD *)unint64_t v18 = 56;
    int v19 = *(unsigned int **)(a1 + 8);
    int v20 = v19[8] | a4;
    v19[8] = v20;
    unint64_t v21 = *v19;
    if ((v20 & 0x1000) != 0)
    {
      uint64_t v22 = *v19;
      int v23 = v19;
      do
      {
        int v23 = (unsigned int *)((char *)v23 + v22);
        uint64_t v22 = *v23;
        v21 += v22;
      }

      while ((*((_BYTE *)v23 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v19, v21);
  }

void WriteIndirectCommandBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 120);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[1] = 0LL;
  v11[4] = 0x77754300000004LL;
  *uint64_t v11 = 0xFFFFD81600000028LL;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }

    while ((*((_BYTE *)v15 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  int v16 = *(_DWORD *)(a2 + 88);
  uint64_t v17 = *(void *)(a1 + 8);
  *(void *)(v17 + 16) = 0LL;
  *(void *)(v17 + 24) = 0LL;
  *(void *)(v17 + 8) = 0LL;
  *(_DWORD *)(v17 + 32) = 6;
  *(_DWORD *)(v17 + 36) = 26947;
  *(void *)uint64_t v17 = 0xFFFFC1CC00000028LL;
  *(void *)(v17 + 40) = v9;
  *(_DWORD *)(v17 + 48) = v16;
  *(_DWORD *)uint64_t v17 = 52;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  int v19 = v18[8] | a4;
  v18[8] = v19;
  unint64_t v20 = *v18;
  if ((v19 & 0x1000) != 0)
  {
    uint64_t v21 = *v18;
    uint64_t v22 = v18;
    do
    {
      uint64_t v22 = (unsigned int *)((char *)v22 + v21);
      uint64_t v21 = *v22;
      v20 += v21;
    }

    while ((*((_BYTE *)v22 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v20);
  uint64_t v23 = *(unsigned int *)(a2 + 84);
  uint64_t v24 = *(void **)(a1 + 8);
  v24[2] = 0LL;
  v24[3] = 0LL;
  v24[1] = 0LL;
  v24[4] = 0x6C754300000004LL;
  void *v24 = 0xFFFFD81900000028LL;
  v24[5] = v9;
  v24[6] = v23;
  *(_DWORD *)uint64_t v24 = 56;
  unint64_t v25 = *(unsigned int **)(a1 + 8);
  LODWORD(v23) = v25[8] | a4;
  v25[8] = v23;
  unint64_t v26 = *v25;
  if ((v23 & 0x1000) != 0)
  {
    uint64_t v27 = *v25;
    uint64_t v28 = v25;
    do
    {
      uint64_t v28 = (unsigned int *)((char *)v28 + v27);
      uint64_t v27 = *v28;
      v26 += v27;
    }

    while ((*((_BYTE *)v28 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v25, v26);
  uint64_t v29 = *(void *)(a2 + 56);
  unint64_t v30 = *(void **)(a1 + 8);
  v30[2] = 0LL;
  v30[3] = 0LL;
  v30[1] = 0LL;
  v30[4] = 0x77754300000006LL;
  *unint64_t v30 = 0xFFFFD82600000028LL;
  v30[5] = v9;
  v30[6] = v29;
  *(_DWORD *)unint64_t v30 = 56;
  uint64_t v31 = *(unsigned int **)(a1 + 8);
  LODWORD(v29) = v31[8] | a4;
  v31[8] = v29;
  unint64_t v32 = *v31;
  if ((v29 & 0x1000) != 0)
  {
    uint64_t v33 = *v31;
    uint64_t v34 = v31;
    do
    {
      uint64_t v34 = (unsigned int *)((char *)v34 + v33);
      uint64_t v33 = *v34;
      v32 += v33;
    }

    while ((*((_BYTE *)v34 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v31, v32);
  uint64_t v35 = *(void *)(a2 + 128);
  uint64_t v36 = *(void **)(a1 + 8);
  v36[2] = 0LL;
  v36[3] = 0LL;
  v36[1] = 0LL;
  v36[4] = 0x77754300000004LL;
  *uint64_t v36 = 0xFFFFD84A00000028LL;
  v36[5] = v9;
  v36[6] = v35;
  *(_DWORD *)uint64_t v36 = 56;
  int v37 = *(unsigned int **)(a1 + 8);
  LODWORD(v35) = v37[8] | a4;
  v37[8] = v35;
  unint64_t v38 = *v37;
  if ((v35 & 0x1000) != 0)
  {
    uint64_t v39 = *v37;
    uint64_t v40 = v37;
    do
    {
      uint64_t v40 = (unsigned int *)((char *)v40 + v39);
      uint64_t v39 = *v40;
      v38 += v39;
    }

    while ((*((_BYTE *)v40 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v37, v38);
}

void WriteVisibleFunctionTableInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 136);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[1] = 0LL;
  v11[4] = 0x77754300000004LL;
  *uint64_t v11 = 0xFFFFD82F00000028LL;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }

    while ((*((_BYTE *)v15 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  uint64_t v16 = *(unsigned int *)(a2 + 84);
  uint64_t v17 = *(void **)(a1 + 8);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[1] = 0LL;
  v17[4] = 0x6C754300000000LL;
  *uint64_t v17 = 0xFFFFD84200000028LL;
  v17[5] = v9;
  v17[6] = v16;
  *(_DWORD *)uint64_t v17 = 56;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  LODWORD(v16) = v18[8] | a4;
  v18[8] = v16;
  unint64_t v19 = *v18;
  if ((v16 & 0x1000) != 0)
  {
    uint64_t v20 = *v18;
    uint64_t v21 = v18;
    do
    {
      uint64_t v21 = (unsigned int *)((char *)v21 + v20);
      uint64_t v20 = *v21;
      v19 += v20;
    }

    while ((*((_BYTE *)v21 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v19);
  uint64_t v22 = *(void *)(a2 + 56);
  uint64_t v23 = *(void **)(a1 + 8);
  v23[2] = 0LL;
  v23[3] = 0LL;
  v23[1] = 0LL;
  v23[4] = 0x77754300000000LL;
  *uint64_t v23 = 0xFFFFD83F00000028LL;
  v23[5] = v9;
  v23[6] = v22;
  *(_DWORD *)uint64_t v23 = 56;
  uint64_t v24 = *(unsigned int **)(a1 + 8);
  LODWORD(v22) = v24[8] | a4;
  v24[8] = v22;
  unint64_t v25 = *v24;
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v26 = *v24;
    uint64_t v27 = v24;
    do
    {
      uint64_t v27 = (unsigned int *)((char *)v27 + v26);
      uint64_t v26 = *v27;
      v25 += v26;
    }

    while ((*((_BYTE *)v27 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v24, v25);
  uint64_t v28 = *(void *)(a2 + 152);
  uint64_t v29 = *(void **)(a1 + 8);
  v29[2] = 0LL;
  v29[3] = 0LL;
  v29[1] = 0LL;
  v29[4] = 0x77754300000004LL;
  *uint64_t v29 = 0xFFFFD85000000028LL;
  v29[5] = v9;
  v29[6] = v28;
  *(_DWORD *)uint64_t v29 = 56;
  unint64_t v30 = *(unsigned int **)(a1 + 8);
  LODWORD(v28) = v30[8] | a4;
  v30[8] = v28;
  unint64_t v31 = *v30;
  if ((v28 & 0x1000) != 0)
  {
    uint64_t v32 = *v30;
    uint64_t v33 = v30;
    do
    {
      uint64_t v33 = (unsigned int *)((char *)v33 + v32);
      uint64_t v32 = *v33;
      v31 += v32;
    }

    while ((*((_BYTE *)v33 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v30, v31);
  uint64_t v34 = *(void *)(a2 + 160);
  uint64_t v35 = *(void **)(a1 + 8);
  v35[2] = 0LL;
  v35[3] = 0LL;
  v35[1] = 0LL;
  v35[4] = 0x77754300000000LL;
  *uint64_t v35 = 0xFFFFD85700000028LL;
  v35[5] = v9;
  v35[6] = v34;
  *(_DWORD *)uint64_t v35 = 56;
  uint64_t v36 = *(unsigned int **)(a1 + 8);
  LODWORD(v34) = v36[8] | a4;
  v36[8] = v34;
  unint64_t v37 = *v36;
  if ((v34 & 0x1000) != 0)
  {
    uint64_t v38 = *v36;
    uint64_t v39 = v36;
    do
    {
      uint64_t v39 = (unsigned int *)((char *)v39 + v38);
      uint64_t v38 = *v39;
      v37 += v38;
    }

    while ((*((_BYTE *)v39 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v36, v37);
}

void WriteIntersectionFunctionTableInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 144);
  uint64_t v11 = *(void *)(a1 + 8);
  *(void *)(v11 + 16) = 0LL;
  *(void *)(v11 + 24) = 0LL;
  *(void *)(v11 + 8) = 0LL;
  *(_DWORD *)(v11 + 32) = 1;
  *(_DWORD *)(v11 + 36) = 67;
  *(void *)uint64_t v11 = 0xFFFFD84100000028LL;
  *(void *)(v11 + 40) = v9;
  *(_DWORD *)(v11 + 48) = 30581;
  *(void *)(v11 + 52) = v10;
  *(_DWORD *)uint64_t v11 = 60;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }

    while ((*((_BYTE *)v15 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  uint64_t v16 = *(unsigned int *)(a2 + 84);
  uint64_t v17 = *(void **)(a1 + 8);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[1] = 0LL;
  v17[4] = 0x6C754300000000LL;
  *uint64_t v17 = 0xFFFFD83D00000028LL;
  v17[5] = v9;
  v17[6] = v16;
  *(_DWORD *)uint64_t v17 = 56;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  LODWORD(v16) = v18[8] | a4;
  v18[8] = v16;
  unint64_t v19 = *v18;
  if ((v16 & 0x1000) != 0)
  {
    uint64_t v20 = *v18;
    uint64_t v21 = v18;
    do
    {
      uint64_t v21 = (unsigned int *)((char *)v21 + v20);
      uint64_t v20 = *v21;
      v19 += v20;
    }

    while ((*((_BYTE *)v21 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v19);
  uint64_t v22 = *(void *)(a2 + 56);
  uint64_t v23 = *(void **)(a1 + 8);
  v23[2] = 0LL;
  v23[3] = 0LL;
  v23[1] = 0LL;
  v23[4] = 0x77754300000000LL;
  *uint64_t v23 = 0xFFFFD84000000028LL;
  v23[5] = v9;
  v23[6] = v22;
  *(_DWORD *)uint64_t v23 = 56;
  uint64_t v24 = *(unsigned int **)(a1 + 8);
  LODWORD(v22) = v24[8] | a4;
  v24[8] = v22;
  unint64_t v25 = *v24;
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v26 = *v24;
    uint64_t v27 = v24;
    do
    {
      uint64_t v27 = (unsigned int *)((char *)v27 + v26);
      uint64_t v26 = *v27;
      v25 += v26;
    }

    while ((*((_BYTE *)v27 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v24, v25);
  uint64_t v28 = *(void *)(a2 + 152);
  uint64_t v29 = *(void **)(a1 + 8);
  v29[2] = 0LL;
  v29[3] = 0LL;
  v29[1] = 0LL;
  v29[4] = 0x77754300000004LL;
  *uint64_t v29 = 0xFFFFD84F00000028LL;
  v29[5] = v9;
  v29[6] = v28;
  *(_DWORD *)uint64_t v29 = 56;
  unint64_t v30 = *(unsigned int **)(a1 + 8);
  LODWORD(v28) = v30[8] | a4;
  v30[8] = v28;
  unint64_t v31 = *v30;
  if ((v28 & 0x1000) != 0)
  {
    uint64_t v32 = *v30;
    uint64_t v33 = v30;
    do
    {
      uint64_t v33 = (unsigned int *)((char *)v33 + v32);
      uint64_t v32 = *v33;
      v31 += v32;
    }

    while ((*((_BYTE *)v33 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v30, v31);
}

void WriteAccelerationStructureInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a2 + 152);
  if (v10)
  {
    uint64_t v11 = *(void **)(a1 + 8);
    v11[2] = 0LL;
    v11[3] = 0LL;
    v11[1] = 0LL;
    v11[4] = 0x77754300000000LL;
    *uint64_t v11 = 0xFFFFD84600000028LL;
    v11[5] = v9;
    v11[6] = v10;
    *(_DWORD *)uint64_t v11 = 56;
    uint64_t v12 = *(unsigned int **)(a1 + 8);
    int v13 = v12[8] | a4;
    v12[8] = v13;
    unint64_t v14 = *v12;
    if ((v13 & 0x1000) != 0)
    {
      uint64_t v15 = *v12;
      uint64_t v16 = v12;
      do
      {
        uint64_t v16 = (unsigned int *)((char *)v16 + v15);
        uint64_t v15 = *v16;
        v14 += v15;
      }

      while ((*((_BYTE *)v16 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v14);
  }

  uint64_t v17 = *(void *)(a2 + 160);
  if (v17)
  {
    __int128 v18 = *(_OWORD *)(a2 + 168);
    uint64_t v19 = *(unsigned __int16 *)(a2 + 96);
    __int128 v20 = *(_OWORD *)(a2 + 192);
    uint64_t v21 = *(void *)(a1 + 8);
    *(void *)(v21 + 8) = 0LL;
    *(void *)(v21 + 16) = 0LL;
    *(void *)(v21 + 24) = 0LL;
    *(void *)uint64_t v21 = 0xFFFFD83A00000024LL;
    *(_DWORD *)(v21 + 32) = 0;
    strcpy((char *)(v21 + 36), "Cuwuwuwululul");
    *(_WORD *)(v21 + 50) = 0;
    *(void *)(v21 + 52) = v9;
    *(void *)(v21 + 60) = v17;
    *(_OWORD *)(v21 + 68) = v18;
    *(void *)(v21 + 84) = v19;
    *(_OWORD *)(v21 + 92) = v20;
    *(_DWORD *)uint64_t v21 = 108;
    uint64_t v22 = *(unsigned int **)(a1 + 8);
    int v23 = v22[8] | a4;
    v22[8] = v23;
    unint64_t v24 = *v22;
    if ((v23 & 0x1000) != 0)
    {
      uint64_t v25 = *v22;
      uint64_t v26 = v22;
      do
      {
        uint64_t v26 = (unsigned int *)((char *)v26 + v25);
        uint64_t v25 = *v26;
        v24 += v25;
      }

      while ((*((_BYTE *)v26 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v22, v24);
  }

  uint64_t v27 = *(void *)(a2 + 128);
  uint64_t v28 = *(void *)(a1 + 8);
  *(void *)(v28 + 16) = 0LL;
  *(void *)(v28 + 24) = 0LL;
  *(void *)(v28 + 8) = 0LL;
  *(_DWORD *)(v28 + 32) = 5;
  *(_DWORD *)(v28 + 36) = 67;
  *(void *)uint64_t v28 = 0xFFFFD83B00000028LL;
  *(void *)(v28 + 40) = v9;
  *(_DWORD *)(v28 + 48) = 30581;
  *(void *)(v28 + 52) = v27;
  *(_DWORD *)uint64_t v28 = 60;
  uint64_t v29 = *(unsigned int **)(a1 + 8);
  LODWORD(v27) = v29[8] | a4;
  v29[8] = v27;
  unint64_t v30 = *v29;
  if ((v27 & 0x1000) != 0)
  {
    uint64_t v31 = *v29;
    uint64_t v32 = v29;
    do
    {
      uint64_t v32 = (unsigned int *)((char *)v32 + v31);
      uint64_t v31 = *v32;
      v30 += v31;
    }

    while ((*((_BYTE *)v32 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v29, v30);
  uint64_t v33 = *(unsigned int *)(a2 + 84);
  uint64_t v34 = *(void **)(a1 + 8);
  v34[2] = 0LL;
  v34[3] = 0LL;
  v34[1] = 0LL;
  v34[4] = 0x6C754300000006LL;
  *uint64_t v34 = 0xFFFFD82C00000028LL;
  v34[5] = v9;
  v34[6] = v33;
  *(_DWORD *)uint64_t v34 = 56;
  uint64_t v35 = *(unsigned int **)(a1 + 8);
  LODWORD(v33) = v35[8] | a4;
  v35[8] = v33;
  unint64_t v36 = *v35;
  if ((v33 & 0x1000) != 0)
  {
    uint64_t v37 = *v35;
    uint64_t v38 = v35;
    do
    {
      uint64_t v38 = (unsigned int *)((char *)v38 + v37);
      uint64_t v37 = *v38;
      v36 += v37;
    }

    while ((*((_BYTE *)v38 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v35, v36);
  uint64_t v39 = *(void *)(a2 + 56);
  uint64_t v40 = *(void **)(a1 + 8);
  v40[2] = 0LL;
  v40[3] = 0LL;
  v40[1] = 0LL;
  v40[4] = 0x77754300000006LL;
  void *v40 = 0xFFFFD82B00000028LL;
  v40[5] = v9;
  v40[6] = v39;
  *(_DWORD *)uint64_t v40 = 56;
  int v41 = *(unsigned int **)(a1 + 8);
  LODWORD(v39) = v41[8] | a4;
  v41[8] = v39;
  unint64_t v42 = *v41;
  if ((v39 & 0x1000) != 0)
  {
    uint64_t v43 = *v41;
    int v44 = v41;
    do
    {
      int v44 = (unsigned int *)((char *)v44 + v43);
      uint64_t v43 = *v44;
      v42 += v43;
    }

    while ((*((_BYTE *)v44 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v41, v42);
  int v45 = *(_DWORD *)(a2 + 88);
  uint64_t v46 = *(void *)(a1 + 8);
  *(void *)(v46 + 16) = 0LL;
  *(void *)(v46 + 24) = 0LL;
  *(void *)(v46 + 8) = 0LL;
  *(_DWORD *)(v46 + 32) = 6;
  *(_DWORD *)(v46 + 36) = 26947;
  *(void *)uint64_t v46 = 0xFFFFC2D400000028LL;
  *(void *)(v46 + 40) = v9;
  *(_DWORD *)(v46 + 48) = v45;
  *(_DWORD *)uint64_t v46 = 52;
  unsigned int v47 = *(unsigned int **)(a1 + 8);
  int v48 = v47[8] | a4;
  v47[8] = v48;
  unint64_t v49 = *v47;
  if ((v48 & 0x1000) != 0)
  {
    uint64_t v50 = *v47;
    unint64_t v51 = v47;
    do
    {
      unint64_t v51 = (unsigned int *)((char *)v51 + v50);
      uint64_t v50 = *v51;
      v49 += v50;
    }

    while ((*((_BYTE *)v51 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v47, v49);
  if (*(void *)(a2 + 48))
  {
    uint64_t v52 = *(void *)(*(void *)(a2 + 120) + 72LL) - *(void *)(*(void *)(a2 + 120) + 80LL);
    int v53 = *(void **)(a1 + 8);
    v53[2] = 0LL;
    v53[3] = 0LL;
    v53[1] = 0LL;
    v53[4] = 0x6C754300000000LL;
    void *v53 = 0xFFFFD84700000028LL;
    v53[5] = v9;
    v53[6] = v52;
    *(_DWORD *)int v53 = 56;
    uint64_t v54 = *(unsigned int **)(a1 + 8);
    LODWORD(v52) = v54[8] | a4;
    v54[8] = v52;
    unint64_t v55 = *v54;
    if ((v52 & 0x1000) != 0)
    {
      uint64_t v56 = *v54;
      unint64_t v57 = v54;
      do
      {
        unint64_t v57 = (unsigned int *)((char *)v57 + v56);
        uint64_t v56 = *v57;
        v55 += v56;
      }

      while ((*((_BYTE *)v57 + 33) & 0x20) == 0);
    }

    fbstream_write(*(void *)(a1 + 24), (uint64_t)v54, v55);
  }

  uint64_t v58 = *(void *)(a2 + 136);
  uint64_t v59 = *(void **)(a1 + 8);
  v59[2] = 0LL;
  v59[3] = 0LL;
  v59[1] = 0LL;
  v59[4] = 0x77754300000004LL;
  void *v59 = 0xFFFFD84900000028LL;
  v59[5] = v9;
  v59[6] = v58;
  *(_DWORD *)uint64_t v59 = 56;
  uint64_t v60 = *(unsigned int **)(a1 + 8);
  LODWORD(v58) = v60[8] | a4;
  v60[8] = v58;
  unint64_t v61 = *v60;
  if ((v58 & 0x1000) != 0)
  {
    uint64_t v62 = *v60;
    __int128 v63 = v60;
    do
    {
      __int128 v63 = (unsigned int *)((char *)v63 + v62);
      uint64_t v62 = *v63;
      v61 += v62;
    }

    while ((*((_BYTE *)v63 + 33) & 0x20) == 0);
  }

  fbstream_write(*(void *)(a1 + 24), (uint64_t)v60, v61);
}

void FlushChainedLibraryInfo(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (_BYTE *)(a2 + 8), 8uLL, 0LL);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32LL)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = (unsigned int *)a1[1];
  int v11 = v10[8] | a4;
  v10[8] = v11;
  if (*(_BYTE *)(a2 + 161) == 1)
  {
    v10[8] = v11 | 0x1000;
    fbstream_write(a1[3], (uint64_t)v10, *v10);
    uint64_t v17 = a1[1];
    *(_DWORD *)(v17 + 32) = 0;
    *(_OWORD *)uint64_t v17 = 0u;
    *(_OWORD *)(v17 + 16) = 0u;
    uint64_t v18 = a1[1];
    *(_DWORD *)(v18 + 32) = 198;
    *(void *)uint64_t v18 = 0xFFFFD01000000024LL;
    uint64_t v15 = (unsigned int *)a1[1];
    uint64_t v37 = *a1;
    *(_DWORD *)uint64_t v38 = 127;
    memset(&v38[4], 0, 32);
    int v39 = 0;
    *(void *)&v38[8] = *(void *)(a2 + 136);
  }

  else
  {
    if (*(_BYTE *)(a2 + 161)) {
      goto LABEL_10;
    }
    v10[8] = v11 | 0x1000;
    fbstream_write(a1[3], (uint64_t)v10, *v10);
    uint64_t v13 = a1[1];
    *(_DWORD *)(v13 + 32) = 0;
    *(_OWORD *)uint64_t v13 = 0u;
    *(_OWORD *)(v13 + 16) = 0u;
    uint64_t v14 = a1[1];
    *(_DWORD *)(v14 + 32) = 198;
    *(void *)uint64_t v14 = 0xFFFFD01000000024LL;
    uint64_t v15 = (unsigned int *)a1[1];
    uint64_t v37 = *a1;
    *(void *)uint64_t v38 = 108LL;
    uint64_t v16 = *(void *)(a2 + 144);
    *(void *)&v38[8] = v9;
    *(void *)&v38[16] = v16;
  }

  DYTraceEncode_InternalData((uint64_t)&v37, v15, *((unsigned int *)a1 + 4), v12, 0LL);
  uint64_t v10 = (unsigned int *)a1[1];
  v10[8] |= 0x2000u;
LABEL_10:
  uint64_t v19 = *v10;
  if ((*((_BYTE *)v10 + 33) & 0x10) != 0)
  {
    uint64_t v21 = v10;
    unint64_t v20 = *v10;
    do
    {
      uint64_t v21 = (unsigned int *)((char *)v21 + v19);
      uint64_t v19 = *v21;
      v20 += v19;
    }

    while ((*((_BYTE *)v21 + 33) & 0x20) == 0);
  }

  else
  {
    unint64_t v20 = *v10;
  }

  fbstream_write(a1[3], (uint64_t)v10, v20);
  uint64_t v22 = *(unsigned __int8 *)(a2 + 160);
  uint64_t v23 = a1[1];
  *(void *)(v23 + 16) = 0LL;
  *(void *)(v23 + 24) = 0LL;
  *(void *)(v23 + 8) = 0LL;
  *(_DWORD *)(v23 + 32) = 5;
  *(_DWORD *)(v23 + 36) = 67;
  *(void *)uint64_t v23 = 0xFFFFD83900000028LL;
  *(void *)(v23 + 40) = v9;
  *(_DWORD *)(v23 + 48) = 27765;
  *(void *)(v23 + 52) = v22;
  *(_DWORD *)uint64_t v23 = 60;
  unint64_t v24 = (unsigned int *)a1[1];
  LODWORD(v22) = v24[8] | a4;
  v24[8] = v22;
  unint64_t v25 = *v24;
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v26 = *v24;
    uint64_t v27 = v24;
    do
    {
      uint64_t v27 = (unsigned int *)((char *)v27 + v26);
      uint64_t v26 = *v27;
      v25 += v26;
    }

    while ((*((_BYTE *)v27 + 33) & 0x20) == 0);
  }

  fbstream_write(a1[3], (uint64_t)v24, v25);
  uint64_t v28 = *(const char **)(a2 + 128);
  if (v28)
  {
    uint64_t v29 = (unsigned int *)a1[1];
    *((void *)v29 + 1) = 0LL;
    *((void *)v29 + 2) = 0LL;
    *((void *)v29 + 3) = 0LL;
    *((void *)v29 + 4) = 0x534300000004LL;
    *(void *)uint64_t v29 = 0xFFFFD83400000028LL;
    *((void *)v29 + 5) = v9;
    *uint64_t v29 = 48;
    AppendString(v28, (int *)v29);
    uint64_t v30 = *v29;
    uint64_t v31 = ((_DWORD)v30 + 3) & 0xFFFFFFFC;
    bzero((char *)v29 + v30, v31 - v30);
    *uint64_t v29 = v31;
    uint64_t v32 = (unsigned int *)a1[1];
    int v33 = v32[8] | a4;
    v32[8] = v33;
    unint64_t v34 = *v32;
    if ((v33 & 0x1000) != 0)
    {
      uint64_t v35 = *v32;
      unint64_t v36 = v32;
      do
      {
        unint64_t v36 = (unsigned int *)((char *)v36 + v35);
        uint64_t v35 = *v36;
        v34 += v35;
      }

      while ((*((_BYTE *)v36 + 33) & 0x20) == 0);
    }

    fbstream_write(a1[3], (uint64_t)v32, v34);
  }

void FlushChainedPipelineLibraryInfo(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v7 = (unsigned int *)a1[1];
  v7[8] |= a4 | 0x1000;
  if (*(void *)(a2 + 48))
  {
    fbstream_write(a1[3], (uint64_t)v7, *v7);
    uint64_t v8 = a1[1];
    *(_DWORD *)(v8 + 32) = 0;
    *(_OWORD *)uint64_t v8 = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    uint64_t v9 = a1[1];
    *(_DWORD *)(v9 + 32) = 198;
    *(void *)uint64_t v9 = 0xFFFFD01000000024LL;
    uint64_t v10 = (unsigned int *)a1[1];
    uint64_t v25 = *a1;
    *(_DWORD *)uint64_t v26 = 132;
    memset(&v26[4], 0, 32);
    int v27 = 0;
    *(void *)&v26[8] = *(void *)(a2 + 48);
    DYTraceEncode_InternalData((uint64_t)&v25, v10, *((unsigned int *)a1 + 4), v11, 0LL);
  }

  if (*(_WORD *)(a2 + 80))
  {
    unint64_t v12 = 0LL;
    do
    {
      fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
      uint64_t v13 = a1[1];
      *(_DWORD *)(v13 + 32) = 0;
      *(_OWORD *)uint64_t v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
      uint64_t v14 = a1[1];
      *(_DWORD *)(v14 + 32) = 198;
      *(void *)uint64_t v14 = 0xFFFFD01000000024LL;
      uint64_t v25 = *a1;
      *(void *)uint64_t v26 = 135LL;
      uint64_t v15 = __chkstk_darwin(a1[4], *(void *)(*(void *)(a2 + 64) + 8 * v12));
      *(void *)&v26[8] = SaveFileWithURL(v15, v16, (char *)&v24 - 80, 0LL, 1);
      *(void *)&v26[16] = *(void *)(*(void *)(a2 + 72) + 8 * v12);
      DYTraceEncode_InternalData((uint64_t)&v25, (unsigned int *)a1[1], *((unsigned int *)a1 + 4), v17, 0LL);
      ++v12;
    }

    while (v12 < *(unsigned __int16 *)(a2 + 80));
  }

  uint64_t v18 = (unsigned int *)a1[1];
  unsigned int v19 = v18[8];
  if ((v19 & 0x1000) != 0) {
    unsigned int v20 = v19 & 0xFFFFEFFF;
  }
  else {
    unsigned int v20 = v19 | 0x2000;
  }
  v18[8] = v20;
  unint64_t v21 = *v18;
  if ((v20 & 0x1000) != 0)
  {
    uint64_t v22 = *v18;
    uint64_t v23 = v18;
    do
    {
      uint64_t v23 = (unsigned int *)((char *)v23 + v22);
      uint64_t v22 = *v23;
      v21 += v22;
    }

    while ((*((_BYTE *)v23 + 33) & 0x20) == 0);
  }

  fbstream_write(a1[3], (uint64_t)v18, v21);
}

apr_array_header_t *ActiveDevices(uint64_t a1, uint64_t a2, uint64_t a3, apr_pool_t *p)
{
  int v7 = apr_array_make(p, 2, 8);
  if (*(int *)(a3 + 12) >= 1)
  {
    for (uint64_t i = 0LL; i < *(int *)(a3 + 12); ++i)
    {
      *(void *)&__int128 v17 = *(void *)(*(void *)(a3 + 24) + 8 * i);
      entry = find_entry(a1, &v17, 8uLL, 0LL);
      if (*entry && (uint64_t v10 = *(void *)(*entry + 32LL)) != 0)
      {
        uint64_t v11 = *(void *)(v10 + 32);
        if (v11) {
          uint64_t v12 = v11 + 64;
        }
        else {
          uint64_t v12 = 0LL;
        }
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      if (*(_DWORD *)(v12 + 8) == -15350)
      {
        __int128 v17 = 0uLL;
        uint64_t v18 = 0LL;
        __int128 v20 = 0uLL;
        __int128 v21 = 0uLL;
        LODWORD(v17) = 52;
        uint64_t v19 = -1LL;
        GTMTLSMIOCommandQueue_processTraceFuncWithMap((char *)&v17, a2, (uint64_t *)v12);
        uint64_t v13 = *((void *)&v20 + 1);
        uint64_t nelts = v7->nelts;
        uint64_t v15 = 0LL;
        while (*(void *)&v7->elts[8 * v15] != *((void *)&v20 + 1))
        {
          if (nelts == ++v15) {
            goto LABEL_21;
          }
        }
      }

      else
      {
        __int128 v17 = 0uLL;
        uint64_t v18 = 0LL;
        __int128 v21 = 0uLL;
        __int128 v22 = 0uLL;
        __int128 v20 = 0uLL;
        LODWORD(v17) = 27;
        uint64_t v19 = -1LL;
        BYTE12(v22) = 1;
        WORD4(v22) = 769;
        GTMTLSMCommandQueue_processTraceFuncWithMap((char *)&v17, a2, (uint64_t *)v12);
        uint64_t v13 = *((void *)&v20 + 1);
        uint64_t nelts = v7->nelts;
        uint64_t v15 = 0LL;
        while (*(void *)&v7->elts[8 * v15] != *((void *)&v20 + 1))
        {
          if (nelts == ++v15) {
            goto LABEL_21;
          }
        }
      }

      if ((int)nelts <= (int)v15) {
LABEL_21:
      }
        *(void *)apr_array_push(v7) = v13;
    }
  }

  return v7;
}

uint64_t CommandQueueForCommandBuffer(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 8);
  else {
    return 0LL;
  }
}

apr_array_header_t *ActiveCommandQueues(uint64_t a1, uint64_t a2, apr_pool_t *p)
{
  int v5 = apr_array_make(p, 1, 8);
  if (*(int *)(a2 + 12) >= 1)
  {
    uint64_t v6 = 0LL;
    do
    {
      uint64_t v14 = *(void *)(*(void *)(a2 + 24) + 8 * v6);
      uint64_t v7 = *find_entry(a1, &v14, 8uLL, 0LL);
      if (v7 && (uint64_t v7 = *(void *)(v7 + 32)) != 0 && (v8 = *(void *)(v7 + 32)) != 0 && (*(_BYTE *)(v8 + 79) & 8) != 0) {
        uint64_t v9 = v8 + 64;
      }
      else {
        uint64_t v9 = 0LL;
      }
      uint64_t v10 = CommandQueueForCommandBuffer(*(void *)(v7 + 24), v9);
      uint64_t nelts = v5->nelts;
      uint64_t v12 = 0LL;
      while (*(void *)&v5->elts[8 * v12] != v10)
      {
        if (nelts == ++v12) {
          goto LABEL_14;
        }
      }

      if ((int)nelts <= (int)v12) {
LABEL_14:
      }
        *(void *)apr_array_push(v5) = v10;
      ++v6;
    }

    while (v6 < *(int *)(a2 + 12));
  }

  return v5;
}

apr_array_header_t *OrderDispatchCommandBuffers(uint64_t a1, uint64_t a2, uint64_t a3, apr_pool_t *parent)
{
  uint64_t v8 = newpool;
  uint64_t v43 = (apr_pool_t **)apr_hash_make(newpool);
  uint64_t v9 = apr_array_make(parent, 8, 8);
  if (*(int *)(a3 + 12) >= 1)
  {
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *(void *)(a3 + 24);
      int v12 = *(_DWORD *)(v11 + (v10 << 6) + 8);
      if (v12 > -15344)
      {
        if (v12 <= -15317)
        {
          BOOL v13 = v12 == -15343;
          int v14 = -15318;
          goto LABEL_11;
        }

        if (v12 == -15316) {
          goto LABEL_23;
        }
        if (v12 == -15312)
        {
LABEL_18:
          int v45 = GTTraceFunc_targetContext(v11 + (v10 << 6), a2);
          uint64_t v16 = *find_entry(a1, &v45, 8uLL, 0LL);
          if (v16)
          {
            uint64_t v17 = *(void *)(v16 + 32);
            if (v17)
            {
              uint64_t v18 = *(void *)(v17 + 32);
              if (v18) {
                uint64_t v19 = v18 + 64;
              }
              else {
                uint64_t v19 = 0LL;
              }
LABEL_39:
              uint64_t v32 = GTTraceFunc_argumentBytesWithMap((void *)v19, *(unsigned __int8 *)(v19 + 14), a2);
              if (v32 && *v32)
              {
                uint64_t v33 = *(void *)(v17 + 24);
                uint64_t v34 = CommandQueueForCommandBuffer(v33, v19);
                QueueForRef = GetQueueForRef(v43, v34);
                uint64_t v36 = *(void *)GTTraceFunc_argumentBytesWithPool( (uint64_t *)(v11 + (v10 << 6)),  *(unsigned __int8 *)(v11 + (v10 << 6) + 13),  v33);
                *(void *)apr_array_push(QueueForRef) = v36;
              }

              goto LABEL_52;
            }
          }

          else
          {
            uint64_t v17 = 0LL;
          }

          uint64_t v19 = 0LL;
          goto LABEL_39;
        }
      }

      else
      {
        if (v12 > -16203)
        {
          BOOL v13 = v12 == -16202;
          int v14 = -15908;
LABEL_11:
          if (v13 || v12 == v14)
          {
LABEL_23:
            int v45 = GTTraceFunc_targetContext(v11 + (v10 << 6), a2);
            uint64_t v20 = *find_entry(a1, &v45, 8uLL, 0LL);
            if (v20)
            {
              uint64_t v21 = *(void *)(v20 + 32);
              if (v21)
              {
                uint64_t v22 = *(void *)(v21 + 32);
                if (v22) {
                  uint64_t v23 = v22 + 64;
                }
                else {
                  uint64_t v23 = 0LL;
                }
LABEL_30:
                uint64_t v24 = GTTraceFunc_argumentBytesWithMap((void *)v23, *(unsigned __int8 *)(v23 + 14), a2);
                if (v24 && *v24)
                {
                  uint64_t v25 = *(void *)(v21 + 24);
                  uint64_t v26 = CommandQueueForCommandBuffer(v25, v23);
                  int v27 = GetQueueForRef(v43, v26);
                  uint64_t v28 = *(void *)GTTraceFunc_argumentBytesWithPool( (uint64_t *)(v11 + (v10 << 6)),  *(unsigned __int8 *)(v11 + (v10 << 6) + 13),  v25);
                  uint64_t nelts = v27->nelts;
                  uint64_t v30 = 0LL;
                  elts = v27->elts;
                  while (*(void *)&elts[8 * v30] != v28)
                  {
                    if (nelts == ++v30) {
                      goto LABEL_43;
                    }
                  }

                  if ((_DWORD)nelts == (_DWORD)v30)
                  {
LABEL_43:
                    *(void *)apr_array_push(v27) = v28;
                    elts = v27->elts;
                    LODWORD(v37) = v27->nelts;
                  }

                  else
                  {
                    LODWORD(v37) = v27->nelts;
                    LODWORD(nelts) = v30;
                  }

                  *(void *)&elts[8 * (int)nelts] |= 0x8000000000000000LL;
                  if ((int)v37 < 1)
                  {
                    LODWORD(v39) = 0;
                  }

                  else
                  {
                    uint64_t v38 = *(void *)elts;
                    if ((*(void *)elts & 0x8000000000000000LL) != 0)
                    {
                      uint64_t v40 = 1LL;
                      do
                      {
                        uint64_t v39 = v40;
                        *(void *)apr_array_push(v9) = v38 & 0x7FFFFFFFFFFFFFFFLL;
                        uint64_t v37 = v27->nelts;
                        elts = v27->elts;
                        if (v39 >= v37) {
                          break;
                        }
                        uint64_t v38 = *(void *)&elts[8 * v39];
                        uint64_t v40 = v39 + 1;
                      }

                      while (v38 < 0);
                    }

                    else
                    {
                      LODWORD(v39) = 0;
                    }
                  }

                  int v41 = v37 - v39;
                  v27->uint64_t nelts = v41;
                  memmove(elts, &elts[8 * v39], v27->elt_size * (uint64_t)v41);
                }

                goto LABEL_52;
              }
            }

            else
            {
              uint64_t v21 = 0LL;
            }

            uint64_t v23 = 0LL;
            goto LABEL_30;
          }

          goto LABEL_52;
        }

        if (v12 == -16362) {
          goto LABEL_18;
        }
        if (v12 == -16361) {
          goto LABEL_23;
        }
      }

apr_array_header_t *GetQueueForRef(apr_pool_t **a1, uint64_t a2)
{
  uint64_t v8 = a2;
  uint64_t v3 = *find_entry((uint64_t)a1, &v8, 8uLL, 0LL);
  if (!v3 || (size_t v4 = *(apr_array_header_t **)(v3 + 32)) == 0LL)
  {
    int v5 = *a1;
    size_t v4 = apr_array_make(*a1, 4, 8);
    uint64_t v6 = apr_palloc(v5, 8uLL);
    *uint64_t v6 = v8;
    apr_hash_set((apr_hash_t *)a1, v6, 8LL, v4);
  }

  return v4;
}

void GTTraceDump_writeCapture(uint64_t a1, apr_pool_t *a2, apr_pool_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  v8[0] = *(void *)(a1 + 56);
  v8[0] = *(void *)(*(void *)(*find_entry(v6, v8, 8uLL, 0LL) + 32LL) + 8LL);
  v8[1] = apr_palloc(a3, 0x100000uLL);
  v8[2] = 0x100000LL;
  v8[3] = fbstream_open(a2, (uint64_t)"capture", a3);
  v8[4] = a2;
  v8[5] = a3;
  char v9 = *(_BYTE *)(a1 + 488);
  memset(v10, 0, sizeof(v10));
  uint64_t v7 = (apr_pool_t **)GTTraceDispatch_create(a3, a1);
  GTTraceDispatch_sort((uint64_t)v7);
  GTTraceDispatch_boundaries(v7, (uint64_t)a2);
  GTTraceDispatch_serialize((uint64_t)v7, (uint64_t)v8);
  apr_pool_destroy(*v7);
}

uint64_t GTTraceDump_writeUnsortedCapture(uint64_t a1, apr_pool_t *a2, apr_pool_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 544);
  uint64_t v7 = *(void *)(a1 + 16);
  v13[0] = *(void *)(a1 + 56);
  v13[0] = *(void *)(*(void *)(*find_entry(v7, v13, 8uLL, 0LL) + 32LL) + 8LL);
  v13[1] = apr_palloc(a3, 0x100000uLL);
  v13[2] = 0x100000LL;
  uint64_t v8 = fbstream_open(a2, (uint64_t)"unsorted-capture", a3);
  data = v8;
  uint64_t v15 = a2;
  uint64_t v16 = 0LL;
  char v17 = *(_BYTE *)(a1 + 488);
  memset(v18, 0, sizeof(v18));
  if (*(int *)(v6 + 12) < 1)
  {
    uint64_t v11 = v8;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    do
    {
      GTTraceFuncToFbuf(v13, a1, *(void *)(v6 + 24) + v9, 0LL);
      ++v10;
      v9 += 64LL;
    }

    while (v10 < *(int *)(v6 + 12));
    uint64_t v11 = (apr_pool_t **)data;
  }

  apr_pool_cleanup_kill(*v11, v11, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  return fbstream_cleanup((uint64_t)v11);
}

uint64_t ResourceTracker_addCommandQueues(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a2 + 12) >= 1)
  {
    int v5 = (uint64_t *)result;
    uint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(a2 + 24) + 8 * v6);
      uint64_t v8 = *(void *)(a3 + 16);
      uint64_t v10 = v7;
      if (*(_DWORD *)(*(void *)(*(void *)(*find_entry(v8, &v10, 8uLL, 0LL) + 32LL) + 32LL) + 72LL) == -15350) {
        int v9 = 52;
      }
      else {
        int v9 = 27;
      }
      uint64_t result = GTResourceTrackerUsingResource(v5[2], v9, v7, *v5, v5[1]);
      ++v6;
    }

    while (v6 < *(int *)(a2 + 12));
  }

  return result;
}

uint64_t ResourceTracker_addDrawables(uint64_t *a1, uint64_t a2, unint64_t a3, apr_pool_t *p)
{
  uint64_t v7 = apr_array_make(p, 4, 8);
  uint64_t result = (uint64_t)GTMTLSMContext_getObjects(*(_DWORD **)(a2 + 240), a3, v7);
  if (v7->nelts >= 1)
  {
    uint64_t v9 = 0LL;
    do
    {
      uint64_t v10 = *(void *)&v7->elts[8 * v9];
      uint64_t v11 = *(void *)(v10 + 48);
      uint64_t result = (uint64_t)find_entry(a1[2], &v11, 8uLL, 0LL);
      if (*(void *)result)
      {
        if (*(void *)(*(void *)result + 32LL)) {
          uint64_t result = GTResourceTrackerUsingResource(a1[2], 2, *(void *)(v10 + 8), *a1, a1[1]);
        }
      }

      ++v9;
    }

    while (v9 < v7->nelts);
  }

  return result;
}

uint64_t *ResourceTracker_addIndirectCommands(uint64_t *result, uint64_t a2)
{
  if (*(int *)(a2 + 12) >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    do
    {
      uint64_t result = GTResourceTrackerProcessIndirectCommandResourceUse(v3, *(void *)(a2 + 24) + v4);
      ++v5;
      v4 += 64LL;
    }

    while (v5 < *(int *)(a2 + 12));
  }

  return result;
}

BOOL IsAppleInternalLabel(BOOL result)
{
  if (result)
  {
    BOOL v1 = result;
    if (!strncmp((const char *)result, "com.apple.", 0xAuLL))
    {
      uint64_t v2 = 0LL;
      uint64_t v3 = (const char *)(v1 + 10);
      do
      {
        int v4 = strcmp(v3, off_20E570[v2]);
        uint64_t result = v4 != 0;
        if (!v4) {
          break;
        }
      }

      while (v2++ != 5);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

apr_array_header_t *GTTraceContextDumpGetBoundDownloadRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = apr_array_make(*(apr_pool_t **)a1, 16, 88);
  if (*(int *)(a1 + 344) >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)(a1 + 64);
    do
    {
      uint64_t v8 = *(void *)(*(void *)(v7 + 24) + 8 * v6);
      uint64_t v30 = *(void *)(v8 + 8);
      entry = find_entry(a2, &v30, 8uLL, 0LL);
      if (!*entry || !*(void *)(*entry + 32LL))
      {
        uint64_t v30 = *(void *)(v8 + 8);
        uint64_t v10 = *(void *)(*(void *)(*find_entry(v4, &v30, 8uLL, 0LL) + 32LL) + 8LL);
        uint64_t v11 = *(void *)(v8 + 8);
        int v12 = (char *)apr_array_push(v5);
        *(void *)int v12 = v10;
        *((void *)v12 + 1) = v11;
        *((void *)v12 + 3) = 0LL;
        *((void *)v12 + 4) = 0LL;
        *((void *)v12 + 2) = 0LL;
        *(void *)(v12 + 38) = 0LL;
        v12[46] = 22;
        *(_OWORD *)(v12 + 47) = 0u;
        *(_OWORD *)(v12 + 63) = 0u;
        *(_OWORD *)(v12 + 72) = 0u;
      }

      ++v6;
    }

    while (v6 < *(int *)(a1 + 344));
  }

  if (*(int *)(a1 + 348) >= 1)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)(a1 + 72);
    do
    {
      uint64_t v15 = *(void **)(*(void *)(v14 + 24) + 8 * v13);
      if (!v15[17] && !v15[18] && !v15[24])
      {
        uint64_t v16 = v15[13];
        if (!v16 || !*(_BYTE *)(v16 + 44))
        {
          uint64_t v30 = v15[1];
          char v17 = find_entry(a2, &v30, 8uLL, 0LL);
          if (!*v17 || !*(void *)(*v17 + 32LL))
          {
            uint64_t v18 = v15[13];
            if (!v18 || (*(_WORD *)(v18 + 36) & 0xF0) != 0x30)
            {
              uint64_t v30 = v15[1];
              uint64_t v19 = *(void *)(*(void *)(*find_entry(v4, &v30, 8uLL, 0LL) + 32LL) + 8LL);
              uint64_t v20 = v15[1];
              uint64_t v21 = (char *)apr_array_push(v5);
              *(void *)uint64_t v21 = v19;
              *((void *)v21 + 1) = v20;
              *((void *)v21 + 3) = 0LL;
              *((void *)v21 + 4) = 0LL;
              *((void *)v21 + 2) = 0LL;
              *(void *)(v21 + 38) = 0LL;
              v21[46] = 80;
              *(_OWORD *)(v21 + 47) = 0u;
              *(_OWORD *)(v21 + 63) = 0u;
              *(_OWORD *)(v21 + 72) = 0u;
            }
          }
        }
      }

      ++v13;
    }

    while (v13 < *(int *)(a1 + 348));
  }

  if (*(int *)(a1 + 368) >= 1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = *(void *)(a1 + 112);
    do
    {
      uint64_t v24 = *(void *)(*(void *)(v23 + 24) + 8 * v22);
      uint64_t v30 = *(void *)(v24 + 8);
      uint64_t v25 = find_entry(a2, &v30, 8uLL, 0LL);
      if (!*v25 || !*(void *)(*v25 + 32LL))
      {
        uint64_t v30 = *(void *)(v24 + 8);
        uint64_t v26 = *(void *)(*(void *)(*find_entry(v4, &v30, 8uLL, 0LL) + 32LL) + 16LL);
        uint64_t v27 = *(void *)(v24 + 8);
        uint64_t v28 = (char *)apr_array_push(v5);
        *(void *)uint64_t v28 = v26;
        *((void *)v28 + 1) = v27;
        *((void *)v28 + 3) = 0LL;
        *((void *)v28 + 4) = 0LL;
        *((void *)v28 + 2) = 0LL;
        *(void *)(v28 + 38) = 0LL;
        v28[46] = 83;
        *(_OWORD *)(v28 + 47) = 0u;
        *(_OWORD *)(v28 + 63) = 0u;
        *(_OWORD *)(v28 + 72) = 0u;
      }

      ++v22;
    }

    while (v22 < *(int *)(a1 + 368));
  }

  return v5;
}

apr_array_header_t *GTTraceContextDumpGetUnusedDownloadRequest(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = apr_array_make( *(apr_pool_t **)a1,  *(_DWORD *)(v3 + 12)
       + *(_DWORD *)(v4 + 12)
       + *(_DWORD *)(*(void *)(a1 + 112) + 12LL)
       + *(_DWORD *)(v5 + 12)
       - (*(_DWORD *)(a1 + 344)
        + *(_DWORD *)(a1 + 348)
        + *(_DWORD *)(a1 + 368)
        + *(_DWORD *)(a1 + 376)),
         88);
  uint64_t v7 = *(int *)(a1 + 344);
  if ((int)v7 < *(_DWORD *)(v4 + 12))
  {
    do
    {
      uint64_t v8 = *(void *)(*(void *)(v4 + 24) + 8 * v7);
      if (v8) {
        uint64_t v9 = *(void *)(v8 + 8);
      }
      else {
        uint64_t v9 = 0LL;
      }
      uint64_t v25 = v9;
      uint64_t v10 = *(void *)(*(void *)(*find_entry(v2, &v25, 8uLL, 0LL) + 32LL) + 8LL);
      uint64_t v11 = (char *)apr_array_push(v6);
      *(void *)uint64_t v11 = v10;
      *((void *)v11 + 1) = v9;
      *((void *)v11 + 3) = 0LL;
      *((void *)v11 + 4) = 0LL;
      *((void *)v11 + 2) = 0LL;
      *(void *)(v11 + 38) = 0LL;
      v11[46] = 22;
      *(_OWORD *)(v11 + 47) = 0u;
      *(_OWORD *)(v11 + 63) = 0u;
      *(_OWORD *)(v11 + 72) = 0u;
      ++v7;
    }

    while (v7 < *(int *)(v4 + 12));
  }

  uint64_t v12 = *(int *)(a1 + 348);
  int v13 = *(_DWORD *)(v3 + 12);
  if ((int)v12 < v13)
  {
    do
    {
      uint64_t v14 = *(void **)(*(void *)(v3 + 24) + 8 * v12);
      if (!v14[17] && !v14[18])
      {
        uint64_t v15 = v14[1];
        uint64_t v16 = v14[13];
        if (!v16 || (*(_WORD *)(v16 + 36) & 0xF0) != 0x30 && !*(_BYTE *)(v16 + 43))
        {
          uint64_t v25 = v15;
          uint64_t v17 = *(void *)(*(void *)(*find_entry(v2, &v25, 8uLL, 0LL) + 32LL) + 8LL);
          uint64_t v18 = (char *)apr_array_push(v6);
          *(void *)uint64_t v18 = v17;
          *((void *)v18 + 1) = v15;
          *((void *)v18 + 3) = 0LL;
          *((void *)v18 + 4) = 0LL;
          *((void *)v18 + 2) = 0LL;
          *(void *)(v18 + 38) = 0LL;
          v18[46] = 80;
          *(_OWORD *)(v18 + 47) = 0u;
          *(_OWORD *)(v18 + 63) = 0u;
          *(_OWORD *)(v18 + 72) = 0u;
          int v13 = *(_DWORD *)(v3 + 12);
        }
      }

      ++v12;
    }

    while (v12 < v13);
  }

  uint64_t v19 = *(int *)(a1 + 376);
  if ((int)v19 < *(_DWORD *)(v5 + 12))
  {
    do
    {
      uint64_t v20 = *(void *)(*(void *)(v5 + 24) + 8 * v19);
      if (v20) {
        uint64_t v21 = *(void *)(v20 + 8);
      }
      else {
        uint64_t v21 = 0LL;
      }
      uint64_t v25 = v21;
      uint64_t v22 = *(void *)(*(void *)(*find_entry(v2, &v25, 8uLL, 0LL) + 32LL) + 16LL);
      uint64_t v23 = (char *)apr_array_push(v6);
      *(void *)uint64_t v23 = v22;
      *((void *)v23 + 1) = v21;
      *((void *)v23 + 3) = 0LL;
      *((void *)v23 + 4) = 0LL;
      *((void *)v23 + 2) = 0LL;
      *(void *)(v23 + 38) = 0LL;
      v23[46] = 16;
      *(_OWORD *)(v23 + 47) = 0u;
      *(_OWORD *)(v23 + 63) = 0u;
      *(_OWORD *)(v23 + 72) = 0u;
      ++v19;
    }

    while (v19 < *(int *)(v5 + 12));
  }

  return v6;
}

apr_hash_t *DownloadsByCommandBuffer(uint64_t a1, uint64_t a2, apr_pool_t *pool)
{
  uint64_t v6 = apr_hash_make(pool);
  if (*(int *)(a2 + 12) >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 16LL;
    do
    {
      uint64_t v9 = (_BYTE *)(*(void *)(a2 + 24) + v8);
      if (*(void *)v9)
      {
        entry = find_entry(*(void *)(a1 + 32), v9 - 8, 8uLL, 0LL);
        if (*entry)
        {
          uint64_t v11 = *(void *)(*entry + 32LL);
          if (v11)
          {
            if (*(_BYTE *)(v11 + 48))
            {
              uint64_t v12 = *find_entry((uint64_t)v6, v9, 8uLL, 0LL);
              if (!v12 || (int v13 = *(apr_array_header_t **)(v12 + 32)) == 0LL)
              {
                int v13 = apr_array_make(pool, 1, 8);
                uint64_t v14 = apr_palloc(pool, 8uLL);
                *uint64_t v14 = *(void *)v9;
                apr_hash_set(v6, v14, 8LL, v13);
              }

              *(void *)apr_array_push(v13) = v9 - 16;
            }
          }
        }
      }

      ++v7;
      v8 += 88LL;
    }

    while (v7 < *(int *)(a2 + 12));
  }

  return v6;
}

void DownloadsByResource(uint64_t a1, apr_hash_t *ht)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 >= 1)
  {
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 24);
      int v7 = v5;
      uint64_t v8 = (v2 - v5);
      if ((int)v8 < 1)
      {
        LODWORD(v8) = 0;
      }

      else if ((_DWORD)v8 == 1)
      {
        LODWORD(v8) = 1;
      }

      else
      {
        uint64_t v9 = v6 + 88LL * v5;
        uint64_t v10 = *(void *)(v9 + 8);
        uint64_t v11 = (_DWORD *)(v9 + 128);
        uint64_t v12 = 1LL;
        while (v10 == *((void *)v11 - 4) && *(_DWORD *)(v6 + 88LL * v5 + 40) == *v11)
        {
          ++v12;
          v11 += 22;
          if (v8 == v12) {
            goto LABEL_13;
          }
        }

        LODWORD(v8) = v12;
      }

apr_hash_t *DownloadsByResourceDelta(uint64_t a1, uint64_t a2, apr_pool_t *pool)
{
  int v5 = apr_hash_make(pool);
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 16) = a2;
  *(_DWORD *)(a2 + 40) = 0;
  uint64_t v6 = apr_hash_next((apr_hash_index_t *)(a2 + 16));
  if (v6)
  {
    int v7 = v6;
    do
    {
      uint64_t v8 = *(_BYTE **)(*((void *)v7 + 1) + 32LL);
      uint64_t v9 = *find_entry(*(void *)(a1 + 32), v8 + 8, 8uLL, 0LL);
      if (v9)
      {
        uint64_t v10 = *(void *)(v9 + 32);
        if (v10)
        {
          uint64_t v11 = *(void *)(v10 + 32);
          if (v11 != -1)
          {
            uint64_t v12 = *(void *)(v10 + 24);
            BOOL v13 = v12 != -1 && v12 <= v11;
            if (v13 && !*(_BYTE *)(v10 + 48)) {
              apr_hash_set(v5, v8 + 8, 8LL, v8);
            }
          }
        }
      }

      int v7 = apr_hash_next(v7);
    }

    while (v7);
  }

  return v5;
}

uint64_t GTTraceDump_startContext(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = (os_log_s *)g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "TraceContextDumpStart",  "",  buf,  2u);
  }

  apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL);
  uint64_t v9 = newpool;
  apr_pool_create_ex(&p, newpool, 0LL, 0LL);
  uint64_t v10 = (char *)apr_palloc(v9, 0x258uLL);
  uint64_t v11 = (uint64_t)v10;
  if (v10) {
    bzero(v10 + 8, 0x250uLL);
  }
  *(void *)uint64_t v11 = v9;
  *(void *)(v11 + 40) = a3;
  *(void *)(v11 + 48) = a4;
  *(void *)(v11 + 536) = GTTraceContext_buildBacktraceMap(a1, v9);
  *(void *)(v11 + 8) = a1;
  *(_BYTE *)(v11 + 488) = 0;
  *(void *)(v11 + 32) = a2;
  *(_DWORD *)(v11 + 484) = 3;
  v104 = 0LL;
  uint64_t v100 = a4;
  uint64_t v12 = GTTraceContext_copyStreamMapAndBuildDispatchArray(a1, a3, a4, v9, &v104);
  BOOL v13 = v104;
  *(void *)(v11 + 16) = v104;
  *((void *)v13 + 3) = 0LL;
  *((void *)v13 + 4) = 0LL;
  *((void *)v13 + 2) = v13;
  *((_DWORD *)v13 + 10) = 0;
  uint64_t v14 = apr_hash_next((apr_hash_t *)((char *)v13 + 16));
  if (v14)
  {
    while (1)
    {
      uint64_t v15 = *(void *)(*((void *)v14 + 1) + 32LL);
      if (v15) {
        break;
      }
LABEL_14:
      uint64_t v14 = apr_hash_next(v14);
      if (!v14)
      {
        uint64_t v9 = newpool;
        goto LABEL_16;
      }
    }

    uint64_t v16 = (unint64_t *)(v15 + 56);
    unint64_t v17 = atomic_load(v16);
    while (1)
    {
      unint64_t v18 = __ldaxr(v16);
      if (v18 != v17) {
        break;
      }
      if (__stlxr(v17 | 0x10, v16)) {
        goto LABEL_12;
      }
      int v19 = 1;
LABEL_13:
      unint64_t v17 = v18;
      if (v19) {
        goto LABEL_14;
      }
    }

    __clrex();
LABEL_12:
    int v19 = 0;
    goto LABEL_13;
  }

LABEL_92:
      ++v63;
    }

    while (v63 < v36->nelts);
  }

  v36->uint64_t nelts = v64;
  uint64_t v74 = newpool;
  *(void *)(v11 + 568) = GTMTLSMContext_buildDeviceMirrorWithIgnoreFlags( *(void *)(v11 + 16),  *(void *)(v11 + 24),  *(void *)(v11 + 544),  *(void *)(v11 + 56),  v65,  v100,  newpool,  0,  0LL);
  uint64_t v75 = GTResourceTrackerMake(*(void *)(v11 + 16), *(void *)(v11 + 24), v74);
  uint64_t v76 = p;
  ResourceTracker_addFunctionHandles(v75, *(void *)(v11 + 568), v65, p);
  ResourceTracker_addAccelerationStructures(v75, *(void *)(v11 + 568), v65, v76);
  ResourceTracker_addResourceGroups(v75, *(void *)(v11 + 568), v65, v76);
  uint64_t v77 = *(void *)(v11 + 552);
  if (*(int *)(v77 + 12) >= 1)
  {
    uint64_t v78 = 0LL;
    do
    {
      uint64_t v79 = *(void *)(*(void *)(v77 + 24) + 8 * v78);
      GTResourceTrackerProcessCommandBuffer(v75, v79, 1);
      uint64_t v80 = *(void *)(v11 + 16);
      *(void *)buf = v79;
      uint64_t v81 = *find_entry(v80, buf, 8uLL, 0LL);
      if (v81) {
        uint64_t v82 = *(void *)(v81 + 32);
      }
      else {
        uint64_t v82 = 0LL;
      }
      unint64_t v83 = CommandBufferCommitIndex(v82);
      ResourceTracker_addChainedResources(v75, *(uint64_t **)(v11 + 568), v83, v76);
      ResourceTracker_addDrawables(v75, *(void *)(v11 + 568), v83, v76);
      ResourceTracker_addIndirectResources(v75, *(_DWORD ***)(v11 + 568), v83, v76);
      ResourceTracker_addLibraries(v75, *(void *)(v11 + 568), v83, v76);
      ResourceTracker_addFunctionHandles(v75, *(void *)(v11 + 568), v83, v76);
      ResourceTracker_addAccelerationStructures(v75, *(void *)(v11 + 568), v83, v76);
      ResourceTracker_addResourceGroups(v75, *(void *)(v11 + 568), v83, v76);
      apr_pool_clear(v76);
      ++v78;
      uint64_t v77 = *(void *)(v11 + 552);
    }

    while (v78 < *(int *)(v77 + 12));
  }

  uint64_t v84 = *(void *)(v11 + 544);
  if (*(int *)(v84 + 12) >= 1)
  {
    uint64_t v85 = 0LL;
    uint64_t v86 = 0LL;
    do
    {
      GTResourceTrackerProcessIndirectCommandResourceUse(v75, *(void *)(v84 + 24) + v85);
      ++v86;
      v85 += 64LL;
    }

    while (v86 < *(int *)(v84 + 12));
  }

  uint64_t v11 = v103;
  ResourceTracker_addCommandQueues((uint64_t)v75, (uint64_t)v37, v103);
  ResourceTracker_postAccumulateHeapReads(v75);
  ResourceTracker_processAccelerationStructureReads((uint64_t)v75);
  ResourceTracker_processUsedDrawables((uint64_t)v75);
  uint64_t v87 = 0LL;
  *(void *)(v103 + 528) = v75[2];
  *(void *)(v103 + 576) = v75;
  do
  {
    unint64_t v88 = apr_array_make(v74, 16, 8);
    uint64_t v89 = v103 + 8 * v87;
    *(void *)(v89 + 64) = v88;
    if ((v87 + 1) > 0x24)
    {
      unsigned int v90 = 0;
    }

    else
    {
      unsigned int v90 = dword_1C2CC0[v87 + 1] - 2;
      if (v90 > 0x51) {
        goto LABEL_111;
      }
    }

    int v91 = byte_1C2D54[v90];
    if ((v91 & 0x80000000) == 0)
    {
      __int128 v92 = *(_DWORD **)(*(void *)(v103 + 568) + 8LL * v91 + 8);
      goto LABEL_112;
    }

LABEL_111:
    __int128 v92 = 0LL;
LABEL_112:
    GTMTLSMContext_getObjects(v92, v65, v88);
    *(_DWORD *)(v103 + 344 + 4 * v87++) = GTMTLSMObject_sortUsedResources( *(uint64_t **)(*(void *)(v89 + 64) + 24LL),  *(_DWORD *)(*(void *)(v89 + 64) + 12LL),  *(void *)(v103 + 528));
  }

  while (v87 != 35);
  __int128 v93 = (apr_pool_t **)apr_hash_make(v74);
  *(void *)(v103 + 520) = v93;
  GTMTLSMContext_buildResourceChildrenMap(*(uint64_t **)(v103 + 568), v65, v93);
  GTMTLSMContext_buildLibraryFunctionsMap(*(void *)(v103 + 568), v65, *(apr_pool_t ***)(v103 + 520));
  char v94 = apr_array_copy(v74, (const apr_array_header_t *)v102[24]);
  v95 = apr_hash_make(v74);
  *(void *)(v103 + 496) = v95;
  DownloadsByResource((uint64_t)v94, v95);
  *(void *)(v103 + 512) = DownloadsByCommandBuffer((uint64_t)v75, (uint64_t)v94, v74);
  BoundDownloadRequest = GTTraceContextDumpGetBoundDownloadRequest(v103, *(void *)(v103 + 496));
  __int128 v97 = GTResourceDownloaderProcessRequest(*(apr_pool_t **)v103, (uint64_t)BoundDownloadRequest);
  DownloadFromDevice(*(void *)(v103 + 16), *(void *)(v103 + 56), (uint64_t)v97);
  DownloadsByResource((uint64_t)v97, *(apr_hash_t **)(v103 + 496));
  *(void *)(v103 + 504) = DownloadsByResourceDelta((uint64_t)v75, *(void *)(v103 + 496), v74);
LABEL_114:
  apr_pool_destroy(p);
  __int128 v98 = (os_log_s *)g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v98,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "TraceContextDumpStart",  "",  buf,  2u);
  }

  return v11;
}

void GTTraceDump_endContext(uint64_t a1)
{
  int v2 = GTTraceContext_cleanupTransientStreams(*(void *)(a1 + 8), *(apr_pool_t **)a1);
  if (v2) {
    ReleaseDebugObjects((uint64_t *)v2->elts, v2->nelts);
  }
  apr_pool_destroy(*(apr_pool_t **)a1);
}

int32x2_t GTTraceContextDumpUnusedCount@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 144);
  uint64_t v5 = *(int *)(a1 + 384);
  if ((int)v5 >= *(_DWORD *)(v4 + 12))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    do
    {
      entry = find_entry(*(void *)(a1 + 520), (_BYTE *)(*(void *)(*(void *)(v4 + 24) + 8 * v5) + 8LL), 8uLL, 0LL);
      if (*entry)
      {
        uint64_t v8 = *(void *)(*entry + 32LL);
        if (v8) {
          v6 += *(int *)(v8 + 12);
        }
      }

      ++v5;
    }

    while (v5 < *(int *)(v4 + 12));
  }

  v9.i32[0] = *(_DWORD *)(*(void *)(a1 + 64) + 12LL);
  v9.i32[1] = *(_DWORD *)(*(void *)(a1 + 72) + 12LL);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 200);
  uint64_t v12 = *(int *)(*(void *)(a1 + 208) + 12LL) - (uint64_t)*(int *)(a1 + 416);
  *(void *)(a2 + 16) = *(int *)(*(void *)(a1 + 80) + 12LL) - (uint64_t)*(int *)(a1 + 352);
  *(void *)(a2 + 24) = v12;
  uint64_t v13 = *(int *)(v10 + 12) - (uint64_t)*(int *)(a1 + 356);
  uint64_t v14 = *(void *)(a1 + 104);
  uint64_t v15 = *(int *)(*(void *)(a1 + 96) + 12LL) - (uint64_t)*(int *)(a1 + 360);
  int32x2_t v16 = vsub_s32(v9, *(int32x2_t *)(a1 + 344));
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v15;
  uint64_t v17 = *(int *)(v14 + 12) - (uint64_t)*(int *)(a1 + 364);
  *(void *)(a2 + 48) = *(int *)(v11 + 12) - (uint64_t)*(int *)(a1 + 412);
  *(void *)(a2 + 56) = v17;
  v18.i32[0] = *(_DWORD *)(*(void *)(a1 + 128) + 12LL);
  v18.i32[1] = *(_DWORD *)(*(void *)(a1 + 136) + 12LL);
  uint64_t v19 = *(int *)(*(void *)(a1 + 176) + 12LL) - (uint64_t)*(int *)(a1 + 400);
  uint64_t v20 = *(int *)(*(void *)(a1 + 168) + 12LL) - (uint64_t)*(int *)(a1 + 396);
  *(void *)&__int128 v21 = v16.i32[0];
  *((void *)&v21 + 1) = v16.i32[1];
  *(_OWORD *)a2 = v21;
  int32x2_t v22 = vsub_s32(v18, *(int32x2_t *)(a1 + 376));
  *(void *)&__int128 v21 = v22.i32[0];
  *((void *)&v21 + 1) = v22.i32[1];
  *(_OWORD *)(a2 + 64) = v21;
  *(void *)(a2 + 80) = v19;
  *(void *)(a2 + 88) = v20;
  v18.i32[0] = *(_DWORD *)(*(void *)(a1 + 240) + 12LL);
  v18.i32[1] = *(_DWORD *)(*(void *)(a1 + 248) + 12LL);
  int32x2_t result = vsub_s32(v18, *(int32x2_t *)(a1 + 432));
  *(void *)&__int128 v21 = result.i32[0];
  *((void *)&v21 + 1) = result.i32[1];
  int32x2_t result = (int32x2_t)result.i32[0];
  *(_OWORD *)(a2 + 96) = v21;
  *(void *)(a2 + 112) = 0LL;
  *(void *)(a2 + 120) = v6;
  *(void *)(a2 + 128) = *(int *)(*(void *)(a1 + 144) + 12LL) - (uint64_t)*(int *)(a1 + 384);
  return result;
}

uint64_t GTTraceContextDumpActiveDevice(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

BOOL GTTraceContextDumpContainsValidCommandBuffers(uint64_t a1)
{
  return *(_DWORD *)(*(void *)(a1 + 552) + 12LL) > 0;
}

uint64_t GTTraceContextDumpEmptyCapture(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = atomic_load((unint64_t *)(*(void *)(a1 + 8) + 80LL));
  uint64_t v4 = (v3 << 32) + 0x100000000LL;
  if ((unint64_t)v4 < 0x100000001LL)
  {
    uint64_t v18 = 0LL;
    uint64_t v8 = 0LL;
    goto LABEL_17;
  }

  unint64_t v5 = v4 >> 32;
  unint64_t v6 = 1LL;
  do
  {
    while (1)
    {
      v19[0] = v6;
      uint64_t v7 = *find_entry(v2, v19, 8uLL, 0LL);
      if (!v7)
      {
        uint64_t v8 = 0LL;
        break;
      }

      uint64_t v8 = *(void *)(v7 + 32);
      if (!v8) {
        break;
      }
      uint64_t v9 = *(void *)(v8 + 32);
      if (!v9 || (*(_BYTE *)(v9 + 79) & 8) == 0) {
        break;
      }
      ++v6;
      if (*(_DWORD *)(v9 + 72) == -10239 || v6 >= v5)
      {
        uint64_t v18 = v9 + 64;
        goto LABEL_17;
      }
    }

    ++v6;
  }

  while (v6 < v5);
  uint64_t v18 = 0LL;
LABEL_17:
  uint64_t v11 = (char *)apr_palloc(*(apr_pool_t **)a1, 0x400uLL);
  v19[0] = *(void *)(v8 + 8);
  v19[1] = v11;
  v19[2] = 1024LL;
  uint64_t v12 = fbstream_open(*(apr_pool_t **)(a1 + 32), (uint64_t)"startup-0-platform", *(apr_pool_t **)a1);
  uint64_t v13 = *(void *)(a1 + 32);
  data = v12;
  uint64_t v21 = v13;
  uint64_t v22 = 0LL;
  char v23 = *(_BYTE *)(a1 + 488);
  memset(v24, 0, sizeof(v24));
  GTTraceFuncToFbuf(v19, a1, v18, 4LL);
  uint64_t v14 = data;
  apr_pool_cleanup_kill(*(apr_pool_t **)data, data, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  fbstream_cleanup((uint64_t)v14);
  uint64_t v15 = fbstream_open(*(apr_pool_t **)(a1 + 32), (uint64_t)"capture", *(apr_pool_t **)a1);
  data = v15;
  apr_pool_cleanup_kill(*v15, v15, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  fbstream_cleanup((uint64_t)v15);
  snprintf(v11, 0x400uLL, "delta-device-resources-0x%llx", v19[0]);
  int32x2_t v16 = fbstream_open(*(apr_pool_t **)(a1 + 32), (uint64_t)v11, *(apr_pool_t **)a1);
  data = v16;
  apr_pool_cleanup_kill(*v16, v16, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  return fbstream_cleanup((uint64_t)v16);
}

uint64_t HashBytes(uint64_t *a1, unint64_t a2, char *a3)
{
  if (a2 < 0x20)
  {
    unint64_t v12 = 0x27D4EB2F165667C5LL;
  }

  else
  {
    unint64_t v3 = 0LL;
    unint64_t v4 = (unint64_t)a1 + a2 - 31;
    unint64_t v5 = 0x61C8864E7A143579LL;
    unint64_t v6 = 0x60EA27EEADC0B5D6LL;
    unint64_t v7 = 0xC2B2AE3D27D4EB4FLL;
    do
    {
      uint64_t v8 = __ROR8__(v6 - 0x3D4D51C2D82B14B1LL * *a1, 33);
      unint64_t v6 = 0x9E3779B185EBCA87LL * v8;
      uint64_t v9 = __ROR8__(v7 - 0x3D4D51C2D82B14B1LL * a1[1], 33);
      unint64_t v7 = 0x9E3779B185EBCA87LL * v9;
      uint64_t v10 = __ROR8__(v3 - 0x3D4D51C2D82B14B1LL * a1[2], 33);
      unint64_t v3 = 0x9E3779B185EBCA87LL * v10;
      uint64_t v11 = __ROR8__(v5 - 0x3D4D51C2D82B14B1LL * a1[3], 33);
      unint64_t v5 = 0x9E3779B185EBCA87LL * v11;
      a1 += 4;
    }

    while ((unint64_t)a1 < v4);
    unint64_t v12 = 0x85EBCA77C2B2AE63LL
        - 0x61C8864E7A143579LL
        * ((0x85EBCA77C2B2AE63LL
          - 0x61C8864E7A143579LL
          * ((0x85EBCA77C2B2AE63LL
            - 0x61C8864E7A143579LL
            * ((0x85EBCA77C2B2AE63LL
              - 0x61C8864E7A143579LL
              * ((__ROR8__(v7, 57) + __ROR8__(v6, 63) + __ROR8__(v3, 52) + __ROR8__(v5, 46)) ^ (0x9E3779B185EBCA87LL
                                                                                              * __ROR8__( 0xDEF35B010F796CA9LL * v8,  33)))) ^ (0x9E3779B185EBCA87LL * __ROR8__(0xDEF35B010F796CA9LL * v9, 33)))) ^ (0x9E3779B185EBCA87LL * __ROR8__(0xDEF35B010F796CA9LL * v10, 33)))) ^ (0x9E3779B185EBCA87LL * __ROR8__(0xDEF35B010F796CA9LL * v11, 33)));
  }

  unint64_t v13 = v12 + a2;
  unint64_t v14 = a2 & 0x1F;
  if (v14 >= 8)
  {
    do
    {
      uint64_t v15 = *a1++;
      unint64_t v13 = 0x85EBCA77C2B2AE63LL
          - 0x61C8864E7A143579LL * __ROR8__((0x9E3779B185EBCA87LL * __ROR8__(0xC2B2AE3D27D4EB4FLL * v15, 33)) ^ v13, 37);
      v14 -= 8LL;
    }

    while (v14 > 7);
  }

  if (v14 >= 4)
  {
    unsigned int v16 = *(_DWORD *)a1;
    a1 = (uint64_t *)((char *)a1 + 4);
    unint64_t v13 = 0x165667B19E3779F9LL - 0x3D4D51C2D82B14B1LL * __ROR8__((0x9E3779B185EBCA87LL * v16) ^ v13, 41);
    v14 -= 4LL;
  }

  for (; v14; --v14)
  {
    unsigned int v17 = *(unsigned __int8 *)a1;
    a1 = (uint64_t *)((char *)a1 + 1);
    unint64_t v13 = 0x9E3779B185EBCA87LL * __ROR8__((0x27D4EB2F165667C5LL * v17) ^ v13, 53);
  }

  unint64_t v18 = 0x165667B19E3779F9LL
      * ((0xC2B2AE3D27D4EB4FLL * (v13 ^ (v13 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v13 ^ (v13 >> 33))) >> 29));
  sprintf(a3, "%llX", v18 ^ HIDWORD(v18));
  return 0LL;
}

uint64_t SavePointer(uint64_t a1, uint64_t *a2, const void *a3, uint64_t a4)
{
  if (a4)
  {
    __int128 v8 = v14;
    *(_OWORD *)(a4 + 32) = v13;
    *(_OWORD *)(a4 + 48) = v8;
    *(_BYTE *)(a4 + 64) = v15;
    __int128 v9 = v12;
    *(_OWORD *)a4 = *(_OWORD *)__s;
    *(_OWORD *)(a4 + 16) = v9;
  }

  return a4;
}

char *SaveFileWithURL(uint64_t a1, char *a2, char *a3, void *a4, int a5)
{
  if (!a2) {
    return 0LL;
  }
  int v9 = open(a2, 0, 0LL);
  if (v9 < 0) {
    return 0LL;
  }
  int v10 = v9;
  uint64_t v11 = (const void *)lseek(v9, 0LL, 2);
  __int128 v12 = (uint64_t *)mmap(0LL, (size_t)v11, 1, 2, v10, 0LL);
  close(v10);
  if (a4) {
    *a4 -= 65LL;
  }
  if (a5) {
    SavePointer(a1, v12, v11, (uint64_t)a3);
  }
  else {
    GTMTLCaptureState_storePointer(a1, a3, v12, v11);
  }
  munmap(v12, (size_t)v11);
  return a3;
}

char *SaveFilePath(uint64_t a1, char *a2, char *a3, void *a4)
{
  return SaveFileWithURL(a1, a2, a3, a4, 1);
}

uint64_t GTTrace_storePointer(uint64_t result, int a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a5;
  uint64_t v8 = (uint64_t)a4;
  uint64_t v49 = a5;
  int v10 = &a4[a5];
  uint64_t v11 = *(void *)(result + 32);
  if (a2 <= -15553)
  {
    if (a2 <= -16030)
    {
      if (a2 <= -16164)
      {
        if (a2 <= -16228)
        {
          if (a2 > -16354)
          {
            switch(a2)
            {
              case -16311:
                int32x2_t result = StoreMTLDepthStencilDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
                goto LABEL_161;
              case -16310:
                goto LABEL_88;
              case -16309:
                int32x2_t result = StoreMTLSamplerDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
                goto LABEL_161;
              case -16308:
              case -16299:
              case -16298:
              case -16297:
              case -16296:
              case -16295:
                return result;
              case -16307:
                goto LABEL_105;
              case -16306:
                goto LABEL_218;
              case -16305:
              case -16304:
                uint64_t v30 = *(void *)(a3 + 16);
                if (*(_BYTE *)(result + 48))
                {
                  uint64_t v8 = *(void *)(a3 + 16);
                }

                else if (v30)
                {
                  uint64_t v7 = a5 - 65;
                  uint64_t v49 = a5 - 65;
                  SavePointer(v11, (uint64_t *)(v30 + 16), (const void *)*(unsigned int *)(v30 + 12), (uint64_t)a4);
                }

                else
                {
                  uint64_t v8 = 0LL;
                }

                *(void *)(a3 + 16) = v8;
                int32x2_t result = StoreMTLCompileOptionsUsingEncode_13637( v11,  *(void *)(a3 + 24),  (uint64_t)&v10[-v7],  &v49,  a6);
                goto LABEL_285;
              case -16303:
              case -16302:
              case -16301:
              case -16300:
                int32x2_t result = StoreMTLRenderPipelineDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
                goto LABEL_161;
              case -16294:
                *(void *)(a3 + 16) = StoreMTLTextureDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
                int32x2_t result = StoreIOSurfaceUsingEncode(v11, *(void *)(a3 + 24), (uint64_t)&v10[-v49], &v49);
                goto LABEL_285;
              default:
                if (a2 != -16353 && a2 != -16351) {
                  return result;
                }
                int32x2_t result = StoreMTLRenderPassDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
                break;
            }

            goto LABEL_161;
          }

          if (a2 == -18432)
          {
            int32x2_t result = StoreMTLFXSpatialScalerDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
            goto LABEL_161;
          }

          if (a2 == -18431)
          {
            int32x2_t result = StoreMTLFXTemporalScalerDescriptorUsingEncode( *(void *)(result + 32),  *(unsigned __int16 **)(a3 + 16),  (uint64_t)a4,  &v49);
            goto LABEL_161;
          }

          if (a2 != -16368) {
            return result;
          }
          goto LABEL_88;
        }

        if (a2 > -16201)
        {
          switch(a2)
          {
            case -16200:
            case -16199:
            case -16198:
            case -16197:
              uint64_t v13 = *(void *)(a3 + 16);
              uint64_t v14 = *(void *)(result + 32);
              uint64_t v15 = (uint64_t)a4;
              goto LABEL_95;
            default:
              if (a2 != -16165) {
                return result;
              }
              int32x2_t result = StoreMTLCommandQueueDescriptorUsingEncode( *(void *)(result + 32),  *(unsigned __int8 **)(a3 + 16),  (uint64_t)a4,  &v49);
              break;
          }

          goto LABEL_161;
        }

        if (a2 == -16227 || a2 == -16225) {
          goto LABEL_158;
        }
        int v17 = -16223;
LABEL_157:
        if (a2 != v17) {
          return result;
        }
        goto LABEL_158;
      }

      if (a2 <= -16040)
      {
        switch(a2)
        {
          case -16120:
            int32x2_t result = StoreMTLHeapDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
            goto LABEL_161;
          case -16119:
          case -16118:
          case -16117:
          case -16115:
          case -16114:
          case -16113:
          case -16111:
          case -16110:
          case -16109:
          case -16108:
          case -16105:
          case -16103:
          case -16102:
          case -16100:
          case -16097:
          case -16094:
          case -16093:
          case -16092:
          case -16086:
          case -16085:
          case -16084:
          case -16083:
          case -16080:
          case -16079:
          case -16078:
            return result;
          case -16116:
          case -16104:
          case -16099:
          case -16098:
            goto LABEL_88;
          case -16112:
            int32x2_t result = StoreMTLTextureDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 24),  (uint64_t)a4,  &v49);
            goto LABEL_285;
          case -16107:
          case -16106:
          case -16082:
          case -16081:
            int32x2_t result = StoreMTLFunctionConstantValuesUsingEncode( *(void *)(result + 32),  *(uint64_t **)(a3 + 24),  (uint64_t)a4,  &v49);
            goto LABEL_285;
          case -16101:
            goto LABEL_151;
          case -16096:
            goto LABEL_168;
          case -16095:
          case -16087:
            goto LABEL_218;
          case -16091:
          case -16090:
          case -16089:
          case -16088:
            int32x2_t result = StoreMTLTileRenderPipelineDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
            goto LABEL_161;
          case -16077:
            int32x2_t result = StoreMTLViewportUsingEncode( *(void *)(result + 32),  *(const void **)(a3 + 8),  (uint64_t)a4,  &v49,  *(void *)(a3 + 16));
            goto LABEL_245;
          case -16076:
            int32x2_t result = StoreMTLScissorRectUsingEncode( *(void *)(result + 32),  *(const void **)(a3 + 8),  (uint64_t)a4,  &v49,  *(void *)(a3 + 16));
            goto LABEL_245;
          default:
            if (a2 != -16163)
            {
              int v17 = -16143;
              goto LABEL_157;
            }

            int32x2_t result = StoreIOSurfaceUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
            break;
        }

        goto LABEL_161;
      }

      if (a2 == -16039) {
        goto LABEL_105;
      }
      if (a2 != -16031)
      {
        if (a2 == -16030)
        {
          int32x2_t result = StoreMTLTextureDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 40),  (uint64_t)a4,  &v49);
LABEL_238:
          *(void *)(a3 + 40) = result;
        }

        return result;
      }

LABEL_168:
      int32x2_t result = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 32), (uint64_t)a4, &v49);
LABEL_241:
      *(void *)(a3 + 32) = result;
      return result;
    }

    if (a2 > -15720)
    {
      if (a2 > -15618)
      {
        switch(a2)
        {
          case -15587:
            int32x2_t result = StoreMTLBlitPassDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
            goto LABEL_161;
          case -15586:
            int32x2_t result = StoreMTLComputePassDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
            goto LABEL_161;
          case -15585:
            int32x2_t result = StoreMTLResourceStatePassDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
            goto LABEL_161;
          case -15584:
            int32x2_t result = StoreMTLComputePassDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
            *(void *)(a3 + 16) = result;
            uint64_t v16 = *(void *)(a3 + 24);
            if (!v16) {
              goto LABEL_226;
            }
            uint64_t v8 = (uint64_t)&v10[-v49];
            goto LABEL_141;
          case -15583:
          case -15582:
          case -15581:
          case -15580:
          case -15579:
            return result;
          case -15578:
LABEL_89:
            int32x2_t result = StoreMTLVisibleFunctionTableDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
            goto LABEL_161;
          case -15577:
            goto LABEL_84;
          default:
            switch(a2)
            {
              case -15617:
                int32x2_t result = StoreMTLFunctionDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 24),  (uint64_t)a4,  &v49,  a6);
                goto LABEL_285;
              case -15616:
              case -15614:
              case -15612:
              case -15611:
              case -15610:
                return result;
              case -15615:
                goto LABEL_160;
              case -15613:
                goto LABEL_105;
              case -15609:
              case -15608:
LABEL_56:
                int32x2_t result = StoreMTLFunctionDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
                goto LABEL_161;
              default:
                if (a2 != -15597) {
                  return result;
                }
                int32x2_t result = UnwrapArray_( *(void *)(result + 32),  *(void *)(a3 + 8),  (uint64_t)a4,  &v49,  *(void *)(a3 + 24),  a6);
                break;
            }

            goto LABEL_245;
        }
      }

      if (a2 > -15675)
      {
        if (a2 <= -15665)
        {
          switch(a2)
          {
            case -15674:
              goto LABEL_158;
            case -15666:
LABEL_173:
              int32x2_t result = StoreMTLComputePipelineDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
              break;
            case -15665:
LABEL_113:
              int32x2_t result = StoreMTLRenderPipelineDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
              break;
            default:
              return result;
          }

          goto LABEL_245;
        }

        if (a2 > -15639)
        {
          if (a2 != -15638)
          {
            int v17 = -15624;
            goto LABEL_157;
          }
        }

        else
        {
          if (a2 == -15664)
          {
            int32x2_t result = StoreMTLTileRenderPipelineDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
            goto LABEL_245;
          }

          if (a2 != -15647) {
            return result;
          }
        }

LABEL_160:
        int32x2_t result = StoreMTLAccelerationStructureDescriptorUsingEncode( *(void *)(result + 32),  *(unsigned __int8 **)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
        goto LABEL_161;
      }

      if (a2 > -15708)
      {
        if (a2 == -15707) {
          goto LABEL_218;
        }
        if (a2 == -15701)
        {
          int32x2_t result = StoreMTLCommandBufferDescriptorUsingEncode( *(void *)(result + 32),  *(uint64_t **)(a3 + 16),  (uint64_t)a4,  &v49,  a6);
          goto LABEL_161;
        }

        if (a2 != -15693) {
          return result;
        }
        uint64_t v20 = *(unint64_t **)(a3 + 24);
        uint64_t v21 = *(void *)(result + 32);
        uint64_t v22 = (uint64_t)a4;
LABEL_275:
        int32x2_t result = UnwrapMTLArray_(v21, v20, v22, &v49, a6);
        goto LABEL_285;
      }

      if (a2 != -15719 && a2 != -15716)
      {
        if (a2 != -15714) {
          return result;
        }
LABEL_74:
        uint64_t v16 = *(void *)(a3 + 24);
        if (v16) {
          goto LABEL_141;
        }
        goto LABEL_226;
      }
    }

    else
    {
      if (a2 <= -15831)
      {
        if (a2 <= -15892)
        {
          switch(a2)
          {
            case -15980:
              goto LABEL_88;
            case -15979:
            case -15978:
            case -15977:
            case -15976:
            case -15975:
            case -15974:
            case -15973:
            case -15970:
            case -15968:
            case -15967:
            case -15966:
            case -15965:
              return result;
            case -15972:
            case -15969:
              int32x2_t result = StoreMTLIndirectCommandBufferDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
              goto LABEL_161;
            case -15971:
              goto LABEL_218;
            case -15964:
            case -15962:
              uint64_t v27 = *(void *)(a3 + 40);
              if (v27) {
                int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v27 + 16),  (const void *)*(unsigned int *)(v27 + 12),  (uint64_t)a4);
              }
              else {
                uint64_t v8 = 0LL;
              }
              *(void *)(a3 + 40) = v8;
              return result;
            case -15963:
            case -15961:
              uint64_t v28 = *(void *)(a3 + 40);
              if (v28)
              {
                uint64_t v7 = a5 - 65;
                int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v28 + 16),  (const void *)*(unsigned int *)(v28 + 12),  (uint64_t)a4);
              }

              else
              {
                uint64_t v8 = 0LL;
              }

              *(void *)(a3 + 40) = v8;
              uint64_t v12 = *(void *)(a3 + 48);
              if (!v12) {
                goto LABEL_256;
              }
              uint64_t v8 = (uint64_t)&v10[-v7];
              goto LABEL_255;
            default:
              if (a2 != -16029 && a2 != -16018) {
                return result;
              }
LABEL_151:
              char v23 = *(unint64_t **)(a3 + 16);
              if (v23)
              {
                uint64_t v24 = *v23;
                uint64_t v25 = UnwrapMTLArray_(*(void *)(result + 32), v23, (uint64_t)a4, &v49, a6);
                uint64_t v7 = v49;
              }

              else
              {
                uint64_t v25 = 0LL;
                uint64_t v24 = 0LL;
              }

              *(void *)(a3 + 16) = v25;
              int32x2_t result = StoreMTLImageFilterFunctionInfoSPIUsingEncode( v11,  *(void *)(a3 + 24),  (uint64_t)&v10[-v7],  &v49,  v24);
              break;
          }

          goto LABEL_285;
        }

        if (a2 == -15891)
        {
          int32x2_t result = StoreMTLMotionEstimationPipelineDescriptorUsingEncode( *(void *)(result + 32),  *(unsigned __int16 **)(a3 + 16),  (uint64_t)a4,  &v49);
          goto LABEL_161;
        }

        if (a2 == -15848)
        {
          int32x2_t result = StoreMTLCounterSampleBufferDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
          goto LABEL_161;
        }

        if (a2 != -15847) {
          return result;
        }
        int32x2_t result = StoreMTLImageFilterFunctionInfoSPIUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 32),  (uint64_t)a4,  &v49,  *(void *)(a3 + 24));
        goto LABEL_241;
      }

      if (a2 > -15754)
      {
        switch(a2)
        {
          case -15741:
            goto LABEL_173;
          case -15740:
          case -15738:
          case -15737:
          case -15735:
          case -15734:
          case -15733:
          case -15732:
            return result;
          case -15739:
            goto LABEL_113;
          case -15736:
            int32x2_t result = StoreMTLCaptureDescriptorUsingEncode( *(void *)(result + 32),  *(uint64_t **)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
            goto LABEL_245;
          case -15731:
            goto LABEL_218;
          case -15730:
            goto LABEL_129;
          default:
            if (a2 == -15753) {
              goto LABEL_158;
            }
            if (a2 != -15746) {
              return result;
            }
            uint64_t v29 = *(void *)(a3 + 8);
            if (v29)
            {
              uint64_t v7 = a5 - 65;
              int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v29 + 16),  (const void *)*(unsigned int *)(v29 + 12),  (uint64_t)a4);
            }

            else
            {
              uint64_t v8 = 0LL;
            }

            *(void *)(a3 + 8) = v8;
            uint64_t v39 = *(void *)(a3 + 16);
            if (!v39) {
              goto LABEL_281;
            }
            uint64_t v8 = (uint64_t)&v10[-v7];
            break;
        }

        goto LABEL_219;
      }

      if (a2 <= -15794)
      {
        if (a2 == -15830) {
          goto LABEL_218;
        }
        if (a2 != -15822) {
          return result;
        }
        int32x2_t result = StoreMTLVertexAmplificationViewMappingUsingEncode( *(void *)(result + 32),  *(const void **)(a3 + 16),  (uint64_t)a4,  &v49,  *(void *)(a3 + 8));
        goto LABEL_161;
      }

      if (a2 == -15793)
      {
        int32x2_t result = StoreMTLRasterizationRateMapDescriptorUsingEncode( *(void *)(result + 32),  *(const char ***)(a3 + 16),  (uint64_t)a4,  &v49);
        goto LABEL_161;
      }

      if (a2 != -15777)
      {
        if (a2 == -15756)
        {
          uint64_t v12 = *(void *)(a3 + 48);
          if (v12) {
LABEL_255:
          }
            int32x2_t result = SavePointer(v11, (uint64_t *)(v12 + 16), (const void *)*(unsigned int *)(v12 + 12), v8);
          else {
LABEL_256:
          }
            uint64_t v8 = 0LL;
          *(void *)(a3 + 48) = v8;
        }

        return result;
      }
    }

LABEL_161:
      *(void *)(a3 + 16) = result;
      return result;
    }

    if (a2 != -15531)
    {
      if (a2 != -15524 && a2 != -15522) {
        return result;
      }
LABEL_96:
      int32x2_t result = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 16), (uint64_t)a4, &v49, a6);
      goto LABEL_161;
    }

LABEL_218:
      uint64_t v39 = *(void *)(a3 + 16);
      if (!v39)
      {
LABEL_281:
        uint64_t v8 = 0LL;
        goto LABEL_282;
      }

LABEL_219:
      int32x2_t result = SavePointer(v11, (uint64_t *)(v39 + 16), (const void *)*(unsigned int *)(v39 + 12), v8);
LABEL_282:
      *(void *)(a3 + 16) = v8;
      return result;
    }

    if (a2 != -15281)
    {
      if (a2 == -15273)
      {
LABEL_129:
        uint64_t v19 = *(void *)(a3 + 16);
        if (v19)
        {
          uint64_t v7 = a5 - 65;
          int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v19 + 16),  (const void *)*(unsigned int *)(v19 + 12),  (uint64_t)a4);
        }

        else
        {
          uint64_t v8 = 0LL;
        }

        *(void *)(a3 + 16) = v8;
        goto LABEL_139;
      }

      int v17 = -15272;
      goto LABEL_157;
    }

LABEL_158:
    uint64_t v26 = *(void *)(a3 + 8);
    if (v26) {
      int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v26 + 16),  (const void *)*(unsigned int *)(v26 + 12),  (uint64_t)a4);
    }
    else {
      uint64_t v8 = 0LL;
    }
    *(void *)(a3 + 8) = v8;
    return result;
  }

  if (a2 <= -10230)
  {
    if (a2 <= -12273)
    {
      if (a2 == -15260 || a2 == -15259) {
        goto LABEL_218;
      }
      if (a2 != -15245) {
        return result;
      }
      int32x2_t result = StoreMTLResidencySetDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 16),  (uint64_t)a4,  &v49);
      goto LABEL_161;
    }

    if (a2 <= -10240)
    {
      if (a2 != -12272)
      {
        if (a2 != -10240) {
          return result;
        }
        goto LABEL_218;
      }

      int v38 = *(_DWORD *)(a3 + 8);
      if (v38 == 116) {
        goto LABEL_218;
      }
      if (v38 != 111) {
        return result;
      }
      int32x2_t result = StoreMTLFunctionConstantValuesUsingEncode( *(void *)(result + 32),  *(uint64_t **)(a3 + 16),  (uint64_t)a4,  &v49);
      goto LABEL_161;
    }

    if (a2 == -10239)
    {
      int32x2_t result = StoreMTLDeviceDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49);
    }

    else
    {
      if (a2 != -10231) {
        return result;
      }
      int32x2_t result = StoreMTLTextureMipmapInfo2UsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 8), (uint64_t)a4, &v49);
    }

LABEL_245:
    *(void *)(a3 + 8) = result;
    return result;
  }

  if (a2 <= -10158)
  {
    if (a2 != -10229)
    {
      if (a2 != -10194)
      {
        if (a2 != -10190) {
          return result;
        }
        uint64_t v18 = *(void *)(a3 + 8);
        if (v18)
        {
          uint64_t v7 = a5 - 65;
          int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v18 + 16),  (const void *)*(unsigned int *)(v18 + 12),  (uint64_t)a4);
        }

        else
        {
          uint64_t v8 = 0LL;
        }

        *(void *)(a3 + 8) = v8;
LABEL_139:
        uint64_t v16 = *(void *)(a3 + 24);
        if (v16)
        {
          uint64_t v8 = (uint64_t)&v10[-v7];
LABEL_141:
          int32x2_t result = SavePointer(v11, (uint64_t *)(v16 + 16), (const void *)*(unsigned int *)(v16 + 12), v8);
LABEL_227:
          *(void *)(a3 + 24) = v8;
          return result;
        }

LABEL_226:
        uint64_t v8 = 0LL;
        goto LABEL_227;
      }

      goto LABEL_158;
    }

    uint64_t v40 = *(void *)(a3 + 8);
    if (v40)
    {
      uint64_t v7 = a5 - 65;
      int32x2_t result = SavePointer( *(void *)(result + 32),  (uint64_t *)(v40 + 16),  (const void *)*(unsigned int *)(v40 + 12),  (uint64_t)a4);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    *(void *)(a3 + 8) = v8;
    uint64_t v42 = *(void *)(a3 + 16);
    uint64_t v43 = -v7;
    if (v42)
    {
      uint64_t v44 = &v10[-v7];
      int32x2_t result = SavePointer(v11, (uint64_t *)(v42 + 16), (const void *)*(unsigned int *)(v42 + 12), (uint64_t)&v10[-v7]);
      uint64_t v43 = 65 - v7;
      v7 -= 65LL;
    }

    else
    {
      uint64_t v44 = 0LL;
    }

    *(void *)(a3 + 16) = v44;
    uint64_t v45 = *(void *)(a3 + 24);
    if (v45)
    {
      uint64_t v46 = &v10[v43];
      int32x2_t result = SavePointer(v11, (uint64_t *)(v45 + 16), (const void *)*(unsigned int *)(v45 + 12), (uint64_t)&v10[v43]);
      uint64_t v43 = 65 - v7;
    }

    else
    {
      uint64_t v46 = 0LL;
    }

    *(void *)(a3 + 24) = v46;
    uint64_t v47 = *(void *)(a3 + 32);
    if (v47)
    {
      int v48 = &v10[v43];
      int32x2_t result = SavePointer(v11, (uint64_t *)(v47 + 16), (const void *)*(unsigned int *)(v47 + 12), (uint64_t)&v10[v43]);
    }

    else
    {
      int v48 = 0LL;
    }

    *(void *)(a3 + 32) = v48;
  }

  else
  {
    switch(a2)
    {
      case -10157:
        int32x2_t result = StoreMTLFunctionDescriptorUsingEncode( *(void *)(result + 32),  *(void *)(a3 + 8),  (uint64_t)a4,  &v49,  a6);
        goto LABEL_245;
      case -10156:
        int32x2_t result = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 8), (uint64_t)a4, &v49, a6);
        goto LABEL_245;
      case -10154:
        goto LABEL_160;
      case -10152:
        goto LABEL_158;
      default:
        return result;
    }
  }

  return result;
}

uint64_t StoreMTLImageFilterFunctionInfoSPIUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLImageFilterFunctionInfoSPI(a2, a5, 0LL, 0LL);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLImageFilterFunctionInfoSPI(a2, a5, v11, (unint64_t)v10);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLFunctionConstantValuesUsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLFunctionConstantValues(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLFunctionConstantValues(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t UnwrapMTLArray_(uint64_t a1, unint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)(8 * *a2 + 16);
  __chkstk_darwin();
  uint64_t v12 = (uint64_t *)((char *)&v16 - ((v11 + 31) & 0xFFFFFFFFFFFFFFF0LL));
  *uint64_t v12 = 81LL;
  v12[1] = v13;
  if (v13)
  {
    unint64_t v14 = 0LL;
    do
    {
      unint64_t v16 = a2[v14 + 1];
      v12[v14++ + 2] = *(void *)(*(void *)(*find_entry(a5, &v16, 8uLL, 0LL) + 32LL) + 8LL);
    }

    while (*a2 > v14);
  }

  *a4 -= 65LL;
  SavePointer(a1, v12, v10, a3);
  return a3;
}

uint64_t UnwrapArray_(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v12 = (const void *)(8 * a5);
  __chkstk_darwin();
  if (v13)
  {
    unint64_t v14 = 0LL;
    unsigned int v15 = 1;
    do
    {
      uint64_t v17 = *(void *)(a2 + 8 * v14);
      *(uint64_t *)((char *)&v17 + 8 * v14 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)) = *(void *)(*(void *)(*find_entry(a6, &v17, 8uLL, 0LL) + 32LL) + 8LL);
      unint64_t v14 = v15++;
    }

    while (v14 < a5);
  }

  *a4 -= 65LL;
  SavePointer(a1, (uint64_t *)((char *)&v17 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)), v12, a3);
  return a3;
}

uint64_t StoreMTLTextureMipmapInfo2UsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLTextureMipmapInfo2(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLTextureMipmapInfo2(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLDeviceDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLDeviceDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLDeviceDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLAccelerationStructureDescriptorUsingEncode( uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLAccelerationStructureDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLAccelerationStructureDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLComputePipelineDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLComputePipelineDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLComputePipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLStitchedLibraryDescriptorUsingEncode( uint64_t a1, uint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLStitchedLibraryDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLStitchedLibraryDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLRenderPipelineDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLRenderPipelineDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLRenderPipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLTileRenderPipelineDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLTileRenderPipelineDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLTileRenderPipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLTextureDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLTextureDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLTextureDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCaptureDescriptorUsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLCaptureDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLCaptureDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLAccelerationStructurePassDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLAccelerationStructurePassDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLAccelerationStructurePassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLBlitPassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLBlitPassDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLBlitPassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLComputePassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLComputePassDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLComputePassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLRenderPassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLRenderPassDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLRenderPassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLResourceStatePassDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLResourceStatePassDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLResourceStatePassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLCommandBufferDescriptorUsingEncode( uint64_t a1, uint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLCommandBufferDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLCommandBufferDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLIntersectionFunctionTableDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIntersectionFunctionTableDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIntersectionFunctionTableDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLVisibleFunctionTableDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLVisibleFunctionTableDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLVisibleFunctionTableDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLFunctionDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLFunctionDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLFunctionDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLAccelerationStructureAllocationDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLAccelerationStructureAllocationDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLAccelerationStructureAllocationDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLBufferDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLBufferDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLBufferDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreIOSurfaceUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYIOSurface(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYIOSurface(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCommandQueueDescriptorUsingEncode(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLCommandQueueDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLCommandQueueDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCounterSampleBufferDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLCounterSampleBufferDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLCounterSampleBufferDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLDepthStencilDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLDepthStencilDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLDepthStencilDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLHeapDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLHeapDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLHeapDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLIOCommandQueueDescriptorUsingEncode(uint64_t a1, unsigned int *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIOCommandQueueDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIOCommandQueueDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLIndirectCommandBufferDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIndirectCommandBufferDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIndirectCommandBufferDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCompileOptionsUsingEncode_13637(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLCompileOptions(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLCompileOptions(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLMotionEstimationPipelineDescriptorUsingEncode( uint64_t a1, unsigned __int16 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLMotionEstimationPipelineDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLMotionEstimationPipelineDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLRasterizationRateMapDescriptorUsingEncode( uint64_t a1, const char **a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLRasterizationRateMapDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLRasterizationRateMapDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLMeshRenderPipelineDescriptorUsingEncode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLMeshRenderPipelineDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLMeshRenderPipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLResidencySetDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLResidencySetDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLResidencySetDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLSamplerDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLSamplerDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLSamplerDescriptor(a2, (uint64_t)v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLIntersectionFunctionDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIntersectionFunctionDescriptor(a2, 0LL, 0LL);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIntersectionFunctionDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLScissorRectUsingEncode(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  size_t v9 = 32 * a5;
  int v10 = (const void *)((32 * a5) | 8);
  uint64_t v11 = (uint64_t *)GTCoreAlloc(a1, (memory_object_size_t)v10);
  *uint64_t v11 = 81LL;
  memcpy(v11 + 1, a2, v9);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLVertexAmplificationViewMappingUsingEncode( uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  size_t v9 = 8 * a5;
  int v10 = (const void *)(8 * a5 + 8);
  uint64_t v11 = (uint64_t *)GTCoreAlloc(a1, (memory_object_size_t)v10);
  *uint64_t v11 = 81LL;
  memcpy(v11 + 1, a2, v9);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLViewportUsingEncode(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  size_t v9 = 48 * a5;
  int v10 = (const void *)((48 * a5) | 8);
  uint64_t v11 = (uint64_t *)GTCoreAlloc(a1, (memory_object_size_t)v10);
  *uint64_t v11 = 81LL;
  memcpy(v11 + 1, a2, v9);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLRenderPipelineFunctionsDescriptorUsingEncode( uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0LL;
  }
  int v10 = (const void *)EncodeDYMTLRenderPipelineFunctionsDescriptor(a2, 0LL, 0LL, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLRenderPipelineFunctionsDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65LL;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMPSPluginCNNConvolutionDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMPSPluginCNNConvolutionDescriptor(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSPluginCNNConvolutionDescriptor(a2, (uint64_t)v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSPluginCNNConvolutionDataUsingEncode(uint64_t a1, unsigned int *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMPSPluginCNNConvolutionData(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSPluginCNNConvolutionData(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSPluginNDArrayConvolutionDescriptorUsingEncode( uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMPSPluginNDArrayConvolutionDescriptor(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSPluginNDArrayConvolutionDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSSourceTextureInfoUsingEncode(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMPSSourceTextureInfo(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSSourceTextureInfo(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSDestinationTextureInfoUsingEncode(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMPSDestinationTextureInfo(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSDestinationTextureInfo(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSNDArrayStructureUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMPSNDArrayStructure(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSNDArrayStructure(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLFXSpatialScalerDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLFXSpatialScalerDescriptor(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLFXSpatialScalerDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLFXTemporalScalerDescriptorUsingEncode( uint64_t a1, unsigned __int16 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = (const void *)EncodeDYMTLFXTemporalScalerDescriptor(a2, 0LL, 0LL);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLFXTemporalScalerDescriptor(a2, (uint64_t)v9, (unint64_t)v8);
  *a4 -= 65LL;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

char *GTTraceMemPool_allocateBytes(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (HIDWORD(a3) + 23) & 0x1FFFFFFF8LL;
  uint64_t v7 = (unsigned int *)(a1 + 24);
  do
    unsigned int v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  do
    unsigned int v9 = atomic_load((unsigned int *)(a1 + 28));
  while (v9 != v8);
  int v10 = *(unsigned int **)(a1 + 8);
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v11 = v10 + 1;
  uint64_t v12 = atomic_load(v10 + 1);
  while (1)
  {
    uint64_t v13 = v12;
    unint64_t v14 = v6 + v12;
    unint64_t v15 = *v10;
    if (v14 > v15) {
      break;
    }
    uint64_t v12 = __ldaxr(v11);
    if (v12 == v13)
    {
      if (!__stlxr(v14, v11))
      {
        unint64_t v15 = *v10;
        break;
      }
    }

    else
    {
      __clrex();
    }
  }

  unint64_t v16 = (char *)v10 + v13;
  int32x2_t result = v14 <= v15 ? v16 : 0LL;
  if (v14 > v15)
  {
LABEL_16:
    uint64_t v18 = (unsigned int *)GTTraceStoreAllocNode( *(int **)a1,  (HIDWORD(a3) + 23) & 0x1FFFFFFF8LL,  2,  *(void *)(a1 + 32));
    uint64_t v19 = *(void *)(a1 + 16);
    if (v19) {
      uint64_t v20 = (void *)(v19 + 40);
    }
    else {
      uint64_t v20 = (void *)(a1 + 8);
    }
    *uint64_t v20 = v18;
    *(void *)(a1 + 16) = v18;
    *((void *)v18 + 5) = 0LL;
    uint64_t v21 = v18 + 1;
    uint64_t v22 = atomic_load(v18 + 1);
    while (1)
    {
      uint64_t v23 = v22;
      unint64_t v24 = v6 + v22;
      unint64_t v25 = *v18;
      if (v24 > v25) {
        break;
      }
      uint64_t v22 = __ldaxr(v21);
      if (v22 == v23)
      {
        if (!__stlxr(v24, v21))
        {
          unint64_t v25 = *v18;
          break;
        }
      }

      else
      {
        __clrex();
      }
    }

    uint64_t v26 = (char *)v18 + v23;
    if (v24 <= v25) {
      int32x2_t result = v26;
    }
    else {
      int32x2_t result = 0LL;
    }
  }

  atomic_store(v8 + 1, (unsigned int *)(a1 + 28));
  *(void *)int32x2_t result = a2;
  *((void *)result + 1) = a3;
  return result;
}

void *GTTraceMemPool_storeBytes(void *result, uint64_t a2, unint64_t a3, const void *a4)
{
  if (a4)
  {
    size_t v4 = HIDWORD(a3);
    if (HIDWORD(a3))
    {
      Bytes = GTTraceMemPool_allocateBytes((uint64_t)result, a2, a3);
      return memcpy(Bytes + 16, a4, v4);
    }
  }

  return result;
}

uint64_t GTTraceMemPool_findHeader(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 0LL;
  }
  while (1)
  {
    unsigned int v4 = atomic_load((unsigned int *)(v3 + 4));
    int v5 = v4 - 64;
    if (v5 >= 1) {
      break;
    }
LABEL_8:
    uint64_t v3 = *(void *)(v3 + 40);
    if (!v3) {
      return 0LL;
    }
  }

  uint64_t result = v3 + 64;
  while (a2 != *(void *)result || *(unsigned __int8 *)(result + 8) != a3)
  {
    signed int v7 = (*(_DWORD *)(result + 12) + 23) & 0xFFFFFFF8;
    result += v7;
    BOOL v8 = __OFSUB__(v5, v7);
    v5 -= v7;
    if ((v5 < 0) ^ v8 | (v5 == 0)) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t GTTraceMemHeader_data(uint64_t result)
{
  if (result) {
    result += 16LL;
  }
  return result;
}

uint64_t GTTraceMemHeader_bytes(uint64_t a1)
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0LL;
  }
}

void GTTraceMemPool_buildMemoryMap(uint64_t a1, apr_hash_t *ht)
{
  for (uint64_t i = *(void *)(a1 + 8); i; uint64_t i = *(void *)(i + 40))
  {
    unsigned int v4 = atomic_load((unsigned int *)(i + 4));
    int v5 = v4 - 64;
    if ((int)(v4 - 64) >= 1)
    {
      uint64_t v6 = (_DWORD *)(i + 64);
      do
      {
        apr_hash_set(ht, v6, 9LL, v6);
        signed int v7 = (v6[3] + 23) & 0xFFFFFFF8;
        uint64_t v6 = (_DWORD *)((char *)v6 + v7);
        BOOL v8 = __OFSUB__(v5, v7);
        v5 -= v7;
      }

      while (!((v5 < 0) ^ v8 | (v5 == 0)));
    }
  }

uint64_t GTTraceMemPool_headerFromMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  entry = find_entry(a1, v5, 9uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

unint64_t GetFreeIndex(unint64_t result)
{
  if (result < 0x101) {
    return 0LL;
  }
  unint64_t v1 = result;
  LODWORD(result) = 0;
  for (unint64_t i = 256LL; i < v1; i *= 2LL)
    uint64_t result = (result + 1);
  return result;
}

uint64_t GetFreeIndexCapacity(int a1)
{
  if (a1 < 1) {
    return 256LL;
  }
  int v1 = a1;
  uint64_t result = 256LL;
  do
  {
    result *= 2LL;
    --v1;
  }

  while (v1);
  return result;
}

vm_address_t GTTraceStoreCreate(uint64_t a1)
{
  vm_address_t v1 = GTCoreAlloc(a1, 0x148uLL);
  pthread_mutex_init((pthread_mutex_t *)(v1 + 264), 0LL);
  return v1;
}

uint64_t GTTraceStoreDestroy(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      vm_deallocate(mach_task_self_, *(void *)(*((void *)a1 + 1) + v2), *(void *)(*((void *)a1 + 1) + v2 + 8));
      ++v3;
      v2 += 16LL;
    }

    while (v3 < *a1);
  }

  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 66));
  free(*((void **)a1 + 1));
  return vm_deallocate(mach_task_self_, (vm_address_t)a1, 0x148uLL);
}

uint64_t GTTraceStoreAllocNode(int *a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v7 = a2 + 64;
  if ((unint64_t)(a2 + 64) < 0x101)
  {
    uint64_t v12 = (pthread_mutex_t *)(a1 + 66);
    uint64_t v13 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 66));
    int v11 = 0;
    goto LABEL_8;
  }

  unsigned int v8 = -1;
  unint64_t v9 = 256LL;
  do
  {
    unsigned int v10 = v8;
    v9 *= 2LL;
    ++v8;
  }

  while (v9 < v7);
  int v11 = v10 + 2;
  uint64_t v12 = (pthread_mutex_t *)(a1 + 66);
  uint64_t v13 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 66));
  if (v8 <= 0x1D)
  {
LABEL_8:
    unint64_t v14 = (vm_address_t *)v11;
    while (!*(void *)&a1[2 * (void)v14 + 4])
    {
      unint64_t v14 = (vm_address_t *)((char *)v14 + 1);
    }

    goto LABEL_26;
  }

  if (v11 != 31)
  {
LABEL_30:
    uint64_t v26 = v11;
    goto LABEL_31;
  }

  int v11 = 31;
LABEL_11:
  int v15 = 0;
  unint64_t v16 = 0x800000LL;
  if (v7 > 0x800000) {
    unint64_t v16 = v7;
  }
  for (unint64_t i = 256LL; i < v16; i *= 2LL)
    ++v15;
  memory_object_size_t v18 = 256LL;
  do
  {
    v18 *= 2LL;
    --v15;
  }

  while (v15);
  vm_address_t v19 = GTCoreAlloc(v13, v18);
  int v20 = *a1;
  int v21 = a1[1];
  if (v21 == *a1)
  {
    int v22 = 2 * v21;
    if (!v21) {
      int v22 = 8;
    }
    a1[1] = v22;
    uint64_t v23 = (char *)realloc(*((void **)a1 + 1), 16LL * v22);
    *((void *)a1 + 1) = v23;
    int v20 = *a1;
  }

  else
  {
    uint64_t v23 = (char *)*((void *)a1 + 1);
  }

  *a1 = v20 + 1;
  unint64_t v14 = (vm_address_t *)&v23[16 * v20];
  *unint64_t v14 = v19;
  v14[1] = v18;
  *(_DWORD *)vm_address_t v19 = v18;
  *(_DWORD *)(v19 + 4) = 64;
  *(void *)(v19 + 8) = 0LL;
  *(void *)(v19 + 16) = 0LL;
  *(void *)(v19 + 24) = 0LL;
  *(void *)(v19 + 32) = v19;
  *(void *)(v19 + 48) = 0LL;
  *(void *)(v19 + 56) = 0LL;
  *(void *)(v19 + 40) = 0LL;
  LODWORD(v14) = 0;
  if (v18)
  {
    unint64_t v24 = 256LL;
    do
    {
      v24 *= 2LL;
      LODWORD(v14) = (_DWORD)v14 + 1;
    }

    while (v24 < v18);
  }

  *(void *)&a1[2 * (int)v14 + 4] = v19;
LABEL_26:
  uint64_t v25 = (int)v14;
  uint64_t v26 = v11;
  uint64_t v27 = *(unsigned int **)&a1[2 * (int)v14 + 4];
  do
  {
    uint64_t v28 = &a1[2 * v25];
    *((void *)v28 + 2) = *((void *)v27 + 5);
    unint64_t v29 = (unint64_t)*v27 >> 1;
    *v27 >>= 1;
    v27[1] = 64;
    *((void *)v27 + 2) = 0LL;
    *((void *)v27 + 3) = 0LL;
    *((void *)v27 + 1) = 0LL;
    *((void *)v27 + 4) = v27;
    *((void *)v27 + 6) = 0LL;
    *((void *)v27 + 7) = 0LL;
    uint64_t v30 = (char *)v27 + v29;
    *(_DWORD *)uint64_t v30 = v29;
    *((_DWORD *)v30 + 1) = 64;
    *((void *)v30 + 1) = 0LL;
    *((void *)v30 + 2) = 0LL;
    *((void *)v30 + 3) = 0LL;
    *((void *)v30 + 4) = v30;
    *((void *)v30 + 6) = 0LL;
    *((void *)v30 + 7) = 0LL;
    *((void *)v30 + 5) = 0LL;
    *((void *)v27 + 5) = (char *)v27 + v29;
    --v25;
    *((void *)v28 + 1) = v27;
  }

  while (v25 > v11);
LABEL_31:
  uint64_t v31 = &a1[2 * v26];
  uint64_t v32 = *((void *)v31 + 2);
  *((void *)v31 + 2) = *(void *)(v32 + 40);
  *(_BYTE *)(v32 + 8) = a3;
  *(void *)(v32 + 16) = a4;
  *(void *)(v32 + 24) = a1;
  *(void *)(v32 + 40) = 0LL;
  pthread_mutex_unlock(v12);
  return v32;
}

uint64_t GTTraceStoreFreeNodes(uint64_t result, unsigned int *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    unsigned int v4 = (pthread_mutex_t *)(result + 264);
    pthread_mutex_lock((pthread_mutex_t *)(result + 264));
    do
    {
      unint64_t v5 = *v2;
      if (v5 < 0x101)
      {
        int v6 = 0;
      }

      else
      {
        int v6 = 0;
        for (unint64_t i = 256LL; i < v5; i *= 2LL)
          ++v6;
      }

      unsigned int v8 = (unsigned int *)*((void *)v2 + 5);
      v2[1] = 64;
      *((void *)v2 + 1) = 0LL;
      *((void *)v2 + 2) = 0LL;
      *((void *)v2 + 3) = 0LL;
      *((void *)v2 + 4) = v2;
      *((void *)v2 + 6) = 0LL;
      *((void *)v2 + 7) = 0LL;
      *((void *)v2 + 5) = 0LL;
      uint64_t v9 = v3 + 8LL * v6;
      *((void *)v2 + 5) = *(void *)(v9 + 16);
      *(void *)(v9 + 16) = v2;
      uint64_t v2 = v8;
    }

    while (v8);
    return pthread_mutex_unlock(v4);
  }

  return result;
}

char *GTTraceStoreNodeSubAlloc(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = a1 + 1;
  uint64_t v3 = atomic_load(a1 + 1);
  while (1)
  {
    uint64_t v4 = v3;
    unint64_t v5 = v3 + a2;
    unint64_t v6 = *a1;
    if (v5 > v6) {
      break;
    }
    uint64_t v3 = __ldaxr(v2);
    if (v3 == v4)
    {
      if (!__stlxr(v5, v2))
      {
        unint64_t v6 = *a1;
        break;
      }
    }

    else
    {
      __clrex();
    }
  }

  unint64_t v7 = (char *)a1 + v4;
  if (v5 <= v6) {
    return v7;
  }
  else {
    return 0LL;
  }
}

uint64_t GTTraceStoreListLock(uint64_t a1)
{
  vm_address_t v1 = (unsigned int *)(a1 + 16);
  do
    uint64_t v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  do
    unsigned int v3 = atomic_load((unsigned int *)(a1 + 20));
  while (v3 != (_DWORD)v2);
  return v2;
}

uint64_t GTTraceStoreListUnlock(uint64_t result, int a2)
{
  return result;
}

void *GTTraceStoreListPrependNode(void *result, uint64_t a2)
{
  *(void *)(a2 + 40) = *result;
  char *result = a2;
  if (!result[1]) {
    result[1] = a2;
  }
  return result;
}

uint64_t GTTraceStoreListConcat(uint64_t result, unsigned int *a2)
{
  if (*(void *)(result + 8))
  {
    unsigned int v2 = atomic_load(a2 + 4);
    unsigned int v3 = (unsigned int *)(result + 16);
    do
      unsigned int v4 = __ldaxr(v3);
    while (__stlxr(v4 + v2, v3));
    unsigned int v5 = atomic_load(a2 + 5);
    unint64_t v6 = (unsigned int *)(result + 20);
    do
      unsigned int v7 = __ldaxr(v6);
    while (__stlxr(v7 + v5, v6));
    *(void *)(*(void *)(result + 8) + 4apr_pool_create_ex(&newpool, parent, 0LL, 0LL) = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    if (v8) {
      *(void *)(result + 8) = v8;
    }
  }

  else
  {
    __int128 v9 = *(_OWORD *)a2;
    *(void *)(result + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t result = v9;
  }

  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  return result;
}

void *GTTraceStoreListAppendNode(void *result, uint64_t a2)
{
  uint64_t v2 = result[1];
  if (v2) {
    unsigned int v3 = (void *)(v2 + 40);
  }
  else {
    unsigned int v3 = result;
  }
  void *v3 = a2;
  result[1] = a2;
  *(void *)(a2 + 40) = 0LL;
  return result;
}

apr_pool_t **fbstream_open(apr_pool_t *a1, uint64_t a2, apr_pool_t *a3)
{
  unint64_t v6 = objc_autoreleasePoolPush();
  unsigned int v7 = (apr_pool_t **)apr_palloc(a3, 0x20uLL);
  uint64_t v8 = v7;
  if (v7)
  {
    *(_OWORD *)unsigned int v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
  }

  __int128 v9 = (void *)*((void *)a3 + 5);
  if (v9) {
    *((void *)a3 + 5) = *v9;
  }
  else {
    __int128 v9 = apr_palloc(a3, 0x20uLL);
  }
  v9[1] = v8;
  v9[2] = fbstream_cleanup;
  v9[3] = apr_pool_cleanup_null;
  *__int128 v9 = *((void *)a3 + 4);
  *((void *)a3 + 4) = v9;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  *uint64_t v8 = a3;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 4096LL));
  uint64_t v12 = v8[1];
  v8[1] = (apr_pool_t *)v11;

  v8[2] = a1;
  v18[0] = @"buffer name";
  v18[1] = @"has pstream header";
  v19[0] = v10;
  v19[1] = &__kCFBooleanTrue;
  v18[2] = @"capture serial";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)a1 + 4)));
  v19[2] = v13;
  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  int v15 = v8[3];
  v8[3] = (apr_pool_t *)v14;

  uint64_t v17 = 0x4005053544DLL;
  fbstream_write((uint64_t)v8, (uint64_t)&v17, 8uLL);

  objc_autoreleasePoolPop(v6);
  return v8;
}

uint64_t fbstream_cleanup(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  unsigned int v3 = *(void **)(a1 + 16);
  if (v3[13])
  {
    fbstream_flush(a1);
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectForKeyedSubscript:@"buffer name"]);
    GTMTLCaptureState_storeData(v3, v4, *(void **)(a1 + 8));
  }

  unsigned int v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0LL;

  unint64_t v6 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0LL;

  objc_autoreleasePoolPop(v2);
  return 0LL;
}

void fbstream_write(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = objc_autoreleasePoolPush();
  id v7 = [*(id *)(a1 + 8) length];
  if (*(void *)(*(void *)(a1 + 16) + 104LL))
  {
    if ((unint64_t)v7 + a3 >= 0x1000)
    {
      uint64_t v8 = 4096LL - (void)v7;
      [*(id *)(a1 + 8) appendBytes:a2 length:4096 - (void)v7];
      fbstream_flush(a1);
      a2 += v8;
      a3 -= v8;
      if (a3 >= 0x1000)
      {
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a2,  a3,  0LL));
        fbstream_send(a1, v9);

        a3 = 0LL;
      }
    }
  }

  [*(id *)(a1 + 8) appendBytes:a2 length:a3];
  objc_autoreleasePoolPop(v6);
}

void fbstream_flush(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 8) copy];
  fbstream_send(a1, v2);

  [*(id *)(a1 + 8) setLength:0];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectForKeyedSubscript:@"has pstream header"]);
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectForKeyedSubscript:@"buffer name"]);
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectForKeyedSubscript:@"capture serial"]);
    v9[0] = @"buffer name";
    v9[1] = @"has pstream header";
    v10[0] = v5;
    v10[1] = &__kCFBooleanFalse;
    v9[2] = @"capture serial";
    v10[2] = v6;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
    uint64_t v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v7;
  }

void fbstream_send(uint64_t a1, void *a2)
{
  id v4 = *(id *)(*(void *)(a1 + 16) + 104LL);
  id v5 = a2;
  _sendTimebaseUpdate(v4, 0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[GTTransportMessage_capture messageWithKind:attributes:payload:]( &OBJC_CLASS___GTTransportMessage_capture,  "messageWithKind:attributes:payload:",  1792LL,  *(void *)(a1 + 24),  v5));

  [v4 send:v6 error:0];
}

uint64_t fbstream_close(apr_pool_t **data)
{
  return fbstream_cleanup((uint64_t)data);
}

uint64_t GTTraceContext_setParent()
{
  uint64_t v1 = *v0;
  uint64_t *v0 = v2;
  return v1;
}

void GTTraceContext_addFlags()
{
  *(_BYTE *)(v0 + 8) |= v1;
}

void GTTraceContext_removeFlags()
{
  *(_BYTE *)(v0 + 8) &= ~v1;
}

uint64_t GTTraceContext_setIncludeBacktrace(uint64_t result, unsigned __int8 a2)
{
  return result;
}

apr_hash_t *GTTraceContext_buildBacktraceMap(uint64_t a1, apr_pool_t *pool)
{
  unsigned int v3 = apr_hash_make(pool);
  for (uint64_t i = 0LL; i != 16; ++i)
  {
    for (uint64_t j = *(void *)(a1 + 24 * i + 128); j; uint64_t j = *(void *)(j + 40))
    {
      uint64_t v6 = atomic_load((unsigned int *)(j + 4));
      if ((_DWORD)v6 != 64)
      {
        uint64_t v7 = j + 64;
        uint64_t v8 = j + v6;
        do
        {
          apr_hash_set(v3, (const void *)v7, 8LL, (const void *)(v7 + 8));
          v7 += (8LL * *(void *)(v7 + 8) + 23) & 0xFFFFFFFF8LL;
        }

        while (v7 != v8);
      }
    }
  }

  return v3;
}

uint64_t GTTraceContext_create()
{
  uint64_t v0 = newpool;
  char v1 = (pthread_mutex_t *)apr_palloc(newpool, 0x200uLL);
  uint64_t v2 = (uint64_t)v1;
  if (v1)
  {
    *(_OWORD *)&v1[7].__opaque[24] = 0u;
    *(_OWORD *)&v1[7].__opaque[40] = 0u;
    *(_OWORD *)&v1[7].__sig = 0u;
    *(_OWORD *)&v1[7].__opaque[8] = 0u;
    *(_OWORD *)&v1[6].__opaque[24] = 0u;
    *(_OWORD *)&v1[6].__opaque[40] = 0u;
    *(_OWORD *)&v1[6].__sig = 0u;
    *(_OWORD *)&v1[6].__opaque[8] = 0u;
    *(_OWORD *)&v1[5].__opaque[24] = 0u;
    *(_OWORD *)&v1[5].__opaque[40] = 0u;
    *(_OWORD *)&v1[5].__sig = 0u;
    *(_OWORD *)&v1[5].__opaque[8] = 0u;
    *(_OWORD *)&v1[4].__opaque[24] = 0u;
    *(_OWORD *)&v1[4].__opaque[40] = 0u;
    *(_OWORD *)&v1[4].__sig = 0u;
    *(_OWORD *)&v1[4].__opaque[8] = 0u;
    *(_OWORD *)&v1[3].__opaque[24] = 0u;
    *(_OWORD *)&v1[3].__opaque[40] = 0u;
    *(_OWORD *)&v1[3].__sig = 0u;
    *(_OWORD *)&v1[3].__opaque[8] = 0u;
    *(_OWORD *)&v1[2].__opaque[24] = 0u;
    *(_OWORD *)&v1[2].__opaque[40] = 0u;
    *(_OWORD *)&v1[2].__sig = 0u;
    *(_OWORD *)&v1[2].__opaque[8] = 0u;
    *(_OWORD *)&v1[1].__opaque[24] = 0u;
    *(_OWORD *)&v1[1].__opaque[40] = 0u;
    *(_OWORD *)&v1[1].__sig = 0u;
    *(_OWORD *)&v1[1].__opaque[8] = 0u;
    *(_OWORD *)&v1->__opaque[24] = 0u;
    *(_OWORD *)&v1->__opaque[40] = 0u;
    *(_OWORD *)&v1->__sig = 0u;
    *(_OWORD *)&v1->__opaque[8] = 0u;
  }

  pthread_mutex_init(v1, 0LL);
  unsigned int v3 = apr_hash_make(v0);
  *(void *)(v2 + 88) = v3;
  vm_address_t v4 = GTCoreAlloc((uint64_t)v3, 0x148uLL);
  pthread_mutex_init((pthread_mutex_t *)(v4 + 264), 0LL);
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 112) = GTTraceContext_openStream(v2, 0LL, 0LL);
  atomic_store(0, (unsigned __int8 *)(v2 + 120));
  atomic_store(0, (unsigned int *)(v2 + 104));
  return v2;
}

unint64_t *GTTraceContext_openStream(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v7 = v6;
  RetainFreeNode(a1);
  v7[3] = v8;
  __int128 v9 = (unint64_t *)(a1 + 80);
  do
    unint64_t v10 = __ldaxr(v9);
  while (__stlxr(v10 + 1, v9));
  *uint64_t v7 = v10;
  v7[1] = a2;
  v7[2] = a3;
  uint64_t v11 = (void *)v7[3];
  *uint64_t v11 = *(void *)(a1 + 64);
  v11[4] = v10;
  uint64_t v12 = (unsigned int *)(v11 + 5);
  do
    unsigned int v13 = __ldaxr(v12);
  while (__stlxr(v13 + 1, v12));
  atomic_store(0LL, v7 + 7);
  apr_hash_set(*(apr_hash_t **)(a1 + 88), v7, 8LL, v7);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v7;
}

double RetainFreeNode(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  if (!v2)
  {
    uint64_t v2 = apr_palloc(**(apr_pool_t ***)(a1 + 88), 0x1000uLL);
    for (uint64_t i = 0LL; i != 504; i += 8LL)
      v2[i] = &v2[i + 8];
    v2[504] = 0LL;
    *(void *)(a1 + 96) = v2;
  }

  *(void *)(a1 + 96) = *v2;
  double result = 0.0;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  return result;
}

void GTTraceContext_destroy(uint64_t a1)
{
}

void GTTraceContext_closeStream(uint64_t a1, void *a2)
{
  unsigned int v4 = atomic_load((unsigned int *)(a1 + 104));
  if (v4 == 1)
  {
    if (a2)
    {
LABEL_14:
      uint64_t v12 = a2 + 7;
      unint64_t v13 = atomic_load(a2 + 7);
      while (1)
      {
        unint64_t v14 = __ldaxr(v12);
        if (v14 != v13) {
          break;
        }
        if (__stlxr(v13 | 4, v12)) {
          goto LABEL_19;
        }
        int v15 = 1;
LABEL_20:
        unint64_t v13 = v14;
        if (v15) {
          goto LABEL_21;
        }
      }

      __clrex();
LABEL_19:
      int v15 = 0;
      goto LABEL_20;
    }

LABEL_21:
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }

  else
  {
    if (v4 == 2 && a2 != 0LL)
    {
      char v11 = atomic_load(a2 + 7);
      if ((v11 & 0x10) != 0) {
        goto LABEL_14;
      }
    }

    __int128 v22 = 0uLL;
    *(void *)uint64_t v23 = 0LL;
    apr_hash_set(*(apr_hash_t **)(a1 + 88), a2, 8LL, 0LL);
    int v6 = *(_DWORD *)(*(void *)(a1 + 88) + 48LL);
    uint64_t v7 = a2[3];
    unint64_t v8 = (unsigned int *)(v7 + 40);
    do
    {
      unsigned int v9 = __ldaxr(v8);
      unsigned int v10 = v9 - 1;
    }

    while (__stlxr(v10, v8));
    if (!v10)
    {
      __int128 v16 = *(_OWORD *)(v7 + 8);
      *(void *)uint64_t v23 = *(void *)(v7 + 24);
      __int128 v22 = v16;
      *(void *)(v7 + 8) = 0LL;
      *(void *)(v7 + 16) = 0LL;
      *(void *)(v7 + 24) = 0LL;
      *(void *)uint64_t v7 = *(void *)(a1 + 96);
      *(void *)(a1 + 96) = v7;
    }

    uint64_t v17 = a2 + 4;
    if (*((void *)&v22 + 1))
    {
      unsigned int v18 = atomic_load((unsigned int *)a2 + 12);
      do
        unsigned int v19 = __ldaxr(v23);
      while (__stlxr(v19 + v18, v23));
      unsigned int v20 = atomic_load((unsigned int *)a2 + 13);
      do
        unsigned int v21 = __ldaxr(&v23[1]);
      while (__stlxr(v21 + v20, &v23[1]));
      *(void *)(*((void *)&v22 + 1) + 4apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL) = *v17;
    }

    else
    {
      __int128 v22 = *(_OWORD *)v17;
      *(void *)uint64_t v23 = a2[6];
    }

    *uint64_t v17 = 0LL;
    a2[5] = 0LL;
    a2[6] = 0LL;
    *a2 = *(void *)(a1 + 96);
    *(void *)(a1 + 96) = a2;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    GTTraceStoreFreeNodes(*(void *)(a1 + 64), (unsigned int *)v22);
    if (!v6)
    {
      pthread_mutex_destroy((pthread_mutex_t *)a1);
      GTTraceStoreDestroy(*(int **)(a1 + 64));
      apr_pool_destroy(**(apr_pool_t ***)(a1 + 88));
      if ((shared_initialized & 1) == 0 && !--initialized) {
        apr_pool_terminate();
      }
    }
  }

    v174 = v19;
    if (v20 - 48 <= 9)
    {
      int v6 = *v11 - 48LL;
      unsigned int v21 = *(unsigned __int8 *)++v11;
      unsigned int v20 = v21;
      if (v21 - 48 <= 9)
      {
        do
        {
          int v6 = 10 * v6 + (char)v20 - 48;
          __int128 v22 = *(unsigned __int8 *)++v11;
          unsigned int v20 = v22;
        }

        while (v22 - 48 < 0xA);
      }

      goto LABEL_31;
    }

    if (v20 == 42)
    {
      uint64_t v23 = (unsigned int *)v178;
      v178 += 8;
      unint64_t v24 = *v23;
      uint64_t v25 = *(unsigned __int8 *)++v11;
      unsigned int v20 = v25;
      uint64_t v26 = v19;
      v174 = v26;
      int v6 = (int)v24 >= 0 ? v24 : -(int)v24;
LABEL_31:
      v173 = 1;
    }

    else
    {
      v173 = 0;
    }

    if (v20 == 46)
    {
      uint64_t v27 = *((unsigned __int8 *)v11 + 1);
      if ((v27 - 48) > 9)
      {
        uint64_t v17 = 0LL;
        if ((char)v27 == 42)
        {
          uint64_t v40 = v178;
          v178 += 8;
          v11 += 2;
          v171 = *v40 & ~((int)*v40 >> 31);
        }

        else
        {
          v171 = 0LL;
          ++v11;
        }
      }

      else
      {
        unint64_t v29 = *((unsigned __int8 *)v11 + 2);
        v11 += 2;
        uint64_t v28 = v29;
        v171 = (char)v27 - 48LL;
        if ((v29 - 48) <= 9)
        {
          uint64_t v30 = (char)v27 - 48LL;
          do
          {
            uint64_t v31 = *(unsigned __int8 *)++v11;
            uint64_t v30 = 10 * v30 + v28 - 48;
            uint64_t v28 = v31;
          }

          while ((v31 - 48) < 0xA);
          v171 = v30;
        }

        uint64_t v17 = 0LL;
      }
    }

    else
    {
      uint64_t v17 = 1LL;
    }

uint64_t GTTraceContext_getStream(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v3 = *find_entry(*(void *)(a1 + 88), &v6, 8uLL, 0LL);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v4;
}

unint64_t GTTraceContext_newStreamIdentifier(uint64_t a1)
{
  char v1 = (unint64_t *)(a1 + 80);
  do
    unint64_t result = __ldaxr(v1);
  while (__stlxr(result + 1, v1));
  return result;
}

unint64_t *GTTraceContext_openEncoderStream(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v7 = v6;
  unint64_t v8 = (unint64_t *)(a1 + 80);
  do
    unint64_t v9 = __ldaxr(v8);
  while (__stlxr(v9 + 1, v8));
  *uint64_t v6 = v9;
  v6[1] = a2;
  unsigned int v10 = (unsigned int *)(a3 + 40);
  v6[3] = a3;
  do
    unsigned int v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  atomic_store(0LL, v6 + 7);
  apr_hash_set(*(apr_hash_t **)(a1 + 88), v6, 8LL, v6);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v7;
}

BOOL GTTraceContext_isTransientStreamRetained(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = atomic_load((unsigned int *)(a1 + 104));
  if (v2 != 2) {
    return v2 == 1;
  }
  if (!a2) {
    return 0LL;
  }
  unint64_t v4 = atomic_load((unint64_t *)(a2 + 56));
  return (v4 >> 4) & 1;
}

uint64_t GTTraceContext_retainTransientStreams(uint64_t result)
{
  return result;
}

uint64_t GTTraceContext_stopRetainingNewTransientStreams(uint64_t result)
{
  return result;
}

apr_array_header_t *GTTraceContext_cleanupTransientStreams(uint64_t a1, apr_pool_t *a2)
{
  unint64_t v4 = apr_array_make(a2, 32, 8);
  *(void *)uint64_t v37 = 0LL;
  __int128 v36 = 0uLL;
  uint64_t v5 = *(void *)(a1 + 88);
  *(_DWORD *)(v5 + 40) = 0;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0LL;
  *(void *)(v5 + 32) = 0LL;
  uint64_t v6 = apr_hash_next((apr_hash_index_t *)(v5 + 16));
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      unint64_t v8 = *(void **)(*((void *)v7 + 1) + 32LL);
      if (v8)
      {
        unint64_t v9 = v8 + 7;
        char v10 = atomic_load(v8 + 7);
        if ((v10 & 4) == 0)
        {
          unint64_t v11 = atomic_load(v9);
          while (1)
          {
            unint64_t v12 = __ldaxr(v9);
            if (v12 != v11) {
              break;
            }
            if (__stlxr(v11 & 0xFFFFFFFFFFFFFFEFLL, v9)) {
              goto LABEL_10;
            }
            char v13 = 1;
LABEL_11:
            unint64_t v11 = v12;
            if ((v13 & 1) != 0) {
              goto LABEL_34;
            }
          }

          __clrex();
LABEL_10:
          char v13 = 0;
          goto LABEL_11;
        }

        uint64_t v14 = v8[1];
        *(void *)apr_array_push(v4) = v14;
        apr_hash_set(*(apr_hash_t **)(a1 + 88), v8, 8LL, 0LL);
        uint64_t v15 = v8[3];
        __int128 v16 = (unsigned int *)(v15 + 40);
        do
          unsigned int v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        uint64_t v18 = *((void *)&v36 + 1);
        if (v17 == 1)
        {
          unsigned int v19 = (__int128 *)(v15 + 8);
          if (*((void *)&v36 + 1))
          {
            unsigned int v20 = atomic_load((unsigned int *)(v15 + 24));
            do
              unsigned int v21 = __ldaxr(v37);
            while (__stlxr(v21 + v20, v37));
            unsigned int v22 = atomic_load((unsigned int *)(v15 + 28));
            do
              unsigned int v23 = __ldaxr(&v37[1]);
            while (__stlxr(v23 + v22, &v37[1]));
            uint64_t v18 = *((void *)&v36 + 1);
            *(void *)(*((void *)&v36 + 1) + 4apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL) = *(void *)(v15 + 8);
            if (*(void *)(v15 + 16))
            {
              *((void *)&v36 + 1) = *(void *)(v15 + 16);
              uint64_t v18 = *((void *)&v36 + 1);
            }
          }

          else
          {
            __int128 v36 = *v19;
            *(void *)uint64_t v37 = *(void *)(v15 + 24);
            uint64_t v18 = *((void *)&v36 + 1);
          }

          *(void *)unsigned int v19 = 0LL;
          *(void *)(v15 + 16) = 0LL;
          *(void *)(v15 + 24) = 0LL;
          *(void *)uint64_t v15 = *(void *)(a1 + 96);
          *(void *)(a1 + 96) = v15;
        }

        unint64_t v24 = (__int128 *)(v8 + 4);
        if (v18)
        {
          unsigned int v25 = atomic_load((unsigned int *)v8 + 12);
          do
            unsigned int v26 = __ldaxr(v37);
          while (__stlxr(v26 + v25, v37));
          unsigned int v27 = atomic_load((unsigned int *)v8 + 13);
          do
            unsigned int v28 = __ldaxr(&v37[1]);
          while (__stlxr(v28 + v27, &v37[1]));
          *(void *)(*((void *)&v36 + 1) + 4apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL) = v8[4];
          if (v8[5]) {
            *((void *)&v36 + 1) = v8[5];
          }
        }

        else
        {
          __int128 v36 = *v24;
          *(void *)uint64_t v37 = v8[6];
        }

        *(void *)unint64_t v24 = 0LL;
        v8[5] = 0LL;
        void v8[6] = 0LL;
        *unint64_t v8 = *(void *)(a1 + 96);
        *(void *)(a1 + 96) = v8;
      }

unint64_t GTTraceContext_newDispatchIndex(uint64_t a1)
{
  char v1 = (unint64_t *)(a1 + 72);
  do
    unint64_t result = __ldaxr(v1);
  while (__stlxr(result + 1, v1));
  return result;
}

unint64_t GTTraceContext_newDispatchIndices(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = (unint64_t *)(a1 + 72);
  do
    unint64_t result = __ldaxr(v2);
  while (__stlxr(result + a2, v2));
  return result;
}

unint64_t GTTraceContext_dispatchIndex(uint64_t a1)
{
  return atomic_load((unint64_t *)(a1 + 72));
}

unint64_t *GTTraceContext_openLayerStream(uint64_t a1, unint64_t a2)
{
  unint64_t v6 = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v3 = *find_entry(*(void *)(a1 + 88), &v6, 8uLL, 0LL);
  if (!v3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
LABEL_5:
    unint64_t v4 = GTTraceContext_openStream(a1, v6, v6);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    apr_hash_set(*(apr_hash_t **)(a1 + 88), v4 + 1, 8LL, v4);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    return v4;
  }

  unint64_t v4 = *(unint64_t **)(v3 + 32);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (!v4) {
    goto LABEL_5;
  }
  return v4;
}

void GTTraceContext_closeLayerStream(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v3 = *find_entry(*(void *)(a1 + 88), &v5, 8uLL, 0LL);
  if (v3 && (unint64_t v4 = *(void **)(v3 + 32)) != 0LL)
  {
    apr_hash_set(*(apr_hash_t **)(a1 + 88), v4 + 1, 8LL, 0LL);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    GTTraceContext_closeStream(a1, v4);
  }

  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }

apr_hash_t *GTTraceContext_copyStreamMap(uint64_t a1, apr_pool_t *a2)
{
  unint64_t v4 = apr_hash_copy(a2, *(const apr_hash_t **)(a1 + 88));
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v4;
}

apr_array_header_t *GTTraceContext_buildDispatchArray( uint64_t a1, unint64_t a2, uint64_t nelts, apr_pool_t *p)
{
  uint64_t v7 = apr_array_make(p, nelts, 64);
  v7->uint64_t nelts = nelts;
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 16) = a1;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  unint64_t v8 = apr_hash_next((apr_hash_index_t *)(a1 + 16));
  if (v8)
  {
    unint64_t v9 = nelts + a2;
    do
    {
      for (uint64_t i = *(void *)(*(void *)(*((void *)v8 + 1) + 32LL) + 32LL); i; uint64_t i = *(void *)(i + 40))
      {
        unsigned int v11 = atomic_load((unsigned int *)(i + 4));
        int v12 = (v11 >> 6) - 1;
        if (v11 >> 6 == 1)
        {
          uint64_t v13 = 0LL;
        }

        else
        {
          uint64_t v13 = v12;
          uint64_t v14 = (char *)(i + (v11 & 0xFFFFFFC0) - 49);
          do
          {
            char v15 = *v14;
            v14 -= 64;
            if ((v15 & 8) != 0) {
              break;
            }
            --v13;
          }

          while (v13);
        }

        if (v11 < 0x80)
        {
          unint64_t v16 = i + 64;
        }

        else
        {
          unint64_t v16 = i + 64;
          do
          {
            unsigned int v17 = v12 >> 1;
            uint64_t v18 = (unint64_t *)(v16 + (v12 >> 1 << 6));
            unint64_t v20 = *v18;
            unsigned int v19 = v18 + 8;
            v12 += ~(v12 >> 1);
            if (v20 < a2) {
              unint64_t v16 = (unint64_t)v19;
            }
            else {
              int v12 = v17;
            }
          }

          while (v12 > 0);
        }

        unint64_t v21 = i + 64 + (v13 << 6);
        while (v16 < v21)
        {
          if (*(void *)v16 < a2 || *(void *)v16 >= v9) {
            goto LABEL_26;
          }
          unsigned int v23 = &v7->elts[64 * (*(void *)v16 - a2)];
          __int128 v24 = *(_OWORD *)v16;
          __int128 v25 = *(_OWORD *)(v16 + 16);
          __int128 v26 = *(_OWORD *)(v16 + 48);
          *((_OWORD *)v23 + 2) = *(_OWORD *)(v16 + 32);
          *((_OWORD *)v23 + 3) = v26;
          *(_OWORD *)unsigned int v23 = v24;
          *((_OWORD *)v23 + 1) = v25;
          v16 += 64LL;
        }
      }

_DWORD *StreamNodeToArray@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0LL;
  unsigned int v2 = atomic_load(a1 + 1);
  unsigned int v4 = *a1;
  unint64_t result = a1 + 16;
  *(_DWORD *)(a2 + 8) = 64;
  *(_DWORD *)(a2 + 12) = (v2 >> 6) - 1;
  *(_DWORD *)(a2 + 16) = (v4 >> 6) - 1;
  *(void *)(a2 + 24) = result;
  return result;
}

uint64_t GTTraceContext_filterDispatchArray(uint64_t result)
{
  char v1 = (_OWORD *)*(unsigned int *)(result + 12);
  if ((int)v1 < 1)
  {
    LODWORD(v2) = 0;
  }

  else
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = (int *)(*(void *)(result + 24) + 8LL);
    while (1)
    {
      int v4 = *v3;
      v3 += 16;
      if (!v4) {
        break;
      }
      if (v1 == (_OWORD *)++v2) {
        goto LABEL_14;
      }
    }
  }

  if ((int)v2 >= (int)v1)
  {
LABEL_14:
    int v5 = 0;
  }

  else
  {
    int v5 = 0;
    unint64_t v6 = (unint64_t)v2 << 6;
    do
    {
      uint64_t v7 = *(void *)(result + 24);
      unint64_t v8 = (__int128 *)(v7 + v6);
      if (*(_DWORD *)(v7 + v6 + 8))
      {
        char v1 = (_OWORD *)(v7 + ((uint64_t)((int)v2 - v5) << 6));
        __int128 v9 = *v8;
        __int128 v10 = v8[1];
        __int128 v11 = v8[3];
        v1[2] = v8[2];
        v1[3] = v11;
        *char v1 = v9;
        v1[1] = v10;
        LODWORD(v1) = *(_DWORD *)(result + 12);
      }

      else
      {
        ++v5;
      }

      LODWORD(v2) = v2 + 1;
      v6 += 64LL;
    }

    while ((int)v1 > (int)v2);
  }

  *(_DWORD *)(result + 12) = (_DWORD)v1 - v5;
  return result;
}

apr_array_header_t *GTTraceContext_copyStreamMapAndBuildDispatchArray( uint64_t a1, unint64_t a2, uint64_t a3, apr_pool_t *a4, apr_hash_t **a5)
{
  __int128 v10 = apr_hash_copy(a4, *(const apr_hash_t **)(a1 + 88));
  __int128 v11 = GTTraceContext_buildDispatchArray((uint64_t)v10, a2, a3, a4);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (a5) {
    *a5 = v10;
  }
  return v11;
}

uint64_t GTTraceFunc_argumentBlobWithPool(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  if (a2 < 0x40) {
    return 0LL;
  }
  else {
    return GTTraceMemPool_findHeader(a3, *a1, a2);
  }
}

uint64_t GTTraceFunc_argumentBlobWithMap(void *a1, unsigned int a2, uint64_t a3)
{
  if (a2 < 0x40) {
    return 0LL;
  }
  v7[2] = v3;
  v7[3] = v4;
  v7[0] = *a1;
  v7[1] = a2;
  entry = find_entry(a3, v7, 9uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

char *GTTraceFunc_argumentBytesWithPool(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x40) {
    return (char *)a1 + a2;
  }
  uint64_t Header = GTTraceMemPool_findHeader(a3, *a1, a2);
  if (Header) {
    return (char *)(Header + 16);
  }
  else {
    return 0LL;
  }
}

char *GTTraceFunc_argumentBytesWithMap(void *a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x40) {
    return (char *)a1 + a2;
  }
  v8[2] = v3;
  v8[3] = v4;
  v8[0] = *a1;
  v8[1] = a2;
  entry = find_entry(a3, v8, 9uLL, 0LL);
  if (!*entry) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(*entry + 32LL);
  if (v6) {
    return (char *)(v6 + 16);
  }
  else {
    return 0LL;
  }
}

char *GTTraceFunc_targetContext(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  unint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a1, *(unsigned __int8 *)(a1 + 13), a2);
  if (v2 >> 1 == 2147475691)
  {
    result += 16;
  }

  else if (!result)
  {
    return result;
  }

  return *(char **)result;
}

char *GTTraceFunc_getFuncStreamRef(uint64_t a1, uint64_t a2)
{
  else {
    return GTTraceFunc_targetContext(a1, a2);
  }
}

char *GTTraceFunc_parentWithMap(uint64_t a1, uint64_t a2)
{
  unint64_t result = GTTraceFunc_argumentBytesWithMap((void *)a1, *(unsigned __int8 *)(a1 + 12), a2);
  if (result) {
    return *(char **)result;
  }
  return result;
}

uint64_t GTTraceMemoryMap_argumentBlobAtIndex(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x40) {
    return 0LL;
  }
  v7[2] = v3;
  v7[3] = v4;
  v7[0] = a3;
  v7[1] = a1;
  entry = find_entry(a2, v7, 9uLL, 0LL);
  if (*entry) {
    return *(void *)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

void GTTraceContext_pushEncoderWithExplicitIndex(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = 0LL;
  a3[2] = 0LL;
  a3[3] = a2;
  s();
  uint64_t v4 = *v3;
  uint64_t *v3 = v5;
  *(void *)(v6 + 32) = v4;
  *(_BYTE *)(v6 + 40) = *((_BYTE *)v3 + 8);
  *(_WORD *)(v6 + 41) = 16400;
  *(_DWORD *)(v6 + 43) = 0;
  *(_BYTE *)(v6 + 47) = 0;
}

void GTTraceContext_pushEncoder(uint64_t a1@<X0>, void *a2@<X8>)
{
  unsigned int v2 = (unint64_t *)(a1 + 72);
  do
    unint64_t v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  *a2 = a1;
  a2[1] = 0LL;
  a2[2] = 0LL;
  a2[3] = v3;
  s();
  uint64_t v5 = *v4;
  uint64_t *v4 = v6;
  *(void *)(v7 + 32) = v5;
  *(_BYTE *)(v7 + 40) = *((_BYTE *)v4 + 8);
  *(_WORD *)(v7 + 41) = 16400;
  *(_DWORD *)(v7 + 43) = 0;
  *(_BYTE *)(v7 + 47) = 0;
}

void *GTTraceContext_pushEncoderWithStream@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (unint64_t *)(a1 + 72);
  do
    unint64_t v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = v5;
  s();
  uint64_t v7 = *v6;
  *uint64_t v6 = v8;
  *(void *)(a2 + 32) = v7;
  *(_BYTE *)(a2 + 40) = *((_BYTE *)v6 + 8);
  *(_WORD *)(a2 + 41) = 16400;
  *(_DWORD *)(a2 + 43) = 0;
  *(_BYTE *)(a2 + 47) = 0;
  unint64_t result = (void *)GTTraceEncoder_setStream_(a2, v9);
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)(a1 + 120));
  if ((v11 & 1) != 0) {
    return GTTraceContext_backtrace(*(void *)a2, *(void *)(a2 + 24));
  }
  return result;
}

uint64_t GTTraceEncoder_setStream_(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    a2 = *(void *)(*(void *)a1 + 112LL);
  }
  *(void *)(a1 + 8) = a2;
  PushFunc(a2);
  *(void *)(a1 + 16) = v3;
  char v4 = *(_BYTE *)(a1 + 40);
  *(void *)uint64_t v3 = *(void *)(a1 + 24);
  *(_DWORD *)(v3 + 8) = 0;
  *(_DWORD *)(v3 + 11) = 0;
  *(_BYTE *)(v3 + 15) = v4;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  if (*(void *)(a1 + 32)) {
    uint64_t result = GTTraceEncoder_storeBytes(a1, (void *)(a1 + 32), 8uLL);
  }
  else {
    uint64_t result = 0LL;
  }
  *(_BYTE *)(*(void *)(a1 + 16) + 12LL) = result;
  return result;
}

void *GTTraceContext_backtrace(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = v4;
  uint64_t result = (void *)backtrace(v4, 512);
  if ((int)result >= 1)
  {
    uint64_t v7 = (int)result - 2;
    size_t v8 = 8 * v7;
    pthread_threadid_np(0LL, &v34);
    unsigned int v9 = v34 & 0xF;
    __int128 v10 = (unsigned int *)(a1 + 24 * (v34 & 0xF) + 144);
    do
      unsigned int v11 = __ldaxr(v10);
    while (__stlxr(v11 + 1, v10));
    int v12 = (unsigned int *)(a1 + 24LL * v9 + 148);
    do
      unsigned int v13 = atomic_load(v12);
    while (v13 != v11);
    unint64_t v14 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v15 = a1 + 24LL * v9;
    uint64_t v18 = *(unsigned int **)(v15 + 128);
    unsigned int v17 = (void *)(v15 + 128);
    unint64_t v16 = v18;
    if (!v18) {
      goto LABEL_15;
    }
    unsigned int v19 = v16 + 1;
    uint64_t v20 = atomic_load(v16 + 1);
    while (1)
    {
      uint64_t v21 = v20;
      unint64_t v22 = v14 + v20;
      unint64_t v23 = *v16;
      if (v22 > v23) {
        break;
      }
      uint64_t v20 = __ldaxr(v19);
      if (v20 == v21)
      {
        if (!__stlxr(v22, v19))
        {
          unint64_t v23 = *v16;
          break;
        }
      }

      else
      {
        __clrex();
      }
    }

    __int128 v24 = (void *)((char *)v16 + v21);
    if (v22 > v23)
    {
LABEL_15:
      __int128 v25 = (unsigned int *)GTTraceStoreAllocNode(*(int **)(a1 + 64), 16320LL, 3, 0LL);
      *((void *)v25 + 5) = *v17;
      *unsigned int v17 = v25;
      uint64_t v26 = a1 + 24LL * v9;
      uint64_t v28 = *(void *)(v26 + 136);
      unsigned int v27 = (void *)(v26 + 136);
      if (!v28) {
        *unsigned int v27 = v25;
      }
      unint64_t v29 = v25 + 1;
      uint64_t v30 = atomic_load(v25 + 1);
      while (1)
      {
        uint64_t v31 = v30;
        unint64_t v32 = v14 + v30;
        unint64_t v33 = *v25;
        if (v32 > v33) {
          break;
        }
        uint64_t v30 = __ldaxr(v29);
        if (v30 == v31)
        {
          if (!__stlxr(v32, v29))
          {
            unint64_t v33 = *v25;
            break;
          }
        }

        else
        {
          __clrex();
        }
      }

      __int128 v24 = (void *)((char *)v25 + v31);
      if (v32 > v33) {
        __int128 v24 = 0LL;
      }
    }

    atomic_store(v11 + 1, v12);
    void *v24 = a2;
    v24[1] = v7 | 0x800000000LL;
    return memcpy(v24 + 2, v5 + 2, v8);
  }

  return result;
}

double PushFunc(uint64_t a1)
{
  unsigned int v2 = (unsigned int *)(a1 + 48);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  do
    unsigned int v4 = atomic_load((unsigned int *)(a1 + 52));
  while (v4 != v3);
  unint64_t v5 = *(unsigned int **)(a1 + 40);
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = v5 + 1;
  uint64_t v7 = atomic_load(v5 + 1);
  while (1)
  {
    uint64_t v8 = v7;
    unint64_t v9 = v7 + 64;
    unint64_t v10 = *v5;
    if (v9 > v10) {
      break;
    }
    uint64_t v7 = __ldaxr(v6);
    if (v7 == v8)
    {
      if (!__stlxr(v9, v6))
      {
        unint64_t v10 = *v5;
        break;
      }
    }

    else
    {
      __clrex();
    }
  }

  if (v9 <= v10)
  {
    unint64_t v22 = (_OWORD *)((char *)v5 + v8);
    signed int v11 = v3 + 1;
  }

  else
  {
LABEL_13:
    signed int v11 = v3 + 1;
    else {
      uint64_t v12 = (uint64_t)v11 << 7;
    }
    unsigned int v13 = (unsigned int *)GTTraceStoreAllocNode(**(int ***)(a1 + 24), v12, 1, *(void *)a1);
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      uint64_t v15 = (void *)(v14 + 40);
    }
    else {
      uint64_t v15 = (void *)(a1 + 32);
    }
    *uint64_t v15 = v13;
    *(void *)(a1 + 40) = v13;
    *((void *)v13 + 5) = 0LL;
    unint64_t v16 = v13 + 1;
    uint64_t v17 = atomic_load(v13 + 1);
    while (1)
    {
      uint64_t v18 = v17;
      unint64_t v19 = v17 + 64;
      unint64_t v20 = *v13;
      if (v19 > v20) {
        break;
      }
      uint64_t v17 = __ldaxr(v16);
      if (v17 == v18)
      {
        if (!__stlxr(v19, v16))
        {
          unint64_t v20 = *v13;
          break;
        }
      }

      else
      {
        __clrex();
      }
    }

    uint64_t v21 = (_OWORD *)((char *)v13 + v18);
    if (v19 <= v20) {
      unint64_t v22 = v21;
    }
    else {
      unint64_t v22 = 0LL;
    }
  }

  double result = 0.0;
  v22[2] = 0u;
  v22[3] = 0u;
  *unint64_t v22 = 0u;
  v22[1] = 0u;
  atomic_store(v11, (unsigned int *)(a1 + 52));
  return result;
}

uint64_t GTTraceEncoder_storeBytes(uint64_t a1, void *__src, size_t __n)
{
  uint64_t v3 = 0LL;
  if (__src)
  {
    unsigned int v4 = __n;
    if (__n)
    {
      uint64_t v3 = *(unsigned __int8 *)(a1 + 41);
      if (v3 + __n > 0x40)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 8) + 24LL);
        uint64_t v3 = *(unsigned __int8 *)(a1 + 42);
        *(_BYTE *)(a1 + 42) = v3 + 1;
        if ((_DWORD)__n)
        {
          Bytes = GTTraceMemPool_allocateBytes( v7,  *(void *)(a1 + 24),  v3 | ((unint64_t)__n << 32));
          memcpy(Bytes + 16, __src, v4);
        }
      }

      else
      {
        memcpy((void *)(*(void *)(a1 + 16) + v3), __src, __n);
        *(_BYTE *)(a1 + 41) += (v4 + 7) & 0xF8;
      }
    }
  }

  return v3;
}

uint64_t GTTraceEncoder_finishEncoding(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 16) + 15LL) |= 8u;
  return result;
}

void GTTraceContext_popEncoder()
{
  *(void *)uint64_t v0 = v1;
  *(_BYTE *)(v0 + 8) = *(_BYTE *)(v2 + 40);
  *(_BYTE *)(*(void *)(v2 + 16) + 15LL) |= 8u;
}

void *GTTraceEncoder_setStream(uint64_t *a1, uint64_t a2)
{
  double result = (void *)GTTraceEncoder_setStream_((uint64_t)a1, a2);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(*a1 + 120));
  if ((v4 & 1) != 0) {
    return GTTraceContext_backtrace(*a1, a1[3]);
  }
  return result;
}

char *GTTraceEncoder_allocateArguments(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(_DWORD *)(v3 + 8) = a2;
  if (a3)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
    if ((unint64_t)(v4 + a3) > 0x40)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 24LL);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 42);
      *(_BYTE *)(a1 + 42) = v7 + 1;
      unint64_t v5 = GTTraceMemPool_allocateBytes(v6, *(void *)(a1 + 24), v7 | (a3 << 32)) + 16;
      LOBYTE(v4) = v7;
    }

    else
    {
      unint64_t v5 = (char *)(v3 + v4);
      *(_BYTE *)(a1 + 41) = v4 + a3;
    }
  }

  else
  {
    unint64_t v5 = 0LL;
    LOBYTE(v4) = 0;
  }

  *(_BYTE *)(v3 + 13) = v4;
  return v5;
}

uint64_t GTTraceEncoder_storeBlob(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = 0LL;
  if (a2)
  {
    if (a3)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 24LL);
      uint64_t v3 = *(unsigned __int8 *)(a1 + 42);
      *(_BYTE *)(a1 + 42) = v3 + 1;
      if ((_DWORD)a3)
      {
        size_t v6 = a3;
        Bytes = GTTraceMemPool_allocateBytes( v4,  *(void *)(a1 + 24),  v3 | ((unint64_t)a3 << 32));
        memcpy(Bytes + 16, a2, v6);
      }
    }
  }

  return v3;
}

char *GTTraceEncoder_allocateBlobWithType(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 24LL);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 42);
  *(_BYTE *)(a1 + 42) = v6 + 1;
  return GTTraceMemPool_allocateBytes( v4,  v5,  (a2 << 32) | ((unint64_t)a3 << 16) | ((unint64_t)a4 << 8) | v6);
}

__n128 GTTraceEncoder_cloneToStream(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(a1 + 16) + 15LL) |= 8u;
  PushFunc(a2);
  uint64_t v3 = *(void *)(a1 + 16);
  __int128 v5 = *(_OWORD *)(v3 + 32);
  __n128 result = *(__n128 *)(v3 + 48);
  __int128 v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)v3;
  *(_OWORD *)(v7 + 16) = v6;
  *(_OWORD *)(v7 + 32) = v5;
  *(__n128 *)(v7 + 48) = result;
  return result;
}

uint64_t GTTraceStream_uniqueIdentifier(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t GTTraceStream_deviceObject(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t GTTraceStream_deviceObjectOrNULL(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t GTTraceStream_toolsObject(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t GTTraceStream_memoryPool(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t GTTraceStream_setBoundTimestamp(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = (unint64_t *)(result + 56);
    unint64_t v3 = atomic_load((unint64_t *)(result + 56));
    while (1)
    {
      unint64_t v4 = __ldaxr(v2);
      if (v4 != v3) {
        break;
      }
      if (__stlxr(v3 & 0x1F | a2 & 0xFFFFFFFFFFFFFFE0LL, v2)) {
        goto LABEL_7;
      }
      int v5 = 1;
LABEL_8:
      unint64_t v3 = v4;
      if (v5) {
        return result;
      }
    }

    __clrex();
LABEL_7:
    int v5 = 0;
    goto LABEL_8;
  }

  return result;
}

uint64_t GTTraceStream_touchBoundTimestamp(uint64_t a1)
{
  uint64_t result = mach_absolute_time();
  if (a1)
  {
    unint64_t v3 = (unint64_t *)(a1 + 56);
    unint64_t v4 = atomic_load((unint64_t *)(a1 + 56));
    while (1)
    {
      unint64_t v5 = __ldaxr(v3);
      if (v5 != v4) {
        break;
      }
      if (__stlxr(v4 & 0x1F | result & 0xFFFFFFFFFFFFFFE0LL, v3)) {
        goto LABEL_7;
      }
      int v6 = 1;
LABEL_8:
      unint64_t v4 = v5;
      if (v6) {
        return result;
      }
    }

    __clrex();
LABEL_7:
    int v6 = 0;
    goto LABEL_8;
  }

  return result;
}

uint64_t GTTraceStream_touchResourceUsage(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = (unint64_t *)(result + 56);
    unint64_t v3 = atomic_load((unint64_t *)(result + 56));
    while (1)
    {
      unint64_t v4 = __ldaxr(v2);
      if (v4 != v3) {
        break;
      }
      if (__stlxr(v3 | a2, v2)) {
        goto LABEL_7;
      }
      int v5 = 1;
LABEL_8:
      unint64_t v3 = v4;
      if (v5) {
        return result;
      }
    }

    __clrex();
LABEL_7:
    int v5 = 0;
    goto LABEL_8;
  }

  return result;
}

uint64_t GTTraceStream_touchUpdated(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (unint64_t *)(result + 56);
    unint64_t v2 = atomic_load((unint64_t *)(result + 56));
    while (1)
    {
      unint64_t v3 = __ldaxr(v1);
      if (v3 != v2) {
        break;
      }
      if (__stlxr(v2 | 8, v1)) {
        goto LABEL_7;
      }
      int v4 = 1;
LABEL_8:
      unint64_t v2 = v3;
      if (v4) {
        return result;
      }
    }

    __clrex();
LABEL_7:
    int v4 = 0;
    goto LABEL_8;
  }

  return result;
}

uint64_t GTTraceStream_resetUpdated(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (unint64_t *)(result + 56);
    unint64_t v2 = atomic_load((unint64_t *)(result + 56));
    while (1)
    {
      unint64_t v3 = __ldaxr(v1);
      if (v3 != v2) {
        break;
      }
      if (__stlxr(v2 & 0xFFFFFFFFFFFFFFF7LL, v1)) {
        goto LABEL_7;
      }
      int v4 = 1;
LABEL_8:
      unint64_t v2 = v3;
      if (v4) {
        return result;
      }
    }

    __clrex();
LABEL_7:
    int v4 = 0;
    goto LABEL_8;
  }

  return result;
}

uint64_t GTTraceStream_resourceUsage(uint64_t result)
{
  if (result)
  {
    char v1 = atomic_load((unint64_t *)(result + 56));
    return v1 & 3;
  }

  return result;
}

unint64_t GTTraceStream_boundTimestamp(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    return v1 & 0xFFFFFFFFFFFFFFE0LL;
  }

  return result;
}

uint64_t GTTraceStream_updated(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    return (v1 >> 3) & 1;
  }

  return result;
}

uint64_t GTTraceStream_markForDeferredClose(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = (unint64_t *)(result + 56);
    unint64_t v2 = atomic_load((unint64_t *)(result + 56));
    while (1)
    {
      unint64_t v3 = __ldaxr(v1);
      if (v3 != v2) {
        break;
      }
      if (__stlxr(v2 | 0x10, v1)) {
        goto LABEL_7;
      }
      int v4 = 1;
LABEL_8:
      unint64_t v2 = v3;
      if (v4) {
        return result;
      }
    }

    __clrex();
LABEL_7:
    int v4 = 0;
    goto LABEL_8;
  }

  return result;
}

uint64_t GTTraceStream_firstFunc(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1 && (*(_BYTE *)(v1 + 79) & 8) != 0) {
      return v1 + 64;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t GTTraceStream_lastFunc(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    unsigned int v2 = atomic_load((unsigned int *)(v1 + 4));
    if (v2 < 0x80)
    {
LABEL_7:
      uint64_t v1 = *(void *)(a1 + 32);
      if (v1)
      {
        unsigned int v6 = 0;
        while (1)
        {
          unsigned int v7 = atomic_load((unsigned int *)(v1 + 4));
          int v8 = v6 + (v7 >> 6) - 1;
          if (v8 > 0) {
            break;
          }
          uint64_t v1 = *(void *)(v1 + 40);
          unsigned int v6 = v8;
          if (!v1) {
            return v1;
          }
        }

        uint64_t v9 = v6;
        uint64_t v10 = (uint64_t)(0xFFFFFFFF00000001LL * v6) >> 32;
        if ((*(_BYTE *)(v1 + (v10 << 6) + 79) & 8) != 0)
        {
          do
          {
            uint64_t v11 = v1;
            uint64_t v12 = v10;
            unsigned int v13 = atomic_load((unsigned int *)(v1 + 4));
            uint64_t v14 = (HIDWORD(v9) + 1);
            if ((_DWORD)v14 == (_DWORD)v9 + (v13 >> 6) - 1)
            {
              uint64_t v1 = *(void *)(v11 + 40);
              if (!v1) {
                return v11 + (v12 << 6) + 64;
              }
              uint64_t v9 = (HIDWORD(v9) + 1);
            }

            else
            {
              uint64_t v9 = v9;
              uint64_t v1 = v11;
            }

            v9 |= v14 << 32;
            uint64_t v10 = (uint64_t)(0xFFFFFFFF00000001LL * v9) >> 32;
          }

          while ((*(_BYTE *)(v1 + (v10 << 6) + 79) & 8) != 0);
          return v11 + (v12 << 6) + 64;
        }

        else
        {
          return 0LL;
        }
      }
    }

    else
    {
      int v3 = (v2 >> 6) - 2;
      uint64_t v4 = v1 + 64;
      while (1)
      {
        uint64_t v1 = v4 + ((unint64_t)v3 << 6);
        if ((*(_BYTE *)(v1 + 15) & 8) != 0) {
          break;
        }
        BOOL v5 = __OFSUB__(v3--, 1);
        if (v3 < 0 != v5) {
          goto LABEL_7;
        }
      }
    }
  }

  return v1;
}

uint64_t GTTraceStream_makeIterator(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    int v3 = 0;
    do
    {
      unsigned int v4 = atomic_load((unsigned int *)(result + 4));
      int v5 = v3 + (v4 >> 6) - 1;
      if (v5 > a2) {
        break;
      }
      uint64_t result = *(void *)(result + 40);
      int v3 = v5;
    }

    while (result);
  }

  return result;
}

uint64_t GTTraceStreamIteratorFunc(uint64_t a1)
{
  if (*(void *)a1
    && (uint64_t v1 = *(void *)a1 + ((*(int *)(a1 + 12) - (uint64_t)*(int *)(a1 + 8)) << 6), (*(_BYTE *)(v1 + 79) & 8) != 0))
  {
    return v1 + 64;
  }

  else
  {
    return 0LL;
  }

_DWORD *GTTraceStreamIteratorNext(_DWORD *result)
{
  unsigned int v1 = atomic_load((unsigned int *)(*(void *)result + 4LL));
  int v2 = result[2] + (v1 >> 6);
  int v3 = result[3] + 1;
  result[3] = v3;
  if (v3 == v2 - 1)
  {
    result[2] = v3;
    *(void *)uint64_t result = *(void *)(*(void *)result + 40LL);
  }

  return result;
}

BOOL GTTraceStreamIteratorBegin(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12) == 0;
}

BOOL GTTraceStreamIteratorEnd(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v2 = v1 + ((*((int *)a1 + 3) - (uint64_t)*((int *)a1 + 2)) << 6);
    if ((*(_BYTE *)(v2 + 79) & 8) != 0) {
      uint64_t v1 = v2 + 64;
    }
    else {
      uint64_t v1 = 0LL;
    }
  }

  return v1 == 0;
}

uint64_t GTTraceFuncGetAttribs(uint64_t result, _BYTE *a2)
{
  if (result)
  {
    entry = find_entry(result, a2, 8uLL, 0LL);
    if (*entry) {
      return *(void *)(*entry + 32LL);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void *GTCaptureArchive_open(const char *a1, apr_pool_t *a2)
{
  unsigned int v4 = realpath_DARWIN_EXTSN(a1, v53);
  if (v4) {
    a1 = v4;
  }
  int v5 = gt_filepath_merge(a1, "index", a2);
  int v6 = open(v5, 0);
  if (v6 < 0) {
    return 0LL;
  }
  int v7 = v6;
  fstat(v6, &v49);
  int v8 = apr_palloc(a2, v49.st_size);
  uint64_t v9 = 0LL;
  off_t st_size = v49.st_size;
  do
  {
    else {
      size_t v11 = st_size - v9;
    }
    ssize_t v12 = read(v7, (char *)v8 + v9, v11);
    if (v12 == -1) {
      ssize_t v13 = 0LL;
    }
    else {
      ssize_t v13 = v12;
    }
    v9 += v13;
  }

  while (v12 != -1 && v9 != st_size);
  close(v7);
  if (v49.st_size < 0x14uLL) {
    return 0LL;
  }
  if (*v8 != 1667851384) {
    return 0LL;
  }
  if (v8[1]) {
    return 0LL;
  }
  uint64_t v15 = v8[2];
  uint64_t v16 = (uint64_t)&v8[3 * v15 + 5];
  uint64_t v17 = v8[3];
  uint64_t v18 = v16 + 24LL * v17;
  uint64_t v19 = v8[4];
  unint64_t v20 = apr_array_make(a2, v19, 8);
  uint64_t v21 = v8[4];
  if ((_DWORD)v21)
  {
    unint64_t v22 = 0LL;
    unint64_t v23 = (char *)v8 + v49.st_size;
    unint64_t v24 = v18 + 2 * v21;
    while ((unint64_t)v23 > v24)
    {
      *(void *)apr_array_push(v20) = v24;
      v24 += *(unsigned __int16 *)(v18 + 2 * v22++);
    }

    return 0LL;
  }

uint64_t GTCaptureArchive_cleanup(uint64_t a1)
{
  return 0LL;
}

void GTCaptureArchive_overrideURL(uint64_t a1, const char *a2, const char *a3)
{
  int v6 = newpool;
  int v7 = gt_filepath_merge(*(const char **)a1, a3, newpool);
  int v8 = fopen(v7, "r");
  uint64_t v9 = v8;
  if (v8)
  {
    int v10 = fileno(v8);
    if (!fstat(v10, &v16))
    {
      size_t v11 = apr_pstrdup(*(apr_pool_t **)(a1 + 8), a2);
      ssize_t v12 = apr_pstrdup(*(apr_pool_t **)(a1 + 8), a3);
      ssize_t v13 = *(apr_array_header_t **)(a1 + 48);
      int nelts = v13->nelts;
      *(void *)apr_array_push(v13) = v12;
      LODWORD(v12) = (LODWORD(v16.st_size) + vm_page_size - 1) & -(int)vm_page_size;
      uint64_t v15 = apr_array_push(*(apr_array_header_t **)(a1 + 80));
      *uint64_t v15 = (_DWORD)v12;
      v15[1] = nelts;
      *((void *)v15 + 1) = 0LL;
      *((void *)v15 + 2) = 2LL;
      apr_hash_set(*(apr_hash_t **)(a1 + 88), v11, -1LL, v15);
    }
  }

  fclose(v9);
  apr_pool_destroy(v6);
}

__n128 GTCaptureArchive_getUUID(__n128 *a1, __n128 *a2)
{
  __n128 result = a1[6];
  *a2 = result;
  return result;
}

uint64_t GTCaptureArchive_rootPath(uint64_t a1)
{
  return *(void *)a1;
}

size_t GTCaptureArchive_getFileWithFilename(uint64_t a1, char *a2)
{
  uint64_t v4 = *find_entry(*(void *)(a1 + 88), a2, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  if (!v4 || (size_t result = *(void *)(v4 + 32)) == 0)
  {
    size_t result = strlen(a2);
    if (result)
    {
      unsigned int v6 = dy_hash_string((uint64_t)a2, result);
      unsigned int v7 = *(_DWORD *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 32);
      unsigned int v9 = v6 % v7;
      uint64_t v10 = (int)(v6 % v7);
      while (1)
      {
        unsigned int v11 = *(_DWORD *)(v8 + 12 * v10);
        if (v11 == -1) {
          return 0LL;
        }
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 24LL);
        if (v7 <= ++v10)
        {
          if (v9)
          {
            uint64_t v13 = 0LL;
            for (uint64_t i = (unsigned int *)(v8 + 4); ; i += 3)
            {
              unsigned int v11 = *(i - 1);
              if (v11 == -1) {
                break;
              }
              size_t result = 0LL;
            }
          }

          return 0LL;
        }
      }

      return *(void *)(a1 + 40) + 24LL * v11;
    }
  }

  return result;
}

uint64_t dy_hash_string(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = -1640531527;
  unint64_t v3 = a2 - 1;
  if (a2 == 1) {
    goto LABEL_5;
  }
  unint64_t v4 = 0LL;
  do
  {
    unsigned int v5 = v2 + *(unsigned __int8 *)(a1 + v4);
    int v6 = (v5 << 16) ^ (*(unsigned __int8 *)(a1 + v4 + 1) << 11);
    unsigned int v2 = (v6 ^ v5) + ((v6 ^ v5) >> 11);
    v4 += 2LL;
  }

  while (v4 < v3);
  if ((a2 & 1) != 0) {
LABEL_5:
  }
  unsigned int v7 = (v2 ^ (8 * v2)) + ((v2 ^ (8 * v2)) >> 5);
  unsigned int v8 = (v7 ^ (4 * v7)) + ((v7 ^ (4 * v7)) >> 15);
  unsigned int v9 = v8 ^ (v8 << 10);
  if (v9) {
    return v9;
  }
  else {
    return 0x40000000LL;
  }
}

BOOL GTCaptureFileEntry_isCompressed(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 16) & 2) == 0;
}

void *GTCaptureArchiveDecompressor_create(apr_pool_t *a1)
{
  unsigned int v2 = apr_palloc(a1, 0x10uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    *unsigned int v2 = 0LL;
    v2[1] = 0LL;
  }

  apr_pool_create_ex((apr_pool_t **)v2, a1, 0LL, 0LL);
  apr_size_t v4 = compression_decode_scratch_buffer_size(COMPRESSION_ZLIB);
  v3[1] = apr_palloc(a1, v4);
  return v3;
}

uint64_t GTCaptureArchiveDecompressor_tempPool(uint64_t a1)
{
  return *(void *)a1;
}

void *GTCaptureArchive_mapDataSeperateFile(uint64_t a1, unsigned int *a2, apr_pool_t *a3, int *a4)
{
  unsigned int v7 = a2[4];
  if (!a4)
  {
    if ((v7 & 2) == 0) {
      return 0LL;
    }
    unsigned int v10 = a2[1];
    uint64_t v11 = *(void *)(a1 + 48);
    if (v10 >= *(_DWORD *)(v11 + 12)) {
      return 0LL;
    }
    goto LABEL_8;
  }

  if ((v7 & 2) != 0)
  {
    unsigned int v10 = a2[1];
    uint64_t v11 = *(void *)(a1 + 48);
    if (v10 >= *(_DWORD *)(v11 + 12))
    {
      int v16 = *a4;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v21 = v16;
      int v22 = 500;
      unsigned int v9 = "0 <= entry->name_entry && entry->name_entry < self->index.string_table->nelts";
      goto LABEL_12;
    }

uint64_t GTData_munmap(uint64_t a1)
{
  return 0LL;
}

unint64_t GTCaptureArchive_fileBackingStore(uint64_t a1, uint64_t a2, int *a3)
{
  int v3 = *(_DWORD *)(a2 + 16);
  if (!a3)
  {
    if ((v3 & 2) != 0) {
      return 0LL;
    }
    unint64_t v4 = *(void *)(a2 + 8);
    if (v4 > *(void *)(a1 + 72)) {
      return 0LL;
    }
    return *(void *)(a1 + 64) + v4;
  }

  if ((v3 & 2) != 0)
  {
    int v8 = *a3;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    int v9 = v8;
    int v10 = 500;
    int v6 = "!(entry->flags & 0x00000002)";
    goto LABEL_9;
  }

  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 <= *(void *)(a1 + 72)) {
    return *(void *)(a1 + 64) + v4;
  }
  int v5 = *a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  int v9 = v5;
  int v10 = 500;
  int v6 = "entry->storage_offset <= archive->backingStore.length";
LABEL_9:
  uint64_t v11 = v6;
  GTError_addError(a3, (uint64_t)&v9);
  return 0LL;
}

void GTCaptureArchive_fillBufferCompressedDeflate( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, int *a6)
{
  if (!a2 && a6)
  {
    int v12 = *a6;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    int v18 = v12;
    int v19 = 500;
    unint64_t v20 = "decompressor != NULL";
    GTError_addError(a6, (uint64_t)&v18);
LABEL_14:
    bzero(a4, a5);
    return;
  }

  if (!a2) {
    goto LABEL_14;
  }
  if (a6 && *(_DWORD *)(a3 + 4) <= 5u)
  {
    int v13 = *a6;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    int v18 = v13;
    int v19 = 500;
    unint64_t v20 = "ZLIB_HEADER_SIZE + ZLIB_ADLER_SIZE <= entry->storage_size";
    GTError_addError(a6, (uint64_t)&v18);
  }

  if (*(_DWORD *)(a3 + 4) < 6u) {
    goto LABEL_14;
  }
  unint64_t v14 = GTCaptureArchive_fileBackingStore(a1, a3, a6);
  if (!v14) {
    goto LABEL_14;
  }
  size_t v15 = compression_decode_buffer( (uint8_t *)a4,  a5,  (const uint8_t *)(v14 + 2),  (*(_DWORD *)(a3 + 4) - 6),  *(void **)(a2 + 8),  COMPRESSION_ZLIB);
  size_t v16 = v15;
  if (a6)
  {
    if (v15 != a5)
    {
      int v17 = *a6;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      int v18 = v17;
      int v19 = 500;
      unint64_t v20 = "total_out == destSize";
      GTError_addError(a6, (uint64_t)&v18);
    }
  }

  if (v16 != a5) {
    goto LABEL_14;
  }
}

void GTCaptureArchive_fillBuffer(uint64_t a1, apr_pool_t **a2, char *a3, void *a4, size_t a5, int *a6)
{
  FileWithFilename = (unsigned int *)GTCaptureArchive_getFileWithFilename(a1, a3);
  size_t v12 = *FileWithFilename;
  if (a6 && v12 < a5)
  {
    int v13 = *a6;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v14[0] = v13;
    v14[1] = 500;
    size_t v15 = "destSize <= entry->size";
    GTError_addError(a6, (uint64_t)v14);
    size_t v12 = *FileWithFilename;
  }

  if (v12 >= a5)
  {
    if ((FileWithFilename[4] & 2) != 0) {
      GTCaptureArchive_fillBufferSeperateFile( *(const char **)a1,  *(const char **)(*(void *)(*(void *)(a1 + 48) + 24LL) + 8LL * FileWithFilename[1]),  a4,  a5,  *a2,  a6);
    }
    else {
      GTCaptureArchive_fillBufferCompressedDeflate(a1, (uint64_t)a2, (uint64_t)FileWithFilename, a4, a5, a6);
    }
  }

  else
  {
    bzero(a4, a5);
  }

void GTCaptureArchive_fillBufferSeperateFile( const char *a1, const char *a2, void *a3, size_t a4, apr_pool_t *a5, int *a6)
{
  int v9 = gt_filepath_merge(a1, a2, a5);
  int v10 = open(v9, 0, 0LL);
  char v11 = GTFile_map(v10, (uint64_t)a3, a4);
  if ((v10 & 0x80000000) == 0) {
    close(v10);
  }
  if (a6) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    int v13 = *a6;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v14[0] = v13;
    v14[1] = 500;
    size_t v15 = "mapped";
    GTError_addError(a6, (uint64_t)v14);
  }

  if ((v11 & 1) == 0) {
    bzero(a3, a4);
  }
}

void *GTCaptureArchive_readData(const char **a1, apr_pool_t **a2, char *a3, apr_pool_t *a4, int *a5)
{
  if (!a3) {
    return 0LL;
  }
  FileWithFilename = (unsigned int *)GTCaptureArchive_getFileWithFilename((uint64_t)a1, a3);
  if (!FileWithFilename) {
    return 0LL;
  }
  uint64_t v11 = (uint64_t)FileWithFilename;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v17 = 0u;
  unsigned int v12 = FileWithFilename[4];
  apr_size_t v13 = *FileWithFilename;
  unint64_t v14 = apr_palloc(a4, v13);
  if ((v12 & 2) != 0) {
    GTCaptureArchive_fillBufferSeperateFile(*a1, a3, v14, v13, *a2, (int *)&v17);
  }
  else {
    GTCaptureArchive_fillBufferCompressedDeflate((uint64_t)a1, (uint64_t)a2, v11, v14, v13, (int *)&v17);
  }
  if (DWORD1(v17))
  {
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    GTError_addError(a5, (uint64_t)v16);
    return 0LL;
  }

  return v14;
}

void *GTCaptureArchive_mapData(uint64_t a1, uint64_t a2, char *a3, apr_pool_t *a4, int *a5)
{
  FileWithFilename = (unsigned int *)GTCaptureArchive_getFileWithFilename(a1, a3);
  if (!FileWithFilename) {
    return 0LL;
  }
  uint64_t v10 = (uint64_t)FileWithFilename;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v15 = 0u;
  if ((FileWithFilename[4] & 2) != 0)
  {
    unsigned int v12 = GTCaptureArchive_mapDataSeperateFile(a1, FileWithFilename, a4, (int *)&v15);
  }

  else
  {
    apr_size_t v11 = *FileWithFilename;
    unsigned int v12 = apr_palloc(a4, v11);
    GTCaptureArchive_fillBufferCompressedDeflate(a1, a2, v10, v12, v11, (int *)&v15);
  }

  if (DWORD1(v15))
  {
    v14[0] = v15;
    v14[1] = v16;
    _DWORD v14[2] = v17;
    GTError_addError(a5, (uint64_t)v14);
    return 0LL;
  }

  return v12;
}

apr_array_header_t *GTCaptureArchive_sortedStrings(uint64_t a1, apr_pool_t *p)
{
  unsigned int v2 = apr_array_copy(p, *(const apr_array_header_t **)(a1 + 48));
  qsort(v2->elts, v2->nelts, v2->elt_size, (int (__cdecl *)(const void *, const void *))GTCaptureArchive_strcmp);
  return v2;
}

uint64_t GTCaptureArchive_strcmp(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t GTCaptureArchive_filenamesWithPrefix(uint64_t a1, char *__s, apr_array_header_t *a3)
{
  uint64_t result = strlen(__s);
  size_t v7 = result;
  int v8 = *(const char ***)(a1 + 24);
  unint64_t v9 = *(int *)(a1 + 12);
  uint64_t v10 = &v8[v9];
  if ((int)v9 >= 1)
  {
    do
    {
      apr_size_t v11 = &v8[v9 >> 1];
      apr_size_t v13 = *v11;
      unsigned int v12 = v11 + 1;
      uint64_t result = strncmp(v13, __s, v7);
      else {
        v9 += ~(v9 >> 1);
      }
    }

    while ((uint64_t)v9 > 0);
  }

  while (v8 != v10)
  {
    unint64_t v14 = *v8;
    uint64_t result = strncmp(*v8, __s, v7);
    if ((_DWORD)result) {
      break;
    }
    uint64_t result = (uint64_t)apr_array_push(a3);
    *(void *)uint64_t result = v14;
    ++v8;
  }

  return result;
}

apr_array_header_t *GTCaptureArchive_fileIndex(uint64_t a1, apr_pool_t *p)
{
  unint64_t v4 = apr_array_make(p, *(_DWORD *)(a1 + 60), 32);
  v4->int nelts = *(_DWORD *)(a1 + 60);
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(int *)(v5 + 12) >= 1)
  {
    uint64_t v6 = 0LL;
    do
    {
      size_t v7 = *(char **)(*(void *)(v5 + 24) + 8 * v6);
      size_t FileWithFilename = GTCaptureArchive_getFileWithFilename(a1, v7);
      uint64_t v9 = (uint64_t)&v4->elts[0x5555555555555560LL * ((FileWithFilename - *(void *)(a1 + 40)) >> 3)];
      *(void *)uint64_t v9 = apr_pstrdup(p, v7);
      *(_DWORD *)(v9 + 8) = *(_DWORD *)FileWithFilename;
      *(_DWORD *)(v9 + 12) = *(_DWORD *)(FileWithFilename + 4);
      *(void *)(v9 + 16) = *(void *)(FileWithFilename + 8);
      *(_DWORD *)(v9 + 24) = *(_DWORD *)(FileWithFilename + 16);
      ++v6;
      uint64_t v5 = *(void *)(a1 + 48);
    }

    while (v6 < *(int *)(v5 + 12));
  }

  return v4;
}

uint64_t GTCaptureFileIndex_compareByStorageOffset(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a2 + 16);
  if (v2 == v3) {
    return strcmp(*(const char **)a1, *(const char **)a2);
  }
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t GTCaptureFileIndex_compareByName(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void GTCaptureFileIndex_save(uint64_t a1, const char *a2)
{
  uint64_t v30 = 1667851384LL;
  unsigned int v3 = (2 * *(_DWORD *)(a1 + 12) + 1023) & 0xFFFFFC00;
  unsigned int v31 = v3;
  unint64_t v4 = newpool;
  uint64_t v5 = (char *)apr_palloc(newpool, 12LL * v3);
  memset(v5, 255, 12LL * v3);
  unsigned int v32 = *(_DWORD *)(a1 + 12);
  apr_size_t v26 = 24LL * v32;
  off_t v29 = apr_palloc(v4, v26);
  unsigned int v33 = *(_DWORD *)(a1 + 12);
  p = v4;
  apr_size_t v25 = 2LL * v33;
  uint64_t v6 = apr_palloc(v4, v25);
  if (*(int *)(a1 + 12) < 1)
  {
    apr_size_t v8 = 0LL;
  }

  else
  {
    uint64_t v7 = 0LL;
    apr_size_t v8 = 0LL;
    do
    {
      uint64_t v9 = *(void *)(a1 + 24);
      size_t v10 = strlen(*(const char **)(v9 + 32 * v7));
      __int16 v11 = v10;
      uint64_t v12 = (int)(dy_hash_string(*(void *)(v9 + 32 * v7), v10) % v3);
      while (1)
      {
        apr_size_t v13 = &v5[12 * v12];
        if (*(_DWORD *)v13 == -1) {
          break;
        }
        if (v3 <= ++v12)
        {
          uint64_t v14 = 0LL;
          apr_size_t v13 = v5 - 12;
          do
          {
            int v15 = *((_DWORD *)v13 + 3);
            v13 += 12;
            ++v14;
          }

          while (v15 != -1);
          break;
        }
      }

      *(_DWORD *)apr_size_t v13 = v7;
      *((_DWORD *)v13 + 1) = v7;
      uint64_t v16 = v9 + 32 * v7;
      v29[6 * v7] = *(_DWORD *)(v16 + 8);
      int v17 = v7;
      if ((*(_BYTE *)(v16 + 24) & 1) != 0) {
        int v17 = *(_DWORD *)(v16 + 12);
      }
      __int128 v18 = (char *)&v29[6 * v7];
      *((_DWORD *)v18 + 1) = v17;
      *((void *)v18 + 1) = *(void *)(v16 + 16);
      *((_DWORD *)v18 + 4) = *(_DWORD *)(v16 + 24);
      *((_DWORD *)v18 + 5) = 0;
      v6[v7] = v11 + 1;
      v8 += (unsigned __int16)(v11 + 1);
      ++v7;
    }

    while (v7 < *(int *)(a1 + 12));
  }

  __int128 v19 = (char *)apr_palloc(p, v8);
  if (*(int *)(a1 + 12) < 1)
  {
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    do
    {
      size_t v23 = (unsigned __int16)v6[v21];
      memcpy(&v19[v22], *(const void **)(*(void *)(a1 + 24) + v20), v23);
      v22 += v23;
      ++v21;
      v20 += 32LL;
    }

    while (v21 < *(int *)(a1 + 12));
  }

  v35.iov_base = &v30;
  v35.iov_len = 20LL;
  int v36 = v5;
  uint64_t v37 = 12LL * v3;
  uint64_t v38 = v29;
  apr_size_t v39 = v26;
  size_t v40 = v6;
  apr_size_t v41 = v25;
  ssize_t v42 = v19;
  uint64_t v43 = v22;
  int v24 = open(a2, 514, 438LL);
  writev(v24, &v35, 5);
  close(v24);
  apr_pool_destroy(p);
}

__n128 GTMTLGetTextureLevelInfoForDeviceWithOptions@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  char v7 = a1 + 11;
  if ((unint64_t)(a1 - 501) <= 0x3E)
  {
    if (((1LL << v7) & 0x2000000000100001LL) != 0)
    {
      *(_OWORD *)a3 = v17;
      uint64_t v9 = *((void *)&v18 + 1);
      uint64_t v8 = v18;
      uint64_t v11 = *((void *)&v19 + 1);
      uint64_t v10 = v19;
      result.n128_u64[0] = v20.n128_u64[0];
      *(__n128 *)(a3 + 48) = v20;
      uint64_t v12 = v21;
      uint64_t v13 = 2 * a2;
      goto LABEL_7;
    }

    if (((1LL << v7) & 0x4000000000800008LL) != 0) {
      goto LABEL_5;
    }
  }

  if (a1 == 590)
  {
LABEL_5:
    *(_OWORD *)a3 = v17;
    uint64_t v9 = *((void *)&v18 + 1);
    uint64_t v8 = v18;
    uint64_t v11 = *((void *)&v19 + 1);
    uint64_t v10 = v19;
    result.n128_u64[0] = v20.n128_u64[0];
    *(__n128 *)(a3 + 48) = v20;
    uint64_t v12 = v21;
    uint64_t v13 = 4 * a2;
LABEL_7:
    uint64_t v14 = v10 * v9 * v13;
    *(void *)(a3 + 16) = v8;
    *(void *)(a3 + 24) = v9;
    *(void *)(a3 + 32) = v10;
    *(void *)(a3 + 40) = v11;
    *(void *)(a3 + 64) = v12;
    *(void *)(a3 + 72) = v13;
    *(void *)(a3 + 80) = v9 * v13;
    *(void *)(a3 + 88) = v14;
    *(void *)(a3 + 96) = v11 * v14;
    return result;
  }

  __int128 v15 = v22;
  *(_OWORD *)(a3 + 64) = v21;
  *(_OWORD *)(a3 + 80) = v15;
  *(void *)(a3 + 96) = v23;
  __int128 v16 = v18;
  *(_OWORD *)a3 = v17;
  *(_OWORD *)(a3 + 16) = v16;
  __n128 result = v20;
  *(_OWORD *)(a3 + 32) = v19;
  *(__n128 *)(a3 + 48) = result;
  return result;
}

uint64_t GTMTLPixelFormatGetInfoForDevice@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t result = MTLPixelFormatGetInfoForDevice();
  char v5 = a1 + 11;
  if (((1LL << v5) & 0x2000000000100001LL) != 0)
  {
    uint64_t v6 = 2LL;
    goto LABEL_7;
  }

  if (((1LL << v5) & 0x4000000000800008LL) == 0)
  {
LABEL_4:
    if (a1 != 590) {
      return result;
    }
  }

  uint64_t v6 = 4LL;
LABEL_7:
  *(void *)(a2 + 24) = v6;
  return result;
}

BOOL GTMTLPixelFormatIsRGB10A8_2P(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 550;
}

char *GTNameSimilarityScore(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 length];
  if (v5 <= [v4 length]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v4;
  }
  char v7 = (char *)[v6 length];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    while (1)
    {
      unsigned int v10 = [v3 characterAtIndex:v9];
      if (v8 == ++v9)
      {
        uint64_t v9 = v8;
        break;
      }
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

id MTLDevice_newHeap(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = a1;
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___MTLHeapDescriptor);
  -[MTLHeapDescriptor setSize:](v11, "setSize:", a2);
  -[MTLHeapDescriptor setResourceOptions:](v11, "setResourceOptions:", a3);
  -[MTLHeapDescriptor setType:](v11, "setType:", a4);
  id v12 = [v10 newHeapWithDescriptor:v11];

  if (v9) {
    [v12 setLabel:v9];
  }

  return v12;
}

id MTLDevice_newBuffer(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  id v9 = (void *)objc_opt_new(&OBJC_CLASS___MTLBufferDescriptor);
  [v9 setLength:a2];
  [v9 setResourceOptions:a3];
  id v10 = [v8 newBufferWithDescriptor:v9];

  if (v10) {
    [v10 setLabel:v7];
  }

  return v10;
}

id MTLDevice_newTexture(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  id v12 = a1;
  uint64_t v13 = objc_opt_new(&OBJC_CLASS___MTLTextureDescriptor);
  -[MTLTextureDescriptor setTextureType:](v13, "setTextureType:", a2);
  -[MTLTextureDescriptor setPixelFormat:](v13, "setPixelFormat:", a3);
  -[MTLTextureDescriptor setWidth:](v13, "setWidth:", *a4);
  -[MTLTextureDescriptor setHeight:](v13, "setHeight:", a4[1]);
  -[MTLTextureDescriptor setDepth:](v13, "setDepth:", a4[2]);
  -[MTLTextureDescriptor setResourceOptions:](v13, "setResourceOptions:", a5);
  id v14 = [v12 newTextureWithDescriptor:v13];

  [v14 setLabel:v11];
  return v14;
}

id MTLHeap_backbuffer(void *a1)
{
  id v1 = a1;
  id v2 = [v1 currentAllocatedSize];
  id v3 = [v1 resourceOptions];
  if ([v1 type])
  {
    else {
      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = [v1 newBufferWithLength:v2 options:v3];
    [v4 makeAliasable];
  }

  return v4;
}

id MTLHeap_newBuffer(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  if ([v7 type])
  {
    if ([v7 type] == (char *)&dword_0 + 1)
    {
      id v9 = objc_msgSend(v7, "newBufferWithLength:options:offset:", a2, objc_msgSend(v7, "resourceOptions"), a3);
      goto LABEL_7;
    }

id MTLHeap_newTexture(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v13 = a1;
  id v14 = a7;
  __int128 v15 = objc_opt_new(&OBJC_CLASS___MTLTextureDescriptor);
  -[MTLTextureDescriptor setTextureType:](v15, "setTextureType:", a2);
  -[MTLTextureDescriptor setPixelFormat:](v15, "setPixelFormat:", a3);
  -[MTLTextureDescriptor setWidth:](v15, "setWidth:", *a5);
  -[MTLTextureDescriptor setHeight:](v15, "setHeight:", a5[1]);
  -[MTLTextureDescriptor setDepth:](v15, "setDepth:", a5[2]);
  -[MTLTextureDescriptor setUsage:](v15, "setUsage:", a4);
  -[MTLTextureDescriptor setResourceOptions:](v15, "setResourceOptions:", [v13 resourceOptions]);
  if ([v13 type])
  {
    if ([v13 type] == (char *)&dword_0 + 1)
    {
      id v16 = [v13 newTextureWithDescriptor:v15 offset:a6];
      goto LABEL_7;
    }

MTLTextureDescriptor *MTLTexture_descriptor(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new(&OBJC_CLASS___MTLTextureDescriptor);
  -[MTLTextureDescriptor setTextureType:](v2, "setTextureType:", [v1 textureType]);
  -[MTLTextureDescriptor setPixelFormat:](v2, "setPixelFormat:", [v1 pixelFormat]);
  -[MTLTextureDescriptor setWidth:](v2, "setWidth:", [v1 width]);
  -[MTLTextureDescriptor setHeight:](v2, "setHeight:", [v1 height]);
  -[MTLTextureDescriptor setDepth:](v2, "setDepth:", [v1 depth]);
  -[MTLTextureDescriptor setUsage:](v2, "setUsage:", [v1 usage]);
  -[MTLTextureDescriptor setResourceOptions:](v2, "setResourceOptions:", [v1 resourceOptions]);
  -[MTLTextureDescriptor setMipmapLevelCount:](v2, "setMipmapLevelCount:", [v1 mipmapLevelCount]);
  -[MTLTextureDescriptor setSampleCount:](v2, "setSampleCount:", [v1 sampleCount]);
  -[MTLTextureDescriptor setArrayLength:](v2, "setArrayLength:", [v1 arrayLength]);
  -[MTLTextureDescriptor setFramebufferOnly:](v2, "setFramebufferOnly:", [v1 isFramebufferOnly]);
  -[MTLTextureDescriptor setAllowGPUOptimizedContents:]( v2,  "setAllowGPUOptimizedContents:",  [v1 allowGPUOptimizedContents]);
  id v3 = [v1 compressionType];

  -[MTLTextureDescriptor setCompressionType:](v2, "setCompressionType:", v3);
  return v2;
}

char *__cdecl apr_cpystrn(char *dst, const char *src, apr_size_t dst_size)
{
  if (dst_size)
  {
    if (src && (id v3 = &dst[dst_size - 1], v3 > dst))
    {
      apr_size_t v4 = dst_size - 1;
      while (1)
      {
        int v5 = *(unsigned __int8 *)src;
        *dst = v5;
        if (!v5) {
          break;
        }
        ++dst;
        ++src;
        if (!--v4)
        {
          dst = v3;
          goto LABEL_8;
        }
      }
    }

    else
    {
LABEL_8:
      *dst = 0;
    }
  }

  return dst;
}

apr_status_t apr_tokenize_to_argv(const char *arg_str, char ***argv_out, apr_pool_t *token_context)
{
  while (1)
  {
    int v6 = *(unsigned __int8 *)arg_str;
    if (v6 != 9 && v6 != 32) {
      break;
    }
    ++arg_str;
  }

  if (!*arg_str)
  {
    int v7 = 1;
    goto LABEL_48;
  }

  int v7 = 1;
  id v8 = arg_str;
  do
  {
    if (v6 == 39) {
      id v9 = v8 + 1;
    }
    else {
      id v9 = v8;
    }
    if (v6 == 34) {
      ++v8;
    }
    else {
      id v8 = v9;
    }
    BOOL v10 = v6 != 34 && v6 != 39;
    BOOL v11 = v6 != 34 && v6 == 39;
    while (1)
    {
      int v12 = *(unsigned __int8 *)v8;
      if (v12 == 92)
      {
        unsigned int v15 = *((unsigned __int8 *)v8 + 1);
        BOOL v16 = v15 > 0x27;
        uint64_t v17 = (1LL << v15) & 0x8500000200LL;
        if (!v16 && v17 != 0)
        {
          ++v8;
          goto LABEL_38;
        }
      }

      else if (!*v8)
      {
        break;
      }

      if (v10 && (v12 == 9 || v12 == 32)) {
        break;
      }
      BOOL v13 = v12 == 39 && v11;
      BOOL v14 = v12 == 34 && v6 == 34;
      if (v14 || v13) {
        break;
      }
LABEL_38:
      ++v8;
    }

    if (*v8) {
      ++v8;
    }
    while (1)
    {
      int v6 = *(unsigned __int8 *)v8;
      if (v6 != 32 && v6 != 9) {
        break;
      }
      ++v8;
    }

    ++v7;
  }

  while (*v8);
LABEL_48:
  __n128 v20 = (char **)apr_palloc(token_context, 8LL * v7);
  *argv_out = v20;
  if (v7 < 2)
  {
    uint64_t v22 = 0LL;
    goto LABEL_106;
  }

  uint64_t v21 = 0LL;
  uint64_t v22 = (v7 - 1);
  while (2)
  {
    while (1)
    {
      int v23 = *(unsigned __int8 *)arg_str;
      if (v23 != 32 && v23 != 9) {
        break;
      }
      ++arg_str;
    }

    if (v23 == 39) {
      apr_size_t v25 = arg_str + 1;
    }
    else {
      apr_size_t v25 = arg_str;
    }
    if (v23 == 34) {
      apr_size_t v26 = arg_str + 1;
    }
    else {
      apr_size_t v26 = v25;
    }
    BOOL v27 = v23 != 34 && v23 != 39;
    BOOL v28 = v23 != 34 && v23 == 39;
    off_t v29 = v26;
    while (2)
    {
      int v30 = *(unsigned __int8 *)v29;
      if (v30 == 92)
      {
        unsigned int v33 = *((unsigned __int8 *)v29 + 1);
        BOOL v16 = v33 > 0x27;
        uint64_t v34 = (1LL << v33) & 0x8500000200LL;
        if (v16 || v34 == 0) {
          goto LABEL_71;
        }
        ++v29;
LABEL_88:
        ++v29;
        continue;
      }

      break;
    }

    if (!*v29) {
      goto LABEL_89;
    }
LABEL_71:
    if (!v27 || v30 != 9 && v30 != 32)
    {
      BOOL v31 = v30 == 39 && v28;
      BOOL v32 = v30 == 34 && v23 == 34;
      if (!v32 && !v31) {
        goto LABEL_88;
      }
    }

LABEL_89:
    arg_str = v29 + 1;
    (*argv_out)[v21] = (char *)apr_palloc(token_context, v29 + 1 - v26);
    if (v29 + 1 != v26)
    {
      int v36 = (*argv_out)[v21];
      uint64_t v37 = &v36[v29 - v26];
      if (v37 <= v36)
      {
LABEL_95:
        *int v36 = 0;
      }

      else
      {
        int64_t v38 = v29 - v26;
        while (1)
        {
          int v39 = *(unsigned __int8 *)v26;
          *int v36 = v39;
          if (!v39) {
            break;
          }
          ++v36;
          ++v26;
          if (!--v38)
          {
            int v36 = v37;
            goto LABEL_95;
          }
        }
      }
    }

    size_t v40 = (*argv_out)[v21];
    int v41 = *v40;
    if (*v40)
    {
      int v42 = 0;
      uint64_t v43 = (unsigned __int8 *)(v40 + 1);
      do
      {
        if (v42 || v41 != 92)
        {
          int v42 = 0;
          *v40++ = v41;
        }

        else
        {
          int v42 = 1;
        }

        int v44 = *v43++;
        int v41 = v44;
      }

      while (v44);
    }

    char *v40 = 0;
    if (++v21 != v22) {
      continue;
    }
    break;
  }

  __n128 v20 = *argv_out;
LABEL_106:
  v20[v22] = 0LL;
  return 0;
}

    *int v6 = 0;
    return buf;
  }

  if (statcode >> 6 > 0x752)
  {
    if (statcode > 0xA392F)
    {
      if (statcode > 0xAFC7F)
      {
        if (!bufsize) {
          return buf;
        }
        int v5 = &buf[bufsize - 1];
        int v6 = buf;
        if (v5 <= buf) {
          goto LABEL_89;
        }
        BOOL v14 = "Unrecognized resolver error";
        if (statcode == 720004) {
          BOOL v14 = "No address for host";
        }
        if (statcode == 720001) {
          unsigned int v15 = "Unknown host";
        }
        else {
          unsigned int v15 = v14;
        }
        BOOL v16 = bufsize - 1;
        uint64_t v17 = buf;
        while (1)
        {
          __int128 v18 = *(unsigned __int8 *)v15;
          *uint64_t v17 = v18;
          if (!v18) {
            break;
          }
          ++v17;
          ++v15;
          if (!--v16)
          {
LABEL_39:
            int v6 = v5;
            goto LABEL_89;
          }
        }
      }

      else
      {
        BOOL v10 = gai_strerror(statcode - 670000);
        if (!bufsize) {
          return buf;
        }
        int v6 = buf;
        if (!v10) {
          goto LABEL_89;
        }
        int v5 = &buf[bufsize - 1];
        int v6 = buf;
        if (v5 <= buf) {
          goto LABEL_89;
        }
        BOOL v11 = bufsize - 1;
        int v12 = buf;
        while (1)
        {
          BOOL v13 = *(unsigned __int8 *)v10;
          *int v12 = v13;
          if (!v13) {
            break;
          }
          ++v12;
          ++v10;
          if (!--v11) {
            goto LABEL_39;
          }
        }
      }
    }

    else
    {
      if (!bufsize) {
        return buf;
      }
      int v5 = &buf[bufsize - 1];
      int v6 = buf;
      if (v5 <= buf) {
        goto LABEL_89;
      }
      id v9 = 0LL;
      while (1)
      {
        buf[v9] = aAprDoesNotUnde[v9];
        if (v9 == 39) {
          break;
        }
        if (bufsize - 1 == ++v9) {
          goto LABEL_39;
        }
      }
    }
  }

  else
  {
    id v8 = "Could not perform a stat on the file.";
    switch(statcode)
    {
      case 20001:
        break;
      case 20002:
        id v8 = "A new pool could not be created.";
        break;
      case 20003:
      case 20018:
LABEL_70:
        id v8 = "Error string not specified yet";
        break;
      case 20004:
        id v8 = "An invalid date has been provided";
        break;
      case 20005:
        id v8 = "An invalid socket was returned";
        break;
      case 20006:
        id v8 = "No process was provided and one was required.";
        break;
      case 20007:
        id v8 = "No time was provided and one was required.";
        break;
      case 20008:
        id v8 = "No directory was provided and one was required.";
        break;
      case 20009:
        id v8 = "No lock was provided and one was required.";
        break;
      case 20010:
        id v8 = "No poll structure was provided and one was required.";
        break;
      case 20011:
        id v8 = "No socket was provided and one was required.";
        break;
      case 20012:
        id v8 = "No thread was provided and one was required.";
        break;
      case 20013:
        id v8 = "No thread key structure was provided and one was required.";
        break;
      case 20014:
        id v8 = "Internal error (specific information not available)";
        break;
      case 20015:
        id v8 = "No shared memory is currently available";
        break;
      case 20016:
        id v8 = "The specified IP address is invalid.";
        break;
      case 20017:
        id v8 = "The specified network mask is invalid.";
        break;
      case 20019:
        id v8 = "DSO load failed";
        break;
      case 20020:
        id v8 = "The given path is absolute";
        break;
      case 20021:
        id v8 = "The given path is relative";
        break;
      case 20022:
        id v8 = "The given path is incomplete";
        break;
      case 20023:
        id v8 = "The given path was above the root path";
        break;
      case 20024:
        id v8 = "The given path is misformatted or contained invalid characters";
        break;
      case 20025:
        id v8 = "The given path contained wildcard characters";
        break;
      case 20026:
        id v8 = "Could not find the requested symbol.";
        break;
      case 20027:
        id v8 = "The process is not recognized.";
        break;
      case 20028:
        id v8 = "Not enough entropy to continue.";
        break;
      default:
        switch(statcode)
        {
          case 70001:
            id v8 = "Your code just forked, and you are currently executing in the child process";
            break;
          case 70002:
            id v8 = "Your code just forked, and you are currently executing in the parent process";
            break;
          case 70003:
            id v8 = "The specified thread is detached";
            break;
          case 70004:
            id v8 = "The specified thread is not detached";
            break;
          case 70005:
            id v8 = "The specified child process is done executing";
            break;
          case 70006:
            id v8 = "The specified child process is not done executing";
            break;
          case 70007:
            id v8 = "The timeout specified has expired";
            break;
          case 70008:
            id v8 = "Partial results are valid but processing is incomplete";
            break;
          case 70012:
            id v8 = "Bad character specified on command line";
            break;
          case 70013:
            id v8 = "Missing parameter for the specified command line option";
            break;
          case 70014:
            id v8 = "End of file found";
            break;
          case 70015:
            id v8 = "Could not find specified socket in poll list.";
            break;
          case 70019:
            id v8 = "Shared memory is implemented anonymously";
            break;
          case 70020:
            id v8 = "Shared memory is implemented using files";
            break;
          case 70021:
            id v8 = "Shared memory is implemented using a key system";
            break;
          case 70022:
            id v8 = "There is no error, this value signifies an initialized error code";
            break;
          case 70023:
            id v8 = "This function has not been implemented on this platform";
            break;
          case 70024:
            id v8 = "passwords do not match";
            break;
          case 70025:
            id v8 = "The given lock was busy.";
            break;
          default:
            goto LABEL_70;
        }

        break;
    }

    if (!bufsize) {
      return buf;
    }
    int v6 = buf;
    if (&buf[bufsize - 1] <= buf) {
      goto LABEL_89;
    }
    __int128 v19 = bufsize - 1;
    __n128 v20 = buf;
    while (1)
    {
      uint64_t v21 = *(unsigned __int8 *)v8;
      *__n128 v20 = v21;
      if (!v21) {
        break;
      }
      ++v20;
      ++v8;
      if (!--v19)
      {
        int v6 = &buf[bufsize - 1];
        goto LABEL_89;
      }
    }
  }

  return buf;
}

const char *__cdecl apr_filepath_name_get(const char *pathname)
{
  id v2 = strrchr(pathname, 47);
  if (v2) {
    return v2 + 1;
  }
  else {
    return pathname;
  }
}

char *__cdecl apr_collapse_spaces(char *dest, const char *src)
{
  __darwin_ct_rune_t v3 = *(unsigned __int8 *)src;
  if (*src)
  {
    apr_size_t v4 = src + 1;
    while ((v3 & 0x80) == 0)
    {
      if ((_DefaultRuneLocale.__runetype[v3] & 0x4000) == 0) {
        goto LABEL_5;
      }
LABEL_6:
      __darwin_ct_rune_t v5 = *(unsigned __int8 *)v4++;
      __darwin_ct_rune_t v3 = v5;
      if (!v5) {
        goto LABEL_10;
      }
    }

    if (__maskrune(v3, 0x4000uLL)) {
      goto LABEL_6;
    }
LABEL_5:
    *dest++ = v3;
    goto LABEL_6;
  }

char *__cdecl apr_strerror(apr_status_t statcode, char *buf, apr_size_t bufsize)
{
  if (statcode <= 19999)
  {
    if ((strerror_r(statcode, buf, bufsize) & 0x80000000) == 0 || !bufsize) {
      return buf;
    }
    __darwin_ct_rune_t v5 = &buf[bufsize - 1];
    int v6 = buf;
    if (v5 > buf)
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        buf[v7] = aAprDoesNotUnde[v7];
        if (v7 == 39) {
          return buf;
        }
        if (bufsize - 1 == ++v7) {
          goto LABEL_39;
        }
      }
    }

apr_hash_t *__cdecl apr_hash_make(apr_pool_t *pool)
{
  v6.__darwin_time_t tv_sec = v6.tv_usec + 1000000 * v6.tv_sec;
  __darwin_time_t tv_sec = v6.tv_sec;
  __darwin_ct_rune_t v3 = apr_palloc(pool, 0x50uLL);
  void *v3 = pool;
  v3[9] = 0LL;
  v3[6] = 0xF00000000LL;
  *((_DWORD *)v3 + 14) = (&v6 ^ pool ^ v3 ^ tv_sec ^ HIDWORD(tv_sec)) - 1;
  apr_size_t v4 = apr_palloc(pool, 0x80uLL);
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
  }

  v3[1] = v4;
  v3[8] = 0LL;
  return (apr_hash_t *)v3;
}

apr_hash_t *__cdecl apr_hash_make_custom(apr_pool_t *pool, apr_hashfunc_t hash_func)
{
  uint64_t result = apr_hash_make(pool);
  *((void *)result + 8) = hash_func;
  return result;
}

apr_hash_index_t *__cdecl apr_hash_next(apr_hash_index_t *hi)
{
  id v1 = (void *)*((void *)hi + 2);
  *((void *)hi + 1) = v1;
  if (v1)
  {
LABEL_5:
    *((void *)hi + 2) = *v1;
  }

  else
  {
    uint64_t v2 = *(void *)hi;
    unsigned int v3 = *(_DWORD *)(*(void *)hi + 52LL);
    unsigned int v4 = *((_DWORD *)hi + 6);
    while (v4 <= v3)
    {
      id v1 = *(void **)(*(void *)(v2 + 8) + 8LL * v4++);
      *((_DWORD *)hi + 6) = v4;
      *((void *)hi + 1) = v1;
      if (v1) {
        goto LABEL_5;
      }
    }

    return 0LL;
  }

  return hi;
}

apr_hash_index_t *__cdecl apr_hash_first(apr_pool_t *p, apr_hash_t *ht)
{
  if (p) {
    unsigned int v3 = (char *)apr_palloc(p, 0x20uLL);
  }
  else {
    unsigned int v3 = (char *)ht + 16;
  }
  *((void *)v3 + 1) = 0LL;
  *((void *)v3 + 2) = 0LL;
  *(void *)unsigned int v3 = ht;
  *((_DWORD *)v3 + 6) = 0;
  return apr_hash_next((apr_hash_index_t *)v3);
}

void apr_hash_this(apr_hash_index_t *hi, const void **key, apr_ssize_t *klen, void **val)
{
  if (key) {
    *key = *(const void **)(*((void *)hi + 1) + 16LL);
  }
  if (klen) {
    *klen = *(void *)(*((void *)hi + 1) + 24LL);
  }
  if (val) {
    *val = *(void **)(*((void *)hi + 1) + 32LL);
  }
}

const void *__cdecl apr_hash_this_key(apr_hash_index_t *hi)
{
  return *(const void **)(*((void *)hi + 1) + 16LL);
}

apr_ssize_t apr_hash_this_key_len(apr_hash_index_t *hi)
{
  return *(void *)(*((void *)hi + 1) + 24LL);
}

void *__cdecl apr_hash_this_val(apr_hash_index_t *hi)
{
  return *(void **)(*((void *)hi + 1) + 32LL);
}

unsigned int apr_hashfunc_default(const char *key, apr_ssize_t *klen)
{
  return hashfunc_default(key, klen, 0LL);
}

uint64_t hashfunc_default(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (*a2 == -1)
  {
    int v5 = *a1;
    if (*a1)
    {
      timeval v6 = a1;
      do
      {
        a3 = (33 * a3 + v5);
        int v7 = *++v6;
        int v5 = v7;
      }

      while (v7);
    }

    else
    {
      timeval v6 = a1;
    }

    *a2 = v6 - a1;
  }

  else
  {
    for (; v3; --v3)
    {
      int v4 = *a1++;
      a3 = (33 * a3 + v4);
    }
  }

  return a3;
}

apr_hash_t *__cdecl apr_hash_copy(apr_pool_t *pool, const apr_hash_t *h)
{
  uint64_t result = (apr_hash_t *)apr_palloc( pool,  40LL * *((unsigned int *)h + 12) + 8LL * (*((_DWORD *)h + 13) + 1) + 80);
  uint64_t v5 = 0LL;
  timeval v6 = 0LL;
  *((_DWORD *)result + 12) = *((_DWORD *)h + 12);
  uint64_t v7 = *(void *)((char *)h + 52);
  *(void *)((char *)result + 52) = v7;
  *((void *)result + 8) = *((void *)h + 8);
  *((void *)result + 9) = 0LL;
  *(void *)uint64_t result = pool;
  *((void *)result + 1) = (char *)result + 80;
  id v8 = (char *)result + 8 * (*((_DWORD *)h + 13) + 1) + 80;
  else {
    uint64_t v9 = 1LL;
  }
  do
  {
    BOOL v10 = (char **)(*((void *)result + 1) + 8 * v5);
    apr_size_t v11 = *(uint64_t **)(*((void *)h + 1) + 8 * v5);
    if (v11)
    {
      do
      {
        int v12 = (char **)((_DWORD)v6 + 1);
        int v13 = &v8[40 * v6];
        *BOOL v10 = v13;
        *((_DWORD *)v13 + 2) = *((_DWORD *)v11 + 2);
        BOOL v14 = (char *)v11[3];
        *((void *)v13 + 2) = v11[2];
        timeval v6 = (char **)*v10;
        unsigned int v15 = (char *)v11[4];
        v6[3] = v14;
        v6[4] = v15;
        BOOL v10 = (char **)*v10;
        apr_size_t v11 = (uint64_t *)*v11;
        LODWORD(v6) = (_DWORD)v12;
      }

      while (v11);
    }

    else
    {
      int v12 = v6;
    }

    *BOOL v10 = 0LL;
    ++v5;
    timeval v6 = v12;
  }

  while (v5 != v9);
  return result;
}

void *__cdecl apr_hash_get(apr_hash_t *ht, const void *key, apr_ssize_t klen)
{
  entry = find_entry((uint64_t)ht, key, klen, 0LL);
  if (*entry) {
    return *(void **)(*entry + 32LL);
  }
  else {
    return 0LL;
  }
}

void *find_entry(uint64_t a1, _BYTE *a2, size_t a3, uint64_t a4)
{
  size_t __n = a3;
  uint64_t v7 = *(uint64_t (**)(_BYTE *, size_t *))(a1 + 64);
  if (v7) {
    unsigned int v8 = v7(a2, &__n);
  }
  else {
    unsigned int v8 = hashfunc_default(a2, (uint64_t *)&__n, *(unsigned int *)(a1 + 56));
  }
  unsigned int v9 = v8;
  BOOL v10 = (void *)(*(void *)(a1 + 8) + 8LL * (*(_DWORD *)(a1 + 52) & v8));
  uint64_t v11 = *v10;
  if (*v10)
  {
    size_t v12 = __n;
    while (1)
    {
      int v13 = v10;
      BOOL v10 = (void *)v11;
      uint64_t v11 = *v10;
      if (!*v10) {
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    if (a4)
    {
      BOOL v14 = *(_DWORD **)(a1 + 72);
      if (v14) {
        *(void *)(a1 + 72) = *(void *)v14;
      }
      else {
        BOOL v14 = apr_palloc(*(apr_pool_t **)a1, 0x28uLL);
      }
      *(void *)BOOL v14 = 0LL;
      _DWORD v14[2] = v9;
      size_t v15 = __n;
      *((void *)v14 + 2) = a2;
      *((void *)v14 + 3) = v15;
      *((void *)v14 + 4) = a4;
      *BOOL v10 = v14;
      ++*(_DWORD *)(a1 + 48);
    }

    return v10;
  }

  return v13;
}

void apr_hash_set(apr_hash_t *ht, const void *key, apr_ssize_t klen, const void *val)
{
  entry = find_entry((uint64_t)ht, key, klen, (uint64_t)val);
  uint64_t v7 = (void *)*entry;
  if (*entry)
  {
    if (val)
    {
      void v7[4] = val;
      unsigned int v8 = *((_DWORD *)ht + 13);
      if (*((_DWORD *)ht + 12) > v8)
      {
        int v9 = (2 * v8) | 1;
        apr_size_t v10 = 8LL * (2 * v8 + 2);
        uint64_t v11 = apr_palloc(*(apr_pool_t **)ht, v10);
        size_t v12 = v11;
        if (v11) {
          bzero(v11, v10);
        }
        int v13 = (apr_hash_t *)((char *)ht + 16);
        *((void *)ht + 3) = 0LL;
        *((void *)ht + 4) = 0LL;
        *((void *)ht + 2) = ht;
        *((_DWORD *)ht + 10) = 0;
        while (1)
        {
          int v13 = apr_hash_next(v13);
          if (!v13) {
            break;
          }
          uint64_t v14 = *((void *)v13 + 1);
          unsigned int v15 = *(_DWORD *)(v14 + 8) & v9;
          *(void *)uint64_t v14 = v12[v15];
          v12[v15] = v14;
        }

        *((void *)ht + 1) = v12;
        *((_DWORD *)ht + 13) = v9;
      }
    }

    else
    {
      void *entry = *v7;
      *uint64_t v7 = *((void *)ht + 9);
      *((void *)ht + 9) = v7;
      --*((_DWORD *)ht + 12);
    }
  }

unsigned int apr_hash_count(apr_hash_t *ht)
{
  return *((_DWORD *)ht + 12);
}

void apr_hash_clear(apr_hash_t *ht)
{
  *((void *)ht + 4) = 0LL;
  *((void *)ht + 2) = ht;
  *((void *)ht + 3) = 0LL;
  *((_DWORD *)ht + 10) = 0;
  uint64_t v2 = apr_hash_next((apr_hash_t *)((char *)ht + 16));
  if (v2)
  {
    uint64_t v3 = v2;
    do
    {
      apr_hash_set(ht, *(const void **)(*((void *)v3 + 1) + 16LL), *(void *)(*((void *)v3 + 1) + 24LL), 0LL);
      uint64_t v3 = apr_hash_next(v3);
    }

    while (v3);
  }

apr_hash_t *__cdecl apr_hash_overlay(apr_pool_t *p, const apr_hash_t *overlay, const apr_hash_t *base)
{
  return apr_hash_merge(p, overlay, base, 0LL, 0LL);
}

apr_hash_t *__cdecl apr_hash_merge( apr_pool_t *p, const apr_hash_t *h1, const apr_hash_t *h2, void *(__cdecl *merger)(apr_pool_t *, const void *, apr_ssize_t, const void *, const void *, const void *), const void *data)
{
  unsigned int v8 = apr_palloc(p, 0x50uLL);
  int v9 = v8;
  *unsigned int v8 = p;
  v8[8] = *((void *)h2 + 8);
  v8[9] = 0LL;
  unsigned int v10 = *((_DWORD *)h2 + 13);
  *((_DWORD *)v8 + 12) = *((_DWORD *)h2 + 12);
  int v12 = *((_DWORD *)h1 + 12);
  unsigned int v11 = *((_DWORD *)h1 + 13);
  if (v11 <= v10) {
    unsigned int v11 = v10;
  }
  *((_DWORD *)v8 + 13) = v11;
  if (v12 + *((_DWORD *)h2 + 12) > v11)
  {
    unsigned int v11 = (2 * v11) | 1;
    *((_DWORD *)v8 + 13) = v11;
  }

  *((_DWORD *)v8 + 14) = *((_DWORD *)h2 + 14);
  apr_size_t v13 = 8LL * (v11 + 1);
  uint64_t v14 = apr_palloc(p, v13);
  unsigned int v15 = v14;
  if (v14) {
    bzero(v14, v13);
  }
  v9[1] = v15;
  unsigned int v16 = *((_DWORD *)h1 + 12) + *((_DWORD *)h2 + 12);
  if (v16) {
    uint64_t v17 = (char *)apr_palloc(p, 40LL * v16);
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = 0LL;
  int v19 = 0;
  int v20 = *((_DWORD *)h2 + 13);
  else {
    uint64_t v21 = 1LL;
  }
  do
  {
    uint64_t v22 = *(uint64_t **)(*((void *)h2 + 1) + 8 * v18);
    if (v22)
    {
      int v23 = *((_DWORD *)v9 + 13);
      do
      {
        unsigned int v24 = *((_DWORD *)v22 + 2);
        apr_size_t v25 = &v17[40 * v19];
        *((_OWORD *)v25 + 1) = *((_OWORD *)v22 + 1);
        *((void *)v25 + 4) = v22[4];
        uint64_t v26 = v9[1];
        uint64_t v27 = *(void *)(v26 + 8LL * (v23 & v24));
        *((_DWORD *)v25 + 2) = v24;
        *(void *)apr_size_t v25 = v27;
        *(void *)(v26 + 8LL * (v23 & v24)) = v25;
        ++v19;
        uint64_t v22 = (uint64_t *)*v22;
      }

      while (v22);
    }

    ++v18;
  }

  while (v18 != v21);
  int v44 = p;
  unsigned int v28 = 0;
  int v42 = h1;
  do
  {
    unsigned int v43 = v28;
    for (uint64_t i = *(void **)(*((void *)h1 + 1) + 8LL * v28); i; uint64_t i = (void *)*i)
    {
      int v30 = (uint64_t (*)(_BYTE *, void *))v9[8];
      BOOL v31 = (_BYTE *)i[2];
      if (v30) {
        unsigned int v32 = v30(v31, i + 3);
      }
      else {
        unsigned int v32 = hashfunc_default(v31, i + 3, *((unsigned int *)v9 + 14));
      }
      unsigned int v33 = v32;
      uint64_t v34 = *((_DWORD *)v9 + 13) & v32;
      uint64_t v35 = v9[1];
      int v36 = *(uint64_t ***)(v35 + 8LL * v34);
      size_t v37 = i[3];
      if (v36)
      {
        while (1)
        {
          if (v36[3] == (uint64_t *)v37)
          {
            int64_t v38 = (const void *)i[2];
            if (!memcmp(v36[2], v38, v37)) {
              break;
            }
          }

          int v36 = (uint64_t **)*v36;
          if (!v36) {
            goto LABEL_26;
          }
        }

        size_t v40 = (uint64_t *)i[4];
        if (merger) {
          v36[4] = (uint64_t *)((uint64_t (*)(apr_pool_t *, const void *, size_t, uint64_t *, uint64_t *, const void *))merger)( v44,  v38,  v37,  v40,  v36[4],  data);
        }
        else {
          v36[4] = v40;
        }
      }

      else
      {
LABEL_26:
        int v39 = &v17[40 * v19];
        *((void *)v39 + 2) = i[2];
        *((void *)v39 + 3) = v37;
        *((void *)v39 + 4) = i[4];
        *((_DWORD *)v39 + 2) = v33;
        *(void *)int v39 = *(void *)(v35 + 8 * v34);
        *(void *)(v35 + 8 * v34) = v39;
        ++*((_DWORD *)v9 + 12);
        ++v19;
      }
    }

    unsigned int v28 = v43 + 1;
    h1 = v42;
  }

  while (v43 + 1 <= *((_DWORD *)v42 + 13));
  return (apr_hash_t *)v9;
}

int apr_hash_do(apr_hash_do_callback_fn_t *comp, void *rec, const apr_hash_t *ht)
{
  unsigned int v5 = 0;
  v11[0] = ht;
  unsigned int v6 = *((_DWORD *)ht + 13);
  uint64_t v7 = *((void *)ht + 1);
  while (1)
  {
    unsigned int v8 = *(void **)(v7 + 8LL * v5++);
    v11[1] = v8;
    if (v8) {
      break;
    }
    if (v5 > v6) {
      return 1;
    }
  }

  unsigned int v12 = v5;
  v11[2] = *v8;
  int v9 = (apr_hash_index_t *)v11;
  while (1)
  {
    int result = ((uint64_t (*)(void *, void, void, void))comp)( rec,  *(void *)(*((void *)v9 + 1) + 16LL),  *(void *)(*((void *)v9 + 1) + 24LL),  *(void *)(*((void *)v9 + 1) + 32LL));
    if (!result) {
      break;
    }
    int v9 = apr_hash_next(v9);
    if (!v9) {
      return 1;
    }
  }

  return result;
}

apr_pool_t *__cdecl apr_hash_pool_get(const apr_hash_t *thehash)
{
  return *(apr_pool_t **)thehash;
}

uint64_t GTCoreAllocatorInit(uint64_t result)
{
  hideMemory = result & 1;
  return result;
}

uint64_t GTCoreAllocatorIsHiddingMemory()
{
  return hideMemory;
}

vm_address_t GTCoreAlloc(uint64_t a1, memory_object_size_t a2)
{
  kern_return_t v12;
  FILE *v14;
  void block[4];
  kern_return_t v16;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v21;
  __int16 v22;
  char *v23;
  address = 0LL;
  size = a2;
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0LL, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    mach_error_t v4 = memory_entry_64;
    if (!s_logUsingOsLog)
    {
      unsigned int v11 = __stderrp;
      mach_error_string(memory_entry_64);
      fprintf(v11, "warning: failed to create memory entry error 0x%x (%s)\n");
      return 0LL;
    }

    unsigned int v5 = (os_log_s *)gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = mach_error_string(v4);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v4;
      uint64_t v22 = 2080;
      int v23 = v6;
      uint64_t v7 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_9:
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
      return 0LL;
    }

    return 0LL;
  }

  mach_error_t v8 = vm_map(mach_task_self_, &address, a2, 0LL, 1, object_handle, 0LL, 0, 3, 3, 1u);
  if (v8)
  {
    mach_error_t v9 = v8;
    if (!s_logUsingOsLog)
    {
      uint64_t v14 = __stderrp;
      mach_error_string(v8);
      fprintf(v14, "warning: failed to map memory error 0x%x (%s)\n");
      return 0LL;
    }

    unsigned int v5 = (os_log_s *)gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = mach_error_string(v9);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v9;
      uint64_t v22 = 2080;
      int v23 = v10;
      uint64_t v7 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_9;
    }

    return 0LL;
  }

  if (hideMemory)
  {
    unsigned int v12 = mach_memory_entry_ownership(object_handle, mach_task_self_, 4, 1);
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = __GTCoreAlloc_block_invoke;
      block[3] = &__block_descriptor_tmp_13928;
      unsigned int v16 = v12;
      if (GTCoreAlloc_onceToken != -1) {
        dispatch_once(&GTCoreAlloc_onceToken, block);
      }
    }
  }

  mach_port_deallocate(mach_task_self_, object_handle);
  return address;
}

void __GTCoreAlloc_block_invoke(uint64_t a1)
{
  if (s_logUsingOsLog)
  {
    uint64_t v2 = (os_log_s *)gt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      mach_error_t v3 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      mach_error_t v8 = v3;
      __int16 v9 = 2080;
      unsigned int v10 = mach_error_string(v3);
      _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)",  buf,  0x12u);
    }
  }

  else
  {
    mach_error_t v4 = __stderrp;
    mach_error_t v5 = *(_DWORD *)(a1 + 32);
    unsigned int v6 = mach_error_string(v5);
    fprintf(v4, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)\n", v5, v6);
  }

vm_address_t *GTCoreFree(vm_address_t *result, vm_size_t size)
{
  if (result)
  {
    uint64_t v2 = result;
    int result = (vm_address_t *)vm_deallocate(mach_task_self_, *result, size);
    *uint64_t v2 = 0LL;
  }

  return result;
}

apr_status_t apr_atomic_init(apr_pool_t *p)
{
  if (hash_mutex) {
    return 0;
  }
  uint64_t v2 = apr_palloc(p, 0x38uLL);
  hash_mutex = (uint64_t)v2;
  mach_error_t v3 = (void *)*((void *)p + 5);
  if (v3) {
    *((void *)p + 5) = *v3;
  }
  else {
    mach_error_t v3 = apr_palloc(p, 0x20uLL);
  }
  uint64_t v4 = 0LL;
  v3[2] = atomic_cleanup;
  v3[3] = apr_pool_cleanup_null;
  void *v3 = *((void *)p + 4);
  v3[1] = v2;
  *((void *)p + 4) = v3;
  while (1)
  {
    apr_status_t result = apr_thread_mutex_create((apr_thread_mutex_t **)(hash_mutex + v4), 0, p);
    if (result) {
      break;
    }
    v4 += 8LL;
    if (v4 == 56) {
      return 0;
    }
  }

  return result;
}

uint64_t atomic_cleanup(uint64_t a1)
{
  if (hash_mutex == a1) {
    hash_mutex = 0LL;
  }
  return 0LL;
}

apr_uint32_t apr_atomic_read32(apr_uint32_t *mem)
{
  return *mem;
}

void apr_atomic_set32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v4) || (*mem = val, pthread_mutex_unlock(v4))) {
    abort();
  }
}

apr_uint32_t apr_atomic_add32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem += val, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void apr_atomic_sub32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v4) || (*mem -= val, pthread_mutex_unlock(v4))) {
    abort();
  }
}

apr_uint32_t apr_atomic_inc32(apr_uint32_t *mem)
{
  return apr_atomic_add32(mem, 1u);
}

int apr_atomic_dec32(apr_uint32_t *mem)
{
  uint64_t v2 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v2) || (--*mem, apr_uint32_t v3 = *mem, pthread_mutex_unlock(v2))) {
    abort();
  }
  return v3;
}

apr_uint32_t apr_atomic_cas32(apr_uint32_t *mem, apr_uint32_t with, apr_uint32_t cmp)
{
  unsigned int v6 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v6)) {
    goto LABEL_6;
  }
  apr_uint32_t v7 = *mem;
  if (*mem == cmp) {
    *mem = with;
  }
  if (pthread_mutex_unlock(v6)) {
LABEL_6:
  }
    abort();
  return v7;
}

apr_uint32_t apr_atomic_xchg32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem = val, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void *__cdecl apr_atomic_casptr(void **mem, void *with, const void *cmp)
{
  unsigned int v6 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v6)) {
    goto LABEL_6;
  }
  apr_uint32_t v7 = *mem;
  if (*mem == cmp) {
    *mem = with;
  }
  if (pthread_mutex_unlock(v6)) {
LABEL_6:
  }
    abort();
  return v7;
}

void *__cdecl apr_atomic_xchgptr(void **mem, void *with)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem = with, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void apr_pool_attribute_cleanup_destroy(apr_pool_t **a1)
{
}

void apr_pool_destroy(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }

  *((void *)p + 14) = 0LL;
  while (1)
  {
    apr_uint32_t v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }

  while (1)
  {
    uint64_t v4 = *((void *)p + 4);
    if (!v4) {
      break;
    }
    *((void *)p + 4) = *(void *)v4;
    (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
  }

  free_proc_chain(*((void *)p + 7));
  if (*(void *)p)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)p + 48LL) + 24LL);
    if (v5) {
      pthread_mutex_lock((pthread_mutex_t *)(v5 + 8));
    }
    uint64_t v6 = *((void *)p + 2);
    **((void **)p + 3) = v6;
    if (v6) {
      *(void *)(*((void *)p + 2) + 24LL) = *((void *)p + 3);
    }
    if (v5) {
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 8));
    }
  }

  apr_uint32_t v7 = (unint64_t *)*((void *)p + 6);
  vm_address_t v8 = *((void *)p + 12);
  **(void **)(v8 + 8) = 0LL;
  if ((apr_pool_t *)v7[4] == p)
  {
    v7[3] = 0LL;
  }

  else
  {
    unint64_t v9 = v7[3];
    if (v9) {
      pthread_mutex_lock((pthread_mutex_t *)(v9 + 8));
    }
  }

  vm_address_t v10 = 0LL;
  unint64_t v11 = *v7;
  unint64_t v12 = v7[1];
  unint64_t v13 = v7[2];
  do
  {
    while (1)
    {
      while (1)
      {
        vm_address_t v14 = v8;
        vm_address_t v8 = *(void *)v8;
        unint64_t v15 = *(unsigned int *)(v14 + 16);
        if (!v12 || v13 > v15) {
          break;
        }
        *(void *)vm_address_t v14 = v10;
        vm_address_t v10 = v14;
        if (!v8) {
          goto LABEL_38;
        }
      }

      unsigned int v16 = (uint64_t *)&v7[v15];
      uint64_t v17 = v16[5];
      *(void *)vm_address_t v14 = v17;
      if (v11 < v15 && v17 == 0) {
        unint64_t v11 = v15;
      }
      v16[5] = v14;
      if (v13 <= v15)
      {
        unint64_t v13 = 0LL;
        if (!v8) {
          goto LABEL_38;
        }
      }

      else
      {
        v13 += ~v15;
        if (!v8) {
          goto LABEL_38;
        }
      }
    }

    *(void *)vm_address_t v14 = v7[5];
    v7[5] = v14;
    BOOL v19 = v13 > v15;
    v13 += ~v15;
    if (!v19) {
      unint64_t v13 = 0LL;
    }
  }

  while (v8);
LABEL_38:
  *apr_uint32_t v7 = v11;
  v7[2] = v13;
  unint64_t v20 = v7[3];
  if (v20) {
    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 8));
  }
  if (v10)
  {
    do
    {
      vm_address_t v21 = *(void *)v10;
      vm_deallocate(mach_task_self_, v10, ((*(_DWORD *)(v10 + 16) << 12) + 4096));
      vm_address_t v10 = v21;
    }

    while (v21);
  }

  if ((apr_pool_t *)v7[4] == p) {
    apr_allocator_destroy((apr_allocator_t *)v7);
  }
}

uint64_t free_proc_chain(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = result;
  do
  {
    apr_status_t result = apr_proc_wait(*(apr_proc_t **)v2, 0LL, 0LL, APR_NOWAIT);
    if ((_DWORD)result != 70006) {
      *(_DWORD *)(v2 + 8) = 0;
    }
    uint64_t v2 = *(void *)(v2 + 16);
  }

  while (v2);
  uint64_t v3 = v1;
  do
  {
    int v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 1)
    {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v3, 9);
    }

    else if (v4 == 4 || v4 == 2)
    {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v3, 15);
      if (!(_DWORD)result) {
        LODWORD(v2) = 1;
      }
    }

    uint64_t v3 = *(void *)(v3 + 16);
  }

  while (v3);
  uint64_t v6 = v1;
  if (!(_DWORD)v2) {
    goto LABEL_29;
  }
  unint64_t v7 = 46875LL;
  v11.tv_usec = 46875;
  v11.__darwin_time_t tv_sec = 0LL;
  apr_status_t result = select(0, 0LL, 0LL, 0LL, &v11);
  while (2)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = v1;
    do
    {
      uint64_t v10 = v8;
      if (*(_DWORD *)(v9 + 8) == 2)
      {
        uint64_t v8 = 1LL;
        apr_status_t result = apr_proc_wait(*(apr_proc_t **)v9, 0LL, 0LL, APR_NOWAIT);
        if ((_DWORD)result == 70006) {
          goto LABEL_24;
        }
        *(_DWORD *)(v9 + 8) = 0;
      }

      uint64_t v8 = v10;
LABEL_24:
      uint64_t v9 = *(void *)(v9 + 16);
    }

    while (v9);
    if ((_DWORD)v8 && v7 <= 0x2DC6BF)
    {
      v11.tv_usec = v7 % 0xF4240;
      v11.__darwin_time_t tv_sec = v7 / 0xF4240;
      apr_status_t result = select(0, 0LL, 0LL, 0LL, &v11);
      v7 *= 2LL;
      continue;
    }

    break;
  }

  uint64_t v6 = v1;
  do
  {
LABEL_29:
    if (*(_DWORD *)(v6 + 8) == 2) {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v6, 9);
    }
    uint64_t v6 = *(void *)(v6 + 16);
  }

  while (v6);
  do
  {
    if (*(_DWORD *)(v1 + 8)) {
      apr_status_t result = apr_proc_wait(*(apr_proc_t **)v1, 0LL, 0LL, APR_WAIT);
    }
    uint64_t v1 = *(void *)(v1 + 16);
  }

  while (v1);
  return result;
}

void apr_allocator_destroy(apr_allocator_t *allocator)
{
  for (uint64_t i = 0LL; i != 20; ++i)
  {
    uint64_t v3 = (char *)allocator + 8 * i;
    vm_address_t v6 = *((void *)v3 + 5);
    uint64_t v5 = (vm_address_t *)(v3 + 40);
    vm_address_t v4 = v6;
    if (v6)
    {
      do
      {
        vm_address_t *v5 = *(void *)v4;
        vm_deallocate(mach_task_self_, v4, ((*(_DWORD *)(v4 + 16) << 12) + 4096));
        vm_address_t v4 = *v5;
      }

      while (*v5);
    }
  }

  vm_deallocate(mach_task_self_, (vm_address_t)allocator, 0xC8uLL);
}

apr_status_t apr_allocator_create(apr_allocator_t **allocator)
{
  *allocator = 0LL;
  vm_address_t v2 = GTCoreAlloc((uint64_t)allocator, 0xC8uLL);
  if (!v2) {
    return 12;
  }
  vm_address_t v3 = v2;
  apr_status_t result = 0;
  *(void *)(v3 + 192) = 0LL;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)vm_address_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *allocator = (apr_allocator_t *)v3;
  return result;
}

void apr_allocator_mutex_set(apr_allocator_t *allocator, apr_thread_mutex_t *mutex)
{
  *((void *)allocator + 3) = mutex;
}

apr_thread_mutex_t *__cdecl apr_allocator_mutex_get(apr_allocator_t *allocator)
{
  return (apr_thread_mutex_t *)*((void *)allocator + 3);
}

void apr_allocator_owner_set(apr_allocator_t *allocator, apr_pool_t *pool)
{
  *((void *)allocator + 4) = pool;
}

apr_pool_t *__cdecl apr_allocator_owner_get(apr_allocator_t *allocator)
{
  return (apr_pool_t *)*((void *)allocator + 4);
}

void apr_allocator_max_free_set(apr_allocator_t *allocator, apr_size_t size)
{
  uint64_t v4 = *((void *)allocator + 3);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  }
  apr_size_t v5 = (size + 4095) >> 12;
  apr_size_t v6 = *((void *)allocator + 2) + v5 - *((void *)allocator + 1);
  *((void *)allocator + 1) = v5;
  *((void *)allocator + 2) = v6;
  if (v6 > v5) {
    *((void *)allocator + 2) = v5;
  }
  if (v4) {
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 8));
  }
}

unint64_t apr_allocator_align(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  unint64_t v3 = 0x2000LL;
  if (v2 > 0x2000) {
    unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  }
  if (v2 >= a2) {
    return v3;
  }
  else {
    return 0LL;
  }
}

vm_address_t allocator_alloc(uint64_t a1, unint64_t a2)
{
  vm_address_t v2 = 0LL;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  unint64_t v4 = 0x2000LL;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0LL;
  }
  if (v3 >= a2)
  {
    unint64_t v6 = v4 >> 12;
    unint64_t v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7)) {
      return 0LL;
    }
    uint64_t v8 = (unint64_t *)a1;
    unint64_t v9 = *(void *)a1;
    if (v7 <= *(void *)a1)
    {
      uint64_t v14 = *(void *)(a1 + 24);
      if (v14)
      {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        unint64_t v9 = *v8;
      }

      unint64_t v15 = &v8[v7];
      vm_address_t v17 = v15[5];
      unsigned int v16 = v15 + 5;
      vm_address_t v2 = v17;
      BOOL v18 = v17 == 0;
      BOOL v19 = v7 < v9;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v7 >= v9;
      }
      if (!v20)
      {
        do
        {
          vm_address_t v21 = v16[1];
          ++v16;
          vm_address_t v2 = v21;
          BOOL v18 = v21 == 0;
          BOOL v19 = v6 < v9;
          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v6 >= v9;
          }
          ++v6;
        }

        while (!v22);
      }

      if (!v18)
      {
        vm_address_t v25 = *(void *)v2;
        *unsigned int v16 = *(void *)v2;
        if (v25) {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          uint64_t v26 = v16 - 1;
          do
          {
            if (*v26--) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v9 == 1;
            }
            --v9;
          }

          while (!v28);
          *uint64_t v8 = v9;
        }

        uint64_t v13 = (*(_DWORD *)(v2 + 16) + 1);
LABEL_43:
        unint64_t v29 = v8[2] + v13;
        if (v29 >= v8[1]) {
          unint64_t v29 = v8[1];
        }
        v8[2] = v29;
        unint64_t v30 = v8[3];
        if (v30) {
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        }
        goto LABEL_47;
      }
    }

    else
    {
      vm_address_t v2 = a1 + 40;
      if (!*(void *)(a1 + 40))
      {
LABEL_30:
        vm_address_t v24 = GTCoreAlloc(a1, v5);
        vm_address_t v2 = v24;
        if (!v24) {
          return v2;
        }
        *(_DWORD *)(v24 + 16) = v7;
        *(void *)(v24 + 32) = v24 + v5;
LABEL_47:
        *(void *)vm_address_t v2 = 0LL;
        *(void *)(v2 + 24) = v2 + 40;
        return v2;
      }

      uint64_t v10 = *(void *)(a1 + 24);
      if (v10) {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      while (1)
      {
        timeval v11 = (void *)v2;
        vm_address_t v2 = *(void *)v2;
        if (!v2) {
          break;
        }
        unint64_t v12 = *(unsigned int *)(v2 + 16);
        if (v7 <= v12)
        {
          *timeval v11 = *(void *)v2;
          uint64_t v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }

    unint64_t v23 = v8[3];
    if (v23) {
      a1 = pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    }
    goto LABEL_30;
  }

  return v2;
}

void apr_allocator_free(apr_allocator_t *allocator, apr_memnode_t *memnode)
{
  uint64_t v4 = *((void *)allocator + 3);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  }
  vm_address_t v5 = 0LL;
  unint64_t v6 = *(void *)allocator;
  uint64_t v7 = *((void *)allocator + 1);
  unint64_t v8 = *((void *)allocator + 2);
  do
  {
    while (1)
    {
      while (1)
      {
        unint64_t v9 = memnode;
        memnode = memnode->next;
        unint64_t index = v9->index;
        if (!v7 || v8 > index) {
          break;
        }
        v9->next = (apr_memnode_t *)v5;
        vm_address_t v5 = (vm_address_t)v9;
        if (!memnode) {
          goto LABEL_22;
        }
      }

      timeval v11 = (char *)allocator + 8 * index;
      unint64_t v12 = (apr_memnode_t *)*((void *)v11 + 5);
      v9->next = v12;
      if (v6 < index && v12 == 0LL) {
        unint64_t v6 = index;
      }
      *((void *)v11 + 5) = v9;
      if (v8 <= index)
      {
        unint64_t v8 = 0LL;
        if (!memnode) {
          goto LABEL_22;
        }
      }

      else
      {
        v8 += ~index;
        if (!memnode) {
          goto LABEL_22;
        }
      }
    }

    v9->next = (apr_memnode_t *)*((void *)allocator + 5);
    *((void *)allocator + 5) = v9;
    BOOL v14 = v8 > index;
    v8 += ~index;
    if (!v14) {
      unint64_t v8 = 0LL;
    }
  }

  while (memnode);
LABEL_22:
  *(void *)allocator = v6;
  *((void *)allocator + 2) = v8;
  uint64_t v15 = *((void *)allocator + 3);
  if (v15) {
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  }
  if (v5)
  {
    do
    {
      vm_address_t v16 = *(void *)v5;
      vm_deallocate(mach_task_self_, v5, ((*(_DWORD *)(v5 + 16) << 12) + 4096));
      vm_address_t v5 = v16;
    }

    while (v16);
  }

apr_status_t apr_pool_initialize(void)
{
  if ((apr_pools_shared_initialized & 1) != 0) {
    return 0;
  }
  if (apr_pools_initialized++) {
    return 0;
  }
  global_allocator = 0LL;
  vm_address_t v4 = GTCoreAlloc(v0, 0xC8uLL);
  if (v4)
  {
    *(void *)(v4 + 192) = 0LL;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)vm_address_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    global_allocator = v4;
    apr_allocator_max_free_set((apr_allocator_t *)v4, 0x8000000uLL);
    apr_status_t v5 = apr_pool_create_ex((apr_pool_t **)&global_pool, 0LL, 0LL, (apr_allocator_t *)global_allocator);
    if (v5)
    {
      apr_status_t v2 = v5;
      apr_allocator_destroy((apr_allocator_t *)global_allocator);
      global_allocator = 0LL;
      apr_pools_initialized = 0;
    }

    else
    {
      unint64_t v6 = (apr_pool_t *)global_pool;
      *(void *)(global_pool + 80) = "apr_global_pool";
      apr_status_t v2 = apr_atomic_init(v6);
      if (!v2)
      {
        apr_status_t v2 = apr_thread_mutex_create(&mutex, 0, (apr_pool_t *)global_pool);
        if (!v2)
        {
          uint64_t v7 = global_allocator;
          uint64_t v8 = global_pool;
          *(void *)(global_allocator + 24) = mutex;
          *(void *)(v7 + 32) = v8;
        }
      }
    }
  }

  else
  {
    apr_pools_initialized = 0;
    return 12;
  }

  return v2;
}

apr_status_t apr_pool_create_ex( apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  vm_address_t v4 = allocator;
  apr_abortfunc_t v5 = abort_fn;
  apr_pool_t *newpool = 0LL;
  if (parent) {
    uint64_t v7 = parent;
  }
  else {
    uint64_t v7 = (apr_pool_t *)global_pool;
  }
  if (!abort_fn && v7) {
    apr_abortfunc_t v5 = (apr_abortfunc_t)*((void *)v7 + 8);
  }
  if (!allocator) {
    vm_address_t v4 = (apr_allocator_t *)*((void *)v7 + 6);
  }
  uint64_t v8 = (apr_pool_t *)allocator_alloc((uint64_t)v4, 0x1FD8uLL);
  if (v8)
  {
    *(void *)uint64_t v8 = v8;
    *((void *)v8 + 1) = v8;
    unint64_t v9 = (apr_pool_t **)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0LL;
    v9[6] = v4;
    v9[7] = 0LL;
    v9[4] = 0LL;
    v9[5] = 0LL;
    v9[10] = 0LL;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0LL;
    *unint64_t v9 = v7;
    v9[1] = 0LL;
    if (v7)
    {
      uint64_t v10 = *(void *)(*((void *)v7 + 6) + 24LL);
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      uint64_t v13 = (apr_pool_t *)*((void *)v7 + 1);
      unint64_t v12 = (apr_pool_t ***)((char *)v7 + 8);
      timeval v11 = v13;
      v9[2] = v13;
      if (v13) {
        *((void *)v11 + 3) = v9 + 2;
      }
      *unint64_t v12 = v9;
      void v9[3] = (apr_pool_t *)v12;
      if (v10) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
      }
    }

    else
    {
      v9[2] = 0LL;
      void v9[3] = 0LL;
    }

    apr_status_t v14 = 0;
    apr_pool_t *newpool = (apr_pool_t *)v9;
  }

  else
  {
    apr_status_t v14 = 12;
    if (v5) {
      ((void (*)(uint64_t))v5)(12LL);
    }
  }

  return v14;
}

void apr_pool_tag(apr_pool_t *pool, const char *tag)
{
  *((void *)pool + 10) = tag;
}

uint64_t apr_pool_shared_initialize(uint64_t a1)
{
  apr_pools_initialized = 1;
  apr_pools_shared_initialized = 1;
  global_pool = a1;
  global_allocator = *(void *)(a1 + 48);
  return 0LL;
}

void apr_pool_terminate(void)
{
  if ((apr_pools_shared_initialized & 1) == 0 && apr_pools_initialized && !--apr_pools_initialized)
  {
    apr_pool_destroy((apr_pool_t *)global_pool);
    global_pool = 0LL;
    global_allocator = 0LL;
  }

void *__cdecl apr_palloc(apr_pool_t *p, apr_size_t size)
{
  apr_size_t v3 = (size + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (v3 < size)
  {
LABEL_2:
    vm_address_t v4 = (void (*)(uint64_t))*((void *)p + 8);
    if (v4) {
      v4(12LL);
    }
    return 0LL;
  }

  unint64_t v6 = (vm_address_t *)*((void *)p + 11);
  apr_status_t result = (void *)v6[3];
  if (v3 <= v6[4] - (unint64_t)result)
  {
    v6[3] = (vm_address_t)result + v3;
    return result;
  }

  vm_address_t v7 = *v6;
  if (v3 <= *(void *)(*v6 + 32) - *(void *)(*v6 + 24))
  {
    **(void **)(v7 + 8) = *(void *)v7;
    *(void *)(*(void *)v7 + 8LL) = *(void *)(v7 + 8);
  }

  else
  {
    vm_address_t v7 = allocator_alloc(*((void *)p + 6), (size + 7) & 0xFFFFFFFFFFFFFFF8LL);
    if (!v7) {
      goto LABEL_2;
    }
  }

  *(_DWORD *)(v7 + 20) = 0;
  apr_status_t result = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = (char *)result + v3;
  uint64_t v8 = (vm_address_t *)v6[1];
  *(void *)(v7 + 8) = v8;
  *uint64_t v8 = v7;
  *(void *)vm_address_t v7 = v6;
  v6[1] = v7;
  *((void *)p + 11) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    vm_address_t v10 = *v6;
    do
      vm_address_t v10 = *(void *)v10;
    while (*(_DWORD *)(v10 + 20) > v9);
    *(void *)vm_address_t v7 = *v6;
    *(void *)(*v6 + 8) = v6[1];
    timeval v11 = *(vm_address_t ***)(v10 + 8);
    v6[1] = (vm_address_t)v11;
    *timeval v11 = v6;
    *unint64_t v6 = v10;
    *(void *)(v10 + 8) = v6;
  }

  return result;
}

void *apr_pcalloc(apr_pool_t *a1, apr_size_t a2)
{
  apr_size_t v3 = apr_palloc(a1, a2);
  vm_address_t v4 = v3;
  if (v3) {
    bzero(v3, a2);
  }
  return v4;
}

void apr_pool_clear(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }

  *((void *)p + 14) = 0LL;
  while (1)
  {
    apr_size_t v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }

  apr_abortfunc_t v5 = (uint64_t *)((char *)p + 32);
  uint64_t v4 = *((void *)p + 4);
  if (v4)
  {
    do
    {
      uint64_t *v5 = *(void *)v4;
      (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
      uint64_t v4 = *v5;
    }

    while (*v5);
  }

  uint64_t *v5 = 0LL;
  *((void *)p + 5) = 0LL;
  free_proc_chain(*((void *)p + 7));
  *((void *)p + 7) = 0LL;
  *((void *)p + 9) = 0LL;
  uint64_t v7 = *((void *)p + 12);
  uint64_t v6 = *((void *)p + 13);
  *((void *)p + 11) = v7;
  *(void *)(v7 + 24) = v6;
  if (*(void *)v7 != v7)
  {
    **(void **)(v7 + 8) = 0LL;
    uint64_t v8 = (unint64_t *)*((void *)p + 6);
    unint64_t v9 = *(vm_address_t **)v7;
    unint64_t v10 = v8[3];
    if (v10) {
      pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
    }
    vm_address_t v11 = 0LL;
    unint64_t v12 = *v8;
    unint64_t v13 = v8[1];
    unint64_t v14 = v8[2];
    do
    {
      while (1)
      {
        while (1)
        {
          uint64_t v15 = v9;
          unint64_t v9 = (vm_address_t *)*v9;
          unint64_t v16 = *((unsigned int *)v15 + 4);
          if (!v13 || v14 > v16) {
            break;
          }
          *uint64_t v15 = v11;
          vm_address_t v11 = (vm_address_t)v15;
          if (!v9) {
            goto LABEL_30;
          }
        }

        vm_address_t v17 = &v8[v16];
        vm_address_t v18 = v17[5];
        *uint64_t v15 = v18;
        if (v12 < v16 && v18 == 0) {
          unint64_t v12 = v16;
        }
        v17[5] = (unint64_t)v15;
        if (v14 <= v16)
        {
          unint64_t v14 = 0LL;
          if (!v9) {
            goto LABEL_30;
          }
        }

        else
        {
          v14 += ~v16;
          if (!v9) {
            goto LABEL_30;
          }
        }
      }

      *uint64_t v15 = v8[5];
      v8[5] = (unint64_t)v15;
      BOOL v20 = v14 > v16;
      v14 += ~v16;
      if (!v20) {
        unint64_t v14 = 0LL;
      }
    }

    while (v9);
LABEL_30:
    *uint64_t v8 = v12;
    v8[2] = v14;
    unint64_t v21 = v8[3];
    if (v21) {
      pthread_mutex_unlock((pthread_mutex_t *)(v21 + 8));
    }
    if (v11)
    {
      do
      {
        vm_address_t v22 = *(void *)v11;
        vm_deallocate(mach_task_self_, v11, ((*(_DWORD *)(v11 + 16) << 12) + 4096));
        vm_address_t v11 = v22;
      }

      while (v22);
    }

    *(void *)uint64_t v7 = v7;
    *(void *)(v7 + 8) = v7;
  }

apr_status_t apr_pool_create_unmanaged_ex( apr_pool_t **newpool, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  apr_pool_t *newpool = 0LL;
  if (!apr_pools_initialized) {
    return 20002;
  }
  uint64_t v6 = allocator;
  if (!allocator)
  {
    vm_address_t v7 = GTCoreAlloc((uint64_t)newpool, 0xC8uLL);
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v6 = (apr_allocator_t *)v7;
    *(void *)(v7 + 192) = 0LL;
    *(_OWORD *)(v7 + 160) = 0u;
    *(_OWORD *)(v7 + 176) = 0u;
    *(_OWORD *)(v7 + 128) = 0u;
    *(_OWORD *)(v7 + 144) = 0u;
    *(_OWORD *)(v7 + 96) = 0u;
    *(_OWORD *)(v7 + 112) = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
    *(_OWORD *)(v7 + 80) = 0u;
    *(_OWORD *)(v7 + 32) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)vm_address_t v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
  }

  uint64_t v8 = (void *)allocator_alloc((uint64_t)v6, 0x1FD8uLL);
  if (v8)
  {
    *uint64_t v8 = v8;
    v8[1] = v8;
    uint64_t v9 = v8[3];
    v8[3] = v9 + 120;
    *(void *)(v9 + 96) = v8;
    *(void *)(v9 + 104) = v9 + 120;
    *(void *)(v9 + 112) = 0LL;
    *(void *)(v9 + 48) = v6;
    *(void *)(v9 + 56) = 0LL;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(void *)(v9 + 80) = 0LL;
    *(void *)(v9 + 88) = v8;
    *(void *)(v9 + 64) = abort_fn;
    *(void *)(v9 + 72) = 0LL;
    if (!allocator) {
      *((void *)v6 + 4) = v9;
    }
    apr_status_t v10 = 0;
    apr_pool_t *newpool = (apr_pool_t *)v9;
    return v10;
  }

char *__cdecl apr_pvsprintf(apr_pool_t *p, const char *fmt, va_list ap)
{
  vm_address_t v47 = *((void *)p + 11);
  int v48 = p;
  uint64_t v6 = *(char **)(v47 + 32);
  v46.curpos = *(char **)(v47 + 24);
  v46.endpos = v6 - 1;
  char v49 = 0;
  vm_address_t address = 0LL;
  if (v46.curpos == v6 && psprintf_flush((uint64_t)&v46) == -1
    || apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))psprintf_flush, &v46, fmt, ap) == -1)
  {
    unint64_t v30 = (void (*)(uint64_t))*((void *)p + 8);
    if (v30) {
      v30(12LL);
    }
    if (v49)
    {
      BOOL v31 = (vm_address_t *)v47;
      *(void *)vm_address_t v47 = address;
      unsigned int v32 = (unint64_t *)*((void *)p + 6);
      unint64_t v33 = v32[3];
      if (v33) {
        pthread_mutex_lock((pthread_mutex_t *)(v33 + 8));
      }
      vm_address_t v34 = 0LL;
      unint64_t v35 = *v32;
      unint64_t v36 = v32[1];
      unint64_t v37 = v32[2];
      do
      {
        while (1)
        {
          while (1)
          {
            int64_t v38 = v31;
            BOOL v31 = (vm_address_t *)*v31;
            unint64_t v39 = *((unsigned int *)v38 + 4);
            if (!v36 || v37 > v39) {
              break;
            }
            vm_address_t *v38 = v34;
            vm_address_t v34 = (vm_address_t)v38;
            if (!v31) {
              goto LABEL_59;
            }
          }

          size_t v40 = &v32[v39];
          vm_address_t v41 = v40[5];
          vm_address_t *v38 = v41;
          if (v35 < v39 && v41 == 0) {
            unint64_t v35 = v39;
          }
          v40[5] = (unint64_t)v38;
          if (v37 <= v39)
          {
            unint64_t v37 = 0LL;
            if (!v31) {
              goto LABEL_59;
            }
          }

          else
          {
            v37 += ~v39;
            if (!v31) {
              goto LABEL_59;
            }
          }
        }

        vm_address_t *v38 = v32[5];
        v32[5] = (unint64_t)v38;
        BOOL v21 = v37 > v39;
        v37 += ~v39;
        if (!v21) {
          unint64_t v37 = 0LL;
        }
      }

      while (v31);
LABEL_59:
      unint64_t *v32 = v35;
      v32[2] = v37;
      unint64_t v43 = v32[3];
      if (v43) {
        pthread_mutex_unlock((pthread_mutex_t *)(v43 + 8));
      }
      if (v34)
      {
        do
        {
          vm_address_t v44 = *(void *)v34;
          vm_deallocate(mach_task_self_, v34, ((*(_DWORD *)(v34 + 16) << 12) + 4096));
          vm_address_t v34 = v44;
        }

        while (v44);
      }
    }

    return 0LL;
  }

  else
  {
    vm_address_t v7 = v46.curpos++;
    *vm_address_t v7 = 0;
    uint64_t v8 = *(char **)(v47 + 24);
    *(void *)(v47 + 24) = &v8[(v46.curpos - v8 + 7) & 0xFFFFFFFFFFFFFFF8LL];
    uint64_t v9 = (vm_address_t *)address;
    if (address)
    {
      apr_status_t v10 = (unint64_t *)*((void *)p + 6);
      unint64_t v11 = v10[3];
      if (v11) {
        pthread_mutex_lock((pthread_mutex_t *)(v11 + 8));
      }
      vm_address_t v12 = 0LL;
      unint64_t v13 = *v10;
      unint64_t v14 = v10[1];
      unint64_t v15 = v10[2];
      do
      {
        while (1)
        {
          while (1)
          {
            unint64_t v16 = v9;
            uint64_t v9 = (vm_address_t *)*v9;
            unint64_t v17 = *((unsigned int *)v16 + 4);
            if (!v14 || v15 > v17) {
              break;
            }
            *unint64_t v16 = v12;
            vm_address_t v12 = (vm_address_t)v16;
            if (!v9) {
              goto LABEL_26;
            }
          }

          vm_address_t v18 = &v10[v17];
          vm_address_t v19 = v18[5];
          *unint64_t v16 = v19;
          if (v13 < v17 && v19 == 0) {
            unint64_t v13 = v17;
          }
          v18[5] = (unint64_t)v16;
          if (v15 <= v17)
          {
            unint64_t v15 = 0LL;
            if (!v9) {
              goto LABEL_26;
            }
          }

          else
          {
            v15 += ~v17;
            if (!v9) {
              goto LABEL_26;
            }
          }
        }

        *unint64_t v16 = v10[5];
        v10[5] = (unint64_t)v16;
        BOOL v21 = v15 > v17;
        v15 += ~v17;
        if (!v21) {
          unint64_t v15 = 0LL;
        }
      }

      while (v9);
LABEL_26:
      *apr_status_t v10 = v13;
      v10[2] = v15;
      unint64_t v22 = v10[3];
      if (v22) {
        pthread_mutex_unlock((pthread_mutex_t *)(v22 + 8));
      }
      if (v12)
      {
        do
        {
          vm_address_t v23 = *(void *)v12;
          vm_deallocate(mach_task_self_, v12, ((*(_DWORD *)(v12 + 16) << 12) + 4096));
          vm_address_t v12 = v23;
        }

        while (v23);
      }
    }

    if (v49)
    {
      vm_address_t v24 = (uint64_t *)*((void *)p + 11);
      vm_address_t v25 = (void *)v47;
      *(_DWORD *)(v47 + 20) = 0;
      uint64_t v26 = (void *)v24[1];
      v25[1] = v26;
      *uint64_t v26 = v25;
      *vm_address_t v25 = v24;
      v24[1] = (uint64_t)v25;
      *((void *)p + 11) = v25;
      unint64_t v27 = (v24[4] - v24[3]) >> 12;
      *((_DWORD *)v24 + 5) = v27;
      if (v27 < *(unsigned int *)(*v24 + 20))
      {
        BOOL v28 = (uint64_t *)*v24;
        do
          BOOL v28 = (uint64_t *)*v28;
        while (*((_DWORD *)v28 + 5) > v27);
        *vm_address_t v25 = *v24;
        *(void *)(*v24 + 8) = v24[1];
        unint64_t v29 = (void *)v28[1];
        v24[1] = (uint64_t)v29;
        *unint64_t v29 = v24;
        uint64_t *v24 = (uint64_t)v28;
        v28[1] = (uint64_t)v24;
      }
    }
  }

  return v8;
}

uint64_t psprintf_flush(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  size_t v4 = *(void *)a1 - *(void *)(v3 + 24);
  if (2 * v4 <= 0x20) {
    unint64_t v5 = 32LL;
  }
  else {
    unint64_t v5 = 2 * v4;
  }
  if (!*(_BYTE *)(a1 + 32))
  {
    vm_address_t v6 = *(void *)v3;
    if (v5 <= *(void *)(*(void *)v3 + 32LL) - *(void *)(*(void *)v3 + 24LL))
    {
      **(void **)(v6 + 8) = *(void *)v6;
      *(void *)(*(void *)v6 + 8LL) = *(void *)(v6 + 8);
      apr_status_t v10 = *(vm_address_t **)(v3 + 8);
      *(void *)(v6 + 8) = v10;
      *apr_status_t v10 = v6;
      *(void *)vm_address_t v6 = v3;
      *(void *)(v3 + 8) = v6;
      *(_DWORD *)(v6 + 20) = 0;
      *(void *)(v2 + 88) = v6;
      unint64_t v11 = (uint64_t)(*(void *)(v3 + 32) - *(void *)(v3 + 24)) >> 12;
      *(_DWORD *)(v3 + 20) = v11;
      if (v11 < *(unsigned int *)(*(void *)v3 + 20LL))
      {
        vm_address_t v12 = *(void *)v3;
        do
          vm_address_t v12 = *(void *)v12;
        while (*(_DWORD *)(v12 + 20) > v11);
        *(void *)vm_address_t v6 = *(void *)v3;
        *(void *)(*(void *)v3 + 8LL) = *(void *)(v3 + 8);
        unint64_t v13 = *(void **)(v12 + 8);
        *(void *)(v3 + 8) = v13;
        *unint64_t v13 = v3;
        *(void *)uint64_t v3 = v12;
        *(void *)(v12 + 8) = v3;
        vm_address_t v6 = *(void *)(v2 + 88);
      }

      goto LABEL_10;
    }
  }

  vm_address_t v7 = allocator_alloc(*(void *)(v2 + 48), v5);
  if (v7)
  {
    vm_address_t v6 = v7;
    if (*(_BYTE *)(a1 + 32))
    {
      *(void *)uint64_t v3 = *(void *)(a1 + 40);
      *(void *)(a1 + 40) = v3;
    }

    *(_BYTE *)(a1 + 32) = 1;
LABEL_10:
    memcpy(*(void **)(v6 + 24), *(const void **)(v3 + 24), v4);
    uint64_t result = 0LL;
    *(void *)(a1 + 16) = v6;
    uint64_t v9 = *(void *)(v6 + 32) - 1LL;
    *(void *)a1 = *(void *)(v6 + 24) + v4;
    *(void *)(a1 + 8) = v9;
    return result;
  }

  return 0xFFFFFFFFLL;
}

char *apr_psprintf(apr_pool_t *p, const char *fmt, ...)
{
  return apr_pvsprintf(p, fmt, va);
}

void apr_pool_abort_set(apr_abortfunc_t abortfunc, apr_pool_t *pool)
{
  *((void *)pool + 8) = abortfunc;
}

apr_abortfunc_t apr_pool_abort_get(apr_pool_t *pool)
{
  return (apr_abortfunc_t)*((void *)pool + 8);
}

apr_pool_t *__cdecl apr_pool_parent_get(apr_pool_t *pool)
{
  return *(apr_pool_t **)pool;
}

apr_allocator_t *__cdecl apr_pool_allocator_get(apr_pool_t *pool)
{
  return (apr_allocator_t *)*((void *)pool + 6);
}

int apr_pool_is_ancestor(apr_pool_t *a, apr_pool_t *b)
{
  if (a)
  {
    if (!b) {
      return 0;
    }
    while (b != a)
    {
      b = *(apr_pool_t **)b;
      if (!b) {
        return 0;
      }
    }
  }

  return 1;
}

apr_status_t apr_pool_userdata_set( const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  uint64_t v8 = (apr_hash_t *)*((void *)pool + 9);
  if (!v8)
  {
    uint64_t v8 = apr_hash_make(pool);
    *((void *)pool + 9) = v8;
  }

  uint64_t v9 = *find_entry((uint64_t)v8, key, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  if (v9 && *(void *)(v9 + 32))
  {
    apr_status_t v10 = (apr_hash_t *)*((void *)pool + 9);
    unint64_t v11 = key;
  }

  else
  {
    apr_size_t v12 = strlen(key) + 1;
    unint64_t v13 = apr_palloc(pool, v12);
    memcpy(v13, key, v12);
    apr_status_t v10 = (apr_hash_t *)*((void *)pool + 9);
    unint64_t v11 = (const char *)v13;
  }

  apr_hash_set(v10, v11, -1LL, data);
  if (cleanup)
  {
    unint64_t v14 = (void *)*((void *)pool + 5);
    if (v14) {
      *((void *)pool + 5) = *v14;
    }
    else {
      unint64_t v14 = apr_palloc(pool, 0x20uLL);
    }
    _DWORD v14[2] = cleanup;
    _OWORD v14[3] = cleanup;
    *unint64_t v14 = *((void *)pool + 4);
    v14[1] = data;
    *((void *)pool + 4) = v14;
  }

  return 0;
}

void apr_pool_cleanup_register( apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v8 = (void *)*((void *)p + 5);
    if (v8) {
      *((void *)p + 5) = *v8;
    }
    else {
      uint64_t v8 = apr_palloc(p, 0x20uLL);
    }
    v8[2] = plain_cleanup;
    v8[3] = child_cleanup;
    *uint64_t v8 = *((void *)p + 4);
    v8[1] = data;
    *((void *)p + 4) = v8;
  }

apr_status_t apr_pool_userdata_setn( const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  uint64_t v8 = (apr_hash_t *)*((void *)pool + 9);
  if (!v8)
  {
    uint64_t v8 = apr_hash_make(pool);
    *((void *)pool + 9) = v8;
  }

  apr_hash_set(v8, key, -1LL, data);
  if (cleanup)
  {
    uint64_t v9 = (void *)*((void *)pool + 5);
    if (v9) {
      *((void *)pool + 5) = *v9;
    }
    else {
      uint64_t v9 = apr_palloc(pool, 0x20uLL);
    }
    v9[2] = cleanup;
    void v9[3] = cleanup;
    *uint64_t v9 = *((void *)pool + 4);
    v9[1] = data;
    *((void *)pool + 4) = v9;
  }

  return 0;
}

apr_status_t apr_pool_userdata_get(void **data, const char *key, apr_pool_t *pool)
{
  uint64_t v4 = *((void *)pool + 9);
  if (v4)
  {
    unint64_t v5 = (void *)*find_entry(v4, key, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    if (v5) {
      unint64_t v5 = (void *)v5[4];
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  void *data = v5;
  return 0;
}

void apr_pool_pre_cleanup_register( apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *))
{
  if (p)
  {
    vm_address_t v6 = (void *)*((void *)p + 5);
    if (v6) {
      *((void *)p + 5) = *v6;
    }
    else {
      vm_address_t v6 = apr_palloc(p, 0x20uLL);
    }
    v6[2] = plain_cleanup;
    *vm_address_t v6 = *((void *)p + 14);
    v6[1] = data;
    *((void *)p + 14) = v6;
  }

void apr_pool_cleanup_kill(apr_pool_t *p, const void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  if (p)
  {
    uint64_t v3 = (void *)((char *)p + 32);
    uint64_t v4 = (uint64_t *)*((void *)p + 4);
    if (v4)
    {
      while (1)
      {
        unint64_t v5 = v4;
        uint64_t v4 = (uint64_t *)*v4;
        uint64_t v3 = v5;
        if (!*v5) {
          goto LABEL_8;
        }
      }

      void *v3 = *v4;
      uint64_t *v4 = *((void *)p + 5);
      *((void *)p + 5) = v4;
    }

void apr_pool_child_cleanup_set( apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v4 = (uint64_t **)*((void *)p + 4);
    if (v4)
    {
      while (v4[1] != data || v4[2] != (uint64_t *)plain_cleanup)
      {
        uint64_t v4 = (uint64_t **)*v4;
        if (!v4) {
          return;
        }
      }

      v4[3] = (uint64_t *)child_cleanup;
    }
  }

apr_status_t apr_pool_cleanup_run(apr_pool_t *p, void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  return ((uint64_t (*)(void *))cleanup)(data);
}

void apr_pool_cleanup_for_exec(void)
{
}

uint64_t cleanup_pool_for_exec(uint64_t result)
{
  uint64_t v1 = result;
  for (uint64_t i = *(void *)(result + 32); i; uint64_t i = *(void *)(v1 + 32))
  {
    *(void *)(v1 + 32) = *(void *)i;
    uint64_t result = (*(uint64_t (**)(void))(i + 24))(*(void *)(i + 8));
  }

  for (uint64_t j = *(void *)(v1 + 8); j; uint64_t j = *(void *)(j + 16))
    uint64_t result = cleanup_pool_for_exec(j);
  return result;
}

apr_status_t apr_pool_cleanup_null(void *data)
{
  return 0;
}

void apr_pool_note_subprocess(apr_pool_t *a, apr_proc_t *proc, apr_kill_conditions_e how)
{
  vm_address_t v6 = apr_palloc(a, 0x18uLL);
  *(void *)vm_address_t v6 = proc;
  v6[2] = how;
  *((void *)v6 + 2) = *((void *)a + 7);
  *((void *)a + 7) = v6;
}

void *__cdecl apr_pcalloc_debug(apr_pool_t *p, apr_size_t size, const char *file_line)
{
  uint64_t v4 = apr_palloc(p, size);
  unint64_t v5 = v4;
  if (v4) {
    bzero(v4, size);
  }
  return v5;
}

apr_status_t apr_procattr_create(apr_procattr_t **new_attr, apr_pool_t *cont)
{
  uint64_t v4 = (char *)apr_palloc(cont, 0x88uLL);
  if (v4)
  {
    unint64_t v5 = v4;
    apr_status_t result = 0;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    *new_attr = (apr_procattr_t *)v5;
    *(void *)unint64_t v5 = cont;
    vm_address_t v7 = *new_attr;
    *((_DWORD *)v7 + 16) = 1;
    *(void *)((char *)v7 + 116) = -1LL;
  }

  else
  {
    *new_attr = 0LL;
    return 12;
  }

  return result;
}

apr_status_t apr_procattr_io_set(apr_procattr_t *attr, apr_int32_t in, apr_int32_t out, apr_int32_t err)
{
  return 0;
}

apr_status_t apr_procattr_child_in_set(apr_procattr_t *attr, apr_file_t *child_in, apr_file_t *parent_in)
{
  return 0;
}

apr_status_t apr_procattr_child_out_set(apr_procattr_t *attr, apr_file_t *child_out, apr_file_t *parent_out)
{
  return 0;
}

apr_status_t apr_procattr_child_err_set(apr_procattr_t *attr, apr_file_t *child_err, apr_file_t *parent_err)
{
  return 0;
}

apr_status_t apr_procattr_dir_set(apr_procattr_t *attr, const char *dir)
{
  uint64_t v3 = apr_pstrdup(*(apr_pool_t **)attr, dir);
  *((void *)attr + 7) = v3;
  if (v3) {
    return 0;
  }
  else {
    return 12;
  }
}

apr_status_t apr_procattr_cmdtype_set(apr_procattr_t *attr, apr_cmdtype_e cmd)
{
  *((_DWORD *)attr + 16) = cmd;
  return 0;
}

apr_status_t apr_procattr_detach_set(apr_procattr_t *attr, apr_int32_t detach)
{
  *((_DWORD *)attr + 17) = detach;
  return 0;
}

apr_status_t apr_proc_fork(apr_proc_t *proc, apr_pool_t *cont)
{
  *(_OWORD *)&proc->pid = 0u;
  *(_OWORD *)&proc->out = 0u;
  pid_t v3 = fork();
  if (v3 < 0) {
    return *__error();
  }
  apr_status_t v4 = 70001;
  if (v3)
  {
    proc->pid = v3;
    return 70002;
  }

  else
  {
    proc->pid = getpid();
    apr_random_after_fork(proc);
  }

  return v4;
}

apr_status_t apr_procattr_child_errfn_set(apr_procattr_t *attr, apr_child_errfn_t *errfn)
{
  *((void *)attr + 13) = errfn;
  return 0;
}

apr_status_t apr_procattr_error_check_set(apr_procattr_t *attr, apr_int32_t chk)
{
  *((_DWORD *)attr + 28) = chk;
  return 0;
}

apr_status_t apr_procattr_addrspace_set(apr_procattr_t *attr, apr_int32_t addrspace)
{
  return 0;
}

apr_status_t apr_procattr_user_set(apr_procattr_t *attr, const char *username, const char *password)
{
  return 0;
}

apr_status_t apr_procattr_group_set(apr_procattr_t *attr, const char *groupname)
{
  return 0;
}

apr_status_t apr_proc_create( apr_proc_t *new_proc, const char *progname, const char *const *args, const char *const *env, apr_procattr_t *attr, apr_pool_t *pool)
{
  return 0;
}

apr_status_t apr_proc_wait_all_procs( apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow, apr_pool_t *p)
{
  proc->pid = -1;
  return apr_proc_wait(proc, exitcode, exitwhy, waithow);
}

apr_status_t apr_proc_wait(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow)
{
  if (waithow) {
    int v7 = 3;
  }
  else {
    int v7 = 2;
  }
  while (1)
  {
    pid_t v8 = waitpid(proc->pid, &v14, v7);
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return *__error();
    }
  }

  pid_t v10 = v8;
  apr_status_t result = 70005;
  if (!v10) {
    return 70006;
  }
  proc->pid = v10;
  unsigned __int8 v11 = BYTE1(v14);
  int v12 = v14 & 0x7F;
  if (v12 == 127) {
    return 20014;
  }
  if ((v14 & 0x7F) != 0)
  {
    if (exitwhy)
    {
      if ((v14 & 0x80) != 0) {
        apr_exit_why_e v13 = APR_PROC_SIGNAL_CORE|APR_PROC_SIGNAL;
      }
      else {
        apr_exit_why_e v13 = APR_PROC_SIGNAL;
      }
      *exitwhy = v13;
    }
  }

  else
  {
    if (exitwhy) {
      *exitwhy = APR_PROC_EXIT;
    }
    int v12 = v11;
  }

  if (exitcode) {
    *exitcode = v12;
  }
  return result;
}

uint64_t apr_procattr_perms_set_register(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  pid_t v8 = apr_palloc(*(apr_pool_t **)a1, 0x20uLL);
  v8[3] = a3;
  *((_DWORD *)v8 + 4) = a4;
  *pid_t v8 = *(void *)(a1 + 128);
  v8[1] = a2;
  *(void *)(a1 + 128) = v8;
  return 0LL;
}

apr_status_t apr_proc_mutex_destroy(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(apr_proc_mutex_t *))(*((void *)mutex + 1) + 40LL))(mutex);
}

apr_status_t apr_proc_mutex_cleanup(void *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 40LL))();
}

void apr_proc_mutex_unix_setup_lock()
{
  proc_mutex_op_on = -65536;
  word_23A3A4 = 4096;
  proc_mutex_op_try = -65536;
  word_23A3AA = 6144;
  proc_mutex_op_off = 0x10000;
  word_23A3B0 = 4096;
  proc_mutex_lock_it = 0LL;
  unk_23A3C0 = 0LL;
  qword_23A3C8 = 0x300000000LL;
  proc_mutex_unlock_it = 0LL;
  *(void *)algn_23A3D8 = 0LL;
  qword_23A3E0 = 0x200000000LL;
}

const char *apr_proc_mutex_defname(void)
{
  return "sysvsem";
}

uint64_t proc_mutex_sysv_create(uint64_t a1)
{
  int v2 = semget(0, 1, 896);
  *(_DWORD *)(a1 + 32) = v2;
  if (v2 == -1)
  {
    uint64_t v3 = *__error();
    int v4 = *(_DWORD *)(a1 + 32);
    if (v4 != -1) {
      semctl(v4, 0, 0, 0LL);
    }
  }

  else if (semctl(v2, 0, 8, 1LL) < 0)
  {
    uint64_t v3 = *__error();
    int v5 = *(_DWORD *)(a1 + 32);
    if (v5 != -1) {
      semctl(v5, 0, 0, 0LL);
    }
    *(_DWORD *)(a1 + 32) = -1;
  }

  else
  {
    *(_DWORD *)(a1 + 16) = 0;
    apr_pool_cleanup_register(*(apr_pool_t **)a1, (const void *)a1, apr_proc_mutex_cleanup, apr_pool_cleanup_null);
    return 0LL;
  }

  return v3;
}

uint64_t proc_mutex_sysv_acquire(uint64_t a1)
{
  while (semop(*(_DWORD *)(a1 + 32), (sembuf *)&proc_mutex_op_on, 1uLL) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 16) = 1;
  return result;
}

uint64_t proc_mutex_sysv_tryacquire(uint64_t a1)
{
  do
  {
    if ((semop(*(_DWORD *)(a1 + 32), (sembuf *)&proc_mutex_op_try, 1uLL) & 0x80000000) == 0)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 16) = 1;
      return result;
    }
  }

  while (*__error() == 4);
  if (*__error() == 35) {
    return 70025LL;
  }
  else {
    return *__error();
  }
}

uint64_t proc_mutex_sysv_release(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  while (semop(*(_DWORD *)(a1 + 32), (sembuf *)&proc_mutex_op_off, 1uLL) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }

  return 0LL;
}

uint64_t proc_mutex_sysv_cleanup(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 != -1) {
    semctl(v1, 0, 0, 0LL);
  }
  return 0LL;
}

uint64_t proc_mutex_no_child_init()
{
  return 0LL;
}

uint64_t proc_mutex_sysv_perms_set()
{
  return 0LL;
}

const char *__cdecl apr_proc_mutex_name(apr_proc_mutex_t *mutex)
{
  return *(const char **)(*((void *)mutex + 1) + 72LL);
}

apr_status_t apr_proc_mutex_create( apr_proc_mutex_t **mutex, const char *fname, apr_lockmech_e mech, apr_pool_t *pool)
{
  pid_t v8 = (char *)apr_palloc(pool, 0x40uLL);
  uint64_t v9 = v8;
  if (v8)
  {
    *((void *)v8 + 7) = 0LL;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 8) = 0u;
  }

  apr_status_t result = 70023;
  *(void *)uint64_t v9 = pool;
  *((_DWORD *)v9 + 8) = -1;
  *((void *)v9 + 6) = 0LL;
  *((_DWORD *)v9 + 14) = 0;
  if (mech <= APR_LOCK_DEFAULT && ((0x27u >> mech) & 1) != 0)
  {
    uint64_t v11 = (uint64_t)*(&off_20E6B0 + mech);
    *((void *)v9 + 1) = v11;
    apr_status_t result = (*(uint64_t (**)(char *, const char *))(v11 + 8))(v9, fname);
    if (!result) {
      apr_thread_mutex_t *mutex = (apr_proc_mutex_t *)v9;
    }
  }

  return result;
}

uint64_t proc_mutex_flock_create()
{
  return 0LL;
}

uint64_t proc_mutex_flock_acquire(uint64_t a1)
{
  while (flock(*(_DWORD *)(a1 + 32), 2) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 16) = 1;
  return result;
}

uint64_t proc_mutex_flock_tryacquire(uint64_t a1)
{
  do
  {
    if ((flock(*(_DWORD *)(a1 + 32), 6) & 0x80000000) == 0)
    {
      uint64_t v2 = 0LL;
      *(_DWORD *)(a1 + 16) = 1;
      return v2;
    }
  }

  while (*__error() == 4);
  uint64_t v2 = 70025LL;
  if (*__error() != 35 && *__error() != 35) {
    return *__error();
  }
  return v2;
}

uint64_t proc_mutex_flock_release(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  while (flock(*(_DWORD *)(a1 + 32), 8) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }

  return 0LL;
}

uint64_t proc_mutex_flock_cleanup()
{
  return 0LL;
}

uint64_t proc_mutex_flock_child_init()
{
  return 0LL;
}

uint64_t proc_mutex_flock_perms_set(uint64_t a1, __int16 a2, uid_t a3, gid_t a4)
{
  if (!*(void *)(a1 + 24)) {
    return 0LL;
  }
  if ((a2 & 0x4000) == 0) {
    a4 = -1;
  }
  if (fchown(*(_DWORD *)(a1 + 32), a3, a4) < 0) {
    return *__error();
  }
  else {
    return 0LL;
  }
}

uint64_t proc_mutex_fcntl_create()
{
  return 0LL;
}

uint64_t proc_mutex_fcntl_acquire(uint64_t a1)
{
  while (fcntl(*(_DWORD *)(a1 + 32), 9, &proc_mutex_lock_it) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 16) = 1;
  return result;
}

uint64_t proc_mutex_fcntl_tryacquire(uint64_t a1)
{
  do
  {
    if ((fcntl(*(_DWORD *)(a1 + 32), 8, &proc_mutex_lock_it) & 0x80000000) == 0)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 16) = 1;
      return result;
    }
  }

  while (*__error() == 4);
  if (*__error() == 35) {
    return 70025LL;
  }
  else {
    return *__error();
  }
}

uint64_t proc_mutex_fcntl_release(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  while (fcntl(*(_DWORD *)(a1 + 32), 9, &proc_mutex_unlock_it) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }

  return 0LL;
}

uint64_t proc_mutex_fcntl_cleanup()
{
  return 0LL;
}

uint64_t proc_mutex_fcntl_perms_set(uint64_t a1, __int16 a2, uid_t a3, gid_t a4)
{
  if (!*(void *)(a1 + 24)) {
    return 0LL;
  }
  if ((a2 & 0x4000) == 0) {
    a4 = -1;
  }
  if (fchown(*(_DWORD *)(a1 + 32), a3, a4) < 0) {
    return *__error();
  }
  else {
    return 0LL;
  }
}

apr_status_t apr_proc_mutex_child_init(apr_proc_mutex_t **mutex, const char *fname, apr_pool_t *pool)
{
  return (*(uint64_t (**)(void))(*((void *)*mutex + 1) + 48LL))();
}

apr_status_t apr_proc_mutex_lock(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 16LL))();
}

apr_status_t apr_proc_mutex_trylock(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 24LL))();
}

apr_status_t apr_proc_mutex_unlock(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 32LL))();
}

uint64_t apr_proc_mutex_mech(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 8) + 64LL);
}

const char *__cdecl apr_proc_mutex_lockfile(apr_proc_mutex_t *mutex)
{
  int v1 = (void *)*((void *)mutex + 1);
  if (v1 == &mutex_flock_methods || v1 == &mutex_fcntl_methods) {
    return (const char *)*((void *)mutex + 3);
  }
  else {
    return 0LL;
  }
}

uint64_t apr_proc_mutex_perms_set(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 56LL))();
}

apr_pool_t *__cdecl apr_proc_mutex_pool_get(const apr_proc_mutex_t *theproc_mutex)
{
  return *(apr_pool_t **)theproc_mutex;
}

uint64_t apr_os_proc_mutex_get_ex(_OWORD *a1, uint64_t a2, _DWORD *a3)
{
  *a1 = *(_OWORD *)(a2 + 32);
  if (a3) {
    *a3 = *(_DWORD *)(*(void *)(a2 + 8) + 64LL);
  }
  return 0LL;
}

apr_status_t apr_os_proc_mutex_get(apr_os_proc_mutex_t *ospmutex, apr_proc_mutex_t *pmutex)
{
  *ospmutex = *((apr_os_proc_mutex_t *)pmutex + 2);
  return 0;
}

uint64_t apr_os_proc_mutex_put_ex()
{
  return 0LL;
}

apr_status_t apr_os_proc_mutex_put(apr_proc_mutex_t **pmutex, apr_os_proc_mutex_t *ospmutex, apr_pool_t *cont)
{
  return 0;
}

void apr_random_init( apr_random_t *g, apr_pool_t *p, apr_crypto_hash_t *pool_hash, apr_crypto_hash_t *key_hash, apr_crypto_hash_t *prng_hash)
{
  *(void *)g = p;
  *((void *)g + 1) = pool_hash;
  *((void *)g + 7) = key_hash;
  *((void *)g + 8) = prng_hash;
  *((_DWORD *)g + 4) = 32;
  int v7 = apr_palloc(p, 0x200uLL);
  *((void *)g + 3) = v7;
  uint64_t v8 = *((unsigned int *)g + 4);
  if ((_DWORD)v8) {
    bzero(v7, 16 * v8);
  }
  *((void *)g + 4) = 0LL;
  *((void *)g + 5) = 2LL
                     * *(void *)(*((void *)g + 1) + 24LL)
  *((void *)g + 6) = 32LL;
  apr_size_t v9 = *(void *)(*((void *)g + 7) + 24LL) + *(void *)(*((void *)g + 8) + 24LL);
  pid_t v10 = apr_palloc(p, v9);
  uint64_t v11 = v10;
  if (v10) {
    bzero(v10, v9);
  }
  *((void *)g + 9) = v11;
  apr_size_t v12 = *(void *)(*((void *)g + 7) + 24LL) + *(void *)(*((void *)g + 8) + 24LL);
  apr_exit_why_e v13 = apr_palloc(p, v12);
  int v14 = v13;
  if (v13) {
    bzero(v13, v12);
  }
  *((void *)g + 10) = v14;
  *((void *)g + 11) = apr_palloc(p, *(void *)(*((void *)g + 8) + 24LL));
  *((void *)g + 12) = 0LL;
  *((_DWORD *)g + 28) = 0;
  *((void *)g + 13) = 0x14000000020LL;
  *((_BYTE *)g + 116) &= 0xFCu;
  *((void *)g + 15) = all_random;
  all_random = (uint64_t)g;
  unint64_t v15 = (void *)*((void *)p + 5);
  if (v15) {
    *((void *)p + 5) = *v15;
  }
  else {
    unint64_t v15 = apr_palloc(p, 0x20uLL);
  }
  v15[2] = random_cleanup;
  v15[3] = apr_pool_cleanup_null;
  *unint64_t v15 = *((void *)p + 4);
  v15[1] = g;
  *((void *)p + 4) = v15;
}

uint64_t random_cleanup(uint64_t a1)
{
  uint64_t v1 = all_random;
  if (all_random)
  {
    if (all_random == a1)
    {
      uint64_t v3 = &all_random;
LABEL_7:
      uint64_t *v3 = *(void *)(a1 + 120);
    }

    else
    {
      while (1)
      {
        uint64_t v2 = v1;
        uint64_t v1 = *(void *)(v1 + 120);
        if (!v1) {
          break;
        }
        if (v1 == a1)
        {
          uint64_t v3 = (uint64_t *)(v2 + 120);
          goto LABEL_7;
        }
      }
    }
  }

  return 0LL;
}

void apr_random_after_fork(apr_proc_t *proc)
{
  for (uint64_t i = all_random; i; uint64_t i = *(void *)(i + 120))
  {
    if ((*(_BYTE *)(i + 116) & 3) == 1) {
      uint64_t v2 = 80LL;
    }
    else {
      uint64_t v2 = 72LL;
    }
    uint64_t v3 = *(void *)(i + v2);
    mix_pid(i);
    if (v3 != *(void *)(i + 72)) {
      mix_pid(i);
    }
    --*(_DWORD *)(i + 36);
    *(void *)(i + 96) = 0LL;
  }

uint64_t mix_pid(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

apr_random_t *__cdecl apr_random_standard_new(apr_pool_t *p)
{
  return (apr_random_t *)apr_palloc(p, 0x80uLL);
}

void apr_random_add_entropy(apr_random_t *g, const void *entropy_, apr_size_t bytes)
{
  if (bytes)
  {
    uint64_t v6 = 0LL;
    for (i = 0; i < bytes; uint64_t v6 = ++i)
    {
      uint64_t v8 = *((unsigned int *)g + 8);
      uint64_t v9 = *((void *)g + 3) + 16 * v8;
      if ((_DWORD)v8 + 1 == *((_DWORD *)g + 4)) {
        int v10 = 0;
      }
      else {
        int v10 = v8 + 1;
      }
      *((_DWORD *)g + 8) = v10;
      apr_size_t v12 = (unsigned int *)(v9 + 8);
      unsigned int v11 = *(_DWORD *)(v9 + 8);
      unsigned int v13 = v11 + 1;
      if (*(_DWORD *)(v9 + 12) >= v11 + 1)
      {
        int v14 = *(void **)v9;
      }

      else
      {
        int v14 = apr_palloc(*(apr_pool_t **)g, 2 * v13);
        memcpy(v14, *(const void **)v9, *v12);
        *(void *)uint64_t v9 = v14;
        unsigned int v11 = *v12;
        *(_DWORD *)(v9 + 12) = 2 * *v12 + 2;
        unsigned int v13 = v11 + 1;
      }

      char v15 = *((_BYTE *)entropy_ + v6);
      *apr_size_t v12 = v13;
      *((_BYTE *)v14 + v11) = v15;
      unint64_t v16 = *v12;
      if (*((void *)g + 5) == v16)
      {
        if (v16 >= 2)
        {
          unint64_t v17 = 0LL;
          uint64_t v18 = *((void *)g + 1);
          do
          {
            (*(void (**)(void))v18)();
            (*(void (**)(void))(*((void *)g + 1) + 8LL))();
            (*(void (**)(void))(*((void *)g + 1) + 16LL))();
            uint64_t v18 = *((void *)g + 1);
            v17 += *(void *)(v18 + 24);
            unint64_t v19 = *v12;
          }

          while (v17 < v19 >> 1);
          unint64_t v16 = v19 >> 1;
        }

        else
        {
          LODWORD(v16) = v16 >> 1;
        }

        *apr_size_t v12 = v16;
      }
    }
  }

  if (*((void *)g + 6) <= (unint64_t)*(unsigned int *)(*((void *)g + 3) + 8LL))
  {
    (**((void (***)(void))g + 7))();
    (*(void (**)(void))(*((void *)g + 7) + 8LL))();
    if (*((_DWORD *)g + 4))
    {
      uint64_t v20 = 0LL;
      unint64_t v21 = 0LL;
      do
      {
        if (v21 && ((*((_DWORD *)g + 9) >> (v21 - 1)) & 1) == 0) {
          break;
        }
        (*(void (**)(void))(*((void *)g + 7) + 8LL))();
        *(_DWORD *)(*((void *)g + 3) + v20 + 8) = 0;
        ++v21;
        v20 += 16LL;
      }

      while (v21 < *((unsigned int *)g + 4));
    }

    (*(void (**)(void))(*((void *)g + 7) + 16LL))();
    unsigned int v22 = *((_DWORD *)g + 9) + 1;
    *((_DWORD *)g + 9) = v22;
    char v23 = *((_BYTE *)g + 116);
    if ((v23 & 1) != 0 || v22 <= *((_DWORD *)g + 26))
    {
      char v24 = *((_BYTE *)g + 116);
      if ((v24 & 2) != 0) {
        return;
      }
    }

    else
    {
      char v24 = v23 | 1;
      *((_BYTE *)g + 116) = v23 | 1;
      if ((v23 & 2) == 0)
      {
        memcpy( *((void **)g + 10),  *((const void **)g + 9),  *(void *)(*((void *)g + 7) + 24LL) + *(void *)(*((void *)g + 8) + 24LL));
        unsigned int v22 = *((_DWORD *)g + 9);
        *((_DWORD *)g + 28) = v22;
        char v24 = *((_BYTE *)g + 116);
      }

      if ((v24 & 2) != 0) {
        return;
      }
    }

    if (v22 > *((_DWORD *)g + 27) + *((_DWORD *)g + 28))
    {
      *((_BYTE *)g + 116) = v24 | 2;
      memcpy( *((void **)g + 9),  *((const void **)g + 10),  *(void *)(*((void *)g + 7) + 24LL) + *(void *)(*((void *)g + 8) + 24LL));
    }
  }

apr_status_t apr_random_secure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((_BYTE *)g + 116) & 2) == 0) {
    return 20028;
  }
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void *apr_random_bytes(void *result, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    int v5 = result;
    unint64_t v6 = 0LL;
    size_t v7 = result[12];
    do
    {
      uint64_t v8 = v5[8];
      if (v7)
      {
        size_t v9 = *(void *)(v8 + 24);
      }

      else
      {
        (*(void (**)(void))v8)();
        (*(void (**)(void))(v5[8] + 8LL))();
        (*(void (**)(void))(v5[8] + 16LL))();
        (*(void (**)(void))v5[8])();
        (*(void (**)(void, void, void))(v5[8] + 8LL))(v5[8], v5[9], *(void *)(v5[8] + 24LL));
        (*(void (**)(void))(v5[8] + 16LL))();
        size_t v9 = *(void *)(v5[8] + 24LL);
        v5[12] = v9;
        size_t v7 = v9;
      }

      if (a3 - v6 >= v7) {
        size_t v10 = v7;
      }
      else {
        size_t v10 = a3 - v6;
      }
      uint64_t result = memcpy((void *)(a2 + v6), (const void *)(v5[11] + v9 - v7), v10);
      size_t v7 = v5[12] - v10;
      v5[12] = v7;
      v6 += v10;
    }

    while (v6 < a3);
  }

  return result;
}

apr_status_t apr_random_insecure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((_BYTE *)g + 116) & 1) == 0) {
    return 20028;
  }
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void apr_random_barrier(apr_random_t *g)
{
  *((_BYTE *)g + 116) &= ~2u;
  *((_DWORD *)g + 28) = *((_DWORD *)g + 9);
}

apr_status_t apr_random_secure_ready(apr_random_t *r)
{
  if ((*((_BYTE *)r + 116) & 2) != 0) {
    return 0;
  }
  else {
    return 20028;
  }
}

apr_status_t apr_random_insecure_ready(apr_random_t *r)
{
  if ((*((_BYTE *)r + 116) & 1) != 0) {
    return 0;
  }
  else {
    return 20028;
  }
}

int apr_vformatter( int (__cdecl *flush_func)(apr_vformatter_buff_t *), apr_vformatter_buff_t *c, const char *fmt, va_list ap)
{
  int v5 = c;
  unint64_t v171 = 0LL;
  unsigned int v169 = 0;
  unint64_t v6 = 0LL;
  p_n_4 = 0LL;
  int v8 = 0;
  v177 = 0LL;
  va_list v178 = ap;
  curpos = c->curpos;
  endpos = c->endpos;
LABEL_2:
  LOBYTE(v10) = *fmt;
  while (1)
  {
LABEL_3:
    if (v10 != 37)
    {
      uint64_t v55 = endpos;
      if (!(_BYTE)v10)
      {
        v5->curpos = curpos;
        return v8;
      }

      if (curpos)
      {
        if (curpos >= endpos)
        {
          v5->curpos = curpos;
          curpos = v5->curpos;
          uint64_t v55 = v5->endpos;
          LOBYTE(v10) = *fmt;
        }

        *curpos++ = v10;
      }

      ++v8;
LABEL_426:
      endpos = v55;
      ++fmt;
      goto LABEL_2;
    }

    int v12 = fmt[1];
    unsigned int v11 = fmt + 1;
    uint64_t v13 = v12;
    if (v12 < 0)
    {
      if (__maskrune(v13, 0x1000uLL))
      {
LABEL_6:
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        uint64_t v17 = 1LL;
        int v18 = 32;
        int v173 = 0;
        int v174 = 1;
        goto LABEL_41;
      }
    }

    else if ((_DefaultRuneLocale.__runetype[v13] & 0x1000) != 0)
    {
      goto LABEL_6;
    }

    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v19 = 1;
    int v18 = 32;
    while (1)
    {
      unsigned int v20 = *(unsigned __int8 *)v11;
      if (v20 <= 0x2A) {
        break;
      }
      switch(v20)
      {
        case '0':
          int v18 = 48;
          break;
        case '-':
          int v19 = 0;
          break;
        case '+':
          int v15 = 1;
          break;
        default:
          goto LABEL_21;
      }

LABEL_41:
    int v32 = *(unsigned __int8 *)v11;
    BOOL v33 = v32 == 108;
    if (v32 == 108) {
      vm_address_t v34 = v11 + 1;
    }
    else {
      vm_address_t v34 = v11;
    }
    if (v32 == 113)
    {
      BOOL v33 = 1;
      vm_address_t v34 = v11 + 1;
    }

    BOOL v35 = v32 == 104;
    if (v32 == 104) {
      BOOL v33 = 0;
    }
    LODWORD(v36) = v32 == 104;
    fmt = v35 ? v11 + 1 : v34;
    int v37 = *fmt;
    if (v37 > 70) {
      break;
    }
    LOBYTE(v10) = *fmt;
    if (*fmt)
    {
      if (v37 == 37)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        LOBYTE(v84) = 37;
LABEL_140:
        v176[0] = v84;
        uint64_t v83 = 1LL;
      }

      else
      {
        if (v37 == 69)
        {
LABEL_86:
          uint64_t v59 = (double *)v178;
          v178 += 8;
          int v42 = v174;
          if (fabs(*v59) == INFINITY)
          {
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            v177 = (_BYTE *)(&dword_0 + 3);
            p_n_4 = "inf";
            vm_address_t v41 = flush_func;
            goto LABEL_384;
          }

          if ((_DWORD)v17) {
            int v60 = 6;
          }
          else {
            int v60 = v171;
          }
          int v166 = *(unsigned __int8 *)fmt;
          v168 = v5;
          if (v166 == 102)
          {
            int v61 = v60;
            int v62 = 0;
          }

          else
          {
            int v61 = v60 + 1;
            int v62 = 1;
          }

          apr_cvt(v61, &__n, &v175, v62, __s, *v59);
          char v101 = __s[0];
          if (__s[0] < 0)
          {
          }

          else if ((_DefaultRuneLocale.__runetype[__s[0]] & 0x100) != 0)
          {
LABEL_174:
            v177 = (_BYTE *)strlen(__s);
            p_n_4 = __n_5;
            __memcpy_chk(__n_5, __s, v177 + 1, 511LL);
            unsigned int v175 = 0;
            int v42 = v174;
            goto LABEL_175;
          }

          int v119 = v166;
          if (v166 == 102)
          {
            if (__n < 1)
            {
              __n_5[0] = 48;
              if (v60 < 1)
              {
                if (v16)
                {
                  char __n_6 = 46;
                  v121 = __s;
                  p_n_6 = __n_7;
                }

                else
                {
                  v121 = __s;
                  p_n_6 = &__n_6;
                }
              }

              else
              {
                char __n_6 = 46;
                p_n_6 = __n_7;
                if (__n < 0)
                {
                  uint64_t v141 = ~__n;
                  memset(__n_7, 48, v141 + 1);
                  int v119 = 102;
                  p_n_6 = &__n_5[v141 + 3];
                }

                int __n = 1;
                v121 = __s;
              }
            }

            else
            {
              uint64_t v120 = __n;
              memcpy(__n_5, __s, __n);
              v121 = &__s[v120];
              p_n_6 = &__n_5[v120];
              int __n = -1;
              if (v16 || v60 > 0)
              {
                char *p_n_6 = 46;
                p_n_6 = &__n_7[(v120 - 1)];
              }

              int v119 = 102;
            }
          }

          else
          {
            __n_5[0] = v101;
            if (v16 || (p_n_6 = &__n_6, v121 = &__s[1], v60 >= 1))
            {
              char __n_6 = 46;
              p_n_6 = __n_7;
              v121 = &__s[1];
            }
          }

          char v150 = *v121;
          if (*v121)
          {
            v151 = (unsigned __int8 *)(v121 + 1);
            do
            {
              *p_n_6++ = v150;
              int v152 = *v151++;
              char v150 = v152;
            }

            while (v152);
          }

          p_n_4 = __n_5;
          if (v119 != 102)
          {
            char *p_n_6 = v119;
            int v153 = __n;
            int v154 = --__n;
            if (__n)
            {
              if (v154 >= 0) {
                unsigned int v155 = v154;
              }
              else {
                unsigned int v155 = -v154;
              }
              uint64_t v156 = -1LL;
              v157 = v185;
              do
              {
                uint64_t v158 = v156;
                *--v157 = v155 % 0xA + 48;
                --v156;
                BOOL v76 = v155 > 9;
                v155 /= 0xAu;
              }

              while (v76);
              if (v153 <= 0) {
                char v159 = 45;
              }
              else {
                char v159 = 43;
              }
              v160 = p_n_6 + 2;
              p_n_6[1] = v159;
              v161 = (_BYTE *)(v185 - v157);
              if (v161)
              {
                if (v161 == (_BYTE *)&dword_0 + 1)
                {
                  v160 = p_n_6 + 3;
                  p_n_6[2] = 48;
                }

                do
                {
                  *v160++ = v185[v158];
                  BOOL v66 = __CFADD__(v158++, 1LL);
                }

                while (!v66);
              }
            }

            else
            {
              *(_WORD *)(p_n_6 + 1) = 12331;
              v160 = p_n_6 + 4;
              p_n_6[3] = 48;
            }

            p_n_6 = v160;
          }

          v177 = (_BYTE *)(p_n_6 - __n_5);
          int v42 = v174;
          if (v175)
          {
            int v100 = 45;
LABEL_379:
            vm_address_t v41 = flush_func;
            goto LABEL_380;
          }

      v19 += v18;
      unsigned int v20 = v76;
      char v23 = v19 + v76;
      v22 += v18;
    }

    while (v19 + v76 < v10);
    unint64_t v36 = v73;
    int v37 = (char *)v21 - (char *)v73;
    if (v10 > v21 - v73)
    {
      int v38 = v37 >> 3;
      int v39 = v10 - (v37 >> 3);
      size_t v40 = &v73[v38];
      vm_address_t v41 = (uint64_t *)&v12[v38];
      do
      {
        int v42 = (const char **)*v41++;
        *v40++ = v42;
        --v39;
      }

      while (v39);
    }

    unint64_t v6 = v73;
  }

  while (v18 < v10);
LABEL_48:
  unint64_t v43 = (uint64_t)v72;
  unsigned int v44 = *((int *)v72 + 3);
  if ((int)v44 >= 2)
  {
    unsigned int v45 = v36 + 1;
    apr_vformatter_buff_t v46 = 1;
    vm_address_t v47 = (unint64_t)&v36[v44];
    while (2)
    {
      int v48 = v36;
      char v49 = *v36;
      uint64_t v50 = *((_DWORD *)*v36 + 4);
      unsigned int v51 = (const char ***)(v45 + 1);
      uint64_t v52 = v45;
      while (1)
      {
        unsigned int v45 = v52;
        unsigned int v53 = (const char **)*v52;
        unsigned int v54 = *((_DWORD *)*v52 + 4);
        if (v54 == v50)
        {
          uint64_t v55 = *v49;
          if (!strcasecmp(*v53, *v49)) {
            break;
          }
        }

        uint64_t v52 = v45 + 1;
        ++v51;
        uint64_t v50 = v54;
        char v49 = v53;
        int v48 = (const char ***)v45;
        if ((unint64_t)(v45 + 1) >= v47)
        {
          unint64_t v43 = (uint64_t)v72;
          if ((v46 & 1) != 0) {
            goto LABEL_77;
          }
          goto LABEL_72;
        }
      }

      unint64_t v43 = (uint64_t)v72;
      do
      {
        uint64_t v56 = v51;
        uint64_t v57 = *v51;
        if (*((_DWORD *)*v51 + 4) != v50) {
          break;
        }
        ++v51;
      }

      while (!strcasecmp(*v57, v55));
      size_t v58 = (unint64_t)(v56 - 1);
      unint64_t v36 = v48;
      if (v71 == 1)
      {
        uint64_t v59 = 0LL;
        int v60 = (uint64_t *)v48;
        do
        {
          int v61 = *v60++;
          v59 += strlen(*(const char **)(v61 + 8)) + 2;
        }

        while ((unint64_t)v60 <= v58);
        int v62 = (char *)apr_palloc(*(apr_pool_t **)v72, v59);
        uint64_t v63 = v48 + 1;
        unint64_t v64 = v62;
        while (1)
        {
          strcpy(v64, *(const char **)(*(v63 - 1) + 8LL));
          unint64_t v65 = &v64[strlen(*(const char **)(*(v63 - 1) + 8LL))];
          *(_WORD *)unint64_t v65 = 8236;
          unint64_t v64 = v65 + 2;
          ++v63;
        }

        const char *v65 = 0;
        unint64_t v36 = v48;
        char v49 = *v48;
      }

      else
      {
        int v62 = (char *)(*(v56 - 1))[1];
      }

      v49[1] = v62;
      do
      {
        BOOL v66 = *v45++;
        *BOOL v66 = 0LL;
      }

      while ((unint64_t)v45 <= v58);
      apr_vformatter_buff_t v46 = 0;
      break;
    }

LABEL_175:
          if (v15) {
            int v100 = 43;
          }
          else {
            int v100 = 32 * (v14 != 0);
          }
          goto LABEL_379;
        }

LABEL_352:
        int v18 = 32;
        goto LABEL_384;
      }

      int v42 = v174;
      if (v38 == 116)
      {
        v117 = (unsigned int **)v178;
        v178 += 8;
        unint64_t v36 = *v117;
        vm_address_t v41 = flush_func;
        if (!v36)
        {
          LOBYTE(v16) = 0;
          v177 = (_BYTE *)(&dword_4 + 2);
          int v18 = 32;
          p_n_4 = "(null)";
          goto LABEL_313;
        }

        unint64_t v118 = *(void *)v36;
        if (HIDWORD(v118))
        {
          p_n_4 = &v184[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v118 & 0xF];
            BOOL v76 = v118 > 0xF;
            v118 >>= 4;
          }

          while (v76);
        }

        else
        {
          p_n_4 = &v184[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v118 & 0xF];
            BOOL v66 = v118 >= 0x10;
            LODWORD(v118) = v118 >> 4;
          }

          while (v66);
        }

LABEL_116:
        int v75 = __n;
        BOOL v76 = __n < 0 || __n - (int)v71 <= 4;
        int v77 = !v76;
        if (__n >= -3 && v77 == 0)
        {
          if (__n <= 0)
          {
            if (__s[0] != 48) {
              *v73++ = 46;
            }
            if (v75 < 0)
            {
              do
              {
                int __n = v75 + 1;
                *v73++ = 48;
                int v75 = __n;
              }

              while (__n < 0);
            }

            else
            {
              int v75 = 0;
            }
          }

          if ((int)v71 >= 1)
          {
            uint64_t v142 = 0LL;
            do
            {
              char *v73 = __s[v142];
              if ((_DWORD)v142 + 1 == __n)
              {
                v73[1] = 46;
                v73 += 2;
              }

              else
              {
                ++v73;
              }

              ++v142;
            }

            while ((v71 - 1) + 1LL != v142);
            int v75 = __n;
          }

          if ((int)v71 < v75)
          {
            do
            {
              v143 = v73;
              LODWORD(v71) = v71 + 1;
              *v73++ = 48;
            }

            while ((int)v71 < __n);
            char *v73 = 46;
            uint64_t v73 = v143 + 2;
          }
        }

        else
        {
          --__n;
          char *v73 = __s[0];
          uint64_t v79 = v73 + 2;
          v73[1] = 46;
          if ((int)v71 > 1)
          {
            int v167 = v75;
            memcpy(v79, &__s[1], (v71 - 1));
            int v75 = v167;
            uint64_t v79 = &v73[(v71 - 2) + 3];
          }

          *uint64_t v79 = 101;
          if (v75 < 1)
          {
            int __n = 1 - v75;
            char v80 = 45;
          }

          else
          {
            char v80 = 43;
          }

          v79[1] = v80;
          int v135 = __n;
          if (__n < 100)
          {
            v136 = v79 + 2;
          }

          else
          {
            v136 = v79 + 3;
            v79[2] = __n / 0x64u + 48;
            int v135 = __n;
          }

          if (v135 >= 10)
          {
            *v136++ = ((103 * (v135 % 0x64u)) >> 10) | 0x30;
            int v135 = __n;
          }

          _BYTE *v136 = v135 % 10 + 48;
          uint64_t v73 = v136 + 1;
        }

        v144 = v73 - 1;
        if (*(v73 - 1) != 46 || v16 != 0) {
          v144 = v73;
        }
        char *v144 = 0;
        int v146 = 32 * (v14 != 0);
        if (v15) {
          int v146 = 43;
        }
        if (__n_5[0] == 45) {
          int v100 = 45;
        }
        else {
          int v100 = v146;
        }
        if (__n_5[0] == 45) {
          p_n_4 = &__n_6;
        }
        else {
          p_n_4 = __n_5;
        }
        size_t v147 = strlen(p_n_4);
        v177 = (_BYTE *)v147;
        if (v16)
        {
          size_t v148 = v147;
          if (!strchr(p_n_4, 46))
          {
            v177 = (_BYTE *)(v148 + 1);
            *(_WORD *)&p_n_4[v148] = 46;
          }
        }

        vm_address_t v41 = flush_func;
        if (*fmt == 71)
        {
          v149 = strchr(p_n_4, 101);
          if (v149) {
            char *v149 = 69;
          }
        }

        goto LABEL_348;
      }

      if (v37 != 88) {
        goto LABEL_137;
      }
LABEL_94:
      if (v33)
      {
        uint64_t v63 = (unint64_t *)v178;
        v178 += 8;
        unint64_t v64 = *v63;
        unint64_t v65 = "0123456789abcdef";
        if (*fmt == 88) {
          unint64_t v65 = "0123456789ABCDEF";
        }
        if (HIDWORD(v64))
        {
          p_n_4 = &v184[3];
          vm_address_t v41 = flush_func;
          do
          {
            *--p_n_4 = v65[v64 & 0xF];
            BOOL v66 = v64 >= 0x10;
            v64 >>= 4;
          }

          while (v66);
        }

        else
        {
          p_n_4 = &v184[3];
          vm_address_t v41 = flush_func;
          do
          {
            *--p_n_4 = v65[v64 & 0xF];
            BOOL v66 = v64 >= 0x10;
            LODWORD(v64) = v64 >> 4;
          }

          while (v66);
        }
      }

      else
      {
        v102 = (unsigned int *)v178;
        v178 += 8;
        unsigned int v103 = *v102;
        if ((_DWORD)v36) {
          unsigned int v103 = (unsigned __int16)v103;
        }
        v104 = "0123456789abcdef";
        if (*fmt == 88) {
          v104 = "0123456789ABCDEF";
        }
        p_n_4 = &v184[3];
        unsigned int v169 = v103;
        do
        {
          *--p_n_4 = v104[v103 & 0xF];
          BOOL v76 = v103 > 0xF;
          v103 >>= 4;
        }

        while (v76);
        vm_address_t v41 = flush_func;
      }

      v177 = (_BYTE *)(&v184[3] - p_n_4);
      if ((v17 & 1) != 0) {
        goto LABEL_259;
      }
      unint64_t v131 = 511LL;
      if (v171 + 1 < 0x200) {
        unint64_t v131 = v171;
      }
      if (&v184[3] - p_n_4 >= v131)
      {
LABEL_259:
        int v42 = v174;
      }

      else
      {
        int v42 = v174;
        do
        {
          *--p_n_4 = 48;
          ++v177;
        }

        while ((unint64_t)v177 < v131);
      }

      LOBYTE(v36) = 0;
      if (v16 && v169)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        char v132 = *fmt;
        *((_BYTE *)p_n_4 - 2) = 48;
        p_n_4 -= 2;
        *((_BYTE *)p_n_4 + 1) = v132;
        v133 = v177 + 2;
LABEL_304:
        v177 = v133;
      }

      else
      {
        LOBYTE(v16) = 0;
      }

      goto LABEL_384;
  }

LABEL_380:
  LOBYTE(v16) = 0;
  LOBYTE(v36) = v100 != 0;
  if (v100 && p_n_4 != "(null)")
  {
    LOBYTE(v16) = 0;
    *--p_n_4 = v100;
    ++v177;
    LOBYTE(v36) = 1;
  }

  int v5 = v168;
LABEL_384:
  unint64_t v162 = (unint64_t)v177;
  if (!v173)
  {
    uint64_t v55 = endpos;
LABEL_405:
    if (v162) {
      char v164 = v16;
    }
    else {
      char v164 = 1;
    }
    if ((v164 & 1) == 0)
    {
      v8 += v162;
      do
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            curpos = v5->curpos;
            uint64_t v55 = v5->endpos;
          }

          *curpos++ = *p_n_4;
        }

        ++p_n_4;
        --v162;
      }

      while (v162);
      unint64_t v162 = (unint64_t)v177;
    }

    if (v173 && !v174)
    {
      while (v6 > v162)
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            curpos = v5->curpos;
            uint64_t v55 = v5->endpos;
          }

          *curpos++ = v18;
          unint64_t v162 = (unint64_t)v177;
        }

        ++v8;
        --v6;
      }
    }

    goto LABEL_426;
  }

  BOOL v35 = v42 == 1;
  uint64_t v55 = endpos;
  char v163 = v36 ^ 1;
  if (v18 != 48) {
    char v163 = 1;
  }
  if ((v163 & 1) != 0)
  {
    do
    {
LABEL_397:
      if (curpos)
      {
        if (curpos >= v55)
        {
          v5->curpos = curpos;
          curpos = v5->curpos;
          uint64_t v55 = v5->endpos;
        }

        *curpos++ = v18;
        unint64_t v162 = (unint64_t)v177;
      }

      ++v8;
      --v6;
    }

    while (v6 > v162);
    goto LABEL_405;
  }

  if (!curpos) {
    goto LABEL_396;
  }
  if (curpos < endpos) {
    goto LABEL_395;
  }
  v5->curpos = curpos;
  if (!((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))v41)(v5, v17))
  {
    curpos = v5->curpos;
    uint64_t v55 = v5->endpos;
LABEL_395:
    *curpos++ = *p_n_4;
    unint64_t v162 = (unint64_t)v177;
LABEL_396:
    ++v8;
    ++p_n_4;
    v177 = (_BYTE *)--v162;
    --v6;
    goto LABEL_397;
  }

  return -1;
}

uint64_t conv_10_quad(unint64_t a1, int a2, _DWORD *a3, uint64_t a4, void *a5)
{
  if ((HIDWORD(a1) || !a2) && (a1 != (int)a1 || a2))
  {
    if ((a1 & 0x8000000000000000LL) == 0LL) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = -(uint64_t)a1;
    }
    if (a2) {
      int v11 = 0;
    }
    else {
      int v11 = a1 >> 63;
    }
    if (a2) {
      unint64_t v12 = a1;
    }
    else {
      unint64_t v12 = v10;
    }
    *a3 = v11;
    uint64_t result = a4;
    do
    {
      *(_BYTE *)--uint64_t result = v12 % 0xA + 48;
      BOOL v13 = v12 > 9;
      v12 /= 0xAuLL;
    }

    while (v13);
  }

  else
  {
    if ((a1 & 0x80000000) == 0LL) {
      int v5 = a1;
    }
    else {
      int v5 = -(int)a1;
    }
    if (a2) {
      int v6 = 0;
    }
    else {
      int v6 = (a1 >> 31) & 1;
    }
    if (a2) {
      unsigned int v7 = a1;
    }
    else {
      unsigned int v7 = v5;
    }
    *a3 = v6;
    uint64_t result = a4;
    do
    {
      *(_BYTE *)--uint64_t result = v7 % 0xA + 48;
      BOOL v9 = v7 >= 0xA;
      v7 /= 0xAu;
    }

    while (v9);
  }

  *a5 = a4 - result;
  return result;
}

char *apr_cvt(int a1, int *a2, _DWORD *a3, int a4, char *a5, double a6)
{
  if (a1 >= 78) {
    int v9 = 78;
  }
  else {
    int v9 = a1;
  }
  *a3 = 0;
  if (a6 < 0.0)
  {
    *a3 = 1;
    a6 = -a6;
  }

  double v10 = modf(a6, &v32);
  double v11 = v10;
  double v12 = v32;
  if (v32 == 0.0)
  {
    if (v10 > 0.0)
    {
      int v13 = 1;
      do
      {
        double v21 = v11;
        double v11 = v11 * 10.0;
        --v13;
      }

      while (v11 < 1.0);
      unint64_t v19 = 0LL;
      double v31 = v11;
      double v11 = v21;
      goto LABEL_20;
    }

    int v13 = 0;
  }

  else
  {
    int v13 = 0;
    uint64_t v14 = 80LL;
    uint64_t v15 = 1LL;
    do
    {
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      double v18 = modf(v12 / 10.0, &v32);
      ++v13;
      uint64_t v14 = v16 - 1;
      a5[v16 - 1] = (int)((v18 + 0.03) * 10.0) + 48;
      if (v16 == 1) {
        break;
      }
      double v12 = v32;
      uint64_t v15 = v17 + 1;
    }

    while (v32 != 0.0);
    double v31 = v18;
    if (v16 <= 80)
    {
      unint64_t v19 = 81 - v16;
      unsigned int v20 = a5;
      do
      {
        *unsigned int v20 = v20[v14];
        ++v20;
        --v17;
      }

      while (v17);
      goto LABEL_20;
    }
  }

  unint64_t v19 = 0LL;
LABEL_20:
  if (a4) {
    int v22 = 0;
  }
  else {
    int v22 = v13;
  }
  uint64_t v23 = v22 + (uint64_t)v9;
  if (v23 < 0)
  {
    *a2 = -v9;
    int v27 = a5;
  }

  else
  {
    *a2 = v13;
    if ((uint64_t)v19 <= v23 && v19 <= 0x4F)
    {
      do
      {
        double v11 = modf(v11 * 10.0, &v31);
        a5[v19] = (int)v31 + 48;
      }

      while (v19++ < 0x4F);
    }

    if (v23 >= 80)
    {
      int v27 = a5 + 79;
    }

    else
    {
      unsigned int v25 = &a5[v23];
      int v26 = (char)(a5[v23] + 5);
      a5[v23] += 5;
      if (v26 < 58)
      {
        int v27 = &a5[v23];
      }

      else
      {
        int v27 = &a5[v23];
        do
        {
          *unsigned int v25 = 48;
          if (v25 <= a5)
          {
            *unsigned int v25 = 49;
            ++*a2;
            if (!a4)
            {
              if (v27 > a5) {
                *int v27 = 48;
              }
              ++v27;
            }

            char v29 = *v25;
          }

          else
          {
            char v28 = *--v25;
            char v29 = v28 + 1;
            *unsigned int v25 = v28 + 1;
          }
        }

        while (v29 > 57);
      }
    }
  }

  *int v27 = 0;
  return a5;
}

int apr_snprintf(char *buf, apr_size_t len, const char *format, ...)
{
  int v4 = &buf[len - 1];
  if (len) {
    int v5 = buf;
  }
  else {
    int v5 = 0LL;
  }
  if (!len) {
    int v4 = 0LL;
  }
  c.curpos = v5;
  c.endpos = v4;
  va_copy(v8, va);
  int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &c, format, va);
  if (len) {
    *c.curpos = 0;
  }
  if (result == -1) {
    return len - 1;
  }
  return result;
}

uint64_t snprintf_flush()
{
  return 0xFFFFFFFFLL;
}

int apr_vsnprintf(char *buf, apr_size_t len, const char *format, va_list ap)
{
  int v4 = len;
  if (len)
  {
    v6.curpos = buf;
    v6.endpos = &buf[len - 1];
    int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
    *v6.curpos = 0;
  }

  else
  {
    v6.curpos = 0LL;
    v6.endpos = 0LL;
    int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
  }

  if (result == -1) {
    return v4 - 1;
  }
  return result;
}

char *__cdecl apr_pstrdup(apr_pool_t *p, const char *s)
{
  if (!s) {
    return 0LL;
  }
  apr_size_t v4 = strlen(s) + 1;
  int v5 = apr_palloc(p, v4);
  memcpy(v5, s, v4);
  return (char *)v5;
}

void *__cdecl apr_pmemdup(apr_pool_t *p, const void *m, apr_size_t n)
{
  if (!m) {
    return 0LL;
  }
  int v5 = apr_palloc(p, n);
  memcpy(v5, m, n);
  return v5;
}

char *__cdecl apr_pstrndup(apr_pool_t *p, const char *s, apr_size_t n)
{
  if (!s) {
    return 0LL;
  }
  apr_size_t v3 = n;
  apr_vformatter_buff_t v6 = memchr(s, 0, n);
  if (v6) {
    apr_size_t v3 = v6 - s;
  }
  unsigned int v7 = apr_palloc(p, v3 + 1);
  memcpy(v7, s, v3);
  *((_BYTE *)v7 + v3) = 0;
  return (char *)v7;
}

char *__cdecl apr_pstrmemdup(apr_pool_t *p, const char *s, apr_size_t n)
{
  if (!s) {
    return 0LL;
  }
  int v5 = apr_palloc(p, n + 1);
  memcpy(v5, s, n);
  *((_BYTE *)v5 + n) = 0;
  return (char *)v5;
}

char *apr_pstrcat(apr_pool_t *p, ...)
{
  __s = va_arg(va, char *);
  memset(v18, 0, sizeof(v18));
  va_copy(v16, va);
  uint64_t v2 = __s;
  if (__s)
  {
    int v3 = 0;
    uint64_t v4 = 0LL;
    int v5 = __s;
    do
    {
      size_t v6 = strlen(v5);
      if (v3 <= 5) {
        *((void *)v18 + v3++) = v6;
      }
      v4 += v6;
      unsigned int v7 = va_arg(v16, const char *);
      int v5 = v7;
    }

    while (v7);
    apr_size_t v8 = v4 + 1;
  }

  else
  {
    apr_size_t v8 = 1LL;
  }

  int v9 = (char *)apr_palloc(p, v8);
  double v10 = v9;
  va_copy(v17, va);
  double v11 = v9;
  if (__s)
  {
    int v12 = 0;
    double v11 = v9;
    do
    {
      if (v12 > 5) {
        size_t v13 = strlen(v2);
      }
      else {
        size_t v13 = *((void *)v18 + v12++);
      }
      memcpy(v11, v2, v13);
      v11 += v13;
      uint64_t v14 = (const char **)v17;
      v17 += 8;
      uint64_t v2 = *v14;
    }

    while (*v14);
  }

  *double v11 = 0;
  return v10;
}

char *__cdecl apr_pstrcatv(apr_pool_t *p, const iovec *vec, apr_size_t nvec, apr_size_t *nbytes)
{
  apr_size_t v4 = nvec;
  int v5 = vec;
  apr_size_t v6 = 0LL;
  if (nvec)
  {
    p_iov_len = &vec->iov_len;
    apr_size_t v8 = nvec;
    do
    {
      size_t v9 = *p_iov_len;
      p_iov_len += 2;
      v6 += v9;
      --v8;
    }

    while (v8);
  }

  if (nbytes) {
    *nbytes = v6;
  }
  double v10 = (char *)apr_palloc(p, v6 + 1);
  double v11 = v10;
  int v12 = v10;
  if (v4)
  {
    int v12 = v10;
    do
    {
      memcpy(v12, v5->iov_base, v5->iov_len);
      v12 += v5->iov_len;
      ++v5;
      --v4;
    }

    while (v4);
  }

  *int v12 = 0;
  return v11;
}

apr_status_t apr_strtoff(apr_off_t *offset, const char *buf, char **end, int base)
{
  *__error() = 0;
  *offset = strtol(buf, end, base);
  return *__error();
}

apr_int64_t apr_strtoi64(const char *buf, char **end, int base)
{
  *__error() = 0;
  return strtol(buf, end, base);
}

apr_int64_t apr_atoi64(const char *buf)
{
  *__error() = 0;
  return strtol(buf, 0LL, 10);
}

char *__cdecl apr_itoa(apr_pool_t *p, int n)
{
  int v3 = apr_palloc(p, 0xEuLL);
  if (n >= 0) {
    unsigned int v4 = n;
  }
  else {
    unsigned int v4 = -n;
  }
  v3[13] = 0;
  int v5 = v3 + 14;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAu;
  }

  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }

  return result;
}

char *__cdecl apr_ltoa(apr_pool_t *p, uint64_t n)
{
  int v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0) {
    unint64_t v4 = n;
  }
  else {
    unint64_t v4 = -n;
  }
  v3[25] = 0;
  int v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAuLL;
  }

  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }

  return result;
}

char *__cdecl apr_off_t_toa(apr_pool_t *p, apr_off_t n)
{
  int v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0) {
    unint64_t v4 = n;
  }
  else {
    unint64_t v4 = -n;
  }
  v3[25] = 0;
  int v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAuLL;
  }

  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }

  return result;
}

char *__cdecl apr_strfsize(apr_off_t size, char *buf)
{
  if (size < 0)
  {
    unint64_t v4 = "  - ";
LABEL_14:
    *(_DWORD *)buf = *(_DWORD *)v4;
    uint8_t buf[4] = v4[4];
    return buf;
  }

  if ((unint64_t)size >= 0x3CD)
  {
    int v5 = "";
    do
    {
      __int16 v6 = size;
      size = (unint64_t)size >> 10;
      ++v5;
    }

    while ((unint64_t)size > 0x3CC);
    unsigned int v7 = v6 & 0x3FF;
    else {
      int v3 = apr_snprintf(buf, 5uLL, "%3d%c");
    }
  }

  else
  {
    int v3 = apr_snprintf(buf, 5uLL, "%3d ");
  }

  if (v3 < 0)
  {
    unint64_t v4 = "****";
    goto LABEL_14;
  }

  return buf;
}

apr_status_t apr_initialize(void)
{
  if ((shared_initialized & 1) != 0) {
    return 0;
  }
  if (initialized++) {
    return 0;
  }
  proc_mutex_op_on = -65536;
  word_23A3A4 = 4096;
  proc_mutex_op_try = -65536;
  word_23A3AA = 6144;
  proc_mutex_op_off = 0x10000;
  word_23A3B0 = 4096;
  proc_mutex_lock_it = 0LL;
  unk_23A3C0 = 0LL;
  qword_23A3C8 = 0x300000000LL;
  proc_mutex_unlock_it = 0LL;
  *(void *)algn_23A3D8 = 0LL;
  qword_23A3E0 = 0x200000000LL;
  apr_status_t result = apr_pool_initialize();
  if (!result)
  {
    apr_status_t result = apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL);
    if (result) {
      return 20002;
    }
    else {
      *((void *)newpool + 10) = "apr_initialize";
    }
  }

  return result;
}

uint64_t apr_shared_initialize(uint64_t a1)
{
  if (!a1) {
    return 20002LL;
  }
  if (initialized) {
    return 20014LL;
  }
  uint64_t result = 0LL;
  shared_initialized = 1;
  apr_pools_initialized = 1;
  apr_pools_shared_initialized = 1;
  global_pool = a1;
  global_allocator = *(void *)(a1 + 48);
  return result;
}

void apr_terminate(void)
{
  if ((shared_initialized & 1) == 0 && !--initialized) {
    apr_pool_terminate();
  }
}

void apr_terminate2(void)
{
  if ((shared_initialized & 1) == 0 && !--initialized) {
    apr_pool_terminate();
  }
}

apr_status_t apr_proc_kill(apr_proc_t *proc, int sig)
{
  if (kill(proc->pid, sig) == -1) {
    return *__error();
  }
  else {
    return 0;
  }
}

apr_sigfunc_t *__cdecl apr_signal(int signo, apr_sigfunc_t *func)
{
  v4.__sigaction_u.__sa_handler = func;
  *(void *)&v4.sa_masuint64_t k = 0LL;
  if (sigaction(signo, &v4, &v3) < 0) {
    return (apr_sigfunc_t *)-1LL;
  }
  else {
    return v3.__sigaction_u.__sa_handler;
  }
}

const char *__cdecl apr_signal_description_get(int signum)
{
  if (signum < 0) {
    return "unknown signal (number)";
  }
  else {
    return sys_siglist[signum];
  }
}

apr_status_t apr_signal_thread(int (__cdecl *signal_handler)(int))
{
  sigset_t v4 = -1074077689;
  do
    sigwait(&v4, &v3);
  while (((unsigned int (*)(void))signal_handler)(v3) != 1);
  return 0;
}

apr_status_t apr_setup_signal_thread(void)
{
  sigset_t v1 = -1073749753;
  return pthread_sigmask(3, &v1, 0LL);
}

apr_status_t apr_signal_block(int signum)
{
  sigset_t v1 = 1 << (signum - 1);
  if (signum > 32) {
    sigset_t v1 = 0;
  }
  sigset_t v3 = v1;
  return pthread_sigmask(1, &v3, 0LL);
}

apr_status_t apr_signal_unblock(int signum)
{
  sigset_t v1 = 1 << (signum - 1);
  if (signum > 32) {
    sigset_t v1 = 0;
  }
  sigset_t v3 = v1;
  return pthread_sigmask(2, &v3, 0LL);
}

int apr_is_empty_array(const apr_array_header_t *a)
{
  return !a || a->nelts == 0;
}

apr_array_header_t *__cdecl apr_array_make(apr_pool_t *p, int nelts, int elt_size)
{
  __int16 v6 = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  if (nelts <= 1) {
    int v7 = 1;
  }
  else {
    int v7 = nelts;
  }
  apr_size_t v8 = (char *)apr_palloc(p, v7 * elt_size);
  size_t v9 = v8;
  if (v8) {
    bzero(v8, v7 * elt_size);
  }
  v6->elts = v9;
  v6->pool = p;
  v6->elt_size = elt_size;
  v6->int nelts = 0;
  v6->nalloapr_vformatter_buff_t c = v7;
  return v6;
}

void *apr_array_remove(uint64_t a1, int a2)
{
  uint64_t v2 = *(int *)(a1 + 8);
  uint64_t v3 = *(int *)(a1 + 12) - 1LL;
  *(_DWORD *)(a1 + 12) = v3;
  return memmove( (void *)(*(void *)(a1 + 24) + (int)v2 * (uint64_t)a2),  (const void *)(*(void *)(a1 + 24) + v2 + (int)v2 * (uint64_t)a2),  v2 * (v3 - a2));
}

void apr_array_clear(apr_array_header_t *arr)
{
  arr->int nelts = 0;
}

void *__cdecl apr_array_pop(void *arr)
{
  if (arr)
  {
    uint64_t v1 = *((int *)arr + 3);
    if ((_DWORD)v1)
    {
      uint64_t v2 = *((void *)arr + 3);
      uint64_t v3 = *((int *)arr + 2);
      uint64_t v4 = v1 - 1;
      *((_DWORD *)arr + 3) = v4;
      return (void *)(v2 + v4 * v3);
    }

    else
    {
      return 0LL;
    }
  }

  return arr;
}

void *__cdecl apr_array_push(apr_array_header_t *arr)
{
  int nelts = arr->nelts;
  if (nelts == arr->nalloc)
  {
    if (nelts < 1) {
      int v3 = 1;
    }
    else {
      int v3 = 2 * nelts;
    }
    elts = (char *)apr_palloc(arr->pool, arr->elt_size * (uint64_t)v3);
    memcpy(elts, arr->elts, arr->elt_size * (uint64_t)arr->nalloc);
    bzero(&elts[arr->elt_size * arr->nalloc], arr->elt_size * (v3 - arr->nalloc));
    arr->elts = elts;
    arr->nalloapr_vformatter_buff_t c = v3;
    int nelts = arr->nelts;
  }

  else
  {
    elts = arr->elts;
  }

  arr->int nelts = nelts + 1;
  return &elts[arr->elt_size * (uint64_t)nelts];
}

void apr_array_cat(apr_array_header_t *dst, const apr_array_header_t *src)
{
  int nelts = dst->nelts;
  int elt_size = dst->elt_size;
  int v6 = src->nelts;
  int v7 = v6 + nelts;
  nalloapr_vformatter_buff_t c = dst->nalloc;
  if (v6 + nelts <= nalloc)
  {
    elts = dst->elts;
  }

  else
  {
    int v9 = 2 * nalloc;
    if (nalloc < 1) {
      int v9 = 1;
    }
    do
    {
      int v10 = v9;
      v9 *= 2;
    }

    while (v7 > v10);
    double v11 = (char *)apr_palloc(dst->pool, v10 * elt_size);
    elts = v11;
    if (v11) {
      bzero(v11, v10 * elt_size);
    }
    memcpy(elts, dst->elts, dst->nalloc * (uint64_t)elt_size);
    dst->elts = elts;
    dst->nalloapr_vformatter_buff_t c = v10;
    int nelts = dst->nelts;
    int v6 = src->nelts;
  }

  memcpy(&elts[elt_size * (uint64_t)nelts], src->elts, v6 * elt_size);
  dst->nelts += src->nelts;
}

apr_array_header_t *__cdecl apr_array_copy(apr_pool_t *p, const apr_array_header_t *arr)
{
  uint64_t v4 = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  int elt_size = arr->elt_size;
  if (arr->nalloc <= 1) {
    nalloapr_vformatter_buff_t c = 1;
  }
  else {
    nalloapr_vformatter_buff_t c = arr->nalloc;
  }
  int v7 = (char *)apr_palloc(p, nalloc * elt_size);
  v4->elts = v7;
  v4->pool = p;
  v4->int elt_size = elt_size;
  v4->int nelts = 0;
  v4->nalloapr_vformatter_buff_t c = nalloc;
  memcpy(v7, arr->elts, arr->nelts * (uint64_t)arr->elt_size);
  int nelts = arr->nelts;
  v4->int nelts = nelts;
  bzero(&v4->elts[v4->elt_size * nelts], (v4->nalloc - nelts) * v4->elt_size);
  return v4;
}

apr_array_header_t *__cdecl apr_array_copy_hdr(apr_pool_t *p, const apr_array_header_t *arr)
{
  uint64_t result = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  result->pool = p;
  result->elts = arr->elts;
  *(void *)&result->int elt_size = *(void *)&arr->elt_size;
  result->nalloapr_vformatter_buff_t c = arr->nelts;
  return result;
}

apr_array_header_t *__cdecl apr_array_append( apr_pool_t *p, const apr_array_header_t *first, const apr_array_header_t *second)
{
  int v6 = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  v6->pool = p;
  v6->elts = first->elts;
  *(void *)&v6->int elt_size = *(void *)&first->elt_size;
  v6->nalloapr_vformatter_buff_t c = first->nelts;
  apr_array_cat(v6, second);
  return v6;
}

char *__cdecl apr_array_pstrcat(apr_pool_t *p, const apr_array_header_t *arr, const char sep)
{
  int nelts = arr->nelts;
  int v5 = nelts - 1;
  if (nelts >= 1)
  {
    elts = arr->elts;
    if (elts)
    {
      int v8 = sep;
      uint64_t v9 = 0LL;
      uint64_t v10 = sep != 0;
      while (1)
      {
        if (*(void *)elts) {
          v9 += strlen(*(const char **)elts);
        }
        if (!v5) {
          break;
        }
        v9 += v10;
        elts += 8;
        --v5;
      }

      int v12 = (char *)apr_palloc(p, v9 + 1);
      uint64_t v14 = arr->elts;
      int v15 = 1;
      double v11 = v12;
      if (v14)
      {
LABEL_12:
        if (*(void *)v14)
        {
          size_t v16 = strlen(*(const char **)v14);
          memcpy(v11, *(const void **)v14, v16);
          v11 += v16;
        }
      }

      while (v15 < arr->nelts)
      {
        if (v8) {
          *v11++ = v8;
        }
        v14 += 8;
        ++v15;
        if (v14) {
          goto LABEL_12;
        }
      }

      goto LABEL_9;
    }
  }

  double v11 = apr_palloc(p, 1uLL);
  int v12 = v11;
  if (v11) {
LABEL_9:
  }
    *double v11 = 0;
  return v12;
}

int apr_is_empty_table(const apr_table_t *t)
{
  return !t || *((_DWORD *)t + 3) == 0;
}

apr_table_t *__cdecl apr_table_make(apr_pool_t *p, int nelts)
{
  uint64_t v4 = apr_palloc(p, 0x128uLL);
  if (nelts <= 1) {
    int nelts = 1;
  }
  v4[3] = apr_palloc(p, (24 * nelts));
  void *v4 = p;
  v4[1] = 24LL;
  *((_DWORD *)v4 + 4) = nelts;
  *((_DWORD *)v4 + 8) = 0;
  return (apr_table_t *)v4;
}

apr_table_t *__cdecl apr_table_copy(apr_pool_t *p, const apr_table_t *t)
{
  uint64_t v4 = (char *)apr_palloc(p, 0x128uLL);
  else {
    int v5 = *((_DWORD *)t + 4);
  }
  int v6 = apr_palloc(p, (24 * v5));
  *((void *)v4 + 3) = v6;
  *(void *)uint64_t v4 = p;
  *((void *)v4 + 1) = 24LL;
  *((_DWORD *)v4 + 4) = v5;
  memcpy(v6, *((const void **)t + 3), 24LL * *((int *)t + 3));
  *((_DWORD *)v4 + 3) = *((_DWORD *)t + 3);
  __int128 v7 = *(_OWORD *)((char *)t + 100);
  __int128 v8 = *(_OWORD *)((char *)t + 116);
  __int128 v9 = *(_OWORD *)((char *)t + 132);
  *(_OWORD *)(v4 + 148) = *(_OWORD *)((char *)t + 148);
  *(_OWORD *)(v4 + 132) = v9;
  *(_OWORD *)(v4 + 116) = v8;
  *(_OWORD *)(v4 + 100) = v7;
  __int128 v10 = *(_OWORD *)((char *)t + 36);
  __int128 v11 = *(_OWORD *)((char *)t + 52);
  __int128 v12 = *(_OWORD *)((char *)t + 68);
  *(_OWORD *)(v4 + 84) = *(_OWORD *)((char *)t + 84);
  *(_OWORD *)(v4 + 68) = v12;
  *(_OWORD *)(v4 + 52) = v11;
  *(_OWORD *)(v4 + 36) = v10;
  __int128 v13 = *(_OWORD *)((char *)t + 180);
  __int128 v14 = *(_OWORD *)((char *)t + 196);
  __int128 v15 = *(_OWORD *)((char *)t + 212);
  *(_OWORD *)(v4 + 164) = *(_OWORD *)((char *)t + 164);
  *(_OWORD *)(v4 + 212) = v15;
  *(_OWORD *)(v4 + 196) = v14;
  *(_OWORD *)(v4 + 180) = v13;
  __int128 v16 = *(_OWORD *)((char *)t + 244);
  __int128 v17 = *(_OWORD *)((char *)t + 260);
  __int128 v18 = *(_OWORD *)((char *)t + 276);
  *(_OWORD *)(v4 + 228) = *(_OWORD *)((char *)t + 228);
  *(_OWORD *)(v4 + 260) = v17;
  *(_OWORD *)(v4 + 276) = v18;
  *(_OWORD *)(v4 + 244) = v16;
  *((_DWORD *)v4 + 8) = *((_DWORD *)t + 8);
  return (apr_table_t *)v4;
}

apr_table_t *__cdecl apr_table_clone(apr_pool_t *p, const apr_table_t *t)
{
  uint64_t v3 = *((void *)t + 3);
  uint64_t v4 = apr_table_make(p, *((_DWORD *)t + 3));
  if (*((int *)t + 3) >= 1)
  {
    uint64_t v5 = 0LL;
    int v6 = (const char **)(v3 + 8);
    do
    {
      apr_table_add(v4, *(v6 - 1), *v6);
      ++v5;
      v6 += 3;
    }

    while (v5 < *((int *)t + 3));
  }

  return v4;
}

void apr_table_add(apr_table_t *t, const char *key, const char *val)
{
  char v6 = *key;
  int v7 = *((_DWORD *)t + 3);
  __int128 v8 = (char *)t + 4 * (*key & 0x1F);
  *((_DWORD *)v8 + 41) = v7;
  int v9 = *((_DWORD *)t + 8);
  int v10 = 1 << v6;
  if ((v9 & v10) == 0)
  {
    *((_DWORD *)v8 + 9) = v7;
    *((_DWORD *)t + 8) = v9 | v10;
  }

  int v11 = *key;
  if (*key && (int v11 = (key[1] << 8) | (v11 << 16), key[1]))
  {
    int v12 = (v11 | key[2]) << 8;
    if (key[2]) {
      v12 |= key[3];
    }
  }

  else
  {
    int v12 = v11 << 8;
  }

  __int128 v13 = apr_array_push_noclear((uint64_t)t);
  apr_size_t v14 = strlen(key) + 1;
  __int128 v15 = apr_palloc(*(apr_pool_t **)t, v14);
  memcpy(v15, key, v14);
  *(void *)__int128 v13 = v15;
  *((void *)v13 + 1) = apr_pstrdup(*(apr_pool_t **)t, val);
  *((_DWORD *)v13 + 4) = v12 & 0xDFDFDFDF;
}

char *apr_array_push_noclear(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 == *(_DWORD *)(a1 + 16))
  {
    if (v2 < 1) {
      int v3 = 1;
    }
    else {
      int v3 = 2 * v2;
    }
    uint64_t v4 = (char *)apr_palloc(*(apr_pool_t **)a1, *(int *)(a1 + 8) * (uint64_t)v3);
    memcpy(v4, *(const void **)(a1 + 24), *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 16));
    *(void *)(a1 + 24) = v4;
    *(_DWORD *)(a1 + 16) = v3;
    int v2 = *(_DWORD *)(a1 + 12);
  }

  else
  {
    uint64_t v4 = *(char **)(a1 + 24);
  }

  *(_DWORD *)(a1 + 12) = v2 + 1;
  return &v4[*(int *)(a1 + 8) * (uint64_t)v2];
}

void apr_table_clear(apr_table_t *t)
{
  *((_DWORD *)t + 3) = 0;
  *((_DWORD *)t + 8) = 0;
}

const char *__cdecl apr_table_get(const apr_table_t *t, const char *key)
{
  if (!key) {
    return 0LL;
  }
  char v3 = *key;
  if (((*((_DWORD *)t + 8) >> *key) & 1) == 0) {
    return 0LL;
  }
  int v4 = v3;
  uint64_t v5 = v3 & 0x1F;
  if (v4 && (int v4 = (key[1] << 8) | (v4 << 16), key[1]))
  {
    int v6 = (v4 | key[2]) << 8;
    if (key[2]) {
      v6 |= key[3];
    }
  }

  else
  {
    int v6 = v4 << 8;
  }

  __int128 v8 = (char *)t + 4 * v5;
  int v9 = *((_DWORD *)v8 + 9);
  int v10 = *((_DWORD *)v8 + 41);
  if (v9 > v10) {
    return 0LL;
  }
  unsigned int v11 = v6 & 0xDFDFDFDF;
  uint64_t v12 = *((void *)t + 3);
  unint64_t v13 = v12 + 24LL * v10;
  unint64_t v14 = v12 + 24LL * v9;
  while (v11 != *(_DWORD *)(v14 + 16) || strcasecmp(*(const char **)v14, key))
  {
    v14 += 24LL;
    if (v14 > v13) {
      return 0LL;
    }
  }

  return *(const char **)(v14 + 8);
}

void apr_table_set(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }

  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }

  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    int v17 = *((_DWORD *)t + 3);
    *unint64_t v14 = v17;
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }

  int v15 = *v14;
  int v16 = *((_DWORD *)v13 + 41);
  int v17 = *((_DWORD *)t + 3);
  if (*v14 > v16)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = v17;
    int v22 = apr_array_push_noclear((uint64_t)t);
    apr_size_t v23 = strlen(key) + 1;
    uint64_t v24 = apr_palloc(*(apr_pool_t **)t, v23);
    memcpy(v24, key, v23);
    *(void *)int v22 = v24;
    *((void *)v22 + 1) = apr_pstrdup(*(apr_pool_t **)t, val);
    *((_DWORD *)v22 + 4) = v9;
    return;
  }

  uint64_t v18 = *((void *)t + 3);
  unint64_t v19 = v18 + 24LL * v16;
  unint64_t v20 = v18 + 24LL * v17;
  unint64_t v21 = v18 + 24LL * v15;
  while (v9 != *(_DWORD *)(v21 + 16) || strcasecmp(*(const char **)v21, key))
  {
    v21 += 24LL;
    if (v21 > v19) {
      goto LABEL_15;
    }
  }

  *(void *)(v21 + 8) = apr_pstrdup(*(apr_pool_t **)t, val);
  unint64_t v25 = v21 + 24;
  if (v21 + 24 > v19) {
    return;
  }
  unint64_t v26 = 0LL;
  int v27 = 0;
  do
  {
    while (1)
    {
      int v28 = *(_DWORD *)(v21 + 40);
      unint64_t v21 = v25;
      if (v9 == v28 && !strcasecmp(*(const char **)v25, key))
      {
        --*((_DWORD *)t + 3);
        if (!v26) {
          unint64_t v26 = v21;
        }
        goto LABEL_27;
      }

      if (!v26) {
        break;
      }
      __int128 v29 = *(_OWORD *)v21;
      *(void *)(v26 + 16) = *(void *)(v21 + 16);
      *(_OWORD *)unint64_t v26 = v29;
      v26 += 24LL;
      int v27 = 1;
LABEL_27:
      unint64_t v25 = v21 + 24;
      if (v21 + 24 > v19)
      {
        while (v25 < v20)
        {
          __int128 v30 = *(_OWORD *)v25;
          *(void *)(v26 + 16) = *(void *)(v25 + 16);
          *(_OWORD *)unint64_t v26 = v30;
          v26 += 24LL;
          v25 += 24LL;
        }

        goto LABEL_30;
      }
    }

    unint64_t v25 = v21 + 24;
  }

  while (v21 + 24 <= v19);
  if (!v27) {
    return;
  }
LABEL_30:
  table_reindex((uint64_t)t);
}

uint64_t table_reindex(uint64_t result)
{
  uint64_t v1 = *(char ***)(result + 24);
  *(_DWORD *)(result + 32) = 0;
  int v2 = *(_DWORD *)(result + 12);
  if (v2 >= 1)
  {
    int v3 = 0;
    for (int i = 0; i != v2; ++i)
    {
      char v5 = **v1;
      uint64_t v6 = result + 4LL * (v5 & 0x1F);
      *(_DWORD *)(v6 + 164) = i;
      int v7 = 1 << v5;
      if ((v7 & v3) == 0)
      {
        *(_DWORD *)(v6 + 36) = i;
        v3 |= v7;
        *(_DWORD *)(result + 32) = v3;
      }

      v1 += 3;
    }
  }

  return result;
}

void apr_table_setn(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }

  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }

  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    int v17 = *((_DWORD *)t + 3);
    *unint64_t v14 = v17;
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }

  int v15 = *v14;
  int v16 = *((_DWORD *)v13 + 41);
  int v17 = *((_DWORD *)t + 3);
  if (*v14 > v16)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = v17;
    int v22 = apr_array_push_noclear((uint64_t)t);
    *(void *)int v22 = key;
    *((void *)v22 + 1) = val;
    *((_DWORD *)v22 + 4) = v9;
    return;
  }

  uint64_t v18 = *((void *)t + 3);
  unint64_t v19 = v18 + 24LL * v16;
  unint64_t v20 = v18 + 24LL * v17;
  unint64_t v21 = v18 + 24LL * v15;
  while (v9 != *(_DWORD *)(v21 + 16) || strcasecmp(*(const char **)v21, key))
  {
    v21 += 24LL;
    if (v21 > v19) {
      goto LABEL_15;
    }
  }

  *(void *)(v21 + 8) = val;
  unint64_t v23 = v21 + 24;
  if (v21 + 24 > v19) {
    return;
  }
  unint64_t v24 = 0LL;
  int v25 = 0;
  do
  {
    while (1)
    {
      int v26 = *(_DWORD *)(v21 + 40);
      unint64_t v21 = v23;
      if (v9 == v26 && !strcasecmp(*(const char **)v23, key))
      {
        --*((_DWORD *)t + 3);
        if (!v24) {
          unint64_t v24 = v21;
        }
        goto LABEL_27;
      }

      if (!v24) {
        break;
      }
      __int128 v27 = *(_OWORD *)v21;
      *(void *)(v24 + 16) = *(void *)(v21 + 16);
      *(_OWORD *)unint64_t v24 = v27;
      v24 += 24LL;
      int v25 = 1;
LABEL_27:
      unint64_t v23 = v21 + 24;
      if (v21 + 24 > v19)
      {
        while (v23 < v20)
        {
          __int128 v28 = *(_OWORD *)v23;
          *(void *)(v24 + 16) = *(void *)(v23 + 16);
          *(_OWORD *)unint64_t v24 = v28;
          v24 += 24LL;
          v23 += 24LL;
        }

        goto LABEL_30;
      }
    }

    unint64_t v23 = v21 + 24;
  }

  while (v21 + 24 <= v19);
  if (!v25) {
    return;
  }
LABEL_30:
  table_reindex((uint64_t)t);
}

void apr_table_unset(apr_table_t *t, const char *key)
{
  char v2 = *key;
  if (((*((_DWORD *)t + 8) >> *key) & 1) != 0)
  {
    int v5 = v2;
    uint64_t v6 = v2 & 0x1F;
    if (v5 && (int v5 = (key[1] << 8) | (v5 << 16), key[1]))
    {
      int v7 = (v5 | key[2]) << 8;
      if (key[2]) {
        v7 |= key[3];
      }
    }

    else
    {
      int v7 = v5 << 8;
    }

    int v8 = (char *)t + 4 * v6;
    int v9 = *((_DWORD *)v8 + 9);
    int v10 = *((_DWORD *)v8 + 41);
    if (v9 <= v10)
    {
      unsigned int v11 = v7 & 0xDFDFDFDF;
      uint64_t v12 = *((void *)t + 3);
      unint64_t v13 = v12 + 24LL * v10;
      unint64_t v14 = v12 + 24LL * v9;
      while (v11 != *(_DWORD *)(v14 + 16) || strcasecmp(*(const char **)v14, key))
      {
        v14 += 24LL;
        if (v14 > v13) {
          return;
        }
      }

      int v15 = *((_DWORD *)t + 3);
      unint64_t v16 = v12 + 24LL * v15;
      *((_DWORD *)t + 3) = v15 - 1;
      for (int i = (__int128 *)(v14 + 24); (unint64_t)i <= v13; int i = (__int128 *)((char *)i + 24))
      {
        if (v11 == *((_DWORD *)i + 4) && !strcasecmp(*(const char **)i, key))
        {
          --*((_DWORD *)t + 3);
        }

        else
        {
          __int128 v18 = *i;
          *(void *)(v14 + 16) = *((void *)i + 2);
          *(_OWORD *)unint64_t v14 = v18;
          v14 += 24LL;
        }
      }

      while ((unint64_t)i < v16)
      {
        __int128 v19 = *i;
        *(void *)(v14 + 16) = *((void *)i + 2);
        *(_OWORD *)unint64_t v14 = v19;
        v14 += 24LL;
        int i = (__int128 *)((char *)i + 24);
      }

      table_reindex((uint64_t)t);
    }
  }

void apr_table_merge(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }

  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }

  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    *unint64_t v14 = *((_DWORD *)t + 3);
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }

  int v15 = *((_DWORD *)v13 + 41);
  if (*v14 > v15)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = *((_DWORD *)t + 3);
    __int128 v19 = apr_array_push_noclear((uint64_t)t);
    apr_size_t v20 = strlen(key) + 1;
    unint64_t v21 = apr_palloc(*(apr_pool_t **)t, v20);
    memcpy(v21, key, v20);
    *(void *)__int128 v19 = v21;
    *((void *)v19 + 1) = apr_pstrdup(*(apr_pool_t **)t, val);
    *((_DWORD *)v19 + 4) = v9;
    return;
  }

  uint64_t v16 = *((void *)t + 3);
  unint64_t v17 = v16 + 24LL * v15;
  unint64_t v18 = v16 + 24LL * *v14;
  while (v9 != *(_DWORD *)(v18 + 16) || strcasecmp(*(const char **)v18, key))
  {
    v18 += 24LL;
    if (v18 > v17) {
      goto LABEL_15;
    }
  }

  *(void *)(v18 + 8) = apr_pstrcat(*(apr_pool_t **)t, *(void *)(v18 + 8), ", ", val, 0LL);
}

void apr_table_mergen(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }

  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }

  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    *unint64_t v14 = *((_DWORD *)t + 3);
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }

  int v15 = *((_DWORD *)v13 + 41);
  if (*v14 > v15)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = *((_DWORD *)t + 3);
    __int128 v19 = apr_array_push_noclear((uint64_t)t);
    *(void *)__int128 v19 = key;
    *((void *)v19 + 1) = val;
    *((_DWORD *)v19 + 4) = v9;
    return;
  }

  uint64_t v16 = *((void *)t + 3);
  unint64_t v17 = v16 + 24LL * v15;
  unint64_t v18 = v16 + 24LL * *v14;
  while (v9 != *(_DWORD *)(v18 + 16) || strcasecmp(*(const char **)v18, key))
  {
    v18 += 24LL;
    if (v18 > v17) {
      goto LABEL_15;
    }
  }

  *(void *)(v18 + 8) = apr_pstrcat(*(apr_pool_t **)t, *(void *)(v18 + 8), ", ", val, 0LL);
}

void apr_table_addn(apr_table_t *t, const char *key, const char *val)
{
  char v5 = *key;
  int v6 = *((_DWORD *)t + 3);
  int v7 = (char *)t + 4 * (*key & 0x1F);
  *((_DWORD *)v7 + 41) = v6;
  int v8 = *((_DWORD *)t + 8);
  int v9 = 1 << v5;
  if ((v8 & v9) == 0)
  {
    *((_DWORD *)v7 + 9) = v6;
    *((_DWORD *)t + 8) = v8 | v9;
  }

  int v10 = *key;
  if (*key && (int v10 = (key[1] << 8) | (v10 << 16), key[1]))
  {
    int v11 = (v10 | key[2]) << 8;
    if (key[2]) {
      v11 |= key[3];
    }
  }

  else
  {
    int v11 = v10 << 8;
  }

  unsigned int v12 = v11 & 0xDFDFDFDF;
  unint64_t v13 = apr_array_push_noclear((uint64_t)t);
  *(void *)unint64_t v13 = key;
  *((void *)v13 + 1) = val;
  *((_DWORD *)v13 + 4) = v12;
}

apr_table_t *__cdecl apr_table_overlay(apr_pool_t *p, const apr_table_t *overlay, const apr_table_t *base)
{
  int v6 = (apr_array_header_t *)apr_palloc(p, 0x128uLL);
  v6->pool = p;
  v6->elts = (char *)*((void *)overlay + 3);
  *(void *)&v6->int elt_size = *((void *)overlay + 1);
  v6->nalloapr_vformatter_buff_t c = *((_DWORD *)overlay + 3);
  apr_array_cat(v6, (const apr_array_header_t *)base);
  table_reindex((uint64_t)v6);
  return (apr_table_t *)v6;
}

int apr_table_do(apr_table_do_callback_fn_t *comp, void *rec, const apr_table_t *t, ...)
{
  return apr_table_vdo(comp, rec, t, va);
}

int apr_table_vdo(apr_table_do_callback_fn_t *comp, void *rec, const apr_table_t *t, va_list vp)
{
  uint64_t v7 = *((void *)t + 3);
  va_list v29 = vp + 8;
  int v8 = *(char **)vp;
  int v26 = (void *)(v7 + 8);
  uint64_t v27 = v7 + 16;
  int v28 = 1;
  do
  {
    if (v8)
    {
      char v9 = *v8;
      if (((*((_DWORD *)t + 8) >> *v8) & 1) == 0) {
        goto LABEL_24;
      }
      int v10 = v9;
      if (v9 && (int v10 = (v8[1] << 8) | (v9 << 16), v8[1]))
      {
        int v11 = (v10 | v8[2]) << 8;
        if (v8[2]) {
          v11 |= v8[3];
        }
      }

      else
      {
        int v11 = v10 << 8;
      }

      unsigned int v16 = v11 & 0xDFDFDFDF;
      unint64_t v17 = (char *)t + 4 * (v9 & 0x1F);
      uint64_t v18 = *((int *)v17 + 9);
      __int128 v19 = (int *)(v17 + 164);
      apr_size_t v20 = (_DWORD *)(v27 + 24LL * (int)v18);
      uint64_t v21 = v18 - 1;
      int v22 = 1;
      while (++v21 <= *v19)
      {
        uint64_t v23 = *((void *)v20 - 2);
        v20 += 6;
        if (!v22) {
          goto LABEL_22;
        }
      }
    }

    else
    {
      int v12 = 1;
      uint64_t v13 = -1LL;
      unint64_t v14 = v26;
      while (++v13 < *((int *)t + 3))
      {
        uint64_t v15 = *(v14 - 1);
        if (v15) {
          int v12 = ((uint64_t (*)(void *, uint64_t, void))comp)(rec, v15, *v14);
        }
        v14 += 3;
        if (!v12)
        {
LABEL_22:
          int v28 = 0;
          break;
        }
      }
    }

    if (!v8) {
      return v28;
    }
LABEL_24:
    unint64_t v24 = (char **)v29;
    v29 += 8;
    int v8 = *v24;
  }

  while (*v24);
  return v28;
}

void apr_table_compress(apr_table_t *t, unsigned int flags)
{
  if (flags == 2) {
    return;
  }
  uint64_t v3 = *((unsigned int *)t + 3);
  char v5 = (const char ***)apr_palloc(*(apr_pool_t **)t, 8 * v3);
  int v6 = v5;
  uint64_t v7 = 0LL;
  int v8 = (const char **)*((void *)t + 3);
  signed int v9 = *((_DWORD *)t + 3);
  do
  {
    v5[v7] = v8;
    v8 += 3;
    ++v7;
  }

  while (v9 != (_DWORD)v7);
  unint64_t v10 = v9;
  int v11 = (const char ***)apr_palloc(*(apr_pool_t **)t, 8LL * v9);
  uint64_t v72 = t;
  unsigned int v71 = flags;
  int v12 = v11;
  uint64_t v13 = 0LL;
  do
  {
    unint64_t v14 = &v6[v13];
    uint64_t v15 = *v14;
    unsigned int v16 = v14[1];
    if (strcasecmp(**v14, *v16) >= 1)
    {
      v6[v13] = v16;
      v14[1] = v15;
    }

    unint64_t v17 = v13 + 3;
    v13 += 2LL;
  }

  while (v17 < v9);
  if (v9 < 3)
  {
LABEL_47:
    unint64_t v36 = v6;
    goto LABEL_48;
  }

  unint64_t v18 = 2LL;
  unint64_t v74 = v9;
  do
  {
    unint64_t v19 = 0LL;
    unint64_t v20 = v18;
    uint64_t v21 = v12;
    int v12 = v6;
    unint64_t v22 = 2 * v18;
    unint64_t v23 = v18;
    uint64_t v73 = v21;
    uint64_t v75 = 2 * v18;
    unint64_t v76 = v18;
    do
    {
      if (v22 >= v10) {
        unint64_t v24 = v10;
      }
      else {
        unint64_t v24 = v22;
      }
      unint64_t v25 = v23 + v20;
      if (v25 >= v10) {
        unint64_t v26 = v10;
      }
      else {
        unint64_t v26 = v25;
      }
      unint64_t v77 = v24;
      if (v19 == v23)
      {
        unint64_t v27 = v23;
LABEL_32:
        if (v27 >= v26) {
          goto LABEL_40;
        }
        unint64_t v33 = v77 - v27;
        vm_address_t v34 = &v12[v27];
        unint64_t v10 = v74;
        unint64_t v18 = v75;
        do
        {
          BOOL v35 = *v34++;
          *v21++ = v35;
          --v33;
        }

        while (v33);
      }

      else
      {
        unint64_t v27 = v23;
        unint64_t v28 = v19;
        while (v27 != v26)
        {
          va_list v29 = v12[v28];
          __int128 v30 = v12[v27];
          int v31 = strcasecmp(*v29, *v30);
          if (v31 >= 1) {
            double v32 = v30;
          }
          else {
            double v32 = v29;
          }
          if (v31 < 1) {
            ++v28;
          }
          if (v31 > 0) {
            ++v27;
          }
          *v21++ = v32;
          if (v28 == v23) {
            goto LABEL_32;
          }
        }

        if (v28 >= v23)
        {
LABEL_40:
          unint64_t v10 = v74;
          unint64_t v18 = v75;
          goto LABEL_41;
        }

        unint64_t v10 = v74;
        unint64_t v18 = v75;
        do
          *v21++ = v12[v28++];
        while (v28 < v23);
      }

LABEL_72:
    uint64_t v67 = *(__int128 **)(v43 + 24);
    unint64_t v68 = (unint64_t)v67 + 24 * *(int *)(v43 + 12);
    uint64_t v69 = v67;
    do
    {
      if (*(void *)v67)
      {
        __int128 v70 = *v67;
        *((void *)v69 + 2) = *((void *)v67 + 2);
        *uint64_t v69 = v70;
        uint64_t v69 = (__int128 *)((char *)v69 + 24);
      }

      uint64_t v67 = (__int128 *)((char *)v67 + 24);
    }

    while ((unint64_t)v67 < v68);
    *(_DWORD *)(v43 + 12) += 1431655765 * ((v68 - (unint64_t)v69) >> 3);
  }

LABEL_77:
  table_reindex(v43);
}

void apr_table_overlap(apr_table_t *a, const apr_table_t *b, unsigned int flags)
{
  int v3 = *((_DWORD *)a + 3);
  if (v3 + *((_DWORD *)b + 3))
  {
    apr_array_cat((apr_array_header_t *)a, (const apr_array_header_t *)b);
    if (v3)
    {
      uint64_t v7 = 0LL;
      int v8 = (_DWORD *)((char *)b + 164);
      signed int v9 = (_DWORD *)((char *)a + 164);
      do
      {
        if (((1 << v7) & *((_DWORD *)b + 8)) != 0)
        {
          *signed int v9 = *v8 + v3;
          if ((*((_DWORD *)a + 8) & (1 << v7)) == 0) {
            *(v9 - 32) = *(v8 - 32) + v3;
          }
        }

        ++v7;
        ++v8;
        ++v9;
      }

      while (v7 != 32);
      int v10 = *((_DWORD *)a + 8) | *((_DWORD *)b + 8);
    }

    else
    {
      __int128 v11 = *(_OWORD *)((char *)b + 36);
      __int128 v12 = *(_OWORD *)((char *)b + 52);
      __int128 v13 = *(_OWORD *)((char *)b + 68);
      *(_OWORD *)((char *)a + 84) = *(_OWORD *)((char *)b + 84);
      *(_OWORD *)((char *)a + 68) = v13;
      *(_OWORD *)((char *)a + 52) = v12;
      *(_OWORD *)((char *)a + 36) = v11;
      __int128 v14 = *(_OWORD *)((char *)b + 100);
      __int128 v15 = *(_OWORD *)((char *)b + 116);
      __int128 v16 = *(_OWORD *)((char *)b + 132);
      *(_OWORD *)((char *)a + 148) = *(_OWORD *)((char *)b + 148);
      *(_OWORD *)((char *)a + 132) = v16;
      *(_OWORD *)((char *)a + 116) = v15;
      *(_OWORD *)((char *)a + 100) = v14;
      __int128 v17 = *(_OWORD *)((char *)b + 244);
      __int128 v18 = *(_OWORD *)((char *)b + 260);
      __int128 v19 = *(_OWORD *)((char *)b + 276);
      *(_OWORD *)((char *)a + 228) = *(_OWORD *)((char *)b + 228);
      *(_OWORD *)((char *)a + 260) = v18;
      *(_OWORD *)((char *)a + 276) = v19;
      *(_OWORD *)((char *)a + 244) = v17;
      __int128 v20 = *(_OWORD *)((char *)b + 164);
      __int128 v21 = *(_OWORD *)((char *)b + 180);
      __int128 v22 = *(_OWORD *)((char *)b + 196);
      *(_OWORD *)((char *)a + 212) = *(_OWORD *)((char *)b + 212);
      *(_OWORD *)((char *)a + 196) = v22;
      *(_OWORD *)((char *)a + 180) = v21;
      *(_OWORD *)((char *)a + 164) = v20;
      int v10 = *((_DWORD *)b + 8);
    }

    *((_DWORD *)a + 8) = v10;
    apr_table_compress(a, flags);
  }

const char *__cdecl apr_table_getm(apr_pool_t *p, const apr_table_t *t, const char *key)
{
  int v6 = 0LL;
  arr = 0LL;
  reapr_vformatter_buff_t c = p;
  apr_table_do((apr_table_do_callback_fn_t *)table_getm_do, &rec, t, key, 0LL);
  uint64_t result = v6;
  if (v6)
  {
    if (arr) {
      return apr_array_pstrcat(p, arr, 44);
    }
  }

  return result;
}

uint64_t table_getm_do(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  char v5 = (void *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = *(apr_array_header_t **)(a1 + 16);
    if (!v7)
    {
      int v8 = *(apr_pool_t **)a1;
      signed int v9 = (apr_array_header_t *)apr_palloc(*(apr_pool_t **)a1, 0x20uLL);
      int v10 = (char *)apr_palloc(v8, 0x50uLL);
      if (v10)
      {
        *((_OWORD *)v10 + 3) = 0u;
        *((_OWORD *)v10 + 4) = 0u;
        *((_OWORD *)v10 + 1) = 0u;
        *((_OWORD *)v10 + 2) = 0u;
        *(_OWORD *)int v10 = 0u;
      }

      v9->elts = v10;
      v9->pool = v8;
      *(void *)&v9->int elt_size = 8LL;
      v9->nalloapr_vformatter_buff_t c = 10;
      *(void *)(a1 + 16) = v9;
      *(void *)apr_array_push(v9) = *(void *)(a1 + 8);
      uint64_t v7 = *(apr_array_header_t **)(a1 + 16);
    }

    char v5 = apr_array_push(v7);
  }

  void *v5 = a3;
  return 1LL;
}

apr_status_t apr_thread_mutex_create(apr_thread_mutex_t **mutex, unsigned int flags, apr_pool_t *pool)
{
  char v4 = flags;
  uint64_t v6 = (char *)apr_palloc(pool, 0x48uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 8) = 0u;
  }

  *(void *)uint64_t v6 = pool;
  if ((v4 & 1) != 0)
  {
    apr_status_t v8 = pthread_mutexattr_init(&v11);
    if (v8) {
      return v8;
    }
    int v9 = pthread_mutexattr_settype(&v11, 2);
    if (v9)
    {
      apr_status_t v8 = v9;
      pthread_mutexattr_destroy(&v11);
      return v8;
    }

    apr_status_t v8 = pthread_mutex_init((pthread_mutex_t *)(v7 + 8), &v11);
    pthread_mutexattr_destroy(&v11);
    if (v8) {
      return v8;
    }
    goto LABEL_5;
  }

  apr_status_t v8 = pthread_mutex_init((pthread_mutex_t *)(v6 + 8), 0LL);
  if (!v8)
  {
LABEL_5:
    apr_pool_cleanup_register( *(apr_pool_t **)v7,  v7,  (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup,  apr_pool_cleanup_null);
    apr_thread_mutex_t *mutex = (apr_thread_mutex_t *)v7;
  }

  return v8;
}

uint64_t thread_mutex_cleanup(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

apr_status_t apr_thread_mutex_lock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_trylock(apr_thread_mutex_t *mutex)
{
  apr_status_t result = pthread_mutex_trylock((pthread_mutex_t *)((char *)mutex + 8));
  if (result == 16) {
    return 70025;
  }
  return result;
}

apr_status_t apr_thread_mutex_unlock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_destroy(apr_thread_mutex_t *mutex)
{
  uint64_t v1 = (pthread_mutex_t *)((char *)mutex + 8);
  apr_pool_cleanup_kill(*(apr_pool_t **)mutex, mutex, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup);
  return pthread_mutex_destroy(v1);
}

apr_pool_t *__cdecl apr_thread_mutex_pool_get(const apr_thread_mutex_t *thethread_mutex)
{
  return *(apr_pool_t **)thethread_mutex;
}

apr_status_t apr_time_ansi_put(apr_time_t *result, time_t input)
{
  const char *result = 1000000 * input;
  return 0;
}

apr_time_t apr_time_now(void)
{
  return v1.tv_usec + 1000000 * v1.tv_sec;
}

apr_status_t apr_time_exp_tz(apr_time_exp_t *result, apr_time_t input, apr_int32_t offs)
{
  result->tm_gmtoff = offs;
  return 0;
}

double explode_time(uint64_t a1, uint64_t a2, int a3, int a4)
{
  time_t v8 = a2 / 1000000 + a3;
  *(_DWORD *)a1 = a2 % 1000000;
  if (a4) {
    localtime_r(&v8, &v9);
  }
  else {
    gmtime_r(&v8, &v9);
  }
  double result = *(double *)&v9.tm_sec;
  __int128 v6 = *(_OWORD *)&v9.tm_mon;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)&v9.tm_sec;
  *(_OWORD *)(a1 + 2explode_time((uint64_t)result, input, offs, 0) = v6;
  int tm_gmtoff = v9.tm_gmtoff;
  *(_DWORD *)(a1 + 36) = v9.tm_isdst;
  *(_DWORD *)(a1 + 4explode_time((uint64_t)result, input, offs, 0) = tm_gmtoff;
  return result;
}

apr_status_t apr_time_exp_gmt(apr_time_exp_t *result, apr_time_t input)
{
  time_t v5 = input / 1000000;
  result->tm_useapr_vformatter_buff_t c = input % 1000000;
  gmtime_r(&v5, &v6);
  __int128 v3 = *(_OWORD *)&v6.tm_mon;
  *(_OWORD *)&result->tm_seapr_vformatter_buff_t c = *(_OWORD *)&v6.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  *(void *)&result->tm_isdst = v6.tm_isdst;
  return 0;
}

apr_status_t apr_time_exp_lt(apr_time_exp_t *result, apr_time_t input)
{
  time_t v6 = input / 1000000;
  result->tm_useapr_vformatter_buff_t c = input % 1000000;
  localtime_r(&v6, &v7);
  __int128 v3 = *(_OWORD *)&v7.tm_mon;
  *(_OWORD *)&result->tm_seapr_vformatter_buff_t c = *(_OWORD *)&v7.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  apr_int32_t tm_gmtoff = v7.tm_gmtoff;
  result->tm_isdst = v7.tm_isdst;
  result->apr_int32_t tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_time_exp_get(apr_time_t *result, apr_time_exp_t *input)
{
  uint64_t tm_mon = input->tm_mon;
  int64_t v3 = input->tm_year - (unint64_t)(tm_mon < 2);
  int64_t v4 = v3 + 3;
  if (v3 >= 0) {
    int64_t v4 = input->tm_year - (unint64_t)(tm_mon < 2);
  }
  uint64_t v5 = 365 * v3 + (v4 >> 2) - v3 / 100;
  int v6 = v3 / 100 + 3;
  int v7 = v3 / 100 + 6;
  uint64_t v8 = input->tm_sec
     + 60
     * (input->tm_min
      + 60 * (input->tm_hour + 24 * (v5 + apr_time_exp_get_dayoffset[tm_mon] + input->tm_mday - 1 + (v7 >> 2))))
     - 2203891200LL;
  if (v8 < 0) {
    return 20004;
  }
  apr_status_t v9 = 0;
  const char *result = input->tm_usec + 1000000 * v8;
  return v9;
}

apr_status_t apr_time_exp_gmt_get(apr_time_t *result, apr_time_exp_t *input)
{
  apr_status_t v4 = apr_time_exp_get(result, input);
  if (!v4) {
    *result -= 1000000LL * input->tm_gmtoff;
  }
  return v4;
}

apr_status_t apr_os_imp_time_get(apr_os_imp_time_t **ostime, apr_time_t *aprtime)
{
  apr_time_t v2 = *aprtime / 1000000;
  int64_t v3 = *ostime;
  v3->tv_useapr_vformatter_buff_t c = *aprtime % 1000000;
  v3->__darwin_time_t tv_sec = v2;
  return 0;
}

apr_status_t apr_os_exp_time_get(apr_os_exp_time_t **ostime, apr_time_exp_t *aprtime)
{
  apr_time_t v2 = *ostime;
  *(_OWORD *)&v2->tm_seapr_vformatter_buff_t c = *(_OWORD *)&aprtime->tm_sec;
  *(_OWORD *)&v2->uint64_t tm_mon = *(_OWORD *)&aprtime->tm_mon;
  uint64_t tm_gmtoff = aprtime->tm_gmtoff;
  v2->tm_isdst = aprtime->tm_isdst;
  v2->uint64_t tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_os_imp_time_put(apr_time_t *aprtime, apr_os_imp_time_t **ostime, apr_pool_t *cont)
{
  *aprtime = (*ostime)->tv_usec + 1000000 * (*ostime)->tv_sec;
  return 0;
}

apr_status_t apr_os_exp_time_put(apr_time_exp_t *aprtime, apr_os_exp_time_t **ostime, apr_pool_t *cont)
{
  int64_t v3 = *ostime;
  *(_OWORD *)&aprtime->tm_seapr_vformatter_buff_t c = *(_OWORD *)&(*ostime)->tm_sec;
  *(_OWORD *)&aprtime->uint64_t tm_mon = *(_OWORD *)&v3->tm_mon;
  apr_int32_t tm_isdst = v3->tm_isdst;
  uint64_t tm_gmtoff = v3->tm_gmtoff;
  aprtime->apr_int32_t tm_isdst = tm_isdst;
  aprtime->uint64_t tm_gmtoff = tm_gmtoff;
  return 0;
}

void apr_sleep(apr_interval_time_t t)
{
  v1.tv_useapr_vformatter_buff_t c = t % 1000000;
  v1.__darwin_time_t tv_sec = t / 1000000;
  select(0, 0LL, 0LL, 0LL, &v1);
}

void *GTDataAppendBytes(void *result, const void *a2, size_t a3)
{
  int64_t v3 = result;
  uint64_t v4 = result[1];
  size_t v5 = v4 + a3;
  if (v4 + a3 <= result[2])
  {
    double result = memcpy((void *)(*result + v4), a2, a3);
    size_t v5 = v3[1] + a3;
  }

  v3[1] = v5;
  return result;
}

void GTDataIncreaseLength(void *a1, size_t a2)
{
  size_t v2 = a2;
  unint64_t v4 = a1[1];
  unint64_t v5 = a1[2];
  BOOL v6 = v5 > v4;
  size_t v7 = v5 - v4;
  if (v6)
  {
    uint64_t v8 = (void *)(*a1 + v4);
    if (v7 < a2) {
      a2 = v7;
    }
    bzero(v8, a2);
    unint64_t v4 = a1[1];
  }

  a1[1] = v4 + v2;
}

uint64_t get64u(void **a1)
{
  return *(*a1)++;
}

float get32f(float **a1)
{
  float result = **a1;
  *a1 += 2;
  return result;
}

double get64f(double **a1)
{
  return *(*a1)++;
}

const char *ReadDynamicBufferString(const char **a1)
{
  timeval v1 = *a1;
  *a1 += (strlen(*a1) & 0xFFFFFFFFFFFFFFF8LL) + 8;
  if (*v1) {
    return v1;
  }
  else {
    return 0LL;
  }
}

uint64_t ReadDynamicBufferData(uint64_t **a1)
{
  uint64_t v1 = **a1;
  if (v1) {
    uint64_t v2 = (uint64_t)(*a1 + 1);
  }
  else {
    uint64_t v2 = 0LL;
  }
  *a1 = (uint64_t *)((char *)*a1 + ((v1 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8);
  return v2;
}

const char *GTMessageKindAsString(int a1)
{
  if (a1 > 1791)
  {
    if (a1 <= 4095)
    {
      switch(a1)
      {
        case 2304:
          uint64_t v1 = "kDYMessageFSStreamInitializeTransfer";
          break;
        case 2305:
          uint64_t v1 = "kDYMessageFSStreamInitializeTransferAck";
          break;
        case 2306:
          uint64_t v1 = "kDYMessageFSStreamItemData";
          break;
        case 2307:
          uint64_t v1 = "kDYMessageFSStreamFinishedSending";
          break;
        case 2308:
          uint64_t v1 = "kDYMessageFSStreamFinishedSendingAck";
          break;
        case 2309:
          uint64_t v1 = "kDYMessageFSStreamAbort";
          break;
        default:
          switch(a1)
          {
            case 1792:
              uint64_t v1 = "kDYMessageTraceBufferedFstreamData";
              break;
            case 1793:
              uint64_t v1 = "kDYMessageTraceConfiguration";
              break;
            case 1794:
              uint64_t v1 = "kDYMessageTraceOverridesConfiguration";
              break;
            case 1795:
              uint64_t v1 = "kDYMessageTraceFlushBuffers";
              break;
            case 1796:
              uint64_t v1 = "kDYMessageTraceModeChanged";
              break;
            default:
LABEL_109:
              GTMessageKindAsString_str();
              uint64_t v1 = v2;
              snprintf(v2, 0x40uLL, "Unrecognized message: %d", v3);
              break;
          }

          break;
      }
    }

    else
    {
      switch(a1)
      {
        case 4096:
          return "kDYMessageReplayerAppReady";
        case 4097:
        case 4123:
        case 4124:
        case 4125:
        case 4126:
        case 4127:
        case 4128:
          goto LABEL_109;
        case 4098:
          return "kDYMessageReplayerReplayArchive";
        case 4099:
          return "kDYMessageReplayerExperimentResult";
        case 4100:
          return "kDYMessageReplayerReplayFinished";
        case 4101:
          return "kDYMessageReplayerSetBackgroundImage";
        case 4102:
          return "kDYMessageReplayerDeleteAllArchives";
        case 4103:
          return "kDYMessageReplayerBeginDebugArchive";
        case 4104:
          return "kDYMessageReplayerEndDebugArchive";
        case 4105:
          return "kDYMessageReplayerDebugStatus";
        case 4106:
          return "kDYMessageReplayerDebugFuncStop";
        case 4107:
          return "kDYMessageReplayerDebugEnableWireframePresent";
        case 4108:
          return "kDYMessageReplayerDebugEnableDrawCallPresent";
        case 4109:
          return "kDYMessageReplayerDebugWireframeLineWidth";
        case 4110:
          return "kDYMessageReplayerDebugWireframeLineColor";
        case 4111:
          return "kDYMessageReplayerDebugDisableFunctions";
        case 4112:
          return "kDYMessageReplayerDebugEnableFunctions";
        case 4113:
          return "kDYMessageReplayerSetBackgroundImageData";
        case 4114:
          return "kDYMessageReplayerLoadArchives";
        case 4115:
          return "kDYMessageReplayerQueryLoadedArchivesInfo";
        case 4116:
          return "kDYMessageReplayerArchivesDirectoryPath";
        case 4117:
          return "kDYMessageReplayerQueryShaderInfo";
        case 4118:
          return "kDYMessageReplayerDerivedCounterData";
        case 4119:
          return "kDYMessageReplayerGenerateThumbnails";
        case 4120:
          return "kDYMessageReplayerGenerateDependencyGraphThumbnails";
        case 4121:
          return "kDYMessageFetchResourceObjectBatch";
        case 4122:
          return "kDYMessageReplayerDebugEnableOutlinePresent";
        case 4129:
          return "kGTMessageReplayerResourcesUsedForFunctionIndex";
        default:
          if (a1 == 4353)
          {
            uint64_t v1 = "kGTMessageDiagnosticsReceivedData";
          }

          else
          {
            if (a1 != 4865) {
              goto LABEL_109;
            }
            uint64_t v1 = "kGTMessageRunnablePID";
          }

          break;
      }
    }
  }

  else if (a1 <= 1279)
  {
    if (a1 > 511)
    {
      switch(a1)
      {
        case 1024:
          uint64_t v1 = "kDYMessageCurrentDrawFramebufferImage";
          break;
        case 1025:
          uint64_t v1 = "kDYMessageFetchResourceList";
          break;
        case 1026:
          uint64_t v1 = "kDYMessageFetchResourceObject";
          break;
        case 1027:
          uint64_t v1 = "kDYMessageFetchState";
          break;
        case 1028:
          uint64_t v1 = "kDYMessageUpdateResourceObject";
          break;
        case 1029:
          uint64_t v1 = "kDYMessageClearResourceOverrides";
          break;
        case 1030:
          uint64_t v1 = "kDYGenerateShaderDebuggerTrace";
          break;
        default:
          if (a1 == 512)
          {
            uint64_t v1 = "kDYMessageBreakpoint";
          }

          else
          {
            if (a1 != 513) {
              goto LABEL_109;
            }
            uint64_t v1 = "kDYMessageBreakpointContinue";
          }

          break;
      }
    }

    else
    {
      uint64_t v1 = "kDYMessageCaptureStart";
      switch(a1)
      {
        case 256:
          return v1;
        case 257:
          uint64_t v1 = "kDYMessageCaptureStarted";
          break;
        case 258:
          uint64_t v1 = "kDYMessageCaptureData";
          break;
        case 259:
          uint64_t v1 = "kDYMessageCaptureCreateAlias";
          break;
        case 260:
          uint64_t v1 = "kDYMessageCaptureStop";
          break;
        case 262:
          uint64_t v1 = "kDYMessageCaptureDataReferenceCounts";
          break;
        case 263:
          uint64_t v1 = "kDYMessageCaptureSentAllData";
          break;
        case 264:
          uint64_t v1 = "kDYMessageCaptureActivateSession";
          break;
        case 265:
          uint64_t v1 = "kDYMessageCaptureInvalidateSession";
          break;
        case 266:
          uint64_t v1 = "kDYMessageCaptureSentUsedData";
          break;
        case 267:
          uint64_t v1 = "kDYMessageCaptureSentAllMetadata";
          break;
        case 271:
          uint64_t v1 = "kDYMessageCaptureDataChunk";
          break;
        default:
          goto LABEL_109;
      }
    }
  }

  else
  {
    switch(a1)
    {
      case 1280:
        uint64_t v1 = "kDYMessageLaunchGuestApp";
        break;
      case 1281:
        uint64_t v1 = "kDYMessageKillGuestApp";
        break;
      case 1282:
        uint64_t v1 = "kDYMessageGuestAppTerminated";
        break;
      case 1283:
        uint64_t v1 = "kDYMessageTerminateDaemon";
        break;
      case 1284:
        uint64_t v1 = "kDYMessageApplicationList";
        break;
      case 1285:
        uint64_t v1 = "kDYMessageApplicationIcon";
        break;
      case 1286:
        uint64_t v1 = "kDYMessageDaemonCreateGuestAppTransport";
        break;
      case 1287:
        uint64_t v1 = "kDYMessageMobileDaemonReloadUIServer";
        break;
      case 1288:
        uint64_t v1 = "kDYMessageSendGuestAppToBackground";
        break;
      case 1289:
        uint64_t v1 = "kDYMessageBringGuestAppToForeground";
        break;
      case 1290:
        uint64_t v1 = "kDYMessageGPUToolsVersionQuery";
        break;
      case 1291:
        uint64_t v1 = "kDYMessageMobileDaemonPosixSpawn";
        break;
      case 1292:
        uint64_t v1 = "kDYMessageDaemonRegisterInferior";
        break;
      case 1293:
        uint64_t v1 = "kDYDaemonResumeInferior";
        break;
      case 1294:
        uint64_t v1 = "kDYMessageDaemonDeviceCapabilities";
        break;
      case 1295:
        uint64_t v1 = "kDYMessageDaemonLaunchDebugServer";
        break;
      case 1296:
      case 1297:
        goto LABEL_109;
      case 1298:
        uint64_t v1 = "kDYMessageDeviceCompatibilityCapabilities";
        break;
      default:
        switch(a1)
        {
          case 1536:
            uint64_t v1 = "kDYMessageInferiorLaunched";
            break;
          case 1537:
            uint64_t v1 = "kDYMessageInferiorSignalInterposeSemaphore";
            break;
          case 1538:
            uint64_t v1 = "kDYMessageGuestAppCSSignature";
            break;
          case 1539:
            uint64_t v1 = "kDYMessageGuestAppTimebase";
            break;
          case 1540:
            uint64_t v1 = "kDYMessageGuestAppInvalidateSavePointerAliases";
            break;
          case 1541:
            uint64_t v1 = "kDYMessageGuestAppProfilingData";
            break;
          case 1542:
            uint64_t v1 = "kDYMessageGuestAppGLContextsInfo";
            break;
          case 1543:
            uint64_t v1 = "kDYMessageGuestAppCADisplayLinkEvent";
            break;
          case 1544:
            uint64_t v1 = "kDYMessageGuestAppMultitaskingSuspensionState";
            break;
          case 1545:
            uint64_t v1 = "kDYMessageGuestAppLockGraphics";
            break;
          case 1546:
            uint64_t v1 = "kDYMessageGuestAppUnlockGraphics";
            break;
          case 1547:
            uint64_t v1 = "kDYMessageGuestAppMTLCommandQueuesInfo";
            break;
          case 1548:
            uint64_t v1 = "kDYMessageGuestAppMTLCommandBuffersCaptured";
            break;
          case 1549:
            uint64_t v1 = "kDYMessageGuestAppMTLCaptureScopesInfo";
            break;
          case 1550:
            uint64_t v1 = "kDYMessageGuestAppCAMetalLayersInfo";
            break;
          case 1551:
            uint64_t v1 = "kDYMessageGuestAppMTLDevicesInfo";
            break;
          default:
            goto LABEL_109;
        }

        break;
    }
  }

  return v1;
}

const char *GTResourceTypeAsString(uint64_t a1)
{
  if (a1 <= 21)
  {
    if (a1 == 1) {
      return "Texture";
    }
    if (a1 == 2) {
      return "Buffer";
    }
  }

  else
  {
    switch(a1)
    {
      case 22LL:
        return "Threadgroup buffer";
      case 24LL:
        return "Indirect command buffer";
      case 39LL:
        return "Rasterization rate map";
    }
  }

  return "Resource";
}

char *GTFilePath_make(apr_pool_t *a1, const char *a2)
{
  return apr_pstrdup(a1, a2);
}

char *GTFilePath_append(uint64_t a1, uint64_t a2)
{
  float result = apr_pstrcat(*(apr_pool_t **)(a1 + 8), *(void *)a1, "/", a2, 0LL);
  *(void *)a1 = result;
  return result;
}

uint64_t GTFileSystem_open(const char *a1, int a2, uint64_t a3)
{
  return open(a1, a2, a3);
}

BOOL GTFile_isValid(int a1)
{
  return a1 >= 0;
}

BOOL GTFile_append(int a1, dispatch_data_t data)
{
  uint64_t v5 = 0LL;
  if (data && a1 != -1)
  {
    uint64_t v9 = v2;
    uint64_t v10 = v3;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = __GTFile_append_block_invoke;
    applier[3] = &__block_descriptor_36_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
    int v8 = a1;
    return dispatch_data_apply(data, applier);
  }

  return v5;
}

BOOL GTFile_write(int a1, uint64_t a2, dispatch_data_t data)
{
  uint64_t v5 = 0LL;
  if (data && a1 != -1)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = __GTFile_write_block_invoke;
    v7[3] = &__block_descriptor_44_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
    int v8 = a1;
    void v7[4] = a2;
    return dispatch_data_apply(data, v7);
  }

  return v5;
}

uint64_t GTFile_map(int a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x80000000) == 0)
  {
    uint64_t v6 = 0LL;
    while (1)
    {
      size_t v7 = (unint64_t)(a3 - v6) >= 0x100000 ? 0x100000LL : a3 - v6;
      ssize_t v8 = read(a1, (void *)(a2 + v6), v7);
      v6 += v8;
      if (v6 == a3) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t GTFile_close(_DWORD *a1)
{
  uint64_t result = *a1;
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *a1 = -1;
  }

  return result;
}

id GTFileSystem_move(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  id v17 = 0LL;
  unsigned __int8 v7 = [v4 moveItemAtPath:v5 toPath:v6 error:&v17];
  id v8 = v17;

  if ((v7 & 1) != 0)
  {
    id v9 = &dword_0 + 1;
  }

  else
  {

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    pthread_mutexattr_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));
    id v16 = 0LL;
    id v9 = [v10 replaceItemAtURL:v12 withItemAtURL:v14 backupItemName:0 options:0 resultingItemURL:0 error:&v16];
    id v8 = v16;
  }

  return v9;
}

id GTFileSystem_unlink(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  uint64_t v6 = 0LL;
  id v4 = [v2 removeItemAtPath:v3 error:&v6];

  return v4;
}

id GTFileSystem_symlink(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  uint64_t v9 = 0LL;
  id v7 = [v4 createSymbolicLinkAtPath:v5 withDestinationPath:v6 error:&v9];

  return v7;
}

id GTFileSystem_copy(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  uint64_t v9 = 0LL;
  id v7 = [v4 copyItemAtPath:v5 toPath:v6 error:&v9];

  return v7;
}

BOOL GTFileSystem_write(const char *a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = v3;
  BOOL v5 = 0LL;
  if (a1 && v3)
  {
    int v6 = open(a1, 1537, 420LL);
    if (v6 == -1)
    {
      BOOL v5 = 0LL;
    }

    else
    {
      int v7 = v6;
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = __GTFileSystem_write_block_invoke;
      applier[3] = &__block_descriptor_36_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
      int v10 = v6;
      BOOL v5 = dispatch_data_apply(v4, applier);
      close(v7);
    }
  }

  return v5;
}

id GTFileSystem_mkdir(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  uint64_t v8 = 0LL;
  id v6 = [v4 createDirectoryAtPath:v5 withIntermediateDirectories:a2 attributes:0 error:&v8];

  return v6;
}

char *gt_filepath_merge(const char *a1, const char *a2, apr_pool_t *a3)
{
  size_t v6 = strlen(a1);
  size_t v7 = strlen(a2);
  size_t v8 = v7;
  if (v6 && a1[v6 - 1] == 47) {
    --v6;
  }
  uint64_t v9 = (char *)apr_palloc(a3, v7 + v6 + 2);
  memcpy(v9, a1, v6);
  v9[v6] = 47;
  memcpy(&v9[v6 + 1], a2, v8);
  v9[v8 + 1 + v6] = 0;
  return v9;
}

ssize_t gt_read_full(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  do
  {
    else {
      size_t v7 = a3 - v6;
    }
    ssize_t result = read(a1, (void *)(a2 + v6), v7);
    if (result == -1) {
      ssize_t v9 = 0LL;
    }
    else {
      ssize_t v9 = result;
    }
    v6 += v9;
  }

  while (result != -1 && v6 != a3);
  return result;
}

ssize_t gt_write_full(int __fd, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  do
  {
    else {
      size_t v7 = a3 - v6;
    }
    ssize_t result = write(__fd, (const void *)(a2 + v6), v7);
    if (result == -1) {
      ssize_t v9 = 0LL;
    }
    else {
      ssize_t v9 = result;
    }
    v6 += v9;
  }

  while (result != -1 && v6 != a3);
  return result;
}

uint64_t gt_file_copy(const char *a1, const char *a2)
{
  int v3 = open(a1, 0);
  int v4 = creat(a2, 0x1B0u);
  unint64_t v5 = lseek(v3, 0LL, 2);
  lseek(v3, 0LL, 0);
  if (v5)
  {
    for (unint64_t i = 0LL; i < v5; i += v8)
    {
      if (v5 - i >= 0x2000) {
        size_t v7 = 0x2000LL;
      }
      else {
        size_t v7 = v5 - i;
      }
      ssize_t v8 = read(v3, v15, v7);
      uint64_t v9 = 0LL;
      do
      {
        else {
          size_t v10 = v8 - v9;
        }
        ssize_t v11 = write(v4, &v15[v9], v10);
        if (v11 == -1) {
          ssize_t v12 = 0LL;
        }
        else {
          ssize_t v12 = v11;
        }
        v9 += v12;
      }

      while (v11 != -1 && v9 != v8);
    }
  }

  close(v3);
  return close(v4);
}

id gt_default_log()
{
  uint64_t v0 = s_defaultLog;
  if (s_defaultLog == &_os_log_default)
  {
    if (gt_default_log_onceToken != -1) {
      dispatch_once(&gt_default_log_onceToken, &__block_literal_global_14270);
    }
    uint64_t v0 = s_defaultLog;
  }

  return v0;
}

void __gt_default_log_block_invoke(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead",  v1,  2u);
  }

id gt_tagged_log(unint64_t a1)
{
  if (s_logCount <= a1)
  {
    if (s_logUsingOsLog)
    {
      id v5 = gt_default_log();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v12 = a1;
        _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "fail: Invalid log tag: %llu", buf, 0xCu);
      }
    }

    else
    {
      size_t v7 = __stderrp;
      id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"fail: Invalid log tag: %llu", a1));
      fprintf(v7, "%s\n", (const char *)[v8 UTF8String]);
    }

    id v4 = &_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    __copy_constructor_8_8_s0_s8_s16_s24(buf, (id *)(s_logs + 32 * a1));
    int v2 = GTCoreLog_enabled((uint64_t)buf);
    int v3 = v13;
    if (!v2) {
      int v3 = &_os_log_disabled;
    }
    id v4 = v3;
    __destructor_8_s0_s8_s16_s24((id *)buf);
  }

  return v4;
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t GTCoreLog_enabled(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 1LL;
  }
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 BOOLForKey:*(void *)(a1 + 16)];

  return (uint64_t)v3;
}

void __destructor_8_s0_s8_s16_s24(id *a1)
{
}

uint64_t GTCoreLogUseOsLog()
{
  return s_logUsingOsLog;
}

void GTCoreLogInit(const char *a1, uint64_t a2, int a3)
{
  if (s_defaultLog == &_os_log_default)
  {
    size_t v7 = a1;
    os_log_t v8 = os_log_create(a1, "");
    id v9 = s_defaultLog;
    s_defaultLog = v8;

    size_t v10 = &unk_23A000;
    s_logs = (uint64_t)calloc(a3, 0x20uLL);
    s_logCount = a3;
    if (a3 >= 1)
    {
      ssize_t v11 = 0LL;
      unint64_t v12 = a3;
      uint64_t v13 = a2 + 8;
      uint64_t v14 = 16LL;
      __int128 v15 = &CACurrentMediaTime_ptr;
      id v38 = (id)v12;
      do
      {
        id v16 = *(const char **)v13;
        if (v11 == *(char **)(v13 - 8))
        {
          id v17 = v7;
          uint64_t v18 = *(unsigned __int8 *)(v13 + 8);
          uint64_t v19 = v10[129];
          uint64_t v20 = v19 + v14;
          __int128 v21 = v17;
          uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15[243], "stringWithUTF8String:"));
          unint64_t v23 = *(void **)(v19 + v14 - 16);
          *(void *)(v20 - 16) = v22;

          uint64_t v24 = objc_claimAutoreleasedReturnValue([v15[243] stringWithUTF8String:v16]);
          unint64_t v25 = *(void **)(v19 + v14 - 8);
          *(void *)(v20 - 8) = v24;

          if (v18)
          {
            uint64_t v26 = objc_claimAutoreleasedReturnValue( [v15[243] stringWithFormat:@"%@.%@.enableLog", *(void *)(v20 - 16), *(void *)(v20 - 8)]);
            unint64_t v27 = *(void **)(v19 + v14);
            *(void *)(v19 + v14) = v26;
          }

          else
          {
            unint64_t v27 = *(void **)(v19 + v14);
            *(void *)(v19 + v14) = 0LL;
          }

          size_t v7 = v21;
          os_log_t v30 = os_log_create(v21, v16);
          int v31 = *(void **)(v19 + v14 + 8);
          *(void *)(v19 + v14 + 8) = v30;

          GTCoreLog_enabled(v20 - 16);
          size_t v10 = (void *)&unk_23A000;
          unint64_t v12 = (unint64_t)v38;
          __int128 v15 = &CACurrentMediaTime_ptr;
        }

        else
        {
          if (s_logUsingOsLog)
          {
            id v28 = gt_default_log();
            va_list v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              vm_address_t v41 = v16;
              __int16 v42 = 1024;
              int v43 = (int)v11;
              _os_log_error_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT",  buf,  0x12u);
            }
          }

          else
          {
            double v32 = __stderrp;
            va_list v29 = (os_log_s *) objc_claimAutoreleasedReturnValue( objc_msgSend( v15[243], "stringWithFormat:", @"warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", v16, v11));
            fprintf(v32, "%s\n", (const char *)-[os_log_s UTF8String](v29, "UTF8String"));
          }

          objc_storeStrong((id *)(v10[129] + v14 + 8), &_os_log_default);
        }

        ++v11;
        v14 += 32LL;
        v13 += 24LL;
      }

      while ((char *)v12 != v11);
    }

    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v34 = [v33 BOOLForKey:@"GPUToolsPerfLogging"];

    if ((v34 & 1) != 0)
    {
      os_log_t v35 = os_log_create(v7, "");
      unint64_t v36 = g_signpostLog;
      g_signpostLog = v35;
    }
  }

  else if (s_logUsingOsLog)
  {
    id v3 = gt_default_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      vm_address_t v41 = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "warning: %s", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v37 = __stderrp;
    id v39 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"warning: %s", "Log already initialized, did you call GTCoreLogInit twice?"));
    fprintf(v37, "%s\n", (const char *)[v39 UTF8String]);
  }

uint64_t GTCoreLogTagEnabled(unint64_t a1)
{
  if (s_logCount <= a1) {
    return 0LL;
  }
  __copy_constructor_8_8_s0_s8_s16_s24(v3, (id *)(s_logs + 32 * a1));
  uint64_t v1 = GTCoreLog_enabled((uint64_t)v3);
  __destructor_8_s0_s8_s16_s24(v3);
  return v1;
}

uint64_t GTCoreLogUseStandardOutputStreams(uint64_t result)
{
  s_logUsingOsLog = result ^ 1;
  return result;
}

uint64_t GTCorePlatformGet()
{
  return 3LL;
}

BOOL GTCorePlatform_isTranslated()
{
  int v3 = 0;
  size_t v2 = 4LL;
  if (sysctlbyname("sysctl.proc_translated", &v3, &v2, 0LL, 0LL)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = v3 == 0;
  }
  return !v0;
}

uint64_t GTCorePlatform_isInternal()
{
  return os_variant_has_internal_content(0LL);
}

id GTCorePlatform_isCatalyst()
{
  BOOL v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v1 = [v0 isMacCatalystApp];

  return v1;
}

id GTCorePlatform_isAlmond()
{
  BOOL v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v1 = [v0 isiOSAppOnMac];

  return v1;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 hasPrefix:@"kDYFE"])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:5]);

      uint64_t v6 = (void *)v7;
    }

    id v8 = [v6 rangeOfString:@"_"];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"_",  @" ",  0,  v8,  v9));

      uint64_t v6 = (void *)v10;
    }

    ssize_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"_" withString:@":"]);

    unint64_t v12 = @"-";
    if (a2) {
      unint64_t v12 = @"+";
    }
    uint64_t v13 = &stru_20FCB8;
    if (a3) {
      uint64_t v13 = @":";
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@%@]",  v12,  v11,  v13));
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

void GTError_initialize()
{
  if (GTError_initialize_onceToken != -1) {
    dispatch_once(&GTError_initialize_onceToken, &__block_literal_global_14376);
  }
}

void GTError_addError(int *a1, uint64_t a2)
{
  if (a1 && *(_DWORD *)(a2 + 4))
  {
    if (GTError_initialize_onceToken != -1) {
      dispatch_once(&GTError_initialize_onceToken, &__block_literal_global_14376);
    }
    if (a1[1])
    {
      int v4 = *(_DWORD *)a2 | *a1 | 2;
    }

    else
    {
      int v5 = *a1;
      __int128 v7 = *(_OWORD *)(a2 + 16);
      __int128 v6 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v7;
      *((_OWORD *)a1 + 2) = v6;
      int v4 = *a1 | v5;
    }

    *a1 = v4;
  }

const char *GTError_description(uint64_t a1)
{
  if (!a1) {
    return "";
  }
  uint64_t v1 = a1;
  if (GTError_initialize_onceToken != -1) {
    dispatch_once(&GTError_initialize_onceToken, &__block_literal_global_14376);
  }
  size_t v2 = "";
  do
  {
    int v3 = *(_DWORD *)(v1 + 4);
    int v4 = (apr_pool_t *)s_errorPool;
    if (v3 == 500)
    {
      int v5 = apr_pstrcat((apr_pool_t *)s_errorPool, v2, "Assertion failed: ", *(void *)(v1 + 8), 0LL);
    }

    else
    {
      __int128 v7 = apr_itoa((apr_pool_t *)s_errorPool, v3);
      int v5 = apr_pstrcat(v4, v2, "Code: ", v7, 0LL);
    }

    size_t v2 = v5;
    uint64_t v1 = *(void *)(v1 + 40);
  }

  while (v1);
  return v2;
}

uint64_t __GLOBAL_init_65535()
{
  return __cxa_atexit((void (*)(void *))CaptureExit, 0LL, &dword_0);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:");
}

id objc_msgSend_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:desti nationLevel:destinationOrigin:");
}

id objc_msgSend_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:desti nationLevel:destinationOrigin:options:");
}

id objc_msgSend_copyFromLinearBytes_linearOffset_linearBytesPerRow_linearBytesPerImage_toTextureMemory_textureSlice_textureLevel_textureRegion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:toTextureMemory:textureSlice:textureLe vel:textureRegion:");
}

id objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPe rRow:destinationBytesPerImage:");
}

id objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPe rRow:destinationBytesPerImage:options:");
}

id objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:d estinationOrigin:");
}

id objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:d estinationOrigin:options:");
}

id objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:");
}

id objc_msgSend_copyFromTextureMemory_textureSlice_textureLevel_textureRegion_toLinearBytes_linearOffset_linearBytesPerRow_linearBytesPerImage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTextureMemory:textureSlice:textureLevel:textureRegion:toLinearBytes:linearOffset:linearBytesPerRow:li nearBytesPerImage:");
}

id objc_msgSend_deserializeInstanceAccelerationStructure_fromBytes_primitiveAccelerationStructures_withDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:");
}

id objc_msgSend_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:");
}

id objc_msgSend_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:");
}

id objc_msgSend_deserializeInstanceAccelerationStructureFromBytes_primitiveAccelerationStructures_withDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:");
}

id objc_msgSend_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:");
}

id objc_msgSend_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:");
}

id objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:");
}

id objc_msgSend_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOff set:indirectBuffer:indirectBufferOffset:");
}

id objc_msgSend_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:cont rolPointIndexBufferOffset:instanceCount:baseInstance:");
}

id objc_msgSend_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:cont rolPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset: tessellationFactorBufferInstanceStride:");
}

id objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:");
}

id objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:");
}

id objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:");
}

id objc_msgSend_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:");
}

id objc_msgSend_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
}

id objc_msgSend_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
}

id objc_msgSend_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:");
}

id objc_msgSend_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:");
}

id objc_msgSend_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessella tionFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:");
}

id objc_msgSend_dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex_withDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:");
}

id objc_msgSend_dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex_withMeshDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withMeshDescriptor:");
}

id objc_msgSend_dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex_withDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:withDescriptor:");
}

id objc_msgSend_getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:");
}

id objc_msgSend_isVendorSliceCompatibleWithDeploymentTarget_platform_sdkVersion_compilerPluginVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVendorSliceCompatibleWithDeploymentTarget:platform:sdkVersion:compilerPluginVersion:");
}

id objc_msgSend_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:");
}

id objc_msgSend_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:des tinationLevel:destinationOrigin:");
}

id objc_msgSend_newRenderPipelineStateWithAdditionalBinaryFunctions_fragmentAdditionalBinaryFunctions_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:");
}

id objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_resourceIndex_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:");
}

id objc_msgSend_newTileRenderPipelineDescriptorWithSerializedData_deserializationContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTileRenderPipelineDescriptorWithSerializedData:deserializationContext:");
}

id objc_msgSend_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:");
}

id objc_msgSend_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:");
}

id objc_msgSend_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDeserializedAccelerationStructureSize:serializedOffset:toBuffer:sizeBufferOffset:");
}

id objc_msgSend_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "writeDeserializedPrimitiveAccelerationStructureSizes:serializedOffset:toBuffer:sizesBufferOffset:");
}