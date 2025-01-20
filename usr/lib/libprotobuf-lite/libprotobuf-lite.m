uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder::Find( uint64_t a1, unsigned int a2, _OWORD *a3)
{
  uint64_t *v4;
  __int128 v5;
  void v7[2];
  v7[0] = *(void *)(a1 + 8);
  v7[1] = a2;
  if (!v4) {
    return 0LL;
  }
  v5 = *((_OWORD *)v4 + 3);
  *a3 = *((_OWORD *)v4 + 2);
  a3[1] = v5;
  return 1LL;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterExtension( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, int a3, char a4, char a5)
{
  char v7 = a3;
  unsigned int v8 = a2;
  switch(a3)
  {
    case 14:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  116);
      v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v19,  "CHECK failed: (type) != (WireFormatLite::TYPE_ENUM): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v10,  v11);
LABEL_7:
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
      break;
    case 11:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  117);
      v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v19,  "CHECK failed: (type) != (WireFormatLite::TYPE_MESSAGE): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v12,  v13);
      goto LABEL_7;
    case 10:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  118);
      v14 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v19,  "CHECK failed: (type) != (WireFormatLite::TYPE_GROUP): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v14,  v15);
      goto LABEL_7;
  }

  v16[0] = v7;
  v16[1] = a4;
  v16[2] = a5;
  uint64_t v17 = 0LL;
}

void sub_187C22700( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::Register( uint64_t a1, unsigned int a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  if (v6 != 2)
  {
    *(void *)&__int128 v18 = off_18A11A6F8;
    LOBYTE(v19) = 0;
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)&v18);
  }

  *(void *)&__int128 v18 = a1;
  *((void *)&v18 + 1) = a2;
  __int128 v7 = *((_OWORD *)a3 + 1);
  __int128 v19 = *(_OWORD *)a3;
  __int128 v20 = v7;
  if ((v8 & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)&v18,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  86);
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( (std::string *)&v18,  "Multiple extension registrations for type ");
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 16LL))(__p, a1);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v9,  (const std::string::value_type *)__p);
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, ", field number ");
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, a2);
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, ".");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18);
  }
}

void sub_187C2285C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterEnumExtension( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, int a3, char a4, char a5, uint64_t a6, BOOL (*a7)(int))
{
  char v10 = a3;
  unsigned int v11 = a2;
  if (a3 != 14)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v20,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  140);
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v20,  "CHECK failed: (type) == (WireFormatLite::TYPE_ENUM): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v19,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
  }

  v15[0] = v10;
  v15[1] = a4;
  v15[2] = a5;
  v16 = wireless_diagnostics::google::protobuf::internal::CallNoArgValidityFunc;
  uint64_t v17 = a6;
  uint64_t v18 = 0LL;
}

void sub_187C22958( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::CallNoArgValidityFunc( wireless_diagnostics::google::protobuf::internal *this, const void *a2)
{
  return ((uint64_t (*)(const void *))this)(a2);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterMessageExtension( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, char a3, char a4, char a5, uint64_t a6, const wireless_diagnostics::google::protobuf::MessageLite *a7)
{
  unsigned int v11 = a2;
  if ((a3 & 0xFE) != 0xA)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  153);
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v19,  "CHECK failed: type == WireFormatLite::TYPE_MESSAGE || type == WireFormatLite::TYPE_GROUP: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }

  v15[0] = a3;
  v15[1] = a4;
  v15[2] = a5;
  uint64_t v16 = a6;
  uint64_t v17 = 0LL;
}

void sub_187C22A30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(void *this)
{
  this[2] = 0LL;
  this[1] = 0LL;
  *this = this + 1;
  return this;
}

{
  this[2] = 0LL;
  this[1] = 0LL;
  *this = this + 1;
  return this;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::~ExtensionSet( wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  v2 = this + 1;
  v3 = *this;
  if (*this != (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1))
  {
    do
    {
      wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Free((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)((char *)v3 + 40));
      v4 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v3 + 1);
      if (v4)
      {
        do
        {
          v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v4;
          v4 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v4;
        }

        while (v4);
      }

      else
      {
        do
        {
          v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v3 + 2);
          BOOL v6 = *v5 == v3;
          v3 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v5;
        }

        while (!v6);
      }

      v3 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v5;
    }

    while (v5 != v2);
  }

  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy( (uint64_t)this,  this[1]);
}

void __clang_call_terminate(void *a1)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Free( wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this)
{
  int v1 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)this
                                                                                                + 8)];
  if (*((_BYTE *)this + 9))
  {
    switch(*((_BYTE *)this + 8))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
        uint64_t v2 = *(void *)this;
        if (*(void *)this)
        {
          if (*(void *)v2) {
            operator delete[](*(void **)v2);
          }
          goto LABEL_17;
        }

        break;
      case 9:
      case 0xC:
        uint64_t v2 = *(void *)this;
        if (*(void *)this)
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(*(void *)this);
          goto LABEL_17;
        }

        break;
      case 0xA:
      case 0xB:
        uint64_t v2 = *(void *)this;
        if (*(void *)this)
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(*(void *)this);
          goto LABEL_17;
        }

        break;
      default:
        return;
    }
  }

  else if (v1 == 10)
  {
    uint64_t v3 = *(void *)this;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
    }
  }

  else if (v1 == 9)
  {
    uint64_t v2 = *(void *)this;
    if (*(void *)this)
    {
LABEL_17:
      operator delete((void *)v2);
    }
  }

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::Has( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  v4 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = v4;
  if (!v4) {
    return 0LL;
  }
  v5 = v2;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      char v8 = (char **)v3;
    }
    else {
      char v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      v5 = v3;
    }
    uint64_t v3 = *v8;
  }

  while (*v8);
  return v5 != v2 && *((_DWORD *)v5 + 8) <= a2 && (v5[50] & 1) == 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::NumExtensions( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  uint64_t v3 = *(char **)this;
  int v1 = (char *)this + 8;
  uint64_t v2 = v3;
  if (v3 == v1) {
    return 0LL;
  }
  LODWORD(v4) = 0;
  do
  {
    if ((v2[50] & 1) != 0) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = (v4 + 1);
    }
    v5 = (char *)*((void *)v2 + 1);
    if (v5)
    {
      do
      {
        int v6 = v5;
        v5 = *(char **)v5;
      }

      while (v5);
    }

    else
    {
      do
      {
        int v6 = (char *)*((void *)v2 + 2);
        BOOL v7 = *(void *)v6 == (void)v2;
        uint64_t v2 = v6;
      }

      while (!v7);
    }

    uint64_t v2 = v6;
  }

  while (v6 != v1);
  return v4;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSize( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = v4;
  if (!v4) {
    return 0LL;
  }
  v5 = v2;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      char v8 = (char **)v3;
    }
    else {
      char v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      v5 = v3;
    }
    uint64_t v3 = *v8;
  }

  while (*v8);
  if (v5 != v2 && *((_DWORD *)v5 + 8) <= a2) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::GetSize((wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *)(v5 + 40));
  }
  else {
    return 0LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::GetSize( wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this)
{
  switch(*((_BYTE *)this + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
    case 0x12:
      uint64_t result = *(unsigned int *)(*(void *)this + 8LL);
      break;
    default:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v5,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  1415);
      uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "Can't get here.");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v4,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2,  v3);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void sub_187C22DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionType( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char v4 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  v5 = v2;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      char v8 = (char **)v3;
    }
    else {
      char v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      v5 = v3;
    }
    uint64_t v3 = *v8;
  }

  while (*v8);
  if (v5 != v2 && *((_DWORD *)v5 + 8) <= a2)
  {
    if ((v5[50] & 1) != 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  208);
      v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "Don't lookup extension types if they aren't present (2). ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v12,  v13);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    }

    return v5[48];
  }

  else
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  204);
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "Don't lookup extension types if they aren't present (1). ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9,  v10);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    return 0LL;
  }

void sub_187C22EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = *((void *)this + 1);
  uint64_t result = (uint64_t **)((char *)this + 8);
  uint64_t v3 = v4;
  if (v4)
  {
    uint64_t v5 = (uint64_t)result;
    do
    {
      int v6 = *(_DWORD *)(v3 + 32);
      BOOL v7 = v6 < a2;
      if (v6 >= a2) {
        char v8 = (uint64_t *)v3;
      }
      else {
        char v8 = (uint64_t *)(v3 + 8);
      }
      if (!v7) {
        uint64_t v5 = v3;
      }
      uint64_t v3 = *v8;
    }

    while (*v8);
  }

  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear(uint64_t **this)
{
  int v1 = this;
  if (*((_BYTE *)this + 9))
  {
    switch(*((_BYTE *)this + 8))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
        *((_DWORD *)*this + 2) = 0;
        break;
      case 9:
      case 0xC:
        this = (uint64_t **)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)*this);
        break;
      case 0xA:
      case 0xB:
        uint64_t v6 = (uint64_t)*this;
        if (*((int *)*this + 2) >= 1)
        {
          uint64_t v7 = 0LL;
          do
          {
            this = (uint64_t **)(*(uint64_t (**)(void))(**(void **)(*(void *)v6 + 8 * v7) + 32LL))(*(void *)(*(void *)v6 + 8 * v7));
            ++v7;
          }

          while (v7 < *(int *)(v6 + 8));
        }

        *(_DWORD *)(v6 + 8) = 0;
        break;
      default:
        return this;
    }
  }

  else if ((*((_BYTE *)this + 10) & 1) == 0)
  {
    int v2 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)this
                                                                                                  + 8)];
    if (v2 == 10)
    {
      uint64_t v4 = **this;
      if ((*((_BYTE *)this + 10) & 0x10) != 0) {
        uint64_t v5 = *(uint64_t (**)(void))(v4 + 88);
      }
      else {
        uint64_t v5 = *(uint64_t (**)(void))(v4 + 32);
      }
      this = (uint64_t **)v5();
    }

    else if (v2 == 9)
    {
      uint64_t v3 = (uint64_t)*this;
      if (*((char *)*this + 23) < 0)
      {
        **(_BYTE **)uint64_t v3 = 0;
        *(void *)(v3 + 8) = 0LL;
      }

      else
      {
        *(_BYTE *)uint64_t v3 = 0;
        *(_BYTE *)(v3 + 23) = 0;
      }
    }

    *((_BYTE *)v1 + 10) = *((_BYTE *)v1 + 10) & 0xF0 | 1;
  }

  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt32( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        v9 = (char **)v4;
      }
      else {
        v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((unsigned int *)v6 + 10);
    }
  }

  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32( uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::MaybeNewExtension( uint64_t **a1, int a2, uint64_t *a3, void *a4)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  int v9 = a2;
  uint64_t v6 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v9,  (uint64_t)&v9);
  *a4 = v6 + 5;
  v6[7] = a3;
  return v7 != 0LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt32( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  298);
    uint64_t v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(unsigned int *)(**((void **)v6 + 5) + 4LL * a3);
}

void sub_187C23208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt32( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  298);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(_DWORD *)(**((void **)v8 + 5) + 4LL * a3) = a4;
}

void sub_187C232E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32( uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t *a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a6;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(_DWORD *)(v15 + 4LL * v14) = a5;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt64( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((void *)v6 + 5);
    }
  }

  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64( uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  result[5] = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt64( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  299);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(void *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C2353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt64( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  299);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(void *)(**((void **)v8 + 5) + 8LL * a3) = a4;
}

void sub_187C2361C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64( uint64_t **a1, int a2, char a3, char a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a6;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(void *)(v15 + 8LL * v14) = a5;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt32( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((unsigned int *)v6 + 10);
    }
  }

  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32( uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt32( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  300);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(unsigned int *)(**((void **)v6 + 5) + 4LL * a3);
}

void sub_187C23870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt32( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  300);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(_DWORD *)(**((void **)v8 + 5) + 4LL * a3) = a4;
}

void sub_187C23950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32( uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t *a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a6;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(_DWORD *)(v15 + 4LL * v14) = a5;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt64( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((void *)v6 + 5);
    }
  }

  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64( uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  result[5] = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt64( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  301);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(void *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C23BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt64( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  301);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(void *)(**((void **)v8 + 5) + 8LL * a3) = a4;
}

void sub_187C23C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64( uint64_t **a1, int a2, char a3, char a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a6;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(void *)(v15 + 8LL * v14) = a5;
}

float wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetFloat( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, float a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = (float *)v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = (float *)v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
  }

  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat( uint64_t **a1, int a2, char a3, uint64_t *a4, float a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  float result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a4;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  *((float *)result + 10) = a5;
  return result;
}

float wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedFloat( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  302);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(float *)(**((void **)v6 + 5) + 4LL * a3);
}

void sub_187C23ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedFloat( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, float a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  302);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(float *)(**((void **)v8 + 5) + 4LL * a3) = a4;
}

void sub_187C23FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat( uint64_t **a1, int a2, char a3, char a4, uint64_t *a5, float a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a5;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(float *)(v15 + 4LL * v14) = a6;
}

double wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetDouble( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, double a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = (double *)v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = (double *)v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
  }

  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble( uint64_t **a1, int a2, char a3, uint64_t *a4, double a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  double result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a4;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  *((double *)result + 5) = a5;
  return result;
}

double wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedDouble( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  303);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(double *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C24204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedDouble( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, double a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  303);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(double *)(**((void **)v8 + 5) + 8LL * a3) = a4;
}

void sub_187C242E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble( uint64_t **a1, int a2, char a3, char a4, uint64_t *a5, double a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a5;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(double *)(v15 + 8LL * v14) = a6;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetBool( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return v6[40] != 0;
    }
  }

  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool( uint64_t **a1, int a2, char a3, char a4, uint64_t *a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  double result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  *((_BYTE *)result + 40) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedBool( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  304);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(unsigned __int8 *)(**((void **)v6 + 5) + a3);
}

void sub_187C24540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedBool( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, char a4)
{
  int v7 = (char *)this + 8;
  uint64_t v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    uint64_t v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  304);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(_BYTE *)(**((void **)v8 + 5) + a3) = a4;
}

void sub_187C24620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool( uint64_t **a1, int a2, char a3, char a4, char a5, uint64_t *a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a6;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(_BYTE *)(v15 + v14) = a5;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRawRepeatedField( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v4 = (char *)this + 8;
  uint64_t v3 = (char *)*((void *)this + 1);
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v5 = (char *)this + 8;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      BOOL v8 = (char **)v3;
    }
    else {
      BOOL v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }

  while (*v8);
  if (v5 == v4 || *((_DWORD *)v5 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  312);
    int v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    BOOL v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, "no extension numbered ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, a2);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v5 = v4;
  }

  return *((void *)v5 + 5);
}

void sub_187C247B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetEnum( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    int v6 = v3;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (char **)v4;
      }
      else {
        int v9 = (char **)(v4 + 8);
      }
      if (!v8) {
        int v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0) {
      return *((unsigned int *)v6 + 10);
    }
  }

  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum( uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  double result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }

  *((_BYTE *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedEnum( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      char v9 = (char **)v4;
    }
    else {
      char v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      int v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  346);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    int v6 = v5;
  }

  return *(unsigned int *)(**((void **)v6 + 5) + 4LL * a3);
}

void sub_187C24948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedEnum( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  int v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    int v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v16,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  353);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v16,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v15,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  *(_DWORD *)(**((void **)v8 + 5) + 4LL * a3) = a4;
}

void sub_187C24A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum( uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t *a6)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v10 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v11 = v10;
  v10[7] = a6;
  if (v12)
  {
    *((_BYTE *)v10 + 48) = a3;
    *((_BYTE *)v10 + 49) = 1;
    *((_BYTE *)v10 + 51) = a4;
    uint64_t v13 = (uint64_t *)operator new(0x10uLL);
    uint64_t *v13 = 0LL;
    v13[1] = 0LL;
    v11[5] = v13;
  }

  else
  {
    uint64_t v13 = v10[5];
  }

  int v14 = *((_DWORD *)v13 + 2);
  if (v14 == *((_DWORD *)v13 + 3))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v13, v14 + 1);
    int v14 = *((_DWORD *)v13 + 2);
  }

  uint64_t v15 = *v13;
  *((_DWORD *)v13 + 2) = v14 + 1;
  *(_DWORD *)(v15 + 4LL * v14) = a5;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetString( uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v3 = a1 + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = v3;
    do
    {
      int v7 = *(_DWORD *)(v4 + 32);
      BOOL v8 = v7 < a2;
      if (v7 >= a2) {
        int v9 = (uint64_t *)v4;
      }
      else {
        int v9 = (uint64_t *)(v4 + 8);
      }
      if (!v8) {
        uint64_t v6 = v4;
      }
      uint64_t v4 = *v9;
    }

    while (*v9);
    if (v6 != v3 && *(_DWORD *)(v6 + 32) <= a2 && (*(_BYTE *)(v6 + 50) & 1) == 0) {
      return *(void *)(v6 + 40);
    }
  }

  return a3;
}

uint64_t *wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString( uint64_t **a1, int a2, char a3, uint64_t *a4)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v10 = a2;
  uint64_t v6 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v10,  (uint64_t)&v10);
  int v7 = v6;
  v6[7] = a4;
  if (v8)
  {
    *((_BYTE *)v6 + 48) = a3;
    *((_BYTE *)v6 + 49) = 0;
    double result = (uint64_t *)operator new(0x18uLL);
    result[1] = 0LL;
    result[2] = 0LL;
    *double result = 0LL;
    v7[5] = result;
  }

  else
  {
    double result = v6[5];
  }

  *((_BYTE *)v7 + 50) &= 0xF0u;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedString( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  407);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(void *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C24C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedString( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (char **)v4;
    }
    else {
      int v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  414);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    uint64_t v6 = v5;
  }

  return *(void *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C24D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void *wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString( uint64_t **a1, int a2, char a3, int *a4)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  uint64_t v6 = (int **)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  int v7 = v6;
  v6[7] = a4;
  if (v8)
  {
    *((_BYTE *)v6 + 48) = a3;
    *((_BYTE *)v6 + 49) = 1;
    *((_BYTE *)v6 + 51) = 0;
    uint64_t v6 = (int **)operator new(0x18uLL);
    int v9 = (int *)v6;
    *uint64_t v6 = 0LL;
    v6[1] = 0LL;
    *((_DWORD *)v6 + 4) = 0;
    v7[5] = (int *)v6;
  }

  else
  {
    int v9 = v6[5];
  }

  int v10 = v9[3];
  uint64_t v11 = v9[2];
  if ((int)v11 >= v10)
  {
    if (v10 == v9[4])
    {
      wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve( (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)v9,  v10 + 1);
      int v10 = v9[3];
    }

    v9[3] = v10 + 1;
    double result = wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)v6);
    uint64_t v14 = *(void *)v9;
    uint64_t v15 = v9[2];
    v9[2] = v15 + 1;
    *(void *)(v14 + 8 * v15) = result;
  }

  else
  {
    uint64_t v12 = *(void *)v9;
    v9[2] = v11 + 1;
    return *(void **)(v12 + 8 * v11);
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetMessage( uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v3 = a1 + 8;
  uint64_t v4 = v5;
  if (!v5) {
    return a3;
  }
  uint64_t v6 = v3;
  do
  {
    int v7 = *(_DWORD *)(v4 + 32);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      int v9 = (uint64_t *)v4;
    }
    else {
      int v9 = (uint64_t *)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v3 || *(_DWORD *)(v6 + 32) > a2) {
    return a3;
  }
  if ((*(_BYTE *)(v6 + 50) & 0x10) == 0) {
    return *(void *)(v6 + 40);
  }
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(v6 + 40) + 24LL))(*(void *)(v6 + 40), a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage( uint64_t **a1, int a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  int v13 = a2;
  BOOL v8 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v13,  (uint64_t)&v13);
  int v9 = v8;
  v8[7] = a5;
  if (v10)
  {
    *((_BYTE *)v8 + 48) = a3;
    *((_BYTE *)v8 + 49) = 0;
    *((_BYTE *)v8 + 50) &= 0xFu;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24LL))(a4);
    v9[5] = (uint64_t *)result;
    *((_BYTE *)v9 + 50) &= 0xF0u;
  }

  else
  {
    char v12 = *((_BYTE *)v8 + 50);
    *((_BYTE *)v8 + 50) = v12 & 0xF0;
    uint64_t result = (uint64_t)v8[5];
    if ((v12 & 0x10) != 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 32LL))(result, a4);
    }
  }

  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetAllocatedMessage( uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  if (a5)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    int v12 = a2;
    uint64_t result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v12,  (uint64_t)&v12);
    int v9 = result;
    result[7] = a4;
    if (v10)
    {
      *((_BYTE *)result + 48) = a3;
      *((_BYTE *)result + 49) = 0;
      *((_BYTE *)result + 50) &= 0xFu;
    }

    else
    {
      char v11 = *((_BYTE *)result + 50);
      uint64_t result = (uint64_t **)result[5];
      if ((v11 & 0x10) != 0)
      {
        uint64_t result = (uint64_t **)((uint64_t (*)(uint64_t **, uint64_t *))(*result)[5])(result, a5);
        goto LABEL_5;
      }

      if (result) {
        uint64_t result = (uint64_t **)((uint64_t (*)(uint64_t **))(*result)[1])(result);
      }
    }

    v9[5] = a5;
LABEL_5:
    *((_BYTE *)v9 + 50) &= 0xF0u;
    return result;
  }

  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension( (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)a1,  a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseMessage( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  int v12 = a2;
  uint64_t v3 = (char *)*((void *)this + 1);
  if (!v3) {
    return 0LL;
  }
  uint64_t v5 = (char *)this + 8;
  do
  {
    int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      BOOL v8 = (char **)v3;
    }
    else {
      BOOL v8 = (char **)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }

  while (*v8);
  uint64_t v9 = *((void *)v5 + 5);
  if ((v5[50] & 0x10) != 0)
  {
    uint64_t v9 = (*(uint64_t (**)(void, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)v9 + 48LL))( *((void *)v5 + 5),  a3);
    uint64_t v11 = *((void *)v5 + 5);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
    }
  }

  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__erase_unique<int>( (uint64_t)this,  &v12);
  return v9;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedMessage( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      uint64_t v9 = (char **)v4;
    }
    else {
      uint64_t v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      int v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  539);
    char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    int v6 = v5;
  }

  return *(void *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C251BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedMessage( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  uint64_t v5 = (char *)this + 8;
  uint64_t v4 = (char *)*((void *)this + 1);
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = (char *)this + 8;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a2;
    if (v7 >= a2) {
      uint64_t v9 = (char **)v4;
    }
    else {
      uint64_t v9 = (char **)(v4 + 8);
    }
    if (!v8) {
      int v6 = v4;
    }
    uint64_t v4 = *v9;
  }

  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  546);
    char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v15,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    int v6 = v5;
  }

  return *(void *)(**((void **)v6 + 5) + 8LL * a3);
}

void sub_187C25290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage( uint64_t **a1, int a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  int v16 = a2;
  BOOL v8 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( a1,  &v16,  (uint64_t)&v16);
  uint64_t v9 = v8;
  v8[7] = a5;
  if (v10)
  {
    *((_BYTE *)v8 + 48) = a3;
    *((_BYTE *)v8 + 49) = 1;
    uint64_t v11 = (uint64_t *)operator new(0x18uLL);
    uint64_t *v11 = 0LL;
    v11[1] = 0LL;
    *((_DWORD *)v11 + 4) = 0;
    v9[5] = v11;
  }

  else
  {
    uint64_t v11 = v8[5];
  }

  uint64_t v12 = *((int *)v11 + 2);
  if ((int)v12 >= *((_DWORD *)v11 + 3)
    || (v13 = *v11, *((_DWORD *)v11 + 2) = v12 + 1, (uint64_t v14 = *(void *)(v13 + 8 * v12)) == 0))
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24LL))(a4);
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>( (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)v9[5],  v14);
  }

  return v14;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RemoveLast( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v3 = (char *)this + 8;
  int v2 = (char *)*((void *)this + 1);
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v4 = (char *)this + 8;
  do
  {
    int v5 = *((_DWORD *)v2 + 8);
    BOOL v6 = v5 < a2;
    if (v5 >= a2) {
      int v7 = (char **)v2;
    }
    else {
      int v7 = (char **)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    int v2 = *v7;
  }

  while (*v7);
  if (v4 == v3 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  585);
    BOOL v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v19,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v8,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9,  v10);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    uint64_t v4 = v3;
  }

  switch(v4[48])
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      --*(_DWORD *)(*((void *)v4 + 5) + 8LL);
      break;
    case 9:
    case 12:
      uint64_t v11 = (uint64_t *)*((void *)v4 + 5);
      uint64_t v12 = *v11;
      uint64_t v13 = *((int *)v11 + 2) - 1LL;
      *((_DWORD *)v11 + 2) = v13;
      uint64_t v14 = *(void *)(v12 + 8 * v13);
      if (*(char *)(v14 + 23) < 0)
      {
        **(_BYTE **)uint64_t v14 = 0;
        *(void *)(v14 + 8) = 0LL;
      }

      else
      {
        *(_BYTE *)uint64_t v14 = 0;
        *(_BYTE *)(v14 + 23) = 0;
      }

      break;
    case 10:
    case 11:
      uint64_t v15 = (uint64_t *)*((void *)v4 + 5);
      uint64_t v16 = *v15;
      uint64_t v17 = *((int *)v15 + 2) - 1LL;
      *((_DWORD *)v15 + 2) = v17;
      (*(void (**)(void))(**(void **)(v16 + 8 * v17) + 32LL))(*(void *)(v16 + 8 * v17));
      break;
    default:
      return;
  }

void sub_187C254C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseLast( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t v3 = (char *)this + 8;
  int v2 = (char *)*((void *)this + 1);
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v4 = (char *)this + 8;
  do
  {
    int v5 = *((_DWORD *)v2 + 8);
    BOOL v6 = v5 < a2;
    if (v5 >= a2) {
      int v7 = (char **)v2;
    }
    else {
      int v7 = (char **)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    int v2 = *v7;
  }

  while (*v7);
  if (v4 == v3 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v17,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  626);
    BOOL v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v17,  "CHECK failed: iter != extensions_.end(): ");
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v8,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v16,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9,  v10);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
    uint64_t v4 = v3;
  }

  uint64_t v11 = (uint64_t *)*((void *)v4 + 5);
  uint64_t v12 = *v11;
  int v13 = *((_DWORD *)v11 + 3);
  uint64_t v14 = *((int *)v11 + 2);
  *((_DWORD *)v11 + 2) = v14 - 1;
  uint64_t result = *(void *)(v12 + 8 * (v14 - 1));
  *((_DWORD *)v11 + 3) = v13 - 1;
  return result;
}

void sub_187C255C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SwapElements( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  int v7 = (char *)this + 8;
  BOOL v6 = (char *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_11;
  }
  BOOL v8 = (char *)this + 8;
  do
  {
    int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      uint64_t v11 = (char **)v6;
    }
    else {
      uint64_t v11 = (char **)(v6 + 8);
    }
    if (!v10) {
      BOOL v8 = v6;
    }
    BOOL v6 = *v11;
  }

  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v26,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  636);
    uint64_t v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v26,  "CHECK failed: iter != extensions_.end(): ");
    int v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v25,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    BOOL v8 = v7;
  }

  switch(v8[48])
  {
    case 1:
      uint64_t v19 = **((void **)v8 + 5);
      uint64_t v20 = *(void *)(v19 + 8LL * a3);
      *(void *)(v19 + 8LL * a3) = *(void *)(v19 + 8LL * a4);
      *(void *)(v19 + 8LL * a4) = v20;
      break;
    case 2:
      uint64_t v21 = **((void **)v8 + 5);
      int v22 = *(_DWORD *)(v21 + 4LL * a3);
      *(_DWORD *)(v21 + 4LL * a3) = *(_DWORD *)(v21 + 4LL * a4);
      *(_DWORD *)(v21 + 4LL * a4) = v22;
      break;
    case 3:
    case 4:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 16:
    case 18:
      uint64_t v15 = **((void **)v8 + 5);
      uint64_t v16 = *(void *)(v15 + 8LL * a3);
      *(void *)(v15 + 8LL * a3) = *(void *)(v15 + 8LL * a4);
      *(void *)(v15 + 8LL * a4) = v16;
      break;
    case 5:
    case 7:
    case 13:
    case 14:
    case 15:
    case 17:
      uint64_t v17 = **((void **)v8 + 5);
      int v18 = *(_DWORD *)(v17 + 4LL * a3);
      *(_DWORD *)(v17 + 4LL * a3) = *(_DWORD *)(v17 + 4LL * a4);
      *(_DWORD *)(v17 + 4LL * a4) = v18;
      break;
    case 8:
      uint64_t v23 = **((void **)v8 + 5);
      char v24 = *(_BYTE *)(v23 + a3);
      *(_BYTE *)(v23 + a3) = *(_BYTE *)(v23 + a4);
      *(_BYTE *)(v23 + a4) = v24;
      break;
    default:
      return;
  }

void sub_187C25750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(uint64_t **this)
{
  int v1 = this + 1;
  int v2 = *this;
  if (*this != (uint64_t *)(this + 1))
  {
    do
    {
      this = wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear((uint64_t **)v2 + 5);
      uint64_t v3 = (uint64_t *)v2[1];
      if (v3)
      {
        do
        {
          uint64_t v4 = v3;
          uint64_t v3 = (uint64_t *)*v3;
        }

        while (v3);
      }

      else
      {
        do
        {
          uint64_t v4 = (uint64_t *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          int v2 = v4;
        }

        while (!v5);
      }

      int v2 = v4;
    }

    while (v4 != (uint64_t *)v1);
  }

  return this;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom( uint64_t **this, const wireless_diagnostics::google::protobuf::internal::ExtensionSet **a2)
{
  int v2 = a2 + 1;
  uint64_t v3 = *a2;
  if (*a2 != (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + 1))
  {
    while (1)
    {
      if (*((_BYTE *)v3 + 49))
      {
        int v5 = *((_DWORD *)v3 + 8);
        BOOL v6 = (uint64_t *)*((void *)v3 + 7);
        uint64_t v63 = 0LL;
        uint64_t v64 = 0LL;
        uint64_t v65 = 0LL;
        int v62 = v5;
        int v7 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( this,  &v62,  (uint64_t)&v62);
        int v9 = v7;
        v7[7] = v6;
        if (v8)
        {
          *((_BYTE *)v7 + 48) = *((_BYTE *)v3 + 48);
          *((_BYTE *)v7 + 51) = *((_BYTE *)v3 + 51);
          *((_BYTE *)v7 + 49) = 1;
        }

        switch(*((_BYTE *)v3 + 48))
        {
          case 1:
            if (v8)
            {
              int v18 = (uint64_t *)operator new(0x10uLL);
              *int v18 = 0LL;
              v18[1] = 0LL;
              v9[5] = v18;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v15 = *(_DWORD *)(v11 + 8);
            if (v15) {
              goto LABEL_28;
            }
            break;
          case 2:
            if (v8)
            {
              uint64_t v23 = (uint64_t *)operator new(0x10uLL);
              *uint64_t v23 = 0LL;
              v23[1] = 0LL;
              v9[5] = v23;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v12 = *(_DWORD *)(v11 + 8);
            if (v12) {
              goto LABEL_32;
            }
            break;
          case 3:
          case 0x10:
          case 0x12:
            if (v8)
            {
              uint64_t v14 = (uint64_t *)operator new(0x10uLL);
              uint64_t *v14 = 0LL;
              v14[1] = 0LL;
              v9[5] = v14;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v15 = *(_DWORD *)(v11 + 8);
            if (v15) {
              goto LABEL_28;
            }
            break;
          case 4:
          case 6:
            if (v8)
            {
              uint64_t v17 = (uint64_t *)operator new(0x10uLL);
              *uint64_t v17 = 0LL;
              v17[1] = 0LL;
              v9[5] = v17;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v15 = *(_DWORD *)(v11 + 8);
            if (v15)
            {
LABEL_28:
              uint64_t v19 = (uint64_t)v9[5];
              wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v19, *(_DWORD *)(v19 + 8) + v15);
              uint64_t v20 = (void *)(*(void *)v19 + 8LL * *(int *)(v19 + 8));
              uint64_t v21 = *(const void **)v11;
              size_t v22 = 8LL * *(int *)(v11 + 8);
              goto LABEL_33;
            }

            break;
          case 5:
          case 0xE:
          case 0xF:
          case 0x11:
            if (v8)
            {
              BOOL v10 = (uint64_t *)operator new(0x10uLL);
              uint64_t *v10 = 0LL;
              v10[1] = 0LL;
              v9[5] = v10;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v12 = *(_DWORD *)(v11 + 8);
            if (v12) {
              goto LABEL_32;
            }
            break;
          case 7:
          case 0xD:
            if (v8)
            {
              uint64_t v16 = (uint64_t *)operator new(0x10uLL);
              *uint64_t v16 = 0LL;
              v16[1] = 0LL;
              v9[5] = v16;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v12 = *(_DWORD *)(v11 + 8);
            if (v12)
            {
LABEL_32:
              uint64_t v19 = (uint64_t)v9[5];
              wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v19, *(_DWORD *)(v19 + 8) + v12);
              uint64_t v20 = (void *)(*(void *)v19 + 4LL * *(int *)(v19 + 8));
              uint64_t v21 = *(const void **)v11;
              size_t v22 = 4LL * *(int *)(v11 + 8);
              goto LABEL_33;
            }

            break;
          case 8:
            if (v8)
            {
              v27 = (uint64_t *)operator new(0x10uLL);
              uint64_t *v27 = 0LL;
              v27[1] = 0LL;
              v9[5] = v27;
            }

            uint64_t v11 = *((void *)v3 + 5);
            int v28 = *(_DWORD *)(v11 + 8);
            if (v28)
            {
              uint64_t v19 = (uint64_t)v9[5];
              wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(v19, *(_DWORD *)(v19 + 8) + v28);
              uint64_t v20 = (void *)(*(void *)v19 + *(int *)(v19 + 8));
              uint64_t v21 = *(const void **)v11;
              size_t v22 = *(int *)(v11 + 8);
LABEL_33:
              memcpy(v20, v21, v22);
              *(_DWORD *)(v19 + 8) += *(_DWORD *)(v11 + 8);
            }

            break;
          case 9:
          case 0xC:
            if (v8)
            {
              v29 = (uint64_t *)operator new(0x18uLL);
              uint64_t *v29 = 0LL;
              v29[1] = 0LL;
              *((_DWORD *)v29 + 4) = 0;
              v9[5] = v29;
            }

            else
            {
              v29 = v7[5];
            }

            uint64_t v38 = *((void *)v3 + 5);
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve( (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)v29,  *(_DWORD *)(v38 + 8) + *((_DWORD *)v29 + 2));
            if (*(int *)(v38 + 8) >= 1)
            {
              uint64_t v40 = 0LL;
              do
              {
                v41 = *(const std::string **)(*(void *)v38 + 8 * v40);
                int v42 = *((_DWORD *)v29 + 3);
                uint64_t v43 = *((int *)v29 + 2);
                if ((int)v43 >= v42)
                {
                  if (v42 == *((_DWORD *)v29 + 4))
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve( (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)v29,  v42 + 1);
                    int v42 = *((_DWORD *)v29 + 3);
                  }

                  *((_DWORD *)v29 + 3) = v42 + 1;
                  v45 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)v39);
                  uint64_t v46 = *v29;
                  uint64_t v47 = *((int *)v29 + 2);
                  *((_DWORD *)v29 + 2) = v47 + 1;
                  *(void *)(v46 + 8 * v47) = v45;
                }

                else
                {
                  uint64_t v44 = *v29;
                  *((_DWORD *)v29 + 2) = v43 + 1;
                  v45 = *(std::string **)(v44 + 8 * v43);
                }

                v39 = std::string::operator=(v45, v41);
                ++v40;
              }

              while (v40 < *(int *)(v38 + 8));
            }

            break;
          case 0xA:
          case 0xB:
            if (v8)
            {
              v30 = operator new(0x18uLL);
              void *v30 = 0LL;
              v30[1] = 0LL;
              *((_DWORD *)v30 + 4) = 0;
              v9[5] = v30;
            }

            uint64_t v31 = *((void *)v3 + 5);
            if (*(int *)(v31 + 8) >= 1)
            {
              uint64_t v32 = 0LL;
              do
              {
                uint64_t v33 = *(void *)(*(void *)v31 + 8 * v32);
                v34 = v9[5];
                uint64_t v35 = *((int *)v34 + 2);
                if ((int)v35 >= *((_DWORD *)v34 + 3)
                  || (uint64_t v36 = *v34, *((_DWORD *)v34 + 2) = v35 + 1, (v37 = *(void *)(v36 + 8 * v35)) == 0))
                {
                  uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v33 + 24LL))(v33);
                  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>( (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)v9[5],  v37);
                }

                (*(void (**)(uint64_t, uint64_t))(*(void *)v37 + 56LL))(v37, v33);
                ++v32;
              }

              while (v32 < *(int *)(v31 + 8));
            }

            break;
          default:
            goto LABEL_34;
        }

        goto LABEL_34;
      }

      if ((*((_BYTE *)v3 + 50) & 1) == 0) {
        break;
      }
LABEL_34:
      char v24 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v3 + 1);
      if (v24)
      {
        do
        {
          char v25 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v24;
          char v24 = *(const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v24;
        }

        while (v24);
      }

      else
      {
        do
        {
          char v25 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v3 + 2);
          BOOL v26 = *v25 == v3;
          uint64_t v3 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v25;
        }

        while (!v26);
      }

      uint64_t v3 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v25;
      if (v25 == v2) {
        return;
      }
    }

    char v13 = *((_BYTE *)v3 + 48);
    switch(v13)
    {
      case 1:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble( this,  *((_DWORD *)v3 + 8),  v13,  *((uint64_t **)v3 + 7),  *((double *)v3 + 5));
        goto LABEL_34;
      case 2:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat( this,  *((_DWORD *)v3 + 8),  v13,  *((uint64_t **)v3 + 7),  *((float *)v3 + 10));
        goto LABEL_34;
      case 3:
      case 16:
      case 18:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64( this,  *((_DWORD *)v3 + 8),  v13,  *((uint64_t **)v3 + 5),  *((uint64_t **)v3 + 7));
        goto LABEL_34;
      case 4:
      case 6:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64( this,  *((_DWORD *)v3 + 8),  v13,  *((uint64_t **)v3 + 5),  *((uint64_t **)v3 + 7));
        goto LABEL_34;
      case 5:
      case 15:
      case 17:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32( this,  *((_DWORD *)v3 + 8),  v13,  *((_DWORD *)v3 + 10),  *((uint64_t **)v3 + 7));
        goto LABEL_34;
      case 7:
      case 13:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32( this,  *((_DWORD *)v3 + 8),  v13,  *((_DWORD *)v3 + 10),  *((uint64_t **)v3 + 7));
        goto LABEL_34;
      case 8:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool( this,  *((_DWORD *)v3 + 8),  v13,  *((_BYTE *)v3 + 40),  *((uint64_t **)v3 + 7));
        goto LABEL_34;
      case 9:
      case 12:
        v48 = (const std::string *)*((void *)v3 + 5);
        v49 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString( this,  *((_DWORD *)v3 + 8),  v13,  *((uint64_t **)v3 + 7));
        std::string::operator=(v49, v48);
        goto LABEL_34;
      case 10:
      case 11:
        int v50 = *((_DWORD *)v3 + 8);
        v51 = (uint64_t *)*((void *)v3 + 7);
        uint64_t v63 = 0LL;
        uint64_t v64 = 0LL;
        uint64_t v65 = 0LL;
        int v62 = v50;
        v52 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( this,  &v62,  (uint64_t)&v62);
        v53 = v52;
        v52[7] = v51;
        if (v54)
        {
          *((_BYTE *)v52 + 48) = *((_BYTE *)v3 + 48);
          *((_BYTE *)v52 + 51) = *((_BYTE *)v3 + 51);
          *((_BYTE *)v52 + 49) = 0;
          char v55 = *((_BYTE *)v52 + 50) & 0xF;
          if ((*((_BYTE *)v3 + 50) & 0x10) == 0)
          {
            *((_BYTE *)v52 + 50) = v55;
            uint64_t v56 = (*(uint64_t (**)(void))(**((void **)v3 + 5) + 24LL))(*((void *)v3 + 5));
            v53[5] = (uint64_t *)v56;
LABEL_84:
            (*(void (**)(uint64_t, void))(*(void *)v56 + 56LL))(v56, *((void *)v3 + 5));
            goto LABEL_86;
          }

          *((_BYTE *)v52 + 50) = v55 | 0x10;
          uint64_t v60 = (*(uint64_t (**)(void))(**((void **)v3 + 5) + 16LL))(*((void *)v3 + 5));
          v53[5] = (uint64_t *)v60;
          (*(void (**)(uint64_t, void))(*(void *)v60 + 80LL))(v60, *((void *)v3 + 5));
        }

        else
        {
          v57 = v52[5];
          uint64_t v58 = *((void *)v3 + 5);
          if ((*((_BYTE *)v3 + 50) & 0x10) != 0)
          {
            if ((*((_BYTE *)v52 + 50) & 0x10) != 0)
            {
              (*(void (**)(uint64_t *, uint64_t))(*v57 + 80))(v57, v58);
            }

            else
            {
              uint64_t v61 = (*(uint64_t (**)(void, uint64_t *))(*(void *)v58 + 24LL))(*((void *)v3 + 5), v52[5]);
              (*(void (**)(uint64_t *, uint64_t))(*v57 + 56))(v57, v61);
            }

            goto LABEL_86;
          }

          uint64_t v59 = *v57;
          if ((*((_BYTE *)v52 + 50) & 0x10) != 0)
          {
            uint64_t v56 = (*(uint64_t (**)(uint64_t *, uint64_t))(v59 + 32))(v52[5], v58);
            goto LABEL_84;
          }

          (*(void (**)(uint64_t *, uint64_t))(v59 + 56))(v57, v58);
        }

LABEL_86:
        *((_BYTE *)v53 + 50) &= 0xF0u;
        goto LABEL_34;
      case 14:
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum( this,  *((_DWORD *)v3 + 8),  v13,  *((_DWORD *)v3 + 10),  *((uint64_t **)v3 + 7));
        goto LABEL_34;
      default:
        goto LABEL_34;
    }
  }

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::IsInitialized( wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  int v1 = this + 1;
  int v2 = *this;
  while (1)
  {
    if (wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)v2
                                                                                                  + 48)] != 10)
      goto LABEL_14;
    if (*((_BYTE *)v2 + 49)) {
      break;
    }
    if ((*((_BYTE *)v2 + 50) & 1) == 0)
    {
      uint64_t v5 = **((void **)v2 + 5);
      if ((*((_BYTE *)v2 + 50) & 0x10) != 0)
      {
      }

      else
      {
        uint64_t result = (*(uint64_t (**)(void))(v5 + 40))();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

LABEL_14:
    int v7 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v2 + 1);
    if (v7)
    {
      do
      {
        char v8 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v7;
        int v7 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v7;
      }

      while (v7);
    }

    else
    {
      do
      {
        char v8 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v2 + 2);
        BOOL v9 = *v8 == v2;
        int v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v8;
      }

      while (!v9);
    }

    int v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v8;
    if (v8 == v1) {
      return 1LL;
    }
  }

  uint64_t v3 = *((void *)v2 + 5);
  uint64_t v4 = 0LL;
  while (((*(uint64_t (**)(void))(**(void **)(*(void *)v3 + 8 * v4) + 40LL))(*(void *)(*(void *)v3 + 8 * v4)) & 1) != 0)
  {
    ++v4;
    uint64_t v3 = *((void *)v2 + 5);
  }

  return 0LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::FindExtensionInfoFromTag( uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4, unsigned __int8 *a5)
{
  char v6 = a2;
  *a4 = a2 >> 3;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a3 + 16LL))(a3))
  {
    int v7 = v6 & 7;
    if (a5[2]) {
      BOOL v8 = v7 == 2;
    }
    else {
      BOOL v8 = v7 == wireless_diagnostics::google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[*a5];
    }
    int v9 = !v8;
  }

  else
  {
    int v9 = 1;
  }

  return v9 ^ 1u;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField( uint64_t **this, uint64_t a2, char **a3, wireless_diagnostics::google::protobuf::internal::ExtensionFinder *a4, wireless_diagnostics::google::protobuf::internal::FieldSkipper *a5)
{
  uint64_t v9 = a2 >> 3;
  if ((*(unsigned int (**)(wireless_diagnostics::google::protobuf::internal::ExtensionFinder *, uint64_t, _BYTE *))(*(void *)a4 + 16LL))( a4,  v9,  v12))
  {
    int v10 = a2 & 7;
    if (v12[2])
    {
      if (v10 == 2) {
        return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo( this,  v9,  (uint64_t)v12,  a3,  (uint64_t)a5);
      }
    }

    else if (v10 == wireless_diagnostics::google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[v12[0]])
    {
      return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo( this,  v9,  (uint64_t)v12,  a3,  (uint64_t)a5);
    }
  }

  return (*(uint64_t (**)(wireless_diagnostics::google::protobuf::internal::FieldSkipper *, char **, uint64_t))(*(void *)a5 + 16LL))( a5,  a3,  a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo( uint64_t **a1, uint64_t a2, uint64_t a3, char **this, uint64_t a5)
{
  if (!*(_BYTE *)(a3 + 2))
  {
    switch(*(_BYTE *)a3)
    {
      case 1:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        if (*(_BYTE *)(a3 + 1)) {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble( a1,  a2,  1,  0,  *(uint64_t **)(a3 + 24),  *(double *)&v65[0].__r_.__value_.__l.__data_);
        }
        else {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble( a1,  a2,  1,  *(uint64_t **)(a3 + 24),  *(double *)&v65[0].__r_.__value_.__l.__data_);
        }
        return 1LL;
      case 2:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        if (*(_BYTE *)(a3 + 1)) {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat( a1,  a2,  2,  0,  *(uint64_t **)(a3 + 24),  *(float *)&v65[0].__r_.__value_.__l.__data_);
        }
        else {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat( a1,  a2,  2,  *(uint64_t **)(a3 + 24),  *(float *)&v65[0].__r_.__value_.__l.__data_);
        }
        return 1LL;
      case 3:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v31 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        uint64_t v32 = *(uint64_t **)(a3 + 24);
        uint64_t v33 = a1;
        int v34 = a2;
        char v35 = 3;
        if (!*(_BYTE *)(a3 + 1)) {
          goto LABEL_110;
        }
        goto LABEL_152;
      case 4:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v36 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        uint64_t v37 = *(uint64_t **)(a3 + 24);
        uint64_t v38 = a1;
        int v39 = a2;
        char v40 = 4;
        if (!*(_BYTE *)(a3 + 1)) {
          goto LABEL_113;
        }
        goto LABEL_119;
      case 5:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        int data = (int)v65[0].__r_.__value_.__l.__data_;
        int v42 = *(uint64_t **)(a3 + 24);
        uint64_t v43 = a1;
        int v44 = a2;
        char v45 = 5;
        if (!*(_BYTE *)(a3 + 1)) {
          goto LABEL_116;
        }
        goto LABEL_149;
      case 6:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v36 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        uint64_t v37 = *(uint64_t **)(a3 + 24);
        uint64_t v38 = a1;
        int v39 = a2;
        char v40 = 6;
        if (*(_BYTE *)(a3 + 1)) {
LABEL_119:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(v38, v39, v40, 0, (uint64_t)v36, v37);
        else {
LABEL_113:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(v38, v39, v40, v36, v37);
        return 1LL;
      case 7:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        int v46 = (int)v65[0].__r_.__value_.__l.__data_;
        uint64_t v47 = *(uint64_t **)(a3 + 24);
        v48 = a1;
        int v49 = a2;
        char v50 = 7;
        if (*(_BYTE *)(a3 + 1)) {
          goto LABEL_122;
        }
        goto LABEL_136;
      case 8:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        if (*(_BYTE *)(a3 + 1)) {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool( a1,  a2,  8,  0,  LODWORD(v65[0].__r_.__value_.__l.__data_) != 0,  *(uint64_t **)(a3 + 24));
        }
        else {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool( a1,  a2,  8,  LODWORD(v65[0].__r_.__value_.__l.__data_) != 0,  *(uint64_t **)(a3 + 24));
        }
        return 1LL;
      case 9:
        v51 = *(int **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1)) {
          v52 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(a1, a2, 9, v51);
        }
        else {
          v52 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString( a1,  a2,  9,  (uint64_t *)v51);
        }
        return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  v52);
      case 0xA:
        uint64_t v53 = *(void *)(a3 + 8);
        char v54 = *(uint64_t **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1)) {
          uint64_t v55 = wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(a1, a2, 10, v53, v54);
        }
        else {
          uint64_t v55 = wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(a1, a2, 10, v53, v54);
        }
        return (wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadGroup(a2, this, v55) & 1) != 0;
      case 0xB:
        uint64_t v56 = *(void *)(a3 + 8);
        v57 = *(uint64_t **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1)) {
          uint64_t v58 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage( a1,  a2,  11,  v56,  v57);
        }
        else {
          uint64_t v58 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage( a1,  a2,  11,  v56,  v57);
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadMessage( (wireless_diagnostics::google::protobuf::internal::WireFormatLite *)this,  v58,  v59);
        if ((_DWORD)result) {
          return 1LL;
        }
        return result;
      case 0xC:
        uint64_t v60 = *(int **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1)) {
          uint64_t v61 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString( a1,  a2,  12,  v60);
        }
        else {
          uint64_t v61 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString( a1,  a2,  12,  (uint64_t *)v60);
        }
        return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  v61);
      case 0xD:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        int v46 = (int)v65[0].__r_.__value_.__l.__data_;
        uint64_t v47 = *(uint64_t **)(a3 + 24);
        v48 = a1;
        int v49 = a2;
        char v50 = 13;
        if (*(_BYTE *)(a3 + 1)) {
LABEL_122:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(v48, v49, v50, 0, v46, v47);
        else {
LABEL_136:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(v48, v49, v50, v46, v47);
        return 1LL;
      case 0xE:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t data_low = LODWORD(v65[0].__r_.__value_.__l.__data_);
        if (((*(uint64_t (**)(void, void))(a3 + 8))( *(void *)(a3 + 16),  LODWORD(v65[0].__r_.__value_.__l.__data_)) & 1) != 0)
        {
          if (*(_BYTE *)(a3 + 1)) {
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum( a1,  a2,  14,  0,  data_low,  *(uint64_t **)(a3 + 24));
          }
          else {
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum( a1,  a2,  14,  data_low,  *(uint64_t **)(a3 + 24));
          }
        }

        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a5 + 32LL))(a5, a2, data_low);
        }

        return 1LL;
      case 0xF:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        int data = (int)v65[0].__r_.__value_.__l.__data_;
        int v42 = *(uint64_t **)(a3 + 24);
        uint64_t v43 = a1;
        int v44 = a2;
        char v45 = 15;
        if (!*(_BYTE *)(a3 + 1)) {
          goto LABEL_116;
        }
        goto LABEL_149;
      case 0x10:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v31 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        uint64_t v32 = *(uint64_t **)(a3 + 24);
        uint64_t v33 = a1;
        int v34 = a2;
        char v35 = 16;
        if (!*(_BYTE *)(a3 + 1)) {
          goto LABEL_110;
        }
        goto LABEL_152;
      case 0x11:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        int data = -(v65[0].__r_.__value_.__s.__data_[0] & 1) ^ (LODWORD(v65[0].__r_.__value_.__l.__data_) >> 1);
        int v42 = *(uint64_t **)(a3 + 24);
        uint64_t v43 = a1;
        int v44 = a2;
        char v45 = 17;
        if (*(_BYTE *)(a3 + 1)) {
LABEL_149:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(v43, v44, v45, 0, data, v42);
        else {
LABEL_116:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(v43, v44, v45, data, v42);
        break;
      case 0x12:
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v31 = (uint64_t *)(-(uint64_t)(v65[0].__r_.__value_.__s.__data_[0] & 1) ^ (v65[0].__r_.__value_.__r.__words[0] >> 1));
        uint64_t v32 = *(uint64_t **)(a3 + 24);
        uint64_t v33 = a1;
        int v34 = a2;
        char v35 = 18;
        if (*(_BYTE *)(a3 + 1)) {
LABEL_152:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(v33, v34, v35, 0, (uint64_t)v31, v32);
        else {
LABEL_110:
        }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(v33, v34, v35, v31, v32);
        break;
      default:
        return 1LL;
    }

    return 1LL;
  }

  uint64_t v9 = this[1];
  if (v9 < this[2] && (*v9 & 0x80000000) == 0)
  {
    unsigned int v10 = *v9;
    unsigned int v66 = v10;
    this[1] = v9 + 1;
LABEL_11:
    int v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  v10);
    switch(*(_BYTE *)a3)
    {
      case 1:
        do
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65)) {
            return 0LL;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble( a1,  a2,  1,  1,  *(uint64_t **)(a3 + 24),  *(double *)&v65[0].__r_.__value_.__l.__data_);
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 2:
        while (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65))
        {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat( a1,  a2,  2,  1,  *(uint64_t **)(a3 + 24),  *(float *)&v65[0].__r_.__value_.__l.__data_);
        }

        return 0LL;
      case 3:
        do
        {
          uint64_t v21 = this[1];
          if (v21 >= this[2] || *v21 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65)) {
              return 0LL;
            }
            uint64_t v22 = v65[0].__r_.__value_.__r.__words[0];
          }

          else
          {
            uint64_t v22 = *v21;
            this[1] = v21 + 1;
          }

          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64( a1,  a2,  3,  1,  v22,  *(uint64_t **)(a3 + 24));
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 4:
        do
        {
          uint64_t v23 = this[1];
          if (v23 >= this[2] || *v23 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65)) {
              return 0LL;
            }
            uint64_t v24 = v65[0].__r_.__value_.__r.__words[0];
          }

          else
          {
            uint64_t v24 = *v23;
            v65[0].__r_.__value_.__r.__words[0] = v24;
            this[1] = v23 + 1;
          }

          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64( a1,  a2,  4,  1,  v24,  *(uint64_t **)(a3 + 24));
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 5:
        do
        {
          int v15 = this[1];
          if (v15 >= this[2] || *v15 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65)) {
              return 0LL;
            }
            int v16 = (int)v65[0].__r_.__value_.__l.__data_;
          }

          else
          {
            int v16 = *v15;
            this[1] = v15 + 1;
          }

          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32( a1,  a2,  5,  1,  v16,  *(uint64_t **)(a3 + 24));
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 6:
        while (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65))
        {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64( a1,  a2,  6,  1,  (uint64_t)v65[0].__r_.__value_.__l.__data_,  *(uint64_t **)(a3 + 24));
        }

        return 0LL;
      case 7:
        while (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65))
        {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32( a1,  a2,  7,  1,  (int)v65[0].__r_.__value_.__l.__data_,  *(uint64_t **)(a3 + 24));
        }

        return 0LL;
      case 8:
        do
        {
          char v25 = this[1];
          if (v25 >= this[2] || *v25 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65)) {
              return 0LL;
            }
            int v26 = (int)v65[0].__r_.__value_.__l.__data_;
          }

          else
          {
            int v26 = *v25;
            this[1] = v25 + 1;
          }

          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool( a1,  a2,  8,  1,  v26 != 0,  *(uint64_t **)(a3 + 24));
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v65,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  943);
        char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v65,  "Non-primitive types can't be packed.");
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v64,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v65[0].__r_.__value_.__l.__data_);
        goto LABEL_13;
      case 0xD:
        do
        {
          uint64_t v17 = this[1];
          if (v17 >= this[2] || *v17 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65)) {
              return 0LL;
            }
            int v18 = (int)v65[0].__r_.__value_.__l.__data_;
          }

          else
          {
            int v18 = *v17;
            LODWORD(v65[0].__r_.__value_.__l.__data_) = v18;
            this[1] = v17 + 1;
          }

          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32( a1,  a2,  13,  1,  v18,  *(uint64_t **)(a3 + 24));
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0xE:
        do
        {
          v27 = this[1];
          if (v27 >= this[2] || *v27 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65)) {
              return 0LL;
            }
            uint64_t v28 = LODWORD(v65[0].__r_.__value_.__l.__data_);
          }

          else
          {
            uint64_t v28 = *v27;
            this[1] = v27 + 1;
          }

          if ((*(unsigned int (**)(void, uint64_t))(a3 + 8))(*(void *)(a3 + 16), v28)) {
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum( a1,  a2,  14,  1,  v28,  *(uint64_t **)(a3 + 24));
          }
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0xF:
        while (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65))
        {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32( a1,  a2,  15,  1,  (int)v65[0].__r_.__value_.__l.__data_,  *(uint64_t **)(a3 + 24));
        }

        return 0LL;
      case 0x10:
        while (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65))
        {
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64( a1,  a2,  16,  1,  (uint64_t)v65[0].__r_.__value_.__l.__data_,  *(uint64_t **)(a3 + 24));
        }

        return 0LL;
      case 0x11:
        do
        {
          uint64_t v19 = this[1];
          if (v19 >= this[2] || *v19 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unsigned int *)v65)) {
              return 0LL;
            }
            unsigned int v20 = v65[0].__r_.__value_.__l.__data_;
          }

          else
          {
            unsigned int v20 = *v19;
            this[1] = v19 + 1;
          }

          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32( a1,  a2,  17,  1,  -(v20 & 1) ^ (v20 >> 1),  *(uint64_t **)(a3 + 24));
        }

        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0x12:
        break;
      default:
        goto LABEL_13;
    }

    do
    {
      v29 = this[1];
      if (v29 >= this[2] || *v29 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  (unint64_t *)v65)) {
          return 0LL;
        }
        std::string::size_type v30 = v65[0].__r_.__value_.__r.__words[0];
      }

      else
      {
        std::string::size_type v30 = *v29;
        this[1] = v29 + 1;
      }

      wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64( a1,  a2,  18,  1,  -(uint64_t)(v30 & 1) ^ (v30 >> 1),  *(uint64_t **)(a3 + 24));
    }

    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
LABEL_13:
    wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v12);
    return 1LL;
  }

  if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this,  &v66))
  {
    unsigned int v10 = v66;
    goto LABEL_11;
  }

  return 0LL;
}

void sub_187C26C40(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  int v2 = (unsigned __int8 *)*((void *)this + 1);
  *a2 = *v2;
  *((void *)this + 1) = v2 + 1;
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadGroup( int a1, _DWORD *a2, uint64_t a3)
{
  int v3 = a2[14];
  int v4 = a2[15];
  a2[14] = v3 + 1;
  if (v3 >= v4) {
    return 0LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 64LL))(a3);
  if ((_DWORD)result)
  {
    int v8 = a2[14];
    BOOL v9 = __OFSUB__(v8, 1);
    int v10 = v8 - 1;
    if (v10 < 0 == v9) {
      a2[14] = v10;
    }
    return a2[8] == ((8 * a1) | 4);
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadMessage( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  uint64_t v5 = (char *)*((void *)this + 1);
  if ((unint64_t)v5 >= *((void *)this + 2) || *v5 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v13);
    if (!(_DWORD)result) {
      return result;
    }
  }

  else
  {
    unsigned int v13 = *v5;
    *((void *)this + 1) = v5 + 1;
  }

  int v7 = *((_DWORD *)this + 14);
  int v8 = *((_DWORD *)this + 15);
  *((_DWORD *)this + 14) = v7 + 1;
  if (v7 >= v8) {
    return 0LL;
  }
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, v13);
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::io::CodedInputStream *, wireless_diagnostics::google::protobuf::internal::WireFormatLite *))(*(void *)a2 + 64LL))( a2,  this);
  if (!(_DWORD)result) {
    return result;
  }
  if (!*((_BYTE *)this + 36)) {
    return 0LL;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v9);
  int v10 = *((_DWORD *)this + 14);
  BOOL v11 = __OFSUB__(v10, 1);
  int v12 = v10 - 1;
  if (v12 < 0 == v11) {
    *((_DWORD *)this + 14) = v12;
  }
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField( uint64_t **this, uint64_t a2, char **a3, const wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  char v6 = &unk_18A11A618;
  v5[0] = off_18A119F78;
  v5[1] = a4;
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField( this,  a2,  a3,  (wireless_diagnostics::google::protobuf::internal::ExtensionFinder *)v5,  (wireless_diagnostics::google::protobuf::internal::FieldSkipper *)&v6);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes( wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = (char *)this + 8;
  int v4 = (char *)*((void *)this + 1);
  if (v4)
  {
    int v8 = (char *)this + 8;
    do
    {
      int v9 = *((_DWORD *)v4 + 8);
      BOOL v10 = v9 < a2;
      if (v9 >= a2) {
        BOOL v11 = (char **)v4;
      }
      else {
        BOOL v11 = (char **)(v4 + 8);
      }
      if (!v10) {
        int v8 = v4;
      }
      int v4 = *v11;
    }

    while (*v11);
    if (v8 != v5)
    {
      do
      {
        int v12 = (wireless_diagnostics::google::protobuf::internal::WireFormatLite *)*((unsigned int *)v8 + 8);
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::SerializeFieldWithCachedSizes( (wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *)(v8 + 40),  v12,  a4,  a4);
        unsigned int v13 = (char *)*((void *)v8 + 1);
        if (v13)
        {
          do
          {
            uint64_t v14 = v13;
            unsigned int v13 = *(char **)v13;
          }

          while (v13);
        }

        else
        {
          do
          {
            uint64_t v14 = (char *)*((void *)v8 + 2);
            BOOL v15 = *(void *)v14 == (void)v8;
            int v8 = v14;
          }

          while (!v15);
        }

        int v8 = v14;
      }

      while (v14 != v5);
    }
  }

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::SerializeFieldWithCachedSizes( wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this, wireless_diagnostics::google::protobuf::internal::WireFormatLite *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*((_BYTE *)this + 9))
  {
    if (*((_BYTE *)this + 11))
    {
      if (*((_DWORD *)this + 3))
      {
        wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)a2) | 2);
        wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *((_DWORD *)this + 3));
        switch(*((_BYTE *)this + 8))
        {
          case 1:
            unsigned int v20 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v21 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64( (uint64_t)a3,  *(void *)(*v20 + 8 * v21++));
                unsigned int v20 = *(void **)this;
              }

              while (v21 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 2:
            uint64_t v22 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v23 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32( (uint64_t)a3,  *(_DWORD *)(*v22 + 4 * v23++));
                uint64_t v22 = *(void **)this;
              }

              while (v23 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 3:
            uint64_t v24 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v25 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64( (uint64_t)a3,  *(void *)(*v24 + 8 * v25++));
                uint64_t v24 = *(void **)this;
              }

              while (v25 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 4:
            int v26 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v27 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64( (uint64_t)a3,  *(void *)(*v26 + 8 * v27++));
                int v26 = *(void **)this;
              }

              while (v27 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 5:
            BOOL v11 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v12 = 0LL;
              do
              {
                unint64_t v13 = *(int *)(*v11 + 4 * v12);
                if ((v13 & 0x80000000) != 0) {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, v13);
                }
                else {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v13);
                }
                ++v12;
                BOOL v11 = *(void **)this;
              }

              while (v12 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 6:
            uint64_t v28 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v29 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64( (uint64_t)a3,  *(void *)(*v28 + 8 * v29++));
                uint64_t v28 = *(void **)this;
              }

              while (v29 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 7:
            std::string::size_type v30 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v31 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32( (uint64_t)a3,  *(_DWORD *)(*v30 + 4 * v31++));
                std::string::size_type v30 = *(void **)this;
              }

              while (v31 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 8:
            uint64_t v32 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v33 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32( (uint64_t)a3,  *(unsigned __int8 *)(*v32 + v33++));
                uint64_t v32 = *(void **)this;
              }

              while (v33 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
            wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v77,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  1182);
            int v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v77,  "Non-primitive types can't be packed.");
            wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v76,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7,  v8);
            wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v77[0].__r_.__value_.__l.__data_);
            break;
          case 0xD:
            uint64_t v14 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v15 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32( (uint64_t)a3,  *(_DWORD *)(*v14 + 4 * v15++));
                uint64_t v14 = *(void **)this;
              }

              while (v15 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 0xE:
            int v34 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v35 = 0LL;
              do
              {
                unint64_t v36 = *(int *)(*v34 + 4 * v35);
                if ((v36 & 0x80000000) != 0) {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, v36);
                }
                else {
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v36);
                }
                ++v35;
                int v34 = *(void **)this;
              }

              while (v35 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 0xF:
            int v16 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v17 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32( (uint64_t)a3,  *(_DWORD *)(*v16 + 4 * v17++));
                int v16 = *(void **)this;
              }

              while (v17 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 0x10:
            uint64_t v37 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v38 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64( (uint64_t)a3,  *(void *)(*v37 + 8 * v38++));
                uint64_t v37 = *(void **)this;
              }

              while (v38 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 0x11:
            int v18 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v19 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32( (uint64_t)a3,  (2 * *(_DWORD *)(*v18 + 4 * v19)) ^ (*(int *)(*v18 + 4 * v19) >> 31));
                ++v19;
                int v18 = *(void **)this;
              }

              while (v19 < *(int *)(*(void *)this + 8LL));
            }

            break;
          case 0x12:
            int v39 = *(void **)this;
            if (*(int *)(*(void *)this + 8LL) >= 1)
            {
              uint64_t v40 = 0LL;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64( (uint64_t)a3,  (2LL * *(void *)(*v39 + 8 * v40)) ^ (*(uint64_t *)(*v39 + 8 * v40) >> 63));
                ++v40;
                int v39 = *(void **)this;
              }

              while (v40 < *(int *)(*(void *)this + 8LL));
            }

            break;
          default:
            return;
        }
      }
    }

    else
    {
      switch(*((_BYTE *)this + 8))
      {
        case 1:
          int v9 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v10 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble( a2,  a3,  *(double *)(*v9 + 8 * v10++),  a3);
              int v9 = *(void **)this;
            }

            while (v10 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 2:
          v41 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v42 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat( a2,  a3,  *(float *)(*v41 + 4 * v42++),  a3);
              v41 = *(void **)this;
            }

            while (v42 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 3:
          uint64_t v43 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v44 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64( a2,  *(void *)(*v43 + 8 * v44++),  a3,  a4);
              uint64_t v43 = *(void **)this;
            }

            while (v44 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 4:
          char v45 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v46 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64( a2,  *(void *)(*v45 + 8 * v46++),  a3,  a4);
              char v45 = *(void **)this;
            }

            while (v46 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 5:
          uint64_t v47 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v48 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32( a2,  *(_DWORD *)(*v47 + 4 * v48++),  a3,  a4);
              uint64_t v47 = *(void **)this;
            }

            while (v48 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 6:
          int v49 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v50 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64( a2,  *(void *)(*v49 + 8 * v50++),  a3,  a4);
              int v49 = *(void **)this;
            }

            while (v50 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 7:
          v51 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v52 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32( a2,  *(_DWORD *)(*v51 + 4 * v52++),  a3,  a4);
              v51 = *(void **)this;
            }

            while (v52 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 8:
          uint64_t v53 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v54 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool( a2,  *(unsigned __int8 *)(*v53 + v54++),  a3,  a4);
              uint64_t v53 = *(void **)this;
            }

            while (v54 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 9:
          uint64_t v55 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v56 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString( (int)a2,  *(void *)(*v55 + 8 * v56++),  a3);
              uint64_t v55 = *(void **)this;
            }

            while (v56 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0xA:
          v57 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v58 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup( a2,  *(void *)(*v57 + 8 * v58++),  a3,  a4);
              v57 = *(void **)this;
            }

            while (v58 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0xB:
          uint64_t v59 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v60 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage( a2,  *(void *)(*v59 + 8 * v60++),  a3,  a4);
              uint64_t v59 = *(void **)this;
            }

            while (v60 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0xC:
          uint64_t v61 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v62 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes( (int)a2,  *(void *)(*v61 + 8 * v62++),  a3);
              uint64_t v61 = *(void **)this;
            }

            while (v62 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0xD:
          uint64_t v63 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v64 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32( a2,  *(_DWORD *)(*v63 + 4 * v64++),  a3,  a4);
              uint64_t v63 = *(void **)this;
            }

            while (v64 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0xE:
          uint64_t v65 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v66 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum( a2,  *(_DWORD *)(*v65 + 4 * v66++),  a3,  a4);
              uint64_t v65 = *(void **)this;
            }

            while (v66 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0xF:
          v67 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v68 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32( a2,  *(_DWORD *)(*v67 + 4 * v68++),  a3,  a4);
              v67 = *(void **)this;
            }

            while (v68 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0x10:
          v69 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v70 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64( a2,  *(void *)(*v69 + 8 * v70++),  a3,  a4);
              v69 = *(void **)this;
            }

            while (v70 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0x11:
          v71 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v72 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32( a2,  *(_DWORD *)(*v71 + 4 * v72++),  a3,  a4);
              v71 = *(void **)this;
            }

            while (v72 < *(int *)(*(void *)this + 8LL));
          }

          break;
        case 0x12:
          v73 = *(void **)this;
          if (*(int *)(*(void *)this + 8LL) >= 1)
          {
            uint64_t v74 = 0LL;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64( a2,  *(void *)(*v73 + 8 * v74++),  a3,  a4);
              v73 = *(void **)this;
            }

            while (v74 < *(int *)(*(void *)this + 8LL));
          }

          break;
        default:
          return;
      }
    }
  }

  else if ((*((_BYTE *)this + 10) & 1) == 0)
  {
    switch(*((_BYTE *)this + 8))
    {
      case 1:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(a2, a3, *(double *)this, a3);
        break;
      case 2:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(a2, a3, *(float *)this, a3);
        break;
      case 3:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(a2, *(void *)this, a3, a4);
        break;
      case 4:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(a2, *(void *)this, a3, a4);
        break;
      case 5:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 6:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(a2, *(void *)this, a3, a4);
        break;
      case 7:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 8:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool( a2,  *(unsigned __int8 *)this,  a3,  a4);
        break;
      case 9:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString((int)a2, *(void *)this, a3);
        break;
      case 0xA:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(a2, *(void *)this, a3, a4);
        break;
      case 0xB:
        uint64_t v75 = *(void *)this;
        if ((*((_BYTE *)this + 10) & 0x10) != 0) {
          (*(void (**)(void, wireless_diagnostics::google::protobuf::internal::WireFormatLite *, wireless_diagnostics::google::protobuf::io::CodedOutputStream *))(*(void *)v75 + 104LL))( *(void *)this,  a2,  a3);
        }
        else {
          wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(a2, v75, a3, a4);
        }
        break;
      case 0xC:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes((int)a2, *(void *)this, a3);
        break;
      case 0xD:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0xE:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0xF:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0x10:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(a2, *(void *)this, a3, a4);
        break;
      case 0x11:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0x12:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(a2, *(void *)this, a3, a4);
        break;
      default:
        return;
    }
  }

void sub_187C27A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize( wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  int v1 = this + 1;
  int v2 = *this;
  LODWORD(v3) = 0;
  do
  {
    int v4 = wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::ByteSize( (uint64_t **)v2 + 5,  *((_DWORD *)v2 + 8));
    uint64_t v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((void *)v2 + 1);
    if (v5)
    {
      do
      {
        char v6 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v5;
        uint64_t v5 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v5;
      }

      while (v5);
    }

    else
    {
      do
      {
        char v6 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((void *)v2 + 2);
        BOOL v7 = *v6 == v2;
        int v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v6;
      }

      while (!v7);
    }

    uint64_t v3 = (v4 + v3);
    int v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v6;
  }

  while (v6 != v1);
  return v3;
}

unint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::ByteSize( uint64_t **this, int a2)
{
  if (*((_BYTE *)this + 9))
  {
    int v4 = *((unsigned __int8 *)this + 8);
    if (*((_BYTE *)this + 11))
    {
      switch(*((_BYTE *)this + 8))
      {
        case 1:
        case 6:
        case 0x10:
          unint64_t v7 = (8 * *((_DWORD *)*this + 2));
          goto LABEL_67;
        case 2:
        case 7:
        case 0xF:
          unint64_t v7 = (4 * *((_DWORD *)*this + 2));
          goto LABEL_67;
        case 3:
          uint64_t v23 = *this;
          uint64_t v24 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            uint64_t v23 = *this;
          }

          while (v24 < *((int *)*this + 2));
          goto LABEL_67;
        case 4:
          uint64_t v25 = *this;
          uint64_t v26 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            uint64_t v25 = *this;
          }

          while (v26 < *((int *)*this + 2));
          goto LABEL_67;
        case 5:
          uint64_t v27 = *this;
          uint64_t v28 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            uint64_t v29 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v27 + 4 * v28);
            if ((v29 & 0x80000000) != 0)
            {
              int v30 = 10;
            }

            else if (v29 >= 0x80)
            {
              int v30 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v29);
              uint64_t v27 = *this;
            }

            else
            {
              int v30 = 1;
            }

            unint64_t v7 = (v30 + v7);
            ++v28;
          }

          while (v28 < *((int *)v27 + 2));
          goto LABEL_67;
        case 8:
          unint64_t v7 = *((unsigned int *)*this + 2);
          goto LABEL_67;
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
          wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v107,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc",  1294);
          uint64_t v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v107,  "Non-primitive types can't be packed.");
          wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v106,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5,  v6);
          wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v107[0].__r_.__value_.__l.__data_);
          goto LABEL_5;
        case 0xD:
          uint64_t v15 = *this;
          uint64_t v16 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            uint64_t v17 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v15 + 4 * v16);
            if (v17 >= 0x80)
            {
              int v18 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v17);
              uint64_t v15 = *this;
            }

            else
            {
              int v18 = 1;
            }

            unint64_t v7 = (v18 + v7);
            ++v16;
          }

          while (v16 < *((int *)v15 + 2));
          goto LABEL_67;
        case 0xE:
          uint64_t v31 = *this;
          uint64_t v32 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            uint64_t v33 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v31 + 4 * v32);
            if ((v33 & 0x80000000) != 0)
            {
              int v34 = 10;
            }

            else if (v33 >= 0x80)
            {
              int v34 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v33);
              uint64_t v31 = *this;
            }

            else
            {
              int v34 = 1;
            }

            unint64_t v7 = (v34 + v7);
            ++v32;
          }

          while (v32 < *((int *)v31 + 2));
          goto LABEL_67;
        case 0x11:
          uint64_t v19 = *this;
          uint64_t v20 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            uint64_t v21 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)(*v19 + 4 * v20)) ^ (*(int *)(*v19 + 4 * v20) >> 31));
            if (v21 >= 0x80)
            {
              int v22 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v21);
              uint64_t v19 = *this;
            }

            else
            {
              int v22 = 1;
            }

            unint64_t v7 = (v22 + v7);
            ++v20;
          }

          while (v20 < *((int *)v19 + 2));
          goto LABEL_67;
        case 0x12:
          uint64_t v35 = *this;
          uint64_t v36 = 0LL;
          LODWORD(v7) = 0;
          do
          {
            ++v36;
            uint64_t v35 = *this;
          }

          while (v36 < *((int *)*this + 2));
LABEL_67:
          *((_DWORD *)this + 3) = v7;
          if ((int)v7 >= 1)
          {
            else {
              int v37 = 1;
            }
            int v38 = v37 + v7;
            int v39 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((8 * a2) | 2u);
            else {
              int v40 = 1;
            }
            unint64_t v7 = (v38 + v40);
          }

          break;
        default:
LABEL_5:
          unint64_t v7 = 0LL;
          *((_DWORD *)this + 3) = 0;
          break;
      }
    }

    else
    {
      BOOL v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * a2);
      else {
        int v12 = 1;
      }
      int v13 = v12 << (v4 == 10);
      switch(*((_BYTE *)this + 8))
      {
        case 1:
        case 6:
        case 0x10:
          int v14 = v13 + 8;
          goto LABEL_21;
        case 2:
        case 7:
        case 0xF:
          int v14 = v13 + 4;
LABEL_21:
          unint64_t v7 = (*((_DWORD *)*this + 2) * v14);
          break;
        case 3:
          uint64_t v44 = *this;
          int v45 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v45 * v13);
          if (v45 >= 1)
          {
            uint64_t v46 = 0LL;
            do
            {
              uint64_t v44 = *this;
            }

            while (v46 < *((int *)*this + 2));
          }

          break;
        case 4:
          uint64_t v47 = *this;
          int v48 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v48 * v13);
          if (v48 >= 1)
          {
            uint64_t v49 = 0LL;
            do
            {
              uint64_t v47 = *this;
            }

            while (v49 < *((int *)*this + 2));
          }

          break;
        case 5:
          uint64_t v50 = *this;
          int v51 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v51 * v13);
          if (v51 >= 1)
          {
            uint64_t v52 = 0LL;
            do
            {
              uint64_t v53 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v50 + 4 * v52);
              if ((v53 & 0x80000000) != 0)
              {
                int v54 = 10;
              }

              else if (v53 >= 0x80)
              {
                int v54 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v53);
                uint64_t v50 = *this;
              }

              else
              {
                int v54 = 1;
              }

              unint64_t v7 = (v54 + v7);
              ++v52;
            }

            while (v52 < *((int *)v50 + 2));
          }

          break;
        case 8:
          unint64_t v7 = (*((_DWORD *)*this + 2) + *((_DWORD *)*this + 2) * v13);
          break;
        case 9:
          uint64_t v55 = *this;
          int v56 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v56 * v13);
          if (v56 >= 1)
          {
            uint64_t v57 = 0LL;
            do
            {
              uint64_t v58 = *(void *)(*v55 + 8 * v57);
              int v59 = *(unsigned __int8 *)(v58 + 23);
              char v60 = v59;
              uint64_t v61 = *(void *)(v58 + 8);
              if ((v59 & 0x80u) == 0) {
                unint64_t v62 = *(unsigned __int8 *)(v58 + 23);
              }
              else {
                unint64_t v62 = v61;
              }
              if (v62 >= 0x80)
              {
                int v63 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v62);
                int v59 = *(unsigned __int8 *)(v58 + 23);
                uint64_t v61 = *(void *)(v58 + 8);
                uint64_t v55 = *this;
                char v60 = *(_BYTE *)(v58 + 23);
              }

              else
              {
                int v63 = 1;
              }

              if (v60 < 0) {
                int v59 = v61;
              }
              unint64_t v7 = (v63 + v7 + v59);
              ++v57;
            }

            while (v57 < *((int *)v55 + 2));
          }

          break;
        case 0xA:
          uint64_t v64 = *this;
          int v65 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v65 * v13);
          if (v65 >= 1)
          {
            uint64_t v66 = 0LL;
            do
            {
              ++v66;
              uint64_t v64 = *this;
            }

            while (v66 < *((int *)*this + 2));
          }

          break;
        case 0xB:
          v67 = *this;
          int v68 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v68 * v13);
          if (v68 >= 1)
          {
            uint64_t v69 = 0LL;
            do
            {
              uint64_t v70 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(*(uint64_t (**)(void))(**(void **)(*v67 + 8 * v69) + 72LL))(*(void *)(*v67 + 8 * v69));
              int v71 = (int)v70;
              else {
                int v72 = 1;
              }
              unint64_t v7 = (v71 + v7 + v72);
              ++v69;
              v67 = *this;
            }

            while (v69 < *((int *)*this + 2));
          }

          break;
        case 0xC:
          v73 = *this;
          int v74 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v74 * v13);
          if (v74 >= 1)
          {
            uint64_t v75 = 0LL;
            do
            {
              uint64_t v76 = *(void *)(*v73 + 8 * v75);
              int v77 = *(unsigned __int8 *)(v76 + 23);
              char v78 = v77;
              uint64_t v79 = *(void *)(v76 + 8);
              if ((v77 & 0x80u) == 0) {
                unint64_t v80 = *(unsigned __int8 *)(v76 + 23);
              }
              else {
                unint64_t v80 = v79;
              }
              if (v80 >= 0x80)
              {
                int v81 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v80);
                int v77 = *(unsigned __int8 *)(v76 + 23);
                uint64_t v79 = *(void *)(v76 + 8);
                v73 = *this;
                char v78 = *(_BYTE *)(v76 + 23);
              }

              else
              {
                int v81 = 1;
              }

              if (v78 < 0) {
                int v77 = v79;
              }
              unint64_t v7 = (v81 + v7 + v77);
              ++v75;
            }

            while (v75 < *((int *)v73 + 2));
          }

          break;
        case 0xD:
          v82 = *this;
          int v83 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v83 * v13);
          if (v83 >= 1)
          {
            uint64_t v84 = 0LL;
            do
            {
              v85 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v82 + 4 * v84);
              if (v85 >= 0x80)
              {
                int v86 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v85);
                v82 = *this;
              }

              else
              {
                int v86 = 1;
              }

              unint64_t v7 = (v86 + v7);
              ++v84;
            }

            while (v84 < *((int *)v82 + 2));
          }

          break;
        case 0xE:
          v87 = *this;
          int v88 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v88 * v13);
          if (v88 >= 1)
          {
            uint64_t v89 = 0LL;
            do
            {
              v90 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v87 + 4 * v89);
              if ((v90 & 0x80000000) != 0)
              {
                int v91 = 10;
              }

              else if (v90 >= 0x80)
              {
                int v91 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v90);
                v87 = *this;
              }

              else
              {
                int v91 = 1;
              }

              unint64_t v7 = (v91 + v7);
              ++v89;
            }

            while (v89 < *((int *)v87 + 2));
          }

          break;
        case 0x11:
          v92 = *this;
          int v93 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v93 * v13);
          if (v93 >= 1)
          {
            uint64_t v94 = 0LL;
            do
            {
              v95 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)(*v92 + 4 * v94)) ^ (*(int *)(*v92 + 4 * v94) >> 31));
              if (v95 >= 0x80)
              {
                int v96 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v95);
                v92 = *this;
              }

              else
              {
                int v96 = 1;
              }

              unint64_t v7 = (v96 + v7);
              ++v94;
            }

            while (v94 < *((int *)v92 + 2));
          }

          break;
        case 0x12:
          v97 = *this;
          int v98 = *((_DWORD *)*this + 2);
          unint64_t v7 = (v98 * v13);
          if (v98 >= 1)
          {
            uint64_t v99 = 0LL;
            do
            {
              ++v99;
              v97 = *this;
            }

            while (v99 < *((int *)*this + 2));
          }

          break;
        default:
          return 0LL;
      }
    }
  }

  else if ((*((_BYTE *)this + 10) & 1) != 0)
  {
    return 0LL;
  }

  else
  {
    int v8 = *((unsigned __int8 *)this + 8);
    int v9 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * a2);
    else {
      int v10 = 1;
    }
    unint64_t v7 = (v10 << (v8 == 10));
    switch(*((_BYTE *)this + 8))
    {
      case 1:
      case 6:
      case 0x10:
        return (v7 + 8);
      case 2:
      case 7:
      case 0xF:
        return (v7 + 4);
      case 3:
      case 4:
        unint64_t v41 = (unint64_t)*this;
        goto LABEL_169;
      case 5:
      case 0xE:
        uint64_t v42 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)this;
        int v43 = 10;
        goto LABEL_170;
      case 8:
        return (v7 + 1);
      case 9:
      case 0xC:
        int v43 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::StringSize((uint64_t)*this);
        goto LABEL_170;
      case 0xA:
        int v43 = (*(uint64_t (**)(uint64_t *))(**this + 72))(*this);
        goto LABEL_170;
      case 0xB:
        uint64_t v100 = **this;
        if ((*((_BYTE *)this + 10) & 0x10) != 0) {
          v101 = *(uint64_t (**)(void))(v100 + 64);
        }
        else {
          v101 = *(uint64_t (**)(void))(v100 + 72);
        }
        v103 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v101();
        int v104 = (int)v103;
        else {
          int v105 = 1;
        }
        return (v104 + v7 + v105);
      case 0xD:
        uint64_t v42 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)this;
        goto LABEL_165;
      case 0x11:
        uint64_t v42 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)this) ^ (*(int *)this >> 31));
LABEL_165:
        else {
          int v43 = 1;
        }
        goto LABEL_170;
      case 0x12:
        unint64_t v41 = (2LL * (void)*this) ^ ((uint64_t)*this >> 63);
LABEL_169:
        int v43 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(v41);
LABEL_170:
        unint64_t v7 = (v43 + v7);
        break;
      default:
        return v7;
    }
  }

  return v7;
}

void sub_187C283D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::StringSize(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 23);
  char v3 = v2;
  uint64_t v4 = *(void *)(a1 + 8);
  if ((v2 & 0x80u) == 0) {
    unint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    unint64_t v5 = v4;
  }
  if (v5 >= 0x80)
  {
    int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
    int v2 = *(unsigned __int8 *)(a1 + 23);
    uint64_t v4 = *(void *)(a1 + 8);
    char v3 = *(_BYTE *)(a1 + 23);
  }

  else
  {
    int v6 = 1;
  }

  if (v3 < 0) {
    int v2 = v4;
  }
  return (v6 + v2);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::find<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>( void *a1, uint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  uint64_t v3 = *(int *)(a2 + 8);
  unint64_t v4 = v3 - *(void *)a2 + (*(void *)a2 << 16);
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = v3 - *(void *)a2 + (*(void *)a2 << 16);
    if (v4 >= *(void *)&v2) {
      uint64_t v6 = v4 % *(void *)&v2;
    }
  }

  else
  {
    uint64_t v6 = (*(void *)&v2 - 1LL) & v4;
  }

  unint64_t v7 = *(uint64_t ***)(*a1 + 8 * v6);
  if (!v7) {
    return 0LL;
  }
  for (uint64_t result = *v7; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v9 = result[1];
    if (v4 == v9)
    {
      if (result[2] == *(void *)a2 && *((_DWORD *)result + 6) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v5.u32[0] > 1uLL)
      {
        if (v9 >= *(void *)&v2) {
          v9 %= *(void *)&v2;
        }
      }

      else
      {
        v9 &= *(void *)&v2 - 1LL;
      }

      if (v9 != v6) {
        return 0LL;
      }
    }
  }

  return result;
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::InitRegistry( wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this)
{
  int v1 = operator new(0x28uLL);
  *int v1 = 0u;
  v1[1] = 0u;
  *((_DWORD *)v1 + 8) = 1065353216;
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::DeleteRegistry( wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this)
{
  {
    operator delete(v1);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::~__hash_table( uint64_t a1)
{
  int8x8_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      int8x8_t v2 = v3;
    }

    while (v3);
  }

  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__emplace_unique_key_args<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::pair<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int> const,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>( uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6 = *(int *)(a2 + 8);
  unint64_t v7 = v6 - *(void *)a2 + (*(void *)a2 << 16);
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = v6 - *(void *)a2 + (*(void *)a2 << 16);
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }

    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }

    int v10 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v10)
    {
      BOOL v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *(void *)a2 && *((_DWORD *)v11 + 6) == (_DWORD)v6) {
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

            if (v12 != v3) {
              break;
            }
          }

          BOOL v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  BOOL v11 = operator new(0x40uLL);
  void *v11 = 0LL;
  v11[1] = v7;
  __int128 v14 = a3[1];
  *((_OWORD *)v11 + 1) = *a3;
  *((_OWORD *)v11 + 2) = v14;
  *((_OWORD *)v11 + 3) = a3[2];
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__rehash<true>( a1,  v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
      else {
        unint64_t v3 = v7;
      }
    }

    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
  }

  uint64_t v21 = *(void *)a1;
  int v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    void *v11 = *v22;
LABEL_42:
    *int v22 = v11;
    goto LABEL_43;
  }

  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v11)
  {
    unint64_t v23 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }

    else
    {
      v23 &= v8 - 1;
    }

    int v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }

LABEL_43:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_187C287E8(_Unwind_Exception *a1)
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__rehash<true>( uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__do_rehash<true>( a1,  prime);
  }

void std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
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
      BOOL v11 = (void *)*v7;
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
            BOOL v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          BOOL v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  int8x8_t v2 = (unsigned __int8 *)*((void *)this + 1);
  *a2 = *v2;
  *((void *)this + 1) = v2 + 1;
  return 1LL;
}

void std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy( uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy( a1,  *a2);
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy( a1,  a2[1]);
    operator delete(a2);
  }

void wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 < a2)
  {
    int8x8_t v4 = *(void **)a1;
    int v5 = 2 * v2;
    if (v5 <= a2) {
      int v5 = a2;
    }
    if (v5 <= 4) {
      int v5 = 4;
    }
    *(_DWORD *)(a1 + 12) = v5;
    uint64_t v6 = operator new[](4LL * v5);
    *(void *)a1 = v6;
    if (v4)
    {
      memcpy(v6, v4, 4LL * *(int *)(a1 + 8));
      operator delete[](v4);
    }
  }

void wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 < a2)
  {
    int8x8_t v4 = *(void **)a1;
    int v5 = 2 * v2;
    if (v5 <= a2) {
      int v5 = a2;
    }
    if (v5 <= 4) {
      int v5 = 4;
    }
    *(_DWORD *)(a1 + 12) = v5;
    uint64_t v6 = operator new[](8LL * v5);
    *(void *)a1 = v6;
    if (v4)
    {
      memcpy(v6, v4, 8LL * *(int *)(a1 + 8));
      operator delete[](v4);
    }
  }

void wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 < a2)
  {
    int8x8_t v4 = *(void **)a1;
    int v5 = 2 * v2;
    if (v5 <= a2) {
      int v5 = a2;
    }
    if (v5 <= 4) {
      size_t v6 = 4LL;
    }
    else {
      size_t v6 = v5;
    }
    *(_DWORD *)(a1 + 12) = v6;
    uint64_t v7 = operator new[](v6);
    *(void *)a1 = v7;
    if (v4)
    {
      memcpy(v7, v4, *(int *)(a1 + 8));
      operator delete[](v4);
    }
  }

uint64_t std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__erase_unique<int>( uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 < v3;
    if (v5 >= v3) {
      uint64_t v7 = (uint64_t *)v2;
    }
    else {
      uint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }

  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32)) {
    return 0LL;
  }
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__remove_node_pointer( (uint64_t **)a1,  (uint64_t *)v4);
  operator delete((void *)v4);
  return 1LL;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__remove_node_pointer( uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    uint64_t v4 = a2;
    do
    {
      int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int v3 = a2;
      goto LABEL_7;
    }

    do
    {
      int v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }

  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0LL;
      uint64_t result = (uint64_t *)v2;
    }

    else
    {
      uint64_t v7 = v6[1];
    }
  }

  else
  {
    v6[1] = (uint64_t *)v2;
  }

  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }

  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }

  while (1)
  {
    uint64_t v12 = v7[2];
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      int v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }

    float v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      float v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        std::string v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        float v16 = v7;
      }

      else
      {
        float v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }

    float v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      BOOL v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }

    if (!*((_BYTE *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8LL * (*(void *)v17[2] == (void)v17));
  }

  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    uint64_t v7 = *(uint64_t **)v12;
  }

  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  size_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }

  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    size_t v20 = v7;
  }

  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    std::string v20[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v20;
    *size_t v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8LL);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>( wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this, uint64_t a2)
{
  uint64_t v4 = *((int *)this + 2);
  int v5 = *((_DWORD *)this + 4);
  if ((_DWORD)v4 == v5)
  {
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(this, v4 + 1);
    int v6 = *((_DWORD *)this + 3) + 1;
LABEL_9:
    *((_DWORD *)this + 3) = v6;
    goto LABEL_10;
  }

  uint64_t v7 = *((int *)this + 3);
  if ((_DWORD)v7 != v5)
  {
    int v6 = v7 + 1;
    goto LABEL_9;
  }

  uint64_t v8 = *(void *)(*(void *)this + 8 * v4);
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
  }
LABEL_10:
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((int *)this + 2);
  *((_DWORD *)this + 2) = v10 + 1;
  *(void *)(v9 + 8 * v10) = a2;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::swap( uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v5 = result[1];
  uint64_t v4 = result[2];
  int v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (result[2]) {
    uint64_t result = (uint64_t *)(*v3 + 16LL);
  }
  *uint64_t result = (uint64_t)v3;
  int v6 = (void *)(*(void *)(a2 + 8) + 16LL);
  if (!v4) {
    int v6 = (void *)a2;
  }
  *int v6 = a2 + 8;
  return result;
}

uint64_t **std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>( uint64_t **a1, int *a2, uint64_t a3)
{
  int v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (char *)operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *((void *)v10 + 7) = *(void *)(a3 + 24);
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__insert_node_at( a1,  (uint64_t)v8,  v6,  (uint64_t *)v10);
    return (uint64_t **)v10;
  }

  return v8;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__insert_node_at( uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>( uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }

          else
          {
            int v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            wireless_diagnostics::google::protobuf::io::CodedOutputStream *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>( uint64_t result)
{
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v1 = 0LL;
    do
    {
      uint64_t v2 = *(void *)(*(void *)result + 8 * v1);
      if (*(char *)(v2 + 23) < 0)
      {
        **(_BYTE **)uint64_t v2 = 0;
        *(void *)(v2 + 8) = 0LL;
      }

      else
      {
        *(_BYTE *)uint64_t v2 = 0;
        *(_BYTE *)(v2 + 23) = 0;
      }

      ++v1;
    }

    while (v1 < *(int *)(result + 8));
  }

  *(_DWORD *)(result + 8) = 0;
  return result;
}

void wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>( uint64_t a1)
{
  if (*(int *)(a1 + 12) >= 1)
  {
    uint64_t v2 = 0LL;
    do
      wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete(*(void ***)(*(void *)a1
                                                                                                + 8 * v2++));
    while (v2 < *(int *)(a1 + 12));
  }

  if (*(void *)a1) {
    operator delete[](*(void **)a1);
  }
}

void wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>( uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*(void *)a1 + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
        int v2 = *(_DWORD *)(a1 + 12);
      }
    }
  }

  if (*(void *)a1) {
    operator delete[](*(void **)a1);
  }
}

void *wireless_diagnostics::google::protobuf::MessageLite::InitializationErrorString@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "(cannot determine missing fields for lite message)");
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(void *)this + 64LL))( this,  a2);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 40LL))(this) & 1) != 0)
    {
      return 1LL;
    }

    else
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v8,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  124);
      uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v8,  (const std::string::value_type *)&__p);
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v6,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
      return 0LL;
    }
  }

  return result;
}

void sub_187C29618( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(void *)this + 64LL))( this,  a2);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 40LL))(this) & 1) != 0)
    {
      return 1LL;
    }

    else
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v9,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  124);
      uint64_t v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v9,  (const std::string::value_type *)&__p);
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v7,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5,  v6);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
      return 0LL;
    }
  }

  return result;
}

void sub_187C29708( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromCodedStream( uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64LL))(a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromZeroCopyStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2)
{
  v6[0] = a2;
  memset(&v6[1], 0, 30);
  __int128 v7 = xmmword_187C30EC0;
  int v8 = 0;
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  unsigned int v3 = wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream( this,  (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  if (BYTE4(v6[4])) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0LL;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  return v4;
}

void sub_187C297F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromZeroCopyStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2)
{
  v6[0] = a2;
  memset(&v6[1], 0, 30);
  __int128 v7 = xmmword_187C30EC0;
  int v8 = 0;
  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32LL))(this);
  unsigned int v3 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 64LL))( this,  v6);
  if (BYTE4(v6[4])) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0LL;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  return v4;
}

void sub_187C29898( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromBoundedZeroCopyStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, int a3)
{
  v9[0] = a2;
  memset(&v9[1], 0, 30);
  __int128 v10 = xmmword_187C30EC0;
  int v11 = 0;
  int v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9,  a3);
  int v5 = wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream( this,  (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  if (BYTE4(v9[4])) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  BOOL v7 = v6 == 1
    && wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9) == 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v7;
}

void sub_187C29958( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromBoundedZeroCopyStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, int a3)
{
  v9[0] = a2;
  memset(&v9[1], 0, 30);
  __int128 v10 = xmmword_187C30EC0;
  int v11 = 0;
  int v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9,  a3);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32LL))(this);
  int v5 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 64LL))( this,  v9);
  if (BYTE4(v9[4])) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  BOOL v7 = v6 == 1
    && wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9) == 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v7;
}

void sub_187C29A30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromString( wireless_diagnostics::google::protobuf::_anonymous_namespace_ *a1, uint64_t *a2)
{
  LODWORD(v3) = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) == 0LL) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = (uint64_t *)*a2;
  }
  if ((v3 & 0x80u) != 0LL) {
    uint64_t v3 = a2[1];
  }
  v9[0] = 0LL;
  v9[1] = v4;
  std::string v9[2] = (char *)v4 + (int)v3;
  int v10 = v3;
  uint64_t v11 = 0LL;
  __int16 v12 = 0;
  int v13 = v3;
  __int128 v14 = xmmword_187C30ED0;
  int v15 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  (*(void (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)a1 + 32LL))(a1);
  if (!(*(unsigned int (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *, void *))(*(void *)a1 + 64LL))( a1,  v9)) {
    goto LABEL_12;
  }
  if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)a1 + 40LL))(a1) & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v20,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  124);
    int v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v20,  (const std::string::value_type *)&__p);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v20[0].__r_.__value_.__l.__data_);
LABEL_12:
    BOOL v5 = 0LL;
    goto LABEL_13;
  }

  BOOL v5 = (_BYTE)v12 != 0;
LABEL_13:
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v5;
}

void sub_187C29B68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)(v25 - 64));
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromString(uint64_t a1, uint64_t *a2)
{
  LODWORD(v3) = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) == 0LL) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = (uint64_t *)*a2;
  }
  if ((v3 & 0x80u) != 0LL) {
    uint64_t v3 = a2[1];
  }
  v8[0] = 0LL;
  v8[1] = v4;
  std::string v8[2] = (char *)v4 + (int)v3;
  int v9 = v3;
  uint64_t v10 = 0LL;
  __int16 v11 = 0;
  int v12 = v3;
  __int128 v13 = xmmword_187C30ED0;
  int v14 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  (*(void (**)(uint64_t))(*(void *)a1 + 32LL))(a1);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 64LL))(a1, v8);
  if ((_BYTE)v11) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0LL;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v8);
  return v6;
}

void sub_187C29C58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray( wireless_diagnostics::google::protobuf::MessageLite *this, char *a2, int a3)
{
  v8[0] = 0LL;
  v8[1] = a2;
  std::string v8[2] = &a2[a3];
  int v9 = a3;
  uint64_t v10 = 0LL;
  __int16 v11 = 0;
  int v12 = a3;
  __int128 v13 = xmmword_187C30ED0;
  int v14 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32LL))(this);
  if (!(*(unsigned int (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this + 64LL))( this,  v8))
  {
LABEL_7:
    BOOL v4 = 0LL;
    goto LABEL_8;
  }

  if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 40LL))(this) & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  124);
    unsigned int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v19,  (const std::string::value_type *)&__p);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v17,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5,  v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    goto LABEL_7;
  }

  BOOL v4 = (_BYTE)v11 != 0;
LABEL_8:
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v8);
  return v4;
}

void sub_187C29D78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)(v25 - 64));
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromArray( wireless_diagnostics::google::protobuf::MessageLite *this, char *a2, int a3)
{
  v7[0] = 0LL;
  v7[1] = a2;
  v7[2] = &a2[a3];
  int v8 = a3;
  uint64_t v9 = 0LL;
  __int16 v10 = 0;
  int v11 = a3;
  __int128 v12 = xmmword_187C30ED0;
  int v13 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 32LL))(this);
  unsigned int v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 64LL))( this,  v7);
  if ((_BYTE)v10) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v7);
  return v5;
}

void sub_187C29E50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned __int8 *wireless_diagnostics::google::protobuf::MessageLite::SerializeWithCachedSizesToArray( wireless_diagnostics::google::protobuf::MessageLite *this, unsigned __int8 *a2)
{
  int v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 96LL))(this);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream((uint64_t)v11, a2, v4, -1);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((uint64_t)v10, (uint64_t)v11);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *, _BYTE *))(*(void *)this + 80LL))( this,  v10);
  if (v10[24])
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v9,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  225);
    uint64_t v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v9,  "CHECK failed: !coded_out.HadError(): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v8,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5,  v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v10);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream((wireless_diagnostics::google::protobuf::io::ArrayOutputStream *)v11);
  return &a2[v4];
}

void sub_187C29F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v5 = va_arg(va1, void *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)va1);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream((wireless_diagnostics::google::protobuf::io::ArrayOutputStream *)(v3 - 64));
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::InitializationErrorMessage( wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  std::string::append(a2, "Can't ");
  std::string::append(a2, "parse");
  std::string::append(a2, " message of type ");
  (*(void (**)(void **__return_ptr, wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)this + 16LL))( &__p,  this);
  if ((v12 & 0x80u) == 0) {
    p_p = (const std::string::value_type *)&__p;
  }
  else {
    p_p = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v7 = v12;
  }
  else {
    std::string::size_type v7 = v11;
  }
  std::string::append(a2, p_p, v7);
  std::string::append(a2, " because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(void *)this + 48LL))( &__p,  this);
  if ((v12 & 0x80u) == 0) {
    uint64_t v8 = (const std::string::value_type *)&__p;
  }
  else {
    uint64_t v8 = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v9 = v12;
  }
  else {
    std::string::size_type v9 = v11;
  }
  std::string::append(a2, v8, v9);
}

void sub_187C2A07C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  uint64_t v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72LL))(this);
  uint64_t v5 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)v4;
  int v6 = *((_DWORD *)a2 + 4);
  int v7 = v6 - v4;
  if (v6 < (int)v4)
  {
LABEL_6:
    int v9 = *((_DWORD *)a2 + 5);
    (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedOutputStream *))(*(void *)this + 80LL))( this,  a2);
    if (*((_BYTE *)a2 + 24)) {
      return 0LL;
    }
    LODWORD(a2) = *((_DWORD *)a2 + 5) - *((_DWORD *)a2 + 4) + v6 - v9;
    if ((_DWORD)a2 != (_DWORD)v5) {
      goto LABEL_9;
    }
    return 1LL;
  }

  uint64_t v8 = *((void *)a2 + 1);
  *((void *)a2 + 1) = v8 + (int)v4;
  *((_DWORD *)a2 + 4) = v7;
  if (!v8)
  {
    int v6 = v7;
    goto LABEL_6;
  }

  a2 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, uint64_t))(*(void *)this + 88LL))( this,  v8)
                                                                       - v8);
  if (a2 != (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(int)v5)
  {
LABEL_9:
    int v11 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72LL))(this);
  }

  return 1LL;
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::ByteSizeConsistencyError( wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this, int a2, int a3)
{
  int v4 = (int)this;
  if ((_DWORD)this != a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  64);
    uint64_t v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: (byte_size_before_serialization) == (byte_size_after_serialization): ");
    int v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v5,  "Protocol message was modified concurrently during serialization.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }

  if (a3 != v4)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  66);
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: (bytes_produced_by_serialization) == (byte_size_before_serialization): ");
    int v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v8,  "Byte size calculation and serialization were inconsistent.  This may indicate a bug in protocol buffers or it may be caused by concurrent modification of the message.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9,  v10);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }

  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc",  70);
  int v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "This shouldn't be called if all the sizes are equal.");
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
}

void sub_187C2A2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToZeroCopyStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  uint64_t v3 = wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream( this,  (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  return v3;
}

void sub_187C2A33C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToZeroCopyStream( wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  uint64_t v3 = wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream( this,  (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  return v3;
}

void sub_187C2A398( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::AppendToString(uint64_t a1, std::string *a2)
{
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString( uint64_t a1, std::string *a2)
{
  int v2 = a2;
  else {
    LODWORD(size) = a2->__r_.__value_.__s.__size_;
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
  std::string::resize(v2, (int)v5 + (int)size, 0);
  if ((char)v2->__r_.__value_.__s.__size_ < 0)
  {
    if (v2->__r_.__value_.__l.__size_)
    {
      int v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
      goto LABEL_10;
    }
  }

  else if (v2->__r_.__value_.__s.__size_)
  {
    goto LABEL_10;
  }

  int v2 = 0LL;
LABEL_10:
  uint64_t v6 = (*(uint64_t (**)(uint64_t, char *))(*(void *)a1 + 88LL))(a1, (char *)v2 + (int)size)
     - ((void)v2
      + (int)size);
  if (v6 != (int)v5)
  {
    int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
  }

  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString(uint64_t a1, std::string *a2)
{
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, a2);
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToString( uint64_t a1, std::string *a2)
{
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, a2);
  return 1LL;
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToArray( wireless_diagnostics::google::protobuf::MessageLite *this, void *a2, int a3)
{
  uint64_t v6 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72LL))(this);
  if ((int)v6 <= a3)
  {
    uint64_t v7 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(void *)this
                                                                                                  + 88LL))( this,  a2)
       - (void)a2;
    if (v7 != (int)v6)
    {
      int v8 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)this + 72LL))(this);
    }
  }

  return (int)v6 <= a3;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString@<X0>( wireless_diagnostics::google::protobuf::MessageLite *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  return wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString((uint64_t)this, a2);
}

void sub_187C2A5C0(_Unwind_Exception *exception_object)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialAsString@<X0>( wireless_diagnostics::google::protobuf::MessageLite *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  return wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString((uint64_t)this, a2);
}

void sub_187C2A608(_Unwind_Exception *exception_object)
{
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A119E08, MEMORY[0x1896141F8]);
}

void sub_187C2A724(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayInputStream::ArrayInputStream( uint64_t this, const void *a2, int a3, int a4)
{
  *(void *)this = off_18A11A040;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0LL;
  return this;
}

{
  int v4;
  *(void *)this = off_18A11A040;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0LL;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ArrayInputStream::~ArrayInputStream( wireless_diagnostics::google::protobuf::io::ArrayInputStream *this)
{
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayInputStream::Next( wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, const void **a2, int *a3)
{
  uint64_t v3 = *((int *)this + 6);
  int v4 = *((_DWORD *)this + 4);
  if ((int)v3 >= v4)
  {
    *((_DWORD *)this + 7) = 0;
  }

  else
  {
    int v5 = v4 - v3;
    *((_DWORD *)this + 7) = v5;
    *a2 = (const void *)(*((void *)this + 1) + v3);
    *a3 = v5;
    *((_DWORD *)this + 6) += *((_DWORD *)this + 7);
  }

  return (int)v3 < v4;
}

void wireless_diagnostics::google::protobuf::io::ArrayInputStream::BackUp( wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, int a2)
{
  int v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v13,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  80);
    int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v13,  "CHECK failed: (last_returned_size_) > (0): ");
    uint64_t v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v5,  "BackUp() can only be called after a successful Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v12,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    int v4 = *((_DWORD *)this + 7);
  }

  if (v4 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v13,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  82);
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v13,  "CHECK failed: (count) <= (last_returned_size_): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v12,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8,  v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v13,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  83);
    uint64_t v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v13,  "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v12,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v10,  v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }

  *((void *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_187C2A91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayInputStream::Skip( wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v12,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  89);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v11,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }

  int v6 = *((_DWORD *)this + 4);
  int v7 = *((_DWORD *)this + 6);
  int v8 = v6 - v7;
  BOOL result = v6 - v7 >= a2;
  int v10 = v7 + a2;
  if (v8 >= a2) {
    int v6 = v10;
  }
  *((_DWORD *)this + 6) = v6;
  *((_DWORD *)this + 7) = 0;
  return result;
}

void sub_187C2A9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayInputStream::ByteCount( wireless_diagnostics::google::protobuf::io::ArrayInputStream *this)
{
  return *((int *)this + 6);
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream( uint64_t this, void *a2, int a3, int a4)
{
  *(void *)this = off_18A11A080;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0LL;
  return this;
}

{
  int v4;
  *(void *)this = off_18A11A080;
  *(void *)(this + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(void *)(this + 24) = 0LL;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream( wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayOutputStream::Next( wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, void **a2, int *a3)
{
  uint64_t v3 = *((int *)this + 6);
  int v4 = *((_DWORD *)this + 4);
  if ((int)v3 >= v4)
  {
    *((_DWORD *)this + 7) = 0;
  }

  else
  {
    int v5 = v4 - v3;
    *((_DWORD *)this + 7) = v5;
    *a2 = (void *)(*((void *)this + 1) + v3);
    *a3 = v5;
    *((_DWORD *)this + 6) += *((_DWORD *)this + 7);
  }

  return (int)v3 < v4;
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::BackUp( wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, int a2)
{
  int v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v13,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  133);
    int v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v13,  "CHECK failed: (last_returned_size_) > (0): ");
    int v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v5,  "BackUp() can only be called after a successful Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v12,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    int v4 = *((_DWORD *)this + 7);
  }

  if (v4 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v13,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  135);
    int v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v13,  "CHECK failed: (count) <= (last_returned_size_): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v12,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8,  v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v13,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  136);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v13,  "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v12,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v10,  v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }

  *((void *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_187C2ABAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ByteCount( wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
  return *((int *)this + 6);
}

void *wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream( void *result, uint64_t a2)
{
  *BOOL result = off_18A11A0B8;
  result[1] = a2;
  return result;
}

{
  *BOOL result = off_18A11A0B8;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::StringOutputStream::~StringOutputStream( wireless_diagnostics::google::protobuf::io::StringOutputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::StringOutputStream::Next( wireless_diagnostics::google::protobuf::io::StringOutputStream *this, void **a2, int *a3)
{
  int v6 = (std::string *)*((void *)this + 1);
  if ((char)v6->__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type size = v6->__r_.__value_.__l.__size_;
    uint64_t v9 = (int)size;
    std::string::size_type v8 = (v6->__r_.__value_.__l.__cap_ & 0x7FFFFFFFFFFFFFFFLL) - 1;
  }

  else
  {
    LODWORD(size) = v6->__r_.__value_.__s.__size_;
    if (size < 0x16)
    {
      std::string::size_type v8 = 22LL;
      uint64_t v9 = v6->__r_.__value_.__s.__size_;
      goto LABEL_10;
    }

    uint64_t v9 = v6->__r_.__value_.__s.__size_;
  }

  else {
    std::string::size_type v8 = (2 * size);
  }
LABEL_10:
  std::string::resize(v6, v8, 0);
  int v10 = (uint64_t *)*((void *)this + 1);
  if (*((char *)v10 + 23) < 0)
  {
    if (v10[1])
    {
      int v10 = (uint64_t *)*v10;
      goto LABEL_16;
    }
  }

  else if (*((_BYTE *)v10 + 23))
  {
    goto LABEL_16;
  }

  int v10 = 0LL;
LABEL_16:
  *a2 = (char *)v10 + v9;
  uint64_t v11 = *((void *)this + 1);
  else {
    LODWORD(v11) = *(unsigned __int8 *)(v11 + 23);
  }
  *a3 = v11 - size;
  return 1LL;
}

void wireless_diagnostics::google::protobuf::io::StringOutputStream::BackUp( wireless_diagnostics::google::protobuf::io::StringOutputStream *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v12,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  177);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v11,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }

  int v6 = (std::string *)*((void *)this + 1);
  LODWORD(v7) = (char)v6->__r_.__value_.__s.__size_;
  if ((v7 & 0x80000000) != 0) {
    unint64_t size = v6->__r_.__value_.__l.__size_;
  }
  else {
    unint64_t size = v6->__r_.__value_.__s.__size_;
  }
  if (size < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v12,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  178);
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "CHECK failed: (count) <= (target_->size()): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v11,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9,  v10);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
    int v6 = (std::string *)*((void *)this + 1);
    LOBYTE(v7) = v6->__r_.__value_.__s.__size_;
  }

  if ((v7 & 0x80) != 0) {
    std::string::size_type v7 = v6->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v7 = v7;
  }
  std::string::resize(v6, v7 - a2, 0);
}

void sub_187C2ADE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::StringOutputStream::ByteCount( wireless_diagnostics::google::protobuf::io::StringOutputStream *this)
{
  uint64_t v1 = *((void *)this + 1);
  else {
    return *(unsigned __int8 *)(v1 + 23);
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStream::Skip( wireless_diagnostics::google::protobuf::io::CopyingInputStream *this)
{
  uint64_t v1 = MEMORY[0x1895F8858](this);
  int v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = 0LL;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  do
  {
    uint64_t v6 = v5;
    BOOL v7 = __OFSUB__(v3, (_DWORD)v5);
    int v8 = v3 - v5;
    if ((v8 < 0) ^ v7 | (v8 == 0)) {
      break;
    }
    uint64_t v9 = v8 >= 4096 ? 4096LL : v8;
    int v10 = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(void *)v4 + 16LL))(v4, v12, v9);
    uint64_t v5 = (v10 + v6);
  }

  while (v10 > 0);
  return v6;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor( uint64_t this, wireless_diagnostics::google::protobuf::io::CopyingInputStream *a2, int a3)
{
  *(void *)this = off_18A11A0F0;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0LL;
  *(void *)(this + 32) = 0LL;
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

{
  int v3;
  *(void *)this = off_18A11A0F0;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0LL;
  *(void *)(this + 32) = 0LL;
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor( wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  *(void *)this = off_18A11A0F0;
  if (*((_BYTE *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
    }
  }

  int v3 = (void *)*((void *)this + 4);
  if (v3) {
    operator delete[](v3);
  }
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next( wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, const void **a2, int *a3)
{
  if (*((_BYTE *)this + 17)) {
    return 0LL;
  }
  BOOL v7 = (char *)*((void *)this + 4);
  if (!v7)
  {
    BOOL v7 = (char *)operator new[](*((int *)this + 10));
    *((void *)this + 4) = v7;
  }

  uint64_t v8 = *((unsigned int *)this + 12);
  if ((int)v8 < 1)
  {
    int v9 = (*(uint64_t (**)(void, char *, void))(**((void **)this + 1) + 16LL))( *((void *)this + 1),  v7,  *((unsigned int *)this + 10));
    *((_DWORD *)this + 11) = v9;
    if (v9 <= 0)
    {
      if (v9 < 0) {
        *((_BYTE *)this + 17) = 1;
      }
      wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(this);
      return 0LL;
    }

    int v10 = (const void *)*((void *)this + 4);
    *((void *)this + 3) += v9;
    *a3 = v9;
    *a2 = v10;
  }

  else
  {
    *a2 = &v7[*((int *)this + 11) - v8];
    *a3 = v8;
    *((_DWORD *)this + 12) = 0;
  }

  return 1LL;
}

int *wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded( int *this)
{
  if (!*((void *)this + 4))
  {
    uint64_t v1 = this;
    this = (int *)operator new[](this[10]);
    v1[4] = this;
  }

  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer( wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  if (*((_DWORD *)this + 12))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v6,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  302);
    uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v6,  "CHECK failed: (backup_bytes_) == (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v5,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2,  v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }

  *((_DWORD *)this + 11) = 0;
  uint64_t v4 = (void *)*((void *)this + 4);
  if (v4)
  {
    operator delete[](v4);
    *((void *)this + 4) = 0LL;
  }

void sub_187C2B128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::BackUp( wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  if (*((_DWORD *)this + 12) || !*((void *)this + 4))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  257);
    uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: backup_bytes_ == 0 && buffer_.get() != NULL: ");
    char v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v4,  " BackUp() can only be called after Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5,  v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }

  if (*((_DWORD *)this + 11) < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  259);
    BOOL v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: (count) <= (buffer_used_): ");
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v7,  " Can't back up over more bytes than were returned by the last call to Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8,  v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  262);
    int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: (count) >= (0): ");
    char v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  " Parameter to BackUp() can't be negative.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }

  *((_DWORD *)this + 12) = a2;
}

void sub_187C2B268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip( wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v11,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  269);
    uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v10,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }

  if (*((_BYTE *)this + 17)) {
    return 0LL;
  }
  int v7 = *((_DWORD *)this + 12);
  if (v7 >= a2)
  {
    *((_DWORD *)this + 12) = v7 - a2;
    return 1LL;
  }

  else
  {
    uint64_t v8 = (a2 - v7);
    *((_DWORD *)this + 12) = 0;
    int v9 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 1) + 24LL))(*((void *)this + 1), v8);
    *((void *)this + 3) += v9;
    return v9 == (_DWORD)v8;
  }

void sub_187C2B350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount( wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  return *((void *)this + 3) - *((int *)this + 12);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor( uint64_t this, wireless_diagnostics::google::protobuf::io::CopyingOutputStream *a2, int a3)
{
  *(void *)this = off_18A11A130;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0LL;
  *(void *)(this + 32) = 0LL;
  *(_DWORD *)(this + 40) = v3;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

{
  int v3;
  *(void *)this = off_18A11A130;
  *(void *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(this + 24) = 0LL;
  *(void *)(this + 32) = 0LL;
  *(_DWORD *)(this + 40) = v3;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor( wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  *(void *)this = off_18A11A130;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if (*((_BYTE *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
    }
  }

  int v3 = (void *)*((void *)this + 4);
  if (v3) {
    operator delete[](v3);
  }
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer( wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  if (*((_BYTE *)this + 17)) {
    return 0LL;
  }
  if (!*((_DWORD *)this + 11)) {
    return 1LL;
  }
  if ((*(unsigned int (**)(void, void))(**((void **)this + 1) + 16LL))( *((void *)this + 1),  *((void *)this + 4)))
  {
    *((void *)this + 3) += *((int *)this + 11);
    *((_DWORD *)this + 11) = 0;
    return 1LL;
  }

  *((_BYTE *)this + 17) = 1;
  *((_DWORD *)this + 11) = 0;
  uint64_t result = *((void *)this + 4);
  if (result)
  {
    operator delete[]((void *)result);
    uint64_t result = 0LL;
    *((void *)this + 4) = 0LL;
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next( wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, void **a2, int *a3)
{
  int v6 = *((_DWORD *)this + 10);
  if (*((_DWORD *)this + 11) == v6)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
    if (!(_DWORD)result) {
      return result;
    }
    int v6 = *((_DWORD *)this + 10);
  }

  uint64_t v8 = (char *)*((void *)this + 4);
  if (!v8)
  {
    uint64_t v8 = (char *)operator new[](v6);
    *((void *)this + 4) = v8;
  }

  uint64_t v9 = *((int *)this + 11);
  *a2 = &v8[v9];
  *a3 = v6 - v9;
  *((_DWORD *)this + 11) = *((_DWORD *)this + 10);
  return 1LL;
}

int *wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::AllocateBufferIfNeeded( int *this)
{
  if (!*((void *)this + 4))
  {
    uint64_t v1 = this;
    this = (int *)operator new[](this[10]);
    v1[4] = this;
  }

  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::BackUp( wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, int a2)
{
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  346);
    uint64_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }

  int v6 = *((_DWORD *)this + 11);
  if (v6 != *((_DWORD *)this + 10))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  347);
    int v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: (buffer_used_) == (buffer_size_): ");
    uint64_t v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v7,  " BackUp() can only be called after Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8,  v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    int v6 = *((_DWORD *)this + 11);
  }

  if (v6 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc",  349);
    char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: (count) <= (buffer_used_): ");
    char v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  " Can't back up over more bytes than were returned by the last call to Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    int v6 = *((_DWORD *)this + 11);
  }

  *((_DWORD *)this + 11) = v6 - a2;
}

void sub_187C2B69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount( wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return *((void *)this + 3) + *((int *)this + 11);
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::FreeBuffer( wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  *((_DWORD *)this + 11) = 0;
  uint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    operator delete[](v2);
    *((void *)this + 4) = 0LL;
  }

void wireless_diagnostics::google::protobuf::StringAppendV(std::string *a1, char *__format, va_list a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v5 = vsnprintf(__str, 0x400uLL, __format, a3);
  int v6 = v5;
  if (v5 > 1023)
  {
    int v7 = (char *)operator new[]((v5 + 1));
    int v8 = vsnprintf(v7, (v6 + 1), __format, a3);
    if ((v8 & 0x80000000) == 0 && v8 <= v6) {
      std::string::append(a1, v7, v8);
    }
    operator delete[](v7);
  }

  else if ((v5 & 0x80000000) == 0)
  {
    std::string::append(a1, __str, v5);
  }

void wireless_diagnostics::google::protobuf::StringPrintf( wireless_diagnostics::google::protobuf *this@<X0>, std::string *a2@<X8>, ...)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  wireless_diagnostics::google::protobuf::StringAppendV(a2, (char *)this, va);
}

void sub_187C2B830(_Unwind_Exception *exception_object)
{
}

std::string *wireless_diagnostics::google::protobuf::SStringPrintf( std::string *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((char)a1->__r_.__value_.__s.__size_ < 0)
  {
    *a1->__r_.__value_.__l.__data_ = 0;
    a1->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1->__r_.__value_.__s.__size_ = 0;
  }

  wireless_diagnostics::google::protobuf::StringAppendV(a1, a2, &a9);
  return a1;
}

void wireless_diagnostics::google::protobuf::StringAppendF( std::string *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void wireless_diagnostics::google::protobuf::StringPrintfVector( wireless_diagnostics::google::protobuf *this@<X0>, uint64_t **a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  int v5 = *a2;
  int v6 = a2[1];
  unint64_t v7 = ((char *)v6 - (char *)*a2) / 24;
  if (v7 >= 0x21)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v19,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/stringprintf.cc",  142);
    uint64_t v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( (std::string *)v19,  "CHECK failed: (v.size()) <= (kStringPrintfVectorMaxArgs): ");
    char v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v9,  "StringPrintfVector currently only supports up to ");
    uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, 32);
    char v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, " arguments. ");
    char v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v12,  "Feel free to add support for more if you need it.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v18,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13,  v14);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)v19);
    int v5 = *a2;
    int v6 = a2[1];
    unint64_t v7 = ((char *)v6 - (char *)*a2) / 24;
  }

  if (v6 != v5)
  {
    if (v7 <= 1) {
      uint64_t v15 = 1LL;
    }
    else {
      uint64_t v15 = v7;
    }
    uint64_t v16 = v19;
    do
    {
      char v17 = v5;
      *v16++ = v17;
      v5 += 3;
      --v15;
    }

    while (v15);
  }

  if ((v7 & 0xFFFFFFE0) == 0) {
    memset_pattern16((char *)v19 + ((8 * v7) & 0x7FFFFFFF8LL), &off_18A11A250, ((248 - 8 * v7) & 0x7FFFFFFF8LL) + 8);
  }
  wireless_diagnostics::google::protobuf::StringPrintf( this,  a3,  v19[0],  v19[1],  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  v43,  v44,  v45,  v46,  v47);
}

void sub_187C2BAD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, void *a42)
{
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream( wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  if (*(void *)this) {
    wireless_diagnostics::google::protobuf::io::CodedInputStream::BackUpInputToCurrentPosition(this);
  }
  if (*((_DWORD *)this + 13) == -2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v6,  1,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc",  79);
    uint64_t v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v6,  "The total number of bytes read was ");
    int v3 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, *((_DWORD *)this + 6));
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v5,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v3,  v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }

_DWORD *wireless_diagnostics::google::protobuf::io::CodedInputStream::BackUpInputToCurrentPosition( _DWORD *this)
{
  if (this[7] + this[11] + this[4] - this[2] >= 1)
  {
    uint64_t v1 = this;
    this = (_DWORD *)(*(uint64_t (**)(void))(**(void **)this + 24LL))(*(void *)this);
    uint64_t v2 = *((void *)v1 + 1);
    unsigned int v3 = v1[6] - v1[11] + v2 - v1[4];
    *((void *)v1 + 2) = v2;
    v1[11] = 0;
    *((void *)v1 + 3) = v3;
  }

  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  int v2 = *((_DWORD *)this + 6);
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *((unsigned int *)this + 10);
  uint64_t v5 = *((int *)this + 11);
  int v6 = v2 - v5 + *((_DWORD *)this + 2) - v3;
  BOOL v7 = (v6 ^ 0x7FFFFFFF) < a2 || a2 < 0;
  int v8 = v6 + a2;
  if (v7) {
    int v8 = 0x7FFFFFFF;
  }
  *((_DWORD *)this + 10) = v8;
  uint64_t v9 = v3 + v5;
  *((void *)this + 2) = v9;
  if (*((_DWORD *)this + 12) < v8) {
    int v8 = *((_DWORD *)this + 12);
  }
  BOOL v10 = __OFSUB__(v2, v8);
  int v11 = v2 - v8;
  if ((v11 < 0) ^ v10 | (v11 == 0)) {
    int v11 = 0;
  }
  else {
    *((void *)this + 2) = v9 - v11;
  }
  *((_DWORD *)this + 11) = v11;
  return v4;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(uint64_t this, int a2)
{
  *(_DWORD *)(this + 40) = a2;
  int v2 = *(_DWORD *)(this + 48);
  uint64_t v3 = *(void *)(this + 16) + *(int *)(this + 44);
  *(void *)(this + 16) = v3;
  if (v2 >= a2) {
    int v4 = a2;
  }
  else {
    int v4 = v2;
  }
  int v5 = *(_DWORD *)(this + 24);
  BOOL v6 = __OFSUB__(v5, v4);
  int v7 = v5 - v4;
  if ((v7 < 0) ^ v6 | (v7 == 0)) {
    int v7 = 0;
  }
  else {
    *(void *)(this + 16) = v3 - v7;
  }
  *(_DWORD *)(this + 44) = v7;
  *(_BYTE *)(this + 36) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit( wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v1 = *((_DWORD *)this + 10);
  if (v1 == 0x7FFFFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return (v1
  }
                        - *((_DWORD *)this + 6)
                        + *((_DWORD *)this + 11)
                        + *((_DWORD *)this + 4)
                        - *((_DWORD *)this + 2));
}

int32x2_t *wireless_diagnostics::google::protobuf::io::CodedInputStream::SetTotalBytesLimit( int32x2_t *this, unsigned int a2, __int32 a3)
{
  __int32 v3 = this[3].i32[0];
  int32x2_t v4 = this[2];
  int v5 = this[5].i32[0];
  uint64_t v6 = this[5].i32[1];
  v7.i32[0] = v3 - v6 + this[1].i32[0] - v4.i32[0];
  v7.i32[1] = a3;
  int32x2_t v8 = vmax_s32(v7, (int32x2_t)(a2 | 0xFFFFFFFF00000000LL));
  this[6] = v8;
  int32x2_t v9 = (int32x2_t)(*(void *)&v4 + v6);
  this[2] = v9;
  int v10 = v8.i32[0];
  if (v8.i32[0] >= v5) {
    int v10 = v5;
  }
  BOOL v11 = __OFSUB__(v3, v10);
  int v12 = v3 - v10;
  if ((v12 < 0) ^ v11 | (v12 == 0)) {
    int v12 = 0;
  }
  else {
    this[2] = (int32x2_t)(*(void *)&v9 - v12);
  }
  this[5].i32[1] = v12;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::PrintTotalBytesLimitError( wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v7,  "A protocol message was rejected because it was too big (more than ");
  __int32 v3 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, *((_DWORD *)this + 12));
  int32x2_t v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v3,  " bytes).  To increase the limit (or to disable these warnings), see CodedInputStream::SetTotalBytesLimit() in g oogle/protobuf/io/coded_stream.h.");
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v6,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
}

void sub_187C2BDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int a2)
{
  if ((a2 & 0x80000000) == 0)
  {
    uint64_t v4 = *((void *)this + 1);
    __int32 v3 = (void *)((char *)this + 8);
    uint64_t v5 = *((void *)this + 2) - v4;
    BOOL v6 = __OFSUB__(a2, (_DWORD)v5);
    int v7 = a2 - v5;
    if ((v7 < 0) ^ v6 | (v7 == 0))
    {
      void *v3 = v4 + a2;
      return 1LL;
    }

    if (*((int *)this + 11) >= 1)
    {
      uint64_t result = 0LL;
      void *v3 = v4 + (int)v5;
      return result;
    }

    void *v3 = 0LL;
    *((void *)this + 2) = 0LL;
    int v9 = *((_DWORD *)this + 10);
    if (*((_DWORD *)this + 12) < v9) {
      int v9 = *((_DWORD *)this + 12);
    }
    int v10 = *((_DWORD *)this + 6);
    uint64_t v11 = (v9 - v10);
    if ((int)v11 >= v7)
    {
      *((_DWORD *)this + 6) = v10 + v7;
      return (*(uint64_t (**)(void))(**(void **)this + 32LL))(*(void *)this);
    }

    if ((int)v11 >= 1)
    {
      *((_DWORD *)this + 6) = v9;
      (*(void (**)(void, uint64_t))(**(void **)this + 32LL))(*(void *)this, v11);
    }
  }

  return 0LL;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, const void **a2, int *a3)
{
  BOOL v6 = (const void *)*((void *)this + 1);
  if (*((_DWORD *)this + 4) == (_DWORD)v6)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this);
    if (!(_DWORD)result) {
      return result;
    }
    BOOL v6 = (const void *)*((void *)this + 1);
  }

  *a2 = v6;
  *a3 = *((_DWORD *)this + 4) - *((_DWORD *)this + 2);
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh( wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2 = *((_DWORD *)this + 11);
  if (v2 > 0 || *((int *)this + 7) > 0 || (int v3 = *((_DWORD *)this + 6), v3 == *((_DWORD *)this + 10)))
  {
    int v4 = *((_DWORD *)this + 6) - v2;
    int v5 = *((_DWORD *)this + 12);
    if (v4 >= v5 && v5 != *((_DWORD *)this + 10)) {
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PrintTotalBytesLimitError(this);
    }
    return 0LL;
  }

  else
  {
    int v8 = *((_DWORD *)this + 13);
    if ((v8 & 0x80000000) == 0 && v3 >= v8)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v30,  1,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc",  506);
      int v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v30,  "Reading dangerously large protocol message.  If the message turns out to be larger than ");
      int v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, *((_DWORD *)this + 12));
      uint64_t v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v10,  " bytes, parsing will be halted for security reasons.  To increase the limit (or to disable these warnings) , see CodedInputStream::SetTotalBytesLimit() in google/protobuf/io/coded_stream.h.");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v29,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11,  v12);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
      *((_DWORD *)this + 13) = -2;
    }

    uint64_t v13 = *(void *)this;
    do
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)v13 + 16LL))(v13, &v29, &v28);
      if (!(_DWORD)v6)
      {
        *((void *)this + 1) = 0LL;
        *((void *)this + 2) = 0LL;
        return v6;
      }

      int v14 = v28;
    }

    while (!v28);
    uint64_t v15 = v29 + v28;
    *((void *)this + 1) = v29;
    *((void *)this + 2) = v15;
    if (v14 < 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v30,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc",  523);
      uint64_t v16 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v30,  "CHECK failed: (buffer_size) >= (0): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v27,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v16,  v17);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
      int v14 = v28;
    }

    int v18 = *((_DWORD *)this + 6);
    int v19 = v18 - (v14 ^ 0x7FFFFFFF);
    if (v18 <= (v14 ^ 0x7FFFFFFF))
    {
      int v21 = v14 + v18;
      uint64_t v20 = *((void *)this + 2);
    }

    else
    {
      *((_DWORD *)this + 7) = v19;
      uint64_t v20 = *((void *)this + 2) - v19;
      *((void *)this + 2) = v20;
      int v21 = 0x7FFFFFFF;
    }

    *((_DWORD *)this + 6) = v21;
    int v22 = *((_DWORD *)this + 10);
    uint64_t v23 = v20 + *((int *)this + 11);
    *((void *)this + 2) = v23;
    int v24 = *((_DWORD *)this + 12);
    if (v24 >= v22) {
      int v24 = v22;
    }
    BOOL v25 = __OFSUB__(v21, v24);
    int v26 = v21 - v24;
    if ((v26 < 0) ^ v25 | (v26 == 0)) {
      int v26 = 0;
    }
    else {
      *((void *)this + 2) = v23 - v26;
    }
    *((_DWORD *)this + 11) = v26;
  }

  return v6;
}

void sub_187C2C0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, char *__dst, int a3)
{
  while (1)
  {
    int v6 = a3;
    int v7 = (const void *)*((void *)this + 1);
    int v8 = *((void *)this + 2) - (_DWORD)v7;
    BOOL v9 = __OFSUB__(a3, v8);
    a3 -= v8;
    if ((a3 < 0) ^ v9 | (a3 == 0)) {
      break;
    }
    memcpy(__dst, v7, v8);
    __dst += v8;
    *((void *)this + 1) += v8;
    if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0) {
      return v6 <= v8;
    }
  }

  memcpy(__dst, v7, v6);
  *((void *)this + 1) += v6;
  return v6 <= v8;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString( uint64_t a1, std::string *this, std::string::size_type __n)
{
  if ((__n & 0x80000000) != 0) {
    return 0LL;
  }
  unsigned int v3 = __n;
  int v4 = this;
  if (*(_DWORD *)(a1 + 16) - *(_DWORD *)(a1 + 8) < (int)__n) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback( (wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1,  this,  __n);
  }
  std::string::resize(this, __n, 0);
  if (v3)
  {
    if ((char)v4->__r_.__value_.__s.__size_ < 0)
    {
      if (!v4->__r_.__value_.__l.__size_)
      {
LABEL_11:
        int v4 = 0LL;
        goto LABEL_12;
      }

      int v4 = (std::string *)v4->__r_.__value_.__r.__words[0];
    }

    else if (!v4->__r_.__value_.__s.__size_)
    {
      goto LABEL_11;
    }

LABEL_12:
    memcpy(v4, *(const void **)(a1 + 8), v3);
    *(void *)(a1 + 8) += v3;
  }

  return 1LL;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, std::string *a2, int a3)
{
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    if (a2->__r_.__value_.__l.__size_)
    {
      *a2->__r_.__value_.__l.__data_ = 0;
      a2->__r_.__value_.__l.__size_ = 0LL;
    }
  }

  else if (a2->__r_.__value_.__s.__size_)
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  while (1)
  {
    int v6 = a3;
    int v7 = (const std::string::value_type *)*((void *)this + 1);
    int v8 = *((void *)this + 2) - (_DWORD)v7;
    BOOL v9 = __OFSUB__(a3, v8);
    a3 -= v8;
    if ((a3 < 0) ^ v9 | (a3 == 0)) {
      break;
    }
    if (v8)
    {
      std::string::append(a2, v7, v8);
      int v7 = (const std::string::value_type *)*((void *)this + 1);
    }

    *((void *)this + 1) = &v7[v8];
    if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0) {
      return v6 <= v8;
    }
  }

  std::string::append(a2, v7, v6);
  *((void *)this + 1) += v6;
  return v6 <= v8;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  unsigned int v3 = (unsigned int *)*((void *)this + 1);
  if (((*((_DWORD *)this + 4) - (_DWORD)v3) & 0xFFFFFFFC) != 0)
  {
    *((void *)this + 1) = v3 + 1;
  }

  else
  {
    unsigned int v3 = (unsigned int *)__dst;
    BOOL result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, __dst, 4);
    if (!result) {
      return result;
    }
  }

  *a2 = *v3;
  return 1LL;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  unsigned int v3 = (unint64_t *)*((void *)this + 1);
  if (((*((_DWORD *)this + 4) - (_DWORD)v3) & 0xFFFFFFF8) != 0)
  {
    *((void *)this + 1) = v3 + 1;
  }

  else
  {
    unsigned int v3 = (unint64_t *)v5;
    BOOL result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, v5, 8);
    if (!result) {
      return result;
    }
  }

  *a2 = *v3;
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Slow( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v4);
  if ((_DWORD)result) {
    *a2 = v4;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  int v2 = (_BYTE *)*((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = (_DWORD)v2 + 1;
  unsigned int v5 = *v2 & 0x7F;
  if ((*v2 & 0x80) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0LL;
LABEL_25:
    *((void *)this + 1) = &v2[v4 - (int)v2];
    *a2 = v5 | ((unint64_t)v6 << 28) | (v7 << 56);
    return 1LL;
  }

  int v9 = (char)v2[1];
  unsigned int v5 = *v2 & 0x7F | ((v9 & 0x7F) << 7);
  if ((v9 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 2;
    goto LABEL_25;
  }

  int v10 = (char)v2[2];
  unsigned int v5 = v5 & 0xFFE03FFF | ((v10 & 0x7F) << 14);
  if ((v10 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 3;
    goto LABEL_25;
  }

  int v11 = (char)v2[3];
  unsigned int v5 = v5 & 0xF01FFFFF | ((v11 & 0x7F) << 21);
  if ((v11 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 4;
    goto LABEL_25;
  }

  unsigned int v6 = v2[4] & 0x7F;
  if ((v2[4] & 0x80) == 0)
  {
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 5;
    goto LABEL_25;
  }

  int v12 = (char)v2[5];
  unsigned int v6 = v2[4] & 0x7F | ((v12 & 0x7F) << 7);
  if ((v12 & 0x80000000) == 0)
  {
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 6;
    goto LABEL_25;
  }

  int v13 = (char)v2[6];
  unsigned int v6 = v6 & 0xFFE03FFF | ((v13 & 0x7F) << 14);
  if ((v13 & 0x80000000) == 0)
  {
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 7;
    goto LABEL_25;
  }

  int v14 = (char)v2[7];
  unsigned int v6 = v6 & 0xF01FFFFF | ((v14 & 0x7F) << 21);
  if ((v14 & 0x80000000) == 0)
  {
    uint64_t v7 = 0LL;
    int v4 = (_DWORD)v2 + 8;
    goto LABEL_25;
  }

  uint64_t v7 = v2[8] & 0x7F;
  if ((v2[8] & 0x80) == 0)
  {
    int v4 = (_DWORD)v2 + 9;
    goto LABEL_25;
  }

  int v15 = (char)v2[9];
  if ((v15 & 0x80000000) == 0)
  {
    int v4 = (_DWORD)v2 + 10;
    uint64_t v7 = v2[8] & 0x7F | ((v15 & 0x7F) << 7);
    goto LABEL_25;
  }

  return 0LL;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  int v4 = (_BYTE *)*((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  if ((int)v3 - (int)v4 <= 9 && (v3 <= (unint64_t)v4 || *(char *)(v3 - 1) < 0))
  {
    uint64_t v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v14);
    if ((_DWORD)v8) {
      *a2 = v14;
    }
  }

  else
  {
    uint64_t v5 = (uint64_t)(v4 + 1);
    unsigned int v6 = *v4 & 0x7F;
    if ((*v4 & 0x80) != 0)
    {
      int v7 = (char)v4[1];
      unsigned int v6 = *v4 & 0x7F | ((v7 & 0x7F) << 7);
      if (v7 < 0)
      {
        int v9 = (char)v4[2];
        unsigned int v6 = v6 & 0xFFE03FFF | ((v9 & 0x7F) << 14);
        if (v9 < 0)
        {
          int v10 = (char)v4[3];
          unsigned int v6 = v6 & 0xF01FFFFF | ((v10 & 0x7F) << 21);
          if (v10 < 0)
          {
            int v11 = (char)v4[4];
            v6 |= v11 << 28;
            if (v11 < 0)
            {
              uint64_t v12 = 0LL;
              while ((char)v4[v12 + 5] < 0)
              {
                uint64_t v8 = 0LL;
                if ((_DWORD)++v12 == 5) {
                  return v8;
                }
              }

              uint64_t v5 = (uint64_t)&v4[v12 + 6];
            }

            else
            {
              uint64_t v5 = (uint64_t)(v4 + 5);
            }
          }

          else
          {
            uint64_t v5 = (uint64_t)(v4 + 4);
          }
        }

        else
        {
          uint64_t v5 = (uint64_t)(v4 + 3);
        }
      }

      else
      {
        uint64_t v5 = (uint64_t)(v4 + 2);
      }
    }

    *a2 = v6;
    *((void *)this + 1) = v5;
    return 1LL;
  }

  return v8;
}

unint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow( wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2 = (char *)*((void *)this + 1);
  unint64_t v3 = (unsigned __int8 *)*((void *)this + 2);
  if (v2 != (char *)v3)
  {
LABEL_4:
    unint64_t v7 = 0LL;
    if (v2 >= (char *)v3 || *v2 < 0)
    {
      unint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v7);
      if ((_DWORD)result) {
        return v7;
      }
    }

    else
    {
      unint64_t result = *v2;
      *((void *)this + 1) = v2 + 1;
    }

    return result;
  }

  if (wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this))
  {
    int v2 = (char *)*((void *)this + 1);
    unint64_t v3 = (unsigned __int8 *)*((void *)this + 2);
    goto LABEL_4;
  }

  int v5 = *((_DWORD *)this + 12);
  unint64_t result = 0LL;
  BOOL v6 = *((_DWORD *)this + 6) - *((_DWORD *)this + 11) < v5 || *((_DWORD *)this + 10) == v5;
  *((_BYTE *)this + 36) = v6;
  return result;
}

unint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback( wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2 = (_BYTE *)*((void *)this + 1);
  uint64_t v1 = *((void *)this + 2);
  int v3 = v1 - (_DWORD)v2;
  if (v3 >= 1)
  {
    if ((*(char *)(v1 - 1) & 0x80000000) == 0)
    {
LABEL_4:
      uint64_t v4 = (uint64_t)(v2 + 1);
      uint64_t v5 = *v2 & 0x7F;
      if ((*v2 & 0x80) != 0)
      {
        int v6 = (char)v2[1];
        uint64_t v5 = *v2 & 0x7F | ((v6 & 0x7F) << 7);
        if (v6 < 0)
        {
          int v8 = (char)v2[2];
          uint64_t v5 = v5 & 0xFFE03FFF | ((v8 & 0x7F) << 14);
          if (v8 < 0)
          {
            int v12 = (char)v2[3];
            uint64_t v5 = v5 & 0xF01FFFFF | ((v12 & 0x7F) << 21);
            if (v12 < 0)
            {
              int v13 = (char)v2[4];
              uint64_t v5 = v5 | (v13 << 28);
              if (v13 < 0)
              {
                uint64_t v14 = 0LL;
                while ((char)v2[v14 + 5] < 0)
                {
                  uint64_t v11 = 0LL;
                  if ((_DWORD)++v14 == 5) {
                    return v11;
                  }
                }

                uint64_t v4 = (uint64_t)&v2[v14 + 6];
              }

              else
              {
                uint64_t v4 = (uint64_t)(v2 + 5);
              }
            }

            else
            {
              uint64_t v4 = (uint64_t)(v2 + 4);
            }
          }

          else
          {
            uint64_t v4 = (uint64_t)(v2 + 3);
          }
        }

        else
        {
          uint64_t v4 = (uint64_t)(v2 + 2);
        }
      }

      *((void *)this + 1) = v4;
      return v5;
    }

    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }

  if (v3) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  int v9 = *((_DWORD *)this + 11);
  int v10 = *((_DWORD *)this + 6);
  if (v9 <= 0 && v10 != *((_DWORD *)this + 10)) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  if (v10 - v9 >= *((_DWORD *)this + 12)) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  uint64_t v11 = 0LL;
  *((_BYTE *)this + 36) = 1;
  return v11;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Slow( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  uint64_t v4 = 0LL;
  unint64_t v5 = 0LL;
  while (v4 != 10)
  {
    while (1)
    {
      int v6 = (char *)*((void *)this + 1);
      if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0) {
        return 0LL;
      }
    }

    char v7 = *v6;
    v5 |= (unint64_t)(*v6 & 0x7F) << (7 * v4);
    *((void *)this + 1) = v6 + 1;
    ++v4;
    if ((v7 & 0x80) == 0)
    {
      *a2 = v5;
      return 1LL;
    }
  }

  return 0LL;
}

wireless_diagnostics::google::protobuf::io::CodedOutputStream *wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *(void *)this = a2;
  *((_BYTE *)this + 24) = 0;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
  *((_BYTE *)this + 24) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t *, char *))(**(void **)this + 16LL))( *(void *)this,  &v4,  (char *)this + 16);
  if ((_DWORD)result)
  {
    uint64_t v3 = v4;
    *((_DWORD *)this + 5) += *((_DWORD *)this + 4);
  }

  else
  {
    uint64_t v3 = 0LL;
    *((_DWORD *)this + 4) = 0;
    *((_BYTE *)this + 24) = 1;
  }

  *((void *)this + 1) = v3;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream( uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = a2;
  *(_BYTE *)(a1 + 24) = 0;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)a1);
  *(_BYTE *)(a1 + 24) = 0;
  return a1;
}

void wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::Skip( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, int a2)
{
  if (a2 < 0) {
    return 0LL;
  }
  while (1)
  {
    int v3 = *((_DWORD *)this + 4);
    int v4 = a2 - v3;
    if (a2 <= v3) {
      break;
    }
    char v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    a2 = v4;
    if ((v5 & 1) == 0) {
      return 0LL;
    }
  }

  *((void *)this + 1) += a2;
  *((_DWORD *)this + 4) = v3 - a2;
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::GetDirectBufferPointer( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, void **a2, int *a3)
{
  int v6 = *((_DWORD *)this + 4);
  if (!v6)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    if (!(_DWORD)result) {
      return result;
    }
    int v6 = *((_DWORD *)this + 4);
  }

  *a2 = (void *)*((void *)this + 1);
  *a3 = v6;
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, char *__src, int a3)
{
  while (1)
  {
    size_t v6 = *((int *)this + 4);
    char v7 = (void *)*((void *)this + 1);
    memcpy(v7, __src, v6);
    uint64_t v8 = *((int *)this + 4);
    a3 -= v8;
    __src += v8;
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    if ((result & 1) == 0) {
      return result;
    }
  }

  uint64_t result = (uint64_t)memcpy(v7, __src, a3);
  *((void *)this + 1) += a3;
  *((_DWORD *)this + 4) -= a3;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, void *__dst, unsigned __int8 *a4)
{
  int v5 = (int)a2;
  memcpy(__dst, this, (int)a2);
  return (uint64_t)__dst + v5;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32( uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 16) < 4u)
  {
    int __src = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw( (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this,  (char *)&__src,  4);
  }

  else
  {
    **(_DWORD **)(this + 8) = a2;
    *(void *)(this + 8) += 4LL;
    *(_DWORD *)(this + 16) -= 4;
  }

  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64( uint64_t this, uint64_t a2)
{
  v2[1] = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)(this + 16) < 8u)
  {
    v2[0] = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw( (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this,  (char *)v2,  8);
  }

  else
  {
    **(void **)(this + 8) = a2;
    *(void *)(this + 8) += 8LL;
    *(_DWORD *)(this + 16) -= 8;
  }

  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32( uint64_t this, unsigned int a2)
{
  if (*(int *)(this + 16) < 5)
  {
    if (a2 < 0x80)
    {
      LODWORD(v4) = 0;
    }

    else
    {
      uint64_t v4 = 0LL;
      do
      {
        __src[v4++] = a2 | 0x80;
        unsigned int v5 = a2 >> 14;
        a2 >>= 7;
      }

      while (v5);
    }

    __src[v4] = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw( (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this,  __src,  (int)v4 + 1);
  }

  else
  {
    int v2 = *(_BYTE **)(this + 8);
    *int v2 = a2 | 0x80;
    if (a2 < 0x80)
    {
      *int v2 = a2 & 0x7F;
      int v3 = (_DWORD)v2 + 1;
    }

    else
    {
      v2[1] = (a2 >> 7) | 0x80;
      if (a2 < 0x4000)
      {
        v2[1] = (a2 >> 7) & 0x7F;
        int v3 = (_DWORD)v2 + 2;
      }

      else
      {
        void v2[2] = (a2 >> 14) | 0x80;
        if (a2 < 0x200000)
        {
          void v2[2] = (a2 >> 14) & 0x7F;
          int v3 = (_DWORD)v2 + 3;
        }

        else
        {
          v2[3] = (a2 >> 21) | 0x80;
          if (a2 >> 28)
          {
            v2[4] = a2 >> 28;
            int v3 = (_DWORD)v2 + 5;
          }

          else
          {
            int v3 = (_DWORD)v2 + 4;
            v2[3] = (a2 >> 21) & 0x7F;
          }
        }
      }
    }

    int v6 = v3 - (_DWORD)v2;
    *(void *)(this + 8) += v6;
    *(_DWORD *)(this + 16) -= v6;
  }

  return this;
}

_BYTE *wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, _BYTE *a2, unsigned __int8 *a3)
{
  *a2 = this | 0x80;
  if (this < 0x80)
  {
    *a2 = this & 0x7F;
    return a2 + 1;
  }

  else
  {
    a2[1] = (this >> 7) | 0x80;
    if (this < 0x4000)
    {
      a2[1] = (this >> 7) & 0x7F;
      return a2 + 2;
    }

    else
    {
      a2[2] = (this >> 14) | 0x80;
      if (this < 0x200000)
      {
        a2[2] = (this >> 14) & 0x7F;
        return a2 + 3;
      }

      else
      {
        a2[3] = (this >> 21) | 0x80;
        if (this >> 28)
        {
          a2[4] = this >> 28;
          return a2 + 5;
        }

        else
        {
          int v3 = a2 + 4;
          a2[3] = (this >> 21) & 0x7F;
        }
      }
    }
  }

  return v3;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64( uint64_t this, unint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(int *)(this + 16) >= 10)
  {
    int v2 = *(_BYTE **)(this + 8);
    unint64_t v3 = a2 >> 28;
    if (HIBYTE(a2))
    {
      if (HIBYTE(a2) >= 0x80)
      {
        v2[9] = -127;
        unsigned int v4 = 10;
      }

      else
      {
        unsigned int v4 = 9;
      }

      v2[8] = HIBYTE(a2) | 0x80;
    }

    else
    {
      if (!(_DWORD)v3)
      {
        if (!(a2 >> 14))
        {
          if (a2 < 0x80)
          {
            unsigned int v4 = 1;
            goto LABEL_24;
          }

          unsigned int v4 = 2;
LABEL_23:
          v2[1] = (a2 >> 7) | 0x80;
LABEL_24:
          *int v2 = a2 | 0x80;
          v2[v4 - 1] &= ~0x80u;
          *(void *)(this + 8) += v4;
          *(_DWORD *)(this + 16) -= v4;
          return this;
        }

        if (a2 < 0x200000)
        {
          unsigned int v4 = 3;
          goto LABEL_22;
        }

        unsigned int v4 = 4;
LABEL_21:
        v2[3] = (a2 >> 21) | 0x80;
LABEL_22:
        void v2[2] = (a2 >> 14) | 0x80;
        goto LABEL_23;
      }

      if (!(v3 >> 14))
      {
        if (v3 < 0x80)
        {
          unsigned int v4 = 5;
LABEL_20:
          v2[4] = v3 | 0x80;
          goto LABEL_21;
        }

        unsigned int v4 = 6;
LABEL_19:
        v2[5] = (a2 >> 35) | 0x80;
        goto LABEL_20;
      }

      if (v3 < 0x200000)
      {
        unsigned int v4 = 7;
        goto LABEL_18;
      }

      unsigned int v4 = 8;
    }

    v2[7] = (a2 >> 49) | 0x80;
LABEL_18:
    v2[6] = (a2 >> 42) | 0x80;
    goto LABEL_19;
  }

  if (a2 < 0x80)
  {
    LODWORD(v5) = 0;
  }

  else
  {
    uint64_t v5 = 0LL;
    do
    {
      __src[v5++] = a2 | 0x80;
      unint64_t v6 = a2 >> 14;
      a2 >>= 7;
    }

    while (v6);
  }

  __src[v5] = a2;
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw( (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this,  __src,  (int)v5 + 1);
}

_BYTE *wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray( unint64_t this, _BYTE *a2, unsigned __int8 *a3)
{
  unint64_t v3 = this >> 28;
  if (HIBYTE(this))
  {
    if (HIBYTE(this) >= 0x80)
    {
      a2[9] = -127;
      unsigned int v4 = 10;
    }

    else
    {
      unsigned int v4 = 9;
    }

    a2[8] = HIBYTE(this) | 0x80;
    goto LABEL_10;
  }

  if ((_DWORD)v3)
  {
    if (!(v3 >> 14))
    {
      if (v3 < 0x80)
      {
        unsigned int v4 = 5;
LABEL_13:
        a2[4] = v3 | 0x80;
        goto LABEL_14;
      }

      unsigned int v4 = 6;
LABEL_12:
      a2[5] = (this >> 35) | 0x80;
      goto LABEL_13;
    }

    if (v3 < 0x200000)
    {
      unsigned int v4 = 7;
      goto LABEL_11;
    }

    unsigned int v4 = 8;
LABEL_10:
    a2[7] = (this >> 49) | 0x80;
LABEL_11:
    a2[6] = (this >> 42) | 0x80;
    goto LABEL_12;
  }

  if (this >> 14)
  {
    if (this < 0x200000)
    {
      unsigned int v4 = 3;
      goto LABEL_15;
    }

    unsigned int v4 = 4;
LABEL_14:
    a2[3] = (this >> 21) | 0x80;
LABEL_15:
    a2[2] = (this >> 14) | 0x80;
    goto LABEL_16;
  }

  if (this < 0x80)
  {
    unsigned int v4 = 1;
    goto LABEL_17;
  }

  unsigned int v4 = 2;
LABEL_16:
  a2[1] = (this >> 7) | 0x80;
LABEL_17:
  *a2 = this | 0x80;
  a2[v4 - 1] &= ~0x80u;
  return &a2[v4];
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback( wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  else {
    int v1 = 4;
  }
  else {
    int v2 = 3;
  }
  else {
    unsigned int v3 = 2;
  }
  else {
    return 1LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(unint64_t this)
{
  if ((this & 0x8000000000000000LL) == 0LL) {
    int v1 = 9;
  }
  else {
    int v1 = 10;
  }
  if (HIBYTE(this)) {
    int v2 = v1;
  }
  else {
    int v2 = 8;
  }
  if (this >> 49) {
    int v3 = v2;
  }
  else {
    int v3 = 7;
  }
  if (this >> 42) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 6;
  }
  if (this >> 28) {
    int v5 = 5;
  }
  else {
    int v5 = 4;
  }
  if (this >= 0x200000) {
    int v6 = v5;
  }
  else {
    int v6 = 3;
  }
  if (this >= 0x4000) {
    int v7 = v6;
  }
  else {
    int v7 = 2;
  }
  if (this >= 0x80) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  if (this >> 35) {
    return v4;
  }
  else {
    return v8;
  }
}

wireless_diagnostics::google::protobuf::io::FileInputStream *wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream( wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  *((void *)this + 1) = off_18A11A348;
  *(void *)this = off_18A11A308;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_BYTE *)this + 28) = 0;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor( (uint64_t)this + 32,  (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8),  a3);
  return this;
}

void sub_187C2D1F0(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::CopyingFileInputStream( uint64_t this, int a2)
{
  *(void *)this = off_18A11A348;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 20) = 0;
  return this;
}

{
  *(void *)this = off_18A11A348;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 20) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream( wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  *(void *)this = off_18A11A308;
  int v2 = (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8);
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32));
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(this);
  operator delete(v1);
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::Close( wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8));
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close( wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v7,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  124);
    int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v6,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2,  v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }

  *((_BYTE *)this + 13) = 1;
  if (v4) {
    *((_DWORD *)this + 4) = *__error();
  }
  return v4 == 0;
}

void sub_187C2D328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::Next( wireless_diagnostics::google::protobuf::io::FileInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next( (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32),  a2,  a3);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::BackUp( wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2)
{
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::Skip( wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip( (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32),  a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::ByteCount( wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32));
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream( wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  *(void *)this = off_18A11A348;
  if (*((_BYTE *)this + 12)
    && !wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(this))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v7,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  118);
    int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "close() failed: ");
    int v3 = strerror(*((_DWORD *)this + 4));
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, v3);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v6,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }

  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::anonymous namespace'::close_no_eintr( wireless_diagnostics::google::protobuf::io::_anonymous_namespace_ *this)
{
  int v1 = (int)this;
  do
    uint64_t v2 = close(v1);
  while ((v2 & 0x80000000) != 0 && *__error() == 4);
  return v2;
}

ssize_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Read( wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this, void *a2, int a3)
{
  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v11,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  139);
    char v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v10,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }

  while (1)
  {
    ssize_t v8 = read(*((_DWORD *)this + 2), a2, a3);
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      *((_DWORD *)this + 4) = *__error();
      return v8;
    }
  }

  return v8;
}

void sub_187C2D52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Skip( wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this, uint64_t a2)
{
  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v8,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  155);
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v7,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }

  if (*((_BYTE *)this + 20) || lseek(*((_DWORD *)this + 2), (int)a2, 1) == -1)
  {
    *((_BYTE *)this + 20) = 1;
    return wireless_diagnostics::google::protobuf::io::CopyingInputStream::Skip(this);
  }

  return a2;
}

void sub_187C2D5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

wireless_diagnostics::google::protobuf::io::FileOutputStream *wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream( wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2, int a3)
{
  *(void *)this = off_18A11A378;
  *((void *)this + 1) = off_18A11A3B0;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor( (uint64_t)this + 32,  (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8),  a3);
  return this;
}

void sub_187C2D664(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::CopyingFileOutputStream( uint64_t this, int a2)
{
  *(void *)this = off_18A11A3B0;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = off_18A11A3B0;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream( wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  *(void *)this = off_18A11A378;
  uint64_t v2 = (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v2);
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8));
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Close( wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  unsigned int v2 = wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8)) & v2;
}

BOOL wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close( wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v7,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  222);
    unsigned int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v6,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2,  v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }

  *((_BYTE *)this + 13) = 1;
  if (v4) {
    *((_DWORD *)this + 4) = *__error();
  }
  return v4 == 0;
}

void sub_187C2D7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Flush( wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Next( wireless_diagnostics::google::protobuf::io::FileOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next( (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32),  a2,  a3);
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::BackUp( wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::ByteCount( wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream( wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  *(void *)this = off_18A11A3B0;
  if (*((_BYTE *)this + 12)
    && !wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(this))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v7,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  216);
    unsigned int v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "close() failed: ");
    int v3 = strerror(*((_DWORD *)this + 4));
    int v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, v3);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v6,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4,  v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }

  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(this);
  operator delete(v1);
}

BOOL wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Write( wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this, char *a2, int a3)
{
  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v15,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  238);
    char v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v14,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  }

  if (a3 < 1) {
    return 1LL;
  }
  int v8 = 0;
  do
  {
    while (1)
    {
      int v9 = write(*((_DWORD *)this + 2), &a2[v8], a3 - v8);
      int v10 = v9;
      if (v9 < 0) {
        break;
      }
      BOOL result = v9 != 0;
      v8 += v10;
      if (v10) {
        BOOL v11 = v8 < a3;
      }
      else {
        BOOL v11 = 0;
      }
      if (!v11) {
        return result;
      }
    }
  }

  while (*__error() == 4);
  int v12 = __error();
  BOOL result = 0LL;
  *((_DWORD *)this + 4) = *v12;
  return result;
}

void sub_187C2D9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void *wireless_diagnostics::google::protobuf::io::IstreamInputStream::IstreamInputStream( void *a1, uint64_t a2, int a3)
{
  *a1 = off_18A11A3D8;
  a1[1] = off_18A11A418;
  a1[2] = a2;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor( (uint64_t)(a1 + 3),  (wireless_diagnostics::google::protobuf::io::CopyingInputStream *)(a1 + 1),  a3);
  return a1;
}

void sub_187C2DA40(_Unwind_Exception *a1)
{
}

void *wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::CopyingIstreamInputStream( void *result, uint64_t a2)
{
  *BOOL result = off_18A11A418;
  result[1] = a2;
  return result;
}

{
  *BOOL result = off_18A11A418;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::~IstreamInputStream( wireless_diagnostics::google::protobuf::io::IstreamInputStream *this)
{
  *(void *)this = off_18A11A3D8;
  unsigned int v2 = (wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 8);
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24));
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::IstreamInputStream::~IstreamInputStream(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::Next( wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next( (wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24),  a2,  a3);
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::BackUp( wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, int a2)
{
}

BOOL wireless_diagnostics::google::protobuf::io::IstreamInputStream::Skip( wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip( (wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24),  a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::ByteCount( wireless_diagnostics::google::protobuf::io::IstreamInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::~CopyingIstreamInputStream( wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::Read( wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this, void *a2)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t result = *(unsigned int *)(v3 + 8);
  if (!(_DWORD)result)
  {
    int v5 = *(_DWORD *)(v3 + *(void *)(*(void *)v3 - 24LL) + 32);
    int v6 = v5 & 5;
    int v7 = v5 & 2;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8) {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void *wireless_diagnostics::google::protobuf::io::OstreamOutputStream::OstreamOutputStream( void *a1, uint64_t a2, int a3)
{
  *a1 = off_18A11A448;
  a1[1] = off_18A11A480;
  a1[2] = a2;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor( (uint64_t)(a1 + 3),  (wireless_diagnostics::google::protobuf::io::CopyingOutputStream *)(a1 + 1),  a3);
  return a1;
}

void sub_187C2DBC8(_Unwind_Exception *a1)
{
}

void *wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::CopyingOstreamOutputStream( void *result, uint64_t a2)
{
  *uint64_t result = off_18A11A480;
  result[1] = a2;
  return result;
}

{
  *uint64_t result = off_18A11A480;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::~OstreamOutputStream( wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this)
{
  *(void *)this = off_18A11A448;
  unsigned int v2 = (wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v2);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 8));
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::OstreamOutputStream::Next( wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next( (wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24),  a2,  a3);
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::BackUp( wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this, int a2)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::OstreamOutputStream::ByteCount( wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::~CopyingOstreamOutputStream( wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this)
{
}

BOOL wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::Write( wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this, const void *a2)
{
  return *(_DWORD *)(*((void *)this + 1) + *(void *)(**((void **)this + 1) - 24LL) + 32LL) == 0;
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::ConcatenatingInputStream( uint64_t this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *const *a2, int a3)
{
  *(void *)this = off_18A11A4A8;
  *(void *)(this + 8) = a2;
  *(_DWORD *)(this + 16) = a3;
  *(void *)(this + 24) = 0LL;
  return this;
}

{
  *(void *)this = off_18A11A4A8;
  *(void *)(this + 8) = a2;
  *(_DWORD *)(this + 16) = a3;
  *(void *)(this + 24) = 0LL;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::~ConcatenatingInputStream( wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::Next( wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this, const void **a2, int *a3)
{
  int v6 = (void *)*((void *)this + 1);
  do
  {
    uint64_t v7 = (*(uint64_t (**)(void, const void **, int *))(*(void *)*v6 + 16LL))(*v6, a2, a3);
    if ((v7 & 1) != 0) {
      break;
    }
    *((void *)this + 3) += (*(uint64_t (**)(void))(***((void ***)this + 1) + 40LL))(**((void **)this + 1));
    int v6 = (void *)(*((void *)this + 1) + 8LL);
    *((void *)this + 1) = v6;
    int v8 = *((_DWORD *)this + 4);
    BOOL v9 = __OFSUB__(v8--, 1);
    *((_DWORD *)this + 4) = v8;
  }

  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v7;
}

void wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::BackUp( wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  if (*((int *)this + 4) < 1)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v4,  2,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc",  378);
    int v1 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v4,  "Can't BackUp() after failed Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v3,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v1,  v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v4[0].__r_.__value_.__l.__data_);
  }

  else
  {
    (*(void (**)(void))(***((void ***)this + 1) + 24LL))(**((void **)this + 1));
  }

void sub_187C2DE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::Skip( wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this, uint64_t a2)
{
  int v4 = (void *)*((void *)this + 1);
  do
  {
    int v5 = (*(uint64_t (**)(void))(*(void *)*v4 + 40LL))(*v4);
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(***((void ***)this + 1) + 32LL))(**((void **)this + 1), a2);
    if ((v6 & 1) != 0) {
      break;
    }
    uint64_t v7 = (*(uint64_t (**)(void))(***((void ***)this + 1) + 40LL))(**((void **)this + 1));
    a2 = (v5 + a2 - v7);
    *((void *)this + 3) += v7;
    int v4 = (void *)(*((void *)this + 1) + 8LL);
    *((void *)this + 1) = v4;
    int v8 = *((_DWORD *)this + 4);
    BOOL v9 = __OFSUB__(v8--, 1);
    *((_DWORD *)this + 4) = v8;
  }

  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v6;
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::ByteCount( wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (*((_DWORD *)this + 4)) {
    v1 += (*(uint64_t (**)(void))(***((void ***)this + 1) + 40LL))(**((void **)this + 1));
  }
  return v1;
}

void *wireless_diagnostics::google::protobuf::io::LimitingInputStream::LimitingInputStream( void *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, uint64_t a3)
{
  *this = off_18A11A4E8;
  this[1] = a2;
  this[2] = a3;
  return this;
}

{
  *this = off_18A11A4E8;
  this[1] = a2;
  this[2] = a3;
  return this;
}

void wireless_diagnostics::google::protobuf::io::LimitingInputStream::~LimitingInputStream( wireless_diagnostics::google::protobuf::io::LimitingInputStream *this)
{
  *(void *)this = off_18A11A4E8;
  if ((*((void *)this + 2) & 0x8000000000000000LL) != 0) {
    (*(void (**)(void, void))(**((void **)this + 1) + 24LL))( *((void *)this + 1),  -*((_DWORD *)this + 4));
  }
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::io::LimitingInputStream::~LimitingInputStream(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::Next( wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, const void **a2, int *a3)
{
  uint64_t result = (*(uint64_t (**)(void, const void **))(**((void **)this + 1) + 16LL))( *((void *)this + 1),  a2);
  if ((_DWORD)result)
  {
    uint64_t v6 = *a3;
    uint64_t v7 = *((void *)this + 2) - v6;
    *((void *)this + 2) = v7;
    if (v7 < 0) {
      *a3 = v6 + v7;
    }
    return 1LL;
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::BackUp( wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, uint64_t a2)
{
  int v2 = a2;
  uint64_t v6 = (char *)this + 8;
  uint64_t v4 = *((void *)this + 1);
  uint64_t v5 = *((void *)v6 + 1);
  if (v5 < 0)
  {
    uint64_t v8 = (int)a2;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 24LL))(v4, (a2 - v5));
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 24LL))(v4, a2);
    uint64_t v8 = *((void *)this + 2) + v2;
  }

  *((void *)this + 2) = v8;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::io::LimitingInputStream::Skip( wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, uint64_t a2)
{
  uint64_t v4 = *((void *)this + 2);
  BOOL v5 = v4 >= (int)a2;
  if (v4 < (int)a2)
  {
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      (*(void (**)(void))(**((void **)this + 1) + 32LL))(*((void *)this + 1));
      uint64_t v6 = 0LL;
      goto LABEL_6;
    }

    return 0LL;
  }

  uint64_t v6 = *((void *)this + 2) - (int)a2;
LABEL_6:
  *((void *)this + 2) = v6;
  return v5;
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::ByteCount( wireless_diagnostics::google::protobuf::io::LimitingInputStream *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 1) + 40LL))(*((void *)this + 1));
  if (v2 < 0) {
    result += *((void *)this + 2);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t result = 0LL;
  switch(a2 & 7)
  {
    case 0:
      BOOL v5 = (char *)*((void *)this + 1);
      *((void *)this + 1) = v5 + 1;
      return 1LL;
    case 1:
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v14);
    case 2:
      uint64_t v6 = (char *)*((void *)this + 1);
      if ((unint64_t)v6 >= *((void *)this + 2) || *v6 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback( this,  (unsigned int *)&v14);
        if (!(_DWORD)result) {
          return result;
        }
        unsigned int v7 = v14;
      }

      else
      {
        unsigned int v7 = *v6;
        LODWORD(v14) = v7;
        *((void *)this + 1) = v6 + 1;
      }

      return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this, v7);
    case 3:
      int v8 = *((_DWORD *)this + 14);
      int v9 = *((_DWORD *)this + 15);
      *((_DWORD *)this + 14) = v8 + 1;
      if (v8 >= v9) {
        return 0LL;
      }
      int v10 = (int)a2;
      uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(this, a2, a3);
      if ((_DWORD)result)
      {
        int v11 = *((_DWORD *)this + 14);
        BOOL v12 = __OFSUB__(v11, 1);
        int v13 = v11 - 1;
        if (v13 < 0 == v12) {
          *((_DWORD *)this + 14) = v13;
        }
        return *((_DWORD *)this + 8) == (v10 & 0xFFFFFFF8 | 4);
      }

      return result;
    case 5:
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback( this,  (unsigned int *)&v14);
    default:
      return result;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  do
  {
    uint64_t v4 = (char *)*((void *)this + 1);
    if ((unint64_t)v4 >= *((void *)this + 2) || *v4 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
      *((_DWORD *)this + 8) = TagFallback;
    }

    else
    {
      unint64_t TagFallback = *v4;
      *((_DWORD *)this + 8) = TagFallback;
      *((void *)this + 1) = v4 + 1;
    }

    if ((_DWORD)TagFallback) {
      BOOL v6 = (TagFallback & 7) == 4;
    }
    else {
      BOOL v6 = 1;
    }
    uint64_t v7 = v6;
  }

  while (!v6
       && (wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField( this,  (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback,  a3) & 1) != 0);
  return v7;
}

uint64_t wireless_diagnostics::google::protobuf::internal::FieldSkipper::SkipField( wireless_diagnostics::google::protobuf::internal::FieldSkipper *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, a3, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::FieldSkipper::SkipMessage( wireless_diagnostics::google::protobuf::internal::FieldSkipper *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(a2, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int (*a2)(uint64_t), uint64_t a3)
{
  BOOL v6 = (char *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || *v6 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v14);
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v7 = v14;
  }

  else
  {
    unsigned int v7 = *v6;
    unsigned int v14 = v7;
    *((void *)this + 1) = v6 + 1;
  }

  int v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, v7);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) >= 1)
  {
    do
    {
      int v10 = (char *)*((void *)this + 1);
      if ((unint64_t)v10 >= *((void *)this + 2) || *v10 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v15);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v11 = v15;
      }

      else
      {
        uint64_t v11 = *v10;
        *((void *)this + 1) = v10 + 1;
      }

      if (a2(v11))
      {
        int v12 = *(_DWORD *)(a3 + 8);
        if (v12 == *(_DWORD *)(a3 + 12))
        {
          wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(a3, v12 + 1);
          int v12 = *(_DWORD *)(a3 + 8);
        }

        uint64_t v13 = *(void *)a3;
        *(_DWORD *)(a3 + 8) = v12 + 1;
        *(_DWORD *)(v13 + 4LL * v12) = v11;
      }
    }

    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) > 0);
  }

  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v9);
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, signed int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (a2 < 0) {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
  }
  else {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32( (uint64_t)a3,  (2 * a2) ^ (a2 >> 31));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64( (uint64_t)a3,  (2 * a2) ^ (a2 >> 63));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a2, SLODWORD(a3));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64( (uint64_t)a2,  *(uint64_t *)&a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, signed int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (a2 < 0) {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
  }
  else {
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString( int a1, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  int v5 = *(char *)(a2 + 23);
  if (v5 < 0 && *(void *)(a2 + 8) >> 31)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/wire_format_lite.cc",  285);
    BOOL v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: value.size() <= kint32max: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    LOBYTE(v5) = *(_BYTE *)(a2 + 23);
  }

  if ((v5 & 0x80u) == 0) {
    unsigned int v8 = v5;
  }
  else {
    unsigned int v8 = *(_DWORD *)(a2 + 8);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, v8);
  int v9 = *(char *)(a2 + 23);
  if (v9 >= 0) {
    int v10 = (char *)a2;
  }
  else {
    int v10 = *(char **)a2;
  }
  if (v9 >= 0) {
    int v11 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    int v11 = *(_DWORD *)(a2 + 8);
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, v10, v11);
}

void sub_187C2E878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes( int a1, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  int v5 = *(char *)(a2 + 23);
  if (v5 < 0 && *(void *)(a2 + 8) >> 31)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( (uint64_t)v14,  3,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/wire_format_lite.cc",  292);
    BOOL v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( v14,  "CHECK failed: value.size() <= kint32max: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( (uint64_t)&v13,  (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6,  v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    LOBYTE(v5) = *(_BYTE *)(a2 + 23);
  }

  if ((v5 & 0x80u) == 0) {
    unsigned int v8 = v5;
  }
  else {
    unsigned int v8 = *(_DWORD *)(a2 + 8);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, v8);
  int v9 = *(char *)(a2 + 23);
  if (v9 >= 0) {
    int v10 = (char *)a2;
  }
  else {
    int v10 = *(char **)a2;
  }
  if (v9 >= 0) {
    int v11 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    int v11 = *(_DWORD *)(a2 + 8);
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, v10, v11);
}

void sub_187C2E95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v6 = (int)this;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 3);
  (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80LL))( a2,  a3);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * v6) | 4u);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  unsigned int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96LL))(a2);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6);
  return (*(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80LL))( a2,  a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroupMaybeToArray( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v6 = 8 * (_DWORD)this;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 3);
  int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96LL))(a2);
  int v8 = *((_DWORD *)a3 + 4);
  BOOL v9 = __OFSUB__(v8, v7);
  int v10 = v8 - v7;
  if (v10 < 0 != v9 || (uint64_t v11 = *((void *)a3 + 1), *((void *)a3 + 1) = v11 + v7, *((_DWORD *)a3 + 4) = v10, !v11)) {
    (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80LL))( a2,  a3);
  }
  else {
    (*(void (**)(uint64_t))(*(void *)a2 + 88LL))(a2);
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6 | 4u);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray( wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  signed int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96LL))(a2);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6);
  int v7 = *((_DWORD *)a3 + 4);
  BOOL v8 = __OFSUB__(v7, v6);
  int v9 = v7 - v6;
  if (v9 < 0 != v8
    || (int v10 = (const wireless_diagnostics::google::protobuf::MessageLite *)*((void *)a3 + 1),
        *((void *)a3 + 1) = (char *)v10 + v6,
        *((_DWORD *)a3 + 4) = v9,
        !v10))
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 80LL);
    uint64_t v12 = a2;
    int v10 = a3;
  }

  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(void *)a2 + 88LL);
    uint64_t v12 = a2;
  }

  return v11(v12, v10);
}

BOOL wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, std::string *a2)
{
  int v5 = (char *)*((void *)this + 1);
  unint64_t v4 = *((void *)this + 2);
  if ((unint64_t)v5 < v4 && (*v5 & 0x80000000) == 0)
  {
    unsigned int v6 = *v5;
    unsigned int v10 = v6;
    int v7 = (unsigned __int8 *)(v5 + 1);
    *((void *)this + 1) = v7;
    goto LABEL_7;
  }

  int v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v10);
  BOOL result = 0LL;
  if (v8)
  {
    unsigned int v6 = v10;
    if ((v10 & 0x80000000) == 0)
    {
      int v7 = (unsigned __int8 *)*((void *)this + 1);
      unint64_t v4 = *((void *)this + 2);
LABEL_7:
      std::string::resize(a2, v6, 0);
      if (!v6) {
        return 1LL;
      }
      if ((char)a2->__r_.__value_.__s.__size_ < 0)
      {
        if (!a2->__r_.__value_.__l.__size_)
        {
LABEL_15:
          a2 = 0LL;
          goto LABEL_16;
        }

        a2 = (std::string *)a2->__r_.__value_.__r.__words[0];
      }

      else if (!a2->__r_.__value_.__s.__size_)
      {
        goto LABEL_15;
      }

LABEL_16:
      memcpy(a2, *((const void **)this + 1), v6);
      *((void *)this + 1) += v6;
      return 1LL;
    }
  }

  return result;
}

      memcpy(a2, *((const void **)this + 1), v6);
      *((void *)this + 1) += v6;
      return 1LL;
    }
  }

  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes( wireless_diagnostics::google::protobuf::io::CodedInputStream *this, std::string *a2)
{
  int v5 = (char *)*((void *)this + 1);
  unint64_t v4 = *((void *)this + 2);
  if ((unint64_t)v5 < v4 && (*v5 & 0x80000000) == 0)
  {
    unsigned int v6 = *v5;
    unsigned int v10 = v6;
    int v7 = (unsigned __int8 *)(v5 + 1);
    *((void *)this + 1) = v7;
    goto LABEL_7;
  }

  int v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v10);
  BOOL result = 0LL;
  if (v8)
  {
    unsigned int v6 = v10;
    if ((v10 & 0x80000000) == 0)
    {
      int v7 = (unsigned __int8 *)*((void *)this + 1);
      unint64_t v4 = *((void *)this + 2);
LABEL_7:
      std::string::resize(a2, v6, 0);
      if (!v6) {
        return 1LL;
      }
      if ((char)a2->__r_.__value_.__s.__size_ < 0)
      {
        if (!a2->__r_.__value_.__l.__size_)
        {
LABEL_15:
          a2 = 0LL;
          goto LABEL_16;
        }

        a2 = (std::string *)a2->__r_.__value_.__r.__words[0];
      }

      else if (!a2->__r_.__value_.__s.__size_)
      {
        goto LABEL_15;
      }

void wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve( wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  int v2 = *((_DWORD *)this + 4);
  if (v2 < a2)
  {
    unint64_t v4 = *(void **)this;
    int v5 = 2 * v2;
    if (v5 <= a2) {
      int v5 = a2;
    }
    if (v5 <= 4) {
      int v5 = 4;
    }
    *((_DWORD *)this + 4) = v5;
    unsigned int v6 = operator new[](8LL * v5);
    *(void *)this = v6;
    if (v4)
    {
      memcpy(v6, v4, 8LL * *((int *)this + 3));
      operator delete[](v4);
    }
  }

double wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap( wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this, wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *a2)
{
  if (this != a2)
  {
    uint64_t v2 = *(void *)this;
    int v3 = *((_DWORD *)this + 4);
    *(void *)this = *(void *)a2;
    double result = *((double *)a2 + 1);
    *(void *)a2 = v2;
    uint64_t v5 = *((void *)this + 1);
    *((double *)this + 1) = result;
    *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
    *((void *)a2 + 1) = v5;
    *((_DWORD *)a2 + 4) = v3;
  }

  return result;
}

void *wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New( wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  double result = operator new(0x18uLL);
  result[1] = 0LL;
  result[2] = 0LL;
  *double result = 0LL;
  return result;
}

void wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete(void **__p)
{
  if (__p)
  {
    operator delete(__p);
  }

void wireless_diagnostics::google::protobuf::internal::VerifyVersion( wireless_diagnostics::google::protobuf::internal *this, wireless_diagnostics::google::protobuf::internal *a2, const std::string::value_type *a3, const char *a4)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if ((int)a2 > 2005000)
  {
    int v25 = 3;
    int v26 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v27 = 62;
    memset(&v28, 0, sizeof(v28));
    std::string::append(&v28, "This program requires version ");
    wireless_diagnostics::google::protobuf::internal::VersionString(a2, &v22);
    if ((v24 & 0x80u) == 0) {
      int v7 = (const std::string::value_type *)&v22;
    }
    else {
      int v7 = (const std::string::value_type *)v22;
    }
    if ((v24 & 0x80u) == 0) {
      std::string::size_type v8 = v24;
    }
    else {
      std::string::size_type v8 = v23;
    }
    std::string::append(&v28, v7, v8);
    std::string::append(&v28, " of the Protocol Buffer runtime library, but the installed version is ");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 2, 5, 0);
    char v30 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    if ((v21 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v21 & 0x80u) == 0) {
      std::string::size_type v10 = v21;
    }
    else {
      std::string::size_type v10 = v20;
    }
    std::string::append(&v28, p_p, v10);
    std::string::append( &v28,  ".  Please update your library.  If you compiled the program yourself, make sure that your headers are from the sam e version of Protocol Buffers as your link-time library.  (Version verification failed in ");
    std::string::append(&v28, a3);
    std::string::append(&v28, ".)");
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish( (wireless_diagnostics::google::protobuf::internal::LogMessage *)&v25,  v11,  v12);
  }

  if ((int)this < 2005000)
  {
    int v25 = 3;
    int v26 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v27 = 73;
    memset(&v28, 0, sizeof(v28));
    std::string::append(&v28, "This program was compiled against version ");
    wireless_diagnostics::google::protobuf::internal::VersionString(this, &v22);
    if ((v24 & 0x80u) == 0) {
      char v13 = (const std::string::value_type *)&v22;
    }
    else {
      char v13 = (const std::string::value_type *)v22;
    }
    if ((v24 & 0x80u) == 0) {
      std::string::size_type v14 = v24;
    }
    else {
      std::string::size_type v14 = v23;
    }
    std::string::append(&v28, v13, v14);
    std::string::append( &v28,  " of the Protocol Buffer runtime library, which is not compatible with the installed version (");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 2, 5, 0);
    char v30 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    if ((v21 & 0x80u) == 0) {
      unsigned int v15 = (const std::string::value_type *)&__p;
    }
    else {
      unsigned int v15 = (const std::string::value_type *)__p;
    }
    if ((v21 & 0x80u) == 0) {
      std::string::size_type v16 = v21;
    }
    else {
      std::string::size_type v16 = v20;
    }
    std::string::append(&v28, v15, v16);
    std::string::append( &v28,  ").  Contact the program author for an update.  If you compiled the program yourself, make sure that your headers a re from the same version of Protocol Buffers as your link-time library.  (Version verification failed in ");
    std::string::append(&v28, a3);
    std::string::append(&v28, ".)");
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish( (wireless_diagnostics::google::protobuf::internal::LogMessage *)&v25,  v17,  v18);
  }

void sub_187C2F15C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, int a29, __int16 a30, char a31, char a32)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage( uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)double result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 32) = 0LL;
  *(void *)(result + 40) = 0LL;
  *(void *)(result + 24) = 0LL;
  return result;
}

{
  *(_DWORD *)double result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 32) = 0LL;
  *(void *)(result + 40) = 0LL;
  *(void *)(result + 24) = 0LL;
  return result;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( std::string *a1, const std::string::value_type *a2)
{
  return a1;
}

{
  std::string *v3;
  std::string::size_type v4;
  std::string::size_type v5;
  int v3 = a1 + 1;
  unint64_t v4 = *((void *)a2 + 1);
  if (a2[23] >= 0)
  {
    uint64_t v5 = *((unsigned __int8 *)a2 + 23);
  }

  else
  {
    a2 = *(const std::string::value_type **)a2;
    uint64_t v5 = v4;
  }

  std::string::append(v3, a2, v5);
  return a1;
}

void *wireless_diagnostics::google::protobuf::internal::VersionString@<X0>( wireless_diagnostics::google::protobuf::internal *this@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x80uLL, "%d.%d.%d", (int)this / 1000000, (int)this / 1000 % 1000, (int)this % 1000);
  char __str[127] = 0;
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=( uint64_t a1, wireless_diagnostics::google::protobuf::internal::LogMessage *a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(void **this)
{
}

{
}

uint64_t wireless_diagnostics::google::protobuf::internal::DefaultLogHandler( int a1, const char *a2, int a3, uint64_t a4)
{
  unint64_t v4 = (FILE **)MEMORY[0x1895F89D0];
  else {
    uint64_t v5 = *(const char **)a4;
  }
  fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[libprotobuf %s %s:%d] %s\n",  wireless_diagnostics::google::protobuf::internal::DefaultLogHandler(wireless_diagnostics::google::protobuf::LogLevel,char const*,int,std::string const&)::level_names[a1],  a2,  a3,  v5);
  return fflush(*v4);
}

void wireless_diagnostics::google::protobuf::internal::DeleteLogSilencerCount( wireless_diagnostics::google::protobuf::internal *this)
{
  if (wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_)
  {
    wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
    operator delete(v1);
  }

  wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_ = 0LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::InitLogSilencerCount( wireless_diagnostics::google::protobuf::internal *this)
{
  uint64_t v1 = operator new(8uLL);
  uint64_t v2 = (pthread_mutex_t *)operator new(0x40uLL);
  *uint64_t v1 = v2;
  pthread_mutex_init(v2, 0LL);
  wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_ = (uint64_t)v1;
  return wireless_diagnostics::google::protobuf::internal::OnShutdown( (wireless_diagnostics::google::protobuf::internal *)wireless_diagnostics::google::protobuf::internal::DeleteLogSilencerCount,  v3);
}

void sub_187C2F430(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::internal::Mutex *wireless_diagnostics::google::protobuf::internal::Mutex::Mutex( wireless_diagnostics::google::protobuf::internal::Mutex *this)
{
  uint64_t v2 = (pthread_mutex_t *)operator new(0x40uLL);
  *(void *)this = v2;
  pthread_mutex_init(v2, 0LL);
  return this;
}

{
  pthread_mutex_t *v2;
  uint64_t v2 = (pthread_mutex_t *)operator new(0x40uLL);
  *(void *)this = v2;
  pthread_mutex_init(v2, 0LL);
  return this;
}

void wireless_diagnostics::google::protobuf::internal::OnShutdown( wireless_diagnostics::google::protobuf::internal *this, void (*a2)(void), wireless_diagnostics::google::protobuf::Closure *a3)
{
  uint64_t v4 = wireless_diagnostics::google::protobuf::internal::shutdown_functions_init;
  __dmb(0xBu);
  if (v4 != 2)
  {
    v20[0] = (uint64_t)off_18A11A6F8;
    v20[1] = (uint64_t)wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions;
    char v21 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl( (uint64_t)&wireless_diagnostics::google::protobuf::internal::shutdown_functions_init,  v20,  a3);
  }

  uint64_t v5 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex);
  unsigned int v6 = (void **)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
  int v7 = *(void **)(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 8);
  unint64_t v8 = *(void *)(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 16);
  if ((unint64_t)v7 >= v8)
  {
    uint64_t v10 = ((uint64_t)v7 - *(void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions) >> 3;
    uint64_t v11 = v8 - *(void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
    uint64_t v12 = v11 >> 2;
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      std::string::size_type v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(void)>>( wireless_diagnostics::google::protobuf::internal::shutdown_functions + 16,  v13);
    }
    else {
      std::string::size_type v14 = 0LL;
    }
    unsigned int v15 = &v14[8 * v10];
    std::string::size_type v16 = &v14[8 * v13];
    *(void *)unsigned int v15 = this;
    int v9 = v15 + 8;
    int v18 = (char *)*v6;
    uint64_t v17 = (char *)v6[1];
    if (v17 != *v6)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }

      while (v17 != v18);
      uint64_t v17 = (char *)*v6;
    }

    *unsigned int v6 = v15;
    v6[1] = v9;
    std::string v6[2] = v16;
    if (v17) {
      operator delete(v17);
    }
  }

  else
  {
    *int v7 = this;
    int v9 = v7 + 1;
  }

  v6[1] = v9;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v5);
}

void sub_187C2F5B4(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce( wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  uint64_t v3 = wireless_diagnostics::google::protobuf::internal::log_silencer_count_init_;
  __dmb(0xBu);
  if (v3 != 2)
  {
    v5[0] = (uint64_t)off_18A11A6F8;
    v5[1] = (uint64_t)wireless_diagnostics::google::protobuf::internal::InitLogSilencerCount;
    char v6 = 0;
    return wireless_diagnostics::google::protobuf::GoogleOnceInitImpl( (uint64_t)&wireless_diagnostics::google::protobuf::internal::log_silencer_count_init_,  v5,  a3);
  }

  return result;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( std::string *a1, std::string::value_type a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  __s[0] = a2;
  __s[1] = 0;
  __s[127] = 0;
  std::string::append(a1 + 1, __s);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( std::string *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x80uLL, "%d", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

{
  char __str[128];
  uint64_t v5;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x80uLL, "%u", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( std::string *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x80uLL, "%ld", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

{
  char __str[128];
  uint64_t v5;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x80uLL, "%lu", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<( std::string *a1, double a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x80uLL, "%g", a2);
  char __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::Finish( wireless_diagnostics::google::protobuf::internal::LogMessage *this, uint64_t a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  if (*(_DWORD *)this == 3)
  {
    int v4 = 3;
  }

  else
  {
    wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this, a2, a3);
    uint64_t v5 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock((wireless_diagnostics::google::protobuf::internal::Mutex *)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
    int v6 = wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
    wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v5);
    if (v6 > 0) {
      goto LABEL_6;
    }
    int v4 = *(_DWORD *)this;
  }

  wireless_diagnostics::google::protobuf::internal::log_handler_( v4,  *((const char **)this + 1),  *((_DWORD *)this + 4),  (uint64_t)this + 24);
LABEL_6:
  if (*(_DWORD *)this == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    wireless_diagnostics::google::protobuf::FatalException::FatalException( exception,  *((void *)this + 1),  *((unsigned int *)this + 4),  (char *)this + 24);
  }

void sub_187C2FA04(_Unwind_Exception *a1)
{
}

uint64_t (*wireless_diagnostics::google::protobuf::SetLogHandler(uint64_t (*a1)()))()
{
  uint64_t v1 = wireless_diagnostics::google::protobuf::internal::log_handler_;
  if (a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = wireless_diagnostics::google::protobuf::internal::NullLogHandler;
  }
  wireless_diagnostics::google::protobuf::internal::log_handler_ = v2;
  else {
    return v1;
  }
}

wireless_diagnostics::google::protobuf::LogSilencer *wireless_diagnostics::google::protobuf::LogSilencer::LogSilencer( wireless_diagnostics::google::protobuf::LogSilencer *this, uint64_t a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  int v4 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
  ++wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v4);
  return this;
}

void wireless_diagnostics::google::protobuf::LogSilencer::~LogSilencer( wireless_diagnostics::google::protobuf::LogSilencer *this, uint64_t a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  uint64_t v3 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
  --wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v3);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex(pthread_mutex_t **this)
{
  if (*this) {
    operator delete(*this);
  }
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Lock(pthread_mutex_t **this)
{
  int v1 = pthread_mutex_lock(*this);
  if (v1)
  {
    int v2 = v1;
    int v6 = 3;
    int v7 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v8 = 305;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "pthread_mutex_lock: ");
    uint64_t v3 = strerror(v2);
    std::string::append(&__p, v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish( (wireless_diagnostics::google::protobuf::internal::LogMessage *)&v6,  v4,  v5);
  }

void sub_187C2FC18( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(pthread_mutex_t **this)
{
  int v1 = pthread_mutex_unlock(*this);
  if (v1)
  {
    int v2 = v1;
    int v4 = 3;
    uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    int v6 = 312;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "pthread_mutex_unlock: ");
    uint64_t v3 = strerror(v2);
    std::string::append(&__p, v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v4);
  }

void sub_187C2FCD0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::ghtonl(wireless_diagnostics::google::protobuf *this)
{
  return bswap32(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions( wireless_diagnostics::google::protobuf::internal *this)
{
  int v1 = operator new(0x18uLL);
  v1[1] = 0LL;
  v1[2] = 0LL;
  *int v1 = 0LL;
  wireless_diagnostics::google::protobuf::internal::shutdown_functions = (uint64_t)v1;
  int v2 = operator new(8uLL);
  uint64_t v3 = (pthread_mutex_t *)operator new(0x40uLL);
  *int v2 = v3;
  uint64_t result = pthread_mutex_init(v3, 0LL);
  wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex = (uint64_t)v2;
  return result;
}

void sub_187C2FD54(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::ShutdownProtobufLibrary( wireless_diagnostics::google::protobuf *this, uint64_t a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  uint64_t v3 = wireless_diagnostics::google::protobuf::internal::shutdown_functions_init;
  __dmb(0xBu);
  if (v3 != 2)
  {
    v8[0] = (uint64_t)off_18A11A6F8;
    v8[1] = (uint64_t)wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions;
    char v9 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl( (uint64_t)&wireless_diagnostics::google::protobuf::internal::shutdown_functions_init,  v8,  a3);
  }

  int v4 = (void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
  if (wireless_diagnostics::google::protobuf::internal::shutdown_functions)
  {
    uint64_t v5 = *(void (***)(void))(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 8);
    if (v5 != *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions)
    {
      unint64_t v6 = 0LL;
      uint64_t v5 = *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions;
      do
      {
        v5[v6++]();
        int v4 = (void *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
        uint64_t v5 = *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions;
      }

      while (v6 < (uint64_t)(v4[1] - *v4) >> 3);
    }

    if (v5)
    {
      v4[1] = v5;
      operator delete(v5);
    }

    operator delete(v4);
    wireless_diagnostics::google::protobuf::internal::shutdown_functions = 0LL;
    if (wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex)
    {
      wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex);
      operator delete(v7);
    }

    wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex = 0LL;
  }

void wireless_diagnostics::google::protobuf::FatalException::~FatalException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_18A11A698;
  if (SHIBYTE(this[5].__vftable) < 0) {
    operator delete(this[3].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v1;
  wireless_diagnostics::google::protobuf::FatalException::~FatalException(this);
  operator delete(v1);
}

uint64_t wireless_diagnostics::google::protobuf::FatalException::what( wireless_diagnostics::google::protobuf::FatalException *this)
{
  uint64_t result = (uint64_t)this + 24;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::FunctionClosure0::Run(uint64_t (**this)(void))
{
  int v2 = *((unsigned __int8 *)this + 16);
  uint64_t result = this[1]();
  if (this)
  {
    if (v2) {
      return (*((uint64_t (**)(uint64_t (**)(void)))*this + 1))(this);
    }
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::FatalException::FatalException( uint64_t a1, uint64_t a2, int a3, __int128 *a4)
{
  *(void *)a1 = off_18A11A698;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  uint64_t v5 = (std::string *)(a1 + 24);
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }

  else
  {
    __int128 v6 = *a4;
    v5->__r_.__value_.__l.__cap_ = *((void *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }

  return a1;
}

void sub_187C2FF48(_Unwind_Exception *a1)
{
}

void std::string::__init_copy_ctor_external( std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8LL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__l.__cap_ = v7 | 0x8000000000000000LL;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }

  else
  {
    this->__r_.__value_.__s.__size_ = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::vector<void (*)(void)>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(void)>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl( uint64_t this, uint64_t *a2, wireless_diagnostics::google::protobuf::Closure *a3)
{
  unint64_t v3 = *(void *)this;
  __dmb(0xBu);
  if (v3 != 2)
  {
    int v4 = (uint64_t *)this;
    do
    {
      while (!__ldaxr((unint64_t *)this))
      {
        if (!__stlxr(1uLL, (unint64_t *)this))
        {
          this = (*(uint64_t (**)(uint64_t *))(*a2 + 16))(a2);
          __dmb(0xBu);
          uint64_t *v4 = 2LL;
          return this;
        }
      }

      __clrex();
    }

    while (!*(void *)this);
    if (*(void *)this == 1LL)
    {
      do
      {
        this = sched_yield();
        uint64_t v6 = *v4;
        __dmb(0xBu);
      }

      while (v6 == 1);
    }
  }

  return this;
}

double wireless_diagnostics::google::protobuf::internal::Infinity( wireless_diagnostics::google::protobuf::internal *this)
{
  return INFINITY;
}

double wireless_diagnostics::google::protobuf::internal::NaN( wireless_diagnostics::google::protobuf::internal *this)
{
  return NAN;
}

uint64_t _GLOBAL__sub_I_generated_message_util_cc()
{
  wireless_diagnostics::google::protobuf::internal::kEmptyString = 0LL;
  unk_18C4D0150 = 0LL;
  qword_18C4D0158 = 0LL;
  return __cxa_atexit( MEMORY[0x189614350],  &wireless_diagnostics::google::protobuf::internal::kEmptyString,  &dword_187C21000);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142D0](this, __s);
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::istream::read()
{
  return MEMORY[0x189614388]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1896143C0]();
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

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_18A119E30(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A119E38(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1895F8878](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

int sched_yield(void)
{
  return MEMORY[0x1895FCE08]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}