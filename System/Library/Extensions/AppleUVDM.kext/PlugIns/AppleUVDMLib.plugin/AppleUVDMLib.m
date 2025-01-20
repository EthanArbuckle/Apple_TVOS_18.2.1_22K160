uint64_t AppleUVDMLibPriv::queryInterfaceStatic(AppleUVDMLibPriv *this, void *a2, CFUUIDBytes a3, void **a4)
{
  void *v4;
  uint64_t v5;
  CFUUIDRef v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  uint64_t v9;
  uint64_t v10;
  CFUUIDRef v12;
  v4 = *(void **)&a3.byte8;
  v5 = *((void *)this + 1);
  v6 = CFUUIDCreateFromUUIDBytes(0LL, *(CFUUIDBytes *)&a2);
  v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v6, v8)))
  {
    v9 = 0LL;
    *v4 = v5 + 8;
    v10 = *(void *)(v5 + 16);
  }

  else
  {
    v12 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0xBDu,  0xD2u,  0x1Du,  0x9Au,  0xB0u,  0x5Cu,  0x4Du,  0x9Eu,  0xA7u,  0xBFu,  0xA2u,  0xDCu,  0xC5u,  0xF2u,  0xFFu,  0xB3u);
    if (!CFEqual(v6, v12))
    {
      *v4 = 0LL;
      v9 = 2147483652LL;
      goto LABEL_5;
    }

    v9 = 0LL;
    *v4 = v5 + 24;
    v10 = *(void *)(v5 + 32);
  }

  ++*(_DWORD *)(v10 + 48);
LABEL_5:
  CFRelease(v6);
  return v9;
}

uint64_t AppleUVDMLibPriv::addRefStatic(AppleUVDMLibPriv *this, void *a2)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t result = (*(_DWORD *)(v2 + 48) + 1);
  *(_DWORD *)(v2 + 48) = result;
  return result;
}

uint64_t AppleUVDMLibPriv::releaseStatic(AppleUVDMLibPriv *this, void *a2)
{
  uint64_t v2 = (unsigned int *)*((void *)this + 1);
  uint64_t v3 = v2[12];
  v2[12] = v3 - 1;
  if (v2) {
    BOOL v4 = (_DWORD)v3 == 1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    (*(void (**)(unsigned int *, void *))(*(void *)v2 + 8LL))(v2, a2);
  }
  return v3;
}

uint64_t AppleUVDMLibPriv::probeStatic( AppleUVDMLibPriv *this, void *a2, io_object_t object, unsigned int a4, int *a5)
{
  else {
    return 3758097090LL;
  }
}

uint64_t AppleUVDMLibPriv::startStatic(AppleUVDMLibPriv *this, void *a2, io_service_t service)
{
  uint64_t v3 = *((void *)this + 1);
  *(_DWORD *)(v3 + 52) = service;
  LODWORD(result) = IOServiceOpen(service, mach_task_self_, 0, (io_connect_t *)(v3 + 56));
  if (*(_DWORD *)(v3 + 56)) {
    return result;
  }
  else {
    return 3758097088LL;
  }
}

uint64_t AppleUVDMLibPriv::stopStatic(AppleUVDMLibPriv *this, void *a2)
{
  uint64_t v2 = *((void *)this + 1);
  io_connect_t v3 = *(_DWORD *)(v2 + 56);
  if (v3)
  {
    IOServiceClose(v3);
    *(_DWORD *)(v2 + 56) = 0;
  }

  return 0LL;
}

uint64_t AppleUVDMLibPriv::openEndpoint(AppleUVDMLibPriv *this, void *a2)
{
  uint64_t result = *(unsigned int *)(*((void *)this + 1) + 56LL);
  if ((_DWORD)result)
  {
    uint32_t outputCnt = 0;
    return IOConnectCallScalarMethod(result, 0, 0LL, 0, 0LL, &outputCnt) == 0;
  }

  return result;
}

uint64_t AppleUVDMLibPriv::closeEndpoint(AppleUVDMLibPriv *this, void *a2)
{
  uint64_t result = *(unsigned int *)(*((void *)this + 1) + 56LL);
  if ((_DWORD)result)
  {
    uint32_t outputCnt = 0;
    return IOConnectCallScalarMethod(result, 1u, 0LL, 0, 0LL, &outputCnt) == 0;
  }

  return result;
}

uint64_t AppleUVDMLibPriv::readAccess( AppleUVDMLibPriv *this, void *a2, vm_size_t size, _BYTE *a4, unsigned __int8 *a5, _BYTE *a6, unsigned __int8 *a7)
{
  unsigned int v8 = a5;
  unsigned int v10 = size;
  v19 = a2;
  uint64_t v11 = 3758097084LL;
  uint64_t v12 = *((void *)this + 1);
  int v13 = *(_DWORD *)(v12 + 56);
  vm_address_t address = 0LL;
  if (v13)
  {
    size_t v14 = size;
    this = (AppleUVDMLibPriv *)vm_allocate(mach_task_self_, &address, size, 1);
    if (address) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = 3758097086LL;
    }
  }

  else
  {
    size_t v14 = 0LL;
  }

  uint32_t outputCnt = 2;
  __chkstk_darwin(this);
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  if (!(_DWORD)v11)
  {
    input[0] = address;
    input[1] = v10;
    input[2] = v8;
    uint64_t v11 = IOConnectCallScalarMethod(*(_DWORD *)(v12 + 56), 2u, input, 3u, &v17, &outputCnt);
  }

  if (a4) {
    *a4 = v17;
  }
  uint64_t v15 = v18;
  if (a6) {
    *a6 = v18;
  }
  if (!(_DWORD)v11 && !v15 && v17) {
    memmove(v19, (const void *)address, v14);
  }
  if (address)
  {
    vm_deallocate(mach_task_self_, address, v14);
    vm_address_t address = 0LL;
  }

  return v11;
}

uint64_t AppleUVDMLibPriv::writeAccess( AppleUVDMLibPriv *this, void *a2, vm_size_t size, unsigned int a4, _BYTE *a5, unsigned __int8 *a6)
{
  uint64_t v7 = 3758097084LL;
  uint64_t v8 = *((void *)this + 1);
  int v9 = *(_DWORD *)(v8 + 56);
  vm_address_t address = 0LL;
  if (!v9)
  {
    size_t v12 = 0LL;
    goto LABEL_7;
  }

  size_t v12 = size;
  vm_allocate(mach_task_self_, &address, size, 1);
  this = (AppleUVDMLibPriv *)address;
  if (!address)
  {
    uint64_t v7 = 3758097086LL;
LABEL_7:
    uint32_t outputCnt = 1;
    __chkstk_darwin(this);
    uint64_t v15 = 0LL;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  int v13 = memmove((void *)address, a2, v12);
  uint32_t outputCnt = 1;
  __chkstk_darwin(v13);
  uint64_t v15 = 0LL;
  input[0] = address;
  input[1] = v12;
  input[2] = a4;
  uint64_t v7 = IOConnectCallScalarMethod(*(_DWORD *)(v8 + 56), 4u, input, 3u, &v15, &outputCnt);
  if (a5) {
LABEL_8:
  }
    *a5 = v15;
LABEL_9:
  if (address)
  {
    vm_deallocate(mach_task_self_, address, v12);
    vm_address_t address = 0LL;
  }

  return v7;
}

uint64_t AppleUVDMLibPriv::readStream( vm_address_t this, void *a2, vm_size_t size, _WORD *a4, unsigned __int16 *a5, unsigned __int8 *a6, int a7)
{
  uint64_t v10 = 3758097086LL;
  uint64_t v11 = *(void *)(this + 8);
  int v12 = *(_DWORD *)(v11 + 56);
  vm_address_t address = 0LL;
  if (!v12)
  {
    size_t v15 = 0LL;
    size_t v13 = 0LL;
    vm_address_t v22 = 0LL;
    uint64_t v10 = 3758097084LL;
    goto LABEL_8;
  }

  LODWORD(v13) = a7;
  size_t v15 = size;
  this = vm_allocate(mach_task_self_, &address, size, 1);
  vm_address_t v22 = 0LL;
  if (!address)
  {
    size_t v13 = 0LL;
    goto LABEL_8;
  }

  if ((_DWORD)v13)
  {
    size_t v13 = v13;
    vm_allocate(mach_task_self_, &v22, v13, 1);
    this = v22;
    if (!v22)
    {
LABEL_8:
      uint32_t outputCnt = 2;
      __chkstk_darwin(this);
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  else
  {
    this = 0LL;
    size_t v13 = 0LL;
  }

  uint64_t v18 = memmove((void *)this, a6, v13);
  uint32_t outputCnt = 2;
  __chkstk_darwin(v18);
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  input[0] = address;
  input[1] = v15;
  input[2] = v22;
  uint64_t input[3] = v13;
  uint64_t v10 = IOConnectCallScalarMethod(*(_DWORD *)(v11 + 56), 3u, input, 4u, &v19, &outputCnt);
  if (a4) {
LABEL_9:
  }
    *a4 = v19;
LABEL_10:
  uint64_t v16 = v20;
  if (a5) {
    *(_BYTE *)a5 = v20;
  }
  if (!(_DWORD)v10 && !v16 && v19) {
    memmove(a2, (const void *)address, v15);
  }
  if (address)
  {
    vm_deallocate(mach_task_self_, address, v15);
    vm_deallocate(mach_task_self_, v22, v13);
    vm_address_t address = 0LL;
  }

  return v10;
}

uint64_t AppleUVDMLibPriv::writeStream( AppleUVDMLibPriv *this, void *a2, vm_size_t size, unsigned int a4, _BYTE *a5, unsigned __int8 *a6)
{
  uint64_t v7 = 3758097084LL;
  uint64_t v8 = *((void *)this + 1);
  int v9 = *(_DWORD *)(v8 + 56);
  vm_address_t address = 0LL;
  if (!v9)
  {
    size_t v12 = 0LL;
    goto LABEL_7;
  }

  size_t v12 = size;
  vm_allocate(mach_task_self_, &address, size, 1);
  this = (AppleUVDMLibPriv *)address;
  if (!address)
  {
    uint64_t v7 = 3758097086LL;
LABEL_7:
    uint32_t outputCnt = 1;
    __chkstk_darwin(this);
    uint64_t v15 = 0LL;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  size_t v13 = memmove((void *)address, a2, v12);
  uint32_t outputCnt = 1;
  __chkstk_darwin(v13);
  uint64_t v15 = 0LL;
  input[0] = address;
  input[1] = v12;
  input[2] = a4;
  uint64_t v7 = IOConnectCallScalarMethod(*(_DWORD *)(v8 + 56), 5u, input, 3u, &v15, &outputCnt);
  if (a5) {
LABEL_8:
  }
    *a5 = v15;
LABEL_9:
  if (address)
  {
    vm_deallocate(mach_task_self_, address, v12);
    vm_address_t address = 0LL;
  }

  return v7;
}

uint64_t AppleUVDMLibPriv::getTransportParameters(uint64_t a1, void *outputStruct)
{
  if (!outputStruct) {
    return 3758097090LL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  size_t outputStructCnt = 4LL;
  return IOConnectCallStructMethod(*(_DWORD *)(v2 + 56), 6u, 0LL, 0LL, outputStruct, &outputStructCnt);
}

uint64_t AppleUVDMLibPriv::lockBus(AppleUVDMLibPriv *this, uint64_t a2)
{
  uint64_t input = a2;
  mach_port_t v2 = *(_DWORD *)(*((void *)this + 1) + 56LL);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 7u, &input, 1u, 0LL, 0LL);
  }
  else {
    return 3758097084LL;
  }
}

uint64_t AppleUVDMLibPriv::unlockBus(AppleUVDMLibPriv *this, void *a2)
{
  mach_port_t v2 = *(_DWORD *)(*((void *)this + 1) + 56LL);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 7u, 0LL, 0, 0LL, 0LL);
  }
  else {
    return 3758097084LL;
  }
}

void *AppleUVDMLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0x10u,  0x90u,  0x3Au,  0x4Fu,  0x57u,  0x90u,  0x45u,  0xD3u,  0xB1u,  0xFAu,  0xABu,  0x3Eu,  0x75u,  0x85u,  0xC8u,  0x63u);
  BOOL v4 = (AppleUVDMLibPriv *)CFEqual(a2, v3);
  if ((_DWORD)v4) {
    return AppleUVDMLibPriv::alloc(v4);
  }
  else {
    return 0LL;
  }
}

void *AppleUVDMLibPriv::alloc(AppleUVDMLibPriv *this)
{
  v1 = (AppleUVDMLibPriv *)operator new(0x40uLL);
  AppleUVDMLibPriv::AppleUVDMLibPriv(v1);
  uint64_t result = (void *)((char *)v1 + 8);
  ++*(_DWORD *)(*((void *)v1 + 2) + 48LL);
  return result;
}

void sub_3CD4(_Unwind_Exception *a1)
{
}

void AppleUVDMLibPriv::AppleUVDMLibPriv(AppleUVDMLibPriv *this)
{
  *((_DWORD *)this + 12) = 0;
  *(void *)this = off_40E0;
  *((void *)this + 1) = &AppleUVDMLibPriv::sIOCFPlugInVTable;
  *((void *)this + 2) = this;
  *((void *)this + 3) = &AppleUVDMLibPriv::sAppleUVDMLibVTable;
  *((void *)this + 4) = this;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0xC9u,  0x26u,  0x95u,  0x29u,  0xEEu,  0x32u,  0x48u,  0x43u,  0x89u,  0,  0x3Fu,  0x36u,  0xA1u,  0x55u,  0xFBu,  0xBCu);
  *((void *)this + 5) = v2;
  CFRetain(v2);
  CFPlugInAddInstanceForFactory(*((CFUUIDRef *)this + 5));
}

void AppleUVDMLibPriv::~AppleUVDMLibPriv(CFUUIDRef *this)
{
  *this = (CFUUIDRef)off_40E0;
  CFPlugInRemoveInstanceForFactory(this[5]);
  CFRelease(this[5]);
}

{
  void *v1;
  AppleUVDMLibPriv::~AppleUVDMLibPriv(this);
  operator delete(v1);
}

void sub_3DD4(void *a1)
{
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