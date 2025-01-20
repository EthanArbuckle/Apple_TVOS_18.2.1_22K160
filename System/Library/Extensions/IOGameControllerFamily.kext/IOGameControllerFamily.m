os_log_t _gc_log_debug()
{
  os_log_t result;
  result = (os_log_t)_gc_log_debug_Log;
  if (!_gc_log_debug_Log)
  {
    result = os_log_create("com.apple.gamecontroller", "Debug");
    _gc_log_debug_Log = (uint64_t)result;
  }

  return result;
}

OSMetaClass *IOGCCircularDataQueue::MetaClass::MetaClass(OSMetaClass *this)
{
  result = OSMetaClass::OSMetaClass(this, "IOGCCircularDataQueue", &IODataQueue::gMetaClass, 0x60u);
  result->__vftable = (OSMetaClass_vtbl *)off_10338;
  return result;
}

{
  OSMetaClass *result;
  result = OSMetaClass::OSMetaClass(this, "IOGCCircularDataQueue", &IODataQueue::gMetaClass, 0x60u);
  result->__vftable = (OSMetaClass_vtbl *)off_10338;
  return result;
}

void IOGCCircularDataQueue::IOGCCircularDataQueue(IOGCCircularDataQueue *this, const OSMetaClass *a2)
{
  v2 = IODataQueue::IODataQueue((IODataQueue *)this, a2);
  v2->__vftable = (IODataQueue_vtbl *)off_10240;
  v2[1].__vftable = 0LL;
}

{
  IODataQueue *v2;
  v2 = IODataQueue::IODataQueue((IODataQueue *)this, a2);
  v2->__vftable = (IODataQueue_vtbl *)off_10240;
  v2[1].__vftable = 0LL;
}

void IOGCCircularDataQueue::~IOGCCircularDataQueue(IODataQueue *this)
{
  this->__vftable = (IODataQueue_vtbl *)off_10240;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IODataQueue_vtbl *))v2->~IODataQueue + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IODataQueue::~IODataQueue(this);
}

{
  IODataQueue_vtbl *v2;
  this->__vftable = (IODataQueue_vtbl *)off_10240;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IODataQueue_vtbl *))v2->~IODataQueue + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IODataQueue::~IODataQueue(this);
}

{
  IODataQueue_vtbl *v2;
  this->__vftable = (IODataQueue_vtbl *)off_10240;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IODataQueue_vtbl *))v2->~IODataQueue + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IODataQueue::~IODataQueue(this);
  OSObject_typed_operator_delete(&IOGCCircularDataQueue_ktv, this, 96LL);
}

void IOGCCircularDataQueue::operator delete(void *a1, uint64_t a2)
{
}

uint64_t *IOGCCircularDataQueue::getMetaClass(IOGCCircularDataQueue *this)
{
  return &IOGCCircularDataQueue::gMetaClass;
}

IODataQueue *IOGCCircularDataQueue::MetaClass::alloc(IOGCCircularDataQueue::MetaClass *this)
{
  v1 = (IODataQueue *)OSObject_typed_operator_new(&IOGCCircularDataQueue_ktv, 96LL);
  v2 = IODataQueue::IODataQueue(v1, (const OSMetaClass *)&IOGCCircularDataQueue::gMetaClass);
  v2->__vftable = (IODataQueue_vtbl *)off_10240;
  v2[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed((const OSMetaClass *)&IOGCCircularDataQueue::gMetaClass);
  return v1;
}

uint64_t IOGCCircularDataQueue::operator new(IOGCCircularDataQueue *this)
{
  return OSObject_typed_operator_new(&IOGCCircularDataQueue_ktv, this);
}

void IOGCCircularDataQueue::IOGCCircularDataQueue(IOGCCircularDataQueue *this)
{
  v1 = IODataQueue::IODataQueue((IODataQueue *)this, (const OSMetaClass *)&IOGCCircularDataQueue::gMetaClass);
  v1->__vftable = (IODataQueue_vtbl *)off_10240;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed((const OSMetaClass *)&IOGCCircularDataQueue::gMetaClass);
}

{
  IODataQueue *v1;
  v1 = IODataQueue::IODataQueue((IODataQueue *)this, (const OSMetaClass *)&IOGCCircularDataQueue::gMetaClass);
  v1->__vftable = (IODataQueue_vtbl *)off_10240;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed((const OSMetaClass *)&IOGCCircularDataQueue::gMetaClass);
}

uint64_t IOGCCircularDataQueue::withEntries(IOGCCircularDataQueue *this, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(IOGCCircularDataQueue::gMetaClass + 104))();
  uint64_t v5 = v4;
  if (v4
    && ((*(uint64_t (**)(uint64_t, IOGCCircularDataQueue *, uint64_t))(*(void *)v4 + 136LL))(v4, this, a2) & 1) == 0)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 40LL))(v5);
    return 0LL;
  }

  return v5;
}

uint64_t IOGCCircularDataQueue::initWithCapacity(IOGCCircularDataQueue *this)
{
  return 0LL;
}

uint64_t IOGCCircularDataQueue::initWithEntries(IOGCCircularDataQueue *this, int a2, int a3)
{
  if ((_DWORD)result)
  {
    int v7 = ((a3 + 7) & 0xFFFFFFF8) + 56;
    uint64_t v8 = (v7 * a2);
    if (v8 >= 0xFFFFFFC0)
    {
      v15 = _gc_log_debug();
      _os_log_internal( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "IOGCCircularDataQueue::initWithEntries failed: size [%zd] too large.",  v8);
      return 0LL;
    }

    else
    {
      vm_size_t v9 = v8 + 64;
      v10 = IOBufferMemoryDescriptor::withOptions( 0x10000u,  v9,  (v9 + ~(-1 << PAGE_SHIFT_CONST)) & ~(unint64_t)~(-1 << PAGE_SHIFT_CONST));
      uint64_t v11 = *((void *)this + 4);
      if (v11) {
        (*(void (**)(uint64_t))(*(void *)v11 + 40LL))(v11);
      }
      *((void *)this + 4) = v10;
      if (v10)
      {
        uint64_t v12 = ((uint64_t (*)(IOBufferMemoryDescriptor *))v10->getBytesNoCopy)(v10);
        *((void *)this + 2) = v12;
        uint64_t inited = IOCircularDataQueueInitFixed(v12, (uint64_t)this + 40, v9, v7, 0x123456789ABCDELL);
        v14 = _gc_log_debug();
        if ((_DWORD)inited)
        {
          _os_log_internal( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "IOGCCircularDataQueue::initWithEntries failed: %{mach.errno}d.",  inited);
          return 0LL;
        }

        else
        {
          _os_log_internal( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "IOGCCircularDataQueue::initWithEntries -> queueSize:%#x entryDataSize:%u",  *(_DWORD *)(*((void *)this + 2) + 8LL),  *(_DWORD *)(*((void *)this + 2) + 12LL));
          *((void *)this + 3) = (char *)this + 64;
          return 1LL;
        }
      }

      else
      {
        v16 = _gc_log_debug();
        _os_log_internal( &dword_0,  v16,  OS_LOG_TYPE_DEBUG,  "IOGCCircularDataQueue::initWithEntries failed: could not allocate memory (size=%zu).",  v9);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t IOGCCircularDataQueue::getQueueMemory(IOGCCircularDataQueue *this)
{
  return *((void *)this + 2);
}

uint64_t IOGCCircularDataQueue::free(IOGCCircularDataQueue *this)
{
  *((void *)this + 2) = 0LL;
}

uint64_t IOGCCircularDataQueue::sendDataAvailableNotification(IOGCCircularDataQueue *this)
{
}

uint64_t IOGCCircularDataQueue::setNotificationPort(IOGCCircularDataQueue *this, ipc_port *a2)
{
}

uint64_t IOGCCircularDataQueue::getMemoryDescriptor(IOGCCircularDataQueue *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1) {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 4));
  }
  return v1;
}

vm_offset_t IOGCCircularDataQueue::getQueueID(IOGCCircularDataQueue *this)
{
  vm_offset_t up_addr = 0LL;
  vm_kernel_unslide_or_perm_external((vm_offset_t)this, &up_addr);
  return up_addr;
}

uint64_t IOGCCircularDataQueue::getSentinelValue(IOGCCircularDataQueue *this)
{
  return *((void *)this + 5);
}

uint64_t IOGCCircularDataQueue::getMemorySize(IOGCCircularDataQueue *this)
{
  return *((unsigned int *)this + 12);
}

uint64_t IOGCCircularDataQueue::getEntrySize(IOGCCircularDataQueue *this)
{
  return *((unsigned int *)this + 13);
}

uint64_t IOGCCircularDataQueue::getStartingPosition(IOGCCircularDataQueue *this, unint64_t *a2)
{
  return IOCircularDataQueueGetStartingPosition(*((void *)this + 2), a2);
}

uint64_t IOGCCircularDataQueue::getLatestPosition(IOGCCircularDataQueue *this, unint64_t *a2)
{
  return IOCircularDataQueueGetLatestPosition(*((void *)this + 2), a2);
}

uint64_t IOGCCircularDataQueue::reset(IOGCCircularDataQueue *this, unint64_t a2)
{
  return IOCircularDataQueueReset(*((void *)this + 2), a2);
}

BOOL IOGCCircularDataQueue::enqueue(IOGCCircularDataQueue *this, void *__src, size_t __len)
{
  int v4 = IOCircularDataQueueEnqueueCopy(*((void *)this + 2), (uint64_t)this + 40, __src, __len);
  if (v4)
  {
    v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/DataQueue/IOGCCircularDataQueue.cpp",  214,  v4);
  }

  else
  {
    (*(void (**)(IOGCCircularDataQueue *))(*(void *)this + 120LL))(this);
  }

  return v4 == 0;
}

OSMetaClass *IOGCCircularDataQueueCursor::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCCircularDataQueueCursor", &OSObject::gMetaClass, 0x28u);
  result->__vftable = (OSMetaClass_vtbl *)off_10488;
  return result;
}

{
  OSMetaClass *result;
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCCircularDataQueueCursor", &OSObject::gMetaClass, 0x28u);
  result->__vftable = (OSMetaClass_vtbl *)off_10488;
  return result;
}

void IOGCCircularDataQueueCursor::IOGCCircularDataQueueCursor( IOGCCircularDataQueueCursor *this, const OSMetaClass *a2)
{
  v2 = OSObject::OSObject((OSObject *)this, a2);
  v2->__vftable = (OSObject_vtbl *)off_103D0;
  v2[1].__vftable = 0LL;
}

{
  OSObject *v2;
  v2 = OSObject::OSObject((OSObject *)this, a2);
  v2->__vftable = (OSObject_vtbl *)off_103D0;
  v2[1].__vftable = 0LL;
}

void IOGCCircularDataQueueCursor::~IOGCCircularDataQueueCursor(OSObject *this)
{
  this->__vftable = (OSObject_vtbl *)off_103D0;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(OSObject_vtbl *))v2->~OSObject + 5))(v2);
  }
  this[1].__vftable = 0LL;
  OSObject::~OSObject(this);
}

{
  OSObject_vtbl *v2;
  this->__vftable = (OSObject_vtbl *)off_103D0;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(OSObject_vtbl *))v2->~OSObject + 5))(v2);
  }
  this[1].__vftable = 0LL;
  OSObject::~OSObject(this);
}

{
  OSObject_vtbl *v2;
  this->__vftable = (OSObject_vtbl *)off_103D0;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(OSObject_vtbl *))v2->~OSObject + 5))(v2);
  }
  this[1].__vftable = 0LL;
  OSObject::~OSObject(this);
  OSObject_typed_operator_delete(&IOGCCircularDataQueueCursor_ktv, this, 40LL);
}

void IOGCCircularDataQueueCursor::operator delete(void *a1, uint64_t a2)
{
}

void *IOGCCircularDataQueueCursor::getMetaClass(IOGCCircularDataQueueCursor *this)
{
  return &IOGCCircularDataQueueCursor::gMetaClass;
}

OSObject *IOGCCircularDataQueueCursor::MetaClass::alloc(IOGCCircularDataQueueCursor::MetaClass *this)
{
  uint64_t v1 = (OSObject *)OSObject_typed_operator_new(&IOGCCircularDataQueueCursor_ktv, 40LL);
  v2 = OSObject::OSObject(v1, &IOGCCircularDataQueueCursor::gMetaClass);
  v2->__vftable = (OSObject_vtbl *)off_103D0;
  v2[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCCircularDataQueueCursor::gMetaClass);
  return v1;
}

uint64_t IOGCCircularDataQueueCursor::operator new(IOGCCircularDataQueueCursor *this)
{
  return OSObject_typed_operator_new(&IOGCCircularDataQueueCursor_ktv, this);
}

void IOGCCircularDataQueueCursor::IOGCCircularDataQueueCursor(IOGCCircularDataQueueCursor *this)
{
  uint64_t v1 = OSObject::OSObject((OSObject *)this, &IOGCCircularDataQueueCursor::gMetaClass);
  v1->__vftable = (OSObject_vtbl *)off_103D0;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCCircularDataQueueCursor::gMetaClass);
}

{
  OSObject *v1;
  uint64_t v1 = OSObject::OSObject((OSObject *)this, &IOGCCircularDataQueueCursor::gMetaClass);
  v1->__vftable = (OSObject_vtbl *)off_103D0;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCCircularDataQueueCursor::gMetaClass);
}

uint64_t IOGCCircularDataQueueCursor::initWithQueue( IOGCCircularDataQueueCursor *this, IOGCCircularDataQueue *a2)
{
  if (a2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if ((_DWORD)v5 == 1)
  {
    (*(void (**)(IOGCCircularDataQueue *))(*(void *)a2 + 32LL))(a2);
    uint64_t v6 = *((void *)this + 2);
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 40LL))(v6);
    }
    *((void *)this + 2) = a2;
  }

  return v5;
}

uint64_t IOGCCircularDataQueueCursor::reset(IOGCCircularDataQueueCursor *this, unint64_t a2)
{
  return IOCircularDataQueueCursorReset(*(void *)(*((void *)this + 2) + 16LL), (unint64_t *)this + 3, a2);
}

uint64_t IOGCCircularDataQueueCursor::resetToLatestPosition(IOGCCircularDataQueueCursor *this)
{
  return IOCircularDataQueueCursorResetLatest(*(void *)(*((void *)this + 2) + 16LL), (unint64_t *)this + 3);
}

uint64_t IOGCCircularDataQueueCursor::read(IOGCCircularDataQueueCursor *this, void *a2, unsigned int *a3)
{
  uint64_t v8 = a2;
  uint64_t v3 = *(void *)(*((void *)this + 2) + 16LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000LL;
  v7[2] = ___ZN27IOGCCircularDataQueueCursor4readEPvPj_block_invoke;
  v7[3] = &__block_descriptor_tmp;
  v7[4] = a3;
  v7[5] = a2;
  uint64_t v4 = IOCircularDataQueueCursorAccess(v3, &v8, (uint64_t)v7);
  if ((_DWORD)v4)
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/DataQueue/IOGCCircularDataQueue.cpp",  281,  (int)v4);
  }

  return v4;
}

void *___ZN27IOGCCircularDataQueueCursor4readEPvPj_block_invoke( uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v5 = *(unsigned int **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  unint64_t v6 = *v5;
  if (v6 <= a3) {
    size_t v7 = v6;
  }
  else {
    size_t v7 = a3;
  }
  uint64_t result = memmove(v4, a2, v7);
  **(_DWORD **)(a1 + 32) = v7;
  return result;
}

uint64_t IOGCCircularDataQueueCursor::access( IOGCCircularDataQueueCursor *this, void *a2, void *a3, int (*a4)(void *, void *, void *, unsigned int))
{
  uint64_t v4 = *(void *)(*((void *)this + 2) + 16LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = ___ZN27IOGCCircularDataQueueCursor6accessEPvS0_PFiS0_S0_S0_jE_block_invoke;
  v8[3] = &__block_descriptor_tmp_11;
  v8[4] = a4;
  v8[5] = a2;
  v8[6] = a3;
  uint64_t v5 = IOCircularDataQueueCursorAccess(v4, (void *)this + 3, (uint64_t)v8);
  if ((_DWORD)v5)
  {
    size_t v7 = _gc_log_debug();
    _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/DataQueue/IOGCCircularDataQueue.cpp",  294,  (int)v5);
  }

  return v5;
}

uint64_t ___ZN27IOGCCircularDataQueueCursor6accessEPvS0_PFiS0_S0_S0_jE_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(a1 + 32))( *(void *)(a1 + 40),  *(void *)(a1 + 48),  a2,  a3);
}

uint64_t IOGCCircularDataQueueCursor::access(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(*(void *)a1 + 152LL))( a1,  a2,  0LL,  _access_block);
}

uint64_t _access_block(uint64_t (**a1)(void, void, void), void *a2, void *a3, uint64_t a4)
{
  return ((uint64_t (**)(void, void *, uint64_t))a1)[2](a1, a3, a4);
}

OSMetaClass *_GLOBAL__sub_I_IOGCCircularDataQueue_cpp()
{
  OSMetaClass::OSMetaClass( (OSMetaClass *)&IOGCCircularDataQueue::gMetaClass,  "IOGCCircularDataQueue",  &IODataQueue::gMetaClass,  0x60u)->__vftable = (OSMetaClass_vtbl *)off_10338;
  uint64_t result = OSMetaClass::OSMetaClass( &IOGCCircularDataQueueCursor::gMetaClass,  "IOGCCircularDataQueueCursor",  &OSObject::gMetaClass,  0x28u);
  result->__vftable = (OSMetaClass_vtbl *)off_10488;
  return result;
}

void global destructor keyed to'_a()
{
}

OSMetaClass *IOGCCircularControlQueue::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCCircularControlQueue", &IODataQueue::gMetaClass, 0x48u);
  result->__vftable = (OSMetaClass_vtbl *)off_10680;
  return result;
}

{
  OSMetaClass *result;
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCCircularControlQueue", &IODataQueue::gMetaClass, 0x48u);
  result->__vftable = (OSMetaClass_vtbl *)off_10680;
  return result;
}

void IOGCCircularControlQueue::IOGCCircularControlQueue( IOGCCircularControlQueue *this, const OSMetaClass *a2)
{
  v2 = IODataQueue::IODataQueue((IODataQueue *)this, a2);
  v2->__vftable = (IODataQueue_vtbl *)off_10560;
  v2[1].__vftable = 0LL;
}

{
  IODataQueue *v2;
  v2 = IODataQueue::IODataQueue((IODataQueue *)this, a2);
  v2->__vftable = (IODataQueue_vtbl *)off_10560;
  v2[1].__vftable = 0LL;
}

void IOGCCircularControlQueue::~IOGCCircularControlQueue(IODataQueue *this)
{
  this->__vftable = (IODataQueue_vtbl *)off_10560;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IODataQueue_vtbl *))v2->~IODataQueue + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IODataQueue::~IODataQueue(this);
}

{
  IODataQueue_vtbl *v2;
  this->__vftable = (IODataQueue_vtbl *)off_10560;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IODataQueue_vtbl *))v2->~IODataQueue + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IODataQueue::~IODataQueue(this);
}

{
  IODataQueue_vtbl *v2;
  this->__vftable = (IODataQueue_vtbl *)off_10560;
  v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IODataQueue_vtbl *))v2->~IODataQueue + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IODataQueue::~IODataQueue(this);
  OSObject_typed_operator_delete(&IOGCCircularControlQueue_ktv, this, 72LL);
}

void IOGCCircularControlQueue::operator delete(void *a1, uint64_t a2)
{
}

uint64_t *IOGCCircularControlQueue::getMetaClass(IOGCCircularControlQueue *this)
{
  return &IOGCCircularControlQueue::gMetaClass;
}

IODataQueue *IOGCCircularControlQueue::MetaClass::alloc(IOGCCircularControlQueue::MetaClass *this)
{
  uint64_t v1 = (IODataQueue *)OSObject_typed_operator_new(&IOGCCircularControlQueue_ktv, 72LL);
  v2 = IODataQueue::IODataQueue(v1, &IOGCCircularControlQueue::gMetaClass);
  v2->__vftable = (IODataQueue_vtbl *)off_10560;
  v2[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCCircularControlQueue::gMetaClass);
  return v1;
}

uint64_t IOGCCircularControlQueue::operator new(IOGCCircularControlQueue *this)
{
  return OSObject_typed_operator_new(&IOGCCircularControlQueue_ktv, this);
}

void IOGCCircularControlQueue::IOGCCircularControlQueue(IOGCCircularControlQueue *this)
{
  uint64_t v1 = IODataQueue::IODataQueue((IODataQueue *)this, &IOGCCircularControlQueue::gMetaClass);
  v1->__vftable = (IODataQueue_vtbl *)off_10560;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCCircularControlQueue::gMetaClass);
}

{
  IODataQueue *v1;
  uint64_t v1 = IODataQueue::IODataQueue((IODataQueue *)this, &IOGCCircularControlQueue::gMetaClass);
  v1->__vftable = (IODataQueue_vtbl *)off_10560;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCCircularControlQueue::gMetaClass);
}

uint64_t IOGCCircularControlQueue::withEntries(IOGCCircularControlQueue *this, uint64_t a2)
{
  uint64_t v4 = ((uint64_t (*)(void))IOGCCircularControlQueue::gMetaClass.alloc)();
  uint64_t v5 = v4;
  if (v4
    && ((*(uint64_t (**)(uint64_t, IOGCCircularControlQueue *, uint64_t))(*(void *)v4 + 136LL))(v4, this, a2) & 1) == 0)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 40LL))(v5);
    return 0LL;
  }

  return v5;
}

uint64_t IOGCCircularControlQueue::initWithCapacity(IOGCCircularControlQueue *this)
{
  return 0LL;
}

uint64_t IOGCCircularControlQueue::initWithEntries(IOGCCircularControlQueue *this, int a2, unsigned int a3)
{
  if ((_DWORD)result)
  {
    uint64_t v7 = IOGCCircularControlQueueMemorySize(a3, a2);
    if (v7)
    {
      unint64_t v8 = (v7 + ~(-1 << PAGE_SHIFT_CONST)) & ~(unint64_t)~(-1 << PAGE_SHIFT_CONST);
      vm_size_t v9 = IOBufferMemoryDescriptor::withOptions(0x10000u, v8, 0x4000uLL);
      uint64_t v10 = *((void *)this + 4);
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v10 + 40LL))(v10);
      }
      *((void *)this + 4) = v9;
      if (v9)
      {
        uint64_t v11 = (unint64_t *)((uint64_t (*)(IOBufferMemoryDescriptor *))v9->getBytesNoCopy)(v9);
        *((void *)this + 2) = v11;
        *((void *)this + 5) = v11;
        return IOGCCircularControlQueueMemoryInit(v11, (uint64_t)this + 48, v8, a3, 0x1111111111111111uLL) == 0;
      }

      else
      {
        v13 = _gc_log_debug();
        _os_log_internal(&dword_0, v13, OS_LOG_TYPE_DEBUG, "::initWithEntries failed: could not allocate memory.");
        return 0LL;
      }
    }

    else
    {
      uint64_t v12 = _gc_log_debug();
      _os_log_internal(&dword_0, v12, OS_LOG_TYPE_DEBUG, "::initWithEntries failed: invalid entry data size [%u].", a3);
      return 0LL;
    }
  }

  return result;
}

uint64_t IOGCCircularControlQueue::free(IOGCCircularControlQueue *this)
{
  *((void *)this + 2) = 0LL;
}

uint64_t IOGCCircularControlQueue::getQueueClient(IOGCCircularControlQueue *this)
{
  return (uint64_t)this + 40;
}

uint64_t IOGCCircularControlQueue::getMemoryDescriptor(IOGCCircularControlQueue *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1) {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 4));
  }
  return v1;
}

uint64_t IOGCCircularControlQueue::getSentinelValue(IOGCCircularControlQueue *this)
{
  return *((void *)this + 6);
}

uint64_t IOGCCircularControlQueue::getMemorySize(IOGCCircularControlQueue *this)
{
  return *((unsigned int *)this + 14);
}

uint64_t IOGCCircularControlQueue::getEntrySize(IOGCCircularControlQueue *this)
{
  return *((unsigned int *)this + 15);
}

uint64_t IOGCCircularControlQueue::reset(IOGCCircularControlQueue *this, unint64_t a2)
{
  return IOGCCircularControlQueueReset((void *)this + 5, a2);
}

uint64_t IOGCCircularControlQueue::getNextApplyEntry(IOGCCircularControlQueue *this, unint64_t *a2)
{
  return IOGCCircularControlQueueGetNextApplyPosition((void *)this + 5, a2);
}

uint64_t IOGCCircularControlQueue::getLastAppliedEntry(IOGCCircularControlQueue *this, unint64_t *a2)
{
  return IOGCCircularControlQueueGetLastAppliedPosition((void *)this + 5, a2);
}

uint64_t IOGCCircularControlQueue::readBackwardsFromLatestEnqueued(uint64_t a1, char a2, uint64_t a3)
{
  return IOGCCircularControlQueueReadBackwardsFromLatestEnqueued(a1 + 40, a2, a3);
}

uint64_t IOGCCircularControlQueue::readForwardFromNextApply(uint64_t a1, char a2, uint64_t a3)
{
  return IOGCCircularControlQueueReadForwardFromNextApply(a1 + 40, a2, a3);
}

uint64_t IOGCCircularControlQueue::readNext(uint64_t a1, uint64_t a2)
{
  return IOGCCircularControlQueueReadNext((uint64_t **)(a1 + 40), a2);
}

uint64_t IOGCCircularControlQueue::modify(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return IOGCCircularControlQueueEntryModify((uint64_t **)(a1 + 40), a2, a3);
}

uint64_t IOGCCircularControlQueue::commitModifications(uint64_t **this, unint64_t a2)
{
  return IOGCCircularControlQueueEntryCommitModifications(this + 5, a2);
}

uint64_t IOGCCircularControlQueue::resetModifications(uint64_t **this, unint64_t a2)
{
  return IOGCCircularControlQueueEntryResetModifications(this + 5, a2);
}

OSMetaClass *_GLOBAL__sub_I_IOGCCircularControlQueue_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass( &IOGCCircularControlQueue::gMetaClass,  "IOGCCircularControlQueue",  &IODataQueue::gMetaClass,  0x48u);
  result->__vftable = (OSMetaClass_vtbl *)off_10680;
  return result;
}

void global destructor keyed to'_a_0()
{
}

OSMetaClass *IOHIDGCDevice::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOHIDGCDevice", &IOService::gMetaClass, 0xC0u);
  result->__vftable = (OSMetaClass_vtbl *)off_10D38;
  return result;
}

{
  OSMetaClass *result;
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOHIDGCDevice", &IOService::gMetaClass, 0xC0u);
  result->__vftable = (OSMetaClass_vtbl *)off_10D38;
  return result;
}

void IOHIDGCDevice::IOHIDGCDevice(IOHIDGCDevice *this, const OSMetaClass *a2)
{
  v2 = IOService::IOService((IOService *)this, a2);
  v2->__vftable = (IOService_vtbl *)&off_10718;
  v2[1].OSObject = 0u;
  *(_OWORD *)&v2[1].IORegistryEntry::reserved = 0u;
}

{
  IOService *v2;
  v2 = IOService::IOService((IOService *)this, a2);
  v2->__vftable = (IOService_vtbl *)&off_10718;
  v2[1].OSObject = 0u;
  *(_OWORD *)&v2[1].IORegistryEntry::reserved = 0u;
}

void IOHIDGCDevice::~IOHIDGCDevice(IOService *this)
{
  this->__vftable = (IOService_vtbl *)&off_10718;
  fRegistryTable = this[1].fRegistryTable;
  if (fRegistryTable) {
    ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
  }
  this[1].fRegistryTable = 0LL;
  reserved = this[1].IORegistryEntry::reserved;
  if (reserved) {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 40LL))(reserved);
  }
  this[1].IORegistryEntry::reserved = 0LL;
  uint64_t v4 = *(void *)&this[1].retainCount;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 40LL))(v4);
  }
  *(void *)&this[1].retainCount = 0LL;
  uint64_t v5 = this[1].__vftable;
  if (v5) {
    (*((void (**)(IOService_vtbl *))v5->~IOService + 5))(v5);
  }
  this[1].__vftable = 0LL;
  IOService::~IOService(this);
}

{
  OSDictionary *fRegistryTable;
  IORegistryEntry::ExpansionData *reserved;
  uint64_t v4;
  IOService_vtbl *v5;
  this->__vftable = (IOService_vtbl *)&off_10718;
  fRegistryTable = this[1].fRegistryTable;
  if (fRegistryTable) {
    ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
  }
  this[1].fRegistryTable = 0LL;
  reserved = this[1].IORegistryEntry::reserved;
  if (reserved) {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 40LL))(reserved);
  }
  this[1].IORegistryEntry::reserved = 0LL;
  uint64_t v4 = *(void *)&this[1].retainCount;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 40LL))(v4);
  }
  *(void *)&this[1].retainCount = 0LL;
  uint64_t v5 = this[1].__vftable;
  if (v5) {
    (*((void (**)(IOService_vtbl *))v5->~IOService + 5))(v5);
  }
  this[1].__vftable = 0LL;
  IOService::~IOService(this);
}

{
  IOHIDGCDevice::~IOHIDGCDevice(this);
  OSObject_typed_operator_delete(&IOHIDGCDevice_ktv, this, 192LL);
}

void IOHIDGCDevice::operator delete(void *a1, uint64_t a2)
{
}

void *IOHIDGCDevice::getMetaClass(IOHIDGCDevice *this)
{
  return &IOHIDGCDevice::gMetaClass;
}

IOService *IOHIDGCDevice::MetaClass::alloc(IOHIDGCDevice::MetaClass *this)
{
  uint64_t v1 = (IOService *)OSObject_typed_operator_new(&IOHIDGCDevice_ktv, 192LL);
  v2 = IOService::IOService(v1, &IOHIDGCDevice::gMetaClass);
  v2->__vftable = (IOService_vtbl *)&off_10718;
  v2[1].OSObject = 0u;
  *(_OWORD *)&v2[1].IORegistryEntry::reserved = 0u;
  OSMetaClass::instanceConstructed(&IOHIDGCDevice::gMetaClass);
  return v1;
}

uint64_t IOHIDGCDevice::operator new(IOHIDGCDevice *this)
{
  return OSObject_typed_operator_new(&IOHIDGCDevice_ktv, this);
}

void IOHIDGCDevice::IOHIDGCDevice(IOHIDGCDevice *this)
{
  uint64_t v1 = IOService::IOService((IOService *)this, &IOHIDGCDevice::gMetaClass);
  v1->__vftable = (IOService_vtbl *)&off_10718;
  v1[1].OSObject = 0u;
  *(_OWORD *)&v1[1].IORegistryEntry::reserved = 0u;
  OSMetaClass::instanceConstructed(&IOHIDGCDevice::gMetaClass);
}

{
  IOService *v1;
  uint64_t v1 = IOService::IOService((IOService *)this, &IOHIDGCDevice::gMetaClass);
  v1->__vftable = (IOService_vtbl *)&off_10718;
  v1[1].OSObject = 0u;
  *(_OWORD *)&v1[1].IORegistryEntry::reserved = 0u;
  OSMetaClass::instanceConstructed(&IOHIDGCDevice::gMetaClass);
}

uint64_t IOHIDGCDevice::start(OSObject *this, IOService *anObject)
{
  uint64_t v4 = OSMetaClassBase::safeMetaCast(anObject, IOHIDInterface::metaClass);
  uint64_t v5 = v4;
  if (v4) {
    ((void (*)(OSMetaClassBase *))v4->retain)(v4);
  }
  unint64_t v6 = this[9].__vftable;
  if (v6) {
    (*((void (**)(OSObject_vtbl *))v6->~OSObject + 5))(v6);
  }
  this[9].__vftable = (OSObject_vtbl *)v5;
  if (v5)
  {
    uint64_t v7 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *))v5->__vftable[8].serialize)(v5);
    unint64_t v8 = OSMetaClassBase::safeMetaCast(v7, IOHIDDevice::metaClass);
    vm_size_t v9 = v8;
    if (v8) {
      ((void (*)(OSMetaClassBase *))v8->retain)(v8);
    }
    uint64_t v10 = *(void *)&this[8].retainCount;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 40LL))(v10);
    }
    *(void *)&this[8].retainCount = v9;
    if (v9)
    {
      {
        uint64_t v11 = ((uint64_t (*)(IOService *))anObject->getWorkLoop)(anObject);
        uint64_t v12 = v11;
        if (v11) {
          (*(void (**)(uint64_t))(*(void *)v11 + 32LL))(v11);
        }
        uint64_t v13 = *(void *)&this[9].retainCount;
        if (v13) {
          (*(void (**)(uint64_t))(*(void *)v13 + 40LL))(v13);
        }
        *(void *)&this[9].retainCount = v12;
        if (v12)
        {
          v14 = IOCommandGate::commandGate(this, 0LL);
          v15 = this[10].__vftable;
          if (v15) {
            (*((void (**)(OSObject_vtbl *))v15->~OSObject + 5))(v15);
          }
          this[10].__vftable = (OSObject_vtbl *)v14;
          if (!v14)
          {
            v32 = _gc_log_debug();
            _os_log_internal( &dword_0,  v32,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_commandGate",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  33,  0LL);
            return 1LL;
          }

          int v16 = (*(uint64_t (**)(void, IOCommandGate *))(**(void **)&this[9].retainCount + 160LL))( *(void *)&this[9].retainCount,  v14);
          if (v16)
          {
            uint64_t v33 = v16;
            v34 = _gc_log_debug();
            _os_log_internal( &dword_0,  v34,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_workLoop->addEventSource(_commandGate.get()) == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  34,  v33);
            return 1LL;
          }

          uint64_t v17 = ((uint64_t (*)(OSObject *))this->__vftable[11].retain)(this);
          ((void (*)(OSObject *, const char *, uint64_t))this->__vftable[1].taggedRelease)( this,  "Transport",  v17);
          unsigned int v18 = ((uint64_t (*)(OSObject *))this->__vftable[11].release_0)(this);
          ((void (*)(OSObject *, const char *, void, uint64_t))this->__vftable[1].init)( this,  "LocationID",  v18,  32LL);
          unsigned int v19 = ((uint64_t (*)(OSObject *))this->__vftable[11].serialize)(this);
          ((void (*)(OSObject *, const char *, void, uint64_t))this->__vftable[1].init)( this,  "VendorID",  v19,  32LL);
          unsigned int v20 = ((uint64_t (*)(OSObject *))this->__vftable[11].getMetaClass)(this);
          ((void (*)(OSObject *, const char *, void, uint64_t))this->__vftable[1].init)( this,  "VendorIDSource",  v20,  32LL);
          unsigned int v21 = ((uint64_t (*)(OSObject *))this->__vftable[11].isEqualTo)(this);
          ((void (*)(OSObject *, const char *, void, uint64_t))this->__vftable[1].init)( this,  "ProductID",  v21,  32LL);
          unsigned int v22 = ((uint64_t (*)(OSObject *))this->__vftable[11].taggedRetain)(this);
          ((void (*)(OSObject *, const char *, void, uint64_t))this->__vftable[1].init)( this,  "VersionNumber",  v22,  32LL);
          unsigned int v23 = ((uint64_t (*)(OSObject *))this->__vftable[11].taggedRelease)(this);
          ((void (*)(OSObject *, const char *, void, uint64_t))this->__vftable[1].init)( this,  "CountryCode",  v23,  32LL);
          uint64_t v24 = ((uint64_t (*)(OSObject *))this->__vftable[11].taggedRelease_0)(this);
          ((void (*)(OSObject *, const char *, uint64_t))this->__vftable[1].taggedRelease)( this,  "Manufacturer",  v24);
          uint64_t v25 = ((uint64_t (*)(OSObject *))this->__vftable[11].Dispatch)(this);
          ((void (*)(OSObject *, const char *, uint64_t))this->__vftable[1].taggedRelease)( this,  "Product",  v25);
          uint64_t v26 = ((uint64_t (*)(OSObject *))this->__vftable[11].init)(this);
          ((void (*)(OSObject *, const char *, uint64_t))this->__vftable[1].taggedRelease)( this,  "SerialNumber",  v26);
          if ((((uint64_t (*)(OSObject *, OSObject_vtbl *))this->__vftable[12].getRetainCount)( this,  this[9].__vftable) & 1) != 0) {
            return 1LL;
          }
          v35 = _gc_log_debug();
          _os_log_internal( &dword_0,  v35,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "handleStart(_interface.get())",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  49,  0LL);
          return 0LL;
        }

        else
        {
          v31 = _gc_log_debug();
          _os_log_internal( &dword_0,  v31,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_workLoop",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  30,  0LL);
          return 0LL;
        }
      }

      else
      {
        v30 = _gc_log_debug();
        _os_log_internal( &dword_0,  v30,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "IOService::start(provider)",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  27,  0LL);
        return 0LL;
      }
    }

    else
    {
      v29 = _gc_log_debug();
      _os_log_internal( &dword_0,  v29,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_device",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  25,  0LL);
      return 0LL;
    }
  }

  else
  {
    v28 = _gc_log_debug();
    _os_log_internal( &dword_0,  v28,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  22,  0LL);
    return 0LL;
  }
}

uint64_t IOHIDGCDevice::stop(IOHIDGCDevice *this, IOService *a2)
{
  if (*((void *)this + 20)) {
    (*(void (**)(void))(**((void **)this + 19) + 168LL))(*((void *)this + 19));
  }
}

uint64_t IOHIDGCDevice::message(IOHIDGCDevice *this, uint64_t a2, IOService *a3, void *a4)
{
  if ((_DWORD)a2 == -536870656) {
    return 0LL;
  }
  if ((_DWORD)a2 == -536870640)
  {
    IOHIDGCDevice::_providerMaybeUnseized(this);
    return 0LL;
  }
}

uint64_t IOHIDGCDevice::_providerSeized(IOHIDGCDevice *this)
{
  return 0LL;
}

uint64_t IOHIDGCDevice::_providerMaybeUnseized(IOHIDGCDevice *this)
{
  if ((*(unsigned int (**)(IOHIDGCDevice *, void))(*(void *)this + 768LL))(this, 0LL))
  {
    v2 = (thread_call *)*((void *)this + 21);
    if (v2) {
      thread_call_enter1(v2, *((thread_call_param_t *)this + 22));
    }
  }

  (*(void (**)(IOHIDGCDevice *))(*(void *)this + 776LL))(this);
  return 0LL;
}

uint64_t IOHIDGCDevice::copyProviderProperty(IOHIDGCDevice *this, const char *a2)
{
  uint64_t v2 = *((void *)this + 18);
  if (v2)
  {
    (*(void (**)(void))(*(void *)v2 + 32LL))(*((void *)this + 18));
    uint64_t v5 = (*(uint64_t (**)(uint64_t, const char *))(*(void *)v2 + 328LL))(v2, a2);
    if (!v5)
    {
      uint64_t v6 = *((void *)this + 17);
      if (v6)
      {
        (*(void (**)(uint64_t))(*(void *)v6 + 32LL))(v6);
        uint64_t v5 = (*(uint64_t (**)(uint64_t, const char *))(*(void *)v6 + 328LL))(v6, a2);
        (*(void (**)(uint64_t))(*(void *)v6 + 40LL))(v6);
      }

      else
      {
        unint64_t v8 = _gc_log_debug();
        _os_log_internal( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "device",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  94,  0LL);
        uint64_t v5 = 0LL;
      }
    }

    (*(void (**)(uint64_t))(*(void *)v2 + 40LL))(v2);
  }

  else
  {
    uint64_t v7 = _gc_log_debug();
    _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  88,  0LL);
    return 0LL;
  }

  return v5;
}

uint64_t IOHIDGCDevice::getDevice(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 17);
  if (v1) {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 17));
  }
  return v1;
}

uint64_t IOHIDGCDevice::getInterface(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1) {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 18));
  }
  return v1;
}

OSMetaClassBase *IOHIDGCDevice::getTransport(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1)
  {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 18));
    uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "Transport");
    uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSString::metaClass);
    uint64_t v4 = v3;
    if (v2) {
      BOOL v5 = v3 == 0LL;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
    }
    (*(void (**)(uint64_t))(*(void *)v1 + 40LL))(v1);
    if (v4) {
      ((void (*)(OSMetaClassBase *))v4->release_0)(v4);
    }
  }

  else
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  119,  0LL);
    return 0LL;
  }

  return v4;
}

OSMetaClassBase *IOHIDGCDevice::getManufacturer(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1)
  {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 18));
    uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "Manufacturer");
    uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSString::metaClass);
    uint64_t v4 = v3;
    if (v2) {
      BOOL v5 = v3 == 0LL;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
    }
    (*(void (**)(uint64_t))(*(void *)v1 + 40LL))(v1);
    if (v4) {
      ((void (*)(OSMetaClassBase *))v4->release_0)(v4);
    }
  }

  else
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  133,  0LL);
    return 0LL;
  }

  return v4;
}

OSMetaClassBase *IOHIDGCDevice::getProduct(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1)
  {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 18));
    uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "Product");
    uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSString::metaClass);
    uint64_t v4 = v3;
    if (v2) {
      BOOL v5 = v3 == 0LL;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
    }
    (*(void (**)(uint64_t))(*(void *)v1 + 40LL))(v1);
    if (v4) {
      ((void (*)(OSMetaClassBase *))v4->release_0)(v4);
    }
  }

  else
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  147,  0LL);
    return 0LL;
  }

  return v4;
}

OSMetaClassBase *IOHIDGCDevice::getSerialNumber(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1)
  {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 18));
    uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "SerialNumber");
    uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSString::metaClass);
    uint64_t v4 = v3;
    if (v2) {
      BOOL v5 = v3 == 0LL;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
    }
    (*(void (**)(uint64_t))(*(void *)v1 + 40LL))(v1);
    if (v4) {
      ((void (*)(OSMetaClassBase *))v4->release_0)(v4);
    }
  }

  else
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  161,  0LL);
    return 0LL;
  }

  return v4;
}

uint64_t IOHIDGCDevice::getLocationID(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "LocationID");
  uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSNumber::metaClass);
  if (v3)
  {
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))v3->__vftable[1].isEqualTo)(v3);
    if (!v2) {
      return v4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 0LL;
  if (v2) {
LABEL_7:
  }
    ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
  return v4;
}

uint64_t IOHIDGCDevice::getVendorID(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "VendorID");
  uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSNumber::metaClass);
  if (v3)
  {
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))v3->__vftable[1].isEqualTo)(v3);
    if (!v2) {
      return v4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 0LL;
  if (v2) {
LABEL_7:
  }
    ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
  return v4;
}

uint64_t IOHIDGCDevice::getVendorIDSource(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "VendorIDSource");
  uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSNumber::metaClass);
  if (v3)
  {
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))v3->__vftable[1].isEqualTo)(v3);
    if (!v2) {
      return v4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 0LL;
  if (v2) {
LABEL_7:
  }
    ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
  return v4;
}

uint64_t IOHIDGCDevice::getProductID(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "ProductID");
  uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSNumber::metaClass);
  if (v3)
  {
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))v3->__vftable[1].isEqualTo)(v3);
    if (!v2) {
      return v4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 0LL;
  if (v2) {
LABEL_7:
  }
    ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
  return v4;
}

uint64_t IOHIDGCDevice::getVersion(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "VersionNumber");
  uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSNumber::metaClass);
  if (v3)
  {
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))v3->__vftable[1].isEqualTo)(v3);
    if (!v2) {
      return v4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 0LL;
  if (v2) {
LABEL_7:
  }
    ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
  return v4;
}

uint64_t IOHIDGCDevice::getCountryCode(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)v1 + 328LL))( v1,  "CountryCode");
  uint64_t v3 = OSMetaClassBase::safeMetaCast(v2, OSNumber::metaClass);
  if (v3)
  {
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))v3->__vftable[1].isEqualTo)(v3);
    if (!v2) {
      return v4;
    }
    goto LABEL_7;
  }

  uint64_t v4 = 0LL;
  if (v2) {
LABEL_7:
  }
    ((void (*)(const OSMetaClassBase *))v2->release_0)(v2);
  return v4;
}

uint64_t IOHIDGCDevice::_tryOpenProvider(IOHIDGCDevice *this, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = 3758097109LL;
  uint64_t v4 = *((void *)this + 18);
  if (v4)
  {
    (*(void (**)(void))(*(void *)v4 + 32LL))(*((void *)this + 18));
    if (((*(uint64_t (**)(IOHIDGCDevice *, void))(*(void *)this + 768LL))(this, 0LL) & 1) == 0)
    {
      uint64_t v12 = _gc_log_debug();
      _os_log_internal( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "lockForArbitration(false)",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  278,  0LL);
      uint64_t v3 = 3758097111LL;
      goto LABEL_14;
    }

    if (*((void *)this + 22) <= a3)
    {
      char v9 = (*(uint64_t (**)(uint64_t, IOHIDGCDevice *))(*(void *)v4 + 720LL))(v4, this);
      if ((v9 & 1) == 0
        && ((*(uint64_t (**)(uint64_t, IOHIDGCDevice *, uint64_t, void (*)(IORegistryEntry *, uintptr_t, IOMemoryDescriptor *, IOHIDReportType, uint64_t, void *), unint64_t))(*(void *)v4 + 1344LL))( v4,  this,  a2,  IOHIDGCDevice::_handleInterruptReport,  a3) & 1) == 0)
      {
        (*(void (**)(IOHIDGCDevice *))(*(void *)this + 776LL))(this);
        (*(void (**)(uint64_t, IOHIDGCDevice *, void))(*(void *)v4 + 712LL))(v4, this, 0LL);
        goto LABEL_14;
      }

      uint64_t v10 = (thread_call *)*((void *)this + 21);
      if (v10)
      {
        thread_call_cancel(v10);
        thread_call_free(*((thread_call_t *)this + 21));
        *((void *)this + 21) = 0LL;
      }

      if ((v9 & 1) == 0) {
        (*(void (**)(IOHIDGCDevice *, unint64_t))(*(void *)this + 1480LL))(this, a3);
      }
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v3 = 3758097134LL;
    }

    (*(void (**)(IOHIDGCDevice *))(*(void *)this + 776LL))(this);
LABEL_14:
    (*(void (**)(uint64_t))(*(void *)v4 + 40LL))(v4);
    return v3;
  }

  unint64_t v8 = _gc_log_debug();
  _os_log_internal( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  276,  0LL);
  return 3758097112LL;
}

void IOHIDGCDevice::_handleInterruptReport( IORegistryEntry *this, uintptr_t a2, IOMemoryDescriptor *a3, IOHIDReportType a4, uint64_t a5, void *a6)
{
  uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug(0x31CC0206u, RegistryEntryID, 0LL, 0LL, 0LL, 0LL);
  }
  uint64_t v12 = IORegistryEntry::getRegistryEntryID(this);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug(0x31CC0209u, v12, a2, a4, a5, 0LL);
  }
  if (a4 == kIOHIDReportTypeInput) {
    ((void (*)(IORegistryEntry *, uintptr_t, uint64_t, IOMemoryDescriptor *))this->__vftable[2].getProperty_3)( this,  a2,  a5,  a3);
  }
  uint64_t v13 = IORegistryEntry::getRegistryEntryID(this);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug(0x31CC020Au, v13, a2, a4, a5, 0LL);
  }
  uint64_t v14 = IORegistryEntry::getRegistryEntryID(this);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug(0x31CC0205u, v14, 0LL, 0LL, 0LL, 0LL);
  }
}

uint64_t IOHIDGCDevice::_openProviderThreadCallback(IOHIDGCDevice *this, unint64_t a2)
{
  return IOHIDGCDevice::_tryOpenProvider(this, 0LL, a2);
}

uint64_t IOHIDGCDevice::openProvider(IOHIDGCDevice *this, uint64_t a2)
{
  if (((*(uint64_t (**)(IOHIDGCDevice *, void))(*(void *)this + 768LL))(this, 0LL) & 1) != 0)
  {
    unint64_t v4 = *((void *)this + 22) + 1LL;
    *((void *)this + 22) = v4;
    uint64_t v5 = IOHIDGCDevice::_tryOpenProvider(this, a2, v4);
    (*(void (**)(IOHIDGCDevice *))(*(void *)this + 776LL))(this);
    return v5;
  }

  else
  {
    uint64_t v7 = _gc_log_debug();
    _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "lockForArbitration(false)",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  332,  0LL);
    return 3758097111LL;
  }

uint64_t IOHIDGCDevice::openProviderInBackground(IOHIDGCDevice *this)
{
  if (((*(uint64_t (**)(IOHIDGCDevice *, void))(*(void *)this + 768LL))(this, 0LL) & 1) != 0)
  {
    if (!*((void *)this + 21))
    {
      uint64_t v2 = thread_call_allocate_with_options( (thread_call_func_t)IOHIDGCDevice::_openProviderThreadCallback,  this,  THREAD_CALL_PRIORITY_KERNEL,  1u);
      *((void *)this + 21) = v2;
      if (!v2)
      {
        uint64_t v4 = 3758097085LL;
        uint64_t v7 = _gc_log_debug();
        _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_pendingOpenProviderThread",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  355,  0LL);
        return v4;
      }

      uint64_t v3 = (void *)(*((void *)this + 22) + 1LL);
      *((void *)this + 22) = v3;
      thread_call_enter1(v2, v3);
    }

    (*(void (**)(IOHIDGCDevice *))(*(void *)this + 776LL))(this);
    return 0LL;
  }

  else
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "lockForArbitration(false)",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  349,  0LL);
    return 3758097111LL;
  }

uint64_t IOHIDGCDevice::closeProvider(IOHIDGCDevice *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1)
  {
    (*(void (**)(void))(*(void *)v1 + 32LL))(*((void *)this + 18));
    (*(void (**)(IOHIDGCDevice *, uint64_t))(*(void *)this + 768LL))(this, 1LL);
    uint64_t v3 = (thread_call *)*((void *)this + 21);
    uint64_t v4 = *((void *)this + 22) + 1LL;
    *((void *)this + 22) = v4;
    if (v3)
    {
      thread_call_cancel(v3);
      thread_call_free(*((thread_call_t *)this + 21));
      *((void *)this + 21) = 0LL;
    }

    if ((*(unsigned int (**)(void, IOHIDGCDevice *))(**((void **)this + 18) + 720LL))( *((void *)this + 18),  this))
    {
      (*(void (**)(void, IOHIDGCDevice *, void))(**((void **)this + 18) + 712LL))( *((void *)this + 18),  this,  0LL);
      (*(void (**)(IOHIDGCDevice *, uint64_t))(*(void *)this + 1488LL))(this, v4);
    }

    (*(void (**)(IOHIDGCDevice *))(*(void *)this + 776LL))(this);
    (*(void (**)(uint64_t))(*(void *)v1 + 40LL))(v1);
    return 0LL;
  }

  else
  {
    uint64_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  374,  0LL);
    return 3758097112LL;
  }

unint64_t IOHIDGCDevice::getProviderOpen(IOHIDGCDevice *this)
{
  return atomic_load((unint64_t *)this + 23);
}

uint64_t IOHIDGCDevice::handleStart(IOHIDGCDevice *this, IOHIDInterface *a2)
{
  return 1LL;
}

uint64_t IOHIDGCDevice::handleProviderOpened(uint64_t this, unint64_t a2)
{
  return this;
}

void IOHIDGCDevice::handleInputReport(IOHIDGCDevice *this, uint64_t a2, uint64_t a3, IOMemoryDescriptor *a4)
{
  uint64_t v7 = ((uint64_t (*)(IOMemoryDescriptor *, void))a4->map)(a4, 0LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 120LL))(v7);
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 136LL))(v8);
    (*(void (**)(IOHIDGCDevice *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)this + 1504LL))( this,  a2,  a3,  v9,  v10);
    (*(void (**)(uint64_t))(*(void *)v8 + 40LL))(v8);
  }

  else
  {
    uint64_t v11 = _gc_log_debug();
    _os_log_internal( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "reportMap",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  451,  0LL);
  }

uint64_t IOHIDGCDevice::getReport(IORegistryEntry *this, uint64_t a2, uint64_t a3, IOMemoryDescriptor *a4)
{
  fRegistryTable = this[3].fRegistryTable;
  if (fRegistryTable)
  {
    ((void (*)(OSDictionary *))fRegistryTable->retain)(this[3].fRegistryTable);
    uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x31CC020Du, RegistryEntryID, 0LL, a2, a3, 0LL);
    }
    uint64_t v10 = ((uint64_t (*)(OSDictionary *, IOMemoryDescriptor *, uint64_t, uint64_t, void))fRegistryTable->__vftable[4].iteratorSize)( fRegistryTable,  a4,  a2,  a3,  0LL);
    uint64_t v11 = IORegistryEntry::getRegistryEntryID(this);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x31CC020Eu, v11, 0LL, a2, (int)v10, 0LL);
    }
    ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
  }

  else
  {
    uint64_t v12 = _gc_log_debug();
    _os_log_internal( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  474,  0LL);
    return 3758097112LL;
  }

  return v10;
}

uint64_t IOHIDGCDevice::getReport( IORegistryEntry *this, uint64_t a2, uint64_t a3, IOMemoryDescriptor *a4, uint64_t a5, OSObject *a6, void *a7, void (*a8)(OSObject *, void *, IOMemoryDescriptor *, int))
{
  v28 = 0LL;
  v29 = 0LL;
  uint64_t v30 = 0LL;
  reserved = this[3].reserved;
  if (reserved)
  {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 32LL))(this[3].reserved);
    if (a8)
    {
      uint64_t v17 = IOMallocTypeImpl(&IOHIDGCDevice::getReport(IOHIDReportType,unsigned char,IOMemoryDescriptor *,unsigned int,OSObject *,void *,void (*)(OSObject *,void *,IOMemoryDescriptor *,int))::kalloc_type_view_525);
      if (!v17)
      {
        uint64_t v22 = 3758097085LL;
        v27 = _gc_log_debug();
        _os_log_internal( &dword_0,  v27,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "continuation",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  526,  0LL);
LABEL_16:
        (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 40LL))(reserved);
        return v22;
      }

      uint64_t v18 = v17;
      if (a6) {
        ((void (*)(OSObject *))a6->retain)(a6);
      }
      if (a4) {
        ((void (*)(IOMemoryDescriptor *))a4->retain)(a4);
      }
      *(void *)uint64_t v18 = a8;
      *(void *)(v18 + 8) = a7;
      *(void *)(v18 + 16) = a4;
      *(void *)(v18 + 24) = IORegistryEntry::getRegistryEntryID(this);
      *(_DWORD *)(v18 + 32) = a2;
      v28 = a6;
      v29 = _IOHIDDevice_getReport_completion_thunk;
      uint64_t v30 = v18;
      uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug(0x31CC020Du, RegistryEntryID, 0LL, a2, a3, 0LL);
      }
      unsigned int v20 = a4;
    }

    else
    {
      v28 = 0LL;
      v29 = _IOHIDDevice_getReport_completion_thunk;
      uint64_t v30 = 0LL;
      uint64_t v23 = IORegistryEntry::getRegistryEntryID(this);
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug(0x31CC020Cu, v23, 0LL, a2, a3, 0LL);
      }
      uint64_t v18 = 0LL;
      unsigned int v20 = 0LL;
      a6 = 0LL;
    }

    uint64_t v22 = (*(uint64_t (**)(IORegistryEntry::ExpansionData *, IOMemoryDescriptor *, uint64_t, uint64_t, uint64_t, OSObject **))(*(void *)reserved + 1544LL))( reserved,  a4,  a2,  a3,  a5,  &v28);
    if ((_DWORD)v22)
    {
      uint64_t v25 = _gc_log_debug();
      _os_log_internal( &dword_0,  v25,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  549,  (int)v22);
      if (a8)
      {
        uint64_t v26 = IORegistryEntry::getRegistryEntryID(this);
        if ((kdebug_enable & 0xFFFFFFF7) != 0) {
          kernel_debug(0x31CC020Eu, v26, 0LL, a2, (int)v22, 0LL);
        }
        if (v18) {
          IOFreeTypeImpl( &IOHIDGCDevice::getReport(IOHIDReportType,unsigned char,IOMemoryDescriptor *,unsigned int,OSObject *,void *,void (*)(OSObject *,void *,IOMemoryDescriptor *,int))::kalloc_type_view_560,  v18);
        }
      }

      if (v20) {
        ((void (*)(IOMemoryDescriptor *))v20->release_0)(v20);
      }
      if (a6) {
        ((void (*)(OSObject *))a6->release_0)(a6);
      }
    }

    goto LABEL_16;
  }

  unsigned int v21 = _gc_log_debug();
  _os_log_internal( &dword_0,  v21,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "device",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  522,  0LL);
  return 3758097112LL;
}

uint64_t _IOHIDDevice_getReport_completion_thunk(uint64_t result, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = result;
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x31CC020Eu, a2[3], 0LL, *((unsigned int *)a2 + 8), (int)a3, 0LL);
    }
    uint64_t v6 = a2[2];
    ((void (*)(uint64_t, void, uint64_t, uint64_t))*a2)(v5, a2[1], v6, a3);
    *a2 = 0LL;
    a2[1] = 0LL;
    uint64_t result = IOFreeTypeImpl( &_IOHIDDevice_getReport_completion_thunk(void *,void *,int,unsigned int)::kalloc_type_view_506,  a2);
    if (v5) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40LL))(v5);
    }
    if (v6) {
      return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40LL))(v6);
    }
  }

  return result;
}

uint64_t IOHIDGCDevice::getReport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *aBlock)
{
  if (aBlock)
  {
    uint64_t v11 = _Block_copy(aBlock);
    if (!v11)
    {
      uint64_t v12 = _gc_log_debug();
      _os_log_internal( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "heapCompletion",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  580,  0LL);
      return 3758097085LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void *, void (*)(void *, void (**)(void, void, void), IOMemoryDescriptor *, uint64_t)))(*(void *)a1 + 1520LL))( a1,  a2,  a3,  a4,  a5,  0LL,  v11,  _IOHIDDevice_getReport_completion_block);
  if ((_DWORD)v13)
  {
    v15 = _gc_log_debug();
    _os_log_internal( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  590,  (int)v13);
    if (v11) {
      _Block_release(v11);
    }
  }

  return v13;
}

void _IOHIDDevice_getReport_completion_block( void *a1, void (**a2)(void, void, void), IOMemoryDescriptor *a3, uint64_t a4)
{
  if (a2)
  {
    ((void (**)(void, IOMemoryDescriptor *, uint64_t))a2)[2](a2, a3, a4);
    _Block_release(a2);
  }

uint64_t IOHIDGCDevice::setReport(IORegistryEntry *this, uint64_t a2, uint64_t a3, IOMemoryDescriptor *a4)
{
  fRegistryTable = this[3].fRegistryTable;
  if (fRegistryTable)
  {
    ((void (*)(OSDictionary *))fRegistryTable->retain)(this[3].fRegistryTable);
    uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x31CC0211u, RegistryEntryID, 0LL, 1uLL, a3, 0LL);
    }
    uint64_t v10 = ((uint64_t (*)(OSDictionary *, IOMemoryDescriptor *, uint64_t, uint64_t, void))fRegistryTable->__vftable[4].free)( fRegistryTable,  a4,  a2,  a3,  0LL);
    uint64_t v11 = IORegistryEntry::getRegistryEntryID(this);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x31CC0212u, v11, 0LL, 1uLL, (int)v10, 0LL);
    }
    ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
  }

  else
  {
    uint64_t v12 = _gc_log_debug();
    _os_log_internal( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "interface",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  608,  0LL);
    return 3758097112LL;
  }

  return v10;
}

uint64_t IOHIDGCDevice::setReport( IORegistryEntry *this, uint64_t a2, uint64_t a3, IOMemoryDescriptor *a4, uint64_t a5, OSObject *a6, void *a7, void (*a8)(OSObject *, void *, IOMemoryDescriptor *, int))
{
  v28 = 0LL;
  v29 = 0LL;
  uint64_t v30 = 0LL;
  reserved = this[3].reserved;
  if (reserved)
  {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 32LL))(this[3].reserved);
    if (a8)
    {
      uint64_t v17 = IOMallocTypeImpl(&IOHIDGCDevice::setReport(IOHIDReportType,unsigned char,IOMemoryDescriptor *,unsigned int,OSObject *,void *,void (*)(OSObject *,void *,IOMemoryDescriptor *,int))::kalloc_type_view_658);
      if (!v17)
      {
        uint64_t v22 = 3758097085LL;
        v27 = _gc_log_debug();
        _os_log_internal( &dword_0,  v27,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "continuation",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  659,  0LL);
LABEL_16:
        (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 40LL))(reserved);
        return v22;
      }

      uint64_t v18 = (void *)v17;
      if (a6) {
        ((void (*)(OSObject *))a6->retain)(a6);
      }
      if (a4) {
        ((void (*)(IOMemoryDescriptor *))a4->retain)(a4);
      }
      *uint64_t v18 = a8;
      v18[1] = a7;
      v18[2] = a4;
      v18[3] = IORegistryEntry::getRegistryEntryID(this);
      v28 = a6;
      v29 = _IOHIDDevice_setReport_completion_thunk;
      uint64_t v30 = v18;
      uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug(0x31CC0211u, RegistryEntryID, 0LL, 1uLL, a3, 0LL);
      }
      unsigned int v20 = a4;
    }

    else
    {
      v28 = a6;
      v29 = _IOHIDDevice_setReport_completion_thunk;
      uint64_t v30 = 0LL;
      uint64_t v23 = IORegistryEntry::getRegistryEntryID(this);
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug(0x31CC0210u, v23, 0LL, 1uLL, a3, 0LL);
      }
      uint64_t v18 = 0LL;
      unsigned int v20 = 0LL;
      a6 = 0LL;
    }

    uint64_t v22 = (*(uint64_t (**)(IORegistryEntry::ExpansionData *, IOMemoryDescriptor *, uint64_t, uint64_t, uint64_t, OSObject **))(*(void *)this[3].reserved + 1552LL))( this[3].reserved,  a4,  a2,  a3,  a5,  &v28);
    if ((_DWORD)v22)
    {
      uint64_t v25 = _gc_log_debug();
      _os_log_internal( &dword_0,  v25,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  681,  (int)v22);
      if (a8)
      {
        uint64_t v26 = IORegistryEntry::getRegistryEntryID(this);
        if ((kdebug_enable & 0xFFFFFFF7) != 0) {
          kernel_debug(0x31CC0212u, v26, 0LL, 1uLL, (int)v22, 0LL);
        }
        if (v18) {
          IOFreeTypeImpl( &IOHIDGCDevice::setReport(IOHIDReportType,unsigned char,IOMemoryDescriptor *,unsigned int,OSObject *,void *,void (*)(OSObject *,void *,IOMemoryDescriptor *,int))::kalloc_type_view_692,  v18);
        }
      }

      if (v20) {
        ((void (*)(IOMemoryDescriptor *))v20->release_0)(v20);
      }
      if (a6) {
        ((void (*)(OSObject *))a6->release_0)(a6);
      }
    }

    goto LABEL_16;
  }

  unsigned int v21 = _gc_log_debug();
  _os_log_internal( &dword_0,  v21,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "device",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  655,  0LL);
  return 3758097112LL;
}

uint64_t _IOHIDDevice_setReport_completion_thunk(uint64_t result, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = result;
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x31CC0212u, a2[3], 0LL, 1uLL, (int)a3, 0LL);
    }
    uint64_t v6 = a2[2];
    ((void (*)(uint64_t, void, uint64_t, uint64_t))*a2)(v5, a2[1], v6, a3);
    *a2 = 0LL;
    a2[1] = 0LL;
    uint64_t result = IOFreeTypeImpl( &_IOHIDDevice_setReport_completion_thunk(void *,void *,int,unsigned int)::kalloc_type_view_639,  a2);
    if (v5) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40LL))(v5);
    }
    if (v6) {
      return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40LL))(v6);
    }
  }

  return result;
}

uint64_t IOHIDGCDevice::setReport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *aBlock)
{
  if (aBlock)
  {
    uint64_t v11 = _Block_copy(aBlock);
    if (!v11)
    {
      uint64_t v12 = _gc_log_debug();
      _os_log_internal( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "heapCompletion",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  712,  0LL);
      return 3758097085LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void *, void (*)(void *, void (**)(void, void, void), IOMemoryDescriptor *, uint64_t)))(*(void *)a1 + 1536LL))( a1,  a2,  a3,  a4,  a5,  0LL,  v11,  _IOHIDDevice_setReport_completion_block);
  if ((_DWORD)v13)
  {
    v15 = _gc_log_debug();
    _os_log_internal( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "ret == 0 ",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Service/IOHIDGCDevice.cpp",  722,  (int)v13);
    if (v11) {
      _Block_release(v11);
    }
  }

  return v13;
}

void _IOHIDDevice_setReport_completion_block( void *a1, void (**a2)(void, void, void), IOMemoryDescriptor *a3, uint64_t a4)
{
  if (a2)
  {
    ((void (**)(void, IOMemoryDescriptor *, uint64_t))a2)[2](a2, a3, a4);
    _Block_release(a2);
  }

OSMetaClass *_GLOBAL__sub_I_IOHIDGCDevice_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&IOHIDGCDevice::gMetaClass, "IOHIDGCDevice", &IOService::gMetaClass, 0xC0u);
  result->__vftable = (OSMetaClass_vtbl *)off_10D38;
  return result;
}

void global destructor keyed to'_a_1()
{
}

OSMetaClass *IOGCCommandQueue::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCCommandQueue", &IOEventSource::gMetaClass, 0x68u);
  result->__vftable = (OSMetaClass_vtbl *)off_10F18;
  return result;
}

{
  OSMetaClass *result;
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCCommandQueue", &IOEventSource::gMetaClass, 0x68u);
  result->__vftable = (OSMetaClass_vtbl *)off_10F18;
  return result;
}

void IOGCCommandQueue::IOGCCommandQueue(IOGCCommandQueue *this, const OSMetaClass *a2)
{
  IOEventSource::IOEventSource((IOEventSource *)this, a2)->__vftable = (IOEventSource_vtbl *)off_10DD0;
}

{
  IOEventSource::IOEventSource((IOEventSource *)this, a2)->__vftable = (IOEventSource_vtbl *)off_10DD0;
}

void IOGCCommandQueue::~IOGCCommandQueue(IOEventSource *this)
{
}

void IOGCCommandQueue::operator delete(void *a1, uint64_t a2)
{
}

uint64_t *IOGCCommandQueue::getMetaClass(IOGCCommandQueue *this)
{
  return &IOGCCommandQueue::gMetaClass;
}

IOEventSource *IOGCCommandQueue::MetaClass::alloc(IOGCCommandQueue::MetaClass *this)
{
  uint64_t v1 = (IOEventSource *)OSObject_typed_operator_new(&IOGCCommandQueue_ktv, 104LL);
  IOEventSource::IOEventSource(v1, &IOGCCommandQueue::gMetaClass)->__vftable = (IOEventSource_vtbl *)off_10DD0;
  OSMetaClass::instanceConstructed(&IOGCCommandQueue::gMetaClass);
  return v1;
}

uint64_t IOGCCommandQueue::operator new(IOGCCommandQueue *this)
{
  return OSObject_typed_operator_new(&IOGCCommandQueue_ktv, this);
}

void IOGCCommandQueue::IOGCCommandQueue(IOGCCommandQueue *this)
{
  IOEventSource::IOEventSource((IOEventSource *)this, &IOGCCommandQueue::gMetaClass)->__vftable = (IOEventSource_vtbl *)off_10DD0;
  OSMetaClass::instanceConstructed(&IOGCCommandQueue::gMetaClass);
}

{
  IOEventSource::IOEventSource((IOEventSource *)this, &IOGCCommandQueue::gMetaClass)->__vftable = (IOEventSource_vtbl *)off_10DD0;
  OSMetaClass::instanceConstructed(&IOGCCommandQueue::gMetaClass);
}

uint64_t IOGCCommandQueue::commandQueue( IOGCCommandQueue *this, OSObject *a2, int (*a3)(OSObject *, void *))
{
  uint64_t v5 = ((uint64_t (*)(void))IOGCCommandQueue::gMetaClass.alloc)();
  uint64_t v6 = v5;
  if (v5
    && ((*(uint64_t (**)(uint64_t, IOGCCommandQueue *, OSObject *))(*(void *)v5 + 216LL))(v5, this, a2) & 1) == 0)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 40LL))(v6);
    return 0LL;
  }

  return v6;
}

IOSimpleLock *IOGCCommandQueue::init(IOGCCommandQueue *this, OSObject *a2, void (*a3)(OSObject *, ...))
{
  if ((_DWORD)result)
  {
    uint64_t result = IOSimpleLockAlloc();
    *((void *)this + 12) = result;
    if (result)
    {
      IOSimpleLockInit(result);
      *((void *)this + 10) = 0LL;
      *((void *)this + 11) = (char *)this + 80;
      return (IOSimpleLock *)(&dword_0 + 1);
    }
  }

  return result;
}

uint64_t IOGCCommandQueue::init( IOGCCommandQueue *this, OSObject *a2, int (*a3)(OSObject *, void *))
{
  return (*(uint64_t (**)(IOGCCommandQueue *, OSObject *, int (*)(OSObject *, void *)))(*(void *)this + 120LL))( this,  a2,  a3);
}

uint64_t IOGCCommandQueue::free(IOGCCommandQueue *this)
{
  if (*((void *)this + 6)) {
    (*(void (**)(IOGCCommandQueue *, void))(*(void *)this + 136LL))(this, 0LL);
  }
}

uint64_t IOGCCommandQueue::setWorkLoop(IOGCCommandQueue *this, IOWorkLoop *a2)
{
}

uint64_t IOGCCommandQueue::disable(IOGCCommandQueue *this)
{
}

uint64_t IOGCCommandQueue::enable(IOGCCommandQueue *this)
{
}

uint64_t IOGCCommandQueue::commandSleep(IOGCCommandQueue *this, void *a2)
{
  return 3758097095LL;
}

{
  return 3758097095LL;
}

BOOL IOGCCommandQueue::checkForWork(IOSimpleLock **this)
{
  uint64_t v2 = (IOSimpleLock *)(this + 10);
  uint64_t v3 = this[10];
  if (v3)
  {
    uint64_t v4 = *((void *)v3 + 1);
    *(void *)uint64_t v2 = v4;
    if (!v4) {
      this[11] = v2;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  BOOL v5 = v4 != 0;
  IOSimpleLockUnlock(this[12]);
  uint64_t v6 = _gc_log_debug();
  _os_log_internal(&dword_0, v6, OS_LOG_TYPE_DEBUG, "::checkForWork() -> %{BOOL}d", v3 != 0LL);
  if (!v3) {
    return 0LL;
  }
  (*((void (**)(IOSimpleLock *, void))v3 + 2))(this[3], *((void *)v3 + 3));
  if ((*((_BYTE *)v3 + 32) & 2) != 0) {
    IOFreeTypeImpl(&IOGCCommandQueue::checkForWork(void)::kalloc_type_view_130, v3);
  }
  return v5;
}

uint64_t IOGCCommandQueue::syncAction( IOEventSource *this, uint64_t (*a2)(OSObject *, void *), void *a3)
{
  if (a2)
  {
    if (((uint64_t (*)(IOEventSource *))this->getWorkLoop)(this))
    {
      IOEventSource::closeGate(this);
      uint64_t v6 = a2(this->owner, a3);
      IOEventSource::openGate(this);
      return v6;
    }

    uint64_t v10 = _gc_log_debug();
    _os_log_internal( &dword_0,  v10,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "workLoop",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/IOGCCommandQueue.cpp",  144,  0LL);
    return 3758097112LL;
  }

  else
  {
    uint64_t v8 = 3758097090LL;
    uint64_t v9 = _gc_log_debug();
    _os_log_internal( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "action",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/IOGCCommandQueue.cpp",  141,  0LL);
  }

  return v8;
}

uint64_t IOGCCommandQueue::syncCommand(IOGCCommandQueue *this, void *a2)
{
  uint64_t v4 = (*(uint64_t (**)(IOGCCommandQueue *))(*(void *)this + 168LL))(this);
  return (*(uint64_t (**)(IOGCCommandQueue *, uint64_t, void *))(*(void *)this + 248LL))(this, v4, a2);
}

uint64_t IOGCCommandQueue::syncBlock(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t (*)(OSObject *, uint64_t (**)(void)), uint64_t))(*(void *)a1 + 248LL))( a1,  _sync_action_block_thunk_,  a2);
}

uint64_t _sync_action_block_thunk_(OSObject *a1, uint64_t (**a2)(void))
{
  return a2[2](a2);
}

uint64_t IOGCCommandQueue::allocateContinuation(IOGCCommandQueue *this)
{
  return IOMallocTypeImpl(&IOGCCommandQueue::allocateContinuation(void)::kalloc_type_view_178);
}

uint64_t IOGCCommandQueue::freeContinuation(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t IOGCCommandQueue::asyncAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  if (a2)
  {
    if (!a5 || (uint64_t v8 = *a5) == 0LL)
    {
      uint64_t v9 = IOMallocTypeImpl(&IOGCCommandQueue::asyncAction(int (*)(OSObject *,void *),void *,IOGCCommandQueue::AsyncOptions,IOGCCommandQueue::Continuation **)::kalloc_type_view_199);
      if (!v9)
      {
        uint64_t v11 = 3758097085LL;
        uint64_t v14 = _gc_log_debug();
        _os_log_internal( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "asyncContinuation",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/IOGCCommandQueue.cpp",  200,  0LL);
        return v11;
      }

      uint64_t v8 = (void *)v9;
      *(_BYTE *)(v9 + 32) |= 2u;
    }

    *uint64_t v8 = a1;
    v8[2] = a2;
    v8[3] = a3;
    IOSimpleLockLock(*(IOSimpleLock **)(a1 + 96));
    v8[1] = 0LL;
    **(void **)(a1 + 88) = v8;
    *(void *)(a1 + 88) = v8 + 1;
    IOSimpleLockUnlock(*(IOSimpleLock **)(a1 + 96));
    uint64_t v10 = _gc_log_debug();
    _os_log_internal(&dword_0, v10, OS_LOG_TYPE_DEBUG, "::asyncAction() Signal Work Available");
    IOEventSource::signalWorkAvailable((IOEventSource *)a1);
    return 0LL;
  }

  else
  {
    uint64_t v13 = _gc_log_debug();
    _os_log_internal( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "action",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/IOGCCommandQueue.cpp",  194,  0LL);
    return 3758097090LL;
  }

uint64_t IOGCCommandQueue::asyncFunction(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 280LL))(a1);
}

uint64_t IOGCCommandQueue::asyncCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 168LL))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 280LL))( a1,  v8,  a2,  a3,  a4);
}

uint64_t IOGCCommandQueue::asyncBlock(uint64_t a1, _DWORD *aBlock, uint64_t a3, uint64_t a4)
{
  if ((a3 & 3) != 0 && (aBlock[2] & 0x11000000) == 0)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 3758097085LL;
LABEL_5:
    _Block_release(v7);
    return v8;
  }

  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t (*)(OSObject *, uint64_t (**)(void)), void *, uint64_t, uint64_t))(*(void *)a1 + 280LL))( a1,  _async_action_block_thunk_,  v7,  a3,  a4);
  if ((_DWORD)v8) {
    goto LABEL_5;
  }
  return v8;
}

{
  void *v7;
  uint64_t v8;
  if ((a3 & 3) != 0 && (aBlock[2] & 0x11000000) == 0)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 3758097085LL;
LABEL_5:
    _Block_release(v7);
    return v8;
  }

  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void (*)(OSObject *, void (**)(void)), void *, uint64_t, uint64_t))(*(void *)a1 + 288LL))( a1,  _async_function_block_thunk_,  v7,  a3,  a4);
  if ((_DWORD)v8) {
    goto LABEL_5;
  }
  return v8;
}

uint64_t _async_action_block_thunk_(OSObject *a1, uint64_t (**a2)(void))
{
  uint64_t v3 = a2[2](a2);
  _Block_release(a2);
  return v3;
}

void _async_function_block_thunk_(OSObject *a1, void (**a2)(void))
{
}

OSMetaClass *_GLOBAL__sub_I_IOGCCommandQueue_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass( &IOGCCommandQueue::gMetaClass,  "IOGCCommandQueue",  &IOEventSource::gMetaClass,  0x68u);
  result->__vftable = (OSMetaClass_vtbl *)off_10F18;
  return result;
}

void global destructor keyed to'_a_2()
{
}

uint64_t IOGCCircularControlQueueMemorySize(unsigned int a1, int a2)
{
  uint64_t result = 0LL;
  if (a2)
  {
    unsigned int v4 = ((2 * a1 + 14) & 0xFFFFFFF0) + 64;
    if (v4 >= a1)
    {
      uint64_t v5 = 2 * a2 * v4;
      else {
        return v5 + 72;
      }
    }
  }

  return result;
}

uint64_t IOGCCircularControlQueueMemoryInit( unint64_t *a1, uint64_t a2, unsigned int a3, int a4, unint64_t a5)
{
  *(void *)a2 = a5;
  *a1 = a5;
  *(_DWORD *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 12) = a4;
  *((_DWORD *)a1 + 2) = a3;
  *((_DWORD *)a1 + 3) = a4;
  atomic_store(0LL, a1 + 2);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 3);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 4);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 5);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 6);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 7);
  unsigned int v10 = ((2 * a4 + 14) & 0xFFFFFFF0) + 64;
  unsigned int v11 = a3 - 72;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 8);
  if (v10 <= a3 - 72)
  {
    unsigned int v12 = 0;
    LODWORD(v13) = v11 / v10;
    if (v11 / v10 <= 1) {
      uint64_t v13 = 1LL;
    }
    else {
      uint64_t v13 = v13;
    }
    *(void *)&__int128 v14 = -1LL;
    *((void *)&v14 + 1) = -1LL;
    do
    {
      uint64_t v15 = (uint64_t)a1 + v12 + 72;
      *(void *)uint64_t v15 = a5;
      *(_OWORD *)(v15 + 16) = xmmword_E60;
      *(_OWORD *)(v15 + 32) = xmmword_E70;
      *(_OWORD *)(v15 + 48) = v14;
      v12 += v10;
      --v13;
    }

    while (v13);
  }

  return 0LL;
}

uint64_t IOGCCircularControlQueueInit(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if (*(void *)a2 == a5)
  {
    if (*(_DWORD *)(a2 + 8) == a3)
    {
      if (*(_DWORD *)(a2 + 12) == a4)
      {
        uint64_t v5 = 0LL;
        *(void *)a1 = a2;
        *(void *)(a1 + 8) = a5;
        *(_DWORD *)(a1 + 16) = a3;
        *(_DWORD *)(a1 + 20) = a4;
      }

      else
      {
        uint64_t v5 = 3758097105LL;
        uint64_t v9 = _gc_log_debug();
        _os_log_internal( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemory->entryDataSize == entryDataSize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCirc ularControlQueueMemory.c",  150,  0LL);
      }
    }

    else
    {
      uint64_t v5 = 3758097105LL;
      uint64_t v8 = _gc_log_debug();
      _os_log_internal( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemory->memorySize == memorySize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircul arControlQueueMemory.c",  149,  0LL);
    }
  }

  else
  {
    uint64_t v5 = 3758097105LL;
    uint64_t v7 = _gc_log_debug();
    _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemory->sentinel == sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  148,  0LL);
  }

  return v5;
}

uint64_t IOGCCircularControlQueueReset(void *a1, unint64_t a2)
{
  uint64_t v2 = (void *)*a1;
  if (*(void *)*a1 == a1[1])
  {
    uint64_t result = 0LL;
    unsigned int v4 = v2 + 2;
    unint64_t v5 = atomic_load(v2 + 2);
    uint64_t v6 = &v2[3 * (++v5 & 1)];
    atomic_store(0xFFFFFFFFFFFFFFFFLL, v6 + 3);
    atomic_store(a2, v6 + 4);
    atomic_store(0xFFFFFFFFFFFFFFFFLL, v6 + 5);
    atomic_store(v5, v4);
  }

  else
  {
    uint64_t v7 = _gc_log_debug();
    _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  170,  0LL);
    return 3758097105LL;
  }

  return result;
}

uint64_t IOGCCircularControlQueueGetNextApplyPosition(void *a1, void *a2)
{
  uint64_t v2 = (void *)*a1;
  if (*(void *)*a1 == a1[1])
  {
    uint64_t result = 0LL;
    char v4 = atomic_load(v2 + 2);
    *a2 = v2[3 * (v4 & 1) + 4];
  }

  else
  {
    unint64_t v5 = _gc_log_debug();
    _os_log_internal( &dword_0,  v5,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  195,  0LL);
    return 3758097105LL;
  }

  return result;
}

uint64_t IOGCCircularControlQueueGetLastAppliedPosition(void *a1, void *a2)
{
  uint64_t v2 = (void *)*a1;
  if (*(void *)*a1 == a1[1])
  {
    uint64_t result = 0LL;
    char v4 = atomic_load(v2 + 2);
    *a2 = v2[3 * (v4 & 1) + 3];
  }

  else
  {
    unint64_t v5 = _gc_log_debug();
    _os_log_internal( &dword_0,  v5,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  216,  0LL);
    return 3758097105LL;
  }

  return result;
}

uint64_t IOGCCircularControlQueueReadBackwardsFromLatestEnqueued(uint64_t a1, char a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256LL;
  v4[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke;
  v4[3] = &__block_descriptor_tmp_12;
  v4[4] = a3;
  char v5 = a2;
  return _IOGCCircularControlQueueValidateAndAccess(a1, (uint64_t)v4);
}

uint64_t _IOGCCircularControlQueueValidateAndAccess(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 3758097105LL;
  uint64_t v3 = *(void **)a1;
  if (**(void **)a1 == *(void *)(a1 + 8))
  {
    if (*((_DWORD *)v3 + 2) == *(_DWORD *)(a1 + 16))
    {
      if (*((_DWORD *)v3 + 3) == *(_DWORD *)(a1 + 20))
      {
        unint64_t v4 = atomic_load(v3 + 2);
        char v5 = &v3[3 * (v4 & 1)];
        atomic_load(v5 + 3);
        atomic_load(v5 + 4);
        atomic_load(v5 + 5);
        unint64_t v6 = atomic_load(v3 + 2);
        if (v4 == v6) {
          return (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v3);
        }
        else {
          return 3758097109LL;
        }
      }

      else
      {
        unsigned int v10 = _gc_log_debug();
        _os_log_internal( &dword_0,  v10,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entryDataSize == queue->shadow.entryDataSize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCirc ularControlQueueMemory.c",  258,  0LL);
      }
    }

    else
    {
      uint64_t v9 = _gc_log_debug();
      _os_log_internal( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemorySize == queue->shadow.memorySize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircul arControlQueueMemory.c",  257,  0LL);
    }
  }

  else
  {
    uint64_t v8 = _gc_log_debug();
    _os_log_internal( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  256,  0LL);
  }

  return v2;
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v12 = a10;
  if (a10 == -1LL) {
    return 3758097112LL;
  }
  if (a10 < a8)
  {
LABEL_9:
    if (*(_BYTE *)(a1 + 40))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 1107296256LL;
      v22[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_9;
      v22[3] = &__block_descriptor_tmp_10;
      v22[4] = *(void *)(a1 + 32);
      v22[5] = v12;
      v22[6] = a7;
      unsigned int v18 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a12 + 16))(a12, a6, v22);
      if (v18 == -536870166) {
        return 3758097136LL;
      }
      else {
        return v18;
      }
    }

    else
    {
      return 3758097136LL;
    }
  }

  else
  {
    while (1)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 1107296256LL;
      v23[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_2;
      v23[3] = &__block_descriptor_tmp_0;
      v23[4] = *(void *)(a1 + 32);
      v23[5] = v12;
      v23[6] = a7;
      v23[7] = a9;
      uint64_t v16 = (*(uint64_t (**)(uint64_t, unint64_t, void *))(a12 + 16))(a12, v12, v23);
      if ((_DWORD)v16 != -536870166 && (_DWORD)v16 != -536870184) {
        return v16;
      }
      if (--v12 < a8) {
        goto LABEL_9;
      }
    }
  }

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_2(uint64_t a1)
{
  uint64_t result = 0LL;
  **(void **)(a1 + 48) = *(void *)(a1 + 40);
  atomic_store(*(void *)(a1 + 40) + 1LL, *(unint64_t **)(a1 + 56));
  return result;
}

void __copy_helper_block_8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32b(uint64_t a1)
{
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_9(uint64_t a1)
{
  uint64_t result = 0LL;
  **(void **)(a1 + 48) = *(void *)(a1 + 40);
  return result;
}

uint64_t IOGCCircularControlQueueReadForwardFromNextApply(uint64_t a1, char a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256LL;
  v4[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke;
  v4[3] = &__block_descriptor_tmp_16;
  v4[4] = a3;
  char v5 = a2;
  return _IOGCCircularControlQueueValidateAndAccess(a1, (uint64_t)v4);
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t result = 3758097112LL;
  if (a8 != -1 && a10 != -1LL)
  {
    uint64_t v14 = a8;
    while (1)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 1107296256LL;
      v19[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_13;
      v19[4] = *(void *)(a1 + 32);
      v19[5] = v14;
      v19[6] = a7;
      v19[7] = a9;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a12 + 16))(a12, v14, v19);
      if ((_DWORD)result != -536870166 && (_DWORD)result != -536870184) {
        break;
      }
      if (++v14 >= a10)
      {
        uint64_t result = 3758097136LL;
        if (*(_BYTE *)(a1 + 40))
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 1107296256LL;
          v18[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_14;
          v18[3] = &__block_descriptor_tmp_15;
          v18[4] = *(void *)(a1 + 32);
          v18[5] = v14;
          LODWORD(result) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a12 + 16))(a12, a6, v18);
          if ((_DWORD)result == -536870166) {
            return 3758097136LL;
          }
          else {
            return result;
          }
        }

        return result;
      }
    }
  }

  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_2(uint64_t a1)
{
  uint64_t result = 0LL;
  **(void **)(a1 + 48) = *(void *)(a1 + 40);
  atomic_store(*(void *)(a1 + 40) + 1LL, *(unint64_t **)(a1 + 56));
  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_14( uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned int (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40),  1LL,  a2,  a3))
  {
    return 0LL;
  }

  else
  {
    return 3758097130LL;
  }

uint64_t IOGCCircularControlQueueReadNext(uint64_t **a1, uint64_t a2)
{
  uint64_t v2 = 3758097105LL;
  uint64_t v3 = *a1;
  unint64_t v4 = (uint64_t *)**a1;
  if (v4 == a1[1])
  {
    uint64_t v5 = *((unsigned int *)v3 + 2);
    if ((_DWORD)v5 == *((_DWORD *)a1 + 4))
    {
      int v6 = *((_DWORD *)v3 + 3);
      if (v6 == *((_DWORD *)a1 + 5))
      {
        unint64_t v7 = atomic_load((unint64_t *)v3 + 2);
        uint64_t v8 = &v3[3 * (v7 & 1)];
        unint64_t v9 = atomic_load((unint64_t *)v8 + 4);
        if (v9 == -1LL)
        {
          return 3758097112LL;
        }

        else
        {
          uint64_t v10 = ((2 * v6 + 14) & 0xFFFFFFF0) + 64;
          unsigned int v11 = (uint64_t **)((char *)v3
          if ((char *)v11 + v10 > (char *)v3 + v5)
          {
            unsigned int v18 = _gc_log_debug();
            _os_log_internal( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGC CircularControlQueueMemory.c",  585,  0LL);
          }

          else if (*v11 == v4)
          {
            char v12 = atomic_load((unint64_t *)((char *)v3
                                                 + v10
            unsigned int v13 = v12 & 1;
            uint64_t v2 = 3758097112LL;
            if (v11[3 * v13 + 3] == (uint64_t *)v7 && v11[3 * v13 + 4] == (uint64_t *)v9)
            {
              uint64_t v2 = 0LL;
              if ((*(unsigned int (**)(uint64_t, unint64_t, unint64_t))(a2 + 16))( a2,  v9,  (unint64_t)v11 + v13 * (unint64_t)((v6 + 7) & 0xFFFFFFF8) + 64))
              {
                v8[3] = v9;
                atomic_store(v9 + 1, (unint64_t *)v8 + 4);
              }
            }
          }

          else
          {
            unsigned int v19 = _gc_log_debug();
            _os_log_internal( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry->sentinel == queueGuard",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGC CircularControlQueueMemory.c",  586,  0LL);
          }
        }
      }

      else
      {
        uint64_t v17 = _gc_log_debug();
        _os_log_internal( &dword_0,  v17,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entryDataSize == queue->shadow.entryDataSize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCirc ularControlQueueMemory.c",  571,  0LL);
      }
    }

    else
    {
      uint64_t v16 = _gc_log_debug();
      _os_log_internal( &dword_0,  v16,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemorySize == queue->shadow.memorySize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircul arControlQueueMemory.c",  570,  0LL);
    }
  }

  else
  {
    uint64_t v15 = _gc_log_debug();
    _os_log_internal( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  569,  0LL);
  }

  return v2;
}

uint64_t IOGCCircularControlQueueEntryModify(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = 3758097105LL;
  unint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5 == a1[1])
  {
    uint64_t v6 = *((unsigned int *)v4 + 2);
    if ((_DWORD)v6 == *((_DWORD *)a1 + 4))
    {
      uint64_t v7 = *((unsigned int *)v4 + 3);
      if ((_DWORD)v7 == *((_DWORD *)a1 + 5))
      {
        unint64_t v8 = atomic_load((unint64_t *)v4 + 2);
        unint64_t v9 = atomic_load((unint64_t *)&v4[3 * (v8 & 1) + 4]);
        if (v9 == -1LL)
        {
          return 3758097112LL;
        }

        else
        {
          unsigned int v10 = (v7 + 7) & 0xFFFFFFF8;
          uint64_t v11 = (((int)v6 - 72) / (2 * v10 + 64)) >> 1;
          if (v9 + v11 <= (unint64_t)a2)
          {
            return 3758097128LL;
          }

          else if ((unint64_t)a2 + v11 <= v9)
          {
            return 3758097127LL;
          }

          else
          {
            uint64_t v12 = ((2 * (_DWORD)v7 + 14) & 0xFFFFFFF0) + 64;
            unsigned int v13 = (uint64_t **)((char *)v4
                             + v12
            if ((char *)v13 + v12 > (char *)v4 + v6)
            {
              unsigned int v20 = _gc_log_debug();
              _os_log_internal( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IO GCCircularControlQueueMemory.c",  664,  0LL);
            }

            else if (*v13 == v5)
            {
              unint64_t v14 = atomic_load((unint64_t *)((char *)v4
                                                   + v12
                                                   * ((unint64_t)a2
              uint64_t v15 = &v13[3 * ((v14 & 1) == 0)];
              v15[2] = (uint64_t *)v14;
              v15[3] = (uint64_t *)v8;
              v15[4] = a2;
              (*(void (**)(uint64_t, unint64_t, uint64_t))(a3 + 16))( a3,  (unint64_t)v13 + ((v14 & 1) == 0) * (unint64_t)v10 + 64,  v7);
              return 0LL;
            }

            else
            {
              unsigned int v21 = _gc_log_debug();
              _os_log_internal( &dword_0,  v21,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry->sentinel == queueGuard",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IO GCCircularControlQueueMemory.c",  665,  0LL);
            }
          }
        }
      }

      else
      {
        unsigned int v19 = _gc_log_debug();
        _os_log_internal( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entryDataSize == queue->shadow.entryDataSize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCirc ularControlQueueMemory.c",  635,  0LL);
      }
    }

    else
    {
      unsigned int v18 = _gc_log_debug();
      _os_log_internal( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemorySize == queue->shadow.memorySize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircul arControlQueueMemory.c",  634,  0LL);
    }
  }

  else
  {
    uint64_t v17 = _gc_log_debug();
    _os_log_internal( &dword_0,  v17,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  633,  0LL);
  }

  return v3;
}

uint64_t IOGCCircularControlQueueEntryCommitModifications(uint64_t **a1, unint64_t a2)
{
  uint64_t v2 = 3758097105LL;
  uint64_t v3 = *a1;
  unint64_t v4 = (uint64_t *)**a1;
  if (v4 != a1[1])
  {
    unsigned int v19 = _gc_log_debug();
    _os_log_internal( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  699,  0LL);
    return v2;
  }

  uint64_t v5 = *((unsigned int *)v3 + 2);
  if ((_DWORD)v5 != *((_DWORD *)a1 + 4))
  {
    unsigned int v20 = _gc_log_debug();
    _os_log_internal( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemorySize == queue->shadow.memorySize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  700,  0LL);
    return v2;
  }

  int v6 = *((_DWORD *)v3 + 3);
  if (v6 != *((_DWORD *)a1 + 5))
  {
    unsigned int v21 = _gc_log_debug();
    _os_log_internal( &dword_0,  v21,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entryDataSize == queue->shadow.entryDataSize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  701,  0LL);
    return v2;
  }

  unint64_t v7 = atomic_load((unint64_t *)v3 + 2);
  unint64_t v8 = &v3[3 * (v7 & 1)];
  unint64_t v9 = atomic_load((unint64_t *)v8 + 4);
  unsigned int v10 = (unint64_t *)(v8 + 5);
  unint64_t v11 = atomic_load(v10);
  if (v9 == -1LL) {
    return 3758097112LL;
  }
  unsigned int v12 = ((2 * v6 + 14) & 0xFFFFFFF0) + 64;
  unint64_t v13 = ((int)v5 - 72) / v12;
  uint64_t v14 = v13 >> 1;
  if (v9 + v14 <= a2) {
    return 3758097128LL;
  }
  if (v14 + a2 <= v9) {
    return 3758097127LL;
  }
  uint64_t v15 = (uint64_t *)((char *)v3 + v12 * (a2 % v13) + 72);
  if ((char *)v15 + v12 > (char *)v3 + v5)
  {
    uint64_t v22 = _gc_log_debug();
    _os_log_internal( &dword_0,  v22,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  731,  0LL);
    return v2;
  }

  if ((uint64_t *)*v15 != v4)
  {
    uint64_t v23 = _gc_log_debug();
    _os_log_internal( &dword_0,  v23,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry->sentinel == queueGuard",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  732,  0LL);
    return v2;
  }

  unint64_t v16 = atomic_load(v15 + 1);
  unint64_t v17 = v16 + 1;
  if (v15[3 * (v17 & 1) + 3] != v7) {
    return 3758097131LL;
  }
  if (v15[3 * (v17 & 1) + 4] != a2) {
    return 3758097112LL;
  }
  atomic_store(v17, v15 + 1);
  if (v11 != -1LL && v11 >= a2) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  atomic_store(a2, v10);
  return v2;
}

uint64_t IOGCCircularControlQueueEntryResetModifications(uint64_t **a1, unint64_t a2)
{
  uint64_t v2 = 3758097105LL;
  uint64_t v3 = *a1;
  unint64_t v4 = (uint64_t *)**a1;
  if (v4 == a1[1])
  {
    uint64_t v5 = *((unsigned int *)v3 + 2);
    if ((_DWORD)v5 == *((_DWORD *)a1 + 4))
    {
      size_t v6 = *((unsigned int *)v3 + 3);
      if ((_DWORD)v6 == *((_DWORD *)a1 + 5))
      {
        char v7 = atomic_load((unint64_t *)v3 + 2);
        unint64_t v8 = atomic_load((unint64_t *)&v3[3 * (v7 & 1) + 4]);
        if (v8 == -1LL)
        {
          return 3758097112LL;
        }

        else
        {
          unsigned int v9 = (v6 + 7) & 0xFFFFFFF8;
          uint64_t v11 = (((int)v5 - 72) / (2 * v9 + 64)) >> 1;
          if (v8 + v11 <= a2)
          {
            return 3758097128LL;
          }

          else if (v11 + a2 <= v8)
          {
            return 3758097127LL;
          }

          else
          {
            uint64_t v12 = ((2 * (_DWORD)v6 + 14) & 0xFFFFFFF0) + 64;
            unsigned int v10 = v5 - 72;
            unint64_t v13 = (uint64_t **)((char *)v3
            if ((char *)v13 + v12 > (char *)v3 + v5)
            {
              uint64_t v22 = _gc_log_debug();
              _os_log_internal( &dword_0,  v22,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IO GCCircularControlQueueMemory.c",  802,  0LL);
            }

            else if (*v13 == v4)
            {
              char v14 = atomic_load((unint64_t *)((char *)v3
              unsigned int v15 = v14 & 1;
              uint64_t v16 = (uint64_t)&v3[3 * (v15 ^ 1) + 11]
                  + v12 * (a2 % (v10 / v12));
              uint64_t v17 = (uint64_t)&v3[3 * v15 + 11] + v12 * (a2 % (v10 / v12));
              memmove( (char *)v13 + (v15 ^ 1) * (unint64_t)v9 + 64,  (char *)v13 + v15 * (unint64_t)v9 + 64,  v6);
              uint64_t v2 = 0LL;
              *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
              *(void *)(v16 + 16) = *(void *)(v17 + 16);
            }

            else
            {
              uint64_t v23 = _gc_log_debug();
              _os_log_internal( &dword_0,  v23,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry->sentinel == queueGuard",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IO GCCircularControlQueueMemory.c",  803,  0LL);
            }
          }
        }
      }

      else
      {
        unsigned int v21 = _gc_log_debug();
        _os_log_internal( &dword_0,  v21,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entryDataSize == queue->shadow.entryDataSize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCirc ularControlQueueMemory.c",  773,  0LL);
      }
    }

    else
    {
      unsigned int v20 = _gc_log_debug();
      _os_log_internal( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueMemorySize == queue->shadow.memorySize",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircul arControlQueueMemory.c",  772,  0LL);
    }
  }

  else
  {
    unsigned int v19 = _gc_log_debug();
    _os_log_internal( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "queueGuard == queue->shadow.sentinel",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  771,  0LL);
  }

  return v2;
}

OSMetaClass *IOGCResource::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCResource", &IOService::gMetaClass, 0x90u);
  result->__vftable = (OSMetaClass_vtbl *)off_11648;
  return result;
}

{
  OSMetaClass *result;
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCResource", &IOService::gMetaClass, 0x90u);
  result->__vftable = (OSMetaClass_vtbl *)off_11648;
  return result;
}

void IOGCResource::IOGCResource(IOGCResource *this, const OSMetaClass *a2)
{
  uint64_t v2 = IOService::IOService((IOService *)this, a2);
  v2->__vftable = (IOService_vtbl *)off_110F0;
  v2[1].__vftable = 0LL;
}

{
  IOService *v2;
  uint64_t v2 = IOService::IOService((IOService *)this, a2);
  v2->__vftable = (IOService_vtbl *)off_110F0;
  v2[1].__vftable = 0LL;
}

void IOGCResource::~IOGCResource(IOService *this)
{
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IOService_vtbl *))v2->~IOService + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IOService::~IOService(this);
}

{
  IOService_vtbl *v2;
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IOService_vtbl *))v2->~IOService + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IOService::~IOService(this);
}

{
  IOService_vtbl *v2;
  uint64_t v2 = this[1].__vftable;
  if (v2) {
    (*((void (**)(IOService_vtbl *))v2->~IOService + 5))(v2);
  }
  this[1].__vftable = 0LL;
  IOService::~IOService(this);
  OSObject_typed_operator_delete(&IOGCResource_ktv, this, 144LL);
}

void IOGCResource::operator delete(void *a1, uint64_t a2)
{
}

void *IOGCResource::getMetaClass(IOGCResource *this)
{
  return &IOGCResource::gMetaClass;
}

IOService *IOGCResource::MetaClass::alloc(IOGCResource::MetaClass *this)
{
  uint64_t v1 = (IOService *)OSObject_typed_operator_new(&IOGCResource_ktv, 144LL);
  uint64_t v2 = IOService::IOService(v1, &IOGCResource::gMetaClass);
  v2->__vftable = (IOService_vtbl *)off_110F0;
  v2[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCResource::gMetaClass);
  return v1;
}

uint64_t IOGCResource::operator new(IOGCResource *this)
{
  return OSObject_typed_operator_new(&IOGCResource_ktv, this);
}

void IOGCResource::IOGCResource(IOGCResource *this)
{
  uint64_t v1 = IOService::IOService((IOService *)this, &IOGCResource::gMetaClass);
  v1->__vftable = (IOService_vtbl *)off_110F0;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCResource::gMetaClass);
}

{
  IOService *v1;
  uint64_t v1 = IOService::IOService((IOService *)this, &IOGCResource::gMetaClass);
  v1->__vftable = (IOService_vtbl *)off_110F0;
  v1[1].__vftable = 0LL;
  OSMetaClass::instanceConstructed(&IOGCResource::gMetaClass);
}

uint64_t IOGCResource::free(IOGCResource *this)
{
}

uint64_t IOGCResource::start(IOGCResource *this, IOService *a2)
{
  {
    uint64_t v3 = IOWorkLoop::workLoop();
    uint64_t v4 = *((void *)this + 17);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 40LL))(v4);
    }
    *((void *)this + 17) = v3;
    if (v3)
    {
      (*(void (**)(IOGCResource *, uint64_t))(*(void *)this + 672LL))(this, 8LL);
      return 1LL;
    }

    else
    {
      char v7 = _gc_log_debug();
      _os_log_internal( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "_workLoop",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/IOGCResource.cpp",  34,  0LL);
      return 0LL;
    }
  }

  else
  {
    size_t v6 = _gc_log_debug();
    _os_log_internal( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "IOService::start(provider)",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/IOGCResource.cpp",  31,  0LL);
    return 0LL;
  }

uint64_t IOGCResource::getWorkLoop(IOGCResource *this)
{
  return *((void *)this + 17);
}

OSMetaClass *_GLOBAL__sub_I_IOGCResource_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&IOGCResource::gMetaClass, "IOGCResource", &IOService::gMetaClass, 0x90u);
  result->__vftable = (OSMetaClass_vtbl *)off_11648;
  return result;
}

void global destructor keyed to'_a_3()
{
}

OSMetaClass *IOGCPortNotifier::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCPortNotifier", &IODataQueue::gMetaClass, 0x40u);
  result->__vftable = (OSMetaClass_vtbl *)off_117A0;
  return result;
}

{
  OSMetaClass *result;
  uint64_t result = OSMetaClass::OSMetaClass(this, "IOGCPortNotifier", &IODataQueue::gMetaClass, 0x40u);
  result->__vftable = (OSMetaClass_vtbl *)off_117A0;
  return result;
}

void IOGCPortNotifier::IOGCPortNotifier(IOGCPortNotifier *this, const OSMetaClass *a2)
{
  IODataQueue::IODataQueue((IODataQueue *)this, a2)->__vftable = (IODataQueue_vtbl *)off_116E0;
}

{
  IODataQueue::IODataQueue((IODataQueue *)this, a2)->__vftable = (IODataQueue_vtbl *)off_116E0;
}

void IOGCPortNotifier::~IOGCPortNotifier(IODataQueue *this)
{
}

void IOGCPortNotifier::operator delete(void *a1, uint64_t a2)
{
}

void *IOGCPortNotifier::getMetaClass(IOGCPortNotifier *this)
{
  return &IOGCPortNotifier::gMetaClass;
}

IODataQueue *IOGCPortNotifier::MetaClass::alloc(IOGCPortNotifier::MetaClass *this)
{
  uint64_t v1 = (IODataQueue *)OSObject_typed_operator_new(&IOGCPortNotifier_ktv, 64LL);
  IODataQueue::IODataQueue(v1, &IOGCPortNotifier::gMetaClass)->__vftable = (IODataQueue_vtbl *)off_116E0;
  OSMetaClass::instanceConstructed(&IOGCPortNotifier::gMetaClass);
  return v1;
}

uint64_t IOGCPortNotifier::operator new(IOGCPortNotifier *this)
{
  return OSObject_typed_operator_new(&IOGCPortNotifier_ktv, this);
}

void IOGCPortNotifier::IOGCPortNotifier(IOGCPortNotifier *this)
{
  IODataQueue::IODataQueue((IODataQueue *)this, &IOGCPortNotifier::gMetaClass)->__vftable = (IODataQueue_vtbl *)off_116E0;
  OSMetaClass::instanceConstructed(&IOGCPortNotifier::gMetaClass);
}

{
  IODataQueue::IODataQueue((IODataQueue *)this, &IOGCPortNotifier::gMetaClass)->__vftable = (IODataQueue_vtbl *)off_116E0;
  OSMetaClass::instanceConstructed(&IOGCPortNotifier::gMetaClass);
}

uint64_t IOGCPortNotifier::free(IOGCPortNotifier *this)
{
}

uint64_t IOGCPortNotifier::init(IOGCPortNotifier *this)
{
  if ((_DWORD)result) {
    *((void *)this + 3) = (char *)this + 32;
  }
  return result;
}

uint64_t IOGCPortNotifier::sendDataAvailableNotification(IOGCPortNotifier *this)
{
}

uint64_t IOGCPortNotifier::setNotificationPort(IOGCPortNotifier *this, ipc_port *a2)
{
}

uint64_t IOGCPortNotifier::initWithCapacity(IOGCPortNotifier *this)
{
  return 0LL;
}

uint64_t IOGCPortNotifier::initWithEntries(IOGCPortNotifier *this)
{
  return 0LL;
}

uint64_t IOGCPortNotifier::enqueue(IOGCPortNotifier *this, void *a2)
{
  return 0LL;
}

uint64_t IOGCPortNotifier::getMemoryDescriptor(IOGCPortNotifier *this)
{
  return 0LL;
}

OSMetaClass *_GLOBAL__sub_I_IOGCPortNotifier_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&IOGCPortNotifier::gMetaClass, "IOGCPortNotifier", &IODataQueue::gMetaClass, 0x40u);
  result->__vftable = (OSMetaClass_vtbl *)off_117A0;
  return result;
}

void global destructor keyed to'_a_4()
{
}

uint64_t IOCircularDataQueueInitFixed(uint64_t a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  if (HIDWORD(a3)) {
    return 3758097090LL;
  }
  uint64_t result = 0LL;
  *(void *)a2 = a5;
  *(void *)a1 = a5;
  *(_DWORD *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 12) = a4;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 12) = a4;
  atomic_store(1uLL, (unint64_t *)(a1 + 16));
  atomic_store(1uLL, (unint64_t *)(a1 + 24));
  atomic_store(0LL, (unint64_t *)(a1 + 32));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 40));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 48));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 56));
  return result;
}

uint64_t IOCircularDataQueueGetStartingPosition(uint64_t a1, void *a2)
{
  uint64_t result = 3758097095LL;
  if (*(_DWORD *)(a1 + 12))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4 == -1)
    {
      return 3758097112LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t IOCircularDataQueueGetLatestPosition(uint64_t a1, unint64_t *a2)
{
  uint64_t result = 3758097095LL;
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t v4 = atomic_load((unint64_t *)(a1 + 48));
    if (v4 == -1LL)
    {
      return 3758097112LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t IOCircularDataQueueReset(uint64_t a1, unint64_t a2)
{
  uint64_t result = 3758097109LL;
  if (a2 == -1LL) {
    return 3758097090LL;
  }
  unint64_t v4 = atomic_load((unint64_t *)(a1 + 16));
  uint64_t v5 = (unint64_t *)(a1 + 24);
  unint64_t v6 = atomic_load((unint64_t *)(a1 + 24));
  if (v4 == v6)
  {
    do
    {
      unint64_t v7 = __ldaxr(v5);
      if (v7 != v4)
      {
        __clrex();
        return result;
      }
    }

    while (__stlxr(v4 + 1, v5));
    uint64_t v8 = atomic_load((unint64_t *)(a1 + 32));
    if (v8 <= 0)
    {
      if (*(_DWORD *)(a1 + 12))
      {
        uint64_t result = 0LL;
        atomic_store(a2, (unint64_t *)(a1 + 40));
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 48));
        atomic_store(a2, (unint64_t *)(a1 + 56));
      }

      else
      {
        uint64_t result = 3758097095LL;
      }

      ++v4;
    }

    atomic_store(v4, (unint64_t *)(a1 + 16));
  }

  return result;
}

uint64_t IOCircularDataQueueEnqueueCopy(unint64_t a1, uint64_t a2, void *__src, size_t __len)
{
  uint64_t result = 3758097090LL;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6 != *(_DWORD *)(a2 + 8)) {
    return 3758097105LL;
  }
  uint64_t v7 = *(unsigned int *)(a1 + 12);
  if ((_DWORD)v7 != *(_DWORD *)(a2 + 12)) {
    return 3758097105LL;
  }
  if (__len <= 0xFFFFFFC7)
  {
    uint64_t v8 = (unint64_t *)(a1 + 32);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    unint64_t v10 = atomic_load((unint64_t *)(a1 + 16));
    unint64_t v11 = atomic_load((unint64_t *)(a1 + 24));
    if (v10 == v11)
    {
      if ((_DWORD)v7)
      {
        if (v7 >= __len)
        {
          uint64_t v12 = (unint64_t *)(a1 + 56);
          unint64_t v13 = atomic_load((unint64_t *)(a1 + 56));
          if (v13 == -1LL)
          {
            uint64_t result = 3758097112LL;
          }

          else
          {
            unint64_t v14 = (v7 + 63) & 0x1FFFFFFF8LL;
            unint64_t v15 = (v6 - 64) / v14;
            unint64_t v16 = a1 + 64 + v13 % v15 * v14;
            unint64_t v17 = a1 + v6;
            if (v16 >= a1 && v16 < v17)
            {
              do
              {
                unint64_t v19 = __ldaxr(v12);
                if (v19 != v13)
                {
                  uint64_t result = 3758097109LL;
                  goto LABEL_28;
                }
              }

              while (__stlxr(v13 + 1, v12));
              atomic_store(v13, (unint64_t *)(v16 + 40));
              *(void *)unint64_t v16 = *(void *)a1;
              atomic_store(v10, (unint64_t *)(v16 + 8));
              atomic_store(v13 - 1, (unint64_t *)(v16 + 16));
              atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v16 + 24));
              *(_DWORD *)(v16 + 48) = __len;
              memmove((void *)(v16 + 56), __src, __len);
              atomic_store(v13, (unint64_t *)(v16 + 32));
              if (v13) {
                atomic_store(v13, (unint64_t *)(a1 + 64 + (v13 - 1) % v15 * v14 + 24));
              }
              unsigned int v20 = (unint64_t *)(a1 + 48);
              unint64_t v21 = atomic_load((unint64_t *)(a1 + 48));
              if (v21 != -1LL && v13 <= v21)
              {
LABEL_25:
                uint64_t result = 0LL;
                goto LABEL_29;
              }

              while (1)
              {
                unint64_t v23 = __ldaxr(v20);
                if (v23 != v21) {
                  break;
                }
                if (!__stlxr(v13, v20)) {
                  goto LABEL_25;
                }
              }

              uint64_t result = 0LL;
LABEL_28:
              __clrex();
            }
          }
        }
      }

      else
      {
        uint64_t result = 3758097095LL;
      }
    }

    else
    {
      do
        unint64_t v25 = __ldaxr(v8);
      while (__stlxr(v25 - 1, v8));
      uint64_t result = 3758097109LL;
    }

    do
LABEL_29:
      unint64_t v24 = __ldaxr(v8);
    while (__stlxr(v24 - 1, v8));
  }

  return result;
}

uint64_t IOCircularDataQueueCursorReset(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  uint64_t result = 3758097095LL;
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 16));
    unint64_t v6 = atomic_load((unint64_t *)(a1 + 40));
    unint64_t v7 = atomic_load((unint64_t *)(a1 + 48));
    if (v7 == -1LL)
    {
      return 3758097112LL;
    }

    else if (v6 > a3)
    {
      return 3758097127LL;
    }

    else if (v7 < a3)
    {
      return 3758097128LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v5;
      a2[1] = a3;
    }
  }

  return result;
}

uint64_t IOCircularDataQueueCursorResetLatest(uint64_t a1, unint64_t *a2)
{
  uint64_t result = 3758097095LL;
  unint64_t v4 = atomic_load((unint64_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 48));
    if (v5 == -1LL)
    {
      return 3758097112LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
      a2[1] = v5;
    }
  }

  return result;
}

uint64_t IOCircularDataQueueCursorMovePrevious(uint64_t a1, void *a2)
{
  uint64_t result = 3758097095LL;
  unint64_t v4 = atomic_load((unint64_t *)(a1 + 16));
  if (*a2 != v4) {
    return 3758097131LL;
  }
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 40));
    unint64_t v6 = atomic_load((unint64_t *)(a1 + 48));
    if (v6 == -1LL)
    {
      return 3758097112LL;
    }

    else
    {
      unint64_t v7 = a2[1];
      if (v7 <= v5)
      {
        return 3758097127LL;
      }

      else
      {
        uint64_t result = 0LL;
        a2[1] = v7 - 1;
      }
    }
  }

  return result;
}

uint64_t IOCircularDataQueueCursorMoveNext(uint64_t a1, void *a2)
{
  uint64_t result = 3758097095LL;
  unint64_t v4 = atomic_load((unint64_t *)(a1 + 16));
  if (*a2 != v4) {
    return 3758097131LL;
  }
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 48));
    if (v5 == -1LL)
    {
      return 3758097112LL;
    }

    else
    {
      unint64_t v6 = a2[1];
      if (v6 >= v5)
      {
        return 3758097128LL;
      }

      else
      {
        uint64_t result = 0LL;
        a2[1] = v6 + 1;
      }
    }
  }

  return result;
}

uint64_t IOCircularDataQueueCursorAccess(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  unint64_t v5 = atomic_load((unint64_t *)(a1 + 16));
  unint64_t v6 = atomic_load((unint64_t *)(a1 + 48));
  if (*a2 != v5) {
    return 3758097131LL;
  }
  unint64_t v7 = a2[1];
  if (v7 > v6) {
    return 3758097128LL;
  }
  if (!(_DWORD)v3) {
    return 3758097095LL;
  }
  unint64_t v8 = v7 % ((v4 - 64) / ((v3 + 63) & 0x1FFFFFFF8uLL)) * ((v3 + 63) & 0x1FFFFFFF8LL);
  uint64_t v9 = 3758097090LL;
  if ((v8 & 0x8000000000000000LL) == 0)
  {
    unint64_t v10 = a1 + v8 + 64;
    if (v10 < a1 + v4)
    {
      if (*(void *)v10 != *(void *)a1) {
        return 3758097105LL;
      }
      unint64_t v11 = atomic_load((unint64_t *)(v10 + 8));
      if (v11 == v5)
      {
        unint64_t v12 = atomic_load((unint64_t *)(v10 + 32));
        unint64_t v13 = atomic_load((unint64_t *)(v10 + 40));
        if (v12 != v13) {
          return 3758097127LL;
        }
        uint64_t v9 = 3758097127LL;
        if (v12 == a2[1])
        {
          (*(void (**)(uint64_t, unint64_t, void))(a3 + 16))( a3,  v10 + 56,  *(unsigned int *)(v10 + 48));
          return 0LL;
        }

        return v9;
      }

      return 3758097131LL;
    }
  }

  return v9;
}

uint64_t _start()
{
  if (_realmain) {
    return _realmain();
  }
  else {
    return 0LL;
  }
}

const char *OSKextGetCurrentIdentifier(void)
{
  return aComAppleIokitI;
}

const char *OSKextGetCurrentVersionString(void)
{
  return (const char *)&unk_C050;
}

OSKextLoadTag OSKextGetCurrentLoadTag(void)
{
  return dword_C00C;
}

uint64_t _stop()
{
  if (_antimain) {
    return _antimain();
  }
  else {
    return 0LL;
  }
}