void ctu::XpcLogServer::~XpcLogServer(ctu::XpcLogServer *this)
{
  void **v2;
  *(void *)this = &off_189E99D38;
  *((void *)this + 9) = &unk_189E99D78;
  v2 = (void **)((char *)this + 144);
  std::vector<std::shared_ptr<ctu::RestResourceConnection>>::__destroy_vector::operator()[abi:ne180100](&v2);
  *((void *)this + 9) = off_189E99EC0;
  *((void *)this + 10) = &unk_189E96F18;
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)this + 128);
  ctu::LoggerCommonBase::~LoggerCommonBase((void **)this + 10);
  ctu::XpcServer::~XpcServer(this);
}

{
  void *v2;
  void **v3;
  *(void *)this = &off_189E99D38;
  *((void *)this + 9) = &unk_189E99D78;
  v3 = (void **)((char *)this + 144);
  std::vector<std::shared_ptr<ctu::RestResourceConnection>>::__destroy_vector::operator()[abi:ne180100](&v3);
  *((void *)this + 9) = off_189E99EC0;
  *((void *)this + 10) = &unk_189E96F18;
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)this + 128);
  ctu::LoggerCommonBase::~LoggerCommonBase((void **)this + 10);
  ctu::XpcServer::~XpcServer(this);
  operator delete(v2);
}

void non-virtual thunk to'ctu::XpcLogServer::~XpcLogServer(ctu::XpcLogServer *this)
{
  *((void *)this - 9) = &off_189E99D38;
  v2 = (ctu::XpcLogServer *)((char *)this - 72);
  *(void *)this = &unk_189E99D78;
  v3 = (void **)((char *)this + 72);
  std::vector<std::shared_ptr<ctu::RestResourceConnection>>::__destroy_vector::operator()[abi:ne180100](&v3);
  *(void *)this = off_189E99EC0;
  *((void *)this + 1) = &unk_189E96F18;
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  ctu::LoggerCommonBase::~LoggerCommonBase((void **)this + 1);
  ctu::XpcServer::~XpcServer(v2);
}

{
  ctu::XpcServer *v2;
  void *v3;
  void **v4;
  *((void *)this - 9) = &off_189E99D38;
  v2 = (ctu::XpcLogServer *)((char *)this - 72);
  *(void *)this = &unk_189E99D78;
  v4 = (void **)((char *)this + 72);
  std::vector<std::shared_ptr<ctu::RestResourceConnection>>::__destroy_vector::operator()[abi:ne180100](&v4);
  *(void *)this = off_189E99EC0;
  *((void *)this + 1) = &unk_189E96F18;
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  ctu::LoggerCommonBase::~LoggerCommonBase((void **)this + 1);
  ctu::XpcServer::~XpcServer(v2);
  operator delete(v3);
}

uint64_t ctu::Loggable<ctu::XpcLogServer,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig( uint64_t result, char a2)
{
  *(_BYTE *)(result + 49) = a2;
  return result;
}

void ctu::Loggable<ctu::XpcLogServer,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName( uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 - 9) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(a1 - 32), *(void *)(a1 - 24));
  }

  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 - 32);
    a2->__r_.__value_.__l.__cap_ = *(void *)(a1 - 16);
  }

uint64_t ctu::Loggable<ctu::XpcLogServer,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel( uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t ctu::Loggable<ctu::XpcLogServer,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable( uint64_t a1)
{
  *(void *)a1 = off_189E99EC0;
  *(void *)(a1 + 8) = &unk_189E96F18;
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100](a1 + 56);
  ctu::LoggerCommonBase::~LoggerCommonBase((void **)(a1 + 8));
  return a1;
}

void ctu::Loggable<ctu::XpcLogServer,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *(void *)a1 = off_189E99EC0;
  *((void *)a1 + 1) = &unk_189E96F18;
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 56);
  ctu::LoggerCommonBase::~LoggerCommonBase((void **)a1 + 1);
  operator delete(a1);
}

void std::__shared_ptr_emplace<ctu::XpcLoggerProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189E99F00;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::XpcLoggerProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189E99F00;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ctu::XpcLoggerProxy>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 8LL))(a1 + 24);
}

void std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::~__shared_ptr_pointer( std::__shared_weak_count *a1)
{
}

uint64_t std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::__on_zero_shared( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::__get_deleter( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

void std::__shared_ptr_pointer<ctu::XpcLogServer *,std::shared_ptr<ctu::XpcLogServer> ctu::SharedSynchronizable<ctu::XpcServer>::make_shared_ptr<ctu::XpcLogServer>(ctu::XpcLogServer*)::{lambda(ctu::XpcLogServer *)#1},std::allocator<ctu::XpcLogServer>>::~__shared_ptr_pointer( std::__shared_weak_count *a1)
{
}

void std::__shared_ptr_pointer<ctu::XpcLogServer *,std::shared_ptr<ctu::XpcLogServer> ctu::SharedSynchronizable<ctu::XpcServer>::make_shared_ptr<ctu::XpcLogServer>(ctu::XpcLogServer*)::{lambda(ctu::XpcLogServer *)#1},std::allocator<ctu::XpcLogServer>>::__on_zero_shared( uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<ctu::XpcLogServer *,std::shared_ptr<ctu::XpcLogServer> ctu::SharedSynchronizable<ctu::XpcServer>::make_shared_ptr<ctu::XpcLogServer>(ctu::XpcLogServer*)::{lambda(ctu::XpcLogServer *)#1},std::allocator<ctu::XpcLogServer>>::__get_deleter( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

uint64_t std::shared_ptr<ctu::XpcLogServer> ctu::SharedSynchronizable<ctu::XpcServer>::make_shared_ptr<ctu::XpcLogServer>(ctu::XpcLogServer*)::{lambda(ctu::XpcLogServer*)#1}::operator() const(ctu::XpcLogServer*)::{lambda(void *)#1}::__invoke( uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 32LL))(result);
  }
  return result;
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __copy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcServerEEE(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

void __destroy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcServerEEE(uint64_t a1)
{
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIU13block_pointerFN3xpc8endpointEvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16LL))();
}

void ___ZN8dispatch9sync_implIRU13block_pointerFN3xpc8endpointEvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS6_17integral_constantIbLb0EEE_block_invoke( uint64_t a1)
{
  (*(void (**)(xpc_object_t *__return_ptr))(**(void **)(a1 + 40) + 16LL))(&object);
  v2 = *(void ***)(a1 + 32);
  xpc_object_t v3 = object;
  xpc_object_t object = xpc_null_create();
  unint64_t v4 = *v2;
  std::__shared_weak_count *v2 = v3;
  xpc_release(v4);
  xpc_release(object);
}

void ___ZN8dispatch19async_and_wait_implIRU13block_pointerFN3xpc8endpointEvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS6_17integral_constantIbLb0EEE_block_invoke( uint64_t a1)
{
  (*(void (**)(xpc_object_t *__return_ptr))(**(void **)(a1 + 40) + 16LL))(&object);
  v2 = *(void ***)(a1 + 32);
  xpc_object_t v3 = object;
  xpc_object_t object = xpc_null_create();
  unint64_t v4 = *v2;
  std::__shared_weak_count *v2 = v3;
  xpc_release(v4);
  xpc_release(object);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1896025E0](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFDateFormatterRef CFDateFormatterCreate( CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x189602B00](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x189602B20](allocator, formatter, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x189602C48](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x189602C80]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x189603540](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037D0](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x18960B3F0]();
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x18960B6C8](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x18960B710](trust, anchorCertificates);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find( const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x189614170](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x189614180](this, __s);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1896141C0](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x189614208](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x189614220](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x189614238](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

std::regex_error *__cdecl std::regex_error::regex_error( std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x189614280](this, *(void *)&__ecode);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x189614298](a1);
}

void std::string::__grow_by_and_replace( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142C8](this, __pos, __n);
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1896142E8](this, __n, __c);
}

std::string *__cdecl std::string::insert( std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x189614310](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace( std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x189614320](this, __pos, __n1, __s, __n2);
}

std::string *__cdecl std::string::replace( std::string *this, std::string::size_type __pos, std::string::size_type __n1, std::string::size_type __n2, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x189614328](this, __pos, __n1, __n2, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string( std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x189614348](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x189614368]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x189614370]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x189614378]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x189614380]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x189614388]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x189614390]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x189614398]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1896143A8]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1896143B0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1896143B8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1896143C0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1896143D8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143E0]();
}

{
  return MEMORY[0x1896143F0]();
}

{
  return MEMORY[0x1896143F8]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614410]();
}

{
  return MEMORY[0x189614418]();
}

{
  return MEMORY[0x189614430]();
}

{
  return MEMORY[0x189614438]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x189614448]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x189614458](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1896144C0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1896144D8](retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x189614548](__str, __idx, *(void *)&__base);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x189614550](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::stoll(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x189614578](__str, __idx, *(void *)&__base);
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x189614580](__str, __idx, *(void *)&__base);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x189614598]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1896145B8](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1896145C0](this);
}

void std::locale::~locale(std::locale *this)
{
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1896145D8](__str, __idx, *(void *)&__base);
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x189614640](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x189614658](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x189614660](retstr, __val);
}

{
  return (std::string *)MEMORY[0x189614670](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x189614668](retstr, __val);
}

{
  return (std::string *)MEMORY[0x189614678](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x189614680]();
}

void std::exception::~exception(std::exception *this)
{
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  return (std::terminate_handler)MEMORY[0x1896146A0](a1);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1896146A8]();
}

void std::rethrow_exception(std::exception_ptr a1)
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
  return (void *)off_189E931B0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_189E931B8(__sz, a2);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1895F8878](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1896147C8](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1896147F0](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1895F8880](*(void *)&a1, a2, *(void *)&a3);
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x189614810](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void cfmakeraw(termios *a1)
{
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x1895FA518](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

kern_return_t clock_get_time(clock_serv_t clock_serv, mach_timespec_t *cur_time)
{
  return MEMORY[0x1895FA560](*(void *)&clock_serv, cur_time);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit2_( z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x189617598]( strm,  *(void *)&level,  *(void *)&method,  *(void *)&windowBits,  *(void *)&memLevel,  *(void *)&strategy,  version,  *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class()
{
  return MEMORY[0x1895FAE28]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

kern_return_t host_get_clock_service(host_t host, clock_id_t clock_id, clock_serv_t *clock_serv)
{
  return MEMORY[0x1895FB768](*(void *)&host, *(void *)&clock_id, clock_serv);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x189617618](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1895FBC98](start_size, *(void *)&flags);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1895FBCC0](size);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)MEMORY[0x1895FBD10](zone, num_items, size);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)MEMORY[0x1895FBD30](zone, size);
}

void *__cdecl malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  return (void *)MEMORY[0x1895FBD40](zone, alignment, size);
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)MEMORY[0x1895FBD48](zone, ptr, size);
}

void *__cdecl malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  return (void *)MEMORY[0x1895FBD58](zone, size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1895FC5F8](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1895FC670](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC7E0](a1, a2, a3, a4, __argv, __envp);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1895FC9C0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1895FCA58](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1895FCBB8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

int reboot_np(int howto, const char *message)
{
  return MEMORY[0x1895FCCA0](*(void *)&howto, message);
}

int remove(const char *a1)
{
  return MEMORY[0x1895FCD08](a1);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1895FCE10](*(void *)&a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x1895FD020](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x1895FD380](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x1895FD390](*(void *)&a1, *(void *)&a2, a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1895FD978]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1895FDAB0]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1895FDB58](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD70](connection);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1895FDD88](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FDEB0](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

xpc_object_t xpc_string_create_with_format_and_arguments(const char *fmt, va_list ap)
{
  return (xpc_object_t)MEMORY[0x1895FE068](fmt, ap);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1895FE070](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1895FE110](xuuid);
}