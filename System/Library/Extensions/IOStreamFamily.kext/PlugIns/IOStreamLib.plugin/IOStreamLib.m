char *IOStreamLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  IOStreamServiceClass *v4;
  v3 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorDefault,  0x57u,  0xC8u,  0x94u,  0x38u,  0xA0u,  0xA2u,  0x4Au,  0xFCu,  0x9Fu,  0xF2u,  0xDEu,  0x64u,  0xC0u,  0x2Fu,  0x81u,  0x5Cu);
  v4 = (IOStreamServiceClass *)CFEqual(a2, v3);
  if ((_DWORD)v4) {
    return IOStreamServiceClass::alloc(v4);
  }
  else {
    return 0LL;
  }
}

void IOStreamIUnknown::factoryAddRef(IOStreamIUnknown *this)
{
  if (!IOStreamIUnknown::factoryRefCount++)
  {
    CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorDefault,  0x1Au,  0x3Cu,  0x8Au,  0x6Au,  0xBDu,  0x6Au,  0x41u,  0xADu,  0x93u,  0xB0u,  0x47u,  0x89u,  0xA2u,  0x33u,  0x3Bu,  0xADu);
    CFRetain(v2);
    CFPlugInAddInstanceForFactory(v2);
  }
}

void IOStreamIUnknown::factoryRelease(IOStreamIUnknown *this)
{
  int v1 = IOStreamIUnknown::factoryRefCount--;
  if (IOStreamIUnknown::factoryRefCount)
  {
    if (v1 <= 0) {
      IOStreamIUnknown::factoryRefCount = 0;
    }
  }

  else
  {
    CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorDefault,  0x1Au,  0x3Cu,  0x8Au,  0x6Au,  0xBDu,  0x6Au,  0x41u,  0xADu,  0x93u,  0xB0u,  0x47u,  0x89u,  0xA2u,  0x33u,  0x3Bu,  0xADu);
    CFPlugInRemoveInstanceForFactory(v2);
    CFRelease(v2);
  }

void IOStreamIUnknown::IOStreamIUnknown(IOStreamIUnknown *this, void *a2)
{
  *(void *)this = off_4130;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = this;
  IOStreamIUnknown::factoryAddRef(this);
}

void IOStreamIUnknown::~IOStreamIUnknown(IOStreamIUnknown *this)
{
  *(void *)this = off_4130;
  IOStreamIUnknown::factoryRelease(this);
}

uint64_t IOStreamIUnknown::addRef(IOStreamIUnknown *this)
{
  uint64_t v1 = (*((_DWORD *)this + 2) + 1);
  *((_DWORD *)this + 2) = v1;
  return v1;
}

uint64_t IOStreamIUnknown::release(IOStreamIUnknown *this)
{
  int v1 = *((_DWORD *)this + 2);
  uint64_t v2 = (v1 - 1);
  if (v1 == 1)
  {
    *((_DWORD *)this + 2) = 0;
    (*(void (**)(IOStreamIUnknown *))(*(void *)this + 8LL))(this);
  }

  else
  {
    *((_DWORD *)this + 2) = v2;
  }

  return v2;
}

uint64_t IOStreamIUnknown::genericQueryInterface(IOStreamIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(void, void *, void, void))(**((void **)this + 1) + 16LL))( *((void *)this + 1),  a2,  *(void *)&a3.byte0,  *(void *)&a3.byte8);
}

uint64_t IOStreamIUnknown::genericAddRef(IOStreamIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 24LL))(*((void *)this + 1));
}

uint64_t IOStreamIUnknown::genericRelease(IOStreamIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 32LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_probe( IOStreamServiceClass *this, void *a2, const __CFDictionary *a3, unsigned int a4, int *a5)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 40LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOStreamServiceClass::_start(IOStreamServiceClass *this, void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 48LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOStreamServiceClass::_stop(IOStreamServiceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 56LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_open(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 64LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_close(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 72LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_getBufferCount(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 80LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_getBufferInfo( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, uint64_t a3, void **a4, unint64_t *a5, void **a6, unint64_t *a7)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **, uint64_t, void **, unint64_t *, void **))(**((void **)this + 1) + 88LL))( *((void *)this + 1),  a2,  a3,  a4,  a5,  a6);
}

uint64_t IOStreamServiceClass::_getOutputPort(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 96LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_getInputPort(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 104LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_getOutputQueue(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 112LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_getInputQueue(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 120LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_setOutputCallback( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, void (*a3)(IOStreamInterface_v1_t **, void *), void *a4)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **, void (*)(IOStreamInterface_v1_t **, void *)))(**((void **)this + 1) + 128LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOStreamServiceClass::_getRunLoopSource(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 136LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_addToRunLoop( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, __CFRunLoop *a3)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 144LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_removeFromRunLoop( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, __CFRunLoop *a3)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 152LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_dequeueOutputEntry( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, IOStreamBufferQueueEntry *a3)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 160LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_enqueueInputEntry( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, IOStreamBufferQueueEntry *a3)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 168LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_enqueueInputBuffer(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 176LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_sendInputNotification( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 184LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_sendInputSyncNotification( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 192LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_getDataBuffer(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 200LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_getDataBufferLength(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 208LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_getControlBuffer(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 216LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_getControlBufferLength( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 224LL))( *((void *)this + 1),  a2);
}

uint64_t IOStreamServiceClass::_startStream(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 232LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_stopStream(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 240LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_suspendStream(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 248LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_getMode(IOStreamServiceClass *this, IOStreamInterface_v1_t **a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 256LL))(*((void *)this + 1));
}

uint64_t IOStreamServiceClass::_setMode( IOStreamServiceClass *this, IOStreamInterface_v1_t **a2, IOStreamMode a3)
{
  return (*(uint64_t (**)(void, IOStreamInterface_v1_t **))(**((void **)this + 1) + 264LL))( *((void *)this + 1),  a2);
}

void IOStreamServiceClass::IOStreamServiceClass(IOStreamServiceClass *this)
{
  *(void *)uint64_t v1 = off_4178;
  *(void *)(v1 + 32) = &IOStreamServiceClass::sIOStreamInterfaceV1;
  *(void *)(v1 + 40) = v1;
  *(_DWORD *)(v1 + 48) = 0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
}

{
  uint64_t v1;
  IOStreamIUnknown::IOStreamIUnknown(this, &IOStreamServiceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_4178;
  *(void *)(v1 + 32) = &IOStreamServiceClass::sIOStreamInterfaceV1;
  *(void *)(v1 + 40) = v1;
  *(_DWORD *)(v1 + 48) = 0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
}

void IOStreamServiceClass::~IOStreamServiceClass(IOStreamServiceClass *this)
{
  *(void *)this = off_4178;
  io_object_t v2 = *((_DWORD *)this + 12);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 12) = 0;
  }

  uint64_t v3 = *((void *)this + 9);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 24LL))(v3);
    *((void *)this + 9) = 0LL;
  }

  v4 = (IOCFPlugInInterface **)*((void *)this + 8);
  if (v4)
  {
    IODestroyPlugInInterface(v4);
    *((void *)this + 8) = 0LL;
  }

  IOStreamIUnknown::~IOStreamIUnknown(this);
}

{
  IOStreamServiceClass::~IOStreamServiceClass(this);
  operator delete(this);
}

void sub_303C(_Unwind_Exception *a1)
{
}

void sub_3054(void *a1)
{
}

void sub_308C(_Unwind_Exception *a1)
{
}

char *IOStreamServiceClass::alloc(IOStreamServiceClass *this)
{
  uint64_t v1 = (char *)operator new(0x98uLL);
  IOStreamIUnknown::IOStreamIUnknown((IOStreamIUnknown *)v1, &IOStreamServiceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_4178;
  *((void *)v1 + 4) = &IOStreamServiceClass::sIOStreamInterfaceV1;
  *((void *)v1 + 5) = v1;
  *((_DWORD *)v1 + 12) = 0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  result = v1 + 16;
  *(_OWORD *)(v1 + 136) = 0u;
  return result;
}

void sub_310C(_Unwind_Exception *a1)
{
}

uint64_t IOStreamServiceClass::queryInterface(IOStreamServiceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v5, v7)))
  {
    v8 = (char *)this + 16;
    uint64_t v9 = *(void *)this;
LABEL_4:
    *a3 = v8;
    (*(void (**)(IOStreamServiceClass *))(v9 + 24))(this);
    goto LABEL_5;
  }

  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorDefault,  0xE2u,  0xDFu,  0xDFu,  0x5Fu,  0x3Fu,  0xADu,  0x44u,  0x87u,  0x9Eu,  0xEAu,  0x3Fu,  0xCFu,  0x14u,  0x7Eu,  0xBBu,  0x3Du);
  if (CFEqual(v5, v12))
  {
    v8 = (char *)this + 32;
    uint64_t v9 = *(void *)this;
    goto LABEL_4;
  }

  *a3 = 0LL;
LABEL_5:
  if (*a3) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = 2147483652LL;
  }
  CFRelease(v5);
  return v10;
}

uint64_t IOStreamServiceClass::probe( IOStreamServiceClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4 = 3758097090LL;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOStream")) {
      return 0LL;
    }
    else {
      return 3758097090LL;
    }
  }

  return v4;
}

uint64_t IOStreamServiceClass::start( IOStreamServiceClass *this, const __CFDictionary *a2, io_object_t object)
{
  *((_DWORD *)this + 12) = object;
  IOObjectRetain(object);
  return IOServiceOpen(object, mach_task_self_, 0, (io_connect_t *)this + 20);
}

uint64_t IOStreamServiceClass::stop(IOStreamServiceClass *this)
{
  return 0LL;
}

uint64_t IOStreamServiceClass::open(IOStreamServiceClass *this, int a2)
{
  int inputStruct = a2;
  mach_port_t v3 = *((_DWORD *)this + 20);
  size_t outputStructCnt = 0LL;
  uint64_t v4 = IOConnectCallStructMethod(v3, 0, &inputStruct, 4uLL, 0LL, &outputStructCnt);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = IOConnectMapMemory(*((_DWORD *)this + 20), 0x10000000u, mach_task_self_, &atAddress, &outputStructCnt, 1u);
    if (!(_DWORD)v4)
    {
      *((void *)this + 11) = atAddress;
      uint64_t v4 = IOConnectMapMemory(*((_DWORD *)this + 20), 0x20000000u, mach_task_self_, &atAddress, &outputStructCnt, 1u);
      if (!(_DWORD)v4)
      {
        unsigned int v7 = (*(uint64_t (**)(IOStreamServiceClass *))(*(void *)this + 80LL))(this);
        *((void *)this + 12) = atAddress;
        v8 = malloc(32LL * v7);
        *((void *)this + 18) = v8;
        if (v8)
        {
          if (!v7) {
            return 0LL;
          }
          int v9 = 0;
          uint64_t v10 = 0LL;
          uint64_t v11 = 32LL * v7;
          while (1)
          {
            uint64_t v12 = IOConnectMapMemory( *((_DWORD *)this + 20),  v9 | 0x30000000,  mach_task_self_,  (mach_vm_address_t *)(*((void *)this + 18) + v10 + 16),  (mach_vm_size_t *)(*((void *)this + 18) + v10 + 24),  1u);
            if ((_DWORD)v12) {
              break;
            }
            if (IOConnectMapMemory( *((_DWORD *)this + 20),  v9 | 0x40000000,  mach_task_self_,  (mach_vm_address_t *)(*((void *)this + 18) + v10),  (mach_vm_size_t *)(*((void *)this + 18) + v10 + 8),  1u))
            {
              v13 = (void *)(*((void *)this + 18) + v10);
              void *v13 = 0LL;
              v13[1] = 0LL;
            }

            uint64_t v4 = 0LL;
            v10 += 32LL;
            ++v9;
            if (v11 == v10) {
              return v4;
            }
          }

          uint64_t v4 = v12;
        }

        else
        {
          uint64_t v4 = 0LL;
        }
      }
    }
  }

  CFUUIDRef v5 = (void *)*((void *)this + 18);
  if (v5) {
    free(v5);
  }
  *((_DWORD *)this + 21) = 0;
  return v4;
}

uint64_t IOStreamServiceClass::close(IOStreamServiceClass *this)
{
  mach_port_t v2 = *((_DWORD *)this + 20);
  size_t outputStructCnt = 0LL;
  uint64_t result = IOConnectCallStructMethod(v2, 1u, 0LL, 0LL, 0LL, &outputStructCnt);
  if (!(_DWORD)result)
  {
    if ((*(unsigned int (**)(IOStreamServiceClass *))(*(void *)this + 80LL))(this))
    {
      uint64_t v4 = 0LL;
      unint64_t v5 = 0LL;
      do
      {
        IOConnectUnmapMemory( *((_DWORD *)this + 20),  v5 | 0x30000000,  mach_task_self_,  *(void *)(*((void *)this + 18) + v4 + 16));
        mach_vm_address_t v6 = *(void *)(*((void *)this + 18) + v4);
        if (v6) {
          IOConnectUnmapMemory(*((_DWORD *)this + 20), v5 | 0x40000000, mach_task_self_, v6);
        }
        ++v5;
        v4 += 32LL;
      }

      while (v5 < (*(unsigned int (**)(IOStreamServiceClass *))(*(void *)this + 80LL))(this));
    }

    unsigned int v7 = (const void *)*((void *)this + 14);
    if (v7)
    {
      CFRelease(v7);
      *((void *)this + 14) = 0LL;
    }

    v8 = (const void *)*((void *)this + 13);
    if (v8)
    {
      CFRelease(v8);
      *((void *)this + 13) = 0LL;
    }

    int v9 = (const void *)*((void *)this + 17);
    if (v9)
    {
      CFRelease(v9);
      *((void *)this + 17) = 0LL;
    }

    uint64_t v10 = (const void *)*((void *)this + 14);
    if (v10)
    {
      CFRelease(v10);
      *((void *)this + 14) = 0LL;
    }

    uint64_t v11 = (void *)*((void *)this + 18);
    if (v11) {
      free(v11);
    }
    uint64_t result = 0LL;
    *((_DWORD *)this + 21) = 0;
  }

  return result;
}

uint64_t IOStreamServiceClass::getBufferCount(IOStreamServiceClass *this)
{
  uint64_t result = *((unsigned int *)this + 21);
  if (!(_DWORD)result)
  {
    unsigned int outputStruct = 0;
    size_t outputStructCnt = 4LL;
    if (IOConnectCallStructMethod(*((_DWORD *)this + 20), 7u, 0LL, 0LL, &outputStruct, &outputStructCnt))
    {
      return *((unsigned int *)this + 21);
    }

    else
    {
      uint64_t result = outputStruct;
      *((_DWORD *)this + 21) = outputStruct;
    }
  }

  return result;
}

uint64_t IOStreamServiceClass::getBufferInfo( IOStreamServiceClass *this, unsigned int a2, void **a3, unint64_t *a4, void **a5, unint64_t *a6)
{
  uint64_t v13 = *((void *)this + 18);
  uint64_t v14 = v13 + 32LL * a2;
  if (a3) {
    *a3 = *(void **)(v14 + 16);
  }
  if (a4) {
    *a4 = *(void *)(v13 + 32LL * a2 + 24);
  }
  if (a5) {
    *a5 = *(void **)v14;
  }
  uint64_t result = 0LL;
  if (a6) {
    *a6 = *(void *)(v13 + 32LL * a2 + 8);
  }
  return result;
}

uint64_t IOStreamServiceClass::_allocateNotificationPort(IOStreamServiceClass *this)
{
  mach_port_name_t name = 0;
  mach_port_allocate(mach_task_self_, 1u, &name);
  mach_msg_type_number_t port_info_outCnt = 1;
  mach_port_get_attributes(mach_task_self_, name, 1, &port_info_out, &port_info_outCnt);
  integer_t port_info_out = 1;
  mach_port_set_attributes(mach_task_self_, name, 1, &port_info_out, 1u);
  return name;
}

uint64_t IOStreamServiceClass::_outputPortCallback( IOStreamServiceClass *this, __CFMachPort *a2, void *a3, uint64_t a4, void *a5)
{
  if (a4) {
    return (*(uint64_t (**)(uint64_t, void))(a4 + 120))(a4 + 32, *(void *)(a4 + 128));
  }
  return result;
}

uint64_t IOStreamServiceClass::getOutputPort(IOStreamServiceClass *this)
{
  kern_return_t v6;
  CFMachPortContext v7;
  uint64_t result = *((void *)this + 13);
  if (!result)
  {
    v7.version = 0LL;
    memset(&v7.retain, 0, 24);
    v7.info = this;
    mach_port_t NotificationPort = IOStreamServiceClass::_allocateNotificationPort(0LL);
    if (NotificationPort
      && (mach_port_t v4 = NotificationPort,
          (CFMachPortRef v5 = CFMachPortCreateWithPort( kCFAllocatorDefault,  NotificationPort,  (CFMachPortCallBack)IOStreamServiceClass::_outputPortCallback,  &v7,  0LL)) != 0LL))
    {
      *((void *)this + 13) = v5;
      mach_vm_address_t v6 = IOConnectSetNotificationPort(*((_DWORD *)this + 20), 0, v4, 0LL);
      uint64_t result = 0LL;
      if (!v6) {
        return *((void *)this + 13);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t IOStreamServiceClass::getInputPort(IOStreamServiceClass *this)
{
  return *((void *)this + 17);
}

uint64_t IOStreamServiceClass::getOutputQueue(IOStreamServiceClass *this)
{
  return *((void *)this + 11);
}

uint64_t IOStreamServiceClass::getInputQueue(IOStreamServiceClass *this)
{
  return *((void *)this + 12);
}

uint64_t IOStreamServiceClass::setOutputCallback( IOStreamServiceClass *this, void (*a2)(IOStreamInterface_v1_t **, void *), void *a3)
{
  uint64_t result = 0LL;
  *((void *)this + 15) = a2;
  *((void *)this + 16) = a3;
  return result;
}

__CFMachPort *IOStreamServiceClass::getRunLoopSource(IOStreamServiceClass *this)
{
  uint64_t result = (__CFMachPort *)*((void *)this + 14);
  if (!result)
  {
    uint64_t result = (__CFMachPort *)(*(uint64_t (**)(IOStreamServiceClass *))(*(void *)this + 96LL))(this);
    if (result)
    {
      uint64_t result = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, result, 0LL);
      *((void *)this + 14) = result;
    }
  }

  return result;
}

uint64_t IOStreamServiceClass::addToRunLoop(IOStreamServiceClass *this, __CFRunLoop *a2)
{
  uint64_t v4 = 3758097084LL;
  CFMachPortRef v5 = (__CFRunLoopSource *)(*(uint64_t (**)(IOStreamServiceClass *))(*(void *)this + 136LL))(this);
  if (v5)
  {
    CFRunLoopAddSource(a2, v5, kCFRunLoopCommonModes);
    return 0LL;
  }

  return v4;
}

uint64_t IOStreamServiceClass::removeFromRunLoop(IOStreamServiceClass *this, __CFRunLoop *a2)
{
  uint64_t v4 = 3758097084LL;
  CFMachPortRef v5 = (__CFRunLoopSource *)(*(uint64_t (**)(IOStreamServiceClass *))(*(void *)this + 136LL))(this);
  if (v5)
  {
    CFRunLoopRemoveSource(a2, v5, kCFRunLoopCommonModes);
    return 0LL;
  }

  return v4;
}

__n128 IOStreamServiceClass::dequeueOutputEntry(IOStreamServiceClass *this, IOStreamBufferQueueEntry *a2)
{
  mach_port_t v2 = (_DWORD *)*((void *)this + 11);
  if (v2)
  {
    uint64_t v3 = v2[1];
    if ((_DWORD)v3 != v2[2])
    {
      else {
        int v4 = 0;
      }
      CFMachPortRef v5 = (__n128 *)&v2[8 * v3];
      __n128 result = v5[1];
      __n128 v7 = v5[2];
      *(__n128 *)&a2->bufferID = result;
      *(__n128 *)&a2->controlLength = v7;
      *(_DWORD *)(*((void *)this + 11) + 4LL) = v4;
    }
  }

  return result;
}

__n128 IOStreamServiceClass::enqueueInputEntry(IOStreamServiceClass *this, IOStreamBufferQueueEntry *a2)
{
  mach_port_t v2 = (_DWORD *)*((void *)this + 12);
  if (v2 && a2)
  {
    uint64_t v3 = v2[2];
    else {
      int v4 = 0;
    }
    if (v4 != v2[1])
    {
      CFMachPortRef v5 = &v2[8 * v3];
      __n128 result = *(__n128 *)&a2->bufferID;
      __int128 v7 = *(_OWORD *)&a2->controlLength;
      *((_OWORD *)v5 + 1) = *(_OWORD *)&a2->bufferID;
      *((_OWORD *)v5 + 2) = v7;
      *(_DWORD *)(*((void *)this + 12) + 8LL) = v4;
    }
  }

  return result;
}

uint64_t IOStreamServiceClass::enqueueInputBuffer( IOStreamServiceClass *this, int a2, int a3, int a4, int a5, int a6)
{
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  v7[4] = a6;
  return (*(uint64_t (**)(IOStreamServiceClass *, _DWORD *))(*(void *)this + 168LL))(this, v7);
}

uint64_t IOStreamServiceClass::sendInputNotification(IOStreamServiceClass *this)
{
  io_connect_t v1 = *((_DWORD *)this + 20);
  if (v1) {
    return IOConnectTrap1(v1, 0, 0LL);
  }
  else {
    return 3758097112LL;
  }
}

uint64_t IOStreamServiceClass::sendInputSyncNotification(IOStreamServiceClass *this)
{
  io_connect_t v1 = *((_DWORD *)this + 20);
  if (v1) {
    return IOConnectTrap1(v1, 1u, 0LL);
  }
  else {
    return 3758097112LL;
  }
}

uint64_t IOStreamServiceClass::getDataBuffer(IOStreamServiceClass *this, uint64_t a2)
{
  if ((*(unsigned int (**)(IOStreamServiceClass *, uint64_t, uint64_t *, void, void, void))(*(void *)this + 88LL))( this,  a2,  &v3,  0LL,  0LL,  0LL))
  {
    return 0LL;
  }

  else
  {
    return v3;
  }

uint64_t IOStreamServiceClass::getDataBufferLength(IOStreamServiceClass *this, uint64_t a2)
{
  if ((*(unsigned int (**)(IOStreamServiceClass *, uint64_t, void, uint64_t *, void, void))(*(void *)this + 88LL))( this,  a2,  0LL,  &v3,  0LL,  0LL))
  {
    return 0LL;
  }

  else
  {
    return v3;
  }

uint64_t IOStreamServiceClass::getControlBuffer(IOStreamServiceClass *this, uint64_t a2)
{
  if ((*(unsigned int (**)(IOStreamServiceClass *, uint64_t, void, void, uint64_t *, void))(*(void *)this + 88LL))( this,  a2,  0LL,  0LL,  &v3,  0LL))
  {
    return 0LL;
  }

  else
  {
    return v3;
  }

uint64_t IOStreamServiceClass::getControlBufferLength(IOStreamServiceClass *this, uint64_t a2)
{
  if ((*(unsigned int (**)(IOStreamServiceClass *, uint64_t, void, void, void, uint64_t *))(*(void *)this + 88LL))( this,  a2,  0LL,  0LL,  0LL,  &v3))
  {
    return 0LL;
  }

  else
  {
    return v3;
  }

uint64_t IOStreamServiceClass::startStream(IOStreamServiceClass *this)
{
  mach_port_t v1 = *((_DWORD *)this + 20);
  size_t outputStructCnt = 0LL;
  return IOConnectCallStructMethod(v1, 2u, 0LL, 0LL, 0LL, &outputStructCnt);
}

uint64_t IOStreamServiceClass::stopStream(IOStreamServiceClass *this)
{
  size_t outputStructCnt = 0LL;
  return IOConnectCallStructMethod(*((_DWORD *)this + 20), 3u, 0LL, 0LL, 0LL, &outputStructCnt);
}

uint64_t IOStreamServiceClass::suspendStream(IOStreamServiceClass *this)
{
  mach_port_t v1 = *((_DWORD *)this + 20);
  size_t outputStructCnt = 0LL;
  return IOConnectCallStructMethod(v1, 4u, 0LL, 0LL, 0LL, &outputStructCnt);
}

uint64_t IOStreamServiceClass::getMode(IOStreamServiceClass *this)
{
  unsigned int outputStruct = 1;
  size_t v2 = 4LL;
  IOConnectCallStructMethod(*((_DWORD *)this + 20), 5u, 0LL, 0LL, &outputStruct, &v2);
  return outputStruct;
}

uint64_t IOStreamServiceClass::setMode(IOStreamServiceClass *this, IOStreamMode a2)
{
  IOStreamMode inputStruct = a2;
  mach_port_t v2 = *((_DWORD *)this + 20);
  size_t outputStructCnt = 0LL;
  return IOConnectCallStructMethod(v2, 6u, &inputStruct, 4uLL, 0LL, &outputStructCnt);
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