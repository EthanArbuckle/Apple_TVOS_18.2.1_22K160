void asan::ReportGenerator::createReport( uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v7;
  const char *v8;
  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  bzero((void *)(a4 + 48), 0x470uLL);
  *(void *)(a4 + 40) = a3[2];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)a3;
  *(void *)(a4 + 1184) = 3LL;
  *(void *)(a4 + 1192) = (**(uint64_t (***)(uint64_t))*a1)(*a1);
  v7 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)*a1 + 104LL))(*a1, *a3, a3[1]);
  switch(v7)
  {
    case 233:
    case 250:
      *(_DWORD *)(a4 + 48) = 6;
      *(void *)(a4 + 56) = "unimplemented";
      *(void *)(a4 + 64) = "unimplemented";
      break;
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 240:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
      break;
    case 241:
      *(_DWORD *)(a4 + 48) = 5;
      v8 = "stack-buffer-underflow";
      goto LABEL_6;
    case 242:
    case 243:
      *(_DWORD *)(a4 + 48) = 4;
      v8 = "stack-buffer-overflow";
LABEL_6:
      *(void *)(a4 + 56) = v8;
      asan::ReportGenerator::fillStackVarInfo(a1, a4);
      break;
    case 249:
      asan::ReportGenerator::addGlobalBufferOverflowInfo((uint64_t)a1, a4);
      break;
    case 251:
      asan::ReportGenerator::addHeapBufferOverflowInfo(a1, a4);
      break;
    case 252:
    case 253:
      asan::ReportGenerator::addUseAfterFreeInfo(a1, a4);
      break;
    default:
      if (!v7) {
        asan::ReportGenerator::createReport();
      }
      return;
  }

  if (!*(_DWORD *)(a4 + 48))
  {
    *(void *)(a4 + 56) = "corrupted shadow";
    *(void *)(a4 + 64) = "corrupted shadow";
  }
}

uint64_t asan::ReportGenerator::addHeapBufferOverflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 3;
  *(void *)(a2 + 56) = "heap-buffer-overflow";
  *(void *)(a2 + 64) = "heap";
  uint64_t v4 = *a1;
  __int128 v11 = *(_OWORD *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, __int128 *))(*(void *)v4 + 56LL))(v4, &v11);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    asan::ReportGenerator::addHeapBufferOverflowInfo();
  }
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  bzero((void *)(a2 + 105), 0x437uLL);
  *(void *)(a2 + 88) = v8;
  *(void *)(a2 + 96) = v9;
  *(_BYTE *)(a2 + 104) = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a1[1])(a1[1], v8, a2 + 112, a2 + 648);
}

uint64_t asan::ReportGenerator::addUseAfterFreeInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 1;
  *(void *)(a2 + 56) = "heap-use-after-free";
  *(void *)(a2 + 64) = "heap";
  uint64_t v4 = *a1;
  __int128 v11 = *(_OWORD *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, __int128 *))(*(void *)v4 + 56LL))(v4, &v11);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    asan::ReportGenerator::addUseAfterFreeInfo();
  }
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  bzero((void *)(a2 + 105), 0x437uLL);
  *(void *)(a2 + 88) = v8;
  *(void *)(a2 + 96) = v9;
  *(_BYTE *)(a2 + 104) = 1;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a1[1])(a1[1], v8, a2 + 112, a2 + 648);
}

void asan::ReportGenerator::addGlobalBufferOverflowInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 2;
  *(void *)(a2 + 56) = "global-buffer-overflow";
  *(void *)(a2 + 64) = "global";
  uint64_t v3 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 8LL))( *(void *)(a1 + 16),  *(void *)(a2 + 24));
  if (!v3) {
    asan::ReportGenerator::addGlobalBufferOverflowInfo();
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = *(void *)(v3 + 24);
  *(void *)(a2 + 72) = v5;
  *(void *)(a2 + 80) = v4 - 1;
  *(_OWORD *)(a2 + 88) = *(_OWORD *)v3;
  bzero((void *)(a2 + 104), 0x438uLL);
}

void asan::ReportGenerator::addStackBufferOverflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 4;
  *(void *)(a2 + 56) = "stack-buffer-overflow";
  asan::ReportGenerator::fillStackVarInfo(a1, a2);
}

void asan::ReportGenerator::addStackBufferUnderflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 5;
  *(void *)(a2 + 56) = "stack-buffer-underflow";
  asan::ReportGenerator::fillStackVarInfo(a1, a2);
}

void asan::ReportGenerator::fillStackVarInfo(uint64_t *a1, uint64_t a2)
{
  *(void *)(a2 + 64) = "stack";
  uint64_t v3 = *a1;
  __int128 v12 = *(_OWORD *)(a2 + 24);
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, __int128 *))(*(void *)v3 + 56LL))(v3, &v12);
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    asan::ReportGenerator::fillStackVarInfo();
  }
  uint64_t v7 = v4;
  asan::ReportGenerator::StackVar::getStackVar( *(asan::ReportGenerator::StackVar **)(v4 + 8),  (const char *)(*(void *)(a2 + 24) - v4),  v11);
  unint64_t v8 = v11[0];
  if (!v11[0]) {
    asan::ReportGenerator::fillStackVarInfo();
  }
  unint64_t v9 = v11[3];
  *(void *)(a2 + 72) = v11[2];
  *(void *)(a2 + 80) = v9;
  bzero((void *)(a2 + 105), 0x437uLL);
  unint64_t v10 = v11[1];
  *(void *)(a2 + 88) = v8 + v7;
  *(void *)(a2 + 96) = v10;
  *(_BYTE *)(a2 + 104) = 0;
}

unint64_t asan::ReportGenerator::StackVar::getStackVar@<X0>( asan::ReportGenerator::StackVar *this@<X0>, const char *a2@<X1>, unint64_t *a3@<X8>)
{
  __endptr = (char *)this;
  unint64_t v5 = strtoul((const char *)this, &__endptr, 10);
  if (!v5) {
    asan::ReportGenerator::StackVar::getStackVar();
  }
  unint64_t v6 = v5;
  unint64_t result = asan::ReportGenerator::StackVar::parse((const char **)&__endptr, a3);
  unint64_t v8 = v6 - 1;
  if (v6 != 1 && a3[1] + *a3 < (unint64_t)a2)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = v6 - 2;
    do
    {
      if (v8 == v9) {
        break;
      }
      unint64_t result = asan::ReportGenerator::StackVar::parse((const char **)&__endptr, a3);
      if (v10 == v9) {
        break;
      }
      ++v9;
    }

    while (a3[1] + *a3 < (unint64_t)a2);
  }

  return result;
}

unint64_t asan::ReportGenerator::StackVar::parse@<X0>( const char **__endptr@<X0>, unint64_t *a2@<X8>)
{
  a2[4] = 0LL;
  *a2 = strtoul(*__endptr, (char **)__endptr, 10);
  a2[1] = strtoul(*__endptr, (char **)__endptr, 10);
  unint64_t result = strtoul(*__endptr, (char **)__endptr, 10);
  unint64_t v6 = 0LL;
  uint64_t v7 = *__endptr;
  unint64_t v8 = (char *)(*__endptr + 1);
  while (1)
  {
    uint64_t v9 = (char *)&v7[v6 + 1];
    char *__endptr = v9;
    unsigned int v10 = *v9;
    if (v10 <= 0x3A && ((1LL << v10) & 0x400000100000001LL) != 0) {
      break;
    }
    ++v6;
  }

  a2[2] = (unint64_t)v8;
  a2[3] = v6;
  if (v10 == 58)
  {
    __int128 v12 = (char *)&v7[v6 + 2];
    char *__endptr = v12;
    unint64_t result = strtoul(v12, (char **)__endptr, 10);
    a2[4] = result;
  }

  return result;
}

vm_address_t trace::initTraceCollection(trace *this)
{
  char v1 = (char)this;
  vm_address_t v2 = vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  vm_address_t result = vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>();
  *(void *)&sanitizers_report_globals = v2;
  *((void *)&sanitizers_report_globals + 1) = result;
  collector = v2;
  collector = result;
  collector = v1;
  libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger = (uint64_t (*)(void, void, void, void, void, void))*MEMORY[0x189600298];
  *MEMORY[0x189600298] = libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc;
  return result;
}

vm_address_t vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>()
{
  if (0x2404000uLL % *MEMORY[0x189600148]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v0 = *MEMORY[0x1895FFD48];
  vm_address_t address = 0LL;
  char v1 = (debug *)vm_map(v0, &address, 0x2404000uLL, 0LL, 1660944385, 0, 0LL, 0, 3, 3, 1u);
  if ((_DWORD)v1) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>(v1, v2);
  }
  vm_address_t v3 = address;
  bzero((void *)address, 0x2404000uLL);
  return v3;
}

vm_address_t vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>()
{
  if (0x1000000uLL % *MEMORY[0x189600148]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v0 = *MEMORY[0x1895FFD48];
  vm_address_t address = 0LL;
  char v1 = (debug *)vm_map(v0, &address, 0x1000000uLL, 0LL, 1660944385, 0, 0LL, 0, 3, 3, 1u);
  if ((_DWORD)v1) {
    vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>(v1, v2);
  }
  vm_address_t v3 = address;
  bzero((void *)address, 0x1000000uLL);
  return v3;
}

const char *sanitizers_diagnose_memory_error( unsigned int a1, uint64_t a2, void (*a3)(void, void, void), unint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = a2;
  v20 = a3;
  unsigned int v21 = a1;
  unint64_t v8 = (unint64_t *)MemoryReader::read((MemoryReader *)v17, a4, 16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    if (*v8 && v8[1])
    {
      uint64_t v10 = MemoryReader::read((MemoryReader *)v17, *v8, 37765120LL);
      uint64_t v11 = MemoryReader::read((MemoryReader *)v17, v9[1], 0x1000000LL);
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        uint64_t v13 = "failed to load trace depot and/or allocation map";
      }

      else
      {
        v16[0] = &off_18A3BE3C8;
        v16[1] = v10;
        v16[2] = v11;
        uint64_t v13 = trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseMemoryError( (uint64_t)v16,  a5,  a6);
      }
    }

    else
    {
    }
  }

  else
  {
  }

  for (uint64_t i = v18; v18; uint64_t i = v18)
  {
    uint64_t v18 = i - 1;
    v20(v21, v17[2 * i - 2], v17[2 * i - 1]);
  }

  return v13;
}

const char *trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseMemoryError( uint64_t a1, unint64_t a2, uint64_t a3)
{
  __int128 v6 = v12;
  if ((void)v12) {
    BOOL v7 = *((void *)&v12 + 1) == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return "allocation metadata unavailable";
  }
  char v9 = v13;
  uint64_t v10 = "underflow";
  if (v13) {
    uint64_t v11 = "use-after-free";
  }
  else {
    uint64_t v11 = v10;
  }
  bzero((void *)(a3 + 33), 0x437uLL);
  *(void *)a3 = v11;
  *(void *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = v6;
  *(_BYTE *)(a3 + 32) = v9;
  trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces( a1,  (uint64_t)&v12,  a3 + 40,  a3 + 576);
  return 0LL;
}

double trace::Lookup::create(trace::Lookup *this, unsigned __int8 (*a2)[24])
{
  *(void *)this = &off_18A3BE3C8;
  double result = *(double *)&sanitizers_report_globals;
  *(_OWORD *)((char *)this + 8) = sanitizers_report_globals;
  return result;
}

uint64_t trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert( uint64_t result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001LL) {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert();
  }
  unsigned int v4 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  unsigned int v5 = (1540483477 * (v4 ^ (v4 >> 13))) & 0xFFFFF ^ ((1540483477 * (v4 ^ (v4 >> 13))) >> 15);
  uint64_t v6 = 0xFFFFLL;
  if (a3 < 0xFFFF) {
    uint64_t v6 = a3;
  }
  BOOL v7 = (unsigned __int128 *)(result + 16LL * v5);
  do
    __ldxp(v7);
  while (__stxp(__PAIR128__(a4, (8 * a2) & 0x7800000000000000LL | ((a2 & 0xF0FFFFFFFFFFFFFFLL) >> 4) | (v6 << 43)), v7));
  return result;
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace( uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 >= 0x41) {
    trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace();
  }
  unsigned int v4 = a2;
  uint64_t result = hash::Murmur2::hashPointers(a2, a3);
  unint64_t v7 = *(void *)(a1 + 8 * (result & 0x7FFFF));
  if ((_DWORD)result != (_DWORD)v7 || HIBYTE(v7) != a3)
  {
    char v9 = (unint64_t *)(a1 + 37748736);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + a3, v9));
    *(void *)(a1 + 8 * (result & 0x7FFFF)) = result | ((unint64_t)(((_DWORD)a3 << 24) | v10 & 0x3FFFFF) << 32);
    if ((((_DWORD)a3 << 24) | v10 & 0x3FFFFF) >> 24)
    {
      unint64_t v11 = (unint64_t)((_DWORD)a3 << 24) >> 24;
      do
      {
        uint64_t v12 = *v4++;
        *(void *)(a1 + 0x400000 + 8 * (v10++ & 0x3FFFFF)) = v12;
        --v11;
      }

      while (v11);
    }
  }

  return result;
}

uint64_t hash::Murmur2::hashPointers(uint64_t *a1, uint64_t a2)
{
  unsigned int v2 = -474048815;
  if (a2)
  {
    uint64_t v3 = 8 * a2;
    do
    {
      uint64_t v4 = *a1++;
      unsigned int v2 = (1540483477
          * ((1540483477 * ((1540483477 * v4) ^ ((1540483477 * v4) >> 24))) ^ (1540483477 * v2))) ^ (1540483477 * ((1540483477 * HIDWORD(v4)) ^ ((1540483477 * HIDWORD(v4)) >> 24)));
      v3 -= 8LL;
    }

    while (v3);
  }

  return (1540483477 * (v2 ^ (v2 >> 13))) ^ ((1540483477 * (v2 ^ (v2 >> 13))) >> 15);
}

uint64_t trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace( uint64_t result, uint64_t a2, unsigned int a3)
{
  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001LL) {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace();
  }
  unsigned int v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  uint64_t v4 = (unsigned __int128 *)(result
                           + 16LL
                           * ((1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15)));
  do
    unsigned __int128 v5 = __ldxp(v4);
  while (__stxp(v5, v4));
  if ((((unint64_t)v5 >> 3) & 0xF00000000000000LL | (16 * (v5 & 0x7FFFFFFFFFFLL))) == a2)
  {
    do
      __ldxp(v4);
    while (__stxp( __PAIR128__(DWORD2(v5) | ((unint64_t)a3 << 32), (unint64_t)v5 | 0x8000000000000000LL),  v4));
  }

  return result;
}

uint64_t debug::print(debug *this, const char *a2, ...)
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  vsnprintf(__str, 0x400uLL, "Failed to map VM region of size %zu (%zu pages)\n", va);
  return fputs(__str, (FILE *)*MEMORY[0x1895FEE10]);
}

{
  char __str[1024];
  uint64_t v4;
  va_list va;
  va_start(va, a2);
  uint64_t v4 = *MEMORY[0x1895FEE08];
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return fputs(__str, (FILE *)*MEMORY[0x1895FEE10]);
}

uint64_t libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t ptr, int a6)
{
  int v9 = result;
  v29[72] = *MEMORY[0x1895FEE08];
  if (libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger) {
    uint64_t result = libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger( result,  a2,  a3,  a4,  ptr,  (a6 + 1));
  }
  if ((v9 & 8) != 0)
  {
    unsigned int v10 = a6 + 2;
    if ((~v9 & 6) != 0)
    {
      if ((v9 & 2) != 0)
      {
        if (ptr && ((ptr & 0xF00000000000000LL) != 0 || !collector))
        {
          size_t v21 = malloc_size((const void *)ptr);
          if (v10 >= 7) {
            libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc( v21,  v22,  v23);
          }
          unint64_t v24 = v21;
          uint64_t v25 = collector;
          thread_stack_pcs();
          if (v28 >= a6 + 4) {
            unint64_t v26 = v28 - (a6 + 4);
          }
          else {
            unint64_t v26 = 0LL;
          }
          unsigned int inserted = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace( v25,  &v29[a6 + 3],  v26);
          return trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert( collector,  ptr,  v24,  inserted);
        }

        return result;
      }

      if ((v9 & 4) == 0 || !a3 || (a3 & 0xF00000000000000LL) == 0 && collector) {
        return result;
      }
      if (v10 >= 7) {
        libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc( result,  a2,  a3);
      }
    }

    else
    {
      if (!ptr) {
        return result;
      }
      if ((ptr & 0xF00000000000000LL) != 0 || !collector)
      {
        size_t v11 = malloc_size((const void *)ptr);
        if (v10 >= 7) {
          libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc( v11,  v12,  v13);
        }
        unint64_t v14 = v11;
        uint64_t v15 = collector;
        thread_stack_pcs();
        if (v28 >= a6 + 4) {
          unint64_t v16 = v28 - (a6 + 4);
        }
        else {
          unint64_t v16 = 0LL;
        }
        unsigned int v17 = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v15, &v29[a6 + 3], v16);
        uint64_t result = trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert( collector,  ptr,  v14,  v17);
      }

      if (!a3 || (a3 & 0xF00000000000000LL) == 0 && collector) {
        return result;
      }
      if (v10 >= 7) {
        libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc( result,  a2,  a3);
      }
    }

    uint64_t v18 = collector;
    thread_stack_pcs();
    if (v28 >= a6 + 4) {
      unint64_t v19 = v28 - (a6 + 4);
    }
    else {
      unint64_t v19 = 0LL;
    }
    unsigned int v20 = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v18, &v29[a6 + 3], v19);
    return trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace( collector,  a3,  v20);
  }

  return result;
}

uint64_t MemoryReader::read(MemoryReader *this, unint64_t a2, uint64_t a3)
{
  if (*((void *)this + 6) >= 3uLL) {
    MemoryReader::read();
  }
  uint64_t result = (*((uint64_t (**)(void))this + 7))(*((unsigned int *)this + 18));
  if (result)
  {
    uint64_t v6 = *((void *)this + 6);
    *((void *)this + 6) = v6 + 1;
    unint64_t v7 = (void *)((char *)this + 16 * v6);
    *unint64_t v7 = result;
    v7[1] = a3;
  }

  return result;
}

uint64_t trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (v10[0]) {
    BOOL v7 = v10[1] == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = !v7;
  if (!v7) {
    trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces( a1,  (uint64_t)v10,  a3,  a4);
  }
  return v8;
}

{
  BOOL v4;
  uint64_t result;
  if (*(void *)a2) {
    uint64_t v4 = *(void *)(a2 + 8) == 0LL;
  }
  else {
    uint64_t v4 = 1;
  }
  if (v4) {
    trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces();
  }
  uint64_t result = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace( *(void *)(a1 + 8),  *(_DWORD *)(a2 + 20),  (void *)(a3 + 24));
  *(_DWORD *)(a3 + 16) = result;
  if (*(_BYTE *)(a2 + 16))
  {
    uint64_t result = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace( *(void *)(a1 + 8),  *(_DWORD *)(a2 + 24),  (void *)(a4 + 24));
    *(_DWORD *)(a4 + 16) = result;
  }

  return result;
}

double trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001LL) {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get();
  }
  unsigned int v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  uint64_t v4 = (1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  uint64_t v5 = *(void *)(a1 + 16 * v4);
  if ((((unint64_t)v5 >> 3) & 0xF00000000000000LL | (16 * (v5 & 0x7FFFFFFFFFFLL))) == a2)
  {
    *(void *)a3 = a2;
    *(void *)(a3 + 8) = (unsigned __int16)((unint64_t)v5 >> 43);
    *(_BYTE *)(a3 + 16) = v5 < 0;
    double result = *(double *)(a1 + 16 * v4 + 8);
    *(double *)(a3 + 20) = result;
  }

  else
  {
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }

  return result;
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace( uint64_t a1, int a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 8 * (*(void *)&a2 & 0x7FFFFLL));
  unsigned int v11 = -474048815;
  trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::forEachFrame<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(trace::Id,unsigned long (&)[64])::{lambda(unsigned long,unsigned long)#1}>( a1,  v3,  &v11);
  if (((1540483477 * (v11 ^ (v11 >> 13))) ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)) != (_DWORD)v3) {
    return 0LL;
  }
  unint64_t v8 = HIBYTE(v3);
  unint64_t v9 = HIDWORD(v3);
  do
  {
    *a3++ = *(void *)(a1 + 0x400000 + 8 * (v9++ & 0x3FFFFF));
    --v8;
  }

  while (v8);
  return HIBYTE(HIDWORD(v3));
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::forEachFrame<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(trace::Id,unsigned long (&)[64])::{lambda(unsigned long,unsigned long)#1}>( uint64_t result, unint64_t a2, unsigned int *a3)
{
  unint64_t v3 = HIBYTE(a2);
  if (HIBYTE(a2))
  {
    unint64_t v4 = HIDWORD(a2);
    uint64_t v5 = result + 0x400000;
    unsigned int v6 = *a3;
    do
    {
      int v7 = *(_DWORD *)(v5 + 8 * (v4 & 0x3FFFFF) + 4);
      unsigned int v8 = 1540483477 * *(_DWORD *)(v5 + 8 * (v4 & 0x3FFFFF));
      unsigned int v6 = (1540483477 * ((1540483477 * (v8 ^ HIBYTE(v8))) ^ (1540483477 * v6))) ^ (1540483477
                                                                                  * ((1540483477 * v7) ^ ((1540483477 * v7) >> 24)));
      ++v4;
      --v3;
    }

    while (v3);
    *a3 = v6;
  }

  return result;
}

double trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseFault@<D0>( uint64_t a1@<X0>, unint64_t a2@<X1>, __int128 *a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x1895FEE08];
  unint64_t v5 = a2 & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v7 = -16LL;
  unint64_t v8 = a2 & 0xFFFFFFFFFFFFFFF0LL;
  while ((v8 & 0xF0FFFFFFFFFFFFF0LL) < 0xFC0000001LL)
  {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get( *(void *)(a1 + 16),  v8,  (uint64_t)&v27);
    if ((void)v27) {
      BOOL v9 = *((void *)&v27 + 1) == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && !BlockInfo::absDistance((BlockInfo *)&v27, a2) && (_BYTE)v28)
    {
      __int128 v29 = v28;
      if ((void)v27 && *((void *)&v27 + 1))
      {
        *a3 = v27;
        *(void *)&__int128 v19 = v29;
        a3[1] = v29;
        return *(double *)&v19;
      }

      break;
    }

    v8 -= 16LL;
    v7 += 16LL;
    if (v7 >= 0x3FF1) {
      break;
    }
  }

  unint64_t v10 = -16LL;
  while (1)
  {
    if ((v6 & 0xF0FFFFFFFFFFFFF0LL) >= 0xFC0000001LL)
    {
LABEL_19:
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      goto LABEL_20;
    }

    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get( *(void *)(a1 + 16),  v6,  (uint64_t)&v27);
    BOOL v11 = !(void)v27 || *((void *)&v27 + 1) == 0LL;
    if (!v11 && BlockInfo::absDistance((BlockInfo *)&v27, a2) && !(_BYTE)v28) {
      break;
    }
    v6 -= 16LL;
    v10 += 16LL;
    if (v10 >= 0x3FF1) {
      goto LABEL_19;
    }
  }

  __int128 v25 = v27;
  __int128 v26 = v28;
LABEL_20:
  unint64_t v12 = -16LL;
  while (1)
  {
    uint64_t v13 = v5 + v12 + 16;
    if ((v13 & 0xF0FFFFFFFFFFFFF0LL) >= 0xFC0000001LL)
    {
LABEL_29:
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      goto LABEL_30;
    }

    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get( *(void *)(a1 + 16),  v13,  (uint64_t)&v27);
    BOOL v14 = !(void)v27 || *((void *)&v27 + 1) == 0LL;
    if (!v14 && BlockInfo::absDistance((BlockInfo *)&v27, a2) && !(_BYTE)v28) {
      break;
    }
    v12 += 16LL;
    if (v12 >= 0x3FF1) {
      goto LABEL_29;
    }
  }

  __int128 v23 = v27;
  __int128 v24 = v28;
LABEL_30:
  if ((void)v25) {
    BOOL v15 = *((void *)&v25 + 1) == 0LL;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    unint64_t v16 = &v23;
  }

  else
  {
    unint64_t v16 = &v25;
    if ((void)v23) {
      BOOL v17 = *((void *)&v23 + 1) == 0LL;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17)
    {
      unint64_t v18 = BlockInfo::absDistance((BlockInfo *)&v25, a2);
      if (v18 > BlockInfo::absDistance((BlockInfo *)&v23, a2)) {
        unint64_t v16 = &v23;
      }
    }
  }

  __int128 v19 = *v16;
  __int128 v20 = v16[1];
  *a3 = *v16;
  a3[1] = v20;
  return *(double *)&v19;
}

unint64_t BlockInfo::absDistance(BlockInfo *this, unint64_t a2)
{
  BOOL v3 = *(void *)this >= a2;
  unint64_t result = *(void *)this - a2;
  if (result == 0 || !v3)
  {
    if (BlockInfo::endInclusive(this) >= a2) {
      return 0LL;
    }
    else {
      return a2 - BlockInfo::endInclusive(this);
    }
  }

  return result;
}

uint64_t BlockInfo::endInclusive(BlockInfo *this)
{
  if (!*(void *)this || (uint64_t v1 = *((void *)this + 1)) == 0) {
    BlockInfo::endInclusive();
  }
  return *(void *)this + v1 - 1;
}

uint64_t OUTLINED_FUNCTION_0(debug *a1, const char *a2)
{
  return debug::print(a1, a2);
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

vm_address_t _sanitizers_init(unsigned __int8 **a1, const char **a2)
{
  vm_address_t result = config::env::Parser::consumeEnv(a1, a2);
  if ((_DWORD)v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = (v3 & 0xFFFFFFFF00000000LL) == 0x200000000LL;
  }
  int v5 = (v3 & 0xFFFFFFFE) == 2 || v4;
  unint64_t v6 = result & 0xFFFFFFFF0000FF00LL | ((v3 & 0xFFFFFFFF00000000LL) == 0x200000000LL);
  LODWORD(v7) = v5 | (((_DWORD)v3 == 3) << 8);
  if ((v3 & 0xFFFFFFFF00000000LL) == 0x200000000LL)
  {
    vm_address_t result = asan::initRuntime((asan *)&v6);
    int v5 = v7;
  }

  if (v5) {
    return trace::initTraceCollection((trace *)BYTE1(v7));
  }
  return result;
}

uint64_t config::env::Parser::consumeEnv(unsigned __int8 **this, const char **a2)
{
  BOOL v4 = this;
  uint64_t Config = config::env::Parser::getConfig((config::env::Parser *)&v4);
  if ((Config & 1) == 0) {
    config::env::Parser::removeEnvVars(&v4);
  }
  return Config;
}

uint64_t config::env::Parser::getConfig(config::env::Parser *this)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  __int128 v8 = xmmword_18A3BE430;
  __int128 v9 = unk_18A3BE440;
  __int128 v10 = xmmword_18A3BE450;
  unsigned int v2 = config::env::Parser::getSetting<BOOL,3ul>( (uint64_t)this,  (uint64_t)"SanitizersChildProcessPropagation",  0LL,  (uint64_t)&v8);
  __int128 v8 = xmmword_18A3BE430;
  __int128 v9 = unk_18A3BE440;
  __int128 v10 = xmmword_18A3BE450;
  int v3 = config::env::Parser::getSetting<BOOL,3ul>( (uint64_t)this,  (uint64_t)"SanitizersPrintReportToStderr",  0LL,  (uint64_t)&v8);
  uint64_t v4 = config::env::Parser::getNumber<long,&(strtol)>((uint64_t)this, (uint64_t)"SanitizersExitCode", 0LL);
  __int128 v8 = xmmword_18A3BE3D0;
  __int128 v9 = unk_18A3BE3E0;
  __int128 v10 = xmmword_18A3BE3F0;
  __int128 v11 = unk_18A3BE400;
  config::env::Parser::getSetting<config::env::AllocationTraces,4ul>( (uint64_t)this,  (uint64_t)"SanitizersAllocationTraces",  0LL,  (uint64_t)&v8);
  v7[0] = xmmword_18A3BE410;
  v7[1] = unk_18A3BE420;
  config::env::Parser::getSetting<config::env::Address,2ul>( (uint64_t)this,  (uint64_t)"SanitizersAddress",  0LL,  (uint64_t)v7);
  uint64_t v5 = 256LL;
  if (!v3) {
    uint64_t v5 = 0LL;
  }
  return v5 | (v4 << 32) | v2;
}

unsigned __int8 **config::env::Parser::removeEnvVars(unsigned __int8 ***this)
{
  return config::env::Parser::unsetEnv<18ul>(*this, "SanitizersAddress");
}

uint64_t config::env::Parser::getSetting<config::env::AllocationTraces,4ul>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = _simple_getenv();
  if (v6)
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      __int128 v8 = (void *)(a4 + 16 * v7);
      __int128 v9 = (_BYTE *)v8[1];
      int v10 = *v9;
      if (*v9)
      {
        __int128 v11 = v9 + 1;
        uint64_t v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12) {
            break;
          }
          ++v12;
          int v13 = *v11++;
          int v10 = v13;
        }

        while (v13);
      }

      else
      {
        uint64_t v12 = (unsigned __int8 *)v6;
      }

      if (v10 == *v12) {
        break;
      }
      if (++v7 == 4) {
        return a3;
      }
    }

    return *(unsigned int *)v8;
  }

  return a3;
}

uint64_t config::env::Parser::getSetting<config::env::Address,2ul>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = _simple_getenv();
  if (v6)
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      __int128 v8 = (void *)(a4 + 16 * v7);
      __int128 v9 = (_BYTE *)v8[1];
      int v10 = *v9;
      if (*v9)
      {
        __int128 v11 = v9 + 1;
        uint64_t v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12) {
            break;
          }
          ++v12;
          int v13 = *v11++;
          int v10 = v13;
        }

        while (v13);
      }

      else
      {
        uint64_t v12 = (unsigned __int8 *)v6;
      }

      if (v10 == *v12) {
        break;
      }
      if (++v7 == 2) {
        return a3;
      }
    }

    return *(unsigned int *)v8;
  }

  return a3;
}

uint64_t config::env::Parser::getSetting<BOOL,3ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = _simple_getenv();
  if (v6)
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      uint64_t v8 = a4 + 16 * v7;
      __int128 v9 = *(_BYTE **)(v8 + 8);
      int v10 = *v9;
      if (*v9)
      {
        __int128 v11 = v9 + 1;
        uint64_t v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12) {
            break;
          }
          ++v12;
          int v13 = *v11++;
          int v10 = v13;
        }

        while (v13);
      }

      else
      {
        uint64_t v12 = (unsigned __int8 *)v6;
      }

      if (v10 == *v12) {
        break;
      }
      if (++v7 == 3) {
        return a3;
      }
    }

    return *(_BYTE *)v8 & 1;
  }

  return a3;
}

uint64_t config::env::Parser::getNumber<long,&(strtol)>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (const char *)_simple_getenv();
  if (!v4) {
    return a3;
  }
  int v5 = *(unsigned __int8 *)v4;
  if (*v4)
  {
    uint64_t v6 = (unsigned __int8 *)(v4 + 1);
    uint64_t v7 = &byte_18951AB6F;
    do
    {
      ++v7;
      int v8 = *v6++;
      int v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v7 = &byte_18951AB6F;
  }

  else {
    return a3;
  }
}

unsigned __int8 **config::env::Parser::unsetEnv<34ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        int v7 = *v5;
      }

      if (!v7 && v2[33] == 61)
      {
        __int128 v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }

      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }

  else
  {
    int v3 = result;
  }

  *int v3 = 0LL;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<30ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        int v7 = *v5;
      }

      if (!v7 && v2[29] == 61)
      {
        __int128 v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }

      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }

  else
  {
    int v3 = result;
  }

  *int v3 = 0LL;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<19ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        int v7 = *v5;
      }

      if (!v7 && v2[18] == 61)
      {
        __int128 v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }

      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }

  else
  {
    int v3 = result;
  }

  *int v3 = 0LL;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<27ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        int v7 = *v5;
      }

      if (!v7 && v2[26] == 61)
      {
        __int128 v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }

      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }

  else
  {
    int v3 = result;
  }

  *int v3 = 0LL;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<18ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        int v7 = *v5;
      }

      if (!v7 && v2[17] == 61)
      {
        __int128 v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }

      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }

  else
  {
    int v3 = result;
  }

  *int v3 = 0LL;
  return result;
}

void asan::initGlobalVars(uint64_t a1, uint64_t a2)
{
  asan::_shadow = a1;
  asan::_globals = a2;
  _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke);
}

uint64_t asan::GlobalsRegistryImpl::registerSection(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = (unint64_t *)(result + 8);
  unint64_t v4 = *(void *)(result + 8);
  if (v4 >= 0x7FF) {
    asan::GlobalsRegistryImpl::registerSection();
  }
  uint64_t v5 = result + 16 * v4;
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  do
    unint64_t v6 = __ldxr(v3);
  while (__stlxr(v6 + 1, v3));
  return result;
}

unint64_t *asan::GlobalsRegistryImpl::getGlobalVar( asan::GlobalsRegistryImpl *this, unint64_t a2)
{
  unint64_t v2 = atomic_load((unint64_t *)this + 1);
  if (!v2) {
    return 0LL;
  }
  int v3 = (char *)this + 16;
  unint64_t v4 = (char *)this + 16 * v2 + 16;
  while (1)
  {
    uint64_t v5 = *((void *)v3 + 1);
    if (v5) {
      break;
    }
LABEL_8:
    v3 += 16;
    if (v3 == v4) {
      return 0LL;
    }
  }

  vm_address_t result = *(unint64_t **)v3;
  uint64_t v7 = v5 << 6;
  while (*result > a2 || result[2] + *result <= a2)
  {
    result += 8;
    v7 -= 64LL;
    if (!v7) {
      goto LABEL_8;
    }
  }

  return result;
}

vm_address_t vm::create<asan::GlobalsRegistryImpl>()
{
  if (0x8000uLL % *MEMORY[0x189600148]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v0 = *MEMORY[0x1895FFD48];
  vm_address_t address = 0LL;
  uint64_t v1 = (debug *)vm_map(v0, &address, 0x8000uLL, 0LL, 1660944385, 0, 0LL, 0, 3, 3, 1u);
  if ((_DWORD)v1) {
    vm::create<asan::GlobalsRegistryImpl>(v1, v2);
  }
  vm_address_t v3 = address;
  *(void *)vm_address_t address = &off_18A3BE470;
  *(void *)(v3 + 8) = 0LL;
  bzero((void *)(v3 + 16), 0x7FF0uLL);
  return v3;
}

uint8_t *asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke(const mach_header_64 *a1)
{
  unint64_t size = 0LL;
  vm_address_t result = getsectiondata(a1, "__DATA", "__asan_globals", &size);
  if ((size & 0x3F) != 0) {
    asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke();
  }
  if (size)
  {
    unint64_t v2 = result;
    uint64_t v3 = (uint64_t)size >> 6;
    uint64_t v4 = (uint64_t)size >> 6 << 6;
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint8_t *))(*(void *)asan::_shadow + 16LL))(asan::_shadow, v5);
      v5 += 64;
      v4 -= 64LL;
    }

    while (v4);
    return (uint8_t *)(**(uint64_t (***)(uint64_t, uint8_t *, uint64_t))asan::_globals)(asan::_globals, v2, v3);
  }

  return result;
}

uint64_t asan::initCompilerABI(uint64_t result)
{
  _shadow = result;
  return result;
}

uint64_t __asan_abi_load_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88LL))(_shadow, a1, a2);
    if (result)
    {
      *(void *)&__int128 v8 = v2;
      *((void *)&v8 + 1) = &vars0;
      __int128 v9 = &v10;
      *(void *)&__int128 v6 = a1;
      *((void *)&v6 + 1) = a2;
      char v7 = 0;
      asan::reportError(&v8, &v6);
    }
  }

  return result;
}

uint64_t __asan_abi_region_is_poisoned(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88LL))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_exp_load_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88LL))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_store_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88LL))(_shadow, a1, a2);
    if (result)
    {
      *(void *)&__int128 v8 = v2;
      *((void *)&v8 + 1) = &vars0;
      __int128 v9 = &v10;
      *(void *)&__int128 v6 = a1;
      *((void *)&v6 + 1) = a2;
      char v7 = 1;
      asan::reportError(&v8, &v6);
    }
  }

  return result;
}

uint64_t __asan_abi_exp_store_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88LL))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_address_is_poisoned(uint64_t a1)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)_shadow + 64LL))(_shadow, a1);
  }
  return result;
}

uint64_t __asan_abi_poison_memory_region(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))(*(void *)_shadow + 72LL))( _shadow,  a1,  0LL,  0LL,  a2,  249LL);
  }
  return result;
}

uint64_t __asan_abi_unpoison_memory_region(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 80LL))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_set_shadow_xx_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 8LL))( _shadow,  a1,  a3,  a2);
  }
  return result;
}

uint64_t __asan_abi_load_cxx_array_cookie()
{
  return 0LL;
}

uint64_t __asan_abi_get_current_fake_stack()
{
  return 0LL;
}

uint64_t __asan_abi_addr_is_in_fake_stack()
{
  return 0LL;
}

void *__asan_abi_stack_malloc_n(int a1, size_t __size)
{
  if (!_shadow) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t result = malloc(__size);
  *(void *)(StatusReg + 1848) = 0LL;
  return result;
}

void *__asan_abi_stack_malloc_always_n(int a1, size_t __size)
{
  if (!_shadow) {
    return 0LL;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t result = malloc(__size);
  *(void *)(StatusReg + 1848) = 0LL;
  return result;
}

void __asan_abi_stack_free_n(int a1, void *a2)
{
  if (_shadow)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 1848) = 1LL;
    free(a2);
    *(void *)(StatusReg + 1848) = 0LL;
  }

uint64_t asan::initRuntime(asan *a1)
{
  if ((_BYTE)cfg) {
    asan::initRuntime();
  }
  cfg = *(void *)a1;
  asan::initShadow(a1);
  uint64_t v2 = (uint64_t)v1;
  uint64_t inited = asan::initGlobalsRegistry(v1);
  return asan::initRuntime(v2, inited);
}

uint64_t asan::initRuntime(uint64_t a1, uint64_t a2)
{
  libmallocShadow = a1;
  uint64_t result = malloc_sanitizer_set_functions();
  reportShadow = a1;
  reportGlobals = a2;
  return result;
}

uint64_t asan::initLibmallocHooks(uint64_t a1)
{
  libmallocShadow = a1;
  return malloc_sanitizer_set_functions();
}

uint64_t asan::initReportGeneration(uint64_t result, uint64_t a2)
{
  reportShadow = result;
  reportGlobals = a2;
  return result;
}

uint64_t asan::initLibmallocHooks(Shadow *)::$_0::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    asan::initLibmallocHooks(Shadow *)::$_0::__invoke();
  }
  if (!a4) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)libmallocShadow
  }
                                                                                         + 72LL))( libmallocShadow,  a1,  a3,  0LL,  0LL,  251LL);
  uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 1848);
  uint64_t v5 = *(void *)libmallocShadow;
  if (v4) {
    __int128 v6 = *(uint64_t (**)(void))(v5 + 40);
  }
  else {
    __int128 v6 = *(uint64_t (**)(void))(v5 + 24);
  }
  return v6();
}

uint64_t asan::initLibmallocHooks(Shadow *)::$_1::__invoke()
{
  uint64_t v0 = 48LL;
  if (!*(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 1848)) {
    uint64_t v0 = 32LL;
  }
  return (*(uint64_t (**)(void))(*(void *)libmallocShadow + v0))();
}

void asan::reportError(__int128 *a1, __int128 *a2)
{
  __int128 v39 = *a1;
  uint64_t v40 = *((void *)a1 + 2);
  __int128 v37 = *a2;
  uint64_t v38 = *((void *)a2 + 2);
  trace::Lookup::create((trace::Lookup *)&v63, v4);
  v64.dli_fname = (const char *)reportShadow;
  v64.dli_fbase = v5;
  v64.dli_sname = (const char *)reportGlobals;
  __int128 v61 = v39;
  uint64_t v62 = v40;
  __int128 v59 = v37;
  uint64_t v60 = v38;
  asan::ReportGenerator::createReport((uint64_t *)&v64, (uint64_t)&v61, &v59, (uint64_t)&__src);
  if (BYTE1(cfg))
  {
    if (v45) {
      char v7 = "WRITE";
    }
    else {
      char v7 = "READ";
    }
    unsigned int v8 = v46;
    if (v52) {
      __int128 v9 = "freed ";
    }
    else {
      __int128 v9 = &byte_18951AB6F;
    }
    char v10 = "allocation";
    if ((v46 & 0xFFFFFFFE) == 4) {
      char v10 = "stack variable";
    }
    if (v46 == 2) {
      __int128 v11 = "global variable";
    }
    else {
      __int128 v11 = v10;
    }
    uint64_t v12 = v50;
    uint64_t v13 = v43 - v50;
    uint64_t v14 = v51 + v50;
    debug::print((debug *)"=================================================================\n", v6);
    debug::print((debug *)"Address Sanitizer: %s at address %p\n", v15, v47, v43);
    debug::print((debug *)"Registers: pc=%p fp=%p sp=%p\n", v16, __src, v42);
    debug::print((debug *)"Faulty %s of size %zu at address %p\n", v17, v7, v44, v43);
    debug::print((debug *)"Located at offset %td of %s%s ", v18, v13, v9, v11);
    if (v8 <= 5 && ((1 << v8) & 0x34) != 0) {
      debug::print((debug *)"'%.*s' ", v19, v49, v48);
    }
    debug::print((debug *)"[%p, %p), size: %td\n", v19, v12, v14, v51);
    debug::print((debug *)"\n", v20);
    size_t v21 = (void *)*((void *)&__src + 1);
    bzero(&v63.dli_sname, 0x208uLL);
    v63.dli_fname = *(const char **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    v63.dli_fbase = (void *)mach_absolute_time();
    LODWORD(v63.dli_sname) = backtrace_from_fp(v21, &v63.dli_saddr, 64);
    debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v22, "Fault", v63.dli_fname, v63.dli_fbase);
    if (LODWORD(v63.dli_sname))
    {
      unint64_t v24 = 0LL;
      do
      {
        __int128 v25 = (const void *)*((void *)&v63.dli_saddr + v24);
        memset(&v64, 0, sizeof(v64));
        dladdr(v25, &v64);
        debug::print( (debug *)"  %2lu. %p in %s + %zu (%s)\n",  v26,  ++v24,  v25,  v64.dli_sname,  (_BYTE *)v25 - (char *)v64.dli_saddr,  v64.dli_fname);
      }

      while (v24 < LODWORD(v63.dli_sname));
    }

    debug::print((debug *)"\n", v23);
    if (v8 > 5 || ((1 << v8) & 0x34) == 0)
    {
      debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v27, "Allocation", v53, v54);
      if (v55)
      {
        for (unint64_t i = 0LL;
              i < v55;
              debug::print( (debug *)"  %2lu. %p in %s + %zu (%s)\n",  v31,  ++i,  v30,  v63.dli_sname,  v30 - (char *)v63.dli_saddr,  v63.dli_fname))
        {
          uint64_t v30 = (_BYTE *)v56[i];
          memset(&v63, 0, sizeof(v63));
          dladdr(v30, &v63);
        }
      }

      debug::print((debug *)"\n", v28);
      if (v52)
      {
        debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v32, "Deallocation", v56[64], v56[65]);
        if (v57)
        {
          for (unint64_t j = 0LL;
                j < v57;
                debug::print( (debug *)"  %2lu. %p in %s + %zu (%s)\n",  v36,  ++j,  v35,  v63.dli_sname,  v35 - (char *)v63.dli_saddr,  v63.dli_fname))
          {
            v35 = (_BYTE *)v58[j];
            memset(&v63, 0, sizeof(v63));
            dladdr(v35, &v63);
          }
        }

        debug::print((debug *)"\n", v33);
      }
    }
  }

  asan::callDebuggerBreakpointSymbol(&__src);
  die();
}

void die(void)
{
  if (!HIDWORD(cfg)) {
    abort();
  }
  _exit(SHIDWORD(cfg));
}

void asan::callDebuggerBreakpointSymbol(void *__src)
{
}

  ;
}

BOOL __asan_report_present()
{
  return qword_18C79DD68 != 0;
}

uint64_t __asan_get_report_pc()
{
  return report;
}

uint64_t __asan_get_report_bp()
{
  return qword_18C79DD58;
}

uint64_t __asan_get_report_sp()
{
  return qword_18C79DD60;
}

uint64_t __asan_get_report_address()
{
  return qword_18C79DD68;
}

uint64_t __asan_get_report_access_type()
{
  return byte_18C79DD78;
}

uint64_t __asan_get_report_access_size()
{
  return qword_18C79DD70;
}

uint64_t __asan_get_report_description()
{
  return qword_18C79DD88;
}

uint64_t __asan_locate_address(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  if (qword_18C79DD68 != a1) {
    __asan_locate_address_cold_3();
  }
  uint64_t v5 = unk_18C79DDB0;
  *a4 = qword_18C79DDA8;
  *a5 = v5;
  if (qword_18C79DDA0)
  {
    if (!a3) {
      __asan_locate_address_cold_1();
    }
    if (a3 >= qword_18C79DDA0 + 1) {
      uint64_t v6 = qword_18C79DDA0 + 1;
    }
    else {
      uint64_t v6 = a3;
    }
    if (!v6) {
      __asan_locate_address_cold_2();
    }
    unint64_t v7 = v6 - 1;
    int v8 = *(unsigned __int8 *)qword_18C79DD98;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = qword_18C79DD98 + 1;
      do
      {
        *(_BYTE *)(a2 + v11) = v8;
        uint64_t v10 = v11 + 1;
        int v8 = *(unsigned __int8 *)(v12 + v11);
      }

      while (++v11 < v7 && v8 != 0);
    }

    *(_BYTE *)(a2 + v10) = 0;
  }

  return qword_18C79DD90;
}

void *__asan_get_shadow_mapping(void *result, void *a2)
{
  *uint64_t result = qword_18C79E1F0;
  *a2 = qword_18C79E1F8;
  return result;
}

unint64_t __asan_get_alloc_stack(uint64_t a1, void *a2, unint64_t a3, _DWORD *a4)
{
  if (qword_18C79DD68 != a1) {
    __asan_get_alloc_stack_cold_1();
  }
  else {
    unint64_t result = a3;
  }
  if (result)
  {
    uint64_t v5 = &qword_18C79DDD8;
    unint64_t v6 = result;
    do
    {
      uint64_t v7 = *v5++;
      *a2++ = v7;
      --v6;
    }

    while (v6);
  }

  *a4 = qword_18C79DDC0;
  return result;
}

unint64_t __asan_get_free_stack(uint64_t a1, void *a2, unint64_t a3, _DWORD *a4)
{
  if (qword_18C79DD68 != a1) {
    __asan_get_free_stack_cold_1();
  }
  else {
    unint64_t result = a3;
  }
  if (result)
  {
    uint64_t v5 = &qword_18C79DFF0;
    unint64_t v6 = result;
    do
    {
      uint64_t v7 = *v5++;
      *a2++ = v7;
      --v6;
    }

    while (v6);
  }

  *a4 = qword_18C79DFD8;
  return result;
}

double asan::initShadow(asan *this)
{
  if (0x200000000uLL % *MEMORY[0x189600148]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v1 = *MEMORY[0x1895FFD48];
  vm_address_t address = 0LL;
  uint64_t v2 = (debug *)vm_map(v1, &address, 0x200000000uLL, 0LL, 1660944385, 0, 0LL, 0, 3, 3, 1u);
  if ((_DWORD)v2) {
    asan::initShadow(v2, v3);
  }
  shadow = (uint64_t)&off_18A3BE490;
  *(void *)algn_18C79E208 = address;
  *(void *)&double result = 0x200000000LL;
  xmmword_18C79E210 = xmmword_18951A5A0;
  return result;
}

void *ASanShadow::memsetShadow(ASanShadow *this, void *__b, int __c, size_t __len)
{
  return memset(__b, __c, __len);
}

void ASanShadow::bzeroShadow(ASanShadow *this, void *a2, size_t a3)
{
}

void *ASanShadow::poison( ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  if ((a2 & 7) != 0) {
    ASanShadow::poison((uint64_t)this, a2, a3);
  }
  unint64_t v6 = (char *)(*((void *)this + 1) + ((unint64_t)(a2 - *((void *)this + 3)) >> 3));
  int v7 = a3 & 7;
  size_t v8 = a3 >> 3;
  unint64_t v9 = a4 >> 3;
  unint64_t v10 = (a4 + a3 + a5) >> 3;
  if (a6 == 233) {
    int v11 = 250;
  }
  else {
    int v11 = a6;
  }
  if (a6 == 233) {
    int v12 = 251;
  }
  else {
    int v12 = a6;
  }
  if (a6 == 240) {
    int v13 = 241;
  }
  else {
    int v13 = v11;
  }
  if (a6 == 240) {
    int v14 = 243;
  }
  else {
    int v14 = v12;
  }
  memset(v6, v13, a4 >> 3);
  BOOL v15 = &v6[v9];
  bzero(v15, v8);
  unint64_t v16 = &v15[v8];
  size_t v17 = v9 + v8;
  if (v7 && v10 > v17)
  {
    *v16++ = v7;
    size_t v18 = v10 + ~v17;
  }

  else
  {
    size_t v18 = v10 - v17;
  }

  return memset(v16, v14, v18);
}

void ASanShadow::unpoison(ASanShadow *this, uint64_t a2, unint64_t a3)
{
}

BOOL ASanShadow::addressIsPoisoned(ASanShadow *this, uint64_t a2)
{
  else {
    BOOL v2 = 1;
  }
  return !v2;
}

uint64_t ASanShadow::regionIsPoisoned(uint64_t this, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a2 + a3;
  if (__CFADD__(a2, a3))
  {
    __break(1u);
    return this;
  }

  uint64_t v5 = *(void *)(this + 24);
  uint64_t v6 = *(void *)(this + 8);
  if (!*(_BYTE *)(((unint64_t)(v4 - 1 - v5) >> 3) + v6)
    || ((v4 - 1) & 7) < *(char *)(((unint64_t)(v4 - 1 - v5) >> 3) + v6))
  {
    unint64_t v8 = v6 + ((unint64_t)(a2 - v5) >> 3);
    unint64_t v9 = v4 - v5;
    unint64_t v10 = v6 + ((unint64_t)(v4 - v5) >> 3);
    unint64_t v11 = v10 - v8;
    if (v10 <= v8) {
      return 0LL;
    }
    size_t v12 = v11 >= 0x100 ? 256LL : v10 - v8;
    if (!memcmp((const void *)(v6 + ((unint64_t)(a2 - v5) >> 3)), &zeros, v12))
    {
      unint64_t v13 = 0LL;
      unint64_t v14 = v9 >> 3;
      unint64_t v15 = v11 >> 8;
      unint64_t v16 = (char *)(v8 + 256);
      unint64_t v17 = v14 - ((unint64_t)(v3 - v5) >> 3) - 256;
      do
      {
        unint64_t v18 = v13;
        if (v15 == v13) {
          break;
        }
        ++v13;
        unint64_t v19 = v17 - 256;
        size_t v20 = v17 >= 0x100 ? 256LL : v17;
        int v21 = memcmp(v16, &zeros, v20);
        v16 += 256;
        unint64_t v17 = v19;
      }

      while (!v21);
      if (v15 <= v18) {
        return 0LL;
      }
    }
  }

  uint64_t v22 = v3;
  do
  {
    int v23 = *(char *)(((unint64_t)(v3 - v5) >> 3) + v6);
    int v24 = v3 & 7;
    ++v22;
    ++v3;
    if (v23) {
      BOOL v25 = v24 < v23;
    }
    else {
      BOOL v25 = 1;
    }
  }

  while (v25);
  return v3 - 1;
}

uint64_t ASanShadow::getShadowByteForAddress(ASanShadow *this, unint64_t a2)
{
  return *(unsigned __int8 *)(((a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1));
}

void *ASanShadow::setShadowBytes(void *result, uint64_t a2, size_t a3, int __c)
{
  if (a3) {
    return memset((void *)(result[1] + a2), __c, a3);
  }
  return result;
}

unint64_t ASanShadow::shadowForAddress(ASanShadow *this, uint64_t a2)
{
  return *((void *)this + 1) + ((unint64_t)(a2 - *((void *)this + 3)) >> 3);
}

BOOL ASanShadow::addressIsInMem(ASanShadow *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 1);
  return v2 > a2 || *((void *)this + 2) + v2 <= a2;
}

BOOL ASanShadow::addressIsInShadow(ASanShadow *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 1);
  return v2 <= a2 && *((void *)this + 2) + v2 > a2;
}

uint64_t ASanShadow::getShadowStart(ASanShadow *this)
{
  return *((void *)this + 1);
}

uint64_t ASanShadow::getShadowValue(ASanShadow *this, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = *((void *)this + 1);
  if (v3 <= a2 && *((void *)this + 2) + v3 > a2) {
    ASanShadow::getShadowValue();
  }
  if (a3 >= 0x11) {
    ASanShadow::getShadowValue();
  }
  uint64_t v4 = (unsigned __int8 *)(v3 + ((a2 - *((void *)this + 3)) >> 3));
  if (a3 > 8 && *v4 == 0) {
    ++v4;
  }
  return *v4;
}

void ASanShadow::getAllocationEnd(uint64_t a1, uint64_t *a2)
{
  uint64_t IsPoisoned = ASanShadow::regionIsPoisoned(a1, *a2, a2[1]);
  if (IsPoisoned)
  {
    uint64_t v4 = (unsigned __int8 *)(*(void *)(a1 + 8) + ((unint64_t)(IsPoisoned - *(void *)(a1 + 24)) >> 3));
    unsigned int v5 = *v4;
    if (v5 <= 7)
    {
      unsigned int v5 = v4[1];
      if (v5 <= 8) {
        ASanShadow::getAllocationEnd();
      }
    }

    __asm { BR              X13 }
  }

  ASanShadow::getAllocationEnd();
}

unint64_t ASanShadow::getAllocationInfo(uint64_t a1, __int128 *a2)
{
  __int128 v7 = *a2;
  uint64_t v8 = *((void *)a2 + 2);
  ASanShadow::getAllocationEnd(a1, (uint64_t *)&v7);
  unint64_t v4 = v3;
  unint64_t result = v3 - *(void *)(v3 - 16);
  if (result > *(void *)a2 || *(void *)a2 >= v4) {
    ASanShadow::getAllocationInfo();
  }
  return result;
}

void *ASanShadow::poisonGlobal(ASanShadow *a1, uint64_t *a2)
{
  unint64_t result = ASanShadow::poison(a1, *a2, a2[1], 0LL, a2[2] - a2[1], 249);
  *(void *)((((unint64_t)a2 - *((void *)a1 + 3)) >> 3) + *((void *)a1 + 1)) = 0xF9F9F9F9F9F9F9F9LL;
  return result;
}

void *ASanShadow::poisonAllocation( ASanShadow *a1, uint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v6 = a3 - a4;
  if (a3 <= a4) {
    ASanShadow::poisonAllocation();
  }
  if (v6 <= 0xF) {
    ASanShadow::poisonAllocation();
  }
  unint64_t result = ASanShadow::poison(a1, a2, a4, 0LL, v6, a5);
  if (((a3 + a2) & 7) != 0) {
    ASanShadow::poisonAllocation();
  }
  *(void *)(a3 + a2 - 16) = a3;
  return result;
}

void *ASanShadow::poisonNewAllocation( ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ASanShadow::poisonAllocation(this, a2, a3, a4, 251);
}

void *ASanShadow::poisonNewStackFrame( ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ASanShadow::poisonAllocation(this, a2, a3, a4, 243);
}

void *ASanShadow::poisonFreedAllocation(ASanShadow *this, uint64_t a2, uint64_t a3)
{
  unint64_t result = ASanShadow::poison(this, a2, 0LL, 0LL, a3, 253);
  if ((a2 & 7) != 0) {
    ASanShadow::poison((uint64_t)result, v6, v7);
  }
  *(_BYTE *)(((unint64_t)(a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1)) = -4;
  return result;
}

void *ASanShadow::poisonFreedStackFrame(ASanShadow *this, uint64_t a2, uint64_t a3)
{
  unint64_t result = ASanShadow::poison(this, a2, 0LL, 0LL, a3, 253);
  if ((a2 & 7) != 0) {
    ASanShadow::poison((uint64_t)result, v6, v7);
  }
  *(_BYTE *)(((unint64_t)(a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1)) = -4;
  return result;
}

void OUTLINED_FUNCTION_0_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void asan::ReportGenerator::createReport()
{
  __assert_rtn("createReport", "report_generator.cpp", 27, "shadowVal != ShadowValue::Valid");
}

void asan::ReportGenerator::addHeapBufferOverflowInfo()
{
}

void asan::ReportGenerator::addUseAfterFreeInfo()
{
}

void asan::ReportGenerator::addGlobalBufferOverflowInfo()
{
}

void asan::ReportGenerator::fillStackVarInfo()
{
  __assert_rtn("fillStackVarInfo", "report_generator.cpp", 88, "stackVar.offset != 0");
}

{
  __assert_rtn("fillStackVarInfo", "report_generator.cpp", 80, "alloc.isValid()");
}

void asan::ReportGenerator::StackVar::getStackVar()
{
  __assert_rtn("getStackVar", "report_generator.cpp", 191, "numVars != 0");
}

void trace::initTraceCollection()
{
  __assert_rtn("install", "malloc_logger.h", 76, "malloc_logger != loggerFunc");
}

void vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>( debug *a1, const char *a2)
{
}

void vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>()
{
  __assert_rtn("mapCommon", "vm_helpers.h", 26, "(size % vm_page_size) == 0");
}

void vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>( debug *a1, const char *a2)
{
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert()
{
}

void trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace()
{
  __assert_rtn("insertTrace", "trace_depot.h", 128, "length <= MaxTraceLength");
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace()
{
}

void libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc( uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1("collectTrace", "trace_depot.h", a3, "topFramesToSkip <= 6");
}

void MemoryReader::read()
{
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get()
{
}

void trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces()
{
}

void BlockInfo::endInclusive()
{
}

void asan::GlobalsRegistryImpl::registerSection()
{
}

void vm::create<asan::GlobalsRegistryImpl>(debug *a1, const char *a2)
{
}

void asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke()
{
  __assert_rtn("getGlobalsSection", "globals.cpp", 33, "(size % sizeof(GlobalVar)) == 0");
}

void asan::initRuntime()
{
}

void asan::initLibmallocHooks(Shadow *)::$_0::__invoke()
{
  __assert_rtn("operator()", "runtime.cpp", 43, "leftrz_sz == 0");
}

void __asan_locate_address_cold_1()
{
}

void __asan_locate_address_cold_2()
{
}

void __asan_locate_address_cold_3()
{
  __assert_rtn("__asan_locate_address", "debugger_abi.cpp", 37, "(uintptr_t)addr == report.access.address");
}

void __asan_get_alloc_stack_cold_1()
{
  __assert_rtn("__asan_get_alloc_stack", "debugger_abi.cpp", 62, "(uintptr_t)addr == report.access.address");
}

void __asan_get_free_stack_cold_1()
{
  __assert_rtn("__asan_get_free_stack", "debugger_abi.cpp", 67, "(uintptr_t)addr == report.access.address");
}

void asan::initShadow(debug *a1, const char *a2)
{
}

void ASanShadow::poison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("poison", "shadow.cpp", a3, "(base & (ASAN_SHADOW_ALIGNMENT - 1)) == 0");
}

void ASanShadow::getShadowValue()
{
  __assert_rtn("getShadowValue", "shadow.cpp", 271, "accessSize <= 16");
}

{
  __assert_rtn("getShadowValue", "shadow.cpp", 270, "addressIsInMem(addr)");
}

void ASanShadow::getAllocationEnd()
{
}

{
  __assert_rtn("getAllocationEnd", "shadow.cpp", 296, "*shadowVal > 0x8");
}

void ASanShadow::getAllocationInfo()
{
  __assert_rtn("getAllocationInfo", "shadow.cpp", 342, "allocation <= access.address && access.address < allocationEnd");
}

void ASanShadow::poisonAllocation()
{
  __assert_rtn("poisonAllocation", "shadow.cpp", 357, "redzoneSize >= 16");
}

{
  __assert_rtn("poisonAllocation", "shadow.cpp", 361, "endPtr % 8 == 0");
}

{
  __assert_rtn("poisonAllocation", "shadow.cpp", 355, "allocSize > userSize");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void _exit(int a1)
{
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1896004E0]();
}

void abort(void)
{
}

int backtrace_from_fp(void *startfp, void **array, int size)
{
  return MEMORY[0x1895FEF78](startfp, array, *(void *)&size);
}

void bzero(void *a1, size_t a2)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1895FEC68](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FF080](a1, a2);
}

void free(void *a1)
{
}

uint8_t *__cdecl getsectiondata( const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FECE0](mhp, segname, sectname, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

uint64_t malloc_sanitizer_set_functions()
{
  return MEMORY[0x1896002D8]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1896002E8](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FF168](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FF178](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FF180](__b, *(void *)&__c, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3B0](__str, __endptr, *(void *)&__base);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x1895FF408]();
}

kern_return_t vm_map( vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x189600130]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}