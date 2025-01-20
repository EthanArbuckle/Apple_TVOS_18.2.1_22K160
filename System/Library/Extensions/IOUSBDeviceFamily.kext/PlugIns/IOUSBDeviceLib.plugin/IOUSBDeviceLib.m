char *IOUSBDeviceLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  IOUSBDeviceInterfaceClass *v4;
  v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Eu,  0x72u,  0x21u,  0x7Eu,  0x8Au,  0x60u,  0x11u,  0xDBu,  0xBFu,  0x57u,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
  v4 = (IOUSBDeviceInterfaceClass *)CFEqual(a2, v3);
  if ((_DWORD)v4) {
    return IOUSBDeviceInterfaceClass::alloc(v4);
  }
  else {
    return 0LL;
  }
}

void IOUSBDeviceIUnknown::factoryAddRef(IOUSBDeviceIUnknown *this)
{
  if (!IOUSBDeviceIUnknown::factoryRefCount++)
  {
    CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xD9u,  0x5Cu,  0xE1u,  0xD0u,  0x8Bu,  0xCCu,  0x11u,  0xDBu,  0xADu,  0,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
    CFRetain(v2);
    CFPlugInAddInstanceForFactory(v2);
  }
}

void IOUSBDeviceIUnknown::factoryRelease(IOUSBDeviceIUnknown *this)
{
  int v1 = IOUSBDeviceIUnknown::factoryRefCount--;
  if (IOUSBDeviceIUnknown::factoryRefCount)
  {
    if (v1 <= 0) {
      IOUSBDeviceIUnknown::factoryRefCount = 0;
    }
  }

  else
  {
    CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xD9u,  0x5Cu,  0xE1u,  0xD0u,  0x8Bu,  0xCCu,  0x11u,  0xDBu,  0xADu,  0,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
    CFPlugInRemoveInstanceForFactory(v2);
    CFRelease(v2);
  }

void IOUSBDeviceIUnknown::IOUSBDeviceIUnknown(IOUSBDeviceIUnknown *this, void *a2)
{
  *(void *)this = off_18A341C28;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = this;
  IOUSBDeviceIUnknown::factoryAddRef(this);
}

void IOUSBDeviceIUnknown::~IOUSBDeviceIUnknown(IOUSBDeviceIUnknown *this)
{
  *(void *)this = off_18A341C28;
  IOUSBDeviceIUnknown::factoryRelease(this);
}

void sub_18909E820(void *a1)
{
}

uint64_t IOUSBDeviceIUnknown::addRef(IOUSBDeviceIUnknown *this)
{
  uint64_t v1 = (*((_DWORD *)this + 2) + 1);
  *((_DWORD *)this + 2) = v1;
  return v1;
}

uint64_t IOUSBDeviceIUnknown::release(IOUSBDeviceIUnknown *this)
{
  int v1 = *((_DWORD *)this + 2);
  uint64_t v2 = (v1 - 1);
  if (v1 == 1)
  {
    *((_DWORD *)this + 2) = 0;
    (*(void (**)(IOUSBDeviceIUnknown *))(*(void *)this + 8LL))(this);
  }

  else
  {
    *((_DWORD *)this + 2) = v2;
  }

  return v2;
}

uint64_t IOUSBDeviceIUnknown::genericQueryInterface( IOUSBDeviceIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(void, void *, void, void))(**((void **)this + 1) + 16LL))( *((void *)this + 1),  a2,  *(void *)&a3.byte0,  *(void *)&a3.byte8);
}

uint64_t IOUSBDeviceIUnknown::genericAddRef(IOUSBDeviceIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 24LL))(*((void *)this + 1));
}

uint64_t IOUSBDeviceIUnknown::genericRelease(IOUSBDeviceIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 32LL))(*((void *)this + 1));
}

uint64_t IOUSBDeviceInterfaceClass::_probe( IOUSBDeviceInterfaceClass *this, void *a2, const __CFDictionary *a3, unsigned int a4, int *a5)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 40LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOUSBDeviceInterfaceClass::_start( IOUSBDeviceInterfaceClass *this, void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 48LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOUSBDeviceInterfaceClass::_stop(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 56LL))(*((void *)this + 1));
}

uint64_t IOUSBDeviceInterfaceClass::_open(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 64LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_close(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 72LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_scheduleWithRunLoop( IOUSBDeviceInterfaceClass *this, void *a2, __CFRunLoop *a3, const __CFString *a4)
{
  return (*(uint64_t (**)(void, void *, __CFRunLoop *))(**((void **)this + 1) + 80LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOUSBDeviceInterfaceClass::_unscheduleFromRunLoop( IOUSBDeviceInterfaceClass *this, void *a2, __CFRunLoop *a3, const __CFString *a4)
{
  return (*(uint64_t (**)(void, void *, __CFRunLoop *))(**((void **)this + 1) + 88LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOUSBDeviceInterfaceClass::_setClassCommandCallbacks(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 272LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_setMessageCallback( IOUSBDeviceInterfaceClass *this, void *a2, void (*a3)(void *, unsigned int, void *, void *), void *a4, void *a5)
{
  return (*(uint64_t (**)(void, void *, void, void *))(**((void **)this + 1) + 168LL))( *((void *)this + 1),  a2,  a3,  a4);
}

uint64_t IOUSBDeviceInterfaceClass::_setDescription( IOUSBDeviceInterfaceClass *this, void *a2, const __CFString *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 104LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_setClassForAlternateSetting(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 112LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_setSubClassForAlternateSetting( IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 120LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_setProtocolForAlternateSetting( IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 128LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_appendStandardClassOrVendorDescriptor( IOUSBDeviceInterfaceClass *this, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  return (*(uint64_t (**)(void, void *, uint64_t, unsigned __int8 *))(**((void **)this + 1) + 136LL))( *((void *)this + 1),  a2,  a3,  a4);
}

uint64_t IOUSBDeviceInterfaceClass::_appendNonStandardClassOrVendorDescriptor( IOUSBDeviceInterfaceClass *this, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  return (*(uint64_t (**)(void, void *, uint64_t, unsigned __int8 *))(**((void **)this + 1) + 144LL))( *((void *)this + 1),  a2,  a3,  a4);
}

uint64_t IOUSBDeviceInterfaceClass::_createPipe( IOUSBDeviceInterfaceClass *this, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, unint64_t *a9)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 160LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_commitConfiguration(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 152LL))(*((void *)this + 1));
}

uint64_t IOUSBDeviceInterfaceClass::_setAlternateSetting(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 176LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_readPipe(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 192LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_readPipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 200LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipe(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 216LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 224LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_stallPipe(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 240LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_abortPipe(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 248LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_getPipeCurrentMaxPacketSize( IOUSBDeviceInterfaceClass *this, void *a2, unint64_t a3, int *a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 256LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_createData(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 264LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_isActivated(IOUSBDeviceInterfaceClass *this, void *a2, int *a3, int *a4)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 184LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOUSBDeviceInterfaceClass::_registerForDemandLaunch( IOUSBDeviceInterfaceClass *this, void *a2, const __CFString *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 96LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_readIsochPipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 208LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writeIsochPipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 232LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_unlockConfiguration(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 280LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_readPipeTO(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 288LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_readPipeAsyncTO(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 296LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipeTO(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 304LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipeAsyncTO(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 312LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_isActive(IOUSBDeviceInterfaceClass *this, void *a2, int *a3, int *a4)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 320LL))( *((void *)this + 1),  a2,  a3);
}

uint64_t IOUSBDeviceInterfaceClass::_findPipe( IOUSBDeviceInterfaceClass *this, void *a2, int a3, int a4, int a5, unint64_t *a6)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 328LL))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_mapIOBuffer(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 336LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_setPipeProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 344LL))(*(void *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_reportTimeout(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 352LL))(*((void *)this + 1), a2);
}

void IOUSBDeviceInterfaceClass::IOUSBDeviceInterfaceClass(IOUSBDeviceInterfaceClass *this)
{
  *(void *)uint64_t v1 = off_18A341C70;
  *(void *)(v1 + 32) = &IOUSBDeviceInterfaceClass::sIOUSBDeviceInterfaceInterface;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0LL;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0LL;
  *(_DWORD *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0LL;
  *(void *)(v1 + 88) = 0LL;
  *(_DWORD *)(v1 + 96) = 0;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_DWORD *)(v1 + 136) = 0;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  *(void *)(v1 + 240) = 0LL;
}

{
  uint64_t v1;
  IOUSBDeviceIUnknown::IOUSBDeviceIUnknown(this, &IOUSBDeviceInterfaceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_18A341C70;
  *(void *)(v1 + 32) = &IOUSBDeviceInterfaceClass::sIOUSBDeviceInterfaceInterface;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0LL;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0LL;
  *(_DWORD *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0LL;
  *(void *)(v1 + 88) = 0LL;
  *(_DWORD *)(v1 + 96) = 0;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_DWORD *)(v1 + 136) = 0;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  *(void *)(v1 + 240) = 0LL;
}

void IOUSBDeviceInterfaceClass::~IOUSBDeviceInterfaceClass(IOUSBDeviceInterfaceClass *this)
{
  *(void *)this = off_18A341C70;
  io_connect_t v2 = *((_DWORD *)this + 13);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 13) = 0;
  }

  io_object_t v3 = *((_DWORD *)this + 12);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 12) = 0;
  }

  uint64_t v4 = *((void *)this + 15);
  if (v4) {
    (*(void (**)(IOUSBDeviceInterfaceClass *, uint64_t, void))(*(void *)this + 88LL))( this,  v4,  *((void *)this + 16));
  }
  v5 = (__CFMachPort *)*((void *)this + 10);
  if (v5)
  {
    CFMachPortInvalidate(v5);
    CFRelease(*((CFTypeRef *)this + 10));
    *((void *)this + 10) = 0LL;
  }

  v6 = (__CFRunLoopSource *)*((void *)this + 11);
  if (v6)
  {
    CFRunLoopSourceInvalidate(v6);
    CFRelease(*((CFTypeRef *)this + 11));
    *((void *)this + 11) = 0LL;
  }

  mach_port_name_t v7 = *((_DWORD *)this + 18);
  v8 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  if (v7)
  {
    mach_port_mod_refs(*MEMORY[0x1895FBBE0], v7, 1u, -1);
    *((_DWORD *)this + 18) = 0;
  }

  v9 = (__CFMachPort *)*((void *)this + 13);
  if (v9)
  {
    CFMachPortInvalidate(v9);
    CFRelease(*((CFTypeRef *)this + 13));
    *((void *)this + 13) = 0LL;
  }

  v10 = (__CFRunLoopSource *)*((void *)this + 14);
  if (v10)
  {
    CFRunLoopSourceInvalidate(v10);
    CFRelease(*((CFTypeRef *)this + 14));
    *((void *)this + 14) = 0LL;
  }

  mach_port_name_t v11 = *((_DWORD *)this + 24);
  if (v11)
  {
    mach_port_mod_refs(*v8, v11, 1u, -1);
    *((_DWORD *)this + 24) = 0;
  }

  uint64_t v12 = *((void *)this + 20);
  if (v12) {
    (*(void (**)(IOUSBDeviceInterfaceClass *, uint64_t, void))(*(void *)this + 88LL))( this,  v12,  *((void *)this + 21));
  }
  v13 = (__CFMachPort *)*((void *)this + 18);
  if (v13)
  {
    CFMachPortInvalidate(v13);
    CFRelease(*((CFTypeRef *)this + 18));
    *((void *)this + 18) = 0LL;
  }

  v14 = (__CFRunLoopSource *)*((void *)this + 19);
  if (v14)
  {
    CFRunLoopSourceInvalidate(v14);
    CFRelease(*((CFTypeRef *)this + 19));
    *((void *)this + 19) = 0LL;
  }

  mach_port_name_t v15 = *((_DWORD *)this + 34);
  if (v15)
  {
    mach_port_mod_refs(*v8, v15, 1u, -1);
    *((_DWORD *)this + 34) = 0;
  }

  io_object_t v16 = *((_DWORD *)this + 14);
  if (v16)
  {
    IOObjectRelease(v16);
    *((_DWORD *)this + 14) = 0;
  }

  v17 = (IONotificationPort *)*((void *)this + 8);
  if (v17)
  {
    IONotificationPortDestroy(v17);
    *((void *)this + 8) = 0LL;
  }

  IOUSBDeviceIUnknown::~IOUSBDeviceIUnknown(this);
}

{
  void *v1;
  IOUSBDeviceInterfaceClass::~IOUSBDeviceInterfaceClass(this);
  operator delete(v1);
}

void IOUSBDeviceInterfaceClass::_handleAsyncCallback( IOUSBDeviceInterfaceClass *this, __CFMachPort *a2, void *a3, uint64_t a4, void *a5)
{
  if (*((_DWORD *)a2 + 5) == 53) {
    JUMPOUT(0x1895DE440LL);
  }
}

void *IOUSBDeviceInterfaceClass::_interestCallback( void *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5 = (uint64_t (*)(void, uint64_t, uint64_t, void))this[28];
  if (v5) {
    return (void *)v5(this[29], a3, a4, this[30]);
  }
  return this;
}

char *IOUSBDeviceInterfaceClass::alloc(IOUSBDeviceInterfaceClass *this)
{
  uint64_t v1 = (char *)operator new(0xF8uLL);
  IOUSBDeviceIUnknown::IOUSBDeviceIUnknown( (IOUSBDeviceIUnknown *)v1,  &IOUSBDeviceInterfaceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_18A341C70;
  *((void *)v1 + 4) = &IOUSBDeviceInterfaceClass::sIOUSBDeviceInterfaceInterface;
  *((void *)v1 + 5) = v1;
  *((void *)v1 + 6) = 0LL;
  *((_DWORD *)v1 + 14) = 0;
  *((void *)v1 + 8) = 0LL;
  *((_DWORD *)v1 + 18) = 0;
  *((void *)v1 + 10) = 0LL;
  *((void *)v1 + 11) = 0LL;
  *((_DWORD *)v1 + 24) = 0;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *((_DWORD *)v1 + 34) = 0;
  *((_OWORD *)v1 + 9) = 0u;
  *((_OWORD *)v1 + 10) = 0u;
  *((_OWORD *)v1 + 11) = 0u;
  *((_OWORD *)v1 + 12) = 0u;
  *((_OWORD *)v1 + 13) = 0u;
  *((_OWORD *)v1 + 14) = 0u;
  result = v1 + 16;
  *((void *)v1 + 30) = 0LL;
  return result;
}

void sub_18909EE84(_Unwind_Exception *a1)
{
}

uint64_t IOUSBDeviceInterfaceClass::queryInterface( IOUSBDeviceInterfaceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v5, v7)))
  {
    v8 = (char *)this + 16;
    uint64_t v9 = *(void *)this;
LABEL_4:
    *a3 = v8;
    (*(void (**)(IOUSBDeviceInterfaceClass *))(v9 + 24))(this);
    goto LABEL_5;
  }

  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xEAu,  0x33u,  0xBAu,  0x4Fu,  0x8Au,  0x60u,  0x11u,  0xDBu,  0x84u,  0xDBu,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
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

uint64_t IOUSBDeviceInterfaceClass::probe( IOUSBDeviceInterfaceClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4 = 3758097090LL;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOUSBDeviceInterface")) {
      return 0LL;
    }
    else {
      return 3758097090LL;
    }
  }

  return v4;
}

uint64_t IOUSBDeviceInterfaceClass::start( IOUSBDeviceInterfaceClass *this, const __CFDictionary *a2, io_object_t object)
{
  *((_DWORD *)this + 12) = object;
  IOObjectRetain(object);
  uint64_t v4 = IOServiceOpen(*((_DWORD *)this + 12), *MEMORY[0x1895FBBE0], 0, (io_connect_t *)this + 13);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = 3758097084LL;
    if (*((_DWORD *)this + 13))
    {
      IONotificationPortRef v6 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
      *((void *)this + 8) = v6;
      if (v6) {
        return 0LL;
      }
      uint64_t v4 = 3758097085LL;
    }
  }

  io_object_t v5 = *((_DWORD *)this + 12);
  if (v5)
  {
    IOObjectRelease(v5);
    *((_DWORD *)this + 12) = 0;
  }

  return v4;
}

uint64_t IOUSBDeviceInterfaceClass::stop(IOUSBDeviceInterfaceClass *this)
{
  return 0LL;
}

uint64_t IOUSBDeviceInterfaceClass::open(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  uint32_t outputCnt = 0;
  uint64_t v4 = a2;
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0, &v4, 1u, 0LL, &outputCnt);
  if (!(_DWORD)result) {
    return IOServiceAddInterestNotification( *((IONotificationPortRef *)this + 8),  *((_DWORD *)this + 12),  "IOGeneralInterest",  (IOServiceInterestCallback)IOUSBDeviceInterfaceClass::_interestCallback,  this,  (io_object_t *)this + 14);
  }
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::close(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  uint32_t outputCnt = 0;
  uint64_t v5 = a2;
  io_object_t v3 = *((_DWORD *)this + 14);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 14) = 0;
  }

  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 1u, &v5, 1u, 0LL, &outputCnt);
}

uint64_t IOUSBDeviceInterfaceClass::scheduleWithRunLoop( mach_port_t *recvPort, CFRunLoopRef rl, CFRunLoopMode mode)
{
  RunLoopSource = (__CFRunLoopSource *)*((void *)recvPort + 11);
  if (RunLoopSource) {
    goto LABEL_21;
  }
  context.version = 0LL;
  context.info = 0LL;
  Boolean shouldFreeInfo = -86;
  uint64_t v10 = recvPort + 18;
  mach_port_t v9 = recvPort[18];
  if (!v9)
  {
    uint64_t v11 = IOCreateReceivePort(0x35u, recvPort + 18);
    if ((_DWORD)v11) {
      return v11;
    }
    mach_port_t v9 = *v10;
    if (!*v10) {
      return 3758097085LL;
    }
  }

  context.version = 1LL;
  context.info = recvPort;
  uint64_t v11 = 3758097085LL;
  memset(&context.retain, 0, 24);
  CFUUIDRef v12 = CFMachPortCreateWithPort( 0LL,  v9,  (CFMachPortCallBack)IOUSBDeviceInterfaceClass::_handleAsyncCallback,  &context,  &shouldFreeInfo);
  *((void *)recvPort + 10) = v12;
  if (v12)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v12, 0LL);
    *((void *)recvPort + 11) = RunLoopSource;
    if (RunLoopSource)
    {
LABEL_21:
      if (*((void *)recvPort + 15))
      {
        (*(void (**)(mach_port_t *, void, void))(*(void *)recvPort + 88LL))( recvPort,  *((void *)recvPort + 15),  *((void *)recvPort + 16));
        RunLoopSource = (__CFRunLoopSource *)*((void *)recvPort + 11);
      }

      CFRunLoopAddSource(rl, RunLoopSource, mode);
      CFUUIDRef v7 = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)recvPort + 8));
      CFRunLoopAddSource(rl, v7, mode);
      if (rl) {
        CFTypeRef v8 = CFRetain(rl);
      }
      else {
        CFTypeRef v8 = 0LL;
      }
      *((void *)recvPort + 15) = v8;
      if (mode) {
        CFTypeRef v13 = CFRetain(mode);
      }
      else {
        CFTypeRef v13 = 0LL;
      }
      uint64_t v11 = 0LL;
      *((void *)recvPort + 16) = v13;
    }
  }

  return v11;
}

uint64_t IOUSBDeviceInterfaceClass::unscheduleFromRunLoop( CFRunLoopSourceRef *this, CFRunLoopRef rl, const __CFString *a3)
{
  if (this[15] == rl)
  {
    uint64_t v4 = (CFRunLoopMode *)(this + 16);
    CFRunLoopRemoveSource(rl, this[11], (CFRunLoopMode)this[16]);
    IONotificationPortRef v6 = this[15];
    RunLoopSource = IONotificationPortGetRunLoopSource(this[8]);
    CFRunLoopRemoveSource(v6, RunLoopSource, *v4);
    CFRunLoopSourceRef v8 = this[15];
    if (v8)
    {
      CFRelease(v8);
      this[15] = 0LL;
    }
  }

  else
  {
    if (this[20] != rl) {
      return 0LL;
    }
    uint64_t v4 = (CFRunLoopMode *)(this + 21);
    CFRunLoopRemoveSource(rl, this[19], (CFRunLoopMode)this[21]);
    CFRunLoopSourceRef v5 = this[20];
    if (v5)
    {
      CFRelease(v5);
      this[20] = 0LL;
    }
  }

  if (*v4)
  {
    CFRelease(*v4);
    *uint64_t v4 = 0LL;
  }

  return 0LL;
}

uint64_t IOUSBDeviceInterfaceClass::setDescription(IOUSBDeviceInterfaceClass *this, CFStringRef theString)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[14] = v3;
  v6[15] = v3;
  v6[12] = v3;
  v6[13] = v3;
  v6[10] = v3;
  v6[11] = v3;
  v6[8] = v3;
  v6[9] = v3;
  v6[6] = v3;
  v6[7] = v3;
  v6[4] = v3;
  v6[5] = v3;
  v6[2] = v3;
  v6[3] = v3;
  v6[0] = v3;
  v6[1] = v3;
  if (!theString)
  {
    size_t v4 = 0LL;
    return IOConnectCallStructMethod(*((_DWORD *)this + 13), 2u, v6, v4, 0LL, 0LL);
  }

  if (CFStringGetCString(theString, (char *)v6, 256LL, 0x8000100u))
  {
    size_t v4 = strlen((const char *)v6);
    return IOConnectCallStructMethod(*((_DWORD *)this + 13), 2u, v6, v4, 0LL, 0LL);
  }

  return 3758096385LL;
}

uint64_t IOUSBDeviceInterfaceClass::setClassForAlternateSetting( IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 3u, input, 2u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::setSubClassForAlternateSetting( IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 4u, input, 2u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::setProtocolForAlternateSetting( IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 5u, input, 2u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::appendStandardClassOrVendorDescriptor( IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned __int8 *inputStruct, size_t inputStructCnt, unsigned int a5)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a5;
  return IOConnectCallMethod( *((_DWORD *)this + 13),  6u,  input,  2u,  inputStruct,  inputStructCnt,  0LL,  0LL,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::appendNonStandardClassOrVendorDescriptor( IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned __int8 *inputStruct, size_t inputStructCnt, unsigned int a5)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a5;
  return IOConnectCallMethod( *((_DWORD *)this + 13),  7u,  input,  2u,  inputStruct,  inputStructCnt,  0LL,  0LL,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::commitConfiguration(IOUSBDeviceInterfaceClass *this)
{
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xBu, 0LL, 0, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::unlockConfiguration(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x17u, v3, 1u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::createPipe( IOUSBDeviceInterfaceClass *this, int a2, int a3, int a4, int a5, int a6, int a7, unint64_t *a8)
{
  input[6] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  uint64_t input[3] = a5;
  input[4] = a6;
  input[5] = a7;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  if (!a8) {
    return 3758097090LL;
  }
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xAu, input, 6u, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a8 = output;
  }
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::findPipe( IOUSBDeviceInterfaceClass *this, int a2, int a3, int a4, unint64_t *a5)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  if (!a5) {
    return 3758097090LL;
  }
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x19u, input, 3u, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a5 = output;
  }
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::setClassCommandCallbacks( mach_port_t *recvPort, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFRunLoopRef rl, CFRunLoopMode mode)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  mach_port_t v16 = recvPort[18];
  uint64_t v17 = *((void *)recvPort + 20);
  if (v17) {
    (*(void (**)(mach_port_t *, uint64_t, void))(*(void *)recvPort + 88LL))( recvPort,  v17,  *((void *)recvPort + 21));
  }
  if (!rl) {
    goto LABEL_13;
  }
  RunLoopSource = (__CFRunLoopSource *)*((void *)recvPort + 19);
  if (RunLoopSource) {
    goto LABEL_5;
  }
  *(void *)CFMachPortContext context = 0LL;
  *(void *)&context[8] = 0LL;
  shouldFreeInfo[0] = -86;
  v21 = recvPort + 34;
  mach_port_t v20 = recvPort[34];
  if (!v20)
  {
    uint64_t v22 = IOCreateReceivePort(0x35u, recvPort + 34);
    if ((_DWORD)v22) {
      return v22;
    }
    mach_port_t v20 = *v21;
    if (!*v21) {
      return 3758097085LL;
    }
  }

  *(void *)CFMachPortContext context = 1LL;
  *(void *)&context[8] = recvPort;
  uint64_t v22 = 3758097085LL;
  memset(&context[16], 0, 24);
  v23 = CFMachPortCreateWithPort( 0LL,  v20,  (CFMachPortCallBack)IOUSBDeviceInterfaceClass::_handleAsyncCallback,  (CFMachPortContext *)context,  shouldFreeInfo);
  *((void *)recvPort + 18) = v23;
  if (v23)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v23, 0LL);
    *((void *)recvPort + 19) = RunLoopSource;
    if (RunLoopSource)
    {
LABEL_5:
      CFRunLoopAddSource(rl, RunLoopSource, mode);
      *((void *)recvPort + 20) = CFRetain(rl);
      if (mode) {
        CFTypeRef v19 = CFRetain(mode);
      }
      else {
        CFTypeRef v19 = 0LL;
      }
      *((void *)recvPort + 21) = v19;
      mach_port_t v16 = recvPort[34];
LABEL_13:
      *((void *)recvPort + 25) = a4;
      *((void *)recvPort + 26) = a6;
      *((void *)recvPort + 22) = a5;
      *((void *)recvPort + 23) = a2;
      *((void *)recvPort + 24) = a3;
      *(void *)CFMachPortContext context = 0LL;
      memset(&context[24], 0, 24);
      __int128 v29 = 0u;
      *(void *)&context[8] = IOUSBDeviceInterfaceClass::_classCommandCallbacksHandler;
      *(void *)&context[16] = recvPort;
      *(void *)Boolean shouldFreeInfo = a2 != 0;
      BOOL v26 = a3 != 0;
      BOOL v27 = a4 != 0;
      return IOConnectCallAsyncMethod( recvPort[13],  8u,  v16,  (uint64_t *)context,  3u,  (const uint64_t *)shouldFreeInfo,  3u,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    }
  }

  return v22;
}

void IOUSBDeviceInterfaceClass::_classCommandCallbacksHandler( IOUSBDeviceInterfaceClass *this, void *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *((unsigned int *)a3 + 6);
  uint64_t v27 = v5;
  int v26 = 0;
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)input = v6;
  __int128 v32 = v6;
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  v28[0] = BYTE3(v8);
  v28[1] = BYTE2(v8);
  int v9 = *((_DWORD *)a3 + 4);
  HIDWORD(v10) = v9;
  LODWORD(v10) = v9;
  int v30 = v10 >> 16;
  uint64_t v11 = a3[4];
  __int16 v29 = v8;
  switch(v7)
  {
    case 2LL:
      if ((v8 & 0x80000000) != 0) {
        sub_1890A0B88();
      }
      uint64_t v17 = *((void *)this + 25);
      if (v17) {
        uint64_t v17 = ((int (*)(void, void, _BYTE *, void, uint64_t, void))v17)( *((void *)this + 22),  *((void *)this + 26),  v28,  *((unsigned int *)a3 + 10),  v5,  *((void *)this + 27));
      }
      input[0] = v17;
      input[1] = v11;
      IOConnectCallScalarMethod(*((_DWORD *)this + 13), 9u, input, 2u, 0LL, 0LL);
      goto LABEL_15;
    case 1LL:
      if ((v8 & 0x80000000) == 0) {
        sub_1890A0B60();
      }
      v18 = (void (*)(void, void, _BYTE *, void, uint64_t, void))*((void *)this + 24);
      if (v18) {
        v18(*((void *)this + 22), *((void *)this + 26), v28, *((unsigned int *)a3 + 10), v5, *((void *)this + 27));
      }
LABEL_15:
      v21 = (const void *)*((void *)this + 27);
      mach_port_t v20 = (uint64_t *)((char *)this + 216);
      CFTypeRef v19 = v21;
      if (!v21) {
        return;
      }
      CFTypeRef v13 = v20;
      goto LABEL_34;
    case 0LL:
      CFTypeRef v13 = (uint64_t *)((char *)this + 216);
      CFUUIDRef v12 = (const void *)*((void *)this + 27);
      if (v12)
      {
        CFRelease(v12);
        uint64_t *v13 = 0LL;
      }

      v14 = (uint64_t (*)(void, void, _BYTE *, uint64_t *, char *, int *))*((void *)this + 23);
      if (v14)
      {
        BOOL v15 = v14(*((void *)this + 22), *((void *)this + 26), v28, &v27, (char *)this + 216, &v26) != 0;
        int v16 = HIWORD(v30);
        uint64_t v5 = v27;
      }

      else
      {
        BOOL v15 = 0;
        int v16 = (unsigned __int16)v9;
      }

      uint64_t MapToken = 0LL;
      if (v15 && v16 != 0) {
        uint64_t v23 = v5;
      }
      else {
        uint64_t v23 = 0LL;
      }
      input[0] = v15;
      input[1] = v23;
      if (v15)
      {
        if (v5)
        {
          uint64_t MapToken = *v13;
          if (*v13) {
            uint64_t MapToken = IOUSBDeviceDataGetMapToken();
          }
        }
      }

      uint64_t v24 = v26;
      if (!v15) {
        uint64_t v24 = 0LL;
      }
      *(void *)&__int128 v32 = MapToken;
      *((void *)&v32 + 1) = v24;
      unint64_t v33 = v11;
      IOConnectCallScalarMethod(*((_DWORD *)this + 13), 9u, input, 5u, 0LL, 0LL);
      CFTypeRef v19 = (const void *)*((void *)this + 27);
      if (v19)
      {
        if (!v27 || !v15) {
          goto LABEL_34;
        }
        if ((v8 & 0x80000000) == 0)
        {
          if (*((void *)this + 25)) {
            return;
          }
          goto LABEL_34;
        }

        if (!*((void *)this + 24))
        {
LABEL_34:
          CFRelease(v19);
          uint64_t *v13 = 0LL;
        }
      }

      break;
  }

uint64_t IOUSBDeviceInterfaceClass::setMessageCallback( IOUSBDeviceInterfaceClass *this, void (*a2)(void *, unsigned int, void *, void *), void *a3, void *a4)
{
  *((void *)this + 28) = a2;
  *((void *)this + 29) = a3;
  *((void *)this + 30) = a4;
  return 0LL;
}

uint64_t IOUSBDeviceInterfaceClass::setAlternateSetting(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xCu, &input, 1u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::readPipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t MapToken = IOUSBDeviceDataGetMapToken();
  uint64_t v7 = *a4;
  input[1] = MapToken;
  uint64_t input[2] = v7;
  uint64_t input[3] = 0LL;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xDu, input, 4u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::readPipeAsync( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  reference[0] = 0LL;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  uint32_t outputCnt = 1;
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  uint64_t input[2] = a4;
  uint64_t input[3] = 0LL;
  reference[1] = a5;
  *(void *)&__int128 v14 = a6;
  return IOConnectCallAsyncMethod( *(_DWORD *)(a1 + 52),  0xDu,  *(_DWORD *)(a1 + 72),  reference,  3u,  input,  4u,  0LL,  0LL,  &v12,  &outputCnt,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::readIsochPipeAsync( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  *(_OWORD *)reference = 0u;
  __int128 v22 = 0u;
  uint64_t v16 = 0LL;
  uint32_t outputCnt = 1;
  if (!*(_DWORD *)(a1 + 72)) {
    return 3758096385LL;
  }
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  reference[1] = a7;
  *(void *)&__int128 v22 = a8;
  return IOConnectCallAsyncMethod( *(_DWORD *)(a1 + 52),  0x15u,  *(_DWORD *)(a1 + 72),  reference,  3u,  input,  5u,  0LL,  0LL,  &v16,  &outputCnt,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::writePipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t MapToken = IOUSBDeviceDataGetMapToken();
  uint64_t v7 = *a4;
  input[1] = MapToken;
  uint64_t input[2] = v7;
  uint64_t input[3] = 0LL;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xEu, input, 4u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::writePipeAsync( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  reference[0] = 0LL;
  __int128 v15 = 0u;
  uint64_t v12 = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  input[1] = IOUSBDeviceDataGetMapToken();
  uint64_t input[2] = a4;
  uint64_t input[3] = 0LL;
  reference[1] = a5;
  *(void *)&__int128 v15 = a6;
  return IOConnectCallAsyncMethod( *(_DWORD *)(a1 + 52),  0xEu,  *(_DWORD *)(a1 + 72),  reference,  3u,  input,  4u,  0LL,  0LL,  &v12,  &outputCnt,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::writeIsochPipeAsync( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  *(_OWORD *)reference = 0u;
  __int128 v22 = 0u;
  uint64_t v16 = 0LL;
  uint32_t outputCnt = 1;
  if (!*(_DWORD *)(a1 + 72)) {
    return 3758096385LL;
  }
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  reference[1] = a7;
  *(void *)&__int128 v22 = a8;
  return IOConnectCallAsyncMethod( *(_DWORD *)(a1 + 52),  0x16u,  *(_DWORD *)(a1 + 72),  reference,  3u,  input,  5u,  0LL,  0LL,  &v16,  &outputCnt,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::stallPipe(IOUSBDeviceInterfaceClass *this, uint64_t a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xFu, &input, 1u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::abortPipe(IOUSBDeviceInterfaceClass *this, uint64_t a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x10u, &input, 1u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::getPipeCurrentMaxPacketSize( IOUSBDeviceInterfaceClass *this, uint64_t a2, int *a3)
{
  uint64_t output = 0LL;
  uint64_t input = a2;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x11u, &input, 1u, &output, &outputCnt);
  *a3 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::createData(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  output[3] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 3758097090LL;
  }
  uint64_t input = a2;
  memset(output, 0, 24);
  uint32_t outputCnt = 3;
  uint64_t v4 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 0x12u, &input, 1u, output, &outputCnt);
  if (!(_DWORD)v4) {
    *a3 = IOUSBDeviceDataCreate();
  }
  return v4;
}

uint64_t IOUSBDeviceInterfaceClass::_releaseDataCallback(uint64_t this, uint64_t a2, void *a3)
{
  uint64_t input = this;
  if (a2) {
    return IOConnectCallScalarMethod(*(_DWORD *)(a2 + 52), 0x13u, &input, 1u, 0LL, 0LL);
  }
  return this;
}

uint64_t IOUSBDeviceInterfaceClass::mapIOBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  if (!a4) {
    return 3758097090LL;
  }
  input[0] = a3;
  input[1] = a2;
  memset(output, 170, sizeof(output));
  uint32_t outputCnt = 3;
  uint64_t v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 0x1Au, input, 2u, output, &outputCnt);
  if (!(_DWORD)v5) {
    *a4 = IOUSBDeviceDataCreate();
  }
  return v5;
}

uint64_t IOUSBDeviceInterfaceClass::setPipeProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 0x1Bu, input, 2u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::reportTimeout(IOUSBDeviceInterfaceClass *this, uint64_t a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x1Cu, v3, 1u, 0LL, 0LL);
}

uint64_t IOUSBDeviceInterfaceClass::isActivated(IOUSBDeviceInterfaceClass *this, int *a2, int *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 2;
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x14u, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    *a2 = output;
    if (*a3) {
      *a3 = v8;
    }
  }

  return result;
}

uint64_t IOUSBDeviceInterfaceClass::registerForDemandLaunch( IOUSBDeviceInterfaceClass *this, CFStringRef theString)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  io_connect_t v2 = (mach_port_t *)((char *)this + 96);
  if (*((_DWORD *)this + 24)) {
    return 0LL;
  }
  context.version = 0LL;
  context.info = 0LL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buffer = v6;
  __int128 v11 = v6;
  __int128 v12 = v6;
  __int128 v13 = v6;
  __int128 v14 = v6;
  __int128 v15 = v6;
  __int128 v16 = v6;
  __int128 v17 = v6;
  if (!CFStringGetCString(theString, buffer, 128LL, 0x600u)) {
    return 3758096385LL;
  }
  uint64_t v3 = bootstrap_check_in(*MEMORY[0x1895F9630], buffer, v2);
  if (!(_DWORD)v3)
  {
    uint64_t v3 = 3758097085LL;
    context.version = 1LL;
    context.info = this;
    memset(&context.retain, 0, 24);
    uint64_t v7 = CFMachPortCreateWithPort( 0LL,  *((_DWORD *)this + 24),  (CFMachPortCallBack)IOUSBDeviceInterfaceClass::_handleLodCallback,  &context,  0LL);
    *((void *)this + 13) = v7;
    if (v7)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v7, 0LL);
      *((void *)this + 14) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*((CFRunLoopRef *)this + 15), RunLoopSource, *((CFRunLoopMode *)this + 16));
        return MEMORY[0x1895DE428](*((unsigned int *)this + 13), 74565LL, *((unsigned int *)this + 24), 3735932941LL);
      }
    }
  }

  return v3;
}

uint64_t IOUSBDeviceInterfaceClass::readPipeTO( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned int a5)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t MapToken = IOUSBDeviceDataGetMapToken();
  uint64_t v9 = *a4;
  input[1] = MapToken;
  uint64_t input[2] = v9;
  uint64_t input[3] = a5;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xDu, input, 4u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::readPipeAsyncTO( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  reference[0] = 0LL;
  __int128 v16 = 0u;
  uint64_t v14 = 0LL;
  uint32_t outputCnt = 1;
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  uint64_t input[2] = a4;
  uint64_t input[3] = a5;
  reference[1] = a6;
  *(void *)&__int128 v16 = a7;
  return IOConnectCallAsyncMethod( *(_DWORD *)(a1 + 52),  0xDu,  *(_DWORD *)(a1 + 72),  reference,  3u,  input,  4u,  0LL,  0LL,  &v14,  &outputCnt,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::writePipeTO( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned int a5)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t MapToken = IOUSBDeviceDataGetMapToken();
  uint64_t v9 = *a4;
  input[1] = MapToken;
  uint64_t input[2] = v9;
  uint64_t input[3] = a5;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xEu, input, 4u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::writePipeAsyncTO( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  reference[0] = 0LL;
  __int128 v17 = 0u;
  uint64_t v14 = 0LL;
  input[0] = a2;
  uint32_t outputCnt = 1;
  input[1] = IOUSBDeviceDataGetMapToken();
  uint64_t input[2] = a4;
  uint64_t input[3] = a5;
  reference[1] = a6;
  *(void *)&__int128 v17 = a7;
  return IOConnectCallAsyncMethod( *(_DWORD *)(a1 + 52),  0xEu,  *(_DWORD *)(a1 + 72),  reference,  3u,  input,  4u,  0LL,  0LL,  &v14,  &outputCnt,  0LL,  0LL);
}

uint64_t IOUSBDeviceInterfaceClass::isActive(IOUSBDeviceInterfaceClass *this, int *a2, int *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 2;
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x18u, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    *a2 = output;
    if (a3) {
      *a3 = v8;
    }
  }

  return result;
}

void sub_1890A0B60()
{
  __assert_rtn( "_classCommandCallbacksHandler",  "IOUSBDeviceInterfaceClass.cpp",  1286,  "direction == kRequestDirectionIn");
}

void sub_1890A0B88()
{
  __assert_rtn( "_classCommandCallbacksHandler",  "IOUSBDeviceInterfaceClass.cpp",  1302,  "direction == kRequestDirectionOut");
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603898](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

kern_return_t IOConnectCallAsyncMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CA8]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  inputStruct);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallStructMethod( mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CC8]( *(void *)&connection,  *(void *)&selector,  inputStruct,  inputStructCnt,  outputStruct,  outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort( io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x189607CF8](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return MEMORY[0x189607D38](*(void *)&msgType, recvPort);
}

void IODispatchCalloutFromMessage(void *unused, mach_msg_header_t *msg, void *reference)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x189608348](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t IOUSBDeviceDataCreate()
{
  return MEMORY[0x1896085A8]();
}

uint64_t IOUSBDeviceDataGetMapToken()
{
  return MEMORY[0x1896085B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A341BA8(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9610](*(void *)&bp, service_name, sp);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}