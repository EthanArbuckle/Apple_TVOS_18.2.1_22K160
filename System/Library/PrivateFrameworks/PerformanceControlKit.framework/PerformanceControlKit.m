void clpc::user::iokit::Object::~Object(clpc::user::iokit::Object *this)
{
  int v1;
  *(void *)this = off_18A2C3F58;
  v1 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = 0;
  if (v1) {
    IOObjectRelease(0);
  }
}

{
  void *v1;
  clpc::user::iokit::Object::~Object(this);
  operator delete(v1);
}

void clpc::user::iokit::RegistryEntry::~RegistryEntry(clpc::user::iokit::RegistryEntry *this)
{
}

void clpc::user::iokit::Service::~Service(clpc::user::iokit::Service *this)
{
  *(void *)this = off_18A2C3F78;
  io_connect_t v2 = *((_DWORD *)this + 3);
  if (v2) {
    IOServiceClose(v2);
  }
  *((_DWORD *)this + 3) = 0;
  clpc::user::iokit::Object::~Object(this);
}

{
  void *v1;
  clpc::user::iokit::Service::~Service(this);
  operator delete(v1);
}

void __clang_call_terminate(void *a1)
{
}

void clpc::user::iokit::CLPC::~CLPC(clpc::user::iokit::CLPC *this)
{
  *(void *)this = off_18A2C3F98;
  io_connect_t v2 = (void *)*((void *)this + 2);
  *((void *)this + 2) = 0LL;
  if (v2) {
    operator delete[](v2);
  }
  clpc::user::iokit::Service::~Service(this);
}

{
  void *v1;
  clpc::user::iokit::CLPC::~CLPC(this);
  operator delete(v1);
}

void clpc::user::ioreport::Channel::~Channel(id *this)
{
}

{
}

{

  operator delete(this);
}

void clpc::user::ioreport::Sample::~Sample(id *this)
{
}

{
}

{

  operator delete(this);
}

void clpc::user::ioreport::Subscription::~Subscription(clpc::user::ioreport::Subscription *this)
{
  *(void *)this = off_18A2C3FB8;
  io_connect_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
}

{
  void *v1;
  clpc::user::ioreport::Subscription::~Subscription(this);
  operator delete(v1);
}

void clpc::user::ioreport::ChannelList::withAllChannels(uint64_t a1@<X8>)
{
  io_connect_t v2 = (void *)IOReportCopyAllChannels();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }

  else
  {
    char v3 = 0;
    *(_BYTE *)a1 = 0;
  }

  *(_BYTE *)(a1 + 8) = v3;
}

void clpc::user::ioreport::ChannelList::fromCategories(uint64_t a1@<X8>)
{
  io_connect_t v2 = (void *)IOReportCopyChannelsInCategories();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }

  else
  {
    char v3 = 0;
    *(_BYTE *)a1 = 0;
  }

  *(_BYTE *)(a1 + 8) = v3;
}

void clpc::user::ioreport::ChannelList::fromFormat(uint64_t a1@<X8>)
{
  io_connect_t v2 = (void *)IOReportCopyChannelsOfFormat();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }

  else
  {
    char v3 = 0;
    *(_BYTE *)a1 = 0;
  }

  *(_BYTE *)(a1 + 8) = v3;
}

void clpc::user::ioreport::ChannelList::fromGroup(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  v4 = a1;
  [NSString stringWithUTF8String:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:a2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  clpc::user::ioreport::ChannelList::fromGroup(v7, v6, a3);
}

void sub_188971570( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::fromGroup(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (void *)IOReportCopyChannelsInGroup();
  if (v7)
  {
    *(void *)a3 = v7;
    char v8 = 1;
  }

  else
  {
    char v8 = 0;
    *(_BYTE *)a3 = 0;
  }

  *(_BYTE *)(a3 + 8) = v8;
}

void sub_188971640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::fromProvider(uint64_t a1@<X8>)
{
  io_connect_t v2 = (void *)IOReportCopyChannelsForDriver();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }

  else
  {
    char v3 = 0;
    *(_BYTE *)a1 = 0;
  }

  *(_BYTE *)(a1 + 8) = v3;
}

void anonymous namespace'::populate_error_unsupported_stat(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unsupported stat ID %llu.", a1);
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *MEMORY[0x189607490];
    v6[0] = v3;
    [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v4];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
}

void sub_188971870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::populate_error_unsupported_schema(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unsupported schema ID %lu.", a1);
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *MEMORY[0x189607490];
    v6[0] = v3;
    [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v4];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

void sub_188971ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188971C2C(_Unwind_Exception *a1)
{
}

void sub_188971E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188972038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188972088( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1889721C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188972290( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100](uint64_t a1, id *a2)
{
  for (uint64_t i = 0LL; i != 64; i += 8LL)
    objc_storeStrong((id *)(a1 + i), *a2);
}

void sub_1889724C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1889725A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_188972664( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_188972890(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1889731AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20, void *a21, void *a22, char a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, id a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, char *a38, char a39)
{
  v42 = a38;
  if (a38 == v40)
  {
    uint64_t v43 = 4LL;
    v42 = &a35;
  }

  else
  {
    if (!a38) {
      goto LABEL_6;
    }
    uint64_t v43 = 5LL;
  }

  (*(void (**)(void))(*(void *)v42 + 8 * v43))();
LABEL_6:
  if (a23) {

  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&a25);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&a39);

  _Unwind_Resume(a1);
}

CFTypeRef clpc::user::iokit::RegistryEntry::createProperty( clpc::user::iokit::RegistryEntry *this, const __CFString *a2)
{
  return (id)IORegistryEntryCreateCFProperty( *((_DWORD *)this + 2),  a2,  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
}

void anonymous namespace'::populate_error_property_read(void *a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = *MEMORY[0x189607490];
    v4[0] = @"Failed to read AppleCLPC property.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
    io_connect_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870199 userInfo:v2];
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }

void sub_1889733CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::populate_error_internal(void *a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = *MEMORY[0x189607490];
    v4[0] = @"An internal error occurred.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
    io_connect_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870199 userInfo:v2];
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }

void sub_1889734A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1889735E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t clpc::user::ioreport::ChannelList::iterate(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  io_connect_t v2 = v5;
  std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]((uint64_t)v5, a2);
  uint64_t result = IOReportIterate();
  if (v6 == v5)
  {
    uint64_t v4 = 4LL;
  }

  else
  {
    if (!v6) {
      return result;
    }
    uint64_t v4 = 5LL;
    io_connect_t v2 = v6;
  }

  return (*(uint64_t (**)(void *))(*v2 + 8 * v4))(v2);
}

void sub_1889736CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  if (a17 == v17)
  {
    uint64_t v19 = 4LL;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v19 = 5LL;
    v17 = a17;
  }

  (*(void (**)(void *))(*v17 + 8 * v19))(v17);
LABEL_6:
  _Unwind_Resume(exception_object);
}

LABEL_8:
    ;
  }

  return v3;
}

    ;
  }

  return v3;
}

LABEL_15:
  clpc::user::ioreport::ChannelList::fromProvider((uint64_t)&v45);
  v15 = a4;
  if (v46)
  {
    v44 = 0;
    v60 = off_18A2C42E0;
    *(void *)&v61 = &v47;
    *((void *)&v61 + 1) = &v44;
    v62 = &v60;
    v16 = v45;
    v65 = MEMORY[0x1895F87A8];
    v66 = 3321888768LL;
    v67 = ___ZN4clpc4user8ioreport11ChannelList6filterENSt3__18functionIFbNS1_7ChannelEEEE_block_invoke;
    v68 = &__block_descriptor_64_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE_e25_i16__0____CFDictionary__8l;
    v17 = &v69;
    v71 = &v69;
    v69 = off_18A2C42E0;
    v70 = v61;
    IOReportPrune();
    if (v71 == &v69)
    {
      v18 = 4LL;
    }

    else
    {
      if (!v71) {
        goto LABEL_25;
      }
      v18 = 5LL;
      v17 = v71;
    }

    ((void (*)(uint64_t (***)()))(*v17)[v18])(v17);
LABEL_25:
    v20 = v62;
    if (v62 == &v60)
    {
      v21 = 4LL;
      v20 = &v60;
    }

    else
    {
      if (!v62)
      {
LABEL_30:
        if (*((void *)&v48 + 1) == v44)
        {
          v56 = 0LL;
          v57 = 0LL;
          CFAllocatorGetDefault();
          Subscription = IOReportCreateSubscription();
          if (v56) {
            *v15 = v56;
          }
          v53 = off_18A2C3FB8;
          v54 = Subscription;
          v55 = v57;
          if (Subscription && v57)
          {
            v65 = (unint64_t)off_18A2C3FB8;
            v66 = Subscription;
            v67 = (uint64_t (*)(uint64_t, CFTypeRef))v57;
            v54 = 0LL;
            v23 = 1;
          }

          else
          {
            v23 = 0;
            LOBYTE(v65) = 0;
          }

          LOBYTE(v68) = v23;
          clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v53);
          uint64_t v19 = (_BYTE)v68 != 0;
          if ((_BYTE)v68)
          {
            std::vector<CLPCReportingStatID>::reserve( (void **)&self->configured_stat_ids.__begin_,  *((unint64_t *)&v51 + 1));
            do
            {
              v53 = *(void (***)(clpc::user::ioreport::Subscription *__hidden))v24;
              if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>( &v50,  (unint64_t *)&v53))
              {
                end = p_configured_stat_ids->__end_;
                value = p_configured_stat_ids->__end_cap_.__value_;
                if (end >= value)
                {
                  begin = p_configured_stat_ids->__begin_;
                  v29 = end - p_configured_stat_ids->__begin_;
                  v30 = v29 + 1;
                  v31 = (char *)value - (char *)begin;
                  if (v31 >> 2 > v30) {
                    v30 = v31 >> 2;
                  }
                  else {
                    v32 = v30;
                  }
                  if (v32)
                  {
                    v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>( (uint64_t)&p_configured_stat_ids->__end_cap_,  v32);
                    begin = p_configured_stat_ids->__begin_;
                    end = p_configured_stat_ids->__end_;
                  }

                  else
                  {
                    v33 = 0LL;
                  }

                  v34 = (unint64_t *)&v33[8 * v29];
                  *v34 = (unint64_t)v53;
                  v27 = v34 + 1;
                  while (end != begin)
                  {
                    v35 = *--end;
                    *--v34 = v35;
                  }

                  p_configured_stat_ids->__begin_ = v34;
                  p_configured_stat_ids->__end_ = v27;
                  p_configured_stat_ids->__end_cap_.__value_ = (unint64_t *)&v33[8 * v32];
                  if (begin) {
                    operator delete(begin);
                  }
                }

                else
                {
                  *end = (unint64_t)v53;
                  v27 = end + 1;
                }

                p_configured_stat_ids->__end_ = v27;
                if (v43)
                {
                  v36 = 0LL;
                  {
                    if (++v36 == 25) {
                      goto LABEL_64;
                    }
                  }

                  v43[v36 + 8] = 1;
                }
              }

LABEL_64:
              v24 += 8;
            }

            while (v24 != "emit");
            objc_storeStrong((id *)&location->channels, v16);
            v37 = v67;
            p_reporting_subscription->subscription = (__IOReportSubscriptionCF *)v66;
            objc_storeStrong((id *)p_subscribed_channels, v37);
            v66 = 0LL;
            goto LABEL_68;
          }

          if (v15)
          {
            v58 = *MEMORY[0x189607490];
            v59 = @"Failed to subscribe to AppleCLPC IOReporting channels.";
            [MEMORY[0x189603F68] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870212 userInfo:v38];
            *v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_68:
            if ((_BYTE)v68) {
              clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v65);
            }
            v16 = v45;
            goto LABEL_71;
          }
        }

        else
        {
        }

        uint64_t v19 = 0;
LABEL_71:

        goto LABEL_72;
      }

      v21 = 5LL;
    }

    (*v20)[v21]();
    goto LABEL_30;
  }

  if (a4)
  {
    v63 = *MEMORY[0x189607490];
    v64 = @"Failed to list AppleCLPC IOReporting channels.";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870212 userInfo:v16];
    uint64_t v19 = 0;
    *v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_71;
  }

LABEL_20:
  uint64_t v19 = 0;
LABEL_72:
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v47);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v50);

  return v19;
}

void sub_188973EB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);

  if (*(_BYTE *)(v10 - 144)) {
    clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)(v10 - 168));
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)va);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)va1);

  _Unwind_Resume(a1);
}

void std::vector<CLPCReportingStatID>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    id v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8LL];
    v9 = &v6[8 * v8];
    uint64_t v10 = (char *)*a1;
    v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_188974144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1889741EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_188974744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188974A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188974DD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21)
{
  for (uint64_t i = 56LL; i != -8; i -= 8LL)
  _Unwind_Resume(a1);
}

void sub_188974F94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18897514C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN4clpc4user8ioreport11ChannelList7iterateENSt3__18functionIFvNS1_7ChannelEEEE_block_invoke( uint64_t a1, CFTypeRef cf)
{
  v6[0] = &unk_18A2C4050;
  v6[1] = (id)cf;
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *))(*(void *)v4 + 48LL))(v4, v6);
  clpc::user::ioreport::Channel::~Channel(v6);
  return 0LL;
}

void sub_1889753EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t __copy_helper_block_ea8_32c55_ZTSNSt3__18functionIFvN4clpc4user8ioreport7ChannelEEEE( uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]( a1 + 32,  a2 + 32);
}

void *__destroy_helper_block_ea8_32c55_ZTSNSt3__18functionIFvN4clpc4user8ioreport7ChannelEEEE(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 56);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    uint64_t result = v1;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v3 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
}

uint64_t std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

uint64_t ___ZN4clpc4user8ioreport11ChannelList6filterENSt3__18functionIFbNS1_7ChannelEEEE_block_invoke( uint64_t a1, CFTypeRef cf)
{
  v7[0] = &unk_18A2C4050;
  v7[1] = (id)cf;
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  else {
    uint64_t v5 = 16LL;
  }
  clpc::user::ioreport::Channel::~Channel(v7);
  return v5;
}

void sub_188975568( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t __copy_helper_block_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE( uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]( a1 + 32,  a2 + 32);
}

void *__destroy_helper_block_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 56);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    uint64_t result = v1;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v3 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A2C3D78, MEMORY[0x1896141F8]);
}

void sub_18897560C(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void sub_1889757F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>( void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }

  id v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }

      else
      {
        v8 &= *(void *)&v2 - 1LL;
      }

      if (v8 != v5) {
        return 0LL;
      }
    }
  }

  return result;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

uint64_t ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke( uint64_t a1, CFTypeRef cf)
{
  v6[0] = &unk_18A2C4080;
  v6[1] = (id)cf;
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *))(*(void *)v4 + 48LL))(v4, v6);
  clpc::user::ioreport::Sample::~Sample(v6);
  return 0LL;
}

void sub_1889759BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t __copy_helper_block_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE( uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]( a1 + 32,  a2 + 32);
}

void *__destroy_helper_block_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 56);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    uint64_t result = v1;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v3 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>( uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x18uLL);
  *uint64_t i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t i = *v19;
LABEL_38:
    *uint64_t v19 = i;
    goto LABEL_39;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return v11;
}

  ++*(void *)(a1 + 24);
  return v11;
}

  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return i;
}

void sub_188975C5C(_Unwind_Exception *a1)
{
}

void std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__do_rehash<true>( a1,  prime);
  }

void std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_unique<std::pair<unsigned int const,CLPCReportingStatID> const*>( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0LL; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0LL;
    uint64_t v8 = a1[2];
    a1[2] = 0LL;
    a1[3] = 0LL;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = (void *)v8;
    }

    else
    {
      do
      {
        *(_DWORD *)(v8 + 16) = *(_DWORD *)v4;
        *(void *)(v8 + 24) = *(void *)(v4 + 8);
        uint64_t v10 = *(void **)v8;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique( a1,  v8);
        v4 += 16LL;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v8 = (uint64_t)v10;
      }

      while (!v11);
    }

    if (v10)
    {
      do
      {
        unint64_t v12 = (void *)*v10;
        operator delete(v10);
        uint64_t v10 = v12;
      }

      while (v12);
    }
  }

  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,CLPCReportingStatID> const&>( (uint64_t)a1,  (unsigned int *)v4,  (_OWORD *)v4);
    v4 += 16LL;
  }

void sub_188975F80(void *a1)
{
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }

  while (v2);
  __cxa_rethrow();
}

void sub_188975FA0(_Unwind_Exception *a1)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique( void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  unint64_t v5 = (_DWORD *)(a2 + 16);
  unint64_t v4 = *(unsigned int *)(a2 + 16);
  *((void *)v5 - 1) = v4;
  uint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_prepare[abi:ne180100]( (uint64_t)a1,  v4,  v5);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_perform[abi:ne180100]( a1,  v2);
  return v2;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_prepare[abi:ne180100]( uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    uint64_t v6 = *(uint64_t ***)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = *v6; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a2)
        {
          if (*((_DWORD *)i + 4) == *a3) {
            return i;
          }
        }

        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }

          else
          {
            v8 &= v3 - 1;
          }

          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }

  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    uint64_t v11 = 2 * v3;
    BOOL v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v13 = v12 | v11;
    unint64_t v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v13;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v15);
  }

  return 0LL;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_perform[abi:ne180100]( void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }

  else
  {
    v3 &= *(void *)&v2 - 1LL;
  }

  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *uint64_t v5 = a2;
    goto LABEL_14;
  }

  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }

    else
    {
      v6 &= *(void *)&v2 - 1LL;
    }

    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }

LABEL_14:
  ++result[3];
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,CLPCReportingStatID> const&>( uint64_t a1, unsigned int *a2, _OWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    float v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      float v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          float v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  float v10 = operator new(0x20uLL);
  void *v10 = 0LL;
  v10[1] = v6;
  *((_OWORD *)v10 + 1) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }

  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_1889763DC(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    float v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  unint64_t v11 = operator new(0x20uLL);
  void *v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    *unint64_t v20 = v11;
    goto LABEL_39;
  }

  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_188976600(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    float v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  unint64_t v11 = operator new(0x18uLL);
  void *v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    *unint64_t v20 = v11;
    goto LABEL_39;
  }

  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_188976820(_Unwind_Exception *a1)
{
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,CLPCReportingStatID>,void *> *>>( void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0LL; i != v6; *(void *)(*a1 + 8 * i++) = 0LL)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0LL;
  a1[3] = 0LL;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      v8[3] = a2[3];
      float v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare( (uint64_t)a1,  v9,  (_DWORD *)v8 + 4);
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform( a1,  v8,  inserted);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }

    do
    {
      unint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }

    while (v12);
  }

  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_multi<std::pair<unsigned int const,CLPCReportingStatID> const&>( a1,  (_OWORD *)a2 + 1);
      a2 = (uint64_t *)*a2;
    }
  }

void sub_188976910(void *a1)
{
  do
  {
    int8x8_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }

  while (v2);
  __cxa_rethrow();
}

void sub_188976930(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare( uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__rehash<false>( a1,  v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }

  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }

  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }

  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0LL;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }

    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }

    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && *(_DWORD *)(v16 + 16) == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }

  while (v22 != 1);
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform( void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }

  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

    if (v6 != v4) {
      goto LABEL_18;
    }
  }

LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__rehash<false>( uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__do_rehash<false>( a1,  prime);
  }

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__do_rehash<false>( uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }

        else
        {
          v12 &= a2 - 1;
        }

        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }

        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (uint64_t *)*v13;
            }

            while (v13 && *((_DWORD *)i + 4) == *((_DWORD *)v13 + 4));
            *uint64_t v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }

          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }

  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

unsigned int *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_multi<std::pair<unsigned int const,CLPCReportingStatID> const&>( void *a1, _OWORD *a2)
{
  int8x8_t v4 = (unsigned int *)operator new(0x20uLL);
  *((_OWORD *)v4 + 1) = *a2;
  unint64_t v5 = v4[4];
  *(void *)int8x8_t v4 = 0LL;
  *((void *)v4 + 1) = v5;
  inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare( (uint64_t)a1,  v5,  v4 + 4);
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform( a1,  v4,  inserted);
  return v4;
}

void sub_188976E30(_Unwind_Exception *a1)
{
}

void std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,unsigned int>,void *> *>>( void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0LL; i != v6; *(void *)(*a1 + 8 * i++) = 0LL)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0LL;
  a1[3] = 0LL;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      *((_DWORD *)v8 + 5) = *((_DWORD *)a2 + 5);
      BOOL v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare( (uint64_t)a1,  v9,  (_DWORD *)v8 + 4);
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform( a1,  v8,  inserted);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }

    do
    {
      unint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }

    while (v12);
  }

  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_multi<std::pair<unsigned int const,unsigned int> const&>( a1,  a2 + 2);
      a2 = (uint64_t *)*a2;
    }
  }

void sub_188976F20(void *a1)
{
  do
  {
    int8x8_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }

  while (v2);
  __cxa_rethrow();
}

void sub_188976F40(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_multi<std::pair<unsigned int const,unsigned int> const&>( void *a1, uint64_t *a2)
{
  int8x8_t v4 = operator new(0x18uLL);
  uint64_t v5 = *a2;
  void v4[2] = *a2;
  void *v4 = 0LL;
  v4[1] = v5;
  inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare( (uint64_t)a1,  v5,  (_DWORD *)v4 + 4);
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform( a1,  v4,  inserted);
  return v4;
}

void sub_188976FB8(_Unwind_Exception *a1)
{
}

void sub_1889770C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void *std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>( void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == v3) {
          return result;
        }
      }

      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }

        else
        {
          v8 &= *(void *)&v2 - 1LL;
        }

        if (v8 != v5) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      BOOL v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          BOOL v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  BOOL v10 = operator new(0x18uLL);
  void *v10 = 0LL;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    *unint64_t v19 = v10;
    goto LABEL_39;
  }

  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_1889773DC(_Unwind_Exception *a1)
{
}

void sub_1889774C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::clear( void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }

      while (v2);
    }

    v1[2] = 0LL;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0LL;
    }

    v1[3] = 0LL;
  }

  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>( uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    BOOL v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0LL;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( a1,  v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t i = *v20;
LABEL_38:
    *unint64_t v20 = i;
    goto LABEL_39;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_188977790(_Unwind_Exception *a1)
{
}

LABEL_24:
  clpc::user::ioreport::Sample::~Sample(&v25);
}

void sub_188977CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  clpc::user::ioreport::Sample::~Sample((id *)va);
  _Unwind_Resume(a1);
}

void sub_1889784E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  clpc::user::ioreport::Sample::~Sample(&a9);
  _Unwind_Resume(a1);
}

void sub_1889786E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1889787A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1889788B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1889789F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188978BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188978D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188978ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18897901C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1889791DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18897963C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_188979F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18897A0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

clpc::user::iokit::CLPC *clpc::user::iokit::CLPC::CLPC(clpc::user::iokit::CLPC *this)
{
  *((_DWORD *)this + 3) = 0;
  int8x8_t v2 = (io_connect_t *)((char *)this + 12);
  *((_DWORD *)this + 2) = 0;
  *(void *)this = off_18A2C3F98;
  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = 0LL;
  uint64_t v3 = IOServiceMatching("AppleCLPC");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086A8], v3);
  if (!MatchingService)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1895CF908](exception, "Could not get service.");
    __cxa_throw(exception, MEMORY[0x1896146E8], MEMORY[0x189614248]);
  }

  v9[0] = off_18A2C3F78;
  v9[1] = 0LL;
  *((_DWORD *)this + 2) = MatchingService;
  clpc::user::iokit::Service::~Service((clpc::user::iokit::Service *)v9);
  if (*((void *)this + 3) != 0x400000LL)
  {
    unint64_t v5 = (void *)*((void *)this + 2);
    *((void *)this + 2) = 0LL;
    *((void *)this + 3) = 0x400000LL;
    if (v5) {
      operator delete[](v5);
    }
  }

  io_service_t v6 = *((_DWORD *)this + 2);
  if (v6 && !*v2) {
    IOServiceOpen(v6, *MEMORY[0x1895FBBE0], 0, v2);
  }
  return this;
}

void sub_18897A234(_Unwind_Exception *a1)
{
  unint64_t v4 = *v2;
  *int8x8_t v2 = 0LL;
  if (v4) {
    operator delete[](v4);
  }
  clpc::user::iokit::Service::~Service(v1);
  _Unwind_Resume(a1);
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x1895F8158]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x1895F8160]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1895F8168]();
}

uint64_t CCDigestReset()
{
  return MEMORY[0x1895F8188]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1895F8190]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

uint64_t IOReportArrayGetValueAtIndex()
{
  return MEMORY[0x189613618]();
}

uint64_t IOReportChannelGetChannelID()
{
  return MEMORY[0x189613620]();
}

uint64_t IOReportCopyAllChannels()
{
  return MEMORY[0x189613640]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x189613648]();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return MEMORY[0x189613658]();
}

uint64_t IOReportCopyChannelsInGroup()
{
  return MEMORY[0x189613660]();
}

uint64_t IOReportCopyChannelsOfFormat()
{
  return MEMORY[0x189613668]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x189613670]();
}

uint64_t IOReportCreateSamplesDelta()
{
  return MEMORY[0x189613678]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x189613680]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x189613688]();
}

uint64_t IOReportHistogramGetBucketCount()
{
  return MEMORY[0x189613690]();
}

uint64_t IOReportHistogramGetBucketHits()
{
  return MEMORY[0x189613698]();
}

uint64_t IOReportHistogramGetBucketSum()
{
  return MEMORY[0x1896136A0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1896136A8]();
}

uint64_t IOReportPrune()
{
  return MEMORY[0x1896136B0]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1896136C8]();
}

uint64_t IOReportStateGetCount()
{
  return MEMORY[0x1896136D0]();
}

uint64_t IOReportStateGetIDForIndex()
{
  return MEMORY[0x1896136D8]();
}

uint64_t IOReportStateGetInTransitions()
{
  return MEMORY[0x1896136E0]();
}

uint64_t IOReportStateGetResidency()
{
  return MEMORY[0x1896136E8]();
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x189614220](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A2C3DA8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1895FCEA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}